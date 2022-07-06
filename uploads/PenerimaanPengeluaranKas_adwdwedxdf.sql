-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 18, 2022 at 07:18 PM
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
-- Database: `kpsbu_sarah`
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
(7, '2022-05-08');

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
('AS-14', 'Test Kendaraan', 12, 'SPA-01', 1214, 5228, 1125),
('AS-15', 'Mobil Avanza', 12, 'SPA-03', 1214, 5228, 1125),
('AS-16', 'Mobil Hyundai', 12, 'SPA-03', 1214, 5228, 1125);

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
('BP_001', 'Gula', 'gram', 5000000),
('BP_002', 'Bubuk Biang Yoghurt', 'gram', 5000000),
('BP_004', 'Perisa Makanan', 'ml', 5000000),
('BP_005', 'Garam', 'gram', 5000000),
('BP_006', 'Pewarna Makanan', 'ml', 5000000);

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
('PR_004', 'BB_001', 1),
('PR_004', 'BP_001', 500),
('PR_004', 'BP_002', 500),
('PR_004', 'BP_004', 500),
('PR_004', 'BP_005', 500),
('PR_004', 'BP_006', 500),
('PR_003', 'BB_001', 1),
('PR_003', 'BP_001', 500),
('PR_003', 'BP_002', 500),
('PR_003', 'BP_004', 500),
('PR_003', 'BP_005', 500),
('PR_003', 'BP_006', 500);

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
('BOP_001', '2022-07-04', '0', '0');

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
('BOPO_001', '2022-07-04');

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
('BTK_001', '2022-07-04', '0', '0', '150', 105);

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
('BTKO_001', '2022-07-04', '150', '105');

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
(1, 'KPSBU210322050', '2022-03-21', 4000, 'Penjualan', 'd'),
(2, 'KPSBU210322051', '2022-03-21', 4000, 'Penjualan', 'd'),
(3, 'KPSBU060422052', '2022-04-06', 2000, 'Penjualan', 'd'),
(4, 'KPSBU070522053', '2022-05-07', 2000, 'Penjualan', 'd'),
(5, 'KPSBU070522054', '2022-05-07', 10000, 'Penjualan', 'd'),
(6, 'KPSBU070522055', '2022-05-07', 2000, 'Penjualan', 'd'),
(7, 'KPSBU070522056', '2022-05-07', 2000, 'Penjualan', 'd'),
(8, 'KPSBU150522057', '2022-05-15', 2000, 'Penjualan', 'd'),
(9, 'KPSBU150522058', '2022-05-15', 2000, 'Penjualan', 'd'),
(10, 'KPSBU150522059', '2022-05-15', 8000, 'Penjualan', 'd'),
(11, 'KPSBU150522060', '2022-05-15', 2000, 'Penjualan', 'd'),
(12, 'KPSBU150522061', '2022-05-15', 8000, 'Penjualan', 'd'),
(13, 'KPSBU150522062', '2022-05-15', 8000, 'Penjualan', 'd'),
(14, 'KPSBU150522063', '2022-05-15', 8000, 'Penjualan', 'd'),
(15, 'KPSBU150522064', '2022-05-15', 8000, 'Penjualan', 'd'),
(16, 'KPSBU150522065', '2022-05-15', 8000, 'Penjualan', 'd'),
(17, 'KPSBU150522066', '2022-05-15', 8000, 'Penjualan', 'd'),
(18, 'KPSBU150522067', '2022-05-15', 8000, 'Penjualan', 'd'),
(19, 'KPSBU200522070', '2022-05-20', 12000, 'Penjualan', 'd'),
(20, 'KPSBU200522071', '2022-05-20', 10000, 'Penjualan', 'd'),
(21, 'KPSBU200522072', '2022-05-20', 10000, 'Penjualan', 'd'),
(22, 'KPSBU200522073', '2022-05-20', 6000, 'Penjualan', 'd'),
(23, 'KPSBU200522074', '2022-05-20', 8000, 'Penjualan', 'd'),
(24, 'KPSBU200522075', '2022-05-20', 8000, 'Penjualan', 'd'),
(25, 'KPSBU200522076', '2022-05-20', 2000, 'Penjualan', 'd'),
(26, 'KPSBU200522077', '2022-05-20', 10000, 'Penjualan', 'd'),
(27, 'KPSBU200522078', '2022-05-20', 10000, 'Penjualan', 'd'),
(28, 'KPSBU200522078', '2022-05-20', 10000, 'Penjualan', 'd'),
(29, 'KPSBU200522078', '2022-05-20', 10000, 'Penjualan', 'd'),
(30, 'KPSBU200522079', '2022-05-20', 2000, 'Penjualan', 'd'),
(31, 'KPSBU200522080', '2022-05-20', 10000, 'Penjualan', 'd'),
(32, 'KPSBU200522081', '2022-05-20', 4000, 'Penjualan', 'd'),
(33, 'KPSBU200522082', '2022-05-20', 4000, 'Penjualan', 'd'),
(34, 'KPSBU200522083', '2022-05-20', 10000, 'Penjualan', 'd'),
(35, 'KPSBU200522084', '2022-05-20', 4000, 'Penjualan', 'd'),
(36, 'KPSBU200522085', '2022-05-20', 8000, 'Penjualan', 'd'),
(37, 'KPSBU200522086', '2022-05-20', 2000, 'Penjualan', 'd'),
(38, 'KPSBU200522087', '2022-05-20', 2000, 'Penjualan', 'd'),
(39, 'KPSBU200522088', '2022-05-20', 16000, 'Penjualan', 'd'),
(40, 'KPSBU200522089', '2022-05-20', 10000, 'Penjualan', 'd'),
(41, 'KPSBU200522090', '2022-05-20', 10000, 'Penjualan', 'd'),
(42, 'KPSBU210522091', '2022-05-21', 10000, 'Penjualan', 'd'),
(43, 'KPSBU210522091', '2022-05-21', 10000, 'Penjualan', 'd'),
(44, 'KPSBU210522091', '2022-05-21', 10000, 'Penjualan', 'd'),
(45, 'KPSBU210522091', '2022-05-21', 10000, 'Penjualan', 'd'),
(46, 'KPSBU210522091', '2022-05-21', 2000, 'Penjualan', 'd'),
(47, 'KPSBU210522092', '2022-05-21', 8000, 'Penjualan', 'd'),
(48, 'KPSBU210522093', '2022-05-21', 2000, 'Penjualan', 'd'),
(49, 'KPSBU210522094', '2022-05-21', 2000, 'Penjualan', 'd'),
(50, 'KPSBU210522091', '2022-05-21', 8000, 'Penjualan', 'd'),
(51, 'KPSBU210522092', '2022-05-21', 14000, 'Penjualan', 'd'),
(52, 'KPSBU210522091', '2022-05-21', 10000, 'Penjualan', 'd'),
(53, 'KPSBU210522092', '2022-05-21', 12000, 'Penjualan', 'd'),
(54, 'KPSBU210522092', '2022-05-21', 12000, 'Penjualan', 'd'),
(55, 'KPSBU210522092', '2022-05-21', 12000, 'Penjualan', 'd'),
(56, 'KPSBU210522092', '2022-05-21', 12000, 'Penjualan', 'd'),
(57, 'KPSBU210522092', '2022-05-21', 12000, 'Penjualan', 'd'),
(58, 'KPSBU210522092', '2022-05-21', 12000, 'Penjualan', 'd'),
(59, 'KPSBU210522092', '2022-05-21', 12000, 'Penjualan', 'd'),
(60, 'KPSBU210522093', '2022-05-21', 4000, 'Penjualan', 'd'),
(61, 'KPSBU210522094', '2022-05-21', 4000, 'Penjualan', 'd'),
(62, 'KPSBU210522094', '2022-05-21', 4000, 'Penjualan', 'd'),
(63, 'KPSBU210522094', '2022-05-21', 4000, 'Penjualan', 'd'),
(64, 'KPSBU210522094', '2022-05-21', 4000, 'Penjualan', 'd'),
(65, 'KPSBU210522095', '2022-05-21', 16000, 'Penjualan', 'd'),
(66, 'KPSBU210522096', '2022-05-21', 120000, 'Penjualan', 'd'),
(67, 'KPSBU210522096', '2022-05-21', 24000, 'Penjualan', 'd'),
(68, 'KPSBU210522096', '2022-05-21', 24000, 'Penjualan', 'd'),
(69, 'KPSBU210522096', '2022-05-21', 24000, 'Penjualan', 'd'),
(70, 'KPSBU210522096', '2022-05-21', 4000, 'Penjualan', 'd'),
(71, 'KPSBU210522096', '2022-05-21', 4000, 'Penjualan', 'd'),
(72, 'KPSBU210522096', '2022-05-21', 4000, 'Penjualan', 'd'),
(73, 'KPSBU210522096', '2022-05-21', 4000, 'Penjualan', 'd'),
(74, 'KPSBU210522096', '2022-05-21', 4000, 'Penjualan', 'd'),
(75, 'KPSBU210522097', '2022-05-21', 20000, 'Penjualan', 'd'),
(76, 'KPSBU210522098', '2022-05-21', 40000, 'Penjualan', 'd'),
(77, 'KPSBU240522099', '2022-05-24', 20000, 'Penjualan', 'd'),
(78, 'KPSBU270522001', '2022-05-27', 10000, 'Penjualan', 'd'),
(79, 'KPSBU270522001', '2022-05-27', 10000, 'Penjualan', 'd'),
(80, 'KPSBU270522002', '2022-05-27', 10000, 'Penjualan', 'd'),
(81, 'PNJWASERDA010622003', '2022-06-01', 20000, 'Penjualan', 'd'),
(82, 'PNJWASERDA010622003', '2022-06-01', 20000, 'Penjualan', 'd'),
(83, 'PNJWASERDA010622004', '2022-06-01', 10000, 'Penjualan', 'd'),
(84, 'PNJWASERDA010622005', '2022-06-01', 50000, 'Penjualan', 'd'),
(85, 'PNJWASERDA010622006', '2022-06-01', 55000, 'Penjualan', 'd'),
(86, 'PNJWASERDA010622007', '2022-06-01', 35000, 'Penjualan', 'd'),
(87, 'PNJWASERDA010622008', '2022-06-01', 2500, 'Penjualan', 'd'),
(88, 'PNJWASERDA010622009', '2022-06-01', 29500, 'Penjualan', 'd'),
(89, 'PNJWASERDA010622010', '2022-06-01', 35000, 'Penjualan', 'd'),
(90, 'PNJWASERDA010622011', '2022-06-01', 20000, 'Penjualan', 'd'),
(91, 'PNJWASERDA120622001', '2022-06-12', 25000, 'Penjualan', 'd'),
(92, 'PNJWASERDA120622002', '2022-06-12', 17500, 'Penjualan', 'd'),
(93, 'PNJWASERDA120622003', '2022-06-12', 10000, 'Penjualan', 'd'),
(94, 'PNJWASERDA120622004', '2022-06-12', 12500, 'Penjualan', 'd'),
(95, 'PNJWASERDA120622005', '2022-06-12', 2500, 'Penjualan', 'd'),
(96, 'PNJWASERDA120622006', '2022-06-12', 2500, 'Penjualan', 'd'),
(97, 'PNJWASERDA120622007', '2022-06-12', 2500, 'Penjualan', 'd'),
(98, 'PNJWASERDA120622008', '2022-06-12', 30000, 'Penjualan', 'd'),
(99, 'PNJWASERDA120622009', '2022-06-12', 195000, 'Penjualan', 'd'),
(100, 'PNJWASERDA120622010', '2022-06-12', 35000, 'Penjualan', 'd'),
(101, 'PNJWASERDA120622011', '2022-06-12', 70000, 'Penjualan', 'd'),
(102, 'PNJWASERDA120622012', '2022-06-12', 70000, 'Penjualan', 'd'),
(103, 'PNJWASERDA120622013', '2022-06-12', 567000, 'Penjualan', 'd'),
(104, 'PNJWASERDA120622014', '2022-06-12', 35000, 'Penjualan', 'd'),
(105, 'PNJWASERDA120622015', '2022-06-12', 21000, 'Penjualan', 'd'),
(106, 'PNJWASERDA120622016', '2022-06-12', 35000, 'Penjualan', 'd'),
(107, 'PNJWASERDA170622017', '2022-06-17', 70000, 'Penjualan', 'd'),
(108, 'PNJWASERDA170622018', '2022-06-17', 37500, 'Penjualan', 'd'),
(109, 'PNJWASERDA180622019', '2022-06-18', 7500, 'Penjualan', 'd'),
(110, 'PNJWASERDA190622020', '2022-06-19', 12500, 'Penjualan', 'd'),
(111, 'PNJWASERDA280622021', '2022-06-28', 25000, 'Penjualan', 'd');

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
(34, 'PMBWASERDA120622001', '2022-06-12', '192500', 1111, 'k', 'Pembelian Barang Waserda'),
(35, 'PMB-KR-20220612001', '2022-06-12', '27500', 1111, 'd', 'Pembayaran Waserda Kredit'),
(36, 'PMBWASERDA120622002', '2022-06-12', '137500', 1111, 'k', 'Pembelian Barang Waserda'),
(37, 'PMB-KR-20220612002', '2022-06-12', '19250', 1111, 'd', 'Pembayaran Waserda Kredit'),
(38, 'PMBWASERDA120622003', '2022-06-12', '16500', 1111, 'k', 'Pembelian Barang Waserda'),
(39, 'PNJWASERDA120622003', '2022-06-12', '11000', 1111, 'd', 'Penjualan Tunai'),
(40, 'PNGBBN20220612001', '2022-06-12', '500000', 1111, 'k', 'Pengeluaran Beban'),
(41, 'PNJWASERDA120622004', '2022-06-12', '13750', 1111, 'd', 'Penjualan Tunai'),
(42, 'PNJWASERDA120622005', '2022-06-12', '2750', 1111, 'd', 'Penjualan Tunai'),
(43, 'PNJWASERDA120622006', '2022-06-12', '2750', 1111, 'd', 'Penjualan Tunai'),
(44, 'PNJWASERDA120622007', '2022-06-12', '2750', 1111, 'd', 'Penjualan Tunai'),
(45, 'PNJWASERDA170622017', '2022-06-17', '77700', 1111, 'd', 'Penjualan Tunai'),
(46, 'PMBWASERDA170622010', '2022-06-17', '55500', 1111, 'k', 'Pembelian Barang Waserda'),
(47, 'PNJWASERDA170622018', '2022-06-17', '41625', 1111, 'd', 'Penjualan Tunai'),
(48, 'PNJWASERDA170622018', '2022-06-17', '41625', 1111, 'd', 'Penjualan Tunai'),
(49, 'PNJWASERDA180622019', '2022-06-18', '8325', 1111, 'd', 'Penjualan Tunai'),
(50, 'PNJWASERDA190622020', '2022-06-19', '13875', 1111, 'd', 'Penjualan Tunai'),
(51, 'PNJWASERDA280622021', '2022-06-28', '30000', 1111, 'd', 'Penjualan Tunai'),
(52, 'PMBG.SHU20220001', '2022-06-28', '36633656', 1111, 'k', 'SHU'),
(53, 'PMBG.SHU20220003', '2022-06-28', '19989092', 1111, 'k', 'SHU'),
(54, 'PMBG.SHU20220002', '2022-06-28', '25537280', 1111, 'k', 'SHU'),
(55, 'PMBG.SHU20220001', '2022-07-01', '53353808', 1111, 'k', 'SHU'),
(56, 'PMBG.SHU20220002', '2022-07-01', '31286500', 1111, 'k', 'SHU'),
(57, 'PMBG.SHU20220003', '2022-07-01', '16574963', 1111, 'k', 'SHU'),
(58, 'PNJWASERDA160722022', '2022-07-16', '2147483647', 1111, 'd', 'Penjualan Tunai'),
(59, 'PMBWASERDA160722011', '2022-07-16', '1942500000', 1111, 'k', 'Pembelian Barang Waserda');

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
('CK_001', '2022-07-04', '2');

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
  `is_neraca` tinyint(4) DEFAULT 0,
  `is_laporan_neraca` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coa`
--

INSERT INTO `coa` (`id`, `no_coa`, `nama_coa`, `jenis_coa`, `saldo_awal`, `header`, `saldo_normal`, `is_shu`, `is_arus_kas`, `is_penerimaan`, `is_waserda`, `is_neraca`, `is_laporan_neraca`) VALUES
(1, 1111, 'Kas', '', 0, 1, 'd', 0, 0, 1, 0, 1, 1),
(2, 1112, 'Persediaan Bahan Baku', '', 0, 1, 'd', 0, 0, 0, 0, 1, 1),
(3, 1113, 'Persediaan Bahan Penolong', '', 0, 1, 'd', 0, 0, 0, 0, 1, 0),
(4, 1114, 'Persediaan Produk Dalam Proses', '', 0, 1, 'd', 0, 0, 0, 0, 1, 0),
(5, 1120, 'Peralatan', '', 0, 1, 'd', 0, 0, 0, 0, 1, 0),
(6, 1122, 'Akumulasi penyusutan peralatan', '', 0, 1, 'k', 0, 0, 0, 0, 1, 1),
(7, 1199, 'Pinjaman Anggota', '', 0, 1, 'd', 0, 0, 0, 0, 1, 0),
(8, 1311, 'Persediaan Produk Jadi IPS', '', 0, 1, 'k', 0, 0, 0, 0, 1, 0),
(9, 1312, 'Persediaan Produk Jadi Toko', '', 0, 1, 'k', 0, 0, 0, 0, 1, 0),
(10, 2111, 'Utang', '', 0, 2, 'k', 0, 0, 0, 0, 1, 1),
(11, 2112, 'Simpanan Hari Raya', '', 0, 2, 'd', 0, 0, 0, 0, 1, 0),
(12, 3112, 'Simpanan Wajib', '', 0, 3, 'k', 0, 0, 0, 0, 1, 1),
(13, 3113, 'Simpanan Manasuka', '', 0, 3, 'k', 0, 0, 0, 0, 1, 1),
(14, 3111, 'Simpanan Pokok', '', 0, 3, 'k', 0, 0, 0, 0, 1, 1),
(15, 1115, 'Pinjaman anggota', '', 0, 1, 'd', 0, 0, 0, 0, 1, 0),
(16, 4111, 'Penjualan IPS', '', 0, 4, 'k', 0, 0, 1, 0, 1, 0),
(17, 4112, 'Penjualan Toko', '', 0, 4, 'k', 0, 0, 1, 0, 1, 0),
(18, 5000, 'Pembelian', '', 0, 5, 'd', 0, 0, 0, 0, 1, 0),
(19, 5111, 'Produk Dalam Proses - BBB', '', 0, 5, 'd', 0, 0, 0, 0, 1, 0),
(20, 5112, 'Produk Dalam Proses - BTK', '', 0, 5, 'd', 0, 0, 0, 0, 1, 0),
(21, 5113, 'Produk Dalam Proses - BOP', '', 0, 5, 'd', 0, 0, 0, 0, 1, 0),
(22, 5134, 'BOP Tetap Sesungguhnya', '', 0, 5, 'd', 0, 0, 0, 0, 1, 0),
(23, 5135, 'BOP Sesungguhnya', '', 0, 5, 'd', 0, 0, 0, 0, 1, 0),
(24, 5211, 'Beban Administrasi dan Umum Variabel', '', 0, 5, 'd', 0, 0, 0, 0, 1, 0),
(25, 5212, 'Beban Pemasaran Variabel', '', 0, 5, 'd', 0, 0, 0, 0, 1, 0),
(26, 5213, 'Beban Angkut Penjualan', '', 0, 5, 'd', 0, 1, 0, 0, 1, 0),
(27, 5221, 'Beban Listrik, Air dan Telepon', '', 0, 5, 'd', 1, 0, 0, 1, 1, 0),
(28, 5222, 'Beban Administrasi dan Umum Tetap', '', 0, 5, 'd', 1, 0, 0, 0, 1, 0),
(29, 5223, 'Beban Pemasaran Tetap', '', 0, 5, 'd', 0, 0, 0, 0, 1, 0),
(30, 5311, 'Beban Upah dan Gaji', '', 0, 5, 'd', 0, 0, 0, 0, 1, 0),
(31, 5312, 'BOP Dibebankan', '', 0, 5, 'd', 0, 0, 0, 0, 1, 0),
(32, 6111, 'Harga Pokok Penjualan IPS', '', 0, 6, 'd', 0, 0, 0, 0, 1, 0),
(33, 6112, 'Harga Pokok Penjualan Toko', '', 0, 6, 'd', 0, 0, 0, 0, 1, 0),
(34, 5228, 'Beban Penyusutan Kendaraan ', '', 0, 5, 'd', 0, 0, 0, 0, 1, 0),
(35, 1125, 'Akumulasi Penyusutan Kendaraan', '', 0, 1, 'k', 0, 0, 0, 0, 1, 1),
(36, 1214, 'Kendaraan', '', 0, 1, 'd', 0, 0, 0, 0, 1, 0),
(37, 5224, 'Beban Perbaikan', '', 0, 5, 'd', 1, 1, 0, 0, 1, 0),
(41, 4116, 'Penjualan Waserda', '', 0, 4, 'k', 1, 0, 1, 1, 1, 0),
(43, 1998, 'Piutang Kredit', '', 0, 1, 'd', 0, 0, 0, 0, 1, 0),
(48, 4211, 'SHU', '', 0, 4, 'd', 0, 0, 0, 0, 1, 0),
(49, 5313, 'Beban Reparasi Kendaraan', '', 0, 5, 'k', 0, 0, 0, 1, 1, 0),
(50, 5314, 'Beban Bensin', '', 0, 5, 'k', 0, 0, 0, 1, 1, 0),
(51, 5400, 'Beban Lembur', '', 0, 5, 'd', 0, 0, 0, 0, 1, 0),
(52, 1414, 'Pers. Barang Dagang', '', 0, 1, 'k', 0, 0, 0, 0, 1, 0),
(53, 2130, 'PPN Masukan', '', 0, 2, 'd', 0, 0, 0, 0, 1, 0),
(54, 2140, 'PPN Keluaran', '', 0, 2, 'd', 0, 0, 0, 0, 1, 0),
(55, 3300, 'SHU Tahun Berjalan', '', 0, 3, 'd', 0, 0, 0, 0, 1, 0),
(56, 3200, 'SHU Ditahan', '', 0, 3, 'd', 0, 0, 0, 0, 1, 0),
(57, 3100, 'SHU Tahun Berjalan Pada Tahun Lalu', '', 0, 3, 'k', 0, 0, 0, 0, 1, 0),
(58, 1300, 'Ikhtisar Laba Rugi', '', 0, 1, 'k', 0, 0, 0, 0, 1, 0);

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

--
-- Dumping data for table `detail_bop`
--

INSERT INTO `detail_bop` (`no_bop`, `no_jbop`, `harga`) VALUES
('BOP_001', 'JBOP_001', 100),
('BOP_001', 'JBOP_002', 105),
('BOP_001', 'JBOP_003', 110),
('BOP_001', 'JBOP_004', 115);

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
('BOPO_001', 'JBOP_001', '100'),
('BOPO_001', 'JBOP_002', '105'),
('BOPO_001', 'JBOP_003', '110'),
('BOPO_001', 'JBOP_004', '115');

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
(8, 'PGB_001', '130000', '10000');

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
(37, 'PMBAST20211022014', 'AS-15', 'SPA-03', 150000000, 1500000, '151500000', '15000000', '11', '12', '0000-00-00', '2022-07', '2022-08', 'IDA-025', 0),
(38, 'PMBAST20220716015', 'AS-16', 'SPA-03', 150000000, 1500000, '151500000', '15000000', '12', '12', '0000-00-00', '0000-00', '2022-07', 'IDA-026', 0);

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
(7, 'PMB_001', 'BB_001', 150000, '5700', 855000000, 'PTRNK_011'),
(8, 'PMB_002', 'BB_001', 300, '5700', 1710000, 'PTRNK_047'),
(9, 'PMB_002', 'BB_001', 200, '5700', 1140000, 'PTRNK_048'),
(10, 'PMB_002', 'BB_001', 150, '5700', 855000, 'PTRNK_049');

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
(8, 'PMBP_001', 'BP_001', 5000000, '1000', 2147483647, 'SBP_001', '5000000'),
(9, 'PMBP_001', 'BP_002', 5000000, '1000', 2147483647, 'SBP_002', '5000000'),
(10, 'PMBP_001', 'BP_004', 5000000, '1000', 2147483647, 'SBP_003', '5000000'),
(11, 'PMBP_001', 'BP_005', 5000000, '1000', 2147483647, 'SBP_004', '5000000'),
(12, 'PMBP_001', 'BP_006', 5000000, '1000', 2147483647, 'SBP_005', '5000000');

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
(7, 'testing jurnal', '1312', 'Persediaan Produk Jadi Toko', 'Aaaa', 500000, 'k');

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

--
-- Dumping data for table `detail_penjualan_toko`
--

INSERT INTO `detail_penjualan_toko` (`no`, `no_trans`, `no_produk`, `jumlah`, `harga`, `subtotal`, `hpp`) VALUES
(31, 'PENJT_001', 'PR_003', '100', '1404665.37055', '140466537.055', '108051182.35'),
(32, 'PENJT_002', 'PR_004', '6000', '1404665.37055', '8427992223.3', '6483070941');

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
('PNJS20220614005', 'PR_010', 'Test sarah', 100, 7000, 700000),
('PNJSO20220614004', 'PR_012', 'Testing Yogurt', 150, 5000, 750000);

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
(9, 'PROD1_001', 'PR_001', '798000000', '14700000', '60200000', '872900000', '140000', '130000', '130000');

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
(14, 'PROD2_001', '2022-07-04', 'PR_003', '31175000', '525000', '2150000', '5368709117.5', '5402559117.5', '5000', '4900'),
(15, 'PROD2_001', '2022-07-04', 'PR_004', '31175000', '525000', '2150000', '5368709117.5', '5402559117.5', '5000', '0');

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
(4, 'TP_001', 'PR_003', 5000, '1'),
(5, 'TP_001', 'PR_004', 5000, '1');

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
(57, 'SHU20220001', 'Cadangan koperasi', 508966450),
(58, 'SHU20220001', 'Jasa anggota', 318104032),
(59, 'SHU20220001', 'Jasa modal', 254483225),
(60, 'SHU20220001', 'Jasa lain-lain', 190862419);

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
(11, '111', '1', '2022-05-08', '2022-05-08', '', NULL, 1);

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
  `nominal` bigint(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jurnal`
