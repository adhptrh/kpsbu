-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 09, 2020 at 02:23 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pa_dilla`
--

-- --------------------------------------------------------

--
-- Table structure for table `aset`
--

CREATE TABLE `aset` (
  `id` varchar(255) NOT NULL,
  `aset` varchar(255) NOT NULL,
  `umur_aset` int(11) NOT NULL,
  `id_supplier` varchar(233) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aset`
--

INSERT INTO `aset` (`id`, `aset`, `umur_aset`, `id_supplier`) VALUES
('AS-01', 'Mobil', 3, 'SPA-01'),
('AS-02', 'Laptop', 3, 'SPA-01'),
('AS-03', 'Motor', 2, 'SPA-02'),
('AS-04', 'Komputer', 1, 'SPA-02'),
('AS-05', 'Kamera', 1, 'SPA-02'),
('AS-06', 'Mesin', 5, 'SPA-01'),
('AS-07', 'testing', 36, 'SPA-01'),
('AS-08', 'testing kedua', 12, 'SPA-02');

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
  `no_coa` int(11) NOT NULL,
  `nama_coa` varchar(50) NOT NULL,
  `jenis_coa` varchar(50) NOT NULL,
  `saldo_awal` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coa`
--

INSERT INTO `coa` (`no_coa`, `nama_coa`, `jenis_coa`, `saldo_awal`) VALUES
(1111, 'Kas', '', 0),
(1112, 'Persediaan Bahan Baku', '', 0),
(1113, 'Persediaan Bahan Penolong', '', 0),
(1114, 'Persediaan Produk Dalam Proses', '', 0),
(1120, 'Peralatan', '', 0),
(1122, 'Akumulasi penyusutan peralatan', '', 0),
(1311, 'Persediaan Produk Jadi IPS', '', 0),
(1312, 'Persediaan Produk Jadi Toko', '', 0),
(4111, 'Penjualan IPS', '', 0),
(4112, 'Penjualan Toko', '', 0),
(5111, 'Produk Dalam Proses - BBB', '', 0),
(5112, 'Produk Dalam Proses - BTK', '', 0),
(5113, 'Produk Dalam Proses - BOP', '', 0),
(5134, 'BOP Tetap Sesungguhnya', '', 0),
(5135, 'BOP Sesungguhnya', '', 0),
(5211, 'Beban Administrasi dan Umum Variabel', '', 0),
(5212, 'Beban Pemasaran Variabel', '', 0),
(5213, 'Beban Angkut Penjualan', '', 0),
(5221, 'Beban Listrik, Air dan Telepon', '', 0),
(5222, 'Beban Administrasi dan Umum Tetap', '', 0),
(5223, 'Beban Pemasaran Tetap', '', 0),
(5311, 'Beban Upah dan Gaji', '', 0),
(5312, 'BOP Dibebankan', '', 0),
(6111, 'Harga Pokok Penjualan IPS', '', 0),
(6112, 'Harga Pokok Penjualan Toko', '', 0);

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
  `cek_bulan_peny` varchar(11) NOT NULL DEFAULT '0000-00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_pembelian`
--

INSERT INTO `detail_pembelian` (`id`, `id_pembelian`, `id_aset`, `id_supplier`, `nominal`, `biaya`, `subtotal`, `nilai_sisa`, `sisa_umur`, `sisa_umur_aset`, `tgl_nota`, `cek_bulan_peny`) VALUES
(1, 'PMBAST20201209001', 'AS-08', 'SPA-02', 4000000, 50000, '4050000', '2000000', '11', '12', '2020-12-09', '2020-12');

-- --------------------------------------------------------

--
-- Table structure for table `detail_pembelian_bb`
--

