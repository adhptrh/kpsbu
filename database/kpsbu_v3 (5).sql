-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 20, 2021 at 11:34 AM
-- Server version: 5.7.32
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kpsbu_v3`
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
(5, '2021-12-08');

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
  `kel_akun` int(11) NOT NULL DEFAULT '0',
  `kel_akun_peny_d` int(11) NOT NULL DEFAULT '0',
  `kel_akun_peny_k` int(11) NOT NULL DEFAULT '0'
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
  `is_shu` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coa`
--

INSERT INTO `coa` (`id`, `no_coa`, `nama_coa`, `jenis_coa`, `saldo_awal`, `header`, `saldo_normal`, `is_shu`) VALUES
(1, 1111, 'Kas', '', 0, 1, 'd', 0),
(2, 1112, 'Persediaan Bahan Baku', '', 0, 1, 'd', 0),
(3, 1113, 'Persediaan Bahan Penolong', '', 0, 1, 'd', 0),
(4, 1114, 'Persediaan Produk Dalam Proses', '', 0, 1, 'd', 0),
(5, 1120, 'Peralatan', '', 0, 1, 'd', 0),
(6, 1122, 'Akumulasi penyusutan peralatan', '', 0, 1, 'd', 0),
(7, 1199, 'Pinjaman Anggota', '', 0, 1, 'd', 0),
(8, 1311, 'Persediaan Produk Jadi IPS', '', 0, 1, 'd', 0),
(9, 1312, 'Persediaan Produk Jadi Toko', '', 0, 1, 'd', 0),
(10, 2111, 'Utang', '', 0, 2, 'd', 0),
(11, 2112, 'Simpanan Hari Raya', '', 0, 2, 'd', 0),
(12, 3112, 'Simpanan Wajib', '', 0, 3, 'd', 0),
(13, 3113, 'Simpanan Manasuka', '', 0, 3, 'd', 0),
(14, 3111, 'Simpanan Pokok', '', 0, 3, 'd', 0),
(15, 1115, 'Pinjaman anggota', '', 0, 1, 'd', 0),
(16, 4111, 'Penjualan IPS', '', 0, 4, 'd', 0),
(17, 4112, 'Penjualan Toko', '', 0, 4, 'd', 0),
(18, 5000, 'Pembelian', '', 0, 5, 'd', 0),
(19, 5111, 'Produk Dalam Proses - BBB', '', 0, 5, 'd', 0),
(20, 5112, 'Produk Dalam Proses - BTK', '', 0, 5, 'd', 0),
(21, 5113, 'Produk Dalam Proses - BOP', '', 0, 5, 'd', 0),
(22, 5134, 'BOP Tetap Sesungguhnya', '', 0, 5, 'd', 0),
(23, 5135, 'BOP Sesungguhnya', '', 0, 5, 'd', 0),
(24, 5211, 'Beban Administrasi dan Umum Variabel', '', 0, 5, 'd', 0),
(25, 5212, 'Beban Pemasaran Variabel', '', 0, 5, 'd', 0),
(26, 5213, 'Beban Angkut Penjualan', '', 0, 5, 'd', 0),
(27, 5221, 'Beban Listrik, Air dan Telepon', '', 0, 5, 'd', 1),
(28, 5222, 'Beban Administrasi dan Umum Tetap', '', 0, 5, 'd', 1),
(29, 5223, 'Beban Pemasaran Tetap', '', 0, 5, 'd', 0),
(30, 5311, 'Beban Upah dan Gaji', '', 0, 5, 'd', 0),
(31, 5312, 'BOP Dibebankan', '', 0, 5, 'd', 0),
(32, 6111, 'Harga Pokok Penjualan IPS', '', 0, 6, 'd', 0),
(33, 6112, 'Harga Pokok Penjualan Toko', '', 0, 6, 'd', 0),
(34, 5228, 'Beban Penyusutan Kendaraan ', '', 0, 5, 'd', 1),
(35, 1125, 'Akumulasi Penyusutan Kendaraan', '', 0, 1, 'd', 0),
(36, 1214, 'Kendaraan', '', 0, 1, 'd', 0),
(37, 5224, 'Beban Perbaikan', '', 0, 5, 'd', 1),
(38, 4113, 'Penjualan Susu', '', 0, 4, 'd', 1),
(39, 4114, 'Penjualan Pakan Konsentrat', '', 0, 4, 'd', 1),
(40, 4115, 'Penjualan Pengolahan Susu', '', 0, 4, 'd', 1),
(41, 4116, 'Penjualan Waserda', '', 0, 4, 'd', 1);

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
(11, 5, '44', 'masuk', '10:14:58', 'Presensi Keluar');

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
  `cek_bulan_peny` varchar(11) NOT NULL DEFAULT '0000-00',
  `cek_bulan_perb` varchar(11) DEFAULT NULL,
  `id_detail_aset` varchar(255) NOT NULL,
  `is_rev` tinyint(1) NOT NULL DEFAULT '0'
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
(81, 'PMB_066', 'BB_001', 100, '3500', 350000, 'PTRNK_016');

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
('PNJSO20211216003', 'PR_012', 'Testing Yogurt', 12, 5000, 60000);

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
  `is_complete` tinyint(1) DEFAULT '0'
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
(9, '44', '1', '2021-12-08', '2021-12-08', 'asd', 'admin', 0);

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
(1, 'SHR-0001', '2021-06-27', 1111, 'd', 500000),
(2, 'SHR-0001', '2021-06-27', 2112, 'k', 500000),
(3, 'DPPTRNK_028', '2021-06-27', 1111, 'd', 25000),
(4, 'DPPTRNK_028', '2021-06-27', 3111, 'k', 25000),
(5, 'DPPTRNK_029', '2021-06-27', 1111, 'd', 25000),
(6, 'DPPTRNK_029', '2021-06-27', 3111, 'k', 25000),
(7, 'DPPTRNK_030', '2021-06-27', 1111, 'd', 25000),
(8, 'DPPTRNK_030', '2021-06-27', 3111, 'k', 25000),
(9, 'DPPTRNK_031', '2020-10-02', 1111, 'd', 25000),
(10, 'DPPTRNK_031', '2020-10-02', 3111, 'k', 25000),
(15, 'PMB_001', '2020-10-16', 1112, 'd', 390000),
(16, 'PMB_001', '2020-10-16', 2111, 'k', 390000),
(17, 'PMBS-301020200001', '2020-10-30', 1112, 'd', 390000),
(18, 'PMBS-301020200001', '2020-10-30', 1111, 'k', 377400),
(19, 'PMBS-301020200001', '2020-10-30', 3112, 'k', 2600),
(20, 'PMBS-301020200001', '2020-10-30', 3113, 'k', 10000),
(21, 'SHR-0002', '2020-11-02', 1111, 'd', 50000),
(22, 'SHR-0002', '2020-11-02', 2112, 'k', 50000),
(23, 'PMB_002', '2020-10-19', 1112, 'd', 640000),
(24, 'PMB_002', '2020-10-19', 2111, 'k', 640000),
(25, 'PMBS-021120200002', '2020-11-02', 1112, 'd', 640000),
(26, 'PMBS-021120200002', '2020-11-02', 1111, 'k', 625400),
(27, 'PMBS-021120200002', '2020-11-02', 3112, 'k', 4600),
(28, 'PMBS-021120200002', '2020-11-02', 3113, 'k', 10000),
(29, 'PMB_003', '2020-11-03', 1112, 'd', 487500),
(30, 'PMB_003', '2020-11-03', 2111, 'k', 487500),
(31, 'PMBS-171120200002', '2020-11-17', 1112, 'd', 487500),
(32, 'PMBS-171120200002', '2020-11-17', 1111, 'k', 474500),
(33, 'PMBS-171120200002', '2020-11-17', 3112, 'k', 3000),
(34, 'PMBS-171120200002', '2020-11-17', 3113, 'k', 10000),
(35, 'PMB_004', '2020-11-18', 1112, 'd', 437500),
(36, 'PMB_004', '2020-11-18', 2111, 'k', 437500),
(37, 'PMBS-021220200002', '2020-12-02', 1112, 'd', 437500),
(38, 'PMBS-021220200002', '2020-12-02', 1111, 'k', 425000),
(39, 'PMBS-021220200002', '2020-12-02', 3112, 'k', 2500),
(40, 'PMBS-021220200002', '2020-12-02', 3113, 'k', 10000),
(41, 'PMB_005', '2020-12-03', 1112, 'd', 450000),
(42, 'PMB_005', '2020-12-03', 2111, 'k', 450000),
(43, 'PMBS-171220200002', '2020-12-17', 1112, 'd', 450000),
(44, 'PMBS-171220200002', '2020-12-17', 1111, 'k', 437000),
(45, 'PMBS-171220200002', '2020-12-17', 3112, 'k', 3000),
(46, 'PMBS-171220200002', '2020-12-17', 3113, 'k', 10000),
(47, 'PMB_006', '2020-12-18', 1112, 'd', 463000),
(48, 'PMB_006', '2020-12-18', 2111, 'k', 463000),
(49, 'PMBS-010120210002', '2021-01-01', 1112, 'd', 463000),
(50, 'PMBS-010120210002', '2021-01-01', 1111, 'k', 450000),
(51, 'PMBS-010120210002', '2021-01-01', 3112, 'k', 3000),
(52, 'PMBS-010120210002', '2021-01-01', 3113, 'k', 10000),
(53, 'PMB_007', '2021-01-04', 1112, 'd', 450000),
(54, 'PMB_007', '2021-01-04', 2111, 'k', 450000),
(55, 'PMBS-180120210002', '2021-01-18', 1112, 'd', 450000),
(56, 'PMBS-180120210002', '2021-01-18', 1111, 'k', 437000),
(57, 'PMBS-180120210002', '2021-01-18', 3112, 'k', 3000),
(58, 'PMBS-180120210002', '2021-01-18', 3113, 'k', 10000),
(59, 'PMB_008', '2021-01-19', 1112, 'd', 475000),
(60, 'PMB_008', '2021-01-19', 2111, 'k', 475000),
(61, 'PMBS-020220210002', '2021-02-02', 1112, 'd', 475000),
(62, 'PMBS-020220210002', '2021-02-02', 1111, 'k', 462000),
(63, 'PMBS-020220210002', '2021-02-02', 3112, 'k', 3000),
(64, 'PMBS-020220210002', '2021-02-02', 3113, 'k', 10000),
(65, 'PMB_009', '2021-02-03', 1112, 'd', 477500),
(66, 'PMB_009', '2021-02-03', 2111, 'k', 477500),
(67, 'PMBS-170220210002', '2021-02-17', 1112, 'd', 477500),
(68, 'PMBS-170220210002', '2021-02-17', 1111, 'k', 464500),
(69, 'PMBS-170220210002', '2021-02-17', 3112, 'k', 3000),
(70, 'PMBS-170220210002', '2021-02-17', 3113, 'k', 10000),
(71, 'PMB_010', '2021-02-18', 1112, 'd', 480000),
(72, 'PMB_010', '2021-02-18', 2111, 'k', 480000),
(73, 'PMBS-040320210002', '2021-03-04', 1112, 'd', 480000),
(74, 'PMBS-040320210002', '2021-03-04', 1111, 'k', 467000),
(75, 'PMBS-040320210002', '2021-03-04', 3112, 'k', 3000),
(76, 'PMBS-040320210002', '2021-03-04', 3113, 'k', 10000),
(77, 'PMB_011', '2021-03-05', 1112, 'd', 300000),
(78, 'PMB_011', '2021-03-05', 2111, 'k', 300000),
(79, 'PMBS-190320210002', '2021-03-19', 1112, 'd', 300000),
(80, 'PMBS-190320210002', '2021-03-19', 1111, 'k', 288500),
(81, 'PMBS-190320210002', '2021-03-19', 3112, 'k', 1500),
(82, 'PMBS-190320210002', '2021-03-19', 3113, 'k', 10000),
(83, 'PMB_012', '2021-03-22', 1112, 'd', 412500),
(84, 'PMB_012', '2021-03-22', 2111, 'k', 412500),
(85, 'PMBS-050420210002', '2021-04-05', 1112, 'd', 412500),
(86, 'PMBS-050420210002', '2021-04-05', 1111, 'k', 400000),
(87, 'PMBS-050420210002', '2021-04-05', 3112, 'k', 2500),
(88, 'PMBS-050420210002', '2021-04-05', 3113, 'k', 10000),
(89, 'PMB_013', '2021-04-06', 1112, 'd', 304600),
(90, 'PMB_013', '2021-04-06', 2111, 'k', 304600),
(91, 'PMBS-200420210002', '2021-04-20', 1112, 'd', 304600),
(92, 'PMBS-200420210002', '2021-04-20', 1111, 'k', 292600),
(93, 'PMBS-200420210002', '2021-04-20', 3112, 'k', 2000),
(94, 'PMBS-200420210002', '2021-04-20', 3113, 'k', 10000),
(95, 'PMB_014', '2021-04-22', 1112, 'd', 272400),
(96, 'PMB_014', '2021-04-22', 2111, 'k', 272400),
(97, 'PMB_015', '2021-04-26', 1112, 'd', 525000),
(98, 'PMB_015', '2021-04-26', 2111, 'k', 525000),
(99, 'PMBS-100520210002', '2021-05-10', 1112, 'd', 525000),
(100, 'PMBS-100520210002', '2021-05-10', 1111, 'k', 512000),
(101, 'PMBS-100520210002', '2021-05-10', 3112, 'k', 3000),
(102, 'PMBS-100520210002', '2021-05-10', 3113, 'k', 10000),
(103, 'PMB_016', '2021-05-12', 1112, 'd', 317500),
(104, 'PMB_016', '2021-05-12', 2111, 'k', 317500),
(105, 'PMBS-260520210002', '2021-05-26', 1112, 'd', 317500),
(106, 'PMBS-260520210002', '2021-05-26', 1111, 'k', 305600),
(107, 'PMBS-260520210002', '2021-05-26', 3112, 'k', 1900),
(108, 'PMBS-260520210002', '2021-05-26', 3113, 'k', 10000),
(109, 'PMB_017', '2021-06-28', 1112, 'd', 255000),
(110, 'PMB_017', '2021-06-28', 2111, 'k', 255000),
(111, 'PMBS-060520210002', '2021-05-06', 1112, 'd', 797400),
(112, 'PMBS-060520210002', '2021-05-06', 1111, 'k', 781400),
(113, 'PMBS-060520210002', '2021-05-06', 3112, 'k', 6000),
(114, 'PMBS-060520210002', '2021-05-06', 3113, 'k', 10000),
(115, 'SP20210629001', '2021-06-29', 1115, 'd', 500000),
(116, 'SP20210629001', '2021-06-29', 1111, 'k', 500000),
(117, 'PMB_018', '2021-07-02', 1112, 'd', 300000),
(118, 'PMB_018', '2021-07-02', 2111, 'k', 300000),
(119, 'PMB_019', '2021-06-29', 1112, 'd', 300000),
(120, 'PMB_019', '2021-06-29', 2111, 'k', 300000),
(121, 'PMB_020', '2021-07-13', 1112, 'd', 300000),
(122, 'PMB_020', '2021-07-13', 2111, 'k', 300000),
(123, 'PMBS-270720210002', '2021-07-27', 2111, 'd', 300000),
(124, 'PMBS-270720210002', '2021-07-27', 1111, 'k', 188000),
(125, 'PMBS-270720210002', '2021-07-27', 1115, 'k', 100000),
(126, 'PMBS-270720210002', '2021-07-27', 3112, 'k', 2000),
(127, 'PMBS-270720210002', '2021-07-27', 3113, 'k', 10000),
(128, 'PMB_021', '2021-07-29', 1112, 'd', 360000),
(129, 'PMB_021', '2021-07-29', 2111, 'k', 360000),
(130, 'PMBS-120820210002', '2021-08-12', 2111, 'd', 360000),
(131, 'PMBS-120820210002', '2021-08-12', 1111, 'k', 247600),
(132, 'PMBS-120820210002', '2021-08-12', 1115, 'k', 100000),
(133, 'PMBS-120820210002', '2021-08-12', 3112, 'k', 2400),
(134, 'PMBS-120820210002', '2021-08-12', 3113, 'k', 10000),
(135, 'PMB_022', '2021-08-13', 1112, 'd', 200000),
(136, 'PMB_022', '2021-08-13', 2111, 'k', 200000),
(137, 'PMBS-270820210002', '2021-08-27', 2111, 'd', 200000),
(138, 'PMBS-270820210002', '2021-08-27', 1111, 'k', 89000),
(139, 'PMBS-270820210002', '2021-08-27', 1115, 'k', 100000),
(140, 'PMBS-270820210002', '2021-08-27', 3112, 'k', 1000),
(141, 'PMBS-270820210002', '2021-08-27', 3113, 'k', 10000),
(142, 'PMB_023', '2021-08-27', 1112, 'd', 60000),
(143, 'PMB_023', '2021-08-27', 2111, 'k', 60000),
(150, 'PMB_025', '2021-09-24', 1112, 'd', 135000),
(151, 'PMB_025', '2021-09-24', 2111, 'k', 135000),
(152, 'PMBS-081020210002', '2021-10-08', 2111, 'd', 135000),
(153, 'PMBS-081020210002', '2021-10-08', 1111, 'k', 124100),
(154, 'PMBS-081020210002', '2021-10-08', 3112, 'k', 900),
(155, 'PMBS-081020210002', '2021-10-08', 3113, 'k', 10000),
(156, 'PMB_026', '2021-06-29', 1112, 'd', 300000),
(157, 'PMB_026', '2021-06-29', 2111, 'k', 300000),
(158, 'PMB_027', '2021-06-15', 1112, 'd', 300000),
(159, 'PMB_027', '2021-06-15', 2111, 'k', 300000),
(160, 'PMBS-290620210002', '2021-06-29', 2111, 'd', 300000),
(161, 'PMBS-290620210002', '2021-06-29', 1111, 'k', 288000),
(162, 'PMBS-290620210002', '2021-06-29', 3112, 'k', 2000),
(163, 'PMBS-290620210002', '2021-06-29', 3113, 'k', 10000),
(164, 'SP20210629002', '2021-06-29', 1115, 'd', 250000),
(165, 'SP20210629002', '2021-06-29', 1111, 'k', 250000),
(166, 'PMB_028', '2021-06-30', 1112, 'd', 525000),
(167, 'PMB_028', '2021-06-30', 2111, 'k', 525000),
(168, 'SHR-0003', '2021-07-14', 1111, 'd', 200000),
(169, 'SHR-0003', '2021-07-14', 2112, 'k', 200000),
(170, 'SP20210701002', '2021-07-01', 1115, 'd', 250000),
(171, 'SP20210701002', '2021-07-01', 1111, 'k', 250000),
(172, 'SP20211009002', '2021-10-09', 1115, 'd', 250000),
(173, 'SP20211009002', '2021-10-09', 1111, 'k', 250000),
(174, 'PMB_029', '2021-10-09', 1112, 'd', 250000),
(175, 'PMB_029', '2021-10-09', 2111, 'k', 250000),
(176, 'PMB_030', '2021-11-08', 1112, 'd', 150000),
(177, 'PMB_030', '2021-11-08', 2111, 'k', 150000),
(178, 'PMBS-221120210002', '2021-11-22', 2111, 'd', 150000),
(179, 'PMBS-221120210002', '2021-11-22', 1111, 'k', 89000),
(180, 'PMBS-221120210002', '2021-11-22', 1115, 'k', 50000),
(181, 'PMBS-221120210002', '2021-11-22', 3112, 'k', 1000),
(182, 'PMBS-221120210002', '2021-11-22', 3113, 'k', 10000),
(183, 'PMB_031', '2021-11-23', 1112, 'd', 30000),
(184, 'PMB_031', '2021-11-23', 2111, 'k', 30000),
(185, 'PMBS-071220210002', '2021-12-07', 2111, 'd', 30000),
(186, 'PMBS-071220210002', '2021-12-07', 1111, 'd', 30200),
(187, 'PMBS-071220210002', '2021-12-07', 3112, 'k', 200),
(188, 'PMBS-071220210002', '2021-12-07', 3113, 'k', 10000),
(189, 'PMBS-071220210002', '2021-12-07', 1115, 'k', 50000),
(190, 'PMB_032', '2021-12-08', 1112, 'd', 225000),
(191, 'PMB_032', '2021-12-08', 2111, 'k', 225000),
(192, 'PMBS-221220210002', '2021-12-22', 2111, 'd', 225000),
(193, 'PMBS-221220210002', '2021-12-22', 1111, 'k', 163500),
(194, 'PMBS-221220210002', '2021-12-22', 1115, 'k', 50000),
(195, 'PMBS-221220210002', '2021-12-22', 3112, 'k', 1500),
(196, 'PMBS-221220210002', '2021-12-22', 3113, 'k', 10000),
(197, 'PMB_033', '2021-12-23', 1112, 'd', 427500),
(198, 'PMB_033', '2021-12-23', 2111, 'k', 427500),
(199, 'PMBS-060120220002', '2022-01-06', 2111, 'd', 427500),
(200, 'PMBS-060120220002', '2022-01-06', 1111, 'k', 364800),
(201, 'PMBS-060120220002', '2022-01-06', 1115, 'k', 50000),
(202, 'PMBS-060120220002', '2022-01-06', 3112, 'k', 2700),
(203, 'PMBS-060120220002', '2022-01-06', 3113, 'k', 10000),
(204, 'PMB_034', '2022-01-07', 1112, 'd', 195000),
(205, 'PMB_034', '2022-01-07', 2111, 'k', 195000),
(210, 'PMB_035', '2022-01-24', 1112, 'd', 135000),
(211, 'PMB_035', '2022-01-24', 2111, 'k', 135000),
(212, 'PMB_036', '2022-01-24', 1112, 'd', 150000),
(213, 'PMB_036', '2022-01-24', 2111, 'k', 150000),
(214, 'PMBAST20210702012', '2021-07-02', 1120, 'd', 5000000),
(215, 'PMBAST20210702012', '2021-07-02', 1111, 'k', 5000000),
(216, 'PMBAST20210703013', '2021-07-03', 1214, 'd', 6000000),
(217, 'PMBAST20210703013', '2021-07-03', 1111, 'k', 6000000),
(218, 'IDA-024', '2021-07-03', 5228, 'd', 250000),
(219, 'IDA-024', '2021-07-03', 1125, 'k', 250000),
(220, 'PRB20210803004', '2021-08-03', 5224, 'd', 500000),
(221, 'PRB20210803004', '2021-08-03', 1111, 'k', 500000),
(228, 'REV20210803004', '2021-08-03', 1214, 'd', 500000),
(229, 'REV20210803004', '2021-08-03', 5224, 'k', 500000),
(230, 'PNY20210803018', '2021-08-03', 5228, 'd', 295455),
(231, 'PNY20210803018', '2021-08-03', 1125, 'k', 295455),
(232, 'PNY20210903019', '2021-09-03', 5228, 'd', 295455),
(233, 'PNY20210903019', '2021-09-03', 1125, 'k', 295455),
(234, 'PMBS-070220220002', '2022-02-07', 2111, 'd', 285000),
(235, 'PMBS-070220220002', '2022-02-07', 1111, 'k', 273100),
(236, 'PMBS-070220220002', '2022-02-07', 3112, 'k', 1900),
(237, 'PMBS-070220220002', '2022-02-07', 3113, 'k', 10000),
(238, 'SP20220208003', '2022-02-08', 1115, 'd', 150000),
(239, 'SP20220208003', '2022-02-08', 1111, 'k', 150000),
(240, 'PMB_037', '2022-02-08', 1112, 'd', 250000),
(241, 'PMB_037', '2022-02-08', 2111, 'k', 250000),
(242, 'PMBS-220220220002', '2022-02-22', 2111, 'd', 250000),
(243, 'PMBS-220220220002', '2022-02-22', 1111, 'k', 209000),
(244, 'PMBS-220220220002', '2022-02-22', 1115, 'k', 30000),
(245, 'PMBS-220220220002', '2022-02-22', 3112, 'k', 1000),
(246, 'PMBS-220220220002', '2022-02-22', 3113, 'k', 10000),
(247, 'PMB_038', '2022-02-23', 1112, 'd', 12000),
(248, 'PMB_038', '2022-02-23', 2111, 'k', 12000),
(249, 'PMBS-090320220002', '2022-03-09', 2111, 'd', 12000),
(250, 'PMBS-090320220002', '2022-03-09', 1111, 'd', 28240),
(251, 'PMBS-090320220002', '2022-03-09', 3112, 'k', 240),
(252, 'PMBS-090320220002', '2022-03-09', 3113, 'k', 10000),
(253, 'PMBS-090320220002', '2022-03-09', 1115, 'k', 30000),
(254, 'PMB_039', '2022-03-10', 1112, 'd', 150000),
(255, 'PMB_039', '2022-03-10', 2111, 'k', 150000),
(256, 'PMBS-240320220002', '2022-03-24', 2111, 'd', 150000),
(257, 'PMBS-240320220002', '2022-03-24', 1111, 'k', 109000),
(258, 'PMBS-240320220002', '2022-03-24', 1115, 'k', 30000),
(259, 'PMBS-240320220002', '2022-03-24', 3112, 'k', 1000),
(260, 'PMBS-240320220002', '2022-03-24', 3113, 'k', 10000),
(261, 'PMB_040', '2022-03-25', 1112, 'd', 75000),
(262, 'PMB_040', '2022-03-25', 2111, 'k', 75000),
(263, 'PMBS-080420220002', '2022-04-08', 2111, 'd', 75000),
(264, 'PMBS-080420220002', '2022-04-08', 1111, 'k', 34500),
(265, 'PMBS-080420220002', '2022-04-08', 1115, 'k', 30000),
(266, 'PMBS-080420220002', '2022-04-08', 3112, 'k', 500),
(267, 'PMBS-080420220002', '2022-04-08', 3113, 'k', 10000),
(268, 'PMB_041', '2022-04-11', 1112, 'd', 60000),
(269, 'PMB_041', '2022-04-11', 2111, 'k', 60000),
(270, 'PMBS-250420220002', '2022-04-25', 2111, 'd', 60000),
(271, 'PMBS-250420220002', '2022-04-25', 1111, 'k', 19600),
(272, 'PMBS-250420220002', '2022-04-25', 1115, 'k', 30000),
(273, 'PMBS-250420220002', '2022-04-25', 3112, 'k', 400),
(274, 'PMBS-250420220002', '2022-04-25', 3113, 'k', 10000),
(275, 'PMB_042', '2022-04-28', 1112, 'd', 300000),
(276, 'PMB_042', '2022-04-28', 2111, 'k', 300000),
(277, 'PMBS-120520220002', '2022-05-12', 2111, 'd', 300000),
(278, 'PMBS-120520220002', '2022-05-12', 1111, 'k', 288000),
(280, 'PMBS-120520220002', '2022-05-12', 3112, 'k', 2000),
(281, 'PMBS-120520220002', '2022-05-12', 3113, 'k', 10000),
(282, 'DPPTRNK_032', '2021-07-07', 1111, 'd', 25000),
(283, 'DPPTRNK_032', '2021-07-07', 3111, 'k', 25000),
(284, 'DPPTRNK_033', '2021-07-07', 1111, 'd', 25000),
(285, 'DPPTRNK_033', '2021-07-07', 3111, 'k', 25000),
(286, 'DP', '2021-07-07', 3111, 'd', 25000),
(287, 'DP', '2021-07-07', 1111, 'k', 25000),
(288, 'DPPTRNK_034', '2021-07-07', 1111, 'd', 25000),
(289, 'DPPTRNK_034', '2021-07-07', 3111, 'k', 25000),
(290, 'DPPTRNK_035', '2020-01-01', 1111, 'd', 25000),
(291, 'DPPTRNK_035', '2020-01-01', 3111, 'k', 25000),
(292, 'PMB_043', '2020-01-02', 1112, 'd', 365000),
(293, 'PMB_043', '2020-01-02', 2111, 'k', 365000),
(294, 'PMBS-160120200002', '2020-01-16', 2111, 'd', 365000),
(295, 'PMBS-160120200002', '2020-01-16', 1111, 'k', 352800),
(296, 'PMBS-160120200002', '2020-01-16', 3112, 'k', 2200),
(297, 'PMBS-160120200002', '2020-01-16', 3113, 'k', 10000),
(298, 'PMB_044', '2020-01-17', 1112, 'd', 250000),
(299, 'PMB_044', '2020-01-17', 2111, 'k', 250000),
(300, 'PMBS-310120200002', '2020-01-31', 2111, 'd', 250000),
(301, 'PMBS-310120200002', '2020-01-31', 1111, 'k', 238000),
(302, 'PMBS-310120200002', '2020-01-31', 3112, 'k', 2000),
(303, 'PMBS-310120200002', '2020-01-31', 3113, 'k', 10000),
(304, 'PMB_045', '2020-02-03', 1112, 'd', 295000),
(305, 'PMB_045', '2020-02-03', 2111, 'k', 295000),
(306, 'PMBS-170220200003', '2020-02-17', 2111, 'd', 295000),
(307, 'PMBS-170220200003', '2020-02-17', 1111, 'k', 283100),
(308, 'PMBS-170220200003', '2020-02-17', 3112, 'k', 1900),
(309, 'PMBS-170220200003', '2020-02-17', 3113, 'k', 10000),
(310, 'PMB_046', '2020-03-19', 1112, 'd', 195000),
(311, 'PMB_046', '2020-03-19', 2111, 'k', 195000),
(312, 'PMBS-020420200003', '2020-04-02', 2111, 'd', 195000),
(313, 'PMBS-020420200003', '2020-04-02', 1111, 'k', 183700),
(314, 'PMBS-020420200003', '2020-04-02', 3112, 'k', 1300),
(315, 'PMBS-020420200003', '2020-04-02', 3113, 'k', 10000),
(316, 'PMB_047', '2020-04-03', 1112, 'd', 150000),
(317, 'PMB_047', '2020-04-03', 2111, 'k', 150000),
(318, 'PMBS-170420200003', '2020-04-17', 2111, 'd', 150000),
(319, 'PMBS-170420200003', '2020-04-17', 1111, 'k', 139000),
(320, 'PMBS-170420200003', '2020-04-17', 3112, 'k', 1000),
(321, 'PMBS-170420200003', '2020-04-17', 3113, 'k', 10000),
(322, 'PMB_048', '2020-04-20', 1112, 'd', 375000),
(323, 'PMB_048', '2020-04-20', 2111, 'k', 375000),
(324, 'PMBS-040520200003', '2020-05-04', 2111, 'd', 375000),
(325, 'PMBS-040520200003', '2020-05-04', 1111, 'k', 362500),
(326, 'PMBS-040520200003', '2020-05-04', 3112, 'k', 2500),
(327, 'PMBS-040520200003', '2020-05-04', 3113, 'k', 10000),
(328, 'PMB_049', '2020-05-06', 1112, 'd', 360000),
(329, 'PMB_049', '2020-05-06', 2111, 'k', 360000),
(330, 'PMBS-200520200003', '2020-05-20', 2111, 'd', 360000),
(331, 'PMBS-200520200003', '2020-05-20', 1111, 'k', 348200),
(332, 'PMBS-200520200003', '2020-05-20', 3112, 'k', 1800),
(333, 'PMBS-200520200003', '2020-05-20', 3113, 'k', 10000),
(334, 'PMB_050', '2020-05-22', 1112, 'd', 220000),
(335, 'PMB_050', '2020-05-22', 2111, 'k', 220000),
(336, 'PMBS-050620200003', '2020-06-05', 2111, 'd', 220000),
(337, 'PMBS-050620200003', '2020-06-05', 1111, 'k', 208900),
(338, 'PMBS-050620200003', '2020-06-05', 3112, 'k', 1100),
(339, 'PMBS-050620200003', '2020-06-05', 3113, 'k', 10000),
(342, 'PMB_051', '2020-06-08', 1112, 'd', 99000),
(343, 'PMB_051', '2020-06-08', 2111, 'k', 99000),
(344, 'PMBS-220620200003', '2020-06-22', 2111, 'd', 99000),
(345, 'PMBS-220620200003', '2020-06-22', 1111, 'k', 88340),
(346, 'PMBS-220620200003', '2020-06-22', 3112, 'k', 660),
(347, 'PMBS-220620200003', '2020-06-22', 3113, 'k', 10000),
(348, 'PMB_052', '2020-06-24', 1112, 'd', 300000),
(349, 'PMB_052', '2020-06-24', 2111, 'k', 300000),
(350, 'PMBS-080720200003', '2020-07-08', 2111, 'd', 300000),
(351, 'PMBS-080720200003', '2020-07-08', 1111, 'k', 288000),
(352, 'PMBS-080720200003', '2020-07-08', 3112, 'k', 2000),
(353, 'PMBS-080720200003', '2020-07-08', 3113, 'k', 10000),
(354, 'PMB_053', '2020-07-10', 1112, 'd', 225000),
(355, 'PMB_053', '2020-07-10', 2111, 'k', 225000),
(356, 'PMBS-240720200003', '2020-07-24', 2111, 'd', 225000),
(357, 'PMBS-240720200003', '2020-07-24', 1111, 'k', 213500),
(358, 'PMBS-240720200003', '2020-07-24', 3112, 'k', 1500),
(359, 'PMBS-240720200003', '2020-07-24', 3113, 'k', 10000),
(360, 'PMB_054', '2020-07-27', 1112, 'd', 165000),
(361, 'PMB_054', '2020-07-27', 2111, 'k', 165000),
(362, 'PMBS-100820200003', '2020-08-10', 2111, 'd', 165000),
(363, 'PMBS-100820200003', '2020-08-10', 1111, 'k', 153900),
(364, 'PMBS-100820200003', '2020-08-10', 3112, 'k', 1100),
(365, 'PMBS-100820200003', '2020-08-10', 3113, 'k', 10000),
(366, 'PMB_055', '2020-08-12', 1112, 'd', 270000),
(367, 'PMB_055', '2020-08-12', 2111, 'k', 270000),
(368, 'PMBS-260820200003', '2020-08-26', 2111, 'd', 270000),
(369, 'PMBS-260820200003', '2020-08-26', 1111, 'k', 258200),
(370, 'PMBS-260820200003', '2020-08-26', 3112, 'k', 1800),
(371, 'PMBS-260820200003', '2020-08-26', 3113, 'k', 10000),
(372, 'PMB_056', '2020-08-28', 1112, 'd', 195000),
(373, 'PMB_056', '2020-08-28', 2111, 'k', 195000),
(374, 'PMBS-110920200003', '2020-09-11', 2111, 'd', 195000),
(375, 'PMBS-110920200003', '2020-09-11', 1111, 'k', 183700),
(376, 'PMBS-110920200003', '2020-09-11', 3112, 'k', 1300),
(377, 'PMBS-110920200003', '2020-09-11', 3113, 'k', 10000),
(378, 'PMB_057', '2020-09-14', 1112, 'd', 225000),
(379, 'PMB_057', '2020-09-14', 2111, 'k', 225000),
(380, 'PMBS-280920200003', '2020-09-28', 2111, 'd', 225000),
(381, 'PMBS-280920200003', '2020-09-28', 1111, 'k', 213500),
(382, 'PMBS-280920200003', '2020-09-28', 3112, 'k', 1500),
(383, 'PMBS-280920200003', '2020-09-28', 3113, 'k', 10000),
(384, 'PMB_058', '2020-09-30', 1112, 'd', 450000),
(385, 'PMB_058', '2020-09-30', 2111, 'k', 450000),
(386, 'PMBS-141020200003', '2020-10-14', 2111, 'd', 450000),
(387, 'PMBS-141020200003', '2020-10-14', 1111, 'k', 437000),
(388, 'PMBS-141020200003', '2020-10-14', 3112, 'k', 3000),
(389, 'PMBS-141020200003', '2020-10-14', 3113, 'k', 10000),
(390, 'PMB_059', '2021-07-07', 1112, 'd', 150000),
(391, 'PMB_059', '2021-07-07', 2111, 'k', 150000),
(392, 'PMBS-210720210003', '2021-07-21', 2111, 'd', 150000),
(393, 'PMBS-210720210003', '2021-07-21', 1111, 'k', 139000),
(394, 'PMBS-210720210003', '2021-07-21', 3112, 'k', 1000),
(395, 'PMBS-210720210003', '2021-07-21', 3113, 'k', 10000),
(396, 'SHR-0004', '2021-07-21', 1111, 'd', 100000),
(397, 'SHR-0004', '2021-07-21', 2112, 'k', 100000),
(398, 'SP20210721004', '2021-07-21', 1115, 'd', 150000),
(399, 'SP20210721004', '2021-07-21', 1111, 'k', 150000),
(400, 'PMB_060', '2021-07-22', 1112, 'd', 300000),
(401, 'PMB_060', '2021-07-22', 2111, 'k', 300000),
(402, 'PMBS-050820210003', '2021-08-05', 2111, 'd', 300000),
(403, 'PMBS-050820210003', '2021-08-05', 1111, 'k', 258000),
(404, 'PMBS-050820210003', '2021-08-05', 1115, 'k', 30000),
(405, 'PMBS-050820210003', '2021-08-05', 3112, 'k', 2000),
(406, 'PMBS-050820210003', '2021-08-05', 3113, 'k', 10000),
(407, 'DP', '2021-08-05', 3111, 'd', 25000),
(408, 'DP', '2021-08-05', 1111, 'k', 25000),
(409, 'PMB_061', '2021-08-09', 1112, 'd', 15000),
(410, 'PMB_061', '2021-08-09', 2111, 'k', 15000),
(411, 'PMB_062', '2021-08-23', 1112, 'd', 30000),
(412, 'PMB_062', '2021-08-23', 2111, 'k', 30000),
(413, 'PMB_063', '2021-08-13', 1112, 'd', 450000),
(414, 'PMB_063', '2021-08-13', 2111, 'k', 450000),
(415, 'PMBS-270820210003', '2021-08-27', 2111, 'd', 450000),
(416, 'PMBS-270820210003', '2021-08-27', 1111, 'k', 407000),
(417, 'PMBS-270820210003', '2021-08-27', 1115, 'k', 30000),
(418, 'PMBS-270820210003', '2021-08-27', 3112, 'k', 3000),
(419, 'PMBS-270820210003', '2021-08-27', 3113, 'k', 10000),
(420, 'DPPTRNK_036', '2021-07-01', 1111, 'd', 25000),
(421, 'DPPTRNK_036', '2021-07-01', 3111, 'k', 25000),
(422, 'PMB_064', '2021-07-01', 1112, 'd', 350000),
(423, 'PMB_064', '2021-07-01', 2111, 'k', 350000),
(424, 'PMBS-150720210003', '2021-07-15', 2111, 'd', 350000),
(425, 'PMBS-150720210003', '2021-07-15', 1111, 'k', 338000),
(426, 'PMBS-150720210003', '2021-07-15', 3112, 'k', 2000),
(427, 'PMBS-150720210003', '2021-07-15', 3113, 'k', 10000),
(428, 'PMB_065', '2021-07-23', 1112, 'd', 150000),
(429, 'PMB_065', '2021-07-23', 2111, 'k', 150000),
(430, 'SHR-0005', '2021-07-21', 1111, 'd', 100000),
(431, 'SHR-0005', '2021-07-21', 2112, 'k', 100000),
(432, 'PNJS20211202002', '2021-12-02', 1111, 'd', 1150000),
(433, 'PNJS20211202002', '2021-12-02', 4113, 'k', 1150000),
(434, 'PMB_066', '2021-12-02', 1112, 'd', 350000),
(435, 'PMB_066', '2021-12-02', 2111, 'k', 350000),
(436, 'PNG20211207004', '2021-12-07', 5000, 'd', 500000),
(437, 'PNG20211207004', '2021-12-07', 1111, 'k', 500000),
(438, 'PNG20211207005', '2021-12-07', 5311, 'd', 1500000),
(439, 'PNG20211207005', '2021-12-07', 1111, 'k', 1500000),
(440, 'PNG20211208006', '2021-12-08', 5311, 'd', 50000000),
(441, 'PNG20211208006', '2021-12-08', 1111, 'k', 50000000),
(442, 'GAJI-001', '2021-12-10', 5311, 'd', 5368500),
(443, 'GAJI-001', '2021-12-10', 1111, 'k', 5368500),
(444, 'PNG20211214001', '2021-12-14', 5000, 'd', 20000000),
(445, 'PNG20211214001', '2021-12-14', 1111, 'k', 20000000),
(446, 'PNJS20211216003', '2021-12-16', 1111, 'd', 450000),
(447, 'PNJS20211216003', '2021-12-16', 4113, 'k', 450000),
(448, 'PNJPKN20211216005', '2021-12-16', 1111, 'd', 2500000),
(449, 'PNJPKN20211216005', '2021-12-16', 4114, 'k', 2500000),
(450, 'PNJSO20211216002', '2021-12-16', 1111, 'd', 500000),
(451, 'PNJSO20211216002', '2021-12-16', 4115, 'k', 500000),
(452, 'PNJSO20211216003', '2021-12-16', 1111, 'd', 157500),
(453, 'PNJSO20211216003', '2021-12-16', 4115, 'k', 157500);

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
-- Table structure for table `log_bayar_pinjaman`
--

