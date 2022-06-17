<?php

class laporan_kartu_stock extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model([
            "produk_model"=>"produk",
            "m_laporan_kartu_stock"=>"laporan_ks",
        ]);
    }

    public function index() {
        $input = $this->input;
        $kode_produk = $this->input->get("kode_produk") ?? "";
        $bulantahun = $this->input->get("bulantahun") ?? date("Y-m");
        if ($kode_produk == "") {
            if (count($this->produk->getProdukWaserda()->result()) > 0) {
                $kode_produk = $this->produk->getProdukWaserda()->result()[0]->kode;
            }
        }
        $lap_ks_in = $this->laporan_ks->get_laporan_kartu_stock($kode_produk, "in",$bulantahun);
        $lap_ks_out = $this->laporan_ks->get_laporan_kartu_stock($kode_produk, "out",$bulantahun);
        $data = [
            "produk"=>$this->produk->getProdukWaserda()->result(),
            "lap_ks_in"=>$lap_ks_in,
            "lap_ks_out"=>$lap_ks_out,
            "kode_produk"=>$kode_produk,
            "bulantahun"=>$bulantahun,
        ];
        $this->template->load('template','laporan_kartu_stock/index',$data);
    }
}