<?php 
class Pengeluaran_kas extends CI_Controller
{
    public function index()
    {
        $kode = $this->kode();
        $list = $this->db->get('pengeluaran_kas')->result();
        $aktivitas = $this->db->get('aktivitas')->result();

        $this->db->where('header', 5);
        $beban = $this->db->get('coa')->result();
        // print_r($beban);exit;
        $data = [
            'kode' => $kode,
            'list' => $list,
            'beban' => $beban,
            'aktivitas' => $aktivitas
        ];
        $this->template->load('template', 'pengeluaran_kas/index', $data);
    }

    public function save()
    {
        $id_pengeluaran = $this->input->post('id_pengeluaran');
        $tgl = $this->input->post('tgl');
        $sumber_pmb = $this->input->post('sumber_pmb');
        $beban = $this->input->post('beban');
        $jenis_pmb = $this->input->post('jenis_pmb');
        $nominal = $this->input->post('nominal');

        $this->db->where('nama_coa', $beban);
        $get_no_coa = $this->db->get('coa')->row()->no_coa;

        $data = [
            'id_pengeluaran' => $id_pengeluaran,
            'tanggal' => $tgl,
            'sumber_pengeluaran' => $sumber_pmb,
            'jenis_pengeluaran' => $beban,
            'jenis_pembayaran' => $jenis_pmb,
            'nominal' => $nominal,
        ];
        $this->db->insert('pengeluaran_kas', $data);

        $j_d = [
            'id_jurnal' => $id_pengeluaran,
            'tgl_jurnal' => date('Y-m-d'),
            'no_coa' => $get_no_coa,
            'posisi_dr_cr' => 'd',
            'nominal' => $nominal,
        ];
        $this->db->insert('jurnal', $j_d);

        $j_k = [
            'id_jurnal' => $id_pengeluaran,
            'tgl_jurnal' => date('Y-m-d'),
            'no_coa' => 1111,
            'posisi_dr_cr' => 'k',
            'nominal' => $nominal,
        ];
        $this->db->insert('jurnal', $j_k);

        // insert ke buku pembantu kas
        $bpk = [
            'id_ref' => $id_pengeluaran,
            'tanggal' => date('Y-m-d'),
            'nominal' => $nominal,
            'kd_coa' => 1111,
            'posisi_dr_cr' => 'k',
            'keterangan' => $sumber_pmb,
        ];
        $this->db->insert('buku_pembantu_kas', $bpk);

        redirect('Pengeluaran_kas');
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
                $this->db->query("UPDATE pengeluaran_kas SET bukti_trf = '$foto' WHERE id = '$id'");
			}
		}
        redirect('Pengeluaran_kas');
    }

    public function kode()
    {
        $query1   = "SELECT MAX(RIGHT(id_pengeluaran,3)) as kode FROM pengeluaran_kas ";
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
        $kode   = "PNG".date('Ymd').$kd;
        return $kode;
    }
}
?>