<?php class Produk extends CI_Controller
{
    public function __construct() {
        parent::__construct();
        $this->load->model(array(
            'm_masterdata' => 'master',
            'crud_model' => 'crud',
            'Produk_model' => 'produk'
        ));
    }

    public function index()
    {
        $data = [
            'produk' => $this->produk->get_produk()->result(),
            'kode' => $this->master->kode_produk(),
            'kategori' => $this->db->get('waserda_kategori')->result(),
            'supplier' => $this->db->get('waserda_supplier')->result(),
        ];
        // print_r($data);exit;
        $this->template->load('template', 'waserda/produk/index', $data);
    }

    public function save()
    {
        $data = [
            'kode' => $this->input->post('kode'),
            'barcode_id' => $this->input->post('barcode'),
            'id_supplier_produk' => $this->input->post('supplier'),
            'id_kategori' => $this->input->post('kategori'),
            'nama_produk' => $this->input->post('produk'),
            'harga_satuan' => $this->input->post('harga'),
            'harga_jual' => $this->input->post('harga_jual'),
            'satuan_produk' => $this->input->post('satuan'),
        ];
        $this->crud->input_data($data, 'waserda_produk');
        $this->session->set_flashdata('notif', '<div class="alert alert-success">Data berhasil disimpan.</div>');
        redirect('Produk');
    }

    public function edit_produk()
    {
        $id = $this->input->post('id');
        $kode = $this->input->post('kode');
        $barcode = $this->input->post('barcode');
        $produk = $this->input->post('produk');
        $harga = $this->input->post('harga');
        $harga_jual = $this->input->post('harga_jual');

        $data = [
            'barcode_id' => $barcode, 
            'nama_produk' => $produk, 
            'harga_satuan' => $harga, 
            'harga_jual' => $harga_jual, 
        ];
        $this->db->where('id', $id);
        $this->db->update('waserda_produk', $data);
        redirect('Produk');
    }

    public function ubah_status()
    {
        $id = $this->input->post('id');
        $data = [
            'status' => 0
        ];
        $this->db->where('id', $id);
        $data = $this->db->update('waserda_produk', $data);

        echo json_encode($data);
    }
}
?>