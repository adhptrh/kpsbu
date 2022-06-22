-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2022 at 03:51 PM
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
(1, '2021-10-26'),
(2, '2021-11-02'),
(3, '2021-11-21'),
(4, '2021-12-05'),
(5, '2021-12-08'),
(6, '2021-12-30'),
(7, '2022-05-08'),
(8, '2022-06-18'),
(9, '2022-06-21');

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
(1, 'test'),
(2, 'Penerimaan Kas'),
(3, 'Pengeluaran Kas'),
(4, 'Testing'),
(5, 'Aaaa');

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
('AS-14', 'Test Kendaraan', 12, 'SPA-01', 1214, 5228, 1125);

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
('BB_001', 'Susu Sapi', 'liter', 0),
('BB_002', 'test', 'kg', 0);

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
(3, 'BNK-202206210001', 'BCA'),
(4, 'BNK-202206220002', 'Mandiri'),
(5, 'BNK-202206220003', 'BNI');

-- --------------------------------------------------------

--
-- Table structure for table `bom`
--

CREATE TABLE `bom` (
  `no_produk` varchar(100) NOT NULL,
  `no_bbp` varchar(100) NOT NULL,
  `jumlah` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bom`
--

INSERT INTO `bom` (`no_produk`, `no_bbp`, `jumlah`) VALUES
('PR_001', 'BB_001', 1),
('PR_003', 'BDP_001', 1),
('PR_004', 'BDP_001', 1),
('PR_005', 'BDP_001', 1),
('PR_006', 'BDP_001', 1),
('PR_007', 'BDP_001', 1),
('PR_008', 'BDP_001', 1),
('PR_009', 'BDP_001', 1),
('PR_002', 'BB_001', 1),
('PR_003', 'BB_001', 1),
('PR_004', 'BB_001', 1),
('PR_005', 'BB_001', 1),
('PR_006', 'BB_001', 1),
('PR_007', 'BB_001', 1),
('PR_008', 'BB_001', 1),
('PR_009', 'BB_001', 1),
('PR_002', 'BP_001', 15),
('PR_002', 'BP_005', 10),
('PR_003', 'BP_001', 40),
('PR_003', 'BP_005', 15),
('PR_003', 'BP_003', 10),
('PR_003', 'BP_004', 25),
('PR_004', 'BP_001', 40),
('PR_004', 'BP_003', 10),
('PR_004', 'BP_004', 25),
('PR_004', 'BP_005', 15),
('PR_005', 'BP_001', 40),
('PR_005', 'BP_003', 10),
('PR_005', 'BP_004', 25),
('PR_005', 'BP_005', 15),
('PR_006', 'BP_001', 20),
('PR_006', 'BP_005', 13),
('PR_006', 'BP_003', 10),
('PR_006', 'BP_004', 25),
('PR_006', 'BP_002', 1),
('PR_007', 'BP_001', 20),
('PR_007', 'BP_002', 1),
('PR_007', 'BP_003', 10),
('PR_007', 'BP_004', 25),
('PR_007', 'BP_005', 13),
('PR_008', 'BP_001', 20),
('PR_008', 'BP_002', 1),
('PR_008', 'BP_003', 10),
('PR_008', 'BP_004', 25),
('PR_008', 'BP_005', 13),
('PR_009', 'BP_001', 20),
('PR_009', 'BP_002', 1),
('PR_009', 'BP_005', 13);

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
('BOP_001', '2020-12-21', '0', '0');

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
('BOPO_001', '2020-12-21');

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
(3, 'BPNRM20220622001', NULL, '2022-06-22', '10000000', 1116, 'd', 'aaaa', 0, 0, 0),
(4, 'BPNG20220622002', NULL, '2022-06-22', '5000000', 1116, 'k', 'aaaa', 0, 0, 0),
(5, 'BPNRM20220622003', 'awdawd', '2022-06-22', '10000000', 1116, 'd', 'aaaa', 2000, 1000, 3000),
(6, 'BPNRM20220622004', 'awdawd', '2022-06-22', '10000000', 1116, 'd', 'aaaa', 2000, 1000, 3000),
(7, 'BPNG20220622005', 'awdawd', '2022-06-22', '5000000', 1116, 'k', 'aaaa', 2000, 1000, 3000);

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
(1, 'PNRM20220104003', '2022-01-04', '4500000', 1111, 'd', 'Penjualan IPS'),
(2, 'PNG20220104006', '2022-01-04', '250000', 1111, 'k', 'Bayar listrik'),
(3, 'PNRM20220104004', '2022-01-04', '4500000', 1111, 'd', 'Penerimaan Kas'),
(4, 'PNG20220104007', '2022-01-04', '250000', 1111, 'k', 'Pengeluaran Kas'),
(5, 'PNRM20220104005', '2022-01-04', '4500000', 1111, 'd', 'Penerimaan Kas'),
(6, 'PNRM20220104006', '2022-01-04', '4500000', 1111, 'd', 'Penerimaan Kas'),
(7, 'PNRM20220104007', '2022-01-04', '4500000', 1111, 'd', 'Penerimaan Kas'),
(8, 'PMB-KR-20220107010', '2022-01-07', '2200', 1111, 'd', 'Pembayaran Waserda Kredit'),
(9, 'GAJI-002', '2022-01-07', '3429000', 1111, 'k', 'Pembayaran Gaji'),
(10, 'PMBG.SHU20220001', '2022-01-10', '13269520', 1111, 'd', 'SHU'),
(11, 'PMBG.SHU20220001', '2022-01-10', '11418446', 1111, 'd', 'SHU'),
(12, 'PNGBBN20220219001', '2022-02-19', '50000', 1111, 'k', 'Pengeluaran Beban'),
(13, 'PNGBBN20220219002', '2022-02-19', '100000', 1111, 'k', 'Pengeluaran Beban'),
(14, 'GAJI-003', '2022-05-08', '3429000', 1111, 'k', 'Pembayaran Gaji'),
(15, 'GAJI-003', '2022-05-08', '7429000', 1111, 'k', 'Pembayaran Gaji'),
(19, 'LMBR20220513002', '2022-05-16', '40000', 1111, 'k', 'Pengeluaran Lembur'),
(20, 'PNGBBN20220521003', '2022-05-21', '150000', 1111, 'k', 'Pengeluaran Beban'),
(21, 'PNGBBN20220521004', '2022-05-21', '1000000', 1111, 'k', 'Pengeluaran Beban'),
(22, 'KPSBU240522099', '2022-05-24', '22000', 1111, 'd', 'Penjualan Tunai'),
(23, 'KPSBUPMB010622006', '2022-06-01', '36300', 1111, 'd', 'Penjualan Tunai'),
(24, 'KPSBUPMB010622004', '2022-06-01', '16500', 1111, 'd', 'Penjualan Tunai'),
(25, 'PMBWASERDA010622007', '2022-06-01', '37950', 1111, 'k', 'Pembelian Barang Waserda'),
(27, 'PMBWASERDA010622008', '2022-06-01', '37675', 1111, 'k', 'Pembelian Barang Waserda'),
(29, 'PMBWASERDA010622011', '2022-06-01', '63800', 1111, 'k', 'Pembelian Barang Waserda'),
(30, 'PNJWASERDA010622004', '2022-06-01', '11000', 1111, 'd', 'Penjualan Tunai'),
(31, 'PNJWASERDA010622006', '2022-06-01', '55000', 1111, 'd', 'Penjualan Tunai'),
(32, 'PNJWASERDA010622007', '2022-06-01', '35000', 1111, 'd', 'Penjualan Tunai'),
(33, 'PNJWASERDA010622009', '2022-06-01', '29500', 1111, 'd', 'Penjualan Tunai'),
(34, 'PNJWASERDA150622026', '2022-06-15', '60000', 1111, 'd', 'Penjualan Tunai'),
(35, 'PNJWASERDA160622027', '2022-06-16', '10000', 1111, 'd', 'Penjualan Tunai'),
(36, 'PNJWASERDA160622029', '2022-06-16', '30000', 1111, 'd', 'Penjualan Tunai'),
(37, 'PNJWASERDA160622030', '2022-06-16', '2500', 1111, 'd', 'Penjualan Tunai'),
(38, 'PMBG.SHU20220001', '2022-06-18', '430801', 1111, 'k', 'SHU'),
(39, 'PMBG.SHU20220003', '2022-06-18', '291248', 1111, 'k', 'SHU'),
(40, 'PMBWASERDA170622019', '2022-06-17', '9713', 1111, 'k', 'Pembelian Barang Waserda'),
(41, 'PMBWASERDA170622016', '2022-06-17', '5828', 1111, 'k', 'Pembelian Barang Waserda'),
(42, 'PMBWASERDA170622017', '2022-06-17', '1943', 1111, 'k', 'Pembelian Barang Waserda'),
(43, 'PMBWASERDA170622018', '2022-06-17', '19425', 1111, 'k', 'Pembelian Barang Waserda'),
(44, 'PNJWASERDA170622031', '2022-06-17', '5000', 1111, 'd', 'Penjualan Tunai'),
(45, 'PNJWASERDA170622032', '2022-06-17', '2500', 1111, 'd', 'Penjualan Tunai'),
(46, 'PNJWASERDA170622033', '2022-06-17', '22500', 1111, 'd', 'Penjualan Tunai'),
(47, 'PMBWASERDA160622015', '2022-06-16', '9713', 1111, 'k', 'Pembelian Barang Waserda'),
(48, 'PNJWASERDA160622028', '2022-06-16', '2500', 1111, 'd', 'Penjualan Tunai'),
(49, 'PNJWASERDA150622021', '2022-06-15', '2000', 1111, 'd', 'Penjualan Tunai'),
(50, 'PNJWASERDA150622022', '2022-06-15', '2000', 1111, 'd', 'Penjualan Tunai'),
(51, 'PNJWASERDA150622023', '2022-06-15', '2000', 1111, 'd', 'Penjualan Tunai'),
(52, 'PNJWASERDA150622024', '2022-06-15', '2500', 1111, 'd', 'Penjualan Tunai'),
(53, 'PMBWASERDA150622012', '2022-06-15', '5550', 1111, 'k', 'Pembelian Barang Waserda'),
(54, 'PMBWASERDA150622013', '2022-06-15', '1943', 1111, 'k', 'Pembelian Barang Waserda'),
(55, 'PMBWASERDA150622014', '2022-06-15', '7493', 1111, 'k', 'Pembelian Barang Waserda'),
(56, 'PNJWASERDA150622025', '2022-06-15', '4500', 1111, 'd', 'Penjualan Tunai'),
(57, 'PNJWASERDA140622012', '2022-06-14', '2500', 1111, 'd', 'Penjualan Tunai'),
(58, 'PNJWASERDA140622013', '2022-06-14', '5000', 1111, 'd', 'Penjualan Tunai'),
(59, 'PNJWASERDA140622014', '2022-06-14', '2500', 1111, 'd', 'Penjualan Tunai'),
(60, 'PNJWASERDA140622016', '2022-06-14', '2500', 1111, 'd', 'Penjualan Tunai'),
(61, 'PNJWASERDA140622017', '2022-06-14', '10000', 1111, 'd', 'Penjualan Tunai'),
(62, 'PNJWASERDA010622008', '2022-06-01', '2500', 1111, 'd', 'Penjualan Tunai'),
(63, 'PMBWASERDA010622009', '2022-06-01', '42900', 1111, 'k', 'Pembelian Barang Waserda'),
(64, 'PNJWASERDA010622005', '2022-06-01', '50000', 1111, 'd', 'Penjualan Tunai'),
(65, 'GAJI-004', '2022-05-28', '7429000', 1111, 'k', 'Pembayaran Gaji'),
(66, 'GAJI-005', '2022-05-28', '7429000', 1111, 'k', 'Pembayaran Gaji'),
(67, 'GAJI-006', '2022-05-28', '7429000', 1111, 'k', 'Pembayaran Gaji'),
(68, 'GAJI-007', '2022-05-28', '7429000', 1111, 'k', 'Pembayaran Gaji'),
(69, 'GAJI-008', '2022-05-28', '7429000', 1111, 'k', 'Pembayaran Gaji'),
(70, 'GAJI-003', '2022-05-28', '7429000', 1111, 'k', 'Pembayaran Gaji'),
(71, 'GAJI-003', '2022-05-28', '7429000', 1111, 'k', 'Pembayaran Gaji'),
(72, 'GAJI-004', '2022-05-28', '7429000', 1111, 'k', 'Pembayaran Gaji'),
(73, 'GAJI-004', '2022-05-28', '7429000', 1111, 'k', 'Pembayaran Gaji'),
(74, 'GAJI-003', '2022-05-28', '7429000', 1111, 'k', 'Pembayaran Gaji'),
(75, 'GAJI-003', '2022-05-28', '7429000', 1111, 'k', 'Pembayaran Gaji'),
(76, 'GAJI-003', '2022-05-28', '7429000', 1111, 'k', 'Pembayaran Gaji'),
(77, 'GAJI-004', '2022-05-28', '7429000', 1111, 'k', 'Pembayaran Gaji'),
(78, 'GAJI-003', '2022-05-28', '7429000', 1111, 'k', 'Pembayaran Gaji'),
(79, 'GAJI-003', '2022-05-28', '7600000', 1111, 'k', 'Pembayaran Gaji'),
(80, 'GAJI-003', '2022-05-28', '7429000', 1111, 'k', 'Pembayaran Gaji'),
(81, 'GAJI-011', '2022-05-28', '7429000', 1111, 'k', 'Pembayaran Gaji'),
(82, 'GAJI-010', '2022-05-28', '7429000', 1111, 'k', 'Pembayaran Gaji'),
(83, 'GAJI-009', '2022-05-28', '7429000', 1111, 'k', 'Pembayaran Gaji'),
(84, 'GAJI-008', '2022-05-28', '7429000', 1111, 'k', 'Pembayaran Gaji'),
(85, 'GAJI-007', '2022-05-28', '7429000', 1111, 'k', 'Pembayaran Gaji'),
(86, 'GAJI-006', '2022-05-28', '7429000', 1111, 'k', 'Pembayaran Gaji'),
(87, 'GAJI-005', '2022-05-28', '7429000', 1111, 'k', 'Pembayaran Gaji'),
(88, 'GAJI-003', '2022-05-28', '7429000', 1111, 'k', 'Pembayaran Gaji'),
(89, 'GAJI-003', '2022-05-28', '7429000', 1111, 'k', 'Pembayaran Gaji'),
(90, 'GAJI-004', '2022-05-28', '7429000', 1111, 'k', 'Pembayaran Gaji'),
(91, 'GAJI-003', '0000-00-00', '7429000', 1111, 'k', 'Pembayaran Gaji'),
(92, 'GAJI-003', '0000-00-00', '7429000', 1111, 'k', 'Pembayaran Gaji'),
(93, 'PMBG.SHU20220002', '2022-06-18', '331121', 1111, 'k', 'SHU'),
(94, 'PNJWASERDA180622034', '2022-06-18', '12500', 1111, 'd', 'Penjualan Tunai'),
(95, 'PMB-KR-20220619001', '2022-06-19', '2775', 1111, 'd', 'Pembayaran Waserda Kredit'),
(96, 'PMB-KR-20220619002', '2022-06-19', '2775', 1111, 'd', 'Pembayaran Waserda Kredit'),
(97, 'PNJWASERDA190622038', '2022-06-19', '2500', 1111, 'd', 'Penjualan Tunai'),
(98, 'PNGBBN20220619001', '2022-06-19', '200000', 1111, 'k', 'Pengeluaran Beban'),
(99, 'PNGBBN20220620002', '2022-06-20', '100000', 1111, 'k', 'Pengeluaran Beban'),
(100, 'PMBWASERDA190622020', '2022-06-19', '8880', 1111, 'k', 'Pembelian Barang Waserda'),
(101, 'PMBWASERDA190622021', '2022-06-19', '7493', 1111, 'k', 'Pembelian Barang Waserda'),
(102, 'PNJWASERDA200622040', '2022-06-20', '2500', 1111, 'd', 'Penjualan Tunai'),
(103, 'PMB-KR-20220620003', '2022-06-20', '2775', 1111, 'd', 'Pembayaran Waserda Kredit'),
(104, 'PMBWASERDA200622022', '2022-06-20', '1943', 1111, 'k', 'Pembelian Barang Waserda'),
(105, 'PNGBBN20220620003', '2022-06-20', '250000', 1111, 'k', 'Pengeluaran Beban'),
(106, 'PNJWASERDA200622039', '2022-06-20', '2500', 1111, 'd', 'Penjualan Tunai'),
(107, 'PNJWASERDA200622039', '2022-06-20', '2500', 1111, 'd', 'Penjualan Tunai'),
(108, 'PNJWASERDA200622039', '2022-06-20', '2500', 1111, 'd', 'Penjualan Tunai'),
(109, 'PNJWASERDA200622039', '2022-06-20', '2500', 1111, 'd', 'Penjualan Tunai'),
(110, 'PNJWASERDA200622039', '2022-06-20', '2500', 1111, 'd', 'Penjualan Tunai'),
(111, 'PNJWASERDA200622039', '2022-06-20', '2500', 1111, 'd', 'Penjualan Tunai'),
(112, 'PNJWASERDA200622039', '2022-06-20', '2500', 1111, 'd', 'Penjualan Tunai'),
(113, 'PNJWASERDA200622039', '2022-06-20', '2500', 1111, 'd', 'Penjualan Tunai'),
(114, 'PNJWASERDA200622039', '2022-06-20', '2500', 1111, 'd', 'Penjualan Tunai'),
(115, 'PNJWASERDA200622039', '2022-06-20', '2500', 1111, 'd', 'Penjualan Tunai'),
(116, 'PNJWASERDA200622039', '2022-06-20', '2500', 1111, 'd', 'Penjualan Tunai'),
(117, 'PNJWASERDA200622039', '2022-06-20', '2500', 1111, 'd', 'Penjualan Tunai'),
(118, 'PNJWASERDA200622039', '2022-06-20', '2500', 1111, 'd', 'Penjualan Tunai'),
(119, 'PNJWASERDA200622043', '2022-06-20', '2500', 1111, 'd', 'Penjualan Tunai'),
(120, 'PNJWASERDA200622042', '2022-06-20', '2500', 1111, 'd', 'Penjualan Tunai'),
(121, 'PNJWASERDA200622042', '2022-06-20', '2500', 1111, 'd', 'Penjualan Tunai'),
(122, 'PNJWASERDA200622042', '2022-06-20', '2500', 1111, 'd', 'Penjualan Tunai'),
(123, 'PNJWASERDA200622039', '2022-06-20', '2500', 1111, 'd', 'Penjualan Tunai');

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
  `is_waserda` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coa`
--

INSERT INTO `coa` (`id`, `no_coa`, `nama_coa`, `jenis_coa`, `saldo_awal`, `header`, `saldo_normal`, `is_shu`, `is_arus_kas`, `is_penerimaan`, `is_waserda`) VALUES
(1, 1111, 'Kas', '', 0, 1, 'd', 0, 0, 1, 0),
(2, 1112, 'Persediaan Bahan Baku', '', 0, 1, 'd', 0, 0, 0, 0),
(3, 1113, 'Persediaan Bahan Penolong', '', 0, 1, 'd', 0, 0, 0, 0),
(4, 1114, 'Persediaan Produk Dalam Proses', '', 0, 1, 'd', 0, 0, 0, 0),
(5, 1120, 'Peralatan', '', 0, 1, 'd', 0, 0, 0, 0),
(6, 1122, 'Akumulasi penyusutan peralatan', '', 0, 1, 'd', 0, 0, 0, 0),
(7, 1199, 'Pinjaman Anggota', '', 0, 1, 'd', 0, 0, 0, 0),
(8, 1311, 'Persediaan Produk Jadi IPS', '', 0, 1, 'd', 0, 0, 0, 0),
(9, 1312, 'Persediaan Produk Jadi Toko', '', 0, 1, 'd', 0, 0, 0, 0),
(10, 2111, 'Utang', '', 0, 2, 'd', 0, 0, 0, 0),
(11, 2112, 'Simpanan Hari Raya', '', 0, 2, 'd', 0, 0, 0, 0),
(12, 3112, 'Simpanan Wajib', '', 0, 3, 'd', 0, 0, 0, 0),
(13, 3113, 'Simpanan Manasuka', '', 0, 3, 'd', 0, 0, 0, 0),
(14, 3111, 'Simpanan Pokok', '', 0, 3, 'd', 0, 0, 0, 0),
(15, 1115, 'Pinjaman anggota', '', 0, 1, 'd', 0, 0, 0, 0),
(16, 4111, 'Penjualan IPS', '', 0, 4, 'd', 0, 0, 1, 0),
(17, 4112, 'Penjualan Toko', '', 0, 4, 'd', 0, 0, 1, 0),
(18, 5000, 'Pembelian', '', 0, 5, 'd', 0, 0, 0, 0),
(19, 5111, 'Produk Dalam Proses - BBB', '', 0, 5, 'd', 0, 0, 0, 0),
(20, 5112, 'Produk Dalam Proses - BTK', '', 0, 5, 'd', 0, 0, 0, 0),
(21, 5113, 'Produk Dalam Proses - BOP', '', 0, 5, 'd', 0, 0, 0, 0),
(22, 5134, 'BOP Tetap Sesungguhnya', '', 0, 5, 'd', 0, 0, 0, 0),
(23, 5135, 'BOP Sesungguhnya', '', 0, 5, 'd', 0, 0, 0, 0),
(24, 5211, 'Beban Administrasi dan Umum Variabel', '', 0, 5, 'd', 0, 0, 0, 0),
(25, 5212, 'Beban Pemasaran Variabel', '', 0, 5, 'd', 0, 0, 0, 0),
(26, 5213, 'Beban Angkut Penjualan', '', 0, 5, 'd', 0, 1, 0, 0),
(27, 5221, 'Beban Listrik, Air dan Telepon', '', 0, 5, 'd', 1, 0, 0, 1),
(28, 5222, 'Beban Administrasi dan Umum Tetap', '', 0, 5, 'd', 1, 0, 0, 0),
(29, 5223, 'Beban Pemasaran Tetap', '', 0, 5, 'd', 0, 0, 0, 0),
(30, 5311, 'Beban Upah dan Gaji', '', 0, 5, 'd', 0, 0, 0, 0),
(31, 5312, 'BOP Dibebankan', '', 0, 5, 'd', 0, 0, 0, 0),
(32, 6111, 'Harga Pokok Penjualan IPS', '', 0, 6, 'd', 0, 0, 0, 0),
(33, 6112, 'Harga Pokok Penjualan Toko', '', 0, 6, 'd', 0, 0, 0, 0),
(34, 5228, 'Beban Penyusutan Kendaraan ', '', 0, 5, 'd', 1, 0, 0, 0),
(35, 1125, 'Akumulasi Penyusutan Kendaraan', '', 0, 1, 'd', 0, 0, 0, 0),
(36, 1214, 'Kendaraan', '', 0, 1, 'd', 0, 0, 0, 0),
(37, 5224, 'Beban Perbaikan', '', 0, 5, 'd', 1, 1, 0, 0),
(38, 4113, 'Penjualan Susu', '', 0, 4, 'd', 1, 0, 1, 0),
(39, 4114, 'Penjualan Pakan Konsentrat', '', 0, 4, 'd', 1, 0, 1, 0),
(40, 4115, 'Penjualan Pengolahan Susu', '', 0, 4, 'd', 1, 0, 1, 0),
(41, 4116, 'Penjualan Waserda', '', 0, 4, 'd', 1, 0, 1, 1),
(42, 9999, 'testtt', '', 1998, 9, 'k', 0, 0, 0, 0),
(43, 1998, 'Piutang Kredit', '', 0, 1, 'd', 0, 0, 0, 0),
(44, 1411, 'Persediaan Barang Dagang Susu', '', 0, 1, 'd', 0, 0, 0, 0),
(45, 1412, 'Persediaan Barang Dagang Pakan Konsentrat', '', 0, 1, 'd', 0, 0, 0, 0),
(46, 1413, 'Persediaan Barang Dagang Susu Olahan', '', 0, 1, 'd', 0, 0, 0, 0),
(47, 6113, 'Harga Pokok Penjualan', '', 0, 6, 'd', 1, 0, 0, 1),
(48, 4211, 'SHU', '', 0, 4, 'd', 0, 0, 0, 0),
(49, 5313, 'Beban Reparasi Kendaraan', '', 0, 5, 'k', 0, 0, 0, 1),
(50, 5314, 'Beban Transportasi', '', 0, 5, 'k', 0, 0, 0, 1),
(51, 5400, 'Beban Lembur', '', 0, 5, 'd', 0, 0, 0, 0),
(52, 1414, 'Pers. Barang Dagang', '', 0, 1, 'd', 0, 0, 0, 0),
(53, 2130, 'PPN Masukan', '', 0, 2, 'd', 0, 0, 0, 0),
(54, 2140, 'PPN Keluaran', '', 0, 2, 'd', 0, 0, 0, 0),
(55, 1116, 'Bank', '', 0, 1, 'd', 0, 0, 0, 0),
(56, 1117, 'Kas Kecil', '', 0, 1, 'd', 0, 0, 0, 0);

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
(1, 1, '2', 'masuk', '15:11:05', 'Presensi Masuk'),
(2, 1, '4', 'masuk', '15:11:38', 'Presensi Masuk'),
(3, 1, '2', 'masuk', '15:13:48', 'Presensi Keluar'),
(4, 1, '4', 'masuk', '15:13:55', 'Presensi Keluar'),
(5, 2, '2635346361', 'masuk', '22:31:43', 'Presensi Masuk'),
(6, 2, '2635346361', 'masuk', '22:31:48', 'Presensi Keluar'),
(7, 3, '44', 'masuk', '13:12:27', 'Presensi Masuk'),
(8, 3, '44', 'masuk', '13:14:24', 'Presensi Keluar'),
(9, 4, '44', 'masuk', '10:43:13', 'Presensi Masuk'),
(10, 5, '44', 'masuk', '10:14:55', 'Presensi Masuk'),
(11, 5, '44', 'masuk', '10:14:58', 'Presensi Keluar'),
(12, 6, '1029384756', 'masuk', '11:02:28', 'Presensi Masuk'),
(13, 6, '1029384756', 'masuk', '11:03:51', 'Presensi Keluar'),
(14, 7, '111', 'masuk', '13:05:37', 'Presensi Masuk'),
(15, 7, '111', 'masuk', '13:05:41', 'Presensi Keluar');

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

--
-- Dumping data for table `detail_pembayaran`
--

INSERT INTO `detail_pembayaran` (`no_trans`, `no_coa`, `subtotal`, `jenis_penjualan`) VALUES
('PMBY_001', '5228', '23000', 'ips');

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

--
-- Dumping data for table `detail_pembayaranv`
--

INSERT INTO `detail_pembayaranv` (`no_trans`, `no_coa`, `tarif`, `jumlah`, `subtotal`, `jenis_penjualan`) VALUES
('PMBYV_000', '5211', '0', '0', '0', 'PR_001'),
('PMBYV_000', '5211', '0', '0', '0', 'PR_002'),
('PMBYV_000', '5211', '0', '0', '0', 'PR_003'),
('PMBYV_000', '5211', '0', '0', '0', 'PR_004'),
('PMBYV_000', '5211', '0', '0', '0', 'PR_005'),
('PMBYV_000', '5211', '0', '0', '0', 'PR_006'),
('PMBYV_000', '5211', '0', '0', '0', 'PR_007'),
('PMBYV_000', '5211', '0', '0', '0', 'PR_008'),
('PMBYV_000', '5211', '0', '0', '0', 'PR_009'),
('PMBYV_000', '5212', '0', '0', '0', 'PR_001'),
('PMBYV_000', '5212', '0', '0', '0', 'PR_002'),
('PMBYV_000', '5212', '0', '0', '0', 'PR_003'),
('PMBYV_000', '5212', '0', '0', '0', 'PR_004'),
('PMBYV_000', '5212', '0', '0', '0', 'PR_005'),
('PMBYV_000', '5212', '0', '0', '0', 'PR_006'),
('PMBYV_000', '5212', '0', '0', '0', 'PR_007'),
('PMBYV_000', '5212', '0', '0', '0', 'PR_008'),
('PMBYV_000', '5212', '0', '0', '0', 'PR_009'),
('PMBYV_000', '5213', '0', '0', '0', 'PR_001');

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
(36, 'PMBAST20210703013', 'AS-14', 'SPA-01', 6000000, 0, '6000000', '3000000', '9', '12', '0000-00-00', '2021-09', '2021-08', 'IDA-024', 1);

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
(1, 'PMB_001', 'BB_001', 130, '3000', 390000, 'PTRNK_031'),
(2, 'PMB_002', 'BB_001', 130, '3000', 390000, 'PTRNK_031'),
(3, 'PMB_002', 'BB_001', 100, '2500', 250000, 'PTRNK_031'),
(4, 'PMB_003', 'BB_001', 75, '3000', 225000, 'PTRNK_031'),
(5, 'PMB_003', 'BB_001', 75, '3500', 262500, 'PTRNK_031'),
(6, 'PMB_004', 'BB_001', 125, '3500', 437500, 'PTRNK_031'),
(7, 'PMB_005', 'BB_001', 50, '2500', 125000, 'PTRNK_031'),
(8, 'PMB_005', 'BB_001', 50, '3000', 150000, 'PTRNK_031'),
(9, 'PMB_005', 'BB_001', 50, '3500', 175000, 'PTRNK_031'),
(10, 'PMB_006', 'BB_001', 85, '3000', 255000, 'PTRNK_031'),
(11, 'PMB_006', 'BB_001', 65, '3200', 208000, 'PTRNK_031'),
(12, 'PMB_007', 'BB_001', 150, '3000', 450000, 'PTRNK_031'),
(13, 'PMB_008', 'BB_001', 100, '3000', 300000, 'PTRNK_031'),
(14, 'PMB_008', 'BB_001', 50, '3500', 175000, 'PTRNK_031'),
(15, 'PMB_009', 'BB_001', 55, '3500', 192500, 'PTRNK_031'),
(16, 'PMB_009', 'BB_001', 95, '3000', 285000, 'PTRNK_031'),
(17, 'PMB_010', 'BB_001', 150, '3200', 480000, 'PTRNK_031'),
(18, 'PMB_011', 'BB_001', 75, '4000', 300000, 'PTRNK_031'),
(19, 'PMB_012', 'BB_001', 50, '3000', 150000, 'PTRNK_031'),
(20, 'PMB_012', 'BB_001', 75, '3500', 262500, 'PTRNK_031'),
(21, 'PMB_013', 'BB_001', 77, '3000', 231000, 'PTRNK_031'),
(22, 'PMB_013', 'BB_001', 23, '3200', 73600, 'PTRNK_031'),
(23, 'PMB_014', 'BB_001', 90, '3000', 270000, 'PTRNK_031'),
(24, 'PMB_014', 'BB_001', 60, '40', 2400, 'PTRNK_031'),
(25, 'PMB_015', 'BB_001', 150, '3500', 525000, 'PTRNK_031'),
(26, 'PMB_016', 'BB_001', 30, '3000', 90000, 'PTRNK_031'),
(27, 'PMB_016', 'BB_001', 65, '3500', 227500, 'PTRNK_031'),
(28, 'PMB_017', 'BB_001', 85, '3000', 255000, 'PTRNK_031'),
(29, 'PMB_018', 'BB_001', 100, '3000', 300000, 'PTRNK_031'),
(30, 'PMB_019', 'BB_001', 100, '3000', 300000, 'PTRNK_031'),
(31, 'PMB_020', 'BB_001', 100, '3000', 300000, 'PTRNK_031'),
(32, 'PMB_021', 'BB_001', 120, '3000', 360000, 'PTRNK_031'),
(33, 'PMB_022', 'BB_001', 50, '4000', 200000, 'PTRNK_031'),
(34, 'PMB_023', 'BB_001', 20, '3000', 60000, 'PTRNK_031'),
(35, 'PMB_024', 'BB_001', 100, '3000', 300000, 'PTRNK_031'),
(36, 'PMB_025', 'BB_001', 45, '3000', 135000, 'PTRNK_031'),
(37, 'PMB_026', 'BB_001', 100, '3000', 300000, 'PTRNK_031'),
(38, 'PMB_027', 'BB_001', 100, '3000', 300000, 'PTRNK_027'),
(39, 'PMB_028', 'BB_001', 150, '3500', 525000, 'PTRNK_031'),
(40, 'PMB_029', 'BB_001', 50, '5000', 250000, 'PTRNK_031'),
(41, 'PMB_030', 'BB_001', 50, '3000', 150000, 'PTRNK_031'),
(42, 'PMB_031', 'BB_001', 10, '3000', 30000, 'PTRNK_031'),
(43, 'PMB_032', 'BB_001', 75, '3000', 225000, 'PTRNK_031'),
(44, 'PMB_033', 'BB_001', 90, '3000', 270000, 'PTRNK_031'),
(45, 'PMB_033', 'BB_001', 45, '3500', 157500, 'PTRNK_031'),
(46, 'PMB_034', 'BB_001', 65, '3000', 195000, 'PTRNK_031'),
(47, 'PMB_035', 'BB_001', 45, '3000', 135000, 'PTRNK_031'),
(48, 'PMB_036', 'BB_001', 50, '3000', 150000, 'PTRNK_031'),
(49, 'PMB_037', 'BB_001', 50, '5000', 250000, 'PTRNK_031'),
(50, 'PMB_038', 'BB_001', 12, '1000', 12000, 'PTRNK_031'),
(51, 'PMB_039', 'BB_001', 50, '3000', 150000, 'PTRNK_031'),
(52, 'PMB_040', 'BB_001', 25, '3000', 75000, 'PTRNK_031'),
(53, 'PMB_041', 'BB_001', 20, '3000', 60000, 'PTRNK_031'),
(54, 'PMB_042', 'BB_001', 100, '3000', 300000, 'PTRNK_031'),
(55, 'PMB_043', 'BB_001', 75, '3000', 225000, 'PTRNK_035'),
(56, 'PMB_043', 'BB_001', 35, '4000', 140000, 'PTRNK_035'),
(57, 'PMB_044', 'BB_001', 100, '2500', 250000, 'PTRNK_035'),
(58, 'PMB_045', 'BB_001', 75, '3000', 225000, 'PTRNK_035'),
(59, 'PMB_045', 'BB_001', 20, '3500', 70000, 'PTRNK_035'),
(60, 'PMB_046', 'BB_001', 65, '3000', 195000, 'PTRNK_035'),
(61, 'PMB_047', 'BB_001', 50, '3000', 150000, 'PTRNK_035'),
(62, 'PMB_048', 'BB_001', 125, '3000', 375000, 'PTRNK_035'),
(63, 'PMB_049', 'BB_001', 90, '4000', 360000, 'PTRNK_035'),
(64, 'PMB_050', 'BB_001', 55, '4000', 220000, 'PTRNK_035'),
(66, 'PMB_051', 'BB_001', 33, '3000', 99000, 'PTRNK_035'),
(67, 'PMB_052', 'BB_001', 100, '3000', 300000, 'PTRNK_035'),
(68, 'PMB_053', 'BB_001', 75, '3000', 225000, 'PTRNK_035'),
(69, 'PMB_054', 'BB_001', 55, '3000', 165000, 'PTRNK_035'),
(70, 'PMB_055', 'BB_001', 90, '3000', 270000, 'PTRNK_035'),
(71, 'PMB_056', 'BB_001', 65, '3000', 195000, 'PTRNK_035'),
(72, 'PMB_057', 'BB_001', 75, '3000', 225000, 'PTRNK_035'),
(73, 'PMB_058', 'BB_001', 150, '3000', 450000, 'PTRNK_035'),
(74, 'PMB_059', 'BB_001', 50, '3000', 150000, 'PTRNK_035'),
(75, 'PMB_060', 'BB_001', 100, '3000', 300000, 'PTRNK_035'),
(76, 'PMB_061', 'BB_001', 5, '3000', 15000, 'PTRNK_035'),
(77, 'PMB_062', 'BB_001', 10, '3000', 30000, 'PTRNK_019'),
(78, 'PMB_063', 'BB_001', 150, '3000', 450000, 'PTRNK_035'),
(79, 'PMB_064', 'BB_001', 100, '3500', 350000, 'PTRNK_036'),
(80, 'PMB_065', 'BB_001', 50, '3000', 150000, 'PTRNK_035'),
(81, 'PMB_066', 'BB_001', 100, '3500', 350000, 'PTRNK_016'),
(82, 'PMB_067', 'BB_001', 100, '4500', 450000, 'PTRNK_016'),
(83, 'PMB_068', 'BB_001', 150, '100', 15000, 'PTRNK_016'),
(84, 'PMB_068', 'BB_001', 500, '5000', 2500000, 'PTRNK_016'),
(85, 'PMB_069', 'BB_001', 400, '4500', 1800000, 'PTRNK_021'),
(86, 'PMB_069', 'BB_001', 50, '3500', 175000, 'PTRNK_021'),
(87, 'PMB_070', 'BB_001', 100, '5700', 570000, 'PTRNK_037'),
(88, 'PMB_071', 'BB_001', 50, '5700', 285000, 'PTRNK_038'),
(89, 'PMB_072', 'BB_001', 30, '5700', 171000, 'PTRNK_039');

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
  `id` int(20) NOT NULL,
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
(6, 'testing jurnal', '1111', 'Kas', 'Penerimaan Kas', 500000, 'd'),
(7, 'testing jurnal', '1312', 'Persediaan Produk Jadi Toko', 'Aaaa', 500000, 'k'),
(0, '123', '5111', 'Produk Dalam Proses - BBB', 'test', 1000, 'd'),
(0, '111', '1117', 'Kas Kecil', 'Penerimaan Kas', 10000000, 'd'),
(0, '111', '1111', 'Kas', 'Penerimaan Kas', 10000000, 'k'),
(0, '414', '5221', 'Beban Listrik, Air dan Telepon', 'Pengeluaran Kas', 500000, 'd'),
(0, '414', '1117', 'Kas Kecil', 'Pengeluaran Kas', 500000, 'k'),
(0, '4232', '5221', 'Beban Listrik, Air dan Telepon', 'Pengeluaran Kas', 300000, 'd'),
(0, '2314', '5221', 'Beban Listrik, Air dan Telepon', 'Pengeluaran Kas', 300000, 'd'),
(0, '2314', '1117', 'Kas Kecil', 'Pengeluaran Kas', 300000, 'k');

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
(1, 'SHU20220001', 'Cadangan koperasi', 6462298),
(2, 'SHU20220001', 'Jasa anggota', 4038937),
(3, 'SHU20220001', 'Jasa modal', 3231149),
(4, 'SHU20220001', 'Jasa lain-lain', 2423362),
(5, 'SHU20220002', 'Cadangan koperasi', 6401655),
(6, 'SHU20220002', 'Jasa anggota', 4001034),
(7, 'SHU20220002', 'Jasa modal', 3200827),
(8, 'SHU20220002', 'Jasa lain-lain', 2400621);

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
(1, '123123123', '2', '2021-10-25', '2021-10-31', 'asd', 'admin', 1),
(2, '1234', '2', '2021-10-25', '2021-10-31', 'asd', 'admin', 1),
(3, '1236', '2', '2021-10-25', '2021-10-31', 'asd', 'admin', 1),
(4, '123', '1', '2021-10-25', '2021-10-31', 'dsadsd', 'admin', 1),
(5, '1235', '1', '2021-10-25', '2021-10-31', 'dsadsd', 'admin', 1),
(6, '123123123', '2', '2021-11-02', '2021-11-02', 'telat masukin', 'admin', 1),
(7, '44', '1', '2021-11-21', '2021-11-30', 'Shift Pagi', 'admin', 1),
(8, '44', '1', '2021-12-05', '2021-12-05', '', 'admin', 1),
(9, '44', '1', '2021-12-08', '2021-12-08', 'asd', 'admin', 1),
(10, '1029384756', '1', '2021-12-30', '2021-12-31', 'test', 'admin', 1),
(11, '111', '1', '2022-05-08', '2022-05-08', '', NULL, 1),
(20, '111', '1', '2022-06-21', '2022-06-21', 'aa', 'admin', 0);

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
  `nominal` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jurnal`
--

INSERT INTO `jurnal` (`no`, `id_jurnal`, `tgl_jurnal`, `no_coa`, `posisi_dr_cr`, `nominal`) VALUES
(1, 'KPSBUPMB280522003', '2022-05-28', 1414, 'd', 15000),
(2, 'KPSBUPMB280522003', '2022-05-28', 2130, 'd', 1500),
(3, 'KPSBUPMB280522003', '2022-05-28', 1111, 'k', 16500),
(4, 'KPSBUPMB010622006', '2022-06-01', 1111, 'd', 36300),
(5, 'KPSBUPMB010622006', '2022-06-01', 4116, 'k', 36300),
(6, 'KPSBUPMB010622004', '2022-06-01', 1111, 'd', 16500),
(7, 'KPSBUPMB010622004', '2022-06-01', 4116, 'k', 16500),
(8, 'PMBWASERDA010622007', '2022-06-01', 1414, 'd', 34500),
(9, 'PMBWASERDA010622007', '2022-06-01', 2130, 'd', 3450),
(10, 'PMBWASERDA010622007', '2022-06-01', 1111, 'k', 37950),
(11, 'PMBWASERDA010622007', '2022-06-01', 1414, 'd', 34500),
(12, 'PMBWASERDA010622007', '2022-06-01', 2130, 'd', 3450),
(13, 'PMBWASERDA010622007', '2022-06-01', 1111, 'k', 37950),
(14, 'PMBWASERDA010622008', '2022-06-01', 1414, 'd', 34250),
(15, 'PMBWASERDA010622008', '2022-06-01', 2130, 'd', 3425),
(16, 'PMBWASERDA010622008', '2022-06-01', 1111, 'k', 37675),
(17, 'PMBWASERDA010622008', '2022-06-01', 1414, 'd', 34250),
(18, 'PMBWASERDA010622008', '2022-06-01', 2130, 'd', 3425),
(19, 'PMBWASERDA010622008', '2022-06-01', 1111, 'k', 37675),
(20, 'PMBWASERDA010622011', '2022-06-01', 1414, 'd', 58000),
(21, 'PMBWASERDA010622011', '2022-06-01', 2130, 'd', 5800),
(22, 'PMBWASERDA010622011', '2022-06-01', 1111, 'k', 63800),
(23, 'PNJWASERDA010622004', '2022-06-01', 1111, 'd', 11000),
(24, 'PNJWASERDA010622004', '2022-06-01', 4116, 'k', 11000),
(25, 'PNJWASERDA010622006', '2022-06-01', 1111, 'd', 55000),
(26, 'PNJWASERDA010622006', '2022-06-01', 2140, 'd', 5500),
(27, 'PNJWASERDA010622006', '2022-06-01', 4116, 'k', 60500),
(28, 'PNJWASERDA010622006', '2022-06-01', 6113, 'd', 30000),
(29, 'PNJWASERDA010622006', '2022-06-01', 1414, 'k', 30000),
(30, 'PNJWASERDA010622007', '2022-06-01', 1111, 'd', 35000),
(31, 'PNJWASERDA010622007', '2022-06-01', 2140, 'd', 3500),
(32, 'PNJWASERDA010622007', '2022-06-01', 4116, 'k', 38500),
(33, 'PNJWASERDA010622007', '2022-06-01', 6113, 'd', 35000),
(34, 'PNJWASERDA010622007', '2022-06-01', 1414, 'k', 35000),
(35, 'PNJWASERDA010622009', '2022-06-01', 1111, 'd', 29500),
(36, 'PNJWASERDA010622009', '2022-06-01', 2140, 'd', 2950),
(37, 'PNJWASERDA010622009', '2022-06-01', 4116, 'k', 32450),
(38, 'PNJWASERDA010622009', '2022-06-01', 6113, 'd', 29500),
(39, 'PNJWASERDA010622009', '2022-06-01', 1414, 'k', 29500),
(40, 'PNJWASERDA010622011', '2022-06-01', 1998, 'd', 20000),
(41, 'PNJWASERDA010622011', '2022-06-01', 2140, 'd', 2000),
(42, 'PNJWASERDA010622011', '2022-06-01', 4116, 'k', 22000),
(43, 'PNJWASERDA010622011', '2022-06-01', 6113, 'd', 20000),
(44, 'PNJWASERDA010622011', '2022-06-01', 1414, 'k', 20000),
(45, 'PNJWASERDA150622026', '2022-06-15', 1111, 'd', 60000),
(46, 'PNJWASERDA150622026', '2022-06-15', 2140, 'k', 1375),
(47, 'PNJWASERDA150622026', '2022-06-15', 4116, 'k', 12500),
(48, 'PNJWASERDA150622026', '2022-06-15', 6113, 'd', 8750),
(49, 'PNJWASERDA150622026', '2022-06-15', 1414, 'k', 8750),
(50, 'PNJWASERDA150622020', '2022-06-16', 1998, 'd', 2220),
(51, 'PNJWASERDA150622020', '2022-06-16', 2140, 'k', 220),
(52, 'PNJWASERDA150622020', '2022-06-16', 4116, 'k', 2000),
(53, 'PNJWASERDA150622020', '2022-06-16', 6113, 'd', 1500),
(54, 'PNJWASERDA150622020', '2022-06-16', 1414, 'k', 1500),
(55, 'PNJWASERDA160622027', '2022-06-16', 1111, 'd', 10000),
(56, 'PNJWASERDA160622027', '2022-06-16', 2140, 'k', 660),
(57, 'PNJWASERDA160622027', '2022-06-16', 4116, 'k', 6660),
(58, 'PNJWASERDA160622027', '2022-06-16', 6113, 'd', 4500),
(59, 'PNJWASERDA160622027', '2022-06-16', 1414, 'k', 4500),
(60, 'PNJWASERDA160622029', '2022-06-16', 1111, 'd', 30000),
(61, 'PNJWASERDA160622029', '2022-06-16', 2140, 'k', 2750),
(62, 'PNJWASERDA160622029', '2022-06-16', 4116, 'k', 27750),
(63, 'PNJWASERDA160622029', '2022-06-16', 6113, 'd', 17500),
(64, 'PNJWASERDA160622029', '2022-06-16', 1414, 'k', 17500),
(65, 'PNJWASERDA160622030', '2022-06-16', 1111, 'd', 2500),
(66, 'PNJWASERDA160622030', '2022-06-16', 2140, 'k', 275),
(67, 'PNJWASERDA160622030', '2022-06-16', 4116, 'k', 2775),
(68, 'PNJWASERDA160622030', '2022-06-16', 6113, 'd', 1750),
(69, 'PNJWASERDA160622030', '2022-06-16', 1414, 'k', 1750),
(70, 'DPPTRNK_037', '2022-06-18', 1111, 'd', 25000),
(71, 'DPPTRNK_037', '2022-06-18', 3111, 'k', 25000),
(72, 'DPPTRNK_038', '2022-06-18', 1111, 'd', 25000),
(73, 'DPPTRNK_038', '2022-06-18', 3111, 'k', 25000),
(74, 'DPPTRNK_039', '2022-06-18', 1111, 'd', 25000),
(75, 'DPPTRNK_039', '2022-06-18', 3111, 'k', 25000),
(76, 'PMB_070', '2022-06-18', 1112, 'd', 570000),
(77, 'PMB_070', '2022-06-18', 2111, 'k', 570000),
(78, 'PMB_071', '2022-06-18', 1112, 'd', 285000),
(79, 'PMB_071', '2022-06-18', 2111, 'k', 285000),
(80, 'PMB_072', '2022-06-18', 1112, 'd', 171000),
(81, 'PMB_072', '2022-06-18', 2111, 'k', 171000),
(82, 'PMBS-020720220005', '2022-07-02', 2111, 'd', 570000),
(83, 'PMBS-020720220005', '2022-07-02', 1111, 'k', 558000),
(84, 'PMBS-020720220005', '2022-07-02', 3112, 'k', 2000),
(85, 'PMBS-020720220005', '2022-07-02', 3113, 'k', 10000),
(86, 'PMBS-020720220006', '2022-07-02', 2111, 'd', 285000),
(87, 'PMBS-020720220006', '2022-07-02', 1111, 'k', 274000),
(88, 'PMBS-020720220006', '2022-07-02', 3112, 'k', 1000),
(89, 'PMBS-020720220006', '2022-07-02', 3113, 'k', 10000),
(90, 'PMBS-020720220007', '2022-07-02', 2111, 'd', 171000),
(91, 'PMBS-020720220007', '2022-07-02', 1111, 'k', 160400),
(92, 'PMBS-020720220007', '2022-07-02', 3112, 'k', 600),
(93, 'PMBS-020720220007', '2022-07-02', 3113, 'k', 10000),
(94, 'PNJS20220702005', '2022-07-02', 1111, 'd', 700000),
(95, 'PNJS20220702005', '2022-07-02', 4113, 'k', 700000),
(96, 'PNJS20220702006', '2022-07-02', 1111, 'd', 350000),
(97, 'PNJS20220702006', '2022-07-02', 4113, 'k', 350000),
(98, 'HPP-0004', '2022-06-18', 6113, 'd', 10000000),
(99, 'HPP-0004', '2022-06-18', 1413, 'k', 10000000),
(100, 'HPP-0005', '2022-06-18', 6113, 'd', 5000000),
(101, 'HPP-0005', '2022-06-18', 1413, 'k', 5000000),
(102, 'PMBG.SHU20220001', '2022-06-18', 4211, 'd', 430801),
(103, 'PMBG.SHU20220001', '2022-06-18', 1111, 'k', 430801),
(104, 'PMBG.SHU20220003', '2022-06-18', 4211, 'd', 291248),
(105, 'PMBG.SHU20220003', '2022-06-18', 1111, 'k', 291248),
(106, 'PMBWASERDA170622019', '2022-06-18', 1414, 'd', 8750),
(107, 'PMBWASERDA170622019', '2022-06-18', 2130, 'd', 963),
(108, 'PMBWASERDA170622019', '2022-06-18', 1111, 'k', 9713),
(109, 'PMBWASERDA170622016', '2022-06-18', 1414, 'd', 5250),
(110, 'PMBWASERDA170622016', '2022-06-18', 2130, 'd', 578),
(111, 'PMBWASERDA170622016', '2022-06-18', 1111, 'k', 5828),
(112, 'PMBWASERDA170622017', '2022-06-18', 1414, 'd', 1750),
(113, 'PMBWASERDA170622017', '2022-06-18', 2130, 'd', 193),
(114, 'PMBWASERDA170622017', '2022-06-18', 1111, 'k', 1943),
(115, 'PMBWASERDA170622018', '2022-06-18', 1414, 'd', 17500),
(116, 'PMBWASERDA170622018', '2022-06-18', 2130, 'd', 1925),
(117, 'PMBWASERDA170622018', '2022-06-18', 1111, 'k', 19425),
(118, 'PNJWASERDA170622031', '2022-06-18', 1111, 'd', 5000),
(119, 'PNJWASERDA170622031', '2022-06-18', 2140, 'k', 550),
(120, 'PNJWASERDA170622031', '2022-06-18', 4116, 'k', 5550),
(121, 'PNJWASERDA170622031', '2022-06-18', 6113, 'd', 3500),
(122, 'PNJWASERDA170622031', '2022-06-18', 1414, 'k', 3500),
(123, 'PNJWASERDA170622032', '2022-06-18', 1111, 'd', 2500),
(124, 'PNJWASERDA170622032', '2022-06-18', 2140, 'k', 275),
(125, 'PNJWASERDA170622032', '2022-06-18', 4116, 'k', 2775),
(126, 'PNJWASERDA170622032', '2022-06-18', 6113, 'd', 1750),
(127, 'PNJWASERDA170622032', '2022-06-18', 1414, 'k', 1750),
(128, 'PNJWASERDA170622033', '2022-06-18', 1111, 'd', 22500),
(129, 'PNJWASERDA170622033', '2022-06-18', 2140, 'k', 2475),
(130, 'PNJWASERDA170622033', '2022-06-18', 4116, 'k', 24975),
(131, 'PNJWASERDA170622033', '2022-06-18', 6113, 'd', 15750),
(132, 'PNJWASERDA170622033', '2022-06-18', 1414, 'k', 15750),
(133, 'PMBWASERDA160622015', '2022-06-18', 1414, 'd', 8750),
(134, 'PMBWASERDA160622015', '2022-06-18', 2130, 'd', 963),
(135, 'PMBWASERDA160622015', '2022-06-18', 1111, 'k', 9713),
(136, 'PNJWASERDA160622028', '2022-06-18', 1111, 'd', 2500),
(137, 'PNJWASERDA160622028', '2022-06-18', 2140, 'k', 275),
(138, 'PNJWASERDA160622028', '2022-06-18', 4116, 'k', 2775),
(139, 'PNJWASERDA160622028', '2022-06-18', 6113, 'd', 1750),
(140, 'PNJWASERDA160622028', '2022-06-18', 1414, 'k', 1750),
(141, 'PNJWASERDA150622021', '2022-06-18', 1111, 'd', 2000),
(142, 'PNJWASERDA150622021', '2022-06-18', 2140, 'k', 220),
(143, 'PNJWASERDA150622021', '2022-06-18', 4116, 'k', 2220),
(144, 'PNJWASERDA150622021', '2022-06-18', 6113, 'd', 1500),
(145, 'PNJWASERDA150622021', '2022-06-18', 1414, 'k', 1500),
(146, 'PNJWASERDA150622022', '2022-06-18', 1111, 'd', 2000),
(147, 'PNJWASERDA150622022', '2022-06-18', 2140, 'k', 220),
(148, 'PNJWASERDA150622022', '2022-06-18', 4116, 'k', 2220),
(149, 'PNJWASERDA150622022', '2022-06-18', 6113, 'd', 1500),
(150, 'PNJWASERDA150622022', '2022-06-18', 1414, 'k', 1500),
(151, 'PNJWASERDA150622023', '2022-06-18', 1111, 'd', 2000),
(152, 'PNJWASERDA150622023', '2022-06-18', 2140, 'k', 220),
(153, 'PNJWASERDA150622023', '2022-06-18', 4116, 'k', 2220),
(154, 'PNJWASERDA150622023', '2022-06-18', 6113, 'd', 1500),
(155, 'PNJWASERDA150622023', '2022-06-18', 1414, 'k', 1500),
(156, 'PNJWASERDA150622024', '2022-06-18', 1111, 'd', 2500),
(157, 'PNJWASERDA150622024', '2022-06-18', 2140, 'k', 275),
(158, 'PNJWASERDA150622024', '2022-06-18', 4116, 'k', 2775),
(159, 'PNJWASERDA150622024', '2022-06-18', 6113, 'd', 1750),
(160, 'PNJWASERDA150622024', '2022-06-18', 1414, 'k', 1750),
(161, 'PMBWASERDA150622012', '2022-06-18', 1414, 'd', 5000),
(162, 'PMBWASERDA150622012', '2022-06-18', 2130, 'd', 550),
(163, 'PMBWASERDA150622012', '2022-06-18', 1111, 'k', 5550),
(164, 'PMBWASERDA150622013', '2022-06-18', 1414, 'd', 1750),
(165, 'PMBWASERDA150622013', '2022-06-18', 2130, 'd', 193),
(166, 'PMBWASERDA150622013', '2022-06-18', 1111, 'k', 1943),
(167, 'PMBWASERDA150622014', '2022-06-18', 1414, 'd', 6750),
(168, 'PMBWASERDA150622014', '2022-06-18', 2130, 'd', 743),
(169, 'PMBWASERDA150622014', '2022-06-18', 1111, 'k', 7493),
(170, 'PNJWASERDA150622025', '2022-06-18', 1111, 'd', 4500),
(171, 'PNJWASERDA150622025', '2022-06-18', 2140, 'k', 495),
(172, 'PNJWASERDA150622025', '2022-06-18', 4116, 'k', 4995),
(173, 'PNJWASERDA150622025', '2022-06-18', 6113, 'd', 3250),
(174, 'PNJWASERDA150622025', '2022-06-18', 1414, 'k', 3250),
(175, 'PNJWASERDA140622012', '2022-06-18', 1111, 'd', 2500),
(176, 'PNJWASERDA140622012', '2022-06-18', 2140, 'k', 275),
(177, 'PNJWASERDA140622012', '2022-06-18', 4116, 'k', 2775),
(178, 'PNJWASERDA140622012', '2022-06-18', 6113, 'd', 1750),
(179, 'PNJWASERDA140622012', '2022-06-18', 1414, 'k', 1750),
(180, 'PNJWASERDA140622013', '2022-06-18', 1111, 'd', 5000),
(181, 'PNJWASERDA140622013', '2022-06-18', 2140, 'k', 550),
(182, 'PNJWASERDA140622013', '2022-06-18', 4116, 'k', 5550),
(183, 'PNJWASERDA140622013', '2022-06-18', 6113, 'd', 3500),
(184, 'PNJWASERDA140622013', '2022-06-18', 1414, 'k', 3500),
(185, 'PNJWASERDA140622014', '2022-06-18', 1111, 'd', 2500),
(186, 'PNJWASERDA140622014', '2022-06-18', 2140, 'k', 275),
(187, 'PNJWASERDA140622014', '2022-06-18', 4116, 'k', 2775),
(188, 'PNJWASERDA140622014', '2022-06-18', 6113, 'd', 1750),
(189, 'PNJWASERDA140622014', '2022-06-18', 1414, 'k', 1750),
(190, 'PNJWASERDA140622015', '2022-06-18', 1998, 'd', 6000),
(191, 'PNJWASERDA140622015', '2022-06-18', 2140, 'k', 660),
(192, 'PNJWASERDA140622015', '2022-06-18', 4116, 'k', 6660),
(193, 'PNJWASERDA140622015', '2022-06-18', 6113, 'd', 4500),
(194, 'PNJWASERDA140622015', '2022-06-18', 1414, 'k', 4500),
(195, 'PNJWASERDA140622016', '2022-06-18', 1111, 'd', 2500),
(196, 'PNJWASERDA140622016', '2022-06-18', 2140, 'k', 275),
(197, 'PNJWASERDA140622016', '2022-06-18', 4116, 'k', 2775),
(198, 'PNJWASERDA140622016', '2022-06-18', 6113, 'd', 1750),
(199, 'PNJWASERDA140622016', '2022-06-18', 1414, 'k', 1750),
(200, 'PNJWASERDA140622017', '2022-06-18', 1111, 'd', 10000),
(201, 'PNJWASERDA140622017', '2022-06-18', 2140, 'k', 1100),
(202, 'PNJWASERDA140622017', '2022-06-18', 4116, 'k', 11100),
(203, 'PNJWASERDA140622017', '2022-06-18', 6113, 'd', 7000),
(204, 'PNJWASERDA140622017', '2022-06-18', 1414, 'k', 7000),
(205, 'PNJWASERDA140622018', '2022-06-18', 1998, 'd', 2500),
(206, 'PNJWASERDA140622018', '2022-06-18', 2140, 'k', 275),
(207, 'PNJWASERDA140622018', '2022-06-18', 4116, 'k', 2775),
(208, 'PNJWASERDA140622018', '2022-06-18', 6113, 'd', 1750),
(209, 'PNJWASERDA140622018', '2022-06-18', 1414, 'k', 1750),
(210, 'PNJWASERDA140622019', '2022-06-18', 1998, 'd', 2000),
(211, 'PNJWASERDA140622019', '2022-06-18', 2140, 'k', 220),
(212, 'PNJWASERDA140622019', '2022-06-18', 4116, 'k', 2220),
(213, 'PNJWASERDA140622019', '2022-06-18', 6113, 'd', 1500),
(214, 'PNJWASERDA140622019', '2022-06-18', 1414, 'k', 1500),
(215, 'PNJWASERDA010622008', '2022-06-18', 1111, 'd', 2500),
(216, 'PNJWASERDA010622008', '2022-06-18', 2140, 'k', 250),
(217, 'PNJWASERDA010622008', '2022-06-18', 4116, 'k', 2750),
(218, 'PNJWASERDA010622008', '2022-06-18', 6113, 'd', 1750),
(219, 'PNJWASERDA010622008', '2022-06-18', 1414, 'k', 1750),
(220, 'PMBWASERDA010622009', '2022-06-18', 1414, 'd', 39000),
(221, 'PMBWASERDA010622009', '2022-06-18', 2130, 'd', 3900),
(222, 'PMBWASERDA010622009', '2022-06-18', 1111, 'k', 42900),
(223, 'PNJWASERDA010622005', '2022-06-18', 1111, 'd', 50000),
(224, 'PNJWASERDA010622005', '2022-06-18', 2140, 'k', 5000),
(225, 'PNJWASERDA010622005', '2022-06-18', 4116, 'k', 55000),
(226, 'PNJWASERDA010622005', '2022-06-18', 6113, 'd', 40000),
(227, 'PNJWASERDA010622005', '2022-06-18', 1414, 'k', 40000),
(228, 'GAJI-004', '2022-05-28', 5311, 'd', 7429000),
(229, 'GAJI-004', '2022-05-28', 1111, 'k', 7429000),
(230, 'GAJI-005', '2022-05-28', 5311, 'd', 7429000),
(231, 'GAJI-005', '2022-05-28', 1111, 'k', 7429000),
(232, 'GAJI-006', '2022-05-28', 5311, 'd', 7429000),
(233, 'GAJI-006', '2022-05-28', 1111, 'k', 7429000),
(234, 'GAJI-007', '2022-05-28', 5311, 'd', 7429000),
(235, 'GAJI-007', '2022-05-28', 1111, 'k', 7429000),
(236, 'GAJI-008', '2022-05-28', 5311, 'd', 7429000),
(237, 'GAJI-008', '2022-05-28', 1111, 'k', 7429000),
(238, 'GAJI-003', '2022-05-28', 5311, 'd', 7429000),
(239, 'GAJI-003', '2022-05-28', 1111, 'k', 7429000),
(240, 'GAJI-003', '2022-05-28', 5311, 'd', 7429000),
(241, 'GAJI-003', '2022-05-28', 1111, 'k', 7429000),
(242, 'GAJI-004', '2022-05-28', 5311, 'd', 7429000),
(243, 'GAJI-004', '2022-05-28', 1111, 'k', 7429000),
(244, 'GAJI-004', '2022-05-28', 5311, 'd', 7429000),
(245, 'GAJI-004', '2022-05-28', 1111, 'k', 7429000),
(246, 'GAJI-003', '2022-05-28', 5311, 'd', 7429000),
(247, 'GAJI-003', '2022-05-28', 1111, 'k', 7429000),
(248, 'GAJI-003', '2022-05-28', 5311, 'd', 7429000),
(249, 'GAJI-003', '2022-05-28', 1111, 'k', 7429000),
(250, 'GAJI-003', '2022-05-28', 5311, 'd', 7429000),
(251, 'GAJI-003', '2022-05-28', 1111, 'k', 7429000),
(252, 'GAJI-004', '2022-05-28', 5311, 'd', 7429000),
(253, 'GAJI-004', '2022-05-28', 1111, 'k', 7429000),
(254, 'GAJI-003', '2022-05-28', 5311, 'd', 7429000),
(255, 'GAJI-003', '2022-05-28', 1111, 'k', 7429000),
(256, 'GAJI-003', '2022-05-28', 5311, 'd', 7600000),
(257, 'GAJI-003', '2022-05-28', 1111, 'k', 7600000),
(258, 'GAJI-003', '2022-05-28', 5311, 'd', 7429000),
(259, 'GAJI-003', '2022-05-28', 1111, 'k', 7429000),
(260, 'GAJI-011', '2022-05-28', 5311, 'd', 7429000),
(261, 'GAJI-011', '2022-05-28', 1111, 'k', 7429000),
(262, 'GAJI-010', '2022-05-28', 5311, 'd', 7429000),
(263, 'GAJI-010', '2022-05-28', 1111, 'k', 7429000),
(264, 'GAJI-009', '2022-05-28', 5311, 'd', 7429000),
(265, 'GAJI-009', '2022-05-28', 1111, 'k', 7429000),
(266, 'GAJI-008', '2022-05-28', 5311, 'd', 7429000),
(267, 'GAJI-008', '2022-05-28', 1111, 'k', 7429000),
(268, 'GAJI-007', '2022-05-28', 5311, 'd', 7429000),
(269, 'GAJI-007', '2022-05-28', 1111, 'k', 7429000),
(270, 'GAJI-006', '2022-05-28', 5311, 'd', 7429000),
(271, 'GAJI-006', '2022-05-28', 1111, 'k', 7429000),
(272, 'GAJI-005', '2022-05-28', 5311, 'd', 7429000),
(273, 'GAJI-005', '2022-05-28', 1111, 'k', 7429000),
(274, 'GAJI-003', '2022-05-28', 5311, 'd', 7429000),
(275, 'GAJI-003', '2022-05-28', 1111, 'k', 7429000),
(276, 'GAJI-003', '2022-05-28', 5311, 'd', 7429000),
(277, 'GAJI-003', '2022-05-28', 1111, 'k', 7429000),
(278, 'GAJI-004', '2022-05-28', 5311, 'd', 7429000),
(279, 'GAJI-004', '2022-05-28', 1111, 'k', 7429000),
(284, 'PMBG.SHU20220002', '2022-06-18', 4211, 'd', 331121),
(285, 'PMBG.SHU20220002', '2022-06-18', 1111, 'k', 331121),
(286, 'PNJWASERDA180622034', '2022-06-18', 1111, 'd', 12500),
(287, 'PNJWASERDA180622034', '2022-06-18', 2140, 'k', 1375),
(288, 'PNJWASERDA180622034', '2022-06-18', 4116, 'k', 13875),
(289, 'PNJWASERDA180622034', '2022-06-18', 6113, 'd', 8750),
(290, 'PNJWASERDA180622034', '2022-06-18', 1414, 'k', 8750),
(291, 'PMB-KR-20220619001', '2022-06-19', 1111, 'd', 2775),
(292, 'PMB-KR-20220619001', '2022-06-19', 1998, 'k', 2775),
(293, 'PNJWASERDA190622036', '2022-06-19', 1998, 'd', 2500),
(294, 'PNJWASERDA190622036', '2022-06-19', 2140, 'k', 275),
(295, 'PNJWASERDA190622036', '2022-06-19', 4116, 'k', 2775),
(296, 'PNJWASERDA190622036', '2022-06-19', 6113, 'd', 1750),
(297, 'PNJWASERDA190622036', '2022-06-19', 1414, 'k', 1750),
(298, 'PNJWASERDA190622035', '2022-06-19', 1998, 'd', 2500),
(299, 'PNJWASERDA190622035', '2022-06-19', 2140, 'k', 275),
(300, 'PNJWASERDA190622035', '2022-06-19', 4116, 'k', 2775),
(301, 'PNJWASERDA190622035', '2022-06-19', 6113, 'd', 1750),
(302, 'PNJWASERDA190622035', '2022-06-19', 1414, 'k', 1750),
(303, 'PMB-KR-20220619002', '2022-06-19', 1111, 'd', 2775),
(304, 'PMB-KR-20220619002', '2022-06-19', 1998, 'k', 2775),
(305, 'PNJWASERDA190622037', '2022-06-19', 1998, 'd', 2500),
(306, 'PNJWASERDA190622037', '2022-06-19', 2140, 'k', 275),
(307, 'PNJWASERDA190622037', '2022-06-19', 4116, 'k', 2775),
(308, 'PNJWASERDA190622037', '2022-06-19', 6113, 'd', 1750),
(309, 'PNJWASERDA190622037', '2022-06-19', 1414, 'k', 1750),
(310, 'PNJWASERDA190622038', '2022-06-19', 1111, 'd', 2500),
(311, 'PNJWASERDA190622038', '2022-06-19', 2140, 'k', 275),
(312, 'PNJWASERDA190622038', '2022-06-19', 4116, 'k', 2775),
(313, 'PNJWASERDA190622038', '2022-06-19', 6113, 'd', 1750),
(314, 'PNJWASERDA190622038', '2022-06-19', 1414, 'k', 1750),
(315, 'PNGBBN20220619001', '2022-06-19', 5221, 'd', 200000),
(316, 'PNGBBN20220619001', '2022-06-19', 1111, 'k', 200000),
(317, 'PNGBBN20220620002', '2022-06-20', 5221, 'd', 100000),
(318, 'PNGBBN20220620002', '2022-06-20', 1111, 'k', 100000),
(319, 'PMBWASERDA190622020', '2022-06-20', 1414, 'd', 8000),
(320, 'PMBWASERDA190622020', '2022-06-20', 2130, 'd', 880),
(321, 'PMBWASERDA190622020', '2022-06-20', 1111, 'k', 8880),
(322, 'PMBWASERDA190622021', '2022-06-20', 1414, 'd', 6750),
(323, 'PMBWASERDA190622021', '2022-06-20', 2130, 'd', 743),
(324, 'PMBWASERDA190622021', '2022-06-20', 1111, 'k', 7493),
(325, 'PMBY_001', '2022-06-20', 5228, 'd', 23000),
(326, 'PMBY_001', '2022-06-20', 1111, 'k', 23000),
(327, 'PNJWASERDA200622040', '2022-06-20', 1111, 'd', 2500),
(328, 'PNJWASERDA200622040', '2022-06-20', 2140, 'k', 275),
(329, 'PNJWASERDA200622040', '2022-06-20', 4116, 'k', 2775),
(330, 'PNJWASERDA200622040', '2022-06-20', 6113, 'd', 1750),
(331, 'PNJWASERDA200622040', '2022-06-20', 1414, 'k', 1750),
(332, 'PNJWASERDA200622041', '2022-06-20', 1998, 'd', 2500),
(333, 'PNJWASERDA200622041', '2022-06-20', 2140, 'k', 275),
(334, 'PNJWASERDA200622041', '2022-06-20', 4116, 'k', 2775),
(335, 'PNJWASERDA200622041', '2022-06-20', 6113, 'd', 1750),
(336, 'PNJWASERDA200622041', '2022-06-20', 1414, 'k', 1750),
(337, 'PMB-KR-20220620003', '2022-06-20', 1111, 'd', 2775),
(338, 'PMB-KR-20220620003', '2022-06-20', 1998, 'k', 2775),
(339, 'PMBWASERDA200622022', '2022-06-20', 1414, 'd', 1750),
(340, 'PMBWASERDA200622022', '2022-06-20', 2130, 'd', 193),
(341, 'PMBWASERDA200622022', '2022-06-20', 1111, 'k', 1943),
(342, 'PNGBBN20220620003', '2022-06-20', 5221, 'd', 250000),
(343, 'PNGBBN20220620003', '2022-06-20', 1111, 'k', 250000),
(344, 'LMBR20220621006', '2022-06-21', 5400, 'd', 20000),
(345, 'LMBR20220621006', '2022-06-21', 1111, 'k', 20000),
(346, 'LMBR20220621004', '2022-06-21', 5400, 'd', 20000),
(347, 'LMBR20220621004', '2022-06-21', 1111, 'k', 20000),
(348, 'LMBR20220621004', '2022-06-21', 5400, 'd', 20000),
(349, 'LMBR20220621004', '2022-06-21', 1111, 'k', 20000),
(350, 'PNJWASERDA200622039', '2022-06-21', 1111, 'd', 2500),
(351, 'PNJWASERDA200622039', '2022-06-21', 2140, 'k', 275),
(352, 'PNJWASERDA200622039', '2022-06-21', 4116, 'k', 2775),
(353, 'PNJWASERDA200622039', '2022-06-21', 6113, 'd', 1750),
(354, 'PNJWASERDA200622039', '2022-06-21', 1414, 'k', 1750),
(355, 'PNJWASERDA200622039', '2022-06-21', 1111, 'd', 2500),
(356, 'PNJWASERDA200622039', '2022-06-21', 2140, 'k', 275),
(357, 'PNJWASERDA200622039', '2022-06-21', 4116, 'k', 2775),
(358, 'PNJWASERDA200622039', '2022-06-21', 6113, 'd', 1750),
(359, 'PNJWASERDA200622039', '2022-06-21', 1414, 'k', 1750),
(360, 'PNJWASERDA200622039', '2022-06-21', 1111, 'd', 2500),
(361, 'PNJWASERDA200622039', '2022-06-21', 2140, 'k', 275),
(362, 'PNJWASERDA200622039', '2022-06-21', 4116, 'k', 2775),
(363, 'PNJWASERDA200622039', '2022-06-21', 6113, 'd', 1750),
(364, 'PNJWASERDA200622039', '2022-06-21', 1414, 'k', 1750),
(365, 'PNJWASERDA200622039', '2022-06-21', 1111, 'd', 2500),
(366, 'PNJWASERDA200622039', '2022-06-21', 2140, 'k', 275),
(367, 'PNJWASERDA200622039', '2022-06-21', 4116, 'k', 2775),
(368, 'PNJWASERDA200622039', '2022-06-21', 6113, 'd', 1750),
(369, 'PNJWASERDA200622039', '2022-06-21', 1414, 'k', 1750),
(370, 'PNJWASERDA200622039', '2022-06-21', 1111, 'd', 2500),
(371, 'PNJWASERDA200622039', '2022-06-21', 2140, 'k', 275),
(372, 'PNJWASERDA200622039', '2022-06-21', 4116, 'k', 2775),
(373, 'PNJWASERDA200622039', '2022-06-21', 6113, 'd', 1750),
(374, 'PNJWASERDA200622039', '2022-06-21', 1414, 'k', 1750),
(375, 'PNJWASERDA200622039', '2022-06-21', 1111, 'd', 2500),
(376, 'PNJWASERDA200622039', '2022-06-21', 2140, 'k', 275),
(377, 'PNJWASERDA200622039', '2022-06-21', 4116, 'k', 2775),
(378, 'PNJWASERDA200622039', '2022-06-21', 6113, 'd', 1750),
(379, 'PNJWASERDA200622039', '2022-06-21', 1414, 'k', 1750),
(380, 'PNJWASERDA200622039', '2022-06-21', 1111, 'd', 2500),
(381, 'PNJWASERDA200622039', '2022-06-21', 2140, 'k', 275),
(382, 'PNJWASERDA200622039', '2022-06-21', 4116, 'k', 2775),
(383, 'PNJWASERDA200622039', '2022-06-21', 6113, 'd', 1750),
(384, 'PNJWASERDA200622039', '2022-06-21', 1414, 'k', 1750),
(385, 'PNJWASERDA200622039', '2022-06-21', 1111, 'd', 2500),
(386, 'PNJWASERDA200622039', '2022-06-21', 2140, 'k', 275),
(387, 'PNJWASERDA200622039', '2022-06-21', 4116, 'k', 2775),
(388, 'PNJWASERDA200622039', '2022-06-21', 6113, 'd', 1750),
(389, 'PNJWASERDA200622039', '2022-06-21', 1414, 'k', 1750),
(390, 'PNJWASERDA200622039', '2022-06-21', 1111, 'd', 2500),
(391, 'PNJWASERDA200622039', '2022-06-21', 2140, 'k', 275),
(392, 'PNJWASERDA200622039', '2022-06-21', 4116, 'k', 2775),
(393, 'PNJWASERDA200622039', '2022-06-21', 6113, 'd', 1750),
(394, 'PNJWASERDA200622039', '2022-06-21', 1414, 'k', 1750),
(395, 'PNJWASERDA200622039', '2022-06-21', 1111, 'd', 2500),
(396, 'PNJWASERDA200622039', '2022-06-21', 2140, 'k', 275),
(397, 'PNJWASERDA200622039', '2022-06-21', 4116, 'k', 2775),
(398, 'PNJWASERDA200622039', '2022-06-21', 6113, 'd', 1750),
(399, 'PNJWASERDA200622039', '2022-06-21', 1414, 'k', 1750),
(400, 'PNJWASERDA200622039', '2022-06-21', 1111, 'd', 2500),
(401, 'PNJWASERDA200622039', '2022-06-21', 2140, 'k', 275),
(402, 'PNJWASERDA200622039', '2022-06-21', 4116, 'k', 2775),
(403, 'PNJWASERDA200622039', '2022-06-21', 6113, 'd', 1750),
(404, 'PNJWASERDA200622039', '2022-06-21', 1414, 'k', 1750),
(405, 'PNJWASERDA200622039', '2022-06-21', 1111, 'd', 2500),
(406, 'PNJWASERDA200622039', '2022-06-21', 2140, 'k', 275),
(407, 'PNJWASERDA200622039', '2022-06-21', 4116, 'k', 2775),
(408, 'PNJWASERDA200622039', '2022-06-21', 6113, 'd', 1750),
(409, 'PNJWASERDA200622039', '2022-06-21', 1414, 'k', 1750),
(410, 'PNJWASERDA200622039', '2022-06-21', 1111, 'd', 2500),
(411, 'PNJWASERDA200622039', '2022-06-21', 2140, 'k', 275),
(412, 'PNJWASERDA200622039', '2022-06-21', 4116, 'k', 2775),
(413, 'PNJWASERDA200622039', '2022-06-21', 6113, 'd', 1750),
(414, 'PNJWASERDA200622039', '2022-06-21', 1414, 'k', 1750),
(415, 'PNJWASERDA200622044', '2022-06-21', 1998, 'd', 2500),
(416, 'PNJWASERDA200622044', '2022-06-21', 2140, 'k', 275),
(417, 'PNJWASERDA200622044', '2022-06-21', 4116, 'k', 2775),
(418, 'PNJWASERDA200622044', '2022-06-21', 6113, 'd', 1750),
(419, 'PNJWASERDA200622044', '2022-06-21', 1414, 'k', 1750),
(420, 'PNJWASERDA200622043', '2022-06-21', 1111, 'd', 2500),
(421, 'PNJWASERDA200622043', '2022-06-21', 2140, 'k', 275),
(422, 'PNJWASERDA200622043', '2022-06-21', 4116, 'k', 2775),
(423, 'PNJWASERDA200622043', '2022-06-21', 6113, 'd', 1750),
(424, 'PNJWASERDA200622043', '2022-06-21', 1414, 'k', 1750),
(425, 'PNJWASERDA200622042', '2022-06-21', 1111, 'd', 2500),
(426, 'PNJWASERDA200622042', '2022-06-21', 2140, 'k', 275),
(427, 'PNJWASERDA200622042', '2022-06-21', 4116, 'k', 2775),
(428, 'PNJWASERDA200622042', '2022-06-21', 6113, 'd', 1750),
(429, 'PNJWASERDA200622042', '2022-06-21', 1414, 'k', 1750),
(430, 'PNJWASERDA200622042', '2022-06-21', 1111, 'd', 2500),
(431, 'PNJWASERDA200622042', '2022-06-21', 2140, 'k', 275),
(432, 'PNJWASERDA200622042', '2022-06-21', 4116, 'k', 2775),
(433, 'PNJWASERDA200622042', '2022-06-21', 6113, 'd', 1750),
(434, 'PNJWASERDA200622042', '2022-06-21', 1414, 'k', 1750),
(435, 'PNJWASERDA200622042', '2022-06-21', 1111, 'd', 2500),
(436, 'PNJWASERDA200622042', '2022-06-21', 2140, 'k', 275),
(437, 'PNJWASERDA200622042', '2022-06-21', 4116, 'k', 2775),
(438, 'PNJWASERDA200622042', '2022-06-21', 6113, 'd', 1750),
(439, 'PNJWASERDA200622042', '2022-06-21', 1414, 'k', 1750),
(440, 'PNJWASERDA200622039', '2022-06-21', 1111, 'd', 2500),
(441, 'PNJWASERDA200622039', '2022-06-21', 2140, 'k', 275),
(442, 'PNJWASERDA200622039', '2022-06-21', 4116, 'k', 2775),
(443, 'PNJWASERDA200622039', '2022-06-21', 6113, 'd', 1750),
(444, 'PNJWASERDA200622039', '2022-06-21', 1414, 'k', 1750),
(445, '123', '2022-06-22', 5111, 'd', 1000),
(446, 'BPNRM20220622003', '2022-06-22', 116, 'd', 10000000),
(447, 'BPNRM20220622004', '2022-06-22', 1116, 'd', 10000000),
(448, 'BPNG20220622005', '2022-06-22', 1116, 'k', 5000000),
(449, '111', '2022-06-22', 1117, 'd', 10000000),
(450, '111', '2022-06-22', 1111, 'k', 10000000),
(451, '414', '2022-06-22', 5221, 'd', 500000),
(452, '414', '2022-06-22', 1117, 'k', 500000),
(453, '4232', '2022-06-22', 5221, 'd', 300000),
(454, '2314', '2022-06-22', 5221, 'd', 300000),
(455, '2314', '2022-06-22', 1117, 'k', 300000);

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
(1, '2022-06-17 12:00:12', 'WSP001', 'in', 1),
(2, '2022-06-17 14:06:23', 'WSP001', 'in', 10),
(3, '2022-06-17 14:12:24', 'WSP001', 'out', 2),
(4, '2022-06-17 15:22:17', 'WSP001', 'in', 5),
(5, '2022-06-17 15:54:04', 'WSP001', 'out', 1),
(6, '2022-06-17 18:10:09', 'WSP001', 'out', 9),
(7, '2022-06-18 18:48:41', 'WSP001', 'out', 5),
(8, '2022-06-19 00:01:55', 'WSP001', 'out', 1),
(9, '2022-06-19 00:02:30', 'WSP001', 'out', 1),
(10, '2022-06-19 00:25:01', 'WSP001', 'out', 1),
(11, '2022-06-19 00:27:59', 'WSP001', 'out', 1),
(12, '2022-06-19 00:40:31', 'WSP001', 'in', 2),
(13, '2022-06-19 00:40:31', 'WSP003', 'in', 3),
(14, '2022-06-19 00:43:11', 'WSP001', 'in', 3),
(15, '2022-06-19 00:43:11', 'WSP003', 'in', 1),
(16, '2022-06-20 06:27:54', 'WSP001', 'out', 1),
(17, '2022-06-20 16:03:53', 'WSP001', 'out', 1),
(18, '2022-06-20 16:04:17', 'WSP001', 'out', 1),
(19, '2022-06-20 16:06:22', 'WSP001', 'out', 1),
(20, '2022-06-20 16:07:49', 'WSP001', 'out', 1),
(21, '2022-06-20 16:07:58', 'WSP001', 'out', 1),
(22, '2022-06-20 16:09:11', 'WSP001', 'out', 1),
(23, '2022-06-20 16:13:09', 'WSP001', 'out', 1),
(24, '2022-06-20 16:14:03', 'WSP001', 'out', 1),
(25, '2022-06-20 16:20:26', 'WSP001', 'out', 1),
(26, '2022-06-20 16:22:12', 'WSP001', 'out', 1),
(27, '2022-06-20 16:24:30', 'WSP001', 'out', 1),
(28, '2022-06-20 16:26:12', 'WSP001', 'out', 1),
(29, '2022-06-20 16:28:27', 'WSP001', 'out', 1),
(30, '2022-06-20 16:38:54', 'WSP001', 'out', 1),
(31, '2022-06-20 16:39:35', 'WSP001', 'out', 1),
(32, '2022-06-20 16:56:04', 'WSP001', 'out', 1),
(33, '2022-06-20 17:00:36', 'WSP001', 'in', 1),
(34, '2022-06-20 17:13:05', 'WSP001', 'out', 1),
(35, '2022-06-20 17:16:27', 'WSP001', 'out', 1),
(36, '2022-06-20 17:19:25', 'WSP001', 'out', 1),
(37, '2022-06-20 17:20:03', 'WSP001', 'out', 1),
(38, '2022-06-20 17:26:38', 'WSP001', 'out', 1),
(39, '2022-06-22 00:06:11', 'WSP002', 'in', 15),
(40, '2022-06-22 00:07:53', 'WSP002', 'out', 3),
(41, '2022-06-22 00:08:12', 'WSP002', 'out', 2),
(42, '2022-06-22 00:12:36', 'WSP002', 'in', 10),
(43, '2022-06-22 00:24:30', 'WSP002', 'out', 12),
(44, '2022-06-22 00:49:04', 'WSP002', 'out', 1);

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
(61, 'PMBS-020720220007', 'PTRNK_039', 30, 171000, 10000, 600, 0, 0, 160400);

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
(27, 'PNY20210903019', 'IDA-024', 5250000);

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
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id`, `id_jabatan`, `id_ptkp`, `id_jenis_pegawai`, `pendidikan`, `rfid`, `nip`, `npwp`, `nama`, `alamat`, `no_telp`, `tempat_lahir`, `tgl_lahir`, `nama_bank`, `no_rek`, `status`, `status_kredit`, `created_at`) VALUES
(1, 'Staff', '0', '0', NULL, '2635346361', '123123123', '', 'Data Test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(2, 'Staff', '0', '0', NULL, '1', '123', '', 'Testing 2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(3, 'Staff', '0', '0', NULL, '2', '1234', '', 'Testing 3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(4, 'Staff', '0', '0', NULL, '3', '1235', '', 'Testing 4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(5, 'Staff', '0', '0', NULL, '4', '1236', '', 'Testing 5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(6, 'Staff', '1', 'Tetap', NULL, '44', '44', '', 'Ale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(7, 'Staff', '0', '0', NULL, '55', '55', '', 'Siti', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(8, 'Staff', '', 'Kontrak', NULL, '111', '111', '111111', 'Heni', 'Bandung', '0898998989', 'Bandung', '1998-03-01', 'Mandiri', '11223321', '1', 1, '2021-12-04 11:17:34'),
(9, 'Staff', 'TK0', 'Tetap', NULL, '1029384756', '1029384756', '1029384756', 'Jadi andri aja namanya', 'bandung', '1029384756', 'bandung', '1991-03-03', 'BCA', '123123123', '1', 1, '2021-12-15 07:10:28'),
(10, 'Staff', '', 'Kontrak', NULL, '3321', '1495301221757', '102022293391', 'test data', 'test', '01929381283', 'bekasi', '1998-12-12', 'BRI', '1233211', '1', 0, '2021-12-30 04:33:04');

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
  `sisa_hasil_usaha` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembagian_shu`
--

INSERT INTO `pembagian_shu` (`id`, `tanggal`, `id_trans`, `id_anggota`, `jasa_modal`, `jasa_anggota`, `sisa_hasil_usaha`) VALUES
(1, '2022-06-18', 'PMBG.SHU20220001', 'PTRNK_037', 244664, 186137, 430801),
(2, '2022-06-18', 'PMBG.SHU20220002', 'PTRNK_038', 238052, 93069, 331121),
(3, '2022-06-18', 'PMBG.SHU20220003', 'PTRNK_039', 235407, 55841, 291248);

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

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`no_trans`, `tgl_trans`, `total`, `status`) VALUES
('PMBY_001', '2022-06-20', '23000', '1');

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

--
-- Dumping data for table `pembayaranv`
--

INSERT INTO `pembayaranv` (`no_trans`, `tgl_trans`, `no_trans_penj`, `status`, `total`) VALUES
('PMBYV_000', '0000-00-00', '0', '1', '0');

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
('PMBS-010120210002', 450000, '2021-01-01', 1),
('PMBS-020220210002', 462000, '2021-02-02', 1),
('PMBS-020420200003', 183700, '2020-04-02', 1),
('PMBS-020720220005', 558000, '2022-07-02', 1),
('PMBS-020720220006', 274000, '2022-07-02', 1),
('PMBS-020720220007', 160400, '2022-07-02', 1),
('PMBS-021120200002', 625400, '2020-11-02', 1),
('PMBS-021220200002', 425000, '2020-12-02', 1),
('PMBS-040220220003', 2492000, '2022-02-04', 1),
('PMBS-040320210002', 467000, '2021-03-04', 1),
('PMBS-040520200003', 362500, '2020-05-04', 1),
('PMBS-050420210002', 400000, '2021-04-05', 1),
('PMBS-050620200003', 208900, '2020-06-05', 1),
('PMBS-050820210003', 258000, '2021-08-05', 1),
('PMBS-060120220002', 364800, '2022-01-06', 1),
('PMBS-060520210002', 781400, '2021-05-06', 1),
('PMBS-070220220002', 273100, '2022-02-07', 1),
('PMBS-071220210002', 19800, '2021-12-07', 1),
('PMBS-080420220002', 34500, '2022-04-08', 1),
('PMBS-080720200003', 288000, '2020-07-08', 1),
('PMBS-081020210002', 124100, '2021-10-08', 1),
('PMBS-090320220002', 1760, '2022-03-09', 1),
('PMBS-100520210002', 512000, '2021-05-10', 1),
('PMBS-100820200003', 153900, '2020-08-10', 1),
('PMBS-110920200003', 183700, '2020-09-11', 1),
('PMBS-120520220002', 288000, '2022-05-12', 1),
('PMBS-120820210002', 247600, '2021-08-12', 1),
('PMBS-141020200003', 437000, '2020-10-14', 1),
('PMBS-150720210003', 338000, '2021-07-15', 1),
('PMBS-160120200002', 352800, '2020-01-16', 1),
('PMBS-160720210002', 188000, '2021-07-16', 1),
('PMBS-170220200003', 283100, '2020-02-17', 1),
('PMBS-170220210002', 464500, '2021-02-17', 1),
('PMBS-170420200003', 139000, '2020-04-17', 1),
('PMBS-171120200002', 474500, '2020-11-17', 1),
('PMBS-171220200002', 437000, '2020-12-17', 1),
('PMBS-180120210002', 437000, '2021-01-18', 1),
('PMBS-190320210002', 288500, '2021-03-19', 1),
('PMBS-200120220003', 438000, '2022-01-20', 1),
('PMBS-200120220004', 1956000, '2022-01-20', 1),
('PMBS-200420210002', 292600, '2021-04-20', 1),
('PMBS-200520200003', 348200, '2020-05-20', 1),
('PMBS-210120220002', 133700, '2022-01-21', 1),
('PMBS-210720210003', 139000, '2021-07-21', 1),
('PMBS-220220220002', 209000, '2022-02-22', 1),
('PMBS-220620200003', 88340, '2020-06-22', 1),
('PMBS-221120210002', 89000, '2021-11-22', 1),
('PMBS-221220210002', 163500, '2021-12-22', 1),
('PMBS-240320220002', 109000, '2022-03-24', 1),
('PMBS-240720200003', 213500, '2020-07-24', 1),
('PMBS-240920210002', 188000, '2021-09-24', 1),
('PMBS-250420220002', 19600, '2022-04-25', 1),
('PMBS-260520210002', 305600, '2021-05-26', 1),
('PMBS-260820200003', 258200, '2020-08-26', 1),
('PMBS-270720210002', 188000, '2021-07-27', 1),
('PMBS-270820210002', 89000, '2021-08-27', 1),
('PMBS-270820210003', 407000, '2021-08-27', 1),
('PMBS-280920200003', 213500, '2020-09-28', 1),
('PMBS-290620210002', 288000, '2021-06-29', 1),
('PMBS-301020200001', 377400, '2020-10-30', 1),
('PMBS-310120200002', 238000, '2020-01-31', 1);

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
('PMBAST20201225001', 'NOTA20201225001', '8650000', 'selesai', '2020-12-25'),
('PMBAST20201226002', 'NOTA20201226002', '7650000', 'selesai', '2020-12-26'),
('PMBAST20210102003', 'NOTA20210102003', '123246246', 'selesai', '2021-01-02'),
('PMBAST20210217004', 'NOTA20210217004', '41000000', 'selesai', '2021-05-23'),
('PMBAST20210523005', 'NOTA20210523005', '270000000', 'selesai', '2021-05-23'),
('PMBAST20210608006', 'NOTA20210608006', '135000000', 'selesai', '2021-06-08'),
('PMBAST20210608007', 'NOTA20210608007', '270000000', 'selesai', '2021-06-08'),
('PMBAST20210616008', 'NOTA20210616008', '2200000', 'selesai', '2021-06-16'),
('PMBAST20210616009', 'NOTA20210616009', '369369738', 'selesai', '2021-06-16'),
('PMBAST20210617010', 'NOTA20210617010', '1100000', 'selesai', '2021-06-17'),
('PMBAST20210621011', 'NOTA20210621011', '1100000', 'selesai', '2021-06-21'),
('PMBAST20210702012', 'NOTA20210702012', '5000000', 'selesai', '2021-07-02'),
('PMBAST20210703013', 'NOTA20210703013', '6000000', 'selesai', '2021-07-03'),
('PMBAST20211022014', 'NOTA20211022014', '0', 'dalam proses', '0000-00-00');

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
(1, 'PMB_001', '2020-10-16', 390000, '1', 0),
(2, 'PMB_002', '2020-10-19', 640000, '1', 0),
(3, 'PMB_003', '2020-11-03', 487500, '1', 0),
(4, 'PMB_004', '2020-11-18', 437500, '1', 0),
(5, 'PMB_005', '2020-12-03', 450000, '1', 0),
(6, 'PMB_006', '2020-12-18', 463000, '1', 0),
(7, 'PMB_007', '2021-01-04', 450000, '1', 0),
(8, 'PMB_008', '2021-01-19', 475000, '1', 0),
(9, 'PMB_009', '2021-02-03', 477500, '1', 0),
(10, 'PMB_010', '2021-02-18', 480000, '1', 0),
(11, 'PMB_011', '2021-03-05', 300000, '1', 0),
(12, 'PMB_012', '2021-03-22', 412500, '1', 0),
(13, 'PMB_013', '2021-04-06', 304600, '1', 0),
(14, 'PMB_014', '2021-04-22', 272400, '1', 0),
(15, 'PMB_015', '2021-04-26', 525000, '1', 0),
(16, 'PMB_016', '2021-05-12', 317500, '1', 0),
(17, 'PMB_017', '2021-06-28', 255000, '1', 0),
(18, 'PMB_018', '2021-07-02', 300000, '1', 0),
(19, 'PMB_019', '2021-06-29', 300000, '1', 0),
(20, 'PMB_020', '2021-07-13', 300000, '1', 0),
(21, 'PMB_021', '2021-07-29', 360000, '1', 0),
(22, 'PMB_022', '2021-08-13', 200000, '1', 0),
(23, 'PMB_023', '2021-08-27', 60000, '1', 0),
(24, 'PMB_024', '2021-09-10', 300000, '1', 0),
(25, 'PMB_025', '2021-09-24', 135000, '1', 0),
(26, 'PMB_026', '2021-06-29', 300000, '1', 0),
(27, 'PMB_027', '2021-06-15', 300000, '1', 0),
(28, 'PMB_028', '2021-06-30', 525000, '1', 0),
(29, 'PMB_029', '2021-10-09', 250000, '1', 0),
(30, 'PMB_030', '2021-11-08', 150000, '1', 0),
(31, 'PMB_031', '2021-11-23', 30000, '1', 0),
(32, 'PMB_032', '2021-12-08', 225000, '1', 0),
(33, 'PMB_033', '2021-12-23', 427500, '1', 0),
(34, 'PMB_034', '2022-01-07', 195000, '1', 0),
(35, 'PMB_035', '2022-01-24', 135000, '1', 0),
(36, 'PMB_036', '2022-01-24', 150000, '1', 0),
(37, 'PMB_037', '2022-02-08', 250000, '1', 0),
(38, 'PMB_038', '2022-02-23', 12000, '1', 0),
(39, 'PMB_039', '2022-03-10', 150000, '1', 0),
(40, 'PMB_040', '2022-03-25', 75000, '1', 0),
(41, 'PMB_041', '2022-04-11', 60000, '1', 0),
(42, 'PMB_042', '2022-04-28', 300000, '1', 0),
(43, 'PMB_043', '2020-01-02', 365000, '1', 0),
(44, 'PMB_044', '2020-01-17', 250000, '1', 0),
(45, 'PMB_045', '2020-02-03', 295000, '1', 0),
(46, 'PMB_046', '2020-03-19', 195000, '1', 0),
(47, 'PMB_047', '2020-04-03', 150000, '1', 0),
(48, 'PMB_048', '2020-04-20', 375000, '1', 0),
(49, 'PMB_049', '2020-05-06', 360000, '1', 0),
(50, 'PMB_050', '2020-05-22', 220000, '1', 0),
(51, 'PMB_051', '2020-06-08', 99000, '1', 0),
(52, 'PMB_052', '2020-06-24', 300000, '1', 0),
(53, 'PMB_053', '2020-07-10', 225000, '1', 0),
(54, 'PMB_054', '2020-07-27', 165000, '1', 0),
(55, 'PMB_055', '2020-08-12', 270000, '1', 0),
(56, 'PMB_056', '2020-08-28', 195000, '1', 0),
(57, 'PMB_057', '2020-09-14', 225000, '1', 0),
(58, 'PMB_058', '2020-09-30', 450000, '1', 0),
(59, 'PMB_059', '2021-07-07', 150000, '1', 0),
(60, 'PMB_060', '2021-07-22', 300000, '1', 0),
(61, 'PMB_061', '2021-08-09', 15000, '1', 0),
(62, 'PMB_062', '2021-08-23', 30000, '1', 0),
(63, 'PMB_063', '2021-08-13', 450000, '1', 0),
(64, 'PMB_064', '2021-07-01', 350000, '1', 0),
(65, 'PMB_065', '2021-07-23', 150000, '1', 0),
(66, 'PMB_066', '2021-12-02', 350000, '1', 0),
(67, 'PMB_067', '2022-01-06', 450000, '1', 0),
(68, 'PMB_068', '2022-01-21', 2515000, '1', 0),
(69, 'PMB_069', '2022-01-06', 1975000, '1', 0),
(70, 'PMB_070', '2022-06-18', 570000, '1', 0),
(71, 'PMB_071', '2022-06-18', 285000, '1', 0),
(72, 'PMB_072', '2022-06-18', 171000, '1', 0);

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

--
-- Dumping data for table `penerimaan_kas`
--

INSERT INTO `penerimaan_kas` (`id`, `id_penerimaan`, `tanggal`, `sumber`, `jenis_penerimaan`, `jenis_pembayaran`, `nominal`, `bukti_trf`) VALUES
(1, 'PNRM20211214001', '2021-12-14', 'test', 'Penjualan Susu', 'Non Tunai', '20000000', '98994c1933030ef70ed65071c99778ea.jpg'),
(2, 'PNRM20211214002', '2021-12-14', 'test 2', 'Penjualan Susu', 'Non Tunai', '10000000', '98994c1933030ef70ed65071c99778ea1.jpg'),
(3, 'PNRM20220104003', '2022-01-04', 'Penjualan IPS', 'Penjualan IPS', 'Tunai', '4500000', NULL),
(4, 'PNRM20220104004', '2022-01-04', 'Penerimaan Kas', 'Penjualan IPS', 'Tunai', '4500000', NULL),
(5, 'PNRM20220104005', '2022-01-04', 'Penerimaan Kas', 'Penjualan IPS', 'Tunai', '4500000', NULL),
(6, 'PNRM20220104006', '2022-01-04', 'Penerimaan Kas', 'Penjualan IPS', 'Tunai', '4500000', NULL),
(7, 'PNRM20220104007', '2022-01-04', 'Penerimaan Kas', 'Penjualan IPS', 'Tunai', '4500000', NULL);

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
(0, '202206', '2022-06-22', '123', 'pengeluaran kas', 'tunai', 'owno', 'av.png'),
(0, '202206', '2022-06-22', '111', 'penerimaan kas', 'tunai', 'kas kecil', ''),
(0, '202206', '2022-06-22', '414', 'pengeluaran kas', 'tunai', 'biaya listrik', ''),
(0, '202206', '2022-06-22', '4232', 'pengeluaran kas', 'tunai', 'biaya listrik ', ''),
(0, '202206', '2022-06-22', '2314', 'pengeluaran kas', 'tunai', 'biaya listrik', '');

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
(1, 'PENGAJUANBONUS1', '2022-05', 111, 1500000, 'Bonus lebaran', 0),
(2, 'PENGAJUANBONUS2', '2022-05', 111, 2500000, 'BONUSKERJA', 0);

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
(4, 'GAJI-003', '2022-05-28', 7429000, 'selesai', 'penggajian', NULL),
(5, 'GAJI-003', '2022-05-28', 7429000, 'selesai', 'penggajian', NULL),
(6, 'GAJI-003', '2022-05-28', 7429000, 'selesai', 'penggajian', NULL),
(7, 'GAJI-003', NULL, 7429000, 'selesai', 'penggajian', NULL),
(8, 'GAJI-003', NULL, 7429000, 'selesai', 'penggajian', NULL),
(9, 'GAJI-004', '2022-05-28', 7429000, 'selesai', 'penggajian', NULL),
(10, 'GAJI-003', '2022-05-28', 7429000, 'selesai', 'penggajian', NULL),
(11, 'GAJI-003', '2022-05-28', 7429000, 'selesai', 'penggajian', NULL),
(12, 'GAJI-004', '2022-05-28', 7429000, 'selesai', 'penggajian', NULL),
(13, 'GAJI-005', '2022-05-28', 7429000, 'selesai', 'penggajian', NULL),
(14, 'GAJI-006', '2022-05-28', 7429000, 'selesai', 'penggajian', NULL),
(15, 'GAJI-007', '2022-05-28', 7429000, 'selesai', 'penggajian', NULL),
(16, 'GAJI-008', '2022-05-28', 7429000, 'selesai', 'penggajian', NULL),
(17, 'GAJI-003', '2022-05-28', 7429000, 'selesai', 'penggajian', NULL),
(18, 'GAJI-004', '2022-05-28', 7429000, 'selesai', 'penggajian', NULL),
(19, 'GAJI-003', '2022-05-28', 7429000, 'selesai', 'penggajian', NULL),
(20, 'GAJI-004', '2022-05-28', 7429000, 'selesai', 'penggajian', NULL),
(21, 'GAJI-003', '2022-05-28', 7429000, 'selesai', 'penggajian', NULL),
(22, 'GAJI-004', '2022-05-28', 7429000, 'selesai', 'penggajian', NULL),
(23, 'GAJI-005', '2022-05-28', 7429000, 'selesai', 'penggajian', NULL),
(24, 'GAJI-006', '2022-05-28', 7429000, 'selesai', 'penggajian', NULL),
(25, 'GAJI-007', '2022-05-28', 7429000, 'selesai', 'penggajian', NULL),
(26, 'GAJI-008', '2022-05-28', 7429000, 'selesai', 'penggajian', NULL),
(27, 'GAJI-009', '2022-05-28', 7429000, 'selesai', 'penggajian', NULL),
(28, 'GAJI-010', '2022-05-28', 7429000, 'selesai', 'penggajian', NULL),
(29, 'GAJI-011', '2022-05-28', 7429000, 'selesai', 'penggajian', NULL),
(30, 'GAJI-003', '2022-05-28', 7429000, 'selesai', 'penggajian', NULL),
(31, 'GAJI-003', '2022-05-28', 7600000, 'selesai', 'penggajian', NULL),
(32, 'KPSBUPMB010622004', '2022-06-01', 16500, 'selesai', 'Pembelian Barang Waserda', NULL),
(35, 'KPSBUPMB010622006', '2022-06-01', 36300, 'selesai', 'Pembelian Barang Waserda', NULL),
(36, 'PMBWASERDA010622007', '2022-06-01', 37950, 'selesai', 'Pembelian Barang Waserda', NULL),
(37, 'PMBWASERDA010622008', '2022-06-01', 37675, 'selesai', 'Pembelian Barang Waserda', NULL),
(38, 'PMBWASERDA010622009', '2022-06-01', 42900, 'selesai', 'Pembelian Barang Waserda', NULL),
(39, 'PMBWASERDA010622010', '2022-06-01', 192500, 'selesai', 'Pembelian Barang Waserda', NULL),
(40, 'PMBWASERDA010622011', '2022-06-01', 63800, 'selesai', 'Pembelian Barang Waserda', NULL),
(41, 'PNJWASERDA010622004', '2022-06-01', 11000, 'selesai', 'Penjualan Barang Waserda', NULL),
(42, 'PNJWASERDA010622005', '2022-06-01', 55000, 'selesai', 'Penjualan Barang Waserda', NULL),
(43, 'PNJWASERDA010622006', '2022-06-01', 60500, 'selesai', 'Penjualan Barang Waserda', NULL),
(44, 'PNJWASERDA010622007', '2022-06-01', 38500, 'selesai', 'Penjualan Barang Waserda', NULL),
(45, 'PNJWASERDA010622008', '2022-06-01', 2750, 'selesai', 'Penjualan Barang Waserda', NULL),
(46, 'PNJWASERDA010622009', '2022-06-01', 32450, 'selesai', 'Penjualan Barang Waserda', NULL),
(47, 'PNJWASERDA010622011', '2022-06-01', 22000, 'selesai', 'Penjualan Barang Kredit Waserda', NULL),
(48, 'PNJWASERDA140622012', '2022-06-14', 3000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(49, 'PNJWASERDA140622013', '2022-06-14', 10000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(50, 'PNJWASERDA140622014', '2022-06-14', 3000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(51, 'PNJWASERDA140622015', '2022-06-14', 6660, 'selesai', 'Penjualan Barang Kredit Waserda', NULL),
(52, 'PNJWASERDA140622016', '2022-06-14', 5000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(53, 'PNJWASERDA140622017', '2022-06-14', 20000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(54, 'PNJWASERDA140622018', '2022-06-14', 2775, 'selesai', 'Penjualan Barang Kredit Waserda', NULL),
(55, 'PNJWASERDA140622019', '2022-06-14', 2220, 'selesai', 'Penjualan Barang Kredit Waserda', NULL),
(56, 'PNJWASERDA150622020', '2022-06-15', 2220, 'selesai', 'Penjualan Barang Kredit Waserda', NULL),
(57, 'PNJWASERDA150622021', '2022-06-15', 3000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(58, 'PNJWASERDA150622022', '2022-06-15', 50000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(59, 'PNJWASERDA150622023', '2022-06-15', 10000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(60, 'PNJWASERDA150622024', '2022-06-15', 10000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(61, 'PMBWASERDA150622012', '2022-06-15', 5550, 'selesai', 'Pembelian Barang Waserda', NULL),
(62, 'PMBWASERDA150622013', '2022-06-15', 1943, 'selesai', 'Pembelian Barang Waserda', NULL),
(63, 'PMBWASERDA150622014', '2022-06-15', 7493, 'selesai', 'Pembelian Barang Waserda', NULL),
(64, 'PNJWASERDA150622025', '2022-06-15', 10000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(65, 'PNJWASERDA150622026', '2022-06-15', 60000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(66, 'PNJWASERDA160622027', '2022-06-16', 3000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(67, 'PNJWASERDA160622027', '2022-06-16', 3000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(68, 'PNJWASERDA160622027', '2022-06-16', 4440, 'selesai', 'Penjualan Barang Kredit Waserda', NULL),
(69, 'PNJWASERDA160622027', '2022-06-16', 10000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(70, 'PNJWASERDA160622027', '2022-06-16', 10000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(71, 'PNJWASERDA160622027', '2022-06-16', 10000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(72, 'PNJWASERDA160622027', '2022-06-16', 10000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(73, 'PNJWASERDA160622028', '2022-06-16', 10000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(74, 'PNJWASERDA160622029', '2022-06-16', 30000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(75, 'PNJWASERDA160622030', '2022-06-16', 10000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(76, 'PMBWASERDA160622015', '2022-06-16', 9713, 'selesai', 'Pembelian Barang Waserda', NULL),
(77, 'PMBWASERDA170622016', '2022-06-17', 5828, 'selesai', 'Pembelian Barang Waserda', NULL),
(78, 'PMBWASERDA170622017', '2022-06-17', 1943, 'selesai', 'Pembelian Barang Waserda', NULL),
(79, 'PMBWASERDA170622018', '2022-06-17', 19425, 'selesai', 'Pembelian Barang Waserda', NULL),
(80, 'PNJWASERDA170622031', '2022-06-17', 6000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(81, 'PMBWASERDA170622019', '2022-06-17', 9713, 'selesai', 'Pembelian Barang Waserda', NULL),
(82, 'PNJWASERDA170622032', '2022-06-17', 3000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(83, 'PNJWASERDA170622033', '2022-06-17', 30000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(84, 'PMBG.SHU20220001', '2022-06-18', 430801, 'selesai', 'pembagian shu', NULL),
(85, 'PMBG.SHU20220002', '2022-06-18', 331121, 'selesai', 'pembagian shu', NULL),
(86, 'PMBG.SHU20220003', '2022-06-18', 291248, 'selesai', 'pembagian shu', NULL),
(87, 'PNJWASERDA180622034', '2022-06-18', 15000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(88, 'PNJWASERDA190622035', '2022-06-19', 2775, 'selesai', 'Penjualan Barang Kredit Waserda', NULL),
(89, 'PNJWASERDA190622036', '2022-06-19', 2775, 'selesai', 'Penjualan Barang Kredit Waserda', NULL),
(90, 'PMB-KR-20220619001', '2022-06-19', 2775, 'selesai', 'pegawai', NULL),
(91, 'PNJWASERDA190622037', '2022-06-19', 2775, 'selesai', 'Penjualan Barang Kredit Waserda', NULL),
(92, 'PMB-KR-20220619002', '2022-06-19', 2775, 'selesai', 'pegawai', NULL),
(93, 'PNJWASERDA190622038', '2022-06-19', 3000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(94, 'PNGBBN20220619001', '2022-06-19', 200000, 'selesai', 'pengeluaran_beban', NULL),
(95, 'PMBWASERDA190622020', '2022-06-19', 8880, 'selesai', 'Pembelian Barang Waserda', NULL),
(96, 'PMBWASERDA190622021', '2022-06-19', 7493, 'selesai', 'Pembelian Barang Waserda', NULL),
(97, 'PNJWASERDA200622039', '2022-06-20', 2775, 'selesai', 'Penjualan Barang Kredit Waserda', NULL),
(98, 'PNGBBN20220620002', '2022-06-20', 100000, 'selesai', 'pengeluaran_beban', NULL),
(99, 'PNJWASERDA200622039', '2022-06-20', 5000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(100, 'PNJWASERDA200622039', '2022-06-20', 5000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(101, 'PNJWASERDA200622039', '2022-06-20', 5000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(102, 'PNJWASERDA200622039', '2022-06-20', 5000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(103, 'PNJWASERDA200622039', '2022-06-20', 5000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(104, 'PNJWASERDA200622039', '2022-06-20', 5000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(105, 'PNJWASERDA200622039', '2022-06-20', 5000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(106, 'PNJWASERDA200622039', '2022-06-20', 5000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(107, 'PNJWASERDA200622039', '2022-06-20', 5000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(108, 'PNJWASERDA200622039', '2022-06-20', 5000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(109, 'PNJWASERDA200622039', '2022-06-20', 5000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(110, 'PNJWASERDA200622039', '2022-06-20', 5000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(111, 'PNJWASERDA200622039', '2022-06-20', 5000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(112, 'PNJWASERDA200622039', '2022-06-20', 5000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(113, 'PNJWASERDA200622040', '2022-06-20', 5000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(114, 'PNJWASERDA200622041', '2022-06-20', 2775, 'selesai', 'Penjualan Barang Kredit Waserda', NULL),
(115, 'PMB-KR-20220620003', '2022-06-20', 2775, 'selesai', 'peternak', NULL),
(116, 'PMBWASERDA200622022', '2022-06-20', 1943, 'selesai', 'Pembelian Barang Waserda', NULL),
(117, 'PNGBBN20220620003', '2022-06-20', 250000, 'selesai', 'pengeluaran_beban', NULL),
(118, 'PNJWASERDA200622042', '2022-06-20', 5999, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(119, 'PNJWASERDA200622042', '2022-06-20', 5999, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(120, 'PNJWASERDA200622042', '2022-06-20', 5999, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(121, 'PNJWASERDA200622043', '2022-06-20', 5000, 'selesai', 'Penjualan Barang Tunai Waserda', NULL),
(122, 'PNJWASERDA200622044', '2022-06-20', 2775, 'selesai', 'Penjualan Barang Kredit Waserda', NULL),
(123, 'LMBR20220621004', '2022-06-21', 20000, 'selesai', 'pengajuan lembur', NULL),
(124, 'LMBR20220621004', '2022-06-21', 20000, 'selesai', 'pengajuan lembur', NULL),
(125, 'LMBR20220621006', '2022-06-21', 20000, 'selesai', 'pengajuan lembur', NULL),
(126, 'PMBWASERDA220622023', '2022-06-22', 24975, 'pending', 'Pembelian Barang Waserda', 'PMBWASERDA220622023.pdf'),
(127, 'PNJWASERDA220622045', '2022-06-22', 10000, 'pending', 'Penjualan Barang Tunai Waserda', NULL),
(128, 'PNJWASERDA220622046', '2022-06-22', 5000, 'pending', 'Penjualan Barang Tunai Waserda', NULL),
(129, 'PMBWASERDA220622024', '2022-06-22', 16650, 'pending', 'Pembelian Barang Waserda', NULL),
(130, 'PNJWASERDA220622047', '2022-06-22', 30000, 'pending', 'Penjualan Barang Tunai Waserda', NULL),
(131, 'PNJWASERDA220622048', '2022-06-22', 3000, 'pending', 'Penjualan Barang Tunai Waserda', NULL);

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

--
-- Dumping data for table `pengeluaran_kas`
--

INSERT INTO `pengeluaran_kas` (`id`, `id_pengeluaran`, `tanggal`, `sumber_pengeluaran`, `jenis_pengeluaran`, `jenis_pembayaran`, `nominal`, `bukti_trf`) VALUES
(1, 'PNG20211214001', '2021-12-14', 'Test', 'Pembelian', 'Non Tunai', '20000000', 'composer1.png'),
(2, 'PNG20211222002', '2021-12-22', 'test', 'Pembelian', 'Non Tunai', '0', NULL),
(3, 'PNG20211222003', '2021-12-22', 'test', 'Pembelian', 'Non Tunai', '500000', '98994c1933030ef70ed65071c99778ea2.jpg'),
(4, 'PNG20211222004', '2021-12-22', 'test', 'Pembelian', 'Non Tunai', '123123', 'kucing.jpg'),
(5, 'PNG20211222005', '2021-12-22', 'test', 'Pembelian', 'Non Tunai', '123123', 'bukti1.png'),
(6, 'PNG20220104006', '2022-01-04', 'Bayar listrik', 'Beban Listrik, Air dan Telepon', 'Tunai', '250000', NULL),
(7, 'PNG20220104007', '2022-01-04', 'Pengeluaran Kas', 'Pembelian', 'Tunai', '250000', NULL);

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
('PNY20201225001', '2020-12-25', 'IDA-001', 'December 2020', 229166, 0),
('PNY20201225003', '2020-12-25', 'IDA-002', 'December 2020', 137500, 0),
('PNY20201226005', '2020-12-26', 'IDA-003', 'December 2020', 220833, 220833),
('PNY20210102007', '2021-01-02', 'IDA-004', 'January 2021', 5130130, 5130130),
('PNY20210125002', '2021-01-25', 'IDA-001', 'January 2021', 229166, 0),
('PNY20210125004', '2021-01-25', 'IDA-002', 'January 2021', 137500, 0),
('PNY20210126006', '2021-01-26', 'IDA-003', 'January 2021', 220833, 441666),
('PNY20210614008', '2021-06-14', 'IDA-009', 'June 2021', 333333, 333333),
('PNY20210616009', '2021-06-16', 'IDA-020', 'June 2021', 1025001, 1025001),
('PNY20210617011', '2021-06-17', 'IDA-019', 'June 2021', 1025001, 1025001),
('PNY20210617012', '2021-06-17', 'IDA-021', 'June 2021', 83333, 83333),
('PNY20210621015', '2021-06-21', 'IDA-022', 'June 2021', 83333, 83333),
('PNY20210703017', '2021-07-03', 'IDA-024', 'July 2021', 250000, 250000),
('PNY20210716010', '2021-07-16', 'IDA-020', 'July 2021', 1025001, 2050002),
('PNY20210717013', '2021-07-17', 'IDA-021', 'July 2021', 83333, 166666),
('PNY20210721016', '2021-07-21', 'IDA-022', 'July 2021', 83333, 166666),
('PNY20210803018', '2021-08-03', 'IDA-024', 'August 2021', 250000, 500000),
('PNY20210817014', '2021-08-17', 'IDA-021', 'August 2021', 83333, 249999),
('PNY20210903019', '2021-09-03', 'IDA-024', 'September 2021', 250000, 750000);

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
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peternak`
--

INSERT INTO `peternak` (`no_peternak`, `nama_peternak`, `notel`, `alamat`, `deposit`, `pinjaman`, `kd_tps`, `nm_peternakan`, `is_deactive`, `status_kredit`, `create_date`) VALUES
('PTRNK_001', 'Andi', '081297276888', 'Cimahi', NULL, 0, NULL, '', 1, 0, '2021-06-27 07:01:28'),
('PTRNK_002', 'Joko', '0811301180', 'Bandung', NULL, 0, NULL, '', 1, 0, '2021-06-27 07:01:28'),
('PTRNK_003', 'Budi', '082337317510', 'Bandung Barat', NULL, 0, NULL, '', 1, 0, '2021-06-27 07:01:29'),
('PTRNK_004', 'Adi', '082293294071', 'Lembang', NULL, 0, NULL, '', 1, 0, '2021-06-27 07:01:30'),
('PTRNK_005', 'Indra', '082113572468', 'Cimahi', NULL, 0, NULL, '', 1, 0, '2021-06-27 07:01:30'),
('PTRNK_006', 'Asep', '081284871175', 'Padalarang', NULL, 0, NULL, '', 1, 0, '2021-06-27 07:01:31'),
('PTRNK_007', 'Andre', '082117675927', 'Bandung', NULL, 0, NULL, '', 1, 0, '2021-06-27 07:37:00'),
('PTRNK_008', 'Azis', '082285701109', 'Bandung Barat', NULL, 0, NULL, '', 1, 0, '2021-06-27 07:01:32'),
('PTRNK_009', 'Arif', '082170370037', 'Cimahi', NULL, 0, NULL, '', 1, 0, '2021-07-03 17:59:55'),
('PTRNK_010', 'Ibrahim', '082126407059', 'Padalarang', NULL, 0, NULL, '', 1, 0, '2021-07-04 07:06:50'),
('PTRNK_011', 'Agung', '082214902233', 'Bandung', NULL, 0, NULL, '', 0, 1, '2022-06-19 23:27:54'),
('PTRNK_012', 'Adit', '08112009484', 'Lembang', NULL, 0, NULL, '', 1, 0, '2021-06-27 07:01:33'),
('PTRNK_013', 'Gatot', '081295861043', 'Bandung', NULL, 0, NULL, '', 1, 0, '2021-06-27 07:01:33'),
('PTRNK_014', 'Taufiq', '081231197192', 'Cimahi', NULL, 0, NULL, '', 1, 0, '2021-06-27 07:01:35'),
('PTRNK_015', 'Iwan', '081259468020', 'Bandung Barat', NULL, 0, NULL, '', 0, 0, '2022-06-20 09:59:11'),
('PTRNK_016', 'dede', '087877472553', 'bekasi', '25000', 0, NULL, '', 0, 0, '2021-06-23 11:22:17'),
('PTRNK_017', 'assdasdasd', '087877472553', 'asdasd', '25000', 0, NULL, '', 1, 0, '2021-07-06 02:34:49'),
('PTRNK_018', 'Hanni', '123123123', 'Sukabumi', '25000', 0, NULL, '', 0, 0, '2021-06-23 11:22:17'),
('PTRNK_019', 'Andri', '321232123', 'bandung', '25000', 0, NULL, '', 0, 0, '2021-06-23 11:22:17'),
('PTRNK_020', 'testing', '1231231', 'Sukabumi', '25000', 3000000, NULL, '', 1, 0, '2021-07-14 14:55:58'),
('PTRNK_021', 'Test Data', '09829123112', 'ASDS', '25000', 0, 'TPS_001', '', 0, 0, '2021-06-23 11:22:17'),
('PTRNK_022', 'Data untuk testing', '3332211223', 'Bekasi', '25000', 0, NULL, '', 1, 0, '2021-06-27 07:01:35'),
('PTRNK_023', 'Galih', '08756315223', 'jl, cijeruk, lembang selatan', '25000', 693900, 'TPS_003', 'Sumber Susu', 1, 0, '2021-06-27 07:01:45'),
('PTRNK_024', 'Jonas', '08158274222', 'Jl, Cisaat, Lembang', '25000', 0, 'TPS_001', 'Makmur Jaya', 1, 0, '2021-06-27 07:01:36'),
('PTRNK_025', 'Yona', '08225544667', 'jl. ciraray, Lembang ', '25000', 500000, 'TPS_001', 'Abadi Jaya', 0, 0, '2021-06-25 03:42:43'),
('PTRNK_026', 'Tina', '0822516271', 'jl, cirumput, lembang selatan', '25000', 0, 'TPS_003', 'Ternak Bahagia', 1, 0, '2021-06-27 07:01:37'),
('PTRNK_027', 'Ucup', '08951432517', 'jl, cimenyan, lembang', '25000', 0, 'TPS_001', 'Bima Sakti', 1, 0, '2021-08-05 07:27:26'),
('PTRNK_028', 'dds', '1212123123', 'asdasd', '25000', 0, 'TPS_003', 'test', 1, 0, '2020-10-02 15:37:50'),
('PTRNK_029', 'tete', '231321321', 'bandung', '25000', 0, 'TPS_002', 'aaa', 1, 0, '2021-06-27 07:35:06'),
('PTRNK_030', 'astagfir', '12332112322', 'lembang utara', '25000', 0, 'TPS_001', 'aaa', 1, 0, '2021-07-06 15:55:59'),
('PTRNK_031', 'Hanifah ', '082219738419', 'Jl. wijaya kusumah, lembang utara', '25000', 150000, 'TPS_004', 'Berkah Selalu', 0, 0, '2022-02-08 07:51:22'),
('PTRNK_032', 'testingg', '0876525262', 'jalanjalan', '25000', 0, 'TPS_001', 'testingggg', 1, 0, '2021-07-06 18:40:12'),
('PTRNK_033', 'testinglagi', '0822176282', 'coba', '25000', 0, 'TPS_001', 'bismillah', 1, 0, '2021-07-06 18:45:18'),
('PTRNK_034', 'Rozak', '082219765426', 'jl. cibiru', '25000', 0, 'TPS_001', 'Fresh milk', 0, 1, '2021-12-08 13:31:28'),
('PTRNK_035', 'Budi', '08228172615', 'jl. cikidang, lembang selatan', '25000', 150000, 'TPS_003', 'Abadi Ternak', 0, 0, '2021-07-21 06:58:59'),
('PTRNK_036', 'Galih', '082222334455', 'jl. ciaul, lembang', '25000', 0, 'TPS_001', 'Go farm', 0, 0, '2021-07-01 10:26:27'),
('PTRNK_037', 'ani', '123456', 'dwd', '25000', 0, 'TPS_001', 'aji', 0, 0, '2022-06-17 17:48:04'),
('PTRNK_038', 'asdwd', '13241', 'zczc', '25000', 0, 'TPS_001', 'dsdaw', 0, 0, '2022-06-17 17:48:22'),
('PTRNK_039', 'asdf', '3232', 'faw', '25000', 0, 'TPS_001', 'peternakan a', 0, 0, '2022-06-17 17:49:27');

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
(1, 'KPSBUPMB270522001', 'WSS001', 'WSP001', 1500, 100, 'selesai', '2022-06-15'),
(2, 'KPSBUPMB280522002', 'WSS001', 'WSP001', 1500, 10, 'selesai', '2022-06-15'),
(3, 'KPSBUPMB280522003', 'WSS001', 'WSP001', 1500, 10, 'selesai', '2022-06-15'),
(4, 'KPSBUPMB010622004', 'WSS001', 'WSP001', 1500, 10, 'selesai', '2022-06-15'),
(5, 'KPSBUPMB010622005', 'WSS001', 'WSP001', 1500, 2, 'selesai', '2022-06-15'),
(6, 'KPSBUPMB010622005', 'WSS002', 'WSP003', 1500, 11, 'selesai', '2022-06-15'),
(7, 'KPSBUPMB010622006', 'WSS001', 'WSP001', 1500, 10, 'selesai', '2022-06-15'),
(8, 'KPSBUPMB010622006', 'WSS002', 'WSP003', 1500, 12, 'selesai', '2022-06-15'),
(9, 'PMBWASERDA010622007', 'WSS001', 'WSP001', 1500, 12, 'selesai', '2022-06-15'),
(10, 'PMBWASERDA010622007', 'WSS002', 'WSP003', 1500, 11, 'selesai', '2022-06-15'),
(11, 'PMBWASERDA010622008', 'WSS001', 'WSP001', 1750, 11, 'selesai', '2022-06-15'),
(12, 'PMBWASERDA010622008', 'WSS001', 'WSP002', 1500, 10, 'selesai', '2022-06-15'),
(13, 'PMBWASERDA010622009', 'WSS001', 'WSP001', 1750, 12, 'selesai', '2022-06-15'),
(14, 'PMBWASERDA010622009', 'WSS002', 'WSP003', 1500, 12, 'selesai', '2022-06-15'),
(15, 'PMBWASERDA010622010', 'WSS001', 'WSP001', 1750, 10, 'selesai', '2022-06-15'),
(16, 'PMBWASERDA010622010', 'WSS002', 'WSP003', 1500, 5, 'selesai', '2022-06-15'),
(17, 'PMBWASERDA010622010', 'WSS003', 'WSP004', 1500, 100, 'selesai', '2022-06-15'),
(18, 'PMBWASERDA010622011', 'WSS001', 'WSP001', 1750, 10, 'selesai', '2022-06-15'),
(19, 'PMBWASERDA010622011', 'WSS002', 'WSP003', 1500, 15, 'selesai', '2022-06-15'),
(20, 'PMBWASERDA010622011', 'WSS003', 'WSP004', 1500, 12, 'selesai', '2022-06-15'),
(22, 'PMBWASERDA150622012', 'WSS001', 'WSP001', 1750, 2, 'selesai', '2022-06-15'),
(23, 'PMBWASERDA150622012', 'WSS001', 'WSP002', 1500, 1, 'selesai', '2022-06-15'),
(26, 'PMBWASERDA150622013', 'WSS001', 'WSP001', 1750, 1, 'selesai', '2030-06-15'),
(27, 'PMBWASERDA150622014', 'WSS001', 'WSP001', 1750, 3, 'selesai', '2022-06-15'),
(28, 'PMBWASERDA150622014', 'WSS001', 'WSP002', 1500, 1, 'selesai', '2022-06-15'),
(30, 'PMBWASERDA160622015', 'WSS001', 'WSP001', 1750, 5, 'selesai', '2026-01-16'),
(31, 'PMBWASERDA170622016', 'WSS001', 'WSP001', 1750, 3, 'selesai', '2026-01-17'),
(32, 'PMBWASERDA170622017', 'WSS001', 'WSP001', 1750, 1, 'selesai', '2022-06-17'),
(33, 'PMBWASERDA170622018', 'WSS001', 'WSP001', 1750, 10, 'selesai', '2022-06-17'),
(34, 'PMBWASERDA170622019', 'WSS001', 'WSP001', 1750, 5, 'selesai', '2022-06-17'),
(35, 'PMBWASERDA190622020', 'WSS001', 'WSP001', 1750, 2, 'selesai', '2022-06-19'),
(36, 'PMBWASERDA190622020', 'WSS002', 'WSP003', 1500, 3, 'selesai', '2022-06-19'),
(37, 'PMBWASERDA190622021', 'WSS001', 'WSP001', 1750, 3, 'selesai', '2026-01-19'),
(38, 'PMBWASERDA190622021', 'WSS002', 'WSP003', 1500, 1, 'selesai', '2027-01-19'),
(39, 'PMBWASERDA200622022', 'WSS001', 'WSP001', 1750, 1, 'selesai', '2022-06-20'),
(41, 'PMBWASERDA220622023', 'WSS001', 'WSP002', 1500, 15, 'selesai', '2027-01-22'),
(42, 'PMBWASERDA220622024', 'WSS001', 'WSP002', 1500, 10, 'selesai', '2022-06-22');

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
(1, 'KPSBU270522001', 'WSP001', '5', 2000, 'dalam proses'),
(2, 'KPSBU270522002', 'WSP001', '5', 2000, 'dalam proses'),
(5, 'PNJWASERDA010622003', 'WSP001', '10', 2000, 'dalam proses'),
(6, 'PNJWASERDA010622004', 'WSP001', '5', 2000, 'dalam proses'),
(7, 'PNJWASERDA010622005', 'WSP001', '10', 2000, 'dalam proses'),
(8, 'PNJWASERDA010622005', 'WSP003', '15', 2000, 'dalam proses'),
(9, 'PNJWASERDA010622006', 'WSP001', '10', 2500, 'dalam proses'),
(10, 'PNJWASERDA010622006', 'WSP003', '15', 2000, 'dalam proses'),
(11, 'PNJWASERDA010622007', 'WSP001', '10', 2500, 'dalam proses'),
(12, 'PNJWASERDA010622007', 'WSP004', '5', 2000, 'dalam proses'),
(13, 'PNJWASERDA010622008', 'WSP001', '1', 2500, 'dalam proses'),
(14, 'PNJWASERDA010622009', 'WSP001', '11', 2500, 'dalam proses'),
(15, 'PNJWASERDA010622009', 'WSP003', '1', 2000, 'dalam proses'),
(16, 'PNJWASERDA010622010', 'WSP001', '10', 2500, 'dalam proses'),
(17, 'PNJWASERDA010622010', 'WSP003', '5', 2000, 'dalam proses'),
(18, 'PNJWASERDA010622011', 'WSP003', '10', 2000, 'dalam proses'),
(19, 'PNJWASERDA140622012', NULL, '1', NULL, 'dalam proses'),
(20, 'PNJWASERDA140622012', 'WSP001', '1', 2500, 'dalam proses'),
(21, 'PNJWASERDA140622013', 'WSP001', '2', 2500, 'dalam proses'),
(22, 'PNJWASERDA140622014', 'WSP001', '1', 2500, 'dalam proses'),
(23, 'PNJWASERDA140622015', 'WSP003', '3', 2000, 'dalam proses'),
(24, 'PNJWASERDA140622016', 'WSP001', '1', 2500, 'dalam proses'),
(25, 'PNJWASERDA140622017', 'WSP001', '4', 2500, 'dalam proses'),
(26, 'PNJWASERDA140622018', 'WSP001', '1', 2500, 'dalam proses'),
(27, 'PNJWASERDA140622019', 'WSP003', '1', 2000, 'dalam proses'),
(28, 'PNJWASERDA150622020', 'WSP003', '1', 2000, 'dalam proses'),
(29, 'PNJWASERDA150622021', 'WSP003', '1', 2000, 'dalam proses'),
(30, 'PNJWASERDA150622022', 'WSP003', '1', 2000, 'dalam proses'),
(31, 'PNJWASERDA150622023', 'WSP003', '1', 2000, 'dalam proses'),
(32, 'PNJWASERDA150622024', 'WSP001', '1', 2500, 'dalam proses'),
(33, 'PNJWASERDA150622025', 'WSP001', '1', 2500, 'dalam proses'),
(34, 'PNJWASERDA150622025', 'WSP003', '1', 2000, 'dalam proses'),
(35, 'PNJWASERDA150622026', 'WSP001', '5', 2500, 'dalam proses'),
(36, 'PNJWASERDA150622027', 'WSP001', '1', 2500, 'dalam proses'),
(38, 'PNJWASERDA160622027', 'WSP003', '2', 2000, 'dalam proses'),
(39, 'PNJWASERDA160622027', 'WSP004', '1', 2000, 'dalam proses'),
(40, 'PNJWASERDA160622028', 'WSP001', '1', 2500, 'dalam proses'),
(41, 'PNJWASERDA160622029', 'WSP001', '10', 2500, 'dalam proses'),
(42, 'PNJWASERDA160622030', NULL, '1', NULL, 'dalam proses'),
(43, 'PNJWASERDA160622030', 'WSP001', '1', 2500, 'dalam proses'),
(44, 'PNJWASERDA170622031', 'WSP001', '2', 2500, 'dalam proses'),
(45, 'PNJWASERDA170622032', 'WSP001', '1', 2500, 'dalam proses'),
(46, 'PNJWASERDA170622033', 'WSP001', '9', 2500, 'dalam proses'),
(47, 'PNJWASERDA180622034', 'WSP001', '5', 2500, 'dalam proses'),
(48, 'PNJWASERDA190622035', 'WSP001', '1', 2500, 'dalam proses'),
(49, 'PNJWASERDA190622036', 'WSP001', '1', 2500, 'dalam proses'),
(50, 'PNJWASERDA190622037', 'WSP001', '1', 2500, 'dalam proses'),
(51, 'PNJWASERDA190622038', 'WSP001', '1', 2500, 'dalam proses'),
(60, 'PNJWASERDA200622039', 'WSP001', '1', 2500, 'dalam proses'),
(61, 'PNJWASERDA200622040', 'WSP001', '1', 2500, 'dalam proses'),
(62, 'PNJWASERDA200622041', 'WSP001', '1', 2500, 'dalam proses'),
(63, 'PNJWASERDA200622042', 'WSP001', '1', 2500, 'dalam proses'),
(64, 'PNJWASERDA200622043', 'WSP001', '1', 2500, 'dalam proses'),
(66, 'PNJWASERDA200622044', NULL, '1', NULL, 'dalam proses'),
(67, 'PNJWASERDA200622044', NULL, '1', NULL, 'dalam proses'),
(68, 'PNJWASERDA200622044', 'WSP001', '1', 2500, 'dalam proses'),
(69, 'PNJWASERDA220622045', 'WSP002', '3', 2000, 'dalam proses'),
(70, 'PNJWASERDA220622046', 'WSP002', '2', 2000, 'dalam proses'),
(71, 'PNJWASERDA220622047', 'WSP002', '12', 2000, 'dalam proses'),
(72, 'PNJWASERDA220622048', 'WSP002', '1', 2000, 'dalam proses');

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
(1, 'KPSBUPMB270522001', 150000, 15000, 165000, '2022-05-27', 'selesai'),
(2, 'KPSBUPMB280522002', 15000, 1500, 16500, '2022-05-28', 'selesai'),
(3, 'KPSBUPMB280522003', 15000, 1500, 16500, '2022-05-28', 'selesai'),
(4, 'KPSBUPMB010622004', 15000, 1500, 16500, '2022-06-01', 'selesai'),
(5, 'KPSBUPMB010622005', 19500, 1950, 21450, '2022-06-01', 'selesai'),
(6, 'KPSBUPMB010622006', 33000, 3300, 36300, '2022-06-01', 'selesai'),
(7, 'PMBWASERDA010622007', 34500, 3450, 37950, '2022-06-01', 'selesai'),
(8, 'PMBWASERDA010622008', 34250, 3425, 37675, '2022-06-01', 'selesai'),
(9, 'PMBWASERDA010622009', 39000, 3900, 42900, '2022-06-01', 'selesai'),
(10, 'PMBWASERDA010622010', 175000, 17500, 192500, '2022-06-01', 'selesai'),
(11, 'PMBWASERDA010622011', 58000, 5800, 63800, '2022-06-01', 'selesai'),
(12, 'PMBWASERDA150622012', 5000, 550, 5550, '2022-06-15', 'selesai'),
(13, 'PMBWASERDA150622013', 1750, 193, 1943, '2022-06-15', 'selesai'),
(14, 'PMBWASERDA150622014', 6750, 743, 7493, '2022-06-15', 'selesai'),
(15, 'PMBWASERDA160622015', 8750, 963, 9713, '2022-06-16', 'selesai'),
(16, 'PMBWASERDA170622016', 5250, 578, 5828, '2022-06-17', 'selesai'),
(17, 'PMBWASERDA170622017', 1750, 193, 1943, '2022-06-17', 'selesai'),
(18, 'PMBWASERDA170622018', 17500, 1925, 19425, '2022-06-17', 'selesai'),
(19, 'PMBWASERDA170622019', 8750, 963, 9713, '2022-06-17', 'selesai'),
(20, 'PMBWASERDA190622020', 8000, 880, 8880, '2022-06-19', 'selesai'),
(21, 'PMBWASERDA190622021', 6750, 743, 7493, '2022-06-19', 'selesai'),
(22, 'PMBWASERDA200622022', 1750, 193, 1943, '2022-06-20', 'selesai'),
(23, 'PMBWASERDA220622023', 22500, 2475, 24975, '2022-06-22', 'selesai'),
(24, 'PMBWASERDA220622024', 15000, 1650, 16650, '2022-06-22', 'selesai');

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
(2, 'KPSBU270522002', 11000, 'terbayar', '2022-05-27', 'd', '', 0, 11000, 1000, 10000, 2, '2022-05-27 15:32:03', NULL),
(4, 'PNJWASERDA010622003', 22000, 'terbayar', '2022-06-01', 'test', '', 0, 22000, 2000, 20000, 2, '2022-06-01 09:02:38', NULL),
(5, 'PNJWASERDA010622004', 11000, 'terbayar', '2022-06-01', 'ttt', '', 0, 11000, 1000, 10000, 2, '2022-06-01 09:05:18', NULL),
(6, 'PNJWASERDA010622005', 55000, 'terbayar', '2022-06-01', 'tst', '', 0, 55000, 5000, 50000, 2, '2022-06-01 09:10:51', NULL),
(7, 'PNJWASERDA010622006', 60500, 'terbayar', '2022-06-01', 'au', '', 0, 60500, 5500, 55000, 2, '2022-06-01 09:11:31', NULL),
(8, 'PNJWASERDA010622007', 38500, 'terbayar', '2022-06-01', 'tst', '', 0, 38500, 3500, 35000, 2, '2022-06-01 09:32:20', NULL),
(9, 'PNJWASERDA010622008', 2750, 'terbayar', '2022-06-01', 'Test Data', 'tunai', 0, 2750, 250, 2500, 1, '2022-06-01 09:34:58', NULL),
(10, 'PNJWASERDA010622009', 32450, 'terbayar', '2022-06-01', 'Heni', 'tunai', 0, 32450, 2950, 29500, 1, '2022-06-01 09:47:31', NULL),
(11, 'PNJWASERDA010622010', 38500, 'kredit', '2022-06-01', 'Siti', 'kredit', 0, 38500, 3500, 35000, 1, '2022-06-01 09:56:33', NULL),
(12, 'PNJWASERDA010622011', 22000, 'kredit', '2022-06-01', 'Ale', 'kredit', 0, 22000, 2000, 20000, 1, '2022-06-01 10:05:11', NULL),
(13, 'PNJWASERDA140622012', 2775, 'terbayar', '2022-06-14', 'Guest', '', 225, 3000, 275, 2500, 2, '2022-06-14 11:36:07', NULL),
(14, 'PNJWASERDA140622013', 5550, 'terbayar', '2022-06-14', 'Heni', 'tunai', 4450, 10000, 550, 5000, 1, '2022-06-14 15:22:42', NULL),
(15, 'PNJWASERDA140622014', 2775, 'terbayar', '2022-06-14', 'Guest', '', 225, 3000, 275, 2500, 2, '2022-06-14 15:33:48', NULL),
(16, 'PNJWASERDA140622015', 6660, 'kredit', '2022-06-14', 'Testing 2', 'kredit', 0, 6660, 660, 6000, 1, '2022-06-14 15:35:09', NULL),
(17, 'PNJWASERDA140622016', 2775, 'terbayar', '2022-06-14', 'Guest', '', 2225, 5000, 275, 2500, 2, '2022-06-14 15:41:53', NULL),
(18, 'PNJWASERDA140622017', 11100, 'terbayar', '2022-06-14', 'Guest', '', 8900, 20000, 1100, 10000, 2, '2022-06-14 15:44:52', NULL),
(19, 'PNJWASERDA140622018', 2775, 'kredit', '2022-06-14', 'Data Test', 'kredit', 0, 2775, 275, 2500, 1, '2022-06-14 15:45:43', NULL),
(20, 'PNJWASERDA140622019', 2220, 'kredit', '2022-06-14', 'Testing 4', 'kredit', 0, 2220, 220, 2000, 1, '2022-06-14 15:46:16', NULL),
(21, 'PNJWASERDA150622020', 2220, 'kredit', '2022-06-15', 'Testing 3', 'kredit', 0, 2220, 220, 2000, 1, '2022-06-14 18:02:52', NULL),
(22, 'PNJWASERDA150622021', 2220, 'terbayar', '2022-06-15', 'Guest', '', 780, 3000, 220, 2000, 2, '2022-06-14 18:03:35', NULL),
(23, 'PNJWASERDA150622022', 2220, 'terbayar', '2022-06-15', 'Guest', '', 47780, 50000, 220, 2000, 2, '2022-06-14 18:05:54', NULL),
(24, 'PNJWASERDA150622023', 2220, 'terbayar', '2022-06-15', 'Guest', '', 7780, 10000, 220, 2000, 2, '2022-06-14 18:10:00', NULL),
(25, 'PNJWASERDA150622024', 2775, 'terbayar', '2022-06-15', 'Guest', '', 7225, 10000, 275, 2500, 2, '2022-06-14 18:10:51', NULL),
(26, 'PNJWASERDA150622025', 4995, 'terbayar', '2022-06-15', 'Guest', '', 5005, 10000, 495, 4500, 2, '2022-06-15 05:50:20', NULL),
(27, 'PNJWASERDA150622026', 13875, 'terbayar', '2022-06-15', 'Guest', '', 46125, 60000, 1375, 12500, 2, '2022-06-15 15:57:47', NULL),
(29, 'PNJWASERDA160622027', 6660, 'terbayar', '2022-06-16', 'Guest', '', 3340, 10000, 660, 6000, 2, '2022-06-16 04:17:42', NULL),
(30, 'PNJWASERDA160622028', 2775, 'terbayar', '2022-06-16', 'Guest', '', 7225, 10000, 275, 2500, 2, '2022-06-16 04:19:45', NULL),
(31, 'PNJWASERDA160622029', 27750, 'terbayar', '2022-06-16', 'Aji', '', 2250, 30000, 2750, 25000, 2, '2022-06-16 04:51:38', NULL),
(32, 'PNJWASERDA160622030', 2775, 'terbayar', '2022-06-16', 'Hendra', '', 7225, 10000, 275, 2500, 2, '2022-06-16 05:16:05', NULL),
(33, 'PNJWASERDA170622031', 5550, 'terbayar', '2022-06-17', 'Guest', '', 450, 6000, 550, 5000, 2, '2022-06-17 07:10:24', NULL),
(34, 'PNJWASERDA170622032', 2775, 'terbayar', '2022-06-17', 'Guest', '', 225, 3000, 275, 2500, 2, '2022-06-17 08:53:55', NULL),
(35, 'PNJWASERDA170622033', 24975, 'terbayar', '2022-06-17', 'Guest', '', 5025, 30000, 2475, 22500, 2, '2022-06-17 11:10:01', NULL),
(36, 'PNJWASERDA180622034', 13875, 'terbayar', '2022-06-18', 'Guest', '', 1125, 15000, 1375, 12500, 2, '2022-06-18 11:48:26', NULL),
(37, 'PNJWASERDA190622035', 2775, 'kredit', '2022-06-19', 'Heni', 'kredit', 0, 2775, 275, 2500, 1, '2022-06-18 17:01:46', NULL),
(38, 'PNJWASERDA190622036', 2775, 'kredit', '2022-06-19', 'Jadi andri aja namanya', 'kredit', 0, 2775, 275, 2500, 1, '2022-06-18 17:02:16', 'lunas'),
(39, 'PNJWASERDA190622037', 2775, 'kredit', '2022-06-19', 'Jadi andri aja namanya', 'kredit', 0, 2775, 275, 2500, 1, '2022-06-18 17:24:49', 'lunas'),
(40, 'PNJWASERDA190622038', 2775, 'terbayar', '2022-06-19', 'Guest', '', 225, 3000, 275, 2500, 2, '2022-06-18 17:27:50', NULL),
(43, 'PNJWASERDA200622039', 2775, 'terbayar', '2022-06-20', 'Guest', '', 2225, 5000, 275, 2500, 2, '2022-06-20 09:33:54', NULL),
(44, 'PNJWASERDA200622040', 2775, 'terbayar', '2022-06-20', 'Guest', '', 2225, 5000, 275, 2500, 2, '2022-06-20 09:39:29', NULL),
(45, 'PNJWASERDA200622041', 2775, 'kredit', '2022-06-20', 'Iwan', 'kredit', 0, 2775, 275, 2500, 1, '2022-06-20 09:55:53', 'lunas'),
(46, 'PNJWASERDA200622042', 2775, 'terbayar', '2022-06-20', 'Guest', '', 3224, 5999, 275, 2500, 2, '2022-06-20 10:12:58', NULL),
(47, 'PNJWASERDA200622043', 2775, 'terbayar', '2022-06-20', 'Guest', '', 2225, 5000, 275, 2500, 2, '2022-06-20 10:19:55', NULL),
(48, 'PNJWASERDA200622044', 2775, 'kredit', '2022-06-20', 'Jadi andri aja namanya', 'kredit', 0, 2775, 275, 2500, 1, '2022-06-20 10:23:31', NULL),
(49, 'PNJWASERDA220622045', 6660, 'terbayar', '2022-06-22', 'Guest', '', 3340, 10000, 660, 6000, 2, '2022-06-21 17:07:43', NULL),
(50, 'PNJWASERDA220622046', 4440, 'terbayar', '2022-06-22', 'Guest', '', 560, 5000, 440, 4000, 2, '2022-06-21 17:08:04', NULL),
(51, 'PNJWASERDA220622047', 26640, 'terbayar', '2022-06-22', 'Guest', '', 3360, 30000, 2640, 24000, 2, '2022-06-21 17:24:21', NULL),
(52, 'PNJWASERDA220622048', 2220, 'terbayar', '2022-06-22', 'Guest', '', 780, 3000, 220, 2000, 2, '2022-06-21 17:48:54', NULL);

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
('PR_001', 'Susu Sapi', 130000, '8558.3333333333', 'liter', 0),
('PR_002', 'Susu Murni', 3000, '9802', 'liter', 0),
('PR_003', 'Pasteur Coklat', 1300, '10374', 'liter', 0),
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
(1, 'Pagi', '20:00:00', '23:00:00'),
(2, 'Sore', '05:00:00', '23:00:00');

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
(1, 'CUTI20220521001', '2022-05-21 15:04:14', '1029384756', 2, '2022-05-21', '2022-05-23', 'mau cuti\r\n', 1),
(2, 'CUTI20220618002', '2022-06-18 13:51:11', '1029384756', 1, '2022-06-18', '2022-06-19', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_detail_pengajuan_bonus`
--

CREATE TABLE `tb_detail_pengajuan_bonus` (
  `id_pengajuan` varchar(255) DEFAULT NULL,
  `nip` varchar(50) DEFAULT NULL,
  `nominal` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_detail_pengajuan_bonus`
--

INSERT INTO `tb_detail_pengajuan_bonus` (`id_pengajuan`, `nip`, `nominal`) VALUES
('PENGAJUANBONUS050622002', '111', 150000),
('PENGAJUANBONUS050622002', '1029384756', 150000),
('PENGAJUANBONUS050622003', '111', 500000);

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
  `bonus_kerja` int(20) DEFAULT NULL,
  `ptkp` int(20) DEFAULT NULL,
  `tot_penghasilan` int(20) DEFAULT NULL,
  `tot_pengurang` int(20) DEFAULT NULL,
  `total` int(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_detail_penggajian`
--

INSERT INTO `tb_detail_penggajian` (`id`, `id_penggajian`, `gaji_pokok`, `tunjangan_jabatan`, `tunjangan_kesehatan`, `bonus_kerja`, `ptkp`, `tot_penghasilan`, `tot_pengurang`, `total`) VALUES
(28, 'GAJI-003', 3000000, 300000, 300000, 4000000, 0, 7600000, 0, 7600000);

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
(2, 'Tetap', 's1', 4800000),
(3, 'Kontrak', 's1', 3500000);

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
(9, 'LMBR20220621006', '2022-06-21', '1029384756', 1, 3, 20000, 20000);

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
(1, 'GAJI-001', '2021-12-10', 'Ale', 5368500, NULL),
(2, 'GAJI-002', '2022-01-07', 'Heni', 3429000, NULL),
(30, 'GAJI-003', '2022-05-28', 'Heni', 7600000, NULL);

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
(1, 'TK0', 4500000),
(2, 'TK1', 5500000),
(3, 'TK2', 6000000);

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

--
-- Dumping data for table `transaksi_shu`
--

INSERT INTO `transaksi_shu` (`id`, `kode_shu`, `tanggal`, `nominal`, `status`) VALUES
(1, 'SHU20220001', '2022-06-18', 16155746, 2),
(2, 'SHU20220002', '2022-06-20', 16004137, 2);

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
(7, 'REV20210903005', '2021-09-03 04:57:19', 250000, 750000, 5250000, 45455, 409090, 5659090, 'IDA-024');

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
(3, 'Jadi andri aja namanya', 'Andi', '123123', 'pegawai', '1029384756'),
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
(17, 'bos', 'bos', 'bos123', 'atasan', 'd3dd1');

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
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '10', '1500', '15000', '1', '2000', '2000', '8', '2500', '20000'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '10', '1500', '15000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '10', '1500', '15000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '10', '1500', '15000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '10', '1500', '15000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '10', '1500', '15000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '10', '1500', '15000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '10', '1500', '15000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '10', '1500', '15000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '10', '1500', '15000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '10', '1500', '15000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '10', '1500', '15000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '10', '1500', '15000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA200622042', 'WSP001', '2022-06-20 10:19:25', '', '10', '1500', '15000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '10', '1500', '15000', '1', '2000', '2000', '7', '2500', '17500'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '10', '1500', '15000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '10', '1500', '15000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '10', '1500', '15000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '10', '1500', '15000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '10', '1500', '15000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '10', '1500', '15000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '10', '1500', '15000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '10', '1500', '15000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '10', '1500', '15000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '10', '1500', '15000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '10', '1500', '15000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '10', '1500', '15000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA200622043', 'WSP001', '2022-06-20 10:20:03', '', '10', '1500', '15000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '10', '1500', '15000', '1', '2000', '2000', '6', '2500', '15000'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '10', '1500', '15000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '10', '1500', '15000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '10', '1500', '15000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '10', '1500', '15000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '10', '1500', '15000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '10', '1500', '15000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '10', '1500', '15000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '10', '1500', '15000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '10', '1500', '15000', '1', '2000', '2000', '10', '2500', '25000'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '10', '1500', '15000', '1', '2000', '2000', '5', '2500', '12500'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '10', '1500', '15000', '1', '2000', '2000', '2', '2500', '5000'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '10', '1500', '15000', '1', '2000', '2000', '3', '2500', '7500'),
(0, 'PNJWASERDA200622044', 'WSP001', '2022-06-20 10:26:38', '', '10', '1500', '15000', '1', '2000', '2000', '1', '2500', '2500'),
(0, 'PMBWASERDA220622023', 'WSP002', '2022-06-21 17:06:11', NULL, '10', '1500', '15000', '1', '2000', '2000', '10', '1500', '15000'),
(0, 'PMBWASERDA220622023', 'WSP002', '2022-06-21 17:06:11', NULL, '10', '1500', '15000', '1', '2000', '2000', '1', '1500', '1500'),
(0, 'PMBWASERDA220622023', 'WSP002', '2022-06-21 17:06:11', NULL, '10', '1500', '15000', '1', '2000', '2000', '1', '1500', '1500'),
(0, 'PMBWASERDA220622023', 'WSP002', '2022-06-21 17:06:11', NULL, '10', '1500', '15000', '1', '2000', '2000', '15', '1500', '22500'),
(0, 'PNJWASERDA220622045', 'WSP002', '2022-06-21 17:07:53', '', '10', '1500', '15000', '1', '2000', '2000', '7', '2000', '14000'),
(0, 'PNJWASERDA220622045', 'WSP002', '2022-06-21 17:07:53', '', '10', '1500', '15000', '1', '2000', '2000', '1', '2000', '2000'),
(0, 'PNJWASERDA220622045', 'WSP002', '2022-06-21 17:07:53', '', '10', '1500', '15000', '1', '2000', '2000', '1', '2000', '2000'),
(0, 'PNJWASERDA220622045', 'WSP002', '2022-06-21 17:07:53', '', '10', '1500', '15000', '1', '2000', '2000', '15', '2000', '30000'),
(0, 'PNJWASERDA220622046', 'WSP002', '2022-06-21 17:08:12', '', '10', '1500', '15000', '1', '2000', '2000', '5', '2000', '10000'),
(0, 'PNJWASERDA220622046', 'WSP002', '2022-06-21 17:08:12', '', '10', '1500', '15000', '1', '2000', '2000', '1', '2000', '2000'),
(0, 'PNJWASERDA220622046', 'WSP002', '2022-06-21 17:08:12', '', '10', '1500', '15000', '1', '2000', '2000', '1', '2000', '2000'),
(0, 'PNJWASERDA220622046', 'WSP002', '2022-06-21 17:08:12', '', '10', '1500', '15000', '1', '2000', '2000', '15', '2000', '30000'),
(0, 'PMBWASERDA220622024', 'WSP002', '2022-06-21 17:12:36', NULL, '10', '1500', '15000', '1', '2000', '2000', '5', '1500', '7500'),
(0, 'PMBWASERDA220622024', 'WSP002', '2022-06-21 17:12:36', NULL, '10', '1500', '15000', '1', '2000', '2000', '1', '1500', '1500'),
(0, 'PMBWASERDA220622024', 'WSP002', '2022-06-21 17:12:36', NULL, '10', '1500', '15000', '1', '2000', '2000', '1', '1500', '1500'),
(0, 'PMBWASERDA220622024', 'WSP002', '2022-06-21 17:12:36', NULL, '10', '1500', '15000', '1', '2000', '2000', '15', '1500', '22500'),
(0, 'PMBWASERDA220622024', 'WSP002', '2022-06-21 17:12:36', NULL, '10', '1500', '15000', '1', '2000', '2000', '10', '1500', '15000'),
(0, 'PNJWASERDA220622047', 'WSP002', '2022-06-21 17:24:30', '', '0', '0', '0', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA220622047', 'WSP002', '2022-06-21 17:24:30', '', '0', '0', '0', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA220622047', 'WSP002', '2022-06-21 17:24:30', '', '0', '0', '0', '1', '2000', '2000', '0', '0', '0'),
(0, 'PNJWASERDA220622047', 'WSP002', '2022-06-21 17:24:30', '', '0', '0', '0', '1', '2000', '2000', '10', '2000', '20000'),
(0, 'PNJWASERDA220622047', 'WSP002', '2022-06-21 17:24:30', '', '0', '0', '0', '1', '2000', '2000', '10', '2000', '20000'),
(0, 'PNJWASERDA220622048', 'WSP002', '2022-06-21 17:49:04', '', '0', '0', '0', '1', '2000', '2000', '9', '2000', '18000'),
(0, 'PNJWASERDA220622048', 'WSP002', '2022-06-21 17:49:04', '', '0', '0', '0', '1', '2000', '2000', '10', '2000', '20000');

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
('PNJWASERDA220622048', 'WSP002', 2);

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
(12, 'WSP001', 'Stok Masuk', 12, 6, '2022-06-01 08:49:57'),
(13, 'WSP003', 'Stok Masuk', 12, 0, '2022-06-01 08:49:57'),
(14, 'WSP001', 'Stok Masuk', 10, 10, '2022-06-01 08:50:42'),
(15, 'WSP003', 'Stok Masuk', 5, 0, '2022-06-01 08:50:42'),
(16, 'WSP004', 'Stok Masuk', 100, 94, '2022-06-01 08:50:42'),
(17, 'WSP001', 'Stok Masuk', 10, 10, '2022-06-01 08:55:09'),
(18, 'WSP003', 'Stok Masuk', 15, 1, '2022-06-01 08:55:09'),
(19, 'WSP004', 'Stok Masuk', 12, 12, '2022-06-01 08:55:09'),
(20, 'WSP001', 'Stok Masuk', 2, 2, '2022-06-15 06:23:11'),
(21, 'WSP002', 'Stok Masuk', 1, 0, '2022-06-15 06:23:11'),
(22, 'WSP001', 'Stok Masuk', 1, 1, '2022-06-15 06:49:47'),
(23, 'WSP001', 'Stok Masuk', 3, 3, '2022-06-15 10:17:20'),
(24, 'WSP002', 'Stok Masuk', 1, 0, '2022-06-15 10:17:20'),
(25, 'WSP001', 'Stok Masuk', 5, 5, '2022-06-16 07:11:26'),
(26, 'WSP001', 'Stok Masuk', 3, 3, '2022-06-17 04:53:48'),
(27, 'WSP001', 'Stok Masuk', 1, 1, '2022-06-17 05:00:12'),
(28, 'WSP001', 'Stok Masuk', 10, 10, '2022-06-17 07:06:23'),
(29, 'WSP001', 'Stok Masuk', 5, 5, '2022-06-17 08:22:17'),
(30, 'WSP001', 'Stok Masuk', 2, 2, '2022-06-18 17:40:31'),
(31, 'WSP003', 'Stok Masuk', 3, 3, '2022-06-18 17:40:31'),
(32, 'WSP001', 'Stok Masuk', 3, 3, '2022-06-18 17:43:11'),
(33, 'WSP003', 'Stok Masuk', 1, 1, '2022-06-18 17:43:11'),
(34, 'WSP001', 'Stok Masuk', 1, 1, '2022-06-20 10:00:36'),
(35, 'WSP002', 'Stok Masuk', 15, 9, '2022-06-21 17:06:11'),
(36, 'WSP002', 'Stok Masuk', 10, 10, '2022-06-21 17:12:36');

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
(1, NULL, 'PNJWASERDA010622010', NULL, 'Siti', 'pegawai', 38500, '2022-06-01 09:57:21', 0),
(2, NULL, 'PNJWASERDA010622011', NULL, 'Ale', 'pegawai', 22000, '2022-06-01 10:05:21', 0),
(3, NULL, 'PNJWASERDA140622015', NULL, 'Testing 2', 'pegawai', 6660, '2022-06-14 15:35:26', 0),
(4, NULL, 'PNJWASERDA140622018', NULL, 'Data Test', 'pegawai', 2775, '2022-06-14 15:45:57', 0),
(5, NULL, 'PNJWASERDA140622019', NULL, 'Testing 4', 'pegawai', 2220, '2022-06-14 15:46:26', 0),
(6, NULL, 'PNJWASERDA150622020', NULL, 'Testing 3', 'pegawai', 2220, '2022-06-14 18:03:05', 0),
(7, NULL, 'PNJWASERDA160622027', NULL, 'Testing 5', 'pegawai', 4440, '2022-06-16 03:59:06', 0),
(8, NULL, 'PNJWASERDA190622035', NULL, 'Heni', 'pegawai', 2775, '2022-06-18 17:01:55', 0),
(9, 'PMB-KR-20220619001', 'PNJWASERDA190622036', '2022-06-19', 'Jadi andri aja namanya', 'pegawai', 2775, '2022-06-18 17:02:30', 1),
(10, 'PMB-KR-20220619002', 'PNJWASERDA190622037', '2022-06-19', 'Jadi andri aja namanya', 'pegawai', 2775, '2022-06-18 17:25:01', 1),
(11, NULL, 'PNJWASERDA200622039', NULL, 'Agung', 'peternak', 2775, '2022-06-19 23:27:54', 0),
(12, 'PMB-KR-20220620003', 'PNJWASERDA200622041', '2022-06-20', 'Iwan', 'peternak', 2775, '2022-06-20 09:56:04', 1),
(13, NULL, 'PNJWASERDA200622044', NULL, 'Jadi andri aja namanya', 'pegawai', 2775, '2022-06-20 10:26:38', 0);

-- --------------------------------------------------------

--
-- Table structure for table `waserda_pengajuan_barang`
--

CREATE TABLE `waserda_pengajuan_barang` (
  `id` int(11) NOT NULL,
  `tanggal_pengajuan` datetime DEFAULT NULL,
  `nama_barang` varchar(50) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `deskripsi` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'menunggu approval'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `waserda_pengajuan_barang`
--

INSERT INTO `waserda_pengajuan_barang` (`id`, `tanggal_pengajuan`, `nama_barang`, `jumlah`, `deskripsi`, `status`) VALUES
(1, '2022-06-15 01:25:00', 'Indomie Goreng', 23, 'aaayam', 'Approved');

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
(1, 'PNGBBN20220619001', '2022-06-19', '5221', 'aa', 200000, '2022-06-18 17:29:10'),
(2, 'PNGBBN20220620002', '2022-06-20', '5221', 'z', 100000, '2022-06-20 00:23:47'),
(3, 'PNGBBN20220620003', '2022-06-20', '5221', 'abc', 250000, '2022-06-20 10:07:42');

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
(1, 'WSP001', '8886008101053', 'WSK001', 'WSS001', 'Indomie Goreng', 1750, 2500, 'pcs', 64, 1, '2021-10-15 15:38:31'),
(2, 'WSP002', NULL, 'WSK001', 'WSS001', 'Indomie Goreng Ayam Bawang', 1500, 2000, 'pcs', 7, 1, '2021-10-15 15:38:31'),
(3, 'WSP003', NULL, 'WSK001', 'WSS002', 'Indomie Goreng Rendang', 1500, 2000, 'pcs', 5, 1, '2021-10-15 15:38:31'),
(4, 'WSP004', NULL, 'WSK001', 'WSS003', 'Indomie Goreng Aceh', 1500, 2000, 'pcs', 106, 1, '2021-10-15 15:38:31'),
(5, 'WSP005', '8995102800448', 'WSK001', 'WSS001', 'Indomie Rebus', 1500, 2000, 'pcs', 0, 1, '2021-10-15 15:38:31'),
(6, 'WSP006', NULL, 'WSK002', 'WSS004', 'teh sisri', 15000, 2000, 'kilo', 0, 1, '2021-10-16 16:02:42'),
(7, 'WSP007', '007', 'WSK003', 'WSS001', 'Pulpen', 3000, 3500, 'pcs', 0, 1, '2021-11-16 14:29:13'),
(8, 'WSP008', '1212', 'WSK003', 'WSS001', 'Penghapus untuk pulpen', 2500, 3000, 'pcs', 0, 1, '2021-12-29 15:00:27'),
(9, 'WSP009', NULL, 'WSK003', 'WSS001', 'Penggaris', 3000, 0, 'pcs', 0, 1, '2022-01-07 14:06:42');

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
(3, 'WSS003', 'Pt Sejahtera Selalu', 'lembang timur', '1231231', 1, '2021-10-16 04:15:44'),
(4, 'WSS004', 'Test', 'aasd', '33321', 1, '2021-10-16 04:19:12'),
(5, 'WSS005', 'Test 212', 'test 21', '1122334455', 1, '2021-10-16 04:19:17');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `aktivitas`
--
ALTER TABLE `aktivitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
-- AUTO_INCREMENT for table `buku_kas_kecil`
--
ALTER TABLE `buku_kas_kecil`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buku_pembantu_bank`
--
ALTER TABLE `buku_pembantu_bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `buku_pembantu_kas`
--
ALTER TABLE `buku_pembantu_kas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `coa`
--
ALTER TABLE `coa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `detail_absen_rfid`
--
ALTER TABLE `detail_absen_rfid`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `detail_cek_kualitas`
--
ALTER TABLE `detail_cek_kualitas`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_pembagian`
--
ALTER TABLE `detail_pembagian`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_pembelian`
--
ALTER TABLE `detail_pembelian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `detail_pembelian_bb`
--
ALTER TABLE `detail_pembelian_bb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `detail_pembelian_bp`
--
ALTER TABLE `detail_pembelian_bp`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_penjualan_ips`
--
ALTER TABLE `detail_penjualan_ips`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_penjualan_toko`
--
ALTER TABLE `detail_penjualan_toko`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_produksi_ke1`
--
ALTER TABLE `detail_produksi_ke1`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_produksi_ke2`
--
ALTER TABLE `detail_produksi_ke2`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_target_produksi`
--
ALTER TABLE `detail_target_produksi`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_transaksi_shu`
--
ALTER TABLE `detail_transaksi_shu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `jadwal_shift`
--
ALTER TABLE `jadwal_shift`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `jenis_penjualan`
--
ALTER TABLE `jenis_penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jurnal`
--
ALTER TABLE `jurnal`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=456;

--
-- AUTO_INCREMENT for table `kartu_stok_bp`
--
ALTER TABLE `kartu_stok_bp`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kartu_stok_penj`
--
ALTER TABLE `kartu_stok_penj`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `laporan_kartu_stock`
--
ALTER TABLE `laporan_kartu_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `log_penyusutan`
--
ALTER TABLE `log_penyusutan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pembagian_shu`
--
ALTER TABLE `pembagian_shu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pembelian_bb`
--
ALTER TABLE `pembelian_bb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `penerimaan_kas`
--
ALTER TABLE `penerimaan_kas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pengajuan_bonus`
--
ALTER TABLE `pengajuan_bonus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pengajuan_jurnal`
--
ALTER TABLE `pengajuan_jurnal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `pengeluaran_kas`
--
ALTER TABLE `pengeluaran_kas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `pos_detail_penjualan`
--
ALTER TABLE `pos_detail_penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `pos_pembelian`
--
ALTER TABLE `pos_pembelian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `pos_penjualan`
--
ALTER TABLE `pos_penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_cuti`
--
ALTER TABLE `tb_cuti`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_detail_penggajian`
--
ALTER TABLE `tb_detail_penggajian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tb_jabatan`
--
ALTER TABLE `tb_jabatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_jenis_pegawai`
--
ALTER TABLE `tb_jenis_pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_lembur`
--
ALTER TABLE `tb_lembur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_penggajian`
--
ALTER TABLE `tb_penggajian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `truck_information`
--
ALTER TABLE `truck_information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `update_stok_penj`
--
ALTER TABLE `update_stok_penj`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `waserda_pembayaran_kredit`
--
ALTER TABLE `waserda_pembayaran_kredit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
