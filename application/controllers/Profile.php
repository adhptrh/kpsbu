<?php class Profile extends CI_Controller
{
    public function index()
    {
        $name = $this->session->userdata('nama_lengkap');

        $this->db->where('nama', $name);
        $pegawai = $this->db->get('pegawai')->row();

        $nip = $this->session->userdata('nip');
        $this->db->where('id_pegawai', $nip);
        $lembur = $this->db->get('tb_lembur')->result();

        $this->db->where('nm_pegawai', $name);
        $penggajian = $this->db->get('tb_penggajian')->result();
        $data = [
            'user' => $pegawai,
            'lembur' => $lembur,
            'penggajian' => $penggajian,
            'nama' => $name
        ];
        $this->template->load('template', 'profile/index', $data);
    }

    public function slipgaji($id_gaji)
    {
        $query = $this->db->query("SELECT a.nm_pegawai, a.tanggal, c.nip, b.*
        FROM tb_penggajian a 
        JOIN tb_detail_penggajian b ON a.id_penggajian = b.id_penggajian
        JOIN pegawai c ON c.nama = a.nm_pegawai
        WHERE b.id_penggajian = '$id_gaji'
        ")->row();
        $data = [
            'pegawai' => $query
        ];
        $this->load->library('pdf');
        $this->pdf->setPaper('a4', 'potrait');
        $this->pdf->filename = "slip-gaji.pdf";
        $this->pdf->load_view('profile/slipgaji_pdf', $data);
    }

    public function detailSlipGaji()
    {
        $name = $this->session->userdata('nama_lengkap');
        $bulan = $this->input->post('bulan');
        $tahun = $this->input->post('tahun');
        $periode = $tahun .'-'. $bulan;
        $query = $this->db->query("select * from tb_penggajian where left(tanggal, 7) = '$periode' and nm_pegawai = '$name'")->result();
        echo json_encode($query);
    }
}
?>