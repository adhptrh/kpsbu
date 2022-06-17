<?php
class Shift extends CI_Controller
{
    public function __construct() {
        parent::__construct();
        $this->load->model(array(
            'm_masterdata' => 'master',
        ));
    }
    public function index()
    {
        $data = [
            'pegawai' => $this->master->cek_pegawai()->result(),
            'shift' => $this->db->get('shift')->result(),
            'list' => $this->master->shift()->result(),
        ];
        $this->template->load('template', 'shift/index', $data);
    }

    public function add()
    {
        $user_id = $this->session->username;
        $pegawai = $this->input->post('pegawai');
        $shift = $this->input->post('shift');
        $tgl_awal = $this->input->post('tgl_awal');
        $tgl_akhir = $this->input->post('tgl_akhir');
        $desc = $this->input->post('desc');

        $data = [];
        foreach ($pegawai as $key => $value) {
            # code...
            $data[] = [
                'id_pegawai' => $pegawai[$key],
                'id_shift' => $shift,
                'tgl_awal' => $tgl_awal,
                'tgl_akhir' => $tgl_akhir,
                'desc' => $desc,
                'create_by' => $user_id,
            ];
        }
        // print_r($data);exit;
        $this->db->insert_batch('jadwal_shift', $data);
        redirect('Shift');
    }

    public function set_done($id)
    {
        $arr = [
            'is_complete' => 1
        ];
        $this->db->trans_start();
        $this->db->where('id_pegawai', $id);
        $this->db->update('jadwal_shift', $arr);
        $this->db->trans_complete();

        if ($this->db->trans_status() === TRUE) {
            $info = [
                'status' => true, 
                'info' => 'Berhasil diupdate.'
            ];
        } else {
            # code...
            $info = [
                'status' => false, 
                'info' => 'Gagal diupdate.'
            ];
        }
        
        json_encode($info);
    }
}
?>