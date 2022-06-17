<?php class Penjualan_model extends CI_Model
{
    public function kd_penjualan_susu()
    {
        $query1   = "SELECT MAX(RIGHT(kd_pnj_susu,3)) as kode FROM pnj_susu WHERE status = 'selesai' AND jenis_pnj_susu = 'susu_murni' ";
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
        $kode   = "PNJS".date('Ymd').$kd;
        return $kode;
    }

    public function kd_olahan_susu()
    {
        $query1   = "SELECT MAX(RIGHT(kd_pnj_susu,3)) as kode FROM pnj_susu WHERE status = 'selesai' AND jenis_pnj_susu = 'susu_olahan' ";
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
        $kode   = "PNJSO".date('Ymd').$kd;
        return $kode;
    }

    public function kd_pakan_konsentrat()
    {
        $query1   = "SELECT MAX(RIGHT(kd_pnj_susu,3)) as kode FROM pnj_susu WHERE status = 'selesai' AND jenis_pnj_susu = 'pakan_konsentrat' ";
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
        $kode   = "PNJPKN".date('Ymd').$kd;
        return $kode;
    }

    public function type_susu($jenis)
    {
        $q = "SELECT * FROM produk";

        if ($jenis == 'susu_olahan') {
            $q .= " WHERE id_jenis = 3 ";
        } else if ($jenis == 'pakan_konsentrat') {
            $q .= " WHERE id_jenis = 2 ";
        } else {
            $q .= " WHERE id_jenis = 1 ";
        }
        $q .= "AND stok != 0";
        return $this->db->query($q);
    }

    public function total_detail_pnj($kode)
    {
        $q = "SELECT SUM(subtotal) AS total FROM detail_pnj_susu WHERE kd_pnj_susu = '$kode' ";
        return $this->db->query($q);
    }
}
?>