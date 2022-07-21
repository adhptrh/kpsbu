<?php
class Jasa_anggota_model extends CI_Model {
    public function getJasaAnggota($tahun = null) {
        $kode = $this->M_transaksi->pembagian_kode();
        $kode_total = $this->M_transaksi->pembagian_kode_total();
        $cek_tahun = date("Y");
        if ($tahun != null) {
            $cek_tahun = $tahun;
        }

        $anggota = $this->db->query("SELECT z.no_peternak, z.nama_peternak, x.*
        FROM peternak z
        LEFT JOIN (
            SELECT a.tanggal, a.id_trans, a.id_anggota, a.jasa_modal, a.jasa_anggota, a.sisa_hasil_usaha
            FROM pembagian_shu a
            JOIN peternak b ON a.id_anggota = b.no_peternak
            WHERE YEAR(tanggal) = '$cek_tahun'
        ) AS x ON x.id_anggota = z.no_peternak
        WHERE z.is_deactive = 0
        AND tanggal IS NULL 
        ")->result();

        $list = $this->db->query("SELECT a.*, b.nama_peternak
        FROM pembagian_shu a
        JOIN peternak b ON a.id_anggota = b.no_peternak WHERE a.tanggal LIKE '$cek_tahun-%'")->result();

        $total_shu = $this->db->query("SELECT SUM(sisa_hasil_usaha) AS shu
        FROM pembagian_shu a
        JOIN peternak b ON a.id_anggota = b.no_peternak WHERE a.tanggal LIKE '$cek_tahun-%'")->row()->shu;

        $cek = $this->db->get('transaksi_shu')->num_rows();
        // print_r($cek);exit;


        $data = [
            'kode' => $kode,
            'kode_total' => $kode_total,
            'list' => $list,
            'anggota' => $anggota,
            'cek' => $cek,
            'total_shu' => $total_shu
        ];

        return $data;
    }
}