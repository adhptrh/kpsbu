<?php class Absensi_model extends CI_Model
{
    public function cekRfid($rfid)
    {
        $this->db->where('rfid', $rfid);
        $q = $this->db->get('pegawai');
        if(count($q->result()) <= 0){
            return false;
        }else{
            return true;
        }
    }

    public function absensiID(){
        $tgl = date('Y-m-d');
        $this->db->where('tanggal', $tgl);
        $absensi = $this->db->get('absensi');
        // $absensi = $this->db->get($this->absensi);
        if(count( $absensi->result() ) <= 0){
            $data = array(
                'tanggal' => $tgl
            );
            $this->db->insert('absensi',$data);
            $insertID = $this->db->insert_id();
        }else{
            $insertID = $absensi->row()->id;
        }
        return $insertID;
    }

    public function cekAbsensi($rfid){
        // return false if already tap
        // return true if hasnt tap rfid

        $this->db->join('detail_absensi_rfid','detail_absensi_rfid.id_absensi = absensi.id_absensi');
        $this->db->where('rfid',$rfid);
        $this->db->where('tanggal',date('Y-m-d'));
        $q = $this->db->Get('absensi');
        if(count($q->result()) <= 0){

            // belum absen
            return true;
        }else{

            // sudah absen
            return false;
        }
    }

    public function getDetailPegawai($nip)
    {
        $month = date('m');
        $q = "SELECT a.id, b.nip, npwp, a.rfid, nama, total, tanggal
        FROM pegawai a
        LEFT JOIN (
            SELECT COUNT(z.rfid) AS total, tanggal, z.rfid, x.nip
            FROM detail_absen_rfid z
            JOIN pegawai x ON z.rfid = x.rfid
            LEFT JOIN absensi s ON s.id = z.id_absensi
            WHERE keterangan LIKE '%Masuk%'
            AND MONTH(tanggal) = '$month'
            AND x.nip = '$nip'
            GROUP BY z.rfid
        ) as b ON b.rfid = a.rfid
        ORDER BY nama ASC ";
        return $this->db->query($q);
    }

    public function detailPegawai($bulantahun = "null")
    {
        if ($bulantahun == "null") {
            $month = date('Y-m');
        } else {
            $month = $bulantahun;
        }
        // query baru
        // $q = "SELECT a.id, nip, npwp, a.rfid, nama, b.total, k.tanggal AS tgl_gaji
        // FROM pegawai a
        // LEFT JOIN (
        //    SELECT COUNT(z.rfid) AS total, s.tanggal, z.rfid, v.tanggal as tgl_gaji
        //    FROM detail_absen_rfid z
        //    JOIN pegawai x ON z.rfid = x.rfid
        //    LEFT JOIN absensi s ON s.id = z.id_absensi
        //    LEFT JOIN tb_penggajian v ON v.nm_pegawai = x.nama
        //    WHERE keterangan LIKE '%Masuk%'
        //    AND MONTH(s.tanggal) = '$month'
        //    GROUP BY x.nama
        // ) as b ON b.rfid = a.rfid
        // LEFT JOIN tb_penggajian k ON k.nm_pegawai = a.nama
        // WHERE a.status = 1
        // ORDER BY nama ASC";

        $q = "SELECT a.id, nip, npwp, a.rfid, nama, b.total, b.tgl_gaji
        FROM pegawai a
        LEFT JOIN (
           SELECT COUNT(z.rfid) AS total, s.tanggal, z.rfid, v.tanggal as tgl_gaji
           FROM detail_absen_rfid z
           JOIN pegawai x ON z.rfid = x.rfid
           LEFT JOIN absensi s ON s.id = z.id_absensi
           LEFT JOIN tb_penggajian v ON v.nm_pegawai = x.nama
           WHERE keterangan LIKE '%Masuk%'
           AND v.tanggal LIKE '$month%'
           GROUP BY x.nama
      	) as b ON b.rfid = a.rfid
        WHERE a.status = 1
        ORDER BY nama ASC";
        return $this->db->query($q);
    }

    // public function cel_gaji()
    // {
    //     # code...
    // }

    public function id_gaji()
    {
        $query1   = "SELECT MAX(RIGHT(id_penggajian,3)) as kode FROM tb_penggajian";
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
        $kode   = "GAJI-".$kd;
        return $kode;
    }
}
?>