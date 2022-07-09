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
        $bulantahun_split = explode("-", $bulantahun);
        $bulan = intval($bulantahun_split[1]);

        $lap_ks_in = $this->laporan_ks->get_laporan_kartu_stock($kode_produk, "in",$bulantahun);
        $lap_ks_out = $this->laporan_ks->get_laporan_kartu_stock($kode_produk, "out",$bulantahun);
        
        if ($bulan > 1) {
            $bulan = $bulan - 1;
            $bulan_lalu = $bulantahun_split[0]."-".sprintf("%02d",$bulan);
            $lap_ks_out_lalu = $this->laporan_ks->get_laporan_kartu_stock_saldo_akhir($kode_produk, $bulan_lalu);
            $produk = $this->db->query("select * from waserda_produk where kode = '$kode_produk'")->result()[0];
    
            $saldoawalobj = (object) [
                "tanggal"=>"Saldo Awal",
                "mode"=>"in",
                "kode_produk"=>$kode_produk,
                "harga_satuan"=>$produk->harga_satuan,
                "unit"=>strval($lap_ks_out_lalu),
            ];
            if ($lap_ks_out_lalu > 0) {
                array_push($lap_ks_in, $saldoawalobj);
            }
            
        }

        $data = [
            "produk"=>$this->produk->getProdukWaserda()->result(),
            "lap_ks_in"=>$lap_ks_in,
            "lap_ks_out"=>$lap_ks_out,
            "kode_produk"=>$kode_produk,
            "bulantahun"=>$bulantahun,
            "lap_ks_out_lalu"=>$lap_ks_out_lalu ?? 0,
            "saldoawal"=>$saldoawalobj ?? null,
            "saldobulansebelumnya"=>$lap_ks_out_lalu ?? 0,
        ];
        $this->template->load('template','laporan_kartu_stock/index',$data);
    }
}