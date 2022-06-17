<?php

class m_transaksi extends CI_Model
{

	function tambah_data($table, $data)
	{
		$this->db->insert($table, $data);
	}

	function edit_data($table, $where)
	{
		return $this->db->get_where($table, $where);
	}
	function update_data($table, $data)
	{
		//$this->db->where($where);
		return $this->db->update($table, $data);
	}

	function hapus_data($table, $where)
	{
		$this->db->where($where);
		return 	$this->db->delete($table);
	}

	public function get_nama_anggota($peternak)
	{
		$this->db->select('*');
		$this->db->from('peternak');
		$this->db->where('no_peternak', $peternak);
		$query = $this->db->get();
		if ($query->num_rows() != 0) {
			return $query->row()->nama_peternak;
		} else {
			return false;
		}
	}

	function get_aset($id_supplier)
	{
		$this->db->where('id_supplier', $id_supplier);
		$this->db->order_by('aset', 'ASC');

		$query = $this->db->get("aset");
		// print_r($query);exit;
		$output = '<option value="">Pilih aset</option>';
		foreach ($query->result() as $row) {
			$output .= '<option value="' . $row->id . '">' . $row->aset . '</option>';
		}
		return $output;
	}

	public function get_detail($id_pembelian)
	{
		# code...
		$this->db->select('*');
		$this->db->from('detail_pembelian');
		$this->db->join('aset', 'aset.id = detail_pembelian.id_aset');
		$this->db->join('supplier_aset', 'supplier_aset.id = aset.id_supplier');
		$this->db->where('id_pembelian', $id_pembelian);
		return $this->db->get()->result();
	}

	public function simpanDetail()
	{
		//Ambil Harga dari Tabel Bhn Baku
		$this->db->where('kd_bhn_baku', $this->input->post('kd_bhn_baku'));
		$hargabarang = $this->db->get('bhn_baku')->row()->harga;

		// detail pembelian
		$this->db->where(array(
			'id_pembelian' => $this->input->post('id'),
			'id_aset' => $this->input->post('id_aset')
		));

		$query = $this->db->get('detail_pembelian');
		if ($query->num_rows() == 0) {
			$subtotal = $this->input->post('jumlah') * $hargabarang;
			$insert = array(
				'no_pembelian' => $this->input->post('kode'),
				'id_jenis_bahan' => $this->input->post('id_jenis_bahan'),
				'kd_bhn_baku'    => $this->input->post('kd_bhn_baku'),
				'jumlah'       => $this->input->post('jumlah'),
				'subtotal'     => $subtotal,
				'kd_pemasok'     => $this->input->post('kd_pemasok'),
			);
			$this->db->insert('detail_pembelian', $insert);
		} else {
			$this->db->set('jumlah', "jumlah + " . $this->input->post('jumlah') . "", FALSE);
			$this->db->set('subtotal', "subtotal + " . $this->input->post('jumlah') * $hargabarang . "", FALSE);
			$this->db->where(
				array(
					'no_pembelian' => $this->input->post('kode'),
					'kd_bhn_baku' => $this->input->post('kd_bhn_baku')
				)
			);
			$this->db->update('detail_pembelian');
		}
	}

	public function detail_view()
	{
		# code...
		$this->db->select("*");
		$this->db->join("detail_pembelian", "detail_pembelian.id_pembelian = pembelian_aset.id_pembelian");
		$sql = $this->db->get("pembelian_aset");
		return $sql->result();
	}

	// public function detail_penyusutan() {
	// 	$this->db->select("detail_pembelian.*, aset.id as kd_aset, aset, umur_aset, sisa_umur");
	// 	$this->db->join("aset", "aset.id = detail_pembelian.id_aset");
	// 	// $this->db->join("penyusutan", "aset.id = penyusutan.id_aset");
	// 	$this->db->where("sisa_umur !=", "0");
	// 	$this->db->where("is_rev =", 0);
	// 	$this->db->where("cek_bulan_peny !=", date("Y-m"));

	// 	$sql = $this->db->get("detail_pembelian");
	// 	return $sql->result();
	// }

	public function getAset()
	{
		$sql = "SELECT detail_pembelian.*, aset.id as kd_aset, aset, umur_aset, sisa_umur 
		FROM detail_pembelian
		JOIN aset ON aset.id = detail_pembelian.id_aset
		";
		return $this->db->query($sql);
	}