--

INSERT INTO `jurnal` (`no`, `id_jurnal`, `tgl_jurnal`, `no_coa`, `posisi_dr_cr`, `nominal`) VALUES
(1, 'PMB_001', '2022-07-04', 1112, 'd', 855000000),
(2, 'PMB_001', '2022-07-04', 2111, 'k', 855000000),
(3, 'CK_001', '2022-07-04', 1112, 'd', 798000000),
(4, 'CK_001', '2022-07-04', 1111, 'k', 798000000),
(5, 'PROD1_001', '2022-07-04', 5111, 'd', 798000000),
(6, 'PROD1_001', '2022-07-04', 1112, 'k', 798000000),
(7, 'PROD1_001', '2022-07-04', 5112, 'd', 14700000),
(8, 'PROD1_001', '2022-07-04', 5311, 'k', 14700000),
(9, 'PROD1_001', '2022-07-04', 5113, 'd', 60200000),
(10, 'PROD1_001', '2022-07-04', 5312, 'k', 60200000),
(11, 'PGB_001', '2022-07-04', 1114, 'd', 62350000),
(12, 'PGB_001', '2022-07-04', 5111, 'k', 57000000),
(13, 'PGB_001', '2022-07-04', 5112, 'k', 1050000),
(14, 'PGB_001', '2022-07-04', 5113, 'k', 4300000),
(15, 'PGB_001', '2022-07-04', 1311, 'd', 810550000),
(16, 'PGB_001', '2022-07-04', 5111, 'k', 741000000),
(17, 'PGB_001', '2022-07-04', 5112, 'k', 13650000),
(18, 'PGB_001', '2022-07-04', 5113, 'k', 55900000),
(19, 'PMBP_001', '2022-07-04', 1113, 'd', 2147483647),
(20, 'PMBP_001', '2022-07-04', 1111, 'k', 2147483647),
(21, 'PROD2_001', '2022-07-04', 5112, 'd', 525000),
(22, 'PROD2_001', '2022-07-04', 5311, 'k', 525000),
(23, 'PROD2_001', '2022-07-04', 5113, 'd', 2150000),
(24, 'PROD2_001', '2022-07-04', 5312, 'k', 2150000),
(25, 'PROD2_001', '2022-07-04', 5135, 'd', 5368709118),
(26, 'PROD2_001', '2022-07-04', 1113, 'k', 5368709118),
(27, 'PROD2_001', '2022-07-04', 1312, 'd', 5402559118),
(28, 'PROD2_001', '2022-07-04', 1114, 'k', 31175000),
(29, 'PROD2_001', '2022-07-04', 5112, 'k', 525000),
(30, 'PROD2_001', '2022-07-04', 5113, 'k', 5370859118),
(31, 'PROD2_001', '2022-07-04', 5112, 'd', 525000),
(32, 'PROD2_001', '2022-07-04', 5311, 'k', 525000),
(33, 'PROD2_001', '2022-07-04', 5113, 'd', 2150000),
(34, 'PROD2_001', '2022-07-04', 5312, 'k', 2150000),
(35, 'PROD2_001', '2022-07-04', 5135, 'd', 5368709118),
(36, 'PROD2_001', '2022-07-04', 1113, 'k', 5368709118),
(37, 'PROD2_001', '2022-07-04', 1312, 'd', 5402559118),
(38, 'PROD2_001', '2022-07-04', 1114, 'k', 31175000),
(39, 'PROD2_001', '2022-07-04', 5112, 'k', 525000),
(40, 'PROD2_001', '2022-07-04', 5113, 'k', 5370859118),
(41, 'PENJT_001', '2022-07-04', 1111, 'd', 140466537),
(42, 'PENJT_001', '2022-07-04', 4112, 'k', 140466537),
(43, 'PENJT_001', '2022-07-04', 6112, 'd', 108051182),
(44, 'PENJT_001', '2022-07-04', 4112, 'k', 108051182),
(45, 'PENJT_002', '2022-07-04', 1111, 'd', 8427992223),
(46, 'PENJT_002', '2022-07-04', 4112, 'k', 8427992223),
(47, 'PENJT_002', '2022-07-04', 6112, 'd', 6483070941),
(48, 'PENJT_002', '2022-07-04', 4112, 'k', 6483070941),
(49, 'DPPTRNK_047', '2022-07-04', 1111, 'd', 50000),
(50, 'DPPTRNK_047', '2022-07-04', 3111, 'k', 50000),
(51, 'DPPTRNK_048', '2022-07-04', 1111, 'd', 50000),
(52, 'DPPTRNK_048', '2022-07-04', 3111, 'k', 50000),
(53, 'DPPTRNK_049', '2022-07-04', 1111, 'd', 50000),
(54, 'DPPTRNK_049', '2022-07-04', 3111, 'k', 50000),
(55, 'PMB_002', '2022-07-04', 1112, 'd', 3705000),
(56, 'PMB_002', '2022-07-04', 2111, 'k', 3705000),
(57, 'PMBS-180720220015', '2022-07-18', 2111, 'd', 1710000),
(58, 'PMBS-180720220015', '2022-07-18', 1111, 'k', 1694000),
(59, 'PMBS-180720220015', '2022-07-18', 3112, 'k', 6000),
(60, 'PMBS-180720220015', '2022-07-18', 3113, 'k', 10000),
(61, 'PMBS-180720220016', '2022-07-18', 2111, 'd', 1140000),
(62, 'PMBS-180720220016', '2022-07-18', 1111, 'k', 1126000),
(63, 'PMBS-180720220016', '2022-07-18', 3112, 'k', 4000),
(64, 'PMBS-180720220016', '2022-07-18', 3113, 'k', 10000),
(65, 'PMBS-180720220017', '2022-07-18', 2111, 'd', 855000),
(66, 'PMBS-180720220017', '2022-07-18', 1111, 'k', 842000),
(67, 'PMBS-180720220017', '2022-07-18', 3112, 'k', 3000),
(68, 'PMBS-180720220017', '2022-07-18', 3113, 'k', 10000);

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
(1, 'CK_001', '2022-07-04 23:00:24', NULL, 'BB_001', '140000', '5700', '798000000', '-', '-', '-', '140000', '5700', '798000000', '0', '0'),
(2, 'PROD1_001', '2022-07-04 23:00:36', NULL, 'BB_001', '-', '-', '-', '140000', '5700', '798000000', '0', '0', '0', '0', '0'),
(3, 'PMBP_001', '2022-07-04 23:06:55', NULL, 'BP_001', '5000000', '1000', '2147483647', '-', '-', '-', '5000000', '429.4967294', '2147483647', '0', '0'),
(4, 'PMBP_001', '2022-07-04 23:06:55', NULL, 'BP_002', '5000000', '1000', '2147483647', '-', '-', '-', '5000000', '429.4967294', '2147483647', '0', '0'),
(5, 'PMBP_001', '2022-07-04 23:06:55', NULL, 'BP_004', '5000000', '1000', '2147483647', '-', '-', '-', '5000000', '429.4967294', '2147483647', '0', '0'),
(6, 'PMBP_001', '2022-07-04 23:06:55', NULL, 'BP_005', '5000000', '1000', '2147483647', '-', '-', '-', '5000000', '429.4967294', '2147483647', '0', '0'),
(7, 'PMBP_001', '2022-07-04 23:06:55', NULL, 'BP_006', '5000000', '1000', '2147483647', '-', '-', '-', '5000000', '429.4967294', '2147483647', '0', '0'),
(8, 'PROD2_001', '2022-07-04 23:27:17', 'PR_003', 'BP_001', '-', '-', '-', '2500000', '429.4967294', '1073741823.5', '2500000', '429.4967294', '1073741823.5', '0', '0'),
(9, 'PROD2_001', '2022-07-04 23:27:17', 'PR_003', 'BP_002', '-', '-', '-', '2500000', '429.4967294', '1073741823.5', '2500000', '429.4967294', '1073741823.5', '0', '0'),
(10, 'PROD2_001', '2022-07-04 23:27:17', 'PR_003', 'BP_004', '-', '-', '-', '2500000', '429.4967294', '1073741823.5', '2500000', '429.4967294', '1073741823.5', '0', '0'),
(11, 'PROD2_001', '2022-07-04 23:27:17', 'PR_003', 'BP_005', '-', '-', '-', '2500000', '429.4967294', '1073741823.5', '2500000', '429.4967294', '1073741823.5', '0', '0'),
(12, 'PROD2_001', '2022-07-04 23:27:17', 'PR_003', 'BP_006', '-', '-', '-', '2500000', '429.4967294', '1073741823.5', '2500000', '429.4967294', '1073741823.5', '0', '0'),
(13, 'PROD2_001', '2022-07-04 23:28:51', 'PR_004', 'BP_001', '-', '-', '-', '2500000', '429.4967294', '1073741823.5', '0', '429.4967294', '0', '0', '0'),
(14, 'PROD2_001', '2022-07-04 23:28:51', 'PR_004', 'BP_002', '-', '-', '-', '2500000', '429.4967294', '1073741823.5', '0', '429.4967294', '0', '0', '0'),
(15, 'PROD2_001', '2022-07-04 23:28:51', 'PR_004', 'BP_004', '-', '-', '-', '2500000', '429.4967294', '1073741823.5', '0', '429.4967294', '0', '0', '0'),
(16, 'PROD2_001', '2022-07-04 23:28:51', 'PR_004', 'BP_005', '-', '-', '-', '2500000', '429.4967294', '1073741823.5', '0', '429.4967294', '0', '0', '0'),
(17, 'PROD2_001', '2022-07-04 23:28:51', 'PR_004', 'BP_006', '-', '-', '-', '2500000', '429.4967294', '1073741823.5', '0', '429.4967294', '0', '0', '0');

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
(1, 'PROD1_001', '2022-07-04 23:00:55', 'PR_001', '130000', '6235', '810550000', '-', '-', '-', '130000', '6235', '810550000', '0', '0'),
(2, 'PROD2_001', '2022-07-04 23:27:17', 'PR_003', '5000', '1080511.8235', '5402559117.5', '-', '-', '-', '5000', '1080511.8235', '5402559117.5', '0', '0'),
(3, 'PROD2_001', '2022-07-04 23:28:51', 'PR_004', '5000', '1080511.8235', '5402559117.5', '-', '-', '-', '5000', '1080511.8235', '5402559117.5', '0', '0'),
(4, 'PENJT_001', '2022-07-04 23:36:32', 'PR_003', '-', '-', '-', '100', '1080511.8235', '108051182.35', '4900', '1080511.8235', '5294507935.15', NULL, NULL),
(5, 'PENJT_002', '2022-07-04 23:38:22', 'PR_004', '-', '-', '-', '6000', '1080511.8235', '6483070941', '0', '0', '0', NULL, NULL);

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
(24, NULL, '2022-01-20 11:17:42', 'PTRNK_021', 0, 1112),
(25, NULL, '2022-06-28 14:30:56', 'PTRNK_038', 0, 1112);

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
(59, 'PMBS-280620220005', 'PTRNK_037', 3000, 17100000, 10000, 60000, 0, 0, 17030000),
(60, 'PMBS-280620220006', 'PTRNK_038', 1500, 7500000, 10000, 30000, 0, 0, 7460000),
(61, 'PMBS-280620220007', 'PTRNK_039', 2000, 11400000, 10000, 40000, 0, 0, 11350000),
(62, 'PMBS-120720220008', 'PTRNK_040', 300, 1710000, 10000, 6000, 0, 0, 1694000),
(63, 'PMBS-120720220009', 'PTRNK_041', 200, 1140000, 10000, 4000, 0, 0, 1126000),
(64, 'PMBS-120720220010', 'PTRNK_042', 150, 855000, 10000, 3000, 0, 0, 842000),
(65, 'PMBS-130720220011', 'PTRNK_043', 500, 2850000, 10000, 10000, 0, 0, 2830000),
(66, 'PMBS-150720220012', 'PTRNK_044', 350, 1995000, 10000, 7000, 0, 0, 1978000),
(67, 'PMBS-150720220013', 'PTRNK_045', 200, 1140000, 10000, 4000, 0, 0, 1126000),
(68, 'PMBS-150720220014', 'PTRNK_046', 100, 570000, 10000, 2000, 0, 0, 558000),
(69, 'PMBS-180720220015', 'PTRNK_047', 300, 1710000, 10000, 6000, 0, 0, 1694000),
(70, 'PMBS-180720220016', 'PTRNK_048', 200, 1140000, 10000, 4000, 0, 0, 1126000),
(71, 'PMBS-180720220017', 'PTRNK_049', 150, 855000, 10000, 3000, 0, 0, 842000);

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
(28, 'PNY20220702020', 'IDA-025', 140125000);

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
(1, 'Staff', '0', '0', NULL, '2635346361', '123123123', '', 'Data Test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(2, 'Staff', '0', '0', NULL, '1', '123', '', 'Testing 2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(3, 'Staff', '0', '0', NULL, '2', '1234', '', 'Testing 3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(4, 'Staff', '0', '0', NULL, '3', '1235', '', 'Testing 4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(5, 'Staff', '0', '0', NULL, '4', '1236', '', 'Testing 5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(6, 'Staff', '1', 'Tetap', NULL, '44', '44', '', 'Ale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(7, 'Staff', '0', '0', NULL, '55', '55', '', 'Siti', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(8, 'Staff', 'TK1', 'Tetap', 's1', '111', '111', '111111', 'Heni', 'Bandung', '0898998989', 'Bandung', '1998-03-01', 'BCA', '6330396966', '1', 0, '2021-12-04 11:17:34'),
(9, 'Staff', 'TK1', 'Tetap', NULL, '1029384756', '1029384756', '1029384756', 'Jadi andri aja namanya', 'bandung', '1029384756', 'bandung', '1991-03-03', 'BCA', '123123123', '1', 0, '2021-12-15 07:10:28'),
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

--
-- Dumping data for table `pembagian`
--

INSERT INTO `pembagian` (`no_trans`, `tgl_trans`, `no_trans_produksi1`, `status`, `status_penjs`) VALUES
('PGB_001', '2022-07-04', 'PROD1_001', '2', NULL);

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
(25, '2022-07-18', 'PMBG.SHU20220001', 'PTRNK_047', 13287470, 46060606, 59348076, ''),
(26, '2022-07-18', 'PMBG.SHU20220002', 'PTRNK_048', 12884819, 30707071, 43591890, ''),
(27, '2022-07-18', 'PMBG.SHU20220003', 'PTRNK_049', 12683494, 23030303, 35713797, '');

-- --------------------------------------------------------

--
-- Table structure for table `pembagian_shu_total`
--

CREATE TABLE `pembagian_shu_total` (
  `id` int(11) NOT NULL,
  `id_trans` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

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
('PMBY_001', '2022-06-27', '5000000', '1'),
('PMBY_002', '2022-06-28', '10000000', '1'),
('PMBY_003', '2022-07-01', '10500000', '1'),
('PMBY_004', '2022-07-01', '10500000', '1');

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
('PMBYV_000', '0000-00-00', '0', '1', '0'),
('PMBYV_001', '2022-06-27', 'PENJT_001', '0', '0');

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
('PMBS-120720220008', 1694000, '2022-07-12', 1),
('PMBS-120720220009', 1126000, '2022-07-12', 1),
('PMBS-120720220010', 842000, '2022-07-12', 1),
('PMBS-120820210002', 247600, '2021-08-12', 1),
('PMBS-130720220011', 2830000, '2022-07-13', 1),
('PMBS-141020200003', 437000, '2020-10-14', 1),
('PMBS-150720210003', 338000, '2021-07-15', 1),
('PMBS-150720220012', 1978000, '2022-07-15', 1),
('PMBS-150720220013', 1126000, '2022-07-15', 1),
('PMBS-150720220014', 558000, '2022-07-15', 1),
('PMBS-160120200002', 352800, '2020-01-16', 1),
('PMBS-160720210002', 188000, '2021-07-16', 1),
('PMBS-170220200003', 283100, '2020-02-17', 1),
('PMBS-170220210002', 464500, '2021-02-17', 1),
('PMBS-170420200003', 139000, '2020-04-17', 1),
('PMBS-171120200002', 474500, '2020-11-17', 1),
('PMBS-171220200002', 437000, '2020-12-17', 1),
('PMBS-180120210002', 437000, '2021-01-18', 1),
('PMBS-180720220015', 1694000, '2022-07-18', 1),
('PMBS-180720220016', 1126000, '2022-07-18', 1),
('PMBS-180720220017', 842000, '2022-07-18', 1),
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
('PMBS-280620220005', 17030000, '2022-06-28', 1),
('PMBS-280620220006', 7460000, '2022-06-28', 1),
('PMBS-280620220007', 11350000, '2022-06-28', 1),
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
('PMBAST20211022014', 'NOTA20211022014', '151500000', 'selesai', '2022-07-02'),
('PMBAST20220716015', 'NOTA20220716015', '151500000', 'selesai', '2022-07-02');

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
(7, 'PMB_001', '2022-07-04', 855000000, '2', 0),
(8, 'PMB_002', '2022-07-04', 3705000, '1', 0);

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
('PMBP_001', '2022-07-04', 2147483647, '1');

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
(3, '202206', '2022-06-15', 'testing jurnal', 'pengeluaran kas', 'tunai', 'testing untuk insert ke jurnal', '');

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan_bonus`
--

CREATE TABLE `pengajuan_bonus` (
  `id` int(11) NOT NULL,
  `id_pengajuan` varchar(255) NOT NULL,
  `periode` varchar(255) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengajuan_bonus`
--

INSERT INTO `pengajuan_bonus` (`id`, `id_pengajuan`, `periode`, `keterangan`, `status`) VALUES
(1, 'PENGAJUANBONUS1', '2022-05', 'Bonus lebaran', 0),
(2, 'PENGAJUANBONUS2', '2022-05', 'BONUSKERJA', 0),
(3, 'PENGAJUANBONUS050622001', '2022-06', 'bonus kerja\r\n', 0),
(4, 'PENGAJUANBONUS050622002', '2022-06', 'testing 150\r\n', 0),
(5, 'PENGAJUANBONUS050622003', '2022-06', 'bonus lagi \r\n', 0);

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
  `tgl_approve` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengajuan_jurnal`
--

INSERT INTO `pengajuan_jurnal` (`id`, `kode`, `tanggal`, `nominal`, `status`, `jenis`, `tgl_approve`) VALUES
(4, 'SHU20220001', '2022-07-18', 685147145, 'pending', 'SHU Ditahan', NULL);

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

--
-- Dumping data for table `penjualan_toko`
--

INSERT INTO `penjualan_toko` (`no_trans`, `tgl_trans`, `total`, `status`, `status_pembyv`) VALUES
('PENJT_001', '2022-07-04', '140466537.055', '1', NULL),
('PENJT_002', '2022-07-04', '8427992223.3', '1', NULL);

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
('PNY20210903019', '2021-09-03', 'IDA-024', 'September 2021', 250000, 750000),
('PNY20220702020', '2022-07-02', 'IDA-025', 'July 2022', 11375000, 11375000);

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
(5, 'PRB20210803004', 'IDA-024', '2021-08-03', 'Testing aset perbaikan', 500000, 45455),
(6, 'PRB20220802005', 'IDA-025', '0000-00-00', 'Ganti oli', 2000000, 181818),
(7, 'PRB20220716006', 'IDA-026', '0000-00-00', 'Ganti oli', 2000000, 166667);

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
('PTRNK_011', 'Agung', '082214902233', 'Bandung', NULL, 0, NULL, '', 0, 0, '2021-06-23 11:22:17'),
('PTRNK_012', 'Adit', '08112009484', 'Lembang', NULL, 0, NULL, '', 1, 0, '2021-06-27 07:01:33'),
('PTRNK_013', 'Gatot', '081295861043', 'Bandung', NULL, 0, NULL, '', 1, 0, '2021-06-27 07:01:33'),
('PTRNK_014', 'Taufiq', '081231197192', 'Cimahi', NULL, 0, NULL, '', 1, 0, '2021-06-27 07:01:35'),
('PTRNK_015', 'Iwan', '081259468020', 'Bandung Barat', NULL, 0, NULL, '', 0, 0, '2021-06-23 11:22:17'),
('PTRNK_016', 'dede', '087877472553', 'bekasi', '50000', 0, NULL, '', 0, 0, '2022-06-27 18:07:12'),
('PTRNK_017', 'assdasdasd', '087877472553', 'asdasd', '50000', 0, NULL, '', 1, 0, '2022-06-27 18:07:12'),
('PTRNK_018', 'Hanni', '123123123', 'Sukabumi', '50000', 0, NULL, '', 0, 0, '2022-06-27 18:07:12'),
('PTRNK_019', 'Andri', '321232123', 'bandung', '50000', 0, NULL, '', 0, 0, '2022-06-27 18:07:12'),
('PTRNK_020', 'testing', '1231231', 'Sukabumi', '50000', 3000000, NULL, '', 1, 0, '2022-06-27 18:07:12'),
('PTRNK_021', 'Test Data', '09829123112', 'ASDS', '50000', 0, 'TPS_001', '', 0, 0, '2022-06-27 18:07:12'),
('PTRNK_022', 'Data untuk testing', '3332211223', 'Bekasi', '50000', 0, NULL, '', 1, 0, '2022-06-27 18:07:12'),
('PTRNK_023', 'Galih', '08756315223', 'jl, cijeruk, lembang selatan', '50000', 693900, 'TPS_003', 'Sumber Susu', 1, 0, '2022-06-27 18:07:12'),
('PTRNK_024', 'Jonas', '08158274222', 'Jl, Cisaat, Lembang', '50000', 0, 'TPS_001', 'Makmur Jaya', 1, 0, '2022-06-27 18:07:12'),
('PTRNK_025', 'Yona', '08225544667', 'jl. ciraray, Lembang ', '50000', 500000, 'TPS_001', 'Abadi Jaya', 0, 0, '2022-06-27 18:07:12'),
('PTRNK_026', 'Tina', '0822516271', 'jl, cirumput, lembang selatan', '50000', 0, 'TPS_003', 'Ternak Bahagia', 1, 0, '2022-06-27 18:07:12'),
('PTRNK_027', 'Ucup', '08951432517', 'jl, cimenyan, lembang', '50000', 0, 'TPS_001', 'Bima Sakti', 1, 0, '2022-06-27 18:07:12'),
('PTRNK_028', 'dds', '1212123123', 'asdasd', '50000', 0, 'TPS_003', 'test', 1, 0, '2022-06-27 18:07:12'),
('PTRNK_029', 'tete', '231321321', 'bandung', '50000', 0, 'TPS_002', 'aaa', 1, 0, '2022-06-27 18:07:12'),
('PTRNK_030', 'astagfir', '12332112322', 'lembang utara', '50000', 0, 'TPS_001', 'aaa', 1, 0, '2022-06-27 18:07:12'),
('PTRNK_031', 'Hanifah ', '082219738419', 'Jl. wijaya kusumah, lembang utara', '50000', 150000, 'TPS_004', 'Berkah Selalu', 0, 0, '2022-06-27 18:07:12'),
('PTRNK_032', 'testingg', '0876525262', 'jalanjalan', '50000', 0, 'TPS_001', 'testingggg', 1, 0, '2022-06-27 18:07:12'),
('PTRNK_033', 'testinglagi', '0822176282', 'coba', '50000', 0, 'TPS_001', 'bismillah', 1, 0, '2022-06-27 18:07:12'),
('PTRNK_034', 'Rozak', '082219765426', 'jl. cibiru', '50000', 0, 'TPS_001', 'Fresh milk', 0, 1, '2022-06-27 18:07:12'),
('PTRNK_035', 'Budi', '08228172615', 'jl. cikidang, lembang selatan', '50000', 150000, 'TPS_003', 'Abadi Ternak', 0, 0, '2022-06-27 18:07:12'),
('PTRNK_036', 'Galih', '082222334455', 'jl. ciaul, lembang', '50000', 0, 'TPS_001', 'Go farm', 0, 0, '2022-06-27 18:07:12'),
('PTRNK_037', 'Testing sarah', '087681231237', 'Cimahi', '50000', 0, 'TPS_001', 'sarah farm ', 0, 0, '2022-06-14 13:33:33'),
('PTRNK_038', 'Anggota dua', '123123123', 'asdasd', '50000', 0, 'TPS_001', 'dua', 0, 0, '2022-06-14 14:09:51'),
('PTRNK_039', 'Anggota tiga', '1203910293', 'asjda', '50000', 0, 'TPS_003', 'asdasd', 0, 0, '2022-06-14 14:10:10'),
('PTRNK_040', 'sarah', '203958099', 'awpodkwd', '50000', 0, 'TPS_001', 'farm', 0, 0, '2022-06-27 18:28:02'),
('PTRNK_041', 'ari', '209403950', 'apowkdo', '50000', 0, 'TPS_003', 'anggur', 0, 0, '2022-06-27 18:28:33'),
('PTRNK_042', 'doni', '20930395', 'jaoijdw', '50000', 0, 'TPS_004', 'oafijefij', 0, 0, '2022-06-27 18:28:53'),
('PTRNK_043', 'aasaaa', '12313', 'dwdawd', '50000', 0, 'TPS_003', 'wdwdad', 0, 0, '2022-06-29 09:04:36'),
('PTRNK_044', 'Adi', '12342414', 'fawfwdw', '50000', 0, 'TPS_001', 'fefqwf3fffff', 0, 0, '2022-07-01 07:31:17'),
('PTRNK_045', 'Ado', '923892840', 'ikjabckjbcwda', '50000', 0, 'TPS_003', 'doijdojdidjwdiwd', 0, 0, '2022-07-01 07:31:35'),
('PTRNK_046', 'Ade', '2432412424', 'svsvevsevevev', '50000', 0, 'TPS_004', 'gegegegegegegege', 0, 0, '2022-07-01 07:31:46'),
('PTRNK_047', 'aaa', '231231124', 'adwadawdawd', '50000', 0, 'TPS_001', 'aaaaaaaaaaaaaa', 0, 0, '2022-07-04 16:48:54'),
('PTRNK_048', 'bbb', '231231232323', 'awdadwdsd', '50000', 0, 'TPS_003', 'bbbbbbbbbbbbbbbbbbbbbb', 0, 0, '2022-07-04 16:49:08'),
('PTRNK_049', 'ccc', '2312312314124', 'awdawdawd', '50000', 0, 'TPS_004', 'ccccccccccccccccccccc', 0, 0, '2022-07-04 16:49:18');

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
(14, 'PNJS20220614005', 'Sarah', 700000, 'selesai', '2022-06-14', 'susu_murni'),
(15, 'PNJSO20220614004', 'Sarah', 750000, 'selesai', '2022-06-14', 'susu_olahan');

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
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pos_detail_pembelian`
--

INSERT INTO `pos_detail_pembelian` (`id`, `invoice`, `id_supplier`, `id_produk`, `harga_satuan`, `jml`, `status`) VALUES
(1, 'PMBWASERDA120622001', 'WSS001', 'WSP001', 1750, 100, 'selesai'),
(2, 'PMBWASERDA120622002', 'WSS001', 'WSP010', 2500, 50, 'selesai'),
(3, 'PMBWASERDA120622003', 'WSS001', 'WSP002', 1500, 10, 'selesai'),
(4, 'PMBWASERDA120622004', 'WSS001', 'WSP010', 2500, 10, 'selesai'),
(5, 'PMBWASERDA120622004', 'WSS001', 'WSP001', 1750, 15, 'selesai'),
(7, 'PMBWASERDA120622005', 'WSS001', 'WSP001', 1750, 10, 'selesai'),
(8, 'PMBWASERDA120622006', 'WSS001', 'WSP011', 5000, 100, 'selesai'),
(9, 'PMBWASERDA120622007', 'WSS001', 'WSP011', 5000, 10, 'selesai'),
(10, 'PMBWASERDA120622008', 'WSS001', 'WSP011', 5000, 100, 'selesai'),
(14, 'PMBWASERDA170622009', 'WSS001', 'WSP001', 1750, 5, 'selesai'),
(15, 'PMBWASERDA170622010', 'WSS002', 'WSP012', 5000, 10, 'selesai'),
(16, 'PMBWASERDA160722011', 'WSS001', 'WSP001', 1750, 1000000, 'selesai');

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
(1, 'PNJWASERDA120622001', 'WSP001', '10', 2500, 'dalam proses'),
(2, 'PNJWASERDA120622002', 'WSP010', '5', 3500, 'dalam proses'),
(3, 'PNJWASERDA120622003', 'WSP002', '5', 2000, 'dalam proses'),
(4, 'PNJWASERDA120622004', 'WSP001', '5', 2500, 'dalam proses'),
(5, 'PNJWASERDA120622005', 'WSP001', '1', 2500, 'dalam proses'),
(6, 'PNJWASERDA120622006', 'WSP001', '1', 2500, 'dalam proses'),
(7, 'PNJWASERDA120622007', 'WSP001', '1', 2500, 'dalam proses'),
(8, 'PNJWASERDA120622008', 'WSP001', '5', 2500, 'dalam proses'),
(9, 'PNJWASERDA120622008', 'WSP010', '5', 3500, 'dalam proses'),
(10, 'PNJWASERDA120622009', 'WSP001', '78', 2500, 'dalam proses'),
(11, 'PNJWASERDA120622010', 'WSP001', '14', 2500, 'dalam proses'),
(12, 'PNJWASERDA120622011', 'WSP011', '10', 7000, 'dalam proses'),
(13, 'PNJWASERDA120622012', 'WSP011', '10', 7000, 'dalam proses'),
(14, 'PNJWASERDA120622013', 'WSP011', '81', 7000, 'dalam proses'),
(15, 'PNJWASERDA120622014', 'WSP011', '5', 7000, 'dalam proses'),
(16, 'PNJWASERDA120622015', 'WSP011', '3', 7000, 'dalam proses'),
(17, 'PNJWASERDA120622016', 'WSP011', '5', 7000, 'dalam proses'),
(18, 'PNJWASERDA170622017', 'WSP011', '10', 7000, 'dalam proses'),
(19, 'PNJWASERDA170622018', 'WSP012', '5', 7500, 'dalam proses'),
(20, 'PNJWASERDA180622019', 'WSP012', '1', 7500, 'dalam proses'),
(21, 'PNJWASERDA190622020', 'WSP001', '5', 2500, 'dalam proses'),
(22, 'PNJWASERDA280622021', 'WSP001', '10', 2500, 'dalam proses'),
(23, 'PNJWASERDA160722022', 'WSP001', '1000000', 2500, 'dalam proses');

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
(1, 'PMBWASERDA120622001', 175000, 17500, 192500, '2022-06-12', 'selesai'),
(2, 'PMBWASERDA120622002', 125000, 12500, 137500, '2022-06-12', 'selesai'),
(3, 'PMBWASERDA120622003', 15000, 1500, 16500, '2022-06-12', 'selesai'),
(4, 'PMBWASERDA120622004', 51250, 5125, 56375, '2022-06-12', 'selesai'),
(6, 'PMBWASERDA120622005', 17500, 1750, 19250, '2022-06-12', 'selesai'),
(7, 'PMBWASERDA120622006', 500000, 50000, 550000, '2022-06-12', 'selesai'),
(8, 'PMBWASERDA120622007', 50000, 5000, 55000, '2022-06-12', 'selesai'),
(9, 'PMBWASERDA120622008', 500000, 50000, 550000, '2022-06-12', 'selesai'),
(12, 'PMBWASERDA170622009', 8750, 875, 9625, '2022-06-17', 'selesai'),
(13, 'PMBWASERDA170622010', 50000, 5500, 55500, '2022-06-17', 'selesai'),
(14, 'PMBWASERDA160722011', 1750000000, 192500000, 1942500000, '2022-07-16', 'selesai');

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
(1, 'PNJWASERDA120622001', 27500, 'kredit', '2022-06-12', 'Heni', 'kredit', 0, 27500, 2500, 25000, 1, '2022-06-12 04:06:53', 'lunas'),
(2, 'PNJWASERDA120622002', 19250, 'kredit', '2022-06-12', 'Heni', 'kredit', 0, 19250, 1750, 17500, 1, '2022-06-12 04:13:08', 'lunas'),
(3, 'PNJWASERDA120622003', 11000, 'terbayar', '2022-06-12', 'Heni', 'tunai', 0, 11000, 1000, 10000, 1, '2022-06-12 04:15:16', NULL),
(4, 'PNJWASERDA120622004', 13750, 'terbayar', '2022-06-12', 'Heni', 'tunai', 0, 13750, 1250, 12500, 1, '2022-06-12 04:42:55', NULL),
(5, 'PNJWASERDA120622005', 2750, 'terbayar', '2022-06-12', 'Guest', '', 0, 2750, 250, 2500, 2, '2022-06-12 04:47:24', NULL),
(6, 'PNJWASERDA120622006', 2750, 'terbayar', '2022-06-12', 'test', '', 0, 2750, 250, 2500, 2, '2022-06-12 04:53:32', NULL),
(7, 'PNJWASERDA120622007', 2750, 'terbayar', '2022-06-12', 'Guest', '', 0, 2750, 250, 2500, 2, '2022-06-12 05:20:19', NULL),
(8, 'PNJWASERDA120622008', 33000, 'terbayar', '2022-06-12', 'Guest', '', 0, 33000, 3000, 30000, 2, '2022-06-12 05:31:32', NULL),
(9, 'PNJWASERDA120622009', 214500, 'terbayar', '2022-06-12', 'Testing 2', 'tunai', 0, 214500, 19500, 195000, 1, '2022-06-12 05:45:49', NULL),
(10, 'PNJWASERDA120622010', 38500, 'terbayar', '2022-06-12', 'Heni', 'tunai', 0, 38500, 3500, 35000, 1, '2022-06-12 05:52:12', NULL),
(11, 'PNJWASERDA120622011', 77000, 'terbayar', '2022-06-12', 'Test Data', 'tunai', 0, 77000, 7000, 70000, 1, '2022-06-12 06:57:52', NULL),
(12, 'PNJWASERDA120622012', 77000, 'terbayar', '2022-06-12', 'Heni', 'tunai', 0, 77000, 7000, 70000, 1, '2022-06-12 07:11:02', NULL),
(13, 'PNJWASERDA120622013', 623700, 'terbayar', '2022-06-12', 'Data Test', 'tunai', 0, 623700, 56700, 567000, 1, '2022-06-12 07:13:21', NULL),
(14, 'PNJWASERDA120622014', 38500, 'terbayar', '2022-06-12', 'Data Test', 'tunai', 0, 38500, 3500, 35000, 1, '2022-06-12 07:15:22', NULL),
(15, 'PNJWASERDA120622015', 23100, 'terbayar', '2022-06-12', 'Data Test', 'tunai', 0, 23100, 2100, 21000, 1, '2022-06-12 07:19:50', NULL),
(16, 'PNJWASERDA120622016', 38500, 'terbayar', '2022-06-12', 'Guest', '', 0, 38500, 3500, 35000, 2, '2022-06-12 07:20:37', NULL),
(17, 'PNJWASERDA170622017', 77700, 'terbayar', '2022-06-17', 'Data Test', 'tunai', 0, 77700, 7700, 70000, 1, '2022-06-17 12:38:34', NULL),
(18, 'PNJWASERDA170622018', 41625, 'terbayar', '2022-06-17', 'Guest', '', 0, 41625, 4125, 37500, 2, '2022-06-17 14:13:12', NULL),
(19, 'PNJWASERDA180622019', 8325, 'terbayar', '2022-06-18', 'Guest', '', 0, 8325, 825, 7500, 2, '2022-06-18 08:23:56', NULL),
(20, 'PNJWASERDA190622020', 13875, 'terbayar', '2022-06-19', 'Guest', '', 0, 13875, 1375, 12500, 2, '2022-06-19 01:00:50', NULL),
(21, 'PNJWASERDA280622021', 27750, 'terbayar', '2022-06-28', 'Iwan', 'tunai', 2250, 30000, 2750, 25000, 1, '2022-06-27 17:36:26', NULL),
(22, 'PNJWASERDA160722022', 2147483647, 'terbayar', '2022-07-16', 'Jadi andri aja namanya', 'tunai', 0, 2147483647, 275000000, 2147483647, 1, '2022-07-16 12:43:25', NULL);

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
('PR_001', 'Susu Sapi', 260000, '8105.5', 'liter', 0),
('PR_002', 'Susu Murni', 17800, '112801', 'liter', 0),
('PR_003', 'Pasteur Coklat', 11020, '1404665.37055', 'liter', 0),
('PR_004', 'Pasteur Vanila', 210, '1404665.37055', 'liter', 0),
('PR_005', 'Pasteur Strawberry', 1210, '10374', 'liter', 0),
('PR_006', 'Yoghurt Strawberry', -3700, '10228.4', 'liter', 0),
('PR_007', 'Yoghurt Anggur', -700, '10228.4', 'liter', 0),
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
('PROD1_001', '2022-07-04', 'CK_001', '2');

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
('PROD2_001', '2022-07-04', 'TP_001', '1');

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
(1, 'Pagi', '08:00:00', '15:00:00'),
(2, 'Sore', '15:01:00', '23:00:00');

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
('JS-001', 'Simpanan Pokok', '25000'),
('JS-002', 'Manasuka', '10000'),
('JS-003', 'testing buat hani', '15000'),
('JS-004', 'Simpanan Pokok', '50000');

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
('TP_001', '2022-07-04', '2022-07-04', '2', 'PGB_001');

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
(2, 'CUTI20220612002', '2022-06-12 09:55:39', '1029384756', 1, '2022-06-12', '2022-06-13', 'test', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tb_detail_jurnal_gaji`
--

CREATE TABLE `tb_detail_jurnal_gaji` (
  `id` int(11) NOT NULL,
  `t_gaji_pokok` int(50) DEFAULT NULL,
  `t_tunjangan_kesehatan` int(50) DEFAULT NULL,
  `t_tunjangan_jabatan` int(50) DEFAULT NULL,
  `t_bonus` int(50) DEFAULT NULL,
  `t_utang_pph` int(50) DEFAULT NULL,
  `t_kas` int(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(28, 'GAJI-003', 3000000, 300000, 300000, 4000000, 0, 7600000, 0, 7600000),
(29, 'GAJI-004', 3000000, 300000, 300000, 0, 0, 3600000, 0, 3600000),
(30, 'GAJI-005', 5800000, 300000, 300000, 150000, 29000, 6550000, 29000, 6521000);

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
(2, 'Tetap', 's1', 5800000),
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
(5, 'LMBR20220513002', '2022-05-13', '111', 2, 1, 20000, 40000),
(6, 'LMBR20220612003', '2022-06-12', 'Jadi andri aja namanya', 4, 0, 20000, 80000),
(7, 'LMBR20220612004', '2022-06-12', '1029384756', 2, 1, 20000, 40000);

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
(30, 'GAJI-003', '2022-05-28', 'Heni', 7600000, NULL),
(31, 'GAJI-004', '2022-06-18', 'test data', 3600000, NULL),
(32, 'GAJI-005', '2022-06-18', 'Jadi andri aja namanya', 6521000, NULL);

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
(3, 'HPP-0003', '2022-01-10', 'Susu Olahan', 2500000);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_shu`
--

CREATE TABLE `transaksi_shu` (
  `id` int(11) NOT NULL,
  `kode_shu` varchar(50) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `nominal` int(11) DEFAULT NULL,
  `tahunselanjutnya` int(11) NOT NULL DEFAULT 218620809,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi_shu`
--

INSERT INTO `transaksi_shu` (`id`, `kode_shu`, `tanggal`, `nominal`, `tahunselanjutnya`, `status`) VALUES
(15, 'SHU20220001', '2022-07-18', 1272416126, 685147145, 2);

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
(8, 'PNY20220702020', '2022-07-02 12:01:07', 11375000, 11375000, 140125000, 0, 0, 0, 'IDA-025');

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
(17, 'Bagian Keuangan', 'bagian_keuangan', '123', 'bagian_keuangan', NULL);

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
(1, 'PMBWASERDA120622001', 'WSP001', '2022-06-12 04:06:16', NULL, '100', '1750', '175000', '0', '0', '0', '100', '1750', '175000'),
(2, 'PNJWASERDA120622001', 'WSP001', '2022-06-12 04:08:32', '', '0', '0', '0', '10', '2500', '25000', '90', '2500', '225000'),
(3, 'PMBWASERDA120622002', 'WSP010', '2022-06-12 04:12:44', NULL, '50', '2500', '125000', '0', '0', '0', '50', '2500', '125000'),
(4, 'PNJWASERDA120622002', 'WSP010', '2022-06-12 04:13:25', '', '0', '0', '0', '5', '3500', '17500', '45', '3500', '157500'),
(5, 'PMBWASERDA120622003', 'WSP002', '2022-06-12 04:15:03', NULL, '10', '1500', '15000', '0', '0', '0', '10', '1500', '15000'),
(6, 'PNJWASERDA120622003', 'WSP002', '2022-06-12 04:15:28', '', '0', '0', '0', '5', '2000', '10000', '5', '2000', '10000'),
(7, 'PNJWASERDA120622004', 'WSP001', '2022-06-12 04:45:59', '', '0', '0', '0', '5', '2500', '12500', '85', '2500', '212500'),
(8, 'PNJWASERDA120622005', 'WSP001', '2022-06-12 04:52:58', '', '0', '0', '0', '1', '2500', '2500', '84', '2500', '210000'),
(9, 'PNJWASERDA120622006', 'WSP001', '2022-06-12 04:53:39', '', '0', '0', '0', '1', '2500', '2500', '83', '2500', '207500'),
(10, 'PNJWASERDA120622007', 'WSP001', '2022-06-12 05:29:48', '', '0', '0', '0', '1', '2500', '2500', '82', '2500', '205000'),
(11, 'PMBWASERDA120622004', 'WSP010', '2022-06-12 05:30:40', NULL, '10', '2500', '25000', '0', '0', '0', '45', '2500', '112500'),
(12, 'PMBWASERDA120622004', 'WSP010', '2022-06-12 05:30:40', NULL, '0', '0', '0', '0', '0', '0', '10', '2500', '25000'),
(13, 'PMBWASERDA120622004', 'WSP001', '2022-06-12 05:30:41', NULL, '15', '1750', '26250', '0', '0', '0', '82', '1750', '143500'),
(14, 'PMBWASERDA120622004', 'WSP001', '2022-06-12 05:30:41', NULL, '0', '0', '0', '0', '0', '0', '15', '1750', '26250'),
(15, 'PNJWASERDA120622008', 'WSP001', '2022-06-12 05:31:46', '', '0', '0', '0', '5', '2500', '12500', '77', '2500', '192500'),
(16, 'PNJWASERDA120622008', 'WSP001', '2022-06-12 05:31:46', '', '0', '0', '0', '0', '0', '0', '15', '2500', '37500'),
(17, 'PNJWASERDA120622008', 'WSP010', '2022-06-12 05:31:46', '', '0', '0', '0', '5', '3500', '17500', '40', '3500', '140000'),
(18, 'PNJWASERDA120622008', 'WSP010', '2022-06-12 05:31:46', '', '0', '0', '0', '0', '0', '0', '10', '3500', '35000'),
(19, 'PNJWASERDA120622009', 'WSP001', '2022-06-12 05:46:16', '', '0', '0', '0', '78', '2500', '195000', '14', '2500', '35000'),
(25, 'PMBWASERDA120622005', 'WSP001', '2022-06-12 05:51:31', NULL, '10', '1750', '17500', '0', '0', '0', '14', '1750', '24500'),
(26, 'PMBWASERDA120622005', 'WSP001', '2022-06-12 05:51:31', NULL, '0', '0', '0', '0', '0', '0', '10', '1750', '17500'),
(27, 'PNJWASERDA120622010', 'WSP001', '2022-06-12 05:52:20', '', '0', '0', '0', '14', '2500', '35000', '10', '2500', '25000'),
(28, 'PMBWASERDA120622006', 'WSP011', '2022-06-12 06:57:38', NULL, '100', '5000', '500000', '0', '0', '0', '100', '5000', '500000'),
(29, 'PNJWASERDA120622011', 'WSP011', '2022-06-12 06:58:02', '', '0', '0', '0', '10', '7000', '70000', '0', '0', '0'),
(30, 'PNJWASERDA120622011', 'WSP011', '2022-06-12 06:58:02', '', '0', '0', '0', '0', '0', '0', '90', '7000', '630000'),
(31, 'PNJWASERDA120622012', 'WSP011', '2022-06-12 07:11:39', '', '0', '0', '0', '10', '7000', '70000', '80', '7000', '560000'),
(32, 'PMBWASERDA120622007', 'WSP011', '2022-06-12 07:12:53', NULL, '10', '5000', '50000', '0', '0', '0', '80', '5000', '400000'),
(33, 'PMBWASERDA120622007', 'WSP011', '2022-06-12 07:12:53', NULL, '0', '0', '0', '0', '0', '0', '10', '5000', '50000'),
(34, 'PNJWASERDA120622013', 'WSP011', '2022-06-12 07:13:29', '', '0', '0', '0', '81', '7000', '567000', '0', '0', '0'),
(35, 'PNJWASERDA120622013', 'WSP011', '2022-06-12 07:13:30', '', '0', '0', '0', '0', '0', '0', '9', '7000', '63000'),
(36, 'PNJWASERDA120622014', 'WSP011', '2022-06-12 07:15:36', '', '0', '0', '0', '5', '7000', '35000', '4', '7000', '28000'),
(37, 'PMBWASERDA120622008', 'WSP011', '2022-06-12 07:19:13', NULL, '100', '5000', '500000', '0', '0', '0', '4', '5000', '20000'),
(38, 'PMBWASERDA120622008', 'WSP011', '2022-06-12 07:19:13', NULL, '0', '0', '0', '0', '0', '0', '100', '5000', '500000'),
(39, 'PNJWASERDA120622015', 'WSP011', '2022-06-12 07:20:00', '', '0', '0', '0', '3', '7000', '21000', '1', '7000', '7000'),
(40, 'PNJWASERDA120622015', 'WSP011', '2022-06-12 07:20:00', '', '0', '0', '0', '0', '0', '0', '100', '7000', '700000'),
(41, 'PNJWASERDA120622016', 'WSP011', '2022-06-12 07:20:44', '', '0', '0', '0', '5', '7000', '35000', '0', '0', '0'),
(42, 'PNJWASERDA120622016', 'WSP011', '2022-06-12 07:20:45', '', '0', '0', '0', '0', '0', '0', '96', '7000', '672000'),
(43, 'PNJWASERDA170622017', 'WSP011', '2022-06-17 12:46:01', '', '0', '0', '0', '10', '7000', '70000', '86', '7000', '602000'),
(44, 'PMBWASERDA170622009', 'WSP001', '2022-06-17 13:03:25', NULL, '5', '1750', '8750', '0', '0', '0', '10', '1750', '17500'),
(45, 'PMBWASERDA170622009', 'WSP001', '2022-06-17 13:03:25', NULL, '0', '0', '0', '0', '0', '0', '5', '1750', '8750'),
(46, 'PMBWASERDA170622010', 'WSP012', '2022-06-17 13:05:53', NULL, '10', '5000', '50000', '0', '0', '0', '10', '5000', '50000'),
(47, 'PNJWASERDA170622018', 'WSP012', '2022-06-17 14:13:26', '', '0', '0', '0', '5', '7500', '37500', '5', '7500', '37500'),
(48, 'PNJWASERDA180622019', 'WSP012', '2022-06-18 08:24:16', '', '0', '0', '0', '1', '7500', '7500', '4', '7500', '30000'),
(49, 'PNJWASERDA190622020', 'WSP001', '2022-06-19 01:01:08', '', '0', '0', '0', '5', '2500', '12500', '5', '2500', '12500'),
(50, 'PNJWASERDA190622020', 'WSP001', '2022-06-19 01:01:08', '', '0', '0', '0', '0', '0', '0', '5', '2500', '12500'),
(51, 'PNJWASERDA280622021', 'WSP001', '2022-06-27 17:36:39', '', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(52, 'PNJWASERDA280622021', 'WSP001', '2022-06-27 17:36:39', '', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(53, 'PNJWASERDA280622021', 'WSP001', '2022-06-27 17:36:39', '', '0', '0', '0', '10', '2500', '25000', '10', '2500', '25000'),
(54, 'PMBWASERDA160722011', 'WSP001', '2022-07-16 12:42:57', NULL, '1000000', '1750', '1750000000', '0', '0', '0', '1000000', '1750', '1750000000'),
(55, 'PNJWASERDA160722022', 'WSP001', '2022-07-16 12:43:49', '', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(56, 'PNJWASERDA160722022', 'WSP001', '2022-07-16 12:43:49', '', '0', '0', '0', '1000000', '2500', '2500000000', '1000000', '2500', '2500000000');

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
('PNJWASERDA120622001', 'WSP001', 1),
('PNJWASERDA120622002', 'WSP010', 1),
('PNJWASERDA120622003', 'WSP002', 1),
('PNJWASERDA120622004', 'WSP001', 1),
('PNJWASERDA120622005', 'WSP001', 1),
('PNJWASERDA120622006', 'WSP001', 1),
('PNJWASERDA120622007', 'WSP001', 1),
('PNJWASERDA120622008', 'WSP001', 2),
('PNJWASERDA120622008', 'WSP010', 2),
('PNJWASERDA120622009', 'WSP001', 2),
('PNJWASERDA120622010', 'WSP001', 2),
('PNJWASERDA120622011', 'WSP011', 1),
('PNJWASERDA120622012', 'WSP011', 1),
('PNJWASERDA120622013', 'WSP011', 2),
('PNJWASERDA120622014', 'WSP011', 1),
('PNJWASERDA120622015', 'WSP011', 2),
('PNJWASERDA120622016', 'WSP011', 2),
('PNJWASERDA170622017', 'WSP011', 1),
('PNJWASERDA170622018', 'WSP012', 1),
('PNJWASERDA180622019', 'WSP012', 1),
('PNJWASERDA190622020', 'WSP001', 2),
('PNJWASERDA280622021', 'WSP001', 2),
('PNJWASERDA160722022', 'WSP001', 1);

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
(1, 'WSP001', 'Stok Masuk', 100, 0, '2022-06-12 04:06:16'),
(2, 'WSP010', 'Stok Masuk', 50, 40, '2022-06-12 04:12:44'),
(3, 'WSP002', 'Stok Masuk', 10, 5, '2022-06-12 04:15:03'),
(4, 'WSP010', 'Stok Masuk', 10, 10, '2022-06-12 05:30:40'),
(5, 'WSP001', 'Stok Masuk', 15, 0, '2022-06-12 05:30:41'),
(8, 'WSP001', 'Stok Masuk', 10, 0, '2022-06-12 05:51:30'),
(9, 'WSP011', 'Stok Masuk', 100, 0, '2022-06-12 06:57:37'),
(10, 'WSP011', 'Stok Masuk', 10, 0, '2022-06-12 07:12:53'),
(11, 'WSP011', 'Stok Masuk', 100, 86, '2022-06-12 07:19:13'),
(12, 'WSP001', 'Stok Masuk', 5, 0, '2022-06-17 13:03:25'),
(13, 'WSP012', 'Stok Masuk', 10, 4, '2022-06-17 13:05:53'),
(14, 'WSP001', 'Stok Masuk', 1000000, 0, '2022-07-16 12:42:57');

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
(1, 'PMB-KR-20220612001', 'PNJWASERDA120622001', '2022-06-12', 'Heni', 'pegawai', 27500, '2022-06-12 04:08:31', 1),
(2, 'PMB-KR-20220612002', 'PNJWASERDA120622002', '2022-06-12', 'Heni', 'pegawai', 19250, '2022-06-12 04:13:25', 1);

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
(1, 'PNGBBN20220612001', '2022-06-12', '5221', 'asd', 500000, '2022-06-12 04:16:43');

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
  `tgl_kadaluarsa` date DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `waserda_produk`
--

INSERT INTO `waserda_produk` (`id`, `kode`, `barcode_id`, `id_kategori`, `id_supplier_produk`, `nama_produk`, `harga_satuan`, `harga_jual`, `satuan_produk`, `jml`, `tgl_kadaluarsa`, `status`, `created_at`) VALUES
(1, 'WSP001', '8886008101053', 'WSK001', 'WSS001', 'Indomie Goreng', 1750, 2500, 'pcs', 20, '2022-06-17', 1, '2021-10-15 15:38:31'),
(2, 'WSP002', '91823871221', 'WSK001', 'WSS001', 'Indomie Goreng Ayam Bawang Aja', 1500, 2000, 'pcs', 5, NULL, 1, '2021-10-15 15:38:31'),
(3, 'WSP003', NULL, 'WSK001', 'WSS002', 'Indomie Goreng Rendang', 1500, 2000, 'pcs', 0, NULL, 1, '2021-10-15 15:38:31'),
(4, 'WSP004', NULL, 'WSK001', 'WSS003', 'Indomie Goreng Aceh', 1500, 2000, 'pcs', 0, NULL, 1, '2021-10-15 15:38:31'),
(5, 'WSP005', '8995102800448', 'WSK001', 'WSS001', 'Indomie Rebus', 1500, 2000, 'pcs', 0, '2022-06-17', 1, '2021-10-15 15:38:31'),
(6, 'WSP006', NULL, 'WSK002', 'WSS004', 'teh sisri', 15000, 2000, 'kilo', 0, NULL, 1, '2021-10-16 16:02:42'),
(7, 'WSP007', '007', 'WSK003', 'WSS001', 'Pulpen', 3000, 3500, 'pcs', 0, '2022-06-17', 1, '2021-11-16 14:29:13'),
(8, 'WSP008', '1212', 'WSK003', 'WSS001', 'Penghapus untuk pulpen', 2500, 3000, 'pcs', 0, '2022-06-17', 0, '2021-12-29 15:00:27'),
(9, 'WSP009', NULL, 'WSK003', 'WSS001', 'Penggaris', 3000, 0, 'pcs', 0, '2022-06-17', 0, '2022-01-07 14:06:42'),
(10, 'WSP010', '112233445566778899', 'WSK001', 'WSS001', 'Cireng', 2500, 3500, 'pcs', 50, '2022-06-17', 1, '2022-06-12 04:12:28'),
(11, 'WSP011', '90129102', 'WSK001', 'WSS001', 'Testing Data', 5000, 7000, 'pcs', 86, '2022-06-17', 1, '2022-06-12 06:57:24'),
(12, 'WSP012', '561728932', 'WSK001', 'WSS002', 'TESTING DATA MAKANAN', 5000, 7500, 'pcs', 4, '2025-12-01', 1, '2022-06-16 14:04:32');

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
-- Indexes for table `pembagian_shu_total`
--
ALTER TABLE `pembagian_shu_total`
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
-- Indexes for table `tb_detail_jurnal_gaji`
--
ALTER TABLE `tb_detail_jurnal_gaji`
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
-- Indexes for table `waserda_kartu_stok`
--
ALTER TABLE `waserda_kartu_stok`
  ADD PRIMARY KEY (`no`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
-- AUTO_INCREMENT for table `buku_kas_kecil`
--
ALTER TABLE `buku_kas_kecil`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `buku_pembantu_kas`
--
ALTER TABLE `buku_pembantu_kas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `coa`
--
ALTER TABLE `coa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `detail_absen_rfid`
--
ALTER TABLE `detail_absen_rfid`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `detail_cek_kualitas`
--
ALTER TABLE `detail_cek_kualitas`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `detail_pembagian`
--
ALTER TABLE `detail_pembagian`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `detail_pembelian`
--
ALTER TABLE `detail_pembelian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `detail_pembelian_bb`
--
ALTER TABLE `detail_pembelian_bb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `detail_pembelian_bp`
--
ALTER TABLE `detail_pembelian_bp`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `detail_penerimaan_pengeluaran_kas`
--
ALTER TABLE `detail_penerimaan_pengeluaran_kas`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `detail_penjualan_ips`
--
ALTER TABLE `detail_penjualan_ips`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `detail_penjualan_toko`
--
ALTER TABLE `detail_penjualan_toko`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `detail_produksi_ke1`
--
ALTER TABLE `detail_produksi_ke1`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `detail_produksi_ke2`
--
ALTER TABLE `detail_produksi_ke2`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `detail_target_produksi`
--
ALTER TABLE `detail_target_produksi`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `detail_transaksi_shu`
--
ALTER TABLE `detail_transaksi_shu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `jadwal_shift`
--
ALTER TABLE `jadwal_shift`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `jenis_penjualan`
--
ALTER TABLE `jenis_penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jurnal`
--
ALTER TABLE `jurnal`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `kartu_stok_bp`
--
ALTER TABLE `kartu_stok_bp`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `kartu_stok_penj`
--
ALTER TABLE `kartu_stok_penj`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `log_bayar_pinjaman`
--
ALTER TABLE `log_bayar_pinjaman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `log_confirm_truck`
--
ALTER TABLE `log_confirm_truck`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `log_pembayaran_susu`
--
ALTER TABLE `log_pembayaran_susu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `log_penyusutan`
--
ALTER TABLE `log_penyusutan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `pembagian_shu_total`
--
ALTER TABLE `pembagian_shu_total`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pembelian_bb`
--
ALTER TABLE `pembelian_bb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `penerimaan_kas`
--
ALTER TABLE `penerimaan_kas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `penerimaan_pengeluaran_kas`
--
ALTER TABLE `penerimaan_pengeluaran_kas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pengajuan_bonus`
--
ALTER TABLE `pengajuan_bonus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pengajuan_jurnal`
--
ALTER TABLE `pengajuan_jurnal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pengeluaran_kas`
--
ALTER TABLE `pengeluaran_kas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `perbaikan`
--
ALTER TABLE `perbaikan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `pos_detail_penjualan`
--
ALTER TABLE `pos_detail_penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `pos_pembelian`
--
ALTER TABLE `pos_pembelian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `pos_penjualan`
--
ALTER TABLE `pos_penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
-- AUTO_INCREMENT for table `tb_detail_jurnal_gaji`
--
ALTER TABLE `tb_detail_jurnal_gaji`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_detail_penggajian`
--
ALTER TABLE `tb_detail_penggajian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_penggajian`
--
ALTER TABLE `tb_penggajian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transaksi_shu`
--
ALTER TABLE `transaksi_shu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `trans_peny_rev`
--
ALTER TABLE `trans_peny_rev`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `truck_information`
--
ALTER TABLE `truck_information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `update_stok_penj`
--
ALTER TABLE `update_stok_penj`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
-- AUTO_INCREMENT for table `waserda_kartu_stok`
--
ALTER TABLE `waserda_kartu_stok`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `waserda_kategori`
--
ALTER TABLE `waserda_kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `waserda_log_transaksi`
--
ALTER TABLE `waserda_log_transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `waserda_pembayaran_kredit`
--
ALTER TABLE `waserda_pembayaran_kredit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `waserda_pengajuan_barang`
--
ALTER TABLE `waserda_pengajuan_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `waserda_pengeluaran_beban`
--
ALTER TABLE `waserda_pengeluaran_beban`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `waserda_produk`
--
ALTER TABLE `waserda_produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `waserda_supplier`
--
ALTER TABLE `waserda_supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
