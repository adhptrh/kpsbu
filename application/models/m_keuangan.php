<?php
class m_keuangan extends CI_model
{
	private $_table = "coa";
	public function GenerateJurnal($no_akun, $no_transaksi, $posisi_dr_cr, $nominal)
	{
		date_default_timezone_set("Asia/Bangkok");
		$jurnal = array(
			'id_jurnal' => $no_transaksi,
			'tgl_jurnal' => date('Y-m-d'),
			'no_coa' => $no_akun,
			'posisi_dr_cr' => $posisi_dr_cr,
			'nominal' => $nominal,
		);
		$this->db->insert('jurnal', $jurnal);
	}

	public function GenerateLaporanBPK($kode, $tanggal, $nominal, $nocoa, $poskas, $keterangan) 
	{
		$data = [
			'id_ref' => $kode, 
			'tanggal' => $tanggal, 
			'nominal' => $nominal, 
			'kd_coa' => $nocoa, 
			'posisi_dr_cr' => $poskas, 
			'keterangan' => $keterangan, 
		];
		$this->db->insert('buku_pembantu_kas', $data);
	}

	public function pengajuanJurnal($invoice, $nominal, $jenis)
	{
		$pengajuan = [
			'kode' => $invoice,
			'tanggal' => date('Y-m-d'),
			'nominal' => $nominal,
			'jenis' => $jenis,
		];
		$this->db->insert("pengajuan_jurnal", $pengajuan);
	}

	//pagination
	public function HitungJumlahBaris()
	{
		$query = $this->db->get('pembelian');
		return $query->num_rows();
	}

	//pagination jurnal cok
	public function hitungjumlah()
	{
		return $this->db->get('jurnal')->num_rows();
	}
	/*
	//ambildata untuk laporan keuangan_penjualan pnj
	public function GetDataLaporanPnj($start , $limit){
		$this->db->limit($limit, $start);
		return $this->db->get('transaksi_penjualan')->result_array();
	}
	*/
	public function GetDataAkun()
	{
		return $this->db->get('coa')->result_array();
	}

	public function GetSaldoAkun($no_akun)
	{
		$this->db->where('no_coa', $no_akun);
		return $this->db->get('coa')->row_array();
	}

	//public function GetDataJurnal($limit, $start)
	public function GetDataJurnal()
	{
		//$this->db->limit($limit, $start);
		if (isset($_POST['tgl_awal'], $_POST['tgl_akhir'])) {
			$this->db->where('tgl_jurnal >=', $_POST['tgl_awal']);
			$this->db->where('tgl_jurnal <=', $_POST['tgl_akhir']);
		}
		$this->db->select('a.no_coa, tgl_jurnal, nama_coa, a.posisi_dr_cr, nominal, id_jurnal, SUM(nominal) as sumnominal');
		$this->db->from('jurnal a');
		$this->db->join('coa b', 'b.no_coa = a.no_coa');
		$this->db->order_by('no');
		$this->db->group_by('no_coa,tgl_jurnal,posisi_dr_cr');
		$query = $this->db->get();
		return $query->result_array();
	}

	public function getdatajurnalall()
	{
		$this->db->select('a.no_coa, tgl_jurnal, nama_coa, a.posisi_dr_cr, nominal, id_jurnal');
		$this->db->from('jurnal a');
		$this->db->join('coa b', 'b.no_coa = a.no_coa');
		$this->db->order_by('no');
		$query = $this->db->get();
		return $query->result_array();
	}
	public function GetDataJurnalfilter($awal, $akhir)
	{
		//$this->db->limit($limit, $start);
		$this->db->where('tgl_jurnal >=', $awal);
		$this->db->where('tgl_jurnal <=', $akhir);
		$this->db->select('a.no_coa, tgl_jurnal, nama_coa, a.posisi_dr_cr, nominal, id_jurnal');
		$this->db->from('jurnal a');
		$this->db->join('coa b', 'b.no_coa = a.no_coa');
		$this->db->order_by('no');
		$query = $this->db->get();
		return $query->result_array();
	}

	// ----------------------------------------------------------CODING BARU--------------------//
	public function getAll()
	{
		$this->db->from($this->_table);
		$this->db->order_by("no_coa", "asc");
		$query = $this->db->get();
		return $query->result();
		// return $this->db->get($this->_table)->result();
	}

	public function get_nama_akun($no_coa)
	{
		$this->db->select('*');
		$this->db->from('coa');
		$this->db->where('no_coa', $no_coa);
		$query = $this->db->get();
		if ($query->num_rows() != 0) {
			return $query->row()->nama_coa;
		} else {
			return false;
		}
	}

	public function getDataBukuBesar2($m, $y, $akun)
	{
		// $this->db->order_by('tgl_jurnal', 'ASC');
		// return $this->db->from('jurnal')
		//     ->join('akun', 'akun.no_coa=jurnal.no_coa')
		//     ->where('month(tgl_jurnal)', $m)
		//     ->where('year(tgl_jurnal)', $y)
		//     ->like('akun.no_coa', $akun)
		//     ->get()
		//     ->result();
	}

	public function get_buku_besar($y, $m, $akun)
	{
		$this->db->select('a.id_jurnal,a.no_coa,a.tgl_jurnal,a.nominal,a.posisi_dr_cr,b.nama_coa')
			->from('jurnal as a')
			->join('coa as b', 'a.no_coa=b.no_coa')
			->where('month(a.tgl_jurnal)', $m)
			->where('year(a.tgl_jurnal)', $y)
			->where('a.no_coa', $akun)
			->order_by('a.id_jurnal', 'ASC');
		return $this->db->get()->result_array();
	}

