<?php class DaftarPenerimaanPengeluaranKas extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model(array(
            "m_keuangan" => "M_keuangan",
        ));
        date_default_timezone_set('Asia/Jakarta');
        if (empty($this->session->userdata('level'))) {
            redirect('c_login/home');
        }
    }

    public function index()
    {
        $bulan = $this->input->post('bulan');
        $tahun = $this->input->post('tahun');

        $periode = $tahun.$bulan;

        $detail = $this->db->query("SELECT * FROM detail_penerimaan_pengeluaran_kas")->result();
        if (isset($periode)) {
            $list = $this->db->query("select * from penerimaan_pengeluaran_kas where periode = '$periode'")->result();
            $data = [
                'list' => $list, 
                'periode' => $periode,
                'detail' =>$detail
            ];
            $this->template->load('template', 'daftar_penerimaan_pengeluaran/index', $data);
        } else {
            $list = $this->db->query("select * from penerimaan_pengeluaran_kas where periode = ''")->result();
            $data = [
                'list' => $list, 
                'periode' => '',
                'detail' =>$detail
            ];
            $this->template->load('template', 'daftar_penerimaan_pengeluaran/index', $data);
        }
        

    }

    public function tambah()
    {
        $aktivitas = $this->db->get('aktivitas')->result();
        $coa = $this->db->get('coa')->result();
        $data = [
            'aktivitas' => $aktivitas,
            'coa' => $coa,
        ];
        $this->template->load('template', 'daftar_penerimaan_pengeluaran/tambah', $data);
    }

    public function getCoa()
    {
        $post = $this->input->post('no_coa');
        $list = $this->db->query("select * from coa where no_coa = '$post'")->row();
        echo json_encode($list);
    }

    public function simpan()
    {
        $periode = $this->input->post('periode');
        $tanggal = $this->input->post('tanggal');
        $no_dokumen = $this->input->post('no_dokumen');
        $jenis_transaksi = $this->input->post('jenis_transaksi');
        $tipe_pembayaran = $this->input->post('tipe_pembayaran');
        $deskripsi = $this->input->post('deskripsi');
        $upload_file = $this->input->post('upload_file');
        $no_coa = $this->input->post('no_coa');
        $nama_coa = $this->input->post('nama_coa');
        $nama_aktivitas = $this->input->post('nama_aktivitas');
        $nominal = $this->input->post('nominal');
        $posisi_dc = $this->input->post('posisi_dc');

        $config['upload_path']          = './uploads/';
        $config['allowed_types']        = '*';
        $config['file_name']            = "PenerimaanPengeluaranKas_".$this->input->post("no_dokumen");
        $config['overwrite']            = true;
        $this->load->library('upload', $config);
        $file = $this->upload->do_upload('upload_file');
        $namafile = "PenerimaanPengeluaranKas_".$this->input->post("no_dokumen").$this->upload->file_ext;
        if ($file) {
        } else {
        echo $this->upload->display_errors();
        $namafile = "-";
        }
        
        $total_kas = 0;
        /** INSERT KE TABEL DETAIL */
        foreach ($no_coa as $key => $value) {
            # code...
            $detail = [
                'no_dokumen' => $no_dokumen,
                'no_coa' => $no_coa[$key],
                'nama_coa' => $nama_coa[$key],
                'aktivitas' => $nama_aktivitas[$key],
                'nominal' => $nominal[$key],
                'posisi_dc' => $posisi_dc[$key],
            ];
            $this->db->insert('detail_penerimaan_pengeluaran_kas', $detail);

            /** insert ke jurnal */
            $jurnal = array(
                'id_jurnal' => $no_dokumen,
                'tgl_jurnal' => date('Y-m-d'),
                'no_coa' => $no_coa[$key],
                'posisi_dr_cr' => $posisi_dc[$key],
                'nominal' => $nominal[$key],
            );
            $this->db->insert('jurnal', $jurnal);

            if ($no_coa[$key] == '1111') {
                $data = [
                    "id_ref"=>$no_dokumen,
                    "tanggal"=>date("Y-m-d"),
                    "nominal"=>$nominal[$key],
                    "kd_coa"=>'1111',
                    "posisi_dr_cr"=>$posisi_dc[$key],
                    "keterangan"=>$deskripsi,
                ];
                $this->db->insert('buku_pembantu_kas', $data);
            }

        }

        /** INSERT KE TB TRANSAKSI BIASA */
        $data = [
            'periode' => $periode,
            'tanggal' => $tanggal,
            'no_dokumen' => $no_dokumen,
            'jenis_transaksi' => $jenis_transaksi,
            'tipe_pembayaran' => $tipe_pembayaran,
            'deskripsi' => $deskripsi,
            'file' =>  $namafile,
        ];
        $this->db->insert('penerimaan_pengeluaran_kas', $data);
        redirect('DaftarPenerimaanPengeluaranKas');
    }
}
?>