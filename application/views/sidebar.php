<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
    <div class="menu_section">
        <h3>List Menu</h3>
        <ul class="nav side-menu">
        <li><a href="<?php echo site_url(); ?>c_masterdata/beranda"><i class="fa fa-home"></i> Home </a>
        </li>
        </ul>
        <!-- <ul class="nav side-menu">
        <li><a href="<?= base_url('Absensi')?>"><i class="fa fa-home"></i> Absensi </a>
        </li>
        </ul> -->
        <?php if (!empty($this->session->userdata('level'))) : ?>
            <?php if (
                $this->session->userdata('level') == "admin" or 
                $this->session->userdata('level') == "produksi1" or 
                $this->session->userdata('level') == "produksi2" or 
                $this->session->userdata('level') == "penjualan" or 
                $this->session->userdata('level') == "keuangan1" or 
                $this->session->userdata('level') == "keuangan2" or 
                $this->session->userdata('level') == "keuangan3" or
                $this->session->userdata('level') == "atasan" 
                ) : ?>
                <ul class="nav side-menu">
                    <li>
                        <a>
                        <i class="fa fa-bar-chart-o"></i>HRD <span class="fa fa-chevron-down"></span>
                        </a>
                        <ul class="nav child_menu">
                        <?php if (
                            $this->session->userdata('level') == "hrd" or 
                            $this->session->userdata('level') == "admin"
                            ) : ?>
                            <li><a href="<?= base_url('Penggajian')?>">Penggajian </a></li>
                            <li><a href="<?= base_url('Shift')?>">Jadwal Shift </a></li>
                            <li><a href="<?= base_url('Cuti')?>">Pengajuan Cuti </a></li>
                            <li><a href="<?= base_url('Lembur')?>">Pengajuan Lembur </a></li>
                            <li><a href="<?= base_url('Penggajian/tunjanganhariraya')?>">Tunjangan Hari Raya </a></li>
                            <li><a href="<?= base_url('Pengajuan/pengajuanBonus')?>">Pengajuan Bonus </a></li>
                            <li><a href="<?= base_url('Cuti/melahirkan')?>">Cuti Melahirkan</a></li>
                        <?php
                        endif
                        ?>
                        <?php if (
                            $this->session->userdata('level') == "atasan"
                            ) : ?>
                            <li><a href="<?= base_url('Lembur')?>">Pengajuan Lembur </a></li>
                        <?php
                        endif
                        ?>
                        </ul>
                    </li>
                </ul>
            <?php endif ?>
        <?php endif ?>

        <!-- <ul class="nav side-menu">
        <li><a href="<?= base_url('Penggajian')?>"><i class="fa fa-home"></i> Penggajian </a></li>
        </ul>
        <ul class="nav side-menu">
        <li><a href="<?= base_url('Shift')?>"><i class="fa fa-home"></i> Jadwal Shift </a></li>
        </ul>
        <ul class="nav side-menu">
        <li><a href="<?= base_url('Cuti')?>"><i class="fa fa-home"></i> Cuti </a></li>
        </ul>
        <ul class="nav side-menu">
        <li><a href="<?= base_url('Lembur')?>"><i class="fa fa-home"></i> Lembur </a></li>
        </ul> -->
        
        <?php if ($this->session->userdata('level') == "admin" or $this->session->userdata('level') == "produksi1" or $this->session->userdata('level') == "produksi2" or $this->session->userdata('level') == "penjualan" or $this->session->userdata('level') == "keuangan3" or $this->session->userdata('level') == "keuangan1" or $this->session->userdata('level') == "keuangan2" or $this->session->userdata('level') == "arles") : ?>
        <ul class="nav side-menu">
            <li>
                <a><i class="fa fa-table"></i> Master Data <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                    <?php if ($this->session->userdata('level') == "admin") : ?>
                    <li><a href="<?php echo base_url('c_masterdata/aktivitas'); ?>">Aktivitas</a></li>
                    <li><a href="<?php echo base_url('Produk'); ?>">Produk Waserda</a></li>
                    <li><a href="<?php echo base_url('Kategori')?>">Kategori Produk</a></li>
                    <li><a href="<?= base_url('Supplier_produk')?>">Supplier Produk</a></li>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/lihat_coa">COA</a></li>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/aset">Aset</a></li>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/lihat_bb">Bahan Baku</a></li>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/lihat_bp">Bahan Penolong</a></li>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/lihat_bdp">Produk Dalam Proses</a></li>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/lihat_peternak">Anggota</a></li>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/simpanan">Simpanan</a></li>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/lihat_supp_bp">Supplier Bahan Penolong</a></li>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/supplier_aset">Supplier Aset</a></li>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/lihat_produk">Produk</a></li>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/lihat_jbop">Jenis BOP</a></li>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/lihat_bom">BOM</a></li>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/lihat_bop">BOP</a></li>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/lihat_bopo">BOP</a></li>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/lihat_btk">BTKL</a></li>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/lihat_btko">BTKL</a></li>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/lihat_ips">Konsumen IPS</a></li>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/tps">TPS</a></li>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/alokasi_shu">Alokasi SHU</a></li>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/bank">Bank</a></li>

                    <li><a href="<?= base_url('c_masterdata/pegawai')?>"> Pegawai </a></li>
                    <li><a href="<?= base_url('c_masterdata/ptkp')?>"> PTKP </a></li>
                    <li><a href="<?= base_url('c_masterdata/jabatan')?>"> Jabatan </a></li>
                    <li><a href="<?= base_url('c_masterdata/jenis_pegawai')?>"> Jenis Pegawai </a></li>
                    <li><a href="<?= base_url('c_masterdata/shift')?>"> Shift </a></li>
                    
                    <!-- md arles -->
                    <?php elseif ($this->session->userdata('level') == "arles") : ?>
                    <li><a href="<?= base_url('c_masterdata/pegawai')?>"> Pegawai </a></li>
                    <li><a href="<?= base_url('c_masterdata/ptkp')?>"> PTKP </a></li>
                    <li><a href="<?= base_url('c_masterdata/jabatan')?>"> Jabatan </a></li>
                    <li><a href="<?= base_url('c_masterdata/jenis_pegawai')?>"> Jenis Pegawai </a></li>
                    <li><a href="<?= base_url('c_masterdata/shift')?>"> Shift </a></li>

                    <?php elseif ($this->session->userdata('level') == "produksi1") : ?>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/lihat_bb">Bahan Baku</a></li>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/lihat_peternak">Peternak</a></li>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/lihat_bom">BOM</a></li>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/lihat_jbop">Jenis BOP</a></li>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/lihat_bop">BOP</a></li>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/lihat_btk">BTKL</a></li>
                    <?php elseif ($this->session->userdata('level') == "produksi2") : ?>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/lihat_bp">Bahan Penolong</a></li>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/lihat_supp_bp">Supplier Bahan Penolong</a></li>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/lihat_bdp">Produk Dalam Proses</a></li>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/lihat_bom">BOM</a></li>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/lihat_bopo">BOP</a></li>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/lihat_btko">BTKL</a></li>
                    <?php
                    elseif ($this->session->userdata('level') == "penjualan") :
                    ?>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/lihat_produk">Produk</a></li>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/lihat_ips">Konsumen IPS</a></li>
                    <?php
                    elseif ($this->session->userdata('level') == "keuangan3") :
                    ?>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/lihat_coa">COA</a></li>
                    <?php
                    elseif ($this->session->userdata('level') == "keuangan1") :
                    ?>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/lihat_coa">COA</a></li>
                    <?php
                    elseif ($this->session->userdata('level') == "keuangan2") :
                    ?>
                    <li><a href="<?php echo site_url(); ?>c_masterdata/lihat_coa">COA</a></li>
                    <?php

                    endif
                    ?>
                </ul>
            </li>
        </ul>
        <?php
        endif
        ?>
        <?php
        if (!empty($this->session->userdata('level'))) :
        ?>
        <?php
        if ($this->session->userdata('level') == "admin" or $this->session->userdata('level') == "produksi1" or $this->session->userdata('level') == "produksi2" or $this->session->userdata('level') == "penjualan") :
        ?>
            <ul class="nav side-menu">
                <li>
                    <a><i class="fa fa-edit"></i> Transaksi <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                    <?php
                    if ($this->session->userdata('level') == "admin") :
                    ?>

                        <li><a href="<?php echo site_url(); ?>c_transaksi/transaksi_bank">Transaksi Bank</a></li>
                        <li><a href="<?php echo site_url(); ?>c_transaksi/lihat_pemb">Pembelian Bahan Baku</a></li>
                        <li><a href="<?php echo site_url(); ?>c_transaksi/pembelian_aset">Pembelian Aset</a></li>
                        <li><a href="<?php echo site_url(); ?>c_transaksi/penyusutan">Penyusutan</a></li>
                        <li><a href="<?php echo site_url(); ?>c_transaksi/perbaikan">Perbaikan</a></li>
                        <li><a href="<?php echo site_url(); ?>c_transaksi/revaluasi">Revaluasi</a></li>
                        <li><a href="<?php echo site_url(); ?>c_transaksi/confirm_truck">Konfirmasi Truck</a></li>
                        <li><a href="<?php echo site_url(); ?>c_transaksi/lihat_ck">Cek Kualitas</a></li>
                        <li><a href="<?php echo site_url(); ?>c_transaksi/lihat_produksi_ke1">Produksi ke IPS</a></li>
                        <li><a href="<?php echo site_url(); ?>c_transaksi/lihat_pembagian">Pembagian</a></li>
                        <li><a href="<?php echo site_url(); ?>c_transaksi/lihat_pembp">Pembelian Bahan Penolong</a></li>
                        <li><a href="<?php echo site_url(); ?>c_transaksi/lihat_tp">Target Produksi</a></li>
                        <li><a href="<?php echo site_url(); ?>c_transaksi/lihat_produksi_ke2">Produksi Olahan</a></li>
                        <li><a href="<?php echo site_url(); ?>c_transaksi/lihat_penjs">Penjualan IPS</a></li>
                        <li><a href="<?php echo site_url(); ?>c_transaksi/lihat_penjt">Penjualan Toko</a></li>
                        <li><a href="<?php echo site_url(); ?>c_transaksi/pembayaran_susu">Pembayaran Susu</a></li>
                        <li><a href="<?php echo site_url(); ?>c_transaksi/lihat_pemby">Pembayaran Beban Tetap</a></li>
                        <li><a href="<?php echo site_url(); ?>c_transaksi/lihat_pembyv">Pembayaran Beban Variabel</a></li>
                        <li><a href="<?php echo site_url(); ?>c_transaksi/simpanan_hr">Simpanan Hari Raya</a></li>
                        <li><a href="<?php echo site_url(); ?>c_transaksi/pinjaman">Pinjaman</a></li>
                        <li><a href="<?= base_url('penjualan/susu')?>">Penjualan Susu</a></li>
                        <!-- <li><a href="<?= base_url('penjualan/pakan_konsentrat')?>">Penjualan Pakan Konsentrat</a></li> -->
                        <li><a href="<?= base_url('penjualan/pengolahan_susu')?>">Penjualan Pengolahan Susu</a></li>

                        <!-- sarah -->
                        <li><a href="<?= base_url('shu')?>">SHU</a></li>
                        <li><a href="<?= base_url('shu/jasa_anggota')?>">Pembagian SHU</a></li>
                        <li><a href="<?= base_url('penjualan/harga_pokok')?>">Harga Pokok Penjualan</a></li>

                        <!-- trans salma -->
                        <li><a href="<?= base_url('c_transaksi/pengajuan_jurnal')?>">Pengajuan Jurnal</a></li>
                        <li><a href="<?= base_url('Penerimaan_kas')?>">Penerimaan Kas</a></li>
                        <li><a href="<?= base_url('Pengeluaran_kas')?>">Pengeluaran Kas</a></li>
                        <li><a href="<?= base_url('DaftarPenerimaanPengeluaranKas')?>">Daftar Penerimaan dan Pengeluaran Kas</a></li>
                    <?php
                    elseif ($this->session->userdata('level') == "produksi1") :
                    ?>

                        <li><a href="<?php echo site_url(); ?>c_transaksi/lihat_pemb">Pembelian Bahan Baku</a></li>
                        <li><a href="<?php echo site_url(); ?>c_transaksi/lihat_ck">Cek Kualitas</a></li>
                        <li><a href="<?php echo site_url(); ?>c_transaksi/lihat_produksi_ke1">Produksi ke IPS</a></li>
                        <li><a href="<?php echo site_url(); ?>c_transaksi/lihat_pembagian">Pembagian</a></li>

                    <?php
                    elseif ($this->session->userdata('level') == "produksi2") :
                    ?>

                        <li><a href="<?php echo site_url(); ?>c_transaksi/lihat_pembp">Pembelian Bahan Penolong</a></li>
                        <li><a href="<?php echo site_url(); ?>c_transaksi/lihat_tp">Target Produksi</a></li>
                        <li><a href="<?php echo site_url(); ?>c_transaksi/lihat_produksi_ke2">Produksi Olahan</a></li>

                    <?php
                    elseif ($this->session->userdata('level') == "penjualan") :
                    ?>
                        <li><a href="<?php echo site_url(); ?>c_transaksi/lihat_penjs">Penjualan IPS</a></li>
                        <li><a href="<?php echo site_url(); ?>c_transaksi/lihat_penjt">Penjualan Toko</a></li>
                        <li><a href="<?php echo site_url(); ?>c_transaksi/lihat_pemby">Pembayaran Beban Tetap</a></li>
                        <li><a href="<?php echo site_url(); ?>c_transaksi/lihat_pembyv">Pembayaran Beban Variabel</a></li>
                    <?php
                    endif
                    ?>
                    </ul>
                </li>
            </ul>
        <?php endif ?>
        <?php endif ?>

        <!-- menu baru -->
        <?php if (!empty($this->session->userdata('level'))) : ?>
        <?php if ($this->session->userdata('level') == "admin" or $this->session->userdata('level') == "produksi1" or $this->session->userdata('level') == "produksi2" or $this->session->userdata('level') == "penjualan" or $this->session->userdata('level') == "keuangan1" or $this->session->userdata('level') == "keuangan2" or $this->session->userdata('level') == "keuangan3") : ?>
            <ul class="nav side-menu">
                <li>


                    <a>
                    <i class="fa fa-bar-chart-o"></i> Laporan <span class="fa fa-chevron-down"></span>
                    </a>
                    <ul class="nav child_menu">
                    <?php if ($this->session->userdata('level') == "keuangan" or $this->session->userdata('level') == "admin") : ?>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/view_jurnal">Jurnal</a></li>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/bukubesar">Buku Besar</a></li>

                        <li><a href="<?php echo site_url(); ?>Laporan/neraca_saldo">Neraca Saldo</a></li>
                        <li><a href="#">Laporan Neraca</a></li>

                        <!-- laporan sarah -->
                        <li><a href="<?php echo site_url(); ?>laporan/laporan_simpanan">Laporan Simpanan</a></li>
                        <li><a href="<?php echo site_url(); ?>shu/laporan">Laporan SHU</a></li>
                        <!--  -->

                        <li><a href="<?php echo site_url(); ?>simpanan/laporan_setoran_anggota">Laporan Setoran Susu Anggota</a></li>
                        <li><a href="<?php echo site_url(); ?>c_transaksi/kartu_aset">Kartu Penyusutan Aset</a></li>
                        <li><a href="<?php echo site_url(); ?>c_transaksi/buku_pinjaman">Buku Pembantu Pinjaman</a></li>
                        
                        <!-- start laporan salma -->
                        <li><a href="<?= base_url('Laporan/buku_pembantu_kas')?>">Buku Pembantu Kas</a></li>
                        <li><a href="<?= base_url('Laporan/buku_pembantu_bank')?>">Buku Pembantu Bank</a></li>
                        <li><a href="<?= base_url('Laporan/laporan_arus_kas')?>">Laporan Arus Kas</a></li>
                        <li><a href="<?= base_url('Laporan/buku_kas_kecil')?>">Buku Kas Kecil</a></li>
                        <!-- end -->

                        <li><a href="<?php echo site_url(); ?>c_keuangan/lap_pemb">Laporan Pembelian Bahan Baku</a></li>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/lap_pembp">Laporan Pembelian Bahan Penolong</a></li>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/lap_pemby">Laporan Pembayaran Beban</a></li>
                        <li><a href="<?php echo site_url(); ?>Laporan/laporan_penjualan_shu">Laporan Penjualan SHU</a></li>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/lap_penjs">Laporan Penjualan IPS</a></li>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/lap_penjt">Laporan Penjualan Toko</a></li>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/lap_bp_ips">Laporan Harga Pokok Produksi IPS</a></li>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/lap_bp_olahan">Laporan Harga Pokok Produksi Olahan</a></li>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/hpp_ips">Laporan Harga Pokok Penjualan IPS</a></li>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/hpp_toko">Laporan Harga Pokok Penjualan Toko</a></li>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/ranking">Laporan Ranking</a></li>
                        <li><a href="<?= base_url('laporan_kartu_stock') ?>">Laporan Kartu Stock Waserda</a></li>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/lap_ks_bb">Kartu Persediaan Bahan Baku</a></li>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/lap_ks_bp">Kartu Persediaan Bahan Penolong</a></li>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/lap_ks_prod1">Kartu Persediaan Produk IPS</a></li>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/lap_ks_prod">Kartu Persediaan Produk Toko</a></li>
                        <!-- <li><a href="<?php echo site_url(); ?>c_keuangan/lr1">Laporan Laba Rugi</a></li> -->

                        <!-- laporan arles -->
                        <li><a href="<?= base_url('Absensi/laporan_kehadiran')?>">Laporan Kehadiran</a></li>
                        <li><a href="<?= base_url('Penggajian/laporan_penggajian')?>">Laporan Penggajian</a></li>

                        <!-- laporan siti -->
                        <li><a href="<?= base_url('Laporan/laporan_penjualan_waserda')?>">Laporan Penjualan Waserda</a></li>
                        <li><a href="<?= base_url('Laporan/laporan_pmb_waserda')?>">Laporan Pembelian Waserda</a></li>
                        <!-- <li><a href="<?= base_url('Laporan/kartu_stok')?>">Kartu Stok</a></li> -->
                        <li><a href="<?= base_url('Laporan/laba_rugi')?>">Laporan Laba Rugi</a></li>

                    <?php
                    elseif ($this->session->userdata('level') == "produksi1") :
                    ?>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/lap_ks_bb">Kartu Persediaan Bahan Baku</a></li>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/lap_bp_ips">Laporan Harga Pokok Produksi IPS</a></li>

                    <?php
                    elseif ($this->session->userdata('level') == "produksi2") :
                    ?>
                        <!-- <li><a href="<?php echo site_url(); ?>c_keuangan/lap_pembp">Laporan Pembelian Bahan Penolong</a></li> -->
                        <li><a href="<?php echo site_url(); ?>c_keuangan/lap_ks_bp">Kartu Persediaan Bahan Penolong</a></li>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/lap_bp_olahan">Laporan Harga Pokok Produksi Olahan</a></li>
                        
                        <?php
                    elseif ($this->session->userdata('level') == "penjualan") :
                        ?>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/lap_penjs">Laporan Penjualan IPS</a></li>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/lap_penjt">Laporan Penjualan Toko</a></li>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/lap_pemby">Laporan Pembayaran Beban</a></li>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/lap_ks_prod1">Kartu Persediaan Produk IPS</a></li>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/lap_ks_prod">Kartu Persediaan Produk Toko</a></li>
                        <?php
                    elseif ($this->session->userdata('level') == "keuangan3") :
                        ?>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/view_jurnal">Jurnal</a></li>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/bukubesar">Buku Besar</a></li>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/lap_penjs">Laporan Penjualan IPS</a></li>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/lap_penjt">Laporan Penjualan Toko</a></li>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/lap_pemby">Laporan Pembayaran Beban</a></li>

                        <li><a href="<?php echo site_url(); ?>c_keuangan/hpp_ips">Laporan Harga Pokok Penjualan IPS</a></li>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/hpp_toko">Laporan Harga Pokok Penjualan Toko</a></li>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/lap_ks_prod1">Kartu Persediaan Produk IPS</a></li>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/lap_ks_prod">Kartu Persediaan Produk Toko</a></li>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/lr1">Laporan Laba Rugi</a></li>

                    <?php
                    elseif ($this->session->userdata('level') == "keuangan1") :
                    ?>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/view_jurnal">Jurnal</a></li>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/view_bukubesar">Buku Besar</a></li>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/lap_pemb">Laporan Pembelian Bahan Baku</a></li>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/lap_bp_ips">Laporan Harga Pokok Produksi IPS</a></li>

                    <?php
                    elseif ($this->session->userdata('level') == "keuangan2") :
                    ?>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/view_jurnal">Jurnal</a></li>
                        <li><a href="<?php echo site_url(); ?>c_keuangan/view_bukubesar">Buku Besar</a></li>
                        <!-- <li><a href="<?php echo site_url(); ?>c_keuangan/lap_ks_bp">Kartu Persediaan Bahan Penolong</a></li> -->
                        <li><a href="<?php echo site_url(); ?>c_keuangan/lap_pembp">Laporan Pembelian Bahan Penolong</a></li>


                        <li><a href="<?php echo site_url(); ?>c_keuangan/lap_bp_olahan">Laporan Harga Pokok Produksi Olahan</a></li>
                    <?php
                    endif
                    ?>
                    </ul>
                </li>
            </ul>
        <?php endif ?>
        <?php endif ?>

        <!-- menu baru -->
        <?php if (!empty($this->session->userdata('level'))) : ?>
        <?php if ($this->session->userdata('level') == "admin" or $this->session->userdata('level') == "produksi1" or $this->session->userdata('level') == "produksi2" or $this->session->userdata('level') == "penjualan" or $this->session->userdata('level') == "keuangan1" or $this->session->userdata('level') == "keuangan2" or $this->session->userdata('level') == "keuangan3") : ?>
            <ul class="nav side-menu">
                <li>
                    <a>
                    <i class="fa fa-bar-chart-o"></i>Kartu Simpanan Anggota <span class="fa fa-chevron-down"></span>
                    </a>
                    <ul class="nav child_menu">
                    <?php if ($this->session->userdata('level') == "keuangan" or $this->session->userdata('level') == "admin") : ?>
                        <li><a href="<?php echo site_url(); ?>simpanan/kartu_simpanan_wajib">Kartu Simpanan Wajib</a></li>
                        <li><a href="<?php echo site_url(); ?>simpanan/kartu_simpanan_masuka">Kartu Simpanan Masuka</a></li>
                        <li><a href="<?php echo site_url(); ?>simpanan/kartu_simpanan_hr">Kartu Simpanan Hari Raya</a></li>
                        <li><a href="<?php echo site_url(); ?>simpanan/laporan_kartu_simpanan">Laporan Kartu Simpanan</a></li>
                    <?php
                    endif
                    ?>
                    </ul>
                </li>
            </ul>
        <?php endif ?>
        <?php endif ?>
        
        <?php if (!empty($this->session->userdata('level'))) : ?>
            <?php if ($this->session->userdata('level') == "admin" or $this->session->userdata('level') == "produksi1" or $this->session->userdata('level') == "produksi2" or $this->session->userdata('level') == "penjualan" or $this->session->userdata('level') == "keuangan1" or $this->session->userdata('level') == "keuangan2" or $this->session->userdata('level') == "keuangan3") : ?>
                <ul class="nav side-menu">
                    <li>
                        <a>
                        <i class="fa fa-bar-chart-o"></i>Waserda <span class="fa fa-chevron-down"></span>
                        </a>
                        <ul class="nav child_menu">
                        <?php if ($this->session->userdata('level') == "keuangan" or $this->session->userdata('level') == "admin") : ?>
                            <li><a href="<?= base_url('Kasir')?>">Kasir</a></li>
                            <li><a href="<?= base_url('Kasir/list_penjualan')?>">Data Penjualan</a></li>
                            <li><a href="<?= base_url('Pembelian')?>">Data Pembelian</a></li>
                            <li><a href="<?= base_url('Kasir/pmb_kredit')?>">Pembayaran Kredit</a></li>
                            <li><a href="<?= base_url('Pengajuan')?>">Pengajuan Barang</a></li>
                            <li><a href="<?= base_url('Pengeluaran_beban')?>">Pengeluaran Beban</a></li>
                        <?php
                        endif
                        ?>
                        </ul>
                    </li>
                </ul>
            <?php endif ?>
        <?php endif ?>

        <?php if (!empty($this->session->userdata('level'))) : ?>
        <?php if ($this->session->userdata('level') == "pegawai") : ?>
            <ul class="nav side-menu">
                <li>
                    <a>
                    <i class="fa fa-bar-chart-o"></i>Profile <span class="fa fa-chevron-down"></span>
                    </a>
                    <ul class="nav child_menu">
                        <li><a href="<?= base_url('Profile')?>">Informasi Pegawai</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav side-menu">
                <li>
                    <a>
                    <i class="fa fa-bar-chart-o"></i>Pengajuan <span class="fa fa-chevron-down"></span>
                    </a>
                    <ul class="nav child_menu">
                        <li><a href="<?= base_url('Lembur')?>">Lembur</a></li>
                        <li><a href="<?= base_url('Cuti')?>">Cuti</a></li>
                        <?php if ($this->session->userdata('jenis_kelamin') == "P") : ?>
                        <li><a href="<?= base_url('Cuti/melahirkan')?>">Cuti Melahirkan</a></li>
                        <?php endif ?>
                    </ul>
                </li>
            </ul>
        <?php endif ?>
        <?php endif ?>
            
    </div>
</div>