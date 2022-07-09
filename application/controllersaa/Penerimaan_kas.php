<?php 
class Penerimaan_kas extends CI_Controller
{
    public function index()
    {
        $kode = $this->kode();
        $list = $this->db->get('penerimaan_kas')->result();
        $aktivitas = $this->db->get('aktivitas')->result();

        $this->db->where('is_penerimaan', 1);
        $coa = $this->db->get('coa')->result();
        // print_r($beban);exit;
        $data = [
            'kode' => $kode,
            'list' => $list,
            'coa' => $coa,
            'aktivitas' => $aktivitas
        ];
        $this->template->load('template', 'penerimaan_kas/index', $data);
    }

    public function save()
    {
        $id_penerimaan = $this->input->post('id_penerimaan');
        $tgl = $this->input->post('tgl');
        $sumber = $this->input->post('sumber');
        $coa = $this->input->post('jenis_penerimaan');
        $jenis_pmb = $this->input->post('jenis_pmb');
        $nominal = $this->input->post('nominal');

        $this->db->where('nama_coa', $coa);
        $get_no_coa = $this->db->get('coa')->row()->no_coa;

        $data = [
            'id_penerimaan' => $id_penerimaan,
            'tanggal' => $tgl,
            'sumber' => $sumber,
            'jenis_penerimaan' => $coa,
            'jenis_pembayaran' => $jenis_pmb,
            'nominal' => $nominal,
        ];
        // print_r($data);exit;
        $this->db->insert('penerimaan_kas', $data);

        $j_d = [
            'id_jurnal' => $id_penerimaan,
            'tgl_jurnal' => date('Y-m-d'),
            'no_coa' => 1111,
            'posisi_dr_cr' => 'd',
            'nominal' => $nominal,
        ];
        $this->db->insert('jurnal', $j_d);

        $j_k = [
            'id_jurnal' => $id_penerimaan,
            'tgl_jurnal' => date('Y-m-d'),
            'no_coa' => $get_no_coa,
            'posisi_dr_cr' => 'k',
            'nominal' => $nominal,
        ];
        $this->db->insert('jurnal', $j_k);

        // insert ke buku pembantu kas
        $bpk = [
            'id_ref' => $id_penerimaan,
            'tanggal' => date('Y-m-d'),
            'nominal' => $nominal,
            'kd_coa' => 1111,
            'posisi_dr_cr' => 'd',
            'keterangan' => $sumber,
        ];
        $this->db->insert('buku_pembantu_kas', $bpk);

        redirect('Penerimaan_kas');
    }

    public function upload()
    {
        $id = $this->input->post('id');

        if(!empty($_FILES['bukti']['name'])) {
			$config['upload_path']          = './uploads/';
			$config['allowed_types']        = 'jpg|png|jpeg';
			$config['max_size']             = 100000000;
			$config['max_width']            = 100000000;
			$config['max_height']           = 100000000;

			$this->load->library('upload', $config);
			$doUpload = $this->upload->do_upload('bukti');
            // print_r($doUpload);exit;
			if ($doUpload) {
				# code...
				$foto = $this->upload->data();
				$foto = $foto['file_name'];
                $this->db->query("UPDATE penerimaan_kas SET bukti_trf = '$foto' WHERE id = '$id'");
			}
		}
        redirect('Penerimaan_kas');
    }

    public function kode()
    {
        $query1   = "SELECT MAX(RIGHT(id_penerimaan,3)) as kode FROM penerimaan_kas ";
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
        $kode   = "PNRM".date('Ymd').$kd;
        return $kode;
    }
}
?>