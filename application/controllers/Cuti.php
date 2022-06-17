<?php class Cuti extends CI_Controller
{
    public function index()
    {
        $kode = $this->id_pengajuan();
        $level = $this->session->userdata('level');
        $nip = $this->session->userdata('nip');
        $listCuti = '';
        if ($level == 'admin') {
            $listCuti = $this->db->query("SELECT a.*, b.nama 
            FROM tb_cuti a
            JOIN pegawai b ON a.nip = b.nip")->result();
        } else {
            $listCuti = $this->db->query("select a.*, b.nama, b.status as status_pegawai from tb_cuti a join pegawai b on a.nip = b.nip where b.status = 1 and b.nip ='$nip'")->result();
        }
        $pegawai = $this->db->query("select * from pegawai where status = 1 and nip = '$nip'")->row();
        $data = [
            'kode' => $kode,
            'role' => $level,
            'pegawai' => $pegawai,
            'list' => $listCuti
        ];
        $this->template->load('template', 'pengajuan/hrd/cuti/index', $data);
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

    public function accept()
    {
        $id_pengajuan = $this->input->post('id_pengajuan');
        
        $this->db->set('status', 1);
        $this->db->where('id_pengajuan', $id_pengajuan);
        $this->db->update('tb_cuti');
    }

    public function reject()
    {
        $id_pengajuan = $this->input->post('id_pengajuan');
        
        $this->db->set('status', 2);
        $this->db->where('id_pengajuan', $id_pengajuan);
        $this->db->update('tb_cuti');
        
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
}
?>