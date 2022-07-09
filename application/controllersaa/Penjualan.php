<?php 
class Penjualan extends CI_Controller
{
    public function __construct() {
        parent::__construct();
        $this->load->model('Penjualan_model');
    }
    
    public function susu()
    {
        $this->db->where('jenis_pnj_susu', 'susu_murni');
        $list = $this->db->get('pnj_susu')->result();
        $data = [
            'list' => $list,
        ];
        $this->template->load('template', 'penjualan/susu/index', $data);
    }
    
    public function form_penjualan_susu()
    {
        $jenis = 'susu_murni';
        $kode = $this->Penjualan_model->kd_penjualan_susu();
        $prod_susu = $this->Penjualan_model->type_susu($jenis)->result();
        $this->db->where('kd_pnj_susu', $kode);
        $detail = $this->db->get('detail_pnj_susu')->result();
        $total = $this->Penjualan_model->total_detail_pnj($kode)->row()->total;
        // print_r($total);exit;
        $data = [
            'produk' => $prod_susu, 
            'kode' => $kode, 
            'detail' => $detail,
            'total1' => $total,
        ];
        $this->template->load('template', 'penjualan/susu/add', $data);
    }

    public function detail_pnj_susu()
    {
        $cek_jenis = $this->uri->segment(2);
        if ($cek_jenis == 'detail_pnj_susu_olahan') {
            $jenis = 'susu_olahan';
        } else {
            $jenis = 'susu_murni';
        }
        $pnj_susu = $this->input->post('pnj_susu');
        $prod_susu = $this->input->post('prod_susu');
        $jumlah_lt = $this->input->post('jumlah_lt');
        $tanggal = $this->input->post('tanggal');

        $this->db->where('no_produk', $prod_susu);
        $get_produk = $this->db->get('produk')->row();
        $harga_satuan = $get_produk->harga_jual;
        $subtotal = $jumlah_lt * $harga_satuan;
        // print_r($get_produk);exit;

        $this->db->where('kd_pnj_susu', $pnj_susu);
        $this->db->where('jenis_pnj_susu', $jenis);
        $cek = $this->db->get('pnj_susu')->num_rows();

        $this->db->where('kd_pnj_susu', $pnj_susu);
        $this->db->where('kd_produk', $prod_susu);
        $cek_detail =$this->db->get('detail_pnj_susu')->row();
        
        // print_r($cek_detail);exit;

        if ($cek == 0) {
            $pnj = [
                'kd_pnj_susu' => $pnj_susu,
                'status' => 'on proses',
                'tanggal' => $tanggal, 
                'jenis_pnj_susu' => $jenis,
            ];
            $this->db->insert('pnj_susu', $pnj);

            $detail = [
                'kd_pnj_susu' => $pnj_susu,
                'kd_produk' => $prod_susu,
                'nm_produk' => $get_produk->nama_produk,
                'jml_liter' => $jumlah_lt,
                'harga_satuan' => $harga_satuan,
                'subtotal' => $subtotal,
            ];
            $this->db->insert('detail_pnj_susu', $detail);

            // $update_stok = $get_produk->stok - $jumlah_lt;
            // $arr = [
            //     'stok' => $update_stok
            // ];
            // $this->db->where('no_produk', $prod_susu);
            // $this->db->update('produk', $arr);
        } else {
            if (empty($cek_detail->kd_produk)) {
                # code...
                $detail = [
                    'kd_pnj_susu' => $pnj_susu,
                    'kd_produk' => $prod_susu,
                    'nm_produk' => $get_produk->nama_produk,
                    'jml_liter' => $jumlah_lt,
                    'harga_satuan' => $harga_satuan,
                    'subtotal' => $subtotal,
                ];
                $this->db->insert('detail_pnj_susu', $detail);

                // $update_stok = $get_produk->stok - $jumlah_lt;
                // $arr = [
                //     'stok' => $update_stok
                // ];
                // $this->db->where('no_produk', $prod_susu);
                // $this->db->update('produk', $arr);
            } else {
                # code...
                $hasil = $cek_detail->jml_liter + $jumlah_lt;
                $update_harga = $cek_detail->harga_satuan * $hasil;
                
                $update = [
                    'jml_liter' => $hasil,
                    'subtotal' => $update_harga,
                ];
                $this->db->where('kd_pnj_susu', $pnj_susu);
                $this->db->where('kd_produk', $prod_susu);
                $this->db->update('detail_pnj_susu', $update);

                // $update_stok = $get_produk->stok - $jumlah_lt;
                // $arr = [
                //     'stok' => $update_stok
                // ];
                // $this->db->where('no_produk', $prod_susu);
                // $this->db->update('produk', $arr);
            }
            
        }
        redirect('penjualan/form_penjualan_susu');
    }

