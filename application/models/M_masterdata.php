<?php

class m_masterdata extends CI_Model {

    function tambah_data($table, $data){
		$this->db->insert($table, $data);
	}

	function edit_data($table, $where){		
		return $this->db->get_where($table,$where);
	}
	function update_data($table,$data){
		//$this->db->where($where);
		return $this->db->update($table,$data);
	}

	function hapus_data($table, $where){
		$this->db->where($where);
		return 	$this->db->delete($table);
	}

	function simpanan_wajib() {
		$sql = "SELECT * FROM `simpanan` where simpanan like 'simpanan wajib' ";
		return $this->db->query($sql);
	}

    public function cek_pegawai()
    {
        $q = "SELECT a.*
        -- , is_complete
        FROM pegawai a
        WHERE status = 1
        -- left JOIN jadwal_shift b ON a.nip = b.id_pegawai
        -- WHERE is_complete = 1
        -- GROUP BY rfid
        ";
        return $this->db->query($q);
    }

    public function shift()
    {
        $q = "SELECT a.*, b.nip, b.nama, c.desc as shift, b.created_at FROM jadwal_shift a
        JOIN pegawai b ON a.id_pegawai = b.nip
        JOIN shift c ON a.id_shift = c.id
        ORDER BY a.id desc
        ";
        return $this->db->query($q);
    }

	public function kategori_code()
	{
		# code...
		$query1   = "SELECT MAX(RIGHT(kode,3)) as kode FROM waserda_kategori";
        $abc      = $this->db->query($query1);
        $kode = "";
        if ($abc->num_rows() > 0) {
            foreach ($abc->result() as $k) {
                $tmp = ((int) $k->kode) + 1;
                $kd  = sprintf("%03s", $tmp);
            }
        } else {
            $kd = "001";
        }
        $kode   = "WKS".$kd;
        return $kode;
	}

	public function kode_produk()
	{
		$query1   = "SELECT MAX(RIGHT(kode,3)) as kode FROM waserda_produk";
        $abc      = $this->db->query($query1);
        $kode = "";
        if ($abc->num_rows() > 0) {
            foreach ($abc->result() as $k) {
                $tmp = ((int) $k->kode) + 1;
                $kd  = sprintf("%03s", $tmp);
            }
        } else {
            $kd = "001";
        }
        $kode   = "WSP".$kd;
        return $kode;
	}

	public function invoice()
	{
		$query1   = "SELECT MAX(RIGHT(invoice,3)) as kode FROM pos_penjualan WHERE status != 'dalam proses'";
        $abc      = $this->db->query($query1);
        $kode = "";
        if ($abc->num_rows() > 0) {
            foreach ($abc->result() as $k) {
                $tmp = ((int) $k->kode) + 1;
                $kd  = sprintf("%03s", $tmp);
            }
        } else {
            $kd = "001";
        }
		$date = date('dmy');
        $kode   = "PNJWASERDA".$date.$kd;
        return $kode;
	}

    public function invoice_pmb()
	{
		$query1   = "SELECT MAX(RIGHT(invoice,3)) as kode FROM pos_pembelian WHERE status != 'dalam proses'";
        $abc      = $this->db->query($query1);
        $kode = "";
        if ($abc->num_rows() > 0) {
            foreach ($abc->result() as $k) {
                $tmp = ((int) $k->kode) + 1;
                $kd  = sprintf("%03s", $tmp);
            }
        } else {
            $kd = "001";
        }
		$date = date('dmy');
        $kode   = "PMBWASERDA".$date.$kd;
        return $kode;
	}

    public function nip_otomatis()
	{
		$query1   = "SELECT MAX(RIGHT(nip,3)) as kode 
        FROM pegawai
        ";
        $abc    = $this->db->query($query1);
        $kode   = "";
        if ($abc->num_rows() > 0) {
            foreach ($abc->result() as $k) {
                $tmp = ((int) $k->kode) + 1;
                $kd  = sprintf("%03s", $tmp);
            }
        } else {
            $kd = "001";
        }
        $random = rand(0, 10000);
		$date = date('dmy');
        $kode   = $random.$date.$kd;
        return $kode;
	}

    public function get_pendidikan($value)
    {
        $this->db->where('desc', $value);
		$this->db->order_by('pendidikan', 'ASC');

        $query = $this->db->get("tb_jenis_pegawai");
        $output = '<option value="">-</option>';
		foreach ($query->result() as $row) {
			$output .= '<option value="' . $row->pendidikan . '">' . $row->pendidikan . '</option>';
		}
		return $output;

    }

    /** id pengajuan bonus */
    public function id_pengajuan_bonus()
	{
		$query1   = "SELECT RIGHT(id_pengajuan,3) as kode FROM pengajuan_bonus";
        $abc      = $this->db->query($query1);
        $kode = "";
        if ($abc->num_rows() > 0) {
            foreach ($abc->result() as $k) {
                $tmp = ((int) $k->kode) + 1;
                $kd  = sprintf("%03s", $tmp);
            }
        } else {
            $kd = "001";
        }
		$date = date('dmy');
        $kode   = "PENGAJUANBONUS".$date.$kd;
        return $kode;
	}
	
}