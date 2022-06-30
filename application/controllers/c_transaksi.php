   <?php
   class c_transaksi extends CI_controller
   {

      function __construct()
      {
         parent::__construct();
         $this->load->model(array(
            "m_transaksi" => "model",
            "m_keuangan" => "M_keuangan",
            "crud_model" => "crud"
         ));
         date_default_timezone_set('Asia/Jakarta');
         if (empty($this->session->userdata('level'))) {
            redirect('c_login/home');
         }
      }
      //PEMBELIAN BAHAN BAKU
      public function lihat_pemb()
      {
         $this->db->where('tgl_trans', date('Y-m-d'));
         $cek_kualitas = $this->db->get('cek_kualitas')->result();
         $data['cek'] = $cek_kualitas;
         $data['error'] = "Pembelian hari ini sudah selesai!";

         // $this->db->join('truck_information', 'truck_information.id_pembelian = pembelian_bb.no_trans', 'LEFT');
         // $this->db->where('is_deleted =',0);
         $this->db->order_by('id', 'desc');
         $data['result'] = $this->db->get('pembelian_bb')->result_array();
         // print_r($data['result']);exit;

         $data['aset'] = $this->db->get('aset')->result();

         $_truck = "SELECT a.id, aset, id_detail_aset, id_aset
         FROM detail_pembelian a
         INNER JOIN aset b ON a.id_aset = b.id
         WHERE aset LIKE '%Truck%'
         ";

         $truck = $this->db->query($_truck)->result();
         $data['truck'] = $truck;

         $t_i = $this->db->get('truck_information')->result();
         // print_r($t_i);exit;
         $data['ti'] = $t_i;

         $this->template->load('template', 'pemb/view', $data);
      }

      public function save_truck_information()
      {
         $id_pembelian = $this->input->post('id_pembelian');
         $id_aset = $this->input->post('id_aset');
         $nama_aset = $this->input->post('nama_aset');
         $id_detail_pembelian = $this->input->post('id_detail_pembelian');

         $data = [
            'id_pembelian' => $id_pembelian,
            'id_aset' => $id_aset,
            'nama_aset' => $nama_aset,
            'id_detail_pembelian' => $id_detail_pembelian,
         ];
         $this->db->insert('truck_information', $data);

         // insert untuk confirm 
         $data_confirm = [
            'id_detail_truck' => $id_detail_pembelian,
            'nama_aset' => $nama_aset,
            'kd_pembelian' => $id_pembelian
         ];
         $this->db->insert('log_confirm_truck', $data_confirm);

         // print_r($data);exit;
         redirect('c_transaksi/lihat_pemb');
      }

      public function confirm_truck()
      {
         // $this->db->where('status =', 0);
         $list = $this->db->get('log_confirm_truck')->result();
         // print_r($list);exit;

         $data = [
            'list' => $list
         ];
         $this->template->load('template', 'pemb/confirm', $data);
      }

      public function update_confirm_truck($id)
      {
         // print_r($id);exit;
         $data = array(
            'status' => 1,
            'tgl_confirm' => date('Y-m-d')
         );
         $this->db->where('kd_pembelian', $id);
         $this->db->update('log_confirm_truck', $data);

         $data_truck = array(
            'is_confirm' => 1
         );
         $this->db->where('id_pembelian', $id);
         $this->db->update('truck_information', $data_truck);

         redirect('c_transaksi/confirm_truck');
      }

      public function delete_truck($id)
      {
         $data = array(
            'is_deleted' => 1,
         );
         $this->db->where('id', $id);
         $this->db->update('truck_information', $data);
         redirect('c_transaksi/lihat_pemb');
      }

      public function getDetailAset()
      {
         $id = $this->input->post('id_aset');
         $data = $this->model->getTruck($id)->result();
         echo json_encode($data);
      }

      public function pinjaman()
      {
         $data['index'] = $this->model->getIndex()->result();
         $this->template->load('template', 'pinjaman/index', $data);
      }

      public function form_pinjaman()
      {
         # code...
         $query1   = "SELECT  MAX(RIGHT(kode_pinjaman,3)) as kode FROM log_pinjaman";
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
         $datenow = date("Ymd");
         $no_trans   = "SP" . $datenow . $kd;
         $data['id'] = $no_trans;



         // $data['anggota'] = $this->model->anggota_pinjaman_dropdown();
         $this->db->where('is_deactive =', 0);
         $data['anggota'] = $this->db->get("peternak")->result();
         // print_r($data['anggota']);exit;
         $this->template->load('template', 'pinjaman/form', $data);
      }

      function syarat()
      {
         # code...
         $id_peternak = $this->input->post("id_peternak", TRUE);
         $data = $this->model->getSyarat($id_peternak)->row();
         echo json_encode($data);
      }

      function cek_utang()
      {
         $id_anggota = $this->input->post("id_peternak", TRUE);
         $data = $this->model->UtangPinjamanByMember($id_anggota)->row();
         echo json_encode($data);
      }

      public function simpan_pinjaman()
      {
         # code...
         $data = array(
            'kode_pinjaman' => $this->input->post("kode_simpanan"),
            'id_anggota' => $this->input->post("peternak"),
            'tanggal_pinjaman' => date("Y-m-d"),
            'nominal' => $this->input->post("biaya"),
            'sisa_pinjaman' => $this->input->post("biaya"),
         );
         $this->db->insert("log_pinjaman", $data);

         $log_bayar_pinjaman = [
            'id_anggota' => $this->input->post("peternak"),
            'nominal' => $this->input->post("biaya"),
            'kd_coa' => 1111
         ];
         $this->db->insert("log_bayar_pinjaman", $log_bayar_pinjaman);

         $this->db->set("pinjaman", $this->input->post("biaya"));
         $this->db->where("no_peternak", $this->input->post("peternak"));
         $this->db->update("peternak");
         // jurnal
         $debit = array(
            "id_jurnal" => $this->input->post("kode_simpanan"),
            "tgl_jurnal" => date("Y-m-d"),
            "no_coa" => 1115,
            "posisi_dr_cr" => "d",
            "nominal" => $this->input->post("biaya"),
         );
         $this->db->insert("jurnal", $debit);

         $kredit = array(
            "id_jurnal" => $this->input->post("kode_simpanan"),
            "tgl_jurnal" => date("Y-m-d"),
            "no_coa" => 1111,
            "posisi_dr_cr" => "k",
            "nominal" => $this->input->post("biaya"),
         );
         $this->db->insert("jurnal", $kredit);

         redirect("c_transaksi/pinjaman");
      }

      public function buku_pinjaman($peternak = '')
      {
         $peternak = $this->input->post('id_peternak');
         $data = [
            'nama_anggota'                => $this->model->get_nama_anggota($peternak),
         ];

         if (isset($peternak)) {
            # code...
            $data['list'] = $this->model->getListPinjaman($peternak)->result();
            $this->db->where('is_deactive =', 0);
            $data['peternak'] = $this->db->get('peternak')->result();
            $this->template->load('template', 'pinjaman/buku_pinjaman', $data);
         } else {
            $data['list'] = $this->model->getListPinjaman($peternak)->result();
            $this->db->where('is_deactive =', 0);
            $data['peternak'] = $this->db->get('peternak')->result();
            $this->template->load('template', 'pinjaman/buku_pinjaman', $data);
         }
      }

      // index pemb. aset // ini punya dila 
      public function pembelian_aset()
      {
         // $ itu = variabel
         $pembelian_aset = $this->db->get('pembelian_aset');
         $data['pembelian_aset'] = $pembelian_aset;

         // $detail =$this->model->detail_view();
         $detail = $this->db->get("pembelian_aset")->result();
         $data['detail'] = $detail;

         $this->template->load('template', 'pembelian_aset/index', $data);
      }

      function aset()
      {
         if ($this->input->post('id_supplier')) {
            echo $this->model->get_aset($this->input->post('id_supplier'));
         }
      }

      public function form_pembelian_aset()
      {
         $this->db->where('status', 'dalam proses');
         $query = $this->db->get('pembelian_aset');
         if ($query->num_rows() == 0) {
            // id pembelian
            $query1   = "SELECT  MAX(RIGHT(id_pembelian,3)) as kode FROM pembelian_aset";
            $abc      = $this->db->query($query1);
            $id_pembelian = "";
            if ($abc->num_rows() > 0) {
               foreach ($abc->result() as $k) {
                  $tmp = ((int) $k->kode) + 1;
                  $kd  = sprintf("%03s", $tmp);
               }
            } else {
               $kd = "001";
            }
            $datenow = date('Ymd');
            $id_pembelian   = "PMBAST" . $datenow . "" . $kd;

            // nota 
            $kd_nota   = "SELECT  MAX(RIGHT(no_nota, 3)) as kode FROM pembelian_aset";
            $abc      = $this->db->query($kd_nota);
            $no_nota = "";
            if ($abc->num_rows() > 0) {
               foreach ($abc->result() as $k) {
                  $tmp = ((int) $k->kode) + 1;
                  $kd  = sprintf("%03s", $tmp);
               }
            } else {
               $kd = "001";
            }
            $datenow = date('Ymd');
            $no_nota   = "NOTA" . $datenow . "" . $kd;

            $input = array(
               'id_pembelian' => $id_pembelian,
               'no_nota' => $no_nota,
               'total' => 0,
               'status' => 'dalam proses'
            );
            $this->db->insert('pembelian_aset', $input);
         } else {
            $id_pembelian = $query->row()->id_pembelian;
            $no_nota = $query->row()->no_nota;
         }
         $data['id'] = $id_pembelian;
         $data['no_nota'] = $no_nota;

         // id detail aset 
         $query1 = "SELECT  MAX(RIGHT(id_detail_aset,3)) as id_detail FROM detail_pembelian";
         $abc = $this->db->query($query1);
         $id_detail = "";
         if ($abc->num_rows() > 0) {
            foreach ($abc->result() as $k) {
               $tmp = ((int)$k->id_detail) + 1;
               $kd = sprintf("%03s", $tmp);
            }
         } else {
            $kd = "001";
         }
         $id_detail = "IDA-" . $kd;
         $data['id_detail'] = $id_detail;

         $supplier = $this->supplier_dropdown();
         $data['supplier'] = $supplier;

         // detail
         $data['detail'] = $this->model->get_detail($id_pembelian);
         // print_r($data['detail']);exit;
         // cek nmr transaksi 
         $this->db->where("id_pembelian", $id_pembelian);
         $data['cek'] = $this->db->get("detail_pembelian")->result();


         $querytotal = "SELECT SUM(subtotal) as total FROM detail_pembelian WHERE id_pembelian = '$id_pembelian'";
         $data['total'] = $this->db->query($querytotal)->row()->total;

         // ambil nilai sisa
         $ns = "SELECT SUM(nilai_sisa) as total_sisa FROM detail_pembelian WHERE id_pembelian = '$id_pembelian' ";
         $data['nilai_sisa'] = $this->db->query($ns)->row()->total_sisa;

         $this->template->load('template', 'pembelian_aset/form', $data);
      }

      public function perolehanDetail($id_pembelian)
      {
         $data['id'] = $id_pembelian;

         $this->db->select("id_pembelian, tgl_input, no_nota");
         $this->db->where("id_pembelian", $id_pembelian);
         $data['pembelian_aset'] = $this->db->get("pembelian_aset")->row();

         // get detailnya
         $this->db->select("detail_pembelian.id_pembelian, detail_pembelian.id_detail_aset, no_nota , tgl_input, id_aset, aset, detail_pembelian.id_supplier, nama_supplier, nominal, subtotal, biaya, nilai_sisa, subtotal");
         $this->db->join("pembelian_aset", "pembelian_aset.id_pembelian = detail_pembelian.id_pembelian");
         $this->db->join("aset", "aset.id = detail_pembelian.id_aset");
         $this->db->join("supplier_aset", "supplier_aset.id = detail_pembelian.id_supplier");
         $this->db->where("detail_pembelian.id_pembelian", $id_pembelian);
         $data['detailPerolehan'] = $this->db->get("detail_pembelian")->result();
         // print_r($data['detailPerolehan']);exit;

         $this->template->load('template', 'pembelian_aset/detail', $data);
      }

      public function tambahPembelianAset()
      {
         $id_pembelian = $this->input->post("id");
         $no_nota = $this->input->post("no_nota");
         $tgl_nota = $this->input->post("tgl_pembelian");
         $tgl_input = $this->input->post("tgl_input");
         $biaya = str_replace(".", "", $this->input->post("biaya"));
         $harga_aset = str_replace(".", "", $this->input->post("harga_aset"));
         $nilai_sisa = str_replace(".", "", $this->input->post("nilai_residu"));
         $status = $this->input->post("");
         $id_supplier = $this->input->post("id_supplier");
         $id_aset = $this->input->post("id_aset");
         $id_detail_aset = $this->input->post("id_detail_aset");
         $jumlah = $this->input->post("jumlah");

         // print_r($jumlah);exit;
         // $total = $biaya + ( $harga_aset * $jumlah);  
         $total = $biaya + ($harga_aset);
         // print_r($total);exit;
         $this->db->where("id_pembelian", $id_pembelian);
         $cek = $this->db->get("pembelian_aset")->row();

         $query = $this->db->get("detail_pembelian");
         // print_r($query);exit;
         if ($cek->no_nota == NULL) {
            # code...
            $this->db->where('id_pembelian', $id_pembelian);
            $this->db->set('no_nota', $no_nota);
            // $this->db->set('tgl_nota', $tgl_nota);
            $this->db->update('pembelian_aset');

            // ambil umur 
            $this->db->where('id', $id_aset);
            $umur = $this->db->get("aset")->row()->umur_aset;

            // coba 
            $data_detail = [];
            for ($i = 0; $i < $jumlah; $i++) {
               $data_detail[] = array(
                  "id_pembelian" => $id_pembelian[$i],
                  "id_aset" => $id_aset[$i],
                  "id_supplier" => $id_supplier[$i],
                  "nominal" => $harga_aset[$i],
                  "biaya" => $biaya[$i],
                  "nilai_sisa" => $nilai_sisa[$i],
                  "subtotal" => $total[$i],
                  "sisa_umur" => $umur[$i],
                  "sisa_umur_aset" => $umur[$i],
                  "tgl_nota" => $tgl_nota[$i],
                  "id_detail_aset" => $id_detail_aset[$i],
               );
            }
            // print_r($data_detail);exit;
            $this->db->insert_batch('detail_pembelian', $data_detail);
         } else {
            // ambil umur 
            $this->db->where('id', $id_aset);
            $umur = $this->db->get("aset")->row()->umur_aset;

            // coba 
            $data_detail = [];
            for ($i = 0; $i < $jumlah; $i++) {
               // baru nyoba2 doang ini
               // $detail_fix = substr($id_detail_aset, 6) + $i;
               $getlastid = "SELECT MAX(RIGHT(id_detail_aset, 3)) as last_detail from detail_pembelian";
               $abc = $this->db->query($getlastid);
               // print_r($abc);exit;
               if ($abc->num_rows() > 0) {
                  foreach ($abc->result() as $k) {
                     $tmp = ((int) $k->last_detail) + $i + 1;
                     $kd  = sprintf("%03s", $tmp);
                  }
               } else {
                  $kd = "001";
               }
               // $tmp = ((int)$k->id_detail)+1;
               // $kd = sprintf("%03s", $detail_fix);
               $kode = 'IDA-' . $kd;
               // print_r($kode);exit;
               $data_detail[] = array(
                  "id_pembelian" => $id_pembelian,
                  "id_aset" => $id_aset,
                  "id_supplier" => $id_supplier,
                  "nominal" => $harga_aset,
                  "biaya" => $biaya,
                  "nilai_sisa" => $nilai_sisa,
                  "subtotal" => $total,
                  "sisa_umur" => $umur,
                  "sisa_umur_aset" => $umur,
                  "id_detail_aset" => $kode
               );
            }
            // print_r($data_detail);exit;
            $this->db->insert_batch('detail_pembelian', $data_detail);
         }
         redirect('c_transaksi/form_pembelian_aset');
      }

      public function selesai($id, $total)
      {
         // print_r($id);exit;
         $this->db->where('id_pembelian', $id);
         $this->db->set('tgl_input', date("Y-m-d"));
         $this->db->set('status', 'selesai');
         $this->db->set('total', $total);
         $this->db->update('pembelian_aset');

         // $this->db->select("aset");
         // $this->db->join("detail_pembelian", "detail_pembelian.id_aset = aset.id");
         // $this->db->where("detail_pembelian.id_pembelian", $id); 
         // $nama_aset = $this->db->get("aset")->result();

         $getAset = "SELECT kel_akun, nama_coa
      FROM aset a
      INNER JOIN detail_pembelian b ON a.id = b.id_aset
      INNER JOIN coa c ON a.kel_akun = c.no_coa
      WHERE b.id_pembelian = '$id'
      ";
         $aset = $this->db->query($getAset)->row()->kel_akun;

         // // jurnal
         $pemb_aset = array(
            'id_jurnal' => $id,
            'tgl_jurnal' => date("Y-m-d"),
            'no_coa' => $aset,
            'posisi_dr_cr' => "d",
            'nominal' => $total,
         );
         $this->db->insert("jurnal", $pemb_aset);

         $pemb_aset_kredit = array(
            'id_jurnal' => $id,
            'tgl_jurnal' => date("Y-m-d"),
            'no_coa' => 1111,
            'posisi_dr_cr' => "k",
            'nominal' => $total,
         );
         $this->db->insert("jurnal", $pemb_aset_kredit);

         redirect("c_transaksi/pembelian_aset");
      }

      private function supplier_dropdown()
      {
         # code...
         $sql = $this->db->select('*')
            ->from('supplier_aset')
            ->get()
            ->result();
         return $sql;
      }

      public function isi_edit_pemb($id)
      {
         $data['id'] = $id;
         $this->db->where('no_trans', $id);
         $data['no_trans'] = $this->db->get('pembelian_bb')->row()->no_trans;
         $this->db->where('no_trans', $id);
         $data['tgl'] = $this->db->get('pembelian_bb')->row()->tgl_trans;


         $this->db->where('no_trans', $id);
         $this->db->select('status');
         $data['cek'] = $this->db->get('pembelian_bb')->row()->status;

         //DETAIL
         $this->db->select('nama_bb, a.jumlah, harga,satuan,nama_peternak, a.no_peternak');
         $this->db->from('detail_pembelian_bb a');
         $this->db->join('peternak b', 'a.no_peternak = b.no_peternak');
         $this->db->join('bahan_baku c', 'a.no_bb = c.no_bb');
         $this->db->where('no_trans', $id);
         $data['detail'] = $this->db->get()->result_array();

         //CEK SELESAI BELANJA JADI NON KLIKK!



         $this->template->load('template', 'pemb/update', $data);
         // var_dump($data['cek_selesai']);
      }

      public function form_pemb()
      {
         $query1   = "SELECT  MAX(RIGHT(no_trans,3)) as kode FROM pembelian_bb";
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
         $no_trans   = "PMB_" . $kd;
         $data['id'] = $no_trans;


         //UPDATE TABEL PEMBELIAN_BB
         $this->db->where('no_trans', $no_trans);
         $this->db->select_sum('subtotal');
         $data['total'] = $this->db->get('detail_pembelian_bb')->row()->subtotal;

         //kondisi di tambah pembeliannya
         $this->db->where('no_trans', $no_trans);
         $this->db->select_sum('jumlah');
         $data['cek_jml_pmb'] = $this->db->get('detail_pembelian_bb')->row()->jumlah;
         // $data['cek_selesai'] = $this->db->query($query1)->num_rows();
         $this->db->where('no_trans', $no_trans);
         $data['cek_selesai'] = $this->db->get('detail_pembelian_bb')->num_rows();

         $this->db->where('is_deactive =', 0);
         $data['peternak'] = $this->db->get('peternak')->result_array();

         $this->db->select_sum('subtotal');
         $this->db->where('no_trans', $no_trans);
         $data['total'] = $this->db->get('detail_pembelian_bb')->row()->subtotal;

         $this->db->select('nama_bb, a.jumlah, harga,satuan,nama_peternak, a.no_peternak');
         $this->db->from('detail_pembelian_bb a');
         $this->db->join('peternak b', 'a.no_peternak = b.no_peternak');
         $this->db->join('bahan_baku c', 'a.no_bb = c.no_bb');
         $this->db->where('no_trans', $no_trans);
         $data['detail'] = $this->db->get()->result_array();

         $this->template->load('template', 'pemb/form', $data);
      }

      public function tambah_pemb()
      {
         $config = array(

            array(
               'field' => 'jumlah',
               'label' => 'Jumlah',
               'rules' => 'required|is_natural_no_zero',
               'errors' => array(
                  'required' => '%s tidak boleh kosong!',
                  'is_natural_no_zero' => '%s hanya berupa angka 1-9!'
               )
            ),
            array(
               'field' => 'no_peternak',
               'label' => 'Nama Peternak',
               'rules' => 'required',
               'errors' => array(
                  'required' => '%s tidak boleh kosong!'
               )
            ),
            array(
               'field' => 'harga',
               'label' => 'Harga',
               'rules' => 'required|is_natural_no_zero',
               'errors' => array(
                  'required' => '%s tidak boleh kosong!',
                  'is_natural_no_zero' => '%s hanya berupa angka 1-9!'
               )
            )
         );
         $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
         $this->form_validation->set_rules($config);

         if ($this->form_validation->run() == FALSE) {
            $this->form_pemb();
         } else {
            // $id = $_POST['no_trans'];
            // $this->db->where('no_trans', $id);
            // $this->db->select_sum('jumlah');
            // $cek = $this->db->get('detail_pembelian_bb')->row()->jumlah;
            // $total = $cek + $_POST['jumlah'];
            // $jumlah_total = 150000;
            // if($total <= $jumlah_total){
            $this->db->where('no_bb', $_POST['no_bb']);
            $harga = $_POST['harga'];
            $data = array(
               'no_trans' => $_POST['no_trans'],
               'no_bb' => $_POST['no_bb'],
               'jumlah' => $_POST['jumlah'],
               'harga' => $harga,
               'subtotal' => $_POST['jumlah'] * $harga,
               'no_peternak' => $_POST['no_peternak']
            );

            $subtotal = $_POST['jumlah'] * $harga;



            $this->db->where(array('no_trans' => $_POST['no_trans'], 'no_peternak' => $_POST['no_peternak'], 'harga' => $_POST['harga']));
            $cek =  $this->db->get('detail_pembelian_bb')->num_rows();
            if ($cek == 0) {
               $this->db->insert('detail_pembelian_bb', $data);
            } else {

               $this->db->set('subtotal', "subtotal + " . $subtotal . "", FALSE);
               $this->db->set('jumlah', "jumlah + " . $_POST['jumlah'] . "", FALSE);
               $this->db->where(array('no_trans' => $_POST['no_trans'], 'no_peternak' => $_POST['no_peternak'], 'harga' => $_POST['harga']));
               $this->db->update('detail_pembelian_bb');
            }
            redirect('c_transaksi/form_pemb');

            ////////////////////////////////////////////////////////////
            ///////////////////////////////////////////////////////////
            //          }else{
            //              $data['error'] = 'Jumlah pembelian melebihi batasan pembelian!';
            //               $query1   = "SELECT  MAX(RIGHT(no_trans,3)) as kode FROM pembelian_bb";
            //       $abc      = $this->db->query($query1);
            //       $no_trans = "";
            //       if ($abc->num_rows() > 0) {
            //          foreach ($abc->result() as $k) {
            //             $tmp = ((int) $k->kode) + 1;
            //             $kd  = sprintf("%03s", $tmp);
            //          }
            //       } else {
            //          $kd = "001";
            //       }
            //       $no_trans   = "PMB_" . $kd;
            //       $data['id'] = $no_trans;


            //    //UPDATE TABEL PEMBELIAN_BB
            //    $this->db->where('no_trans', $no_trans);
            //    $this->db->select_sum('subtotal');
            //    $data['total'] = $this->db->get('detail_pembelian_bb')->row()->subtotal;

            //    //kondisi di tambah pembeliannya
            //    $this->db->where('no_trans', $no_trans);
            //    $this->db->select_sum('jumlah');
            //    $data['cek_jml_pmb'] = $this->db->get('detail_pembelian_bb')->row()->jumlah;


            //     // $data['cek_selesai'] = $this->db->query($query1)->num_rows();
            //    $this->db->where('no_trans', $no_trans);
            //    $data['cek_selesai'] = $this->db->get('detail_pembelian_bb')->num_rows();
            //     $data['peternak'] = $this->db->get('peternak')->result_array();

            //     $this->db->select_sum('subtotal');
            //     $this->db->where('no_trans', $no_trans);
            //     $data['total'] = $this->db->get('detail_pembelian_bb')->row()->subtotal;


            //    $this->db->select('nama_bb, a.jumlah, harga,satuan,nama_peternak, a.no_peternak');
            //    $this->db->from('detail_pembelian_bb a');
            //    $this->db->join('peternak b', 'a.no_peternak = b.no_peternak');
            //    $this->db->join('bahan_baku c', 'a.no_bb = c.no_bb');
            //    $this->db->where('no_trans', $no_trans);
            //    $data['detail'] = $this->db->get()->result_array();

            //       $this->template->load('template', 'pemb/form', $data);

            // }
         }
      }


      public function selesai_pemb($id, $total)
      {
         $data = array(
            'no_trans' => $id,
            'tgl_trans' => date('Y-m-d'),
            'total' => $total,
            'status' => '1'
         );
         $this->db->insert('pembelian_bb', $data);

         // jurnal 
         $data_d = [
            'id_jurnal' => $id,
            'tgl_jurnal' => date('Y-m-d'),
            'no_coa' => 1112,
            'posisi_dr_cr' => 'd',
            'nominal' => $total,
         ];
         $this->db->insert('jurnal', $data_d);

         $data_k = [
            'id_jurnal' => $id,
            'tgl_jurnal' => date('Y-m-d'),
            'no_coa' => 2111,
            'posisi_dr_cr' => 'k',
            'nominal' => $total,
         ];
         $this->db->insert('jurnal', $data_k);

         redirect('c_transaksi/lihat_pemb');
      }

      //Cek kualitas
      public function lihat_ck()
      {
         $this->db->where('tgl_trans', date('Y-m-d'));
         $cek = $this->db->get('cek_kualitas')->result();
         $date = date('Y-m-d');
         $query1   = "SELECT  MAX(no_trans) as kode FROM cek_kualitas";
         $cek_trans = $this->db->query($query1)->row_array();
         $cek_trans1 = $cek_trans['kode'];
         $query2 = "SELECT * FROM cek_kualitas
                WHERE no_trans = '$cek_trans1' AND status > 0 AND tgl_trans = '$date'";
         $cek1 = $this->db->query($query2)->result();
         $data['cek'] = $cek;
         $data['cek1'] = $cek1;
         if ($cek1 == TRUE) {
            $data['error'] = 'Cek Kualitas untuk hari ini sudah dilakukan!';
         }

         $data['result'] = $this->db->get('cek_kualitas')->result_array();
         $this->template->load('template', 'ck/view', $data);
         // var_dump($query2);
      }

      public function isi_edit_ck($id)
      {
         $data['no_trans'] = $id;

         $this->db->where('no_trans', $id);
         $data['tgl'] = $this->db->get('cek_kualitas')->row()->tgl_trans;




         //-------------------------------------------------------------------------------//
         //detail
         $this->db->where('no_trans', $id);
         $data['detail'] = $this->db->get('detail_cek_kualitas')->result_array();


         $this->template->load('template', 'ck/update', $data);
      }

      public function form_ck()
      {
         $query1   = "SELECT  MAX(RIGHT(no_trans,3)) as kode FROM cek_kualitas";
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
         $no_trans   = "CK_" . $kd;
         $data['id'] = $no_trans;

         $this->db->where('status', '1');
         $this->db->select('a.no_trans, a.tgl_trans');
         $this->db->select_sum('jumlah');
         $this->db->from('pembelian_bb a');
         $this->db->join('detail_pembelian_bb b', 'a.no_trans = b.no_trans');
         $this->db->group_by('a.no_trans');
         $data['pbb'] = $this->db->get()->result_array();

         //detail
         $this->db->where('no_trans', $no_trans);
         $data['detail'] = $this->db->get('detail_cek_kualitas')->result_array();

         //cek total lulus
         $this->db->select_sum('lulus');
         $this->db->where('no_trans', $no_trans);
         $data['cek_lulus'] = $this->db->get('detail_cek_kualitas')->row_array()['lulus'];

         $this->template->load('template', 'ck/form', $data);
         // var_dump($data['cek_lulus']);
      }

      public function tambah_ck()
      {
         $config = array(

            array(
               'field' => 'pbb',
               'label' => 'ID Pembelian Bahan baku',
               'rules' => 'required',
               'errors' => array(
                  'required' => '%s tidak boleh kosong!'
               )
            ),
            array(
               'field' => 'lulus',
               'label' => 'Lulus Uji Lab',
               'rules' => 'required|is_natural_no_zero',
               'errors' => array(
                  'required' => '%s tidak boleh kosong!',
                  'is_natural_no_zero' => '%s hanya berupa angka 1-9!'
               )
            )
         );
         $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
         $this->form_validation->set_rules($config);

         if ($this->form_validation->run() == FALSE) {
            $this->form_ck();
         } else {
            $id_pmb = $_POST['pbb'];
            $id = $_POST['no_trans'];
            $this->db->where('no_trans', $id);
            $this->db->select_sum('lulus');
            $cek_lulus = $this->db->get('detail_cek_kualitas')->row_array()['lulus'];
            $total_lulus = $cek_lulus + $_POST['lulus'];
            // if($total_lulus >= 140000){

            $this->db->where('no_trans', $id_pmb);
            $this->db->select_sum('jumlah');
            $jumlah = $this->db->get('detail_pembelian_bb')->row_array()['jumlah'];
            $gagal = $jumlah - $_POST['lulus'];

            $this->db->where('no_trans', $id_pmb);
            $this->db->select_sum('subtotal');
            $subtotal = $this->db->get('detail_pembelian_bb')->row_array()['subtotal'];

            $data = array(
               'no_trans' => $id,
               'no_trans_pmb' => $id_pmb,
               'lulus' => $_POST['lulus'],
               'gagal' => $gagal,
               'total' => $jumlah,
               'subtotal' => $subtotal
            );

            $this->db->insert('detail_cek_kualitas', $data);


            $this->db->set('status', '2', FALSE);
            $this->db->where('no_trans', $id_pmb);
            $this->db->update('pembelian_bb');

            redirect('c_transaksi/form_ck');
            // }else{
            //  $data['error'] = 'Jumlah lulus melebihi batasan (140.000 Liter)!';
            //    $query1   = "SELECT  MAX(RIGHT(no_trans,3)) as kode FROM cek_kualitas";
            //     $abc      = $this->db->query($query1);
            //     $no_trans = "";
            //     if ($abc->num_rows() > 0) {
            //        foreach ($abc->result() as $k) {
            //           $tmp = ((int) $k->kode) + 1;
            //           $kd  = sprintf("%03s", $tmp);
            //        }
            //     } else {
            //        $kd = "001";
            //     }
            //     $no_trans   = "CK_" . $kd;
            //     $data['id'] = $no_trans;

            //     $this->db->where('status', '1');
            //     $this->db->select('a.no_trans, a.tgl_trans');
            //     $this->db->select_sum('jumlah');
            //     $this->db->from('pembelian_bb a');
            //     $this->db->join('detail_pembelian_bb b', 'a.no_trans = b.no_trans');
            //     $this->db->group_by('a.no_trans');
            //     $data['pbb'] = $this->db->get()->result_array();

            //     //detail
            //     $this->db->where('no_trans', $no_trans);
            //     $data['detail'] = $this->db->get('detail_cek_kualitas')->result_array();

            //     //cek total lulus
            //     $this->db->select_sum('lulus');
            //     $this->db->where('no_trans', $no_trans);
            //     $data['cek_lulus'] = $this->db->get('detail_cek_kualitas')->row_array()['lulus'];


            //     $this->template->load('template', 'ck/form', $data);
            // }
         }
      }

      public function selesai_ck($id)
      {


         $data = array(
            'no_trans' => $id,
            'tgl_trans' => date('Y-m-d'),
            'status' => '1'
         );
         $this->db->insert('cek_kualitas', $data);

         $this->db->where('no_trans', $id);
         $this->db->select_sum('lulus');
         $lulus = $this->db->get('detail_cek_kualitas')->row_array()['lulus'];

         $this->db->set('stok', "stok +" . $lulus . "", FALSE);
         $this->db->where('no_bb', 'BB_001');
         $this->db->update('bahan_baku');

         //kartu stok

         $this->db->where('no_trans', $id);
         $this->db->select_sum('subtotal');
         $subtotal = $this->db->get('detail_cek_kualitas')->row_array()['subtotal'];

         $this->db->where('no_trans', $id);
         $this->db->select_sum('total');
         $ttl = $this->db->get('detail_cek_kualitas')->row_array()['total'];

         $total = ($lulus / $ttl) * $subtotal;
         $this->M_keuangan->GenerateJurnal('1112', $id, 'd', $total);
         $this->M_keuangan->GenerateJurnal('1111', $id, 'k', $total);


         //--------------------------------------------------------------------------//
         // kartu stok
         $data1 = array(
            'no_trans' => $id,
            'tgl_trans' => date('Y-m-d H:i:s'),
            'no_bp' => 'BB_001',
            'unit1' => $lulus,
            'harga1' => $total / $lulus,
            'total1' => $total,
            'unit2' => '-',
            'harga2' => '-',
            'total2' => '-',
            'unit3' => $lulus,
            'harga3' => $total / $lulus,
            'total3' => $total,
            'status_pro' => 0,
            'status_pen' => 0
         );
         $this->db->insert('kartu_stok_bp', $data1);
         redirect('c_transaksi/lihat_ck');
      }

      //PEMBELIAN BAHAN PENOLONG
      public function lihat_pembp()
      {


         $data['result'] = $this->db->get('pembelian_bp')->result_array();
         $this->template->load('template', 'pembp/view', $data);
      }

      public function form_pembp()
      {
         $query1   = "SELECT  MAX(RIGHT(no_trans,3)) as kode FROM pembelian_bp";
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
         $no_trans   = "PMBP_" . $kd;
         $data['id'] = $no_trans;

         $data['bp'] = $this->db->get('bahan_penolong')->result_array();
         $data['supp'] = $this->db->get('supplier_bp')->result_array();

         $this->db->where('no_trans', $no_trans);
         $this->db->select_sum('subtotal');
         $data['total'] = $this->db->get('detail_pembelian_bp')->row_array()['subtotal'];

         $this->db->where('no_trans', $no_trans);
         $this->db->select('no_trans, nama_bp,satuan,harga, jumlah, a.no_supp_bp, nama_supp_bp');
         $this->db->from('detail_pembelian_bp a');
         $this->db->join('bahan_penolong b', 'a.no_bp = b.no_bp');
         $this->db->join('supplier_bp c', 'a.no_supp_bp = c.no_supp_bp');
         $data['detail'] = $this->db->get()->result_array();


         $this->template->load('template', 'pembp/form', $data);
      }

      public function isi_edit_pembp($id)
      {
         $data['no_trans'] = $id;
         $this->db->where('no_trans', $id);
         $data['tgl'] = $this->db->get('pembelian_bp')->row_array()['tgl_trans'];

         $this->db->where('no_trans', $id);
         $this->db->select('no_trans, nama_bp,satuan,harga, jumlah, a.no_supp_bp, nama_supp_bp');
         $this->db->from('detail_pembelian_bp a');
         $this->db->join('bahan_penolong b', 'a.no_bp = b.no_bp');
         $this->db->join('supplier_bp c', 'a.no_supp_bp = c.no_supp_bp');
         $data['detail'] = $this->db->get()->result_array();
         $this->template->load('template', 'pembp/update', $data);
      }

      public function tambah_pembp()
      {
         $config = array(

            array(
               'field' => 'no_bp',
               'label' => 'Bahan Penolong',
               'rules' => 'required',
               'errors' => array(
                  'required' => '%s tidak boleh kosong!'
               )
            ),
            array(
               'field' => 'jumlah',
               'label' => 'Jumlah',
               'rules' => 'required|is_natural_no_zero',
               'errors' => array(
                  'required' => '%s tidak boleh kosong!',
                  'is_natural_no_zero' => '%s hanya berupa angka 1-9!'
               )
            ),
            array(
               'field' => 'harga',
               'label' => 'Harga',
               'rules' => 'required|is_natural_no_zero',
               'errors' => array(
                  'required' => '%s tidak boleh kosong!',
                  'is_natural_no_zero' => '%s hanya berupa angka 1-9!'
               )
            ),
            array(
               'field' => 'no_supp_bp',
               'label' => 'Supplier',
               'rules' => 'required',
               'errors' => array(
                  'required' => '%s tidak boleh kosong!'
               )
            ),

         );
         $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
         $this->form_validation->set_rules($config);

         if ($this->form_validation->run() == FALSE) {
            $this->form_pembp();
         } else {
            $subtotal = 0;
            $subtotal = $_POST['jumlah'] * $_POST['harga'];
            $data = array(
               'no_trans' => $_POST['no_trans'],
               'no_bp' => $_POST['no_bp'],
               'jumlah' => $_POST['jumlah'],
               'harga' => $_POST['harga'],
               'subtotal' => $subtotal,
               'no_supp_bp' => $_POST['no_supp_bp'],
               'jumlah_kartu_stok' => $_POST['jumlah']
            );

            $this->db->set('stok', "stok + " . $_POST['jumlah'] . "", FALSE);
            $this->db->where('no_bp', $_POST['no_bp']);
            $this->db->update('bahan_penolong');

            $this->db->where(array('no_trans' => $_POST['no_trans'], 'no_supp_bp' => $_POST['no_supp_bp'], 'no_bp' => $_POST['no_bp'], 'harga' => $_POST['harga']));
            $cek =  $this->db->get('detail_pembelian_bp')->num_rows();
            if ($cek == 0) {
               $this->db->insert('detail_pembelian_bp', $data);
            } else {

               $this->db->set('subtotal', "subtotal + " . $subtotal . "", FALSE);
               $this->db->set('jumlah', "jumlah + " . $_POST['jumlah'] . "", FALSE);
               $this->db->set('jumlah_kartu_stok', "jumlah_kartu_stok + " . $_POST['jumlah'] . "", FALSE);
               $this->db->where(array('no_trans' => $_POST['no_trans'], 'no_supp_bp' => $_POST['no_supp_bp'], 'no_bp' => $_POST['no_bp'], 'harga' => $_POST['harga']));
               $this->db->update('detail_pembelian_bp');
            }

            redirect('c_transaksi/form_pembp');
         }
      }


      public function selesai_pembp($id, $total)
      {
         $data = array(
            'no_trans' => $id,
            'tgl_trans' => date('Y-m-d'),
            'total' => $total,
            'status' => '1'
         );
         $this->db->insert('pembelian_bp', $data);


         $this->M_keuangan->GenerateJurnal('1113', $id, 'd', $total);
         $this->M_keuangan->GenerateJurnal('1111', $id, 'k', $total);





         $this->db->where('no_trans', $id);
         $this->db->select('no_bp');
         $this->db->group_by('no_bp');
         $list_bp = $this->db->get('detail_pembelian_bp')->result_array();

         foreach ($list_bp as $data) {
            $no_bp = $data['no_bp'];
            $this->db->where('no_bp', $no_bp);
            $cek_kartu_stok = $this->db->get('kartu_stok_bp')->num_rows();
            $this->db->where('no_trans', $id);
            $this->db->where('no_bp', $data['no_bp']);
            $isi_bp = $this->db->get('detail_pembelian_bp')->result_array();


            if ($cek_kartu_stok > 0) {
               $jumlah = 0;
               $harga = 0;
               $total = 0;
               foreach ($isi_bp as $data) {
                  # code...
                  $array = [
                     'no_trans'  => $id,
                     'tgl_trans' => date('Y-m-d H:i:s'),
                     'no_bp' => $no_bp,
                     'unit1'     => $data['jumlah'],
                     'harga1'    => $data['harga'],
                     'total1'    => $data['subtotal'],
                     'unit2'     => '-',
                     'harga2'    => '-',
                     'total2'    => '-',
                     'unit3'     => '-',
                     'harga3'    => '-',
                     'total3'    => '-',
                     'status_pro' => 0,
                     'status_pen' => 0
                  ];
                  $this->db->insert('kartu_stok_bp', $array);
                  $jumlah = $jumlah + $data['jumlah'];
                  $total = $total + $data['subtotal'];
               }
               $q1 = "SELECT no FROM kartu_stok_bp WHERE no_trans = '$id' AND no_bp = '$no_bp' ORDER BY no DESC";
               $last_no_id = $this->db->query($q1)->row_array()['no'];

               $query = "SELECT unit3, total3 FROM kartu_stok_bp WHERE no_bp = '$no_bp' AND unit3 NOT LIKE '-' ORDER BY no DESC";
               $unit3 = $this->db->query($query)->row_array()['unit3'];
               $total3 = $this->db->query($query)->row_array()['total3'];

               $fix_jumlah = $jumlah + $unit3;
               $fix_total = $total + $total3;
               $fix_harga = $fix_total / $fix_jumlah;
               $this->db->set('unit3', $fix_jumlah);
               $this->db->set('harga3', $fix_harga);
               $this->db->set('total3', $fix_total);
               $this->db->where('no_trans', $id);
               $this->db->where('no', $last_no_id);
               $this->db->where('no_bp', $no_bp);
               $this->db->update('kartu_stok_bp');


               $this->db->set('stok', "stok + " . $jumlah . "", FALSE);
               $this->db->where('no_bp', $no_bp);
               $this->db->update('bahan_penolong');
            } else {
               $jumlah = 0;
               $total = 0;
               foreach ($isi_bp as $data) {
                  # code...
                  $array = [
                     'no_trans'  => $id,
                     'tgl_trans' => date('Y-m-d H:i:s'),
                     'no_bp' => $no_bp,
                     'unit1'     => $data['jumlah'],
                     'harga1'    => $data['harga'],
                     'total1'    => $data['subtotal'],
                     'unit2'     => '-',
                     'harga2'    => '-',
                     'total2'    => '-',
                     'unit3'     => '-',
                     'harga3'    => '-',
                     'total3'    => '-',
                     'status_pro' => 0,
                     'status_pen' => 0
                  ];
                  $this->db->insert('kartu_stok_bp', $array);
                  $jumlah = $jumlah + $data['jumlah'];
                  $total = $total + $data['subtotal'];
               }
               $harga = $total / $jumlah;
               $q1 = "SELECT no FROM kartu_stok_bp WHERE no_trans = '$id' AND no_bp = '$no_bp' ORDER BY no DESC";
               $last_no_id = $this->db->query($q1)->row_array()['no'];
               $this->db->set('unit3', $jumlah);
               $this->db->set('harga3', $harga);
               $this->db->set('total3', $total);
               $this->db->where('no_trans', $id);
               $this->db->where('no', $last_no_id);
               $this->db->where('no_bp', $no_bp);
               $this->db->update('kartu_stok_bp');


               $this->db->set('stok', "stok + " . $jumlah . "", FALSE);
               $this->db->where('no_bp', $no_bp);
               $this->db->update('bahan_penolong');
            }
         }
         //     // echo "<pre>"; print_r($vali); echo "</pre>"; die();


         //      foreach ($list_bp as $data) {

         //       $no_bp = $data['no_bp'];
         //     // udpate kartus stok
         //       // $nop  = $this->db->where('no_trans', $_POST['no_prod'])->order_by('no_trans DESC')->get('detail_produksi_ke1')->row_array();
         //       $vali = $this->db->where('no_bp', $no_bp)->get('kartu_stok_bp');
         //     // echo "<pre>"; print_r($vali); echo "</pre>"; die();
         //       if ($vali->num_rows() > 0) {
         //         $tes =  $this->db->where(array('no_bp' => $no_bp, 'unit3 >' => 0, 'status_pro' => 0))->get('kartu_stok_bp')->result_array();
         //         // echo "<pre>"; print_r($tes); echo "</pre>";die(); 

         //         foreach ($tes as $data) {

         //             $array = [
         //               'no_trans'  => $id,
         //               'tgl_trans' => date('Y-m-d H:i:s'),
         //               'no_bp' => $no_bp,
         //               'unit1'     => '-',
         //               'harga1'    => '-',
         //               'total1'    => '-',
         //               'unit2'     => '-',
         //               'harga2'    => '-',
         //               'total2'    => '-',
         //               'unit3'     => $data['unit3'],
         //               'harga3'    => $data['harga3'],
         //               'total3'    => $data['total3'],
         //               'status_pro'=> 0,
         //               'status_pen'=> 0
         //             ];
         //             // echo "<pre>"; print_r($array); echo "</pre>";

         //             $this->db->insert('kartu_stok_bp', $array);

         //             $this->db->where(array('no_trans' => $data['no_trans'], 'no_bp' => $no_bp, 'status_pro' => 0))->set('status_pro', 1)->update('kartu_stok_bp');
         //         }
         //         // die('hai dia');
         //         // echo "<pre>"; print_r($tes); echo "</pre>"; die();
         //         $this->db->where('no_trans', $id);
         //         $this->db->where('no_bp', $no_bp);
         //         $this->db->select('jumlah,harga,subtotal,no_bp');
         //         $get_detail_bp = $this->db->get('detail_pembelian_bp')->result_array();
         //         foreach ($get_detail_bp as $data) {

         //         $iks = [
         //           'no_trans'  => $id,
         //           'tgl_trans' => date('Y-m-d H:i:s'),
         //           'no_bp' => $data['no_bp'],
         //           'unit1'     => $data['jumlah'],
         //           'harga1'    => $data['harga'],
         //           'total1'    => $data['subtotal'],
         //           'unit2'     => '-',
         //           'harga2'    => '-',
         //           'total2'    => '-',
         //           'unit3'     => $data['jumlah'],
         //           'harga3'    => $data['harga'],
         //           'total3'    => $data['subtotal'],
         //           'status_pro'=> 0,
         //           'status_pen'=> 0
         //         ];

         //         $this->db->insert('kartu_stok_bp', $iks);

         //         }

         //       } else {
         //         // die('hai aku');
         //         $this->db->where('no_trans', $id);
         //         $this->db->where('no_bp', $no_bp);
         //         $this->db->select('jumlah,harga,subtotal,no_bp');
         //         $get_detail_bp = $this->db->get('detail_pembelian_bp')->result_array();
         //         foreach ($get_detail_bp as $data) {

         //         $iks = [
         //           'no_trans'  => $id,
         //           'tgl_trans' => date('Y-m-d H:i:s'),
         //           'no_bp' => $data['no_bp'],
         //           'unit1'     => $data['jumlah'],
         //           'harga1'    => $data['harga'],
         //           'total1'    => $data['subtotal'],
         //           'unit2'     => '-',
         //           'harga2'    => '-',
         //           'total2'    => '-',
         //           'unit3'     => $data['jumlah'],
         //           'harga3'    => $data['harga'],
         //           'total3'    => $data['subtotal'],
         //           'status_pro'=> 0,
         //           'status_pen'=> 0
         //         ];

         //         $this->db->insert('kartu_stok_bp', $iks);

         //         }
         //         // echo "<pre>"; print_r($get_detail_bp); echo "</pre>"; die();

         //       }
         // }





         redirect('c_transaksi/lihat_pembp');
      }





      //MENENTUKAN TRANSAKSI PRODUKSI 1

      public function lihat_produksi_ke1()
      {
         $this->db->where('tgl_btk', date('Y-m-d'));
         $data['cek1'] = $this->db->get('btk')->result();
         //
         $this->db->where('tgl_bop', date('Y-m-d'));
         $data['cek2'] = $this->db->get('bop')->result();
         //
         $this->db->where('tgl_trans', date('Y-m-d'));
         $data['cek3'] = $this->db->get('produksi_ke1')->result();

         //
         $date = date('Y-m-d');

         $query2 = "SELECT * FROM produksi_ke1
                WHERE tgl_trans = '$date' AND status > 0";
         $cek4 = $this->db->query($query2)->result();


         if ($data['cek1'] == FALSE or $data['cek2'] == FALSE) {
            $data['error'] = 'Master Data BOP atau BTK untuk hari ini masih kosong!';
         }

         if ($cek4 == TRUE) {
            $data['clear'] = 'Produksi IPS untuk hari ini sudah dilakukan!';
         }
         // $this->db->select('a.no_trans, a.tgl_trans, a.status');
         // $this->db->select_sum('jumlah');
         // $this->db->from('produksi_ke1 a');
         // $this->db->join('detail_produksi_ke1 b', 'a.no_trans = b.no_trans');
         // $data['result'] = $this->db->get()->result_array();
         $query = "SELECT a.no_trans, a.tgl_trans, a.status, ifnull(sum(jumlah),0) as jumlah
                FROM produksi_ke1 a
                LEFT JOIN detail_produksi_ke1 b ON a.no_trans = b.no_trans
                GROUP BY a.no_trans";
         $data['result'] = $this->db->query($query)->result_array();
         $this->template->load('template', 'prod1/view', $data);
         // var_dump($data['result']);
      }

      public function isi_edit_produksi_ke1($id)
      {
         date_default_timezone_set('Asia/Jakarta');
         $kalender = CAL_GREGORIAN;
         $bulan = date('m');
         $tahun = date('Y');
         $hari = cal_days_in_month($kalender, $bulan, $tahun);
         $data['hari'] = $hari;
         $date = date('Y-m-d');
         $data['id'] = $id;
         $data['no_trans'] = $id;
         $this->db->where('no_trans', $id);
         $data['tgl'] = $this->db->get('produksi_ke1')->row()->tgl_trans;
         $tgl = $data['tgl'];

         $this->db->where('no_trans', $id);
         $id_ck = $this->db->get('produksi_ke1')->row()->no_trans_ck;
         $data['no_ck'] = $id_ck;

         //jumlah produksi

         $this->db->where('no_trans',  $data['no_ck']);
         $this->db->select_sum('lulus');
         $data['jmlprod'] = $this->db->get('detail_cek_kualitas')->row_array()['lulus'];



         $data['peternak'] = $this->db->get('peternak')->result_array();




         //bom
         $query = "SELECT ifnull(sum(lulus),0) as lulus, ifnull(sum(subtotal),0) as subtotal, ifnull(sum(total),0) as total
                FROM cek_kualitas a 
                JOIN detail_cek_kualitas b ON a.no_trans = b.no_trans
                WHERE a.no_trans = '$id_ck'";


         $data['bom'] = $this->db->query($query)->result_array();


         //bop
         $query2 = "SELECT a.no_jbop, nama_jbop, ifnull(harga,0) as harga
                FROM jenis_bop a 
                LEFT JOIN detail_bop b ON a.no_jbop = b.no_jbop
                left JOIN bop c ON c.no_bop = b.no_bop
                WHERE tgl_bop = '$tgl'";
         $data['bopv'] = $this->db->query($query2)->result_array();

         //biaya tenaga kerja
         $this->db->where('no_trans', $id);
         $tgl = $this->db->get('produksi_ke1')->row()->tgl_trans;
         $bulan1 = substr($tgl, 5, 2);
         $tahun1 = substr($tgl, 0, 4);

         $this->db->where('no_trans', $id);
         $cek = $this->db->get('produksi_ke1')->row()->status;

         if ($cek == 0) {
            $this->db->where('tgl_btk', date('Y-m-d'));
            $btk = $this->db->get('btk')->row()->tarif;
         } else {
            $this->db->where('no_trans', $id);
            $btk = $this->db->get('detail_produksi_ke1')->row()->btk / $data['jmlprod'];
         }

         $data['btk'] = $btk;


         //BIAYA BOP
         $this->db->where('bulan', $bulan1);
         $this->db->where('tahun', $tahun1);
         $this->db->select('a.no_bop,nama_jbop, harga');
         $this->db->from('bop a');
         $this->db->join('detail_bop b', 'a.no_bop = b.no_bop');
         $this->db->join('jenis_bop c', 'c.no_jbop = b.no_jbop');
         $data['bop'] = $this->db->get()->result_array();



         //cek selesai produksi
         $this->db->where('no_trans', $id);
         $data['cek'] = $this->db->get('detail_produksi_ke1')->num_rows();



         $this->template->load('template', 'prod1/update', $data);
         // var_dump(date('Y-m-d'));
      }

      public function form_produksi_ke1()
      {
         $query1   = "SELECT  MAX(RIGHT(no_trans,3)) as kode FROM produksi_ke1";
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
         $no_trans   = "PROD1_" . $kd;
         $data['id'] = $no_trans;
         $this->db->where('status', '1');
         $this->db->order_by('no_trans');
         $data['ck'] = $this->db->get('cek_kualitas')->result_array();



         $this->template->load('template', 'prod1/form', $data);
      }

      public function tambah_produksi_ke1()
      {
         $config = array(

            array(
               'field' => 'no_trans_ck',
               'label' => 'ID Transaksi Cek Kualitas',
               'rules' => 'required',
               'errors' => array(
                  'required' => '%s tidak boleh kosong!'
               )
            )
         );
         $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
         $this->form_validation->set_rules($config);

         if ($this->form_validation->run() == FALSE) {
            $this->form_produksi_ke1();
         } else {
            $data = array(
               'no_trans' => $_POST['no_trans'],
               'tgl_trans' => $_POST['tgl_trans'],
               'status' => '0',
               'no_trans_ck' => $_POST['no_trans_ck']
            );
            $this->db->insert('produksi_ke1', $data);

            $this->db->where('no_trans', $_POST['no_trans_ck']);
            $this->db->set('status', '2');
            $this->db->update('cek_kualitas');
            redirect('c_transaksi/lihat_produksi_ke1');
         }
      }

      public function selesai_produksi_ke1($id, $bbb, $jumlah, $no_prod, $btk, $bop)
      {
         date_default_timezone_set('Asia/Jakarta');
         $this->db->set('status', '1');
         $this->db->where('no_trans', $id);
         $this->db->update('produksi_ke1');

         //input ke detail produksi ke 1
         $totalbiaya = $bbb + $btk + $bop;
         $data = array(
            'no_trans' => $id,
            'no_produk' => $no_prod,
            'bbb' => $bbb,
            'btk' => $btk,
            'bop' => $bop,
            'jumlah' => $jumlah,
            'subtotal' => $totalbiaya
         );
         $this->db->insert('detail_produksi_ke1', $data);


         //jurnal pemakaian
         $this->M_keuangan->GenerateJurnal('5111', $id, 'd', $bbb);
         $this->M_keuangan->GenerateJurnal('1112', $id, 'k', $bbb);
         $this->M_keuangan->GenerateJurnal('5112', $id, 'd', $btk);
         $this->M_keuangan->GenerateJurnal('5311', $id, 'k', $btk);
         $this->M_keuangan->GenerateJurnal('5113', $id, 'd', $bop);
         $this->M_keuangan->GenerateJurnal('5312', $id, 'k', $bop);



         //penambah stok di bahan dalam proses
         $this->db->set('stok', "stok + " . $jumlah . "", FALSE);
         $this->db->where('no_bdp', 'BDP_001');
         $this->db->update('bahan_dalam_proses');

         //pengurang stok bahan baku belum cok!
         $this->db->set('stok', "stok - " . $jumlah . "", FALSE);
         $this->db->where('no_bb', 'BB_001');
         $this->db->update('bahan_baku');


         // kartu stok bahan baku cok
         $data1 = array(
            'no_trans' => $id,
            'tgl_trans' => date('Y-m-d H:i:s'),
            'no_bp' => 'BB_001',
            'unit1' => '-',
            'harga1' => '-',
            'total1' => '-',
            'unit2' => $jumlah,
            'harga2' => $bbb / $jumlah,
            'total2' => $bbb,
            'unit3' => 0,
            'harga3' => 0,
            'total3' => 0,
            'status_pro' => 0,
            'status_pen' => 0
         );
         $this->db->insert('kartu_stok_bp', $data1);




         redirect('c_transaksi/lihat_produksi_ke1');
      }


      //MENENTUKAN PEMBAGIAN BAHAN BAKU DALAM PROSES


      public function lihat_pembagian()
      {
         $this->db->where('tgl_trans', date('Y-m-d'));
         $cek = $this->db->get('pembagian')->result();
         $this->db->where('tgl_trans', date('Y-m-d'));
         $this->db->where('status >', '0');
         $cek1 = $this->db->get('pembagian')->result();
         $data['cek'] = $cek;
         $data['cek1'] = $cek1;
         if ($cek1 == TRUE) {
            $data['error'] = 'Pembagian untuk hari ini sudah dilakukan!';
         }
         $data['result'] = $this->db->get('pembagian')->result_array();
         $this->template->load('template', 'pembagian/view', $data);
      }

      public function isi_edit_pembagian($id)
      {
         $data['id'] = $id;
         $data['no_trans'] = $id;
         $this->db->where('no_trans', $id);
         $data['tgl'] = $this->db->get('pembagian')->row()->tgl_trans;

         $this->db->where('no_trans', $id);
         $data['prod'] = $this->db->get('pembagian')->row()->no_trans_produksi1;

         $this->db->where('no_trans', $data['prod']);
         $data['jumlah'] = $this->db->get('detail_produksi_ke1')->row()->jumlah;

         //detail
         $this->db->select('jual,produksi,jumlah');
         $this->db->from('detail_pembagian a');
         $this->db->join('pembagian b', 'a.no_trans = b.no_trans');
         $this->db->join('detail_produksi_ke1 c', 'c.no_trans = b.no_trans_produksi1');
         $this->db->where('a.no_trans', $id);
         $data['detail'] = $this->db->get()->result_array();

         $this->db->where('no_trans', $id);
         $data['cek'] = $this->db->get('pembagian')->row()->status;


         $data['satuan'] = 'liter';


         $this->template->load('template', 'pembagian/update', $data);
      }

      public function form_pembagian()
      {
         $query1   = "SELECT  MAX(RIGHT(no_trans,3)) as kode FROM pembagian";
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
         $no_trans   = "PGB_" . $kd;
         $data['id'] = $no_trans;


         $this->db->where('status', '1');
         $data['prod'] = $this->db->get('produksi_ke1')->result_array();



         $this->template->load('template', 'pembagian/form', $data);
      }

      public function tambah_pembagian()
      {


         $config = array(
            array(
               'field' => 'no_trans_produksi1',
               'label' => 'ID Transaksi Produksi IPS',
               'rules' => 'required',
               'errors' => array(
                  'required' => '%s tidak boleh kosong!'
               )
            )
         );
         $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
         $this->form_validation->set_rules($config);

         if ($this->form_validation->run() == FALSE) {
            $this->form_pembagian();
         } else {
            $data = array(
               'no_trans' => $_POST['no_trans'],
               'tgl_trans' => $_POST['tgl_trans'],
               'status' => '0',
               'no_trans_produksi1' => $_POST['no_trans_produksi1']
            );
            $this->db->insert('pembagian', $data);

            $this->db->where('no_trans', $_POST['no_trans_produksi1']);
            $this->db->set('status', '2');
            $this->db->update('produksi_ke1');
            redirect('c_transaksi/lihat_pembagian');
         }
      }

      public function selesai_pembagian()
      {

         $config = array(
            array(
               'field' => 'jual',
               'label' => 'Penjualan ke IPS',
               'rules' => 'required|is_natural',
               'errors' => array(
                  'required' => '%s tidak boleh kosong!',
                  'is_natural' => '%s hanya boleh angka!'
               )
            )
         );
         $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
         $this->form_validation->set_rules($config);

         if ($this->form_validation->run() == FALSE) {
            $id = $_POST['no_trans'];
            $tgl = $_POST['tgl_trans'];
            $no_produk = $_POST['no_prod'];
            $this->isi_edit_pembagian($id);
         } else {
            // echo "<pre>"; print_r($_POST); echo "</pre>"; die();

            $id = $_POST['no_trans'];
            $tgl = $_POST['tgl_trans'];
            $no_produk = $_POST['no_prod'];
            if ($_POST['jual'] <= $_POST['jumlah']) {
               // if(isset($_POST['jual'])){
               $this->db->set('status', '1');
               $this->db->where('no_trans', $_POST['no_trans']);
               $this->db->update('pembagian');

               // $produksi = 100 - $_POST['jual'];
               $produksi = $_POST['jumlah'] - $_POST['jual'];
               //input ke detail pembagian
               $data = array(
                  'no_trans' => $_POST['no_trans'],
                  'jual' => $_POST['jual'],
                  'produksi' => $produksi
               );
               $this->db->insert('detail_pembagian', $data);

               // udpate kartus stok
               $nop  = $this->db->where('no_trans', $_POST['no_prod'])->order_by('no_trans DESC')->get('detail_produksi_ke1')->row_array();
               $vali = $this->db->where('no_produk', $nop['no_produk'])->get('kartu_stok_penj');
               // echo "<pre>"; print_r($vali); echo "</pre>"; die();
               // if ($vali->num_rows() > 0) {
               //   $tes =  $this->db->where(array('no_produk' => $nop['no_produk'], 'unit3 >' => 0, 'status_pro' => 0))->get('kartu_stok_penj')->result_array();
               //   // echo "<pre>"; print_r($tes); echo "</pre>";die(); 

               //   foreach ($tes as $data) {

               //       $array = [
               //         'no_trans'  => $_POST['no_prod'],
               //         'tgl_trans' => date('Y-m-d H:i:s'),
               //         'no_produk' => $nop['no_produk'],
               //         'unit1'     => '-',
               //         'harga1'    => '-',
               //         'total1'    => '-',
               //         'unit2'     => '-',
               //         'harga2'    => '-',
               //         'total2'    => '-',
               //         'unit3'     => $data['unit3'],
               //         'harga3'    => $data['harga3'],
               //         'total3'    => $data['total3'],
               //         'status_pro'=> 0,
               //         'status_pen'=> 0
               //       ];
               //       // echo "<pre>"; print_r($array); echo "</pre>";

               //       $this->db->insert('kartu_stok_penj', $array);

               //       $this->db->where(array('no_trans' => $data['no_trans'], 'status_pro' => 0))->set('status_pro', 1)->update('kartu_stok_penj');
               //   }
               //   // die('hai dia');
               //   // echo "<pre>"; print_r($tes); echo "</pre>"; die();
               //   $iks = [
               //     'no_trans'  => $_POST['no_prod'],
               //     'tgl_trans' => date('Y-m-d H:i:s'),
               //     'no_produk' => $nop['no_produk'],
               //     'unit1'     => $_POST['jual'],
               //     'harga1'    => (($_POST['jual']/$nop['jumlah']) * $nop['subtotal']) / $_POST['jual'],
               //     'total1'    => ($_POST['jual']/$nop['jumlah']) * $nop['subtotal'],
               //     'unit2'     => '-',
               //     'harga2'    => '-',
               //     'total2'    => '-',
               //     'unit3'     => $_POST['jual'],
               //     'harga3'    => (($_POST['jual']/$nop['jumlah']) * $nop['subtotal']) / $_POST['jual'],
               //     'total3'    => ($_POST['jual']/$nop['jumlah']) * $nop['subtotal'],
               //     'status_pro'=> 0,
               //     'status_pen'=> 0
               //   ];

               //   $this->db->insert('kartu_stok_penj', $iks);


               // } else {
               // die('hai aku');
               $iks = [
                  'no_trans'  => $_POST['no_prod'],
                  'tgl_trans' => date('Y-m-d H:i:s'),
                  'no_produk' => $nop['no_produk'],
                  'unit1'     => $_POST['jual'],
                  'harga1'    => (($_POST['jual'] / $nop['jumlah']) * $nop['subtotal']) / $_POST['jual'],
                  'total1'    => ($_POST['jual'] / $nop['jumlah']) * $nop['subtotal'],
                  'unit2'     => '-',
                  'harga2'    => '-',
                  'total2'    => '-',
                  'unit3'     => $_POST['jual'],
                  'harga3'    => (($_POST['jual'] / $nop['jumlah']) * $nop['subtotal']) / $_POST['jual'],
                  'total3'    => ($_POST['jual'] / $nop['jumlah']) * $nop['subtotal'],
                  'status_pro' => 0,
                  'status_pen' => 0
               ];
               // echo "<pre>"; print_r($iks); echo "</pre>"; die();

               $this->db->insert('kartu_stok_penj', $iks);

               // }
               // die('hi');
               // echo "<pre>"; print_r($vali); echo "</pre>"; die();

               //update ke stok produk

               $this->db->set('stok', "stok - " . $_POST['jual'] . "", FALSE);
               $this->db->where('no_bdp', 'BDP_001');
               $this->db->update('bahan_dalam_proses');

               //update stok produk
               $this->db->set('stok', "stok + " . $_POST['jual'] . "", FALSE);
               $this->db->like('no_produk', 'PR_001', 'none');
               $this->db->update('produk');

               //update kartu stok jual
               $this->db->set('stok_jual', $_POST['jual'], FALSE);
               $this->db->set('jumlah_kartu_stok', $_POST['jual'], FALSE);
               $this->db->where('no_trans', $_POST['no_prod']);
               $this->db->update('detail_produksi_ke1');

               //update harga jual di masterdata produk
               $this->db->select_sum('subtotal');
               $this->db->select_sum('stok_jual');
               $this->db->select_sum('jumlah');
               $query = $this->db->get('detail_produksi_ke1')->row_array();
               $totaljumlah = $query['stok_jual'];
               $totalsubtotal = $query['subtotal'];
               $totaljumlahproduksi = $query['jumlah'];
               $harga = ((($totalsubtotal * ($totaljumlah / $totaljumlahproduksi)) * 1.3) / $totaljumlah);

               $this->db->set('harga_jual', $harga, FALSE);
               $this->db->where('no_produk', 'PR_001');
               $this->db->update('produk');

               /////
               $this->db->where('no_trans', $_POST['no_prod']);
               $bbb = $this->db->get('detail_produksi_ke1')->row_array()['bbb'];

               $this->db->where('no_trans', $_POST['no_prod']);
               $btk = $this->db->get('detail_produksi_ke1')->row_array()['btk'];

               $this->db->where('no_trans', $_POST['no_prod']);
               $bop = $this->db->get('detail_produksi_ke1')->row_array()['bop'];

               ///bbb dalam proses
               $bbb1 = ($produksi / $_POST['jumlah']) * $bbb;

               ///bbb jadi
               $bbb2 = (($_POST['jual'] / $_POST['jumlah']) * $bbb);

               ///bbb dalam proses
               $btk1 = (($produksi / $_POST['jumlah']) * $btk);

               ///bbb jadi
               $btk2 = (($_POST['jual'] / $_POST['jumlah']) * $btk);

               ///bbb dalam proses
               $bop1 = (($produksi / $_POST['jumlah']) * $bop);

               ///bbb jadi
               $bop2 = (($_POST['jual'] / $_POST['jumlah']) * $bop);

               //total dalam proses
               $pbdp = $bbb1 + $btk1 + $bop1;
               //total jadi
               $pbj = $bbb2 + $btk2 + $bop2;

               //jurnal persediaan dalam proses
               $this->M_keuangan->GenerateJurnal('1114', $id, 'd', $pbdp);
               $this->M_keuangan->GenerateJurnal('5111', $id, 'k', $bbb1);
               $this->M_keuangan->GenerateJurnal('5112', $id, 'k', $btk1);
               $this->M_keuangan->GenerateJurnal('5113', $id, 'k', $bop1);

               //jurnal persediaan jadi
               $this->M_keuangan->GenerateJurnal('1311', $id, 'd', $pbj);
               $this->M_keuangan->GenerateJurnal('5111', $id, 'k', $bbb2);
               $this->M_keuangan->GenerateJurnal('5112', $id, 'k', $btk2);
               $this->M_keuangan->GenerateJurnal('5113', $id, 'k', $bop2);




               redirect('c_transaksi/lihat_pembagian');
            } else {
               $data['error'] = 'Penjualan ke IPS telah melebihi batasan!';
               $data['id'] = $id;
               $data['no_trans'] = $id;
               $this->db->where('no_trans', $id);
               $data['tgl'] = $this->db->get('pembagian')->row()->tgl_trans;

               $this->db->where('no_trans', $id);
               $data['prod'] = $this->db->get('pembagian')->row()->no_trans_produksi1;

               $this->db->where('no_trans', $data['prod']);
               $data['jumlah'] = $this->db->get('detail_produksi_ke1')->row()->jumlah;

               //detail
               $this->db->select('jual,produksi,jumlah');
               $this->db->from('detail_pembagian a');
               $this->db->join('pembagian b', 'a.no_trans = b.no_trans');
               $this->db->join('detail_produksi_ke1 c', 'c.no_trans = b.no_trans_produksi1');
               $this->db->where('a.no_trans', $id);
               $data['detail'] = $this->db->get()->result_array();

               $this->db->where('no_trans', $id);
               $data['cek'] = $this->db->get('pembagian')->row()->status;


               $data['satuan'] = 'liter';


               $this->template->load('template', 'pembagian/update', $data);
            }
         }
      }




      //MENENTUKAN TRANSAKSI TARGET PROYEKSI
      public function lihat_tp()
      {

         $this->db->where('tgl_tp', date('Y-m-d'));
         $cek = $this->db->get('target_produksi')->result();
         $this->db->where('tgl_tp', date('Y-m-d'));
         $this->db->where('status >', '0');
         $cek1 = $this->db->get('target_produksi')->result();
         $data['cek'] = $cek;
         $data['cek1'] = $cek1;
         if ($cek1 == TRUE) {
            $data['error'] = 'Target Produksi untuk hari ini sudah dilakukan!';
         }
         $data['result'] = $this->db->get('target_produksi')->result_array();
         $this->template->load('template', 'tp/view', $data);
      }



      public function form_tp()
      {


         $query1   = "SELECT  MAX(RIGHT(no_tp,3)) as kode FROM target_produksi";
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
         $no_trans   = "TP_" . $kd;
         $data['id'] = $no_trans;

         $this->db->where('status', '1');
         $data['pembagian'] = $this->db->get('pembagian')->result_array();
         $this->template->load('template', 'tp/form', $data);
      }

      public function tambah_tp()
      {


         $config = array(

            array(
               'field' => 'tgl_tp',
               'label' => 'Tanggal Target Produksi',
               'rules' => 'required',
               'errors' => array(
                  'required' => '%s tidak boleh kosong!'
               )
            ),
            array(
               'field' => 'no_trans_pembagian',
               'label' => 'ID Transaksi Pembagian',
               'rules' => 'required',
               'errors' => array(
                  'required' => '%s tidak boleh kosong!'
               )
            )
         );
         $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
         $this->form_validation->set_rules($config);

         if ($this->form_validation->run() == FALSE) {
            $this->form_tp();
         } else {
            $data = array(
               'no_tp' => $_POST['no_tp'],
               'tanggal' => date('Y-m-d'),
               'tgl_tp' => $_POST['tgl_tp'],
               'status' => '0',
               'no_trans_pembagian' => $_POST['no_trans_pembagian']
            );
            $this->db->insert('target_produksi', $data);

            //update status pembagian
            $this->db->set('status', "2", FALSE);
            $this->db->where('no_trans', $_POST['no_trans_pembagian']);
            $this->db->update('pembagian');

            redirect('c_transaksi/lihat_tp');
         }
      }

      public function isi_edit_tp($id)
      {
         $this->db->where('no_tp', $id);
         $x['status'] = $this->db->get('target_produksi')->row()->status;


         $x['data'] = $this->M_masterdata->edit_data('target_produksi', "no_tp = '$id'")->row_array();


         $query3 = "SELECT ifnull(produksi,0) as jumlah
                  FROM target_produksi a
                  JOIN pembagian b ON a.no_trans_pembagian = b.no_trans
                  JOIN detail_produksi_ke1 c ON c.no_trans = b.no_trans_produksi1
                  JOIN detail_pembagian d ON d.no_trans = b.no_trans
                  WHERE a.no_tp = '$id'";
         $x['jumlah'] = $this->db->query($query3)->row()->jumlah;

         $this->db->or_not_like('nama_produk', 'Susu Sapi', 'none');
         $this->db->select('a.no_produk, a.nama_produk, satuan');
         $this->db->from('produk a');
         $this->db->join('bom b', 'a.no_produk = b.no_produk');
         $this->db->group_by('a.no_produk');
         $x['result'] = $this->db->get()->result_array();

         $this->db->where('a.no_tp', $id);
         $this->db->select('a.no_produk, nama_produk, jumlah, a.no_tp, satuan, c.status');
         $this->db->from('detail_target_produksi a');
         $this->db->join('produk b', 'a.no_produk = b.no_produk');
         $this->db->join('target_produksi c', 'a.no_tp = c.no_tp');
         $this->db->order_by('no');
         $x['result1'] = $this->db->get()->result_array();

         //ISI BOM 
         $query1 =   "
SELECT nama_bb, sum(a.jumlah) * c.jumlah as jumlah_bom, d.satuan, c.no_bbp
FROM detail_target_produksi a
JOIN produk b ON a.no_produk = b.no_produk
JOIN bom c ON c.no_produk = b.no_produk
JOIN bahan_baku d ON d.no_bb = c.no_bbp 
WHERE a.no_tp = '$id'
UNION
SELECT nama_bp, sum(a.jumlah) * c.jumlah as jumlah_bom, d.satuan, c.no_bbp
FROM detail_target_produksi a
JOIN produk b ON a.no_produk = b.no_produk
JOIN bom c ON c.no_produk = b.no_produk
JOIN bahan_penolong d ON d.no_bp = c.no_bbp 
WHERE a.no_tp = '$id' AND NOT c.no_bbp = 'BB_001'
group by no_bbp";
         $x['result2'] = $this->db->query($query1)->result_array();
         $x['id'] = $id;
         $query = "SELECT ifnull(sum(jumlah),0) as jumlah
                  FROM detail_target_produksi
                  WHERE no_tp = '$id'";
         $x['cek'] = $this->db->query($query)->row_array()['jumlah'];
         $this->template->load('template', 'tp/update', $x);
      }


      public function edit_tp()
      {

         $config = array(

            array(
               'field' => 'no_produk',
               'label' => 'Nama Produk',
               'rules' => 'required',
               'errors' => array(
                  'required' => '%s tidak boleh kosong!'
               )
            ),

            array(
               'field' => 'jumlah',
               'label' => 'Jumlah',
               'rules' => 'required|is_natural_no_zero',
               'errors' => array(
                  'required' => '%s tidak boleh kosong!',
                  'is_natural_no_zero' => '%s hanya berupa angka 1-9!'
               )
            )
         );
         $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
         $this->form_validation->set_rules($config);

         if ($this->form_validation->run() == FALSE) {
            $id = $_POST['no_tp'];
            $this->isi_edit_tp($id);
         } else {
            $id = $_POST['no_tp'];
            $this->db->where('no_tp', $id);
            $this->db->select_sum('jumlah');
            $jml = $this->db->get('detail_target_produksi')->row()->jumlah;
            $cek_jml = $jml + $_POST['jumlah'];


            if ($cek_jml <= $_POST['produksi']) {
               $data = array(
                  'no_tp' => $_POST['no_tp'],
                  'no_produk' => $_POST['no_produk'],
                  'jumlah' => $_POST['jumlah']
               );
               $this->db->where(array('no_tp' => $_POST['no_tp'], 'no_produk' => $_POST['no_produk']));
               $cek =  $this->db->get('detail_target_produksi')->num_rows();
               if ($cek == 0) {
                  $this->db->insert('detail_target_produksi', $data);
               } else {
                  $this->db->set('jumlah', "jumlah + " . $_POST['jumlah'] . "", FALSE);
                  $this->db->where(array('no_tp' => $_POST['no_tp'], 'no_produk' => $_POST['no_produk']));
                  $this->db->update('detail_target_produksi');
               }
               $this->isi_edit_tp($id);
            } else {
               $id = $_POST['no_tp'];
               $x['error'] = 'Jumlah Target Produksi melebihi jumlah target produksi!';
               $this->db->where('no_tp', $id);
               $x['status'] = $this->db->get('target_produksi')->row()->status;


               $x['data'] = $this->M_masterdata->edit_data('target_produksi', "no_tp = '$id'")->row_array();


               $query3 = "SELECT ifnull(produksi,0) as jumlah
                  FROM target_produksi a
                  JOIN pembagian b ON a.no_trans_pembagian = b.no_trans
                  JOIN detail_produksi_ke1 c ON c.no_trans = b.no_trans_produksi1
                  JOIN detail_pembagian d ON d.no_trans = b.no_trans
                  WHERE a.no_tp = '$id'";
               $x['jumlah'] = $this->db->query($query3)->row()->jumlah;

               $this->db->or_not_like('nama_produk', 'Susu Sapi', 'none');
               $this->db->select('a.no_produk, a.nama_produk, satuan');
               $this->db->from('produk a');
               $this->db->join('bom b', 'a.no_produk = b.no_produk');
               $this->db->group_by('a.no_produk');
               $x['result'] = $this->db->get()->result_array();

               $this->db->where('a.no_tp', $id);
               $this->db->select('a.no_produk, nama_produk, jumlah, a.no_tp, satuan, c.status');
               $this->db->from('detail_target_produksi a');
               $this->db->join('produk b', 'a.no_produk = b.no_produk');
               $this->db->join('target_produksi c', 'a.no_tp = c.no_tp');
               $this->db->order_by('no');
               $x['result1'] = $this->db->get()->result_array();

               //ISI BOM 
               $query1 =   "
SELECT nama_bb, sum(a.jumlah) * c.jumlah as jumlah_bom, d.satuan, c.no_bbp
FROM detail_target_produksi a
JOIN produk b ON a.no_produk = b.no_produk
JOIN bom c ON c.no_produk = b.no_produk
JOIN bahan_baku d ON d.no_bb = c.no_bbp 
WHERE a.no_tp = '$id'
UNION
SELECT nama_bp, sum(a.jumlah) * c.jumlah as jumlah_bom, d.satuan, c.no_bbp
FROM detail_target_produksi a
JOIN produk b ON a.no_produk = b.no_produk
JOIN bom c ON c.no_produk = b.no_produk
JOIN bahan_penolong d ON d.no_bp = c.no_bbp 
WHERE a.no_tp = '$id' AND NOT c.no_bbp = 'BB_001'
group by no_bbp";
               $x['result2'] = $this->db->query($query1)->result_array();
               $x['id'] = $id;
               $query = "SELECT ifnull(sum(jumlah),0) as jumlah
                  FROM detail_target_produksi
                  WHERE no_tp = '$id'";
               $x['cek'] = $this->db->query($query)->row_array()['jumlah'];
               $this->template->load('template', 'tp/update', $x);
            }
         }
      }


      public function hapus_tp($id, $id2)
      {
         $this->db->query("SET GLOBAL FOREIGN_KEY_CHECKS=0");
         $this->db->where('no_tp', $id);
         $this->db->where('no_produk', $id2);
         $this->db->delete('detail_target_produksi');
         $this->db->query("SET GLOBAL FOREIGN_KEY_CHECKS=1");

         redirect('c_transaksi/isi_edit_tp/' . $id . '');
      }

      public function selesai_tp($id)
      {

         $this->db->where('no_tp', $id);
         $this->db->set('status', '1');
         $this->db->update('target_produksi');
         redirect('c_transaksi/lihat_tp');
      }





      //MENENTUKAN TRANSAKSI PRODUKSI 2

      public function lihat_produksi_ke2()
      {
         $this->db->where('tgl_btk', date('Y-m-d'));
         $data['cek1'] = $this->db->get('btk')->result();
         //
         $this->db->where('tgl_bop', date('Y-m-d'));
         $data['cek2'] = $this->db->get('bop')->result();
         //
         $this->db->where('tgl_trans', date('Y-m-d'));
         $data['cek3'] = $this->db->get('produksi_ke2')->result();

         //
         $date = date('Y-m-d');

         $query2 = "SELECT * FROM produksi_ke2
                WHERE tgl_trans = '$date' AND status > 0";
         $cek4 = $this->db->query($query2)->result();


         if ($data['cek1'] == FALSE or $data['cek2'] == FALSE) {
            $data['error'] = 'Master Data BOP atau BTK untuk hari ini masih kosong!';
         }

         if ($cek4 == TRUE) {
            $data['clear'] = 'Produksi Olahan untuk hari ini sudah dilakukan!';
         }
         $data['result'] = $this->db->get('produksi_ke2')->result_array();
         $this->template->load('template', 'prod2/view', $data);
      }

      public function isi_edit_produksi_ke21($id)
      {
         $data['id'] = $id;
         $data['no_trans'] = $id;
         $this->db->where('no_trans', $id);
         $data['tgl'] = $this->db->get('produksi_ke2')->row()->tgl_trans;

         $this->db->where('no_trans', $id);
         $data['no_tp'] = $this->db->get('produksi_ke2')->row()->no_tp;

         $query = "SELECT COUNT(jumlah) as jumlah
               FROM produksi_ke2 a
               JOIN detail_target_produksi b ON a.no_tp = b.no_tp
               WHERE a.no_trans = '$id'";
         $data['jml_produk'] = $this->db->query($query)->row()->jumlah;


         $this->db->where('no_trans', $id);
         $this->db->from('produksi_ke2 a');
         $this->db->join('detail_target_produksi b', 'a.no_tp = b.no_tp');
         $this->db->join('produk c', 'c.no_produk = b.no_produk');
         $data['detail'] = $this->db->get()->result_array();

         $this->template->load('template', 'prod2/update0', $data);
      }


      public function isi_edit_produksi_ke2($id, $no_tp, $no_prod)
      {
         date_default_timezone_set('Asia/Jakarta');
         $data['id'] = $id;
         $data['no_trans'] = $id;
         $this->db->where('no_trans', $id);
         $data['tgl'] = $this->db->get('produksi_ke2')->row()->tgl_trans;
         $tgl = $data['tgl'];
         $data['no_tp'] = $no_tp;
         $data['no_prod'] = $no_prod;


         //nama produk
         $this->db->where('no_produk', $no_prod);
         $data['nama_produk'] = $this->db->get('produk')->row()->nama_produk;

         //jumlah produksi
         $this->db->where('no_tp', $no_tp);
         $this->db->where('no_produk', $no_prod);
         $data['jumlah'] = $this->db->get('detail_target_produksi')->row()->jumlah;

         //jumlah produk yang di produksi
         $query = "SELECT COUNT(jumlah) as jumlah, sum(jumlah) as total
               FROM produksi_ke2 a
               JOIN detail_target_produksi b ON a.no_tp = b.no_tp
               WHERE a.no_trans = '$id'";
         $jml_produk = $this->db->query($query)->row()->total;
         $data['jml_produk'] = $jml_produk;

         //bom bbb
         $this->db->where('no_tp', $no_tp);
         $id_pembagian = $this->db->get('target_produksi')->row()->no_trans_pembagian;

         $this->db->where('no_trans', $id_pembagian);
         $jml_produksi = $this->db->get('detail_pembagian')->row()->produksi;
         $data['jumlah_produksi'] = $jml_produksi;

         $this->db->where('id_jurnal', $id_pembagian);
         $this->db->where('b.no_coa', '1114');
         $this->db->where('posisi_dr_cr', 'd');
         $this->db->select('id_jurnal, nama_coa, nominal');
         $this->db->from('jurnal a');
         $this->db->join('coa b', 'a.no_coa = b.no_coa');
         $this->db->order_by('no DESC');
         // $this->db->group_by('id_jurnal');
         $data['bombbb'] = $this->db->get()->row_array();
         // echo "<pre>"; print_r($data['bombbb']); echo "</pre>"; die();

         //bom

         $query1 =   "
                  SELECT nama_bp, sum(a.jumlah) * c.jumlah as jumlah_bom, d.satuan, c.no_bbp,c.jumlah
                  FROM detail_target_produksi a
                  JOIN produk b ON a.no_produk = b.no_produk
                  JOIN bom c ON c.no_produk = b.no_produk
                  JOIN bahan_penolong d ON d.no_bp = c.no_bbp 
                  WHERE a.no_tp = '$no_tp' AND NOT c.no_bbp = 'BB_001' AND a.no_produk = '$no_prod'
                  group by no_bbp";
         $data['result2'] = $this->db->query($query1)->result_array();
         $result2 = $this->db->query($query1)->result_array();

         //biaya tenaga kerja
         $this->db->where('no_trans', $id);
         $tgl = $this->db->get('produksi_ke2')->row()->tgl_trans;
         $bulan1 = substr($tgl, 5, 2);
         $tahun1 = substr($tgl, 0, 4);

         $this->db->where('no_trans', $id);
         $cek = $this->db->get('produksi_ke2')->row()->status;
         $this->db->where('no_trans', $id);
         $cek_tgl = $this->db->get('produksi_ke2')->row_array()['tgl_trans'];
         // if($cek == 0){
         //    $this->db->where('tgl_btk', date('Y-m-d'));
         // $btk = $this->db->get('btk')->row_array()['tarif'];
         // }else{
         //   $this->db->where('no_trans', $id);
         //   $this->db->where('no_produk', $no_prod);
         //   $btk = $this->db->get('detail_produksi_ke2')->row_array()['btk'];
         // }
         $this->db->where('tgl_btko', $cek_tgl);
         $btk = $this->db->get('btko')->row_array()['tarif'];

         $data['btk']  = $btk;

         //BIAYA BOP
         $this->db->where('tgl_bopo', $tgl);
         $this->db->select('a.no_bopo,nama_jbop, harga');
         $this->db->from('bopo a');
         $this->db->join('detail_bopo b', 'a.no_bopo = b.no_bopo');
         $this->db->join('jenis_bop c', 'c.no_jbop = b.no_jbop');
         $data['bop'] = $this->db->get()->result_array();



         //cek selesai produksi
         $this->db->where('no_tp', $no_tp);
         $this->db->where('no_produk', $no_prod);
         $data['cek'] = $this->db->get('detail_target_produksi')->row()->status;

         //validasi bahan penolong
         $q1 =   "
                  SELECT nama_bp, ifnull(sum(a.jumlah) * c.jumlah, 0) as jumlah_bom, d.satuan, c.no_bbp, d.stok
                  FROM detail_target_produksi a
                  JOIN produk b ON a.no_produk = b.no_produk
                  JOIN bom c ON c.no_produk = b.no_produk
                  JOIN bahan_penolong d ON d.no_bp = c.no_bbp 
                  WHERE a.no_tp = '$no_tp' AND c.no_bbp = 'BP_001' AND a.no_produk = '$no_prod'
                  group by no_bbp";
         $q2 =   "
                  SELECT nama_bp, ifnull(sum(a.jumlah) * c.jumlah, 0) as jumlah_bom, d.satuan, c.no_bbp, d.stok
                  FROM detail_target_produksi a
                  JOIN produk b ON a.no_produk = b.no_produk
                  JOIN bom c ON c.no_produk = b.no_produk
                  JOIN bahan_penolong d ON d.no_bp = c.no_bbp 
                  WHERE a.no_tp = '$no_tp' AND c.no_bbp = 'BP_002' AND a.no_produk = '$no_prod'
                  group by no_bbp";
         $q3 =   "
                  SELECT nama_bp, ifnull(sum(a.jumlah) * c.jumlah,0) as jumlah_bom, d.satuan, c.no_bbp, d.stok
                  FROM detail_target_produksi a
                  JOIN produk b ON a.no_produk = b.no_produk
                  JOIN bom c ON c.no_produk = b.no_produk
                  JOIN bahan_penolong d ON d.no_bp = c.no_bbp 
                  WHERE a.no_tp = '$no_tp' AND c.no_bbp = 'BP_003' AND a.no_produk = '$no_prod'
                  group by no_bbp";
         $q4 =   "
                  SELECT nama_bp, ifnull(sum(a.jumlah) * c.jumlah,0) as jumlah_bom, d.satuan, c.no_bbp, d.stok
                  FROM detail_target_produksi a
                  JOIN produk b ON a.no_produk = b.no_produk
                  JOIN bom c ON c.no_produk = b.no_produk
                  JOIN bahan_penolong d ON d.no_bp = c.no_bbp 
                  WHERE a.no_tp = '$no_tp' AND c.no_bbp = 'BP_004' AND a.no_produk = '$no_prod'
                  group by no_bbp";
         $q5 =   "
                  SELECT nama_bp, ifnull(sum(a.jumlah) * c.jumlah,0) as jumlah_bom, d.satuan, c.no_bbp, d.stok
                  FROM detail_target_produksi a
                  JOIN produk b ON a.no_produk = b.no_produk
                  JOIN bom c ON c.no_produk = b.no_produk
                  JOIN bahan_penolong d ON d.no_bp = c.no_bbp 
                  WHERE a.no_tp = '$no_tp' AND c.no_bbp = 'BP_005' AND a.no_produk = '$no_prod'
                  group by no_bbp";
         $data['vbp1'] = $this->db->query($q1)->row_array()['jumlah_bom'];
         $data['vbp2'] = $this->db->query($q2)->row_array()['jumlah_bom'];
         $data['vbp3'] = $this->db->query($q3)->row_array()['jumlah_bom'];
         $data['vbp4'] = $this->db->query($q4)->row_array()['jumlah_bom'];
         $data['vbp5'] = $this->db->query($q5)->row_array()['jumlah_bom'];
         $data['bp1'] = $this->db->query($q1)->row_array()['stok'];
         $data['bp2'] = $this->db->query($q2)->row_array()['stok'];
         $data['bp3'] = $this->db->query($q3)->row_array()['stok'];
         $data['bp4'] = $this->db->query($q4)->row_array()['stok'];
         $data['bp5'] = $this->db->query($q5)->row_array()['stok'];

         if ($data['cek'] == NULL) {
            if ($data['bp1'] < $data['vbp1'] or $data['bp2'] < $data['vbp2'] or $data['bp3'] < $data['vbp3'] or $data['bp4'] < $data['vbp4'] or $data['bp5'] < $data['vbp5']) {

               $data['error'] = 'Stok Bahan Penolong lebih kecil dari Bill Of Material!';
            }
         }



         $this->template->load('template', 'prod2/update', $data);
         // var_dump($data['btkperhari']);
         // var_dump(date('Y-m-d'));
      }



      public function form_produksi_ke2()
      {
         $query1   = "SELECT  MAX(RIGHT(no_trans,3)) as kode FROM produksi_ke2";
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
         $no_trans   = "PROD2_" . $kd;
         $data['id'] = $no_trans;
         $this->db->where('status', '1');
         $this->db->order_by('no_tp');
         $data['tp'] = $this->db->get('target_produksi')->result_array();



         $this->template->load('template', 'prod2/form', $data);
      }

      public function tambah_produksi_ke2()
      {
         $config = array(

            array(
               'field' => 'no_tp',
               'label' => 'ID Target Produksi',
               'rules' => 'required',
               'errors' => array(
                  'required' => '%s tidak boleh kosong!'
               )
            )
         );
         $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
         $this->form_validation->set_rules($config);

         if ($this->form_validation->run() == FALSE) {

            $this->form_produksi_ke2();
         } else {
            $data = array(
               'no_trans' => $_POST['no_trans'],
               'tgl_trans' => $_POST['tgl_trans'],
               'status' => '0',
               'no_tp' => $_POST['no_tp']
            );
            $this->db->insert('produksi_ke2', $data);

            $this->db->where('no_tp', $_POST['no_tp']);
            $this->db->set('status', '2');
            $this->db->update('target_produksi');
            redirect('c_transaksi/lihat_produksi_ke2');
         }
      }

      public function selesai_produksi_ke2($bbb, $btk, $bop, $bp, $id, $no_tp, $no_prod, $jumlah)
      {
         date_default_timezone_set('Asia/Jakarta');
         //update stok bahan penolong
         $query1 =   "
                  SELECT nama_bp, sum(a.jumlah) * c.jumlah as jumlah_bom, no_bbp
                  FROM detail_target_produksi a 
                  JOIN produk b ON a.no_produk = b.no_produk
                  JOIN bom c ON c.no_produk = b.no_produk
                  JOIN bahan_penolong d ON d.no_bp = c.no_bbp 
                  WHERE a.no_tp = '$no_tp' AND NOT c.no_bbp = 'BB_001' AND a.no_produk = '$no_prod'
                  group by no_bbp";
         $jumlah_bom = $this->db->query($query1)->result_array();

         foreach ($jumlah_bom as $data) {
            $no_bp = $data['no_bbp'];
            $q1 = "SELECT * FROM kartu_stok_bp WHERE no_bp ='$no_bp' ORDER BY no DESC";
            $jumlah_bom = $this->db->query($q1)->row_array()['unit3'];
            $total = $this->db->query($q1)->row_array()['total3'];
            $harga = $this->db->query($q1)->row_array()['harga3'];

            $fix_total2 = $data['jumlah_bom'] * $harga;
            $fix_jumlah3 = $jumlah_bom - $data['jumlah_bom'];
            $fix_total3 = $fix_jumlah3 * $harga;
            $array = [
               'no_trans'  => $id,
               'tgl_trans' => date('Y-m-d H:i:s'),
               'no_produk' => $no_prod,
               'no_bp' => $no_bp,
               'unit1'     => '-',
               'harga1'    => '-',
               'total1'    => '-',
               'unit2'     => $data['jumlah_bom'],
               'harga2'    => $fix_total2 / $data['jumlah_bom'],
               'total2'    => $fix_total2,
               'unit3'     => $fix_jumlah3,
               'harga3'    => $harga,
               'total3'    => $fix_total3,
               'status_pro' => 0,
               'status_pen' => 0
            ];
            $this->db->insert('kartu_stok_bp', $array);


            $this->db->set('stok', "stok - " . $data['jumlah_bom'] . "", FALSE);
            $this->db->where('no_bp', $no_bp);
            $this->db->update('bahan_penolong');
         }

         // udpate kartus stok
         // $nop  = $this->db->where('no_trans', $_POST['no_prod'])->order_by('no_trans DESC')->get('detail_produksi_ke1')->row_array();
         $vali = $this->db->where('no_produk', $no_prod)->get('kartu_stok_penj');
         // echo "<pre>"; print_r($vali); echo "</pre>"; die();
         if ($vali->num_rows() > 0) {
            // $tes =  $this->db->where(array('no_produk' => $no_prod, 'unit3 >' => 0, 'status_pro' => 0))->get('kartu_stok_penj')->result_array();
            //no desc transaksi
            $q_desc = "SELECT * FROM kartu_stok_penj WHERE no_produk = '$no_prod' ORDER BY no DESC";
            $cek_desc = $this->db->query($q_desc)->row_array()['no_trans'];
            //
            $this->db->where('no_trans', $cek_desc);
            $this->db->where('no_produk', $no_prod);
            $this->db->select('unit3,harga3,total3');
            $tes = $this->db->get('kartu_stok_penj')->result_array();
            // echo "<pre>"; print_r($tes); echo "</pre>";die(); 

            foreach ($tes as $data) {

               $array = [
                  'no_trans'  => $id,
                  'tgl_trans' => date('Y-m-d H:i:s'),
                  'no_produk' => $no_prod,
                  'unit1'     => '-',
                  'harga1'    => '-',
                  'total1'    => '-',
                  'unit2'     => '-',
                  'harga2'    => '-',
                  'total2'    => '-',
                  'unit3'     => $data['unit3'],
                  'harga3'    => $data['harga3'],
                  'total3'    => $data['total3'],
                  'status_pro' => 0,
                  'status_pen' => 0
               ];
               // echo "<pre>"; print_r($array); echo "</pre>";

               $this->db->insert('kartu_stok_penj', $array);
            }
            // die('hai dia');
            // echo "<pre>"; print_r($tes); echo "</pre>"; die();


            $iks = [
               'no_trans'  => $id,
               'tgl_trans' => date('Y-m-d H:i:s'),
               'no_produk' => $no_prod,
               'unit1'     => '-',
               'harga1'    => '-',
               'total1'    => '-',
               'unit2'     => '-',
               'harga2'    => '-',
               'total2'    => '-',
               'unit3'     => $jumlah,
               'harga3'    => ($bbb + $btk + $bop + $bp) / $jumlah,
               'total3'    => ($bbb + $btk + $bop + $bp),
               'status_pro' => 0,
               'status_pen' => 0
            ];

            $this->db->insert('kartu_stok_penj', $iks);

            $this->db->where('no_trans', $id);
            $this->db->where('no_produk', $no_prod);
            $this->db->order_by('no ASC');
            $no_asc = $this->db->get('kartu_stok_penj')->row_array()['no'];
            // echo "<pre>"; print_r($list_penj['harga']); echo "</pre>"; die();


            $this->db->set('unit1', $jumlah);
            $this->db->set('harga1', ($bbb + $btk + $bop + $bp) / $jumlah);
            $this->db->set('total1', ($bbb + $btk + $bop + $bp));
            $this->db->where('no_trans', $id);
            $this->db->where('no', $no_asc);
            $this->db->where('no_produk', $no_prod);
            $this->db->update('kartu_stok_penj');
         } else {
            // die('hai aku');

            $iks = [
               'no_trans'  => $id,
               'tgl_trans' => date('Y-m-d H:i:s'),
               'no_produk' => $no_prod,
               'unit1'     => $jumlah,
               'harga1'    => ($bbb + $btk + $bop + $bp) / $jumlah,
               'total1'    => ($bbb + $btk + $bop + $bp),
               'unit2'     => '-',
               'harga2'    => '-',
               'total2'    => '-',
               'unit3'     => $jumlah,
               'harga3'    => ($bbb + $btk + $bop + $bp) / $jumlah,
               'total3'    => ($bbb + $btk + $bop + $bp),
               'status_pro' => 0,
               'status_pen' => 0
            ];

            $this->db->insert('kartu_stok_penj', $iks);


            // echo "<pre>"; print_r($get_detail_bp); echo "</pre>"; die();

         }

         // die('halo testis');



         $this->db->set('status', '1');
         $this->db->where('no_tp', $no_tp);
         $this->db->where('no_produk', $no_prod);
         $this->db->update('detail_target_produksi');

         $query4 = "SELECT * FROM detail_target_produksi
                  WHERE status IS NULL AND no_tp = '$no_tp'";
         $cektp = $this->db->query($query4)->num_rows();

         if ($cektp == 0) {
            $this->db->set('status', '1');
            $this->db->where('no_trans', $id);
            $this->db->update('produksi_ke2');
         }

         $this->db->where('no_trans', $id);
         $tgl = $this->db->get('produksi_ke2')->row()->tgl_trans;


         //input ke detail produksi ke 2
         $subtotal = $bbb + $btk + $bop + $bp;
         $data = array(
            'no_trans' => $id,
            'tgl_trans' => $tgl,
            'no_produk' => $no_prod,
            'bbb' => $bbb,
            'btk' => $btk,
            'bop' => $bop,
            'bp'  => $bp,
            'jumlah' => $jumlah,
            'subtotal' => $subtotal,
            'jumlah_kartu_stok' => $jumlah
         );
         $this->db->insert('detail_produksi_ke2', $data);


         //total bop + bp
         //input ke stok produk
         $bbop = $bop + $bp;
         $pbj = $bbb + $btk + $bbop;

         $this->db->set('stok', "stok - " . $jumlah . "", FALSE);
         $this->db->where('no_bdp', 'BDP_001');
         $this->db->update('bahan_dalam_proses');

         //update stok di produk

         $this->db->set('stok', "stok + " . $jumlah . "", FALSE);
         $this->db->where('no_produk', $no_prod);
         $this->db->update('produk');


         //jurnal pemakaian
         $this->M_keuangan->GenerateJurnal('5112', $id, 'd', $btk);
         $this->M_keuangan->GenerateJurnal('5311', $id, 'k', $btk);
         $this->M_keuangan->GenerateJurnal('5113', $id, 'd', $bop); //Produk Dalam Proses - BOP
         $this->M_keuangan->GenerateJurnal('5312', $id, 'k', $bop); //BOP Dibebankan
         $this->M_keuangan->GenerateJurnal('5135', $id, 'd', $bp);
         $this->M_keuangan->GenerateJurnal('1113', $id, 'k', $bp);





         //jurnal persediaan jadi
         $this->M_keuangan->GenerateJurnal('1312', $id, 'd', $pbj);
         $this->M_keuangan->GenerateJurnal('1114', $id, 'k', $bbb);
         $this->M_keuangan->GenerateJurnal('5112', $id, 'k', $btk);
         $this->M_keuangan->GenerateJurnal('5113', $id, 'k', $bbop);


         //update harga jual produk
         $this->db->where('no_produk', $no_prod);
         $this->db->select_sum('subtotal');
         $nominal = $this->db->get('detail_produksi_ke2')->row_array()['subtotal'];

         $this->db->where('no_produk', $no_prod);
         $this->db->select_sum('jumlah');
         $jumlah_total = $this->db->get('detail_produksi_ke2')->row_array()['jumlah'];

         $harga_jual = (($nominal * 1.3) / $jumlah_total);
         $this->db->where('no_produk', $no_prod);
         $this->db->set('harga_jual', $harga_jual);
         $this->db->update('produk');


         redirect('c_transaksi/isi_edit_produksi_ke21/' . $id . '');
      }

      //PENJUALAN

      public function lihat_penjs()
      {
         // $this->db->select('a.no_trans, tgl_trans, total,no_trans_pembg');
         // $this->db->select_sum('jumlah');
         // $this->db->from('penjualan_ips a');
         // $this->db->join('detail_penjualan_ips b', 'a.no_trans = b.no_trans');
         // $data['result'] = $this->db->query($query)->result_array();
         $data['result'] = $this->db->get('penjualan_ips')->result_array();
         $this->template->load('template', 'penjs/view', $data);
      }

      public function form_penjs()
      {
         $query1   = "SELECT  MAX(RIGHT(no_trans,3)) as kode FROM penjualan_ips";
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
         $no_trans   = "PENJS_" . $kd;
         $data['id'] = $no_trans;
         $id = $no_trans;

         $this->db->where('status_penjs', NULL);
         $this->db->select('jual, a.no_trans, status,tgl_trans');
         $this->db->from('pembagian a');
         $this->db->join('detail_pembagian b', 'a.no_trans = b.no_trans');
         $data['pembagian'] = $this->db->get()->result_array();
         $this->template->load('template', 'penjs/form', $data);
      }

      public function isi_edit_penjs($id, $id_pembg)
      {
         $data['id'] = $id;
         $this->db->where('no_trans', $id);
         $data['no_trans'] = $this->db->get('penjualan_ips')->row()->no_trans;
         $this->db->where('no_trans', $id);
         $data['tgl'] = $this->db->get('penjualan_ips')->row()->tgl_trans;
         $data['id_pembg'] = $id_pembg;

         $this->db->like('nama_produk', 'Susu Sapi', 'before');
         $data['satuan'] = $this->db->get('produk')->row()->satuan;

         //jumlah yg bisa dijual
         $this->db->where('no_trans', $id_pembg);
         $data['jumlah'] = $this->db->get('detail_pembagian')->row_array()['jual'];

         $this->db->where('no_trans', $id);
         $this->db->select_sum('jumlah');
         $data['cek_jml'] = $this->db->get('detail_penjualan_ips')->row()->jumlah;

         //harga jual

         $this->db->where('no_produk', 'PR_001');
         $data['harga'] = $this->db->get('produk')->row()->harga_jual;

         //nyari no produk di produksinyaaa
         $data['no_produk'] = 'PR_001';

         //status
         $this->db->where('no_trans', $id);
         $data['status'] = $this->db->get('penjualan_ips')->row()->status;

         //ips
         $data['ips'] = $this->db->get('konsumen_ips')->result_array();

         //detail

         $this->db->where('no_trans', $id);
         $this->db->select('nama_ips, jumlah,subtotal');
         $this->db->from('detail_penjualan_ips a');
         $this->db->join('konsumen_ips b', 'a.no_ips = b.no_ips');
         $data['detail'] = $this->db->get()->result_array();

         $this->template->load('template', 'penjs/update', $data);
         // var_dump($data['list']);
      }


      public function tambah_penjs0()
      {
         $config = array(

            array(
               'field' => 'no_trans_pembg',
               'label' => 'ID Pembagian',
               'rules' => 'required',
               'errors' => array(
                  'required' => '%s tidak boleh kosong!'
               )
            )
         );
         $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
         $this->form_validation->set_rules($config);

         if ($this->form_validation->run() == FALSE) {

            $this->form_penjs();
         } else {
            $data = array(
               'no_trans' => $_POST['no_trans'],
               'tgl_trans' => $_POST['tgl_trans'],
               'status' => '0',
               'jumlah' => '0',
               'total' => '0',
               'no_trans_pembg' => $_POST['no_trans_pembg']
            );
            $this->db->insert('penjualan_ips', $data);

            $this->db->set('status_penjs', '1');
            $this->db->where('no_trans', $_POST['no_trans_pembg']);
            $this->db->update('pembagian');

            redirect('c_transaksi/lihat_penjs');
         }
      }



      public function tambah_penjs()
      {
         $config = array(

            array(
               'field' => 'no_ips',
               'label' => 'Nama Konsumen IPS',
               'rules' => 'required',
               'errors' => array(
                  'required' => '%s tidak boleh kosong!'
               )
            ),

            array(
               'field' => 'jumlah',
               'label' => 'Jumlah',
               'rules' => 'required|is_natural_no_zero',
               'errors' => array(
                  'required' => '%s tidak boleh kosong!',
                  'is_natural_no_zero' => '%s hanya berupa angka 1-9!'
               )
            )
         );
         $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
         $this->form_validation->set_rules($config);

         if ($this->form_validation->run() == FALSE) {

            $id_pembg = $_POST['id_pembg'];
            $id = $_POST['no_trans'];
            $this->isi_edit_penjs($id, $id_pembg);
         } else {
            $id = $_POST['no_trans'];

            $this->db->where('no_trans', $id);
            $this->db->select_sum('jumlah');
            $cekk = $this->db->get('detail_penjualan_ips')->row()->jumlah;

            $total_jml = $cekk + $_POST['jumlah'];

            if ($total_jml <= $_POST['jumlah1']) {


               $id_pembg = $_POST['id_pembg'];
               $id = $_POST['no_trans'];

               //get hpp
               $this->db->where('no_trans', $id);
               $id_pembg = $this->db->get('penjualan_ips')->row_array()['no_trans_pembg'];

               $this->db->where('no_trans', $id_pembg);
               $id_prod = $this->db->get('pembagian')->row_array()['no_trans_produksi1'];

               $query = "SELECT ifnull(subtotal * (stok_jual / jumlah), 0) as hpp, stok_jual
              FROM detail_produksi_ke1
              WHERE no_trans = '$id_prod'";
               $total_hpp = $this->db->query($query)->row_array()['hpp'];
               $stok_jual = $this->db->query($query)->row_array()['stok_jual'];
               $hpp = ($total_hpp / $stok_jual) * $_POST['jumlah'];

               $subtotal = $_POST['jumlah'] * $_POST['harga'];
               $data = array(
                  'no_trans' => $_POST['no_trans'],
                  'no_produk' => 'PR_001',
                  'jumlah' => $_POST['jumlah'],
                  'harga' => $_POST['harga'],
                  'subtotal' => $subtotal,
                  'no_ips' => $_POST['no_ips'],
                  'jumlah_kartu_stok' => 0,
                  'hpp' => $hpp
               );

               $this->db->where('no_trans', $id);
               $this->db->where('no_ips', $_POST['no_ips']);
               $cekcek = $this->db->get('detail_penjualan_ips')->num_rows();
               if ($cekcek == 0) {
                  $this->db->insert('detail_penjualan_ips', $data);
               } else {
                  $this->db->set('jumlah', "jumlah + " . $_POST['jumlah'] . "", FALSE);
                  $this->db->set('subtotal', "subtotal +" . $subtotal . "", FALSE);
                  $this->db->set('hpp', "hpp +" . $hpp . "", FALSE);
                  $this->db->where(array('no_trans' => $_POST['no_trans'], 'no_ips' => $_POST['no_ips']));
                  $this->db->update('detail_penjualan_ips');
               }

               $this->db->set('stok', "stok -" . $_POST['jumlah'] . "", FALSE);
               $this->db->where('no_produk', 'PR_001');
               $this->db->update('produk');




               $this->isi_edit_penjs($id, $id_pembg);
            } else {
               $data['error'] = 'Jumlah penjualan melebihi stok!';
               $id_pembg = $_POST['id_pembg'];
               $data['id'] = $id;
               $this->db->where('no_trans', $id);
               $data['no_trans'] = $this->db->get('penjualan_ips')->row()->no_trans;
               $this->db->where('no_trans', $id);
               $data['tgl'] = $this->db->get('penjualan_ips')->row()->tgl_trans;
               $data['id_pembg'] = $id_pembg;

               $this->db->like('nama_produk', 'Susu Sapi', 'before');
               $data['satuan'] = $this->db->get('produk')->row()->satuan;

               //jumlah yg bisa dijual
               $this->db->where('no_trans', $id_pembg);
               $data['jumlah'] = $this->db->get('detail_pembagian')->row()->jual;

               $this->db->where('no_trans', $id);
               $this->db->select_sum('jumlah');
               $data['cek_jml'] = $this->db->get('detail_penjualan_ips')->row()->jumlah;

               //harga jual

               $this->db->where('no_produk', 'PR_001');
               $data['harga'] = $this->db->get('produk')->row()->harga_jual;

               //nyari no produk di produksinyaaa
               $data['no_produk'] = 'PR_001';

               //status
               $this->db->where('no_trans', $id);
               $data['status'] = $this->db->get('penjualan_ips')->row()->status;

               //ips
               $data['ips'] = $this->db->get('konsumen_ips')->result_array();

               //detail

               $this->db->where('no_trans', $id);
               $this->db->select('nama_ips, jumlah,subtotal,');
               $this->db->from('detail_penjualan_ips a');
               $this->db->join('konsumen_ips b', 'a.no_ips = b.no_ips');
               $data['detail'] = $this->db->get()->result_array();

               $this->template->load('template', 'penjs/update', $data);
            }
         }
      }

      public function selesai_penjs($id, $total, $jumlah, $tgl)
      {

         // $fix_total = $total * (100/130);  
         // echo "<pre>"; print_r($hpp); echo "</pre>"; die();
         $this->db->where('no_trans', $id);
         $id_pembg = $this->db->get('penjualan_ips')->row_array()['no_trans_pembg'];

         $this->db->where('no_trans', $id_pembg);
         $id_prod = $this->db->get('pembagian')->row_array()['no_trans_produksi1'];

         $query = "SELECT ifnull(subtotal * (stok_jual / jumlah), 0) as hpp
              FROM detail_produksi_ke1
              WHERE no_trans = '$id_prod'";
         $hpp = $this->db->query($query)->row_array()['hpp'];

         $this->db->set('status', "1", FALSE);
         $this->db->set('total', $total);
         $this->db->set('jumlah', $jumlah);
         $this->db->where('no_trans', $id);
         $this->db->update('penjualan_ips');

         $this->M_keuangan->GenerateJurnal('1111', $id, 'd', $total);
         $this->M_keuangan->GenerateJurnal('4111', $id, 'k', $total);

         $this->M_keuangan->GenerateJurnal('6111', $id, 'd', $hpp);
         $this->M_keuangan->GenerateJurnal('1311', $id, 'k', $hpp);



         $data = array(
            'no_trans' => $id,
            'tgl_trans' => date('Y-m-d H:i:s'),
            'no_produk' => 'PR_001',
            'unit1' => '-',
            'harga1' => '-',
            'total1' => '-',
            'unit2' => $jumlah,
            'harga2' => $hpp / $jumlah,
            'total2' => $hpp,
            'unit3' => 0,
            'harga3' => 0,
            'total3' => 0,
            'status_pro' => 0,
            'status_pen' => 0
         );
         $this->db->insert('kartu_stok_penj', $data);




         redirect('c_transaksi/lihat_penjs');
      }

      //PENJUALAN toko

      public function lihat_penjt()
      {
         $this->db->select('a.no_trans, tgl_trans, total');
         $this->db->select_sum('jumlah');
         $this->db->from('penjualan_toko a');
         $this->db->join('detail_penjualan_toko b', 'a.no_trans = b.no_trans');
         $query = "SELECT a.no_trans, tgl_trans, total, sum(jumlah) as jumlah
            FROM penjualan_toko a 
            LEFT JOIN detail_penjualan_toko b ON a.no_trans = b.no_trans 
            GROUP BY a.no_trans";
         $data['result'] = $this->db->query($query)->result_array();
         // echo "<pre>"; print_r($data['result']); echo "</pre>"; die();

         $this->template->load('template', 'penjt/view', $data);
      }

      public function form_penjt()
      {
         $query1   = "SELECT  MAX(RIGHT(no_trans,3)) as kode FROM penjualan_toko";
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
         $no_trans   = "PENJT_" . $kd;
         $data['id'] = $no_trans;
         $id = $no_trans;
         $this->db->where('no_trans', $id);
         $this->db->select_sum('subtotal');
         $data['total'] = $this->db->get('detail_penjualan_toko')->row()->subtotal;

         $query = "SELECT * FROM produk WHERE stok > 0 AND no_produk NOT LIKE 'PR_001'";
         $data['barang'] = $this->db->query($query)->result_array();
         $this->db->where('no_trans', $id);
         $this->db->select('nama_produk, a.jumlah,harga, subtotal, satuan');
         $this->db->from('detail_penjualan_toko a');
         $this->db->join('produk b', 'a.no_produk = b.no_produk');
         $data['detail'] = $this->db->get()->result_array();

         $this->template->load('template', 'penjt/form', $data);
      }

      public function tambah_penjt()
      {
         $config = array(


            array(
               'field' => 'jumlah',
               'label' => 'Jumlah',
               'rules' => 'required|is_natural_no_zero',
               'errors' => array(
                  'required' => '%s tidak boleh kosong!',
                  'is_natural_no_zero' => '%s hanya bisa berupa angka 1-9!'
               )
            ),
            array(
               'field' => 'no_produk',
               'label' => 'Produk',
               'rules' => 'required',
               'errors' => array(
                  'required' => '%s tidak boleh kosong!'
               )
            )
         );
         $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
         $this->form_validation->set_rules($config);

         if ($this->form_validation->run() == FALSE) {

            $this->form_penjt();
         } else {


            $pengurang = $_POST['jumlah'];
            $kode_bahan = $_POST['no_produk'];

            $query111 = "SELECT * FROM detail_produksi_ke2 
               WHERE no_produk = '$kode_bahan' AND 
               jumlah_kartu_stok > 0 
               ORDER by no ASC";
            $row = $this->db->query($query111)->result_array();

            foreach ($row as $row) {

               $tgl  = $row['no'];
               $stok = $row['jumlah_kartu_stok'];
               $biaya = $row['bbb'] + $row['btk'] + $row['bp'] + $row['bop'];
               $hpp_satuan = $biaya / $row['jumlah'];
               $margin = ($biaya * 1.3) / $row['jumlah'];
               if ($pengurang > 0) {
                  $temp = $pengurang;
                  $pengurang = $pengurang - $stok;
                  if ($pengurang > 0) {
                     $stok_update = 0;
                  } else {
                     $stok_update = $stok - $temp;
                  }
                  // $sql = "UPDATE detail_penjualan SET stok = $stok_update WHERE kode_bahan = '$kode_bahan' AND tgl_masuk = '$tgl'";
                  // $sql = "UPDATE barang SET stok = $stok_update WHERE nama = '$barang' AND tgl = '$tgl'";
                  $this->db->set('jumlah_kartu_stok', $stok_update);
                  $this->db->where('no_produk', $kode_bahan);
                  $this->db->where('no', $tgl);
                  $this->db->update('detail_produksi_ke2');

                  $lpp = $row['jumlah'] * 0.5;
                  if ($stok_update < $lpp) {
                     $jumlah1 = $_POST['jumlah'];
                  } else {
                     $jumlah1 = $row['jumlah'] - $stok_update;
                  }

                  $data1 = array(
                     'no_trans' => $_POST['no_trans'],
                     'unit' => $jumlah1,
                     'harga' => $hpp_satuan,
                     'nominal' => $jumlah1 * $hpp_satuan
                  );
                  $this->db->insert('update_stok_penj', $data1);
               }
            }
            // die('hai');
            $this->db->where('no_produk', $_POST['no_produk']);
            $this->db->where('jumlah_kartu_stok >', 0);
            $val1 = $this->db->get('detail_produksi_ke2');
            $val2 = $this->db->get('update_stok_penj');

            if ($val1->num_rows() > $val2->num_rows()) {
               foreach ($val1->result_array() as $data) {
                  $harga1 = ($data['bbb'] + $data['btk'] + $data['bop'] + $data['bp']) / $data['jumlah'];
                  $d1 = array(
                     'no_trans' => $_POST['no_trans'],
                     'tgl_trans' => date('Y-m-d H:i:s'),
                     'no_produk' => $_POST['no_produk'],
                     'unit1' => '-',
                     'harga1' => '-',
                     'total1' => '-',
                     'unit2' => '-',
                     'harga2' => '-',
                     'total2' => '-',
                     'unit3' => $data['jumlah_kartu_stok'],
                     'harga3' => $harga1,
                     'total3' => $data['jumlah_kartu_stok'] * $harga1
                  );
                  $this->db->insert('kartu_stok_penj', $d1);
               }

               $this->db->where('no_trans', $_POST['no_trans']);
               $this->db->where('no_produk', $_POST['no_produk']);
               $this->db->order_by('no ASC');
               $cek_no = $this->db->get('kartu_stok_penj')->row_array()['no'];

               foreach ($val2->result_array() as $data) {
                  # code...
                  $this->db->where('no', $cek_no);
                  $this->db->set('unit2', $data['unit']);
                  $this->db->set('harga2', $data['harga']);
                  $this->db->set('total2', $data['nominal']);
                  $this->db->update('kartu_stok_penj');
                  $cek_no++;
               }
            } elseif ($val2->num_rows() >= $val1->num_rows()) {
               foreach ($val2->result_array() as $data) {
                  $d1 = array(
                     'no_trans' => $_POST['no_trans'],
                     'tgl_trans' => date('Y-m-d H:i:s'),
                     'no_produk' => $_POST['no_produk'],
                     'unit1' => '-',
                     'harga1' => '-',
                     'total1' => '-',
                     'unit2' => $data['unit'],
                     'harga2' => $data['harga'],
                     'total2' => $data['nominal'],
                     'unit3' => '-',
                     'harga3' => '-',
                     'total3' => '-'
                  );
                  $this->db->insert('kartu_stok_penj', $d1);
               }

               $this->db->where('no_trans', $_POST['no_trans']);
               $this->db->where('no_produk', $_POST['no_produk']);
               $this->db->order_by('no ASC');
               $cek_no = $this->db->get('kartu_stok_penj')->row_array()['no'];

               $this->db->where('no_trans', $_POST['no_trans']);
               $this->db->where('no_produk', $_POST['no_produk']);
               $this->db->order_by('no DESC');
               $cek_no1 = $this->db->get('kartu_stok_penj')->row_array()['no'];

               foreach ($val1->result_array() as $data) {
                  # code...

                  $harga1 = ($data['bbb'] + $data['btk'] + $data['bop'] + $data['bp']) / $data['jumlah'];

                  $this->db->where('no', $cek_no);
                  $this->db->set('unit3', $data['jumlah_kartu_stok']);
                  $this->db->set('harga3', $harga1);
                  $this->db->set('total3', $data['jumlah_kartu_stok'] * $harga1);
                  $this->db->update('kartu_stok_penj');

                  $cek_no++;
               }
               if ($val1->result() == FALSE) {
                  foreach ($val2 as $data) {
                     # code...
                     $this->db->where('no', $cek_no1);
                     $this->db->set('unit3', 0);
                     $this->db->set('harga3', 0);
                     $this->db->set('total3', 0);
                     $this->db->update('kartu_stok_penj');
                  }
               }
            }

            // echo "<pre>"; print_r($cek_produk); echo "</pre>"; 
            $this->db->where('no_trans', $_POST['no_trans']);
            $this->db->delete('update_stok_penj');
            // die('hai');
            $this->db->where('no_produk', $_POST['no_produk']);
            $harga = $this->db->get('produk')->row_array()['harga_jual'];
            $subtotal = $harga * $_POST['jumlah'];
            $data = array(
               'no_trans' => $_POST['no_trans'],
               'no_produk' => $_POST['no_produk'],
               'jumlah' => $_POST['jumlah'],
               'harga' => $harga,
               'subtotal' => $subtotal
            );

            $this->db->where(array('no_trans' => $_POST['no_trans'], 'no_produk' => $_POST['no_produk']));
            $cek =  $this->db->get('detail_penjualan_toko')->num_rows();
            if ($cek == 0) {
               $this->db->insert('detail_penjualan_toko', $data);
            } else {
               $this->db->set('jumlah', "jumlah + " . $_POST['jumlah'] . "", FALSE);
               $this->db->set('subtotal', "subtotal +" . $subtotal . "", FALSE);
               $this->db->where(array('no_trans' => $_POST['no_trans'], 'no_produk' => $_POST['no_produk']));
               $this->db->update('detail_penjualan_toko');
            }
            //pengurang stok produk
            $this->db->set('stok', "stok -" . $_POST['jumlah'] . "", FALSE);
            $this->db->where('no_produk', $_POST['no_produk']);
            $this->db->update('produk');
            redirect('c_transaksi/form_penjt');
         }
      }

      public function selesai_penjt($id, $total)
      {

         //   $query = "SELECT no_produk FROM detail_penjualan_toko WHERE no_trans = '$id' GROUP BY no_produk";
         //   $cek_produk = $this->db->query($query)->result_array();
         // // echo "<pre>"; print_r($cek_produk); echo "</pre>"; die();

         //   foreach ($cek_produk as $data) {
         //     $no_produk = $data['no_produk'];
         //   $q1 = "SELECT ifnull((jumlah_kartu_stok / jumlah) * subtotal ,0) as nominal, ifnull(jumlah_kartu_stok, 0) as jumlah_kartu_stok
         //         FROM detail_produksi_ke2 WHERE no_produk = '$no_produk' AND jumlah_kartu_stok > 0";
         //   $jb_stok = $this->db->query($q1)->num_rows();
         //   $list_stok = $this->db->query($q1)->result_array();

         //   $q2 = "SELECT ifnull(jumlah,0) as jumlah, ifnull(harga, 0) as harga, ifnull(subtotal,0) as subtotal FROM detail_penjualan_toko WHERE no_trans = '$id' AND no_produk = '$no_produk' ";
         //   $jb_penj = $this->db->query($q2)->num_rows();
         //   $list_penj = $this->db->query($q2)->row_array();
         //   if($jb_stok >= $jb_penj){
         //    // $tes =  array_merge($list_penj, $list_stok);
         // // echo "<pre>"; print_r($tes); echo "</pre>"; die();

         //     foreach($list_stok as $data){
         //       # code...
         //       $array = array('no_trans' => $id,
         //                 'tgl_trans' => date('Y-m-d H:i:s'),
         //                 'no_produk' => $no_produk,
         //                 'unit1' => '-',
         //                 'harga1' => '-',
         //                 'total1' => '-',
         //                 'unit2' => '',
         //                 'harga2' => '',
         //                 'total2' => '',
         //                 'unit3' => $data['jumlah_kartu_stok'],
         //                 'harga3' => $data['nominal'] / $data['jumlah_kartu_stok'],
         //                 'total3' => $data['nominal']);
         //       $this->db->insert('kartu_stok_penj', $array);
         //     }
         //   $this->db->where('no_trans', $id);
         //   $this->db->where('no_produk', $no_produk);
         //   $this->db->order_by('no ASC');
         //   $no_asc = $this->db->get('kartu_stok_penj')->row_array()['no'];
         // // echo "<pre>"; print_r($list_penj['harga']); echo "</pre>"; die();


         //   $this->db->set('unit2', $list_penj['jumlah']);
         //   $this->db->set('harga2', $list_penj['harga']);
         //   $this->db->set('total2', $list_penj['subtotal']);
         //   $this->db->where('no_trans', $id);
         //   $this->db->where('no', $no_asc);
         //   $this->db->where('no_produk', $no_produk);
         //   $this->db->update('kartu_stok_penj');
         //   }else{
         //     $array = array('no_trans' => $id,
         //                 'tgl_trans' => date('Y-m-d H:i:s'),
         //                 'no_produk' => $no_produk,
         //                 'unit1' => '-',
         //                 'harga1' => '-',
         //                 'total1' => '-',
         //                 'unit2' => $list_penj['jumlah'],
         //                 'harga2' => $list_penj['harga'],
         //                 'total2' => $list_penj['subtotal'],
         //                 'unit3' => $list_penj['jumlah'],
         //                 'harga3' => $list_penj['harga'] ,
         //                 'total3' => $list_penj['subtotal']);
         //       $this->db->insert('kartu_stok_penj', $array);

         //   }


         //   }

         // die('halo tes');

         $q2 = "SELECT ifnull(sum(total2),0) as hpp, no_produk FROM kartu_stok_penj WHERE no_trans ='$id' group by no_produk";

         $cek_list_hpp = $this->db->query($q2)->result_array();
         foreach ($cek_list_hpp as $data) {
            $this->db->where('no_produk', $data['no_produk']);
            $this->db->where('no_trans', $id);
            $this->db->order_by('no ASC');
            $cek_asc = $this->db->get('detail_penjualan_toko')->row_array()['no'];

            $this->db->where('no', $cek_asc);
            $this->db->where('no_produk', $data['no_produk']);
            // $this->db->set('hpp', $data['hpp']);
            $this->db->set('hpp', $data['hpp']);

            $this->db->update('detail_penjualan_toko');
         }





         $data =  array(
            'no_trans' => $id,
            'tgl_trans' => date('Y-m-d'),
            'total' => $total,
            'status' => '1'
         );
         $this->db->insert('penjualan_toko', $data);

         $q1 = "SELECT ifnull(sum(total2),0) as hpp FROM kartu_stok_penj WHERE no_trans ='$id'";
         $fix_total = $this->db->query($q1)->row_array()['hpp'];

         $this->M_keuangan->GenerateJurnal('1111', $id, 'd', $total);
         $this->M_keuangan->GenerateJurnal('4112', $id, 'k', $total);
         $this->M_keuangan->GenerateJurnal('6112', $id, 'd', $fix_total);
         $this->M_keuangan->GenerateJurnal('1312', $id, 'k', $fix_total);


         redirect('c_transaksi/lihat_penjt');
      }

      public function isi_edit_penjt($id)
      {
         $data['id'] = $id;
         $this->db->where('no_trans', $id);
         $data['no_trans'] = $this->db->get('penjualan_toko')->row()->no_trans;
         $this->db->where('no_trans', $id);
         $data['tgl'] = $this->db->get('penjualan_toko')->row()->tgl_trans;


         //DETAIL
         $this->db->select('nama_produk, a.jumlah, harga,satuan,subtotal');
         $this->db->from('detail_penjualan_toko a');
         $this->db->join('produk c', 'a.no_produk = c.no_produk');
         $this->db->where('no_trans', $id);
         $data['detail'] = $this->db->get()->result_array();




         $this->template->load('template', 'penjt/update', $data);
      }

      //---------------------------------------------------------------------------------- 

      public function lihat_pemby()
      {
         $this->db->where('tgl_trans', date('Y-m-d'));
         $cek = $this->db->get('pembayaran')->result();
         $this->db->where('tgl_trans', date('Y-m-d'));
         $this->db->where('status >', '0');
         $cek1 = $this->db->get('pembayaran')->result();
         $data['cek'] = $cek;
         $data['cek1'] = $cek1;
         if ($cek1 == TRUE) {
            $data['error'] = 'Pembayaran untuk hari ini sudah dilakukan!';
         }
         $data['result'] = $this->db->get('pembayaran')->result_array();
         $data['result2'] = $this->db->get('pembayaranv')->result_array();
         $this->template->load('template', 'pemby/view', $data);
      }

      public function isi_edit_pemby($id)
      {
         $data['id'] = $id;
         $data['no_trans'] = $id;
         $this->db->where('no_trans', $id);
         $data['tgl'] = $this->db->get('pembayaran')->row()->tgl_trans;

         //detailnya cok
         $this->db->where('no_trans', $id);
         $this->db->where('jenis_penjualan', 'ips');
         $this->db->from('detail_pembayaran a');
         $this->db->join('coa b', 'a.no_coa = b.no_coa');
         $data['detailips'] = $this->db->get()->result_array();

         $this->db->where('no_trans', $id);
         $this->db->where('jenis_penjualan', 'toko');
         $this->db->from('detail_pembayaran a');
         $this->db->join('coa b', 'a.no_coa = b.no_coa');
         $data['detailtoko'] = $this->db->get()->result_array();

         //CEK SELESAI BELANJA JADI NON KLIKK!


         $this->template->load('template', 'pemby/update', $data);
         // var_dump($data['cek_selesai']);
      }

      public function form_pemby()
      {
         $query1   = "SELECT  MAX(RIGHT(no_trans,3)) as kode FROM pembayaran";
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
         $no_trans   = "PMBY_" . $kd;
         $data['id'] = $no_trans;

         $this->db->where('no_trans', $no_trans);
         $data['cek'] = $this->db->get('pembayaran')->row_array()['status'];

         //beban beban
         $this->db->like('no_coa', '522', 'AFTER');
         $data['bebant'] = $this->db->get('coa')->result_array();

         $this->db->like('no_coa', '521', 'AFTER');
         $data['bebanv'] = $this->db->get('coa')->result_array();



         // $data['cek_selesai'] = $this->db->query($query1)->num_rows();
         $this->db->where('no_trans', $no_trans);
         $data['cek_selesai'] = $this->db->get('detail_pembayaran')->num_rows();

         //UPDATE TABEL PEMBELIAN_BB
         $this->db->where('no_trans', $no_trans);
         $this->db->select_sum('subtotal');
         $data['total'] = $this->db->get('detail_pembayaran')->row()->subtotal;

         //detailnya cok
         $this->db->where('no_trans', $no_trans);
         $this->db->where('jenis_penjualan', 'ips');
         $this->db->from('detail_pembayaran a');
         $this->db->join('coa b', 'a.no_coa = b.no_coa');
         $data['detailips'] = $this->db->get()->result_array();

         $this->db->where('no_trans', $no_trans);
         $this->db->where('jenis_penjualan', 'toko');
         $this->db->from('detail_pembayaran a');
         $this->db->join('coa b', 'a.no_coa = b.no_coa');
         $data['detailtoko'] = $this->db->get()->result_array();



         $this->template->load('template', 'pemby/form', $data);
      }

      public function tambah_pemby()
      {
         $data = array(
            'no_trans' => $_POST['no_trans'],
            'tgl_trans' => $_POST['tgl_trans'],
            'status' => '0',
            'total' => '0'
         );
         $this->db->insert('pembayaran', $data);

         redirect('c_transaksi/lihat_pemby');
      }

      public function tambah_pemby1()
      {
         $config = array(


            array(
               'field' => 'no_coa',
               'label' => 'Beban',
               'rules' => 'required',
               'errors' => array(
                  'required' => 'Inputan Salah'
               )
            ),
            array(
               'field' => 'jumlah',
               'label' => 'Jumlah',
               'rules' => 'required|is_natural_no_zero',
               'errors' => array(
                  'required' => 'Inputan Salah',
                  'is_natural_no_zero' => '%s hanya berupa angka 1-9!'
               )
            ),
            array(
               'field' => 'jenis_penjualan',
               'label' => 'Jenis Penjualan',
               'rules' => 'required',
               'errors' => array(
                  'required' => 'Inputan Salah'
               )
            )
         );
         $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
         $this->form_validation->set_rules($config);

         if ($this->form_validation->run() == FALSE) {

            $this->form_penjt();
         } else {
            $data = array(
               'no_trans' => $_POST['no_trans'],
               'no_coa' => $_POST['no_coa'],
               'subtotal' => $_POST['jumlah'],
               'jenis_penjualan' => $_POST['jenis_penjualan']
            );



            $this->db->where(array('no_trans' => $_POST['no_trans'], 'jenis_penjualan' => $_POST['jenis_penjualan'], 'no_coa' => $_POST['no_coa']));
            $cek =  $this->db->get('detail_pembayaran')->num_rows();
            if ($cek == 0) {
               $this->db->insert('detail_pembayaran', $data);
            } else {

               $this->db->set('subtotal', "subtotal + " . $_POST['jumlah'] . "", FALSE);
               $this->db->where(array('no_trans' => $_POST['no_trans'], 'jenis_penjualan' => $_POST['jenis_penjualan'], 'no_coa' => $_POST['no_coa']));
               $this->db->update('detail_pembayaran');
            }

            redirect('c_transaksi/form_pemby');
         }
      }

      public function selesai_pemby($id, $total)
      {
         $data = array(
            'no_trans' => $id,
            'tgl_trans' => date('Y-m-d'),
            'status' => '1',
            'total' => $total
         );
         $this->db->insert('pembayaran', $data);


         $this->db->where('no_trans', $id);
         $list = $this->db->get('detail_pembayaran')->result_array();
         foreach ($list as $data) {
            # code...
            $id = $data['no_trans'];
            $total = $data['subtotal'];
            $no_coa = $data['no_coa'];
            $this->M_keuangan->GenerateJurnal($no_coa, $id, 'd', $total);
            $this->M_keuangan->GenerateJurnal('1111', $id, 'k', $total);
         }

         redirect('c_transaksi/lihat_pemby');
      }


      // pembayaran variabel

      public function lihat_pembyv()
      {

         $data['result'] = $this->db->get('pembayaranv')->result_array();
         $this->template->load('template', 'pemby/var/view', $data);
      }

      public function isi_edit_pembyv($id)
      {
         $data['id'] = $id;
         $data['no_trans'] = $id;
         $this->db->where('no_trans', $id);
         $data['tgl'] = $this->db->get('pembayaranv')->row()->tgl_trans;

         $this->db->where('no_trans', $id);
         $data['no_penj'] = $this->db->get('pembayaranv')->row_array()['no_trans_penj'];

         $no_penj = substr($data['no_penj'], 0, 5);
         $data['cpn'] = $no_penj;
         if ($no_penj == 'PENJS') {
            $this->db->where('no_trans', $data['no_penj']);
            $data['jumlahpenj'] = $this->db->get('penjualan_ips')->row_array()['jumlah'];
         } else {
            $q5 = "SELECT * FROM coa WHERE no_coa = 5211 OR no_coa = 5212";
            $data['bebanv'] = $this->db->query($q5)->result_array();
            // echo "<pre>"; print_r($data['bebanv']); echo "</pre>"; die();

            $this->db->where('no_trans', $data['no_penj']);
            $this->db->select_sum('jumlah');
            $data['jumlahpenj'] = $this->db->get('detail_penjualan_toko')->row_array()['jumlah'];
         }

         //detailnya cok
         $this->db->where('no_trans', $id);
         $this->db->from('detail_pembayaranv a');
         $this->db->join('coa b', 'a.no_coa = b.no_coa');
         $data['detail'] = $this->db->get()->result_array();

         //total
         $this->db->where('no_trans', $id);
         $this->db->select_sum('subtotal');
         $data['total'] = $this->db->get('detail_pembayaranv')->row_array()['subtotal'];

         //kondisi cek 
         $this->db->where('no_trans', $id);
         $data['cek1'] = $this->db->get('pembayaranv')->row_array()['status'];

         $this->template->load('template', 'pemby/var/update', $data);
         // var_dump($data['cek_selesai']);
      }

      public function form_pembyv()
      {
         $query1   = "SELECT  MAX(RIGHT(no_trans,3)) as kode FROM pembayaranv WHERE status = 0 OR status = 1";
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
         $no_trans   = "PMBYV_" . $kd;
         $data['id'] = $no_trans;

         $this->db->where('no_trans', $no_trans);
         $data['cek'] = $this->db->get('pembayaran')->row_array()['status'];

         //id penjualan
         $q1 = "SELECT * FROM penjualan_ips WHERE status_pembyv IS NULL";
         $data['penjips'] = $this->db->query($q1)->result_array();


         $q2 = "SELECT a.no_trans, sum(jumlah) as jumlah 
      FROM penjualan_toko a 
      JOIN detail_penjualan_toko b ON a.no_trans = b.no_trans 
      WHERE status_pembyv IS NULL
      GROUP BY a.no_trans";
         $data['penjtoko'] = $this->db->query($q2)->result_array();

         //cek status

         // $stats = substr($no_trans, 0,4);

         // echo "<pre>"; print_r($stats); echo "</pre>"; die();

         $this->template->load('template', 'pemby/var/form', $data);
      }

      public function tambah_pembyv()
      {
         $data = array(
            'no_trans' => $_POST['no_trans'],
            'tgl_trans' => $_POST['tgl_trans'],
            'status' => '0',
            'total' => '0',
            'no_trans_penj' => $_POST['no_penj']
         );
         $this->db->insert('pembayaranv', $data);

         $no_penj = substr($_POST['no_penj'], 0, 5);

         if ($no_penj == 'PENJS') {
            $this->db->set('status_pembyv', '1');
            $this->db->where('no_trans', $_POST['no_penj']);
            $this->db->update('penjualan_ips');
         } else {
            $this->db->set('status_pembyv', '1');
            $this->db->where('no_trans', $_POST['no_penj']);
            $this->db->update('penjualan_toko');
         }

         redirect('c_transaksi/lihat_pembyv');
      }

      public function tambah_pembyv1()
      {
         $config = array(


            array(
               'field' => 'no_coa',
               'label' => 'Beban',
               'rules' => 'required',
               'errors' => array(
                  'required' => 'Inputan Salah'
               )
            ),
            array(
               'field' => 'tarif',
               'label' => 'Tarif',
               'rules' => 'required|is_natural_no_zero',
               'errors' => array(
                  'required' => 'Inputan Salah',
                  'is_natural_no_zero' => '%s hanya berupa angka 1-9!'
               )
            )
         );
         $this->form_validation->set_error_delimiters('<div class="alert alert-danger"> <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ', '</div>');
         $this->form_validation->set_rules($config);

         if ($this->form_validation->run() == FALSE) {
            $id = $_POST['no_trans'];
            $this->isi_edit_pembyv($id);
         } else {
            $id = $_POST['no_trans'];
            $subtotal = $_POST['jumlah_penj'] * $_POST['tarif'];

            $jenis_penj = substr($id, 0, 5);
            if ($jenis_penj == 'PENJS') {

               $data = array(
                  'no_trans' => $_POST['no_trans'],
                  'no_coa' => $_POST['no_coa'],
                  'tarif' => $_POST['tarif'],
                  'jumlah' => $_POST['jumlah_penj'],
                  'subtotal' => $subtotal,
                  'jenis_penjualan' => 'ips'
               );
            } else {
               $data = array(
                  'no_trans' => $_POST['no_trans'],
                  'no_coa' => $_POST['no_coa'],
                  'tarif' => $_POST['tarif'],
                  'jumlah' => $_POST['jumlah_penj'],
                  'subtotal' => $subtotal,
                  'jenis_penjualan' => 'toko'
               );
            }


            $this->db->where(array('no_trans' => $_POST['no_trans'], 'no_coa' => $_POST['no_coa']));
            $cek =  $this->db->get('detail_pembayaranv')->num_rows();
            if ($cek == 0) {
               $this->db->insert('detail_pembayaranv', $data);
            } else {

               $this->db->set('subtotal', "subtotal + " . $subtotal . "", FALSE);
               $this->db->where(array('no_trans' => $_POST['no_trans'], 'no_coa' => $_POST['no_coa']));
               $this->db->update('detail_pembayaranv');

               $this->db->where('no_trans', $id);
               $tarif = $this->db->get('detail_pembayaranv')->row_array()['subtotal'];
               $this->db->where('no_trans', $id);
               $jml = $this->db->get('detail_pembayaranv')->row_array()['jumlah'];
               $tarif_total = $tarif / $jml;
               // echo "<pre>"; print_r($subtotal); echo "</pre>"; die();

               $this->db->set('tarif', $tarif_total);
               $this->db->where(array('no_trans' => $_POST['no_trans'], 'no_coa' => $_POST['no_coa']));
               $this->db->update('detail_pembayaranv');
            }

            redirect('c_transaksi/isi_edit_pembyv/' . $id . '');
         }
      }

      public function selesai_pembyv($id, $total, $tgl)
      {
         $this->db->set('status', 1);
         $this->db->set('total', $total);
         $this->db->where(array('no_trans' => $id));
         $this->db->update('pembayaranv');


         $this->db->where('no_trans', $id);
         $list = $this->db->get('detail_pembayaranv')->result_array();
         foreach ($list as $data) {
            # code...
            $id = $data['no_trans'];
            $total = $data['subtotal'];
            $no_coa = $data['no_coa'];
            $this->M_keuangan->GenerateJurnal($no_coa, $id, 'd', $total);
            $this->M_keuangan->GenerateJurnal('1111', $id, 'k', $total);
         }

         redirect('c_transaksi/lihat_pembyv');
      }

      public function revaluasi()
      {
         $data['list'] = $this->db->get('revaluasi')->result();
         $this->template->load('template', 'revaluasi/index', $data);
      }

      public function form_revaluasi()
      {
         $aset = $this->model->detail_rev();
         $data['aset'] = $aset;

         $this->template->load('template', 'revaluasi/form', $data);
      }

      public function direvaluasikan()
      {
         $this->form_detail_revaluasi();
      }

      public function form_detail_revaluasi()
      {
         $query1 = "SELECT  MAX(RIGHT(id_revaluasi,3)) as kode FROM revaluasi";
         $abc = $this->db->query($query1);
         $no_trans = "";
         if ($abc->num_rows() > 0) {
            foreach ($abc->result() as $k) {
               $tmp = ((int)$k->kode) + 1;
               $kd = sprintf("%03s", $tmp);
            }
         } else {
            $kd = "001";
         }
         $datenow = date("Ymd");
         $no_trans = "REV" . $datenow . "" . $kd;
         $data['id_revaluasi'] = $no_trans;

         $get_id_pny = "SELECT  MAX(RIGHT(id_penyusutan,3)) as kode FROM penyusutan";
         $zxc = $this->db->query($get_id_pny);
         $id_pny = "";
         if ($zxc->num_rows() > 0) {
            foreach ($zxc->result() as $k) {
               $tmp = ((int)$k->kode) + 1;
               $_id_pny = sprintf("%03s", $tmp);
            }
         } else {
            $_id_pny = "001";
         }
         $datenow = date("Ymd");
         $id_pny = "PNY" . $datenow . "" . $_id_pny;
         $data['id_pny'] = $id_pny;


         $id = $this->input->post('id');
         $data['id'] = $id;
         // print_r($id);exit;

         $rowPny = "SELECT a.id, aset, sisa_umur, umur_aset, subtotal, sisa_umur_aset, nilai_sisa, id_detail_aset, tgl_input
      FROM detail_pembelian a
      JOIN aset b ON a.id_aset = b.id
      JOIN pembelian_aset c ON a.id_pembelian = c.id_pembelian
      WHERE id_detail_aset = '$id'";
         $detail_peny = $this->db->query($rowPny)->row();
         $data['detail_peny'] = $detail_peny;
         // print_r($detail_peny);exit;

         $bulan = date('F Y');
         // ambil nilai 
         $hp = $detail_peny->subtotal;
         $nilai_sisa = $detail_peny->nilai_sisa;

         // jumlah aset 
         // $jumlah = $detail_peny->jumlah;

         // hp / jumlah
         $harga_persatuan = $hp;

         $umur_aset = $detail_peny->umur_aset;

         $nilai_penyusutan = ($hp - $nilai_sisa) / $umur_aset;
         // print_r($nilai_penyusutan);exit;

         $data['nilai_penyusutan'] = $nilai_penyusutan;

         $this->db->where("id_detail", $id);

         $nilai_penyusutan_fix = $this->db->get("penyusutan")->row()->total_penyusutan ?? 0;
         // print_r($nilai_penyusutan_fix);exit;

         $data['nilai_penyusutan_fix'] = $nilai_penyusutan_fix;

         // ambil nilai akumulasi terakhir + nilai penyusutan
         $this->db->where("id_detail", $id);
         $this->db->order_by("akumulasi_peny", "DESC");
         $akumulasi_fix = $this->db->get("penyusutan")->row()->akumulasi_peny ?? 0;

         $data['akumulasi_fix'] = $akumulasi_fix + $nilai_penyusutan_fix;
         // print_r($data['akumulasi_fix']);exit;

         $data['month_now'] = $bulan;

         $query = "SELECT * 
      FROM log_penyusutan 
      WHERE id_detail = '$id' 
      ORDER BY id_penyusutan DESC
      ";
         $log_penyusutan_kosong = $this->db->query($query)->row();
         $data['log_penyusutan_kosong'] = $log_penyusutan_kosong;

         $_log_rev = "SELECT * 
      FROM revaluasi 
      WHERE id_detail = '$id'
      ORDER BY id_revaluasi DESC
      ";
         $log_rev = $this->db->query($_log_rev)->row();
         // print_r($log_rev);exit;
         $data['log_rev'] = $log_rev;

         $_nilai_akhir = "SELECT nilai_akhir
      FROM log_penyusutan 
      WHERE id_detail = '$id' 
      ORDER BY id_penyusutan DESC
      ";
         $nilai_akhir = $this->db->query($_nilai_akhir)->row()->nilai_akhir;
         $data['nilai_akhir'] = $nilai_akhir;

         $_rev = "SELECT *
      FROM perbaikan
      WHERE id_detail_aset = '$id'";
         $nilai_rev = $this->db->query($_rev)->row()->nilai_revaluasi ?? 0;
         $nilai_perbaikan = $this->db->query($_rev)->row()->nilai_perbaikan ?? 0;
         $nilai_buku_perbaikan = $nilai_perbaikan - $nilai_rev;
         // print_r($nilai_rev);exit;
         $data['nilai_rev'] = $nilai_rev;
         $data['nilai_buku_perbaikan'] = $nilai_buku_perbaikan;
         $data['nilai_perbaikan'] = $nilai_perbaikan;
         $this->template->load('template', 'revaluasi/form_detail_rev', $data);
      }

      public function perbaikan()
      {
         $getlist = "SELECT a.*, aset
      FROM perbaikan a
      INNER JOIN detail_pembelian b ON a.id_detail_aset = b.id_detail_aset
      INNER JOIN aset c ON c.id = b.id_aset";
         $list = $this->db->query($getlist)->result();
         $data['list'] = $list;
         $this->template->load('template', 'perbaikan/index', $data);
      }

      public function form_perbaikan()
      {
         $this->db->select('RIGHT(perbaikan.id_perbaikan,3) as kode', FALSE);
         $this->db->order_by('kode', 'DESC');
         $this->db->limit(1);
         $query = $this->db->get('perbaikan');
         if ($query->num_rows() <> 0) {
            $data = $query->row();
            $kode = intval($data->kode) + 1;
         } else {
            $kode = 1;
         }
         $tgl = date('Ymd');
         $batas = str_pad($kode, 3, "0", STR_PAD_LEFT);
         $kodetampil = "PRB" . $tgl . $batas;

         $getaset = "SELECT a.*, aset
      FROM detail_pembelian a
      INNER JOIN aset b ON a.id_aset = b.id
      WHERE cek_bulan_perb IS NULL
      AND cek_bulan_peny != LEFT(SYSDATE(), 7)
      ";
         $aset = $this->db->query($getaset)->result();

         $id_perbaikan = $kodetampil;

         $data = [
            'kode' => $id_perbaikan,
            'aset' => $aset
         ];
         // print_r($id_perbaikan);exit;
         $this->template->load('template', 'perbaikan/form', $data);
      }

      public function list_aset()
      {
         $id_detail = $this->input->post('id_detail');
         $data = $this->model->list_aset($id_detail)->row();
         echo json_encode($data);
      }

      public function simpan_perbaikan()
      {
         $np = str_replace('.', '', $this->input->post('nilai_perbaikan'));
         $nilai_perbaikan = $np;
         $kode = $this->input->post('id_perbaikan');
         $date = $this->input->post('date');
         $aset = $this->input->post('aset');
         $keterangan = $this->input->post('keterangan');
         $ue = $this->input->post('ue');

         $revaluasi = $nilai_perbaikan / $ue;

         $data = [
            'id_perbaikan' => $kode,
            'id_detail_aset' => $aset,
            'tgl_perbaikan' => $date,
            'ket_perbaikan' => $keterangan,
            'nilai_perbaikan' => $nilai_perbaikan,
            'nilai_revaluasi' => number($revaluasi)
         ];
         // print_r($data);exit;
         $this->db->insert('perbaikan', $data);

         $data_update = [
            'cek_bulan_perb' => date('Y-m')
         ];
         $this->db->where('id_detail_aset', $aset);
         $this->db->update('detail_pembelian', $data_update);
         // update cek bulan perbaikan di tb_pembelian_aset

         // jurnal perbaikan
         $beban_per = [
            'id_jurnal' => $kode,
            'tgl_jurnal' => date('Y-m-d'),
            'no_coa' => 5224,
            'posisi_dr_cr' => 'd',
            'nominal' => $nilai_perbaikan,
         ];
         $this->db->insert('jurnal', $beban_per);

         $kas = [
            'id_jurnal' => $kode,
            'tgl_jurnal' => date('Y-m-d'),
            'no_coa' => 1111,
            'posisi_dr_cr' => 'k',
            'nominal' => $nilai_perbaikan,
         ];
         $this->db->insert('jurnal', $kas);
         redirect('c_transaksi/perbaikan');
      }

      public function penyusutan()
      {
         # code...
         $this->db->select("*");
         $this->db->join("log_penyusutan", "log_penyusutan.id_penyusutan = penyusutan.id_penyusutan");
         $detail_pny = $this->db->get("penyusutan")->result();
         $penyusutan = $this->model->getPny()->result();

         $data['penyusutan'] = $penyusutan;
         $data['detail'] = $detail_pny;
         $this->template->load('template', 'penyusutan/index', $data);
      }

      public function detail($id)
      {
         $cek_trans = $this->uri->segment(3);


         // print_r($list);exit;

         // $rev = "SELECT * 
         // FROM revaluasi 
         // WHERE id_detail = '$id_detail'
         // ";
         // $list_rev = $this->db->query($rev)->result();



         // $_header_rev = "SELECT a.*, d.aset, c.id_detail_aset
         // FROM revaluasi a
         // INNER JOIN detail_pembelian c ON a.id_detail = c.id_detail_aset
         // INNER JOIN aset d ON c.id_aset = d.id
         // where a.id_revaluasi = '$id'
         // ";

         // if (substr($cek_trans, 0, 3) == 'REV') {
         //    # code...
         //    $header = $this->db->query($_header_rev)->row();
         // } else {
         //    # code...
         //    $header = $this->db->query($_header)->row();
         // }

         // $data = [
         //    'id' => $id,
         //    'nilai_buku' => $result, 
         //    'list' => $list, 
         //    'header' => $header, 
         //    'list_rev' => $list_rev
         // ];

         // $cek_trans = $this->uri->segment(3);
         // print_r($cek_trans);exit;
         if (substr($cek_trans, 0, 3) == 'REV') {
            $_detail = "SELECT a.id_detail
         from revaluasi a
         WHERE a.id_revaluasi = '$id'
         GROUP BY a.id_detail";
            $id_detail = $this->db->query($_detail)->row()->id_detail;

            $rev = "SELECT * 
         FROM revaluasi 
         WHERE id_detail = '$id_detail'
         ";
            $list_rev = $this->db->query($rev)->result();

            $_header_rev = "SELECT a.*, d.aset, c.id_detail_aset
         FROM revaluasi a
         INNER JOIN detail_pembelian c ON a.id_detail = c.id_detail_aset
         INNER JOIN aset d ON c.id_aset = d.id
         where a.id_revaluasi = '$id'
         ";
            $header = $this->db->query($_header_rev)->row();

            $data = [
               'id' => $id,
               'header' => $header,
               'list_rev' => $list_rev
            ];
            // echo 'Revaluasi';
            $this->template->load('template', 'revaluasi/detail', $data);
         } else {
            $nilai_buku = "SELECT subtotal
         FROM penyusutan a 
         JOIN detail_pembelian b ON a.id_detail = b.id_detail_aset
         WHERE id_penyusutan = '$id'";
            $result = $this->db->query($nilai_buku)->row()->subtotal;

            $this->db->select("*");
            $this->db->join("log_penyusutan", "log_penyusutan.id_penyusutan = penyusutan.id_penyusutan");
            $penyusutan = $this->db->get("penyusutan")->result();

            $_detail = "SELECT a.id_detail
         from penyusutan a
         WHERE a.id_penyusutan = '$id'
         GROUP BY a.id_detail";
            $id_detail = $this->db->query($_detail)->row()->id_detail;

            $_list = "SELECT a.*, nilai_akhir
         from penyusutan a
         JOIN log_penyusutan b ON a.id_penyusutan = b.id_penyusutan
         WHERE a.id_detail = '$id_detail'";
            $list = $this->db->query($_list)->result();

            $_header = "SELECT a.id_penyusutan, a.bulan_penyusutan, d.aset, c.id_detail_aset
         FROM penyusutan a
         INNER JOIN log_penyusutan b ON a.id_penyusutan = b.id_penyusutan
         INNER JOIN detail_pembelian c ON a.id_detail = c.id_detail_aset
         INNER JOIN aset d ON c.id_aset = d.id
         where a.id_penyusutan = '$id'
         ";
            $header = $this->db->query($_header)->row();

            $data = [
               'id' => $id,
               'nilai_buku' => $result,
               'list' => $list,
               'header' => $header
            ];
            // echo 'bukan';
            $this->template->load('template', 'penyusutan/detail', $data);
         }
      }

      public function form_penyusutan()
      {
         $aset = $this->model->detail_penyusutan();
         $data['aset'] = $aset;

         $this->template->load('template', 'penyusutan/form', $data);
      }

      public function disusutkan()
      {
         # code...
         $this->form_detail_penyusutan();
      }

      public function form_detail_penyusutan()
      {
         $query1 = "SELECT  MAX(RIGHT(id_penyusutan,3)) as kode FROM penyusutan";
         $abc = $this->db->query($query1);
         $no_trans = "";
         if ($abc->num_rows() > 0) {
            foreach ($abc->result() as $k) {
               $tmp = ((int)$k->kode) + 1;
               $kd = sprintf("%03s", $tmp);
            }
         } else {
            $kd = "001";
         }
         $datenow = date("Ymd");
         $no_trans = "PNY" . $datenow . "" . $kd;

         // $last_code_pny = $kd -1;

         $data['id_penyusutan'] = $no_trans;


         $id = $this->input->post('id');
         $data['id'] = $id;
         // print_r($id);exit;

         // $this->db->select("detail_pembelian.id, aset, sisa_umur, umur_aset, subtotal, sisa_umur_aset, nilai_sisa, id_detail_aset, tgl_input");
         // $this->db->from("detail_pembelian");
         // $this->db->join("aset", "aset.id = detail_pembelian.id_aset");
         // $this->db->where("detail_pembelian.id_detail_aset", $id);
         // $detail_peny = $this->db->get()->row();

         $rowPny = "SELECT a.id, aset, sisa_umur, umur_aset, subtotal, sisa_umur_aset, nilai_sisa, id_detail_aset, tgl_input
      FROM detail_pembelian a
      JOIN aset b ON a.id_aset = b.id
      JOIN pembelian_aset c ON a.id_pembelian = c.id_pembelian
      WHERE id_detail_aset = '$id'";
         $detail_peny = $this->db->query($rowPny)->row();

         $data['detail_peny'] = $detail_peny;
         // print_r($detail_peny);exit;

         $bulan = date('F Y');
         // ambil nilai 
         $hp = $detail_peny->subtotal;
         $nilai_sisa = $detail_peny->nilai_sisa;

         // jumlah aset 
         // $jumlah = $detail_peny->jumlah;

         // hp / jumlah
         $harga_persatuan = $hp;

         $umur_aset = $detail_peny->umur_aset;

         $nilai_penyusutan = ($hp - $nilai_sisa) / $umur_aset;
         // print_r($nilai_penyusutan);exit;

         $data['nilai_penyusutan'] = $nilai_penyusutan;

         $this->db->where("id_detail", $id);

         $nilai_penyusutan_fix = $this->db->get("penyusutan")->row()->total_penyusutan ?? 0;

         $data['nilai_penyusutan_fix'] = $nilai_penyusutan_fix;

         // ambil nilai akumulasi terakhir + nilai penyusutan
         $this->db->where("id_detail", $id);
         $this->db->order_by("akumulasi_peny", "DESC");
         $akumulasi_fix = $this->db->get("penyusutan")->row()->akumulasi_peny ?? 0;

         $data['akumulasi_fix'] = $akumulasi_fix + $nilai_penyusutan_fix;
         // print_r($data['akumulasi_fix']);exit;

         $data['month_now'] = $bulan;

         $query = "SELECT * 
      FROM log_penyusutan 
      WHERE id_detail = '$id' 
      ORDER BY id_penyusutan DESC
      ";
         $log_penyusutan_kosong = $this->db->query($query)->row();
         // print_r($log_penyusutan_kosong);exit;
         $data['log_penyusutan_kosong'] = $log_penyusutan_kosong;
         $this->template->load('template', 'penyusutan/form_detail_pny', $data);
      }

      public function getKd()
      {
         $id_detail = $this->input->post('id_detail');
         $data = $this->model->getKd($id_detail)->row();
         echo json_encode($data);
      }

      public function tambah_peny()
      {
         $id = $this->input->post("id");
         $id_penyusutan = $this->input->post("id_penyusutan");
         $tgl_input = $this->input->post("tgl_input");
         $bulan_penyusutan = $this->input->post("bln_peny");
         // convert
         $total_penyusutan = str_replace("Rp.", "", $this->input->post("nilai_penyusutan"));
         $tp_fix = str_replace(".", "", $total_penyusutan);

         // nilai akumulasi penyusutan
         $akumulasi_peny = str_replace("Rp.", "", $this->input->post("akumulasi_peny"));
         $akumulasi_peny_fix = str_replace(".", "", $akumulasi_peny);

         // nilai akhir
         $nilai_akhir = str_replace('Rp.', '', $this->input->post("nilai_akhir"));
         // convert nilai akhir
         $na_fix = str_replace(".", "", $nilai_akhir);

         $kd_peny_d = $this->input->post('kd_peny_d');
         $kd_peny_k = $this->input->post('kd_peny_k');

         $data_penyusutan = array(
            "id_penyusutan" => $id_penyusutan,
            "tgl_input" => $tgl_input,
            "bulan_penyusutan" => $bulan_penyusutan,
            "total_penyusutan" => $tp_fix,
            "id_detail" => $id,
            "akumulasi_peny" => $akumulasi_peny_fix,
         );
         // print_r($data_penyusutan);exit;
         $this->db->insert("penyusutan", $data_penyusutan);

         $data_log = array(
            "id_penyusutan" => $id_penyusutan,
            "id_detail" => $id,
            "nilai_akhir" => $na_fix
         );
         $this->db->insert("log_penyusutan", $data_log);

         // insert ke tb trans_peny_rev
         $trans_peny_rev = [
            'id_trans' => $id_penyusutan,
            'total_peny' => $tp_fix,
            'total_akum' => $akumulasi_peny_fix,
            'nilai_peny' => $na_fix,
            'id_detail' => $id
         ];
         $this->db->insert("trans_peny_rev", $trans_peny_rev);

         // set pengurangan umur per bulan
         $this->db->set("sisa_umur", "(sisa_umur) - 1", FALSE);
         $this->db->set("cek_bulan_peny", date("Y-m"));
         $this->db->where("id_detail_aset", $id);
         $this->db->update("detail_pembelian");

         // // jurnal
         $this->M_keuangan->GenerateJurnal($kd_peny_d, $id, 'd', $tp_fix);
         $this->M_keuangan->GenerateJurnal($kd_peny_k, $id, 'k', $tp_fix);
         redirect('c_transaksi/penyusutan');
      }

      public function tambah_rev()
      {
         $id = $this->input->post("id");
         $id_penyusutan = $this->input->post("id_penyusutan");
         $tgl_input = $this->input->post("tgl_input");
         $bulan_penyusutan = $this->input->post("bln_peny");
         // convert
         $total_penyusutan = str_replace("Rp.", "", $this->input->post("nilai_penyusutan"));
         $tp_fix = str_replace(".", "", $total_penyusutan);

         // nilai akumulasi penyusutan
         $akumulasi_peny = str_replace("Rp.", "", $this->input->post("akumulasi_peny"));
         $akumulasi_peny_fix = str_replace(".", "", $akumulasi_peny);

         // nilai akhir
         $nilai_akhir = str_replace('Rp.', '', $this->input->post("nilai_akhir"));
         // convert nilai akhir
         $na_fix = str_replace(".", "", $nilai_akhir);

         $id_rev = $this->input->post('id_revaluasi');
         $_tarif_rev = str_replace("Rp.", "", $this->input->post('tarif_rev'));
         $tarif_rev = str_replace(".", "", $_tarif_rev);

         $_nilai_buku_perbaikan = str_replace("Rp.", "", $this->input->post('nilai_buku_perbaikan'));
         $nilai_buku_perbaikan = str_replace(".", "", $_nilai_buku_perbaikan);

         $_nilai_buku_baru = str_replace("Rp.", "", $this->input->post('nilai_buku_baru'));
         $nilai_buku_baru = str_replace(".", "", $_nilai_buku_baru);

         $kd_akun = $this->input->post('kd_akun');
         $kd_peny_d = $this->input->post('kd_peny_d');
         $kd_peny_k = $this->input->post('kd_peny_k');

         $nilai_perbaikannya = $this->input->post('nilai_perbaikannya');

         // // // jurnal rev
         $this->db->where('id_detail_aset =', $id);
         $this->db->where('is_rev =', 1);
         $cek_rev = $this->db->get('detail_pembelian')->num_rows();
         if ($cek_rev == 0) {
            $kel_akun = [
               'id_jurnal' => $id_rev,
               'tgl_jurnal' => date("Y-m-d"),
               'no_coa' => $kd_akun,
               'posisi_dr_cr' => "d",
               'nominal' => $nilai_perbaikannya,
            ];
            // print_r($kel_akun);exit;
            $this->db->insert('jurnal', $kel_akun);

            $beban = [
               'id_jurnal' => $id_rev,
               'tgl_jurnal' => date("Y-m-d"),
               'no_coa' => 5224,
               'posisi_dr_cr' => "k",
               'nominal' => $nilai_perbaikannya,
            ];
            $this->db->insert('jurnal', $beban);
         }

         $data_penyusutan = array(
            "id_penyusutan" => $id_penyusutan,
            "tgl_input" => $tgl_input,
            "bulan_penyusutan" => $bulan_penyusutan,
            "total_penyusutan" => $tp_fix,
            "id_detail" => $id,
            "akumulasi_peny" => $akumulasi_peny_fix,
         );
         // print_r($data_penyusutan);exit;
         $this->db->insert("penyusutan", $data_penyusutan);

         $data_log = array(
            "id_penyusutan" => $id_penyusutan,
            "id_detail" => $id,
            "nilai_akhir" => $na_fix
         );
         $this->db->insert("log_penyusutan", $data_log);
         // print_r($data_log);exit;

         $data_rev = [
            'id_revaluasi' => $id_rev,
            'id_detail' => $id,
            'bulan_revaluasi' => date('F Y'),
            'tarif_revaluasi' => $tarif_rev,
            'nilai_buku_perbaikan' => $nilai_buku_perbaikan,
            'nilai_buku_baru' => $nilai_buku_baru,
         ];
         // print_r($data_log);exit;
         $this->db->insert('revaluasi', $data_rev);

         $data_trans_peny_rev = [
            'id_trans' => $id_rev,
            'id_detail' => $id,
            'total_peny' => $tp_fix,
            'total_akum' => $akumulasi_peny_fix,
            'nilai_peny' => $na_fix,
            'tarif_rev' => $tarif_rev,
            'nilai_bk_perbaikan' => $nilai_buku_perbaikan,
            'nilai_bk_baru' => $nilai_buku_baru,
         ];
         // print_r($data_log);exit;
         $this->db->insert('trans_peny_rev', $data_trans_peny_rev);

         $update_data = [
            'is_rev' => 1
         ];
         $this->db->where('id_detail_aset', $id);
         $this->db->update('detail_pembelian', $update_data);

         // set pengurangan umur per bulan
         $this->db->set("sisa_umur", "(sisa_umur) - 1", FALSE);
         $this->db->set("cek_bulan_peny", date("Y-m"));
         $this->db->where("id_detail_aset", $id);
         $this->db->update("detail_pembelian");

         // jurnal peny
         $kel_akun = [
            'id_jurnal' => $id_penyusutan,
            'tgl_jurnal' => date("Y-m-d"),
            'no_coa' => $kd_peny_d,
            'posisi_dr_cr' => "d",
            'nominal' => $tp_fix + $tarif_rev,
         ];
         $this->db->insert('jurnal', $kel_akun);

         $beban = [
            'id_jurnal' => $id_penyusutan,
            'tgl_jurnal' => date("Y-m-d"),
            'no_coa' => $kd_peny_k,
            'posisi_dr_cr' => "k",
            'nominal' => $tp_fix + $tarif_rev,
         ];
         $this->db->insert('jurnal', $beban);

         // // $this->M_keuangan->GenerateJurnal('1122',$id,'d',$tp_fix);
         // // $this->M_keuangan->GenerateJurnal('1120',$id,'k',$tp_fix);
         redirect('c_transaksi/revaluasi');
      }

      public function kartu_aset()
      {
         $aset = $this->model->getAset()->result();
         $id = $this->input->post('aset');

         if (isset($id)) {
            # code...
            $this->db->where('id_detail =', $id);
            $list = $this->db->get('trans_peny_rev')->result();

            $this->db->select('aset');
            $this->db->join('aset', 'aset.id = detail_pembelian.id_aset');
            $this->db->where('id_detail_aset =', $id);
            $x = $this->db->get('detail_pembelian')->row()->aset;

            $data = [
               'list' => $list,
               'aset' => $aset,
               'nm_aset' => $x
            ];
            $this->template->load('template', 'laporan/kartu_aset', $data);
         } else {
            $cb = "select * from trans_peny_rev where id_detail = '' ";
            $list = $this->db->query($cb)->result();
            $data = [
               'list' => $list,
               'aset' => $aset,
               'nm_aset' => ''
            ];
            $this->template->load('template', 'laporan/kartu_aset', $data);
         }
      }

      public function kartu_simpanan_susu()
      {
         # code...
         $this->template->load("template", "kartu_simpanan_susu/index");
      }

      public function pembayaran_susu()
      {
         # code...
         $this->db->select("pembayaran_susu.kode_pembayaran, tgl_transaksi, log_pembayaran_susu.*, peternak.nama_peternak");
         $this->db->join("log_pembayaran_susu", "pembayaran_susu.kode_pembayaran = log_pembayaran_susu.id_pembayaran");
         $this->db->join("peternak", "peternak.no_peternak = log_pembayaran_susu.id_anggota");
         $this->db->order_by("tgl_transaksi", "DESC");

         $pembayaran_susu = $this->db->get("pembayaran_susu")->result();
         $data['pembayaran_susu'] = $pembayaran_susu;

         // print_r($pembayaran_susu);exit;

         $this->template->load("template", "pembayaran_susu/index", $data);
      }

      public function form_pembayaran_susu()
      {
         # code...
         $data['kode_pembayaran'] = $this->model->id_otomatis();

         // $model = $this->model->get14day()->row()->tgl_transaksi ?? 0;
         // $data['cek_hari'] = $model;

         // print_r($model);exit;
         $this->db->where('is_deactive =', 0);
         $data['anggota'] = $this->db->get("peternak")->result_array();
         // print_r($model);exit;

         // $now = date("Y-m-d");

         // $data['nextPayment'] = $this->model->next_datePayment();



         $this->db->where("simpanan =", "Manasuka");
         $data['manasuka'] = $this->db->get("simpanan")->row()->biaya;

         $this->template->load("template", "pembayaran_susu/form", $data);
      }

      public function next_datePayment()
      {
         # code...
         $id_peternak = $this->input->post("id_peternak", TRUE);
         $data = $this->model->next_datePayment($id_peternak)->row();
         echo json_encode($data);
      }

      public function j_lt()
      {
         # code...
         $id_peternak = $this->input->post("id_peternak", TRUE);
         $data = $this->model->get_jumlah($id_peternak)->result();
         echo json_encode($data);
      }

      function coba()
      {
         $id_peternak = $this->input->post("id_peternak", TRUE);
         $data = $this->model->coba($id_peternak)->row();
         // print_r($data);exit;
         echo json_encode($data);
      }

      public function sum_pembelian()
      {
         # code...
         $id_peternak = $this->input->post("id_peternak", TRUE);
         $data = $this->model->getJumlah($id_peternak)->row();
         echo json_encode($data);
      }

      public function getPinjaman()
      {
         # code...
         $id_peternak = $this->input->post("id_peternak", TRUE);

         $this->db->select("nominal");
         $this->db->where("id_anggota", $id_peternak);
         $this->db->order_by("kode_pinjaman", "DESC");
         $data = $this->db->get("log_pinjaman")->row();

         echo json_encode($data);
      }

      public function bayar_susu()
      {
         # code...
         $config = array(
            array(
               'field' => 'kode_pembayaran',
               'label' => 'Kode pembayaran',
               'rules' => 'is_unique[pembayaran_susu.kode_pembayaran]',
               'errors' => array(
                  'required' => '%s sudah tersimpan di database.'
               )
            ),
         );

         $this->form_validation->set_error_delimiters('<div class="alert alert-danger"><li>', '</li></div>');

         $this->form_validation->set_rules($config);

         if ($this->form_validation->run() == FALSE) {
            $this->pembayaran_susu();
         } else {
            $id_pembayaran = $this->input->post("kode_pembayaran");
            $id_anggota = $this->input->post("id_peternak");
            $jumlah_liter_susu = $this->input->post("jumlah_liter");
            $simpanan_masuka = $this->input->post("manasuka");
            $simpanan_wajib = $this->input->post("jumlah_pembayaran");
            $jumlah_harga_susu = $this->input->post("jumlah_harga_susu");
            $subtotal = $this->input->post("total_trans_susu");
            $pinjaman = $this->input->post("pinjaman");
            $bayar_tunai = $this->input->post("bayar_tunai");

            // $is_paid = 1;

            $kas_totalbayar_lebihdari_pinjaman = $jumlah_harga_susu - $simpanan_masuka - $simpanan_wajib - $pinjaman;

            $data_log = array(
               "id_pembayaran" => $id_pembayaran,
               "id_anggota" => $id_anggota,
               "jumlah_liter_susu" => $jumlah_liter_susu,
               "simpanan_masuka" => $simpanan_masuka,
               "simpanan_wajib" => $simpanan_wajib,
               "jumlah_harga_susu" => $jumlah_harga_susu,
               "subtotal" => $subtotal,
               "pinjaman_anggota" => $pinjaman,
               "bayar_tunai" => $bayar_tunai,
               // "tgl_transaksi" => date("Y-m-d"),
            );
            // print_r($data_log);exit;
            $this->db->insert("log_pembayaran_susu", $data_log);

            $pembayaran_susu = array(
               "kode_pembayaran" => $this->input->post("kode_pembayaran"),
               "total_bayar" => $this->input->post("total_trans_susu"),
               "tgl_transaksi" => date("Y-m-d"),
               "is_paid" => 1
            );
            // print_r($pembayaran_susu);exit;
            $this->db->insert("pembayaran_susu", $pembayaran_susu);

            // update pinjaman ke tb peternak
            $sisa_pinjaman = $this->input->post('sisa_pinjaman');
            $sisa_pinjaman1 = $this->input->post('sp');
            // $sisa_pinjaman = 0;
            // print_r($pinjaman);exit;

            // $last_pinjaman = $this->db->get('peternak');
            if ($sisa_pinjaman != '') {
               // add tb_bayar_pinjaman
               $log_bayar_pinjaman = [
                  'id_anggota' => $id_anggota,
                  'nominal' => $pinjaman,
                  'kd_coa' => 1112
               ];
               $this->db->insert('log_bayar_pinjaman', $log_bayar_pinjaman);

               $update_sisa_pinjaman = [
                  'sisa_pinjaman' => $sisa_pinjaman
               ];
               $this->db->where('id_anggota', $id_anggota);
               $this->db->update('log_pinjaman', $update_sisa_pinjaman);
            }

            if ($sisa_pinjaman == 0) {
               $update_status = [
                  'status' => 0
               ];
               $this->db->where('id_anggota', $id_anggota);
               $this->db->update('log_pinjaman', $update_status);

               $update_pinjaman = [
                  'pinjaman' => 0
               ];
               $this->db->where('no_peternak', $id_anggota);
               $this->db->update('peternak', $update_pinjaman);
            }

            // kalo gak ada utang nih jurnalnya
            if ($pinjaman != 0 || $sisa_pinjaman != 0) {
               // echo 'ada pinjaman dan sisa pinjaman';
               if ($pinjaman > $subtotal) {
                  # code...
                  $pbb = array(
                     "id_jurnal" => $this->input->post("kode_pembayaran"),
                     "tgl_jurnal" => date("Y-m-d"),
                     "no_coa" => 2111,
                     "posisi_dr_cr" => "d",
                     "nominal" => $this->input->post("jumlah_harga_susu"),
                  );
                  $this->db->insert("jurnal", $pbb);

                  $kas = array(
                     "id_jurnal" => $this->input->post("kode_pembayaran"),
                     "tgl_jurnal" => date("Y-m-d"),
                     "no_coa" => 1111,
                     "posisi_dr_cr" => "d",
                     "nominal" => $this->input->post("bayar_tunai"),
                  );
                  $this->db->insert("jurnal", $kas);

                  $simpanan_wajib = array(
                     "id_jurnal" => $this->input->post("kode_pembayaran"),
                     "tgl_jurnal" => date("Y-m-d"),
                     "no_coa" => 3112,
                     "posisi_dr_cr" => "k",
                     "nominal" => $this->input->post("jumlah_pembayaran"),
                  );
                  $this->db->insert("jurnal", $simpanan_wajib);

                  $simpanan_masuka = array(
                     "id_jurnal" => $this->input->post("kode_pembayaran"),
                     "tgl_jurnal" => date("Y-m-d"),
                     "no_coa" => 3113,
                     "posisi_dr_cr" => "k",
                     "nominal" => $this->input->post("manasuka"),
                  );
                  $this->db->insert("jurnal", $simpanan_masuka);

                  $pinjaman = array(
                     "id_jurnal" => $this->input->post("kode_pembayaran"),
                     "tgl_jurnal" => date("Y-m-d"),
                     "no_coa" => 1115,
                     "posisi_dr_cr" => "k",
                     "nominal" => $pinjaman,
                  );
                  $this->db->insert("jurnal", $pinjaman);
               } else {
                  $pbb = array(
                     "id_jurnal" => $this->input->post("kode_pembayaran"),
                     "tgl_jurnal" => date("Y-m-d"),
                     "no_coa" => 2111,
                     "posisi_dr_cr" => "d",
                     "nominal" => $this->input->post("jumlah_harga_susu"),
                  );
                  $this->db->insert("jurnal", $pbb);

                  $kas = array(
                     "id_jurnal" => $this->input->post("kode_pembayaran"),
                     "tgl_jurnal" => date("Y-m-d"),
                     "no_coa" => 1111,
                     "posisi_dr_cr" => "k",
                     "nominal" => $this->input->post("total_trans_susu"),
                  );
                  $this->db->insert("jurnal", $kas);

                  $pin_angt = array(
                     "id_jurnal" => $this->input->post("kode_pembayaran"),
                     "tgl_jurnal" => date("Y-m-d"),
                     "no_coa" => 1115,
                     "posisi_dr_cr" => "k",
                     "nominal" => $this->input->post("pinjaman"),
                  );
                  $this->db->insert("jurnal", $pin_angt);

                  $simpanan_wajib = array(
                     "id_jurnal" => $this->input->post("kode_pembayaran"),
                     "tgl_jurnal" => date("Y-m-d"),
                     "no_coa" => 3112,
                     "posisi_dr_cr" => "k",
                     "nominal" => $this->input->post("jumlah_pembayaran"),
                  );
                  $this->db->insert("jurnal", $simpanan_wajib);

                  $simpanan_masuka = array(
                     "id_jurnal" => $this->input->post("kode_pembayaran"),
                     "tgl_jurnal" => date("Y-m-d"),
                     "no_coa" => 3113,
                     "posisi_dr_cr" => "k",
                     "nominal" => $this->input->post("manasuka"),
                  );
                  $this->db->insert("jurnal", $simpanan_masuka);
               }
            } else if ($pinjaman == 0) {
               $pbb = array(
                  "id_jurnal" => $this->input->post("kode_pembayaran"),
                  "tgl_jurnal" => date("Y-m-d"),
                  "no_coa" => 2111,
                  "posisi_dr_cr" => "d",
                  "nominal" => $this->input->post("jumlah_harga_susu"),
               );
               $this->db->insert("jurnal", $pbb);

               $kas = array(
                  "id_jurnal" => $this->input->post("kode_pembayaran"),
                  "tgl_jurnal" => date("Y-m-d"),
                  "no_coa" => 1111,
                  "posisi_dr_cr" => "k",
                  "nominal" => $this->input->post("total_trans_susu"),
               );
               $this->db->insert("jurnal", $kas);

               $simpanan_wajib = array(
                  "id_jurnal" => $this->input->post("kode_pembayaran"),
                  "tgl_jurnal" => date("Y-m-d"),
                  "no_coa" => 3112,
                  "posisi_dr_cr" => "k",
                  "nominal" => $this->input->post("jumlah_pembayaran"),
               );
               $this->db->insert("jurnal", $simpanan_wajib);

               $simpanan_masuka = array(
                  "id_jurnal" => $this->input->post("kode_pembayaran"),
                  "tgl_jurnal" => date("Y-m-d"),
                  "no_coa" => 3113,
                  "posisi_dr_cr" => "k",
                  "nominal" => $this->input->post("manasuka"),
               );
               $this->db->insert("jurnal", $simpanan_masuka);
            }
         }
         redirect("c_transaksi/pembayaran_susu");
      }


      public function simpanan_hr()
      {
         # code...
         $this->db->select("nama_peternak, tgl_simpanan, kode_simpanan_hr, nominal");
         $this->db->join("peternak", "peternak.no_peternak = log_simpanan_hr.id_anggota");
         $this->db->order_by("tgl_simpanan", "DESC");
         $data['index'] = $this->db->get("log_simpanan_hr")->result();
         $this->template->load("template", "simpanan_hr/index", $data);
      }

      public function form_hr()
      {
         # code...
         $query1 = "SELECT  MAX(RIGHT(kode_simpanan_hr,4)) as kode FROM log_simpanan_hr";
         $abc = $this->db->query($query1);
         $no_trans = "";
         if ($abc->num_rows() > 0) {
            foreach ($abc->result() as $k) {
               $tmp = ((int)$k->kode) + 1;
               $kd = sprintf("%04s", $tmp);
            }
         } else {
            $kd = "001";
         }
         // $datenow = date("Ymd");
         $no_trans = "SHR-" . $kd;

         // $last_code_pny = $kd -1;

         $data['kode_simpanan_hr'] = $no_trans;

         $this->db->where('is_deactive =', 0);
         $data['anggota'] = $this->db->get("peternak")->result();

         $this->template->load("template", "simpanan_hr/form", $data);
      }

      public function simpan_hr()
      {
         # code...
         // explode dulu 
         $biaya = str_replace(".", "", $this->input->post("biaya"));
         $data = array(
            "kode_simpanan_hr" => $this->input->post("kode_simpanan"),
            "tgl_simpanan" => $this->input->post("tgl_simpanan_hr"),
            "id_anggota" => $this->input->post("peternak"),
            "nominal" => $biaya,
         );
         // print_r($data);exit;
         $this->db->insert("log_simpanan_hr", $data);

         // Jurnal 
         $jurnal_d = array(
            "id_jurnal" => $this->input->post("kode_simpanan"),
            "tgl_jurnal" => date("Y-m-d"),
            "no_coa" => 1111,
            "posisi_dr_cr" => "d",
            "nominal" => $biaya,
         );
         $this->db->insert("jurnal", $jurnal_d);

         $jurnal_k = array(
            "id_jurnal" => $this->input->post("kode_simpanan"),
            "tgl_jurnal" => date("Y-m-d"),
            "no_coa" => 2112,
            "posisi_dr_cr" => "k",
            "nominal" => $biaya,
         );

         $this->db->insert("jurnal", $jurnal_k);
         // berhasil direct ke index
         redirect("c_transaksi/simpanan_hr");
      }

      // pengajuan jurnal
      public function pengajuan_jurnal()
      {
         $this->db->order_by('tanggal', 'desc');
         $list = $this->db->get('pengajuan_jurnal')->result();
         $data = [
            'list' => $list,
         ];
         $this->template->load('template', 'laporan/pengajuan_jurnal', $data);
      }

      public function bukti_pembayaran_pengajuan_jurnal()
      {
         
         $config['upload_path']          = './uploads/';
         $config['allowed_types']        = '*';
         $config['file_name']            = $this->input->post("kode");
         $config['overwrite']            = true;
         $this->load->library('upload', $config);
         $file = $this->upload->do_upload('buktipem');
         if ($file) {
            $this->db->where("kode", $this->input->post("kode"));
            $this->db->update("pengajuan_jurnal", array("bukti_pembayaran" => $this->upload->file_name));
            redirect('c_transaksi/pengajuan_jurnal');
         } else {
            echo $this->upload->display_errors();
         }
      }

      public function input_bukti_pembayaran($kode) {
         $data = [
            'kode' => $kode,
         ];
         $this->template->load("template",'laporan/input_bukti_pembayaran',$data);
      }

      public function status_pengajuan($kode, $tanggal, $nominal)
      {
         if (strpos($kode, 'GAJI-') !== false) {
            /** transaksi gaji */

            $pengajuan_jurnal = [
               'status' => 'selesai'
            ];
            $this->db->where('kode', $kode);
            $this->db->update('pengajuan_jurnal', $pengajuan_jurnal);

            $debit = [
               'id_jurnal' => $kode,
               'tgl_jurnal' => $tanggal,
               'no_coa' => 5311,
               'posisi_dr_cr' => 'd',
               'nominal' => $nominal,
            ];
            $this->db->insert('jurnal', $debit);

            $kredit = [
               'id_jurnal' => $kode,
               'tgl_jurnal' => $tanggal,
               'no_coa' => 1111,
               'posisi_dr_cr' => 'k',
               'nominal' => $nominal,
            ];
            $this->db->insert('jurnal', $kredit);

            // buku pembantu kas
            $bpk = [
               'id_ref' => $kode, 
               'tanggal' => $tanggal, 
               'nominal' => $nominal, 
               'kd_coa' => 1111, 
               'posisi_dr_cr' => 'k', 
               'keterangan' => 'Pembayaran Gaji', 
            ];
            $this->db->insert('buku_pembantu_kas', $bpk);
         } else if (strpos($kode, 'PMB-KR') !== false ) {
            /** transaksi pembayaran kredit */

            $data = [
               'status' => 1
            ];
            $this->db->where('id_pembayaran', $kode);
            $this->db->update('waserda_pembayaran_kredit', $data);
   
            $pengajuan_jurnal = [
               'status' => 'selesai'
            ];
            $this->db->where('kode', $kode);
            $this->db->update('pengajuan_jurnal', $pengajuan_jurnal);
   
            // jurnal
            $kas = [
               'id_jurnal' => $kode, 
               'tgl_jurnal' => $tanggal, 
               'no_coa' => 1111, 
               'posisi_dr_cr' => 'd', 
               'nominal' => $nominal, 
            ];
            $this->db->insert('jurnal', $kas);
   
            $piutang = [
               'id_jurnal' => $kode, 
               'tgl_jurnal' => $tanggal, 
               'no_coa' => 1998, 
               'posisi_dr_cr' => 'k', 
               'nominal' => $nominal, 
            ];
            $this->db->insert('jurnal', $piutang);
   
            // buku pembantu kas
            $bpk = [
               'id_ref' => $kode, 
               'tanggal' => $tanggal, 
               'nominal' => $nominal, 
               'kd_coa' => 1111, 
               'posisi_dr_cr' => 'd', 
               'keterangan' => 'Pembayaran Waserda Kredit', 
            ];
            $this->db->insert('buku_pembantu_kas', $bpk);
         } else if (strpos($kode, 'PMBG.SHU') !== false) {
            /** transaksi pembagian shu */

            $pengajuan_jurnal = [
               'status' => 'selesai'
            ];
            $this->db->where('kode', $kode);
            $this->db->update('pengajuan_jurnal', $pengajuan_jurnal);
   
            // jurnal
            
            $shu = [
               'id_jurnal' => $kode, 
               'tgl_jurnal' => $tanggal, 
               'no_coa' => 4211, 
               'posisi_dr_cr' => 'd', 
               'nominal' => $nominal, 
            ];
            $this->db->insert('jurnal', $shu);

            $kas = [
               'id_jurnal' => $kode, 
               'tgl_jurnal' => $tanggal, 
               'no_coa' => 1111, 
               'posisi_dr_cr' => 'k', 
               'nominal' => $nominal, 
            ];
            $this->db->insert('jurnal', $kas);
   
            // buku pembantu kas
            $bpk = [
               'id_ref' => $kode, 
               'tanggal' => $tanggal, 
               'nominal' => $nominal, 
               'kd_coa' => 1111, 
               'posisi_dr_cr' => 'k', 
               'keterangan' => 'SHU', 
            ];
            $this->db->insert('buku_pembantu_kas', $bpk);
         } else if (strpos($kode, 'PNGBBN') !== false) {
            /** transaksi pengeluaran beban */

            $pengajuan_jurnal = [
               'status' => 'selesai'
            ];
            $this->db->where('kode', $kode);
            $this->db->update('pengajuan_jurnal', $pengajuan_jurnal);
            
            $this->db->where('id_pengeluaran', $kode);
            $coa = $this->db->get('waserda_pengeluaran_beban')->row()->no_coa;
            // jurnal
            $beban = [
               'id_jurnal' => $kode, 
               'tgl_jurnal' => $tanggal, 
               'no_coa' => $coa, 
               'posisi_dr_cr' => 'd', 
               'nominal' => $nominal, 
            ];
            $this->db->insert('jurnal', $beban);

            $kas = [
               'id_jurnal' => $kode, 
               'tgl_jurnal' => $tanggal, 
               'no_coa' => 1111, 
               'posisi_dr_cr' => 'k', 
               'nominal' => $nominal, 
            ];
            $this->db->insert('jurnal', $kas);
   
            // buku pembantu kas
            $bpk = [
               'id_ref' => $kode, 
               'tanggal' => $tanggal, 
               'nominal' => $nominal, 
               'kd_coa' => 1111, 
               'posisi_dr_cr' => 'k', 
               'keterangan' => 'Pengeluaran Beban', 
            ];
            $this->db->insert('buku_pembantu_kas', $bpk);
         } else if (strpos($kode, 'LMBR') !== false) {

            /** transaksi lembur */
            $pengajuan_jurnal = [
               'status' => 'selesai'
            ];
            $this->db->where('kode', $kode);
            $this->db->update('pengajuan_jurnal', $pengajuan_jurnal);

            /**jurnal lembur */
            $this->M_keuangan->GenerateJurnal('5400', $kode, 'd', $nominal);
            $this->M_keuangan->GenerateJurnal('1111', $kode, 'k', $nominal);

            // buku pembantu kas
            $bpk = [
               'id_ref' => $kode, 
               'tanggal' => $tanggal, 
               'nominal' => $nominal, 
               'kd_coa' => 1111, 
               'posisi_dr_cr' => 'k', 
               'keterangan' => 'Pengeluaran Lembur', 
            ];
            $this->db->where('kode', $kode);
            $this->db->update('pengajuan_jurnal', $pengajuan_jurnal);
         } else if (strpos($kode, 'PNJWASERDA') !== false) {
            $penjualan = $this->db->query("SELECT a.*, b.id_produk, b.jml, b.harga, c.harga_satuan AS harga_beli
            FROM pos_penjualan a 
            JOIN pos_detail_penjualan b ON a.invoice = b.invoice
            JOIN waserda_produk c ON c.kode = b.id_produk
            WHERE a.invoice = '$kode'");
            // $jml = 0;
            $harga_beli = 0;
            foreach ($penjualan->result() as $row) {
               $harga_beli += $row->jml * $row->harga_beli;
            }
            $jenis_pmb = $penjualan->row()->jenis_pembayaran;
            $kasPnj = $penjualan->row()->total_trans;
            $ppnKeluar = $penjualan->row()->ppn;
            $penjualanWaserda = $penjualan->row()->total;
            $hpp_persbrg = $harga_beli;
            /** penjualan tunai */
            $pengajuan_jurnal = [
               'status' => 'selesai'
            ];
            $this->db->where('kode', $kode);
            $this->db->update('pengajuan_jurnal', $pengajuan_jurnal);
            
            if ($jenis_pmb == 'kredit') {
               /** jurnal penjualan kredit */
               $this->M_keuangan->GenerateJurnal('1998', $kode, 'd', $kasPnj);
               $this->M_keuangan->GenerateJurnal('2140', $kode, 'k', $ppnKeluar);
               $this->M_keuangan->GenerateJurnal('4116', $kode, 'k', $penjualanWaserda);

               $this->M_keuangan->GenerateJurnal('6113', $kode, 'd', $hpp_persbrg);
               $this->M_keuangan->GenerateJurnal('1414', $kode, 'k', $hpp_persbrg);
               
            } else {
               /** jurnal penjualan tunai */
               $this->M_keuangan->GenerateJurnal('1111', $kode, 'd', $kasPnj);
               $this->M_keuangan->GenerateJurnal('2140', $kode, 'k', $ppnKeluar);
               $this->M_keuangan->GenerateJurnal('4116', $kode, 'k', $penjualanWaserda);

               $this->M_keuangan->GenerateJurnal('6113', $kode, 'd', $hpp_persbrg);
               $this->M_keuangan->GenerateJurnal('1414', $kode, 'k', $hpp_persbrg);
               /** generate ke bpk */
               $this->M_keuangan->GenerateLaporanBPK($kode, $tanggal, $kasPnj, '1111', 'd', 'Penjualan Tunai');
            }
         } else if (strpos($kode, 'PMBWASERDA') !== false) {
            $pembelian = $this->db->query("SELECT b.*, a.total, a.ppn, a.grandtotal
            FROM pos_pembelian a
            JOIN pos_detail_pembelian b ON a.invoice = b.invoice
            WHERE a.invoice = '$kode'")->row();
            $total = $pembelian->total;
            $ppn = $pembelian->ppn;
            $grandtotal = $pembelian->grandtotal;
            /** pembelian tunai */
            $pengajuan_jurnal = [
               'status' => 'selesai'
            ];
            $this->db->where('kode', $kode);
            $this->db->update('pengajuan_jurnal', $pengajuan_jurnal);

            /** jurnal pembelian */
            $this->M_keuangan->GenerateJurnal('1414', $kode, 'd', $total);
            $this->M_keuangan->GenerateJurnal('2130', $kode, 'd', $ppn);
            $this->M_keuangan->GenerateJurnal('1111', $kode, 'k', $grandtotal);
            /** generate ke bpk */
            $this->M_keuangan->GenerateLaporanBPK($kode, $tanggal, $grandtotal, '1111', 'k', 'Pembelian Barang Waserda');
         }
         redirect('c_transaksi/pengajuan_jurnal');
      }

      public function status_pengajuan_subm($kode, $tanggal, $nominal, $redir = false)
      {
         if (strpos($kode, 'GAJI-') !== false) {
            /** transaksi gaji */

            $pengajuan_jurnal = [
               'status' => 'selesai'
            ];
            $this->db->where('kode', $kode);
            $this->db->update('pengajuan_jurnal', $pengajuan_jurnal);

            $detail_penggajian = $this->db->query("SELECT SUM(tunjangan_hari_raya) as tunjangan_hari_raya_total,SUM(pph21) as pph21_total, SUM(gaji_pokok) as gaji_pokok_total, SUM(tunjangan_jabatan) as tunjangan_jabatan_total, SUM(tunjangan_kesehatan) as tunjangan_kesehatan_total, SUM(bonus_kerja) as bonus_kerja_total FROM tb_detail_penggajian WHERE id_penggajian = '$kode'")->result()[0];
            
            $totalkas = $detail_penggajian->gaji_pokok_total+
            $detail_penggajian->tunjangan_hari_raya_total+
            $detail_penggajian->tunjangan_jabatan_total+
            $detail_penggajian->tunjangan_kesehatan_total+
            $detail_penggajian->bonus_kerja_total;
            $debit = [
               'id_jurnal' => $kode,
               'tgl_jurnal' => $tanggal,
               'no_coa' => 5311,
               'posisi_dr_cr' => 'd',
               'nominal' => $detail_penggajian->gaji_pokok_total,
            ];
            $this->db->insert('jurnal', $debit);
            
            $debit = [
               'id_jurnal' => $kode,
               'tgl_jurnal' => $tanggal,
               'no_coa' => 5316,
               'posisi_dr_cr' => 'd',
               'nominal' => $detail_penggajian->tunjangan_jabatan_total,
            ];
            $this->db->insert('jurnal', $debit);
            if ($detail_penggajian->tunjangan_jabatan_total > 0) {
            }
            
            $debit = [
               'id_jurnal' => $kode,
               'tgl_jurnal' => $tanggal,
               'no_coa' => 5315,
               'posisi_dr_cr' => 'd',
               'nominal' => $detail_penggajian->tunjangan_kesehatan_total,
            ];
            $this->db->insert('jurnal', $debit);
            if ($detail_penggajian->tunjangan_kesehatan_total > 0) {
            }
            
            $debit = [
               'id_jurnal' => $kode,
               'tgl_jurnal' => $tanggal,
               'no_coa' => 5317,
               'posisi_dr_cr' => 'd',
               'nominal' => $detail_penggajian->bonus_kerja_total,
            ];
            $this->db->insert('jurnal', $debit);
            if ($detail_penggajian->bonus_kerja_total > 0) {
            }

            $debit = [
               'id_jurnal' => $kode,
               'tgl_jurnal' => $tanggal,
               'no_coa' => 5318,
               'posisi_dr_cr' => 'd',
               'nominal' => $detail_penggajian->tunjangan_hari_raya_total,
            ];
            $this->db->insert('jurnal', $debit);
            
            $kredit = [
               'id_jurnal' => $kode,
               'tgl_jurnal' => $tanggal,
               'no_coa' => 2114,
               'posisi_dr_cr' => 'k',
               'nominal' => $detail_penggajian->pph21_total,
            ];
            $this->db->insert('jurnal', $kredit);

            $kredit = [
               'id_jurnal' => $kode,
               'tgl_jurnal' => $tanggal,
               'no_coa' => 1111,
               'posisi_dr_cr' => 'k',
               'nominal' => $totalkas,
            ];
            $this->db->insert('jurnal', $kredit);

            // buku pembantu kas
            $bpk = [
               'id_ref' => $kode, 
               'tanggal' => $tanggal, 
               'nominal' => $nominal, 
               'kd_coa' => 1111, 
               'posisi_dr_cr' => 'k', 
               'keterangan' => 'Pembayaran Gaji', 
            ];
            $this->db->insert('buku_pembantu_kas', $bpk);
         } else if (strpos($kode, 'PMB-KR') !== false ) {
            /** transaksi pembayaran kredit */

            $data = [
               'status' => 1
            ];
            $this->db->where('id_pembayaran', $kode);
            $this->db->update('waserda_pembayaran_kredit', $data);
   
            $pengajuan_jurnal = [
               'status' => 'selesai'
            ];
            $this->db->where('kode', $kode);
            $this->db->update('pengajuan_jurnal', $pengajuan_jurnal);
   
            // jurnal
            $kas = [
               'id_jurnal' => $kode, 
               'tgl_jurnal' => $tanggal, 
               'no_coa' => 1111, 
               'posisi_dr_cr' => 'd', 
               'nominal' => $nominal, 
            ];
            $this->db->insert('jurnal', $kas);
   
            $piutang = [
               'id_jurnal' => $kode, 
               'tgl_jurnal' => $tanggal, 
               'no_coa' => 1998, 
               'posisi_dr_cr' => 'k', 
               'nominal' => $nominal, 
            ];
            $this->db->insert('jurnal', $piutang);
   
            // buku pembantu kas
            $bpk = [
               'id_ref' => $kode, 
               'tanggal' => $tanggal, 
               'nominal' => $nominal, 
               'kd_coa' => 1111, 
               'posisi_dr_cr' => 'd', 
               'keterangan' => 'Pembayaran Waserda Kredit', 
            ];
            $this->db->insert('buku_pembantu_kas', $bpk);
         } else if (strpos($kode, 'PMBG.SHU') !== false) {
            /** transaksi pembagian shu */

            $pengajuan_jurnal = [
               'status' => 'selesai'
            ];
            $this->db->where('kode', $kode);
            $this->db->update('pengajuan_jurnal', $pengajuan_jurnal);
   
            // jurnal
            
            $shu = [
               'id_jurnal' => $kode, 
               'tgl_jurnal' => $tanggal, 
               'no_coa' => 4211, 
               'posisi_dr_cr' => 'd', 
               'nominal' => $nominal, 
            ];
            $this->db->insert('jurnal', $shu);

            $kas = [
               'id_jurnal' => $kode, 
               'tgl_jurnal' => $tanggal, 
               'no_coa' => 1111, 
               'posisi_dr_cr' => 'k', 
               'nominal' => $nominal, 
            ];
            $this->db->insert('jurnal', $kas);
   
            // buku pembantu kas
            $bpk = [
               'id_ref' => $kode, 
               'tanggal' => $tanggal, 
               'nominal' => $nominal, 
               'kd_coa' => 1111, 
               'posisi_dr_cr' => 'k', 
               'keterangan' => 'SHU', 
            ];
            $this->db->insert('buku_pembantu_kas', $bpk);
         } else if (strpos($kode, 'PNGBBN') !== false) {
            /** transaksi pengeluaran beban */

            $pengajuan_jurnal = [
               'status' => 'selesai'
            ];
            $this->db->where('kode', $kode);
            $this->db->update('pengajuan_jurnal', $pengajuan_jurnal);
            
            $this->db->where('id_pengeluaran', $kode);
            $coa = $this->db->get('waserda_pengeluaran_beban')->row()->no_coa;
            // jurnal
            $beban = [
               'id_jurnal' => $kode, 
               'tgl_jurnal' => $tanggal, 
               'no_coa' => $coa, 
               'posisi_dr_cr' => 'd', 
               'nominal' => $nominal, 
            ];
            $this->db->insert('jurnal', $beban);

            $kas = [
               'id_jurnal' => $kode, 
               'tgl_jurnal' => $tanggal, 
               'no_coa' => 1111, 
               'posisi_dr_cr' => 'k', 
               'nominal' => $nominal, 
            ];
            $this->db->insert('jurnal', $kas);
   
            // buku pembantu kas
            $bpk = [
               'id_ref' => $kode, 
               'tanggal' => $tanggal, 
               'nominal' => $nominal, 
               'kd_coa' => 1111, 
               'posisi_dr_cr' => 'k', 
               'keterangan' => 'Pengeluaran Beban', 
            ];
            $this->db->insert('buku_pembantu_kas', $bpk);
         } else if (strpos($kode, 'LMBR') !== false) {

            /** transaksi lembur */
            $pengajuan_jurnal = [
               'status' => 'selesai'
            ];
            $this->db->where('kode', $kode);
            $this->db->update('pengajuan_jurnal', $pengajuan_jurnal);

            /**jurnal lembur */
            $this->M_keuangan->GenerateJurnal('5400', $kode, 'd', $nominal);
            $this->M_keuangan->GenerateJurnal('1111', $kode, 'k', $nominal);

            // buku pembantu kas
            $bpk = [
               'id_ref' => $kode, 
               'tanggal' => $tanggal, 
               'nominal' => $nominal, 
               'kd_coa' => 1111, 
               'posisi_dr_cr' => 'k', 
               'keterangan' => 'Pengeluaran Lembur', 
            ];
            $this->db->where('kode', $kode);
            $this->db->update('pengajuan_jurnal', $pengajuan_jurnal);
         } else if (strpos($kode, 'PNJWASERDA') !== false) {
            $penjualan = $this->db->query("SELECT a.*, b.id_produk, b.jml, b.harga, c.harga_satuan AS harga_beli
            FROM pos_penjualan a 
            JOIN pos_detail_penjualan b ON a.invoice = b.invoice
            JOIN waserda_produk c ON c.kode = b.id_produk
            WHERE a.invoice = '$kode'");
            // $jml = 0;
            $harga_beli = 0;
            foreach ($penjualan->result() as $row) {
               $harga_beli += $row->jml * $row->harga_beli;
            }
            $jenis_pmb = $penjualan->row()->jenis_pembayaran;
            $kasPnj = $penjualan->row()->total_trans;
            $ppnKeluar = $penjualan->row()->ppn;
            $penjualanWaserda = $penjualan->row()->total;
            $hpp_persbrg = $harga_beli;
            /** penjualan tunai */
            $pengajuan_jurnal = [
               'status' => 'selesai'
            ];
            $this->db->where('kode', $kode);
            $this->db->update('pengajuan_jurnal', $pengajuan_jurnal);
            
            if ($jenis_pmb == 'kredit') {
               /** jurnal penjualan kredit */
               $this->M_keuangan->GenerateJurnal('1998', $kode, 'd', $kasPnj);
               $this->M_keuangan->GenerateJurnal('2140', $kode, 'k', $ppnKeluar);
               $this->M_keuangan->GenerateJurnal('4116', $kode, 'k', $penjualanWaserda);

               $this->M_keuangan->GenerateJurnal('6113', $kode, 'd', $hpp_persbrg);
               $this->M_keuangan->GenerateJurnal('1414', $kode, 'k', $hpp_persbrg);
               
            } else {
               /** jurnal penjualan tunai */
               $this->M_keuangan->GenerateJurnal('1111', $kode, 'd', $kasPnj);
               $this->M_keuangan->GenerateJurnal('2140', $kode, 'k', $ppnKeluar);
               $this->M_keuangan->GenerateJurnal('4116', $kode, 'k', $penjualanWaserda);

               $this->M_keuangan->GenerateJurnal('6113', $kode, 'd', $hpp_persbrg);
               $this->M_keuangan->GenerateJurnal('1414', $kode, 'k', $hpp_persbrg);
               /** generate ke bpk */
               $this->M_keuangan->GenerateLaporanBPK($kode, $tanggal, $kasPnj, '1111', 'd', 'Penjualan Tunai');
            }
         } else if (strpos($kode, 'PMBWASERDA') !== false) {
            $pembelian = $this->db->query("SELECT b.*, a.total, a.ppn, a.grandtotal
            FROM pos_pembelian a
            JOIN pos_detail_pembelian b ON a.invoice = b.invoice
            WHERE a.invoice = '$kode'")->row();
            $total = $pembelian->total;
            $ppn = $pembelian->ppn;
            $grandtotal = $pembelian->grandtotal;
            /** pembelian tunai */
            $pengajuan_jurnal = [
               'status' => 'selesai'
            ];
            $this->db->where('kode', $kode);
            $this->db->update('pengajuan_jurnal', $pengajuan_jurnal);

            /** jurnal pembelian */
            $this->M_keuangan->GenerateJurnal('1414', $kode, 'd', $total);
            $this->M_keuangan->GenerateJurnal('2130', $kode, 'd', $ppn);
            $this->M_keuangan->GenerateJurnal('1111', $kode, 'k', $grandtotal);
            /** generate ke bpk */
            $this->M_keuangan->GenerateLaporanBPK($kode, $tanggal, $grandtotal, '1111', 'k', 'Pembelian Barang Waserda');
         }

         if ($redir != false) {
            redirect("c_transaksi/pengajuan_jurnal");
         }
      }
      
      public function multiple_status_pengajuan()
      {
         $kode = $this->input->post('kode');
         $tanggal = $this->input->post('tanggal');
         $nominal = $this->input->post('nominal');

         for ($i = 0; $i < count($kode); $i++) {
            $this->status_pengajuan_subm($kode[$i], $tanggal[$i], $nominal[$i]);
         }
         redirect('c_transaksi/pengajuan_jurnal');
      }

      public function transaksi_bank() {
         $bulantahun = $this->input->get("bulantahun") ?? "asdawd";
         $data = [
            "bank" => $this->db->get('bank')->result(),
            "transaksi" => $this->db->query("SELECT * FROM buku_pembantu_bank WHERE tanggal LIKE '$bulantahun%'")->result(),
            "bulantahun"=>$bulantahun
         ];
         $this->template->load("template","bank/transaksi/index",$data);
      }

      public function add_transaksi_bank() {
         $data = [
            "bank" => $this->db->get('bank')->result(),
         ];
         $this->template->load("template","bank/transaksi/add",$data);
      }
      

    public function id_ref_bank($mode)
    {
        $query1   = "SELECT MAX(RIGHT(id_ref,3)) as kode FROM buku_pembantu_bank ";
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
        $kode = $mode.date('Ymd').$kd;
        return $kode;
    }

      public function transaksi_bank_submit() {
         if ($this->input->post("jenis_transaksi") == "debit") {
            $id_ref = $this->id_ref_bank("BPNRM");
         } else {
            $id_ref = $this->id_ref_bank("BPNG");
         }
         $data = [
            "kd_coa"=>1116,
            "id_ref"=>$id_ref,
            "bukti_transaksi"=>$this->input->post("bukti_transaksi"),
            "bunga"=>$this->input->post("bunga"),
            "pajak"=>$this->input->post("pajak"),
            "biaya_admin"=>$this->input->post("biaya_admin"),
            "posisi_dr_cr"=>($this->input->post("jenis_transaksi") == "debit") ? "d":"k",
            "nominal"=>$this->input->post("nominal"),
            "keterangan"=>$this->input->post("uraian"),
            "tanggal"=>date("Y-m-d")
         ];

         $this->db->insert("buku_pembantu_bank", $data);

         if ($this->input->post("jenis_transaksi") == "debit") {

            $this->db->insert("jurnal",[
               "no_coa"=>1116,
               "nominal"=>$this->input->post("nominal"),
               "posisi_dr_cr"=>"d",
               "tgl_jurnal"=>date("Y-m-d"),
               "id_jurnal"=>$id_ref
            ]);
            $this->db->insert("jurnal",[
               "no_coa"=>4212,
               "nominal"=>$this->input->post("nominal"),
               "posisi_dr_cr"=>"k",
               "tgl_jurnal"=>date("Y-m-d"),
               "id_jurnal"=>$id_ref
            ]);
         } else {
            $this->db->insert("jurnal",[
               "no_coa"=>2113,
               "nominal"=>$this->input->post("nominal"),
               "posisi_dr_cr"=>"d",
               "tgl_jurnal"=>date("Y-m-d"),
               "id_jurnal"=>$id_ref
            ]);
            $this->db->insert("jurnal",[
               "no_coa"=>1116,
               "nominal"=>$this->input->post("nominal"),
               "posisi_dr_cr"=>"k",
               "tgl_jurnal"=>date("Y-m-d"),
               "id_jurnal"=>$id_ref
            ]);
         }


         $this->session->set_flashdata("berhasil", "Data berhasil ditambahkan");
         redirect("c_transaksi/transaksi_bank");
      }


   }//end