    public function save_pnj()
    {
        $id = $this->input->post('id');
        $total = $this->input->post('total');
        $pembeli = $this->input->post('pelanggan');
        $jenis = $this->input->post('jenis');

        $data = [
            'nm_pelanggan' => $pembeli,
            'total' => $total,
            'status' => 'selesai',
        ];
        $this->db->where('kd_pnj_susu', $id);
        $this->db->update('pnj_susu', $data);

        if ($jenis == 'susu_olahan') {
            $kas = [
                'id_jurnal' => $id,
                'tgl_jurnal' => date('Y-m-d'),
                'no_coa' => 1111,
                'posisi_dr_cr' => 'd',
                'nominal' => $total,
            ];
            $this->db->insert('jurnal', $kas);

            $pnj = [
                'id_jurnal' => $id,
                'tgl_jurnal' => date('Y-m-d'),
                'no_coa' => 4115,
                'posisi_dr_cr' => 'k',
                'nominal' => $total,
            ];
            $this->db->insert('jurnal', $pnj);

            redirect('penjualan/pengolahan_susu');
        } else if ($jenis == 'pakan_konsentrat') {
            $kas = [
                'id_jurnal' => $id,
                'tgl_jurnal' => date('Y-m-d'),
                'no_coa' => 1111,
                'posisi_dr_cr' => 'd',
                'nominal' => $total,
            ];
            $this->db->insert('jurnal', $kas);

            $pnj = [
                'id_jurnal' => $id,
                'tgl_jurnal' => date('Y-m-d'),
                'no_coa' => 4114,
                'posisi_dr_cr' => 'k',
                'nominal' => $total,
            ];
            $this->db->insert('jurnal', $pnj);

            redirect('penjualan/pakan_konsentrat');
        } else {
            $kas = [
                'id_jurnal' => $id,
                'tgl_jurnal' => date('Y-m-d'),
                'no_coa' => 1111,
                'posisi_dr_cr' => 'd',
                'nominal' => $total,
            ];
            $this->db->insert('jurnal', $kas);

            $pnj = [
                'id_jurnal' => $id,
                'tgl_jurnal' => date('Y-m-d'),
                'no_coa' => 4113,
                'posisi_dr_cr' => 'k',
                'nominal' => $total,
            ];
            $this->db->insert('jurnal', $pnj);

            redirect('penjualan/susu');
        }
    }

    public function pengolahan_susu()
    {
        $this->db->where('jenis_pnj_susu', 'susu_olahan');
        $list = $this->db->get('pnj_susu')->result();
        $data = [
            'list' => $list,
        ];
        $this->template->load('template', 'penjualan/pengolahan_susu/index', $data);
    }
    
    public function form_pengolahan_susu()
    {
        $jenis = 'susu_olahan';
        $kode = $this->Penjualan_model->kd_olahan_susu();
        $prod_susu = $this->Penjualan_model->type_susu($jenis)->result();
        $this->db->where('kd_pnj_susu', $kode);
        $detail = $this->db->get('detail_pnj_susu')->result();
        $total = $this->Penjualan_model->total_detail_pnj($kode)->row()->total;
        // print_r($prod_susu);exit;
        $data = [
            'produk' => $prod_susu, 
            'kode' => $kode, 
            'detail' => $detail,
            'total1' => $total,
        ];
        $this->template->load('template', 'penjualan/pengolahan_susu/add', $data);
    }

