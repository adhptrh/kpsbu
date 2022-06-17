<?php class Kategori extends CI_Controller
{
    public function __construct() {
        parent::__construct();
        $this->load->model(array(
            'm_masterdata' => 'master',
            'crud_model' => 'crud',
        ));
    }
    public function index()
    {
        /** buat query kategori */
        // $this->db->order_by(''); // disini lu jelasin order by apa
        $list = $this->db->get('waserda_kategori')->result();
        $data = [
            'list' => $list, // terus disini lu panggil $list nya
            'kode' => $this->master->kategori_code(),
        ];
        $this->template->load('template', 'waserda/kategori/index', $data);
    }

    public function save()
    {
        $data = [
            'kode' => $this->input->post('kode'),
            'deskripsi' => $this->input->post('desc'),
        ];
        $this->crud->input_data($data, 'waserda_kategori');
        $this->session->set_flashdata('notif', '<div class="alert alert-success">Data berhasil disimpan.</div>');
        redirect('Kategori');
    }

    public function ubah()
    {
        $kode = $this->input->post('kode');
        $data = [
            'deskripsi' => $this->input->post('desc'),
        ];
        $where = [
            'kode' => $kode
        ];
        $this->crud->update($where, $data, 'waserda_kategori');

        $this->session->set_flashdata('notif_ubah', '<div class="alert alert-success">Data berhasil diubah.</div>');

        redirect('Kategori');

    }
}
?>