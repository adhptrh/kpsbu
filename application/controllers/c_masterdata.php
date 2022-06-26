<?php
class c_masterdata extends CI_controller
{

   function __construct()
   {
      parent::__construct();
      date_default_timezone_set('Asia/Jakarta');
      $this->load->model(array(
         "m_bank" => "M_bank",
      ));
      if (empty($this->session->userdata('level'))) {
         redirect('c_login/home');
      }
   }
   public function beranda()
   {


      $this->template->load('template', 'beranda');
   }
   public function lihat_coa()
   {

      $this->db->order_by('no_coa ASC');
      $data['result'] = $this->db->get('coa')->result_array();
      // print_r($data['result']);exit;
      $this->template->load('template', 'coa/view', $data);
   }

   public function form_coa()
   {


      //  $data['bahan_baku'] = $this->db->get('bahan_baku')->result_array();
      $this->template->load('template', 'coa/form');
   }

   public function edit_form_coa($id)
   {

      $this->db->where('no_coa =', $id);
      $data['coa'] = $this->db->get('coa')->row();

      $this->template->load('template', 'coa/edit_form', $data);
      // var_dump($data);
   }

   public function isi_edit_COA()
   {

      $no_coa = $this->input->post('no_coa');
      $nama_coa = $this->input->post('nama_coa');
      $posisi_dr_cr = $this->input->post('posisi_dr_cr');
      // $saldo_awal = str_replace('.', '', $this->input->post('saldo_awal'));
      $saldo_awal = $this->input->post('saldo_awal');
      $data = [
         'no_coa' => $no_coa,
         'nama_coa' => $nama_coa,
         'saldo_awal' => $saldo_awal,
         'saldo_normal' => $posisi_dr_cr,
      ];
      // print_r($data);exit;
      $this->db->where('no_coa', $no_coa);
      $this->db->update('coa', $data);
      redirect('c_masterdata/lihat_coa');
   }

   public function tambah_coa()
   {


      $config = array(

         array(
            'field' => 'no_coa',
            'label' => 'Nomor Akun',
            'rules' => 'required|is_natural|min_length[3]|max_length[11]|is_unique[coa.nama_coa]',
            'errors' => array(
               'required' => '%s tidak boleh kosong!',
               'min_length' => '%s minimal 3 huruf!',
               'max_length' => '%s maksimal 11 huruf!',
               'is_natural' => '%s tidak boleh minus!',
               'is_unique' => '%s sudah ada didatabase!'
            )
         ),
         array(
            'field' => 'nama_coa',
            'label' => 'Nama Akun',
            'rules' => 'required|min_length[3]|max_length[50]',
            'errors' => array(
               'required' => '%s tidak boleh kosong!',
               'min_length' => '%s minimal 3 huruf!',
               'max_length' => '%s maksimal 50 huruf!'
            )
         )
      );
      $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
      $this->form_validation->set_rules($config);

      if ($this->form_validation->run() == FALSE) {
         $this->form_coa();
      } else {

         $data = array(
            'no_coa' => $_POST['no_coa'],
            'nama_coa' => $_POST['nama_coa'],
            'saldo_awal' => $_POST['saldo_awal'],
            'header' => substr($_POST['no_coa'], 0, 1),
            'saldo_normal' => $_POST['posisi_dr_cr'],
         );

         $this->M_masterdata->tambah_data('coa', $data);
         redirect('c_masterdata/lihat_coa');
      }
   }

   //bahan baku

   public function lihat_bb()
   {


      $data['result'] = $this->db->get('bahan_baku')->result_array();
      $this->template->load('template', 'bb/view', $data);
   }
   public function form_bb()
   {


      $query1   = "SELECT  MAX(RIGHT(no_bb,3)) as kode FROM bahan_baku";
      $abc      = $this->db->query($query1);
      $no_trans = "";
      if ($abc->num_rows() > 0) {
         foreach ($abc->result() as $k) {
            $tmp = ((int) $k->kode) + 1;
            $kd  = sprintf("%03s", $tmp);
         }
      } else {
         $kd = "001";
      }
      $no_trans   = "BB_" . $kd;
      $data['id'] = $no_trans;
      $this->template->load('template', 'bb/form', $data);
   }

   public function tambah_bb()
   {


      $config = array(

         array(
            'field' => 'nama_bb',
            'label' => 'Nama Bahan Baku',
            'rules' => 'required|min_length[3]|max_length[30]|is_unique[bahan_baku.nama_bb]',
            'errors' => array(
               'required' => '%s tidak boleh kosong!',
               'min_length' => '%s minimal 3 huruf!',
               'max_length' => '%s maksimal 30 huruf!',
               'customAlpha' => '%s hanya boleh berupa huruf!',
               'is_unique' => '%s sudah ada di database!'
            )
         ),

         array(
            'field' => 'satuan',
            'label' => 'Satuan',
            'rules' => 'required',
            'errors' => array(
               'required' => 'Inputan Salah'
            )
         )
      );
      $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
      $this->form_validation->set_rules($config);

      if ($this->form_validation->run() == FALSE) {
         $this->form_bb();
      } else {
         $data = array(
            'no_bb' => $_POST['no_bb'],
            'nama_bb' => $_POST['nama_bb'],
            'stok' => 0,
            'satuan' => $_POST['satuan']
         );
         $this->db->insert('bahan_baku', $data);

         redirect('c_masterdata/lihat_bb');
      }
   }

   public function isi_edit_bb($id)
   {



      $x['data'] = $this->M_masterdata->edit_data('bahan_baku', "no_bb = '$id'")->row_array();
      $this->template->load('template', 'bb/update', $x);
   }
   public function edit_bb()
   {

      $config = array(

         array(
            'field' => 'nama_bb',
            'label' => 'Nama Bahan Baku',
            'rules' => 'required|callback_customAlpha|min_length[3]|max_length[30]',
            'errors' => array(
               'required' => '%s tidak boleh kosong!',
               'min_length' => '%s minimal 3 huruf!',
               'max_length' => '%s maksimal 30 huruf!',
               'customAlpha' => '%s hanya boleh berupa huruf!'
            )
         ),

         array(
            'field' => 'satuan',
            'label' => 'Satuan',
            'rules' => 'required',
            'errors' => array(
               'required' => 'Inputan Salah',
               'in_list' => 'Inputan Salah'
            )
         )
      );
      $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
      $this->form_validation->set_rules($config);

      if ($this->form_validation->run() == FALSE) {
         $id = $_POST['no_bb'];
         $this->isi_edit_bb($id);
      } else {
         $no_bb   = $_POST['no_bb'];
         $nama_bb = $_POST['nama_bb'];
         $stok    = $_POST['stok'];
         $satuan  = $_POST['satuan'];

         $data = array(
            'nama_bb' => $nama_bb,
            'stok' => $stok,
            'satuan' => $satuan
         );

         $this->db->where('no_bb', $no_bb);
         $this->M_masterdata->update_data('bahan_baku', $data);
         redirect('c_masterdata/lihat_bb');
      }
   }

   //bahan dalam proses


   public function lihat_bdp()
   {


      $data['result'] = $this->db->get('bahan_dalam_proses')->result_array();
      $this->template->load('template', 'bdp/view', $data);
   }

   public function bank()
   {
      $bank = $this->db->query("SELECT * FROM bank")->result();
      $data = [
         "bank"=>$bank
      ];
      $this->template->load("template", "bank/data/index", $data);
   }

   public function form_bank() {
      $data = [
         "id"=>$this->M_bank->kd_bank()
      ];
      $this->template->load("template", "bank/data/form",$data);
   }

   public function simpan_bank() {
      $data = [
         "id_bank"=>$this->input->post("id_bank"),
         "nama_bank"=>$this->input->post("nama_bank"),
      ];
      $this->db->insert("bank",$data);
      redirect("c_masterdata/bank");
   }

   public function hapusBank($id) {
      $where = array("id" => $id);
      $this->M_masterdata->hapus_data("bank", $where);
      redirect("c_masterdata/bank");
   }

   public function isi_edit_bank($id) {
      $data = [
         "bank"=>$this->db->query("SELECT * FROM bank WHERE id = '$id'")->result()[0]
      ];
      $this->template->load("template", "bank/data/update", $data);
   }

   public function edit_bank() {
      $this->db->update("bank", [
         "nama_bank"=>$this->input->post("nama_bank")
      ], ["id_bank"=>$this->input->post("id_bank")]);
      redirect("c_masterdata/bank");
   }


   public function form_bdp()
   {


      $query1   = "SELECT  MAX(RIGHT(no_bdp,3)) as kode FROM bahan_dalam_proses";
      $abc      = $this->db->query($query1);
      $no_trans = "";
      if ($abc->num_rows() > 0) {
         foreach ($abc->result() as $k) {
            $tmp = ((int) $k->kode) + 1;
            $kd  = sprintf("%03s", $tmp);
         }
      } else {
         $kd = "001";
      }
      $no_trans   = "BDP_" . $kd;
      $data['id'] = $no_trans;
      $this->template->load('template', 'bdp/form', $data);
   }

   public function tambah_bdp()
   {
      $config = array(
         array(
            'field' => 'nama_bdp',
            'label' => 'Nama Bahan Dalam Proses',
            'rules' => 'required|callback_customAlpha|min_length[3]|max_length[30]|is_unique[bahan_dalam_proses.nama_bdp]',
            'errors' => array(
               'required' => '%s tidak boleh kosong!',
               'min_length' => '%s minimal 3 huruf!',
               'max_length' => '%s maksimal 30 huruf!',
               'customAlpha' => '%s hanya boleh berupa huruf!',
               'is_unique' => '%s sudah ada di database!'
            )
         ),
         array(
            'field' => 'satuan',
            'label' => 'Satuan',
            'rules' => 'required',
            'errors' => array(
               'required' => 'Inputan Salah'
            )
         )
      );
      $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
      $this->form_validation->set_rules($config);

      if ($this->form_validation->run() == FALSE) {
         $this->form_bdp();
      } else {
         $data = array(
            'no_bdp' => $_POST['no_bdp'],
            'nama_bdp' => $_POST['nama_bdp'],
            'stok' => 0,
            'satuan' => $_POST['satuan']
         );
         $this->db->insert('bahan_dalam_proses', $data);
         redirect('c_masterdata/lihat_bdp');
      }
   }

