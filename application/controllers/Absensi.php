<?php class Absensi extends CI_Controller
{
    public function __construct() {
        parent::__construct();
        $this->load->model('Absensi_model');
        $this->jam_sekarang = date('H:i');
    }
    public function index()
    {
        $jam = $this->jam_sekarang;
        $this->template->load('template_presensi', 'absensi/index2');
    }

    public function save($rfid)
    {
        // $id = $rfid;
        // $p = "SELECT * FROM pegawai WHERE rfid = '$rfid' ";

        // query untuk nyambung ke shift 
        $q = "SELECT * FROM `jadwal_shift` 
        JOIN `shift` ON `shift`.`id` = `jadwal_shift`.`id_shift` 
        JOIN `pegawai` ON `pegawai`.`nip` = `jadwal_shift`.`id_pegawai` 
        LEFT JOIN tb_cuti ON tb_cuti.nip = pegawai.nip
        WHERE `rfid` = '$rfid' 
        AND CURRENT_DATE BETWEEN `tgl_awal` and `tgl_akhir`
        AND pegawai.status = 1
        ";

        // $peg = $this->db->query("SELECT * FROM pegawai WHERE rfid = '$rfid'")->row();
        $peg = $this->db->query($q)->row();

        if ($peg) {
            # code...
            $cuti = $this->db->query("SELECT * FROM tb_cuti WHERE nip = '$peg->nip' AND status = 1 AND '".date("Y-m-d")."' BETWEEN tgl_mulai AND tgl_selesai")->result();
            if (count($cuti) > 0) {
                $absen = array(
                    'status' => false,
                    'info' => 'Hari ini anda cuti ('.$peg->nama.')'
                );
                echo json_encode($absen);
                return;
            }

            $cutimelahirkan = $this->db->query("SELECT * FROM tb_cuti_melahirkan WHERE nip = '$peg->nip' AND status = 1 AND '".date("Y-m-d")."' BETWEEN tgl_mulai AND tgl_selesai")->result();
            if (count($cutimelahirkan) > 0) {
                $absen = array(
                    'status' => false,
                    'info' => 'Hari ini anda cuti ('.$peg->nama.')'
                );
                echo json_encode($absen);
                return;
            }

            $id_absensi = $this->Absensi_model->absensiID();
            $q = "SELECT COUNT(*) AS jml FROM detail_absen_rfid WHERE id_absensi = '$id_absensi' AND rfid = '$rfid'";
            $jml_absen = $this->db->query($q)->row();
            if ($jml_absen->jml >= 2) {
                $absen = array(
                    'status' => false,
                    'info' => 'Anda sudah absen ('.$peg->nama.')'
                );
            } elseif ($this->jam_sekarang >= $peg->time_out && $jml_absen->jml == 1) {
                $data = array(
                    'id_absensi' => $id_absensi,
                    'status' => 'keluar',
                    'rfid' => $rfid,
                    'jam' => date("H:i:s"),
                    'keterangan' => "Presensi Keluar",
                    'id_shift'=>$peg->id_shift,
                );
                $this->db->insert("detail_absen_rfid",$data);
                $absen = array(
                    'status' => true,
                    'info' => 'Berhasil Melakukan Presensi Keluar ('.$peg->nama.')'
                );
            } elseif ($jml_absen->jml < 1 && $this->jam_sekarang >= date("H:i", strtotime($peg->time_in."+1 hours"))) {
                $absen = array(
                    'status' => false,
                    'info' => 'Gagal Melakukan Presensi Masuk, Telat ('.$peg->nama.')'
                );
            } elseif ($this->jam_sekarang >= $peg->time_in && $this->jam_sekarang <= date("H:i", strtotime($peg->time_in."+15 minutes")) && $jml_absen->jml < 1) {
                $data = array(
                    'id_absensi' => $id_absensi,
                    'status' => 'masuk',
                    'rfid' => $rfid,
                    'jam' => date("H:i:s"),
                    'keterangan' => "Presensi Masuk",
                    'id_shift'=>$peg->id_shift,
                );
                $this->db->insert("detail_absen_rfid",$data);
                $absen = array(
                    'status' => true,
                    'info' => 'Berhasil Melakukan Presensi Masuk ('.$peg->nama.')'
                );
            } elseif ($this->jam_sekarang >= $peg->time_in && $this->jam_sekarang <= date("H:i", strtotime($peg->time_in."+1 hours")) && $this->jam_sekarang > date("H:i", strtotime($peg->time_in."+15 minutes")) && $jml_absen->jml < 1) {
                $data = array(
                    'id_absensi' => $id_absensi,
                    'status' => 'masuk',
                    'rfid' => $rfid,
                    'jam' => date("H:i:s"),
                    'keterangan' => "Presensi Masuk, Telat",
                    'id_shift'=>$peg->id_shift,
                );
                $this->db->insert("detail_absen_rfid",$data);
                $absen = array(
                    'status' => true,
                    'info' => 'Berhasil Melakukan Presensi Masuk, Telat ('.$peg->nama.')'
                );
            } elseif ($jml_absen->jml == 1 && $this->jam_sekarang < $peg->time_out ) {
                $absen = array(
                    'status' => true,
                    'info' => 'Anda sudah melakukan presensi masuk sebelumnya ('.$peg->nama.')'
                );
            } else {
                $absen = array(
                    'status' => false,
                    'info' => 'Shift belum terdaftar.'
                );
            }

            /* if ($jml_absen->jml < 2) {
                # code...
                $status = ($jml_absen->jml > 0) ? "Presensi Keluar" : "Presensi Masuk";
                $data = array(
                    'id_absensi' => $id_absensi,
                    'status' => 'Masuk',
                    'rfid' => $rfid,
                    'jam' => date("H:i:s"),
                    'keterangan' => $status
                );
                if ($peg->id_shift == 2) {
                    # code...
                    if ($this->jam_sekarang >= $peg->time_in || $this->jam_sekarang <= $peg->time_out) {
                        # code...
                        if($this->db->insert('detail_absen_rfid',$data)){
                            $absen = array(
                                'status' => true,
                                'info' => 'Berhasil Melakukan Presensi');
                        }else{
                            $absen = array(
                                'status' => false,
                                'info' => 'Gagal Melakukan Absensi.');
                        }
                    } else {
                        $absen = array(
                            'status' => false,
                            'info' => 'Shift belum terdaftar.'
                        );
                    }
                } else {
                    # code...
                    
                    

                    /* if ($this->jam_sekarang <= $peg->time_out && $this->jam_sekarang >= $peg->time_in) {
                        # code...
                        if($this->db->insert('detail_absen_rfid',$data)){
                            $absen = array(
                                'status' => true,
                                // 'info' => 'Berhasil Melakukan Presensi Shift Pagi');
                                'info' => 'Berhasil Melakukan Presensi');
                        }else{
                            $absen = array(
                                'status' => false,
                                'info' => 'Gagal Melakukan Absensi.');
                        }
                    } else {
                        $absen = array(
                            'status' => false,
                            'info' => 'Shift belum terdaftar.'
                        );
                    } 
                }
            } else {
                $absen = array(
                    'status' => false,
                    'info' => 'Sudah melakukan absensi.'
                );
            } */
        } else {
            # code...
            $absen = array(
                'status' => false,
                'info' => 'RFID atau Shift tidak ditemukan.'
            );
        }
        echo json_encode($absen);
    }

    public function laporan_kehadiran($tgl_awal = '', $tgl_akhir = '')
    {
        $bulantahun = $this->input->get("bulantahun") ?? date("Y-m");
        $tgl_awal = $this->input->get("tgl_awal") ?? "awd";
        $tgl_akhir = $this->input->get("tgl_akhir") ?? "awd";
        $tgl_awal .= "-01";
        $tgl_akhir .= "-01";
        $detail = $this->db->query("SELECT a.*, b.tanggal, c.nama, d.desc as jenis_shift
        FROM detail_absen_rfid a 
        JOIN absensi b ON a.id_absensi = b.id
        JOIN pegawai c ON a.rfid = c.rfid
        JOIN shift d ON a.id_shift = d.id
        WHERE b.tanggal BETWEEN '$tgl_awal' AND '$tgl_akhir'
        ORDER BY a.id DESC")->result();

        $data = [
            'list' => $detail, 
            'bulantahun' => $bulantahun,
            "tgl_awal"=>($this->input->get("tgl_awal")) ? substr($tgl_awal,0,7):null,
            "tgl_akhir"=>($this->input->get("tgl_awal")) ? substr($tgl_akhir,0,7):null,
        ];
        $this->template->load('template', 'absensi/laporan_absensi', $data);
    }
}
?>