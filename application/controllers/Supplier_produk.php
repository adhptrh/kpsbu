<?php class Supplier_produk extends CI_Controller
{
    function __construct() {
        parent::__construct();
        $this->load->model('Supplier_model');
        $this->load->model('crud_model');
    }

    public function index()
    {
        $data['kode'] = $this->Supplier_model->kode();
        $data['supplier'] = $this->db->get('waserda_supplier')->result();
        $this->template->load('template', 'waserda/supplier/index', $data);
    }

    public function save()
    {
        $kode = $this->input->post('kode');
        $supplier = $this->input->post('supplier');
        $alamat = $this->input->post('alamat');
        $no_telp = $this->input->post('no_telp');

        $data = [
            'kode' => $kode,
            'nama' => ucwords($supplier),
            'alamat' => $alamat,
            'no_telp' => $no_telp,
        ];
        $save = $this->db->insert('waserda_supplier', $data);

        if ($save) {
            # code...
            $this->session->set_flashdata('notif', '<div class="alert alert-success">Data berhasil disimpan.</div>');
            redirect('Supplier_produk');
        } else {
            $this->session->set_flashdata('notif', '<div class="alert alert-warning">Data gagal disimpan.</div>');
            redirect('Supplier_produk');
        }
    }

    public function ubah()
    {
        $kode = $this->input->post('kode');
        $data = [
            'nama' => ucwords($this->input->post('supplier')),
            'alamat' => $this->input->post('alamat'),
            'no_telp' => $this->input->post('no_telp'),
        ];
        $where = [
            'kode' => $kode
        ];
        $this->crud_model->update($where, $data, 'waserda_supplier');

        $this->session->set_flashdata('notif_ubah', '<div class="alert alert-success">Data berhasil diubah.</div>');

        redirect('Supplier_produk');

    }
}
?>