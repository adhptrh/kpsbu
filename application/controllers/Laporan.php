<?php 
class Laporan extends CI_Controller
{

    public function __construct() {
        parent::__construct();
        $this->load->model('Produk_model', 'produk');
    }

    public function buku_pembantu_kas()
    {
        $bulantahun = $this->input->get("bulantahun") ?? date("Y-m");
        $list = $this->db->query('SELECT * FROM buku_pembantu_kas WHERE tanggal LIKE "'.$bulantahun.'%"')->result();
        $data = [
            'list' => $list,
            "bulantahun" => $bulantahun
        ];
        $this->template->load('template', 'buku_pembantu_kas', $data);
    }

    public function buku_pembantu_bank()
    {
        $bulantahun = $this->input->get("bulantahun") ?? date("Y-m");
        $list = $this->db->query("SELECT * FROM buku_pembantu_bank WHERE tanggal LIKE '".$bulantahun."%'")->result();
        $data = [
            'list' => $list,
            "bulantahun"=>$bulantahun,
        ];
        $this->template->load('template', 'buku_pembantu_bank', $data);
    }

    public function laporan_arus_kas()
    {
        $bulantahun = $this->input->get("bulantahun") ?? date('Y-m');
        $total_d = $this->db->query("select sum(nominal) as total from buku_pembantu_kas where posisi_dr_cr = 'd' AND tanggal LIKE '".$bulantahun."%' ")->row()->total;
        $total_k = $this->db->query("select sum(nominal) as total from buku_pembantu_kas where posisi_dr_cr = 'k' AND tanggal LIKE '".$bulantahun."%' ")->row()->total;
        $kas_diterima = $total_d - $total_k;

        $pmb = $this->db->query("SELECT
        SUM(nominal) as total
        FROM jurnal a
        JOIN coa b ON a.no_coa = b.no_coa
        WHERE b.header = 5
        AND nama_coa LIKE '%pembelian%'")->row()->total;

        $beban = $this->db->query("SELECT
        SUM(nominal) as total, 
        nama_coa
        FROM jurnal a
        JOIN coa b ON a.no_coa = b.no_coa
        WHERE b.header = 5
        AND is_arus_kas = 1
        GROUP BY a.no_coa")->result();
        // print_r($kas_diterima);exit;

        $kasbank = $this->db->query("SELECT * FROM buku_pembantu_bank WHERE tanggal LIKE '".$bulantahun."%'")->result();


        $data = [
            'kas_diterima' => $kas_diterima,
            'pmb' => $pmb,
            'beban' => $beban,
            'bulantahun' => $bulantahun,
            'kaskecil'=>0,
            'kasbank'=>0,
            'pengeluaranbeban'=>0,
        ];

        $this->template->load('template', 'arus_kas', $data);
    }

    // sarah
    public function laporan_penjualan_shu()
    {
        $susu_murni = $this->db->query("SELECT * FROM pnj_susu WHERE jenis_pnj_susu = 'susu_murni'")->result();
        $pakan_konsentrat = $this->db->query("SELECT * FROM pnj_susu WHERE jenis_pnj_susu = 'pakan_konsentrat'")->result();
        $susu_olahan = $this->db->query("SELECT * FROM pnj_susu WHERE jenis_pnj_susu = 'susu_olahan'")->result();
        $total_pbj = $this->db->query("SELECT SUM(total) AS total_penjualan FROM pnj_susu")->row()->total_penjualan;
        $data = [
            'susu_murni' => $susu_murni,
            'susu_olahan' => $susu_olahan,
            'pakan_konsentrat' => $pakan_konsentrat,
            'total' => $total_pbj
        ];

        $this->template->load('template', 'shu/laporan_penjualan_shu/index', $data);
    }

    public function neraca_saldo()
    {
        $this->template->load('template', 'laporan/neraca_saldo');
    }

    public function laporan_simpanan()
    {
        // $list = $this->db->query("SELECT 
        // z.nama_peternak, 
        // z.no_peternak, 
        // z.deposit, 
        // x.total_liter, 
        // x.total_harga, 
        // x.total_masuka, 
        // x.total_simpanan_wajib
        // FROM peternak z
        // LEFT JOIN (
        //     SELECT a.no_peternak, 
        //     a.nama_peternak, 
        //     a.deposit, 
        //     sum(b.jumlah_liter_susu) AS total_liter, 
        //     sum(b.jumlah_harga_susu) AS total_harga, 
        //     sum(b.simpanan_masuka) AS total_masuka, 
        //     sum(b.simpanan_wajib) AS total_simpanan_wajib, 
        //     c.total_bayar, 
        //     c.tgl_transaksi
        //     FROM peternak a 
        //     LEFT JOIN log_pembayaran_susu b ON a.no_peternak = b.id_anggota
        //     LEFT JOIN pembayaran_susu c ON b.id_pembayaran = c.kode_pembayaran
        //     WHERE left(tgl_transaksi, 4) = '$year'
        //     GROUP BY nama_peternak
        // ) AS x ON z.no_peternak = x.no_peternak
        // WHERE z.is_deactive = 0")->result();
        $list = $this->M_transaksi->data_laporan_shu()->result();
        // print_r($list);exit;
        $data = [
            'list' => $list,
        ];
        $this->template->load('template', 'laporan_simpanan', $data);
    }

    // siti 
    public function laporan_penjualan_waserda()
    {
        $bulan = $this->input->post('bulan');
        $tahun = $this->input->post('tahun');

        $periode = $tahun.'-'.$bulan;

        $show_all = $this->input->post('show_all');
        // print_r($show_all);exit;

        if (isset($periode)) {
            $list = $this->db->query("SELECT * FROM pos_penjualan 
            WHERE LEFT(tanggal, 7) = '$periode'")->result();
            $data = [
                'list' => $list, 
            ];
            $this->template->load('template', 'laporan/laporan_penjualan_waserda', $data);
        }
    }

    public function laporan_pmb_waserda()
    {
        $bulan = $this->input->post('bulan');
        $tahun = $this->input->post('tahun');

        $periode = $tahun.'-'.$bulan;

        $show_all = $this->input->post('show_all');
        // print_r($show_all);exit;

        if (isset($periode)) {
            $list = $this->db->query("SELECT * FROM pos_pembelian 
            WHERE LEFT(tanggal, 7) = '$periode'")->result();
            $data = [
                'list' => $list, 
            ];
            $this->template->load('template', 'laporan/laporan_pmb_waserda', $data);
        }
    }

    public function laba_rugi()
    {
        $listPendapatan = $this->db->query('SELECT SUM(nominal) AS nominal, b.nama_coa, a.posisi_dr_cr
        from jurnal a
        JOIN coa b ON a.no_coa = b.no_coa
        WHERE header = 4
        AND is_waserda = 1')->result();
        $listHPP = $this->db->query('SELECT SUM(nominal) AS nominal, b.nama_coa, a.posisi_dr_cr
        from jurnal a
        JOIN coa b ON a.no_coa = b.no_coa
        WHERE header = 6
        AND is_waserda = 1')->result();
        $listBeban = $this->db->query('SELECT b.nama_coa, a.posisi_dr_cr, SUM(nominal) AS nominal
        from jurnal a
        JOIN coa b ON a.no_coa = b.no_coa
        WHERE header = 5
        AND is_waserda = 1 
        AND posisi_dr_cr = "d"
        GROUP BY nama_coa')->result();
        $data = [
            'pendapatan' => $listPendapatan,
            'beban' => $listBeban,
            'hpp' => $listHPP,
        ];
        // print_r($data);exit;
        $this->template->load('template', 'laporan/laba_rugi', $data);
    }

    public function kartu_stok()
    {
        $kode = $this->input->post('nama_brg');
        $periode = $this->input->post('periode');
        if (isset($kode, $periode)) {
            $this->db->where('status', 1);
            $getProduk = $this->db->get('waserda_produk')->result();

            $getKartuStok = $this->db->query("select * from waserda_kartu_stok where kode = '$kode' and left(tgl_transaksi, 7) = '$periode'")->result();
            $data = [
                'produk' => $getProduk, 
                'kartu_stok' => $getKartuStok,
            ];
            $this->template->load('template', 'laporan/kartu_stok', $data);
        } else {
            $this->db->where('status', 1);
            $getProduk = $this->db->get('waserda_produk')->result();

            $getKartuStok = $this->db->query("select * from waserda_kartu_stok where kode = '$kode' and left(tgl_transaksi, 7) = '$periode'")->result();
            $data = [
                'produk' => $getProduk, 
                'kartu_stok' => $getKartuStok,
            ];
            $this->template->load('template', 'laporan/kartu_stok', $data);
        }
        
    }

    // salma 
    public function buku_kas_kecil()
    {
        $bulantahun = $this->input->get('bulantahun') ?? date("Y-m");
        
        $this->db->order_by('tgl_transaksi', 'desc');
        $kaskecil = $this->db->query("SELECT * FROM jurnal JOIN penerimaan_pengeluaran_kas a ON a.no_dokumen = id_jurnal WHERE no_coa = '1117' AND tgl_jurnal LIKE '".$bulantahun."%'")->result()[0] ?? null;
        $list = $this->db->query("SELECT * FROM jurnal JOIN penerimaan_pengeluaran_kas a ON a.no_dokumen = id_jurnal WHERE no_coa = '1117' AND tgl_jurnal LIKE '".$bulantahun."%'")->result();
        $data = [
            'list' => $list,
            'kaskecil' => $kaskecil,
            "bulantahun"=>$bulantahun,
        ];
        $this->template->load('template', 'laporan/buku_kas_kecil', $data);
    }
}
?>