CREATE TABLE `log_bayar_pinjaman` (
  `id` int(11) NOT NULL,
  `id_ref_pinjaman` varchar(255) DEFAULT NULL,
  `waktu_bayar` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
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
(23, NULL, '2021-08-27 08:25:09', 'PTRNK_035', 30000, 1112);

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
  `status` tinyint(1) DEFAULT '0',
  `tgl_pengajuan` timestamp NULL DEFAULT CURRENT_TIMESTAMP
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
  `simpanan_wajib` int(30) NOT NULL,
  `pinjaman_anggota` int(30) NOT NULL DEFAULT '0',
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
(55, 'PMBS-150720210003', 'PTRNK_036', 100, 350000, 10000, 2000, 0, 0, 338000);

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
  `nominal` int(255) NOT NULL DEFAULT '0',
  `status` varchar(1) NOT NULL DEFAULT '1',
  `sisa_pinjaman` int(11) DEFAULT '0'
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
  `rfid` varchar(50) NOT NULL,
  `nip` varchar(50) NOT NULL,
  `npwp` varchar(50) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_telp` varchar(255) DEFAULT NULL,
  `tempat_lahir` varchar(255) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `no_rek` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT '1',
  `status_kredit` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id`, `id_jabatan`, `id_ptkp`, `id_jenis_pegawai`, `rfid`, `nip`, `npwp`, `nama`, `alamat`, `no_telp`, `tempat_lahir`, `tgl_lahir`, `no_rek`, `status`, `status_kredit`, `created_at`) VALUES
