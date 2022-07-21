<?php class Cuti extends CI_Controller
{
    public function index()
    {
        $kode = $this->id_pengajuan();
        $level = $this->session->userdata('level');
        $nip = $this->session->userdata('nip');
        $listCuti = '';
        if ($level == 'admin' || $level == "personalia") {
            $listCuti = $this->db->query("SELECT a.*, b.nama 
            FROM tb_cuti a
            JOIN pegawai b ON a.nip = b.nip")->result();
        } else {
            $listCuti = $this->db->query("select a.*, b.nama, b.status as status_pegawai from tb_cuti a join pegawai b on a.nip = b.nip where b.status = 1 and b.nip ='$nip'")->result();
        }
        $pegawai = $this->db->query("select * from pegawai where status = 1 and nip = '$nip'")->row();
        $total_cuti_tahun_ini = $this->db->query("SELECT SUM(jumlah_hari) as total_hari FROM tb_cuti WHERE tgl_pengajuan LIKE '".date("Y")."%' AND nip = '$nip' AND status = 1")->result();
        if (count($total_cuti_tahun_ini) > 0) {
            $total_cuti_tahun_ini = $total_cuti_tahun_ini[0]->total_hari;
        }
        $data = [
            'kode' => $kode,
            'role' => $level,
            'pegawai' => $pegawai,
            'list' => $listCuti,
            'total_cuti_tahun_ini'=>$total_cuti_tahun_ini,
        ];
        $this->template->load('template', 'pengajuan/hrd/cuti/index', $data);
    }

    public function melahirkan()
    {
        $kode = $this->id_pengajuan_melahirkan();
        $level = $this->session->userdata('level');
        $nip = $this->session->userdata('nip');
        $listCuti = '';
        if ($level == 'admin' || $level == "personalia") {
            $listCuti = $this->db->query("SELECT a.*, b.nama 
            FROM tb_cuti_melahirkan a
            JOIN pegawai b ON a.nip = b.nip")->result();
        } else {
            $listCuti = $this->db->query("select a.*, b.nama, b.status as status_pegawai from tb_cuti_melahirkan a join pegawai b on a.nip = b.nip where b.status = 1 and b.nip ='$nip'")->result();
        }
        $pegawai = $this->db->query("select * from pegawai where status = 1 and nip = '$nip'")->row();
        $bisaTambahCuti = !(count($this->db->query("SELECT * FROM tb_cuti_melahirkan WHERE status = 1 AND tgl_mulai LIKE '".date("Y")."%'")->result()) > 0);
        $data = [
            'kode' => $kode,
            'role' => $level,
            'pegawai' => $pegawai,
            'list' => $listCuti,
            'bisaTambahCuti'=>$bisaTambahCuti,
        ];
        $this->template->load('template', 'pengajuan/hrd/cuti_melahirkan/index', $data);
    }

    public function save()
    {
        $id = $this->input->post('id_pengajuan');
        $start = $this->input->post('start');
        $end = $this->input->post('end');
        $jml_hari_cuti = $this->input->post('jml_hari_cuti');
        $nip = $this->input->post('nip');
        $nama_pegawai = $this->input->post('nama_pegawai');
        $desc = $this->input->post('desc');

        $data = [
            'id_pengajuan' => $id, 
            'nip' => $nip, 
            'jumlah_hari' => $jml_hari_cuti, 
            'tgl_mulai' => $start, 
            'tgl_selesai' => $end, 
            'alasan_cuti' => $desc, 
        ];
        $this->db->insert('tb_cuti', $data);

        redirect('Cuti');
    }

    public function save_melahirkan()
    {
        $id = $this->input->post('id_pengajuan');
        $start = $this->input->post('start');
        $end = $this->input->post('end');
        $jml_hari_cuti = $this->input->post('jml_hari_cuti');
        $nip = $this->input->post('nip');
        $nama_pegawai = $this->input->post('nama_pegawai');
        $desc = $this->input->post('desc');

        $data = [
            'id_pengajuan' => $id, 
            'nip' => $nip, 
            'jumlah_hari' => $jml_hari_cuti, 
            'tgl_mulai' => $start, 
            'tgl_selesai' => $end, 
            'alasan_cuti' => $desc, 
        ];
        $this->db->insert('tb_cuti_melahirkan', $data);

        redirect('Cuti/melahirkan');
    }

    public function accept()
    {
        $id_pengajuan = $this->input->post('id_pengajuan');
        
        $this->db->set('status', 1);
        $this->db->where('id_pengajuan', $id_pengajuan);
        $this->db->update('tb_cuti');
    }

    public function accept_melahirkan()
    {
        $id_pengajuan = $this->input->post('id_pengajuan');
        
        $this->db->set('status', 1);
        $this->db->where('id_pengajuan', $id_pengajuan);
        $this->db->update('tb_cuti_melahirkan');
    }

    public function reject()
    {
        $id_pengajuan = $this->input->post('id_pengajuan');
        
        $this->db->set('status', 2);
        $this->db->where('id_pengajuan', $id_pengajuan);
        $this->db->update('tb_cuti');
        
    }

    public function reject_melahirkan()
    {
        $id_pengajuan = $this->input->post('id_pengajuan');
        
        $this->db->set('status', 2);
        $this->db->where('id_pengajuan', $id_pengajuan);
        $this->db->update('tb_cuti_melahirkan');
        
    }

    private function id_pengajuan()
    {
        $query1   = "SELECT MAX(RIGHT(id_pengajuan,3)) as kode FROM tb_cuti";
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
        $kode   = "CUTI".date('Ymd').$kd;
        return $kode;
    }

    private function id_pengajuan_melahirkan()
    {
        $query1   = "SELECT MAX(RIGHT(id_pengajuan,3)) as kode FROM tb_cuti";
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
        $kode   = "CUTIMLHRKN".date('Ymd').$kd;
        return $kode;
    }

    public function laporan() 
    {
        $id_pegawai = $this->input->get("id_pegawai") ?? "semua";
        $tgl_awal = $this->input->get("tgl_awal") ?? "awd";
        $tgl_akhir = $this->input->get("tgl_akhir") ?? "awd";
        $tgl_awal .= "-01";
        $tgl_akhir .= "-01";
        $query = "SELECT * FROM tb_cuti a LEFT JOIN pegawai b ON a.nip = b.nip WHERE a.nip = '$id_pegawai' AND tgl_mulai BETWEEN '$tgl_awal' AND '$tgl_akhir'";
        if ($id_pegawai == "semua") {
            $query = "SELECT * FROM tb_cuti a LEFT JOIN pegawai b ON a.nip = b.nip WHERE tgl_mulai BETWEEN '$tgl_awal' AND '$tgl_akhir'";
        }
		$data = [
			"parapegawai"=>$this->db->query("SELECT * FROM pegawai")->result(),
            "data_cuti"=>$this->db->query($query)->result(),
            "tgl_awal"=>($this->input->get("tgl_awal")) ? substr($tgl_awal,0,7):null,
            "tgl_akhir"=>($this->input->get("tgl_awal")) ? substr($tgl_akhir,0,7):null,
        ];
		$this->template->load('template', 'laporan/cuti',$data);
    }

    public function laporan_melahirkan() 
    {
        $id_pegawai = $this->input->get("id_pegawai") ?? "semua";
        $tgl_awal = $this->input->get("tgl_awal") ?? "awd";
        $tgl_akhir = $this->input->get("tgl_akhir") ?? "awd";
        $tgl_awal .= "-01";
        $tgl_akhir .= "-01";
        $periode = $this->input->get("periode") ?? date("Y-m");
        $query = "SELECT * FROM tb_cuti_melahirkan a LEFT JOIN pegawai b ON a.nip = b.nip WHERE a.nip = '$id_pegawai' AND tgl_mulai BETWEEN '$tgl_awal' AND '$tgl_akhir'";
        if ($id_pegawai == "semua") {
            $query = "SELECT * FROM tb_cuti_melahirkan a LEFT JOIN pegawai b ON a.nip = b.nip WHERE tgl_mulai BETWEEN '$tgl_awal' AND '$tgl_akhir'";
        }
		$data = [
			"parapegawai"=>$this->db->query("SELECT * FROM pegawai")->result(),
            "data_cuti"=>$this->db->query($query)->result(),
            "tgl_awal"=>($this->input->get("tgl_awal")) ? substr($tgl_awal,0,7):null,
            "tgl_akhir"=>($this->input->get("tgl_awal")) ? substr($tgl_akhir,0,7):null,
        ];
		$this->template->load('template', 'laporan/cuti_melahirkan',$data);
    }
}
?>