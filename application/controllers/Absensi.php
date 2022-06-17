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
        WHERE `rfid` = '$rfid' 
        AND CURRENT_DATE BETWEEN `tgl_awal` and `tgl_akhir`
        AND pegawai.status = 1
        ";

        // $peg = $this->db->query("SELECT * FROM pegawai WHERE rfid = '$rfid'")->row();
        $peg = $this->db->query($q)->row();
        

        if ($peg) {
            # code...
            $id_absensi = $this->Absensi_model->absensiID();

            $q = "SELECT COUNT(*) AS jml FROM detail_absen_rfid WHERE id_absensi = '$id_absensi' AND rfid = '$rfid'";

            $jml_absen = $this->db->query($q)->row();

            if ($jml_absen->jml < 2) {
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
                    if ($this->jam_sekarang <= $peg->time_out && $this->jam_sekarang >= $peg->time_in) {
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
            }
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
        $detail = $this->db->query("SELECT a.*, b.tanggal, c.nama
        FROM detail_absen_rfid a 
        JOIN absensi b ON a.id_absensi = b.id
        JOIN pegawai c ON a.rfid = c.rfid
        ORDER BY a.id DESC")->result();

        $data = [
            'list' => $detail, 
        ];
        $this->template->load('template', 'absensi/laporan_absensi', $data);
    }
}
?>