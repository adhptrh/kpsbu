<?php

class m_bank extends CI_Model {
    public function kd_bank()
    {
        $query1   = "SELECT MAX(RIGHT(id_bank,4)) as kode FROM bank";
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
        $kode   = "BNK-".date('Ymd').$kd;
        return $kode;
    }
}