CREATE TABLE `detail_pembelian_bb` (
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

INSERT INTO `detail_pembelian_bb` (`no_trans`, `no_bb`, `jumlah`, `harga`, `subtotal`, `no_peternak`) VALUES
('PMB_001', 'BB_001', 2, '10000', 20000, 'PTRNK_016'),
('PMB_002', 'BB_001', 9, '7000', 63000, 'PTRNK_016'),
('PMB_002', 'BB_001', 3, '7500', 22500, 'PTRNK_016'),
('PMB_002', 'BB_001', 3, '5000', 15000, 'PTRNK_016'),
('PMB_002', 'BB_001', 10, '8500', 85000, 'PTRNK_016'),
('PMB_003', 'BB_001', 10, '5000', 50000, 'PTRNK_016'),
('PMB_003', 'BB_001', 6, '6000', 36000, 'PTRNK_016'),
('PMB_003', 'BB_001', 7, '7900', 55300, 'PTRNK_016'),
('PMB_003', 'BB_001', 8, '8900', 71200, 'PTRNK_016'),
('PMB_003', 'BB_001', 9, '9500', 85500, 'PTRNK_016'),
('PMB_004', 'BB_001', 3, '11111', 33333, 'PTRNK_017');

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
(1, 'CK_001', '2020-07-26', 1112, 'd', 700000000),
(2, 'CK_001', '2020-07-26', 1111, 'k', 700000000),
(3, 'PROD1_001', '2020-07-26', 5111, 'd', 700000000),
(4, 'PROD1_001', '2020-07-26', 1112, 'k', 700000000),
(5, 'PROD1_001', '2020-07-26', 5112, 'd', 42000000),
(6, 'PROD1_001', '2020-07-26', 5311, 'k', 42000000),
(7, 'PROD1_001', '2020-07-26', 5113, 'd', 126000000),
(8, 'PROD1_001', '2020-07-26', 5312, 'k', 126000000),
(9, 'PGB_001', '2020-07-26', 1114, 'd', 62000000),
(10, 'PGB_001', '2020-07-26', 5111, 'k', 50000000),
(11, 'PGB_001', '2020-07-26', 5112, 'k', 3000000),
(12, 'PGB_001', '2020-07-26', 5113, 'k', 9000000),
(13, 'PGB_001', '2020-07-26', 1311, 'd', 806000000),
(14, 'PGB_001', '2020-07-26', 5111, 'k', 650000000),
(15, 'PGB_001', '2020-07-26', 5112, 'k', 39000000),
(16, 'PGB_001', '2020-07-26', 5113, 'k', 117000000),
(17, 'PMBP_001', '2020-07-26', 1113, 'd', 17500000),
(18, 'PMBP_001', '2020-07-26', 1111, 'k', 17500000),
(19, 'PROD2_001', '2020-07-26', 5112, 'd', 900000),
(20, 'PROD2_001', '2020-07-26', 5311, 'k', 900000),
(21, 'PROD2_001', '2020-07-26', 5113, 'd', 2700000),
(22, 'PROD2_001', '2020-07-26', 5312, 'k', 2700000),
(23, 'PROD2_001', '2020-07-26', 5135, 'd', 495000),
(24, 'PROD2_001', '2020-07-26', 1113, 'k', 495000),
(25, 'PROD2_001', '2020-07-26', 1312, 'd', 22695000),
(26, 'PROD2_001', '2020-07-26', 1114, 'k', 18600000),
(27, 'PROD2_001', '2020-07-26', 5112, 'k', 900000),
(28, 'PROD2_001', '2020-07-26', 5113, 'k', 3195000),
(29, 'PROD2_001', '2020-07-26', 5112, 'd', 300000),
(30, 'PROD2_001', '2020-07-26', 5311, 'k', 300000),
(31, 'PROD2_001', '2020-07-26', 5113, 'd', 900000),
(32, 'PROD2_001', '2020-07-26', 5312, 'k', 900000),
(33, 'PROD2_001', '2020-07-26', 5135, 'd', 605000),
(34, 'PROD2_001', '2020-07-26', 1113, 'k', 605000),
(35, 'PROD2_001', '2020-07-26', 1312, 'd', 8005000),
(36, 'PROD2_001', '2020-07-26', 1114, 'k', 6200000),
(37, 'PROD2_001', '2020-07-26', 5112, 'k', 300000),
(38, 'PROD2_001', '2020-07-26', 5113, 'k', 1505000),
(39, 'PROD2_001', '2020-07-26', 5112, 'd', 300000),
(40, 'PROD2_001', '2020-07-26', 5311, 'k', 300000),
(41, 'PROD2_001', '2020-07-26', 5113, 'd', 900000),
(42, 'PROD2_001', '2020-07-26', 5312, 'k', 900000),
(43, 'PROD2_001', '2020-07-26', 5135, 'd', 605000),
(44, 'PROD2_001', '2020-07-26', 1113, 'k', 605000),
(45, 'PROD2_001', '2020-07-26', 1312, 'd', 8005000),
(46, 'PROD2_001', '2020-07-26', 1114, 'k', 6200000),
(47, 'PROD2_001', '2020-07-26', 5112, 'k', 300000),
(48, 'PROD2_001', '2020-07-26', 5113, 'k', 1505000),
(49, 'PROD2_001', '2020-07-26', 5112, 'd', 300000),
(50, 'PROD2_001', '2020-07-26', 5311, 'k', 300000),
(51, 'PROD2_001', '2020-07-26', 5113, 'd', 900000),
(52, 'PROD2_001', '2020-07-26', 5312, 'k', 900000),
(53, 'PROD2_001', '2020-07-26', 5135, 'd', 605000),
(54, 'PROD2_001', '2020-07-26', 1113, 'k', 605000),
(55, 'PROD2_001', '2020-07-26', 1312, 'd', 8005000),
(56, 'PROD2_001', '2020-07-26', 1114, 'k', 6200000),
(57, 'PROD2_001', '2020-07-26', 5112, 'k', 300000),
(58, 'PROD2_001', '2020-07-26', 5113, 'k', 1505000),
(59, 'PROD2_001', '2020-07-26', 5112, 'd', 300000),
(60, 'PROD2_001', '2020-07-26', 5311, 'k', 300000),
(61, 'PROD2_001', '2020-07-26', 5113, 'd', 900000),
(62, 'PROD2_001', '2020-07-26', 5312, 'k', 900000),
(63, 'PROD2_001', '2020-07-26', 5135, 'd', 493000),
(64, 'PROD2_001', '2020-07-26', 1113, 'k', 493000),
(65, 'PROD2_001', '2020-07-26', 1312, 'd', 7893000),
(66, 'PROD2_001', '2020-07-26', 1114, 'k', 6200000),
(67, 'PROD2_001', '2020-07-26', 5112, 'k', 300000),
(68, 'PROD2_001', '2020-07-26', 5113, 'k', 1393000),
(69, 'PROD2_001', '2020-07-26', 5112, 'd', 300000),
(70, 'PROD2_001', '2020-07-26', 5311, 'k', 300000),
(71, 'PROD2_001', '2020-07-26', 5113, 'd', 900000),
(72, 'PROD2_001', '2020-07-26', 5312, 'k', 900000),
(73, 'PROD2_001', '2020-07-26', 5135, 'd', 493000),
(74, 'PROD2_001', '2020-07-26', 1113, 'k', 493000),
(75, 'PROD2_001', '2020-07-26', 1312, 'd', 7893000),
(76, 'PROD2_001', '2020-07-26', 1114, 'k', 6200000),
(77, 'PROD2_001', '2020-07-26', 5112, 'k', 300000),
(78, 'PROD2_001', '2020-07-26', 5113, 'k', 1393000),
(79, 'PROD2_001', '2020-07-26', 5112, 'd', 300000),
(80, 'PROD2_001', '2020-07-26', 5311, 'k', 300000),
(81, 'PROD2_001', '2020-07-26', 5113, 'd', 900000),
(82, 'PROD2_001', '2020-07-26', 5312, 'k', 900000),
(83, 'PROD2_001', '2020-07-26', 5135, 'd', 493000),
(84, 'PROD2_001', '2020-07-26', 1113, 'k', 493000),
(85, 'PROD2_001', '2020-07-26', 1312, 'd', 7893000),
(86, 'PROD2_001', '2020-07-26', 1114, 'k', 6200000),
(87, 'PROD2_001', '2020-07-26', 5112, 'k', 300000),
(88, 'PROD2_001', '2020-07-26', 5113, 'k', 1393000),
(89, 'PROD2_001', '2020-07-26', 5112, 'd', 300000),
(90, 'PROD2_001', '2020-07-26', 5311, 'k', 300000),
(91, 'PROD2_001', '2020-07-26', 5113, 'd', 900000),
(92, 'PROD2_001', '2020-07-26', 5312, 'k', 900000),
(93, 'PROD2_001', '2020-07-26', 5135, 'd', 223000),
(94, 'PROD2_001', '2020-07-26', 1113, 'k', 223000),
(95, 'PROD2_001', '2020-07-26', 1312, 'd', 7623000),
(96, 'PROD2_001', '2020-07-26', 1114, 'k', 6200000),
(97, 'PROD2_001', '2020-07-26', 5112, 'k', 300000),
(98, 'PROD2_001', '2020-07-26', 5113, 'k', 1123000),
(99, 'PENJS_001', '2020-07-26', 1111, 'd', 1047800000),
(100, 'PENJS_001', '2020-07-26', 4111, 'k', 1047800000),
(101, 'PENJS_001', '2020-07-26', 6111, 'd', 806000000),
(102, 'PENJS_001', '2020-07-26', 1311, 'k', 806000000),
(103, 'PENJT_001', '2020-07-26', 1111, 'd', 60542300),
(104, 'PENJT_001', '2020-07-26', 4112, 'k', 60542300),
(105, 'PENJT_001', '2020-07-26', 6112, 'd', 46571000),
(106, 'PENJT_001', '2020-07-26', 1312, 'k', 46571000),
(107, 'PENJT_002', '2020-07-26', 1111, 'd', 16349320),
(108, 'PENJT_002', '2020-07-26', 4112, 'k', 16349320),
(109, 'PENJT_002', '2020-07-26', 6112, 'd', 12576400),
(110, 'PENJT_002', '2020-07-26', 1312, 'k', 12576400),
(111, 'PMBY_001', '2020-07-26', 5221, 'd', 400000),
(112, 'PMBY_001', '2020-07-26', 1111, 'k', 400000),
(113, 'PMBY_001', '2020-07-26', 5222, 'd', 350000),
(114, 'PMBY_001', '2020-07-26', 1111, 'k', 350000),
(115, 'PMBY_001', '2020-07-26', 5223, 'd', 300000),
(116, 'PMBY_001', '2020-07-26', 1111, 'k', 300000),
(117, 'PMBY_001', '2020-07-26', 5221, 'd', 250000),
(118, 'PMBY_001', '2020-07-26', 1111, 'k', 250000),
(119, 'PMBY_001', '2020-07-26', 5222, 'd', 200000),
(120, 'PMBY_001', '2020-07-26', 1111, 'k', 200000),
(121, 'PMBY_001', '2020-07-26', 5223, 'd', 150000),
(122, 'PMBY_001', '2020-07-26', 1111, 'k', 150000),
(123, 'CK_002', '2020-07-27', 1112, 'd', 770000000),
(124, 'CK_002', '2020-07-27', 1111, 'k', 770000000),
(125, 'PROD1_002', '2020-07-27', 5111, 'd', 770000000),
(126, 'PROD1_002', '2020-07-27', 1112, 'k', 770000000),
(127, 'PROD1_002', '2020-07-27', 5112, 'd', 35000000),
(128, 'PROD1_002', '2020-07-27', 5311, 'k', 35000000),
(129, 'PROD1_002', '2020-07-27', 5113, 'd', 98000000),
(130, 'PROD1_002', '2020-07-27', 5312, 'k', 98000000),
(131, 'PGB_002', '2020-07-27', 1114, 'd', 64500000),
(132, 'PGB_002', '2020-07-27', 5111, 'k', 55000000),
(133, 'PGB_002', '2020-07-27', 5112, 'k', 2500000),
(134, 'PGB_002', '2020-07-27', 5113, 'k', 7000000),
(135, 'PGB_002', '2020-07-27', 1311, 'd', 838500000),
(136, 'PGB_002', '2020-07-27', 5111, 'k', 715000000),
(137, 'PGB_002', '2020-07-27', 5112, 'k', 32500000),
(138, 'PGB_002', '2020-07-27', 5113, 'k', 91000000),
(139, 'PROD2_002', '2020-07-27', 5112, 'd', 600000),
(140, 'PROD2_002', '2020-07-27', 5311, 'k', 600000),
(141, 'PROD2_002', '2020-07-27', 5113, 'd', 2100000),
(142, 'PROD2_002', '2020-07-27', 5312, 'k', 2100000),
(143, 'PROD2_002', '2020-07-27', 5135, 'd', 495000),
(144, 'PROD2_002', '2020-07-27', 1113, 'k', 495000),
(145, 'PROD2_002', '2020-07-27', 1312, 'd', 22545000),
(146, 'PROD2_002', '2020-07-27', 1114, 'k', 19350000),
(147, 'PROD2_002', '2020-07-27', 5112, 'k', 600000),
(148, 'PROD2_002', '2020-07-27', 5113, 'k', 2595000),
(149, 'PROD2_002', '2020-07-27', 5112, 'd', 200000),
(150, 'PROD2_002', '2020-07-27', 5311, 'k', 200000),
(151, 'PROD2_002', '2020-07-27', 5113, 'd', 700000),
(152, 'PROD2_002', '2020-07-27', 5312, 'k', 700000),
(153, 'PROD2_002', '2020-07-27', 5135, 'd', 605000),
(154, 'PROD2_002', '2020-07-27', 1113, 'k', 605000),
(155, 'PROD2_002', '2020-07-27', 1312, 'd', 7955000),
(156, 'PROD2_002', '2020-07-27', 1114, 'k', 6450000),
(157, 'PROD2_002', '2020-07-27', 5112, 'k', 200000),
(158, 'PROD2_002', '2020-07-27', 5113, 'k', 1305000),
(159, 'PROD2_002', '2020-07-27', 5112, 'd', 200000),
(160, 'PROD2_002', '2020-07-27', 5311, 'k', 200000),
(161, 'PROD2_002', '2020-07-27', 5113, 'd', 700000),
(162, 'PROD2_002', '2020-07-27', 5312, 'k', 700000),
(163, 'PROD2_002', '2020-07-27', 5135, 'd', 605000),
(164, 'PROD2_002', '2020-07-27', 1113, 'k', 605000),
(165, 'PROD2_002', '2020-07-27', 1312, 'd', 7955000),
(166, 'PROD2_002', '2020-07-27', 1114, 'k', 6450000),
(167, 'PROD2_002', '2020-07-27', 5112, 'k', 200000),
(168, 'PROD2_002', '2020-07-27', 5113, 'k', 1305000),
(169, 'PROD2_002', '2020-07-27', 5112, 'd', 200000),
(170, 'PROD2_002', '2020-07-27', 5311, 'k', 200000),
(171, 'PROD2_002', '2020-07-27', 5113, 'd', 700000),
(172, 'PROD2_002', '2020-07-27', 5312, 'k', 700000),
(173, 'PROD2_002', '2020-07-27', 5135, 'd', 605000),
(174, 'PROD2_002', '2020-07-27', 1113, 'k', 605000),
(175, 'PROD2_002', '2020-07-27', 1312, 'd', 7955000),
(176, 'PROD2_002', '2020-07-27', 1114, 'k', 6450000),
(177, 'PROD2_002', '2020-07-27', 5112, 'k', 200000),
(178, 'PROD2_002', '2020-07-27', 5113, 'k', 1305000),
(179, 'PROD2_002', '2020-07-27', 5112, 'd', 200000),
(180, 'PROD2_002', '2020-07-27', 5311, 'k', 200000),
(181, 'PROD2_002', '2020-07-27', 5113, 'd', 700000),
(182, 'PROD2_002', '2020-07-27', 5312, 'k', 700000),
(183, 'PROD2_002', '2020-07-27', 5135, 'd', 493000),
(184, 'PROD2_002', '2020-07-27', 1113, 'k', 493000),
(185, 'PROD2_002', '2020-07-27', 1312, 'd', 7843000),
(186, 'PROD2_002', '2020-07-27', 1114, 'k', 6450000),
(187, 'PROD2_002', '2020-07-27', 5112, 'k', 200000),
(188, 'PROD2_002', '2020-07-27', 5113, 'k', 1193000),
(189, 'PROD2_002', '2020-07-27', 5112, 'd', 200000),
(190, 'PROD2_002', '2020-07-27', 5311, 'k', 200000),
(191, 'PROD2_002', '2020-07-27', 5113, 'd', 700000),
(192, 'PROD2_002', '2020-07-27', 5312, 'k', 700000),
(193, 'PROD2_002', '2020-07-27', 5135, 'd', 493000),
(194, 'PROD2_002', '2020-07-27', 1113, 'k', 493000),
(195, 'PROD2_002', '2020-07-27', 1312, 'd', 7843000),
(196, 'PROD2_002', '2020-07-27', 1114, 'k', 6450000),
(197, 'PROD2_002', '2020-07-27', 5112, 'k', 200000),
(198, 'PROD2_002', '2020-07-27', 5113, 'k', 1193000),
(199, 'PROD2_002', '2020-07-27', 5112, 'd', 200000),
(200, 'PROD2_002', '2020-07-27', 5311, 'k', 200000),
(201, 'PROD2_002', '2020-07-27', 5113, 'd', 700000),
(202, 'PROD2_002', '2020-07-27', 5312, 'k', 700000),
(203, 'PROD2_002', '2020-07-27', 5135, 'd', 493000),
(204, 'PROD2_002', '2020-07-27', 1113, 'k', 493000),
(205, 'PROD2_002', '2020-07-27', 1312, 'd', 7843000),
(206, 'PROD2_002', '2020-07-27', 1114, 'k', 6450000),
(207, 'PROD2_002', '2020-07-27', 5112, 'k', 200000),
(208, 'PROD2_002', '2020-07-27', 5113, 'k', 1193000),
(209, 'PROD2_002', '2020-07-27', 5112, 'd', 200000),
(210, 'PROD2_002', '2020-07-27', 5311, 'k', 200000),
(211, 'PROD2_002', '2020-07-27', 5113, 'd', 700000),
(212, 'PROD2_002', '2020-07-27', 5312, 'k', 700000),
(213, 'PROD2_002', '2020-07-27', 5135, 'd', 223000),
(214, 'PROD2_002', '2020-07-27', 1113, 'k', 223000),
(215, 'PROD2_002', '2020-07-27', 1312, 'd', 7573000),
(216, 'PROD2_002', '2020-07-27', 1114, 'k', 6450000),
(217, 'PROD2_002', '2020-07-27', 5112, 'k', 200000),
(218, 'PROD2_002', '2020-07-27', 5113, 'k', 923000),
(219, 'PENJS_002', '2020-07-27', 1111, 'd', 1068925000),
(220, 'PENJS_002', '2020-07-27', 4111, 'k', 1068925000),
(221, 'PENJS_002', '2020-07-27', 6111, 'd', 838500000),
(222, 'PENJS_002', '2020-07-27', 1311, 'k', 838500000),
(223, 'PENJT_003', '2020-07-27', 1111, 'd', 2940600),
(224, 'PENJT_003', '2020-07-27', 4112, 'k', 2940600),
(225, 'PENJT_003', '2020-07-27', 6112, 'd', 2269500),
(226, 'PENJT_003', '2020-07-27', 1312, 'k', 2269500),
(227, 'PMBYV_003', '2020-07-27', 5213, 'd', 5720000),
(228, 'PMBYV_003', '2020-07-27', 1111, 'k', 5720000),
(229, 'PMBYV_004', '2020-07-27', 5211, 'd', 72000),
(230, 'PMBYV_004', '2020-07-27', 1111, 'k', 72000),
(231, 'PMBYV_004', '2020-07-27', 5212, 'd', 12000),
(232, 'PMBYV_004', '2020-07-27', 1111, 'k', 12000),
(233, 'PMBYV_005', '2020-07-29', 5213, 'd', 500000),
(234, 'PMBYV_005', '2020-07-29', 1111, 'k', 500000),
(235, 'PMBYV_005', '2020-07-29', 5212, 'd', 500000),
(236, 'PMBYV_005', '2020-07-29', 1111, 'k', 500000),
(237, 'PMBYV_005', '2020-07-29', 5213, 'd', 500000),
(238, 'PMBYV_005', '2020-07-29', 1111, 'k', 500000),
(239, 'PMBYV_005', '2020-07-29', 5213, 'd', 500000),
(240, 'PMBYV_005', '2020-07-29', 1111, 'k', 500000),
(241, 'PMBYV_005', '2020-07-29', 5212, 'd', 500000),
(242, 'PMBYV_005', '2020-07-29', 1111, 'k', 500000),
(243, 'PMBYV_005', '2020-07-29', 5213, 'd', 500000),
(244, 'PMBYV_005', '2020-07-29', 1111, 'k', 500000),
(245, 'PMBYV_001', '2020-07-29', 5211, 'd', 500000),
(246, 'PMBYV_001', '2020-07-29', 1111, 'k', 500000),
(247, 'PMBYV_001', '2020-07-29', 5212, 'd', 1500000),
(248, 'PMBYV_001', '2020-07-29', 1111, 'k', 1500000),
(249, 'PMBYV_001', '2020-07-29', 5211, 'd', 1000000),
(250, 'PMBYV_001', '2020-07-29', 1111, 'k', 1000000),
(251, 'PMBYV_001', '2020-07-29', 5211, 'd', 500000),
(252, 'PMBYV_001', '2020-07-29', 1111, 'k', 500000),
(253, 'PMBYV_001', '2020-07-29', 5211, 'd', 500000),
(254, 'PMBYV_001', '2020-07-29', 1111, 'k', 500000),
(255, 'PMBYV_001', '2020-07-29', 5211, 'd', 1000000),
(256, 'PMBYV_001', '2020-07-29', 1111, 'k', 1000000),
(257, 'PMBYV_001', '2020-07-29', 5211, 'd', 500000),
(258, 'PMBYV_001', '2020-07-29', 1111, 'k', 500000),
(259, 'PMBYV_001', '2020-07-29', 5211, 'd', 500000),
(260, 'PMBYV_001', '2020-07-29', 1111, 'k', 500000),
(261, 'PMBYV_001', '2020-07-29', 5213, 'd', 500000),
(262, 'PMBYV_001', '2020-07-29', 1111, 'k', 500000),
(263, 'PMBYV_001', '2020-07-29', 5212, 'd', 500000),
(264, 'PMBYV_001', '2020-07-29', 1111, 'k', 500000),
(265, 'PMBYV_001', '2020-07-29', 5212, 'd', 500000),
(266, 'PMBYV_001', '2020-07-29', 1111, 'k', 500000),
(267, 'PMBYV_001', '2020-07-29', 5212, 'd', 500000),
(268, 'PMBYV_001', '2020-07-29', 1111, 'k', 500000),
(269, 'PMBYV_001', '2020-07-29', 5212, 'd', 500000),
(270, 'PMBYV_001', '2020-07-29', 1111, 'k', 500000),
(271, 'PMBYV_001', '2020-07-29', 5212, 'd', 500000),
(272, 'PMBYV_001', '2020-07-29', 1111, 'k', 500000),
(273, 'PMBYV_001', '2020-07-29', 5212, 'd', 500000),
(274, 'PMBYV_001', '2020-07-29', 1111, 'k', 500000),
(275, 'PMBYV_002', '2020-07-29', 5211, 'd', 500000),
(276, 'PMBYV_002', '2020-07-29', 1111, 'k', 500000),
(277, 'PMBYV_002', '2020-07-29', 5212, 'd', 500000),
(278, 'PMBYV_002', '2020-07-29', 1111, 'k', 500000),
(279, 'PMBYV_003', '2020-07-29', 5211, 'd', 0),
(280, 'PMBYV_003', '2020-07-29', 1111, 'k', 0),
(281, 'PMBYV_003', '2020-07-29', 5211, 'd', 0),
(282, 'PMBYV_003', '2020-07-29', 1111, 'k', 0),
(283, 'PMBYV_003', '2020-07-29', 5211, 'd', 0),
(284, 'PMBYV_003', '2020-07-29', 1111, 'k', 0),
(285, 'PMBYV_003', '2020-07-29', 5211, 'd', 0),
(286, 'PMBYV_003', '2020-07-29', 1111, 'k', 0),
(287, 'PMBYV_003', '2020-07-29', 5211, 'd', 0),
(288, 'PMBYV_003', '2020-07-29', 1111, 'k', 0),
(289, 'PMBYV_003', '2020-07-29', 5211, 'd', 0),
(290, 'PMBYV_003', '2020-07-29', 1111, 'k', 0),
(291, 'PMBYV_003', '2020-07-29', 5211, 'd', 0),
(292, 'PMBYV_003', '2020-07-29', 1111, 'k', 0),
(293, 'PMBYV_003', '2020-07-29', 5211, 'd', 0),
(294, 'PMBYV_003', '2020-07-29', 1111, 'k', 0),
(295, 'PMBYV_003', '2020-07-29', 5211, 'd', 0),
(296, 'PMBYV_003', '2020-07-29', 1111, 'k', 0),
(297, 'PMBYV_003', '2020-07-29', 5212, 'd', 0),
(298, 'PMBYV_003', '2020-07-29', 1111, 'k', 0),
(299, 'PMBYV_003', '2020-07-29', 5212, 'd', 0),
(300, 'PMBYV_003', '2020-07-29', 1111, 'k', 0),
(301, 'PMBYV_003', '2020-07-29', 5212, 'd', 0),
(302, 'PMBYV_003', '2020-07-29', 1111, 'k', 0),
(303, 'PMBYV_003', '2020-07-29', 5212, 'd', 0),
(304, 'PMBYV_003', '2020-07-29', 1111, 'k', 0),
(305, 'PMBYV_003', '2020-07-29', 5212, 'd', 0),
(306, 'PMBYV_003', '2020-07-29', 1111, 'k', 0),
(307, 'PMBYV_003', '2020-07-29', 5212, 'd', 0),
(308, 'PMBYV_003', '2020-07-29', 1111, 'k', 0),
(309, 'PMBYV_003', '2020-07-29', 5212, 'd', 0),
(310, 'PMBYV_003', '2020-07-29', 1111, 'k', 0),
(311, 'PMBYV_003', '2020-07-29', 5212, 'd', 0),
(312, 'PMBYV_003', '2020-07-29', 1111, 'k', 0),
(313, 'PMBYV_003', '2020-07-29', 5212, 'd', 0),
(314, 'PMBYV_003', '2020-07-29', 1111, 'k', 0),
(315, 'PMBYV_003', '2020-07-29', 5213, 'd', 0),
(316, 'PMBYV_003', '2020-07-29', 1111, 'k', 0),
(317, 'CK_003', '2020-07-29', 1112, 'd', 700000000),
(318, 'CK_003', '2020-07-29', 1111, 'k', 700000000),
(319, 'PROD1_003', '2020-07-29', 5111, 'd', 700000000),
(320, 'PROD1_003', '2020-07-29', 1112, 'k', 700000000),
(321, 'PROD1_003', '2020-07-29', 5112, 'd', 28000000),
(322, 'PROD1_003', '2020-07-29', 5311, 'k', 28000000),
(323, 'PROD1_003', '2020-07-29', 5113, 'd', 266000000),
(324, 'PROD1_003', '2020-07-29', 5312, 'k', 266000000),
(325, 'PGB_003', '2020-07-29', 1114, 'd', 71000000),
(326, 'PGB_003', '2020-07-29', 5111, 'k', 50000000),
(327, 'PGB_003', '2020-07-29', 5112, 'k', 2000000),
(328, 'PGB_003', '2020-07-29', 5113, 'k', 19000000),
(329, 'PGB_003', '2020-07-29', 1311, 'd', 923000000),
(330, 'PGB_003', '2020-07-29', 5111, 'k', 650000000),
(331, 'PGB_003', '2020-07-29', 5112, 'k', 26000000),
(332, 'PGB_003', '2020-07-29', 5113, 'k', 247000000),
(333, '1', '2020-12-09', 1122, 'd', 170833),
(334, '1', '2020-12-09', 1120, 'k', 170833);

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
-- Table structure for table `log_penyusutan`
--

CREATE TABLE `log_penyusutan` (
  `id` int(11) NOT NULL,
  `id_penyusutan` varchar(255) NOT NULL,
  `id_detail` int(11) NOT NULL,
  `nilai_akhir` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_penyusutan`
--

INSERT INTO `log_penyusutan` (`id`, `id_penyusutan`, `id_detail`, `nilai_akhir`) VALUES
(1, 'PNY20201209001', 1, 3879166);

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

--
-- Dumping data for table `pembayaranv`
--

INSERT INTO `pembayaranv` (`no_trans`, `tgl_trans`, `no_trans_penj`, `status`, `total`) VALUES
('PMBYV_000', '0000-00-00', '0', '1', '0');

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
('PMBAST20201209001', 'NOTA20201209001', '4050000', 'selesai', '2020-12-09');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_bb`
--

CREATE TABLE `pembelian_bb` (
  `no_trans` varchar(100) NOT NULL,
  `tgl_trans` date NOT NULL,
  `total` int(100) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian_bb`
--

INSERT INTO `pembelian_bb` (`no_trans`, `tgl_trans`, `total`, `status`) VALUES
('PMB_001', '2020-12-05', 20000, '1'),
('PMB_002', '2020-12-09', 185500, '1'),
('PMB_003', '2020-12-09', 298000, '1'),
('PMB_004', '2020-12-09', 33333, '1');

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
  `bulan_penyusutan` varchar(255) NOT NULL,
  `total_penyusutan` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penyusutan`
--

INSERT INTO `penyusutan` (`id_penyusutan`, `tgl_input`, `bulan_penyusutan`, `total_penyusutan`) VALUES
('PNY20201209001', '2020-12-09', 'December 2020', 170833);

-- --------------------------------------------------------

--
-- Table structure for table `peternak`
--

CREATE TABLE `peternak` (
  `no_peternak` varchar(100) NOT NULL,
  `nama_peternak` varchar(100) NOT NULL,
  `notel` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `deposit` varchar(233) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peternak`
--

INSERT INTO `peternak` (`no_peternak`, `nama_peternak`, `notel`, `alamat`, `deposit`) VALUES
('PTRNK_001', 'Andi', '081297276888', 'Cimahi', NULL),
('PTRNK_002', 'Joko', '0811301180', 'Bandung', NULL),
('PTRNK_003', 'Budi', '082337317510', 'Bandung Barat', NULL),
('PTRNK_004', 'Adi', '082293294071', 'Lembang', NULL),
('PTRNK_005', 'Indra', '082113572468', 'Cimahi', NULL),
('PTRNK_006', 'Asep', '081284871175', 'Padalarang', NULL),
('PTRNK_007', 'Andre', '082117675927', 'Bandung', NULL),
('PTRNK_008', 'Azis', '082285701109', 'Bandung Barat', NULL),
('PTRNK_009', 'Arif', '082170370037', 'Cimahi', NULL),
('PTRNK_010', 'Ibrahim', '082126407059', 'Padalarang', NULL),
('PTRNK_011', 'Agung', '082214902233', 'Bandung', NULL),
('PTRNK_012', 'Adit', '08112009484', 'Lembang', NULL),
('PTRNK_013', 'Gatot', '081295861043', 'Bandung', NULL),
('PTRNK_014', 'Taufiq', '081231197192', 'Cimahi', NULL),
('PTRNK_015', 'Iwan', '081259468020', 'Bandung Barat', NULL),
('PTRNK_016', 'dede', '087877472553', 'bekasi', '25000'),
('PTRNK_017', 'assdasdasd', '087877472553', 'asdasd', '25000');

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
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `no_produk` varchar(50) NOT NULL,
  `nama_produk` varchar(50) NOT NULL,
  `stok` int(50) NOT NULL,
  `harga_jual` varchar(50) NOT NULL,
  `satuan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`no_produk`, `nama_produk`, `stok`, `harga_jual`, `satuan`) VALUES
('PR_001', 'Susu Sapi', 130000, '8558.3333333333', 'liter'),
('PR_002', 'Susu Murni', 3000, '9802', 'liter'),
('PR_003', 'Pasteur Coklat', 1300, '10374', 'liter'),
('PR_004', 'Pasteur Vanila', 1300, '10374', 'liter'),
('PR_005', 'Pasteur Strawberry', 1300, '10374', 'liter'),
('PR_006', 'Yoghurt Strawberry', 1300, '10228.4', 'liter'),
('PR_007', 'Yoghurt Anggur', 1300, '10228.4', 'liter'),
('PR_008', 'Yoghurt Melon', 1300, '10228.4', 'liter'),
('PR_009', 'Yoghurt Plain', 1300, '9877.4', 'liter');

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
('JS-001', 'Simpanan Wajib', '25000');

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
('SPA-01', 'Genesis ID', 'Bekasi', '087877472553'),
('SPA-02', 'PT ABC', 'Bandung', '123123123');

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
  `nama_lengkap` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`nama_lengkap`, `username`, `password`, `level`) VALUES
('Super Admin', 'admin', 'admin', 'admin'),
('Keuangan', 'keuangan1', 'keuangan1', 'keuangan1'),
('Keuangan', 'keuangan2', 'keuangan2', 'keuangan2'),
('Keuangan', 'keuangan3', 'keuangan3', 'keuangan3'),
('Penjualan', 'penjualan', 'penjualan', 'penjualan'),
('Produksi', 'produksi1', 'produksi1', 'produksi1'),
('Produksi', 'produksi2', 'produksi2', 'produksi2');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `cek_kualitas`
--
ALTER TABLE `cek_kualitas`
  ADD PRIMARY KEY (`no_trans`);

--
-- Indexes for table `coa`
--
ALTER TABLE `coa`
  ADD PRIMARY KEY (`no_coa`);

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
-- Indexes for table `jenis_bop`
--
ALTER TABLE `jenis_bop`
  ADD PRIMARY KEY (`no_jbop`);

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
-- Indexes for table `log_penyusutan`
--
ALTER TABLE `log_penyusutan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembagian`
--
ALTER TABLE `pembagian`
  ADD PRIMARY KEY (`no_trans`);

--
-- Indexes for table `pembayaranv`
--
ALTER TABLE `pembayaranv`
  ADD PRIMARY KEY (`no_trans`);

--
-- Indexes for table `pembelian_aset`
--
ALTER TABLE `pembelian_aset`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indexes for table `pembelian_bb`
--
ALTER TABLE `pembelian_bb`
  ADD PRIMARY KEY (`no_trans`);

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
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`no_produk`);

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
-- Indexes for table `update_stok_penj`
--
ALTER TABLE `update_stok_penj`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- AUTO_INCREMENT for table `jurnal`
--
ALTER TABLE `jurnal`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=335;

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
-- AUTO_INCREMENT for table `log_penyusutan`
--
ALTER TABLE `log_penyusutan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pinjaman`
--
ALTER TABLE `pinjaman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `update_stok_penj`
--
ALTER TABLE `update_stok_penj`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
