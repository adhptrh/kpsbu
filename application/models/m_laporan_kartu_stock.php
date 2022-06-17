<?php
class m_laporan_kartu_stock extends CI_model
{
    public function get_laporan_kartu_stock($kode_produk = "", $mode = "", $bulantahun = "")
    {
        $this->db->select("*");
        $this->db->from("laporan_kartu_stock");
        $this->db->join("waserda_produk", "waserda_produk.kode = laporan_kartu_stock.kode_produk");
        $this->db->where("mode",$mode);
        $this->db->where("kode_produk", $kode_produk);
        $this->db->where("tanggal like", $bulantahun."%");
        $this->db->order_by("tanggal", "desc");
        return $this->db->get()->result();
    }
}