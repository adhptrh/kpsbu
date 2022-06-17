<?php class Pembelian extends CI_Controller
{
    public function __construct() {
        parent::__construct();
        $this->load->model(array(
            'm_masterdata' => 'master',
            'Produk_model' => 'produk',
            'm_transaksi'  => 'transaksi'
        ));
    }
    public function index()
    {
        $list = $this->produk->list()->result();
        $data = [
            'list' => $list,
        ];
        $this->template->load('template', 'waserda/pembelian/index', $data);
    }

    public function detail_print($invoice)
    {
        $query = $this->db->query('SELECT
        b.*, c.nama_produk, c.harga_satuan, a.jml, a.tanggal_kadaluwarsa
        FROM pos_detail_pembelian a 
        JOIN pos_pembelian b ON a.invoice = b.invoice
        JOIN waserda_produk c ON c.kode = a.id_produk
        WHERE b.invoice = "'.$invoice.'"
        ORDER BY id DESC')->result();
        $data = [
            'detail' => $query
        ];
        $this->template->load('template', 'waserda/pembelian/detail', $data);
    }

    public function pdf($invoice)
    {
        $detail = $this->db->query('SELECT
        b.*, c.nama_produk, c.harga_satuan, a.jml, a.id_supplier
        FROM pos_detail_pembelian a 
        JOIN pos_pembelian b ON a.invoice = b.invoice
        JOIN waserda_produk c ON c.kode = a.id_produk
        WHERE b.invoice = "'.$invoice.'"
        ORDER BY id DESC')->result();
        $nama_supplier = $this->db->query('SELECT nama FROM waserda_supplier WHERE kode = "'.$detail[0]->id_supplier.'"')->result();
        $detail[0]->nama_supplier = $nama_supplier[0]->nama;
        $data = [
            'title' => 'pdf', 
            'detail' => $detail,
        ];
        // print_r($data['detail']);exit;
        $date = date('Ymd');
        $this->load->library('pdf');
        $this->pdf->setPaper('a7', 'potrait');
        $this->pdf->filename = "struk-pembelian-'$date'.pdf";
        $this->pdf->load_view('waserda/pembelian/laporan_pdf', $data);
    }

    public function add()
    {
        $inv = $this->master->invoice_pmb();
        $supplier = $this->db->get('waserda_supplier')->result();
        $detail = $this->produk->detail_pembelian($inv)->result();
        $total = $this->produk->total_pembelian($inv)->row()->total;
        $ppn = $total * 0.11;
        $grand = $total + $ppn;
        $id_bb = $this->db->query("select id_produk from pos_detail_pembelian where invoice = '$inv'")->result();
        // print_r($total);exit;
        $data = [
            'kode' => $inv,
            'supplier' => $supplier,
            'detail' => $detail,
            'total' => $total,
            'ppn' => $ppn,
            'grandtotal' => $grand,
            'id_bb' => $id_bb,
        ];
        $this->template->load('template', 'waserda/pembelian/add', $data);
    }

    public function supplier()
    {
        if ($this->input->post('supplier')) {
            echo $this->produk->get_produk_by_supplier($this->input->post('supplier'));
        }
    }

    public function produk($id)
    {
        $this->db->where('kode', $id);
        $data = $this->db->get('waserda_produk')->row();
        echo json_encode($data);
    }

    public function add_to_detail()
    {
        $kode = $this->input->post('kode');
        $tanggal = $this->input->post('tanggal');
        $tanggal_kadaluwarsa = $this->input->post('tanggal_kadaluwarsa');
        $supplier = $this->input->post('supplier');
        $produk = $this->input->post('produk');
        $jml = $this->input->post('jml');
        $harga = $this->input->post('harga');
        // print_r($produk);exit;

        $this->db->where('invoice', $kode);
        $this->db->where('id_produk', $produk);
        $cek = $this->db->get('pos_detail_pembelian')->row();

        $this->db->where('status', 'dalam proses');
        $cek_beli = $this->db->get('pos_pembelian')->num_rows();

        if ($cek_beli == 0) {
            # code...
            $data = [
                'invoice' => $kode,
                'id_supplier' => $supplier,
                'id_produk' => $produk,
                'harga_satuan' => $harga,
                'jml' => $jml,
                'status' => 'dalam proses',
                'tanggal_kadaluwarsa' => $tanggal_kadaluwarsa,
            ];
            $this->db->insert('pos_detail_pembelian', $data);
    
            $pembelian = [
                'invoice' => $kode,
                'status' => 'dalam proses',
                'tanggal' => date('Y-m-d'),
            ];
            $this->db->insert('pos_pembelian', $pembelian);
        } else {
            if (empty($cek->id_produk)) {
                # code...
                $data = [
                    'invoice' => $kode,
                    'id_supplier' => $supplier,
                    'id_produk' => $produk,
                    'harga_satuan' => $harga,
                    'jml' => $jml,
                    'tanggal_kadaluwarsa' => $tanggal_kadaluwarsa,
                    'status' => 'dalam proses',
                ];
                $this->db->insert('pos_detail_pembelian', $data);
            } else {
                $hasil = $cek->jml + $jml;
                $arr = [
                    'jml' => $hasil
                ];
                $this->db->where('invoice', $kode);
                $this->db->where('id_produk', $produk);
                $this->db->update('pos_detail_pembelian', $arr);
            }
        }
        redirect('Pembelian/add');
    }

    public function simpan_produk()
    {
        $id = $this->input->post('id');
        $total = $this->input->post('total');
        $ppn = $this->input->post('ppn');
        $grand = $this->input->post('grandtotal');
        $id_bb = $this->input->post('id_bb');

        $arr = [
            'total' => $total,
            'ppn' => $ppn,
            'grandtotal' => $grand,
            'status' => 'selesai'
        ];
        // print_r($id_bb);exit;
        $this->db->where('invoice', $id);
        $this->db->update('pos_pembelian', $arr);

        $arr2 = [
            'status' => 'selesai'
        ];
        $this->db->where('invoice', $id);
        $this->db->update('pos_detail_pembelian', $arr2);

        // $pnj = $this->db->query("SELECT a.*, b.jml, b.status
        // FROM pos_pembelian a
        // JOIN pos_detail_pembelian b ON a.invoice = b.invoice
        // WHERE a.invoice = '$id'
        // AND b.id_produk = '$value'")->row();
        $pnj = $this->db->query("select * from pos_pembelian where invoice='$id'")->row();
        $total = $pnj->total;
        $ppn = $pnj->ppn;
        $grandtot = $pnj->grandtotal;
        
        /** pengajuan jurnal */
        $this->M_keuangan->pengajuanJurnal($id, $grandtot, 'Pembelian Barang Waserda');

        /** insert kartu stok */
        // $kartuStok = array();
        foreach ($id_bb as $key => $value) {
            
            // $cekTblKartuStokById = $this->db->query("select * from waserda_kartu_stok where kode = '$value'");
            $detailProduk = $this->db->query("select * from pos_detail_pembelian where invoice = '$id' AND id_produk ='$value'")->row();
            
            $this->db->insert('laporan_kartu_stock', [
                "kode_produk"=>$value,
                "mode"=>"in",
                "unit"=>$detailProduk->jml
            ]);

            /** generate jurnal pembelian */
            // $this->M_keuangan->GenerateJurnal('1414', $id, 'd', $total);
            // $this->M_keuangan->GenerateJurnal('2130', $id, 'd', $ppn);
            // $this->M_keuangan->GenerateJurnal('1111', $id, 'k', $grandtot);

            $logTrans = [
                'id_produk' => $value, 
                'jenis_transaksi' => 'Stok Masuk', 
                'jumlah' => $detailProduk->jml,
                'stok_akhir' => $detailProduk->jml
            ];
            $this->db->insert('waserda_log_transaksi', $logTrans);

            $this->db->where('invoice', $id);
            $this->db->where('id_produk', $value);
            $detilPmb = $this->db->get('pos_detail_pembelian')->result_array();
            foreach ($detilPmb as $data) {
                $this->db->where('id_produk', $value);
                $this->db->where('stok_akhir >', 0);
                $this->db->where('jenis_transaksi', 'Stok Masuk');
                $resPmb = $this->db->get('waserda_log_transaksi');

                if ($resPmb->num_rows() > 0) {
                    foreach ($resPmb->result_array() as $data1) {
                        # code...
                        $id_produk = $value;
                        $this->db->where('kode', $value);
                        $harga = $this->db->get('waserda_produk')->row()->harga_satuan;

                        $d1 = array(
                            'no_transaksi' => $id,
                            'kode' => $value,
                            'tgl_transaksi' => date('Y-m-d H:i:s'),
                            'unit_in' =>  0,
                            'harga_in' => 0,
                            'total_in' => 0,
                            'unit_out' => 0,
                            'harga_out' => 0,
                            'total_out' => 0,
                            'unit_total' => $data1['stok_akhir'],
                            'harga_total' => $harga,
                            'total' => $data1['stok_akhir'] * $harga,
                        );
                        $this->db->insert('waserda_kartu_stok', $d1);
                    }
                    //
                    $this->db->where('no_transaksi', $id);
                    $this->db->where('kode', $value);
                    $this->db->order_by('no ASC');
                    $cek_no = $this->db->get('waserda_kartu_stok')->row_array()['no'];
                    // print_r($cek_no);exit;
                    //
                    $this->db->where('no', $cek_no);
                    $this->db->set('unit_in', $data['jml']);
                    $this->db->set('harga_in', $data['harga_satuan']);
                    $this->db->set('total_in', $data['jml'] * $data['harga_satuan']);
                    $this->db->update('waserda_kartu_stok');
                } else {
                    $d1 = array(
                        'no_transaksi' => $id,
                        'kode' => $value,
                        'tgl_transaksi' => date('Y-m-d H:i:s'),
                        'unit_in' =>  $data['jml'],
                        'harga_in' => $data['harga_satuan'],
                        'total_in' => $data['jml'] * $data['harga_satuan'],
                        'unit_out' => 0,
                        'harga_out' => 0,
                        'total_out' => 0,
                        'unit_total' => $data['jml'],
                        'harga_total' => $data['harga_satuan'],
                        'total' => $data['jml'] * $data['harga_satuan'],
                    );
                    $this->db->insert('waserda_kartu_stok', $d1);
                }
            }
        }
        /** belum selesai */

        $this->db->where('invoice', $id);
        $cek_invoice = $this->db->get('pos_detail_pembelian')->result();

        $where = [];
        $bb = [];
        foreach ($id_bb as $key => $value) {
            $where = array(
                'kode' => $value
            );
            // ambil stok akhir
            $this->db->where(['kode' => $value]);
            $jumlah = $this->db->get('waserda_produk')->row()->jml;

            $bb = array(
                'jml' => $jumlah + $cek_invoice[$key]->jml,
            );
            $this->db->where($where);
            $this->db->update('waserda_produk', $bb);

        }
        $this->db->where($id_bb);
        
        redirect('Pembelian');
    }

    // test
    public function hapus_detail($id)
    {
        $this->db->where('id', $id);
        $data = $this->db->delete('pos_detail_pembelian');

        if ($data) {
            echo json_encode($data);
        }
    }
}
?>