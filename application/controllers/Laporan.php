<?php 
class Laporan extends CI_Controller
{
    public function __construct() {
        parent::__construct();
        $this->load->model('Produk_model', 'produk');
        $this->load->model('Laporan_model', 'laporan');
    }

    public function buku_pembantu_kas()
    {
        $bulantahun = $this->input->get("bulantahun") ?? "";
        if ($bulantahun != "") {
            $list = $this->db->query('SELECT * FROM buku_pembantu_kas WHERE tanggal LIKE "'.$bulantahun.'%"')->result();
        } else {
            $list = $this->db->query('SELECT * FROM buku_pembantu_kas WHERE tanggal LIKE "sawdojaw"')->result();
        }
        $data = [
            'list' => $list,
            "bulantahun" => $bulantahun
        ];
        $this->template->load('template', 'buku_pembantu_kas', $data);
    }

    public function buku_pembantu_bank()
    {
        $bulantahun = $this->input->get("bulantahun") ?? "-";
        $list = $this->db->query("SELECT * FROM buku_pembantu_bank WHERE tanggal LIKE '".$bulantahun."%'")->result();
        $data = [
            'list' => $list,
            "bulantahun"=>$bulantahun,
        ];
        $this->template->load('template', 'buku_pembantu_bank', $data);
    }