   public function isi_edit_bdp($id)
   {



      $x['data'] = $this->M_masterdata->edit_data('bahan_dalam_proses', "no_bdp = '$id'")->row_array();
      $this->template->load('template', 'bdp/update', $x);
   }
   public function edit_bdp()
   {
      $config = array(
         array(
            'field' => 'nama_bdp',
            'label' => 'Nama Bahan Dalam Proses',
            'rules' => 'required|callback_customAlpha|min_length[3]|max_length[30]',
            'errors' => array(
               'required' => '%s tidak boleh kosong!',
               'min_length' => '%s minimal 3 huruf!',
               'max_length' => '%s maksimal 30 huruf!',
               'customAlpha' => '%s hanya boleh berupa huruf!'
            )
         ),
         array(
            'field' => 'satuan',
            'label' => 'Satuan',
            'rules' => 'required',
            'errors' => array(
               'required' => 'Inputan Salah',
               'in_list' => 'Inputan Salah'
            )
         )
      );
      $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
      $this->form_validation->set_rules($config);

      if ($this->form_validation->run() == FALSE) {
         $id = $_POST['no_bdp'];
         $this->isi_edit_bdp($id);
      } else {
         $no_bdp   = $_POST['no_bdp'];
         $nama_bdp = $_POST['nama_bdp'];
         $stok    = $_POST['stok'];
         $satuan  = $_POST['satuan'];

         $data = array(
            'nama_bdp' => $nama_bdp,
            'stok' => $stok,
            'satuan' => $satuan
         );

         $this->db->where('no_bdp', $no_bdp);
         $this->M_masterdata->update_data('bahan_dalam_proses', $data);
         redirect('c_masterdata/lihat_bdp');
      }
   }

   //bahan penolong
   public function lihat_bp()
   {
      $data['result'] = $this->db->get('bahan_penolong')->result_array();
      $this->template->load('template', 'bp/view', $data);
   }
   public function form_bp()
   {
      $query1   = "SELECT  MAX(RIGHT(no_bp,3)) as kode FROM bahan_penolong";
      $abc      = $this->db->query($query1);
      $no_trans = "";
      if ($abc->num_rows() > 0) {
         foreach ($abc->result() as $k) {
            $tmp = ((int) $k->kode) + 1;
            $kd  = sprintf("%03s", $tmp);
         }
      } else {
         $kd = "001";
      }
      $no_trans   = "BP_" . $kd;
      $data['id'] = $no_trans;
      $this->template->load('template', 'bp/form', $data);
   }

   public function tambah_bp()
   {
      $config = array(

         array(
            'field' => 'nama_bp',
            'label' => 'Nama Bahan Penolong',
            'rules' => 'required|min_length[3]|max_length[30]|is_unique[bahan_penolong.nama_bp]',
            'errors' => array(
               'required' => '%s tidak boleh kosong!',
               'min_length' => '%s minimal 3 huruf!',
               'max_length' => '%s maksimal 30 huruf!',
               'customAlpha' => '%s hanya boleh berupa huruf!',
               'is_unique' => '%s sudah ada di database!'
            )
         ),
         array(
            'field' => 'satuan',
            'label' => 'Satuan',
            'rules' => 'required',
            'errors' => array(
               'required' => 'Inputan Salah'
            )
         )
      );
      $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
      $this->form_validation->set_rules($config);

      if ($this->form_validation->run() == FALSE) {
         $this->form_bp();
      } else {
         $data = array(
            'no_bp' => $_POST['no_bp'],
            'nama_bp' => $_POST['nama_bp'],
            'stok' => 0,
            'satuan' => $_POST['satuan']
         );
         $this->db->insert('bahan_penolong', $data);

         redirect('c_masterdata/lihat_bp');
      }
   }

   public function isi_edit_bp($id)
   {
      $x['data'] = $this->M_masterdata->edit_data('bahan_penolong', "no_bp = '$id'")->row_array();
      $this->template->load('template', 'bp/update', $x);
   }
   public function edit_bp()
   {

      $config = array(

         array(
            'field' => 'nama_bp',
            'label' => 'Nama Bahan Penolong',
            'rules' => 'required|min_length[3]|max_length[50]',
            'errors' => array(
               'required' => '%s tidak boleh kosong!',
               'min_length' => '%s minimal 3 huruf!',
               'max_length' => '%s maksimal 30 huruf!',
               'customAlpha' => '%s hanya boleh berupa huruf!'
            )
         ),

         array(
            'field' => 'satuan',
            'label' => 'Satuan',
            'rules' => 'required',
            'errors' => array(
               'required' => 'Inputan Salah'
            )
         )
      );
      $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
      $this->form_validation->set_rules($config);

      if ($this->form_validation->run() == FALSE) {
         $id = $_POST['no_bp'];
         $this->isi_edit_bp($id);
      } else {
         $no_bp   = $_POST['no_bp'];
         $nama_bp = $_POST['nama_bp'];
         $stok    = $_POST['stok'];
         $satuan  = $_POST['satuan'];

         $data = array(
            'nama_bp' => $nama_bp,
            'stok' => $stok,
            'satuan' => $satuan
         );

         $this->db->where('no_bp', $no_bp);
         $this->M_masterdata->update_data('bahan_penolong', $data);
         redirect('c_masterdata/lihat_bp');
      }
   }


   //PRODUK

   public function lihat_produk()
   {
      $data['result'] = $this->db->get('produk')->result_array();
      $this->template->load('template', 'produk/view', $data);
   }
   public function form_produk()
   {
      $query1   = "SELECT  MAX(RIGHT(no_produk,3)) as kode FROM produk";
      $abc      = $this->db->query($query1);
      $no_trans = "";
      if ($abc->num_rows() > 0) {
         foreach ($abc->result() as $k) {
            $tmp = ((int) $k->kode) + 1;
            $kd  = sprintf("%03s", $tmp);
         }
      } else {
         $kd = "001";
      }
      $no_trans   = "PR_" . $kd;
      $data['id'] = $no_trans;
      $data['jenis_penjualan'] = $this->db->get('jenis_penjualan')->result();
      $this->template->load('template', 'produk/form', $data);
   }

   public function tambah_produk()
   {
      $config = array(

         array(
            'field' => 'nama_produk',
            'label' => 'Nama Produk',
            'rules' => 'required|min_length[3]|max_length[30]|is_unique[produk.nama_produk]',
            'errors' => array(
               'required' => '%s tidak boleh kosong!',
               'min_length' => '%s minimal 3 huruf!',
               'max_length' => '%s maksimal 30 huruf!',
               'customAlpha' => '%s hanya boleh berupa huruf!',
               'is_unique' => '%s sudah ada di database!'
            )
         ),
         array(
            'field' => 'satuan',
            'label' => 'Satuan',
            'rules' => 'required',
            'errors' => array(
               'required' => 'Inputan Salah'
            )
         )
      );
      $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
      $this->form_validation->set_rules($config);

      if ($this->form_validation->run() == FALSE) {
         $this->form_produk();
      } else {
         $data = array(
            'no_produk' => $_POST['no_produk'],
            'nama_produk' => $_POST['nama_produk'],
            'stok' => $_POST['stok'],
            'harga_jual' => $_POST['harga_jual'],
            'satuan' => $_POST['satuan'],
            'id_jenis' => $_POST['jenis_penjualan'],
         );
         $this->db->insert('produk', $data);

         redirect('c_masterdata/lihat_produk');
      }
   }

   public function isi_edit_produk($id)
   {
      $x['data'] = $this->M_masterdata->edit_data('produk', "no_produk = '$id'")->row_array();
      $this->template->load('template', 'produk/update', $x);
   }
   public function edit_produk()
   {
      $config = array(
         array(
            'field' => 'nama_produk',
            'label' => 'Nama Produk',
            'rules' => 'required|callback_customAlpha|min_length[3]|max_length[30]|is_unique[produk.nama_produk]',
            'errors' => array(
               'required' => '%s tidak boleh kosong!',
               'min_length' => '%s minimal 3 huruf!',
               'max_length' => '%s maksimal 30 huruf!',
               'customAlpha' => '%s hanya boleh berupa huruf!',
               'is_unique' => '%s sudah ada di database!'
            )
         ),
         array(
            'field' => 'satuan',
            'label' => 'Satuan',
            'rules' => 'required',
            'errors' => array(
               'required' => 'Inputan Salah'
            )
         )
      );

      $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
      $this->form_validation->set_rules($config);

      if ($this->form_validation->run() == FALSE) {
         $id = $_POST['no_produk'];
         $this->isi_edit_produk($id);
      } else {
         $no_bb   = $_POST['no_produk'];
         $nama_bb = $_POST['nama_produk'];
         $stok = $_POST['stok'];


         $data = array(
            'nama_produk' => $nama_bb,
            'stok' => $stok,
            'satuan' => $_POST['satuan']
         );

         $this->db->where('no_produk', $no_bb);
         $this->db->update('produk', $data);
         // $this->M_masterdata->update_data('produk', $data);
         redirect('c_masterdata/lihat_produk');
      }
   }


   //PETERNAK
   public function lihat_peternak()
   {
      $this->db->select('peternak.*, tps.alamat as alamat_tps');
      $this->db->from('peternak');
      $this->db->join('tps', 'peternak.kd_tps = tps.kode_tps', 'left');
      // $this->db->where('is_deactive =', 0);
      $this->db->order_by('no_peternak', 'desc');
      $data['result'] = $this->db->get()->result_array();
      // print_r($data['result']);exit;
      $this->template->load('template', 'peternak/view', $data);
   }
   public function form_peternak()
   {
      $query1   = "SELECT  MAX(RIGHT(no_peternak,3)) as kode FROM peternak";
      $abc      = $this->db->query($query1);
      $no_trans = "";
      if ($abc->num_rows() > 0) {
         foreach ($abc->result() as $k) {
            $tmp = ((int) $k->kode) + 1;
            $kd  = sprintf("%03s", $tmp);
         }
      } else {
         $kd = "001";
      }
      $no_trans   = "PTRNK_" . $kd;
      $data['id'] = $no_trans;

      // $this->db->select("biaya");
      $this->db->where("kode_simpanan =", "JS-001");
      $simpanan_wajib = $this->db->get("simpanan")->row()->biaya;
      // $this->db->query($simpanan_wajib);
      // print_r($simpanan_wajib);exit;

      $data['tps'] = $this->db->get('tps')->result();

      $data['simpanan'] = $simpanan_wajib;
      // print_r($simpanan_wajib);exit;
      $this->template->load('template', 'peternak/form', $data);
   }

