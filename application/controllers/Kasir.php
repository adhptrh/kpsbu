<?php class Kasir extends CI_Controller
{
    public function __construct() {
        parent::__construct();

        $this->load->model(array(
            'm_masterdata' => 'master',
            'Produk_model' => 'produk',
            'm_transaksi' => 'model'
        ));
    }

    public function index()
    {
        $id_ppn = $this->input->get("id_ppn") ?? $this->db->query("SELECT * FROM ppn")->row()->id;
        $persen = $this->db->query("SELECT * FROM ppn WHERE id = $id_ppn")->row()->persen;
        $ppnmasterdata = $this->db->query("SELECT * FROM ppn")->result();
        $user = $this->session->nama_lengkap;
        // print_r($user);exit;
        $inv = $this->master->invoice();
        $id_bb = $this->db->query("SELECT a.id_produk, a.jml, b.harga_satuan AS harga_beli, b.harga_jual
        from pos_detail_penjualan a
        JOIN waserda_produk b ON a.id_produk = b.kode
        where invoice = '$inv'
        and id_produk is NOT null")->result();
        $total = $this->produk->get_total_detail($inv)->row()->total;
        $ppn = $total * ($persen/100);
        $gtot = $total + $ppn;
        $detail = $this->produk->detail_pos($inv)->result();
        // print_r($id_bb);exit;
        $data = [
            'kode' => $inv,
            'user' => $user, 
            'produk' => $this->db->get('waserda_produk')->result(),
            'detail' => $detail,
            'total' => $total,
            'ppn' => $ppn,
            'gtot' => $gtot,
            'jenis_anggota' => $this->db->get('waserda_jenis_anggota')->result(), 
            'anggota' => $this->db->get('peternak')->result(),
            'id_bb' => $id_bb,
            'persen'=> $persen,
            'id_ppn' => $id_ppn,
            'ppnmasterdata' => $ppnmasterdata,
        ];
        // print_r($data['total']);exit;
        $this->template->load('template', 'kasir/index', $data);
    }

    public function add($barcode)
    {
        # code...
        $produk = $this->db->query("SELECT * FROM waserda_produk WHERE barcode_id = '$barcode'")->row();
        echo json_encode($produk);
    }

    public function list()
    {
        $post = $this->input->post();
        $data = $this->produk->get_item($post);
        echo json_encode($data);
    }

    public function add_detail()
    {
        $invoice = $this->input->post('invoice');
        $barang = $this->input->post('barang');
        $qty = $this->input->post('qty');

        
        if (is_numeric($barang)) {
            # code...
            $produk = $this->db->query("SELECT * FROM waserda_produk WHERE barcode_id = '$barang'")->row();
            if ($produk->jml - $qty < 0) {
                $this->session->set_flashdata('notif', '<div class="alert alert-danger">Stok produk tidak cukup, stok: '.$produk->jml.'</div>');
                redirect('Kasir');
            }
            if(empty($produk->barcode_id)) 
            {
                $info = [
                    'status' => false,
                    'info' => 'Barcode tidak terdaftar',
                ];
            }
        } else {
            # code...
            $produk = $this->db->query("SELECT * FROM waserda_produk WHERE nama_produk = '$barang'")->row();
            if ($produk->jml - $qty < 0) {
                $this->session->set_flashdata('notif', '<div class="alert alert-danger">Stok produk tidak cukup, stok: '.$produk->jml.'</div>');
                redirect('Kasir');
            }
            // print_r($produk);exit;
        }

        $this->db->where('invoice', $invoice);
        $this->db->where('id_produk', $produk->kode);
        $cek = $this->db->get('pos_detail_penjualan')->row();
        // print_r($cek->id_produk);exit;
        // if (empty($cek->id_produk)) {
        //     $this->session->set_flashdata('notif', '<div class="alert alert-warning">Data tidak ditemukan.</div>');
        // }

        $this->db->where('status', 'dalam proses');
        $cek_penjualan = $this->db->get('pos_penjualan')->num_rows();

        if ($cek_penjualan == 0) {
            # code...
            $penjualan = [
                'invoice' => $invoice,
                'status' => 'dalam proses',
                'tanggal' => date('Y-m-d'),
            ];
            $this->db->insert('pos_penjualan', $penjualan);

            $data = [
                'invoice' => $invoice,
                'id_produk' => $produk->kode,
                'jml' => $qty,
                'harga' => $produk->harga_jual,
                'status' => 'dalam proses',
            ];
            $this->db->insert('pos_detail_penjualan', $data);
        } else {
            if (empty($cek->id_produk)) {
                # code...
                $data = [
                    'invoice' => $invoice,
                    'id_produk' => $produk->kode,
                    'jml' => $qty,
                    'harga' => $produk->harga_jual,
                    'status' => 'dalam proses',
                ];
                $this->db->insert('pos_detail_penjualan', $data);
                // var_dump('data baru');exit;

            } else {
                $hasil = $cek->jml + $qty;
                $arr = [
                    'jml' => $hasil
                ];
                $this->db->where('invoice', $invoice);
                $this->db->where('id_produk', $produk->kode);
                $this->db->update('pos_detail_penjualan', $arr);
            }
            $this->session->set_flashdata('notif', '<div class="alert alert-success">Data berhasil ditambahkan.</div>');
        }
        redirect('Kasir');
        // print_r($data);exit;
    }

    public function detail_barcode($qty, $invoice, $barcode)
    {
        $produk = $this->db->query("SELECT * FROM waserda_produk WHERE barcode_id = '$barcode' ")->row();

        if ($produk) {
            # code...
            $data = [
                'invoice' => $invoice,
                'id_produk' => $produk->kode,
                'jml' => $qty,
                'harga' => $produk->harga_jual,
                'status' => 'dalam proses',
            ];
            if ($this->db->insert('pos_detail_penjualan', $data)) {
                # code...
                $result = [
                    'status' => true, 
                    'info'   => 'Berhasil disimpan.'
                ];
            } else {
                # code...
                $result = [
                    'status' => true, 
                    'info'   => 'Gagal disimpan.'
                ];
            }
        } else {
            # code...
            $result = [
                'status' => false, 
                'info'   => 'No Barcode Recoreded'
            ];
        }
        echo json_encode($result);
    }

    public function update_qty($kode, $invoice, $qty)
    {
        // $qty_update = $this->input->post('qty_update');
        // print_r($qty_update);exit;
        $arr = [
            'jml' => $qty
        ];
        $this->db->where('invoice', $invoice);
        $this->db->where('id_produk', $kode);
        $this->db->update('pos_detail_penjualan', $arr);

        echo json_encode('Sukses Update');
        // redirect('Kasir');
    }

    public function checkout()
    {
        $id_bb = $this->input->post('id_bb');
        $qty = $this->input->post('qty');
        $harga_beli = $this->input->post('harga_beli');
        $kode = $this->input->post('kode');
        $jenis = $this->input->post('jenis');
        $pembeli = $this->input->post('pembeli');
        $tipe = $this->input->post('tipe');
        $pembayaran = $this->input->post('pembayaran');
        $kembalian = $this->input->post('kembalian');
        $total = $this->input->post('total');
        $id_ppn = $this->input->post("id_ppn");
        $status = ($tipe == 'kredit') ? 'kredit' : 'terbayar';

        $anggota = $this->input->post('anggota');

        $ppn = $this->input->post('ppn');
        $total_trans = $this->input->post('total_trans');

        if (empty($pembeli)) {
            $pembeli = 'Guest';
        }

        $data = [
            'total' => $total,
            'nama_pembeli' => $pembeli,
            'jenis_pembayaran' => $tipe,
            'kembalian' => $kembalian,
            'pembayaran' => $pembayaran,
            'ppn' => $ppn,
            'total_trans' => $total_trans,
            'id_detail_jenis_anggota' => $jenis,
            'status' => $status,
            'id_ppn' => $id_ppn
        ];
        // print_r($kode);exit;
        $this->db->where('invoice', $kode);
        $this->db->update('pos_penjualan', $data);

        if ($jenis == 1 && $tipe == 'kredit') {

            if ($anggota == 'pegawai') {
                $status_kredit = [
                    'status_kredit' => 1
                ];
                $this->db->where('nama', $pembeli);
                $this->db->update('pegawai', $status_kredit);
            } else {
                $status_kredit = [
                    'status_kredit' => 1
                ];
                $this->db->where('nama_peternak', $pembeli);
                $this->db->update('peternak', $status_kredit);
            }

            /** pengajuan jurnal kredit */
            $this->M_keuangan->pengajuanJurnal($kode, $pembayaran, 'Penjualan Barang Kredit Waserda');

            $tb_kredit = [
                'invoice' => $kode,
                'nama' => $pembeli,
                'jenis_anggota' => $anggota,
                'nominal' => $pembayaran,
            ];
            $this->db->insert('waserda_pembayaran_kredit', $tb_kredit);
        } else {
            $this->M_keuangan->pengajuanJurnal($kode, $total, 'Penjualan Barang Tunai Waserda');
        }

        $this->db->where('invoice', $kode);
        $this->db->where('id_produk !=', NULL);
        $cek_invoice = $this->db->get('pos_detail_penjualan')->result();
        var_dump($cek_invoice);

        $where = [];
        $bb = [];
        foreach ($id_bb as $key => $value) {
            
            /** blm selesai */
            $produkByID = $this->db->query("SELECT a.id_produk, a.jml, b.harga_satuan AS harga_beli, b.harga_jual
            from pos_detail_penjualan a
            JOIN waserda_produk b ON a.id_produk = b.kode
            where invoice = '$kode'
            and id_produk = '$value'");

            $this->db->insert("laporan_kartu_stock", [
                'kode_produk'=>$value,
                'mode'=>"out",
                'unit'=>$produkByID->row()->jml,
            ]);

            $qty = $produkByID->row()->jml;
            $harga_beli_produk = $produkByID->row()->harga_beli;
            $total_harga_beli_produk = $harga_beli_produk * $qty;
            
            $harga_jual_produk = $produkByID->row()->harga_jual;
            $total_harga_jual_produk = $harga_jual_produk * $qty;
            $ppn = $total_harga_jual_produk * 0.11;
            $total = $ppn + $total_harga_jual_produk;

            $total_pengajuan_jurnal = $total_harga_jual_produk + $ppn + $total_harga_beli_produk;


            /** coba kartu stok penjualan */
            $this->db->where('invoice', $kode);
            $this->db->where('id_produk', $value);
            $detailPnj = $this->db->get('pos_detail_penjualan')->result();
            foreach ($detailPnj as $detail) {
                $id_produk = $detail->id_produk;
                $pengurang = $detail->jml;
                
                $cekRow = $this->db->query("SELECT COUNT(stok_akhir) as jml_baris FROM waserda_log_transaksi WHERE id_produk = '$value' AND  stok_akhir > 0  AND jenis_transaksi = 'Stok Masuk'");
                $jml_baris = $cekRow->row()->jml_baris;
                $data = [
                    'no_trans' => $kode, 
                    'id_produk' => $value, 
                    'jml_baris_sblmnya' => $jml_baris
                ];
                $this->db->insert('waserda_log_stok', $data);

                $cekLog = $this->db->query("select * from waserda_log_transaksi where jenis_transaksi = 'Stok Masuk' and id_produk = '$value' and stok_akhir > 0 order by id asc")->result_array();

                foreach ($cekLog as $row) {
                    $id = $row['id'];
                    $stok_akhir = $row['stok_akhir'];
                    if ($pengurang > 0) {
                        $temp = $pengurang;
                        $pengurang = $pengurang - $stok_akhir;
                        if ($pengurang > 0) {
                            $stok_update = 0;
                        } else {
                            $stok_update = $stok_akhir - $temp;
                        }
                        $this->db->set('stok_akhir', $stok_update);
                        $this->db->where('id_produk', $value);
                        $this->db->where('jenis_transaksi', 'Stok Masuk');
                        $this->db->where('id', $id);
                        $this->db->update('waserda_log_transaksi');
                    }
                }
            }

            /** coba kartu stok */
            $detilPnj = $this->db->query("SELECT * FROM pos_detail_penjualan WHERE invoice = '$kode' and id_produk = '$value' GROUP BY id_produk")->result_array();
            foreach ($detilPnj as $data) {
                $this->db->where('id_produk', $value);
                $this->db->where('stok_akhir >', 0);
                $this->db->where('jenis_transaksi', 'Stok Masuk');
                $resWaserdaLogTrans = $this->db->get('waserda_log_transaksi');

                // $jmlBarisSebelumnya = $this->db->query("SELECT * FROM waserda_log_stok 
                // WHERE no_trans <> '$kode'
                // AND id_produk = '$value'
                // ORDER BY no_trans DESC  
                // LIMIT 1")->row()->jml_baris_sblmnya;

                $jmlBarisSebelumnya = $this->db->query("SELECT COUNT(stok_akhir) as jml_baris
                FROM waserda_log_transaksi
                WHERE id_produk = '$value' AND
                stok_akhir > 0  AND jenis_transaksi = 'Stok Masuk'
                ")->row()->jml_baris;

                $this->db->where('no_trans', $kode);
                $this->db->where('id_produk', $value);
                $jml_baris_sblmnya = $this->db->get('waserda_log_stok')->row()->jml_baris_sblmnya;

                $jml_baris = 0;
                $jml_baris = $jml_baris_sblmnya - $jmlBarisSebelumnya;

                $x = 1;
                while($x <= $jml_baris) {
                    $x++;
                    $d0 = array(
                        'no_transaksi' => $kode,
                        'kode' => $value,
                        'tgl_transaksi' => date('Y-m-d H:i:s'),
                        'keterangan' => "",
                        'unit_in' => 0,
                        'harga_in' => 0,
                        'total_in' => 0,
                        'unit_out' => 0,
                        'harga_out' => 0,
                        'total_out' => 0,
                        'unit_total' => 0,
                        'harga_total' => 0,
                        'total' => 0
                    );
                    $this->db->insert('waserda_kartu_stok', $d0);
                }

                if ($resWaserdaLogTrans->num_rows() > 0) {
                    foreach ($resWaserdaLogTrans->result_array() as $data1) {
                        $this->db->where('kode', $value);
                        $waserda_produk = $this->db->get('waserda_produk');
                        $hargaPerProduk = $waserda_produk->row()->harga_jual;
                        $d1 = array(
                            'no_transaksi' => $kode,
                            'kode' => $value,
                            'tgl_transaksi' => date('Y-m-d H:i:s'),
                            'keterangan' => "",
                            'unit_in' => 0,
                            'harga_in' => 0,
                            'total_in' => 0,
                            'unit_out' => 0,
                            'harga_out' => 0,
                            'total_out' => 0,
                            'unit_total' => $data1['stok_akhir'],
                            'harga_total' => $hargaPerProduk,
                            'total' => $data1['stok_akhir'] * $hargaPerProduk
                        );
                        $this->db->insert('waserda_kartu_stok', $d1);
                    }
                    $this->db->where('no_transaksi', $data['invoice']);
                    $this->db->where('kode', $value);
                    $this->db->order_by('no ASC');
                    $cek_no = $this->db->get('waserda_kartu_stok')->row_array()['no'];
                    // print_r($cek_no);exit;
                    $this->db->where('no', $cek_no);
                    $this->db->set('unit_out', $data['jml']);
                    $this->db->set('harga_out', $data['harga']);
                    $this->db->set('total_out', $data['jml'] * $data['harga']);
                    $this->db->update('waserda_kartu_stok');
                } else {
                    $d1 = array(
                        'no_transaksi' => $data['invoice'],
                        'kode' => $value,
                        'tgl_transaksi' => date('Y-m-d H:i:s'),
                        'keterangan' => "",
                        'unit_in' => 0,
                        'harga_in' => 0,
                        'total_in' => 0,
                        'unit_out' => $data['jml'],
                        'harga_out' => $data['harga'],
                        'total_out' => $data['jml'] * $data['harga'],
                        'unit_total' => $data['jml'],
                        'harga_total' => $data['harga'],
                        'total' => $data['jml'] * $data['harga']
                    );
                    $this->db->insert('waserda_kartu_stok', $d1);
                }
            }

            $where = array(
                'kode' => $value
            );
            // ambil stok akhir
            $this->db->where(['kode' => $value]);
            $jumlah = $this->db->get('waserda_produk')->row()->jml;

            $bb = array(
                'jml' => $jumlah - $cek_invoice[$key]->jml,
            );
            $this->db->where($where);
            $this->db->update('waserda_produk', $bb);
        }

        // insert ke buku kas kecil
        if ($total_trans < 10000000) {
            $date_now = date('Y-m-d');
            $this->model->insert_buku_kas_kecil($kode, $date_now, $total_trans, 'Penjualan', 'd');
        }

        $this->session->set_flashdata('notif', '<div class="alert alert-success">Pembayaran berhasil.</div>');
        
        if ($tipe != "kredit") {
            $this->session->set_flashdata('invoice', $kode);
        }

        redirect('Kasir');
    }

    public function jenis($tipe)
    {
        if ($tipe) {
            echo $this->produk->jenis_anggota($tipe);
        }
    }

    public function pos_penjualan()
    {
        $this->template->load('template', 'waserda/penjualan/index');
    }

    public function pmb_kredit()
    {
        $this->db->order_by('id', 'desc');
        $kredit = $this->db->get('waserda_pembayaran_kredit')->result();
        $kode = $this->produk->kd_pembayaran_kredit();
        // print_r($kode);exit;
        $data = [
            'kode' => $kode,
            'list' => $kredit,
        ];
        $this->template->load('template', 'waserda/pmb_kredit/index', $data);
    }

    public function save_many_pmb_kredit()
    {
        $invoices = $this->input->post("invoice");
        foreach ($invoices as $invoice) {
            $kode = $this->produk->kd_pembayaran_kredit();
            if ($this->input->post("nama_".$invoice)) {
                $this->save_pmb_kredit2(
                    $kode, 
                    date('Y-m-d'), 
                    $invoice, 
                    $this->input->post("nama_".$invoice),
                    $this->input->post("nominal_".$invoice),
                    $this->input->post("anggota_".$invoice),
                );
            }
        }
        redirect('Kasir/pmb_kredit');
    }

    public function save_pmb_kredit2($kd_pembayaran, $tgl_pembayaran, $invoice, $nm_pembeli, $total, $anggota)
    {
        
        // kirim ke db pengajuan jurnal 
        $pengajuan = [
            'kode' => $kd_pembayaran,
            'tanggal' => $tgl_pembayaran,
            'nominal' => $total,
            'jenis' => $anggota,
        ];
        $this->db->insert("pengajuan_jurnal", $pengajuan);

        // ubah status pembayaran kredit 
        $status = [
            'status' => 2
        ];
        $this->db->where('invoice', $invoice);
        $this->db->update('waserda_pembayaran_kredit', $status);

        
        if ($anggota == 'pegawai') {
            $status_kredit = [
                'status_kredit' => 0
            ];
            $this->db->where('nama', $nm_pembeli);
            $this->db->update('pegawai', $status_kredit);
        } else {
            $status_kredit = [
                'status_kredit' => 0
            ];
            $this->db->where('nama_peternak', $nm_pembeli);
            $this->db->update('peternak', $status_kredit);
        }

        $data = [
            'id_pembayaran' => $kd_pembayaran, 
            'tanggal' => $tgl_pembayaran, 
        ];
        $this->db->where('invoice', $invoice);
        $this->db->update('waserda_pembayaran_kredit', $data);

        $status = [
            'status_kredit' => 'lunas',
        ];
        $this->db->where('invoice', $invoice);
        $this->db->update('pos_penjualan', $status);

    }

    /** pembayaran kredit */
    public function save_pmb_kredit()
    {
        $kd_pembayaran = $this->input->post('kd_pembayaran');
        $tgl_pembayaran = $this->input->post('tgl_pembayaran');
        $invoice = $this->input->post('invoice');
        $nm_pembeli = $this->input->post('nm_pembeli');
        $total = $this->input->post('total');

        $anggota = $this->input->post('anggota');
        
        // kirim ke db pengajuan jurnal 
        $pengajuan = [
            'kode' => $kd_pembayaran,
            'tanggal' => $tgl_pembayaran,
            'nominal' => $total,
            'jenis' => $anggota,
        ];
        $this->db->insert("pengajuan_jurnal", $pengajuan);

        // ubah status pembayaran kredit 
        $status = [
            'status' => 2
        ];
        $this->db->where('invoice', $invoice);
        $this->db->update('waserda_pembayaran_kredit', $status);

        
        if ($anggota == 'pegawai') {
            $status_kredit = [
                'status_kredit' => 0
            ];
            $this->db->where('nama', $nm_pembeli);
            $this->db->update('pegawai', $status_kredit);
        } else {
            $status_kredit = [
                'status_kredit' => 0
            ];
            $this->db->where('nama_peternak', $nm_pembeli);
            $this->db->update('peternak', $status_kredit);
        }

        $data = [
            'id_pembayaran' => $kd_pembayaran, 
            'tanggal' => $tgl_pembayaran, 
        ];
        $this->db->where('invoice', $invoice);
        $this->db->update('waserda_pembayaran_kredit', $data);

        $status = [
            'status_kredit' => 'lunas',
        ];
        $this->db->where('invoice', $invoice);
        $this->db->update('pos_penjualan', $status);

        redirect('Kasir/pmb_kredit');
    }

    public function list_penjualan()
    {
        $list = $this->db->query('select * from pos_penjualan where nama_pembeli is not null order by date_payment desc')->result();
        $data = [
            'list' => $list,
        ];
        $this->template->load('template', 'waserda/penjualan/index', $data);
    }

    public function detail_print($invoice)
    {
        $detail = $this->db->query('select pdp.*, wp.nama_produk, pp.tanggal, pp.date_payment from pos_detail_penjualan pdp 
        join pos_penjualan pp on pdp.invoice = pp.invoice 
        join waserda_produk wp on pdp.id_produk = wp.kode 
        where pp.nama_pembeli is not null
        and pdp.invoice = "'.$invoice.'"
        order by pp.date_payment desc')->result();
        $detailInvoice = $this->db->query('select *, ppn.persen as persen from pos_penjualan join ppn on pos_penjualan.id_ppn = ppn.id where nama_pembeli is not null and invoice = "'.$invoice.'" order by date_payment desc')->row();
        $data = [
            'detail' => $detail,
            'detailInvoice'=>$detailInvoice
        ];
        // print_r($detail);exit;
        $this->template->load('template', 'waserda/penjualan/detailPrint', $data);
    }

    public function pdf($invoice)
    {
        $detail = $this->db->query('select pdp.*, wp.nama_produk, pp.tanggal, pp.date_payment, pp.pembayaran, pp.kembalian, pp.total_trans, pp.ppn, pp.total 
        from pos_detail_penjualan pdp 
        join pos_penjualan pp on pdp.invoice = pp.invoice 
        join waserda_produk wp on pdp.id_produk = wp.kode 
        where pp.nama_pembeli is not null
        and pdp.invoice = "'.$invoice.'"
        order by pp.date_payment desc')->result();
        $pnj = $this->db->query('select *,ppn.persen as persen  from pos_penjualan join ppn on pos_penjualan.id_ppn = ppn.id where invoice = "'.$invoice.'"')->row();
        $data = [
            'title' => 'pdf', 
            'detail' => $detail,
            'penjualan' => $pnj,
        ];
    
        $this->load->library('pdf');
        $this->pdf->setPaper('a7', 'potrait');
        $this->pdf->filename = "laporan.pdf";
        $this->pdf->load_view('waserda/penjualan/laporan_pdf', $data);
    }

    public function pdfpreview($invoice)
    {
        $detail = $this->db->query('select pdp.*, wp.nama_produk, pp.tanggal, pp.date_payment, pp.pembayaran, pp.kembalian, pp.total_trans, pp.ppn, pp.total 
        from pos_detail_penjualan pdp 
        join pos_penjualan pp on pdp.invoice = pp.invoice 
        join waserda_produk wp on pdp.id_produk = wp.kode 
        where pp.nama_pembeli is not null
        and pdp.invoice = "'.$invoice.'"
        order by pp.date_payment desc')->result();
        $pnj = $this->db->query('select *,ppn.persen as persen from pos_penjualan join ppn on pos_penjualan.id_ppn = ppn.id where invoice = "'.$invoice.'"')->row();
        $data = [
            'title' => 'pdf', 
            'detail' => $detail,
            'penjualan' => $pnj,
        ];
    
        $this->load->view( 'waserda/penjualan/laporan_pdf', $data);
    }

    // test
    public function hapus_detail($id)
    {
        $this->db->where('id', $id);
        $data = $this->db->delete('pos_detail_penjualan');

        if ($data) {
            echo json_encode($data);
        }
    }

    public function getanggota($anggota_id) {
        $qptrnk = $this->db->query("SELECT * FROM peternak WHERE no_anggota = '$anggota_id' AND status_kredit = 0")->result();
        if (count($qptrnk) > 0) {
            echo json_encode([
                'status' => 'success',
                'data' => $qptrnk[0]
            ]);
            return;
        }

        $qpegawai = $this->db->query("SELECT * FROM pegawai WHERE no_anggota = '$anggota_id' AND status_kredit = 0")->result();
        if (count($qpegawai) > 0) {
            echo json_encode([
                'status' => 'success',
                'data' => $qpegawai[0]
            ]);
            return;
        } else {
            echo json_encode([
                'status' => 'error',
                'data' => 'Data tidak ditemukan'
            ]);
            return;
        }
    }
}
?>