	public function detail_penyusutan()
	{
		$sql = "SELECT detail_pembelian.*, aset.id as kd_aset, aset, umur_aset, sisa_umur 
		FROM detail_pembelian
		JOIN aset ON aset.id = detail_pembelian.id_aset
		WHERE sisa_umur != 0
		AND is_rev = 0
		AND cek_bulan_peny != LEFT(SYSDATE(), 7)
		AND cek_bulan_perb is null
		";
		return $this->db->query($sql)->result();
	}

	public function detail_rev()
	{
		$sql = "SELECT a.*, b.id as kd_aset, aset, umur_aset, sisa_umur
		from detail_pembelian a
		join aset b on a.id_aset = b.id 
		where sisa_umur != 0 
		and cek_bulan_perb is not null
		AND cek_bulan_peny != LEFT(SYSDATE(), 7)
		";
		return $this->db->query($sql)->result();
	}

	public function list_aset($id)
	{
		$sql = "SELECT a.*, aset
		FROM detail_pembelian a
		INNER JOIN aset b ON a.id_aset = b.id
		WHERE cek_bulan_perb IS NULL
		AND id_detail_aset = '$id' ";
		return $this->db->query($sql);
	}

	public function anggota_pinjaman_dropdown()
	{
		$this->db->select("peternak.no_peternak, nama_peternak, COUNT(no_trans) as total_trans");
		// $this->db->from("peternak");
		$this->db->join("detail_pembelian_bb", "peternak.no_peternak = detail_pembelian_bb.no_peternak");
		$this->db->where("no_trans >=", "8");
		$this->db->group_by("peternak.no_peternak");
		$sql = $this->db->get("peternak");

		return $sql->result();
	}

	function get_jumlah($id_peternak)
	{
		$query = "SELECT SUM(jumlah) as total_jumlah, SUM(subtotal) as total_trans_susu, pinjaman
		FROM detail_pembelian_bb
		JOIN pembelian_bb ON (pembelian_bb.no_trans = detail_pembelian_bb.no_trans)
		JOIN peternak ON (peternak.no_peternak = detail_pembelian_bb.no_peternak)
        WHERE tgl_trans BETWEEN (NOW() - INTERVAL 14 DAY) AND NOW() AND detail_pembelian_bb.no_peternak = '$id_peternak'";
		return $this->db->query($query);
	}

	function coba($id_peternak)
	{
		$query = "SELECT 
		SUM(jumlah) as total_jumlah, 
		SUM(subtotal) as total_trans_susu, 
		pinjaman, 
		-- sisa_pinjaman,
		(
			SELECT sisa_pinjaman 
			FROM log_pinjaman
			WHERE id_anggota = '$id_peternak' 
			AND status = 1
		) AS sisa_pinjaman,
		tgl_trans, 
		tgl_trans + INTERVAL 14 DAY as nextPayment
		FROM detail_pembelian_bb
		JOIN pembelian_bb ON (pembelian_bb.no_trans = detail_pembelian_bb.no_trans)
		JOIN peternak ON (peternak.no_peternak = detail_pembelian_bb.no_peternak)
		-- inner JOIN log_pinjaman ON log_pinjaman.id_anggota = detail_pembelian_bb.no_peternak
		WHERE tgl_trans BETWEEN (LEFT(SYSDATE(),10) - INTERVAL 14 DAY) AND LEFT(SYSDATE(),10) 
		AND detail_pembelian_bb.no_peternak = '$id_peternak'
		-- AND log_pinjaman.status = 1
		";
		return $this->db->query($query);
	}

	public function getKd($id_detail)
	{
		$query = "SELECT kel_akun, kel_akun_peny_d, kel_akun_peny_k, nama_coa
		FROM aset a
		INNER JOIN detail_pembelian b ON a.id = b.id_aset
		INNER JOIN coa c ON a.kel_akun = c.no_coa
		WHERE b.id_detail_aset = '$id_detail'";
		return $this->db->query($query);
	}

	public function getJumlah($id_peternak)
	{
		# code...
		$query = "
    	SELECT id_anggota, tgl_transaksi, tgl_transaksi + INTERVAL 14 DAY as next_trans
		FROM peternak
		JOIN log_pembayaran_susu ON log_pembayaran_susu.id_anggota = peternak.no_peternak
		JOIN pembayaran_susu ON pembayaran_susu.kode_pembayaran = log_pembayaran_susu.id_pembayaran
        WHERE no_peternak = '$id_peternak'
        ORDER BY tgl_transaksi DESC
        ";
		return $this->db->query($query);
	}

