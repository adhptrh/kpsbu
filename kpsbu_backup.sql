-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 29, 2022 at 04:59 PM
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
(13, '2022-07-08'),
(14, '2022-07-22');

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
(14, 'Piutang Usaha'),
(17, 'Pembelian Aset'),
(18, 'Penjualan Aset'),
(19, 'Beban Listrik Air Dan Telepon'),
(20, 'Bensin'),
(21, 'Beli Materai'),
(22, 'Alat Tulis Kantor'),
(23, 'Kas Kecil'),
(24, 'Modal'),
(25, 'Isi Angin');

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
('AS-16', 'Mobil Tesla', 12, 'SPA-03', 1214, 5313, 1125),
('AS-17', 'Mobil Brio', 12, 'SPA-03', 1214, 5228, 1125),
('AS-18', 'Mobil ABC', 12, 'SPA-03', 1214, 5228, 1125),
('AS-19', 'Mobil Brio', 12, 'SPA-02', 1214, 5228, 1125),
('AS-20', 'Mobil Pajero Sport', 12, 'SPA-02', 1214, 5228, 1125),
('AS-21', 'Brio', 12, 'SPA-02', 1214, 5228, 1125),
('AS-22', 'Mobil BMW', 12, 'SPA-02', 1214, 5228, 1125);

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
('BB_001', 'Susu Sapi', 'liter', 0);

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
('BP_001', 'Gula', 'gram', 0),
('BP_002', 'Bubuk Biang Yoghurt', 'gram', 0),
('BP_003', 'Pewarna Makanan', 'ml', 0),
('BP_004', 'Perisa Makanan', 'ml', 0),
('BP_005', 'Garam', 'gram', 0);

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
(6, 'BNK-202207130001', 'Bank BCA'),
(8, 'BNK-202207130002', 'Bank BNI'),
(9, 'BNK-202207130003', 'Bank Mandiri');

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
(62, 'PR_003', 'BB_001', 1),
(63, 'PR_003', 'BP_001', 5),
(64, 'PR_003', 'BP_002', 20);

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

-- --------------------------------------------------------

--
-- Table structure for table `bopo`
--