   public function tambah_peternak()
   {
      $config = array(

         array(
            'field' => 'nama_peternak',
            'label' => 'Nama Peternak',
            'rules' => 'required|callback_customAlpha|min_length[3]|max_length[30]',
            'errors' => array(
               'required' => '%s tidak boleh kosong!',
               'min_length' => '%s minimal 3 huruf!',
               'max_length' => '%s maksimal 30 huruf!',
               'customAlpha' => '%s hanya boleh berupa huruf!'
            )
         ),
         array(
            'field' => 'notel',
            'label' => 'No. Telepon',
            'rules' => 'required|is_natural',
            'errors' => array(
               'required' => '%s tidak boleh kosong!',
               'is_natural' => '%s harus angka!'
            )
         ),
         array(
            'field' => 'nm_peternakan',
            'label' => 'Nama Peternakan',
            'rules' => 'is_unique[peternak.nm_peternakan]',
            'errors' => array(
               'is_unique' => 'Punten, %s sudah ada nih'
            )
         ),
         array(
            'field' => 'alamat',
            'label' => 'Alamat',
            'rules' => 'required',
            'errors' => array(
               'required' => '%s tidak boleh kosong!'
            )
         )
      );
      $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
      $this->form_validation->set_rules($config);

      if ($this->form_validation->run() == FALSE) {
         $this->form_peternak();
      } else {
         $data = array(
            'no_peternak' => $_POST['no_peternak'],
            'nama_peternak' => $_POST['nama_peternak'],
            'notel' => $_POST['notel'],
            'alamat' => $_POST['alamat'],
            'deposit' => $_POST['deposit'],
            'kd_tps' => $_POST['tps'],
            'nm_peternakan' => $_POST['nm_peternakan'],
         );
         // print_r($data);exit;
         $this->db->insert('peternak', $data);

         // jurnal
         $debit = array(
            "id_jurnal" => "DP" . $_POST['no_peternak'],
            "tgl_jurnal" => date("Y-m-d"),
            "no_coa" => 1111,
            "posisi_dr_cr" => "d",
            "nominal" => $_POST['deposit'],
         );
         $this->db->insert("jurnal", $debit);

         $kredit = array(
            "id_jurnal" => "DP" . $_POST['no_peternak'],
            "tgl_jurnal" => date("Y-m-d"),
            "no_coa" => 3111,
            "posisi_dr_cr" => "k",
            "nominal" => $_POST['deposit'],
         );
         $this->db->insert("jurnal", $kredit);
         redirect('c_masterdata/lihat_peternak');
      }
   }

   public function deactive($id)
   {
      // $id = 'PTRNK_031';
      $sql = "SELECT sisa_pinjaman
      FROM peternak a
      INNER JOIN log_pinjaman b ON a.no_peternak = b.id_anggota
      WHERE no_peternak = '$id'
      ORDER BY tanggal_pinjaman DESC 
      LIMIT 1";
      $cek_sisa = $this->db->query($sql)->row();
      // print_r($cek_sisa);exit;

      if (empty($cek_sisa) or $cek_sisa->sisa_pinjaman == 0) {
         # code...
         $data = [
            'is_deactive' => 1
         ];
         $this->db->where('no_peternak', $id);
         $this->db->update('peternak', $data);

         $this->session->set_flashdata('message', '<p class="alert alert-success">Peternak berhasil di non-aktifkan.</p>');

         redirect('c_masterdata/lihat_peternak');
      } else {
         $this->session->set_flashdata('message', '<p class="alert alert-danger">Silahkan melunaskan pinjaman terlebih dahulu.</p>');
         redirect('c_masterdata/lihat_peternak');
      }
   }

   public function isi_edit_peternak($id)
   {
      $x['data'] = $this->M_masterdata->edit_data('peternak', "no_peternak = '$id'")->row_array();
      $x['tps'] = $this->db->get('tps')->result();
      // print_r($x['data']);exit;
      $this->template->load('template', 'peternak/update', $x);
   }
   public function edit_peternak()
   {

      $config = array(

         array(
            'field' => 'nama_peternak',
            'label' => 'Nama Peternak',
            'rules' => 'required|callback_customAlpha|min_length[3]|max_length[30]',
            'errors' => array(
               'required' => '%s tidak boleh kosong!',
               'min_length' => '%s minimal 3 huruf!',
               'max_length' => '%s maksimal 30 huruf!',
               'customAlpha' => '%s hanya boleh berupa huruf!'
            )
         ),
         array(
            'field' => 'notel',
            'label' => 'No. Telepon',
            'rules' => 'required',
            'errors' => array(
               'required' => '%s tidak boleh kosong!',
               'is_natural' => '%s harus angka!'
            )
         ),
         array(
            'field' => 'alamat',
            'label' => 'Alamat',
            'rules' => 'required',
            'errors' => array(
               'required' => '%s tidak boleh kosong!'
            )
         )



      );
      $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
      $this->form_validation->set_rules($config);

      if ($this->form_validation->run() == FALSE) {
         $id = $_POST['no_peternak'];
         $this->isi_edit_peternak($id);
      } else {
         $no_peternak   = $_POST['no_peternak'];
         $nama_peternak = $_POST['nama_peternak'];

         $data = array(
            'nama_peternak' => $nama_peternak,
            'notel' => $_POST['notel'],
            'alamat' => $_POST['alamat'],
            'kd_tps' => $_POST['tps'],
            'nm_peternakan' => $_POST['nm_peternakan']
         );

         $this->db->where('no_peternak', $no_peternak);
         $this->M_masterdata->update_data('peternak', $data);
         redirect('c_masterdata/lihat_peternak');
      }
   }


   //SUPPLIER BP

   public function lihat_supp_bp()
   {


      $data['result'] = $this->db->get('supplier_bp')->result_array();
      $this->template->load('template', 'supplier/view', $data);
   }
   public function form_supp_bp()
   {


      $query1   = "SELECT  MAX(RIGHT(no_supp_bp,3)) as kode FROM supplier_bp";
      $abc      = $this->db->query($query1);
      $no_trans = "";
      if ($abc->num_rows() > 0) {
         foreach ($abc->result() as $k) {
            $tmp = ((int) $k->kode) + 1;
            $kd  = sprintf("%03s", $tmp);
         }
      } else {
         $kd = "001";
      }
      $no_trans   = "SBP_" . $kd;
      $data['id'] = $no_trans;
      $this->template->load('template', 'supplier/form', $data);
   }

   public function tambah_supp_bp()
   {


      $config = array(

         array(
            'field' => 'nama_supp_bp',
            'label' => 'Nama Supplier',
            'rules' => 'required|callback_customAlpha|min_length[3]|max_length[30]|is_unique[supplier_bp.nama_supp_bp]',
            'errors' => array(
               'required' => '%s tidak boleh kosong!',
               'min_length' => '%s minimal 3 huruf!',
               'max_length' => '%s maksimal 30 huruf!',
               'customAlpha' => '%s hanya boleh berupa huruf!',
               'is_unique' => '%s sudah ada di database!'
            )
         ),
         array(
            'field' => 'notel',
            'label' => 'No. Telepon',
            'rules' => 'required',
            'errors' => array(
               'required' => '%s tidak boleh kosong!'
            )
         ),
         array(
            'field' => 'alamat',
            'label' => 'Alamat',
            'rules' => 'required',
            'errors' => array(
               'required' => '%s tidak boleh kosong!'
            )
         )
      );
      $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
      $this->form_validation->set_rules($config);

      if ($this->form_validation->run() == FALSE) {
         $this->form_supp_bp();
      } else {
         $data = array(
            'no_supp_bp' => $_POST['no_supp_bp'],
            'nama_supp_bp' => $_POST['nama_supp_bp'],
            'notel'        => $_POST['notel'],
            'alamat' => $_POST['alamat']
         );
         $this->db->insert('supplier_bp', $data);

         redirect('c_masterdata/lihat_supp_bp');
      }
   }

   public function isi_edit_supp_bp($id)
   {



      $x['data'] = $this->M_masterdata->edit_data('supplier_bp', "no_supp_bp = '$id'")->row_array();
      $this->template->load('template', 'supplier/update', $x);
   }
   public function edit_supp_bp()
   {

      $config = array(

         array(
            'field' => 'nama_supp_bp',
            'label' => 'Nama Supplier',
            'rules' => 'required|callback_customAlpha|min_length[3]|max_length[30]',
            'errors' => array(
               'required' => '%s tidak boleh kosong!',
               'min_length' => '%s minimal 3 huruf!',
               'max_length' => '%s maksimal 30 huruf!',
               'customAlpha' => '%s hanya boleh berupa huruf!'
            )
         ),
         array(
            'field' => 'notel',
            'label' => 'No. Telepon',
            'rules' => 'required',
            'errors' => array(
               'required' => '%s tidak boleh kosong!'
            )
         ),
         array(
            'field' => 'alamat',
            'label' => 'Alamat',
            'rules' => 'required',
            'errors' => array(
               'required' => '%s tidak boleh kosong!'
            )
         )



      );
      $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
      $this->form_validation->set_rules($config);

      if ($this->form_validation->run() == FALSE) {
         $id = $_POST['no_supp_bp'];
         $this->isi_edit_supp_bp($id);
      } else {
         $no_supp_bp   = $_POST['no_supp_bp'];
         $nama_supp_bp = $_POST['nama_supp_bp'];
         $notel        = $_POST['notel'];
         $alamat       = $_POST['alamat'];

         $data = array(
            'nama_supp_bp' => $nama_supp_bp,
            'notel' => $notel,
            'alamat' => $alamat
         );

         $this->db->where('no_supp_bp', $no_supp_bp);
         $this->M_masterdata->update_data('supplier_bp', $data);
         redirect('c_masterdata/lihat_supp_bp');
      }
   }

   //bop

   public function lihat_bop()
   {

      $this->db->where('tgl_bop', date('Y-m-d'));
      $data['cek'] = $this->db->get('bop')->result();
      $data['result'] = $this->db->get('bop')->result_array();
      $this->template->load('template', 'bop/view', $data);
   }
   public function form_bop()
   {
      date_default_timezone_set('Asia/Jakarta');
      $date = date('Y-m-d');

      $query1   = "SELECT  MAX(RIGHT(no_bop,3)) as kode FROM bop";
      $abc      = $this->db->query($query1);
      $no_trans = "";
      if ($abc->num_rows() > 0) {
         foreach ($abc->result() as $k) {
            $tmp = ((int) $k->kode) + 1;
            $kd  = sprintf("%03s", $tmp);
         }
      } else {
         $kd = "001";
      }
      $no_trans   = "BOP_" . $kd;
      $data['id'] = $no_trans;

      $this->template->load('template', 'bop/form', $data);
   }

   public function tambah_bop()
   {
      $config = array(

         array(
            'field' => 'tgl_bop',
            'label' => 'Tanggal',
            'rules' => 'required',
            'errors' => array(
               'required' => '%s tidak boleh kosong!'
            )
         )
      );
      $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
      $this->form_validation->set_rules($config);

      if ($this->form_validation->run() == FALSE) {
         $this->form_bop();
      } else {
         $data = array(
            'no_bop' => $_POST['no_bop'],
            'tgl_bop' => $_POST['tgl_bop'],
            'bulan' => '0',
            'tahun' => '0'
         );
         $this->db->insert('bop', $data);

         redirect('c_masterdata/lihat_bop');
      }
   }

