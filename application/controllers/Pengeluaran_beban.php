<?php class Pengeluaran_beban extends CI_Controller
{
    public function index()
    {
        $kode = $this->kode();
        $beban = $this->db->query("SELECT * FROM coa WHERE is_waserda = 1")->result();
        $list = $this->db->query("SELECT a.*, b.nama_coa 
        FROM waserda_pengeluaran_beban a 
        JOIN coa b ON a.no_coa = b.no_coa")->result();

        $data = [
            'kode' => $kode,
            'beban' => $beban,
            'list' => $list,
        ];
        $this->template->load('template', 'pengeluaran_beban/index', $data);
    }

    public function save()
    {
        $id_pengeluaran = $this->input->post('id_pengeluaran');
        $tgl = $this->input->post('tgl');
        $no_coa = $this->input->post('no_coa');
        $keterangan = $this->input->post('keterangan');
        $nominal = $this->input->post('nominal');

        $data = [
            'id_pengeluaran' => $id_pengeluaran,  
            'tgl_pengeluaran' => $tgl,  
            'no_coa' => $no_coa,  
            'keterangan' => $keterangan,  
            'nominal' => $nominal,  
        ];
        $this->db->insert('waserda_pengeluaran_beban', $data);

        // kirim ke db pengajuan jurnal 
        $pengajuan = [
            'kode' => $id_pengeluaran,
            'tanggal' => $tgl,
            'nominal' => $nominal,
            'jenis' => 'pengeluaran_beban',
        ];
        $this->db->insert("pengajuan_jurnal", $pengajuan);

        redirect('Pengeluaran_beban');
    }

    public function kode()
    {
        $query1   = "SELECT MAX(RIGHT(id_pengeluaran,3)) as kode FROM waserda_pengeluaran_beban";
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
        $kode   = "PNGBBN".date('Ymd').$kd;
        return $kode;
    }
}
?>