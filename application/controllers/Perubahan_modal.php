<?php

class Perubahan_modal extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('Laporan_model', 'laporan');
        $this->load->model('Jasa_anggota_model', 'Jasa_anggota_model');
    }

    public function laporan() {
        $tahun = $this->input->get('tahun') ?? date("Y");
        $modalAwal = $this->laporan->getLaporanNeracaYear($tahun)["modal"];
        $jasanaggota = $this->Jasa_anggota_model->getJasaAnggota($tahun);
        $no = 1;
        $tot_shu = 0;
        $persen = 0;
        $sum_shu = $jasanaggota["total_shu"];
        foreach ($jasanaggota["list"] as $item) { 
            $tot_shu += $item->sisa_hasil_usaha;
            $persen += number_format(($item->sisa_hasil_usaha / $sum_shu * 100),2);
            
        }

        $labaditahan = $this->db->query("SELECT * FROM jurnal WHERE no_coa = '3200' AND YEAR(tgl_jurnal) = '".$tahun."'")->result()[0]->nominal ?? "0";
        $total=$tot_shu+$labaditahan;
        $modalakhir = $total+$modalAwal;
        $data = [
            "modalAwal"=>$modalAwal,
            'shudibagikan'=>$tot_shu,
            'labaditahan'=>$labaditahan,
            "total"=>$total,
            "modalakhir"=>$modalakhir,
            "tahun"=>$tahun,
        ];
        $this->template->load('template','laporan/Perubahan_modal',$data);
    }
}