   public function isi_edit_bop($id)
   {


      $x['jenis_bop'] = $this->db->get('jenis_bop')->result_array();
      $this->db->where('no_bop', $id);
      $tahun = $this->db->get('bop')->row()->tahun; //Mengambil tahun saat ini



      $this->db->where('no_bop', $id);
      $bulan = $this->db->get('bop')->row()->bulan; //Mengambil bulan saat ini
      $tgl_hari = $tahun . "-" . $bulan . "-01";

      $query = "SELECT b.no_jbop, a.no_bop, c.nama_jbop, harga, DAY(LAST_DAY(CONCAT(tahun,'-',bulan,'-01'))) as hari
         FROM bop a 
         JOIN detail_bop b ON b.no_bop = a.no_bop
         JOIN jenis_bop c ON c.no_jbop = b.no_jbop
         WHERE a.no_bop LIKE '" . $id . "'
         ORDER BY b.no_jbop ASC
      ";
      $x['result'] = $this->db->query($query)->result_array();

      $x['data'] = $this->M_masterdata->edit_data('bop', "no_bop = '$id'")->row_array();
      $this->template->load('template', 'bop/update', $x);
      // var_dump($x['result']);


   }
   public function edit_bop()
   {

      $config = array(

         array(
            'field' => 'no_jbop',
            'label' => 'Nama BOP',
            'rules' => 'required',
            'errors' => array(
               'required' => '%s tidak boleh kosong!'
            )
         )
         // ,
         // array(
         //    'field' => 'harga',
         //    'label' => 'Harga (bulanan)',
         //    'rules' => 'required|is_natural_no_zero|min_length[1]|max_length[11]',
         //    'errors' => array(
         //       'required' => '%s tidak boleh kosong!',
         //       'is_natural_no_zero' => '%s hanya berupa angka 1-9!',
         //       'min_length' => '%s minimal 3 huruf!',
         //       'max_length' => '%s maksimal 11 huruf!'
         //    )
         // )
      );
      $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
      $this->form_validation->set_rules($config);

      if ($this->form_validation->run() == FALSE) {
         $id = $_POST['no_bop'];
         $this->isi_edit_bop($id);
      } else {
         $no_bop   = $_POST['no_bop'];
         $no_jbop = $_POST['no_jbop'];
         $harga   = $_POST['harga'];

         $data = array(
            'no_bop' => $no_bop,
            'harga' => $harga,
            'no_jbop' => $no_jbop
         );

         $this->db->where(array('no_bop' => $_POST['no_bop'], 'no_jbop' => $_POST['no_jbop']));
         $cek =  $this->db->get('detail_bop')->num_rows();
         if ($cek == 0) {
            $this->db->insert('detail_bop', $data);
         } else {
            $this->db->set('harga', $_POST['harga'], FALSE);
            $this->db->where(array('no_bop' => $_POST['no_bop'], 'no_jbop' => $_POST['no_jbop']));
            $this->db->update('detail_bop');
         }
         redirect('c_masterdata/isi_edit_bop/' . $no_bop . '');
      }
   }

   public function hapus_bop($id, $id2)
   {
      $this->db->query("SET GLOBAL FOREIGN_KEY_CHECKS=0");
      $this->db->where('no_bop', $id);
      $this->db->where('no_jbop', $id2);
      $this->db->delete('detail_bop');
      $this->db->query("SET GLOBAL FOREIGN_KEY_CHECKS=1");

      redirect('c_masterdata/isi_edit_bop/' . $id . '');
   }

   //bopo

   public function lihat_bopo()
   {

      $this->db->where('tgl_bopo', date('Y-m-d'));
      $data['cek'] = $this->db->get('bopo')->result();
      $data['result'] = $this->db->get('bopo')->result_array();
      $this->template->load('template', 'bopo/view', $data);
   }
   public function form_bopo()
   {
      date_default_timezone_set('Asia/Jakarta');
      $date = date('Y-m-d');

      $query1   = "SELECT  MAX(RIGHT(no_bopo,3)) as kode FROM bopo";
      $abc      = $this->db->query($query1);
      $no_trans = "";
      if ($abc->num_rows() > 0) {
         foreach ($abc->result() as $k) {
            $tmp = ((int) $k->kode) + 1;
            $kd  = sprintf("%03s", $tmp);
         }
      } else {
         $kd = "001";
      }
      $no_trans   = "BOPO_" . $kd;
      $data['id'] = $no_trans;

      $this->template->load('template', 'bopo/form', $data);
   }

   public function tambah_bopo()
   {


      $config = array(

         array(
            'field' => 'tgl_bopo',
            'label' => 'Tanggal',
            'rules' => 'required',
            'errors' => array(
               'required' => '%s tidak boleh kosong!'
            )
         )
      );
      $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
      $this->form_validation->set_rules($config);

      if ($this->form_validation->run() == FALSE) {
         $this->form_bop();
      } else {
         $data = array(
            'no_bopo' => $_POST['no_bopo'],
            'tgl_bopo' => $_POST['tgl_bopo']
         );
         $this->db->insert('bopo', $data);

         redirect('c_masterdata/lihat_bopo');
      }
   }

   public function isi_edit_bopo($id)
   {


      // $this->db->where('no_bopo', $id);
      // $tahun = $this->db->get('bopo')->row()->tahun; //Mengambil tahun saat ini



      // $this->db->where('no_bopo', $id);
      // $bulan = $this->db->get('bopo')->row()->bulan; //Mengambil bulan saat ini
      // $tgl_hari = $tahun."-".$bulan."-01";

      $x['jenis_bop'] = $this->db->get('jenis_bop')->result_array();
      $query = "SELECT b.no_jbop, a.no_bopo, c.nama_jbop, harga
         FROM bopo a 
         JOIN detail_bopo b ON b.no_bopo = a.no_bopo
         JOIN jenis_bop c ON c.no_jbop = b.no_jbop
         WHERE a.no_bopo LIKE '" . $id . "'
         ORDER BY b.no_jbop ASC
      ";
      $x['result'] = $this->db->query($query)->result_array();

      $x['data'] = $this->M_masterdata->edit_data('bopo', "no_bopo = '$id'")->row_array();
      $this->template->load('template', 'bopo/update', $x);
      // var_dump($x['result']);


   }
   public function edit_bopo()
   {

      $config = array(

         array(
            'field' => 'no_jbop',
            'label' => 'Nama BOP',
            'rules' => 'required',
            'errors' => array(
               'required' => '%s tidak boleh kosong!'
            )
         )
         // ,
         // array(
         //    'field' => 'harga',
         //    'label' => 'Harga (bulanan)',
         //    'rules' => 'required|is_natural_no_zero|min_length[1]|max_length[11]',
         //    'errors' => array(
         //       'required' => '%s tidak boleh kosong!',
         //       'is_natural_no_zero' => '%s hanya berupa angka 1-9!',
         //       'min_length' => '%s minimal 3 huruf!',
         //       'max_length' => '%s maksimal 11 huruf!'
         //    )
         // )
      );
      $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
      $this->form_validation->set_rules($config);

      if ($this->form_validation->run() == FALSE) {
         $id = $_POST['no_bopo'];
         $this->isi_edit_bopo($id);
      } else {
         $no_bop   = $_POST['no_bopo'];
         $no_jbop = $_POST['no_jbop'];
         $harga   = $_POST['harga'];

         $data = array(
            'no_bopo' => $no_bop,
            'harga' => $harga,
            'no_jbop' => $no_jbop
         );

         $this->db->where(array('no_bopo' => $_POST['no_bopo'], 'no_jbop' => $_POST['no_jbop']));
         $cek =  $this->db->get('detail_bopo')->num_rows();
         if ($cek == 0) {
            $this->db->insert('detail_bopo', $data);
         } else {
            $this->db->set('harga', $_POST['harga'], FALSE);
            $this->db->where(array('no_bopo' => $_POST['no_bopo'], 'no_jbop' => $_POST['no_jbop']));
            $this->db->update('detail_bopo');
         }
         redirect('c_masterdata/isi_edit_bopo/' . $no_bop . '');
      }
   }

   public function hapus_bopo($id, $id2)
   {
      $this->db->query("SET GLOBAL FOREIGN_KEY_CHECKS=0");
      $this->db->where('no_bopo', $id);
      $this->db->where('no_jbop', $id2);
      $this->db->delete('detail_bopo');
      $this->db->query("SET GLOBAL FOREIGN_KEY_CHECKS=1");

      redirect('c_masterdata/isi_edit_bopo/' . $id . '');
   }



   //btk

   public function lihat_btk()
   {
      $this->db->where('tgl_btk', date('Y-m-d'));
      $data['cek'] = $this->db->get('btk')->result();

      $this->db->like('no_btk', 'BTK_', 'after');
      $data['result'] = $this->db->get('btk')->result_array();
      $this->template->load('template', 'btk/view', $data);
   }
   public function form_btk()
   {
      date_default_timezone_set('Asia/Jakarta');
      $date = date('Y-m-d');

      $query1   = "SELECT  MAX(RIGHT(no_btk,3)) as kode FROM   btk
                     WHERE no_btk LIKE 'BTK_%'";
      $abc      = $this->db->query($query1);
      $no_trans = "";
      if ($abc->num_rows() > 0) {
         foreach ($abc->result() as $k) {
            $tmp = ((int) $k->kode) + 1;
            $kd  = sprintf("%03s", $tmp);
         }
      } else {
         $kd = "001";
      }
      $no_trans   = "BTK_" . $kd;
      $data['id'] = $no_trans;
      $this->template->load('template', 'btk/form', $data);
   }

   public function tambah_btk()
   {


      $config = array(

         array(
            'field' => 'tgl_btk',
            'label' => 'Tanggal',
            'rules' => 'required',
            'errors' => array(
               'required' => '%s tidak boleh kosong!'
            )
         ),
         array(
            'field' => 'jumlah_pgw',
            'label' => 'Jumlah Pegawai',
            'rules' => 'required',
            'errors' => array(
               'required' => 'Inputan Salah'
            )
         ),
         array(
            'field' => 'tarif',
            'label' => 'Tarif Harga',
            'rules' => 'required|is_natural_no_zero|min_length[1]|max_length[11]',
            'errors' => array(
               'required' => '%s tidak boleh kosong!',
               'is_natural_no_zero' => '%s hanya berupa angka 1-9!',
               'min_length' => '%s minimal 3 huruf!',
               'max_length' => '%s maksimal 11 huruf!'
            )
         )

      );
      $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
      $this->form_validation->set_rules($config);

      if ($this->form_validation->run() == FALSE) {
         $this->form_btk();
      } else {
         $this->db->where('tgl_btk', $_POST['tgl_btk']);
         $cek = $this->db->get('btk')->result_array();
         if ($cek == FALSE) {
            $data = array(
               'no_btk' => $_POST['no_btk'],
               'bulan' => '0',
               'tahun' => '0',
               'tgl_btk' => $_POST['tgl_btk'],
               'jumlah_pgw' => $_POST['jumlah_pgw'],
               'tarif' => $_POST['tarif']
            );
            $this->db->insert('btk', $data);

            redirect('c_masterdata/lihat_btk');
         } else {
            $query1   = "SELECT  MAX(RIGHT(no_btk,3)) as kode FROM   btk";
            $abc      = $this->db->query($query1);
            $no_trans = "";
            if ($abc->num_rows() > 0) {
               foreach ($abc->result() as $k) {
                  $tmp = ((int) $k->kode) + 1;
                  $kd  = sprintf("%03s", $tmp);
               }
            } else {
               $kd = "001";
            }
            $no_trans   = "BTK_" . $kd;
            $data['id'] = $no_trans;
            $data['error'] = 'Tanggal sudah ada di database!';
            $this->template->load('template', 'btk/form', $data);
         }
      }
   }