	public function getSyarat($id_peternak)
	{
		// nyoba ganti sql nya 
		$sql = "SELECT t.id_anggota, 
		t.pinjaman,
		t.sisa_pinjaman,
		t.total_bayar, 
		t.tgl_transaksi, 
		(
			SELECT COUNT(id_pembayaran) AS total
			FROM log_pembayaran_susu
			WHERE id_anggota = '$id_peternak'
		) AS total
		FROM 
			(
			SELECT b.id_anggota, id_pembayaran, pinjaman, sisa_pinjaman, total_bayar, tgl_transaksi
			FROM peternak a
			INNER JOIN log_pembayaran_susu b ON a.no_peternak = b.id_anggota
			INNER JOIN pembayaran_susu c ON c.kode_pembayaran = b.id_pembayaran
			LEFT JOIN log_pinjaman d ON d.id_anggota = a.no_peternak
			WHERE b.id_anggota = '$id_peternak' 
		) t
		ORDER BY tgl_transaksi DESC
		LIMIT 1";
		return $this->db->query($sql);
	}

	public function UtangPinjamanByMember($id_anggota)
	{
		# code...
		$sql = "
    	SELECT no_peternak, nama_peternak, nominal, status
		FROM peternak
		JOIN log_pinjaman ON log_pinjaman.id_anggota = peternak.no_peternak
		WHERE no_peternak = '$id_anggota'
    	";
		return $this->db->query($sql);
	}

	public function getListPinjaman($id)
	{
		$sql = "SELECT *, nama_coa
		FROM log_bayar_pinjaman a
		INNER JOIN coa b ON a.kd_coa = b.no_coa
		where id_anggota = '$id'
		order by a.id asc
		";
		return $this->db->query($sql);
	}

	public function getIndex()
	{
		# code...
		$sql = "
    	SELECT kode_pinjaman, id_anggota, tanggal_pinjaman, nominal, status, nama_peternak
		FROM log_pinjaman
		JOIN peternak ON peternak.no_peternak = log_pinjaman.id_anggota
		ORDER BY tanggal_pinjaman DESC
    	";
		return $this->db->query($sql);
	}

	function get14day()
	{
		# code...
		$sql = "
	    SELECT tgl_transaksi + INTERVAL 14 DAY as tgl_transaksi
	    FROM peternak 
	    JOIN log_pembayaran_susu ON log_pembayaran_susu.id_anggota = peternak.no_peternak
	    JOIN pembayaran_susu ON log_pembayaran_susu.id_pembayaran = pembayaran_susu.kode_pembayaran";
		return $this->db->query($sql);
	}

	function id_otomatis($value = '')
	{
		$this->db->select('MAX(RIGHT(pembayaran_susu.kode_pembayaran,  4)) as kode', FALSE);
		$this->db->order_by('kode_pembayaran', 'DESC');
		$this->db->limit(1);
		$query = $this->db->get('pembayaran_susu'); //cek dulu apakah ada sudah ada kode di tabel.    
		if ($query->num_rows() <> 0) {
			//jika kode ternyata sudah ada.      
			$data = $query->row();
			$kode = intval($data->kode) + 1;
		} else {
			//jika kode belum ada      
			$kode = 1;
		}

		$datenow = date('dmY');
		$kodemax = str_pad($kode, 4, "0", STR_PAD_LEFT); // angka 4 menunjukkan jumlah digit angka 0
		$kodejadi = "PMBS-" . $datenow . '' . $kodemax;    // hasilnya tgl sekarang + kode dst.
		return $kodejadi;
	}

	public function next_datePayment($id_peternak)
	{
		# code...
		$now = date("Y-m-d");

		$sql = "
		SELECT tgl_trans, tgl_trans + INTERVAL 14 DAY as nextPayment
		FROM pembelian_bb
		JOIN detail_pembelian_bb ON detail_pembelian_bb.no_trans = pembelian_bb.no_trans
		WHERE detail_pembelian_bb.no_peternak = '$id_peternak'
		ORDER BY `pembelian_bb`.`tgl_trans`  ASC
		limit 1
		";
		return $this->db->query($sql);
	}

	public function getTruck($id)
	{
		$sql = "SELECT a.id, aset, id_detail_aset, id_aset
		FROM detail_pembelian a
		INNER JOIN aset b ON a.id_aset = b.id
		WHERE a.id = $id ";
		return $this->db->query($sql);
	}

	public function getPny()
	{
		$sql = "SELECT a.id_penyusutan, a.bulan_penyusutan, d.aset, c.id_detail_aset, total_penyusutan
		FROM penyusutan a
		INNER JOIN log_penyusutan b ON a.id_penyusutan = b.id_penyusutan
		INNER JOIN detail_pembelian c ON a.id_detail = c.id_detail_aset
		INNER JOIN aset d ON c.id_aset = d.id";
		return $this->db->query($sql);
	}