    public function detail_pnj_susu_olahan()
    {
        $cek_jenis = $this->uri->segment(2);
        if ($cek_jenis == 'detail_pnj_susu_olahan') {
            $jenis = 'susu_olahan';
        } else {
            $jenis = 'susu_murni';
        }
        $pnj_susu = $this->input->post('pnj_susu');
        $prod_susu = $this->input->post('prod_susu');
        $jumlah_lt = $this->input->post('jumlah_lt');
        $tanggal = $this->input->post('tanggal');

        $this->db->where('no_produk', $prod_susu);
        $get_produk = $this->db->get('produk')->row();
        $harga_satuan = $get_produk->harga_jual;
        $subtotal = $jumlah_lt * $harga_satuan;
        // print_r($get_produk);exit;

        $this->db->where('kd_pnj_susu', $pnj_susu);
        $this->db->where('jenis_pnj_susu', $jenis);
        $cek = $this->db->get('pnj_susu')->num_rows();

        $this->db->where('kd_pnj_susu', $pnj_susu);
        $this->db->where('kd_produk', $prod_susu);
        $cek_detail =$this->db->get('detail_pnj_susu')->row();

        // print_r($cek);exit;

        if ($cek == 0) {
            $pnj = [
                'kd_pnj_susu' => $pnj_susu,
                'status' => 'on proses',
                'tanggal' => $tanggal,
                'jenis_pnj_susu' => $jenis,
            ];
            $this->db->insert('pnj_susu', $pnj);

            $detail = [
                'kd_pnj_susu' => $pnj_susu,
                'kd_produk' => $prod_susu,
                'nm_produk' => $get_produk->nama_produk,
                'jml_liter' => $jumlah_lt,
                'harga_satuan' => $harga_satuan,
                'subtotal' => $subtotal,
            ];
            $this->db->insert('detail_pnj_susu', $detail);
        } else {
            if (empty($cek_detail->kd_produk)) {
                # code...
                $detail = [
                    'kd_pnj_susu' => $pnj_susu,
                    'kd_produk' => $prod_susu,
                    'nm_produk' => $get_produk->nama_produk,
                    'jml_liter' => $jumlah_lt,
                    'harga_satuan' => $harga_satuan,
                    'subtotal' => $subtotal,
                ];
                $this->db->insert('detail_pnj_susu', $detail);
            } else {
                # code...
                $hasil = $cek_detail->jml_liter + $jumlah_lt;
                $update_harga = $cek_detail->harga_satuan * $hasil;
                
                $update = [
                    'jml_liter' => $hasil,
                    'subtotal' => $update_harga,
                ];
                $this->db->where('kd_pnj_susu', $pnj_susu);
                $this->db->where('kd_produk', $prod_susu);
                $this->db->update('detail_pnj_susu', $update);
            }
            
        }
        redirect('penjualan/form_pengolahan_susu');
    }

    public function pakan_konsentrat()
    {
        $this->db->where('jenis_pnj_susu', 'pakan_konsentrat');
        $list = $this->db->get('pnj_susu')->result();
        $data = [
            'list' => $list,
        ];
        $this->template->load('template', 'penjualan/pakan_konsentrat/index', $data);
    }
    
    public function form_pakan_konsentrat()
    {
        $jenis = 'pakan_konsentrat';
        $kode = $this->Penjualan_model->kd_pakan_konsentrat();
        $prod_susu = $this->Penjualan_model->type_susu($jenis)->result();
        $this->db->where('kd_pnj_susu', $kode);
        $detail = $this->db->get('detail_pnj_susu')->result();
        $total = $this->Penjualan_model->total_detail_pnj($kode)->row()->total;
        // print_r($prod_susu);exit;
        $this->db->where('is_deactive', 0);
        $anggota = $this->db->get('peternak')->result();
        $data = [
            'produk' => $prod_susu, 
            'kode' => $kode, 
            'detail' => $detail,
            'total1' => $total,
            'anggota' => $anggota,
        ];
        $this->template->load('template', 'penjualan/pakan_konsentrat/add', $data);
    }