   public function isi_edit_btk($id)
   {



      $x['data'] = $this->M_masterdata->edit_data('btk', "no_btk = '$id'")->row_array();
      $this->template->load('template', 'btk/update', $x);
   }
   public function edit_btk()
   {

      $config = array(


         array(
            'field' => 'jumlah_pgw',
            'label' => 'Jumlah Pegawai',
            'rules' => 'required',
            'errors' => array(
               'required' => 'Inputan Salah'
            )
         ),
         array(
            'field' => 'tarif',
            'label' => 'Tarif Harga',
            'rules' => 'required|is_natural_no_zero|min_length[1]|max_length[11]',
            'errors' => array(
               'required' => '%s tidak boleh kosong!',
               'is_natural_no_zero' => '%s hanya berupa angka 1-9!',
               'min_length' => '%s minimal 3 huruf!',
               'max_length' => '%s maksimal 11 huruf!'
            )
         )

      );
      $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
      $this->form_validation->set_rules($config);

      if ($this->form_validation->run() == FALSE) {
         $id = $_POST['no_btk'];
         $this->isi_edit_btk($id);
      } else {

         $data = array(
            'jumlah_pgw' => $_POST['jumlah_pgw'],
            'tarif' => $_POST['tarif']
         );

         $this->db->where('no_btk', $_POST['no_btk']);
         $this->M_masterdata->update_data('btk', $data);
         redirect('c_masterdata/lihat_btk');
      }
   }

   //btko

   public function lihat_btko()
   {
      $this->db->where('tgl_btko', date('Y-m-d'));
      $data['cek'] = $this->db->get('btko')->result();

      // $this->db->like('no_btk', 'BTKO_', 'after');
      $data['result'] = $this->db->get('btko')->result_array();
      $this->template->load('template', 'btko/view', $data);
   }
   public function form_btko()
   {
      date_default_timezone_set('Asia/Jakarta');
      $date = date('Y-m-d');

      $query1   = "SELECT  MAX(RIGHT(no_btko,3)) as kode FROM   btko
                     WHERE no_btko LIKE 'BTKO_%'";
      $abc      = $this->db->query($query1);
      $no_trans = "";
      if ($abc->num_rows() > 0) {
         foreach ($abc->result() as $k) {
            $tmp = ((int) $k->kode) + 1;
            $kd  = sprintf("%03s", $tmp);
         }
      } else {
         $kd = "001";
      }
      $no_trans   = "BTKO_" . $kd;
      $data['id'] = $no_trans;
      $this->template->load('template', 'btko/form', $data);
   }

   public function tambah_btko()
   {


      $config = array(

         array(
            'field' => 'tgl_btko',
            'label' => 'Tanggal',
            'rules' => 'required',
            'errors' => array(
               'required' => '%s tidak boleh kosong!'
            )
         ),
         array(
            'field' => 'jumlah_pgw',
            'label' => 'Jumlah Pegawai',
            'rules' => 'required',
            'errors' => array(
               'required' => 'Inputan Salah'
            )
         ),
         array(
            'field' => 'tarif',
            'label' => 'Tarif Harga',
            'rules' => 'required|is_natural_no_zero|min_length[1]|max_length[11]',
            'errors' => array(
               'required' => '%s tidak boleh kosong!',
               'is_natural_no_zero' => '%s hanya berupa angka 1-9!',
               'min_length' => '%s minimal 3 huruf!',
               'max_length' => '%s maksimal 11 huruf!'
            )
         )

      );
      $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
      $this->form_validation->set_rules($config);

      if ($this->form_validation->run() == FALSE) {
         $this->form_btko();
      } else {
         $this->db->where('tgl_btko', $_POST['tgl_btko']);
         $cek = $this->db->get('btko')->result_array();
         if ($cek == FALSE) {
            $data = array(
               'no_btko' => $_POST['no_btko'],
               'tgl_btko' => $_POST['tgl_btko'],
               'jumlah_pgw' => $_POST['jumlah_pgw'],
               'tarif' => $_POST['tarif']
            );
            $this->db->insert('btko', $data);

            redirect('c_masterdata/lihat_btko');
         } else {
            $query1   = "SELECT  MAX(RIGHT(no_btko,3)) as kode FROM   btko";
            $abc      = $this->db->query($query1);
            $no_trans = "";
            if ($abc->num_rows() > 0) {
               foreach ($abc->result() as $k) {
                  $tmp = ((int) $k->kode) + 1;
                  $kd  = sprintf("%03s", $tmp);
               }
            } else {
               $kd = "001";
            }
            $no_trans   = "BTKO_" . $kd;
            $data['id'] = $no_trans;
            $data['error'] = 'Tanggal sudah ada di database!';
            $this->template->load('template', 'btko/form', $data);
         }
      }
   }

   public function isi_edit_btko($id)
   {



      $x['data'] = $this->M_masterdata->edit_data('btko', "no_btko = '$id'")->row_array();
      $this->template->load('template', 'btko/update', $x);
   }
   public function edit_btko()
   {

      $config = array(


         array(
            'field' => 'jumlah_pgw',
            'label' => 'Jumlah Pegawai',
            'rules' => 'required',
            'errors' => array(
               'required' => 'Inputan Salah'
            )
         ),
         array(
            'field' => 'tarif',
            'label' => 'Tarif Harga',
            'rules' => 'required|is_natural_no_zero|min_length[1]|max_length[11]',
            'errors' => array(
               'required' => '%s tidak boleh kosong!',
               'is_natural_no_zero' => '%s hanya berupa angka 1-9!',
               'min_length' => '%s minimal 3 huruf!',
               'max_length' => '%s maksimal 11 huruf!'
            )
         )

      );
      $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
      $this->form_validation->set_rules($config);

      if ($this->form_validation->run() == FALSE) {
         $id = $_POST['no_btko'];
         $this->isi_edit_btko($id);
      } else {

         $data = array(
            'jumlah_pgw' => $_POST['jumlah_pgw'],
            'tarif' => $_POST['tarif']
         );

         $this->db->where('no_btko', $_POST['no_btko']);
         $this->M_masterdata->update_data('btko', $data);
         redirect('c_masterdata/lihat_btko');
      }
   }


   //Konsumen IPS

   public function lihat_ips()
   {


      $data['result'] = $this->db->get('konsumen_ips')->result_array();
      $this->template->load('template', 'ips/view', $data);
   }
   public function form_ips()
   {


      $query1   = "SELECT  MAX(RIGHT(no_ips,3)) as kode FROM konsumen_ips";
      $abc      = $this->db->query($query1);
      $no_trans = "";
      if ($abc->num_rows() > 0) {
         foreach ($abc->result() as $k) {
            $tmp = ((int) $k->kode) + 1;
            $kd  = sprintf("%03s", $tmp);
         }
      } else {
         $kd = "001";
      }
      $no_trans   = "IPS_" . $kd;
      $data['id'] = $no_trans;
      $this->template->load('template', 'ips/form', $data);
   }

   public function tambah_ips()
   {


      $config = array(

         array(
            'field' => 'nama_ips',
            'label' => 'Nama Konsumen IPS',
            'rules' => 'required|min_length[3]|max_length[30]|is_unique[konsumen_ips.nama_ips]',
            'errors' => array(
               'required' => '%s tidak boleh kosong!',
               'min_length' => '%s minimal 3 huruf!',
               'max_length' => '%s maksimal 30 huruf!',
               'customAlpha' => '%s hanya boleh berupa huruf!',
               'is_unique' => '%s sudah ada di database!'
            )
         ),
         array(
            'field' => 'notel',
            'label' => 'No. Telepon',
            'rules' => 'required',
            'errors' => array(
               'required' => '%s tidak boleh kosong!'
            )
         ),
         array(
            'field' => 'alamat',
            'label' => 'Alamat',
            'rules' => 'required',
            'errors' => array(
               'required' => '%s tidak boleh kosong!'
            )
         )
      );
      $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
      $this->form_validation->set_rules($config);

      if ($this->form_validation->run() == FALSE) {
         $this->form_ips();
      } else {
         $data = array(
            'no_ips' => $_POST['no_ips'],
            'nama_ips' => $_POST['nama_ips'],
            'notel' => $_POST['notel'],
            'alamat' => $_POST['alamat']
         );
         $this->db->insert('konsumen_ips', $data);

         redirect('c_masterdata/lihat_ips');
      }
   }

   public function isi_edit_ips($id)
   {



      $x['data'] = $this->M_masterdata->edit_data('konsumen_ips', "no_ips = '$id'")->row_array();
      $this->template->load('template', 'ips/update', $x);
   }
   public function edit_ips()
   {

      $config = array(

         array(
            'field' => 'nama_ips',
            'label' => 'Nama Konsumen IPS',
            'rules' => 'required|min_length[3]|max_length[30]',
            'errors' => array(
               'required' => '%s tidak boleh kosong!',
               'min_length' => '%s minimal 3 huruf!',
               'max_length' => '%s maksimal 30 huruf!'
            )
         ),
         array(
            'field' => 'notel',
            'label' => 'No. Telepon',
            'rules' => 'required',
            'errors' => array(
               'required' => '%s tidak boleh kosong!'
            )
         ),
         array(
            'field' => 'alamat',
            'label' => 'Alamat',
            'rules' => 'required',
            'errors' => array(
               'required' => '%s tidak boleh kosong!'
            )
         )
      );
      $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
      $this->form_validation->set_rules($config);

      if ($this->form_validation->run() == FALSE) {
         $id = $_POST['no_ips'];
         $this->isi_edit_ips($id);
      } else {
         $no_bp   = $_POST['no_ips'];
         $nama_bp = $_POST['nama_ips'];
         $notel   = $_POST['notel'];
         $alamat  = $_POST['alamat'];

         $data = array(
            'nama_ips' => $nama_bp,
            'notel' => $notel,
            'alamat' => $alamat
         );

         $this->db->where('no_ips', $no_bp);
         $this->M_masterdata->update_data('konsumen_ips', $data);
         redirect('c_masterdata/lihat_ips');
      }
   }

   //BOM

   public function lihat_bom()
   {


      $data['result'] = $this->db->get('produk')->result_array();
      $this->template->load('template', 'bom/view', $data);
   }