	// sarah
	public function t_penjualan_shu()
	{
		$year = date("Y");
		$q = "SELECT
		SUM(nominal) AS total_penjualan
		FROM jurnal a
		LEFT JOIN (
		   SELECT id, no_coa, nama_coa, header, is_shu
		   FROM coa
		) AS b ON a.no_coa = b.no_coa
		WHERE b.is_shu = 1
		AND b.header = 4
		-- AND YEAR(tgl_jurnal) = '$year'
		AND YEAR(tgl_jurnal) = '$year'
		AND posisi_dr_cr = 'k'";
		return $this->db->query($q);
	}

	public function t_beban_shu()
	{
		$tahun = date('Y');
		$q = "SELECT
		SUM(nominal) AS total, b.nama_coa, tgl_jurnal, header
		FROM jurnal a
		LEFT JOIN (
		   SELECT id, no_coa, nama_coa, is_shu, header
		   FROM coa
		) AS b ON a.no_coa = b.no_coa
		WHERE b.is_shu = 1
		AND YEAR(tgl_jurnal) = '$tahun'
		AND posisi_dr_cr = 'd'
		AND header = 5
		GROUP BY nama_coa";
		return $this->db->query($q);
	}

	public function t_hpp()
	{
		$tahun = date('Y');
		$q = "SELECT kode_trans, tgl_jurnal, SUM(a.nominal) AS hpp
		FROM jurnal a
		JOIN transaksi_hpp b ON a.id_jurnal = b.kode_trans
		JOIN coa c ON a.no_coa = c.no_coa
		WHERE nama_coa = 'harga pokok penjualan'
		AND YEAR(tgl_jurnal) = '$tahun'
		GROUP BY kode_trans";
		return $this->db->query($q);
	}

	public function trans_susu($id_peternak)
	{
		$tahun_sekarang = date('Y');
		$q = "SELECT 
		SUM(subtotal) AS total_transaksi, x.tgl_trans
		FROM detail_pembelian_bb z
		JOIN pembelian_bb x ON z.no_trans = x.no_trans 
		WHERE no_peternak = '$id_peternak'
		AND YEAR(tgl_trans) = '$tahun_sekarang'";
		return $this->db->query($q);
	}

	public function data_laporan_shu()
	{
		$year = date('Y');
		$q = "SELECT 
        z.nama_peternak, 
        z.no_peternak, 
        z.deposit, 
        x.total_liter, 
        x.total_harga, 
        x.total_masuka, 
        x.total_simpanan_wajib
        FROM peternak z
        LEFT JOIN (
            SELECT a.no_peternak, 
            a.nama_peternak, 
            a.deposit, 
            sum(b.jumlah_liter_susu) AS total_liter, 
            sum(b.jumlah_harga_susu) AS total_harga, 
            sum(b.simpanan_masuka) AS total_masuka, 
            sum(b.simpanan_wajib) AS total_simpanan_wajib, 
            c.total_bayar, 
            c.tgl_transaksi
            FROM peternak a 
            LEFT JOIN log_pembayaran_susu b ON a.no_peternak = b.id_anggota
            LEFT JOIN pembayaran_susu c ON b.id_pembayaran = c.kode_pembayaran
            WHERE left(tgl_transaksi, 4) = '$year'
            GROUP BY nama_peternak
        ) AS x ON z.no_peternak = x.no_peternak
        WHERE z.is_deactive = 0 ";
		return $this->db->query($q);
	}

	public function simpanan_peranggota($id_anggota = null)
	{
		$tahun = date('Y');
		$q = "SELECT SUM(deposit + total) AS total_simpanan_anggota
		FROM 
		(
			SELECT id_anggota, c.tgl_transaksi, SUM(simpanan_masuka + simpanan_wajib) AS total, deposit 
			FROM log_pembayaran_susu a 
			JOIN peternak b ON a.id_anggota = b.no_peternak
			JOIN pembayaran_susu c ON a.id_pembayaran = c.kode_pembayaran
			WHERE b.is_deactive = 0
			AND id_anggota = '$id_anggota'
			AND YEAR(tgl_transaksi) = '$tahun'
		) peternak ";
		return $this->db->query($q);
	}

	public function jasa_anggota()
	{
		$tahun_sekarang = date('Y');
		$q = "SELECT b.nominal
		FROM transaksi_shu a 
		JOIN detail_transaksi_shu b ON a.kode_shu = b.kode_shu
		WHERE YEAR(tanggal) = '$tahun_sekarang'
		AND uraian = 'jasa anggota'";
		return $this->db->query($q);
	}

