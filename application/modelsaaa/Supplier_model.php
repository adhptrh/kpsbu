<?php class Supplier_model extends CI_Model
{
    public function kode()
    {
        $query1   = "SELECT MAX(RIGHT(kode,3)) as kode FROM waserda_supplier";
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
        $kode   = "WSS".$kd;
        return $kode;
    }
}
?>