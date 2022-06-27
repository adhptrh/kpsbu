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
        
        $laporan = $this->db->get()->result();

        return $laporan;
    }

    public function get_laporan_kartu_stock_saldo_akhir($kode_produk = "", $bulantahun = "")
    {
        $this->db->select("*");
        $this->db->from("laporan_kartu_stock");
        $this->db->join("waserda_produk", "waserda_produk.kode = laporan_kartu_stock.kode_produk");
        $this->db->where("kode_produk", $kode_produk);
        $this->db->where("tanggal like", $bulantahun."%");
        $this->db->order_by("tanggal", "desc");
        
        $laporan = $this->db->get()->result();

        $bulantahun_split = explode("-", $bulantahun);
        $bulan = intval($bulantahun_split[1]);
        $saldo_akhir = 0;
        if ($bulan > 1) {
            $bulan = $bulan - 1;
            $bulan_lalu = $bulantahun_split[0]."-".sprintf("%02d",$bulan);
            $laporan_lalu = $this->get_laporan_kartu_stock_saldo_akhir($kode_produk,$bulan_lalu);
            $saldo_akhir = $laporan_lalu;
        } else {
            $saldo_akhir = 0;
        }
        $jumlahsaldoakhir = $saldo_akhir+0;

        foreach ($laporan as $key => $value) {
            if ($value->mode == "in") {
                $jumlahsaldoakhir += $value->unit;
            } else {
                $jumlahsaldoakhir -= $value->unit;
            }
        }

        return $jumlahsaldoakhir;
    }
}