(1, 'Staff', '0', '0', '2635346361', '123123123', '', 'Data Test', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(2, 'Staff', '0', '0', '1', '123', '', 'Testing 2', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(3, 'Staff', '0', '0', '2', '1234', '', 'Testing 3', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(4, 'Staff', '0', '0', '3', '1235', '', 'Testing 4', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(5, 'Staff', '0', '0', '4', '1236', '', 'Testing 5', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(6, 'Staff', '1', 'Tetap', '44', '44', '', 'Ale', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(7, 'Staff', '0', '0', '55', '55', '', 'Siti', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(8, 'Staff', '0', 'Kontrak', '111', '111', '111111', 'Testtt 111', 'Bandung', '111111111', 'Bandung', '1998-03-01', '111111111', '1', 0, '2021-12-04 11:17:34'),
(9, 'Staff', 'TK0', 'Tetap', '1029384756', '1029384756', '1029384756', 'Andi Andi Andi', 'bandung', '1029384756', 'bandung', '1991-03-03', '123123123', '1', 0, '2021-12-15 07:10:28');

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
-- Table structure for table `pembayaran_susu`
--

CREATE TABLE `pembayaran_susu` (
  `id` int(11) NOT NULL,
  `kode_pembayaran` varchar(255) NOT NULL,
  `total_bayar` int(20) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `is_paid` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembayaran_susu`
--

INSERT INTO `pembayaran_susu` (`id`, `kode_pembayaran`, `total_bayar`, `tgl_transaksi`, `is_paid`) VALUES
(1, 'PMBS-301020200001', 377400, '2020-10-30', 1),
(2, 'PMBS-021120200002', 625400, '2020-11-02', 1),
(3, 'PMBS-171120200002', 474500, '2020-11-17', 1),
(4, 'PMBS-021220200002', 425000, '2020-12-02', 1),
(5, 'PMBS-171220200002', 437000, '2020-12-17', 1),
(6, 'PMBS-010120210002', 450000, '2021-01-01', 1),
(7, 'PMBS-180120210002', 437000, '2021-01-18', 1),
(8, 'PMBS-020220210002', 462000, '2021-02-02', 1),
(9, 'PMBS-170220210002', 464500, '2021-02-17', 1),
(10, 'PMBS-040320210002', 467000, '2021-03-04', 1),
(11, 'PMBS-190320210002', 288500, '2021-03-19', 1),
(12, 'PMBS-050420210002', 400000, '2021-04-05', 1),
(13, 'PMBS-200420210002', 292600, '2021-04-20', 1),
(14, 'PMBS-100520210002', 512000, '2021-05-10', 1),
(15, 'PMBS-260520210002', 305600, '2021-05-26', 1),
(16, 'PMBS-060520210002', 781400, '2021-05-06', 1),
(17, 'PMBS-160720210002', 188000, '2021-07-16', 1),
(18, 'PMBS-270720210002', 188000, '2021-07-27', 1),
(19, 'PMBS-120820210002', 247600, '2021-08-12', 1),
(20, 'PMBS-270820210002', 89000, '2021-08-27', 1),
(21, 'PMBS-240920210002', 188000, '2021-09-24', 1),
(22, 'PMBS-081020210002', 124100, '2021-10-08', 1),
(23, 'PMBS-290620210002', 288000, '2021-06-29', 1),
(24, 'PMBS-221120210002', 89000, '2021-11-22', 1),
(25, 'PMBS-071220210002', 19800, '2021-12-07', 1),
(26, 'PMBS-221220210002', 163500, '2021-12-22', 1),
(27, 'PMBS-060120220002', 364800, '2022-01-06', 1),
(28, 'PMBS-210120220002', 133700, '2022-01-21', 1),
(29, 'PMBS-070220220002', 273100, '2022-02-07', 1),
(30, 'PMBS-220220220002', 209000, '2022-02-22', 1),
(31, 'PMBS-090320220002', 1760, '2022-03-09', 1),
(32, 'PMBS-240320220002', 109000, '2022-03-24', 1),
(33, 'PMBS-080420220002', 34500, '2022-04-08', 1),
(34, 'PMBS-250420220002', 19600, '2022-04-25', 1),
(35, 'PMBS-120520220002', 288000, '2022-05-12', 1),
(36, 'PMBS-160120200002', 352800, '2020-01-16', 1),
(37, 'PMBS-310120200002', 238000, '2020-01-31', 1),
(38, 'PMBS-170220200003', 283100, '2020-02-17', 1),
(39, 'PMBS-020420200003', 183700, '2020-04-02', 1),
(40, 'PMBS-170420200003', 139000, '2020-04-17', 1),
(41, 'PMBS-040520200003', 362500, '2020-05-04', 1),
(42, 'PMBS-200520200003', 348200, '2020-05-20', 1),
(43, 'PMBS-050620200003', 208900, '2020-06-05', 1),
(44, 'PMBS-220620200003', 88340, '2020-06-22', 1),
(45, 'PMBS-080720200003', 288000, '2020-07-08', 1),
(46, 'PMBS-240720200003', 213500, '2020-07-24', 1),
(47, 'PMBS-100820200003', 153900, '2020-08-10', 1),
(48, 'PMBS-260820200003', 258200, '2020-08-26', 1),
(49, 'PMBS-110920200003', 183700, '2020-09-11', 1),
(50, 'PMBS-280920200003', 213500, '2020-09-28', 1),
(51, 'PMBS-141020200003', 437000, '2020-10-14', 1),
(52, 'PMBS-210720210003', 139000, '2021-07-21', 1),
(53, 'PMBS-050820210003', 258000, '2021-08-05', 1),
(54, 'PMBS-270820210003', 407000, '2021-08-27', 1),
(55, 'PMBS-150720210003', 338000, '2021-07-15', 1);

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
  `no_trans` varchar(100) NOT NULL,
  `tgl_trans` date NOT NULL,
  `total` int(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `id_detail_truck` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian_bb`
--

INSERT INTO `pembelian_bb` (`no_trans`, `tgl_trans`, `total`, `status`, `id_detail_truck`) VALUES
('PMB_001', '2020-10-16', 390000, '1', 0),
('PMB_002', '2020-10-19', 640000, '1', 0),
('PMB_003', '2020-11-03', 487500, '1', 0),
('PMB_004', '2020-11-18', 437500, '1', 0),
('PMB_005', '2020-12-03', 450000, '1', 0),
('PMB_006', '2020-12-18', 463000, '1', 0),
('PMB_007', '2021-01-04', 450000, '1', 0),
('PMB_008', '2021-01-19', 475000, '1', 0),
('PMB_009', '2021-02-03', 477500, '1', 0),
('PMB_010', '2021-02-18', 480000, '1', 0),
('PMB_011', '2021-03-05', 300000, '1', 0),
('PMB_012', '2021-03-22', 412500, '1', 0),
('PMB_013', '2021-04-06', 304600, '1', 0),
('PMB_014', '2021-04-22', 272400, '1', 0),
('PMB_015', '2021-04-26', 525000, '1', 0),
('PMB_016', '2021-05-12', 317500, '1', 0),
('PMB_017', '2021-06-28', 255000, '1', 0),
('PMB_018', '2021-07-02', 300000, '1', 0),
('PMB_019', '2021-06-29', 300000, '1', 0),
('PMB_020', '2021-07-13', 300000, '1', 0),
('PMB_021', '2021-07-29', 360000, '1', 0),
('PMB_022', '2021-08-13', 200000, '1', 0),
('PMB_023', '2021-08-27', 60000, '1', 0),
('PMB_024', '2021-09-10', 300000, '1', 0),
('PMB_025', '2021-09-24', 135000, '1', 0),
('PMB_026', '2021-06-29', 300000, '1', 0),
('PMB_027', '2021-06-15', 300000, '1', 0),
('PMB_028', '2021-06-30', 525000, '1', 0),
('PMB_029', '2021-10-09', 250000, '1', 0),
('PMB_030', '2021-11-08', 150000, '1', 0),
('PMB_031', '2021-11-23', 30000, '1', 0),
('PMB_032', '2021-12-08', 225000, '1', 0),
('PMB_033', '2021-12-23', 427500, '1', 0),
('PMB_034', '2022-01-07', 195000, '1', 0),
('PMB_035', '2022-01-24', 135000, '1', 0),
('PMB_036', '2022-01-24', 150000, '1', 0),
('PMB_037', '2022-02-08', 250000, '1', 0),
('PMB_038', '2022-02-23', 12000, '1', 0),
('PMB_039', '2022-03-10', 150000, '1', 0),
('PMB_040', '2022-03-25', 75000, '1', 0),
('PMB_041', '2022-04-11', 60000, '1', 0),
('PMB_042', '2022-04-28', 300000, '1', 0),
('PMB_043', '2020-01-02', 365000, '1', 0),
('PMB_044', '2020-01-17', 250000, '1', 0),
('PMB_045', '2020-02-03', 295000, '1', 0),
('PMB_046', '2020-03-19', 195000, '1', 0),
('PMB_047', '2020-04-03', 150000, '1', 0),
('PMB_048', '2020-04-20', 375000, '1', 0),
('PMB_049', '2020-05-06', 360000, '1', 0),
('PMB_050', '2020-05-22', 220000, '1', 0),
('PMB_051', '2020-06-08', 99000, '1', 0),
('PMB_052', '2020-06-24', 300000, '1', 0),
('PMB_053', '2020-07-10', 225000, '1', 0),
('PMB_054', '2020-07-27', 165000, '1', 0),
('PMB_055', '2020-08-12', 270000, '1', 0),
('PMB_056', '2020-08-28', 195000, '1', 0),
('PMB_057', '2020-09-14', 225000, '1', 0),
('PMB_058', '2020-09-30', 450000, '1', 0),
('PMB_059', '2021-07-07', 150000, '1', 0),
('PMB_060', '2021-07-22', 300000, '1', 0),
('PMB_061', '2021-08-09', 15000, '1', 0),
('PMB_062', '2021-08-23', 30000, '1', 0),
('PMB_063', '2021-08-13', 450000, '1', 0),
('PMB_064', '2021-07-01', 350000, '1', 0),
('PMB_065', '2021-07-23', 150000, '1', 0),
('PMB_066', '2021-12-02', 350000, '1', 0);

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
  `nominal` int(11) DEFAULT NULL,
  `bukti_trf` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penerimaan_kas`
--

INSERT INTO `penerimaan_kas` (`id`, `id_penerimaan`, `tanggal`, `sumber`, `jenis_penerimaan`, `jenis_pembayaran`, `nominal`, `bukti_trf`) VALUES
(1, 'PNRM20211214001', '2021-12-14', 'test', 'Penjualan Susu', 'Non Tunai', 20000000, '98994c1933030ef70ed65071c99778ea.jpg'),
(2, 'PNRM20211214002', '2021-12-14', 'test 2', 'Penjualan Susu', 'Non Tunai', 10000000, '98994c1933030ef70ed65071c99778ea1.jpg');

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
  `nominal` int(11) DEFAULT NULL,
  `bukti_trf` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengeluaran_kas`
--

INSERT INTO `pengeluaran_kas` (`id`, `id_pengeluaran`, `tanggal`, `sumber_pengeluaran`, `jenis_pengeluaran`, `jenis_pembayaran`, `nominal`, `bukti_trf`) VALUES
(1, 'PNG20211214001', '2021-12-14', 'Test', 'Pembelian', 'Non Tunai', 20000000, 'composer1.png');

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
  `pinjaman` int(255) NOT NULL DEFAULT '0',
  `kd_tps` varchar(255) DEFAULT NULL,
  `nm_peternakan` varchar(255) NOT NULL,
  `is_deactive` tinyint(1) NOT NULL DEFAULT '0',
  `status_kredit` tinyint(1) NOT NULL DEFAULT '0',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
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
('PTRNK_036', 'Galih', '082222334455', 'jl. ciaul, lembang', '25000', 0, 'TPS_001', 'Go farm', 0, 0, '2021-07-01 10:26:27');

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
(11, 'PNJSO20211216003', 'aa', 157500, 'selesai', '2021-12-16', 'susu_olahan');

-- --------------------------------------------------------

--
-- Table structure for table `pos_detail_pembelian`
--

CREATE TABLE `pos_detail_pembelian` (
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

INSERT INTO `pos_detail_pembelian` (`invoice`, `id_supplier`, `id_produk`, `harga_satuan`, `jml`, `status`) VALUES
('KPSBUPMB221021001', 'WSS001', 'WSP001', 1500, 2, 'selesai'),
('KPSBUPMB221021001', 'WSS001', 'WSP002', 1500, 1, 'selesai'),
('KPSBUPMB221021001', 'WSS003', 'WSP004', 1500, 6, 'selesai'),
('KPSBUPMB221021001', 'WSS002', 'WSP003', 1500, 10, 'selesai'),
('KPSBUPMB221021002', 'WSS001', 'WSP002', 1500, 2, 'selesai'),
('KPSBUPMB221021003', 'WSS003', 'WSP004', 1500, 2, 'selesai'),
('KPSBUPMB221021004', '', '', 0, 3, 'selesai'),
('KPSBUPMB221021004', 'WSS001', 'WSP001', 1500, 1, 'selesai'),
('KPSBUPMB241021005', 'WSS001', 'WSP001', 1500, 2, 'selesai'),
('KPSBUPMB241021005', 'WSS001', 'WSP002', 1500, 1, 'selesai'),
('KPSBUPMB241021005', 'WSS004', 'WSP006', 15000, 5, 'selesai'),
('KPSBUPMB161121006', 'WSS001', 'WSP001', 1500, 50, 'selesai'),
('KPSBUPMB161121007', 'WSS001', 'WSP001', 1500, 10, 'selesai'),
('KPSBUPMB161121007', 'WSS001', 'WSP002', 1500, 10, 'selesai'),
('KPSBUPMB041221008', 'WSS001', 'WSP001', 1500, 1, 'selesai'),
('KPSBUPMB041221009', 'WSS001', 'WSP001', 1500, 10, 'selesai'),
('KPSBUPMB041221009', 'WSS002', 'WSP003', 1500, 10, 'selesai'),
('KPSBUPMB041221010', 'WSS001', 'WSP001', 1500, 30, 'selesai'),
('KPSBUPMB041221011', 'WSS001', 'WSP001', 1500, 10, 'selesai'),
('KPSBUPMB041221011', 'WSS001', 'WSP002', 1500, 1, 'selesai'),
('KPSBUPMB081221012', 'WSS001', 'WSP001', 1500, 11, 'selesai'),
('KPSBUPMB081221012', 'WSS001', 'WSP002', 1500, 10, 'selesai'),
('KPSBUPMB081221013', 'WSS001', 'WSP001', 1500, 11, 'selesai'),
('KPSBUPMB081221013', 'WSS002', 'WSP003', 1500, 11, 'selesai'),
('KPSBUPMB081221014', 'WSS001', 'WSP001', 1500, 10, 'selesai'),
('KPSBUPMB081221014', 'WSS002', 'WSP003', 1500, 5, 'selesai'),
('KPSBUPMB081221015', 'WSS001', 'WSP001', 1500, 10, 'selesai'),
('KPSBUPMB081221015', 'WSS002', 'WSP003', 1500, 10, 'selesai'),
('KPSBUPMB081221016', 'WSS001', 'WSP001', 1500, 100, 'selesai'),
('KPSBUPMB081221016', 'WSS002', 'WSP003', 1500, 100, 'selesai');

-- --------------------------------------------------------

--
-- Table structure for table `pos_detail_penjualan`
--

CREATE TABLE `pos_detail_penjualan` (
  `invoice` varchar(50) NOT NULL,
  `id_produk` varchar(50) DEFAULT NULL,
  `jml` varchar(50) DEFAULT NULL,
  `harga` int(20) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pos_detail_penjualan`
--

INSERT INTO `pos_detail_penjualan` (`invoice`, `id_produk`, `jml`, `harga`, `status`) VALUES
('KPSBU211021001', 'WSP001', '5', 2000, 'dalam proses'),
('KPSBU211021002', 'WSP002', '5', 2000, 'dalam proses'),
('KPSBU211021002', 'WSP003', '10', 2000, 'dalam proses'),
('KPSBU211021003', 'WSP001', '12', 2000, 'dalam proses'),
('KPSBU211021004', 'WSP001', '1', 2000, 'dalam proses'),
('KPSBU211021005', 'WSP001', '5', 2000, 'dalam proses'),
('KPSBU211021006', 'WSP004', '1', 2000, 'dalam proses'),
('KPSBU211021006', 'WSP006', '1', 2000, 'dalam proses'),
('KPSBU211021007', 'WSP001', '2', 2000, 'dalam proses'),
('KPSBU211021007', 'WSP005', '1', 2000, 'dalam proses'),
('KPSBU221021008', 'WSP001', '1', 2000, 'dalam proses'),
('KPSBU241021009', 'WSP002', '1', 2000, 'dalam proses'),
('KPSBU161121010', 'WSP005', '3', 2000, 'dalam proses'),
('KPSBU041221011', 'WSP001', '1', 2000, 'dalam proses'),
('KPSBU041221012', 'WSP001', '1', 2000, 'dalam proses'),
('KPSBU041221013', 'WSP001', '1', 2000, 'dalam proses'),
('KPSBU041221014', 'WSP001', '1', 2000, 'dalam proses'),
('KPSBU041221015', 'WSP001', '1', 2000, 'dalam proses'),
('KPSBU041221016', 'WSP001', '1', 2000, 'dalam proses'),
('KPSBU081221017', NULL, '4', NULL, 'dalam proses'),
('KPSBU081221017', 'WSP001', '3', 2000, 'dalam proses'),
('KPSBU081221018', 'WSP001', '5', 2000, 'dalam proses'),
('KPSBU081221018', NULL, '1', NULL, 'dalam proses'),
('KPSBU081221018', NULL, '1', NULL, 'dalam proses'),
('KPSBU081221018', NULL, '1', NULL, 'dalam proses'),
('KPSBU081221018', NULL, '1', NULL, 'dalam proses'),
('KPSBU081221018', 'WSP003', '5', 2000, 'dalam proses'),
('KPSBU081221019', 'WSP001', '10', 2000, 'dalam proses'),
('KPSBU081221019', 'WSP003', '10', 2000, 'dalam proses'),
('KPSBU081221020', 'WSP001', '5', 2000, 'dalam proses'),
('KPSBU081221021', 'WSP001', '10', 2000, 'dalam proses'),
('KPSBU081221021', 'WSP003', '5', 2000, 'dalam proses'),
('KPSBU081221022', 'WSP001', '10', 2000, 'dalam proses'),
('KPSBU081221023', 'WSP001', '10', 2000, 'dalam proses'),
('KPSBU081221024', 'WSP001', '10', 2000, 'dalam proses'),
('KPSBU081221025', 'WSP001', '10', 2000, 'dalam proses'),
('KPSBU081221025', 'WSP003', '15', 2000, 'dalam proses'),
('KPSBU081221026', 'WSP001', '5', 2000, 'dalam proses'),
('KPSBU081221027', 'WSP001', '10', 2000, 'dalam proses'),
('KPSBU081221028', 'WSP001', '10', 2000, 'dalam proses'),
('KPSBU081221029', 'WSP001', '10', 2000, 'dalam proses'),
('KPSBU081221030', 'WSP001', '10', 2000, 'dalam proses'),
('KPSBU081221031', 'WSP001', '10', 2000, 'dalam proses'),
('KPSBU081221032', 'WSP001', '1', 2000, 'dalam proses'),
('KPSBU081221033', 'WSP001', '1', 2000, 'dalam proses'),
('KPSBU081221034', 'WSP001', '1', 2000, 'dalam proses'),
('KPSBU081221035', 'WSP001', '9', 2000, 'dalam proses');

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
(1, 'KPSBUPMB221021001', 28500, 2850, 31350, '2021-10-22', 'selesai'),
(2, 'KPSBUPMB221021002', 3000, 300, 3300, '2021-10-22', 'selesai'),
(3, 'KPSBUPMB221021003', 3000, 300, 3300, '2021-10-22', 'selesai'),
(4, 'KPSBUPMB221021004', 1500, 150, 1650, '2021-10-22', 'selesai'),
(5, 'KPSBUPMB241021005', 79500, 7950, 87450, '2021-10-24', 'selesai'),
(6, 'KPSBUPMB161121006', 75000, 7500, 82500, '2021-11-16', 'selesai'),
(7, 'KPSBUPMB161121007', 30000, 3000, 33000, '2021-11-16', 'selesai'),
(8, 'KPSBUPMB041221008', 1500, 150, 1650, '2021-12-04', 'selesai'),
(9, 'KPSBUPMB041221009', 30000, 3000, 33000, '2021-12-04', 'selesai'),
(10, 'KPSBUPMB041221010', 45000, 4500, 49500, '2021-12-04', 'selesai'),
(11, 'KPSBUPMB041221011', 16500, 1650, 18150, '2021-12-04', 'selesai'),
(12, 'KPSBUPMB081221012', 31500, 3150, 34650, '2021-12-08', 'selesai'),
(13, 'KPSBUPMB081221013', 33000, 3300, 36300, '2021-12-08', 'selesai'),
(14, 'KPSBUPMB081221014', 22500, 2250, 24750, '2021-12-08', 'selesai'),
(15, 'KPSBUPMB081221015', 30000, 3000, 33000, '2021-12-08', 'selesai'),
(16, 'KPSBUPMB081221016', 300000, 30000, 330000, '2021-12-08', 'selesai');

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
  `date_payment` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status_kredit` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pos_penjualan`
--

INSERT INTO `pos_penjualan` (`id`, `invoice`, `total`, `status`, `tanggal`, `nama_pembeli`, `jenis_pembayaran`, `kembalian`, `pembayaran`, `ppn`, `total_trans`, `id_detail_jenis_anggota`, `date_payment`, `status_kredit`) VALUES
(1, 'KPSBU211021001', 10000, 'terbayar', '2021-10-21', 'Dd', '', 10000, 20000, NULL, NULL, 2, '2021-10-21 08:12:55', NULL),
(2, 'KPSBU211021002', 30000, 'terbayar', '2021-10-21', 'Z', 'tunai', 0, 0, NULL, NULL, 1, '2021-10-21 08:13:47', NULL),
(3, 'KPSBU211021003', 24000, 'terbayar', '2021-10-21', 'Dede', 'tunai', 0, 24000, NULL, NULL, 1, '2021-10-21 08:15:18', NULL),
(4, 'KPSBU211021004', 2000, 'terbayar', '2021-10-21', 'aaa', '', 3000, 5000, NULL, NULL, 2, '2021-10-21 08:32:50', NULL),
(5, 'KPSBU211021005', 10000, 'terbayar', '2021-10-21', 'Siti', 'tunai', 0, 10000, NULL, NULL, 1, '2021-10-21 08:43:54', NULL),
(6, 'KPSBU211021006', 4000, 'terbayar', '2021-10-21', 'siti 2', '', 1000, 5000, NULL, NULL, 2, '2021-10-21 08:45:39', NULL),
(7, 'KPSBU211021007', 6000, 'terbayar', '2021-10-21', 'asd', 'tunai', 0, 6000, NULL, NULL, 1, '2021-10-21 08:48:14', NULL),
(8, 'KPSBU221021008', 2000, 'terbayar', '2021-10-22', 'dede', 'tunai', 0, 2000, NULL, NULL, 1, '2021-10-22 05:56:01', NULL),
(9, 'KPSBU241021009', 2000, 'kredit', '2021-10-24', 'Agung', 'kredit', 0, 2000, NULL, NULL, 1, '2021-10-24 12:34:54', NULL),
(10, 'KPSBU161121010', 6000, 'kredit', '2021-11-16', 'Test Data', 'kredit', 0, 6000, NULL, NULL, 1, '2021-11-16 14:23:11', NULL),
(11, 'KPSBU041221011', 2000, 'kredit', '2021-12-04', 'Testtt 111', 'kredit', 0, 2000, NULL, NULL, 1, '2021-12-04 14:45:23', NULL),
(12, 'KPSBU041221012', 2000, 'terbayar', '2021-12-04', 'Siti', '', 8000, 10000, NULL, NULL, 2, '2021-12-04 15:03:44', NULL),
(13, 'KPSBU041221013', 2000, 'terbayar', '2021-12-04', 'Agung', 'tunai', 3000, 5000, NULL, NULL, 1, '2021-12-04 15:05:37', NULL),
(14, 'KPSBU041221014', 2000, 'kredit', '2021-12-04', 'dede', 'kredit', 0, 2000, NULL, NULL, 1, '2021-12-04 15:07:10', NULL),
(15, 'KPSBU041221015', 2000, 'kredit', '2021-12-04', 'Siti', 'kredit', 0, 2000, NULL, NULL, 1, '2021-12-04 15:58:51', 'lunas'),
(16, 'KPSBU041221016', 2000, 'kredit', '2021-12-04', 'Siti', 'kredit', 0, 2000, NULL, NULL, 1, '2021-12-04 16:00:29', NULL),
(17, 'KPSBU081221017', 6000, 'terbayar', '2021-12-08', 'Dede', '', 0, 6000, NULL, NULL, 2, '2021-12-08 03:27:11', NULL),
(18, 'KPSBU081221018', 20000, 'terbayar', '2021-12-08', 'test', '', 0, 20000, NULL, NULL, 2, '2021-12-08 03:36:53', NULL),
(19, 'KPSBU081221019', 40000, 'terbayar', '2021-12-08', 'Test', '', 0, 40000, NULL, NULL, 2, '2021-12-08 07:22:24', NULL),
(20, 'KPSBU081221020', 11000, 'terbayar', '2021-12-08', 'test', '', 0, 11000, 1000, 10000, 2, '2021-12-08 12:29:42', NULL),
(21, 'KPSBU081221021', 33000, 'kredit', '2021-12-08', 'Data Test', 'kredit', 0, 33000, 3000, 30000, 1, '2021-12-08 12:52:19', NULL),
(22, 'KPSBU081221022', 22000, 'terbayar', '2021-12-08', 'Sity', '', 0, 22000, 2000, 20000, 2, '2021-12-08 12:54:31', NULL),
(23, 'KPSBU081221023', 22000, 'kredit', '2021-12-08', 'Ale', 'kredit', 0, 22000, 2000, 20000, 1, '2021-12-08 12:58:37', NULL),
(24, 'KPSBU081221024', 22000, 'kredit', '2021-12-08', 'Ale', 'kredit', 0, 22000, 2000, 20000, 1, '2021-12-08 12:59:10', NULL),
(25, 'KPSBU081221025', 55000, 'kredit', '2021-12-08', 'Agung', 'kredit', 0, 55000, 5000, 50000, 1, '2021-12-08 13:00:26', 'lunas'),
(26, 'KPSBU081221026', 11000, 'kredit', '2021-12-08', 'Ale', 'kredit', 0, 11000, 1000, 10000, 1, '2021-12-08 13:05:58', 'lunas'),
(27, 'KPSBU081221027', 22000, 'kredit', '2021-12-08', 'Agung', 'kredit', 0, 22000, 2000, 20000, 1, '2021-12-08 13:12:08', 'lunas'),
(28, 'KPSBU081221028', 22000, 'kredit', '2021-12-08', 'Siti', 'kredit', 0, 22000, 2000, 20000, 1, '2021-12-08 13:26:39', 'lunas'),
(29, 'KPSBU081221029', 22000, 'kredit', '2021-12-08', 'Ale', 'kredit', 0, 22000, 2000, 20000, 1, '2021-12-08 13:27:32', 'lunas'),
(30, 'KPSBU081221030', 22000, 'kredit', '2021-12-08', 'Rozak', 'kredit', 0, 22000, 2000, 20000, 1, '2021-12-08 13:31:03', 'lunas'),
(31, 'KPSBU081221031', 22000, 'terbayar', '2021-12-08', 'Test', '', 0, 22000, 2000, 20000, 2, '2021-12-08 13:31:39', NULL),
(32, 'KPSBU081221032', 2200, 'kredit', '2021-12-08', 'Ale', 'kredit', 0, 2200, 200, 2000, 1, '2021-12-08 13:33:19', 'lunas'),
(33, 'KPSBU081221033', 2200, 'kredit', '2021-12-08', 'Siti', 'kredit', 0, 2200, 200, 2000, 1, '2021-12-08 13:46:34', 'lunas'),
(34, 'KPSBU081221034', 2200, 'kredit', '2021-12-08', 'Siti', 'kredit', 0, 2200, 200, 2000, 1, '2021-12-08 13:47:07', 'lunas'),
(35, 'KPSBU081221035', 19800, 'terbayar', '2021-12-08', 'Siti', 'tunai', 0, 19800, 1800, 18000, 1, '2021-12-08 13:47:27', NULL);

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
('PR_015', 'Rumput Grade B', 1000, '15000', 'liter', 2);

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
  `tgl_input` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
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
(1, 'Staff', 300000, 300000);

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
(2, 'Tetap', 's1', 4800000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_penggajian`
--

CREATE TABLE `tb_penggajian` (
  `id` int(11) NOT NULL,
  `id_penggajian` varchar(50) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `nm_pegawai` varchar(50) DEFAULT NULL,
  `nominal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_penggajian`
--

INSERT INTO `tb_penggajian` (`id`, `id_penggajian`, `tanggal`, `nm_pegawai`, `nominal`) VALUES
(1, 'GAJI-001', '2021-12-10', 'Ale', 5368500);

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
(1, 'TK0', 4500000);

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
-- Table structure for table `trans_peny_rev`
--

CREATE TABLE `trans_peny_rev` (
  `id` int(11) NOT NULL,
  `id_trans` varchar(50) DEFAULT NULL,
  `tgl_trans` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `total_peny` int(20) DEFAULT NULL,
  `total_akum` int(20) DEFAULT NULL,
  `nilai_peny` int(20) DEFAULT NULL,
  `tarif_rev` int(20) DEFAULT '0',
  `nilai_bk_perbaikan` int(20) DEFAULT '0',
  `nilai_bk_baru` int(20) DEFAULT '0',
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
  `is_deleted` tinyint(1) DEFAULT '0',
  `is_confirm` tinyint(1) DEFAULT '0'
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
('Admin Waserda', 'admin_waserda', '123', 'admin_waserda'),
('Andi Andi Andi', 'Andi', '123123', 'pegawai'),
('Kasir Waserda', 'kasir_waserda', '123', 'kasir_waserda'),
('Keuangan', 'keuangan1', 'keuangan1', 'keuangan1'),
('Keuangan', 'keuangan2', 'keuangan2', 'keuangan2'),
('Keuangan', 'keuangan3', 'keuangan3', 'keuangan3'),
('Raihan', 'komisikredit', '123', 'komisikredit'),
('hanifah', 'koordinatorwilayah', '123', 'koordinatorwilayah'),
('Penjualan', 'penjualan', 'penjualan', 'penjualan'),
('Vevi', 'petugasadm', '123', 'petugasadministrasidaerah'),
('Produksi', 'produksi1', 'produksi1', 'produksi1'),
('Produksi', 'produksi2', 'produksi2', 'produksi2'),
('Izmi', 'staffsimpanpinjam', '123', 'staffadministrasisimpanpinjam');

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
  `date_payment` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `waserda_pembayaran_kredit`
--

INSERT INTO `waserda_pembayaran_kredit` (`id`, `id_pembayaran`, `invoice`, `tanggal`, `nama`, `jenis_anggota`, `nominal`, `date_payment`) VALUES
(1, 'PMB-KR-20211228001', 'KPSBU081221025', '2021-12-28', 'Agung', NULL, 55000, '2021-12-08 13:00:55'),
(2, 'PMB-KR-20211208002', 'KPSBU081221026', '2021-12-08', 'Ale', NULL, 11000, '2021-12-08 13:06:08'),
(3, 'PMB-KR-20211208003', 'KPSBU081221027', '2021-12-08', 'Agung', 'peternak', 22000, '2021-12-08 13:17:37'),
(4, 'PMB-KR-20211208004', 'KPSBU081221028', '2021-12-08', 'Siti', 'pegawai', 22000, '2021-12-08 13:26:53'),
(5, 'PMB-KR-20211208005', 'KPSBU081221029', '2021-12-08', 'Ale', 'pegawai', 22000, '2021-12-08 13:30:53'),
(6, 'PMB-KR-20211208006', 'KPSBU081221030', '2021-12-08', 'Rozak', 'peternak', 22000, '2021-12-08 13:31:28'),
(7, 'PMB-KR-20211208007', 'KPSBU081221032', '2021-12-08', 'Ale', 'pegawai', 2200, '2021-12-08 13:46:12'),
(8, 'PMB-KR-20211208008', 'KPSBU081221033', '2021-12-08', 'Siti', 'pegawai', 2200, '2021-12-08 13:46:54'),
(9, 'PMB-KR-20211208009', 'KPSBU081221034', '2021-12-08', 'Siti', 'pegawai', 2200, '2021-12-08 13:47:16');

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
(1, '2021-12-15 14:47:00', 'Indomie Goreng', 100, 'Tolong pesan dengan qty 100', 'Refused'),
(2, '2021-12-15 14:57:00', 'Indomie Goreng', 100, 'tambah lagi ', 'Approved');

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
  `jml` int(11) DEFAULT '0',
  `status` tinyint(4) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `waserda_produk`
--

INSERT INTO `waserda_produk` (`id`, `kode`, `barcode_id`, `id_kategori`, `id_supplier_produk`, `nama_produk`, `harga_satuan`, `harga_jual`, `satuan_produk`, `jml`, `status`, `created_at`) VALUES
(1, 'WSP001', '8886008101053', 'WSK001', 'WSS001', 'Indomie Goreng', 1500, 2000, 'pcs', -7, 1, '2021-10-15 15:38:31'),
(2, 'WSP002', NULL, 'WSK001', 'WSS001', 'Indomie Goreng Ayam Bawang', 1500, 2000, 'pcs', 0, 1, '2021-10-15 15:38:31'),
(3, 'WSP003', NULL, 'WSK001', 'WSS002', 'Indomie Goreng Rendang', 1500, 2000, 'pcs', 90, 1, '2021-10-15 15:38:31'),
(4, 'WSP004', NULL, 'WSK001', 'WSS003', 'Indomie Goreng Aceh', 1500, 2000, 'pcs', 0, 1, '2021-10-15 15:38:31'),
(5, 'WSP005', '8995102800448', 'WSK001', 'WSS001', 'Indomie Rebus', 1500, 2000, 'pcs', 0, 1, '2021-10-15 15:38:31'),
(6, 'WSP006', NULL, 'WSK002', 'WSS004', 'teh sisri', 15000, 2000, 'kilo', 0, 1, '2021-10-16 16:02:42'),
(7, 'WSP007', NULL, 'WSK003', 'WSS001', 'Pulpen', 3000, 0, 'pcs', 0, 1, '2021-11-16 14:29:13');

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
  `status` tinyint(4) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
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
-- Indexes for table `pembayaranv`
--
ALTER TABLE `pembayaranv`
  ADD PRIMARY KEY (`no_trans`);

--
-- Indexes for table `pembayaran_susu`
--
ALTER TABLE `pembayaran_susu`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `penerimaan_kas`
--
ALTER TABLE `penerimaan_kas`
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
  ADD PRIMARY KEY (`username`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `alokasi_shu`
--
ALTER TABLE `alokasi_shu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `coa`
--
ALTER TABLE `coa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `detail_absen_rfid`
--
ALTER TABLE `detail_absen_rfid`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

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
-- AUTO_INCREMENT for table `jadwal_shift`
--
ALTER TABLE `jadwal_shift`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `jenis_penjualan`
--
ALTER TABLE `jenis_penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jurnal`
--
ALTER TABLE `jurnal`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=454;

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
-- AUTO_INCREMENT for table `log_bayar_pinjaman`
--
ALTER TABLE `log_bayar_pinjaman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `log_confirm_truck`
--
ALTER TABLE `log_confirm_truck`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `log_pembayaran_susu`
--
ALTER TABLE `log_pembayaran_susu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pembayaran_susu`
--
ALTER TABLE `pembayaran_susu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `penerimaan_kas`
--
ALTER TABLE `penerimaan_kas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pengeluaran_kas`
--
ALTER TABLE `pengeluaran_kas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pos_pembelian`
--
ALTER TABLE `pos_pembelian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `pos_penjualan`
--
ALTER TABLE `pos_penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

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
-- AUTO_INCREMENT for table `tb_jabatan`
--
ALTER TABLE `tb_jabatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_jenis_pegawai`
--
ALTER TABLE `tb_jenis_pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_penggajian`
--
ALTER TABLE `tb_penggajian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_ptkp`
--
ALTER TABLE `tb_ptkp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tps`
--
ALTER TABLE `tps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- AUTO_INCREMENT for table `waserda_pembayaran_kredit`
--
ALTER TABLE `waserda_pembayaran_kredit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `waserda_pengajuan_barang`
--
ALTER TABLE `waserda_pengajuan_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `waserda_produk`
--
ALTER TABLE `waserda_produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `waserda_supplier`
--
ALTER TABLE `waserda_supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