    public function detail_pakan_konsentrat()
    {
        $cek_jenis = $this->uri->segment(2);
        if ($cek_jenis == 'detail_pakan_konsentrat') {
            $jenis = 'pakan_konsentrat';
        }

        $pnj_susu = $this->input->post('pnj_susu');
        $prod_susu = $this->input->post('prod_susu');
        $jumlah_lt = $this->input->post('jumlah_lt');
        $tanggal = $this->input->post('tanggal');

        $this->db->where('no_produk', $prod_susu);
        $get_produk = $this->db->get('produk')->row();
        $harga_satuan = $get_produk->harga_jual;
        $subtotal = $jumlah_lt * $harga_satuan;
        // print_r($get_produk);exit;

        $this->db->where('kd_pnj_susu', $pnj_susu);
        $this->db->where('jenis_pnj_susu', $jenis);
        $cek = $this->db->get('pnj_susu')->num_rows();

        $this->db->where('kd_pnj_susu', $pnj_susu);
        $this->db->where('kd_produk', $prod_susu);
        $cek_detail =$this->db->get('detail_pnj_susu')->row();

        // print_r($cek);exit;

        if ($cek == 0) {
            $pnj = [
                'kd_pnj_susu' => $pnj_susu,
                'status' => 'on proses',
                'tanggal' => $tanggal,
                'jenis_pnj_susu' => $jenis,
            ];
            $this->db->insert('pnj_susu', $pnj);

            $detail = [
                'kd_pnj_susu' => $pnj_susu,
                'kd_produk' => $prod_susu,
                'nm_produk' => $get_produk->nama_produk,
                'jml_liter' => $jumlah_lt,
                'harga_satuan' => $harga_satuan,
                'subtotal' => $subtotal,
            ];
            $this->db->insert('detail_pnj_susu', $detail);
        } else {
            if (empty($cek_detail->kd_produk)) {
                # code...
                $detail = [
                    'kd_pnj_susu' => $pnj_susu,
                    'kd_produk' => $prod_susu,
                    'nm_produk' => $get_produk->nama_produk,
                    'jml_liter' => $jumlah_lt,
                    'harga_satuan' => $harga_satuan,
                    'subtotal' => $subtotal,
                ];
                $this->db->insert('detail_pnj_susu', $detail);
            } else {
                # code...
                $hasil = $cek_detail->jml_liter + $jumlah_lt;
                $update_harga = $cek_detail->harga_satuan * $hasil;
                
                $update = [
                    'jml_liter' => $hasil,
                    'subtotal' => $update_harga,
                ];
                $this->db->where('kd_pnj_susu', $pnj_susu);
                $this->db->where('kd_produk', $prod_susu);
                $this->db->update('detail_pnj_susu', $update);
            }
            
        }
        redirect('penjualan/form_pakan_konsentrat');
    }

    public function harga_pokok()
    {
        $kode = $this->M_transaksi->kode_hpp();
        $list = $this->db->get('transaksi_hpp')->result();
        $jenis_pnj = $this->db->get('jenis_penjualan')->result();
        $data = [
            'kode' => $kode,
            'jenis' => $jenis_pnj,
            'list' => $list,
        ];
        $this->template->load('template', 'penjualan/hpp/index', $data);
    }

    public function save_hpp()
    {
        $kode = $this->input->post('kode');
        $hpp = $this->input->post('hpp');
        $nominal = $this->input->post('nominal');
        $data = [
            'kode_trans' => $kode, 
            'tanggal' => date('Y-m-d'), 
            'deskripsi' => $hpp, 
            'nominal' => $nominal, 
        ];
        // print_r($hpp);exit;
        $this->db->insert('transaksi_hpp', $data);

        // insert jurnal
        if ($hpp == 'susu murni') {
            $hpp = [
                'id_jurnal' => $kode,
                'tgl_jurnal' => date('Y-m-d'),
                'no_coa' => 6113,
                'posisi_dr_cr' => 'd',
                'nominal' => $nominal,
            ];
            $this->db->insert('jurnal', $hpp);
    
            $pers_brg_dgng = [
                'id_jurnal' => $kode,
                'tgl_jurnal' => date('Y-m-d'),
                'no_coa' => 1411,
                'posisi_dr_cr' => 'k',
                'nominal' => $nominal,
            ];
            $this->db->insert('jurnal', $pers_brg_dgng);
        } else if ($hpp == 'pakan konsentrat') {
            $hpp = [
                'id_jurnal' => $kode,
                'tgl_jurnal' => date('Y-m-d'),
                'no_coa' => 6113,
                'posisi_dr_cr' => 'd',
                'nominal' => $nominal,
            ];
            $this->db->insert('jurnal', $hpp);
    
            $pers_brg_dgng = [
                'id_jurnal' => $kode,
                'tgl_jurnal' => date('Y-m-d'),
                'no_coa' => 1412,
                'posisi_dr_cr' => 'k',
                'nominal' => $nominal,
            ];
            $this->db->insert('jurnal', $pers_brg_dgng);
        } else {
            $hpp = [
                'id_jurnal' => $kode,
                'tgl_jurnal' => date('Y-m-d'),
                'no_coa' => 6113,
                'posisi_dr_cr' => 'd',
                'nominal' => $nominal,
            ];
            $this->db->insert('jurnal', $hpp);
    
            $pers_brg_dgng = [
                'id_jurnal' => $kode,
                'tgl_jurnal' => date('Y-m-d'),
                'no_coa' => 1413,
                'posisi_dr_cr' => 'k',
                'nominal' => $nominal,
            ];
            $this->db->insert('jurnal', $pers_brg_dgng);
        }

        redirect('penjualan/harga_pokok');
    }
}
?>