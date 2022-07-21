-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2022 at 05:59 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kpsbu_backup`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi`
--

CREATE TABLE `absensi` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `absensi`
--

INSERT INTO `absensi` (`id`, `tanggal`) VALUES
(12, '2022-07-03'),
(13, '2022-07-08');

-- --------------------------------------------------------

--
-- Table structure for table `aktivitas`
--

CREATE TABLE `aktivitas` (
  `id` int(11) NOT NULL,
  `nama_aktivitas` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aktivitas`
--

INSERT INTO `aktivitas` (`id`, `nama_aktivitas`) VALUES
(14, 'Tes'),
(17, 'Penerimaan Kas'),
(18, 'Pengeluaran Kas');

-- --------------------------------------------------------

--
-- Table structure for table `alokasi_shu`
--

CREATE TABLE `alokasi_shu` (
  `id` int(11) NOT NULL,
  `deskripsi` varchar(50) DEFAULT NULL,
  `persentase` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alokasi_shu`
--

INSERT INTO `alokasi_shu` (`id`, `deskripsi`, `persentase`) VALUES
(1, 'Cadangan koperasi', 40),
(2, 'Jasa anggota', 25),
(4, 'Jasa modal', 20),
(5, 'Jasa lain-lain', 15);

-- --------------------------------------------------------

--
-- Table structure for table `aset`
--

CREATE TABLE `aset` (
  `id` varchar(255) NOT NULL,
  `aset` varchar(255) NOT NULL,
  `umur_aset` int(11) NOT NULL,
  `id_supplier` varchar(233) NOT NULL,
  `kel_akun` int(11) NOT NULL DEFAULT 0,
  `kel_akun_peny_d` int(11) NOT NULL DEFAULT 0,
  `kel_akun_peny_k` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aset`
--

INSERT INTO `aset` (`id`, `aset`, `umur_aset`, `id_supplier`, `kel_akun`, `kel_akun_peny_d`, `kel_akun_peny_k`) VALUES
('AS-01', 'Mobil', 36, 'SPA-01', 0, 0, 0),
('AS-02', 'Laptop', 36, 'SPA-01', 0, 0, 0),
('AS-03', 'Motor', 24, 'SPA-02', 0, 0, 0),
('AS-04', 'Komputer', 12, 'SPA-02', 0, 0, 0),
('AS-05', 'Kamera', 12, 'SPA-02', 0, 0, 0),
('AS-06', 'Mesin', 60, 'SPA-01', 0, 0, 0),
('AS-07', 'testing', 36, 'SPA-01', 0, 0, 0),
('AS-08', 'Motor ninja', 24, 'SPA-01', 0, 0, 0),
('AS-09', 'Tabung', 36, 'SPA-03', 0, 0, 0),
('AS-10', 'Truck', 120, 'SPA-04', 0, 0, 0),
('AS-11', 'Truck B', 120, 'SPA-05', 0, 0, 0),
('AS-12', 'Aset Testing', 12, 'SPA-03', 0, 0, 0),
('AS-13', 'testing aset 13', 12, 'SPA-04', 1120, 0, 0),
('AS-14', 'Test Kendaraan', 12, 'SPA-01', 1214, 5228, 1125),
('AS-15', 'Mobil Xenia', 12, 'SPA-02', 1214, 5228, 1125),
('AS-16', 'Mobil Tesla', 12, 'SPA-03', 1214, 5313, 1125);

-- --------------------------------------------------------

--
-- Table structure for table `bahan_baku`
--

CREATE TABLE `bahan_baku` (
  `no_bb` varchar(50) NOT NULL,
  `nama_bb` varchar(50) NOT NULL,
  `satuan` varchar(50) DEFAULT NULL,
  `stok` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bahan_baku`
--

INSERT INTO `bahan_baku` (`no_bb`, `nama_bb`, `satuan`, `stok`) VALUES
('BB_001', 'Susu Sapi', 'liter', 140000);

-- --------------------------------------------------------

--
-- Table structure for table `bahan_dalam_proses`
--

CREATE TABLE `bahan_dalam_proses` (
  `no_bdp` varchar(50) NOT NULL,
  `nama_bdp` varchar(50) NOT NULL,
  `stok` varchar(50) NOT NULL,
  `satuan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bahan_dalam_proses`
--

INSERT INTO `bahan_dalam_proses` (`no_bdp`, `nama_bdp`, `stok`, `satuan`) VALUES
('BDP_001', 'Susu Sapi', '0', 'liter');

-- --------------------------------------------------------

--
-- Table structure for table `bahan_penolong`
--

CREATE TABLE `bahan_penolong` (
  `no_bp` varchar(100) NOT NULL,
  `nama_bp` varchar(100) NOT NULL,
  `satuan` varchar(100) DEFAULT NULL,
  `stok` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bahan_penolong`
--

INSERT INTO `bahan_penolong` (`no_bp`, `nama_bp`, `satuan`, `stok`) VALUES
('BP_001', 'Gula', 'gram', 200000),
('BP_002', 'Bubuk Biang Yoghurt', 'gram', 200000),
('BP_003', 'Pewarna Makanan', 'ml', 200000),
('BP_004', 'Perisa Makanan', 'ml', 200000),
('BP_005', 'Garam', 'gram', 200000);

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `id` int(11) NOT NULL,
  `id_bank` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `nama_bank` varchar(255) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`id`, `id_bank`, `nama_bank`) VALUES
(3, 'BNK-202206210001', 'BCA'),
(4, 'BNK-202206220002', 'Mandiri'),
(5, 'BNK-202206220003', 'BNI');

-- --------------------------------------------------------

--
-- Table structure for table `bom`
--

CREATE TABLE `bom` (
  `id` int(11) NOT NULL,
  `no_produk` varchar(100) NOT NULL,
  `no_bbp` varchar(100) NOT NULL,
  `jumlah` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bom`
--

INSERT INTO `bom` (`id`, `no_produk`, `no_bbp`, `jumlah`) VALUES
(49, 'PR_003', 'BB_001', 1),
(50, 'PR_003', 'BP_001', 20),
(51, 'PR_003', 'BP_002', 20),
(52, 'PR_003', 'BP_003', 20),
(53, 'PR_003', 'BP_004', 20),
(54, 'PR_003', 'BP_005', 20);

-- --------------------------------------------------------

--
-- Table structure for table `bop`
--

CREATE TABLE `bop` (
  `no_bop` varchar(100) NOT NULL,
  `tgl_bop` varchar(50) DEFAULT NULL,
  `bulan` varchar(100) NOT NULL,
  `tahun` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bop`
--

INSERT INTO `bop` (`no_bop`, `tgl_bop`, `bulan`, `tahun`) VALUES
('BOP_001', '2022-07-09', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `bopo`
--

CREATE TABLE `bopo` (
  `no_bopo` varchar(50) NOT NULL,
  `tgl_bopo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bopo`
--

INSERT INTO `bopo` (`no_bopo`, `tgl_bopo`) VALUES
('BOPO_001', '2022-07-09');

-- --------------------------------------------------------

--
-- Table structure for table `btk`
--

CREATE TABLE `btk` (
  `no_btk` varchar(100) NOT NULL,
  `tgl_btk` varchar(50) DEFAULT NULL,
  `bulan` varchar(100) NOT NULL,
  `tahun` varchar(100) NOT NULL,
  `jumlah_pgw` varchar(100) NOT NULL,
  `tarif` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `btk`
--

INSERT INTO `btk` (`no_btk`, `tgl_btk`, `bulan`, `tahun`, `jumlah_pgw`, `tarif`) VALUES
('BTK_001', '2022-07-09', '0', '0', '150', 108);

-- --------------------------------------------------------

--
-- Table structure for table `btko`
--

CREATE TABLE `btko` (
  `no_btko` varchar(50) NOT NULL,
  `tgl_btko` varchar(50) NOT NULL,
  `jumlah_pgw` varchar(50) NOT NULL,
  `tarif` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `btko`
--

INSERT INTO `btko` (`no_btko`, `tgl_btko`, `jumlah_pgw`, `tarif`) VALUES
('BTKO_001', '2022-07-09', '150', '108');

-- --------------------------------------------------------

--
-- Table structure for table `buku_kas_kecil`
--

CREATE TABLE `buku_kas_kecil` (
  `id` int(20) NOT NULL,
  `id_ref` varchar(200) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `nominal` int(20) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  `posisi_d_c` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buku_kas_kecil`
--

INSERT INTO `buku_kas_kecil` (`id`, `id_ref`, `tgl_transaksi`, `nominal`, `keterangan`, `posisi_d_c`) VALUES
(6, 'PNJWASERDA230722001', '2022-07-23', 7500000, 'Penjualan', 'd');

-- --------------------------------------------------------

--
-- Table structure for table `buku_pembantu_bank`
--

CREATE TABLE `buku_pembantu_bank` (
  `id` int(11) NOT NULL,
  `id_ref` varchar(50) DEFAULT NULL,
  `bukti_transaksi` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `nominal` varchar(255) DEFAULT NULL,
  `kd_coa` int(11) DEFAULT NULL,
  `posisi_dr_cr` varchar(50) DEFAULT NULL,
  `keterangan` varchar(50) DEFAULT NULL,
  `bunga` int(11) NOT NULL DEFAULT 0,
  `pajak` int(11) NOT NULL DEFAULT 0,
  `biaya_admin` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buku_pembantu_bank`
--

INSERT INTO `buku_pembantu_bank` (`id`, `id_ref`, `bukti_transaksi`, `tanggal`, `nominal`, `kd_coa`, `posisi_dr_cr`, `keterangan`, `bunga`, `pajak`, `biaya_admin`) VALUES
(19, 'BPNRM20220709001', 'TransaksiBank_.ico', '2022-07-09', '1000000', 1116, 'd', 'transaksi', 2500, 2500, 2500);

-- --------------------------------------------------------

--
-- Table structure for table `buku_pembantu_kas`
--

CREATE TABLE `buku_pembantu_kas` (
  `id` int(11) NOT NULL,
  `id_ref` varchar(50) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `nominal` varchar(255) DEFAULT NULL,
  `kd_coa` int(11) DEFAULT NULL,
  `posisi_dr_cr` varchar(50) DEFAULT NULL,
  `keterangan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buku_pembantu_kas`
--

INSERT INTO `buku_pembantu_kas` (`id`, `id_ref`, `tanggal`, `nominal`, `kd_coa`, `posisi_dr_cr`, `keterangan`) VALUES
(9, 'ofas', '2022-07-09', '100000', 1111, 'd', 'penerimaan'),
(10, 'PMBWASERDA230722001', '2022-07-23', '5827500', 1111, 'k', 'Pembelian Barang Waserda'),
(11, 'PNJWASERDA230722001', '2022-07-23', '8325000', 1111, 'd', 'Penjualan Tunai'),
(12, 'PNGBBN20220723003', '2022-07-23', '20000', 1111, 'k', 'Pengeluaran Beban');

-- --------------------------------------------------------

--
-- Table structure for table `cek_kualitas`
--

CREATE TABLE `cek_kualitas` (
  `no_trans` varchar(50) NOT NULL,
  `tgl_trans` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cek_kualitas`
--

INSERT INTO `cek_kualitas` (`no_trans`, `tgl_trans`, `status`) VALUES
('CK_001', '2022-07-09', '2');

-- --------------------------------------------------------

--
-- Table structure for table `coa`
--

CREATE TABLE `coa` (
  `id` int(11) NOT NULL,
  `no_coa` int(11) NOT NULL,
  `nama_coa` varchar(50) NOT NULL,
  `jenis_coa` varchar(50) NOT NULL,
  `saldo_awal` int(50) NOT NULL,
  `header` int(11) NOT NULL,
  `saldo_normal` varchar(50) NOT NULL DEFAULT 'd',
  `is_shu` tinyint(4) NOT NULL DEFAULT 0,
  `is_arus_kas` tinyint(4) DEFAULT 0,
  `is_penerimaan` tinyint(4) DEFAULT 0,
  `is_waserda` tinyint(4) DEFAULT 0,
  `is_beban` int(11) NOT NULL DEFAULT 0,
  `is_neraca` tinyint(4) NOT NULL DEFAULT 0,
  `is_laporan_neraca` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coa`
--

INSERT INTO `coa` (`id`, `no_coa`, `nama_coa`, `jenis_coa`, `saldo_awal`, `header`, `saldo_normal`, `is_shu`, `is_arus_kas`, `is_penerimaan`, `is_waserda`, `is_beban`, `is_neraca`, `is_laporan_neraca`) VALUES
(1, 1111, 'Kas', '', 0, 1, 'd', 0, 0, 1, 0, 0, 1, 1),
(2, 1112, 'Persediaan Bahan Baku', '', 0, 1, 'd', 0, 0, 0, 0, 0, 1, 1),
(3, 1113, 'Persediaan Bahan Penolong', '', 0, 1, 'd', 0, 0, 0, 0, 0, 1, 0),
(4, 1114, 'Persediaan Produk Dalam Proses', '', 0, 1, 'd', 0, 0, 0, 0, 0, 1, 0),
(5, 1120, 'Peralatan', '', 0, 1, 'd', 0, 0, 0, 0, 0, 1, 0),
(6, 1122, 'Akumulasi penyusutan peralatan', '', 0, 1, 'k', 0, 0, 0, 0, 0, 1, 1),
(7, 1199, 'Pinjaman Anggota', '', 0, 1, 'd', 0, 0, 0, 0, 0, 1, 0),
(8, 1311, 'Persediaan Produk Jadi IPS', '', 0, 1, 'k', 0, 0, 0, 0, 0, 1, 0),
(9, 1312, 'Persediaan Produk Jadi Toko', '', 0, 1, 'k', 0, 0, 0, 0, 0, 1, 0),
(10, 2111, 'Utang', '', 0, 2, 'k', 0, 0, 0, 0, 0, 1, 1),
(11, 2112, 'Simpanan Hari Raya', '', 0, 2, 'd', 0, 0, 0, 0, 0, 1, 0),
(12, 3112, 'Simpanan Wajib', '', 0, 3, 'k', 0, 0, 0, 0, 0, 1, 1),
(13, 3113, 'Simpanan Manasuka', '', 0, 3, 'k', 0, 0, 0, 0, 0, 1, 1),
(14, 3111, 'Simpanan Pokok', '', 0, 3, 'k', 0, 0, 0, 0, 0, 1, 1),
(15, 1115, 'Pinjaman anggota', '', 0, 1, 'd', 0, 0, 0, 0, 0, 1, 0),
(16, 4111, 'Penjualan IPS', '', 0, 4, 'k', 0, 0, 1, 0, 0, 1, 0),
(17, 4112, 'Penjualan Toko', '', 0, 4, 'k', 0, 0, 1, 0, 0, 1, 0),
(18, 5000, 'Pembelian', '', 0, 5, 'd', 0, 0, 0, 0, 0, 1, 0),
(19, 5111, 'Produk Dalam Proses - BBB', '', 0, 5, 'd', 0, 0, 0, 0, 0, 1, 0),
(20, 5112, 'Produk Dalam Proses - BTK', '', 0, 5, 'd', 0, 0, 0, 0, 0, 1, 0),
(21, 5113, 'Produk Dalam Proses - BOP', '', 0, 5, 'd', 0, 0, 0, 0, 0, 1, 0),
(22, 5134, 'BOP Tetap Sesungguhnya', '', 0, 5, 'd', 0, 0, 0, 0, 0, 1, 0),
(23, 5135, 'BOP Sesungguhnya', '', 0, 5, 'd', 0, 0, 0, 0, 0, 1, 0),
(24, 5211, 'Beban Administrasi dan Umum Variabel', '', 0, 5, 'd', 0, 0, 0, 0, 0, 1, 0),
(25, 5212, 'Beban Pemasaran Variabel', '', 0, 5, 'd', 0, 0, 0, 0, 0, 1, 0),
(26, 5213, 'Beban Angkut Penjualan', '', 0, 5, 'd', 0, 1, 0, 0, 0, 1, 0),
(27, 5221, 'Beban Listrik, Air dan Telepon', '', 0, 5, 'd', 1, 0, 0, 1, 0, 1, 0),
(28, 5222, 'Beban Administrasi dan Umum Tetap', '', 0, 5, 'd', 1, 0, 0, 0, 0, 1, 0),
(29, 5223, 'Beban Pemasaran Tetap', '', 0, 5, 'd', 0, 0, 0, 0, 0, 1, 0),
(30, 5311, 'Beban Upah dan Gaji', '', 0, 5, 'd', 0, 0, 0, 0, 0, 1, 0),
(31, 5312, 'BOP Dibebankan', '', 0, 5, 'd', 0, 0, 0, 0, 0, 1, 0),
(32, 6111, 'Harga Pokok Penjualan IPS', '', 0, 6, 'd', 0, 0, 0, 0, 0, 1, 0),
(33, 6112, 'Harga Pokok Penjualan Toko', '', 0, 6, 'd', 0, 0, 0, 0, 0, 1, 0),
(34, 5228, 'Beban Penyusutan Kendaraan ', '', 0, 5, 'd', 1, 0, 0, 0, 0, 1, 0),
(35, 1125, 'Akumulasi Penyusutan Kendaraan', '', 0, 1, 'k', 0, 0, 0, 0, 0, 1, 1),
(36, 1214, 'Kendaraan', '', 0, 1, 'd', 0, 0, 0, 0, 0, 1, 0),
(37, 5224, 'Beban Perbaikan', '', 0, 5, 'd', 1, 1, 0, 0, 0, 1, 0),
(38, 4113, 'Penjualan Susu', '', 0, 4, 'd', 1, 0, 1, 0, 0, 0, 0),
(39, 4114, 'Penjualan Pakan Konsentrat', '', 0, 4, 'd', 1, 0, 1, 0, 0, 0, 0),
(40, 4115, 'Penjualan Pengolahan Susu', '', 0, 4, 'd', 1, 0, 1, 0, 0, 0, 0),
(41, 4116, 'Penjualan Waserda', '', 0, 4, 'k', 1, 0, 1, 1, 0, 1, 0),
(42, 9999, 'testtt', '', 1998, 9, 'k', 0, 0, 0, 0, 0, 0, 0),
(43, 1998, 'Piutang Kredit', '', 0, 1, 'd', 0, 0, 0, 0, 0, 1, 0),
(44, 1411, 'Persediaan Barang Dagang Susu', '', 0, 1, 'd', 0, 0, 0, 0, 0, 0, 0),
(45, 1412, 'Persediaan Barang Dagang Pakan Konsentrat', '', 0, 1, 'd', 0, 0, 0, 0, 0, 0, 0),
(46, 1413, 'Persediaan Barang Dagang Susu Olahan', '', 0, 1, 'd', 0, 0, 0, 0, 0, 0, 0),
(47, 6113, 'Harga Pokok Penjualan', '', 0, 6, 'd', 1, 0, 0, 1, 0, 0, 0),
(48, 4211, 'SHU', '', 0, 4, 'd', 0, 0, 0, 0, 0, 1, 0),
(49, 5313, 'Beban Reparasi Kendaraan', '', 0, 5, 'k', 0, 0, 1, 1, 1, 1, 0),
(50, 5314, 'Beban Transportasi', '', 0, 5, 'k', 0, 0, 0, 1, 1, 1, 0),
(51, 5400, 'Beban Lembur', '', 0, 5, 'd', 0, 0, 0, 0, 0, 1, 0),
(52, 1414, 'Pers. Barang Dagang', '', 0, 1, 'k', 0, 0, 0, 0, 0, 1, 0),
(53, 2130, 'PPN Masukan', '', 0, 2, 'd', 0, 0, 0, 0, 0, 1, 0),
(54, 2140, 'PPN Keluaran', '', 0, 2, 'd', 0, 0, 0, 0, 0, 1, 0),
(55, 1116, 'Kas & Bank', '', 0, 1, 'd', 0, 0, 0, 0, 0, 0, 0),
(56, 1117, 'Kas Kecil', '', 0, 1, 'd', 0, 0, 0, 0, 0, 0, 0),
(57, 5220, 'Beban Listrik, Air dan Telepon Waserda', '', 0, 5, 'd', 0, 0, 0, 1, 1, 0, 0),
(58, 4212, 'Pinjaman Bank', '', 0, 4, 'd', 0, 0, 0, 0, 0, 0, 0),
(59, 2113, 'Utang Bank', '', 0, 2, 'd', 0, 0, 0, 0, 0, 0, 0),
(60, 4117, 'Penjualan Aktiva Tetap', '', 0, 4, 'd', 0, 0, 0, 0, 0, 0, 0),
(61, 5100, 'Pembelian Aktiva Tetap', '', 0, 5, 'k', 0, 0, 0, 0, 0, 0, 0),
(62, 3000, 'Modal', '', 0, 3, 'd', 0, 0, 0, 0, 0, 0, 0),
(63, 3101, 'Prive', '', 0, 3, 'k', 0, 0, 0, 0, 0, 1, 0),
(64, 5315, 'Beban Tunjangan Kesehatan', '', 0, 5, 'd', 0, 0, 0, 0, 0, 0, 0),
(65, 5316, 'Beban Tunjangan Jabatan', '', 0, 5, 'd', 0, 0, 0, 0, 0, 0, 0),
(66, 5317, 'Beban Bonus', '', 0, 5, 'd', 0, 0, 0, 0, 0, 0, 0),
(67, 2114, 'Utang PPH', '', 0, 2, 'k', 0, 0, 0, 0, 0, 0, 0),
(68, 5318, 'Beban Tunjangan Hari Raya', '', 0, 5, 'd', 0, 0, 0, 0, 0, 0, 0),
(69, 3300, 'SHU Tahun Berjalan', '', 0, 3, 'd', 0, 0, 0, 0, 0, 1, 0),
(70, 3200, 'SHU Ditahan', '', 0, 3, 'd', 0, 0, 0, 0, 0, 1, 0),
(71, 3100, 'SHU Tahun Berjalan Pada Tahun Lalu', '', 0, 3, 'k', 0, 0, 0, 0, 0, 1, 0),
(72, 1300, 'Ikhtisar Laba Rugi', '', 0, 1, 'k', 0, 0, 0, 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `detail_absen_rfid`
--

CREATE TABLE `detail_absen_rfid` (
  `id` int(50) NOT NULL,
  `id_absensi` int(50) DEFAULT NULL,
  `rfid` varchar(50) DEFAULT NULL,
  `status` enum('masuk','alfa','izin','cuti') DEFAULT NULL,
  `jam` time DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_absen_rfid`
--

INSERT INTO `detail_absen_rfid` (`id`, `id_absensi`, `rfid`, `status`, `jam`, `keterangan`) VALUES
(42, 13, '123232323', 'masuk', '10:17:44', 'Presensi Masuk, Telat'),
(43, 13, '123232323', '', '10:19:40', 'Presensi Keluar');

-- --------------------------------------------------------

--
-- Table structure for table `detail_bop`
--

CREATE TABLE `detail_bop` (
  `no_bop` varchar(100) NOT NULL,
  `no_jbop` varchar(100) NOT NULL,
  `harga` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_bop`
--

INSERT INTO `detail_bop` (`no_bop`, `no_jbop`, `harga`) VALUES
('BOP_001', 'JBOP_001', 101),
('BOP_001', 'JBOP_002', 102),
('BOP_001', 'JBOP_003', 103),
('BOP_001', 'JBOP_004', 104);

-- --------------------------------------------------------

--
-- Table structure for table `detail_bopo`
--

CREATE TABLE `detail_bopo` (
  `no_bopo` varchar(50) NOT NULL,
  `no_jbop` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_bopo`
--

INSERT INTO `detail_bopo` (`no_bopo`, `no_jbop`, `harga`) VALUES
('BOPO_001', 'JBOP_001', '101'),
('BOPO_001', 'JBOP_002', '102'),
('BOPO_001', 'JBOP_003', '103'),
('BOPO_001', 'JBOP_004', '104');

-- --------------------------------------------------------

--
-- Table structure for table `detail_cek_kualitas`
--

CREATE TABLE `detail_cek_kualitas` (
  `no` int(11) NOT NULL,
  `no_trans` varchar(50) NOT NULL,
  `no_trans_pmb` varchar(50) NOT NULL,
  `lulus` varchar(50) NOT NULL,
  `gagal` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_cek_kualitas`
--

INSERT INTO `detail_cek_kualitas` (`no`, `no_trans`, `no_trans_pmb`, `lulus`, `gagal`, `total`, `subtotal`) VALUES
(2, 'CK_001', 'PMB_001', '140000', '10000', '150000', '855000000');

-- --------------------------------------------------------

--
-- Table structure for table `detail_pembagian`
--

CREATE TABLE `detail_pembagian` (
  `no` int(11) NOT NULL,
  `no_trans` varchar(50) NOT NULL,
  `jual` varchar(50) NOT NULL,
  `produksi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_pembagian`
--

INSERT INTO `detail_pembagian` (`no`, `no_trans`, `jual`, `produksi`) VALUES
(2, 'PGB_001', '130000', '10000');

-- --------------------------------------------------------

--
-- Table structure for table `detail_pembayaran`
--

CREATE TABLE `detail_pembayaran` (
  `no_trans` varchar(50) NOT NULL,
  `no_coa` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  `jenis_penjualan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_pembayaran`
--

INSERT INTO `detail_pembayaran` (`no_trans`, `no_coa`, `subtotal`, `jenis_penjualan`) VALUES
('PMBY_001', '5221', '30000000', 'ips'),
('PMBY_001', '5221', '30000000', 'toko'),
('PMBY_001', '5228', '40000000', 'ips'),
('PMBY_001', '5228', '40000000', 'toko'),
('PMBY_001', '5224', '30000000', 'toko'),
('PMBY_001', '5224', '30000000', 'ips');

-- --------------------------------------------------------

--
-- Table structure for table `detail_pembayaranv`
--

CREATE TABLE `detail_pembayaranv` (
  `no_trans` varchar(50) NOT NULL,
  `no_coa` varchar(50) NOT NULL,
  `tarif` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  `jenis_penjualan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detail_pembelian`
--

CREATE TABLE `detail_pembelian` (
  `id` int(11) NOT NULL,
  `id_pembelian` varchar(255) NOT NULL,
  `id_aset` varchar(255) NOT NULL,
  `id_supplier` varchar(255) NOT NULL,
  `nominal` int(11) NOT NULL,
  `biaya` int(11) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  `nilai_sisa` varchar(50) NOT NULL,
  `sisa_umur` varchar(50) NOT NULL,
  `sisa_umur_aset` varchar(50) DEFAULT NULL,
  `tgl_nota` date NOT NULL,
  `cek_bulan_peny` varchar(11) NOT NULL DEFAULT '0000-00',
  `cek_bulan_perb` varchar(11) DEFAULT NULL,
  `id_detail_aset` varchar(255) NOT NULL,
  `is_rev` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_pembelian`
--

INSERT INTO `detail_pembelian` (`id`, `id_pembelian`, `id_aset`, `id_supplier`, `nominal`, `biaya`, `subtotal`, `nilai_sisa`, `sisa_umur`, `sisa_umur_aset`, `tgl_nota`, `cek_bulan_peny`, `cek_bulan_perb`, `id_detail_aset`, `is_rev`) VALUES
(1, 'PMBAST20201225001', 'AS-08', 'SPA-01', 5000000, 1000000, '6000000', '500000', '22', '24', '0000-00-00', '2021-01', NULL, 'IDA-001', 0),
(2, 'PMBAST20201225001', 'AS-04', 'SPA-02', 2500000, 150000, '2650000', '1000000', '10', '12', '0000-00-00', '2021-01', NULL, 'IDA-002', 0),
(3, 'PMBAST20201226002', 'AS-05', 'SPA-02', 7500000, 150000, '7650000', '5000000', '10', '12', '0000-00-00', '2021-01', NULL, 'IDA-003', 0),
(4, 'PMBAST20210102003', 'AS-08', 'SPA-01', 123123123, 123123, '123246246', '123123', '23', '24', '0000-00-00', '2021-01', NULL, 'IDA-004', 0),
(5, 'PMBAST20210217004', 'AS-09', 'SPA-03', 20000000, 500000, '20500000', '5000000', '36', '36', '0000-00-00', '0000-00', NULL, 'IDA-005', 0),
(6, 'PMBAST20210217004', 'AS-09', 'SPA-03', 20000000, 500000, '20500000', '5000000', '36', '36', '0000-00-00', '0000-00', NULL, 'IDA-006', 0),
(7, 'PMBAST20210523005', 'AS-10', 'SPA-04', 90000000, 0, '90000000', '50000000', '120', '120', '0000-00-00', '0000-00', NULL, 'IDA-007', 0),
(8, 'PMBAST20210523005', 'AS-10', 'SPA-04', 90000000, 0, '90000000', '50000000', '120', '120', '0000-00-00', '0000-00', NULL, 'IDA-008', 0),
(9, 'PMBAST20210523005', 'AS-10', 'SPA-04', 90000000, 0, '90000000', '50000000', '119', '120', '0000-00-00', '2021-06', NULL, 'IDA-009', 0),
(18, 'PMBAST20210608006', 'AS-11', 'SPA-05', 45000000, 0, '45000000', '30000000', '120', '120', '0000-00-00', '0000-00', NULL, 'IDA-010', 0),
(19, 'PMBAST20210608006', 'AS-11', 'SPA-05', 45000000, 0, '45000000', '30000000', '120', '120', '0000-00-00', '0000-00', NULL, 'IDA-011', 0),
(20, 'PMBAST20210608006', 'AS-11', 'SPA-05', 45000000, 0, '45000000', '30000000', '120', '120', '0000-00-00', '0000-00', NULL, 'IDA-012', 0),
(21, 'PMBAST20210608007', 'AS-10', 'SPA-04', 90000000, 0, '90000000', '50000000', '120', '120', '0000-00-00', '0000-00', NULL, 'IDA-013', 0),
(22, 'PMBAST20210608007', 'AS-10', 'SPA-04', 90000000, 0, '90000000', '50000000', '120', '120', '0000-00-00', '0000-00', NULL, 'IDA-014', 0),
(23, 'PMBAST20210608007', 'AS-10', 'SPA-04', 90000000, 0, '90000000', '50000000', '120', '120', '0000-00-00', '0000-00', NULL, 'IDA-015', 0),
(28, 'PMBAST20210616008', 'AS-10', 'SPA-04', 1000000, 100000, '1100000', '100000', '120', '120', '0000-00-00', '0000-00', NULL, 'IDA-016', 0),
(29, 'PMBAST20210616008', 'AS-10', 'SPA-04', 1000000, 100000, '1100000', '100000', '120', '120', '0000-00-00', '0000-00', NULL, 'IDA-017', 0),
(30, 'PMBAST20210616009', 'AS-10', 'SPA-04', 123123123, 123, '123123246', '123123', '120', '120', '0000-00-00', '0000-00', NULL, 'IDA-018', 0),
(31, 'PMBAST20210616009', 'AS-10', 'SPA-04', 123123123, 123, '123123246', '123123', '119', '120', '0000-00-00', '2021-06', NULL, 'IDA-019', 0),
(32, 'PMBAST20210616009', 'AS-10', 'SPA-04', 123123123, 123, '123123246', '123123', '118', '120', '0000-00-00', '2021-07', NULL, 'IDA-020', 0),
(33, 'PMBAST20210617010', 'AS-12', 'SPA-03', 1000000, 100000, '1100000', '100000', '9', '12', '0000-00-00', '2021-08', '2021-07', 'IDA-021', 1),
(34, 'PMBAST20210621011', 'AS-12', 'SPA-03', 1000000, 100000, '1100000', '100000', '10', '12', '0000-00-00', '2021-07', '2021-07', 'IDA-022', 1),
(35, 'PMBAST20210702012', 'AS-13', 'SPA-04', 5000000, 0, '5000000', '1000000', '12', '12', '0000-00-00', '0000-00', NULL, 'IDA-023', 0),
(36, 'PMBAST20210703013', 'AS-14', 'SPA-01', 6000000, 0, '6000000', '3000000', '9', '12', '0000-00-00', '2021-09', '2021-08', 'IDA-024', 1),
(37, 'PMBAST20220709001', 'AS-15', 'SPA-02', 150000000, 1500000, '151500000', '15000000', '11', '12', '0000-00-00', '2022-07', NULL, 'IDA-025', 0),
(38, 'PMBAST20220709002', 'AS-16', 'SPA-03', 200000000, 2000000, '202000000', '20000000', '11', '12', '0000-00-00', '2022-07', NULL, 'IDA-026', 0);

-- --------------------------------------------------------

--
-- Table structure for table `detail_pembelian_bb`
--

CREATE TABLE `detail_pembelian_bb` (
  `id` int(11) NOT NULL,
  `no_trans` varchar(100) NOT NULL,
  `no_bb` varchar(100) NOT NULL,
  `jumlah` int(100) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subtotal` int(100) NOT NULL,
  `no_peternak` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_pembelian_bb`
--

INSERT INTO `detail_pembelian_bb` (`id`, `no_trans`, `no_bb`, `jumlah`, `harga`, `subtotal`, `no_peternak`) VALUES
(2, 'PMB_001', 'BB_001', 150000, '5700', 855000000, 'PTRNK_011'),
(3, 'PMB_002', 'BB_001', 550, '5700', 3135000, 'PTRNK_041'),
(4, 'PMB_002', 'BB_001', 400, '5700', 2280000, 'PTRNK_042'),
(5, 'PMB_002', 'BB_001', 200, '5700', 1140000, 'PTRNK_043');

-- --------------------------------------------------------

--
-- Table structure for table `detail_pembelian_bp`
--

CREATE TABLE `detail_pembelian_bp` (
  `no` int(11) NOT NULL,
  `no_trans` varchar(100) NOT NULL,
  `no_bp` varchar(100) NOT NULL,
  `jumlah` int(100) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subtotal` int(100) NOT NULL,
  `no_supp_bp` varchar(100) NOT NULL,
  `jumlah_kartu_stok` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_pembelian_bp`
--

INSERT INTO `detail_pembelian_bp` (`no`, `no_trans`, `no_bp`, `jumlah`, `harga`, `subtotal`, `no_supp_bp`, `jumlah_kartu_stok`) VALUES
(6, 'PMBP_001', 'BP_001', 200000, '1000', 200000000, 'SBP_001', '200000'),
(7, 'PMBP_001', 'BP_002', 200000, '5000', 1000000000, 'SBP_002', '200000'),
(8, 'PMBP_001', 'BP_003', 200000, '3000', 600000000, 'SBP_003', '200000'),
(9, 'PMBP_001', 'BP_004', 200000, '3000', 600000000, 'SBP_004', '200000'),
(10, 'PMBP_001', 'BP_005', 200000, '1000', 200000000, 'SBP_005', '200000');

-- --------------------------------------------------------

--
-- Table structure for table `detail_penerimaan_pengeluaran_kas`
--

CREATE TABLE `detail_penerimaan_pengeluaran_kas` (
  `id` int(11) NOT NULL,
  `no_dokumen` varchar(255) NOT NULL DEFAULT '0',
  `no_coa` varchar(255) DEFAULT NULL,
  `nama_coa` varchar(255) DEFAULT NULL,
  `aktivitas` varchar(255) DEFAULT NULL,
  `nominal` int(20) DEFAULT NULL,
  `posisi_dc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_penerimaan_pengeluaran_kas`
--

INSERT INTO `detail_penerimaan_pengeluaran_kas` (`id`, `no_dokumen`, `no_coa`, `nama_coa`, `aktivitas`, `nominal`, `posisi_dc`) VALUES
(1, 'TESTING DOKUMEN SALMA', '1111', 'Kas', 'Testing', 500000, 'd'),
(2, 'TESTING DOKUMEN SALMA', '1114', 'Persediaan Produk Dalam Proses', 'Aaaa', 500000, 'k'),
(3, 'testing dokumen 2', '1111', 'Kas', 'Testing', 500000, 'd'),
(4, 'testing dokumen 2', '1112', 'Persediaan Bahan Baku', 'Aaaa', 500000, 'k'),
(5, 'testing jurnal', '1111', 'Kas', 'Penerimaan Kas', 500000, 'd'),
(6, 'testing jurnal', '1312', 'Persediaan Produk Jadi Toko', 'Aaaa', 500000, 'k'),
(7, '123', '5111', 'Produk Dalam Proses - BBB', 'test', 1000, 'd'),
(8, '111', '1117', 'Kas Kecil', 'Penerimaan Kas', 10000000, 'd'),
(9, '111', '1111', 'Kas', 'Penerimaan Kas', 10000000, 'k'),
(10, '414', '5221', 'Beban Listrik, Air dan Telepon', 'Pengeluaran Kas', 500000, 'd'),
(11, '414', '1117', 'Kas Kecil', 'Pengeluaran Kas', 500000, 'k'),
(12, '4232', '5221', 'Beban Listrik, Air dan Telepon', 'Pengeluaran Kas', 300000, 'd'),
(13, '2314', '5221', 'Beban Listrik, Air dan Telepon', 'Pengeluaran Kas', 300000, 'd'),
(14, '2314', '1117', 'Kas Kecil', 'Pengeluaran Kas', 300000, 'k'),
(15, 'penjualan aktiva tetap', '1111', 'Kas', 'test', 10000000, 'd'),
(16, 'penjualan aktiva tetap', '4117', 'Penjualan Aktiva Tetap', 'test', 10000000, 'k'),
(17, 'fefefqfwfwf', '1111', 'Kas', 'test', 1000000, 'd'),
(18, 'fefefqfwfwf', '4113', 'Penjualan Susu', 'test', 1000000, 'k'),
(21, 'adwdwedxdf', '1117', 'Kas Kecil', 'Penerimaan Kas', 10000000, 'd'),
(22, 'adwdwedxdf', '1111', 'Kas', 'Penerimaan Kas', 10000000, 'k'),
(23, '001', '1111', 'Kas', 'Penerimaan Kas', 100000, 'd'),
(24, '001', '4113', 'Penjualan Susu', 'Penerimaan Kas', 100000, 'k'),
(28, '0003', '1111', 'Kas', 'Penerimaan Kas', 100000, 'd'),
(29, '0003', '4113', 'Penjualan Susu', 'Penerimaan Kas', 100000, 'k'),
(30, '0004', '1111', 'Kas', 'Penerimaan Kas', 123000, 'd'),
(31, '0004', '4113', 'Penjualan Susu', 'Penerimaan Kas', 123000, 'k'),
(32, 'ofas', '1111', 'Kas', 'Penerimaan Kas', 100000, 'd'),
(33, 'ofas', '4113', 'Penjualan Susu', 'Penerimaan Kas', 100000, 'k');

-- --------------------------------------------------------

--
-- Table structure for table `detail_penjualan_ips`
--

CREATE TABLE `detail_penjualan_ips` (
  `no` int(11) NOT NULL,
  `no_trans` varchar(100) NOT NULL,
  `no_produk` varchar(100) NOT NULL,
  `jumlah` int(100) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subtotal` int(100) NOT NULL,
  `no_ips` varchar(100) NOT NULL,
  `jumlah_kartu_stok` varchar(50) NOT NULL,
  `hpp` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_penjualan_ips`
--

INSERT INTO `detail_penjualan_ips` (`no`, `no_trans`, `no_produk`, `jumlah`, `harga`, `subtotal`, `no_ips`, `jumlah_kartu_stok`, `hpp`) VALUES
(4, 'PENJS_001', 'PR_001', 15000, '8083.4', 121251000, 'IPS_001', '0', '93270000'),
(5, 'PENJS_001', 'PR_001', 15000, '8083.4', 121251000, 'IPS_002', '0', '93270000'),
(6, 'PENJS_001', 'PR_001', 100000, '8083.4', 808340000, 'IPS_003', '0', '621800000');

-- --------------------------------------------------------

--
-- Table structure for table `detail_penjualan_toko`
--

CREATE TABLE `detail_penjualan_toko` (
  `no` int(11) NOT NULL,
  `no_trans` varchar(50) NOT NULL,
  `no_produk` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  `hpp` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_penjualan_toko`
--

INSERT INTO `detail_penjualan_toko` (`no`, `no_trans`, `no_produk`, `jumlah`, `harga`, `subtotal`, `hpp`) VALUES
(2, 'PENJT_001', 'PR_003', '8000', '346756.8', '2774054400', '2133888000'),
(3, 'PENJT_001', 'PR_002', '2000', '9802', '19604000', NULL),
(4, 'PENJT_002', 'PR_003', '3000', '346756.8', '1040270400', '800208000');

-- --------------------------------------------------------

--
-- Table structure for table `detail_pnj_susu`
--

CREATE TABLE `detail_pnj_susu` (
  `kd_pnj_susu` varchar(50) DEFAULT NULL,
  `kd_produk` varchar(50) DEFAULT NULL,
  `nm_produk` varchar(50) DEFAULT NULL,
  `jml_liter` int(11) DEFAULT NULL,
  `harga_satuan` int(11) DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_pnj_susu`
--

INSERT INTO `detail_pnj_susu` (`kd_pnj_susu`, `kd_produk`, `nm_produk`, `jml_liter`, `harga_satuan`, `subtotal`) VALUES
('PNJPKN20211202001', 'PR_014', 'Rumput grade A', 10, 25000, 250000),
('PNJPKN20211202001', 'PR_015', 'Rumput Grade B', 10, 15000, 150000),
('PNJS20211202001', 'PR_010', 'Test sarah', 1, 7000, 7000),
('PNJPKN20211202002', 'PR_014', 'Rumput grade A', 1, 25000, 25000),
('PNJSO20211202001', 'PR_012', 'Testing Yogurt', 1, 5000, 5000),
('PNJS20211202002', 'PR_010', 'Test sarah', 100, 7000, 700000),
('PNJS20211202002', 'PR_011', 'Test 2', 100, 4500, 450000),
('PNJPKN20211202003', 'PR_014', 'Rumput grade A', 1, 25000, 25000),
('PNJPKN20211202004', 'PR_014', 'Rumput grade A', 1, 25000, 25000),
('PNJS20211216003', 'PR_011', 'Test 2', 100, 4500, 450000),
('PNJPKN20211216005', 'PR_014', 'Rumput grade A', 100, 25000, 2500000),
('PNJSO20211216002', 'PR_012', 'Testing Yogurt', 100, 5000, 500000),
('PNJSO20211216003', 'PR_013', 'Yogurt 2 ', 13, 7500, 97500),
('PNJSO20211216003', 'PR_012', 'Testing Yogurt', 12, 5000, 60000),
('PNJS20220109004', 'PR_016', 'Asi', 100, 1233, 123300),
('PNJPKN20220109006', 'PR_015', 'Rumput Grade B', 1000, 15000, 15000000),
('PNJS20220702005', 'PR_010', 'Test sarah', 100, 7000, 700000),
('PNJS20220702006', 'PR_010', 'Test sarah', 50, 7000, 350000);

-- --------------------------------------------------------

--
-- Table structure for table `detail_produksi_ke1`
--

CREATE TABLE `detail_produksi_ke1` (
  `no` int(11) NOT NULL,
  `no_trans` varchar(50) NOT NULL,
  `no_produk` varchar(50) NOT NULL,
  `bbb` varchar(50) NOT NULL,
  `btk` varchar(50) NOT NULL,
  `bop` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `stok_jual` varchar(50) DEFAULT NULL,
  `jumlah_kartu_stok` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_produksi_ke1`
--

INSERT INTO `detail_produksi_ke1` (`no`, `no_trans`, `no_produk`, `bbb`, `btk`, `bop`, `subtotal`, `jumlah`, `stok_jual`, `jumlah_kartu_stok`) VALUES
(2, 'PROD1_001', 'PR_001', '798000000', '15120000', '57400000', '870520000', '140000', '130000', '130000');

-- --------------------------------------------------------

--
-- Table structure for table `detail_produksi_ke2`
--

CREATE TABLE `detail_produksi_ke2` (
  `no` int(11) NOT NULL,
  `no_trans` varchar(50) NOT NULL,
  `tgl_trans` varchar(50) NOT NULL,
  `no_produk` varchar(50) NOT NULL,
  `bbb` varchar(50) NOT NULL,
  `btk` varchar(50) NOT NULL,
  `bop` varchar(50) NOT NULL,
  `bp` varchar(50) DEFAULT NULL,
  `subtotal` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `jumlah_kartu_stok` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_produksi_ke2`
--

INSERT INTO `detail_produksi_ke2` (`no`, `no_trans`, `tgl_trans`, `no_produk`, `bbb`, `btk`, `bop`, `bp`, `subtotal`, `jumlah`, `jumlah_kartu_stok`) VALUES
(1, 'PROD2_001', '2022-07-09', 'PR_003', '62180000', '1080000', '4100000', '2600000000', '2667360000', '10000', '0');

-- --------------------------------------------------------

--
-- Table structure for table `detail_target_produksi`
--

CREATE TABLE `detail_target_produksi` (
  `no` int(11) NOT NULL,
  `no_tp` varchar(100) NOT NULL,
  `no_produk` varchar(100) NOT NULL,
  `jumlah` int(100) NOT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_target_produksi`
--

INSERT INTO `detail_target_produksi` (`no`, `no_tp`, `no_produk`, `jumlah`, `status`) VALUES
(1, 'TP_001', 'PR_003', 10000, '1');

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi_shu`
--

CREATE TABLE `detail_transaksi_shu` (
  `id` int(11) NOT NULL,
  `kode_shu` varchar(50) DEFAULT NULL,
  `uraian` varchar(50) DEFAULT NULL,
  `nominal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_shift`
--

CREATE TABLE `jadwal_shift` (
  `id` int(11) NOT NULL,
  `id_pegawai` varchar(50) DEFAULT NULL,
  `id_shift` varchar(50) DEFAULT NULL,
  `tgl_awal` date DEFAULT NULL,
  `tgl_akhir` date DEFAULT NULL,
  `desc` varchar(50) DEFAULT NULL,
  `create_by` varchar(50) DEFAULT NULL,
  `is_complete` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jadwal_shift`
--

INSERT INTO `jadwal_shift` (`id`, `id_pegawai`, `id_shift`, `tgl_awal`, `tgl_akhir`, `desc`, `create_by`, `is_complete`) VALUES
(10, '1029384756', '2', '2022-07-03', '2022-07-04', 'awdaw', 'admin', 0),
(11, '111', '2', '2022-07-03', '2022-07-04', 'dadad', 'admin', 0),
(12, '8003250622757', '1', '2022-07-08', '2022-07-08', 'shift', 'admin', 0),
(13, '1608260622758', '1', '2022-07-08', '2022-07-08', 'shift', 'admin', 0),
(14, '9200270622759', '2', '2022-07-08', '2022-07-08', 'shift', 'admin', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jenis_bop`
--

CREATE TABLE `jenis_bop` (
  `no_jbop` varchar(50) NOT NULL,
  `nama_jbop` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis_bop`
--

INSERT INTO `jenis_bop` (`no_jbop`, `nama_jbop`) VALUES
('JBOP_001', 'Beban Listrik'),
('JBOP_002', 'Beban Air'),
('JBOP_003', 'Beban Gas'),
('JBOP_004', 'Beban Overhead Pabrik Lainnya');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_penjualan`
--

CREATE TABLE `jenis_penjualan` (
  `id` int(11) NOT NULL,
  `desc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis_penjualan`
--

INSERT INTO `jenis_penjualan` (`id`, `desc`) VALUES
(1, 'Susu Murni'),
(2, 'Pakan Konsentrat'),
(3, 'Susu Olahan');

-- --------------------------------------------------------

--
-- Table structure for table `jurnal`
--

CREATE TABLE `jurnal` (
  `no` int(11) NOT NULL,
  `id_jurnal` varchar(100) NOT NULL,
  `tgl_jurnal` varchar(100) NOT NULL,
  `no_coa` int(100) NOT NULL,
  `posisi_dr_cr` varchar(100) NOT NULL,
  `nominal` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jurnal`
--

INSERT INTO `jurnal` (`no`, `id_jurnal`, `tgl_jurnal`, `no_coa`, `posisi_dr_cr`, `nominal`) VALUES
(42, 'PMB_001', '2022-07-09', 1112, 'd', 855000000),
(43, 'PMB_001', '2022-07-09', 2111, 'k', 855000000),
(44, 'CK_001', '2022-07-09', 1112, 'd', 798000000),
(45, 'CK_001', '2022-07-09', 1111, 'k', 798000000),
(46, 'PROD1_001', '2022-07-09', 5111, 'd', 798000000),
(47, 'PROD1_001', '2022-07-09', 1112, 'k', 798000000),
(48, 'PROD1_001', '2022-07-09', 5112, 'd', 15120000),
(49, 'PROD1_001', '2022-07-09', 5311, 'k', 15120000),
(50, 'PROD1_001', '2022-07-09', 5113, 'd', 57400000),
(51, 'PROD1_001', '2022-07-09', 5312, 'k', 57400000),
(52, 'PGB_001', '2022-07-09', 1114, 'd', 62180000),
(53, 'PGB_001', '2022-07-09', 5111, 'k', 57000000),
(54, 'PGB_001', '2022-07-09', 5112, 'k', 1080000),
(55, 'PGB_001', '2022-07-09', 5113, 'k', 4100000),
(56, 'PGB_001', '2022-07-09', 1311, 'd', 808340000),
(57, 'PGB_001', '2022-07-09', 5111, 'k', 741000000),
(58, 'PGB_001', '2022-07-09', 5112, 'k', 14040000),
(59, 'PGB_001', '2022-07-09', 5113, 'k', 53300000),
(60, 'PMBP_001', '2022-07-09', 1113, 'd', 2147483647),
(61, 'PMBP_001', '2022-07-09', 1111, 'k', 2147483647),
(62, 'PROD2_001', '2022-07-09', 5112, 'd', 1080000),
(63, 'PROD2_001', '2022-07-09', 5311, 'k', 1080000),
(64, 'PROD2_001', '2022-07-09', 5113, 'd', 4100000),
(65, 'PROD2_001', '2022-07-09', 5312, 'k', 4100000),
(66, 'PROD2_001', '2022-07-09', 5135, 'd', 2600000000),
(67, 'PROD2_001', '2022-07-09', 1113, 'k', 2600000000),
(68, 'PROD2_001', '2022-07-09', 1312, 'd', 2667360000),
(69, 'PROD2_001', '2022-07-09', 1114, 'k', 62180000),
(70, 'PROD2_001', '2022-07-09', 5112, 'k', 1080000),
(71, 'PROD2_001', '2022-07-09', 5113, 'k', 2604100000),
(72, 'PENJS_001', '2022-07-09', 1111, 'd', 1050842000),
(73, 'PENJS_001', '2022-07-09', 4111, 'k', 1050842000),
(74, 'PENJS_001', '2022-07-09', 6111, 'd', 808340000),
(75, 'PENJS_001', '2022-07-09', 1311, 'k', 808340000),
(76, 'PENJT_001', '2022-07-09', 1111, 'd', 2793658400),
(77, 'PENJT_001', '2022-07-09', 4112, 'k', 2793658400),
(78, 'PENJT_001', '2022-07-09', 6112, 'd', 2133888000),
(79, 'PENJT_001', '2022-07-09', 1312, 'k', 2133888000),
(80, 'PENJT_002', '2022-07-09', 1111, 'd', 1040270400),
(81, 'PENJT_002', '2022-07-09', 4112, 'k', 1040270400),
(82, 'PENJT_002', '2022-07-09', 6112, 'd', 800208000),
(83, 'PENJT_002', '2022-07-09', 1312, 'k', 800208000),
(84, 'PMBAST20220709001', '2022-07-09', 1214, 'd', 151500000),
(85, 'PMBAST20220709001', '2022-07-09', 1111, 'k', 151500000),
(86, 'PMBAST20220709002', '2022-07-09', 1214, 'd', 202000000),
(87, 'PMBAST20220709002', '2022-07-09', 1111, 'k', 202000000),
(88, 'IDA-026', '2022-07-09', 5313, 'd', 15166666),
(89, 'IDA-026', '2022-07-09', 1125, 'k', 15166666),
(90, 'DPPTRNK_041', '2022-07-09', 1111, 'd', 50000),
(91, 'DPPTRNK_041', '2022-07-09', 3111, 'k', 50000),
(92, 'DPPTRNK_042', '2022-07-09', 1111, 'd', 50000),
(93, 'DPPTRNK_042', '2022-07-09', 3111, 'k', 50000),
(94, 'DPPTRNK_043', '2022-07-09', 1111, 'd', 50000),
(95, 'DPPTRNK_043', '2022-07-09', 3111, 'k', 50000),
(96, 'PMB_002', '2022-07-09', 1112, 'd', 6555000),
(97, 'PMB_002', '2022-07-09', 2111, 'k', 6555000),
(98, 'PMBS-230720220001', '2022-07-23', 2111, 'd', 3135000),
(99, 'PMBS-230720220001', '2022-07-23', 1111, 'k', 3114000),
(100, 'PMBS-230720220001', '2022-07-23', 3112, 'k', 11000),
(101, 'PMBS-230720220001', '2022-07-23', 3113, 'k', 10000),
(102, 'PMBS-230720220002', '2022-07-23', 2111, 'd', 2280000),
(103, 'PMBS-230720220002', '2022-07-23', 1111, 'k', 2262000),
(104, 'PMBS-230720220002', '2022-07-23', 3112, 'k', 8000),
(105, 'PMBS-230720220002', '2022-07-23', 3113, 'k', 10000),
(106, 'PMBS-230720220003', '2022-07-23', 2111, 'd', 1140000),
(107, 'PMBS-230720220003', '2022-07-23', 1111, 'k', 1126000),
(108, 'PMBS-230720220003', '2022-07-23', 3112, 'k', 4000),
(109, 'PMBS-230720220003', '2022-07-23', 3113, 'k', 10000),
(110, 'PMBWASERDA230722001', '2022-07-23', 1414, 'd', 5250000),
(111, 'PMBWASERDA230722001', '2022-07-23', 2130, 'd', 577500),
(112, 'PMBWASERDA230722001', '2022-07-23', 1111, 'k', 5827500),
(113, 'PNJWASERDA230722001', '2022-07-23', 1111, 'd', 8325000),
(114, 'PNJWASERDA230722001', '2022-07-23', 2140, 'k', 825000),
(115, 'PNJWASERDA230722001', '2022-07-23', 4116, 'k', 7500000),
(116, 'PNJWASERDA230722001', '2022-07-23', 6113, 'd', 5250000),
(117, 'PNJWASERDA230722001', '2022-07-23', 1414, 'k', 5250000),
(118, 'PNGBBN20220723003', '2022-07-23', 5314, 'd', 20000),
(119, 'PNGBBN20220723003', '2022-07-23', 1111, 'k', 20000);

-- --------------------------------------------------------

--
-- Table structure for table `kartu_stok_bp`
--

CREATE TABLE `kartu_stok_bp` (
  `no` int(11) NOT NULL,
  `no_trans` varchar(50) DEFAULT NULL,
  `tgl_trans` varchar(50) DEFAULT NULL,
  `no_produk` varchar(50) DEFAULT NULL,
  `no_bp` varchar(50) DEFAULT NULL,
  `unit1` varchar(50) DEFAULT NULL,
  `harga1` varchar(50) DEFAULT NULL,
  `total1` varchar(50) DEFAULT NULL,
  `unit2` varchar(50) DEFAULT NULL,
  `harga2` varchar(50) DEFAULT NULL,
  `total2` varchar(50) DEFAULT NULL,
  `unit3` varchar(50) DEFAULT NULL,
  `harga3` varchar(50) DEFAULT NULL,
  `total3` varchar(50) DEFAULT NULL,
  `status_pro` varchar(50) NOT NULL,
  `status_pen` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kartu_stok_bp`
--

INSERT INTO `kartu_stok_bp` (`no`, `no_trans`, `tgl_trans`, `no_produk`, `no_bp`, `unit1`, `harga1`, `total1`, `unit2`, `harga2`, `total2`, `unit3`, `harga3`, `total3`, `status_pro`, `status_pen`) VALUES
(8, 'CK_001', '2022-07-09 21:12:37', NULL, 'BB_001', '140000', '5700', '798000000', '-', '-', '-', '140000', '5700', '798000000', '0', '0'),
(9, 'PROD1_001', '2022-07-09 21:12:57', NULL, 'BB_001', '-', '-', '-', '140000', '5700', '798000000', '0', '0', '0', '0', '0'),
(10, 'PMBP_001', '2022-07-09 21:14:47', NULL, 'BP_001', '200000', '1000', '200000000', '-', '-', '-', '200000', '1000', '200000000', '0', '0'),
(11, 'PMBP_001', '2022-07-09 21:14:47', NULL, 'BP_002', '200000', '5000', '1000000000', '-', '-', '-', '200000', '5000', '1000000000', '0', '0'),
(12, 'PMBP_001', '2022-07-09 21:14:47', NULL, 'BP_003', '200000', '3000', '600000000', '-', '-', '-', '200000', '3000', '600000000', '0', '0'),
(13, 'PMBP_001', '2022-07-09 21:14:47', NULL, 'BP_004', '200000', '3000', '600000000', '-', '-', '-', '200000', '3000', '600000000', '0', '0'),
(14, 'PMBP_001', '2022-07-09 21:14:47', NULL, 'BP_005', '200000', '1000', '200000000', '-', '-', '-', '200000', '1000', '200000000', '0', '0'),
(15, 'PROD2_001', '2022-07-09 21:32:49', 'PR_003', 'BP_001', '-', '-', '-', '200000', '1000', '200000000', '0', '1000', '0', '0', '0'),
(16, 'PROD2_001', '2022-07-09 21:32:50', 'PR_003', 'BP_002', '-', '-', '-', '200000', '5000', '1000000000', '0', '5000', '0', '0', '0'),
(17, 'PROD2_001', '2022-07-09 21:32:50', 'PR_003', 'BP_003', '-', '-', '-', '200000', '3000', '600000000', '0', '3000', '0', '0', '0'),
(18, 'PROD2_001', '2022-07-09 21:32:50', 'PR_003', 'BP_004', '-', '-', '-', '200000', '3000', '600000000', '0', '3000', '0', '0', '0'),
(19, 'PROD2_001', '2022-07-09 21:32:50', 'PR_003', 'BP_005', '-', '-', '-', '200000', '1000', '200000000', '0', '1000', '0', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `kartu_stok_penj`
--

CREATE TABLE `kartu_stok_penj` (
  `no` int(11) NOT NULL,
  `no_trans` varchar(50) DEFAULT NULL,
  `tgl_trans` varchar(50) DEFAULT NULL,
  `no_produk` varchar(50) DEFAULT NULL,
  `unit1` varchar(50) DEFAULT NULL,
  `harga1` varchar(50) DEFAULT NULL,
  `total1` varchar(50) DEFAULT NULL,
  `unit2` varchar(50) DEFAULT NULL,
  `harga2` varchar(50) DEFAULT NULL,
  `total2` varchar(50) DEFAULT NULL,
  `unit3` varchar(50) DEFAULT NULL,
  `harga3` varchar(50) DEFAULT NULL,
  `total3` varchar(50) DEFAULT NULL,
  `status_pro` varchar(50) DEFAULT NULL,
  `status_pen` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kartu_stok_penj`
--

INSERT INTO `kartu_stok_penj` (`no`, `no_trans`, `tgl_trans`, `no_produk`, `unit1`, `harga1`, `total1`, `unit2`, `harga2`, `total2`, `unit3`, `harga3`, `total3`, `status_pro`, `status_pen`) VALUES
(3, 'PROD1_001', '2022-07-09 21:13:31', 'PR_001', '130000', '6218', '808340000', '-', '-', '-', '130000', '6218', '808340000', '0', '0'),
(4, 'PROD2_001', '2022-07-09 21:32:50', 'PR_003', '10000', '266736', '2667360000', '-', '-', '-', '10000', '266736', '2667360000', '0', '0'),
(5, 'PENJS_001', '2022-07-09 22:07:43', 'PR_001', '-', '-', '-', '130000', '6218', '808340000', '0', '0', '0', '0', '0'),
(6, 'PENJT_001', '2022-07-09 22:10:20', 'PR_003', '-', '-', '-', '8000', '266736', '2133888000', '2000', '266736', '533472000', NULL, NULL),
(7, 'PENJT_002', '2022-07-09 22:13:35', 'PR_003', '-', '-', '-', '3000', '266736', '800208000', '0', '0', '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `konsumen_ips`
--

CREATE TABLE `konsumen_ips` (
  `no_ips` varchar(100) NOT NULL,
  `nama_ips` varchar(100) NOT NULL,
  `notel` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `konsumen_ips`
--

INSERT INTO `konsumen_ips` (`no_ips`, `nama_ips`, `notel`, `alamat`) VALUES
('IPS_001', 'PT. Ultrajaya', '02286700700', 'Jl. Raya Cimareme 131, Padalarang, Bandung'),
('IPS_002', 'Frisian Flag', '0218410945', 'Jl. Raya Bogor KM 5, Pasar Rebo, Jakarta Timur'),
('IPS_003', 'PT. Cimory', ' 0227538770', 'Jalan Batununggal Indah No.61, Mengger, Bandung Ki');

-- --------------------------------------------------------

--
-- Table structure for table `laporan_kartu_stock`
--

CREATE TABLE `laporan_kartu_stock` (
  `id` int(11) NOT NULL,
  `tanggal` datetime NOT NULL DEFAULT current_timestamp(),
  `kode_produk` varchar(255) NOT NULL,
  `mode` varchar(5) NOT NULL,
  `unit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `laporan_kartu_stock`
--

INSERT INTO `laporan_kartu_stock` (`id`, `tanggal`, `kode_produk`, `mode`, `unit`) VALUES
(7, '2022-07-23 22:52:54', 'WSP001', 'in', 3000),
(8, '2022-07-23 22:53:39', 'WSP001', 'out', 3000);

-- --------------------------------------------------------

--
-- Table structure for table `log_bayar_pinjaman`
--

CREATE TABLE `log_bayar_pinjaman` (
  `id` int(11) NOT NULL,
  `id_ref_pinjaman` varchar(255) DEFAULT NULL,
  `waktu_bayar` timestamp NULL DEFAULT current_timestamp(),
  `id_anggota` varchar(255) DEFAULT NULL,
  `nominal` int(11) DEFAULT NULL,
  `kd_coa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_bayar_pinjaman`
--

INSERT INTO `log_bayar_pinjaman` (`id`, `id_ref_pinjaman`, `waktu_bayar`, `id_anggota`, `nominal`, `kd_coa`) VALUES
(1, NULL, '2021-06-29 00:41:56', 'PTRNK_031', 500000, 1111),
(2, NULL, '2021-07-16 00:44:01', 'PTRNK_031', 100000, 1112),
(3, NULL, '2021-07-27 11:02:34', 'PTRNK_031', 100000, 1112),
(4, NULL, '2021-08-12 11:05:36', 'PTRNK_031', 100000, 1112),
(5, NULL, '2021-08-27 11:07:39', 'PTRNK_031', 100000, 1112),
(6, NULL, '2021-09-24 11:25:18', 'PTRNK_031', 100000, 1112),
(9, NULL, '2021-10-09 09:38:48', 'PTRNK_031', 250000, 1111),
(10, NULL, '2021-11-22 15:58:56', 'PTRNK_031', 50000, 1112),
(11, NULL, '2021-12-07 16:01:51', 'PTRNK_031', 50000, 1112),
(12, NULL, '2021-12-22 16:04:59', 'PTRNK_031', 50000, 1112),
(13, NULL, '2022-01-06 16:08:39', 'PTRNK_031', 50000, 1112),
(14, NULL, '2022-01-21 16:09:52', 'PTRNK_031', 50000, 1112),
(15, NULL, '2022-02-08 07:51:22', 'PTRNK_031', 150000, 1111),
(16, NULL, '2022-02-22 07:54:26', 'PTRNK_031', 30000, 1112),
(17, NULL, '2022-03-09 07:56:32', 'PTRNK_031', 30000, 1112),
(18, NULL, '2022-03-24 11:47:31', 'PTRNK_031', 30000, 1112),
(19, NULL, '2022-04-08 11:52:45', 'PTRNK_031', 30000, 1112),
(20, NULL, '2022-04-25 11:54:18', 'PTRNK_031', 30000, 1112),
(21, NULL, '2021-07-21 06:58:59', 'PTRNK_035', 150000, 1111),
(22, NULL, '2021-08-05 07:05:14', 'PTRNK_035', 30000, 1112),
(23, NULL, '2021-08-27 08:25:09', 'PTRNK_035', 30000, 1112),
(24, NULL, '2022-01-20 11:17:42', 'PTRNK_021', 0, 1112);

-- --------------------------------------------------------

--
-- Table structure for table `log_confirm_truck`
--

CREATE TABLE `log_confirm_truck` (
  `id` int(11) NOT NULL,
  `kd_pembelian` varchar(255) DEFAULT NULL,
  `tgl_confirm` date DEFAULT NULL,
  `nama_aset` varchar(255) DEFAULT NULL,
  `id_detail_truck` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `tgl_pengajuan` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_confirm_truck`
--

INSERT INTO `log_confirm_truck` (`id`, `kd_pembelian`, `tgl_confirm`, `nama_aset`, `id_detail_truck`, `status`, `tgl_pengajuan`) VALUES
(1, 'PMB_002', '2020-10-19', 'Truck - IDA-015', 'IDA-015', 1, '2020-10-19 15:56:12'),
(2, 'PMB_003', '2020-11-03', 'Truck - IDA-020', 'IDA-020', 1, '2020-11-03 15:59:19'),
(3, 'PMB_004', '2020-11-18', 'Truck - IDA-015', 'IDA-015', 1, '2020-11-18 16:05:59'),
(4, 'PMB_005', '2020-12-03', 'Truck - IDA-009', 'IDA-009', 1, '2020-12-03 16:07:55'),
(5, 'PMB_006', '2020-12-18', 'Truck - IDA-020', 'IDA-020', 1, '2020-12-18 16:10:25'),
(6, 'PMB_007', '2021-01-04', 'Truck - IDA-018', 'IDA-018', 1, '2021-01-04 16:13:22'),
(7, 'PMB_008', '2021-01-19', 'Truck B - IDA-010', 'IDA-010', 1, '2021-01-19 16:16:50'),
(8, 'PMB_009', '2021-02-03', 'Truck B - IDA-010', 'IDA-010', 1, '2021-02-03 16:23:42'),
(9, 'PMB_010', '2021-02-18', 'Truck - IDA-008', 'IDA-008', 1, '2021-02-18 16:27:37'),
(10, 'PMB_011', '2021-03-05', 'Truck B - IDA-010', 'IDA-010', 1, '2021-03-05 16:30:56'),
(11, 'PMB_013', '2021-04-06', 'Truck B - IDA-012', 'IDA-012', 1, '2021-04-06 16:38:55'),
(12, 'PMB_015', '2021-04-26', 'Truck B - IDA-010', 'IDA-010', 1, '2021-04-26 16:43:53'),
(13, 'PMB_016', '2021-05-12', 'Truck - IDA-015', 'IDA-015', 1, '2021-05-12 16:46:45'),
(14, 'PMB_017', '2021-06-29', 'Truck - IDA-018', 'IDA-018', 1, '2021-06-28 16:49:56'),
(15, 'PMB_026', '2021-06-29', 'Truck B - IDA-010', 'IDA-010', 1, '2021-06-29 14:16:19'),
(16, 'PMB_001', '2021-07-07', 'Truck B - IDA-011', 'IDA-011', 1, '2021-07-06 17:44:17');

-- --------------------------------------------------------

--
-- Table structure for table `log_pembayaran_susu`
--

CREATE TABLE `log_pembayaran_susu` (
  `id` int(11) NOT NULL,
  `id_pembayaran` varchar(255) NOT NULL,
  `id_anggota` varchar(233) NOT NULL,
  `jumlah_liter_susu` int(30) NOT NULL,
  `jumlah_harga_susu` int(30) NOT NULL,
  `simpanan_masuka` int(30) NOT NULL,
  `simpanan_wajib` int(30) NOT NULL DEFAULT 0,
  `pinjaman_anggota` int(30) NOT NULL DEFAULT 0,
  `bayar_tunai` int(255) NOT NULL,
  `subtotal` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_pembayaran_susu`
--

INSERT INTO `log_pembayaran_susu` (`id`, `id_pembayaran`, `id_anggota`, `jumlah_liter_susu`, `jumlah_harga_susu`, `simpanan_masuka`, `simpanan_wajib`, `pinjaman_anggota`, `bayar_tunai`, `subtotal`) VALUES
(1, 'PMBS-301020200001', 'PTRNK_031', 130, 390000, 10000, 2600, 0, 0, 377400),
(2, 'PMBS-021120200002', 'PTRNK_031', 230, 640000, 10000, 4600, 0, 0, 625400),
(3, 'PMBS-171120200002', 'PTRNK_031', 150, 487500, 10000, 3000, 0, 0, 474500),
(4, 'PMBS-021220200002', 'PTRNK_031', 125, 437500, 10000, 2500, 0, 0, 425000),
(5, 'PMBS-171220200002', 'PTRNK_031', 150, 450000, 10000, 3000, 0, 0, 437000),
(6, 'PMBS-010120210002', 'PTRNK_031', 150, 463000, 10000, 3000, 0, 0, 450000),
(7, 'PMBS-180120210002', 'PTRNK_031', 150, 450000, 10000, 3000, 0, 0, 437000),
(8, 'PMBS-020220210002', 'PTRNK_031', 150, 475000, 10000, 3000, 0, 0, 462000),
(9, 'PMBS-170220210002', 'PTRNK_031', 150, 477500, 10000, 3000, 0, 0, 464500),
(10, 'PMBS-040320210002', 'PTRNK_031', 150, 480000, 10000, 3000, 0, 0, 467000),
(11, 'PMBS-190320210002', 'PTRNK_031', 75, 300000, 10000, 1500, 0, 0, 288500),
(12, 'PMBS-050420210002', 'PTRNK_031', 125, 412500, 10000, 2500, 0, 0, 400000),
(13, 'PMBS-200420210002', 'PTRNK_031', 100, 304600, 10000, 2000, 0, 0, 292600),
(14, 'PMBS-100520210002', 'PTRNK_031', 150, 525000, 10000, 3000, 0, 0, 512000),
(15, 'PMBS-260520210002', 'PTRNK_031', 95, 317500, 10000, 1900, 0, 0, 305600),
(16, 'PMBS-060520210002', 'PTRNK_031', 300, 797400, 10000, 6000, 0, 0, 781400),
(17, 'PMBS-160720210002', 'PTRNK_031', 100, 300000, 10000, 2000, 100000, 0, 188000),
(18, 'PMBS-270720210002', 'PTRNK_031', 100, 300000, 10000, 2000, 100000, 0, 188000),
(19, 'PMBS-120820210002', 'PTRNK_031', 120, 360000, 10000, 2400, 100000, 0, 247600),
(20, 'PMBS-270820210002', 'PTRNK_031', 50, 200000, 10000, 1000, 100000, 0, 89000),
(21, 'PMBS-240920210002', 'PTRNK_031', 100, 300000, 10000, 2000, 100000, 0, 188000),
(22, 'PMBS-081020210002', 'PTRNK_031', 45, 135000, 10000, 900, 0, 0, 124100),
(23, 'PMBS-290620210002', 'PTRNK_027', 100, 300000, 10000, 2000, 0, 0, 288000),
(24, 'PMBS-221120210002', 'PTRNK_031', 50, 150000, 10000, 1000, 50000, 0, 89000),
(25, 'PMBS-071220210002', 'PTRNK_031', 10, 30000, 10000, 200, 50000, 30200, 19800),
(26, 'PMBS-221220210002', 'PTRNK_031', 75, 225000, 10000, 1500, 50000, 0, 163500),
(27, 'PMBS-060120220002', 'PTRNK_031', 135, 427500, 10000, 2700, 50000, 0, 364800),
(28, 'PMBS-210120220002', 'PTRNK_031', 65, 195000, 10000, 1300, 50000, 0, 133700),
(29, 'PMBS-070220220002', 'PTRNK_031', 95, 285000, 10000, 1900, 0, 0, 273100),
(30, 'PMBS-220220220002', 'PTRNK_031', 50, 250000, 10000, 1000, 30000, 0, 209000),
(31, 'PMBS-090320220002', 'PTRNK_031', 12, 12000, 10000, 240, 30000, 28240, 1760),
(32, 'PMBS-240320220002', 'PTRNK_031', 50, 150000, 10000, 1000, 30000, 0, 109000),
(33, 'PMBS-080420220002', 'PTRNK_031', 25, 75000, 10000, 500, 30000, 0, 34500),
(34, 'PMBS-250420220002', 'PTRNK_031', 20, 60000, 10000, 400, 30000, 0, 19600),
(35, 'PMBS-120520220002', 'PTRNK_031', 100, 300000, 10000, 2000, 0, 0, 288000),
(36, 'PMBS-160120200002', 'PTRNK_035', 110, 365000, 10000, 2200, 0, 0, 352800),
(37, 'PMBS-310120200002', 'PTRNK_035', 100, 250000, 10000, 2000, 0, 0, 238000),
(38, 'PMBS-170220200003', 'PTRNK_035', 95, 295000, 10000, 1900, 0, 0, 283100),
(39, 'PMBS-020420200003', 'PTRNK_035', 65, 195000, 10000, 1300, 0, 0, 183700),
(40, 'PMBS-170420200003', 'PTRNK_035', 50, 150000, 10000, 1000, 0, 0, 139000),
(41, 'PMBS-040520200003', 'PTRNK_035', 125, 375000, 10000, 2500, 0, 0, 362500),
(42, 'PMBS-200520200003', 'PTRNK_035', 90, 360000, 10000, 1800, 0, 0, 348200),
(43, 'PMBS-050620200003', 'PTRNK_035', 55, 220000, 10000, 1100, 0, 0, 208900),
(44, 'PMBS-220620200003', 'PTRNK_035', 33, 99000, 10000, 660, 0, 0, 88340),
(45, 'PMBS-080720200003', 'PTRNK_035', 100, 300000, 10000, 2000, 0, 0, 288000),
(46, 'PMBS-240720200003', 'PTRNK_035', 75, 225000, 10000, 1500, 0, 0, 213500),
(47, 'PMBS-100820200003', 'PTRNK_035', 55, 165000, 10000, 1100, 0, 0, 153900),
(48, 'PMBS-260820200003', 'PTRNK_035', 90, 270000, 10000, 1800, 0, 0, 258200),
(49, 'PMBS-110920200003', 'PTRNK_035', 65, 195000, 10000, 1300, 0, 0, 183700),
(50, 'PMBS-280920200003', 'PTRNK_035', 75, 225000, 10000, 1500, 0, 0, 213500),
(51, 'PMBS-141020200003', 'PTRNK_035', 150, 450000, 10000, 3000, 0, 0, 437000),
(52, 'PMBS-210720210003', 'PTRNK_035', 50, 150000, 10000, 1000, 0, 0, 139000),
(53, 'PMBS-050820210003', 'PTRNK_035', 100, 300000, 10000, 2000, 30000, 0, 258000),
(54, 'PMBS-270820210003', 'PTRNK_035', 150, 450000, 10000, 3000, 30000, 0, 407000),
(55, 'PMBS-150720210003', 'PTRNK_036', 100, 350000, 10000, 2000, 0, 0, 338000),
(56, 'PMBS-200120220003', 'PTRNK_016', 100, 450000, 10000, 2000, 0, 0, 438000),
(57, 'PMBS-040220220003', 'PTRNK_016', 650, 2515000, 10000, 13000, 0, 0, 2492000),
(58, 'PMBS-200120220004', 'PTRNK_021', 450, 1975000, 10000, 9000, 0, 0, 1956000),
(59, 'PMBS-020720220005', 'PTRNK_037', 100, 570000, 10000, 2000, 0, 0, 558000),
(60, 'PMBS-020720220006', 'PTRNK_038', 50, 285000, 10000, 1000, 0, 0, 274000),
(61, 'PMBS-020720220007', 'PTRNK_039', 30, 171000, 10000, 600, 0, 0, 160400),
(62, 'PMBS-230720220001', 'PTRNK_041', 550, 3135000, 10000, 11000, 0, 0, 3114000),
(63, 'PMBS-230720220002', 'PTRNK_042', 400, 2280000, 10000, 8000, 0, 0, 2262000),
(64, 'PMBS-230720220003', 'PTRNK_043', 200, 1140000, 10000, 4000, 0, 0, 1126000);

-- --------------------------------------------------------

--
-- Table structure for table `log_penyusutan`
--

CREATE TABLE `log_penyusutan` (
  `id` int(11) NOT NULL,
  `id_penyusutan` varchar(255) NOT NULL,
  `id_detail` varchar(111) NOT NULL,
  `nilai_akhir` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_penyusutan`
--

INSERT INTO `log_penyusutan` (`id`, `id_penyusutan`, `id_detail`, `nilai_akhir`) VALUES
(1, 'PNY20201225001', 'IDA-001', 5770833),
(2, 'PNY20210125002', 'IDA-001', 5541666),
(3, 'PNY20201225003', 'IDA-002', 2512500),
(4, 'PNY20210125004', 'IDA-002', 2375000),
(5, 'PNY20201226005', 'IDA-003', 7429166),
(7, 'PNY20210126006', 'IDA-003', 7208332),
(8, 'PNY20210102007', 'IDA-004', 118116115),
(9, 'PNY20210614008', 'IDA-009', 89666666),
(10, 'PNY20210616009', 'IDA-020', 122098244),
(11, 'PNY20210716010', 'IDA-020', 121073242),
(12, 'PNY20210617011', 'IDA-019', 122098244),
(13, 'PNY20210617012', 'IDA-021', 1016666),
(17, 'PNY20210717013', 'IDA-021', 933332),
(18, 'PNY20210817014', 'IDA-021', 849998),
(19, 'PNY20210621015', 'IDA-022', 1016666),
(22, 'PNY20210721016', 'IDA-022', 933332),
(23, 'PNY20210703017', 'IDA-024', 5750000),
(26, 'PNY20210803018', 'IDA-024', 5500000),
(27, 'PNY20210903019', 'IDA-024', 5250000),
(28, 'PNY20220709001', 'IDA-025', 140125000),
(29, 'PNY20220709001', 'IDA-026', 186833333);

-- --------------------------------------------------------

--
-- Table structure for table `log_pinjaman`
--

CREATE TABLE `log_pinjaman` (
  `id` int(11) NOT NULL,
  `id_ref` varchar(50) DEFAULT NULL,
  `kode_pinjaman` varchar(255) NOT NULL,
  `id_anggota` varchar(255) NOT NULL,
  `tanggal_pinjaman` date NOT NULL,
  `nominal` int(255) NOT NULL DEFAULT 0,
  `status` varchar(1) NOT NULL DEFAULT '1',
  `sisa_pinjaman` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_pinjaman`
--

INSERT INTO `log_pinjaman` (`id`, `id_ref`, `kode_pinjaman`, `id_anggota`, `tanggal_pinjaman`, `nominal`, `status`, `sisa_pinjaman`) VALUES
(1, NULL, 'SP20210629001', 'PTRNK_031', '2021-06-29', 500000, '0', 0),
(4, NULL, 'SP20211009002', 'PTRNK_031', '2021-10-09', 250000, '0', 0),
(5, NULL, 'SP20220208003', 'PTRNK_031', '2022-02-08', 150000, '0', 0),
(6, NULL, 'SP20210721004', 'PTRNK_035', '2021-07-21', 150000, '1', 90000);

-- --------------------------------------------------------

--
-- Table structure for table `log_simpanan_hr`
--

CREATE TABLE `log_simpanan_hr` (
  `id` int(11) NOT NULL,
  `kode_simpanan_hr` varchar(255) NOT NULL,
  `tgl_simpanan` date NOT NULL,
  `id_anggota` varchar(255) NOT NULL,
  `nominal` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_simpanan_hr`
--

INSERT INTO `log_simpanan_hr` (`id`, `kode_simpanan_hr`, `tgl_simpanan`, `id_anggota`, `nominal`) VALUES
(1, 'SHR-0001', '2021-06-27', 'PTRNK_025', 500000),
(2, 'SHR-0002', '2020-11-02', 'PTRNK_031', 50000),
(3, 'SHR-0003', '2021-07-14', 'PTRNK_031', 200000),
(4, 'SHR-0004', '2021-07-21', 'PTRNK_035', 100000),
(5, 'SHR-0005', '2021-07-21', 'PTRNK_015', 100000);

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id` int(11) NOT NULL,
  `id_jabatan` varchar(50) DEFAULT NULL,
  `id_ptkp` varchar(11) DEFAULT '0',
  `id_jenis_pegawai` varchar(50) DEFAULT NULL,
  `pendidikan` varchar(50) DEFAULT NULL,
  `rfid` varchar(50) NOT NULL,
  `nip` varchar(50) NOT NULL,
  `npwp` varchar(50) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_telp` varchar(255) DEFAULT NULL,
  `tempat_lahir` varchar(255) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `nama_bank` varchar(255) DEFAULT NULL,
  `no_rek` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT '1',
  `status_kredit` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `riwayat_pendidikan` varchar(255) NOT NULL,
  `jurusan_pendidikan` varchar(255) NOT NULL,
  `agama` varchar(255) DEFAULT NULL,
  `jenis_kelamin` varchar(1) NOT NULL DEFAULT 'L',
  `no_anggota` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id`, `id_jabatan`, `id_ptkp`, `id_jenis_pegawai`, `pendidikan`, `rfid`, `nip`, `npwp`, `nama`, `alamat`, `no_telp`, `tempat_lahir`, `tgl_lahir`, `nama_bank`, `no_rek`, `status`, `status_kredit`, `created_at`, `riwayat_pendidikan`, `jurusan_pendidikan`, `agama`, `jenis_kelamin`, `no_anggota`) VALUES
(8, 'Staff', '', 'Kontrak', 'sma', '111', '111', '111111', 'Heni', 'Bandung', '0898998989', 'Bandung', '1998-03-01', 'Mandiri', '11223321', '1', 0, '2021-12-04 11:17:34', '', '', 'islam', 'L', 'ANGGT_0040'),
(9, 'Staff', 'TK0', 'Tetap', 's1', '1029384756', '1029384756', '1029384756', 'Andi', 'bandung', '1029384756', 'bandung', '1991-03-03', 'BCA', '123123123', '1', 0, '2021-12-15 07:10:28', '', '', 'buddha', 'L', 'ANGGT_0041'),
(11, 'Staff', '', 'Kontrak', 's2', '323123', '8003250622757', '123142', 'ela', 'aawd', '213213', 'awdsdad', '2003-02-02', 'BCA', '232323232323', '1', 0, '2022-06-25 16:20:07', 'sma, s1', 'rpl', 'kristen', 'P', 'ANGGT_0042'),
(12, 'Staff', 'TK1', 'Tetap', 's1', '123232323', '1608260622758', '12314222', 'robi', 'awdawd', '1231232333', 'Pekanbaru', '2022-06-26', NULL, '333333333333333', '1', 0, '2022-06-26 01:59:31', '', 'it', 'hindu', 'L', 'ANGGT_0043'),
(13, 'Sr Programmer ', 'TK2', 'Tetap', 's1', '24123234', '9200270622759', '2424244', 'ramli', 'awwdwad', '123124434', 'awdawdawd', '2000-02-02', NULL, '339391239', '1', 0, '2022-05-27 01:51:36', '', 'rpl', 'Islam', 'L', 'ANGGT_0044'),
(15, 'Staff', 'TK0', 'Kontrak', 's2', '111111', '1044020722760', '23424', 'tesuser', 'apwodkpakda', '948928471', 'jdiajwdsda', '2000-02-20', NULL, '444444', '1', 0, '2022-07-01 17:14:40', 's1', 'rpl', 'Islam', 'L', 'ANGGT_0045'),
(16, 'Staff', 'TK0', 'Tetap', 's1', '24421424', '5016030722761', '1212313', 'rafli', 'aowdoakwd', '920480948', 'jkwdoaijwd', '1999-02-20', NULL, '3333333333333332', '1', 0, '2022-07-03 10:19:29', '', 'rpl', 'Kristen', 'P', 'ANGGT_0047'),
(17, 'Staff', 'TK0', 'Tetap', 's1', '3234235', '5325080722762', '2421525', 'tes userr', '3dwad', '241421521', 'dawdwda', '2000-07-08', 'BCA', '24142142424', '1', 0, '2022-07-08 02:25:18', 's1, s1', 'rpl', 'Islam', 'L', 'ANGGT_0048');

-- --------------------------------------------------------

--
-- Table structure for table `pembagian`
--

CREATE TABLE `pembagian` (
  `no_trans` varchar(50) NOT NULL,
  `tgl_trans` varchar(50) NOT NULL,
  `no_trans_produksi1` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `status_penjs` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembagian`
--

INSERT INTO `pembagian` (`no_trans`, `tgl_trans`, `no_trans_produksi1`, `status`, `status_penjs`) VALUES
('PGB_001', '2022-07-09', 'PROD1_001', '2', '1');

-- --------------------------------------------------------

--
-- Table structure for table `pembagian_shu`
--

CREATE TABLE `pembagian_shu` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `id_trans` varchar(255) DEFAULT NULL,
  `id_anggota` varchar(255) DEFAULT NULL,
  `jasa_modal` int(50) DEFAULT NULL,
  `jasa_anggota` int(50) DEFAULT NULL,
  `sisa_hasil_usaha` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pembagian_shu_total`
--

CREATE TABLE `pembagian_shu_total` (
  `id` int(11) NOT NULL,
  `id_trans` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `no_trans` varchar(50) NOT NULL,
  `tgl_trans` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaranv`
--

CREATE TABLE `pembayaranv` (
  `no_trans` varchar(50) NOT NULL,
  `tgl_trans` varchar(50) NOT NULL,
  `no_trans_penj` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran_susu`
--

CREATE TABLE `pembayaran_susu` (
  `kode_pembayaran` varchar(255) NOT NULL,
  `total_bayar` int(20) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `is_paid` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembayaran_susu`
--

INSERT INTO `pembayaran_susu` (`kode_pembayaran`, `total_bayar`, `tgl_transaksi`, `is_paid`) VALUES
('PMBS-230720220001', 3114000, '2022-07-23', 1),
('PMBS-230720220002', 2262000, '2022-07-23', 1),
('PMBS-230720220003', 1126000, '2022-07-23', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_aset`
--

CREATE TABLE `pembelian_aset` (
  `id_pembelian` varchar(255) NOT NULL,
  `no_nota` varchar(255) NOT NULL,
  `total` varchar(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `tgl_input` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian_aset`
--

INSERT INTO `pembelian_aset` (`id_pembelian`, `no_nota`, `total`, `status`, `tgl_input`) VALUES
('PMBAST20220709001', 'NOTA20220709001', '151500000', 'selesai', '2022-07-09'),
('PMBAST20220709002', 'NOTA20220709002', '202000000', 'selesai', '2022-07-09');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_bb`
--

CREATE TABLE `pembelian_bb` (
  `id` int(11) NOT NULL,
  `no_trans` varchar(100) NOT NULL,
  `tgl_trans` date NOT NULL,
  `total` int(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `id_detail_truck` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian_bb`
--

INSERT INTO `pembelian_bb` (`id`, `no_trans`, `tgl_trans`, `total`, `status`, `id_detail_truck`) VALUES
(2, 'PMB_001', '2022-07-09', 855000000, '2', 0),
(3, 'PMB_002', '2022-07-09', 6555000, '1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_bp`
--

CREATE TABLE `pembelian_bp` (
  `no_trans` varchar(100) NOT NULL,
  `tgl_trans` varchar(100) NOT NULL,
  `total` int(100) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian_bp`
--

INSERT INTO `pembelian_bp` (`no_trans`, `tgl_trans`, `total`, `status`) VALUES
('PMBP_001', '2022-07-09', 2147483647, '1');

-- --------------------------------------------------------

--
-- Table structure for table `penerimaan_kas`
--

CREATE TABLE `penerimaan_kas` (
  `id` int(11) NOT NULL,
  `id_penerimaan` varchar(50) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `sumber` varchar(50) DEFAULT NULL,
  `jenis_penerimaan` varchar(50) DEFAULT NULL,
  `jenis_pembayaran` varchar(50) DEFAULT NULL,
  `nominal` varchar(255) DEFAULT NULL,
  `bukti_trf` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penerimaan_pengeluaran_kas`
--

CREATE TABLE `penerimaan_pengeluaran_kas` (
  `id` int(11) NOT NULL,
  `periode` varchar(50) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `no_dokumen` varchar(255) DEFAULT NULL,
  `jenis_transaksi` varchar(255) DEFAULT NULL,
  `tipe_pembayaran` varchar(255) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penerimaan_pengeluaran_kas`
--

INSERT INTO `penerimaan_pengeluaran_kas` (`id`, `periode`, `tanggal`, `no_dokumen`, `jenis_transaksi`, `tipe_pembayaran`, `deskripsi`, `file`) VALUES
(1, '202206', '2022-06-15', 'TESTING DOKUMEN SALMA', '', '', '', ''),
(2, '202206', '2022-06-15', 'testing dokumen 2', 'pengeluaran kas', 'tunai', 'test', ''),
(3, '202206', '2022-06-15', 'testing jurnal', 'pengeluaran kas', 'tunai', 'testing untuk insert ke jurnal', ''),
(4, '202206', '2022-06-22', '123', 'pengeluaran kas', 'tunai', 'owno', 'av.png'),
(5, '202206', '2022-06-22', '111', 'penerimaan kas', 'tunai', 'kas kecil', ''),
(6, '202206', '2022-06-22', '414', 'pengeluaran kas', 'tunai', 'biaya listrik', ''),
(7, '202206', '2022-06-22', '4232', 'pengeluaran kas', 'tunai', 'biaya listrik ', ''),
(8, '202206', '2022-06-22', '2314', 'pengeluaran kas', 'tunai', 'biaya listrik', ''),
(9, '202206', '2022-06-26', 'penjualan aktiva tetap', 'penerimaan kas', 'tunai', 'penjualan aktiva tetap', ''),
(10, '202207', '2022-07-01', 'fefefqfwfwf', 'penerimaan kas', 'tunai', 'adada', 'PenerimaanPengeluaranKas_fefefqfwfwf.png'),
(12, '202207', '2022-07-28', 'adwdwedxdf', 'penerimaan kas', 'tunai', 'kas kecil', 'PenerimaanPengeluaranKas_adwdwedxdf.sql'),
(13, '202207', '2022-07-08', '001', 'penerimaan kas', 'tunai', 'piutang', 'PenerimaanPengeluaranKas_001.txt'),
(14, '202207', '2022-07-08', '0002', 'penerimaan kas', 'tunai', 'kas', 'PenerimaanPengeluaranKas_0002.md'),
(15, '202207', '2022-07-08', '0003', 'penerimaan kas', 'tunai', 'kass', 'PenerimaanPengeluaranKas_0003.rst'),
(16, '202207', '2022-07-08', '0004', 'penerimaan kas', 'tunai', 'y', 'PenerimaanPengeluaranKas_0004.md'),
(17, '202207', '2022-07-09', 'ofas', 'penerimaan kas', 'tunai', 'penerimaan', 'PenerimaanPengeluaranKas_ofas.ico');

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan_bonus`
--

CREATE TABLE `pengajuan_bonus` (
  `id` int(11) NOT NULL,
  `id_pengajuan` varchar(255) NOT NULL,
  `periode` varchar(255) NOT NULL,
  `nip` int(20) NOT NULL,
  `nominal` int(50) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan_jurnal`
--

CREATE TABLE `pengajuan_jurnal` (
  `id` int(11) NOT NULL,
  `kode` varchar(50) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `nominal` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'pending',
  `jenis` varchar(50) DEFAULT NULL,
  `bukti_pembayaran` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengajuan_jurnal`
--

INSERT INTO `pengajuan_jurnal` (`id`, `kode`, `tanggal`, `nominal`, `status`, `jenis`, `bukti_pembayaran`) VALUES
(1, 'PMBWASERDA230722001', '2022-07-23', 5827500, 'selesai', 'Pembelian Barang Waserda', NULL),
(2, 'PNJWASERDA230722001', '2022-07-23', 8325000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(3, 'PNGBBN20220723003', '2022-07-23', 20000, 'selesai', 'pengeluaran_beban', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pengeluaran_kas`
--

CREATE TABLE `pengeluaran_kas` (
  `id` int(11) NOT NULL,
  `id_pengeluaran` varchar(50) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `sumber_pengeluaran` varchar(50) DEFAULT NULL,
  `jenis_pengeluaran` varchar(50) DEFAULT NULL,
  `jenis_pembayaran` varchar(50) DEFAULT NULL,
  `nominal` varchar(255) DEFAULT NULL,
  `bukti_trf` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_ips`
--

CREATE TABLE `penjualan_ips` (
  `no_trans` varchar(100) NOT NULL,
  `tgl_trans` date NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `total` int(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `status_pembyv` varchar(50) DEFAULT NULL,
  `no_trans_pembg` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan_ips`
--

INSERT INTO `penjualan_ips` (`no_trans`, `tgl_trans`, `jumlah`, `total`, `status`, `status_pembyv`, `no_trans_pembg`) VALUES
('PENJS_001', '2022-07-09', '130000', 1050842000, '1', NULL, 'PGB_001');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_toko`
--

CREATE TABLE `penjualan_toko` (
  `no_trans` varchar(50) NOT NULL,
  `tgl_trans` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `status_pembyv` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan_toko`
--

INSERT INTO `penjualan_toko` (`no_trans`, `tgl_trans`, `total`, `status`, `status_pembyv`) VALUES
('PENJT_001', '2022-07-09', '2793658400', '1', NULL),
('PENJT_002', '2022-07-09', '1040270400', '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `penyusutan`
--

CREATE TABLE `penyusutan` (
  `id_penyusutan` varchar(255) NOT NULL,
  `tgl_input` date NOT NULL,
  `id_detail` varchar(111) NOT NULL,
  `bulan_penyusutan` varchar(255) NOT NULL,
  `total_penyusutan` int(255) NOT NULL,
  `akumulasi_peny` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penyusutan`
--

INSERT INTO `penyusutan` (`id_penyusutan`, `tgl_input`, `id_detail`, `bulan_penyusutan`, `total_penyusutan`, `akumulasi_peny`) VALUES
('PNY20220709001', '2022-07-09', 'IDA-026', 'July 2022', 15166666, 15166666);

-- --------------------------------------------------------

--
-- Table structure for table `perbaikan`
--

CREATE TABLE `perbaikan` (
  `id` int(11) NOT NULL,
  `id_perbaikan` varchar(255) DEFAULT NULL,
  `id_detail_aset` varchar(255) DEFAULT NULL,
  `tgl_perbaikan` date DEFAULT NULL,
  `ket_perbaikan` varchar(255) DEFAULT NULL,
  `nilai_perbaikan` int(20) DEFAULT NULL,
  `nilai_revaluasi` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perbaikan`
--

INSERT INTO `perbaikan` (`id`, `id_perbaikan`, `id_detail_aset`, `tgl_perbaikan`, `ket_perbaikan`, `nilai_perbaikan`, `nilai_revaluasi`) VALUES
(1, 'PRB20210717001', 'IDA-019', '2021-07-17', 'service', 150000, 1261),
(2, 'PRB20210717002', 'IDA-021', '2021-06-17', 'Test', 250000, 22727),
(4, 'PRB20210721003', 'IDA-022', '2021-07-21', 'testing revaluasi', 250000, 22727),
(5, 'PRB20210803004', 'IDA-024', '2021-08-03', 'Testing aset perbaikan', 500000, 45455);

-- --------------------------------------------------------

--
-- Table structure for table `peternak`
--

CREATE TABLE `peternak` (
  `no_peternak` varchar(100) NOT NULL,
  `nama_peternak` varchar(100) NOT NULL,
  `notel` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `deposit` varchar(233) DEFAULT NULL,
  `pinjaman` int(255) NOT NULL DEFAULT 0,
  `kd_tps` varchar(255) DEFAULT NULL,
  `nm_peternakan` varchar(255) NOT NULL,
  `is_deactive` tinyint(1) NOT NULL DEFAULT 0,
  `status_kredit` tinyint(1) NOT NULL DEFAULT 0,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `no_anggota` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peternak`
--

INSERT INTO `peternak` (`no_peternak`, `nama_peternak`, `notel`, `alamat`, `deposit`, `pinjaman`, `kd_tps`, `nm_peternakan`, `is_deactive`, `status_kredit`, `create_date`, `no_anggota`) VALUES
('PTRNK_001', 'Andi', '081297276888', 'Cimahi', NULL, 0, NULL, '', 1, 1, '2022-07-27 17:44:31', 'ANGGT_0001'),
('PTRNK_002', 'Joko', '0811301180', 'Bandung', NULL, 0, NULL, '', 1, 0, '2022-07-27 17:42:31', 'ANGGT_0002'),
('PTRNK_003', 'Budi', '082337317510', 'Bandung Barat', NULL, 0, NULL, '', 1, 0, '2022-07-28 02:34:47', 'ANGGT_0003'),
('PTRNK_004', 'Adi', '082293294071', 'Lembang', NULL, 0, NULL, '', 1, 0, '2022-07-06 16:30:37', 'ANGGT_0004'),
('PTRNK_005', 'Indra', '082113572468', 'Cimahi', NULL, 0, NULL, '', 1, 0, '2022-06-30 10:59:53', 'ANGGT_0005'),
('PTRNK_006', 'Asep', '081284871175', 'Padalarang', NULL, 0, NULL, '', 1, 0, '2022-06-30 10:59:53', 'ANGGT_0006'),
('PTRNK_007', 'Andre', '082117675927', 'Bandung', NULL, 0, NULL, '', 1, 0, '2022-06-30 10:59:53', 'ANGGT_0007'),
('PTRNK_008', 'Azis', '082285701109', 'Bandung Barat', NULL, 0, NULL, '', 1, 0, '2022-06-30 10:59:53', 'ANGGT_0008'),
('PTRNK_009', 'Arif', '082170370037', 'Cimahi', NULL, 0, NULL, '', 1, 0, '2022-06-30 10:59:53', 'ANGGT_0009'),
('PTRNK_010', 'Ibrahim', '082126407059', 'Padalarang', NULL, 0, NULL, '', 1, 0, '2022-06-30 10:59:53', 'ANGGT_0010'),
('PTRNK_011', 'Agung', '082214902233', 'Bandung', NULL, 0, NULL, '', 0, 1, '2022-06-30 10:59:53', 'ANGGT_0011'),
('PTRNK_012', 'Adit', '08112009484', 'Lembang', NULL, 0, NULL, '', 1, 0, '2022-06-30 10:59:53', 'ANGGT_0012'),
('PTRNK_013', 'Gatot', '081295861043', 'Bandung', NULL, 0, NULL, '', 1, 0, '2022-06-30 10:59:53', 'ANGGT_0013'),
('PTRNK_014', 'Taufiq', '081231197192', 'Cimahi', NULL, 0, NULL, '', 1, 0, '2022-06-30 10:59:53', 'ANGGT_0014'),
('PTRNK_015', 'Iwan', '081259468020', 'Bandung Barat', NULL, 0, NULL, '', 0, 0, '2022-06-30 10:59:53', 'ANGGT_0015'),
('PTRNK_016', 'dede', '087877472553', 'bekasi', '25000', 0, NULL, '', 0, 1, '2022-06-30 10:59:53', 'ANGGT_0016'),
('PTRNK_017', 'Dina', '087877472553', 'asdasd', '25000', 0, NULL, '', 1, 0, '2022-07-06 16:38:42', 'ANGGT_0017'),
('PTRNK_018', 'Hanni', '123123123', 'Sukabumi', '25000', 0, NULL, '', 0, 0, '2022-06-30 10:59:53', 'ANGGT_0018'),
('PTRNK_019', 'Andri', '321232123', 'bandung', '25000', 0, NULL, '', 0, 0, '2022-06-30 10:59:53', 'ANGGT_0019'),
('PTRNK_020', 'Rari', '1231231', 'Sukabumi', '25000', 3000000, NULL, '', 1, 0, '2022-07-06 16:38:55', 'ANGGT_0020'),
('PTRNK_021', 'Desi', '09829123112', 'ASDS', '25000', 0, 'TPS_001', '', 0, 0, '2022-07-06 16:39:05', 'ANGGT_0021'),
('PTRNK_022', 'Dono', '3332211223', 'Bekasi', '25000', 0, NULL, '', 1, 0, '2022-07-06 16:39:23', 'ANGGT_0022'),
('PTRNK_023', 'Galih', '08756315223', 'jl, cijeruk, lembang selatan', '25000', 693900, 'TPS_003', 'Sumber Susu', 1, 0, '2022-06-30 10:59:53', 'ANGGT_0023'),
('PTRNK_024', 'Jonas', '08158274222', 'Jl, Cisaat, Lembang', '25000', 0, 'TPS_001', 'Makmur Jaya', 1, 0, '2022-06-30 10:59:53', 'ANGGT_0024'),
('PTRNK_025', 'Yona', '08225544667', 'jl. ciraray, Lembang ', '25000', 500000, 'TPS_001', 'Abadi Jaya', 0, 0, '2022-06-30 10:59:53', 'ANGGT_0025'),
('PTRNK_026', 'Tina', '0822516271', 'jl, cirumput, lembang selatan', '25000', 0, 'TPS_003', 'Ternak Bahagia', 1, 0, '2022-06-30 10:59:53', 'ANGGT_0026'),
('PTRNK_027', 'Ucup', '08951432517', 'jl, cimenyan, lembang', '25000', 0, 'TPS_001', 'Bima Sakti', 1, 0, '2022-06-30 10:59:53', 'ANGGT_0027'),
('PTRNK_028', 'Dafa', '1212123123', 'asdasd', '25000', 0, 'TPS_003', 'test', 1, 0, '2022-07-06 16:39:32', 'ANGGT_0028'),
('PTRNK_029', 'Sinta', '231321321', 'bandung', '25000', 0, 'TPS_002', 'aaa', 1, 0, '2022-07-06 16:39:39', 'ANGGT_0029'),
('PTRNK_030', 'Yuvita', '12332112322', 'lembang utara', '25000', 0, 'TPS_001', 'aaa', 1, 0, '2022-07-06 16:39:49', 'ANGGT_0030'),
('PTRNK_031', 'Hanifah ', '082219738419', 'Jl. wijaya kusumah, lembang utara', '25000', 150000, 'TPS_004', 'Berkah Selalu', 0, 0, '2022-06-30 10:59:53', 'ANGGT_0031'),
('PTRNK_032', 'Rizky', '0876525262', 'jalanjalan', '25000', 0, 'TPS_001', 'testingggg', 1, 0, '2022-07-06 16:40:03', 'ANGGT_0032'),
('PTRNK_033', 'Galang', '0822176282', 'coba', '25000', 0, 'TPS_001', 'bismillah', 1, 0, '2022-07-06 16:40:18', 'ANGGT_0033'),
('PTRNK_034', 'Rozak', '082219765426', 'jl. cibiru', '25000', 0, 'TPS_001', 'Fresh milk', 0, 1, '2022-06-30 10:59:53', 'ANGGT_0034'),
('PTRNK_035', 'Budi', '08228172615', 'jl. cikidang, lembang selatan', '25000', 150000, 'TPS_003', 'Abadi Ternak', 0, 0, '2022-07-28 02:34:47', 'ANGGT_0035'),
('PTRNK_036', 'Galih', '082222334455', 'jl. ciaul, lembang', '25000', 0, 'TPS_001', 'Go farm', 0, 0, '2022-06-30 10:59:53', 'ANGGT_0036'),
('PTRNK_037', 'ani', '123456', 'dwd', '25000', 0, 'TPS_001', 'aji', 0, 0, '2022-06-30 10:59:53', 'ANGGT_0037'),
('PTRNK_038', 'Taufik', '13241', 'zczc', '25000', 0, 'TPS_001', 'dsdaw', 0, 0, '2022-07-01 17:19:07', 'ANGGT_0038'),
('PTRNK_039', 'Denis', '3232', 'faw', '25000', 0, 'TPS_001', 'peternakan a', 0, 0, '2022-07-06 16:40:32', 'ANGGT_0039'),
('PTRNK_040', 'Adu', '92832983', 'hdadadwda', '50000', 0, 'TPS_003', 'ijidwjiwjd', 0, 0, '2022-07-01 17:16:45', 'ANGGT_0046'),
('PTRNK_041', 'Si A', '2309019274', 'aiwkdjaow', '50000', 0, 'TPS_001', 'awokdowkdpoj', 0, 0, '2022-07-09 15:27:02', 'ANGGT_0049'),
('PTRNK_042', 'Si B', '214214', 'awdawd', '50000', 0, 'TPS_003', 'awdwdawd', 0, 0, '2022-07-09 15:27:16', 'ANGGT_0050'),
('PTRNK_043', 'Si C', '21412455125', 'awdawdawd', '50000', 0, 'TPS_004', 'awdawdsdawd', 0, 0, '2022-07-09 15:27:29', 'ANGGT_0051');

-- --------------------------------------------------------

--
-- Table structure for table `pinjaman`
--

CREATE TABLE `pinjaman` (
  `id` int(11) NOT NULL,
  `kode_pinjaman` varchar(255) NOT NULL,
  `id_anggota` varchar(255) NOT NULL,
  `jumlah_pinjaman` int(255) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pnj_susu`
--

CREATE TABLE `pnj_susu` (
  `id` int(20) NOT NULL,
  `kd_pnj_susu` varchar(50) DEFAULT NULL,
  `nm_pelanggan` varchar(50) DEFAULT NULL,
  `total` int(20) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jenis_pnj_susu` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pnj_susu`
--

INSERT INTO `pnj_susu` (`id`, `kd_pnj_susu`, `nm_pelanggan`, `total`, `status`, `tanggal`, `jenis_pnj_susu`) VALUES
(1, 'PNJPKN20211202001', '7', 400000, 'selesai', '2021-12-02', 'pakan_konsentrat'),
(2, 'PNJS20211202001', 'test', 7000, 'selesai', '2021-12-02', 'susu_murni'),
(3, 'PNJPKN20211202002', '7', 25000, 'selesai', '2021-12-02', 'pakan_konsentrat'),
(4, 'PNJSO20211202001', '123', 5000, 'selesai', '2021-12-02', 'susu_olahan'),
(5, 'PNJS20211202002', 'test jurnal', 1150000, 'selesai', '2021-12-02', 'susu_murni'),
(6, 'PNJPKN20211202003', '7', 25000, 'selesai', '2021-12-02', 'pakan_konsentrat'),
(7, 'PNJPKN20211202004', '7', 25000, 'selesai', '2021-12-02', 'pakan_konsentrat'),
(8, 'PNJS20211216003', 'sarah', 450000, 'selesai', '2021-12-16', 'susu_murni'),
(9, 'PNJPKN20211216005', 'Rozak', 2500000, 'selesai', '2021-12-16', 'pakan_konsentrat'),
(10, 'PNJSO20211216002', 'Test', 500000, 'selesai', '2021-12-16', 'susu_olahan'),
(11, 'PNJSO20211216003', 'aa', 157500, 'selesai', '2021-12-16', 'susu_olahan'),
(12, 'PNJS20220109004', 'Dd', 123300, 'selesai', '2022-01-09', 'susu_murni'),
(13, 'PNJPKN20220109006', 'dede', 15000000, 'selesai', '2022-01-09', 'pakan_konsentrat'),
(14, 'PNJS20220702005', 'agus', 700000, 'selesai', '2022-07-02', 'susu_murni'),
(15, 'PNJS20220702006', 'anto', 350000, 'selesai', '2022-07-02', 'susu_murni');

-- --------------------------------------------------------

--
-- Table structure for table `pos_detail_pembelian`
--

CREATE TABLE `pos_detail_pembelian` (
  `id` int(11) NOT NULL,
  `invoice` varchar(50) DEFAULT NULL,
  `id_supplier` varchar(50) DEFAULT NULL,
  `id_produk` varchar(50) DEFAULT NULL,
  `harga_satuan` int(11) DEFAULT NULL,
  `jml` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `tanggal_kadaluwarsa` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pos_detail_pembelian`
--

INSERT INTO `pos_detail_pembelian` (`id`, `invoice`, `id_supplier`, `id_produk`, `harga_satuan`, `jml`, `status`, `tanggal_kadaluwarsa`) VALUES
(2, 'PMBWASERDA230722001', 'WSS001', 'WSP001', 1750, 3000, 'selesai', '2027-01-23');

-- --------------------------------------------------------

--
-- Table structure for table `pos_detail_penjualan`
--

CREATE TABLE `pos_detail_penjualan` (
  `id` int(11) NOT NULL,
  `invoice` varchar(50) NOT NULL,
  `id_produk` varchar(50) DEFAULT NULL,
  `jml` varchar(50) DEFAULT NULL,
  `harga` int(20) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pos_detail_penjualan`
--

INSERT INTO `pos_detail_penjualan` (`id`, `invoice`, `id_produk`, `jml`, `harga`, `status`) VALUES
(13, 'PNJWASERDA230722001', 'WSP001', '3000', 2500, 'dalam proses');

-- --------------------------------------------------------

--
-- Table structure for table `pos_pembelian`
--

CREATE TABLE `pos_pembelian` (
  `id` int(11) NOT NULL,
  `invoice` varchar(50) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `ppn` int(11) DEFAULT NULL,
  `grandtotal` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pos_pembelian`
--

INSERT INTO `pos_pembelian` (`id`, `invoice`, `total`, `ppn`, `grandtotal`, `tanggal`, `status`) VALUES
(2, 'PMBWASERDA230722001', 5250000, 577500, 5827500, '2022-07-23', 'selesai');

-- --------------------------------------------------------

--
-- Table structure for table `pos_penjualan`
--

CREATE TABLE `pos_penjualan` (
  `id` int(11) NOT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `total` int(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `nama_pembeli` varchar(50) DEFAULT NULL,
  `jenis_pembayaran` varchar(50) DEFAULT NULL,
  `kembalian` int(50) DEFAULT NULL,
  `pembayaran` int(50) DEFAULT NULL,
  `ppn` int(50) DEFAULT NULL,
  `total_trans` int(50) DEFAULT NULL,
  `id_detail_jenis_anggota` int(50) DEFAULT NULL,
  `date_payment` timestamp NULL DEFAULT current_timestamp(),
  `status_kredit` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pos_penjualan`
--

INSERT INTO `pos_penjualan` (`id`, `invoice`, `total`, `status`, `tanggal`, `nama_pembeli`, `jenis_pembayaran`, `kembalian`, `pembayaran`, `ppn`, `total_trans`, `id_detail_jenis_anggota`, `date_payment`, `status_kredit`) VALUES
(5, 'PNJWASERDA230722001', 8325000, 'terbayar', '2022-07-23', 'Adi', 'tunai', 0, 8325000, 825000, 7500000, 1, '2022-07-23 15:51:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `no_produk` varchar(50) NOT NULL,
  `nama_produk` varchar(50) NOT NULL,
  `stok` int(50) NOT NULL,
  `harga_jual` varchar(50) NOT NULL,
  `satuan` varchar(100) NOT NULL,
  `id_jenis` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`no_produk`, `nama_produk`, `stok`, `harga_jual`, `satuan`, `id_jenis`) VALUES
('PR_001', 'Susu Sapi', 130000, '8083.4', 'liter', 0),
('PR_002', 'Susu Murni', 1000, '9802', 'liter', 0),
('PR_003', 'Pasteur Coklat', 200, '346756.8', 'liter', 0),
('PR_004', 'Pasteur Vanila', 1300, '10374', 'liter', 0),
('PR_005', 'Pasteur Strawberry', 1300, '10374', 'liter', 0),
('PR_006', 'Yoghurt Strawberry', 1300, '10228.4', 'liter', 0),
('PR_007', 'Yoghurt Anggur', 1300, '10228.4', 'liter', 0),
('PR_008', 'Yoghurt Melon', 1300, '10228.4', 'liter', 0),
('PR_009', 'Yoghurt Plain', 1300, '9877.4', 'liter', 0),
('PR_010', 'Test sarah', 1000, '7000', 'liter', 1),
('PR_011', 'Test 2', 1000, '4500', 'liter', 1),
('PR_012', 'Testing Yogurt', 1000, '5000', 'liter', 3),
('PR_013', 'Yogurt 2 ', 1000, '7500', 'liter', 3),
('PR_014', 'Rumput grade A', 1000, '25000', 'liter', 2),
('PR_015', 'Rumput Grade B', 1000, '15000', 'liter', 2),
('PR_016', 'Asi', 15000, '1233', 'liter', 1);

-- --------------------------------------------------------

--
-- Table structure for table `produksi_ke1`
--

CREATE TABLE `produksi_ke1` (
  `no_trans` varchar(50) NOT NULL,
  `tgl_trans` varchar(50) NOT NULL,
  `no_trans_ck` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produksi_ke1`
--

INSERT INTO `produksi_ke1` (`no_trans`, `tgl_trans`, `no_trans_ck`, `status`) VALUES
('PROD1_001', '2022-07-09', 'CK_001', '2');

-- --------------------------------------------------------

--
-- Table structure for table `produksi_ke2`
--

CREATE TABLE `produksi_ke2` (
  `no_trans` varchar(50) NOT NULL,
  `tgl_trans` varchar(50) NOT NULL,
  `no_tp` varchar(50) NOT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produksi_ke2`
--

INSERT INTO `produksi_ke2` (`no_trans`, `tgl_trans`, `no_tp`, `status`) VALUES
('PROD2_001', '2022-07-09', 'TP_001', '1');

-- --------------------------------------------------------

--
-- Table structure for table `revaluasi`
--

CREATE TABLE `revaluasi` (
  `id` int(11) NOT NULL,
  `id_revaluasi` varchar(255) DEFAULT NULL,
  `tgl_input` timestamp NULL DEFAULT current_timestamp(),
  `id_detail` varchar(255) DEFAULT NULL,
  `bulan_revaluasi` varchar(255) DEFAULT NULL,
  `tarif_revaluasi` int(20) DEFAULT NULL,
  `nilai_buku_perbaikan` int(20) DEFAULT NULL,
  `nilai_buku_baru` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `revaluasi`
--

INSERT INTO `revaluasi` (`id`, `id_revaluasi`, `tgl_input`, `id_detail`, `bulan_revaluasi`, `tarif_revaluasi`, `nilai_buku_perbaikan`, `nilai_buku_baru`) VALUES
(4, 'REV20210717001', '2021-07-17 15:02:44', 'IDA-021', 'July 2021', 22727, 227273, 1160605),
(5, 'REV20210817002', '2021-08-17 15:03:34', 'IDA-021', 'August 2021', 22727, 204546, 1054544),
(8, 'REV20210721003', '2021-07-21 08:44:19', 'IDA-022', 'July 2021', 22727, 227273, 1160605),
(11, 'REV20210803004', '2021-08-03 04:55:45', 'IDA-024', 'August 2021', 45455, 454545, 5954545),
(12, 'REV20210903005', '2021-09-03 04:57:19', 'IDA-024', 'September 2021', 45455, 409090, 5659090);

-- --------------------------------------------------------

--
-- Table structure for table `satuan`
--

CREATE TABLE `satuan` (
  `id` int(11) NOT NULL,
  `desc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

CREATE TABLE `shift` (
  `id` int(11) NOT NULL,
  `desc` varchar(50) DEFAULT NULL,
  `time_in` time DEFAULT NULL,
  `time_out` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shift`
--

INSERT INTO `shift` (`id`, `desc`, `time_in`, `time_out`) VALUES
(1, 'Pagi', '08:00:00', '10:10:00'),
(2, 'Sore', '17:30:00', '23:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `simpanan`
--

CREATE TABLE `simpanan` (
  `kode_simpanan` varchar(25) NOT NULL,
  `simpanan` varchar(255) NOT NULL,
  `biaya` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `simpanan`
--

INSERT INTO `simpanan` (`kode_simpanan`, `simpanan`, `biaya`) VALUES
('JS-001', 'Simpanan Pokok', '50000'),
('JS-002', 'Manasuka', '10000'),
('JS-003', 'testing buat hani', '15000');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_aset`
--

CREATE TABLE `supplier_aset` (
  `id` varchar(11) NOT NULL,
  `nama_supplier` varchar(233) NOT NULL,
  `alamat` varchar(233) NOT NULL,
  `no_telepon` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier_aset`
--

INSERT INTO `supplier_aset` (`id`, `nama_supplier`, `alamat`, `no_telepon`) VALUES
('SPA-01', 'Genesis ID', 'Bandung', '087877472551'),
('SPA-02', 'PT ABC', 'Bandung', '123123123'),
('SPA-03', 'PT XYZ', 'bekasi', '123123123'),
('SPA-04', 'PT Sukses Makmur', 'Bubat', '321312'),
('SPA-05', 'PT Truck Keren', 'Bojongsoang', '123123123123');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_bp`
--

CREATE TABLE `supplier_bp` (
  `no_supp_bp` varchar(100) NOT NULL,
  `nama_supp_bp` varchar(100) NOT NULL,
  `notel` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier_bp`
--

INSERT INTO `supplier_bp` (`no_supp_bp`, `nama_supp_bp`, `notel`, `alamat`) VALUES
('SBP_001', 'Putra Pribumi', '081326789678', 'Lembang'),
('SBP_002', 'Toko Fajar', '085224789657', 'Lembang'),
('SBP_003', 'Maju Jaya', '081278654456', 'Lembang'),
('SBP_004', 'Sekar Sejati', '081396578564', 'Lembang'),
('SBP_005', 'Berkah Bersama', '085783643509', 'Lembang');

-- --------------------------------------------------------

--
-- Table structure for table `target_produksi`
--

CREATE TABLE `target_produksi` (
  `no_tp` varchar(100) NOT NULL,
  `tanggal` varchar(100) NOT NULL,
  `tgl_tp` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `no_trans_pembagian` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `target_produksi`
--

INSERT INTO `target_produksi` (`no_tp`, `tanggal`, `tgl_tp`, `status`, `no_trans_pembagian`) VALUES
('TP_001', '2022-07-09', '2022-07-09', '2', 'PGB_001');

-- --------------------------------------------------------

--
-- Table structure for table `tb_cuti`
--

CREATE TABLE `tb_cuti` (
  `id` int(20) NOT NULL,
  `id_pengajuan` varchar(50) DEFAULT NULL,
  `tgl_pengajuan` timestamp NULL DEFAULT current_timestamp(),
  `nip` varchar(50) DEFAULT NULL,
  `jumlah_hari` int(20) DEFAULT NULL,
  `tgl_mulai` date DEFAULT NULL,
  `tgl_selesai` date DEFAULT NULL,
  `alasan_cuti` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_cuti`
--

INSERT INTO `tb_cuti` (`id`, `id_pengajuan`, `tgl_pengajuan`, `nip`, `jumlah_hari`, `tgl_mulai`, `tgl_selesai`, `alasan_cuti`, `status`) VALUES
(5, 'CUTI20220702001', '2022-07-02 01:41:13', '8003250622757', 4, '2022-07-02', '2022-07-06', 'cuti', 1),
(6, 'CUTI20220702002', '2022-07-02 01:54:41', '8003250622757', 4, '2022-07-21', '2022-07-25', 'hhxadw', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_cuti_melahirkan`
--

CREATE TABLE `tb_cuti_melahirkan` (
  `id` int(20) NOT NULL,
  `id_pengajuan` varchar(50) DEFAULT NULL,
  `tgl_pengajuan` timestamp NULL DEFAULT current_timestamp(),
  `nip` varchar(50) DEFAULT NULL,
  `jumlah_hari` int(20) DEFAULT NULL,
  `tgl_mulai` date DEFAULT NULL,
  `tgl_selesai` date DEFAULT NULL,
  `alasan_cuti` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_cuti_melahirkan`
--

INSERT INTO `tb_cuti_melahirkan` (`id`, `id_pengajuan`, `tgl_pengajuan`, `nip`, `jumlah_hari`, `tgl_mulai`, `tgl_selesai`, `alasan_cuti`, `status`) VALUES
(1, 'CUTIMLHRKN20220630003', '2022-06-30 14:44:15', '8003250622757', 0, '2022-06-30', '2022-06-30', 'adadada', 1),
(2, 'CUTIMLHRKN20220702003', '2022-07-02 02:02:28', '8003250622757', 90, '2022-07-06', '2022-10-04', 'melahirkan', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_detail_pengajuan_bonus`
--

CREATE TABLE `tb_detail_pengajuan_bonus` (
  `id` int(11) NOT NULL,
  `id_pengajuan` varchar(255) DEFAULT NULL,
  `nip` varchar(50) DEFAULT NULL,
  `nominal` int(50) DEFAULT NULL,
  `keterangan` varchar(255) NOT NULL,
  `tanggal` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_detail_penggajian`
--

CREATE TABLE `tb_detail_penggajian` (
  `id` int(11) NOT NULL,
  `id_penggajian` varchar(50) DEFAULT NULL,
  `gaji_pokok` int(20) DEFAULT NULL,
  `tunjangan_jabatan` int(20) DEFAULT NULL,
  `tunjangan_kesehatan` int(20) DEFAULT NULL,
  `tunjangan_hari_raya` int(11) NOT NULL,
  `bonus_kerja` int(20) DEFAULT NULL,
  `ptkp` int(20) DEFAULT NULL,
  `tot_penghasilan` int(20) DEFAULT NULL,
  `tot_pengurang` int(20) DEFAULT NULL,
  `total` int(20) NOT NULL DEFAULT 0,
  `pph21` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_detail_penggajian`
--

INSERT INTO `tb_detail_penggajian` (`id`, `id_penggajian`, `gaji_pokok`, `tunjangan_jabatan`, `tunjangan_kesehatan`, `tunjangan_hari_raya`, `bonus_kerja`, `ptkp`, `tot_penghasilan`, `tot_pengurang`, `total`, `pph21`) VALUES
(118, 'GAJI-001', 20000000, 300000, 300000, 20600000, 0, 54000000, 20600000, 54000000, 39019167, 2180833),
(119, 'GAJI-001', 6000000, 300000, 300000, 6600000, 0, 0, 6600000, 0, 13200000, 0),
(120, 'GAJI-001', 3000000, 300000, 300000, 3600000, 0, 0, 3600000, 0, 7200000, 0),
(121, 'GAJI-001', 20000000, 150000, 300000, 20450000, 0, 63000000, 20450000, 63000000, 38856042, 2043958),
(122, 'GAJI-001', 20000000, 300000, 300000, 20600000, 0, 58500000, 20600000, 58500000, 39075417, 2124583);

-- --------------------------------------------------------

--
-- Table structure for table `tb_jabatan`
--

CREATE TABLE `tb_jabatan` (
  `id` int(11) NOT NULL,
  `desc` varchar(50) DEFAULT NULL,
  `tunjangan_jabatan` int(11) DEFAULT NULL,
  `tunjangan_kesehatan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_jabatan`
--

INSERT INTO `tb_jabatan` (`id`, `desc`, `tunjangan_jabatan`, `tunjangan_kesehatan`) VALUES
(1, 'Staff', 300000, 300000),
(2, 'Sr Programmer ', 150000, 300000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenis_pegawai`
--

CREATE TABLE `tb_jenis_pegawai` (
  `id` int(11) NOT NULL,
  `desc` varchar(50) DEFAULT NULL,
  `pendidikan` varchar(50) DEFAULT NULL,
  `gaji_pokok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_jenis_pegawai`
--

INSERT INTO `tb_jenis_pegawai` (`id`, `desc`, `pendidikan`, `gaji_pokok`) VALUES
(1, 'Kontrak', 'sma', 3000000),
(2, 'Tetap', 's1', 20000000),
(3, 'Kontrak', 's1', 3500000),
(4, 'Kontrak', 's2', 6000000),
(5, 'Tetap', 's2', 7000000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_lembur`
--

CREATE TABLE `tb_lembur` (
  `id` int(11) NOT NULL,
  `id_pengajuan` varchar(255) NOT NULL,
  `tgl_pengajuan` date NOT NULL,
  `id_pegawai` varchar(255) NOT NULL,
  `total_jam` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `nominal_perjam` int(20) NOT NULL,
  `total_nominal_lembur` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_lembur`
--

INSERT INTO `tb_lembur` (`id`, `id_pengajuan`, `tgl_pengajuan`, `id_pegawai`, `total_jam`, `status`, `nominal_perjam`, `total_nominal_lembur`) VALUES
(1, 'LMBR20220513001', '2022-05-13', '1029384756', 1, 2, 20000, 20000),
(5, 'LMBR20220513002', '2022-05-13', '111', 2, 2, 20000, 40000),
(6, 'LMBR20220618003', '2022-06-18', '1029384756', 1, 2, 20000, 20000),
(7, 'LMBR20220621004', '2022-06-21', '1029384756', 1, 3, 20000, 20000),
(8, 'LMBR20220621005', '2022-06-21', '1029384756', 1, 2, 20000, 20000),
(9, 'LMBR20220621006', '2022-06-21', '1029384756', 1, 3, 20000, 20000),
(10, 'LMBR20220625007', '2022-06-25', '1029384756', 3, 3, 20000, 60000),
(11, 'LMBR20220630008', '2022-06-30', '8003250622757', 1, 3, 20000, 20000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_penggajian`
--

CREATE TABLE `tb_penggajian` (
  `id` int(11) NOT NULL,
  `id_penggajian` varchar(50) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `nm_pegawai` varchar(50) DEFAULT NULL,
  `nominal` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_penggajian`
--

INSERT INTO `tb_penggajian` (`id`, `id_penggajian`, `tanggal`, `nm_pegawai`, `nominal`, `status`) VALUES
(120, 'GAJI-001', '2022-07-08', 'Andi', 39019167, NULL),
(121, 'GAJI-001', '2022-07-08', 'ela', 13200000, NULL),
(122, 'GAJI-001', '2022-07-08', 'Heni', 7200000, NULL),
(123, 'GAJI-001', '2022-07-08', 'ramli', 38856042, NULL),
(124, 'GAJI-001', '2022-07-08', 'robi', 39075417, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_ptkp`
--

CREATE TABLE `tb_ptkp` (
  `id` int(11) NOT NULL,
  `desc` varchar(50) DEFAULT NULL,
  `nominal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_ptkp`
--

INSERT INTO `tb_ptkp` (`id`, `desc`, `nominal`) VALUES
(1, 'TK0', 54000000),
(2, 'TK1', 58500000),
(3, 'TK2', 63000000);

-- --------------------------------------------------------

--
-- Table structure for table `tps`
--

CREATE TABLE `tps` (
  `id` int(11) NOT NULL,
  `kode_tps` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `kordinator` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tps`
--

INSERT INTO `tps` (`id`, `kode_tps`, `alamat`, `kordinator`) VALUES
(1, 'TPS_001', 'Lembang', 'InaH'),
(3, 'TPS_003', 'Lembang selatan', 'rizal'),
(4, 'TPS_004', 'Lembang Utara', 'Zacky');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_hpp`
--

CREATE TABLE `transaksi_hpp` (
  `id` int(11) NOT NULL,
  `kode_trans` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `nominal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi_hpp`
--

INSERT INTO `transaksi_hpp` (`id`, `kode_trans`, `tanggal`, `deskripsi`, `nominal`) VALUES
(1, 'HPP-0001', '2022-01-08', 'Susu Murni', 5000000),
(2, 'HPP-0002', '2022-01-08', 'Pakan Konsentrat', 2500000),
(3, 'HPP-0003', '2022-01-10', 'Susu Olahan', 2500000),
(4, 'HPP-0004', '2022-06-18', 'Susu Murni', 10000000),
(5, 'HPP-0005', '2022-06-18', 'Susu Olahan', 5000000);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_shu`
--

CREATE TABLE `transaksi_shu` (
  `id` int(11) NOT NULL,
  `kode_shu` varchar(50) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `nominal` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `trans_peny_rev`
--

CREATE TABLE `trans_peny_rev` (
  `id` int(11) NOT NULL,
  `id_trans` varchar(50) DEFAULT NULL,
  `tgl_trans` timestamp NULL DEFAULT current_timestamp(),
  `total_peny` int(20) DEFAULT NULL,
  `total_akum` int(20) DEFAULT NULL,
  `nilai_peny` int(20) DEFAULT NULL,
  `tarif_rev` int(20) DEFAULT 0,
  `nilai_bk_perbaikan` int(20) DEFAULT 0,
  `nilai_bk_baru` int(20) DEFAULT 0,
  `id_detail` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trans_peny_rev`
--

INSERT INTO `trans_peny_rev` (`id`, `id_trans`, `tgl_trans`, `total_peny`, `total_akum`, `nilai_peny`, `tarif_rev`, `nilai_bk_perbaikan`, `nilai_bk_baru`, `id_detail`) VALUES
(1, 'PNY20210621015', '2021-06-21 08:21:28', 83333, 83333, 1016666, 0, 0, 0, 'IDA-022'),
(2, 'REV20210721003', '2021-07-21 08:44:19', 83333, 166666, 933332, 22727, 227273, 1160605, 'IDA-022'),
(3, 'PNY20210703017', '2021-07-03 03:27:07', 250000, 250000, 5750000, 0, 0, 0, 'IDA-024'),
(6, 'REV20210803004', '2021-08-03 04:55:45', 250000, 500000, 5500000, 45455, 454545, 5954545, 'IDA-024'),
(7, 'REV20210903005', '2021-09-03 04:57:19', 250000, 750000, 5250000, 45455, 409090, 5659090, 'IDA-024'),
(8, 'PNY20220709001', '2022-07-08 22:39:10', 11375000, 11375000, 140125000, 0, 0, 0, 'IDA-025'),
(9, 'PNY20220709001', '2022-07-09 15:19:50', 15166666, 15166666, 186833333, 0, 0, 0, 'IDA-026');

-- --------------------------------------------------------

--
-- Table structure for table `truck_information`
--

CREATE TABLE `truck_information` (
  `id` int(11) NOT NULL,
  `id_pembelian` varchar(255) NOT NULL,
  `id_aset` varchar(255) NOT NULL,
  `nama_aset` varchar(255) DEFAULT NULL,
  `id_detail_pembelian` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0,
  `is_confirm` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `truck_information`
--

INSERT INTO `truck_information` (`id`, `id_pembelian`, `id_aset`, `nama_aset`, `id_detail_pembelian`, `is_deleted`, `is_confirm`) VALUES
(1, 'PMB_002', '23', 'Truck - IDA-015', 'IDA-015', 0, 1),
(2, 'PMB_003', '32', 'Truck - IDA-020', 'IDA-020', 0, 1),
(3, 'PMB_004', '23', 'Truck - IDA-015', 'IDA-015', 0, 1),
(4, 'PMB_005', '9', 'Truck - IDA-009', 'IDA-009', 0, 1),
(5, 'PMB_006', '32', 'Truck - IDA-020', 'IDA-020', 0, 1),
(6, 'PMB_007', '30', 'Truck - IDA-018', 'IDA-018', 0, 1),
(7, 'PMB_008', '18', 'Truck B - IDA-010', 'IDA-010', 0, 1),
(8, 'PMB_009', '18', 'Truck B - IDA-010', 'IDA-010', 0, 1),
(9, 'PMB_010', '8', 'Truck - IDA-008', 'IDA-008', 0, 1),
(10, 'PMB_011', '18', 'Truck B - IDA-010', 'IDA-010', 0, 1),
(11, 'PMB_013', '20', 'Truck B - IDA-012', 'IDA-012', 0, 1),
(12, 'PMB_015', '18', 'Truck B - IDA-010', 'IDA-010', 0, 1),
(13, 'PMB_016', '23', 'Truck - IDA-015', 'IDA-015', 0, 1),
(14, 'PMB_017', '30', 'Truck - IDA-018', 'IDA-018', 0, 1),
(15, 'PMB_026', '18', 'Truck B - IDA-010', 'IDA-010', 0, 1),
(16, 'PMB_001', '19', 'Truck B - IDA-011', 'IDA-011', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tunjangan_hari_raya`
--

CREATE TABLE `tunjangan_hari_raya` (
  `id` int(11) NOT NULL,
  `nip` varchar(255) NOT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `nominal` int(11) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tunjangan_hari_raya`
--

INSERT INTO `tunjangan_hari_raya` (`id`, `nip`, `nama`, `nominal`, `tanggal`) VALUES
(22, '8003250622757', 'ela', 6600000, '2022-07-01'),
(23, '111', 'Heni', 3600000, '2022-07-01'),
(24, '1029384756', 'Jadi andri aja namanya', 20600000, '2022-07-01'),
(25, '5016030722761', 'rafli', 20600000, '2022-07-01'),
(26, '9200270622759', 'ramli', 20450000, '2022-07-01'),
(27, '1608260622758', 'robi', 20600000, '2022-07-01'),
(28, '1044020722760', 'tesuser', 4100000, '2022-07-01');

-- --------------------------------------------------------

--
-- Table structure for table `update_stok_penj`
--

CREATE TABLE `update_stok_penj` (
  `no` int(11) NOT NULL,
  `no_trans` varchar(50) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `nominal` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` varchar(100) NOT NULL,
  `nip` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama_lengkap`, `username`, `password`, `level`, `nip`) VALUES
(1, 'Super Admin', 'admin', 'admin', 'admin', NULL),
(2, 'Admin Waserda', 'admin_waserda', '123', 'admin_waserda', NULL),
(3, 'Andi', 'Andi', '123123', 'pegawai', '1029384756'),
(4, 'Heni', 'heni', '123123', 'pegawai', '111'),
(5, 'test data', 'data1', '123123', 'pegawai', '1495301221757'),
(6, 'Kasir Waserda', 'kasir_waserda', '123', 'kasir_waserda', NULL),
(7, 'Keuangan', 'keuangan1', 'keuangan1', 'keuangan1', NULL),
(8, 'Keuangan', 'keuangan2', 'keuangan2', 'keuangan2', NULL),
(9, 'Keuangan', 'keuangan3', 'keuangan3', 'keuangan3', NULL),
(10, 'Raihan', 'komisikredit', '123', 'komisikredit', NULL),
(11, 'hanifah', 'koordinatorwilayah', '123', 'koordinatorwilayah', NULL),
(12, 'Penjualan', 'penjualan', 'penjualan', 'penjualan', NULL),
(13, 'Vevi', 'petugasadm', '123', 'petugasadministrasidaerah', NULL),
(14, 'Produksi', 'produksi1', 'produksi1', 'produksi1', NULL),
(15, 'Produksi', 'produksi2', 'produksi2', 'produksi2', NULL),
(16, 'Izmi', 'staffsimpanpinjam', '123', 'staffadministrasisimpanpinjam', NULL),
(17, 'bos', 'bos', 'bos123', 'atasan', 'd3dd1'),
(18, 'ela', 'ela', '123', 'pegawai', '8003250622757'),
(19, 'robi', 'robi', '123', 'pegawai', '1608260622758'),
(20, 'ramli', 'ramli', '123', 'pegawai', '9200270622759'),
(21, 'tesuser', 'tesuser', '123', 'pegawai', '3668020722760'),
(22, 'tesuser', 'tesuser', '123', 'pegawai', '1044020722760'),
(23, 'rafli', 'rafli', '123', 'pegawai', '5016030722761'),
(24, 'tes userr', 'tesuserr', '123', 'pegawai', '5325080722762');

-- --------------------------------------------------------

--
-- Table structure for table `waserda_jenis_anggota`
--

CREATE TABLE `waserda_jenis_anggota` (
  `id` int(11) NOT NULL,
  `deskripsi` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `waserda_jenis_anggota`
--

INSERT INTO `waserda_jenis_anggota` (`id`, `deskripsi`) VALUES
(1, 'Anggota'),
(2, 'Non Anggota');

-- --------------------------------------------------------

--
-- Table structure for table `waserda_kartu_stok`
--

CREATE TABLE `waserda_kartu_stok` (
  `no` int(11) NOT NULL,
  `no_transaksi` varchar(50) DEFAULT NULL,
  `kode` varchar(50) DEFAULT NULL,
  `tgl_transaksi` timestamp NULL DEFAULT NULL,
  `keterangan` varchar(50) DEFAULT NULL,
  `unit_in` varchar(50) DEFAULT NULL,
  `harga_in` varchar(50) DEFAULT NULL,
  `total_in` varchar(50) DEFAULT NULL,
  `unit_out` varchar(50) DEFAULT NULL,
  `harga_out` varchar(50) DEFAULT NULL,
  `total_out` varchar(50) DEFAULT NULL,
  `unit_total` varchar(50) DEFAULT NULL,
  `harga_total` varchar(50) DEFAULT NULL,
  `total` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `waserda_kartu_stok`
--

INSERT INTO `waserda_kartu_stok` (`no`, `no_transaksi`, `kode`, `tgl_transaksi`, `keterangan`, `unit_in`, `harga_in`, `total_in`, `unit_out`, `harga_out`, `total_out`, `unit_total`, `harga_total`, `total`) VALUES
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '8', '2500', '20000'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '7', '2500', '17500'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '6', '2500', '15000'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PMBWASERDA220622023', 'WSP002', '2022-06-21 17:06:11', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '1500', '15000'),
(0, 'PMBWASERDA220622023', 'WSP002', '2022-06-21 17:06:11', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '1500', '1500'),
(0, 'PMBWASERDA220622023', 'WSP002', '2022-06-21 17:06:11', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '1500', '1500'),
(0, 'PMBWASERDA220622023', 'WSP002', '2022-06-21 17:06:11', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '15', '1500', '22500'),
(0, 'PNJWASERDA220622045', 'WSP002', '2022-06-21 17:07:53', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '7', '2000', '14000'),
(0, 'PNJWASERDA220622045', 'WSP002', '2022-06-21 17:07:53', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2000', '2000'),
(0, 'PNJWASERDA220622045', 'WSP002', '2022-06-21 17:07:53', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2000', '2000'),
(0, 'PNJWASERDA220622045', 'WSP002', '2022-06-21 17:07:53', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '15', '2000', '30000'),
(0, 'PNJWASERDA220622046', 'WSP002', '2022-06-21 17:08:12', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2000', '10000'),
(0, 'PNJWASERDA220622046', 'WSP002', '2022-06-21 17:08:12', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2000', '2000'),
(0, 'PNJWASERDA220622046', 'WSP002', '2022-06-21 17:08:12', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2000', '2000'),
(0, 'PNJWASERDA220622046', 'WSP002', '2022-06-21 17:08:12', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '15', '2000', '30000'),
(0, 'PMBWASERDA220622024', 'WSP002', '2022-06-21 17:12:36', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '1500', '7500'),
(0, 'PMBWASERDA220622024', 'WSP002', '2022-06-21 17:12:36', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '1500', '1500'),
(0, 'PMBWASERDA220622024', 'WSP002', '2022-06-21 17:12:36', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '1500', '1500'),
(0, 'PMBWASERDA220622024', 'WSP002', '2022-06-21 17:12:36', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '15', '1500', '22500'),
(0, 'PMBWASERDA220622024', 'WSP002', '2022-06-21 17:12:36', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '1500', '15000'),
(0, 'PNJWASERDA220622047', 'WSP002', '2022-06-21 17:24:30', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '0', '0', '0'),
(0, 'PNJWASERDA220622047', 'WSP002', '2022-06-21 17:24:30', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '0', '0', '0'),
(0, 'PNJWASERDA220622047', 'WSP002', '2022-06-21 17:24:30', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '0', '0', '0'),
(0, 'PNJWASERDA220622047', 'WSP002', '2022-06-21 17:24:30', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2000', '20000'),
(0, 'PNJWASERDA220622047', 'WSP002', '2022-06-21 17:24:30', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2000', '20000'),
(0, 'PNJWASERDA220622048', 'WSP002', '2022-06-21 17:49:04', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '9', '2000', '18000'),
(0, 'PNJWASERDA220622048', 'WSP002', '2022-06-21 17:49:04', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2000', '20000'),
(0, 'PNJWASERDA220622049', 'WSP001', '2022-06-22 15:21:48', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '4', '2500', '10000'),
(0, 'PNJWASERDA220622049', 'WSP001', '2022-06-22 15:21:48', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA220622049', 'WSP001', '2022-06-22 15:21:48', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA220622049', 'WSP001', '2022-06-22 15:21:48', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA220622049', 'WSP001', '2022-06-22 15:21:48', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA220622049', 'WSP001', '2022-06-22 15:21:48', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA220622049', 'WSP001', '2022-06-22 15:21:48', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA220622049', 'WSP001', '2022-06-22 15:21:48', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA220622049', 'WSP001', '2022-06-22 15:21:48', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA220622049', 'WSP001', '2022-06-22 15:21:48', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA220622049', 'WSP001', '2022-06-22 15:21:48', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA220622049', 'WSP001', '2022-06-22 15:21:48', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA220622049', 'WSP001', '2022-06-22 15:21:48', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA220622049', 'WSP001', '2022-06-22 15:21:48', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA220622050', 'WSP001', '2022-06-22 15:28:10', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA220622050', 'WSP001', '2022-06-22 15:28:10', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA220622050', 'WSP001', '2022-06-22 15:28:10', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA220622050', 'WSP001', '2022-06-22 15:28:10', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA220622050', 'WSP001', '2022-06-22 15:28:10', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA220622050', 'WSP001', '2022-06-22 15:28:10', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA220622050', 'WSP001', '2022-06-22 15:28:10', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA220622050', 'WSP001', '2022-06-22 15:28:10', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA220622050', 'WSP001', '2022-06-22 15:28:10', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA220622050', 'WSP001', '2022-06-22 15:28:10', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA220622050', 'WSP001', '2022-06-22 15:28:10', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA220622050', 'WSP001', '2022-06-22 15:28:10', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA220622050', 'WSP001', '2022-06-22 15:28:10', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA220622050', 'WSP001', '2022-06-22 15:28:10', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA230622051', 'WSP001', '2022-06-22 22:40:34', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '0', '0', '0'),
(0, 'PNJWASERDA230622051', 'WSP001', '2022-06-22 22:40:34', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '9', '2500', '22500'),
(0, 'PNJWASERDA230622051', 'WSP001', '2022-06-22 22:40:34', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA230622051', 'WSP001', '2022-06-22 22:40:34', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA230622051', 'WSP001', '2022-06-22 22:40:34', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA230622051', 'WSP001', '2022-06-22 22:40:34', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA230622051', 'WSP001', '2022-06-22 22:40:34', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA230622051', 'WSP001', '2022-06-22 22:40:34', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA230622051', 'WSP001', '2022-06-22 22:40:34', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA230622051', 'WSP001', '2022-06-22 22:40:34', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA230622051', 'WSP001', '2022-06-22 22:40:34', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA230622051', 'WSP001', '2022-06-22 22:40:34', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA230622051', 'WSP001', '2022-06-22 22:40:34', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA230622051', 'WSP001', '2022-06-22 22:40:34', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA230622052', 'WSP001', '2022-06-22 22:50:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '8', '2500', '20000'),
(0, 'PNJWASERDA230622052', 'WSP001', '2022-06-22 22:50:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA230622052', 'WSP001', '2022-06-22 22:50:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA230622052', 'WSP001', '2022-06-22 22:50:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA230622052', 'WSP001', '2022-06-22 22:50:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA230622052', 'WSP001', '2022-06-22 22:50:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA230622052', 'WSP001', '2022-06-22 22:50:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA230622052', 'WSP001', '2022-06-22 22:50:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA230622052', 'WSP001', '2022-06-22 22:50:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA230622052', 'WSP001', '2022-06-22 22:50:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA230622052', 'WSP001', '2022-06-22 22:50:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA230622052', 'WSP001', '2022-06-22 22:50:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA230622052', 'WSP001', '2022-06-22 22:50:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA230622053', 'WSP001', '2022-06-23 12:45:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '7', '2500', '17500'),
(0, 'PNJWASERDA230622053', 'WSP001', '2022-06-23 12:45:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA230622053', 'WSP001', '2022-06-23 12:45:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA230622053', 'WSP001', '2022-06-23 12:45:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA230622053', 'WSP001', '2022-06-23 12:45:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA230622053', 'WSP001', '2022-06-23 12:45:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA230622053', 'WSP001', '2022-06-23 12:45:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA230622053', 'WSP001', '2022-06-23 12:45:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA230622053', 'WSP001', '2022-06-23 12:45:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA230622053', 'WSP001', '2022-06-23 12:45:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA230622053', 'WSP001', '2022-06-23 12:45:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA230622053', 'WSP001', '2022-06-23 12:45:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA230622053', 'WSP001', '2022-06-23 12:45:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:08:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '6', '2500', '15000'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:08:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:08:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:08:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:08:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:08:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:08:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:08:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:08:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:08:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:08:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:08:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:08:03', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:09:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:09:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:09:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:09:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:09:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:09:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:09:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:09:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:09:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:09:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:09:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:09:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:09:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:10:50', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '4', '2500', '10000'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:10:50', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:10:50', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:10:50', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:10:50', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:10:50', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:10:50', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:10:50', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:10:50', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:10:50', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:10:50', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:10:50', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:10:50', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:19:28', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:19:28', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:19:28', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:19:28', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:19:28', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:19:28', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:19:28', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:19:28', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:19:28', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:19:28', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:19:28', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:19:28', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:19:28', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PMBWASERDA270622025', 'WSP002', '2022-06-26 20:08:51', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '9', '1500', '13500'),
(0, 'PMBWASERDA270622025', 'WSP002', '2022-06-26 20:08:51', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '1500', '15000'),
(0, 'PMBWASERDA270622025', 'WSP002', '2022-06-26 20:08:51', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '100', '1500', '150000'),
(0, 'PMBWASERDA270622026', 'WSP001', '2022-06-26 21:04:43', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '1750', '5250'),
(0, 'PMBWASERDA270622026', 'WSP001', '2022-06-26 21:04:43', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '1750', '17500'),
(0, 'PMBWASERDA270622026', 'WSP001', '2022-06-26 21:04:43', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '1750', '3500'),
(0, 'PMBWASERDA270622026', 'WSP001', '2022-06-26 21:04:43', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '1750', '1750'),
(0, 'PMBWASERDA270622026', 'WSP001', '2022-06-26 21:04:43', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '1750', '5250'),
(0, 'PMBWASERDA270622026', 'WSP001', '2022-06-26 21:04:43', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '1750', '8750'),
(0, 'PMBWASERDA270622026', 'WSP001', '2022-06-26 21:04:43', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '1750', '5250'),
(0, 'PMBWASERDA270622026', 'WSP001', '2022-06-26 21:04:43', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '1750', '1750'),
(0, 'PMBWASERDA270622026', 'WSP001', '2022-06-26 21:04:43', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '1750', '17500'),
(0, 'PMBWASERDA270622026', 'WSP001', '2022-06-26 21:04:43', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '1750', '8750'),
(0, 'PMBWASERDA270622026', 'WSP001', '2022-06-26 21:04:43', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '1750', '3500'),
(0, 'PMBWASERDA270622026', 'WSP001', '2022-06-26 21:04:43', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '1750', '5250'),
(0, 'PMBWASERDA270622026', 'WSP001', '2022-06-26 21:04:43', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '1750', '1750'),
(0, 'PMBWASERDA270622026', 'WSP001', '2022-06-26 21:04:43', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '100', '1750', '175000'),
(0, 'PNJWASERDA270622054', 'WSP001', '2022-06-26 21:05:23', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '0', '0', '0'),
(0, 'PNJWASERDA270622054', 'WSP001', '2022-06-26 21:05:23', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA270622054', 'WSP001', '2022-06-26 21:05:23', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA270622054', 'WSP001', '2022-06-26 21:05:23', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA270622054', 'WSP001', '2022-06-26 21:05:23', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA270622054', 'WSP001', '2022-06-26 21:05:23', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA270622054', 'WSP001', '2022-06-26 21:05:23', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA270622054', 'WSP001', '2022-06-26 21:05:23', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA270622054', 'WSP001', '2022-06-26 21:05:23', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA270622054', 'WSP001', '2022-06-26 21:05:23', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA270622054', 'WSP001', '2022-06-26 21:05:23', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA270622054', 'WSP001', '2022-06-26 21:05:23', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA270622054', 'WSP001', '2022-06-26 21:05:23', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA270622054', 'WSP001', '2022-06-26 21:05:23', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '100', '2500', '250000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:12:25', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:12:25', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:12:25', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:12:25', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:12:25', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:12:25', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:12:25', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:12:25', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:12:25', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:12:25', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:12:25', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:12:25', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:12:25', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '100', '2500', '250000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '100', '2500', '250000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:40', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '0', '0', '0'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:40', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:40', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:40', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:40', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:40', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:40', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:40', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:40', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:40', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:40', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:40', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:40', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '100', '2500', '250000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:18:52', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '0', '0', '0'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:18:52', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:18:52', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:18:52', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:18:52', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:18:52', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:18:52', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:18:52', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:18:52', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:18:52', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:18:52', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:18:52', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:18:52', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '100', '2500', '250000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:19:38', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '0', '0', '0'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:19:38', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '0', '0', '0'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:19:38', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:19:38', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:19:38', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:19:38', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:19:38', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:19:39', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:19:39', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:19:39', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:19:39', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:19:39', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:19:39', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '100', '2500', '250000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:20:19', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '0', '0', '0'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:20:19', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '0', '0', '0'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:20:19', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '0', '0', '0'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:20:19', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:20:19', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:20:19', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:20:19', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:20:19', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:20:19', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:20:19', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:20:19', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:20:19', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:20:19', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '100', '2500', '250000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:21:33', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '0', '0', '0'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:21:33', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '0', '0', '0'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:21:33', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '0', '0', '0'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:21:33', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:21:33', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:21:33', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:21:33', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:21:33', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:21:33', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:21:33', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:21:33', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:21:33', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:21:33', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '100', '2500', '250000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:23:01', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '0', '0', '0'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:23:01', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '0', '0', '0'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:23:01', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '0', '0', '0'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:23:01', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:23:01', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:23:01', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:23:01', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:23:01', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:23:01', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:23:01', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:23:01', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:23:01', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:23:01', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '100', '2500', '250000'),
(0, 'PNJWASERDA300622055', 'WSP001', '2022-06-30 14:23:21', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '0', '0', '0'),
(0, 'PNJWASERDA300622055', 'WSP001', '2022-06-30 14:23:21', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622055', 'WSP001', '2022-06-30 14:23:21', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622055', 'WSP001', '2022-06-30 14:23:21', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622055', 'WSP001', '2022-06-30 14:23:21', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA300622055', 'WSP001', '2022-06-30 14:23:21', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622055', 'WSP001', '2022-06-30 14:23:21', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA300622055', 'WSP001', '2022-06-30 14:23:21', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622055', 'WSP001', '2022-06-30 14:23:21', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622055', 'WSP001', '2022-06-30 14:23:21', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '100', '2500', '250000'),
(0, 'PNJWASERDA300622056', 'WSP001', '2022-06-30 14:24:09', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '4', '2500', '10000'),
(0, 'PNJWASERDA300622056', 'WSP001', '2022-06-30 14:24:09', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622056', 'WSP001', '2022-06-30 14:24:09', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622056', 'WSP001', '2022-06-30 14:24:09', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA300622056', 'WSP001', '2022-06-30 14:24:09', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622056', 'WSP001', '2022-06-30 14:24:09', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA300622056', 'WSP001', '2022-06-30 14:24:09', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622056', 'WSP001', '2022-06-30 14:24:09', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622056', 'WSP001', '2022-06-30 14:24:09', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '100', '2500', '250000'),
(0, 'PNJWASERDA300622057', 'WSP001', '2022-06-30 14:26:36', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622057', 'WSP001', '2022-06-30 14:26:36', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622057', 'WSP001', '2022-06-30 14:26:36', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622057', 'WSP001', '2022-06-30 14:26:36', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA300622057', 'WSP001', '2022-06-30 14:26:36', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622057', 'WSP001', '2022-06-30 14:26:36', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA300622057', 'WSP001', '2022-06-30 14:26:36', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622057', 'WSP001', '2022-06-30 14:26:36', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622057', 'WSP001', '2022-06-30 14:26:36', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '100', '2500', '250000'),
(0, 'PNJWASERDA020722058', 'WSP001', '2022-07-01 17:24:24', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA020722058', 'WSP001', '2022-07-01 17:24:24', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA020722058', 'WSP001', '2022-07-01 17:24:24', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA020722058', 'WSP001', '2022-07-01 17:24:24', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA020722058', 'WSP001', '2022-07-01 17:24:24', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA020722058', 'WSP001', '2022-07-01 17:24:24', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA020722058', 'WSP001', '2022-07-01 17:24:24', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA020722058', 'WSP001', '2022-07-01 17:24:24', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA020722058', 'WSP001', '2022-07-01 17:24:24', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '100', '2500', '250000'),
(0, 'PNJWASERDA020722059', 'WSP001', '2022-07-01 17:39:25', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '0', '0', '0');
INSERT INTO `waserda_kartu_stok` (`no`, `no_transaksi`, `kode`, `tgl_transaksi`, `keterangan`, `unit_in`, `harga_in`, `total_in`, `unit_out`, `harga_out`, `total_out`, `unit_total`, `harga_total`, `total`) VALUES
(0, 'PNJWASERDA020722059', 'WSP001', '2022-07-01 17:39:25', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA020722059', 'WSP001', '2022-07-01 17:39:25', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA020722059', 'WSP001', '2022-07-01 17:39:25', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA020722059', 'WSP001', '2022-07-01 17:39:25', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA020722059', 'WSP001', '2022-07-01 17:39:25', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA020722059', 'WSP001', '2022-07-01 17:39:25', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA020722059', 'WSP001', '2022-07-01 17:39:25', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA020722059', 'WSP001', '2022-07-01 17:39:25', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '100', '2500', '250000'),
(0, 'PNJWASERDA020722060', 'WSP001', '2022-07-01 17:39:49', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA020722060', 'WSP001', '2022-07-01 17:39:49', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA020722060', 'WSP001', '2022-07-01 17:39:49', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA020722060', 'WSP001', '2022-07-01 17:39:49', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA020722060', 'WSP001', '2022-07-01 17:39:49', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA020722060', 'WSP001', '2022-07-01 17:39:49', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA020722060', 'WSP001', '2022-07-01 17:39:49', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA020722060', 'WSP001', '2022-07-01 17:39:49', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '100', '2500', '250000'),
(0, 'PNJWASERDA280722061', 'WSP001', '2022-07-27 17:44:31', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA280722061', 'WSP001', '2022-07-27 17:44:31', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA280722061', 'WSP001', '2022-07-27 17:44:31', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA280722061', 'WSP001', '2022-07-27 17:44:31', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA280722061', 'WSP001', '2022-07-27 17:44:31', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA280722061', 'WSP001', '2022-07-27 17:44:31', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA280722061', 'WSP001', '2022-07-27 17:44:31', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA280722061', 'WSP001', '2022-07-27 17:44:31', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '100', '2500', '250000'),
(0, 'PNJWASERDA070722062', 'WSP001', '2022-07-07 02:15:42', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '0', '0', '0'),
(0, 'PNJWASERDA070722062', 'WSP001', '2022-07-07 02:15:42', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA070722062', 'WSP001', '2022-07-07 02:15:42', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA070722062', 'WSP001', '2022-07-07 02:15:42', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA070722062', 'WSP001', '2022-07-07 02:15:42', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA070722062', 'WSP001', '2022-07-07 02:15:42', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA070722062', 'WSP001', '2022-07-07 02:15:42', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA070722062', 'WSP001', '2022-07-07 02:15:42', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '100', '2500', '250000'),
(0, 'PNJWASERDA070722062', 'WSP001', '2022-07-07 02:22:50', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '0', '0', '0'),
(0, 'PNJWASERDA070722062', 'WSP001', '2022-07-07 02:22:50', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '0', '0', '0'),
(0, 'PNJWASERDA070722062', 'WSP001', '2022-07-07 02:22:50', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2500', '25000'),
(0, 'PNJWASERDA070722062', 'WSP001', '2022-07-07 02:22:50', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA070722062', 'WSP001', '2022-07-07 02:22:50', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA070722062', 'WSP001', '2022-07-07 02:22:50', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA070722062', 'WSP001', '2022-07-07 02:22:50', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA070722062', 'WSP001', '2022-07-07 02:22:50', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '100', '2500', '250000'),
(0, 'PNJWASERDA070722063', 'WSP001', '2022-07-07 02:23:17', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '9', '2500', '22500'),
(0, 'PNJWASERDA070722063', 'WSP001', '2022-07-07 02:23:17', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA070722063', 'WSP001', '2022-07-07 02:23:17', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA070722063', 'WSP001', '2022-07-07 02:23:17', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA070722063', 'WSP001', '2022-07-07 02:23:17', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA070722063', 'WSP001', '2022-07-07 02:23:17', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '100', '2500', '250000'),
(0, 'PNJWASERDA070722064', 'WSP002', '2022-07-07 02:27:45', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '8', '2000', '16000'),
(0, 'PNJWASERDA070722064', 'WSP002', '2022-07-07 02:27:45', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '10', '2000', '20000'),
(0, 'PNJWASERDA070722064', 'WSP002', '2022-07-07 02:27:45', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '100', '2000', '200000'),
(0, 'PNJWASERDA070722065', 'WSP001', '2022-07-07 02:28:21', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '8', '2500', '20000'),
(0, 'PNJWASERDA070722065', 'WSP001', '2022-07-07 02:28:21', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA070722065', 'WSP001', '2022-07-07 02:28:21', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA070722065', 'WSP001', '2022-07-07 02:28:21', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA070722065', 'WSP001', '2022-07-07 02:28:21', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA070722065', 'WSP001', '2022-07-07 02:28:21', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '100', '2500', '250000'),
(0, 'PNJWASERDA070722066', 'WSP003', '2022-07-07 02:28:42', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '0', '0', '0'),
(0, 'PNJWASERDA070722066', 'WSP003', '2022-07-07 02:28:42', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2000', '6000'),
(0, 'PNJWASERDA070722066', 'WSP003', '2022-07-07 02:28:42', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2000', '2000'),
(0, 'PNJWASERDA070722067', 'WSP001', '2022-07-07 02:33:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '7', '2500', '17500'),
(0, 'PNJWASERDA070722067', 'WSP001', '2022-07-07 02:33:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA070722067', 'WSP001', '2022-07-07 02:33:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA070722067', 'WSP001', '2022-07-07 02:33:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA070722067', 'WSP001', '2022-07-07 02:33:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA070722067', 'WSP001', '2022-07-07 02:33:00', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '100', '2500', '250000'),
(0, 'PNJWASERDA060722068', 'WSP001', '2022-07-06 16:18:33', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '6', '2500', '15000'),
(0, 'PNJWASERDA060722068', 'WSP001', '2022-07-06 16:18:33', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA060722068', 'WSP001', '2022-07-06 16:18:33', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA060722068', 'WSP001', '2022-07-06 16:18:33', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA060722068', 'WSP001', '2022-07-06 16:18:33', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA060722068', 'WSP001', '2022-07-06 16:18:33', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '100', '2500', '250000'),
(0, 'PNJWASERDA090722001', 'WSP001', '2022-07-09 06:59:53', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA090722001', 'WSP001', '2022-07-09 06:59:53', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA090722001', 'WSP001', '2022-07-09 06:59:53', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA090722001', 'WSP001', '2022-07-09 06:59:53', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA090722001', 'WSP001', '2022-07-09 06:59:53', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA090722001', 'WSP001', '2022-07-09 06:59:53', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '100', '2500', '250000'),
(0, 'PNJWASERDA090722001', 'WSP001', '2022-07-09 07:02:08', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '4', '2500', '10000'),
(0, 'PNJWASERDA090722001', 'WSP001', '2022-07-09 07:02:08', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA090722001', 'WSP001', '2022-07-09 07:02:08', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA090722001', 'WSP001', '2022-07-09 07:02:09', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA090722001', 'WSP001', '2022-07-09 07:02:09', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA090722001', 'WSP001', '2022-07-09 07:02:09', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '100', '2500', '250000'),
(0, 'PNJWASERDA080722002', 'WSP001', '2022-07-08 07:06:09', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA080722002', 'WSP001', '2022-07-08 07:06:09', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA080722002', 'WSP001', '2022-07-08 07:06:09', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA080722002', 'WSP001', '2022-07-08 07:06:09', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA080722002', 'WSP001', '2022-07-08 07:06:09', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA080722002', 'WSP001', '2022-07-08 07:06:09', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '100', '2500', '250000'),
(0, 'PNJWASERDA120722003', 'WSP001', '2022-07-12 07:08:07', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA120722003', 'WSP001', '2022-07-12 07:08:07', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA120722003', 'WSP001', '2022-07-12 07:08:07', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA120722003', 'WSP001', '2022-07-12 07:08:07', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA120722003', 'WSP001', '2022-07-12 07:08:07', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA120722003', 'WSP001', '2022-07-12 07:08:07', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '100', '2500', '250000'),
(0, 'PNJWASERDA120722003', 'WSP001', '2022-07-12 07:08:08', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA120722003', 'WSP001', '2022-07-12 07:08:08', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '2500', '12500'),
(0, 'PNJWASERDA120722003', 'WSP001', '2022-07-12 07:08:08', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '2500', '5000'),
(0, 'PNJWASERDA120722003', 'WSP001', '2022-07-12 07:08:08', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '2500', '7500'),
(0, 'PNJWASERDA120722003', 'WSP001', '2022-07-12 07:08:08', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '2500', '2500'),
(0, 'PNJWASERDA120722003', 'WSP001', '2022-07-12 07:08:08', '', '3000', '1750', '5250000', '3000', '2500', '7500000', '100', '2500', '250000'),
(0, 'PMBWASERDA090722001', 'WSP001', '2022-07-08 22:47:49', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '1750', '1750'),
(0, 'PMBWASERDA090722001', 'WSP001', '2022-07-08 22:47:49', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '1750', '8750'),
(0, 'PMBWASERDA090722001', 'WSP001', '2022-07-08 22:47:49', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '1750', '3500'),
(0, 'PMBWASERDA090722001', 'WSP001', '2022-07-08 22:47:49', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '1750', '5250'),
(0, 'PMBWASERDA090722001', 'WSP001', '2022-07-08 22:47:49', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '1750', '1750'),
(0, 'PMBWASERDA090722001', 'WSP001', '2022-07-08 22:47:49', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '100', '1750', '175000'),
(0, 'PMBWASERDA090722001', 'WSP001', '2022-07-08 22:47:49', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '100', '1750', '175000'),
(0, 'PMBWASERDA230722001', 'WSP001', '2022-07-23 15:52:54', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '1750', '1750'),
(0, 'PMBWASERDA230722001', 'WSP001', '2022-07-23 15:52:54', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '5', '1750', '8750'),
(0, 'PMBWASERDA230722001', 'WSP001', '2022-07-23 15:52:54', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '2', '1750', '3500'),
(0, 'PMBWASERDA230722001', 'WSP001', '2022-07-23 15:52:54', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '3', '1750', '5250'),
(0, 'PMBWASERDA230722001', 'WSP001', '2022-07-23 15:52:54', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '1', '1750', '1750'),
(0, 'PMBWASERDA230722001', 'WSP001', '2022-07-23 15:52:54', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '100', '1750', '175000'),
(0, 'PMBWASERDA230722001', 'WSP001', '2022-07-23 15:52:54', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '100', '1750', '175000'),
(0, 'PMBWASERDA230722001', 'WSP001', '2022-07-23 15:52:54', NULL, '3000', '1750', '5250000', '3000', '2500', '7500000', '3000', '1750', '5250000'),
(0, 'PNJWASERDA230722001', 'WSP001', '2022-07-23 15:53:39', '', '0', '0', '0', '3000', '2500', '7500000', '0', '0', '0'),
(0, 'PNJWASERDA230722001', 'WSP001', '2022-07-23 15:53:39', '', '0', '0', '0', '3000', '2500', '7500000', '0', '0', '0'),
(0, 'PNJWASERDA230722001', 'WSP001', '2022-07-23 15:53:39', '', '0', '0', '0', '3000', '2500', '7500000', '0', '0', '0'),
(0, 'PNJWASERDA230722001', 'WSP001', '2022-07-23 15:53:39', '', '0', '0', '0', '3000', '2500', '7500000', '0', '0', '0'),
(0, 'PNJWASERDA230722001', 'WSP001', '2022-07-23 15:53:39', '', '0', '0', '0', '3000', '2500', '7500000', '0', '0', '0'),
(0, 'PNJWASERDA230722001', 'WSP001', '2022-07-23 15:53:39', '', '0', '0', '0', '3000', '2500', '7500000', '0', '0', '0'),
(0, 'PNJWASERDA230722001', 'WSP001', '2022-07-23 15:53:39', '', '0', '0', '0', '3000', '2500', '7500000', '0', '0', '0'),
(0, 'PNJWASERDA230722001', 'WSP001', '2022-07-23 15:53:39', '', '0', '0', '0', '3000', '2500', '7500000', '212', '2500', '530000');

-- --------------------------------------------------------

--
-- Table structure for table `waserda_kategori`
--

CREATE TABLE `waserda_kategori` (
  `id` int(11) NOT NULL,
  `kode` varchar(50) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `waserda_kategori`
--

INSERT INTO `waserda_kategori` (`id`, `kode`, `deskripsi`) VALUES
(1, 'WSK001', 'Makanan'),
(2, 'WSK002', 'Minuman'),
(3, 'WSK003', 'ATK'),
(4, 'WKS004', 'Peralatan'),
(5, 'WKS005', 'Elektronik');

-- --------------------------------------------------------

--
-- Table structure for table `waserda_log_stok`
--

CREATE TABLE `waserda_log_stok` (
  `no_trans` varchar(50) DEFAULT NULL,
  `id_produk` varchar(50) DEFAULT NULL,
  `jml_baris_sblmnya` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `waserda_log_stok`
--

INSERT INTO `waserda_log_stok` (`no_trans`, `id_produk`, `jml_baris_sblmnya`) VALUES
('KPSBU270522001', 'WSP001', 1),
('KPSBU270522002', 'WSP001', 1),
('PNJWASERDA010622003', 'WSP001', 10),
('PNJWASERDA010622003', 'WSP001', 10),
('PNJWASERDA010622004', 'WSP001', 10),
('PNJWASERDA010622005', 'WSP001', 10),
('PNJWASERDA010622005', 'WSP003', 6),
('PNJWASERDA010622006', 'WSP001', 10),
('PNJWASERDA010622006', 'WSP003', 5),
('PNJWASERDA010622007', 'WSP001', 10),
('PNJWASERDA010622007', 'WSP004', 2),
('PNJWASERDA010622008', 'WSP001', 10),
('PNJWASERDA010622009', 'WSP001', 10),
('PNJWASERDA010622009', 'WSP003', 4),
('PNJWASERDA010622010', 'WSP001', 10),
('PNJWASERDA010622010', 'WSP003', 4),
('PNJWASERDA010622011', 'WSP003', 3),
('PNJWASERDA140622012', 'WSP001', 10),
('PNJWASERDA140622013', 'WSP001', 10),
('PNJWASERDA140622014', 'WSP001', 10),
('PNJWASERDA140622015', 'WSP003', 2),
('PNJWASERDA140622016', 'WSP001', 10),
('PNJWASERDA140622017', 'WSP001', 10),
('PNJWASERDA140622018', 'WSP001', 10),
('PNJWASERDA140622019', 'WSP003', 2),
('PNJWASERDA150622020', 'WSP003', 2),
('PNJWASERDA150622021', 'WSP003', 1),
('PNJWASERDA150622022', 'WSP003', 1),
('PNJWASERDA150622023', 'WSP003', 1),
('PNJWASERDA150622024', 'WSP001', 10),
('PNJWASERDA150622025', 'WSP001', 13),
('PNJWASERDA150622025', 'WSP003', 1),
('PNJWASERDA150622026', 'WSP001', 13),
('PNJWASERDA160622027', 'WSP001', 12),
('PNJWASERDA160622027', 'WSP001', 12),
('PNJWASERDA160622027', 'WSP003', 1),
('PNJWASERDA160622027', 'WSP003', 1),
('PNJWASERDA160622027', 'WSP003', 1),
('PNJWASERDA160622027', 'WSP003', 1),
('PNJWASERDA160622027', 'WSP003', 1),
('PNJWASERDA160622027', 'WSP004', 2),
('PNJWASERDA160622028', 'WSP001', 12),
('PNJWASERDA160622029', 'WSP001', 12),
('PNJWASERDA160622030', 'WSP001', 11),
('PNJWASERDA170622031', 'WSP001', 15),
('PNJWASERDA170622032', 'WSP001', 15),
('PNJWASERDA170622033', 'WSP001', 15),
('PNJWASERDA180622034', 'WSP001', 14),
('PNJWASERDA190622035', 'WSP001', 13),
('PNJWASERDA190622036', 'WSP001', 13),
('PNJWASERDA190622037', 'WSP001', 13),
('PNJWASERDA190622038', 'WSP001', 13),
('PNJWASERDA200622039', 'WSP001', 15),
('PNJWASERDA200622039', 'WSP001', 15),
('PNJWASERDA200622039', 'WSP001', 15),
('PNJWASERDA200622039', 'WSP001', 15),
('PNJWASERDA200622039', 'WSP001', 15),
('PNJWASERDA200622039', 'WSP001', 14),
('PNJWASERDA200622039', 'WSP001', 14),
('PNJWASERDA200622039', 'WSP001', 14),
('PNJWASERDA200622039', 'WSP001', 14),
('PNJWASERDA200622039', 'WSP001', 14),
('PNJWASERDA200622039', 'WSP001', 14),
('PNJWASERDA200622039', 'WSP001', 14),
('PNJWASERDA200622039', 'WSP001', 14),
('PNJWASERDA200622039', 'WSP001', 14),
('PNJWASERDA200622039', 'WSP001', 14),
('PNJWASERDA200622040', 'WSP001', 14),
('PNJWASERDA200622041', 'WSP001', 13),
('PNJWASERDA200622042', 'WSP001', 14),
('PNJWASERDA200622042', 'WSP001', 14),
('PNJWASERDA200622042', 'WSP001', 14),
('PNJWASERDA200622043', 'WSP001', 14),
('PNJWASERDA200622044', 'WSP001', 14),
('PNJWASERDA220622045', 'WSP002', 4),
('PNJWASERDA220622046', 'WSP002', 4),
('PNJWASERDA220622047', 'WSP002', 5),
('PNJWASERDA220622048', 'WSP002', 2),
('PNJWASERDA220622049', 'WSP001', 14),
('PNJWASERDA220622050', 'WSP001', 14),
('PNJWASERDA230622051', 'WSP001', 14),
('PNJWASERDA230622052', 'WSP001', 13),
('PNJWASERDA230622053', 'WSP001', 13),
('PNJWASERDA260622054', 'WSP001', 13),
('PNJWASERDA260622054', 'WSP001', 13),
('PNJWASERDA260622054', 'WSP001', 13),
('PNJWASERDA260622054', 'WSP001', 13),
('PNJWASERDA270622054', 'WSP001', 14),
('PNJWASERDA300622054', 'WSP001', 13),
('PNJWASERDA300622054', 'WSP001', 13),
('PNJWASERDA300622054', 'WSP001', 13),
('PNJWASERDA300622054', 'WSP001', 12),
('PNJWASERDA300622054', 'WSP001', 12),
('PNJWASERDA300622054', 'WSP001', 11),
('PNJWASERDA300622054', 'WSP001', 10),
('PNJWASERDA300622054', 'WSP001', 10),
('PNJWASERDA300622055', 'WSP001', 10),
('PNJWASERDA300622056', 'WSP001', 9),
('PNJWASERDA300622057', 'WSP001', 9),
('PNJWASERDA020722058', 'WSP001', 9),
('PNJWASERDA020722059', 'WSP001', 9),
('PNJWASERDA020722060', 'WSP001', 8),
('PNJWASERDA280722061', 'WSP001', 8),
('PNJWASERDA070722062', 'WSP001', 8),
('PNJWASERDA070722062', 'WSP001', 7),
('PNJWASERDA070722063', 'WSP001', 6),
('PNJWASERDA070722064', 'WSP002', 3),
('PNJWASERDA070722065', 'WSP001', 6),
('PNJWASERDA070722066', 'WSP003', 3),
('PNJWASERDA070722067', 'WSP001', 6),
('PNJWASERDA060722068', 'WSP001', 6),
('PNJWASERDA090722001', 'WSP001', 6),
('PNJWASERDA090722001', 'WSP001', 6),
('PNJWASERDA080722002', 'WSP001', 6),
('PNJWASERDA120722003', 'WSP001', 6),
('PNJWASERDA120722003', 'WSP001', 6),
('PNJWASERDA230722001', 'WSP001', 8);

-- --------------------------------------------------------

--
-- Table structure for table `waserda_log_transaksi`
--

CREATE TABLE `waserda_log_transaksi` (
  `id` int(11) NOT NULL,
  `id_produk` varchar(50) DEFAULT NULL,
  `jenis_transaksi` varchar(50) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `stok_akhir` int(11) DEFAULT NULL,
  `date_input` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `waserda_log_transaksi`
--

INSERT INTO `waserda_log_transaksi` (`id`, `id_produk`, `jenis_transaksi`, `jumlah`, `stok_akhir`, `date_input`) VALUES
(1, 'WSP001', 'Stok Masuk', 100, 0, '2022-05-27 15:29:20'),
(2, 'WSP001', 'Stok Masuk', 10, 0, '2022-05-28 13:28:13'),
(3, 'WSP001', 'Stok Masuk', 10, 0, '2022-06-01 08:08:27'),
(4, 'WSP001', 'Stok Masuk', 2, 0, '2022-06-01 08:10:02'),
(5, 'WSP003', 'Stok Masuk', 11, 0, '2022-06-01 08:10:02'),
(6, 'WSP001', 'Stok Masuk', 10, 0, '2022-06-01 08:14:48'),
(7, 'WSP003', 'Stok Masuk', 12, 0, '2022-06-01 08:14:48'),
(8, 'WSP001', 'Stok Masuk', 12, 0, '2022-06-01 08:35:44'),
(9, 'WSP003', 'Stok Masuk', 11, 0, '2022-06-01 08:35:44'),
(10, 'WSP001', 'Stok Masuk', 11, 0, '2022-06-01 08:37:11'),
(11, 'WSP002', 'Stok Masuk', 10, 0, '2022-06-01 08:37:11'),
(12, 'WSP001', 'Stok Masuk', 12, 0, '2022-06-01 08:49:57'),
(13, 'WSP003', 'Stok Masuk', 12, 0, '2022-06-01 08:49:57'),
(14, 'WSP001', 'Stok Masuk', 10, 0, '2022-06-01 08:50:42'),
(15, 'WSP003', 'Stok Masuk', 5, 0, '2022-06-01 08:50:42'),
(16, 'WSP004', 'Stok Masuk', 100, 94, '2022-06-01 08:50:42'),
(17, 'WSP001', 'Stok Masuk', 10, 0, '2022-06-01 08:55:09'),
(18, 'WSP003', 'Stok Masuk', 15, 0, '2022-06-01 08:55:09'),
(19, 'WSP004', 'Stok Masuk', 12, 12, '2022-06-01 08:55:09'),
(20, 'WSP001', 'Stok Masuk', 2, 0, '2022-06-15 06:23:11'),
(21, 'WSP002', 'Stok Masuk', 1, 0, '2022-06-15 06:23:11'),
(22, 'WSP001', 'Stok Masuk', 1, 0, '2022-06-15 06:49:47'),
(23, 'WSP001', 'Stok Masuk', 3, 0, '2022-06-15 10:17:20'),
(24, 'WSP002', 'Stok Masuk', 1, 0, '2022-06-15 10:17:20'),
(25, 'WSP001', 'Stok Masuk', 5, 0, '2022-06-16 07:11:26'),
(26, 'WSP001', 'Stok Masuk', 3, 0, '2022-06-17 04:53:48'),
(27, 'WSP001', 'Stok Masuk', 1, 0, '2022-06-17 05:00:12'),
(28, 'WSP001', 'Stok Masuk', 10, 0, '2022-06-17 07:06:23'),
(29, 'WSP001', 'Stok Masuk', 5, 0, '2022-06-17 08:22:17'),
(30, 'WSP001', 'Stok Masuk', 2, 0, '2022-06-18 17:40:31'),
(31, 'WSP003', 'Stok Masuk', 3, 3, '2022-06-18 17:40:31'),
(32, 'WSP001', 'Stok Masuk', 3, 0, '2022-06-18 17:43:11'),
(33, 'WSP003', 'Stok Masuk', 1, 1, '2022-06-18 17:43:11'),
(34, 'WSP001', 'Stok Masuk', 1, 0, '2022-06-20 10:00:36'),
(35, 'WSP002', 'Stok Masuk', 15, 8, '2022-06-21 17:06:11'),
(36, 'WSP002', 'Stok Masuk', 10, 10, '2022-06-21 17:12:36'),
(37, 'WSP002', 'Stok Masuk', 100, 100, '2022-06-26 20:08:51'),
(38, 'WSP001', 'Stok Masuk', 100, 0, '2022-06-26 21:04:43'),
(39, 'WSP001', 'Stok Masuk', 100, 0, '2022-07-08 22:47:49'),
(40, 'WSP001', 'Stok Masuk', 3000, 212, '2022-07-23 15:52:54');

-- --------------------------------------------------------

--
-- Table structure for table `waserda_pembayaran_kredit`
--

CREATE TABLE `waserda_pembayaran_kredit` (
  `id` int(11) NOT NULL,
  `id_pembayaran` varchar(50) DEFAULT NULL,
  `invoice` varchar(50) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jenis_anggota` varchar(50) DEFAULT NULL,
  `nominal` int(11) DEFAULT NULL,
  `date_payment` timestamp NULL DEFAULT current_timestamp(),
  `status` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `waserda_pembayaran_kredit`
--

INSERT INTO `waserda_pembayaran_kredit` (`id`, `id_pembayaran`, `invoice`, `tanggal`, `nama`, `jenis_anggota`, `nominal`, `date_payment`, `status`) VALUES
(14, 'PMB-KR-20220626001', 'PNJWASERDA260622054', '2022-06-26', 'ela', 'pegawai', 2775, '2022-06-26 00:08:03', 1),
(18, 'PMB-KR-20220627002', 'PNJWASERDA270622054', '2022-06-27', 'Iwan', 'peternak', 27750, '2022-06-26 21:05:23', 1),
(19, 'PMB-KR-20220728004', 'PNJWASERDA020722059', '2022-07-28', 'Andi', 'peternak', 5550, '2022-07-01 17:39:25', 1),
(20, 'PMB-KR-20220728003', 'PNJWASERDA020722060', '2022-07-28', 'Joko', 'peternak', 2775, '2022-07-01 17:39:49', 1),
(21, NULL, 'PNJWASERDA280722061', NULL, 'Andi', 'peternak', 2775, '2022-07-27 17:44:31', 0),
(22, 'PMB-KR-20220728005', 'PNJWASERDA070722067', '2022-07-28', 'Budi', 'peternak', 2775, '2022-07-07 02:33:00', 1),
(23, 'PMB-KR-20220706006', 'PNJWASERDA060722068', '2022-07-06', 'Adi', 'peternak', 2775, '2022-07-06 16:18:33', 1);

-- --------------------------------------------------------

--
-- Table structure for table `waserda_pengajuan_barang`
--

CREATE TABLE `waserda_pengajuan_barang` (
  `id` int(11) NOT NULL,
  `tanggal_pengajuan` date DEFAULT NULL,
  `nama_barang` varchar(50) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `deskripsi` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'menunggu approval'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `waserda_pengajuan_barang`
--

INSERT INTO `waserda_pengajuan_barang` (`id`, `tanggal_pengajuan`, `nama_barang`, `jumlah`, `deskripsi`, `status`) VALUES
(1, '2022-06-15', 'Indomie Goreng', 23, 'aaayam', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `waserda_pengeluaran_beban`
--

CREATE TABLE `waserda_pengeluaran_beban` (
  `id` int(11) NOT NULL,
  `id_pengeluaran` varchar(250) DEFAULT NULL,
  `tgl_pengeluaran` date DEFAULT NULL,
  `no_coa` varchar(250) DEFAULT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `nominal` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `waserda_pengeluaran_beban`
--

INSERT INTO `waserda_pengeluaran_beban` (`id`, `id_pengeluaran`, `tgl_pengeluaran`, `no_coa`, `keterangan`, `nominal`, `created_at`) VALUES
(1, 'PNGBBN20220708001', '2022-07-08', '5314', 'bensin', 10000, '2022-07-08 01:17:19'),
(2, 'PNGBBN20220708002', '2022-07-08', '5314', 'bensin', 10000, '2022-07-08 03:56:53'),
(3, 'PNGBBN20220723003', '2022-07-23', '5314', 'isi bensin', 20000, '2022-07-23 15:57:12');

-- --------------------------------------------------------

--
-- Table structure for table `waserda_produk`
--

CREATE TABLE `waserda_produk` (
  `id` int(11) NOT NULL,
  `kode` varchar(255) DEFAULT NULL,
  `barcode_id` varchar(255) DEFAULT NULL,
  `id_kategori` varchar(255) DEFAULT NULL,
  `id_supplier_produk` varchar(255) DEFAULT NULL,
  `nama_produk` varchar(255) DEFAULT NULL,
  `harga_satuan` int(11) DEFAULT NULL,
  `harga_jual` int(50) NOT NULL,
  `satuan_produk` varchar(50) DEFAULT NULL,
  `jml` int(11) DEFAULT 0,
  `status` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `waserda_produk`
--

INSERT INTO `waserda_produk` (`id`, `kode`, `barcode_id`, `id_kategori`, `id_supplier_produk`, `nama_produk`, `harga_satuan`, `harga_jual`, `satuan_produk`, `jml`, `status`, `created_at`) VALUES
(1, 'WSP001', '8886008101053', 'WSK001', 'WSS001', 'Indomie Goreng', 1750, 2500, 'pcs', 214, 1, '2021-10-15 15:38:31'),
(2, 'WSP002', NULL, 'WSK001', 'WSS001', 'Indomie Goreng Ayam Bawang', 1500, 2000, 'pcs', 106, 1, '2021-10-15 15:38:31'),
(3, 'WSP003', NULL, 'WSK001', 'WSS002', 'Indomie Goreng Rendang', 1500, 2000, 'pcs', 4, 1, '2021-10-15 15:38:31'),
(4, 'WSP004', NULL, 'WSK001', 'WSS003', 'Indomie Goreng Aceh', 1500, 2000, 'pcs', 106, 1, '2021-10-15 15:38:31'),
(5, 'WSP005', '8995102800448', 'WSK001', 'WSS001', 'Indomie Rebus', 1500, 2000, 'pcs', 0, 1, '2021-10-15 15:38:31');

-- --------------------------------------------------------

--
-- Table structure for table `waserda_supplier`
--

CREATE TABLE `waserda_supplier` (
  `id` int(11) NOT NULL,
  `kode` varchar(50) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_telp` varchar(20) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `waserda_supplier`
--

INSERT INTO `waserda_supplier` (`id`, `kode`, `nama`, `alamat`, `no_telp`, `status`, `created_at`) VALUES
(1, 'WSS001', 'Kpsbu', 'bandung', '123123123', 1, '2021-10-16 04:15:14'),
(2, 'WSS002', 'Cv Anugerah', 'bekasi', '2131222', 1, '2021-10-16 04:15:27'),
(3, 'WSS003', 'Pt Sejahtera Selalu', 'lembang timur', '1231231', 1, '2021-10-16 04:15:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aktivitas`
--
ALTER TABLE `aktivitas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alokasi_shu`
--
ALTER TABLE `alokasi_shu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aset`
--
ALTER TABLE `aset`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bahan_baku`
--
ALTER TABLE `bahan_baku`
  ADD PRIMARY KEY (`no_bb`);

--
-- Indexes for table `bahan_dalam_proses`
--
ALTER TABLE `bahan_dalam_proses`
  ADD PRIMARY KEY (`no_bdp`);

--
-- Indexes for table `bahan_penolong`
--
ALTER TABLE `bahan_penolong`
  ADD PRIMARY KEY (`no_bp`);

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bom`
--
ALTER TABLE `bom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bop`
--
ALTER TABLE `bop`
  ADD PRIMARY KEY (`no_bop`);

--
-- Indexes for table `btk`
--
ALTER TABLE `btk`
  ADD PRIMARY KEY (`no_btk`);

--
-- Indexes for table `btko`
--
ALTER TABLE `btko`
  ADD PRIMARY KEY (`no_btko`);

--
-- Indexes for table `buku_kas_kecil`
--
ALTER TABLE `buku_kas_kecil`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buku_pembantu_bank`
--
ALTER TABLE `buku_pembantu_bank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buku_pembantu_kas`
--
ALTER TABLE `buku_pembantu_kas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cek_kualitas`
--
ALTER TABLE `cek_kualitas`
  ADD PRIMARY KEY (`no_trans`);

--
-- Indexes for table `coa`
--
ALTER TABLE `coa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_absen_rfid`
--
ALTER TABLE `detail_absen_rfid`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_cek_kualitas`
--
ALTER TABLE `detail_cek_kualitas`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `detail_pembagian`
--
ALTER TABLE `detail_pembagian`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `detail_pembelian`
--
ALTER TABLE `detail_pembelian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_pembelian_bb`
--
ALTER TABLE `detail_pembelian_bb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_pembelian_bp`
--
ALTER TABLE `detail_pembelian_bp`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `detail_penerimaan_pengeluaran_kas`
--
ALTER TABLE `detail_penerimaan_pengeluaran_kas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_penjualan_ips`
--
ALTER TABLE `detail_penjualan_ips`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `detail_penjualan_toko`
--
ALTER TABLE `detail_penjualan_toko`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `detail_produksi_ke1`
--
ALTER TABLE `detail_produksi_ke1`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `detail_produksi_ke2`
--
ALTER TABLE `detail_produksi_ke2`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `detail_target_produksi`
--
ALTER TABLE `detail_target_produksi`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `detail_transaksi_shu`
--
ALTER TABLE `detail_transaksi_shu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jadwal_shift`
--
ALTER TABLE `jadwal_shift`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jenis_bop`
--
ALTER TABLE `jenis_bop`
  ADD PRIMARY KEY (`no_jbop`);

--
-- Indexes for table `jenis_penjualan`
--
ALTER TABLE `jenis_penjualan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jurnal`
--
ALTER TABLE `jurnal`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `kartu_stok_bp`
--
ALTER TABLE `kartu_stok_bp`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `kartu_stok_penj`
--
ALTER TABLE `kartu_stok_penj`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `laporan_kartu_stock`
--
ALTER TABLE `laporan_kartu_stock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_bayar_pinjaman`
--
ALTER TABLE `log_bayar_pinjaman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_confirm_truck`
--
ALTER TABLE `log_confirm_truck`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_pembayaran_susu`
--
ALTER TABLE `log_pembayaran_susu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_penyusutan`
--
ALTER TABLE `log_penyusutan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_pinjaman`
--
ALTER TABLE `log_pinjaman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_simpanan_hr`
--
ALTER TABLE `log_simpanan_hr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembagian`
--
ALTER TABLE `pembagian`
  ADD PRIMARY KEY (`no_trans`);

--
-- Indexes for table `pembagian_shu`
--
ALTER TABLE `pembagian_shu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembayaranv`
--
ALTER TABLE `pembayaranv`
  ADD PRIMARY KEY (`no_trans`);

--
-- Indexes for table `pembayaran_susu`
--
ALTER TABLE `pembayaran_susu`
  ADD PRIMARY KEY (`kode_pembayaran`);

--
-- Indexes for table `pembelian_aset`
--
ALTER TABLE `pembelian_aset`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indexes for table `pembelian_bb`
--
ALTER TABLE `pembelian_bb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penerimaan_kas`
--
ALTER TABLE `penerimaan_kas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penerimaan_pengeluaran_kas`
--
ALTER TABLE `penerimaan_pengeluaran_kas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengajuan_bonus`
--
ALTER TABLE `pengajuan_bonus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengajuan_jurnal`
--
ALTER TABLE `pengajuan_jurnal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengeluaran_kas`
--
ALTER TABLE `pengeluaran_kas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penjualan_ips`
--
ALTER TABLE `penjualan_ips`
  ADD PRIMARY KEY (`no_trans`);

--
-- Indexes for table `penjualan_toko`
--
ALTER TABLE `penjualan_toko`
  ADD PRIMARY KEY (`no_trans`);

--
-- Indexes for table `penyusutan`
--
ALTER TABLE `penyusutan`
  ADD PRIMARY KEY (`id_penyusutan`);

--
-- Indexes for table `perbaikan`
--
ALTER TABLE `perbaikan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peternak`
--
ALTER TABLE `peternak`
  ADD PRIMARY KEY (`no_peternak`);

--
-- Indexes for table `pinjaman`
--
ALTER TABLE `pinjaman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pnj_susu`
--
ALTER TABLE `pnj_susu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_detail_pembelian`
--
ALTER TABLE `pos_detail_pembelian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_detail_penjualan`
--
ALTER TABLE `pos_detail_penjualan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_pembelian`
--
ALTER TABLE `pos_pembelian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_penjualan`
--
ALTER TABLE `pos_penjualan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`no_produk`);

--
-- Indexes for table `revaluasi`
--
ALTER TABLE `revaluasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shift`
--
ALTER TABLE `shift`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `simpanan`
--
ALTER TABLE `simpanan`
  ADD PRIMARY KEY (`kode_simpanan`);

--
-- Indexes for table `supplier_aset`
--
ALTER TABLE `supplier_aset`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_cuti`
--
ALTER TABLE `tb_cuti`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_cuti_melahirkan`
--
ALTER TABLE `tb_cuti_melahirkan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_detail_pengajuan_bonus`
--
ALTER TABLE `tb_detail_pengajuan_bonus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_detail_penggajian`
--
ALTER TABLE `tb_detail_penggajian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_jabatan`
--
ALTER TABLE `tb_jabatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_jenis_pegawai`
--
ALTER TABLE `tb_jenis_pegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_lembur`
--
ALTER TABLE `tb_lembur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_penggajian`
--
ALTER TABLE `tb_penggajian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_ptkp`
--
ALTER TABLE `tb_ptkp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tps`
--
ALTER TABLE `tps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi_hpp`
--
ALTER TABLE `transaksi_hpp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi_shu`
--
ALTER TABLE `transaksi_shu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trans_peny_rev`
--
ALTER TABLE `trans_peny_rev`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `truck_information`
--
ALTER TABLE `truck_information`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tunjangan_hari_raya`
--
ALTER TABLE `tunjangan_hari_raya`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `update_stok_penj`
--
ALTER TABLE `update_stok_penj`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `waserda_jenis_anggota`
--
ALTER TABLE `waserda_jenis_anggota`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `waserda_kategori`
--
ALTER TABLE `waserda_kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `waserda_log_transaksi`
--
ALTER TABLE `waserda_log_transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `waserda_pembayaran_kredit`
--
ALTER TABLE `waserda_pembayaran_kredit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `waserda_pengajuan_barang`
--
ALTER TABLE `waserda_pengajuan_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `waserda_pengeluaran_beban`
--
ALTER TABLE `waserda_pengeluaran_beban`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `waserda_produk`
--
ALTER TABLE `waserda_produk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `waserda_supplier`
--
ALTER TABLE `waserda_supplier`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensi`
--
ALTER TABLE `absensi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `aktivitas`
--
ALTER TABLE `aktivitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `alokasi_shu`
--
ALTER TABLE `alokasi_shu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bom`
--
ALTER TABLE `bom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `buku_kas_kecil`
--
ALTER TABLE `buku_kas_kecil`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `buku_pembantu_bank`
--
ALTER TABLE `buku_pembantu_bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `buku_pembantu_kas`
--
ALTER TABLE `buku_pembantu_kas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `coa`
--
ALTER TABLE `coa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `detail_absen_rfid`
--
ALTER TABLE `detail_absen_rfid`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `detail_cek_kualitas`
--
ALTER TABLE `detail_cek_kualitas`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `detail_pembagian`
--
ALTER TABLE `detail_pembagian`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `detail_pembelian`
--
ALTER TABLE `detail_pembelian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `detail_pembelian_bb`
--
ALTER TABLE `detail_pembelian_bb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `detail_pembelian_bp`
--
ALTER TABLE `detail_pembelian_bp`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `detail_penerimaan_pengeluaran_kas`
--
ALTER TABLE `detail_penerimaan_pengeluaran_kas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `detail_penjualan_ips`
--
ALTER TABLE `detail_penjualan_ips`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `detail_penjualan_toko`
--
ALTER TABLE `detail_penjualan_toko`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `detail_produksi_ke1`
--
ALTER TABLE `detail_produksi_ke1`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `detail_produksi_ke2`
--
ALTER TABLE `detail_produksi_ke2`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `detail_target_produksi`
--
ALTER TABLE `detail_target_produksi`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `detail_transaksi_shu`
--
ALTER TABLE `detail_transaksi_shu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `jadwal_shift`
--
ALTER TABLE `jadwal_shift`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `jenis_penjualan`
--
ALTER TABLE `jenis_penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jurnal`
--
ALTER TABLE `jurnal`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `kartu_stok_bp`
--
ALTER TABLE `kartu_stok_bp`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `kartu_stok_penj`
--
ALTER TABLE `kartu_stok_penj`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `laporan_kartu_stock`
--
ALTER TABLE `laporan_kartu_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `log_bayar_pinjaman`
--
ALTER TABLE `log_bayar_pinjaman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `log_confirm_truck`
--
ALTER TABLE `log_confirm_truck`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `log_pembayaran_susu`
--
ALTER TABLE `log_pembayaran_susu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `log_penyusutan`
--
ALTER TABLE `log_penyusutan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `log_pinjaman`
--
ALTER TABLE `log_pinjaman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `log_simpanan_hr`
--
ALTER TABLE `log_simpanan_hr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `pembagian_shu`
--
ALTER TABLE `pembagian_shu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pembelian_bb`
--
ALTER TABLE `pembelian_bb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `penerimaan_kas`
--
ALTER TABLE `penerimaan_kas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penerimaan_pengeluaran_kas`
--
ALTER TABLE `penerimaan_pengeluaran_kas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `pengajuan_bonus`
--
ALTER TABLE `pengajuan_bonus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `pengajuan_jurnal`
--
ALTER TABLE `pengajuan_jurnal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pengeluaran_kas`
--
ALTER TABLE `pengeluaran_kas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `perbaikan`
--
ALTER TABLE `perbaikan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pinjaman`
--
ALTER TABLE `pinjaman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pnj_susu`
--
ALTER TABLE `pnj_susu`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `pos_detail_pembelian`
--
ALTER TABLE `pos_detail_pembelian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pos_detail_penjualan`
--
ALTER TABLE `pos_detail_penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `pos_pembelian`
--
ALTER TABLE `pos_pembelian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pos_penjualan`
--
ALTER TABLE `pos_penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `revaluasi`
--
ALTER TABLE `revaluasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `satuan`
--
ALTER TABLE `satuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shift`
--
ALTER TABLE `shift`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_cuti`
--
ALTER TABLE `tb_cuti`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_cuti_melahirkan`
--
ALTER TABLE `tb_cuti_melahirkan`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_detail_pengajuan_bonus`
--
ALTER TABLE `tb_detail_pengajuan_bonus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tb_detail_penggajian`
--
ALTER TABLE `tb_detail_penggajian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `tb_jabatan`
--
ALTER TABLE `tb_jabatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_jenis_pegawai`
--
ALTER TABLE `tb_jenis_pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_lembur`
--
ALTER TABLE `tb_lembur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_penggajian`
--
ALTER TABLE `tb_penggajian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `tb_ptkp`
--
ALTER TABLE `tb_ptkp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tps`
--
ALTER TABLE `tps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transaksi_hpp`
--
ALTER TABLE `transaksi_hpp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transaksi_shu`
--
ALTER TABLE `transaksi_shu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `trans_peny_rev`
--
ALTER TABLE `trans_peny_rev`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `truck_information`
--
ALTER TABLE `truck_information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tunjangan_hari_raya`
--
ALTER TABLE `tunjangan_hari_raya`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `update_stok_penj`
--
ALTER TABLE `update_stok_penj`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `waserda_jenis_anggota`
--
ALTER TABLE `waserda_jenis_anggota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `waserda_kategori`
--
ALTER TABLE `waserda_kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `waserda_log_transaksi`
--
ALTER TABLE `waserda_log_transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `waserda_pembayaran_kredit`
--
ALTER TABLE `waserda_pembayaran_kredit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `waserda_pengajuan_barang`
--
ALTER TABLE `waserda_pengajuan_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `waserda_pengeluaran_beban`
--
ALTER TABLE `waserda_pengeluaran_beban`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `waserda_produk`
--
ALTER TABLE `waserda_produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `waserda_supplier`
--
ALTER TABLE `waserda_supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