CREATE TABLE `bopo` (
  `no_bopo` varchar(50) NOT NULL,
  `tgl_bopo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(13, 'PNJWASERDA140722001', '2022-07-14', 20000, 'Penjualan', 'd'),
(15, 'PNJWASERDA140722003', '2022-07-14', 4000, 'Penjualan', 'd'),
(16, 'PNJWASERDA220722004', '2022-07-22', 20000, 'Penjualan', 'd'),
(17, 'PNJWASERDA220722005', '2022-07-22', 12000, 'Penjualan', 'd'),
(18, 'PNJWASERDA220722006', '2022-07-22', 10000, 'Penjualan', 'd'),
(19, 'PNJWASERDA220722007', '2022-07-22', 20000, 'Penjualan', 'd'),
(20, 'PNJWASERDA220722008', '2022-07-22', 10000, 'Penjualan', 'd'),
(21, 'PNJWASERDA230722009', '2022-07-23', 20000, 'Penjualan', 'd'),
(22, 'PNJWASERDA230722009', '2022-07-23', 10000, 'Penjualan', 'd'),
(23, 'PNJWASERDA230722009', '2022-07-23', 12000, 'Penjualan', 'd'),
(24, 'PNJWASERDA230722009', '2022-07-23', 2000, 'Penjualan', 'd'),
(25, 'PNJWASERDA230722010', '2022-07-23', 10000, 'Penjualan', 'd'),
(26, 'PNJWASERDA230722011', '2022-07-23', 2000, 'Penjualan', 'd'),
(27, 'PNJWASERDA230722012', '2022-07-23', 10000, 'Penjualan', 'd'),
(28, 'PNJWASERDA230722013', '2022-07-23', 2000, 'Penjualan', 'd');

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
(60, 'GAJI-002', '2022-07-22', '59112458', 1111, 'k', 'Pembayaran Gaji'),
(61, 'GAJI-002', '2022-07-21', '0', 1111, 'k', 'Pembayaran Gaji'),
(62, 'PMBWASERDA140722002', '2022-07-14', '777000', 1111, 'k', 'Pembelian Barang Waserda'),
(63, 'PNJWASERDA220722005', '2022-07-22', '13320', 1111, 'd', 'Penjualan Tunai'),
(64, 'PNJWASERDA220722004', '2022-07-22', '22200', 1111, 'd', 'Penjualan Tunai'),
(65, 'PNJWASERDA220722006', '2022-07-22', '11100', 1111, 'd', 'Penjualan Tunai'),
(66, 'PNJWASERDA220722007', '2022-07-22', '22200', 1111, 'd', 'Penjualan Tunai'),
(67, 'GAJI-001', '2022-07-22', '214022833', 1111, 'k', 'Pembayaran Gaji'),
(68, 'PNJWASERDA220722008', '2022-07-22', '11100', 1111, 'd', 'Penjualan Tunai'),
(69, 'PNJWASERDA230722010', '2022-07-23', '11500', 1111, 'd', 'Penjualan Tunai'),
(70, 'PNJWASERDA230722009', '2022-07-23', '2500', 1111, 'd', 'Penjualan Tunai'),
(71, 'PNJWASERDA230722011', '2022-07-23', '2500', 1111, 'd', 'Penjualan Tunai'),
(72, 'PNJWASERDA230722013', '2022-07-23', '2500', 1111, 'd', 'Penjualan Tunai');

-- --------------------------------------------------------

--
-- Table structure for table `cek_kualitas`
--

CREATE TABLE `cek_kualitas` (
  `no_trans` varchar(50) NOT NULL,
  `tgl_trans` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(30, 5311, 'Beban Gaji', '', 0, 5, 'k', 0, 0, 0, 0, 0, 1, 0),
(31, 5312, 'BOP Dibebankan', '', 0, 5, 'k', 0, 0, 0, 0, 0, 1, 0),
(32, 6111, 'Harga Pokok Penjualan IPS', '', 0, 6, 'd', 0, 0, 0, 0, 0, 1, 0),
(33, 6112, 'Harga Pokok Penjualan Toko', '', 0, 6, 'd', 0, 0, 0, 0, 0, 1, 0),
(34, 5228, 'Beban Penyusutan Kendaraan ', '', 0, 5, 'd', 1, 0, 0, 0, 0, 1, 0),
(35, 1125, 'Akumulasi Penyusutan Kendaraan', '', 0, 1, 'k', 0, 0, 0, 0, 0, 1, 1),
(36, 1214, 'Kendaraan', '', 0, 1, 'd', 0, 0, 0, 0, 0, 1, 0),
(37, 5224, 'Beban Perbaikan', '', 0, 5, 'd', 1, 1, 0, 0, 0, 1, 0),
(41, 4116, 'Penjualan Waserda', '', 0, 4, 'k', 1, 0, 1, 1, 0, 1, 0),
(43, 1998, 'Piutang Waserda', '', 0, 1, 'd', 0, 0, 0, 0, 0, 1, 0),
(48, 4211, 'SHU', '', 0, 4, 'd', 0, 0, 0, 0, 0, 1, 0),
(49, 5313, 'Beban Reparasi Kendaraan', '', 0, 5, 'k', 0, 0, 1, 1, 1, 1, 0),
(50, 5314, 'Beban Transportasi Waserda', '', 0, 5, 'k', 0, 0, 0, 1, 1, 1, 0),
(51, 5400, 'Beban Lembur', '', 0, 5, 'd', 0, 0, 0, 0, 0, 1, 0),
(52, 1414, 'Pers. Barang Dagang', '', 0, 1, 'k', 0, 0, 0, 0, 0, 1, 0),
(53, 2130, 'PPN Masukan', '', 0, 2, 'd', 0, 0, 0, 0, 0, 1, 0),
(54, 2140, 'PPN Keluaran', '', 0, 2, 'k', 0, 0, 0, 0, 0, 1, 0),
(55, 1116, 'Kas & Bank', '', 0, 1, 'd', 0, 0, 0, 0, 0, 1, 0),
(56, 1117, 'Kas Kecil', '', 0, 1, 'd', 0, 0, 0, 0, 0, 1, 0),
(57, 5220, 'Beban Listrik, Air dan Telepon Waserda', '', 0, 5, 'd', 0, 0, 0, 1, 1, 1, 0),
(58, 4212, 'Pinjaman Bank', '', 0, 4, 'd', 0, 0, 0, 0, 0, 1, 0),
(59, 2113, 'Utang Bank', '', 0, 2, 'd', 0, 0, 0, 0, 0, 1, 0),
(60, 4117, 'Penjualan Aktiva Tetap', '', 0, 4, 'd', 0, 0, 0, 0, 0, 1, 0),
(61, 5100, 'Pembelian Aktiva Tetap', '', 0, 5, 'k', 0, 0, 0, 0, 0, 1, 0),
(62, 3000, 'Modal', '', 0, 3, 'd', 0, 0, 0, 0, 0, 1, 0),
(63, 3101, 'Prive', '', 0, 3, 'k', 0, 0, 0, 0, 0, 1, 0),
(64, 5315, 'Beban Tunjangan Kesehatan', '', 0, 5, 'd', 0, 0, 0, 0, 0, 1, 0),
(65, 5316, 'Beban Tunjangan Jabatan', '', 0, 5, 'd', 0, 0, 0, 0, 0, 1, 0),
(66, 5317, 'Beban Bonus', '', 0, 5, 'd', 0, 0, 0, 0, 0, 1, 0),
(67, 2114, 'Utang PPH21', '', 0, 2, 'k', 0, 0, 0, 0, 0, 1, 0),
(68, 5318, 'Beban Tunjangan Hari Raya', '', 0, 5, 'd', 0, 0, 0, 0, 0, 1, 0),
(69, 3300, 'SHU Tahun Berjalan', '', 0, 3, 'd', 0, 0, 0, 0, 0, 1, 0),
(70, 3200, 'SHU Ditahan', '', 0, 3, 'd', 0, 0, 0, 0, 0, 1, 0),
(71, 3100, 'SHU Tahun Berjalan Pada Tahun Lalu', '', 0, 3, 'k', 0, 0, 0, 0, 0, 1, 0),
(72, 1300, 'Ikhtisar Laba Rugi', '', 0, 1, 'k', 0, 0, 0, 0, 0, 1, 0),
(73, 6113, 'Harga Pokok Penjualan', '', 0, 6, 'd', 1, 0, 0, 1, 0, 1, 0),
(76, 1215, 'Tanah', '', 0, 1, 'd', 0, 0, 0, 0, 0, 0, 0),
(78, 1118, 'Piutang Usaha', '', 0, 1, 'd', 0, 0, 0, 0, 0, 0, 0),
(79, 1119, 'Perlengkapan', '', 0, 1, 'd', 0, 0, 0, 0, 0, 0, 0);

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
  `keterangan` varchar(255) DEFAULT NULL,
  `id_shift` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_absen_rfid`
--

INSERT INTO `detail_absen_rfid` (`id`, `id_absensi`, `rfid`, `status`, `jam`, `keterangan`, `id_shift`) VALUES
(42, 13, '123232323', 'masuk', '10:17:44', 'Presensi Masuk, Telat', 1),
(43, 13, '123232323', '', '10:19:40', 'Presensi Keluar', 1),
(44, 14, '1029384756', 'masuk', '13:10:49', 'Presensi Masuk', 2),
(45, 14, '12345', 'masuk', '13:13:53', 'Presensi Masuk', 2);

-- --------------------------------------------------------

--
-- Table structure for table `detail_bop`
--

CREATE TABLE `detail_bop` (
  `no_bop` varchar(100) NOT NULL,
  `no_jbop` varchar(100) NOT NULL,
  `harga` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detail_bopo`
--

CREATE TABLE `detail_bopo` (
  `no_bopo` varchar(50) NOT NULL,
  `no_jbop` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(38, 'PMBAST20220709002', 'AS-16', 'SPA-03', 200000000, 2000000, '202000000', '20000000', '11', '12', '0000-00-00', '2022-07', NULL, 'IDA-026', 0),
(39, 'PMBAST20220724003', 'AS-17', 'SPA-03', 120000000, 1200000, '121200000', '12000000', '11', '12', '0000-00-00', '2022-07', NULL, 'IDA-027', 0),
(40, 'PMBAST20220724004', 'AS-18', 'SPA-03', 200000000, 2000000, '202000000', '20000000', '11', '12', '0000-00-00', '2022-07', NULL, 'IDA-028', 0),
(41, 'PMBAST20220710005', 'AS-19', 'SPA-02', 200000000, 2000000, '202000000', '20000000', '11', '12', '0000-00-00', '2022-07', NULL, 'IDA-029', 0),
(42, 'PMBAST20220713001', 'AS-20', 'SPA-02', 500000000, 5000000, '505000000', '50000000', '11', '12', '0000-00-00', '2022-07', NULL, 'IDA-030', 0),
(43, 'PMBAST20220713002', 'AS-21', 'SPA-02', 200000000, 2000000, '202000000', '20000000', '11', '12', '0000-00-00', '2022-07', NULL, 'IDA-031', 0),
(44, 'PMBAST20220714003', 'AS-22', 'SPA-02', 800000000, 8000000, '808000000', '80000000', '12', '12', '0000-00-00', '0000-00', NULL, 'IDA-032', 0);

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
(22, 'PMB_001', 'BB_001', 100, '5700', 570000, 'PTRNK_053'),
(23, 'PMB_002', 'BB_001', 102, '5700', 581400, 'PTRNK_054');

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

--
-- Dumping data for table `detail_transaksi_shu`
--

INSERT INTO `detail_transaksi_shu` (`id`, `kode_shu`, `uraian`, `nominal`) VALUES
(21, 'SHU20220001', 'Cadangan koperasi', 6564),
(22, 'SHU20220001', 'Jasa anggota', 4102),
(23, 'SHU20220001', 'Jasa modal', 3282),
(24, 'SHU20220001', 'Jasa lain-lain', 2461),
(25, 'SHU20220002', 'Cadangan koperasi', 8237),
(26, 'SHU20220002', 'Jasa anggota', 5148),
(27, 'SHU20220002', 'Jasa modal', 4118),
(28, 'SHU20220002', 'Jasa lain-lain', 3089);

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
(19, '8003250622755', '2', '2022-07-22', '2022-07-22', 'sore', 'it', 0),
(20, '8003250622756', '2', '2022-07-22', '2022-07-22', 'sore', 'it', 0),
(21, '8003250622757', '2', '2022-07-22', '2022-07-22', 'sore', 'it', 0),
(22, '1608260622758', '1', '2022-07-22', '2022-07-31', 'pagi', 'it', 0),
(23, '9200270622759', '1', '2022-07-22', '2022-07-31', 'pagi', 'it', 0),
(24, '1044020722760', '1', '2022-07-22', '2022-07-31', 'pagi', 'it', 0),
(25, '5016030722761', '1', '2022-07-22', '2022-07-31', 'pagi', 'it', 0),
(26, '5325080722762', '1', '2022-07-22', '2022-07-31', 'pagi', 'it', 0),
(27, '9432110722763', '1', '2022-07-22', '2022-07-31', 'pagi', 'it', 0),
(28, '9017140722764', '1', '2022-07-22', '2022-07-31', 'pagi', 'it', 0);

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
(67, 'PNJWASERDA140722001', '2022-07-14', 1111, 'd', 22200),
(68, 'PNJWASERDA140722001', '2022-07-14', 2140, 'k', 2200),
(69, 'PNJWASERDA140722001', '2022-07-14', 4116, 'k', 20000),
(70, 'PNJWASERDA140722001', '2022-07-14', 6113, 'd', 15000),
(71, 'PNJWASERDA140722001', '2022-07-14', 1414, 'k', 15000),
(72, 'PNGBBN20220714001', '2022-07-14', 5314, 'd', 10000),
(73, 'PNGBBN20220714001', '2022-07-14', 1111, 'k', 10000),
(74, 'PNJWASERDA140722002', '2022-07-14', 1111, 'd', 6660),
(75, 'PNJWASERDA140722002', '2022-07-14', 2140, 'k', 660),
(76, 'PNJWASERDA140722002', '2022-07-14', 4116, 'k', 6000),
(77, 'PNJWASERDA140722002', '2022-07-14', 6113, 'd', 4500),
(78, 'PNJWASERDA140722002', '2022-07-14', 1414, 'k', 4500),
(99, 'PNGBBN20220714002', '2022-07-14', 5314, 'd', 10000),
(100, 'PNGBBN20220714002', '2022-07-14', 1111, 'k', 10000),
(105, 'PNJWASERDA140722003', '2022-07-14', 1111, 'd', 4440),
(106, 'PNJWASERDA140722003', '2022-07-14', 2140, 'k', 440),
(107, 'PNJWASERDA140722003', '2022-07-14', 4116, 'k', 4000),
(108, 'PNJWASERDA140722003', '2022-07-14', 6113, 'd', 3000),
(109, 'PNJWASERDA140722003', '2022-07-14', 1414, 'k', 3000),
(110, 'GAJI-001', '2022-07-21', 5311, 'd', 69000000),
(111, 'GAJI-001', '2022-07-21', 5316, 'd', 1350000),
(112, 'GAJI-001', '2022-07-21', 5315, 'd', 1500000),
(113, 'GAJI-001', '2022-07-21', 5317, 'd', 3400000),
(114, 'GAJI-001', '2022-07-21', 5318, 'd', 71850000),
(115, 'GAJI-001', '2022-07-21', 2114, 'k', 6813249),
(116, 'GAJI-001', '2022-07-21', 1111, 'k', 140386750),
(117, 'GAJI-002', '2022-07-22', 5311, 'd', 60000000),
(118, 'GAJI-002', '2022-07-22', 5316, 'd', 1850000),
(119, 'GAJI-002', '2022-07-22', 5315, 'd', 1500000),
(120, 'GAJI-002', '2022-07-22', 5317, 'd', 0),
(121, 'GAJI-002', '2022-07-22', 5318, 'd', 0),
(122, 'GAJI-002', '2022-07-22', 2114, 'k', 4237541),
(123, 'GAJI-002', '2022-07-22', 1111, 'k', 59112458),
(124, 'GAJI-002', '2022-07-21', 5311, 'd', 60000000),
(125, 'GAJI-002', '2022-07-21', 5316, 'd', 1850000),
(126, 'GAJI-002', '2022-07-21', 5315, 'd', 1500000),
(127, 'GAJI-002', '2022-07-21', 5317, 'd', 0),
(128, 'GAJI-002', '2022-07-21', 5318, 'd', 0),
(129, 'GAJI-002', '2022-07-21', 2114, 'k', 4237541),
(130, 'GAJI-002', '2022-07-21', 1111, 'k', 0),
(131, 'LMBR20220714002', '2022-07-22', 5400, 'd', 80000),
(132, 'LMBR20220714002', '2022-07-22', 1111, 'k', 80000),
(133, 'LMBR20220713001', '2022-07-22', 5400, 'd', 20000),
(134, 'LMBR20220713001', '2022-07-22', 1111, 'k', 20000),
(135, 'PMBWASERDA140722002', '2022-07-22', 1414, 'd', 700000),
(136, 'PMBWASERDA140722002', '2022-07-22', 2130, 'd', 77000),
(137, 'PMBWASERDA140722002', '2022-07-22', 1111, 'k', 777000),
(138, 'PNJWASERDA220722005', '2022-07-22', 1111, 'd', 13320),
(139, 'PNJWASERDA220722005', '2022-07-22', 2140, 'k', 1320),
(140, 'PNJWASERDA220722005', '2022-07-22', 4116, 'k', 12000),
(141, 'PNJWASERDA220722005', '2022-07-22', 6113, 'd', 9000),
(142, 'PNJWASERDA220722005', '2022-07-22', 1414, 'k', 9000),
(143, 'PNJWASERDA220722004', '2022-07-22', 1111, 'd', 22200),
(144, 'PNJWASERDA220722004', '2022-07-22', 2140, 'k', 2200),
(145, 'PNJWASERDA220722004', '2022-07-22', 4116, 'k', 20000),
(146, 'PNJWASERDA220722004', '2022-07-22', 6113, 'd', 15000),
(147, 'PNJWASERDA220722004', '2022-07-22', 1414, 'k', 15000),
(148, 'PNJWASERDA220722006', '2022-07-22', 1111, 'd', 11100),
(149, 'PNJWASERDA220722006', '2022-07-22', 2140, 'k', 1100),
(150, 'PNJWASERDA220722006', '2022-07-22', 4116, 'k', 10000),
(151, 'PNJWASERDA220722006', '2022-07-22', 6113, 'd', 7500),
(152, 'PNJWASERDA220722006', '2022-07-22', 1414, 'k', 7500),
(153, 'PNJWASERDA220722007', '2022-07-22', 1111, 'd', 22200),
(154, 'PNJWASERDA220722007', '2022-07-22', 2140, 'k', 2200),
(155, 'PNJWASERDA220722007', '2022-07-22', 4116, 'k', 20000),
(156, 'PNJWASERDA220722007', '2022-07-22', 6113, 'd', 15000),
(157, 'PNJWASERDA220722007', '2022-07-22', 1414, 'k', 15000),
(158, 'GAJI-001', '2022-07-22', 5311, 'd', 198000000),
(159, 'GAJI-001', '2022-07-22', 5316, 'd', 4550000),
(160, 'GAJI-001', '2022-07-22', 5315, 'd', 4500000),
(161, 'GAJI-001', '2022-07-22', 5317, 'd', 23400000),
(162, 'GAJI-001', '2022-07-22', 5318, 'd', 143700000),
(163, 'GAJI-001', '2022-07-22', 2114, 'k', 19840415),
(164, 'GAJI-001', '2022-07-22', 1111, 'k', 214022833),
(165, 'PNJWASERDA220722008', '2022-07-22', 1111, 'd', 11100),
(166, 'PNJWASERDA220722008', '2022-07-22', 2140, 'k', 1100),
(167, 'PNJWASERDA220722008', '2022-07-22', 4116, 'k', 10000),
(168, 'PNJWASERDA220722008', '2022-07-22', 6113, 'd', 7500),
(169, 'PNJWASERDA220722008', '2022-07-22', 1414, 'k', 7500),
(170, 'LMBR20220722004', '2022-07-22', 5400, 'd', 100000),
(171, 'LMBR20220722004', '2022-07-22', 1111, 'k', 100000),
(172, 'PNJWASERDA230722010', '2022-07-23', 1111, 'd', 11500),
(173, 'PNJWASERDA230722010', '2022-07-23', 2140, 'k', 1100),
(174, 'PNJWASERDA230722010', '2022-07-23', 4116, 'k', 10000),
(175, 'PNJWASERDA230722010', '2022-07-23', 6113, 'd', 7500),
(176, 'PNJWASERDA230722010', '2022-07-23', 1414, 'k', 7500),
(177, 'PNJWASERDA230722009', '2022-07-23', 1111, 'd', 2500),
(178, 'PNJWASERDA230722009', '2022-07-23', 2140, 'k', 200),
(179, 'PNJWASERDA230722009', '2022-07-23', 4116, 'k', 2000),
(180, 'PNJWASERDA230722009', '2022-07-23', 6113, 'd', 1500),
(181, 'PNJWASERDA230722009', '2022-07-23', 1414, 'k', 1500),
(182, 'PNJWASERDA230722011', '2022-07-23', 1111, 'd', 2500),
(183, 'PNJWASERDA230722011', '2022-07-23', 2140, 'k', 220),
(184, 'PNJWASERDA230722011', '2022-07-23', 4116, 'k', 2000),
(185, 'PNJWASERDA230722011', '2022-07-23', 6113, 'd', 1500),
(186, 'PNJWASERDA230722011', '2022-07-23', 1414, 'k', 1500),
(187, 'PNJWASERDA230722013', '2022-07-26', 1111, 'd', 2500),
(188, 'PNJWASERDA230722013', '2022-07-26', 2140, 'k', 200),
(189, 'PNJWASERDA230722013', '2022-07-26', 4116, 'k', 2000),
(190, 'PNJWASERDA230722013', '2022-07-26', 6113, 'd', 1500),
(191, 'PNJWASERDA230722013', '2022-07-26', 1414, 'k', 1500),
(192, 'SHU20220001', '2022-12-31', 3200, 'd', 8836),
(193, 'SHU20220001', '2022-12-31', 3100, 'k', 8836),
(194, 'PNJWASERDA230722012', '2022-07-26', 1998, 'd', 11500),
(195, 'PNJWASERDA230722012', '2022-07-26', 2140, 'k', 1100),
(196, 'PNJWASERDA230722012', '2022-07-26', 4116, 'k', 10000),
(197, 'PNJWASERDA230722012', '2022-07-26', 6113, 'd', 7500),
(198, 'PNJWASERDA230722012', '2022-07-26', 1414, 'k', 7500),
(199, 'PMB_001', '2022-07-26', 1112, 'd', 570000),
(200, 'PMB_001', '2022-07-26', 2111, 'k', 570000),
(201, 'PMBS-090820220001', '2022-08-09', 2111, 'd', 570000),
(202, 'PMBS-090820220001', '2022-08-09', 1111, 'k', 558000),
(203, 'PMBS-090820220001', '2022-08-09', 3112, 'k', 2000),
(204, 'PMBS-090820220001', '2022-08-09', 3113, 'k', 10000),
(205, 'PMB_002', '2022-07-26', 1112, 'd', 581400),
(206, 'PMB_002', '2022-07-26', 2111, 'k', 581400),
(207, 'PMBS-090820220002', '2022-08-09', 2111, 'd', 581400),
(208, 'PMBS-090820220002', '2022-08-09', 1111, 'k', 569360),
(209, 'PMBS-090820220002', '2022-08-09', 3112, 'k', 2040),
(210, 'PMBS-090820220002', '2022-08-09', 3113, 'k', 10000),
(211, 'PMBGSHU.TOTAL20220001', '2022-12-31', 3300, 'd', 35931904),
(212, 'PMBGSHU.TOTAL20220001', '2022-12-31', 1111, 'k', 35931904),
(213, 'SHU20220002', '2022-12-31', 3200, 'd', 11088),
(214, 'SHU20220002', '2022-12-31', 3100, 'k', 11088),
(215, 'DPPTRNK_054', '2022-08-09', 1111, 'd', 50000),
(216, 'DPPTRNK_054', '2022-08-09', 3111, 'k', 50000),
(217, 'DPPTRNK_053', '2022-08-09', 1111, 'd', 50000),
(218, 'DPPTRNK_053', '2022-08-09', 3111, 'k', 50000);

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
(25, '2022-07-13 17:21:03', 'WSP001', 'in', 100),
(26, '2022-07-13 17:21:03', 'WSP002', 'in', 100),
(27, '2022-07-13 17:21:03', 'WSP005', 'in', 100),
(28, '2022-07-13 17:21:03', 'WSP003', 'in', 100),
(29, '2022-07-13 17:21:03', 'WSP004', 'in', 100),
(30, '2022-07-13 19:41:44', 'WSP001', 'out', 5),
(31, '2022-07-13 19:41:44', 'WSP005', 'out', 5),
(32, '2022-07-13 19:51:45', 'WSP001', 'out', 1),
(33, '2022-07-13 19:51:45', 'WSP004', 'out', 2),
(34, '2022-07-14 02:01:02', 'WSP006', 'in', 50),
(35, '2022-07-14 02:04:27', 'WSP001', 'out', 1),
(36, '2022-07-14 02:04:27', 'WSP005', 'out', 1),
(37, '2022-07-22 01:15:34', 'WSP001', 'out', 10),
(38, '2022-07-22 01:16:00', 'WSP005', 'out', 6),
(39, '2022-07-22 01:18:35', 'WSP001', 'out', 5),
(40, '2022-07-22 03:53:15', 'WSP001', 'out', 10),
(41, '2022-07-22 03:54:02', 'WSP005', 'out', 5),
(42, '2022-07-23 04:09:55', 'WSP001', 'out', 10),
(43, '2022-07-23 08:29:11', 'WSP003', 'out', 5),
(44, '2022-07-23 08:37:44', 'WSP003', 'out', 5),
(45, '2022-07-23 08:37:44', 'WSP001', 'out', 1),
(46, '2022-07-23 08:39:16', 'WSP001', 'out', 1),
(47, '2022-07-23 08:47:02', 'WSP003', 'out', 5),
(48, '2022-07-23 08:52:48', 'WSP003', 'out', 1),
(49, '2022-07-23 08:58:28', 'WSP002', 'out', 5),
(50, '2022-07-23 11:24:06', 'WSP001', 'out', 1);

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
(2, 'PMBS-250720220001', 'PTRNK_050', 500, 2850000, 10000, 10000, 0, 0, 2830000),
(3, 'PMBS-250720220002', 'PTRNK_051', 300, 1710000, 10000, 6000, 0, 0, 1694000),
(4, 'PMBS-250720220003', 'PTRNK_052', 200, 1140000, 10000, 4000, 0, 0, 1126000),
(5, 'PMBS-090820220001', 'PTRNK_053', 100, 570000, 10000, 2000, 0, 0, 558000),
(6, 'PMBS-090820220002', 'PTRNK_054', 102, 581400, 10000, 2040, 0, 0, 569360);

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
(29, 'PNY20220709001', 'IDA-026', 186833333),
(30, 'PNY20220724002', 'IDA-027', 112100000),
(31, 'PNY20220724003', 'IDA-028', 186833333),
(32, 'PNY20220710001', 'IDA-029', 186833333),
(33, 'PNY20220713002', 'IDA-030', 467083333),
(34, 'PNY20220713003', 'IDA-031', 186833333);

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
  `no_anggota` varchar(255) NOT NULL,
  `tmt` date NOT NULL DEFAULT '2022-07-01'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id`, `id_jabatan`, `id_ptkp`, `id_jenis_pegawai`, `pendidikan`, `rfid`, `nip`, `npwp`, `nama`, `alamat`, `no_telp`, `tempat_lahir`, `tgl_lahir`, `nama_bank`, `no_rek`, `status`, `status_kredit`, `created_at`, `riwayat_pendidikan`, `jurusan_pendidikan`, `agama`, `jenis_kelamin`, `no_anggota`, `tmt`) VALUES
(8, 'Staff', 'TK1', 'Kontrak', 'sma', '12345', '8003250622755', '111111', 'Heni', 'Bandung', '0898998989', 'Bandung', '1998-03-01', 'Mandiri', '11223321', '1', 0, '2021-12-04 11:17:34', 'sma', '', 'islam', 'L', 'ANGGT_0040', '2022-07-01'),
(9, 'Staff', 'TK0', 'Tetap', 's1', '1029384756', '8003250622756', '1029384756', 'Andi', 'Bandung', '1029384756', 'Bandung', '1991-03-03', 'BCA', '123123123', '1', 0, '2021-12-15 07:10:28', '', '', 'buddha', 'L', 'ANGGT_0041', '2022-07-01'),
(11, 'Staff', 'TK1', 'Kontrak', 's2', '323123', '8003250622757', '123142', 'ela', 'Bandung', '213213', 'Bandung', '2003-02-02', 'BCA', '232323232323', '1', 0, '2022-06-25 16:20:07', 'sma, s1, s2', 'rpl', 'kristen', 'P', 'ANGGT_0042', '2022-07-01'),
(12, 'Staff', 'TK1', 'Tetap', 's1', '123232323', '1608260622758', '12314222', 'robi', 'Bandung', '1231232333', 'Bandung', '2022-06-26', 'BCA', '333333333333333', '1', 0, '2022-06-26 01:59:31', '', 'it', 'hindu', 'L', 'ANGGT_0043', '2022-07-01'),
(13, 'Sr Programmer ', 'TK2', 'Tetap', 's1', '24123234', '9200270622759', '2424244', 'ramli', 'Bandung', '123124434', 'Bandung', '2000-02-02', 'BCA', '339391239', '1', 0, '2022-05-27 01:51:36', '', 'rpl', 'Islam', 'L', 'ANGGT_0044', '2022-07-01'),
(15, 'Staff', 'TK0', 'Kontrak', 's2', '111111', '1044020722760', '23424', 'Bagas', 'Bandung', '948928471', 'Bandung', '2000-02-20', 'BCA', '444444', '1', 0, '2022-07-01 17:14:40', 's1', 'rpl', 'Islam', 'L', 'ANGGT_0045', '2022-07-01'),
(16, 'Staff', 'TK0', 'Tetap', 's1', '24421424', '5016030722761', '1212313', 'rafli', 'Bandung', '920480948', 'Bandung', '1999-02-20', 'BCA', '3333333333333332', '1', 0, '2022-07-03 10:19:29', '', 'rpl', 'Kristen', 'P', 'ANGGT_0047', '2022-07-01'),
(17, 'Staff', 'TK0', 'Tetap', 's2', '3234235', '5325080722762', '2421525', 'Caka', 'Bandung', '241421521', 'Bandung', '2000-07-08', 'BCA', '24142142424', '1', 0, '2022-07-08 02:25:18', 's1', 'rpl', 'Islam', 'L', 'ANGGT_0048', '2022-07-01'),
(18, 'Sr Programmer ', 'TK2', 'Tetap', 's2', '52534', '9432110722763', '23123124241', 'Tarmizi', 'Bandung', '123123233323', 'Bandung', '1995-02-02', 'BRI', '2222221323', '1', 0, '2022-07-11 15:42:06', '', 'RPL', 'Islam', 'L', 'ANGGT_0061', '2022-07-01'),
(19, 'Kepala Bagian Waserda', 'TK0', 'Tetap', 's1', '0996022667', '9017140722764', '5718271901082772', 'sinta', 'jakarta', '098202838', 'jakarta', '1990-07-28', 'BCA', '208238230229', '1', 0, '2022-07-14 03:11:03', '', 'sitem informasi', 'Islam', 'P', 'ANGGT_0062', '2022-07-01'),
(20, 'Staff', 'TK0', 'Tetap', 's1', '12345', '3213210722765', '5678900000999', 'cika', 'pwr', '098654345', 'jkt', '1990-07-28', 'BCA', '4567890', '1', 0, '2022-07-20 20:08:00', '', 'si', 'Islam', 'P', 'ANGGT_0063', '2022-08-01'),
(21, 'Staff', 'TK0', 'Kontrak', 's1', '12345677', '4968210722766', '3302802929200292', 'sasa', 'jakarta', '0889972920029', 'jakarta', '1999-07-21', 'BCA', '0928279202', '1', 0, '2022-07-21 13:17:46', '', 'akutansi', 'Kristen', 'P', 'ANGGT_0064', '2022-08-07'),
(22, 'Staff', 'TK0', 'Tetap', 's1', '1234563', '5033220722767', '142262728928', 'sarah', 'jakarta', '08895669321', 'purworejo', '1999-07-22', 'BCA', '0937839939', '1', 0, '2022-07-22 03:51:45', '', 'sistem informasi akutansi', 'Islam', 'P', 'ANGGT_0065', '2022-08-01'),
(23, 'Kepala Bagian Personalia', 'TK0', 'Tetap', 's3', '1234567', '6558220722768', '33451617178191012', 'diana', 'jakarta', '08895669321', 'jakarta', '1999-07-27', 'BCA', '0092373993', '1', 0, '2022-07-22 06:18:09', 's2', 'akutansi', 'Kristen', 'P', 'ANGGT_0066', '2022-08-01');

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
  `sisa_hasil_usaha` int(50) DEFAULT NULL,
  `id_trans_total` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembagian_shu`
--

INSERT INTO `pembagian_shu` (`id`, `tanggal`, `id_trans`, `id_anggota`, `jasa_modal`, `jasa_anggota`, `sisa_hasil_usaha`, `id_trans_total`) VALUES
(13, '2022-08-09', 'PMBG.SHU20220001', 'PTRNK_053', 1641, 17786446, 17788087, 'PMBGSHU.TOTAL20220001'),
(14, '2022-08-09', 'PMBG.SHU20220002', 'PTRNK_054', 1642, 18142175, 18143817, 'PMBGSHU.TOTAL20220001');

-- --------------------------------------------------------

--
-- Table structure for table `pembagian_shu_total`
--

CREATE TABLE `pembagian_shu_total` (
  `id` int(11) NOT NULL,
  `id_trans` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `pembagian_shu_total`
--

INSERT INTO `pembagian_shu_total` (`id`, `id_trans`) VALUES
(0, 'PMBGSHU.TOTAL20220001');

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
('PMBS-090820220001', 558000, '2022-08-09', 1),
('PMBS-090820220002', 569360, '2022-08-09', 1);

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
('PMBAST20220713001', 'NOTA20220713001', '505000000', 'selesai', '2022-07-13'),
('PMBAST20220713002', 'NOTA20220713002', '202000000', 'selesai', '2022-07-13'),
('PMBAST20220714003', 'NOTA20220714003', '808000000', 'selesai', '2022-07-14');

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
(14, 'PMB_001', '2022-07-26', 570000, '1', 0),
(15, 'PMB_002', '2022-07-26', 581400, '1', 0);

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

--
-- Dumping data for table `pengajuan_bonus`
--

INSERT INTO `pengajuan_bonus` (`id`, `id_pengajuan`, `periode`, `nip`, `nominal`, `keterangan`, `status`) VALUES
(14, 'PENGAJUANBONUS220722001', '2022-07', 0, 0, '', 0);

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
(33, 'PNGBBN20220714001', '2022-07-14', 10000, 'selesai', 'pengeluaran_beban', NULL),
(34, 'PMBWASERDA140722001', '2022-07-14', 832500, 'selesai', 'Pembelian Barang Waserda', NULL),
(37, 'PNJWASERDA140722001', '2022-07-14', 22200, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(38, 'PNGBBN20220714001', '2022-07-14', 10000, 'selesai', 'pengeluaran_beban', NULL),
(39, 'PNJWASERDA140722002', '2022-07-14', 6660, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(40, 'PNGBBN20220714002', '2022-07-14', 10000, 'selesai', 'pengeluaran_beban', NULL),
(41, 'PMBWASERDA140722002', '2022-07-14', 777000, 'selesai', 'Pembelian Barang Waserda', NULL),
(42, 'PNJWASERDA140722003', '2022-07-14', 4440, 'selesai', 'Penjualan Barang Tunai Waserda', 'PNJWASERDA140722003.pdf'),
(43, 'GAJI-001', '2022-07-14', 140301750, 'selesai', 'penggajian', NULL),
(44, 'LMBR20220713001', '2022-07-14', 20000, 'selesai', 'pengajuan lembur', NULL),
(45, 'LMBR20220714002', '2022-07-14', 80000, 'selesai', 'pengajuan lembur', NULL),
(46, 'GAJI-002', '2022-07-21', 0, 'selesai', 'penggajian', NULL),
(47, 'GAJI-002', '2022-07-21', 0, 'selesai', 'penggajian', NULL),
(48, 'GAJI-001', '2022-07-21', 140386750, 'selesai', 'penggajian', NULL),
(49, 'GAJI-002', '2022-07-21', 0, 'selesai', 'penggajian', NULL),
(50, 'GAJI-002', '2022-07-22', 59112458, 'selesai', 'penggajian', NULL),
(51, 'PNJWASERDA220722004', '2022-07-22', 22200, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(52, 'PNJWASERDA220722005', '2022-07-22', 13320, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(53, 'PNJWASERDA220722006', '2022-07-22', 11100, 'selesai', 'Penjualan Barang Tunai Waserda', 'PNJWASERDA220722006.jpg'),
(54, 'PNJWASERDA220722007', '2022-07-22', 22200, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(55, 'PNJWASERDA220722008', '2022-07-22', 11100, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(56, 'GAJI-001', '2022-07-22', 214022833, 'selesai', 'penggajian', NULL),
(57, 'LMBR20220722004', '2022-07-22', 100000, 'selesai', 'pengajuan lembur', NULL),
(58, 'PNJWASERDA230722009', '2022-07-23', 22500, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(59, 'SHU20220001', '2022-07-23', 8836, 'selesai', 'SHU Ditahan', NULL),
(60, 'PNJWASERDA230722009', '2022-07-23', 11500, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(61, 'PNJWASERDA230722009', '2022-07-23', 13500, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(62, 'PNJWASERDA230722009', '2022-07-23', 2500, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(63, 'PNJWASERDA230722010', '2022-07-23', 11500, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(64, 'PNJWASERDA230722011', '2022-07-23', 2500, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(65, 'PNJWASERDA230722012', '2022-07-23', 11500, 'selesai', 'Penjualan Barang Kredit Waserda', NULL),
(66, 'PNJWASERDA230722013', '2022-07-23', 2500, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(67, 'DPPTRNK_053', '2022-07-26', 50000, 'selesai', 'simpanan pokok', NULL),
(68, 'DPPTRNK_054', '2022-08-09', 50000, 'selesai', 'simpanan pokok', NULL),
(69, 'SHU20220002', '2022-08-09', 11088, 'selesai', 'SHU Ditahan', NULL),
(70, 'PMBGSHU.TOTAL20220001', '2022-08-09', 35931904, 'selesai', 'SHU Tahun Berjalan', NULL);

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
('PNY20220710001', '2022-07-10', 'IDA-029', 'July 2022', 15166666, 15166666),
('PNY20220713002', '2022-07-13', 'IDA-030', 'July 2022', 37916666, 37916666),
('PNY20220713003', '2022-07-13', 'IDA-031', 'July 2022', 15166666, 15166666);

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
('PTRNK_001', 'Andi', '081297276888', 'Cimahi', NULL, 0, NULL, '', 1, 1, '2022-07-23 08:58:28', 'ANGGT_0001'),
('PTRNK_002', 'Joko', '0811301180', 'Bandung', NULL, 0, NULL, '', 1, 0, '2022-07-27 17:42:31', 'ANGGT_0002'),
('PTRNK_003', 'Budi', '082337317510', 'Bandung Barat', NULL, 0, NULL, '', 1, 0, '2022-07-28 02:34:47', 'ANGGT_0003'),
('PTRNK_004', 'Adi', '082293294071', 'Lembang', NULL, 0, NULL, '', 1, 0, '2022-07-27 19:22:26', 'ANGGT_0004'),
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
('PTRNK_043', 'Si C', '21412455125', 'awdawdawd', '50000', 0, 'TPS_004', 'awdawdsdawd', 0, 0, '2022-07-09 15:27:29', 'ANGGT_0051'),
('PTRNK_044', 'Jon A', '34235235', 'awdawdawd', '50000', 0, 'TPS_001', 'awdawdad', 0, 0, '2022-07-23 19:00:22', 'ANGGT_0052'),
('PTRNK_045', 'Jon B', '12412524', 'awdscxzc', '50000', 0, 'TPS_003', 'awdokosdkslacmxzc', 0, 0, '2022-07-23 19:00:37', 'ANGGT_0053'),
('PTRNK_046', 'Jon C', '123141241', 'czczscacsc', '50000', 0, 'TPS_004', 'qwdzscwqwd', 0, 0, '2022-07-23 19:00:54', 'ANGGT_0054'),
('PTRNK_047', 'Ari', '212121211', 'aaaaaaaaa', '50000', 0, 'TPS_001', 'adsdsdsd', 0, 0, '2022-07-10 13:43:51', 'ANGGT_0055'),
('PTRNK_048', 'Ani', '2222222222', 'aaaaaaaa', '50000', 0, 'TPS_003', 'aaaaaa', 0, 0, '2022-07-10 13:44:11', 'ANGGT_0056'),
('PTRNK_049', 'Ali', '2222222222', 'aaaaaaaaa', '50000', 0, 'TPS_004', 'aaaaa', 0, 0, '2022-07-10 13:44:25', 'ANGGT_0057'),
('PTRNK_050', 'Sarah', '11111111111', 'aaaaaa', '50000', 0, 'TPS_001', 'aaaa', 0, 0, '2022-07-11 15:04:34', 'ANGGT_0058'),
('PTRNK_051', 'Salma', '21212', 'aaaaaaaaa', '50000', 0, 'TPS_003', 'aaaaaaaaaa', 0, 0, '2022-07-11 15:05:06', 'ANGGT_0059'),
('PTRNK_052', 'Aura', '21231', 'aaaaaaaaa', '50000', 0, 'TPS_004', 'aaaaaaaa', 0, 0, '2022-07-11 15:05:29', 'ANGGT_0060'),
('PTRNK_053', 'TestPeternak', '09382098', 'nbcznbmcnb', '50000', 0, 'TPS_001', 'xnxnxxmcxmcznb', 0, 0, '2022-07-26 13:28:20', 'ANGGT_0067'),
('PTRNK_054', 'TestPeternakDua', '98759875', 'ncbvxcv', '50000', 0, 'TPS_001', 'mnv,cmn,mn', 0, 0, '2022-08-09 13:32:04', 'ANGGT_0068');

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
(17, 'PMBWASERDA140722001', 'WSS001', 'WSP001', 1500, 100, 'selesai', '2023-07-14'),
(18, 'PMBWASERDA140722001', 'WSS001', 'WSP002', 1500, 100, 'selesai', '2023-07-14'),
(19, 'PMBWASERDA140722001', 'WSS001', 'WSP005', 1500, 100, 'selesai', '2023-07-14'),
(20, 'PMBWASERDA140722001', 'WSS002', 'WSP003', 1500, 100, 'selesai', '2023-07-14'),
(21, 'PMBWASERDA140722001', 'WSS003', 'WSP004', 1500, 100, 'selesai', '2023-07-14'),
(22, 'PMBWASERDA140722002', 'WSS003', 'WSP006', 14000, 50, 'selesai', '2023-07-14');

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
(24, 'PNJWASERDA140722001', 'WSP001', '5', 2000, 'dalam proses'),
(25, 'PNJWASERDA140722001', 'WSP005', '5', 2000, 'dalam proses'),
(26, 'PNJWASERDA140722002', 'WSP004', '2', 2000, 'dalam proses'),
(27, 'PNJWASERDA140722002', 'WSP001', '1', 2000, 'dalam proses'),
(28, 'PNJWASERDA140722003', 'WSP001', '1', 2000, 'dalam proses'),
(29, 'PNJWASERDA140722003', 'WSP005', '1', 2000, 'dalam proses'),
(30, 'PNJWASERDA220722004', 'WSP001', '10', 2000, 'dalam proses'),
(31, 'PNJWASERDA220722005', 'WSP005', '6', 2000, 'dalam proses'),
(32, 'PNJWASERDA220722006', 'WSP001', '5', 2000, 'dalam proses'),
(33, 'PNJWASERDA220722007', 'WSP001', '10', 2000, 'dalam proses'),
(34, 'PNJWASERDA220722008', 'WSP005', '5', 2000, 'dalam proses'),
(41, 'PNJWASERDA230722009', 'WSP001', '1', 2000, 'dalam proses'),
(42, 'PNJWASERDA230722010', 'WSP003', '5', 2000, 'dalam proses'),
(43, 'PNJWASERDA230722011', 'WSP003', '1', 2000, 'dalam proses'),
(44, 'PNJWASERDA230722012', 'WSP002', '5', 2000, 'dalam proses'),
(45, 'PNJWASERDA230722013', 'WSP001', '1', 2000, 'dalam proses');

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
  `status` varchar(50) DEFAULT NULL,
  `id_ppn` int(11) NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pos_pembelian`
--

INSERT INTO `pos_pembelian` (`id`, `invoice`, `total`, `ppn`, `grandtotal`, `tanggal`, `status`, `id_ppn`) VALUES
(10, 'PMBWASERDA140722001', 750000, 82500, 832500, '2022-07-14', 'selesai', 2),
(11, 'PMBWASERDA140722002', 700000, 77000, 777000, '2022-07-14', 'selesai', 2);

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
  `status_kredit` varchar(50) DEFAULT NULL,
  `id_ppn` int(11) NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pos_penjualan`
--

INSERT INTO `pos_penjualan` (`id`, `invoice`, `total`, `status`, `tanggal`, `nama_pembeli`, `jenis_pembayaran`, `kembalian`, `pembayaran`, `ppn`, `total_trans`, `id_detail_jenis_anggota`, `date_payment`, `status_kredit`, `id_ppn`) VALUES
(13, 'PNJWASERDA140722001', 22200, 'terbayar', '2022-07-14', 'Andi', 'tunai', 7800, 30000, 2200, 20000, 1, '2022-07-13 19:29:10', NULL, 2),
(14, 'PNJWASERDA140722002', 6660, 'terbayar', '2022-07-14', 'Guest', '', 3340, 10000, 660, 6000, 2, '2022-07-13 19:50:44', NULL, 2),
(15, 'PNJWASERDA140722003', 4440, 'terbayar', '2022-07-14', 'Heni', 'tunai', 560, 5000, 440, 4000, 1, '2022-07-14 02:01:57', NULL, 2),
(16, 'PNJWASERDA220722004', 22200, 'terbayar', '2022-07-22', 'Rara', '', 300, 22500, 2200, 20000, 2, '2022-07-22 01:15:21', NULL, 2),
(17, 'PNJWASERDA220722005', 13320, 'terbayar', '2022-07-22', 'Sisil', '', 1680, 15000, 1320, 12000, 2, '2022-07-22 01:15:46', NULL, 2),
(18, 'PNJWASERDA220722006', 11100, 'terbayar', '2022-07-22', 'rara', '', 3900, 15000, 1100, 10000, 2, '2022-07-22 01:18:25', NULL, 2),
(19, 'PNJWASERDA220722007', 22200, 'terbayar', '2022-07-22', 'rara', '', 2800, 25000, 2200, 20000, 2, '2022-07-22 03:53:00', NULL, 2),
(20, 'PNJWASERDA220722008', 11100, 'terbayar', '2022-07-22', 'mimin', '', 900, 12000, 1100, 10000, 2, '2022-07-22 03:53:48', NULL, 2),
(22, 'PNJWASERDA230722009', 2500, 'terbayar', '2022-07-23', 'Guest', '', 0, 2500, 200, 2000, 2, '2022-07-23 08:39:08', NULL, 1),
(23, 'PNJWASERDA230722010', 11500, 'terbayar', '2022-07-23', 'Guest', '', 3500, 15000, 1100, 10000, 2, '2022-07-23 08:46:29', NULL, 2),
(24, 'PNJWASERDA230722011', 2500, 'terbayar', '2022-07-23', 'Guest', '', 500, 3000, 220, 2000, 2, '2022-07-23 08:52:28', NULL, 2),
(25, 'PNJWASERDA230722012', 11500, 'kredit', '2022-07-23', 'Andi', 'kredit', 0, 11500, 1100, 10000, 1, '2022-07-23 08:56:52', NULL, 2),
(26, 'PNJWASERDA230722013', 2500, 'terbayar', '2022-07-23', 'Guest', '', 500, 3000, 200, 2000, 2, '2022-07-23 11:23:59', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ppn`
--

CREATE TABLE `ppn` (
  `id` int(11) NOT NULL,
  `persen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `ppn`
--

INSERT INTO `ppn` (`id`, `persen`) VALUES
(1, 10),
(2, 11),
(3, 12),
(4, 13),
(5, 14),
(6, 15);

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
('PR_002', 'Susu Murni', 5000, '9802', 'liter', 0),
('PR_003', 'Pasteur Coklat', 3000, '177756.8', 'liter', 0),
('PR_004', 'Pasteur Vanila', 100, '10374', 'liter', 0),
('PR_005', 'Pasteur Strawberry', 100, '10374', 'liter', 0),
('PR_006', 'Yoghurt Strawberry', 1300, '10228.4', 'liter', 0),
('PR_007', 'Yoghurt Anggur', 100, '10228.4', 'liter', 0),
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
(2, 'Sore', '13:04:00', '23:00:00');

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
(7, 'CUTI20220713001', '2022-07-12 22:07:22', '8003250622757', 8, '2022-07-13', '2022-07-21', 'tes', 1),
(8, 'CUTI20220713002', '2022-07-12 22:23:50', '8003250622757', 4, '2022-07-13', '2022-07-18', 'aa', 1),
(9, 'CUTI20220714003', '2022-07-14 03:27:48', '8003250622756', 2, '2022-07-29', '2022-08-01', 'liburan', 1),
(10, 'CUTI20220721004', '2022-07-20 20:12:36', '3213210722765', 10, '2022-07-21', '2022-08-01', 'pergi', 1),
(11, 'CUTI20220722005', '2022-07-21 18:52:56', '8003250622756', 3, '2022-07-27', '2022-07-29', 'cuti  \r\n', 1),
(12, 'CUTI20220722006', '2022-07-22 06:24:20', '8003250622756', 2, '2022-07-29', '2022-07-30', 'pergi ', 1);

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
(5, 'CUTIMLHRKN20220721005', '2022-07-20 20:13:16', '3213210722765', 90, '2022-07-21', '2022-10-19', 'ket', 1),
(6, 'CUTIMLHRKN20220721005', '2022-07-20 20:17:20', '8003250622757', 90, '2022-07-21', '2022-10-19', '', 1);

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

--
-- Dumping data for table `tb_detail_pengajuan_bonus`
--

INSERT INTO `tb_detail_pengajuan_bonus` (`id`, `id_pengajuan`, `nip`, `nominal`, `keterangan`, `tanggal`) VALUES
(30, 'PENGAJUANBONUS220722001', '8003250622755', 4000000, 'bonus target', '2022-07-22'),
(31, 'PENGAJUANBONUS220722001', '8003250622756', 4000000, 'bonus target', '2022-07-22'),
(32, 'PENGAJUANBONUS220722001', '8003250622757', 4000000, 'bonus target', '2022-07-22'),
(33, 'PENGAJUANBONUS220722001', '1608260622758', 4000000, 'bonus target', '2022-07-22'),
(34, 'PENGAJUANBONUS220722001', '9200270622759', 4000000, 'bonus target', '2022-07-22');

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
  `pph21` int(11) NOT NULL,
  `unik` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_detail_penggajian`
--

INSERT INTO `tb_detail_penggajian` (`id`, `id_penggajian`, `gaji_pokok`, `tunjangan_jabatan`, `tunjangan_kesehatan`, `tunjangan_hari_raya`, `bonus_kerja`, `ptkp`, `tot_penghasilan`, `tot_pengurang`, `total`, `pph21`, `unik`) VALUES
(177, 'GAJI-001', 20000000, 300000, 300000, 20600000, 700000, 54000000, 21400000, 54000000, 39699167, 2300833, 'bba982420626bc0cc2b90e2080f03ef3'),
(178, 'GAJI-001', 6000000, 300000, 300000, 6600000, 800000, 58500000, 7400000, 58500000, 13866125, 133875, '921a2425a2e7ed0538931f67a548dc68'),
(179, 'GAJI-001', 3000000, 300000, 300000, 3600000, 500000, 58500000, 4100000, 58500000, 7700000, 0, '8137f2005eb5bc44778c93fe864f5e09'),
(180, 'GAJI-001', 20000000, 150000, 300000, 20450000, 900000, 63000000, 21350000, 63000000, 39621042, 2178958, '03566ae060d918cc59b12bd6ebfd42a0'),
(181, 'GAJI-001', 20000000, 300000, 300000, 20600000, 500000, 58500000, 21100000, 58500000, 39500417, 2199583, '2f6a876e716e159b8bb6b3fb6af64f75'),
(182, 'GAJI-002', 6000000, 300000, 300000, 0, 0, 54000000, 6600000, 54000000, 6511500, 88500, '5002e67c8cd5a13345776bc81e1a4830'),
(183, 'GAJI-002', 7000000, 300000, 300000, 0, 0, 54000000, 7600000, 54000000, 7464000, 136000, '4e285cfb34dad3d1dac2880f71398a49'),
(184, 'GAJI-002', 20000000, 300000, 300000, 0, 0, 54000000, 20600000, 54000000, 18676667, 1923333, '4c9f6391687cecc4775cc1cb9c185805'),
(185, 'GAJI-002', 20000000, 800000, 300000, 0, 0, 54000000, 21100000, 54000000, 19101667, 1998333, '875d4e02625bc732c75d89390c65b783'),
(186, 'GAJI-002', 7000000, 150000, 300000, 0, 0, 63000000, 7450000, 63000000, 7358625, 91375, 'f26e6e61a2bad55b5b52db8d3feeec42'),
(187, 'GAJI-001', 20000000, 300000, 300000, 20600000, 4000000, 54000000, 24600000, 54000000, 42370833, 2829167, 'f3d1c92abc9793f5e4a28bbde2aff970'),
(188, 'GAJI-001', 6000000, 300000, 300000, 0, 0, 54000000, 6600000, 54000000, 6511500, 88500, 'ad7794ce6872f79c14042ed0d8994e15'),
(189, 'GAJI-001', 7000000, 300000, 300000, 0, 0, 54000000, 7600000, 54000000, 7464000, 136000, '291b88c6bdc1b26426cb64608ef1001a'),
(190, 'GAJI-001', 6000000, 300000, 300000, 6600000, 4000000, 58500000, 10600000, 58500000, 16750417, 449583, 'a2a99960064610b42c2df329753ae519'),
(191, 'GAJI-001', 3000000, 300000, 300000, 3600000, 4000000, 58500000, 7600000, 58500000, 11068500, 131500, '4acf5b995a4a8a976e7c67305fc4e66c'),
(192, 'GAJI-001', 20000000, 300000, 300000, 0, 0, 54000000, 20600000, 54000000, 18676667, 1923333, '88130560841d22030c56540a6e5c465e'),
(193, 'GAJI-001', 20000000, 150000, 300000, 20450000, 4000000, 63000000, 24450000, 63000000, 42256042, 2643958, 'fff6a53815b9d9fd7d6a7ec0e0a5b223'),
(194, 'GAJI-001', 20000000, 300000, 300000, 20600000, 4000000, 58500000, 24600000, 58500000, 42464583, 2735417, '1b9ada87da5fdef38e8a8fb5dc258af2'),
(195, 'GAJI-001', 20000000, 800000, 300000, 0, 0, 54000000, 21100000, 54000000, 19101667, 1998333, '96bb990f3f6941f10bd8f4b008aba9dc'),
(196, 'GAJI-001', 7000000, 150000, 300000, 0, 0, 63000000, 7450000, 63000000, 7358625, 91375, 'fb9c184a512e69033f808b64f5021233');

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
(2, 'Sr Programmer ', 150000, 300000),
(3, 'Kepala Bagian Waserda', 800000, 300000),
(4, 'Kepala Bagian Personalia', 900000, 300000);

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
(5, 'Tetap', 's2', 7000000),
(6, 'Tetap', 's3', 10000000),
(7, 'tetap', 'sma', 2500000);

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
(12, 'LMBR20220713001', '2022-07-13', '8003250622756', 1, 3, 20000, 20000),
(13, 'LMBR20220714002', '2022-07-14', '8003250622756', 4, 3, 20000, 80000),
(14, 'LMBR20220721003', '2022-07-21', '3213210722765', 5, 3, 20000, 100000),
(15, 'LMBR20220722004', '2022-07-22', '8003250622756', 5, 3, 20000, 100000);

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
  `status` varchar(50) DEFAULT NULL,
  `unik` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_penggajian`
--

INSERT INTO `tb_penggajian` (`id`, `id_penggajian`, `tanggal`, `nm_pegawai`, `nominal`, `status`, `unik`) VALUES
(189, 'GAJI-001', '2022-07-22', 'Andi', 42370833, NULL, 'f3d1c92abc9793f5e4a28bbde2aff970'),
(190, 'GAJI-001', '2022-07-22', 'Bagas', 6511500, NULL, 'ad7794ce6872f79c14042ed0d8994e15'),
(191, 'GAJI-001', '2022-07-22', 'Caka', 7464000, NULL, '291b88c6bdc1b26426cb64608ef1001a'),
(192, 'GAJI-001', '2022-07-22', 'ela', 16750417, NULL, 'a2a99960064610b42c2df329753ae519'),
(193, 'GAJI-001', '2022-07-22', 'Heni', 11068500, NULL, '4acf5b995a4a8a976e7c67305fc4e66c'),
(194, 'GAJI-001', '2022-07-22', 'rafli', 18676667, NULL, '88130560841d22030c56540a6e5c465e'),
(195, 'GAJI-001', '2022-07-22', 'ramli', 42256042, NULL, 'fff6a53815b9d9fd7d6a7ec0e0a5b223'),
(196, 'GAJI-001', '2022-07-22', 'robi', 42464583, NULL, '1b9ada87da5fdef38e8a8fb5dc258af2'),
(197, 'GAJI-001', '2022-07-22', 'sinta', 19101667, NULL, '96bb990f3f6941f10bd8f4b008aba9dc'),
(198, 'GAJI-001', '2022-07-22', 'Tarmizi', 7358625, NULL, 'fb9c184a512e69033f808b64f5021233');

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
(3, 'TK2', 63000000),
(4, 'TK3', 67500000),
(5, 'k1', 63000000);

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
  `tahunselanjutnya` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi_shu`
--

INSERT INTO `transaksi_shu` (`id`, `kode_shu`, `tanggal`, `nominal`, `tahunselanjutnya`, `status`) VALUES
(6, 'SHU20220001', '2022-07-23', 16409, 8836, 2),
(7, 'SHU20220002', '2022-08-09', 20592, 11088, 2);

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
(9, 'PNY20220709001', '2022-07-09 15:19:50', 15166666, 15166666, 186833333, 0, 0, 0, 'IDA-026'),
(10, 'PNY20220724002', '2022-07-23 18:39:04', 9100000, 9100000, 112100000, 0, 0, 0, 'IDA-027'),
(11, 'PNY20220724003', '2022-07-23 18:59:10', 15166666, 15166666, 186833333, 0, 0, 0, 'IDA-028'),
(12, 'PNY20220710001', '2022-07-10 13:39:00', 15166666, 15166666, 186833333, 0, 0, 0, 'IDA-029'),
(13, 'PNY20220713002', '2022-07-13 03:02:14', 37916666, 37916666, 467083333, 0, 0, 0, 'IDA-030'),
(14, 'PNY20220713003', '2022-07-13 12:41:33', 15166666, 15166666, 186833333, 0, 0, 0, 'IDA-031');

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
(58, '8003250622756', 'Andi', 20600000, '2022-07-01'),
(59, '8003250622757', 'ela', 6600000, '2022-07-01'),
(60, '8003250622755', 'Heni', 3600000, '2022-07-01'),
(61, '9200270622759', 'ramli', 20450000, '2022-07-01'),
(62, '1608260622758', 'robi', 20600000, '2022-07-01');

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
(3, 'Andi', 'Andi', '123123', 'pegawai', '8003250622756'),
(4, 'Heni', 'heni', '123123', 'pegawai', '8003250622755'),
(5, 'test data', 'data1', '123123', 'pegawai', '1495301221757'),
(6, 'Kasir Waserda', 'kasir_waserda', '123', 'kasir_waserda', NULL),
(7, 'Salma', 'bagiankeuangan', '123', 'keuangan', NULL),
(8, 'Salmaa', 'pemilik', '123', 'pemilik', NULL),
(9, 'Admin', 'admin', '123', 'admin2', NULL),
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
(24, 'Caka', 'tesuserr', '123', 'pegawai', '5325080722762'),
(25, 'Tarmizi', 'Tarmizi', '123', 'pegawai', '9432110722763'),
(27, 'sinta', 'sinta', '123', 'pegawai', '9017140722764'),
(28, 'personalia', 'personalia', '123', 'personalia', '4142323241'),
(29, 'it', 'it', '123', 'it', '3242433311'),
(30, 'cika', 'cika', '1234567', 'pegawai', '3213210722765'),
(31, 'sasa', 'salsa', 'salsa', 'pegawai', '4968210722766'),
(32, 'sarah', 'sarah', '123', 'pegawai', '5033220722767'),
(33, 'diana', 'diana', '123', 'pegawai', '6558220722768'),
(34, 'Keuangan Waserda', 'keuanganwaserda', '123', 'keuangan_waserda', '288328372'),
(35, 'Penjualan Waserda', 'penjualanwaserda', '123', 'penjualan_waserda', '222323233'),
(36, 'Persediaan Waserda', 'persediaanwaserda', '123', 'persediaan_waserda', '9939332333'),
(37, 'Pembelian Waserda', 'pembelianwaserda', '123', 'pembelian_waserda', '99393334433'),
(38, 'pengelola', 'pengelola', '123', 'pengelola', '377474831'),
(39, 'bendahara', 'bendahara', '123', 'bendahara', '347482131'),
(40, 'anggota', 'anggota', '123', 'anggota', '88877676'),
(41, 'Andi', 'Andi', '123', 'anggota', NULL),
(42, 'Joko', 'Joko', '123', 'anggota', NULL),
(43, 'Budi', 'Budi', '123', 'anggota', NULL),
(44, 'Adi', 'Adi', '123', 'anggota', NULL),
(45, 'Indra', 'Indra', '123', 'anggota', NULL),
(46, 'Asep', 'Asep', '123', 'anggota', NULL),
(47, 'Andre', 'Andre', '123', 'anggota', NULL),
(48, 'Azis', 'Azis', '123', 'anggota', NULL),
(49, 'Arif', 'Arif', '123', 'anggota', NULL),
(50, 'Ibrahim', 'Ibrahim', '123', 'anggota', NULL),
(51, 'Agung', 'Agung', '123', 'anggota', NULL),
(52, 'Adit', 'Adit', '123', 'anggota', NULL),
(53, 'Gatot', 'Gatot', '123', 'anggota', NULL),
(54, 'Taufiq', 'Taufiq', '123', 'anggota', NULL),
(55, 'Iwan', 'Iwan', '123', 'anggota', NULL),
(56, 'dede', 'dede', '123', 'anggota', NULL),
(57, 'Dina', 'Dina', '123', 'anggota', NULL),
(58, 'Hanni', 'Hanni', '123', 'anggota', NULL),
(59, 'Andri', 'Andri', '123', 'anggota', NULL),
(60, 'Rari', 'Rari', '123', 'anggota', NULL),
(61, 'Desi', 'Desi', '123', 'anggota', NULL),
(62, 'Dono', 'Dono', '123', 'anggota', NULL),
(63, 'Galih', 'Galih', '123', 'anggota', NULL),
(64, 'Jonas', 'Jonas', '123', 'anggota', NULL),
(65, 'Yona', 'Yona', '123', 'anggota', NULL),
(66, 'Tina', 'Tina', '123', 'anggota', NULL),
(67, 'Ucup', 'Ucup', '123', 'anggota', NULL),
(68, 'Dafa', 'Dafa', '123', 'anggota', NULL),
(69, 'Sinta', 'Sinta', '123', 'anggota', NULL),
(70, 'Yuvita', 'Yuvita', '123', 'anggota', NULL),
(71, 'Hanifah ', 'Hanifah ', '123', 'anggota', NULL),
(72, 'Rizky', 'Rizky', '123', 'anggota', NULL),
(73, 'Galang', 'Galang', '123', 'anggota', NULL),
(74, 'Rozak', 'Rozak', '123', 'anggota', NULL),
(75, 'Budi', 'Budi', '123', 'anggota', NULL),
(76, 'Galih', 'Galih', '123', 'anggota', NULL),
(77, 'ani', 'ani', '123', 'anggota', NULL),
(78, 'Taufik', 'Taufik', '123', 'anggota', NULL),
(79, 'Denis', 'Denis', '123', 'anggota', NULL),
(80, 'Adu', 'Adu', '123', 'anggota', NULL),
(81, 'Si A', 'Si A', '123', 'anggota', NULL),
(82, 'Si B', 'Si B', '123', 'anggota', NULL),
(83, 'Si C', 'Si C', '123', 'anggota', NULL),
(84, 'Jon A', 'Jon A', '123', 'anggota', NULL),
(85, 'Jon B', 'Jon B', '123', 'anggota', NULL),
(86, 'Jon C', 'Jon C', '123', 'anggota', NULL),
(87, 'Ari', 'Ari', '123', 'anggota', NULL),
(88, 'Ani', 'Ani', '123', 'anggota', NULL),
(89, 'Ali', 'Ali', '123', 'anggota', NULL),
(90, 'Sarah', 'Sarah', '123', 'anggota', NULL),
(91, 'Salma', 'Salma', '123', 'anggota', NULL),
(92, 'Aura', 'Aura', '123', 'anggota', NULL),
(104, 'TestPeternak', 'TestPeternak', '123', 'anggota', NULL),
(105, 'TestPeternakDua', 'TestPeternakDua', '123', 'anggota', NULL),
(106, 'Dila', 'perpajakan', '123', 'perpajakan', '3222223'),
(107, 'Yolanda', 'pemilik1', '123', 'pemilik1', '33323232323232');

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
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '50', '14000', '700000', '1', '2000', '2000', '8', '2500', '20000'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '50', '14000', '700000', '1', '2000', '2000', '7', '2500', '17500'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '50', '14000', '700000', '1', '2000', '2000', '6', '2500', '15000'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PMBWASERDA220622023', 'WSP002', '2022-06-21 17:06:11', NULL, '50', '14000', '700000', '1', '2000', '2000', '10', '1500', '15000'),
(0, 'PMBWASERDA220622023', 'WSP002', '2022-06-21 17:06:11', NULL, '50', '14000', '700000', '1', '2000', '2000', '1', '1500', '1500'),
(0, 'PMBWASERDA220622023', 'WSP002', '2022-06-21 17:06:11', NULL, '50', '14000', '700000', '1', '2000', '2000', '1', '1500', '1500'),
(0, 'PMBWASERDA220622023', 'WSP002', '2022-06-21 17:06:11', NULL, '50', '14000', '700000', '1', '2000', '2000', '15', '1500', '22500'),
(0, 'PNJWASERDA220622045', 'WSP002', '2022-06-21 17:07:53', '', '50', '14000', '700000', '1', '2000', '2000', '7', '2000', '14000'),
(0, 'PNJWASERDA220622045', 'WSP002', '2022-06-21 17:07:53', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2000', '2000'),
(0, 'PNJWASERDA220622045', 'WSP002', '2022-06-21 17:07:53', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2000', '2000'),
(0, 'PNJWASERDA220622045', 'WSP002', '2022-06-21 17:07:53', '', '50', '14000', '700000', '1', '2000', '2000', '15', '2000', '30000'),
(0, 'PNJWASERDA220622046', 'WSP002', '2022-06-21 17:08:12', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2000', '10000'),
(0, 'PNJWASERDA220622046', 'WSP002', '2022-06-21 17:08:12', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2000', '2000'),
(0, 'PNJWASERDA220622046', 'WSP002', '2022-06-21 17:08:12', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2000', '2000'),
(0, 'PNJWASERDA220622046', 'WSP002', '2022-06-21 17:08:12', '', '50', '14000', '700000', '1', '2000', '2000', '15', '2000', '30000'),
(0, 'PMBWASERDA220622024', 'WSP002', '2022-06-21 17:12:36', NULL, '50', '14000', '700000', '1', '2000', '2000', '5', '1500', '7500'),
(0, 'PMBWASERDA220622024', 'WSP002', '2022-06-21 17:12:36', NULL, '50', '14000', '700000', '1', '2000', '2000', '1', '1500', '1500'),
(0, 'PMBWASERDA220622024', 'WSP002', '2022-06-21 17:12:36', NULL, '50', '14000', '700000', '1', '2000', '2000', '1', '1500', '1500'),
(0, 'PMBWASERDA220622024', 'WSP002', '2022-06-21 17:12:36', NULL, '50', '14000', '700000', '1', '2000', '2000', '15', '1500', '22500'),
(0, 'PMBWASERDA220622024', 'WSP002', '2022-06-21 17:12:36', NULL, '50', '14000', '700000', '1', '2000', '2000', '10', '1500', '15000'),
(0, 'PNJWASERDA220622047', 'WSP002', '2022-06-21 17:24:30', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA220622047', 'WSP002', '2022-06-21 17:24:30', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA220622047', 'WSP002', '2022-06-21 17:24:30', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA220622047', 'WSP002', '2022-06-21 17:24:30', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2000', '20000'),
(0, 'PNJWASERDA220622047', 'WSP002', '2022-06-21 17:24:30', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2000', '20000'),
(0, 'PNJWASERDA220622048', 'WSP002', '2022-06-21 17:49:04', '', '50', '14000', '700000', '1', '2000', '2000', '9', '2000', '18000'),
(0, 'PNJWASERDA220622048', 'WSP002', '2022-06-21 17:49:04', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2000', '20000'),
(0, 'PNJWASERDA220622049', 'WSP001', '2022-06-22 15:21:48', '', '50', '14000', '700000', '1', '2000', '2000', '4', '2500', '10000'),
(0, 'PNJWASERDA220622049', 'WSP001', '2022-06-22 15:21:48', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA220622049', 'WSP001', '2022-06-22 15:21:48', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA220622049', 'WSP001', '2022-06-22 15:21:48', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA220622049', 'WSP001', '2022-06-22 15:21:48', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA220622049', 'WSP001', '2022-06-22 15:21:48', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA220622049', 'WSP001', '2022-06-22 15:21:48', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA220622049', 'WSP001', '2022-06-22 15:21:48', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA220622049', 'WSP001', '2022-06-22 15:21:48', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA220622049', 'WSP001', '2022-06-22 15:21:48', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA220622049', 'WSP001', '2022-06-22 15:21:48', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA220622049', 'WSP001', '2022-06-22 15:21:48', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA220622049', 'WSP001', '2022-06-22 15:21:48', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA220622049', 'WSP001', '2022-06-22 15:21:48', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA220622050', 'WSP001', '2022-06-22 15:28:10', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA220622050', 'WSP001', '2022-06-22 15:28:10', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA220622050', 'WSP001', '2022-06-22 15:28:10', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA220622050', 'WSP001', '2022-06-22 15:28:10', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA220622050', 'WSP001', '2022-06-22 15:28:10', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA220622050', 'WSP001', '2022-06-22 15:28:10', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA220622050', 'WSP001', '2022-06-22 15:28:10', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA220622050', 'WSP001', '2022-06-22 15:28:10', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA220622050', 'WSP001', '2022-06-22 15:28:10', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA220622050', 'WSP001', '2022-06-22 15:28:10', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA220622050', 'WSP001', '2022-06-22 15:28:10', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA220622050', 'WSP001', '2022-06-22 15:28:10', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA220622050', 'WSP001', '2022-06-22 15:28:10', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA220622050', 'WSP001', '2022-06-22 15:28:10', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA230622051', 'WSP001', '2022-06-22 22:40:34', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA230622051', 'WSP001', '2022-06-22 22:40:34', '', '50', '14000', '700000', '1', '2000', '2000', '9', '2500', '22500'),
(0, 'PNJWASERDA230622051', 'WSP001', '2022-06-22 22:40:34', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA230622051', 'WSP001', '2022-06-22 22:40:34', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA230622051', 'WSP001', '2022-06-22 22:40:34', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA230622051', 'WSP001', '2022-06-22 22:40:34', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA230622051', 'WSP001', '2022-06-22 22:40:34', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA230622051', 'WSP001', '2022-06-22 22:40:34', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA230622051', 'WSP001', '2022-06-22 22:40:34', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA230622051', 'WSP001', '2022-06-22 22:40:34', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA230622051', 'WSP001', '2022-06-22 22:40:34', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA230622051', 'WSP001', '2022-06-22 22:40:34', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA230622051', 'WSP001', '2022-06-22 22:40:34', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA230622051', 'WSP001', '2022-06-22 22:40:34', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA230622052', 'WSP001', '2022-06-22 22:50:00', '', '50', '14000', '700000', '1', '2000', '2000', '8', '2500', '20000'),
(0, 'PNJWASERDA230622052', 'WSP001', '2022-06-22 22:50:00', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA230622052', 'WSP001', '2022-06-22 22:50:00', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA230622052', 'WSP001', '2022-06-22 22:50:00', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA230622052', 'WSP001', '2022-06-22 22:50:00', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA230622052', 'WSP001', '2022-06-22 22:50:00', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA230622052', 'WSP001', '2022-06-22 22:50:00', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA230622052', 'WSP001', '2022-06-22 22:50:00', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA230622052', 'WSP001', '2022-06-22 22:50:00', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA230622052', 'WSP001', '2022-06-22 22:50:00', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA230622052', 'WSP001', '2022-06-22 22:50:00', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA230622052', 'WSP001', '2022-06-22 22:50:00', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA230622052', 'WSP001', '2022-06-22 22:50:00', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA230622053', 'WSP001', '2022-06-23 12:45:03', '', '50', '14000', '700000', '1', '2000', '2000', '7', '2500', '17500'),
(0, 'PNJWASERDA230622053', 'WSP001', '2022-06-23 12:45:03', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA230622053', 'WSP001', '2022-06-23 12:45:03', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA230622053', 'WSP001', '2022-06-23 12:45:03', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA230622053', 'WSP001', '2022-06-23 12:45:03', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA230622053', 'WSP001', '2022-06-23 12:45:03', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA230622053', 'WSP001', '2022-06-23 12:45:03', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA230622053', 'WSP001', '2022-06-23 12:45:03', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA230622053', 'WSP001', '2022-06-23 12:45:03', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA230622053', 'WSP001', '2022-06-23 12:45:03', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA230622053', 'WSP001', '2022-06-23 12:45:03', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA230622053', 'WSP001', '2022-06-23 12:45:03', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA230622053', 'WSP001', '2022-06-23 12:45:03', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:08:03', '', '50', '14000', '700000', '1', '2000', '2000', '6', '2500', '15000'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:08:03', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:08:03', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:08:03', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:08:03', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:08:03', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:08:03', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:08:03', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:08:03', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:08:03', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:08:03', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:08:03', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:08:03', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:09:00', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:09:00', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:09:00', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:09:00', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:09:00', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:09:00', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:09:00', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:09:00', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:09:00', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:09:00', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:09:00', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:09:00', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:09:00', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:10:50', '', '50', '14000', '700000', '1', '2000', '2000', '4', '2500', '10000'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:10:50', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:10:50', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:10:50', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:10:50', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:10:50', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:10:50', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:10:50', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:10:50', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:10:50', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:10:50', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:10:50', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:10:50', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:19:28', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:19:28', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:19:28', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:19:28', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:19:28', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:19:28', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:19:28', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:19:28', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:19:28', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:19:28', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:19:28', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:19:28', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA260622054', 'WSP001', '2022-06-26 00:19:28', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PMBWASERDA270622025', 'WSP002', '2022-06-26 20:08:51', NULL, '50', '14000', '700000', '1', '2000', '2000', '9', '1500', '13500'),
(0, 'PMBWASERDA270622025', 'WSP002', '2022-06-26 20:08:51', NULL, '50', '14000', '700000', '1', '2000', '2000', '10', '1500', '15000'),
(0, 'PMBWASERDA270622025', 'WSP002', '2022-06-26 20:08:51', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1500', '150000'),
(0, 'PMBWASERDA270622026', 'WSP001', '2022-06-26 21:04:43', NULL, '50', '14000', '700000', '1', '2000', '2000', '3', '1750', '5250'),
(0, 'PMBWASERDA270622026', 'WSP001', '2022-06-26 21:04:43', NULL, '50', '14000', '700000', '1', '2000', '2000', '10', '1750', '17500'),
(0, 'PMBWASERDA270622026', 'WSP001', '2022-06-26 21:04:43', NULL, '50', '14000', '700000', '1', '2000', '2000', '2', '1750', '3500'),
(0, 'PMBWASERDA270622026', 'WSP001', '2022-06-26 21:04:43', NULL, '50', '14000', '700000', '1', '2000', '2000', '1', '1750', '1750'),
(0, 'PMBWASERDA270622026', 'WSP001', '2022-06-26 21:04:43', NULL, '50', '14000', '700000', '1', '2000', '2000', '3', '1750', '5250'),
(0, 'PMBWASERDA270622026', 'WSP001', '2022-06-26 21:04:43', NULL, '50', '14000', '700000', '1', '2000', '2000', '5', '1750', '8750'),
(0, 'PMBWASERDA270622026', 'WSP001', '2022-06-26 21:04:43', NULL, '50', '14000', '700000', '1', '2000', '2000', '3', '1750', '5250'),
(0, 'PMBWASERDA270622026', 'WSP001', '2022-06-26 21:04:43', NULL, '50', '14000', '700000', '1', '2000', '2000', '1', '1750', '1750'),
(0, 'PMBWASERDA270622026', 'WSP001', '2022-06-26 21:04:43', NULL, '50', '14000', '700000', '1', '2000', '2000', '10', '1750', '17500'),
(0, 'PMBWASERDA270622026', 'WSP001', '2022-06-26 21:04:43', NULL, '50', '14000', '700000', '1', '2000', '2000', '5', '1750', '8750'),
(0, 'PMBWASERDA270622026', 'WSP001', '2022-06-26 21:04:43', NULL, '50', '14000', '700000', '1', '2000', '2000', '2', '1750', '3500'),
(0, 'PMBWASERDA270622026', 'WSP001', '2022-06-26 21:04:43', NULL, '50', '14000', '700000', '1', '2000', '2000', '3', '1750', '5250'),
(0, 'PMBWASERDA270622026', 'WSP001', '2022-06-26 21:04:43', NULL, '50', '14000', '700000', '1', '2000', '2000', '1', '1750', '1750'),
(0, 'PMBWASERDA270622026', 'WSP001', '2022-06-26 21:04:43', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1750', '175000'),
(0, 'PNJWASERDA270622054', 'WSP001', '2022-06-26 21:05:23', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA270622054', 'WSP001', '2022-06-26 21:05:23', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA270622054', 'WSP001', '2022-06-26 21:05:23', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA270622054', 'WSP001', '2022-06-26 21:05:23', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA270622054', 'WSP001', '2022-06-26 21:05:23', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA270622054', 'WSP001', '2022-06-26 21:05:23', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA270622054', 'WSP001', '2022-06-26 21:05:23', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA270622054', 'WSP001', '2022-06-26 21:05:23', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA270622054', 'WSP001', '2022-06-26 21:05:23', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA270622054', 'WSP001', '2022-06-26 21:05:23', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA270622054', 'WSP001', '2022-06-26 21:05:23', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA270622054', 'WSP001', '2022-06-26 21:05:23', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA270622054', 'WSP001', '2022-06-26 21:05:23', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA270622054', 'WSP001', '2022-06-26 21:05:23', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2500', '250000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:12:25', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:12:25', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:12:25', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:12:25', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:12:25', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:12:25', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:12:25', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:12:25', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:12:25', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:12:25', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:12:25', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:12:25', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:12:25', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2500', '250000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:00', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:00', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:00', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:00', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:00', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:00', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:00', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:00', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:00', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:00', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:00', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:00', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:00', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2500', '250000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:40', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:40', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:40', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:40', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:40', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:40', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:40', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:40', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:40', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:40', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:40', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:40', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:14:40', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2500', '250000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:18:52', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:18:52', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:18:52', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:18:52', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:18:52', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:18:52', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:18:52', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:18:52', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:18:52', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:18:52', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:18:52', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:18:52', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:18:52', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2500', '250000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:19:38', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:19:38', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:19:38', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:19:38', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:19:38', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:19:38', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:19:38', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:19:39', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:19:39', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:19:39', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:19:39', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:19:39', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:19:39', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2500', '250000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:20:19', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:20:19', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:20:19', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:20:19', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:20:19', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:20:19', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:20:19', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:20:19', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:20:19', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:20:19', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:20:19', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:20:19', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:20:19', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2500', '250000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:21:33', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:21:33', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:21:33', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:21:33', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:21:33', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:21:33', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:21:33', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:21:33', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:21:33', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:21:33', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:21:33', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:21:33', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:21:33', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2500', '250000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:23:01', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:23:01', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:23:01', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:23:01', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:23:01', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:23:01', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:23:01', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:23:01', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:23:01', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:23:01', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:23:01', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:23:01', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622054', 'WSP001', '2022-06-30 14:23:01', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2500', '250000'),
(0, 'PNJWASERDA300622055', 'WSP001', '2022-06-30 14:23:21', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA300622055', 'WSP001', '2022-06-30 14:23:21', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622055', 'WSP001', '2022-06-30 14:23:21', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622055', 'WSP001', '2022-06-30 14:23:21', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622055', 'WSP001', '2022-06-30 14:23:21', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA300622055', 'WSP001', '2022-06-30 14:23:21', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622055', 'WSP001', '2022-06-30 14:23:21', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA300622055', 'WSP001', '2022-06-30 14:23:21', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622055', 'WSP001', '2022-06-30 14:23:21', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622055', 'WSP001', '2022-06-30 14:23:21', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2500', '250000'),
(0, 'PNJWASERDA300622056', 'WSP001', '2022-06-30 14:24:09', '', '50', '14000', '700000', '1', '2000', '2000', '4', '2500', '10000'),
(0, 'PNJWASERDA300622056', 'WSP001', '2022-06-30 14:24:09', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622056', 'WSP001', '2022-06-30 14:24:09', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622056', 'WSP001', '2022-06-30 14:24:09', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA300622056', 'WSP001', '2022-06-30 14:24:09', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622056', 'WSP001', '2022-06-30 14:24:09', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA300622056', 'WSP001', '2022-06-30 14:24:09', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622056', 'WSP001', '2022-06-30 14:24:09', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622056', 'WSP001', '2022-06-30 14:24:09', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2500', '250000'),
(0, 'PNJWASERDA300622057', 'WSP001', '2022-06-30 14:26:36', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622057', 'WSP001', '2022-06-30 14:26:36', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622057', 'WSP001', '2022-06-30 14:26:36', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622057', 'WSP001', '2022-06-30 14:26:36', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA300622057', 'WSP001', '2022-06-30 14:26:36', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA300622057', 'WSP001', '2022-06-30 14:26:36', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA300622057', 'WSP001', '2022-06-30 14:26:36', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA300622057', 'WSP001', '2022-06-30 14:26:36', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA300622057', 'WSP001', '2022-06-30 14:26:36', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2500', '250000'),
(0, 'PNJWASERDA020722058', 'WSP001', '2022-07-01 17:24:24', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA020722058', 'WSP001', '2022-07-01 17:24:24', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA020722058', 'WSP001', '2022-07-01 17:24:24', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA020722058', 'WSP001', '2022-07-01 17:24:24', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA020722058', 'WSP001', '2022-07-01 17:24:24', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA020722058', 'WSP001', '2022-07-01 17:24:24', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA020722058', 'WSP001', '2022-07-01 17:24:24', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA020722058', 'WSP001', '2022-07-01 17:24:24', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA020722058', 'WSP001', '2022-07-01 17:24:24', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2500', '250000'),
(0, 'PNJWASERDA020722059', 'WSP001', '2022-07-01 17:39:25', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA020722059', 'WSP001', '2022-07-01 17:39:25', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA020722059', 'WSP001', '2022-07-01 17:39:25', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA020722059', 'WSP001', '2022-07-01 17:39:25', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA020722059', 'WSP001', '2022-07-01 17:39:25', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA020722059', 'WSP001', '2022-07-01 17:39:25', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA020722059', 'WSP001', '2022-07-01 17:39:25', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA020722059', 'WSP001', '2022-07-01 17:39:25', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA020722059', 'WSP001', '2022-07-01 17:39:25', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2500', '250000'),
(0, 'PNJWASERDA020722060', 'WSP001', '2022-07-01 17:39:49', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA020722060', 'WSP001', '2022-07-01 17:39:49', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA020722060', 'WSP001', '2022-07-01 17:39:49', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA020722060', 'WSP001', '2022-07-01 17:39:49', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA020722060', 'WSP001', '2022-07-01 17:39:49', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA020722060', 'WSP001', '2022-07-01 17:39:49', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA020722060', 'WSP001', '2022-07-01 17:39:49', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA020722060', 'WSP001', '2022-07-01 17:39:49', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2500', '250000'),
(0, 'PNJWASERDA280722061', 'WSP001', '2022-07-27 17:44:31', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA280722061', 'WSP001', '2022-07-27 17:44:31', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA280722061', 'WSP001', '2022-07-27 17:44:31', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA280722061', 'WSP001', '2022-07-27 17:44:31', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA280722061', 'WSP001', '2022-07-27 17:44:31', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA280722061', 'WSP001', '2022-07-27 17:44:31', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500');
INSERT INTO `waserda_kartu_stok` (`no`, `no_transaksi`, `kode`, `tgl_transaksi`, `keterangan`, `unit_in`, `harga_in`, `total_in`, `unit_out`, `harga_out`, `total_out`, `unit_total`, `harga_total`, `total`) VALUES
(0, 'PNJWASERDA280722061', 'WSP001', '2022-07-27 17:44:31', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA280722061', 'WSP001', '2022-07-27 17:44:31', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2500', '250000'),
(0, 'PNJWASERDA070722062', 'WSP001', '2022-07-07 02:15:42', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA070722062', 'WSP001', '2022-07-07 02:15:42', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA070722062', 'WSP001', '2022-07-07 02:15:42', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA070722062', 'WSP001', '2022-07-07 02:15:42', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA070722062', 'WSP001', '2022-07-07 02:15:42', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA070722062', 'WSP001', '2022-07-07 02:15:42', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA070722062', 'WSP001', '2022-07-07 02:15:42', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA070722062', 'WSP001', '2022-07-07 02:15:42', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2500', '250000'),
(0, 'PNJWASERDA070722062', 'WSP001', '2022-07-07 02:22:50', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA070722062', 'WSP001', '2022-07-07 02:22:50', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA070722062', 'WSP001', '2022-07-07 02:22:50', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA070722062', 'WSP001', '2022-07-07 02:22:50', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA070722062', 'WSP001', '2022-07-07 02:22:50', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA070722062', 'WSP001', '2022-07-07 02:22:50', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA070722062', 'WSP001', '2022-07-07 02:22:50', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA070722062', 'WSP001', '2022-07-07 02:22:50', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2500', '250000'),
(0, 'PNJWASERDA070722063', 'WSP001', '2022-07-07 02:23:17', '', '50', '14000', '700000', '1', '2000', '2000', '9', '2500', '22500'),
(0, 'PNJWASERDA070722063', 'WSP001', '2022-07-07 02:23:17', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA070722063', 'WSP001', '2022-07-07 02:23:17', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA070722063', 'WSP001', '2022-07-07 02:23:17', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA070722063', 'WSP001', '2022-07-07 02:23:17', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA070722063', 'WSP001', '2022-07-07 02:23:17', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2500', '250000'),
(0, 'PNJWASERDA070722064', 'WSP002', '2022-07-07 02:27:45', '', '50', '14000', '700000', '1', '2000', '2000', '8', '2000', '16000'),
(0, 'PNJWASERDA070722064', 'WSP002', '2022-07-07 02:27:45', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2000', '20000'),
(0, 'PNJWASERDA070722064', 'WSP002', '2022-07-07 02:27:45', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PNJWASERDA070722065', 'WSP001', '2022-07-07 02:28:21', '', '50', '14000', '700000', '1', '2000', '2000', '8', '2500', '20000'),
(0, 'PNJWASERDA070722065', 'WSP001', '2022-07-07 02:28:21', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA070722065', 'WSP001', '2022-07-07 02:28:21', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA070722065', 'WSP001', '2022-07-07 02:28:21', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA070722065', 'WSP001', '2022-07-07 02:28:21', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA070722065', 'WSP001', '2022-07-07 02:28:21', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2500', '250000'),
(0, 'PNJWASERDA070722066', 'WSP003', '2022-07-07 02:28:42', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA070722066', 'WSP003', '2022-07-07 02:28:42', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2000', '6000'),
(0, 'PNJWASERDA070722066', 'WSP003', '2022-07-07 02:28:42', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2000', '2000'),
(0, 'PNJWASERDA070722067', 'WSP001', '2022-07-07 02:33:00', '', '50', '14000', '700000', '1', '2000', '2000', '7', '2500', '17500'),
(0, 'PNJWASERDA070722067', 'WSP001', '2022-07-07 02:33:00', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA070722067', 'WSP001', '2022-07-07 02:33:00', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA070722067', 'WSP001', '2022-07-07 02:33:00', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA070722067', 'WSP001', '2022-07-07 02:33:00', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA070722067', 'WSP001', '2022-07-07 02:33:00', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2500', '250000'),
(0, 'PNJWASERDA060722068', 'WSP001', '2022-07-06 16:18:33', '', '50', '14000', '700000', '1', '2000', '2000', '6', '2500', '15000'),
(0, 'PNJWASERDA060722068', 'WSP001', '2022-07-06 16:18:33', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA060722068', 'WSP001', '2022-07-06 16:18:33', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA060722068', 'WSP001', '2022-07-06 16:18:33', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA060722068', 'WSP001', '2022-07-06 16:18:33', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA060722068', 'WSP001', '2022-07-06 16:18:33', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2500', '250000'),
(0, 'PNJWASERDA090722001', 'WSP001', '2022-07-09 06:59:53', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA090722001', 'WSP001', '2022-07-09 06:59:53', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA090722001', 'WSP001', '2022-07-09 06:59:53', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA090722001', 'WSP001', '2022-07-09 06:59:53', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA090722001', 'WSP001', '2022-07-09 06:59:53', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA090722001', 'WSP001', '2022-07-09 06:59:53', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2500', '250000'),
(0, 'PNJWASERDA090722001', 'WSP001', '2022-07-09 07:02:08', '', '50', '14000', '700000', '1', '2000', '2000', '4', '2500', '10000'),
(0, 'PNJWASERDA090722001', 'WSP001', '2022-07-09 07:02:08', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA090722001', 'WSP001', '2022-07-09 07:02:08', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA090722001', 'WSP001', '2022-07-09 07:02:09', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA090722001', 'WSP001', '2022-07-09 07:02:09', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA090722001', 'WSP001', '2022-07-09 07:02:09', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2500', '250000'),
(0, 'PNJWASERDA080722002', 'WSP001', '2022-07-08 07:06:09', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA080722002', 'WSP001', '2022-07-08 07:06:09', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA080722002', 'WSP001', '2022-07-08 07:06:09', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA080722002', 'WSP001', '2022-07-08 07:06:09', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA080722002', 'WSP001', '2022-07-08 07:06:09', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA080722002', 'WSP001', '2022-07-08 07:06:09', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2500', '250000'),
(0, 'PNJWASERDA120722003', 'WSP001', '2022-07-12 07:08:07', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA120722003', 'WSP001', '2022-07-12 07:08:07', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA120722003', 'WSP001', '2022-07-12 07:08:07', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA120722003', 'WSP001', '2022-07-12 07:08:07', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA120722003', 'WSP001', '2022-07-12 07:08:07', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA120722003', 'WSP001', '2022-07-12 07:08:07', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2500', '250000'),
(0, 'PNJWASERDA120722003', 'WSP001', '2022-07-12 07:08:08', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA120722003', 'WSP001', '2022-07-12 07:08:08', '', '50', '14000', '700000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA120722003', 'WSP001', '2022-07-12 07:08:08', '', '50', '14000', '700000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA120722003', 'WSP001', '2022-07-12 07:08:08', '', '50', '14000', '700000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA120722003', 'WSP001', '2022-07-12 07:08:08', '', '50', '14000', '700000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA120722003', 'WSP001', '2022-07-12 07:08:08', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2500', '250000'),
(0, 'PMBWASERDA090722001', 'WSP001', '2022-07-08 22:47:49', NULL, '50', '14000', '700000', '1', '2000', '2000', '1', '1750', '1750'),
(0, 'PMBWASERDA090722001', 'WSP001', '2022-07-08 22:47:49', NULL, '50', '14000', '700000', '1', '2000', '2000', '5', '1750', '8750'),
(0, 'PMBWASERDA090722001', 'WSP001', '2022-07-08 22:47:49', NULL, '50', '14000', '700000', '1', '2000', '2000', '2', '1750', '3500'),
(0, 'PMBWASERDA090722001', 'WSP001', '2022-07-08 22:47:49', NULL, '50', '14000', '700000', '1', '2000', '2000', '3', '1750', '5250'),
(0, 'PMBWASERDA090722001', 'WSP001', '2022-07-08 22:47:49', NULL, '50', '14000', '700000', '1', '2000', '2000', '1', '1750', '1750'),
(0, 'PMBWASERDA090722001', 'WSP001', '2022-07-08 22:47:49', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1750', '175000'),
(0, 'PMBWASERDA090722001', 'WSP001', '2022-07-08 22:47:49', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1750', '175000'),
(0, 'PMBWASERDA230722001', 'WSP001', '2022-07-23 15:52:54', NULL, '50', '14000', '700000', '1', '2000', '2000', '1', '1750', '1750'),
(0, 'PMBWASERDA230722001', 'WSP001', '2022-07-23 15:52:54', NULL, '50', '14000', '700000', '1', '2000', '2000', '5', '1750', '8750'),
(0, 'PMBWASERDA230722001', 'WSP001', '2022-07-23 15:52:54', NULL, '50', '14000', '700000', '1', '2000', '2000', '2', '1750', '3500'),
(0, 'PMBWASERDA230722001', 'WSP001', '2022-07-23 15:52:54', NULL, '50', '14000', '700000', '1', '2000', '2000', '3', '1750', '5250'),
(0, 'PMBWASERDA230722001', 'WSP001', '2022-07-23 15:52:54', NULL, '50', '14000', '700000', '1', '2000', '2000', '1', '1750', '1750'),
(0, 'PMBWASERDA230722001', 'WSP001', '2022-07-23 15:52:54', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1750', '175000'),
(0, 'PMBWASERDA230722001', 'WSP001', '2022-07-23 15:52:54', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1750', '175000'),
(0, 'PMBWASERDA230722001', 'WSP001', '2022-07-23 15:52:54', NULL, '50', '14000', '700000', '1', '2000', '2000', '3000', '1750', '5250000'),
(0, 'PNJWASERDA230722001', 'WSP001', '2022-07-23 15:53:39', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA230722001', 'WSP001', '2022-07-23 15:53:39', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA230722001', 'WSP001', '2022-07-23 15:53:39', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA230722001', 'WSP001', '2022-07-23 15:53:39', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA230722001', 'WSP001', '2022-07-23 15:53:39', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA230722001', 'WSP001', '2022-07-23 15:53:39', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA230722001', 'WSP001', '2022-07-23 15:53:39', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA230722001', 'WSP001', '2022-07-23 15:53:39', '', '50', '14000', '700000', '1', '2000', '2000', '212', '2500', '530000'),
(0, 'PNJWASERDA240722002', 'WSP001', '2022-07-23 18:29:27', '', '50', '14000', '700000', '1', '2000', '2000', '211', '2500', '527500'),
(0, 'PMBWASERDA240722002', 'WSP002', '2022-07-23 18:35:37', NULL, '50', '14000', '700000', '1', '2000', '2000', '8', '1500', '12000'),
(0, 'PMBWASERDA240722002', 'WSP002', '2022-07-23 18:35:37', NULL, '50', '14000', '700000', '1', '2000', '2000', '10', '1500', '15000'),
(0, 'PMBWASERDA240722002', 'WSP002', '2022-07-23 18:35:37', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1500', '150000'),
(0, 'PMBWASERDA240722002', 'WSP002', '2022-07-23 18:35:37', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1500', '150000'),
(0, 'PNJWASERDA070822003', 'WSP001', '2022-08-06 19:04:46', '', '50', '14000', '700000', '1', '2000', '2000', '186', '2500', '465000'),
(0, 'PNJWASERDA100722001', 'WSP001', '2022-07-09 19:18:27', '', '50', '14000', '700000', '1', '2000', '2000', '185', '2500', '462500'),
(0, 'PMBWASERDA100722003', 'WSP001', '2022-07-10 09:31:47', NULL, '50', '14000', '700000', '1', '2000', '2000', '185', '1750', '323750'),
(0, 'PMBWASERDA100722003', 'WSP001', '2022-07-10 09:31:47', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1750', '175000'),
(0, 'PMBWASERDA100722001', 'WSP001', '2022-07-10 10:30:13', NULL, '50', '14000', '700000', '1', '2000', '2000', '185', '1750', '323750'),
(0, 'PMBWASERDA100722001', 'WSP001', '2022-07-10 10:30:13', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1750', '175000'),
(0, 'PMBWASERDA100722001', 'WSP001', '2022-07-10 10:30:13', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1750', '175000'),
(0, 'PMBWASERDA100722001', 'WSP002', '2022-07-10 10:30:13', NULL, '50', '14000', '700000', '1', '2000', '2000', '8', '1500', '12000'),
(0, 'PMBWASERDA100722001', 'WSP002', '2022-07-10 10:30:13', NULL, '50', '14000', '700000', '1', '2000', '2000', '10', '1500', '15000'),
(0, 'PMBWASERDA100722001', 'WSP002', '2022-07-10 10:30:13', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1500', '150000'),
(0, 'PMBWASERDA100722001', 'WSP002', '2022-07-10 10:30:13', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1500', '150000'),
(0, 'PMBWASERDA100722001', 'WSP002', '2022-07-10 10:30:13', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1500', '150000'),
(0, 'PMBWASERDA100722001', 'WSP005', '2022-07-10 10:30:13', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1500', '150000'),
(0, 'PMBWASERDA100722001', 'WSP003', '2022-07-10 10:30:13', NULL, '50', '14000', '700000', '1', '2000', '2000', '3', '1500', '4500'),
(0, 'PMBWASERDA100722001', 'WSP003', '2022-07-10 10:30:13', NULL, '50', '14000', '700000', '1', '2000', '2000', '1', '1500', '1500'),
(0, 'PMBWASERDA100722001', 'WSP003', '2022-07-10 10:30:13', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1500', '150000'),
(0, 'PMBWASERDA100722001', 'WSP004', '2022-07-10 10:30:13', NULL, '50', '14000', '700000', '1', '2000', '2000', '94', '1500', '141000'),
(0, 'PMBWASERDA100722001', 'WSP004', '2022-07-10 10:30:13', NULL, '50', '14000', '700000', '1', '2000', '2000', '12', '1500', '18000'),
(0, 'PMBWASERDA100722001', 'WSP004', '2022-07-10 10:30:13', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1500', '150000'),
(0, 'PMBWASERDA100722002', 'WSP001', '2022-07-10 13:40:40', NULL, '50', '14000', '700000', '1', '2000', '2000', '185', '1750', '323750'),
(0, 'PMBWASERDA100722002', 'WSP001', '2022-07-10 13:40:40', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1750', '175000'),
(0, 'PMBWASERDA100722002', 'WSP001', '2022-07-10 13:40:40', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1750', '175000'),
(0, 'PMBWASERDA100722002', 'WSP001', '2022-07-10 13:40:40', NULL, '50', '14000', '700000', '1', '2000', '2000', '2000', '1750', '3500000'),
(0, 'PNJWASERDA100722002', 'WSP001', '2022-07-10 13:42:20', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA100722002', 'WSP001', '2022-07-10 13:42:20', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA100722002', 'WSP001', '2022-07-10 13:42:20', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA100722002', 'WSP001', '2022-07-10 13:42:20', '', '50', '14000', '700000', '1', '2000', '2000', '385', '2500', '962500'),
(0, 'PNJWASERDA120722003', 'WSP001', '2022-07-12 14:19:21', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA120722003', 'WSP001', '2022-07-12 14:19:21', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA120722003', 'WSP001', '2022-07-12 14:19:21', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA120722003', 'WSP001', '2022-07-12 14:19:21', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA120722003', 'WSP001', '2022-07-12 14:19:21', '', '50', '14000', '700000', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA120722003', 'WSP001', '2022-07-12 14:19:21', '', '50', '14000', '700000', '1', '2000', '2000', '384', '2500', '960000'),
(0, 'PNJWASERDA120722004', 'WSP002', '2022-07-12 14:19:36', '', '50', '14000', '700000', '1', '2000', '2000', '7', '2000', '14000'),
(0, 'PNJWASERDA120722004', 'WSP002', '2022-07-12 14:19:36', '', '50', '14000', '700000', '1', '2000', '2000', '10', '2000', '20000'),
(0, 'PNJWASERDA120722004', 'WSP002', '2022-07-12 14:19:36', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PNJWASERDA120722004', 'WSP002', '2022-07-12 14:19:36', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PNJWASERDA120722004', 'WSP002', '2022-07-12 14:19:36', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PMBWASERDA120722003', 'WSP001', '2022-07-12 14:23:55', NULL, '50', '14000', '700000', '1', '2000', '2000', '384', '1750', '672000'),
(0, 'PMBWASERDA120722003', 'WSP001', '2022-07-12 14:23:55', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1750', '175000'),
(0, 'PMBWASERDA120722004', 'WSP002', '2022-07-12 14:24:07', NULL, '50', '14000', '700000', '1', '2000', '2000', '7', '1500', '10500'),
(0, 'PMBWASERDA120722004', 'WSP002', '2022-07-12 14:24:07', NULL, '50', '14000', '700000', '1', '2000', '2000', '10', '1500', '15000'),
(0, 'PMBWASERDA120722004', 'WSP002', '2022-07-12 14:24:07', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1500', '150000'),
(0, 'PMBWASERDA120722004', 'WSP002', '2022-07-12 14:24:07', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1500', '150000'),
(0, 'PMBWASERDA120722004', 'WSP002', '2022-07-12 14:24:07', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1500', '150000'),
(0, 'PMBWASERDA120722004', 'WSP002', '2022-07-12 14:24:07', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1500', '150000'),
(0, 'PMBWASERDA140722001', 'WSP001', '2022-07-14 00:21:03', NULL, '50', '14000', '700000', '1', '2000', '2000', '384', '1500', '576000'),
(0, 'PMBWASERDA140722001', 'WSP001', '2022-07-14 00:21:03', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1500', '150000'),
(0, 'PMBWASERDA140722001', 'WSP001', '2022-07-14 00:21:03', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1500', '150000'),
(0, 'PMBWASERDA140722001', 'WSP002', '2022-07-14 00:21:03', NULL, '50', '14000', '700000', '1', '2000', '2000', '7', '1500', '10500'),
(0, 'PMBWASERDA140722001', 'WSP002', '2022-07-14 00:21:03', NULL, '50', '14000', '700000', '1', '2000', '2000', '10', '1500', '15000'),
(0, 'PMBWASERDA140722001', 'WSP002', '2022-07-14 00:21:03', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1500', '150000'),
(0, 'PMBWASERDA140722001', 'WSP002', '2022-07-14 00:21:03', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1500', '150000'),
(0, 'PMBWASERDA140722001', 'WSP002', '2022-07-14 00:21:03', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1500', '150000'),
(0, 'PMBWASERDA140722001', 'WSP002', '2022-07-14 00:21:03', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1500', '150000'),
(0, 'PMBWASERDA140722001', 'WSP002', '2022-07-14 00:21:03', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1500', '150000'),
(0, 'PMBWASERDA140722001', 'WSP005', '2022-07-14 00:21:03', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1500', '150000'),
(0, 'PMBWASERDA140722001', 'WSP005', '2022-07-14 00:21:03', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1500', '150000'),
(0, 'PMBWASERDA140722001', 'WSP003', '2022-07-14 00:21:03', NULL, '50', '14000', '700000', '1', '2000', '2000', '3', '1500', '4500'),
(0, 'PMBWASERDA140722001', 'WSP003', '2022-07-14 00:21:03', NULL, '50', '14000', '700000', '1', '2000', '2000', '1', '1500', '1500'),
(0, 'PMBWASERDA140722001', 'WSP003', '2022-07-14 00:21:03', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1500', '150000'),
(0, 'PMBWASERDA140722001', 'WSP003', '2022-07-14 00:21:03', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1500', '150000'),
(0, 'PMBWASERDA140722001', 'WSP004', '2022-07-14 00:21:03', NULL, '50', '14000', '700000', '1', '2000', '2000', '94', '1500', '141000'),
(0, 'PMBWASERDA140722001', 'WSP004', '2022-07-14 00:21:03', NULL, '50', '14000', '700000', '1', '2000', '2000', '12', '1500', '18000'),
(0, 'PMBWASERDA140722001', 'WSP004', '2022-07-14 00:21:03', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1500', '150000'),
(0, 'PMBWASERDA140722001', 'WSP004', '2022-07-14 00:21:03', NULL, '50', '14000', '700000', '1', '2000', '2000', '100', '1500', '150000'),
(0, 'PNJWASERDA140722001', 'WSP001', '2022-07-14 02:41:44', '', '50', '14000', '700000', '1', '2000', '2000', '379', '2000', '758000'),
(0, 'PNJWASERDA140722001', 'WSP001', '2022-07-14 02:41:44', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PNJWASERDA140722001', 'WSP001', '2022-07-14 02:41:44', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PNJWASERDA140722001', 'WSP005', '2022-07-14 02:41:44', '', '50', '14000', '700000', '1', '2000', '2000', '95', '2000', '190000'),
(0, 'PNJWASERDA140722001', 'WSP005', '2022-07-14 02:41:44', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PNJWASERDA140722002', 'WSP001', '2022-07-14 02:51:45', '', '50', '14000', '700000', '1', '2000', '2000', '378', '2000', '756000'),
(0, 'PNJWASERDA140722002', 'WSP001', '2022-07-14 02:51:45', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PNJWASERDA140722002', 'WSP001', '2022-07-14 02:51:45', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PNJWASERDA140722002', 'WSP004', '2022-07-14 02:51:45', '', '50', '14000', '700000', '1', '2000', '2000', '92', '2000', '184000'),
(0, 'PNJWASERDA140722002', 'WSP004', '2022-07-14 02:51:45', '', '50', '14000', '700000', '1', '2000', '2000', '12', '2000', '24000'),
(0, 'PNJWASERDA140722002', 'WSP004', '2022-07-14 02:51:45', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PNJWASERDA140722002', 'WSP004', '2022-07-14 02:51:45', '', '50', '14000', '700000', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PMBWASERDA140722002', 'WSP006', '2022-07-14 09:01:02', NULL, '50', '14000', '700000', '1', '2000', '2000', '50', '14000', '700000'),
(0, 'PNJWASERDA140722003', 'WSP001', '2022-07-14 09:04:27', '', '0', '0', '0', '1', '2000', '2000', '377', '2000', '754000'),
(0, 'PNJWASERDA140722003', 'WSP001', '2022-07-14 09:04:27', '', '0', '0', '0', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PNJWASERDA140722003', 'WSP001', '2022-07-14 09:04:27', '', '0', '0', '0', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PNJWASERDA140722003', 'WSP005', '2022-07-14 09:04:27', '', '0', '0', '0', '1', '2000', '2000', '94', '2000', '188000'),
(0, 'PNJWASERDA140722003', 'WSP005', '2022-07-14 09:04:27', '', '0', '0', '0', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PNJWASERDA220722004', 'WSP001', '2022-07-22 08:15:34', '', '0', '0', '0', '1', '2000', '2000', '367', '2000', '734000'),
(0, 'PNJWASERDA220722004', 'WSP001', '2022-07-22 08:15:34', '', '0', '0', '0', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PNJWASERDA220722004', 'WSP001', '2022-07-22 08:15:34', '', '0', '0', '0', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PNJWASERDA220722005', 'WSP005', '2022-07-22 08:16:00', '', '0', '0', '0', '1', '2000', '2000', '88', '2000', '176000'),
(0, 'PNJWASERDA220722005', 'WSP005', '2022-07-22 08:16:00', '', '0', '0', '0', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PNJWASERDA220722006', 'WSP001', '2022-07-22 08:18:35', '', '0', '0', '0', '1', '2000', '2000', '362', '2000', '724000'),
(0, 'PNJWASERDA220722006', 'WSP001', '2022-07-22 08:18:35', '', '0', '0', '0', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PNJWASERDA220722006', 'WSP001', '2022-07-22 08:18:35', '', '0', '0', '0', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PNJWASERDA220722007', 'WSP001', '2022-07-22 10:53:15', '', '0', '0', '0', '1', '2000', '2000', '352', '2000', '704000'),
(0, 'PNJWASERDA220722007', 'WSP001', '2022-07-22 10:53:15', '', '0', '0', '0', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PNJWASERDA220722007', 'WSP001', '2022-07-22 10:53:15', '', '0', '0', '0', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PNJWASERDA220722008', 'WSP005', '2022-07-22 10:54:02', '', '0', '0', '0', '1', '2000', '2000', '83', '2000', '166000'),
(0, 'PNJWASERDA220722008', 'WSP005', '2022-07-22 10:54:02', '', '0', '0', '0', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PNJWASERDA230722009', 'WSP001', '2022-07-23 11:09:55', '', '0', '0', '0', '1', '2000', '2000', '342', '2000', '684000'),
(0, 'PNJWASERDA230722009', 'WSP001', '2022-07-23 11:09:55', '', '0', '0', '0', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PNJWASERDA230722009', 'WSP001', '2022-07-23 11:09:55', '', '0', '0', '0', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PNJWASERDA230722009', 'WSP003', '2022-07-23 15:29:11', '', '0', '0', '0', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA230722009', 'WSP003', '2022-07-23 15:29:11', '', '0', '0', '0', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA230722009', 'WSP003', '2022-07-23 15:29:11', '', '0', '0', '0', '1', '2000', '2000', '99', '2000', '198000'),
(0, 'PNJWASERDA230722009', 'WSP003', '2022-07-23 15:29:11', '', '0', '0', '0', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PNJWASERDA230722009', 'WSP003', '2022-07-23 15:37:44', '', '0', '0', '0', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA230722009', 'WSP003', '2022-07-23 15:37:44', '', '0', '0', '0', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA230722009', 'WSP003', '2022-07-23 15:37:44', '', '0', '0', '0', '1', '2000', '2000', '94', '2000', '188000'),
(0, 'PNJWASERDA230722009', 'WSP003', '2022-07-23 15:37:44', '', '0', '0', '0', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PNJWASERDA230722009', 'WSP001', '2022-07-23 15:37:44', '', '0', '0', '0', '1', '2000', '2000', '341', '2000', '682000'),
(0, 'PNJWASERDA230722009', 'WSP001', '2022-07-23 15:37:44', '', '0', '0', '0', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PNJWASERDA230722009', 'WSP001', '2022-07-23 15:37:44', '', '0', '0', '0', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PNJWASERDA230722009', 'WSP001', '2022-07-23 15:39:16', '', '0', '0', '0', '1', '2000', '2000', '340', '2000', '680000'),
(0, 'PNJWASERDA230722009', 'WSP001', '2022-07-23 15:39:16', '', '0', '0', '0', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PNJWASERDA230722009', 'WSP001', '2022-07-23 15:39:16', '', '0', '0', '0', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PNJWASERDA230722010', 'WSP003', '2022-07-23 15:47:02', '', '0', '0', '0', '1', '2000', '2000', '89', '2000', '178000'),
(0, 'PNJWASERDA230722010', 'WSP003', '2022-07-23 15:47:02', '', '0', '0', '0', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PNJWASERDA230722011', 'WSP003', '2022-07-23 15:52:48', '', '0', '0', '0', '1', '2000', '2000', '88', '2000', '176000'),
(0, 'PNJWASERDA230722011', 'WSP003', '2022-07-23 15:52:48', '', '0', '0', '0', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PNJWASERDA230722012', 'WSP002', '2022-07-23 15:58:28', '', '0', '0', '0', '1', '2000', '2000', '2', '2000', '4000'),
(0, 'PNJWASERDA230722012', 'WSP002', '2022-07-23 15:58:28', '', '0', '0', '0', '1', '2000', '2000', '10', '2000', '20000'),
(0, 'PNJWASERDA230722012', 'WSP002', '2022-07-23 15:58:28', '', '0', '0', '0', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PNJWASERDA230722012', 'WSP002', '2022-07-23 15:58:28', '', '0', '0', '0', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PNJWASERDA230722012', 'WSP002', '2022-07-23 15:58:28', '', '0', '0', '0', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PNJWASERDA230722012', 'WSP002', '2022-07-23 15:58:28', '', '0', '0', '0', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PNJWASERDA230722012', 'WSP002', '2022-07-23 15:58:28', '', '0', '0', '0', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PNJWASERDA230722013', 'WSP001', '2022-07-23 18:24:06', '', '0', '0', '0', '1', '2000', '2000', '339', '2000', '678000'),
(0, 'PNJWASERDA230722013', 'WSP001', '2022-07-23 18:24:06', '', '0', '0', '0', '1', '2000', '2000', '100', '2000', '200000'),
(0, 'PNJWASERDA230722013', 'WSP001', '2022-07-23 18:24:06', '', '0', '0', '0', '1', '2000', '2000', '100', '2000', '200000');

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
(5, 'WKS005', 'Elektronik'),
(8, 'WKS006', 'pewangi');

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
('PNJWASERDA230722001', 'WSP001', 8),
('PNJWASERDA240722002', 'WSP001', 1),
('PNJWASERDA070822003', 'WSP001', 1),
('PNJWASERDA100722001', 'WSP001', 1),
('PNJWASERDA100722002', 'WSP001', 4),
('PNJWASERDA120722003', 'WSP001', 1),
('PNJWASERDA120722004', 'WSP002', 5),
('PNJWASERDA140722001', 'WSP001', 3),
('PNJWASERDA140722001', 'WSP005', 2),
('PNJWASERDA140722002', 'WSP001', 3),
('PNJWASERDA140722002', 'WSP004', 4),
('PNJWASERDA140722003', 'WSP001', 3),
('PNJWASERDA140722003', 'WSP005', 2),
('PNJWASERDA220722004', 'WSP001', 3),
('PNJWASERDA220722005', 'WSP005', 2),
('PNJWASERDA220722006', 'WSP001', 3),
('PNJWASERDA220722007', 'WSP001', 3),
('PNJWASERDA220722008', 'WSP005', 2),
('PNJWASERDA230722009', 'WSP001', 3),
('PNJWASERDA230722009', 'WSP003', 4),
('PNJWASERDA230722009', 'WSP003', 2),
('PNJWASERDA230722009', 'WSP001', 3),
('PNJWASERDA230722009', 'WSP001', 3),
('PNJWASERDA230722010', 'WSP003', 2),
('PNJWASERDA230722011', 'WSP003', 2),
('PNJWASERDA230722012', 'WSP002', 7),
('PNJWASERDA230722013', 'WSP001', 3);

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
(16, 'WSP004', 'Stok Masuk', 100, 92, '2022-06-01 08:50:42'),
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
(31, 'WSP003', 'Stok Masuk', 3, 0, '2022-06-18 17:40:31'),
(32, 'WSP001', 'Stok Masuk', 3, 0, '2022-06-18 17:43:11'),
(33, 'WSP003', 'Stok Masuk', 1, 0, '2022-06-18 17:43:11'),
(34, 'WSP001', 'Stok Masuk', 1, 0, '2022-06-20 10:00:36'),
(35, 'WSP002', 'Stok Masuk', 15, 2, '2022-06-21 17:06:11'),
(36, 'WSP002', 'Stok Masuk', 10, 10, '2022-06-21 17:12:36'),
(37, 'WSP002', 'Stok Masuk', 100, 100, '2022-06-26 20:08:51'),
(38, 'WSP001', 'Stok Masuk', 100, 0, '2022-06-26 21:04:43'),
(39, 'WSP001', 'Stok Masuk', 100, 0, '2022-07-08 22:47:49'),
(40, 'WSP001', 'Stok Masuk', 3000, 0, '2022-07-23 15:52:54'),
(41, 'WSP002', 'Stok Masuk', 100, 100, '2022-07-23 18:35:37'),
(42, 'WSP001', 'Stok Masuk', 100, 0, '2022-07-10 09:31:47'),
(43, 'WSP001', 'Stok Masuk', 100, 0, '2022-07-10 10:30:13'),
(44, 'WSP002', 'Stok Masuk', 100, 100, '2022-07-10 10:30:13'),
(45, 'WSP005', 'Stok Masuk', 100, 83, '2022-07-10 10:30:13'),
(46, 'WSP003', 'Stok Masuk', 100, 88, '2022-07-10 10:30:13'),
(47, 'WSP004', 'Stok Masuk', 100, 100, '2022-07-10 10:30:13'),
(48, 'WSP001', 'Stok Masuk', 2000, 339, '2022-07-10 13:40:40'),
(49, 'WSP001', 'Stok Masuk', 100, 100, '2022-07-12 14:23:55'),
(50, 'WSP002', 'Stok Masuk', 100, 100, '2022-07-12 14:24:07'),
(51, 'WSP001', 'Stok Masuk', 100, 100, '2022-07-13 17:21:03'),
(52, 'WSP002', 'Stok Masuk', 100, 100, '2022-07-13 17:21:03'),
(53, 'WSP005', 'Stok Masuk', 100, 100, '2022-07-13 17:21:03'),
(54, 'WSP003', 'Stok Masuk', 100, 100, '2022-07-13 17:21:03'),
(55, 'WSP004', 'Stok Masuk', 100, 100, '2022-07-13 17:21:03'),
(56, 'WSP006', 'Stok Masuk', 50, 50, '2022-07-14 02:01:02');

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
(25, NULL, 'PNJWASERDA230722012', NULL, 'Andi', 'peternak', 11500, '2022-07-23 08:58:28', 0);

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
(8, '2022-07-14', 'Indomie Goreng', 100, 'Stock kosong', 'Approved'),
(9, '2022-07-14', 'Indomie Kari Ayam', 100, 'Stock kosong', 'Approved'),
(10, '2022-07-14', 'Indomie Goreng Rendang', 100, 'Stock kosong', 'Approved'),
(11, '2022-07-14', 'Indomie Goreng Aceh', 100, 'Stock kosong', 'Approved'),
(12, '2022-07-14', 'Indomie Soto', 100, 'Stock kosong', 'Approved'),
(13, '2022-07-14', 'Energen box', 50, 'stok kosong', 'Approved'),
(14, '2022-07-23', 'Indomie Goreng', 10, 'stock menipis', 'Approved');

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
(6, 'PNGBBN20220714001', '2022-07-14', '5314', 'isi bensin kendaraan', 10000, '2022-07-13 19:49:41'),
(7, 'PNGBBN20220714002', '2022-07-14', '5314', 'isi bensin kendaraan', 10000, '2022-07-14 01:55:43');

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
(1, 'WSP001', '089686010947', 'WSK001', 'WSS001', 'Indomie Goreng', 1500, 2000, 'pcs', 54, 1, '2021-10-15 15:38:31'),
(2, 'WSP002', '089686010527', 'WSK001', 'WSS001', 'Indomie Kari Ayam', 1500, 2000, 'pcs', 95, 1, '2021-10-15 15:38:31'),
(3, 'WSP003', '089686910704', 'WSK001', 'WSS002', 'Indomie Goreng Rendang', 1500, 2000, 'pcs', 84, 1, '2021-10-15 15:38:31'),
(4, 'WSP004', '089686043204', 'WSK001', 'WSS003', 'Indomie Goreng Aceh', 1500, 2000, 'pcs', 99, 1, '2021-10-15 15:38:31'),
(5, 'WSP005', '089686010343', 'WSK001', 'WSS001', 'Indomie Soto', 1500, 2000, 'pcs', 83, 1, '2021-10-15 15:38:31'),
(11, 'WSP006', '8886001100909', 'WSK002', 'WSS003', 'Energen box', 14000, 15000, 'pcs', 50, 1, '2022-07-14 01:53:54');

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
(1, 'WSS001', 'Kpsbu', 'bandung', '082256733652', 1, '2021-10-16 04:15:14'),
(2, 'WSS002', 'Cv Anugerah', 'bekasi', '081369864573', 1, '2021-10-16 04:15:27'),
(3, 'WSS003', 'Pt Sejahtera Selalu', 'lembang timur', '089760478952', 1, '2021-10-16 04:15:44'),
(11, 'WSS004', 'Pt Sukses Selalu', 'bandung', '08245673891', 1, '2022-07-14 01:54:54');

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
-- Indexes for table `ppn`
--
ALTER TABLE `ppn`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `aktivitas`
--
ALTER TABLE `aktivitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `alokasi_shu`
--
ALTER TABLE `alokasi_shu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `bom`
--
ALTER TABLE `bom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `buku_kas_kecil`
--
ALTER TABLE `buku_kas_kecil`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `buku_pembantu_bank`
--
ALTER TABLE `buku_pembantu_bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `buku_pembantu_kas`
--
ALTER TABLE `buku_pembantu_kas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `coa`
--
ALTER TABLE `coa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `detail_absen_rfid`
--
ALTER TABLE `detail_absen_rfid`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `detail_cek_kualitas`
--
ALTER TABLE `detail_cek_kualitas`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `detail_pembagian`
--
ALTER TABLE `detail_pembagian`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `detail_pembelian`
--
ALTER TABLE `detail_pembelian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `detail_pembelian_bb`
--
ALTER TABLE `detail_pembelian_bb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `detail_pembelian_bp`
--
ALTER TABLE `detail_pembelian_bp`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `detail_penerimaan_pengeluaran_kas`
--
ALTER TABLE `detail_penerimaan_pengeluaran_kas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `detail_penjualan_ips`
--
ALTER TABLE `detail_penjualan_ips`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `detail_penjualan_toko`
--
ALTER TABLE `detail_penjualan_toko`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `detail_produksi_ke1`
--
ALTER TABLE `detail_produksi_ke1`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `detail_produksi_ke2`
--
ALTER TABLE `detail_produksi_ke2`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `detail_target_produksi`
--
ALTER TABLE `detail_target_produksi`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `detail_transaksi_shu`
--
ALTER TABLE `detail_transaksi_shu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `jadwal_shift`
--
ALTER TABLE `jadwal_shift`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `jenis_penjualan`
--
ALTER TABLE `jenis_penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jurnal`
--
ALTER TABLE `jurnal`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=219;

--
-- AUTO_INCREMENT for table `kartu_stok_bp`
--
ALTER TABLE `kartu_stok_bp`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `kartu_stok_penj`
--
ALTER TABLE `kartu_stok_penj`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `laporan_kartu_stock`
--
ALTER TABLE `laporan_kartu_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `log_penyusutan`
--
ALTER TABLE `log_penyusutan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `pembagian_shu`
--
ALTER TABLE `pembagian_shu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `pembelian_bb`
--
ALTER TABLE `pembelian_bb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `penerimaan_kas`
--
ALTER TABLE `penerimaan_kas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penerimaan_pengeluaran_kas`
--
ALTER TABLE `penerimaan_pengeluaran_kas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `pengajuan_bonus`
--
ALTER TABLE `pengajuan_bonus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `pengajuan_jurnal`
--
ALTER TABLE `pengajuan_jurnal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `pos_detail_penjualan`
--
ALTER TABLE `pos_detail_penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `pos_pembelian`
--
ALTER TABLE `pos_pembelian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pos_penjualan`
--
ALTER TABLE `pos_penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `ppn`
--
ALTER TABLE `ppn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tb_cuti_melahirkan`
--
ALTER TABLE `tb_cuti_melahirkan`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_detail_pengajuan_bonus`
--
ALTER TABLE `tb_detail_pengajuan_bonus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tb_detail_penggajian`
--
ALTER TABLE `tb_detail_penggajian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT for table `tb_jabatan`
--
ALTER TABLE `tb_jabatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_jenis_pegawai`
--
ALTER TABLE `tb_jenis_pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_lembur`
--
ALTER TABLE `tb_lembur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tb_penggajian`
--
ALTER TABLE `tb_penggajian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT for table `tb_ptkp`
--
ALTER TABLE `tb_ptkp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `trans_peny_rev`
--
ALTER TABLE `trans_peny_rev`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `truck_information`
--
ALTER TABLE `truck_information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tunjangan_hari_raya`
--
ALTER TABLE `tunjangan_hari_raya`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `update_stok_penj`
--
ALTER TABLE `update_stok_penj`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `waserda_jenis_anggota`
--
ALTER TABLE `waserda_jenis_anggota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `waserda_kategori`
--
ALTER TABLE `waserda_kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `waserda_log_transaksi`
--
ALTER TABLE `waserda_log_transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `waserda_pembayaran_kredit`
--
ALTER TABLE `waserda_pembayaran_kredit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `waserda_pengajuan_barang`
--
ALTER TABLE `waserda_pengajuan_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `waserda_pengeluaran_beban`
--
ALTER TABLE `waserda_pengeluaran_beban`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `waserda_produk`
--
ALTER TABLE `waserda_produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `waserda_supplier`
--
ALTER TABLE `waserda_supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