	public function get_row_buku_besar($y, $m, $akun)
	{
		$this->db->select('*,a.id_jurnal,count(a.id_jurnal) as row_gl,date(a.tgl_jurnal) as tgl_jurnal')
			->from('jurnal as a')
			->where('month(a.tgl_jurnal)', $m)
			->where('year(a.tgl_jurnal)', $y)
			->where('a.no_coa', $akun)
			->group_by('a.id_jurnal')
			->group_by('date(a.tgl_jurnal)')
			->order_by('a.tgl_jurnal', 'ASC')
			->order_by('a.id_jurnal', 'ASC');
		return $this->db->get()->result_array();
	}

	public function getPosisiSaldoNormal($akun)
	{
		//lihat posisi saldo awal normal
		if ($akun != null) {

			$sql = "SELECT saldo_normal
					FROM coa 
					WHERE no_coa = " . $this->db->escape($akun);

			$query = $this->db->query($sql);
			$hasil = $query->result_array();
			foreach ($hasil as $cacah) :
				$posisi_saldo_normal = $cacah['saldo_normal'];
			endforeach;
			// if ($posisi_saldo_normal != null) {
			// 	return $posisi_saldo_normal;
			// } else {
			// 	return false;
			// }
			return $posisi_saldo_normal;
		}
	}

	public function getPosisiSaldoAwal($akun)
	{
		$this->db->select('saldo_awal as saldo_awal');
		$this->db->from('coa');
		$this->db->where('no_coa', $akun);
		$query = $this->db->get();
		if ($query->num_rows() != 0) {
			return $query->row()->saldo_awal;
		} else {
			return false;
		}
	}

	//get data saldo awal buku besar
	public function getSaldoAwalBukuBesar($y, $m, $akun)
	{
		$posisi_saldo_awal = $this->getPosisiSaldoAwal($akun);
		$posisi_saldo_normal = $this->getPosisiSaldoNormal($akun);
		// $sa = $this->getSaldoAwalAkun($akun);
		$m = str_pad($m, 2, "0", STR_PAD_LEFT);
		$waktu = $y . "-" . $m;
		$sql = "
						SELECT tbl1.posisi_dr_cr,ifnull(tbl2.total,0) as nominal FROM
						(
							SELECT 'k' posisi_dr_cr
							UNION
							SELECT 'd' posisi_dr_cr
						) tbl1
						LEFT OUTER JOIN
						(
							Select a.posisi_dr_cr,sum(a.nominal) as total
							FROM jurnal a
							JOIN coa b ON (a.no_coa=b.no_coa)
							WHERE a.no_coa = " . $akun . " 
							AND date_format(a.tgl_jurnal,'%Y-%m') < '" . $waktu . "'
							GROUP BY  a.posisi_dr_cr
							ORDER BY id_jurnal
						) tbl2
						ON (tbl1.posisi_dr_cr = tbl2.posisi_dr_cr)
			
			";
		$query = $this->db->query($sql);
		$hasil = $query->result_array();
		$saldo_debet = 0;
		$saldo_kredit = 0;
		foreach ($hasil as $cacah) :
			if (strcmp($cacah['posisi_dr_cr'], 'd') == 0) {
				$saldo_debet = $saldo_debet + $cacah['nominal'];
			} else {
				$saldo_kredit = $saldo_kredit + $cacah['nominal'];
			}
		endforeach;

		if (strcmp($posisi_saldo_normal, 'd') == 0) {
			$saldo = $saldo_debet - $saldo_kredit;
		} else {
			$saldo =  $saldo_kredit - $saldo_debet;
		}
		$saldo_total = $saldo + $posisi_saldo_awal;
		// if ($saldo != null) {
		// 	return $saldo;
		// } else {
		// 	return false;
		// }
		return $saldo_total;
	}


	public function GetDataBukuBesar($no_akun, $bulan, $tahun)
	{
		//public function GetDataBukuBesar(){
		// $this->db->limit($limit, $start);
		$this->db->where('a.no_coa', $no_akun);
		$this->db->select('a.no_coa, tgl_jurnal, nama_coa,a.posisi_dr_cr, nominal');
		$this->db->from('jurnal a');
		$this->db->join('coa b', 'b.no_coa = a.no_coa');
		$this->db->where('a.no_coa', $no_akun);
		$this->db->where('MONTH(tgl_jurnal)', $bulan);
		$this->db->where('YEAR(tgl_jurnal)', $tahun);
		$query = $this->db->get();
		return $query->result_array();
	}

	public function getBB($coa, $tgl)
	{
		$sql = "SELECT a.*, nama_coa, saldo_awal
		FROM jurnal a
		JOIN coa b ON a.no_coa = b.no_coa
		WHERE a.no_coa = '$coa'
		AND LEFT(tgl_jurnal, 7) = '$tgl'
		";
		return $this->db->query($sql);
	}

	public function bb_kosongan()
	{
		$sql = "SELECT a.*, nama_coa, saldo_awal
		FROM jurnal a
		JOIN coa b ON a.no_coa = b.no_coa
		WHERE a.no_coa = ''
		AND LEFT(tgl_jurnal, 7) = LEFT(SYSDATE(),7)
		";
		return $this->db->query($sql);
	}
}
