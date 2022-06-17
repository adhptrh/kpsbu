<?php class Pengajuan extends CI_Controller
{
    public function __construct() {
        parent::__construct();
        $this->load->model('m_masterdata', 'M_masterdata');
    }

    public function index()
    {
        // $this->db->where('jml >', 0);
        $barang = $this->db->get('waserda_produk')->result();
        $list = $this->db->get('waserda_pengajuan_barang')->result();
        $data = [
            'barang' => $barang,
            'list' => $list,
        ];
        $this->template->load('template', 'pengajuan/index', $data);
    }

    public function save()
    {
        $tgl_pengajuan = date('Y-m-d H:i:s', strtotime($this->input->post('tgl')));
        $nama = $this->input->post('nama');
        $jumlah = $this->input->post('jumlah');
        $desc = $this->input->post('desc');

        $data = [
            'tanggal_pengajuan' => $tgl_pengajuan,
            'nama_barang' => $nama,
            'jumlah' => $jumlah,
            'deskripsi' => $desc,
        ];
        // print_r($data);exit;
        $this->db->insert('waserda_pengajuan_barang', $data);

        redirect('Pengajuan');
    }

    public function action($action, $id)
    {
        if ($action == 'acc') {
            # code...
            $data = [
                'status' => 'Approved'
            ];
        } else {
            $data = [
                'status' => 'Refused'
            ];
        }
        $this->db->where('id', $id);
        $data = $this->db->update('waserda_pengajuan_barang', $data);

        if ($data) {
            # code...
            echo json_encode($data);
        }
    }

    /** untuk pengajuan bonus */
    public function pengajuanBonus()
    {
        $kode = $this->M_masterdata->id_pengajuan_bonus();
        $pegawai = $this->db->query("select * from pegawai where status = '1'")->result();
        // $detail = $this->db->query("SELECT b.*, c.nama          
        // FROM pengajuan_bonus a      
        // JOIN tb_detail_pengajuan_bonus b
        // JOIN pegawai c ON c.nip = b.nip
        // -- WHERE b.id_pengajuan = 'PENGAJUANBONUS050622002'
        // GROUP BY nip, nama   
        // ORDER BY a.id_pengajuan DESC")->result();
        $detail = $this->db->get('tb_detail_pengajuan_bonus')->result();
        $list = $this->db->get('pengajuan_bonus')->result();
        $data = [
            'kode' => $kode,
            'pegawai' => $pegawai,
            'list' => $list, 
            'detail' => $detail
        ];
        $this->template->load('template', 'pengajuan/hrd/pengajuan_bonus/index', $data);
    }

    public function savePengajuanBonus()
    {
        $id_pengajuan = $this->input->post('id_pengajuan');
        $periode = $this->input->post('tgl');
        $nama_pegawai = $this->input->post('nama'); // nama pegawai
        $nominal = $this->input->post('jumlah');
        $keterangan = $this->input->post('desc');

        $grandtotal = 0;
        foreach ($nama_pegawai as $key => $value) {
            $data = [
                'id_pengajuan' => $id_pengajuan,
                'nip' => $nama_pegawai[$key],
                'nominal' => $nominal,
            ];
            $this->db->insert('tb_detail_pengajuan_bonus', $data);
        }

        $pengajuan_bonus = [
            'id_pengajuan' => $id_pengajuan, 
            'periode' => $periode,
            'keterangan' => $keterangan, 
        ];
        $this->db->insert("pengajuan_bonus", $pengajuan_bonus);

        Redirect("Pengajuan/pengajuanBonus");
    }

    public function detail_bonus()
    {
        $id_pengajuan = $this->input->post('id_pengajuan');
        $detail = $this->db->query("SELECT b.*, c.nama          
        FROM pengajuan_bonus a      
        JOIN tb_detail_pengajuan_bonus b
        JOIN pegawai c ON c.nip = b.nip
        WHERE b.id_pengajuan = '$id_pengajuan'
        GROUP BY nip, nama   
        ORDER BY a.id_pengajuan DESC")->result();
        echo json_encode($detail);
    }
}
?>