<?php

class m_anggota extends CI_Model {
    public function kd_anggota() {
        $query1   = "SELECT MAX(RIGHT(no_anggota,4)) FROM (SELECT no_anggota FROM `peternak` UNION SELECT no_anggota FROM `pegawai`) a;";
        $abc      = $this->db->query($query1);
        $kode = "";
        if ($abc->num_rows() > 0) {
            foreach ($abc->result() as $k) {
                $tmp = ((int) $k->kode) + 1;
                $kd  = sprintf("%04s", $tmp);
            }
        } else {
            $kd = "0001";
        }
        $kode   = "ANGGT_".$kd;
        return $kode;
    }
}