   public function isi_edit_bom($id)
   {

      $query = "(SELECT no_bb as no_bbp, nama_bb as nama_bbp, satuan FROM bahan_baku)
                  UNION
                  (SELECT no_bp, nama_bp, satuan FROM bahan_penolong)
                  ORDER BY no_bbp";
      $x['result'] = $this->db->query($query)->result_array();
      $query1 = "SELECT no_produk, no_bb as no_bbp, nama_bb as nama_bbp, satuan, jumlah
                     FROM bahan_baku a
                     JOIN bom b
                     ON a.no_bb = b.no_bbp
                     WHERE no_produk LIKE '" . $id . "'
                     UNION
                     SELECT no_produk, no_bp, nama_bp, satuan , jumlah
                     FROM bahan_penolong a
                     JOIN bom b
                     ON a.no_bp = b.no_bbp
                     WHERE no_produk LIKE '" . $id . "'
                    
                     ORDER BY no_bbp";
      $x['result1'] = $this->db->query($query1)->result_array();

      $x['data'] = $this->M_masterdata->edit_data('produk', "no_produk = '$id'")->row_array();
      $this->template->load('template', 'bom/update', $x);
   }
   public function edit_bom()
   {

      $config = array(

         array(
            'field' => 'no_bbp',
            'label' => 'Nama Bahan Baku / Penolong',
            'rules' => 'required',
            'errors' => array(
               'required' => '%s tidak boleh kosong!'
            )
         ),

         array(
            'field' => 'jumlah',
            'label' => 'Jumlah Bahan',
            'rules' => 'required',
            'errors' => array(
               'required' => 'Inputan Salah'
            )
         )
      );
      $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
      $this->form_validation->set_rules($config);

      if ($this->form_validation->run() == FALSE) {
         $id = $_POST['no_produk'];
         $this->isi_edit_bom($id);
      } else {
         $no_produk   = $_POST['no_produk'];
         $no_bbp = $_POST['no_bbp'];
         $jumlah   = $_POST['jumlah'];

         $data = array(
            'no_produk' => $no_produk,
            'no_bbp' => $no_bbp,
            'jumlah' => $jumlah
         );


         $this->db->where(array('no_bbp' => $_POST['no_bbp'], 'no_produk' => $_POST['no_produk']));
         $cek =  $this->db->get('bom')->num_rows();
         if ($cek == 0) {
            $this->db->insert('bom', $data);
         } else {
            $this->db->set('jumlah', "jumlah + " . $_POST['jumlah'] . "", FALSE);
            $this->db->where(array('no_bbp' => $_POST['no_bbp'], 'no_produk' => $_POST['no_produk']));
            $this->db->update('bom');
         }

         redirect('c_masterdata/isi_edit_bom/' . $no_produk . '');
      }
   }



   public function hapus_bom($id, $id2)
   {
      $this->db->query("SET GLOBAL FOREIGN_KEY_CHECKS=0");
      $this->db->where('no_produk', $id);
      $this->db->where('no_bbp', $id2);
      $this->db->delete('bom');
      $this->db->query("SET GLOBAL FOREIGN_KEY_CHECKS=1");

      redirect('c_masterdata/isi_edit_bom/' . $id . '');
   }


   //Jenis BOP

   public function lihat_jbop()
   {


      $data['result'] = $this->db->get('jenis_bop')->result_array();
      $this->template->load('template', 'jenis_bop/view', $data);
   }
   public function form_jbop()
   {


      $query1   = "SELECT  MAX(RIGHT(no_jbop,3)) as kode FROM jenis_bop";
      $abc      = $this->db->query($query1);
      $no_trans = "";
      if ($abc->num_rows() > 0) {
         foreach ($abc->result() as $k) {
            $tmp = ((int) $k->kode) + 1;
            $kd  = sprintf("%03s", $tmp);
         }
      } else {
         $kd = "001";
      }
      $no_trans   = "JBOP_" . $kd;
      $data['id'] = $no_trans;
      $this->template->load('template', 'jenis_bop/form', $data);
   }

   public function tambah_jbop()
   {


      $config = array(

         array(
            'field' => 'nama_jbop',
            'label' => 'Nama Bahan Baku',
            'rules' => 'required|callback_customAlpha|min_length[3]|max_length[30]|is_unique[jenis_bop.nama_jbop]',
            'errors' => array(
               'required' => '%s tidak boleh kosong!',
               'min_length' => '%s minimal 3 huruf!',
               'max_length' => '%s maksimal 30 huruf!',
               'customAlpha' => '%s hanya boleh berupa huruf!',
               'is_unique' => '%s sudah ada di database!'
            )
         )
      );
      $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
      $this->form_validation->set_rules($config);

      if ($this->form_validation->run() == FALSE) {
         $this->form_jbop();
      } else {
         $data = array(
            'no_jbop' => $_POST['no_jbop'],
            'nama_jbop' => $_POST['nama_jbop']
         );
         $this->db->insert('jenis_bop', $data);

         redirect('c_masterdata/lihat_jbop');
      }
   }

   public function isi_edit_jbop($id)
   {



      $x['data'] = $this->M_masterdata->edit_data('jenis_bop', "no_jbop = '$id'")->row_array();
      $this->template->load('template', 'jenis_bop/update', $x);
   }
   public function edit_jbop()
   {

      $config = array(

         array(
            'field' => 'nama_jbop',
            'label' => 'Nama Bahan Baku',
            'rules' => 'required|callback_customAlpha|min_length[3]|max_length[30]|is_unique[jenis_bop.nama_jbop]',
            'errors' => array(
               'required' => '%s tidak boleh kosong!',
               'min_length' => '%s minimal 3 huruf!',
               'max_length' => '%s maksimal 30 huruf!',
               'customAlpha' => '%s hanya boleh berupa huruf!',
               'is_unique' => '%s sudah ada di database!'
            )
         )
      );
      $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
      $this->form_validation->set_rules($config);

      if ($this->form_validation->run() == FALSE) {
         $id = $_POST['no_jbop'];
         $this->isi_edit_jbop($id);
      } else {
         $no_jbop   = $_POST['no_jbop'];
         $nama_jbop = $_POST['nama_jbop'];


         $data = array(
            'nama_jbop' => $nama_jbop
         );

         $this->db->where('no_jbop', $no_jbop);
         $this->M_masterdata->update_data('jenis_bop', $data);
         redirect('c_masterdata/lihat_jbop');
      }
   }

   // index simpanan
   public function simpanan()
   {
      # code...
      $data['simpanan'] = $this->db->get('simpanan')->result();
      $this->template->load('template', 'simpanan/index', $data);
   }

   public function form_simpanan()
   {
      # code...
      $kode   = "SELECT  MAX(RIGHT(kode_simpanan, 3)) as kode FROM simpanan";
      $abc      = $this->db->query($kode);
      $no_trans = "";
      if ($abc->num_rows() > 0) {
         foreach ($abc->result() as $k) {
            $tmp = ((int) $k->kode) + 1;
            $kd  = sprintf("%03s", $tmp);
         }
      } else {
         $kd = "01";
      }
      $no_trans   = "JS-" . $kd;

      $data['id'] = $no_trans;
      // print_r($data['id']);exit;
      $this->template->load('template', 'simpanan/form_simpanan', $data);
   }

   public function saveSimpanan()
   {
      $config = array(
         array(
            'field' => 'simpanan',
            'label' => 'Simpanan',
            'rules' => 'required',
            'errors' => array(
               'required' => '%s tidak boleh kosong!'
            )
         ),
         array(
            'field' => 'biaya',
            'label' => 'Biaya',
            'rules' => 'required',
            'errors' => array(
               'required' => '%s tidak boleh kosong!'
               // 'is_natural_no_zero' => '%s minimal 1 tahun!'
            )
         ),
      );
      $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
      $this->form_validation->set_rules($config);

      if ($this->form_validation->run() == FALSE) {
         $this->form_simpanan();
      } else {
         $data = array(
            "kode_simpanan" => $this->input->post("kode_simpanan"),
            "simpanan" => $this->input->post("simpanan"),
            "biaya" => $this->input->post("biaya"),
         );
         $this->db->insert("simpanan", $data);
         redirect("c_masterdata/simpanan");
      }
   }

   public function editSimpanan($kode_simpanan)
   {
      $x['data'] = $this->M_masterdata->edit_data('simpanan', "kode_simpanan = '$kode_simpanan'")->row();
      // print_r($x['data']);exit;
      $x['supplier'] = $this->db->get("supplier_aset")->result();
      $this->template->load('template', 'simpanan/form_edit', $x);
   }

   public function updateSimpanan()
   {
      $config = array(
         array(
            'field' => 'simpanan',
            'label' => 'Simpanan',
            'rules' => 'required',
            'errors' => array(
               'required' => '%s tidak boleh kosong!'
            )
         ),
         array(
            'field' => 'biaya',
            'label' => 'Biaya',
            'rules' => 'required',
            'errors' => array(
               'required' => '%s tidak boleh kosong!'
               // 'is_natural_no_zero' => '%s minimal 1 tahun!'
            )
         ),
      );
      $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
      $this->form_validation->set_rules($config);

      if ($this->form_validation->run() == FALSE) {
         $id = $_POST['kode_simpanan'];
         $this->editSimpanan($id);
      } else {
         $id   = $_POST['kode_simpanan'];
         $simpanan = $_POST['simpanan'];
         $biaya    = $_POST['biaya'];

         $data = array(
            'kode_simpanan' => $id,
            'simpanan' => $simpanan,
            'biaya' => $biaya
         );
         // print_r($data);exit;

         $this->db->where('kode_simpanan', $id);
         $this->M_masterdata->update_data('simpanan', $data);
         redirect('c_masterdata/simpanan');
      }
   }

   public function edit_supplier($id)
   {
      $x['data'] = $this->M_masterdata->edit_data('supplier_aset', "id = '$id'")->row();
      // print_r($x['data']);exit;
      $x['supplier'] = $this->db->get("supplier_aset")->result();
      $this->template->load('template', 'supplier_aset/update', $x);
   }

   public function update_supplier()
   {
      $config = array(
         array(
            'field' => 'nama_supplier',
            'label' => 'Nama supplier',
            'rules' => 'required',
            'errors' => array(
               'required' => '%s tidak boleh kosong!'
            )
         ),
         array(
            'field' => 'alamat',
            'label' => 'Alamat',
            'rules' => 'required',
            'errors' => array(
               'required' => '%s tidak boleh kosong!'
               // 'is_natural_no_zero' => '%s minimal 1 tahun!'
            )
         ),
         array(
            'field' => 'no_telepon',
            'label' => 'No Telepon',
            'rules' => 'required',
            'errors' => array(
               'required' => '%s tidak boleh kosong!'
            )
         ),
      );
      $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
      $this->form_validation->set_rules($config);

      if ($this->form_validation->run() == FALSE) {
         $id = $_POST['id_supplier_aset'];
         $this->editSimpanan($id);
      } else {
         $id   = $_POST['id_supplier_aset'];
         $nama_supplier = $_POST['nama_supplier'];
         $alamat    = $_POST['alamat'];
         $no_telepon    = $_POST['no_telepon'];

         $data = array(
            'nama_supplier' => $nama_supplier,
            'alamat' => $alamat,
            'no_telepon' => $no_telepon
         );
         // print_r($data);exit;
         $this->db->where('id', $id);
         $this->M_masterdata->update_data('supplier_aset', $data);
         redirect('c_masterdata/supplier_aset');
      }
   }