    public function laporan_arus_kas()
    {
        $bulantahun = $this->input->get("bulantahun") ?? "-";
        $total_d = $this->db->query("select sum(nominal) as total from buku_pembantu_kas where posisi_dr_cr = 'd' AND tanggal LIKE '".$bulantahun."%' ")->row()->total;
        $total_k = $this->db->query("select sum(nominal) as total from buku_pembantu_kas where posisi_dr_cr = 'k' AND tanggal LIKE '".$bulantahun."%' ")->row()->total;
        $kas_debit = $this->db->query("SELECT SUM(nominal) as nominal_total FROM jurnal WHERE no_coa = '1111' AND posisi_dr_cr = 'd' AND tgl_jurnal LIKE '".$bulantahun."%'")->result()[0]->nominal_total;
        $kas_kredit = $this->db->query("SELECT SUM(nominal) as nominal_total FROM jurnal WHERE no_coa = '1111' AND posisi_dr_cr = 'k' AND tgl_jurnal LIKE '".$bulantahun."%'")->result()[0]->nominal_total;
        $kas_diterima = $kas_debit - $kas_kredit;
        $laporanNeraca = $this->laporan->getLaporanNeraca();

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
        $saldobank = 0;
        foreach ($kasbank as $kas) {
            if ($kas->posisi_dr_cr == "k") {
                $saldobank -= $kas->nominal;
            } else {
                $saldobank += $kas->nominal;
            }
        }

        $bebanlist = $this->db->query("SELECT * FROM jurnal WHERE tgl_jurnal LIKE '$bulantahun%' AND no_coa LIKE '5%' AND no_coa NOT LIKE '50%'")->result();
        $beban_total = 0;
        foreach ($bebanlist as $bebanz) {
            $beban_total += $bebanz->nominal;
        }

        $pembelianlist = $this->db->query("SELECT * FROM jurnal WHERE tgl_jurnal LIKE '$bulantahun%' AND no_coa LIKE '5000'")->result();
        $pembelian_total = 0;
        foreach ($pembelianlist as $pembelian) {
            $pembelian_total += $pembelian->nominal;
        }

        $pnjaktivalist = $this->db->query("SELECT * FROM jurnal WHERE tgl_jurnal LIKE '$bulantahun%' AND no_coa = '4117'")->result();
        $pnjaktiva_total = 0;
        foreach ($pnjaktivalist as $pnjaktiva) {
            $pnjaktiva_total += $pnjaktiva->nominal;
        }

        $pmbaktivalist = $this->db->query("SELECT * FROM jurnal WHERE tgl_jurnal LIKE '$bulantahun%' AND no_coa = '5100' OR no_coa = '1214' OR no_coa = '1215'")->result();
        $pmbaktiva_total = 0;
        foreach ($pmbaktivalist as $pmbaktiva) {
            $pmbaktiva_total += $pmbaktiva->nominal;
        }

        $modallist = $this->db->query("SELECT * FROM jurnal WHERE tgl_jurnal LIKE '$bulantahun%' AND no_coa = '3000'")->result();
        $modal_total = 0;
        foreach ($modallist as $modal) {
            $modal_total += $modal->nominal;
        }

        $privelist = $this->db->query("SELECT * FROM jurnal WHERE tgl_jurnal LIKE '$bulantahun%' AND no_coa = '3101'")->result();
        $prive_total = 0;
        foreach ($privelist as $prive) {
            $prive_total += $prive->nominal;
        }

        $pinjamanbanklist = $this->db->query("SELECT * FROM jurnal WHERE tgl_jurnal LIKE '$bulantahun%' AND no_coa = '4212'")->result();
        $pinjamanbank_total = 0;
        foreach ($pinjamanbanklist as $pinjamanbank) {
            $pinjamanbank_total += $pinjamanbank->nominal;
        }

        $angsuranpinjamanlist = $this->db->query("SELECT * FROM jurnal WHERE tgl_jurnal LIKE '$bulantahun%' AND no_coa = '2113'")->result();
        $angsuranpinjaman_total = 0;
        foreach ($angsuranpinjamanlist as $angsuranpinjaman) {
            $angsuranpinjaman_total += $angsuranpinjaman->nominal;
        }

        $data = [
            'kas_diterima' => $kas_diterima,
            'pmb' => $pmb,
            'beban' => $beban,
            'bulantahun' => $bulantahun,
            'kaskecil'=>10000000,
            'kasbank'=>$saldobank,
            'pengeluaranbeban'=>$beban_total,
            'pembelian'=>$pembelian_total,
            'pnj_aktiva'=>$pnjaktiva_total,
            'pmb_aktiva'=>$pmbaktiva_total,
            'modal'=>$modal_total,
            'prive'=>$prive_total,
            'pinjamanbank'=>$pinjamanbank_total,
            'angsuranpinjaman'=>$angsuranpinjaman_total,
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
       
        $bulan = $this->input->post('bulan');
        $tahun = $this->input->post('tahun');
        $periode = $tahun.'-'.$bulan;
        $saldo_awal = $this->db->query("SELECT * FROM coa WHERE no_coa = '1111'")->result()[0]->saldo_awal;

        if (isset($periode)) {
            $list = [];
            $qgetcoa = "SELECT * FROM coa WHERE is_neraca = 1";
            $coas = $this->db->query($qgetcoa)->result();
            foreach ($coas as $coa) {
                $data = [
                    "no_coa"=>$coa->no_coa,
                    "nama_coa"=>$coa->nama_coa,
                    "header"=>$coa->header,
                    "saldo_normal"=>$coa->saldo_normal,
                    "nominal"=>0,
                ];
                $qgetjurnalitem = "SELECT a.no_coa, b.nama_coa, a.posisi_dr_cr, b.header, a.nominal FROM jurnal a LEFT JOIN coa b ON b.no_coa = a.no_coa WHERE b.is_neraca = 1 AND a.no_coa = '".$coa->no_coa."' ORDER BY a.nominal DESC";
                $jurnalItems = $this->db->query($qgetjurnalitem)->result();
                foreach ($jurnalItems as $k=>$jurnal) {
                    if ($jurnal->posisi_dr_cr == "k") {
                        $data["nominal"] -= $jurnal->nominal;
                    } else {
                        $data["nominal"] += $jurnal->nominal;
                    }
                }
                if ($coa->saldo_normal == "k") {
                    $data["nominal"] = 0 - $data["nominal"];
                }
                /* if ($coa->no_coa == '1312') {
                    echo $coa->no_coa;
                    $data["nominal"] = 0-$data["nominal"];
                } */
                array_push($list, (object)$data);
            }
            $q = "SELECT a.no_coa, b.nama_coa, a.posisi_dr_cr, b.header, a.nominal FROM jurnal a LEFT JOIN coa b ON b.no_coa = a.no_coa WHERE b.is_neraca = 1 AND a.no_coa = '1312'";
            $data = [
                'list' => $list,
                'periode' => $periode,
                'saldo_awal' => $saldo_awal,
            ];
            $this->template->load('template', 'laporan/neraca_saldo', $data);
        } 
    
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
        $tahun = $this->input->get('tahun') ?? date("Y");
        $listPendapatan = $this->db->query('SELECT SUM(nominal) AS nominal, b.nama_coa, a.posisi_dr_cr
        from jurnal a
        JOIN coa b ON a.no_coa = b.no_coa
        WHERE header = 4
        AND is_waserda = 1
        AND tgl_jurnal LIKE "'.$tahun.'%"')->result();
        $listHPP = $this->db->query('SELECT SUM(nominal) AS nominal, b.nama_coa, a.posisi_dr_cr
        from jurnal a
        JOIN coa b ON a.no_coa = b.no_coa
        WHERE header = 6
        AND is_waserda = 1
        AND tgl_jurnal LIKE "'.$tahun.'%"')->result();
        $listBeban = $this->db->query('SELECT b.nama_coa, a.posisi_dr_cr, SUM(nominal) AS nominal
        from jurnal a
        JOIN coa b ON a.no_coa = b.no_coa
        WHERE header = 5
        AND is_waserda = 1 
        AND posisi_dr_cr = "d"
        AND is_beban = 1
        GROUP BY nama_coa
        AND tgl_jurnal LIKE "'.$tahun.'%"')->result();
        $data = [
            'pendapatan' => $listPendapatan,
            'beban' => $listBeban,
            'hpp' => $listHPP,
            'tahun'=>$tahun,
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

    public function saldo_kas_kecil_lalu($bulantahun) {
        // check if bulantahun is less than this year
        if ($bulantahun < date("Y")) {
            return 0;
        }
        $list = $this->db->query("SELECT * FROM jurnal JOIN penerimaan_pengeluaran_kas a ON a.no_dokumen = id_jurnal WHERE no_coa = '1117' AND tgl_jurnal LIKE '".$bulantahun."%'")->result();
        $bulantahunb4 = date("Y-m", strtotime("-1 month", strtotime($bulantahun)));
        array_unshift($list, (object)[
            "no" => "",
            "id_jurnal" => "Saldo Awal",
            "tgl_jurnal" => "-",
            "no_coa" => "",
            "nominal"  => $this->saldo_kas_kecil_lalu($bulantahunb4),
            "posisi_dr_cr"=> "d",
            "deskripsi"=>"Saldo Awal"
        ]);
        $total = 0;
        foreach ($list as $v) {
            if ($v->posisi_dr_cr == "d") {
                $total += $v->nominal;
            } else {
                $total -= $v->nominal;
            }
        }
        return $total;
    }

    // salma 
    public function buku_kas_kecil()
    {
        $bulantahun = $this->input->get('bulantahun') ?? "-";
        //bulan tahun decrease 1 month
        $bulan_tahun_decrease = date("Y-m", strtotime("-1 month", strtotime($bulantahun)));
        
        $this->db->order_by('tgl_transaksi', 'desc');
        $kaskecil = $this->db->query("SELECT * FROM jurnal JOIN penerimaan_pengeluaran_kas a ON a.no_dokumen = id_jurnal WHERE no_coa = '1117' AND tgl_jurnal LIKE '".$bulantahun."%'")->result()[0] ?? null;
        $list = $this->db->query("SELECT * FROM jurnal JOIN penerimaan_pengeluaran_kas a ON a.no_dokumen = id_jurnal WHERE no_coa = '1117' AND tgl_jurnal LIKE '".$bulantahun."%'")->result();
        $list_b4 = $this->db->query("SELECT * FROM jurnal JOIN penerimaan_pengeluaran_kas a ON a.no_dokumen = id_jurnal WHERE no_coa = '1117' AND tgl_jurnal LIKE '".$bulan_tahun_decrease."%'")->result();
        
        $total = 0;
        foreach ($list_b4 as $v) {
            if ($v->posisi_dr_cr == "d") {
                $total += $v->nominal;
            } else {
                $total -= $v->nominal;
            }
        }

        array_unshift($list, (object)[
            "no" => "",
            "id_jurnal" => "",
            "tgl_jurnal" => "",
            "nominal" => $this->saldo_kas_kecil_lalu($bulan_tahun_decrease),
            "no_coa" => "",
            "posisi_dr_cr"=> "d",
            "deskripsi"=>"Saldo Awal"
        ]);

        $data = [
            'list' => $list,
            'kaskecil' => $kaskecil,
            "bulantahun"=>$bulantahun,
        ];
        $this->template->load('template', 'laporan/buku_kas_kecil', $data);
    }

    public function tes() {
        $ptrnk = $this->db->query("SELECT * FROM peternak")->result();
        $pgw = $this->db->query("SELECT * FROM pegawai")->result();
        $id = "ANGGT_0001";
        $no = 0;
        foreach ($ptrnk as $v) {
            $no++;
            $this->db->update("peternak", [
                "no_anggota"=>"ANGGT_".sprintf("%04d", $no)
            ],[
                "no_peternak"=>$v->no_peternak
            ]);
        }
        foreach ($pgw as $v) {
            $no++;
            $this->db->update("pegawai", [
                "no_anggota"=>"ANGGT_".sprintf("%04d", $no)
            ],[
                "nip"=>$v->nip
            ]);
        }
    }
    

    public function laporan_neraca()
    {
        $tahun = $this->input->get("tahun") ?? date("Y");
        $data = $this->laporan->getLaporanNeracaYear($tahun);
        $data["tahun"] = $tahun;
        $this->template->load('template', 'laporan/laporan_neraca', $data);
    }
}
?>