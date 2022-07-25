<?php

class Tunjanganhariraya extends CI_Controller {

    public function index() {
        $nips = $this->db->query("SELECT nip FROM pegawai")->result();
        $pegawais = [];
        foreach ($nips as $k=>$v) {
            array_push($pegawais, $v);
        }
        $data = [
            "pegawai"=>$pegawais
        ];
        var_dump($data);
    }
}