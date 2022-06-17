<?php 
class Lembur extends CI_Controller
{
    public function index()
    {
        $id_pengajuan = $this->id_pengajuan();
        $level = $this->session->userdata('level');
        $nip = $this->session->userdata('nip');
        $lembur = '';
        if ($level == 'admin') {
            $lembur = $this->db->query("SELECT a.*, b.nama
            FROM tb_lembur a 
            left JOIN pegawai b ON b.nip = a.id_pegawai
            ORDER BY id asc")->result();
        } else {
            $lembur = $this->db->query("select a.*, b.nama from tb_lembur a join pegawai b on a.id_pegawai = b.nip where id_pegawai ='$nip'")->result();
        }
        $pgw = $this->db->query("select * from pegawai where status ='1'")->result();
        $pegawai = $this->db->query("select * from pegawai where status = 1 and nip = '$nip'")->row();
        $data = [
            'kode' => $id_pengajuan,
            'lembur' => $lembur,
            'pgw' => $pgw,
            'pegawai' => $pegawai,
            'role' => $level
        ];
        $this->template->load('template', 'pengajuan/hrd/pengajuan_lembur/index', $data);
    }

    public function save()
    {
        $id_pengajuan = $this->input->post('id_pengajuan');
        $tgl = $this->input->post('tgl');
        $nama = $this->input->post('nama');
        $nip = $this->input->post('nip');
        $jam = $this->input->post('jam');

        $perjam = 20000;
        $total_nominal_lembur = $perjam * $jam;

        $data = [
            'id_pengajuan' => $id_pengajuan,
            'tgl_pengajuan' => $tgl,
            'id_pegawai' => $nip,
            'total_jam' => $jam,
            'nominal_perjam' => $perjam,
            'total_nominal_lembur' => $total_nominal_lembur,
        ];

        $this->db->insert('tb_lembur', $data);

        redirect('Lembur');
    }

    public function accept()
    {
        $id_pengajuan = $this->input->post('id_pengajuan');
        $total = $this->input->post('nominal');
        
        $this->db->set('status', 1);
        $this->db->where('id_pengajuan', $id_pengajuan);
        $this->db->update('tb_lembur');

        // kirim ke db pengajuan jurnal 
        $pengajuan = [
            'kode' => $id_pengajuan,
            'tanggal' => date('Ymd'),
            'nominal' => $total,
            'jenis' => 'pengajuan lembur',
        ];
        $this->db->insert("pengajuan_jurnal", $pengajuan);
        
    }

    public function reject()
    {
        $id_pengajuan = $this->input->post('id_pengajuan');
        
        $this->db->set('status', 2);
        $this->db->where('id_pengajuan', $id_pengajuan);
        $this->db->update('tb_lembur');
        
    }

    public function id_pengajuan()
    {
        $query1   = "SELECT MAX(RIGHT(id_pengajuan,3)) as kode FROM tb_lembur";
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
        $kode   = "LMBR".date('Ymd').$kd;
        return $kode;
    }
}
?>