   public function hapusSupplier($id)
   {
      # code...
      $where = array("id" => $id);
      $this->M_masterdata->hapus_data("supplier_aset", $where);
      redirect("c_masterdata/supplier_aset");
   }

   public function aset()
   {
      # code...
      $data['aset'] = $this->db->get('aset')->result();
      // print_r($data['simpanan']);exit;
      $this->template->load('template', 'aset/index', $data);
   }

   public function form_aset()
   {
      # code...
      $kode   = "SELECT  MAX(RIGHT(id, 2)) as kode FROM aset";
      $abc      = $this->db->query($kode);
      // print_r($abc);exit;
      $no_trans = "";
      if ($abc->num_rows() > 0) {
         foreach ($abc->result() as $k) {
            $tmp = ((int) $k->kode) + 1;
            $kd  = sprintf("%02s", $tmp);
         }
      } else {
         $kd = "01";
      }
      $no_trans   = "AS-" . $kd;

      $data['id'] = $no_trans;
      $data['supplier'] = $this->db->get('supplier_aset')->result();
      $data['coa'] = $this->db->get('coa')->result();

      // print_r($data['supplier']);exit;
      $this->template->load('template', 'aset/form', $data);
   }

   public function simpan_aset()
   {
      # code...
      $config = array(
         array(
            'field' => 'aset',
            'label' => 'Aset',
            'rules' => 'required',
            'errors' => array(
               'required' => '%s tidak boleh kosong!'
            )
         ),
         array(
            'field' => 'umur_aset',
            'label' => 'Umur Aset',
            'rules' => 'required|is_natural_no_zero',
            'errors' => array(
               'required' => '%s tidak boleh kosong!',
               'is_natural_no_zero' => '%s minimal 1 tahun atau 12 bulan !'
            )
         ),
      );

      $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
      $this->form_validation->set_rules($config);

      if ($this->form_validation->run() == FALSE) {
         $this->form_aset();
      } else {
         $data = array(
            'id' => $this->input->post('id_aset'),
            'aset' => $this->input->post('aset'),
            'umur_aset' => $this->input->post('umur_aset'),
            'id_supplier' => $this->input->post('supplier'),
            'kel_akun' => $this->input->post('kel_akun'),
            'kel_akun_peny_d' => $this->input->post('kel_akun_d'),
            'kel_akun_peny_k' => $this->input->post('kel_akun_k'),
         );
         // print_r($data);exit;
         $this->db->insert('aset', $data);
         redirect('c_masterdata/aset');
      }
   }

   public function isi_edit_aset($id)
   {
      $x['data'] = $this->M_masterdata->edit_data('aset', "id = '$id'")->row_array();
      // print_r($x['data']);exit;
      $x['supplier'] = $this->db->get("supplier_aset")->result();
      $this->template->load('template', 'aset/update', $x);
   }

   public function edit_aset()
   {
      $config = array(
         array(
            'field' => 'aset',
            'label' => 'Aset',
            'rules' => 'required',
            'errors' => array(
               'required' => '%s tidak boleh kosong!'
            )
         ),
         array(
            'field' => 'umur_aset',
            'label' => 'Umur Aset',
            'rules' => 'required|is_natural_no_zero',
            'errors' => array(
               'required' => '%s tidak boleh kosong!',
               'is_natural_no_zero' => '%s minimal 1 tahun!'
            )
         ),
      );
      $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
      $this->form_validation->set_rules($config);

      if ($this->form_validation->run() == FALSE) {
         $id = $_POST['id_aset'];
         $this->isi_edit_aset($id);
      } else {
         $id   = $_POST['id_aset'];
         $aset = $_POST['aset'];
         $umur_aset    = $_POST['umur_aset'];

         $data = array(
            'id' => $id,
            'aset' => $aset,
            'umur_aset' => $umur_aset
         );
         // print_r($data);exit;

         $this->db->where('id', $id);
         $this->M_masterdata->update_data('aset', $data);
         redirect('c_masterdata/aset');
      }
   }

   public function hapusAset($id)
   {
      # code...
      $where = array("id" => $id);
      $this->M_masterdata->hapus_data("aset", $where);
      redirect("c_masterdata/aset");
   }

   public function supplier_aset()
   {
      # code...
      $data['supplier_aset'] = $this->db->get('supplier_aset')->result();
      // print_r($data['simpanan']);exit;
      $this->template->load('template', 'supplier_aset/index', $data);
   }

   public function form_supplier_aset()
   {
      # code...
      $kode   = "SELECT  MAX(RIGHT(id, 2)) as kode FROM supplier_aset";
      $abc      = $this->db->query($kode);
      // print_r($abc);exit;
      $no_trans = "";
      if ($abc->num_rows() > 0) {
         foreach ($abc->result() as $k) {
            $tmp = ((int) $k->kode) + 1;
            $kd  = sprintf("%02s", $tmp);
         }
      } else {
         $kd = "01";
      }
      $no_trans   = "SPA-" . $kd;

      $data['id'] = $no_trans;
      // print_r($data['id']);exit;
      $this->template->load('template', 'supplier_aset/form', $data);
   }

   public function simpan_supp_aset()
   {
      # code...
      $config = array(
         array(
            'field' => 'nama_supplier',
            'label' => 'Nama Supplier',
            'rules' => 'required',
            'errors' => array(
               'required' => '%s tidak boleh kosong!'
               // 'min_length' => '%s minimal 3 huruf!',
               // 'max_length' => '%s maksimal 30 huruf!',
               // 'customAlpha' => '%s hanya boleh berupa huruf!',
               // 'is_unique' => '%s sudah ada di database!'
            )
         ),
         array(
            'field' => 'alamat',
            'label' => 'Alamat',
            'rules' => 'required',
            'errors' => array(
               'required' => '%s tidak boleh kosong!'
               // 'max_length' => '%s maksimal 30 huruf!',
               // 'customAlpha' => '%s hanya boleh berupa huruf!',
               // 'is_unique' => '%s sudah ada di database!'
            )
         ),
         array(
            'field' => 'no_telepon',
            'label' => 'No Telepon',
            'rules' => 'required',
            'errors' => array(
               'required' => '%s tidak boleh kosong!'
               // 'max_length' => '%s maksimal 30 huruf!',
               // 'customAlpha' => '%s hanya boleh berupa huruf!',
               // 'is_unique' => '%s sudah ada di database!'
            )
         ),
      );

      $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
      $this->form_validation->set_rules($config);

      if ($this->form_validation->run() == FALSE) {
         $this->form_supplier_aset();
      } else {
         $data = array(
            'id' => $this->input->post('id_aset'),
            'nama_supplier' => $this->input->post('nama_supplier'),
            'alamat' => $this->input->post('alamat'),
            'no_telepon' => $this->input->post('no_telepon')
         );
         // print_r($data);exit;
         $this->db->insert('supplier_aset', $data);
         redirect('c_masterdata/supplier_aset');
      }
   }

   // public function isi_edit_aset($id)
   // {
   //    $x['data'] = $this->M_masterdata->edit_data('aset', "id = '$id'")->row_array();
   //    // print_r($x['data']);exit;
   //    $this->template->load('template', 'aset/update', $x); 
   // }

   // public function edit_aset()
   // {
   //    $config = array(
   //       array(
   //          'field' => 'aset',
   //          'label' => 'Aset',
   //          'rules' => 'required',
   //          'errors' => array(
   //             'required' => '%s tidak boleh kosong!'
   //             // 'min_length' => '%s minimal 3 huruf!',
   //             // 'max_length' => '%s maksimal 30 huruf!',
   //             // 'customAlpha' => '%s hanya boleh berupa huruf!',
   //             // 'is_unique' => '%s sudah ada di database!'
   //          )
   //       ),
   //       array(
   //          'field' => 'umur_aset',
   //          'label' => 'Umur Aset',
   //          'rules' => 'required|is_natural_no_zero',
   //          'errors' => array(
   //             'required' => '%s tidak boleh kosong!',
   //             'is_natural_no_zero' => '%s minimal 1 tahun!'
   //             // 'max_length' => '%s maksimal 30 huruf!',
   //             // 'customAlpha' => '%s hanya boleh berupa huruf!',
   //             // 'is_unique' => '%s sudah ada di database!'
   //          )
   //       ),
   //    );
   //    $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
   //    $this->form_validation->set_rules($config);

   //    if ($this->form_validation->run() == FALSE) {
   //       $id = $_POST['id_aset'];
   //       $this->isi_edit_aset($id);
   //    } else {
   //       $id   = $_POST['id_aset'];
   //       $aset = $_POST['aset'];
   //       $umur_aset    = $_POST['umur_aset'];

   //       $data = array(
   //          'id' => $id,
   //          'aset' => $aset,
   //          'umur_aset' => $umur_aset
   //       );
   //       // print_r($data);exit;

   //       $this->db->where('id', $id);
   //       $this->M_masterdata->update_data('aset', $data);
   //       redirect('c_masterdata/aset');

   //    }
   // }


   public function tps()
   {
      $data['tps'] = $this->db->get('tps')->result();
      $this->template->load('template', 'tps/index', $data);
   }

   public function tambah_tps()
   {
      $query1   = "SELECT  MAX(RIGHT(kode_tps, 3)) as kode FROM tps";
      $abc      = $this->db->query($query1);
      $kd_tps = "";
      if ($abc->num_rows() > 0) {
         foreach ($abc->result() as $k) {
            $tmp = ((int) $k->kode) + 1;
            $kd  = sprintf("%03s", $tmp);
         }
      } else {
         $kd = "001";
      }
      $kd_tps   = "TPS_" . $kd;

      $data = [
         'id' => $kd_tps
      ];

      $this->template->load('template', 'tps/tambah_tps', $data);
   }

   public function simpan_tps()
   {
      $config = array(
         array(
            'field' => 'kordinator',
            'label' => 'Kordinator',
            'rules' => 'required|alpha',
            'errors' => array(
               'required' => '%s tidak boleh kosong!',
               'alpha' => '%s tidak bisa menggunakan angka',
            )
         )
      );
      $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
      $this->form_validation->set_rules($config);

      if ($this->form_validation->run() == FALSE) {
         $this->tambah_tps();
      } else {
         $kd = $this->input->post('id');
         $alamat = $this->input->post('alamat');
         $kordinator = $this->input->post('kordinator');

         $data = [
            'kode_tps' => $kd,
            'alamat' => $alamat,
            'kordinator' => $kordinator
         ];

         $this->db->insert('tps', $data);
         redirect('c_masterdata/tps');
      }
   }