	public function jasa_modal()
	{
		$tahun_sekarang = date('Y');
		$q = "SELECT b.nominal
		FROM transaksi_shu a 
		JOIN detail_transaksi_shu b ON a.kode_shu = b.kode_shu
		WHERE YEAR(tanggal) = '$tahun_sekarang'
		AND uraian = 'jasa modal'";
		return $this->db->query($q);
	}

	public function kode_shu()
	{
		$this->db->select('MAX(RIGHT(transaksi_shu.kode_shu,  4)) as kode', FALSE);
		$this->db->order_by('kode_shu', 'DESC');
		$this->db->limit(1);
		$query = $this->db->get('transaksi_shu'); //cek dulu apakah ada sudah ada kode di tabel.    
		if ($query->num_rows() <> 0) {
			//jika kode ternyata sudah ada.      
			$data = $query->row();
			$kode = intval($data->kode) + 1;
		} else {
			//jika kode belum ada      
			$kode = 1;
		}

		$datenow = date('Y');
		$kodemax = str_pad($kode, 4, "0", STR_PAD_LEFT); // angka 4 menunjukkan jumlah digit angka 0
		$kodejadi = "SHU".$datenow.$kodemax;    // hasilnya tgl sekarang + kode dst.
		return $kodejadi;
	}

	public function kode_hpp()
	{
		$this->db->select('MAX(RIGHT(transaksi_hpp.kode_trans,  4)) as kode', FALSE);
		$this->db->order_by('kode_trans', 'DESC');
		$this->db->limit(1);
		$query = $this->db->get('transaksi_hpp'); //cek dulu apakah ada sudah ada kode di tabel.    
		if ($query->num_rows() <> 0) {
			//jika kode ternyata sudah ada.      
			$data = $query->row();
			$kode = intval($data->kode) + 1;
		} else {
			//jika kode belum ada      
			$kode = 1;
		}

		$datenow = date('dmY');
		$kodemax = str_pad($kode, 4, "0", STR_PAD_LEFT); // angka 4 menunjukkan jumlah digit angka 0
		$kodejadi = "HPP-".$kodemax;    // hasilnya tgl sekarang + kode dst.
		return $kodejadi;
	}

	public function pembagian_kode()
	{
		$this->db->select('MAX(RIGHT(pembagian_shu.id_trans,  4)) as kode', FALSE);
		$this->db->order_by('id_trans', 'DESC');
		$this->db->limit(1);
		$query = $this->db->get('pembagian_shu'); //cek dulu apakah ada sudah ada kode di tabel.    
		if ($query->num_rows() <> 0) {
			//jika kode ternyata sudah ada.      
			$data = $query->row();
			$kode = intval($data->kode) + 1;
		} else {
			//jika kode belum ada      
			$kode = 1;
		}

		$datenow = date('Y');
		$kodemax = str_pad($kode, 4, "0", STR_PAD_LEFT); // angka 4 menunjukkan jumlah digit angka 0
		$kodejadi = "PMBG.SHU".$datenow.$kodemax;    // hasilnya tgl sekarang + kode dst.
		return $kodejadi;
	}

	// model untuk buku kas kecil 
	public function insert_buku_kas_kecil($id_ref, $tgl, $nominal, $keterangan, $posisi)
	{
		$data = [
			'id_ref' => $id_ref,
			'tgl_transaksi' => $tgl,
			'nominal' => $nominal,
			'keterangan' => $keterangan,
			'posisi_d_c' => $posisi,
		];
		$this->db->insert('buku_kas_kecil', $data);
	}

	public function insertKartuStok($id_trans, $id_produk)
	{
		$tbPosPembelian = $this->db->query("SELECT a.*, a.id_produk as kode, nama_produk, b.jml AS stok_produk, b.status 
		FROM pos_detail_pembelian a
		JOIN waserda_produk b ON a.id_produk = b.kode
		WHERE invoice = '$id_trans'
		GROUP BY id_produk")->result();
		// print_r($tbPosPembelian);
		foreach ($tbPosPembelian as $data) {
			// $this->db->where('');
			// $this->db->where('id_produk', $id_produk);
			$detailPosPembelian = $this->db->query("SELECT  FROM pos_detail_pembelian WHERE stok_produk > 0");
			// print_r($id_produk);
		}
	}

	public function insertTblWaserdaLogTransaksi($id_produk, $jenis_transaksi, $jumlah, $stok_akhir)
	{
		$data = [
			'id_produk' => $id_produk,
			'jenis_transaksi' => $jenis_transaksi,
			'jumlah' => $jumlah,
			'stok_akhir' => $stok_akhir,
		];
		return $this->db->insert('waserda_log_transaksi', $data);
	}
}