   // masterdata arles
   public function pegawai()
   {
      $jabatan = $this->db->get('tb_jabatan')->result();
      $ptkp = $this->db->get('tb_ptkp')->result();
      $jp = $this->db->query("SELECT * FROM tb_jenis_pegawai a GROUP BY a.desc")->result();
      $list = $this->db->get('pegawai')->result();
      $nip = $this->M_masterdata->nip_otomatis();
      // print_r($nip);exit;

      // $this->db->join('user as b', 'a.nama = b.nama_lengkap');
      // $list2 = $this->db->get('pegawai as a')->result();
      $data = [
         'jabatan' => $jabatan,
         'ptkp' => $ptkp,
         'jp' => $jp,
         'list' => $list,
         'nip' => $nip,
      ];
      $this->template->load('template', 'pegawai/index', $data);
   }

   public function save_pegawai()
   {
      $data = [
         'id_jabatan' => $this->input->post('jabatan'),
         'id_ptkp' => $this->input->post('ptkp'),
         'id_jenis_pegawai' => $this->input->post('jp'),
         'pendidikan' => $this->input->post('pendidikan'),
         'rfid' => $this->input->post('rfid'),
         'nip' => $this->input->post('nip'),
         'npwp' => $this->input->post('npwp'),
         'nama' => $this->input->post('nama'),
         'alamat' => $this->input->post('alamat'),
         'no_telp' => $this->input->post('no_telp'),
         'tempat_lahir' => $this->input->post('tempat_lahir'),
         'tgl_lahir' => $this->input->post('ttl'),
         'no_rek' => $this->input->post('no_rek'),
         'jurusan_pendidikan' => $this->input->post('jurusan_pendidikan'),
      ];
      $this->db->insert('pegawai', $data);

      $user = [
         'nama_lengkap' => $this->input->post('nama'),
         'username' => $this->input->post('username'),
         'password' => $this->input->post('password'),
         'level'  => 'pegawai',
         'nip'  => $this->input->post('nip'),
      ];
      $this->db->insert('user', $user);

      redirect('c_masterdata/pegawai');
   }

   public function edit_peg()
   {
      $id = $this->input->post('id');
      $nip = $this->input->post('nip');
      $nama = $this->input->post('nama');
      $alamat = $this->input->post('alamat');
      $no_telp = $this->input->post('no_telp');
      $tempat_lahir = $this->input->post('tempat_lahir');
      $ttl = $this->input->post('ttl');
      $jabatan = $this->input->post('jabatan');
      $jp = $this->input->post('jp');
      $ptkp = $this->input->post('ptkp');
      $no_rek = $this->input->post('no_rek');
      $pendidikan = $this->input->post('pendidikan');
      $datapeg = $this->db->query("SELECT pendidikan, riwayat_pendidikan FROM pegawai WHERE nip = '$nip'")->result()[0];

      $data = [
         'id_jabatan' => $jabatan, 
         'id_ptkp' => $ptkp, 
         'id_jenis_pegawai' => $jp, 
         'nama' => $nama, 
         'alamat' => $alamat, 
         'no_telp' => $no_telp, 
         'tempat_lahir' => $tempat_lahir, 
         'tgl_lahir' => $ttl, 
         'no_rek' => $no_rek, 
         'riwayat_pendidikan' => (strlen($datapeg->riwayat_pendidikan) > 0) ? ($datapeg->riwayat_pendidikan.", ".$datapeg->pendidikan): $datapeg->pendidikan,
         'pendidikan' => $pendidikan,
      ];

      $this->db->where('id', $id);
      $this->db->update('pegawai', $data);

      // update data user
      $tb_user = [
         'nama_lengkap' => $nama,
      ];

      $this->db->where('nip', $nip);
      $this->db->update('user', $tb_user);

      redirect('c_masterdata/pegawai');
   }

   public function ubah_status_peg()
   {
      $id = $this->input->post("id");
      $data = [
         'status' => 0
      ];
      $this->db->where('id', $id);
      $data = $this->db->update('pegawai', $data);

      echo json_encode($data);
   }

   public function ptkp()
   {
      $ptkp = $this->db->get('tb_ptkp')->result();
      $data = [
         'ptkp' => $ptkp
      ];
      $this->template->load('template', 'pegawai/ptkp/index', $data);
   }
   
   public function save_ptkp()
   {
      $config = array(
         array(
            'field' => 'desc',
            'label' => 'Deskripsi PTKP',
            'rules' => 'is_unique[tb_ptkp.desc]',
            'errors' => array(
               'is_unque' => '%s sudah terdaftar di database!',
            )
         )
      );
      $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
      $this->form_validation->set_rules($config);

      if ($this->form_validation->run() == FALSE) {
         $this->ptkp();
      } else {
         $desc = $this->input->post('desc');
         $nominal = $this->input->post('nominal');
         
         $data = [
            'desc' => $desc,
            'nominal' => $nominal,
         ];
         $this->db->insert('tb_ptkp', $data);
         redirect('c_masterdata/ptkp');
      }
   }

   public function edit_ptkp()
   {
      $id = $this->input->post('id');
      $desc = $this->input->post('desc');
      $nominal = $this->input->post('nominal');

      $data = [
         'desc' => $desc,
         'nominal' => $nominal,
      ];
      $this->db->where('id', $id);
      $this->db->update('tb_ptkp', $data);
      redirect('c_masterdata/ptkp');
   }

   public function shift()
   {
      $shift = $this->db->get('shift')->result();
      $data = [
         'list' => $shift
      ];
      $this->template->load('template', 'shift/master_shift/index', $data);
   }

   public function save_shift()
   {
      $desc = $this->input->post('desc');
      $jam_masuk = $this->input->post('jam_masuk');
      $jam_keluar = $this->input->post('jam_keluar');
      $data = [
         'desc'=> $desc,
         'time_in'=> $jam_masuk,
         'time_out'=> $jam_keluar,
      ];
      $this->db->insert('shift', $data);
      redirect('c_masterdata/shift');
   }

   public function jenis_pegawai()
   {
      $jp = $this->db->get('tb_jenis_pegawai')->result();
      $data = [
         'jp' => $jp
      ];
      $this->template->load('template', 'pegawai/jenis_pegawai/index', $data);
   }

   public function edit_jp()
   {
      $id = $this->input->post('id');
      $data = [
         'desc' => $this->input->post('desc'),
         'pendidikan' => $this->input->post('pendidikan'),
         'gaji_pokok' => $this->input->post('gaji_pokok'),
      ];
      $this->db->where('id', $id);
      $this->db->update('tb_jenis_pegawai', $data);
      redirect('c_masterdata/jenis_pegawai');
   }

   public function save_jenis_pegawai()
   {
      $desc = $this->input->post('desc');
      $pendidikan = $this->input->post('pendidikan');
      $gaji_pokok = $this->input->post('gaji_pokok');

      $data = [
         'desc' => $desc,
         'pendidikan' => $pendidikan,
         'gaji_pokok' => $gaji_pokok,
      ];
      $this->db->insert('tb_jenis_pegawai', $data);
      redirect('c_masterdata/jenis_pegawai');
   }

   public function jabatan()
   {
      $jabatan = $this->db->get('tb_jabatan')->result();
      $data = [
         'list' => $jabatan
      ];
      $this->template->load('template', 'pegawai/jabatan/index', $data);
   }

   public function save_jabatan()
   {
      $desc = ucwords($this->input->post('desc'));
      $jabatan = $this->input->post('t_jabatan');
      $kesehatan = $this->input->post('t_kesehatan');

      $data = [
         'desc' => $desc,
         'tunjangan_jabatan' => $jabatan,
         'tunjangan_kesehatan' => $kesehatan,
      ];
      $this->db->insert('tb_jabatan', $data);
      redirect('c_masterdata/jabatan');
   }

   public function edit_jabatan()
   {
      $id = $this->input->post('id');
      $desc = ucwords($this->input->post('desc'));
      $jabatan = $this->input->post('t_jabatan');
      $kesehatan = $this->input->post('t_kesehatan');
      $data = [
         'desc' => $desc,
         'tunjangan_jabatan' => $jabatan,
         'tunjangan_kesehatan' => $kesehatan,
      ];
      $this->db->where('id', $id);
      $this->db->update('tb_jabatan', $data);
      redirect('c_masterdata/jabatan');
   }

   public function pendidikan()
   {
      $value = $this->input->post('val');
      if ($value) {
         echo $this->M_masterdata->get_pendidikan($value);
      }
   }

   // sarah
   public function alokasi_shu()
   {
      $persentase = 100;
      $total_shu = $this->db->query('SELECT SUM(persentase) AS total 
      FROM alokasi_shu')->row()->total;
      $sisa = $persentase - $total_shu;
      $list = $this->db->get('alokasi_shu')->result();
      // print_r($sisa);exit;
      $data = [
         'percent' => $persentase,
         'sisa' => $sisa,
         'list' => $list,
      ];
      $this->template->load('template', 'shu/index', $data);
   }

   public function save_alokasi_shu()
   {
      $desc = $this->input->post('desc');
      $persentase = $this->input->post('persentase');

      $data = [
         'deskripsi' => $desc,
         'persentase' => $persentase,
      ];
      $this->db->insert('alokasi_shu', $data);

      redirect('c_masterdata/alokasi_shu');
   }

   // salma
   public function aktivitas()
   {
      $aktivitas = $this->db->get('aktivitas')->result();
      $data = [
         'aktivitas' => $aktivitas, 
      ];
      $this->template->load('template', 'aktivitas/index', $data);
   }

   public function save_aktivitas()
   {
      $config = array(
         array(
            'field'  => 'nama_aktivitas',
            'label'  => 'Nama aktivitas',
            'rules'  => 'alpha',
            'errors' => array(
               'alpha'  => '%s tidak boleh berupa angka.',
            )
         )
      );
      $this->form_validation->set_error_delimiters('<div class="error" style="font-size:12px; color:red;">', '</div>');
      $this->form_validation->set_rules($config);

      if ($this->form_validation->run() == FALSE) {
         $this->aktivitas();
      } else {
         // $this->load->view('formsuccess');
         $nama_aktivitas = $this->input->post('nama_aktivitas');
         $data = [
            'nama_aktivitas' => ucwords($nama_aktivitas),
         ];
         $this->db->insert('aktivitas', $data);
         redirect('c_masterdata/aktivitas');
      }
   }

   public function edit_aktivitas()
   {
      $id = $this->input->post('id');
      $aktivitas = $this->input->post('nama_aktivitas');
      // data ini data yang akan diubah
      $data = [
         'nama_aktivitas' => $aktivitas,
      ];
      $this->db->where('id', $id);
      $this->db->update('aktivitas', $data);

      redirect('c_masterdata/aktivitas');
   }


   public function customAlpha($str)
   {
      return (!preg_match("/^([-a-z_ ])+$/i", $str)) ? FALSE : TRUE;
   }
}
