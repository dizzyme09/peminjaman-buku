-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 22, 2021 at 02:22 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_buku`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `log_login` (IN `nama_user` VARCHAR(255), IN `id_pegawai` INT)  INSERT INTO tb_log_login_logout (id_pegawai, aktivitas, keterangan, waktu, dibuat, status_data) VALUES (id_pegawai, CONCAT(nama_user, ' telah login'), 'Login', NOW(), NOW(), 'Aktif')$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `log_logout` (IN `nama_user` VARCHAR(255), IN `id_pegawai` INT)  INSERT INTO tb_log_login_logout (id_pegawai, aktivitas, keterangan, waktu, dibuat, status_data) VALUES (id_pegawai, CONCAT(nama_user, ' telah logout'), 'Logout', NOW(), NOW(), 'Aktif')$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_buku`
--

CREATE TABLE `tb_buku` (
  `id_buku` int(11) NOT NULL,
  `judul_buku` varchar(255) NOT NULL,
  `genre` varchar(255) NOT NULL,
  `id_penerbit` int(11) NOT NULL,
  `tahun_terbit` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `dibuat` datetime DEFAULT NULL,
  `diubah` datetime DEFAULT NULL,
  `dihapus` datetime DEFAULT NULL,
  `status_data` enum('Aktif','Tidak Aktif') DEFAULT 'Aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_buku`
--

INSERT INTO `tb_buku` (`id_buku`, `judul_buku`, `genre`, `id_penerbit`, `tahun_terbit`, `jumlah`, `dibuat`, `diubah`, `dihapus`, `status_data`) VALUES
(1, 'Cantik Itu Luka', 'Fiksi', 1, 2006, 16, '2021-12-20 10:28:21', '2021-12-22 09:36:55', NULL, 'Aktif'),
(2, 'Rindu', 'Fiksi', 2, 2014, 28, '2021-12-20 10:28:21', '2021-12-21 20:57:09', NULL, 'Aktif'),
(3, 'Ayah', 'Fiksi', 3, 2015, 1, '2021-12-20 10:30:46', '2021-12-22 09:14:32', NULL, 'Aktif'),
(4, 'Sebuah Seni Untuk Bersikap Bodo Amat', 'Non Fiksi', 5, 2016, 6, '2021-12-20 10:30:46', '2021-12-22 09:54:06', NULL, 'Aktif'),
(5, 'Mimpi sejuta dollar', 'Fiksi', 1, 2011, 11, '2021-12-20 10:31:49', NULL, NULL, 'Aktif'),
(6, 'Sistem Operasi', 'Non Fiksi', 7, 2018, 18, '2021-12-20 10:31:49', '2021-12-21 23:53:14', NULL, 'Aktif'),
(7, 'Sains dan Agama', 'Non Fiksi', 8, 2020, 9, '2021-12-20 10:32:33', '2021-12-22 20:20:39', NULL, 'Aktif'),
(8, 'Chairul Tanjung Si Anak Singkong', 'Non Fiksi', 6, 2012, 29, '2021-12-20 10:32:33', '2021-12-22 07:47:01', NULL, 'Aktif'),
(9, 'Mindful Is Mind-Less: Seni Beristirahat Dalam Badai', 'Non Fiksi', 4, 2021, 24, '2021-12-21 16:54:23', '2021-12-22 01:38:41', NULL, 'Aktif'),
(10, 'Filosofi teras', 'Non Fiksi', 6, 2018, 4, '2021-12-21 16:54:23', '2021-12-22 20:21:30', NULL, 'Aktif'),
(11, 'Perang Eropa - Jilid 2', 'Non Fiksi', 6, 2019, 4, '2021-12-21 17:14:52', '2021-12-22 07:15:41', NULL, 'Aktif'),
(12, 'Dilan: Dia adalah Dilanku tahun 1990', 'Fiksi', 9, 2014, 41, '2021-12-21 18:30:09', '2021-12-22 07:51:10', NULL, 'Aktif'),
(13, 'Jejak Langkah', 'Fiksi', 10, 1985, 10, '2021-12-21 19:14:08', '2021-12-21 19:42:40', NULL, 'Aktif'),
(14, 'Saman', 'Fiksi', 11, 1998, 11, '2021-12-22 00:42:28', NULL, NULL, 'Aktif'),
(15, 'Supernova 1: Kesatria, Putri, &amp; Bintang Jatuh', 'Fiksi', 12, 2001, 17, '2021-12-22 07:13:03', NULL, NULL, 'Aktif'),
(16, 'Buku Sakti', 'Fiksi', 13, 2005, 15, '2021-12-22 09:02:30', '2021-12-22 09:37:33', NULL, 'Tidak Aktif'),
(17, 'NASDAQ', 'Fiksi', 13, 2014, 18, '2021-12-22 09:32:49', NULL, NULL, 'Aktif');

--
-- Triggers `tb_buku`
--
DELIMITER $$
CREATE TRIGGER `tr_buku_dibuat` BEFORE INSERT ON `tb_buku` FOR EACH ROW BEGIN
set new.dibuat = NOW();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_buku_diubah` BEFORE UPDATE ON `tb_buku` FOR EACH ROW BEGIN
set new.diubah = NOW();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_log_diubah` BEFORE UPDATE ON `tb_buku` FOR EACH ROW BEGIN
SET new.diubah = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_denda`
--

CREATE TABLE `tb_denda` (
  `id_denda` int(11) NOT NULL,
  `id_peminjaman` int(11) NOT NULL,
  `tgl_pembayaran` date NOT NULL,
  `jumlah` int(11) NOT NULL,
  `dibuat` datetime DEFAULT NULL,
  `diubah` datetime DEFAULT NULL,
  `dihapus` datetime DEFAULT NULL,
  `status_data` enum('Aktif','Tidak Aktif') DEFAULT 'Aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_denda`
--

INSERT INTO `tb_denda` (`id_denda`, `id_peminjaman`, `tgl_pembayaran`, `jumlah`, `dibuat`, `diubah`, `dihapus`, `status_data`) VALUES
(1, 3, '2021-12-20', 45000, '2021-12-20 21:38:07', '2021-12-22 07:47:01', NULL, 'Tidak Aktif'),
(2, 7, '2021-12-22', 45000, '2021-12-22 00:22:45', NULL, NULL, 'Aktif'),
(3, 9, '2021-12-22', 30000, '2021-12-22 07:07:27', NULL, NULL, 'Aktif'),
(5, 8, '2021-12-22', 15000, '2021-12-22 09:54:38', NULL, NULL, 'Aktif'),
(6, 18, '2021-12-22', 90000, '2021-12-22 20:20:39', NULL, NULL, 'Aktif'),
(7, 15, '2021-12-22', 90000, '2021-12-22 20:21:30', NULL, NULL, 'Aktif');

--
-- Triggers `tb_denda`
--
DELIMITER $$
CREATE TRIGGER `tr_denda_dibuat` BEFORE INSERT ON `tb_denda` FOR EACH ROW BEGIN
set new.dibuat = NOW();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_denda_diubah` BEFORE UPDATE ON `tb_denda` FOR EACH ROW BEGIN
set new.diubah = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kepengarangan`
--

CREATE TABLE `tb_kepengarangan` (
  `id_buku` int(11) NOT NULL,
  `id_penulis` int(11) NOT NULL,
  `dibuat` datetime DEFAULT NULL,
  `diubah` datetime DEFAULT NULL,
  `dihapus` datetime DEFAULT NULL,
  `status_data` enum('Aktif','Tidak Aktif') DEFAULT 'Aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_kepengarangan`
--

INSERT INTO `tb_kepengarangan` (`id_buku`, `id_penulis`, `dibuat`, `diubah`, `dihapus`, `status_data`) VALUES
(1, 1, '2021-12-20 10:34:50', NULL, NULL, 'Aktif'),
(2, 2, '2021-12-20 10:34:50', NULL, NULL, 'Aktif'),
(3, 3, '2021-12-20 10:34:50', NULL, NULL, 'Aktif'),
(4, 4, '2021-12-20 10:34:50', NULL, NULL, 'Aktif'),
(5, 5, '2021-12-20 10:34:50', NULL, NULL, 'Aktif'),
(6, 6, '2021-12-20 10:34:50', NULL, NULL, 'Aktif'),
(7, 7, '2021-12-20 10:34:50', NULL, NULL, 'Aktif'),
(8, 8, '2021-12-20 10:34:50', NULL, NULL, 'Aktif'),
(8, 9, '2021-12-20 10:35:09', '2021-12-20 10:35:17', NULL, 'Aktif'),
(9, 10, '2021-12-21 16:55:01', NULL, NULL, 'Aktif'),
(10, 11, '2021-12-21 16:55:01', NULL, NULL, 'Aktif'),
(11, 14, '2021-12-21 18:11:35', NULL, NULL, 'Aktif'),
(12, 13, '2021-12-21 18:30:36', NULL, NULL, 'Aktif'),
(13, 12, '2021-12-21 19:15:51', NULL, NULL, 'Aktif'),
(14, 15, '2021-12-22 00:42:42', NULL, NULL, 'Aktif'),
(15, 16, '2021-12-22 07:13:38', NULL, NULL, 'Aktif'),
(16, 17, '2021-12-22 09:03:10', NULL, NULL, 'Aktif'),
(16, 18, '2021-12-22 09:35:38', NULL, NULL, 'Aktif'),
(17, 18, '2021-12-22 09:35:16', NULL, NULL, 'Aktif');

--
-- Triggers `tb_kepengarangan`
--
DELIMITER $$
CREATE TRIGGER `tr_kepengarangan_dibuat` BEFORE INSERT ON `tb_kepengarangan` FOR EACH ROW BEGIN
set new.dibuat = NOW();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_kepengarangan_diubah` BEFORE UPDATE ON `tb_kepengarangan` FOR EACH ROW BEGIN
set new.diubah = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_log_login_logout`
--

CREATE TABLE `tb_log_login_logout` (
  `id_log` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `aktivitas` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `waktu` datetime NOT NULL,
  `dibuat` datetime NOT NULL,
  `diubah` datetime DEFAULT NULL,
  `dihapus` datetime DEFAULT NULL,
  `status_data` enum('Aktif','Tidak Aktif') DEFAULT 'Aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_log_login_logout`
--

INSERT INTO `tb_log_login_logout` (`id_log`, `id_pegawai`, `aktivitas`, `keterangan`, `waktu`, `dibuat`, `diubah`, `dihapus`, `status_data`) VALUES
(1, 1, 'manager telah login', 'Login', '2021-12-21 20:52:10', '2021-12-21 20:52:10', NULL, NULL, 'Aktif'),
(2, 1, 'manager telah logout', 'Logout', '2021-12-21 20:52:26', '2021-12-21 20:52:26', NULL, NULL, 'Aktif'),
(3, 3, 'pegawai2 telah login', 'Login', '2021-12-21 20:52:38', '2021-12-21 20:52:38', NULL, NULL, 'Aktif'),
(4, 3, 'pegawai2 telah logout', 'Logout', '2021-12-21 20:57:26', '2021-12-21 20:57:26', NULL, NULL, 'Aktif'),
(5, 1, 'manager telah login', 'Login', '2021-12-21 20:57:45', '2021-12-21 20:57:45', NULL, NULL, 'Aktif'),
(6, 1, 'manager telah logout', 'Logout', '2021-12-21 21:01:25', '2021-12-21 21:01:25', NULL, NULL, 'Aktif'),
(7, 2, 'pegawai1 telah login', 'Login', '2021-12-21 21:04:40', '2021-12-21 21:04:40', NULL, NULL, 'Aktif'),
(8, 2, 'pegawai1 telah logout', 'Logout', '2021-12-21 21:07:47', '2021-12-21 21:07:47', NULL, NULL, 'Aktif'),
(9, 3, 'pegawai2 telah login', 'Login', '2021-12-21 21:07:57', '2021-12-21 21:07:57', NULL, NULL, 'Aktif'),
(10, 3, 'pegawai2 telah logout', 'Logout', '2021-12-21 21:08:00', '2021-12-21 21:08:00', NULL, NULL, 'Aktif'),
(11, 1, 'manager telah login', 'Login', '2021-12-21 21:08:06', '2021-12-21 21:08:06', NULL, NULL, 'Aktif'),
(12, 1, 'manager telah logout', 'Logout', '2021-12-21 21:11:35', '2021-12-21 21:11:35', NULL, NULL, 'Aktif'),
(13, 2, 'pegawai1 telah login', 'Login', '2021-12-21 21:29:30', '2021-12-21 21:29:30', NULL, NULL, 'Aktif'),
(14, 2, 'pegawai1 telah logout', 'Logout', '2021-12-21 21:41:18', '2021-12-21 21:41:18', NULL, NULL, 'Aktif'),
(15, 1, 'manager telah login', 'Login', '2021-12-21 21:41:26', '2021-12-21 21:41:26', NULL, NULL, 'Aktif'),
(16, 1, 'manager telah logout', 'Logout', '2021-12-21 21:45:57', '2021-12-21 21:45:57', NULL, NULL, 'Aktif'),
(17, 2, 'pegawai1 telah login', 'Login', '2021-12-21 21:53:21', '2021-12-21 21:53:21', NULL, NULL, 'Aktif'),
(18, 2, 'pegawai1 telah logout', 'Logout', '2021-12-21 21:53:24', '2021-12-21 21:53:24', NULL, NULL, 'Aktif'),
(19, 1, 'manager telah login', 'Login', '2021-12-21 21:53:32', '2021-12-21 21:53:32', NULL, NULL, 'Aktif'),
(20, 1, 'manager telah logout', 'Logout', '2021-12-21 21:53:38', '2021-12-21 21:53:38', NULL, NULL, 'Aktif'),
(21, 1, 'manager telah login', 'Login', '2021-12-21 21:54:06', '2021-12-21 21:54:06', NULL, NULL, 'Aktif'),
(22, 1, 'manager telah logout', 'Logout', '2021-12-21 21:54:29', '2021-12-21 21:54:29', NULL, NULL, 'Aktif'),
(23, 2, 'pegawai1 telah login', 'Login', '2021-12-21 22:06:44', '2021-12-21 22:06:44', NULL, NULL, 'Aktif'),
(24, 2, 'pegawai1 telah logout', 'Logout', '2021-12-21 22:06:47', '2021-12-21 22:06:47', NULL, NULL, 'Aktif'),
(25, 1, 'manager telah login', 'Login', '2021-12-21 22:06:59', '2021-12-21 22:06:59', NULL, NULL, 'Aktif'),
(26, 1, 'manager telah logout', 'Logout', '2021-12-21 22:07:04', '2021-12-21 22:07:04', NULL, NULL, 'Aktif'),
(27, 2, 'pegawai1 telah login', 'Login', '2021-12-21 22:08:52', '2021-12-21 22:08:52', NULL, NULL, 'Aktif'),
(28, 2, 'pegawai1 telah logout', 'Logout', '2021-12-21 22:12:03', '2021-12-21 22:12:03', NULL, NULL, 'Aktif'),
(29, 1, 'manager telah login', 'Login', '2021-12-21 22:38:15', '2021-12-21 22:38:15', NULL, NULL, 'Aktif'),
(30, 1, 'manager telah logout', 'Logout', '2021-12-21 22:59:11', '2021-12-21 22:59:11', NULL, NULL, 'Aktif'),
(32, 1, 'manager telah login', 'Login', '2021-12-21 23:01:11', '2021-12-21 23:01:11', NULL, NULL, 'Aktif'),
(33, 1, 'manager telah logout', 'Logout', '2021-12-21 23:01:32', '2021-12-21 23:01:32', NULL, NULL, 'Aktif'),
(34, 1, 'manager telah login', 'Login', '2021-12-21 23:02:08', '2021-12-21 23:02:08', NULL, NULL, 'Aktif'),
(35, 1, 'manager telah logout', 'Logout', '2021-12-21 23:13:06', '2021-12-21 23:13:06', NULL, NULL, 'Aktif'),
(36, 1, 'manager telah login', 'Login', '2021-12-21 23:13:15', '2021-12-21 23:13:15', NULL, NULL, 'Aktif'),
(37, 1, 'manager telah logout', 'Logout', '2021-12-21 23:15:32', '2021-12-21 23:15:32', NULL, NULL, 'Aktif'),
(38, 1, 'manager telah login', 'Login', '2021-12-21 23:15:50', '2021-12-21 23:15:50', NULL, NULL, 'Aktif'),
(39, 1, 'manager telah logout', 'Logout', '2021-12-21 23:18:56', '2021-12-21 23:18:56', NULL, NULL, 'Aktif'),
(40, 2, 'pegawai1 telah login', 'Login', '2021-12-21 23:19:02', '2021-12-21 23:19:02', NULL, NULL, 'Aktif'),
(41, 2, 'pegawai1 telah logout', 'Logout', '2021-12-21 23:24:03', '2021-12-21 23:24:03', NULL, NULL, 'Aktif'),
(42, 2, 'pegawai1 telah login', 'Login', '2021-12-21 23:30:57', '2021-12-21 23:30:57', NULL, NULL, 'Aktif'),
(43, 2, 'pegawai1 telah logout', 'Logout', '2021-12-21 23:33:57', '2021-12-21 23:33:57', NULL, NULL, 'Aktif'),
(44, 2, 'pegawai1 telah login', 'Login', '2021-12-21 23:37:02', '2021-12-21 23:37:02', NULL, NULL, 'Aktif'),
(45, 2, 'pegawai1 telah logout', 'Logout', '2021-12-21 23:55:16', '2021-12-21 23:55:16', NULL, NULL, 'Aktif'),
(46, 2, 'pegawai1 telah login', 'Login', '2021-12-21 23:55:23', '2021-12-21 23:55:23', NULL, NULL, 'Aktif'),
(47, 2, 'pegawai1 telah logout', 'Logout', '2021-12-21 23:56:05', '2021-12-21 23:56:05', NULL, NULL, 'Aktif'),
(48, 2, 'pegawai1 telah login', 'Login', '2021-12-21 23:56:14', '2021-12-21 23:56:14', NULL, NULL, 'Aktif'),
(49, 2, 'pegawai1 telah logout', 'Logout', '2021-12-21 23:56:35', '2021-12-21 23:56:35', NULL, NULL, 'Aktif'),
(50, 1, 'manager telah login', 'Login', '2021-12-21 23:56:41', '2021-12-21 23:56:41', NULL, NULL, 'Aktif'),
(51, 1, 'manager telah logout', 'Logout', '2021-12-21 23:57:43', '2021-12-21 23:57:43', NULL, NULL, 'Aktif'),
(52, 2, 'pegawai1 telah login', 'Login', '2021-12-21 23:57:57', '2021-12-21 23:57:57', NULL, NULL, 'Aktif'),
(53, 2, 'pegawai1 telah login', 'Login', '2021-12-22 00:05:59', '2021-12-22 00:05:59', NULL, NULL, 'Aktif'),
(54, 2, 'pegawai1 telah logout', 'Logout', '2021-12-22 00:23:54', '2021-12-22 00:23:54', NULL, NULL, 'Aktif'),
(55, 1, 'manager telah login', 'Login', '2021-12-22 00:24:06', '2021-12-22 00:24:06', NULL, NULL, 'Aktif'),
(56, 1, 'manager telah logout', 'Logout', '2021-12-22 00:39:50', '2021-12-22 00:39:50', NULL, NULL, 'Aktif'),
(57, 1, 'manager telah login', 'Login', '2021-12-22 00:40:42', '2021-12-22 00:40:42', NULL, NULL, 'Aktif'),
(58, 1, 'manager telah logout', 'Logout', '2021-12-22 00:42:52', '2021-12-22 00:42:52', NULL, NULL, 'Aktif'),
(59, 2, 'pegawai1 telah login', 'Login', '2021-12-22 00:42:58', '2021-12-22 00:42:58', NULL, NULL, 'Aktif'),
(60, 2, 'pegawai1 telah logout', 'Logout', '2021-12-22 01:02:33', '2021-12-22 01:02:33', NULL, NULL, 'Aktif'),
(61, 1, 'manager telah login', 'Login', '2021-12-22 01:02:43', '2021-12-22 01:02:43', NULL, NULL, 'Aktif'),
(62, 1, 'manager telah logout', 'Logout', '2021-12-22 01:19:04', '2021-12-22 01:19:04', NULL, NULL, 'Aktif'),
(63, 2, 'pegawai1 telah login', 'Login', '2021-12-22 01:19:12', '2021-12-22 01:19:12', NULL, NULL, 'Aktif'),
(64, 2, 'pegawai1 telah logout', 'Logout', '2021-12-22 01:31:43', '2021-12-22 01:31:43', NULL, NULL, 'Aktif'),
(65, 2, 'pegawai1 telah login', 'Login', '2021-12-22 01:31:51', '2021-12-22 01:31:51', NULL, NULL, 'Aktif'),
(66, 2, 'pegawai1 telah logout', 'Logout', '2021-12-22 01:32:22', '2021-12-22 01:32:22', NULL, NULL, 'Aktif'),
(67, 1, 'manager telah login', 'Login', '2021-12-22 01:32:28', '2021-12-22 01:32:28', NULL, NULL, 'Aktif'),
(68, 1, 'manager telah logout', 'Logout', '2021-12-22 01:33:09', '2021-12-22 01:33:09', NULL, NULL, 'Aktif'),
(69, 1, 'manager telah login', 'Login', '2021-12-22 01:34:14', '2021-12-22 01:34:14', NULL, NULL, 'Aktif'),
(70, 1, 'manager telah logout', 'Logout', '2021-12-22 01:37:36', '2021-12-22 01:37:36', NULL, NULL, 'Aktif'),
(71, 3, 'pegawai2 telah login', 'Login', '2021-12-22 01:37:43', '2021-12-22 01:37:43', NULL, NULL, 'Aktif'),
(72, 3, 'pegawai2 telah logout', 'Logout', '2021-12-22 01:38:57', '2021-12-22 01:38:57', NULL, NULL, 'Aktif'),
(73, 2, 'pegawai1 telah login', 'Login', '2021-12-22 06:51:30', '2021-12-22 06:51:30', NULL, NULL, 'Aktif'),
(74, 2, 'pegawai1 telah logout', 'Logout', '2021-12-22 06:52:56', '2021-12-22 06:52:56', NULL, NULL, 'Aktif'),
(75, 1, 'manager telah login', 'Login', '2021-12-22 06:53:05', '2021-12-22 06:53:05', NULL, NULL, 'Aktif'),
(76, 1, 'manager telah logout', 'Logout', '2021-12-22 06:55:13', '2021-12-22 06:55:13', NULL, NULL, 'Aktif'),
(77, 3, 'pegawai2 telah login', 'Login', '2021-12-22 06:55:20', '2021-12-22 06:55:20', NULL, NULL, 'Aktif'),
(78, 3, 'pegawai2 telah logout', 'Logout', '2021-12-22 07:07:45', '2021-12-22 07:07:45', NULL, NULL, 'Aktif'),
(79, 1, 'manager telah login', 'Login', '2021-12-22 07:07:53', '2021-12-22 07:07:53', NULL, NULL, 'Aktif'),
(80, 1, 'manager telah logout', 'Logout', '2021-12-22 07:14:26', '2021-12-22 07:14:26', NULL, NULL, 'Aktif'),
(81, 2, 'pegawai1 telah login', 'Login', '2021-12-22 07:14:33', '2021-12-22 07:14:33', NULL, NULL, 'Aktif'),
(82, 2, 'pegawai1 telah logout', 'Logout', '2021-12-22 07:14:46', '2021-12-22 07:14:46', NULL, NULL, 'Aktif'),
(83, 1, 'manager telah login', 'Login', '2021-12-22 07:14:54', '2021-12-22 07:14:54', NULL, NULL, 'Aktif'),
(84, 1, 'manager telah logout', 'Logout', '2021-12-22 07:29:53', '2021-12-22 07:29:53', NULL, NULL, 'Aktif'),
(85, 1, 'manager telah login', 'Login', '2021-12-22 07:35:45', '2021-12-22 07:35:45', NULL, NULL, 'Aktif'),
(86, 1, 'manager telah logout', 'Logout', '2021-12-22 07:38:36', '2021-12-22 07:38:36', NULL, NULL, 'Aktif'),
(87, 2, 'pegawai1 telah login', 'Login', '2021-12-22 07:48:07', '2021-12-22 07:48:07', NULL, NULL, 'Aktif'),
(88, 2, 'pegawai1 telah logout', 'Logout', '2021-12-22 07:51:32', '2021-12-22 07:51:32', NULL, NULL, 'Aktif'),
(89, 1, 'manager telah login', 'Login', '2021-12-22 07:52:05', '2021-12-22 07:52:05', NULL, NULL, 'Aktif'),
(90, 1, 'manager telah logout', 'Logout', '2021-12-22 07:55:09', '2021-12-22 07:55:09', NULL, NULL, 'Aktif'),
(91, 1, 'manager telah login', 'Login', '2021-12-22 07:58:14', '2021-12-22 07:58:14', NULL, NULL, 'Aktif'),
(92, 1, 'manager telah logout', 'Logout', '2021-12-22 08:07:53', '2021-12-22 08:07:53', NULL, NULL, 'Aktif'),
(93, 2, 'pegawai1 telah login', 'Login', '2021-12-22 08:07:59', '2021-12-22 08:07:59', NULL, NULL, 'Aktif'),
(94, 2, 'pegawai1 telah logout', 'Logout', '2021-12-22 08:10:52', '2021-12-22 08:10:52', NULL, NULL, 'Aktif'),
(95, 2, 'pegawai1 telah login', 'Login', '2021-12-22 08:49:05', '2021-12-22 08:49:05', NULL, NULL, 'Aktif'),
(96, 2, 'pegawai1 telah logout', 'Logout', '2021-12-22 08:49:27', '2021-12-22 08:49:27', NULL, NULL, 'Aktif'),
(97, 1, 'manager telah login', 'Login', '2021-12-22 08:49:35', '2021-12-22 08:49:35', NULL, NULL, 'Aktif'),
(98, 1, 'manager telah logout', 'Logout', '2021-12-22 08:49:49', '2021-12-22 08:49:49', NULL, NULL, 'Aktif'),
(99, 2, 'pegawai1 telah login', 'Login', '2021-12-22 08:50:09', '2021-12-22 08:50:09', NULL, NULL, 'Aktif'),
(100, 2, 'pegawai1 telah logout', 'Logout', '2021-12-22 08:58:04', '2021-12-22 08:58:04', NULL, NULL, 'Aktif'),
(101, 1, 'manager telah login', 'Login', '2021-12-22 08:58:14', '2021-12-22 08:58:14', NULL, NULL, 'Aktif'),
(102, 1, 'manager telah logout', 'Logout', '2021-12-22 09:08:28', '2021-12-22 09:08:28', NULL, NULL, 'Aktif'),
(103, 2, 'pegawai1 telah login', 'Login', '2021-12-22 09:08:36', '2021-12-22 09:08:36', NULL, NULL, 'Aktif'),
(104, 2, 'pegawai1 telah logout', 'Logout', '2021-12-22 09:11:40', '2021-12-22 09:11:40', NULL, NULL, 'Aktif'),
(105, 1, 'manager telah login', 'Login', '2021-12-22 09:11:50', '2021-12-22 09:11:50', NULL, NULL, 'Aktif'),
(106, 1, 'manager telah logout', 'Logout', '2021-12-22 09:12:17', '2021-12-22 09:12:17', NULL, NULL, 'Aktif'),
(107, 2, 'pegawai1 telah login', 'Login', '2021-12-22 09:12:24', '2021-12-22 09:12:24', NULL, NULL, 'Aktif'),
(108, 2, 'pegawai1 telah logout', 'Logout', '2021-12-22 09:14:55', '2021-12-22 09:14:55', NULL, NULL, 'Aktif'),
(109, 1, 'manager telah login', 'Login', '2021-12-22 09:15:46', '2021-12-22 09:15:46', NULL, NULL, 'Aktif'),
(110, 1, 'manager telah logout', 'Logout', '2021-12-22 09:15:51', '2021-12-22 09:15:51', NULL, NULL, 'Aktif'),
(111, 2, 'pegawai1 telah login', 'Login', '2021-12-22 09:15:58', '2021-12-22 09:15:58', NULL, NULL, 'Aktif'),
(112, 2, 'pegawai1 telah logout', 'Logout', '2021-12-22 09:16:56', '2021-12-22 09:16:56', NULL, NULL, 'Aktif'),
(113, 2, 'pegawai1 telah login', 'Login', '2021-12-22 09:20:26', '2021-12-22 09:20:26', NULL, NULL, 'Aktif'),
(114, 2, 'pegawai1 telah logout', 'Logout', '2021-12-22 09:21:01', '2021-12-22 09:21:01', NULL, NULL, 'Aktif'),
(115, 1, 'manager telah login', 'Login', '2021-12-22 09:29:29', '2021-12-22 09:29:29', NULL, NULL, 'Aktif'),
(116, 1, 'manager telah logout', 'Logout', '2021-12-22 09:38:06', '2021-12-22 09:38:06', NULL, NULL, 'Aktif'),
(117, 2, 'pegawai1 telah login', 'Login', '2021-12-22 09:38:13', '2021-12-22 09:38:13', NULL, NULL, 'Aktif'),
(118, 2, 'pegawai1 telah logout', 'Logout', '2021-12-22 09:43:48', '2021-12-22 09:43:48', NULL, NULL, 'Aktif'),
(119, 1, 'manager telah login', 'Login', '2021-12-22 09:43:56', '2021-12-22 09:43:56', NULL, NULL, 'Aktif'),
(120, 1, 'manager telah logout', 'Logout', '2021-12-22 09:48:20', '2021-12-22 09:48:20', NULL, NULL, 'Aktif'),
(121, 2, 'pegawai1 telah login', 'Login', '2021-12-22 09:48:29', '2021-12-22 09:48:29', NULL, NULL, 'Aktif'),
(122, 2, 'pegawai1 telah logout', 'Logout', '2021-12-22 09:59:38', '2021-12-22 09:59:38', NULL, NULL, 'Aktif'),
(123, 2, 'pegawai1 telah login', 'Login', '2021-12-22 10:00:41', '2021-12-22 10:00:41', NULL, NULL, 'Aktif'),
(124, 2, 'pegawai1 telah login', 'Login', '2021-12-22 20:19:58', '2021-12-22 20:19:58', NULL, NULL, 'Aktif'),
(125, 2, 'pegawai1 telah logout', 'Logout', '2021-12-22 20:22:23', '2021-12-22 20:22:23', NULL, NULL, 'Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pegawai`
--

CREATE TABLE `tb_pegawai` (
  `id_pegawai` int(11) NOT NULL,
  `NIK` varchar(255) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `nama` varchar(255) NOT NULL,
  `jenis_kelamin` enum('Laki-Laki','Perempuan') NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `tempat_lahir` varchar(255) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `no_telp` varchar(255) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `dibuat` datetime DEFAULT NULL,
  `diubah` datetime DEFAULT NULL,
  `dihapus` datetime DEFAULT NULL,
  `status_data` enum('Aktif','Tidak Aktif') DEFAULT 'Aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_pegawai`
--

INSERT INTO `tb_pegawai` (`id_pegawai`, `NIK`, `id_user`, `nama`, `jenis_kelamin`, `jabatan`, `tempat_lahir`, `tanggal_lahir`, `no_telp`, `alamat`, `dibuat`, `diubah`, `dihapus`, `status_data`) VALUES
(1, '3911222902804442', 1, 'Surti Menangis', 'Perempuan', 'Manager', 'Bandung', '1980-04-12', '081380806556', 'Jl. Haji VII No.881 Kecamatan Duri Selatan, Jakarta Barat ', '2021-12-19 14:18:35', '2021-12-22 09:31:27', NULL, 'Aktif'),
(2, '2001297892600134', 2, 'Robby Sandoro', 'Laki-Laki', 'Pegawai', 'Bandung', '1999-03-25', '081390312256', 'Kp. Rambutan No.56 RT004/RW001 Jakarta Timur', '2021-12-19 14:19:52', '2021-12-22 07:10:45', NULL, 'Aktif'),
(3, '3451890880654344', 3, 'Megananda Bayu', 'Laki-Laki', 'Pegawai', 'Jakarta', '2002-11-10', '081310099196', 'Jl. Merpati Blok-G8 No.13 Kalideres, Jakarta Barat', '2021-12-19 14:19:52', '2021-12-22 09:31:11', NULL, 'Aktif');

--
-- Triggers `tb_pegawai`
--
DELIMITER $$
CREATE TRIGGER `tr_pegawai_dibuat` BEFORE INSERT ON `tb_pegawai` FOR EACH ROW BEGIN
set new.dibuat = NOW();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_pegawai_diubah` BEFORE UPDATE ON `tb_pegawai` FOR EACH ROW BEGIN
set new.diubah = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_peminjam`
--

CREATE TABLE `tb_peminjam` (
  `NIK` varchar(255) NOT NULL,
  `id_member` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jenis_kelamin` enum('Laki-Laki','Perempuan') NOT NULL,
  `tempat_lahir` varchar(255) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `no_telp` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `dibuat` datetime DEFAULT NULL,
  `diubah` datetime DEFAULT NULL,
  `dihapus` datetime DEFAULT NULL,
  `status_data` enum('Aktif','Tidak Aktif') DEFAULT 'Aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_peminjam`
--

INSERT INTO `tb_peminjam` (`NIK`, `id_member`, `nama`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `no_telp`, `alamat`, `dibuat`, `diubah`, `dihapus`, `status_data`) VALUES
('5371343332650924', 1, 'Dino Herlambang', 'Laki-Laki', 'Jakarta', '2002-09-20', '087867122189', 'Kp. Bahagia IV No.86 RT004/RW011 Pancoran, Jakarta Selatan', '2021-12-19 14:21:21', '2021-12-22 09:50:32', NULL, 'Aktif'),
('6365891232638937', 2, 'Kunto Adit', 'Laki-Laki', 'Jakarta', '2000-12-03', '087887015751', 'Kalibata City No.44 Jakarta Selatan', '2021-12-19 14:21:21', '2021-12-21 09:54:52', NULL, 'Aktif'),
('3525015201880002', 3, 'Bima Khusnan Nadori', 'Laki-Laki', 'Malang', '2001-12-31', '081211410354', 'Jl. Menceng No.77 RT003/RW002 Cengkareng, Jakarta Barat', '2021-12-21 10:06:36', '2021-12-21 16:43:51', NULL, 'Aktif'),
('3525017006950028', 4, 'Rahma Tamah', 'Perempuan', 'Jakarta', '2002-04-13', '087889900976', 'Kp. Rambutan III No.45 Kalideres, Jakarta Barat', '2021-12-21 16:50:25', '2021-12-22 07:02:11', NULL, 'Aktif'),
('3525016401830001', 5, 'Saves Anggiat Sitompul', 'Laki-Laki', 'Jakarta', '2003-07-24', '082113818169', 'Kp. Bulak Teko No.64 RT004/RW001 Kalideres, Jakarta Barat', '2021-12-21 20:54:04', '2021-12-21 20:54:30', NULL, 'Aktif'),
('3525016211930001', 6, 'Muhammad Hilmi Ihsan Mumtaaz', 'Laki-Laki', 'Cirebon', '2002-05-13', '087884500154', 'Citra Garden 2 Ext. No.341 Kalideres, Jakarta Barat', '2021-12-21 23:32:37', '2021-12-22 07:01:29', NULL, 'Aktif'),
('3525013006920008', 7, 'Zaid Nurrohman', 'Laki-Laki', 'Padang', '1996-04-14', '081290766561', 'Jl. Bukit Tinggi No.44', '2021-12-21 23:33:41', NULL, NULL, 'Aktif'),
('3326160105070023', 8, 'Maharani Azizah', 'Perempuan', 'Jakarta', '2002-05-25', '087886011165', 'Kp. Rambutan No.56 RT004/RW003 Kalideres, Jakarta Barat', '2021-12-22 07:00:07', NULL, NULL, 'Aktif'),
('123456', 9, 'Ihsan Ganteng', 'Laki-Laki', 'Jakarta', '2002-05-20', '1235642', 'asdsad', '2021-12-22 08:51:09', '2021-12-22 08:54:19', NULL, 'Tidak Aktif'),
('44532424', 10, 'Bims Skuy', 'Laki-Laki', 'Jakarta', '2001-05-22', '23552414', 'cengkareng', '2021-12-22 09:49:16', '2021-12-22 09:51:04', NULL, 'Tidak Aktif');

--
-- Triggers `tb_peminjam`
--
DELIMITER $$
CREATE TRIGGER `tr_peminjam_dibuat` BEFORE INSERT ON `tb_peminjam` FOR EACH ROW BEGIN
set new.dibuat = NOW();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_peminjam_diubah` BEFORE UPDATE ON `tb_peminjam` FOR EACH ROW BEGIN
set new.diubah = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_peminjaman`
--

CREATE TABLE `tb_peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `id_member` int(11) DEFAULT NULL,
  `id_buku` int(11) DEFAULT NULL,
  `id_pegawai` int(11) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `status_peminjaman` varchar(255) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `dibuat` datetime DEFAULT NULL,
  `diubah` datetime DEFAULT NULL,
  `dihapus` datetime DEFAULT NULL,
  `status_data` enum('Aktif','Tidak Aktif') DEFAULT 'Aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_peminjaman`
--

INSERT INTO `tb_peminjaman` (`id_peminjaman`, `id_member`, `id_buku`, `id_pegawai`, `tgl_pinjam`, `tgl_kembali`, `status_peminjaman`, `keterangan`, `dibuat`, `diubah`, `dihapus`, `status_data`) VALUES
(1, 1, 1, 3, '2021-12-14', '2021-12-20', 'Dikembalikan', 'Non Denda', '2021-12-20 15:11:00', '2021-12-20 20:04:29', NULL, 'Aktif'),
(2, 4, 7, 2, '2021-12-16', '2021-12-22', 'Dikembalikan', 'Non Denda', '2021-12-22 07:48:26', '2021-12-22 07:50:47', NULL, 'Aktif'),
(3, 2, 8, 3, '2021-12-10', '2021-12-20', 'Dikembalikan', 'Denda', '2021-12-20 21:32:39', '2021-12-22 07:47:01', NULL, 'Tidak Aktif'),
(4, 1, 6, 2, '2021-12-16', '2021-12-21', 'Dikembalikan', 'Non Denda', '2021-12-21 00:31:27', '2021-12-21 23:53:14', NULL, 'Aktif'),
(5, 5, 2, 3, '2021-12-15', '2021-12-21', 'Dikembalikan', 'Non Denda', '2021-12-21 20:56:23', '2021-12-21 20:57:09', NULL, 'Aktif'),
(6, 3, 8, 2, '2021-12-16', '2021-12-22', 'Dikembalikan', 'Non Denda', '2021-12-21 23:22:14', '2021-12-22 00:06:59', NULL, 'Aktif'),
(7, 3, 1, 2, '2021-12-12', '2021-12-22', 'Dikembalikan', 'Denda', '2021-12-22 00:20:47', '2021-12-22 00:22:45', NULL, 'Aktif'),
(8, 3, 7, 2, '2021-12-14', '2021-12-22', 'Dikembalikan', 'Denda', '2021-12-22 01:00:20', '2021-12-22 09:54:38', NULL, 'Aktif'),
(9, 6, 10, 2, '2021-12-13', '2021-12-22', 'Dikembalikan', 'Denda', '2021-12-22 01:00:31', '2021-12-22 07:07:27', NULL, 'Aktif'),
(10, 4, 9, 3, '2021-12-17', '2021-12-22', 'Dikembalikan', 'Non Denda', '2021-12-22 01:38:35', '2021-12-22 01:38:41', NULL, 'Aktif'),
(11, 6, 11, 3, '2021-12-19', '2021-12-22', 'Dikembalikan', 'Non Denda', '2021-12-22 07:05:14', '2021-12-22 07:07:07', NULL, 'Aktif'),
(12, 8, 12, 2, '2021-12-17', '2021-12-22', 'Dikembalikan', 'Non Denda', '2021-12-22 07:49:07', '2021-12-22 07:51:10', NULL, 'Aktif'),
(13, 2, 1, 2, '2021-12-13', NULL, 'Dipinjam', NULL, '2021-12-22 07:50:11', NULL, NULL, 'Aktif'),
(14, 3, 10, 2, '2021-12-14', NULL, 'Dipinjam', NULL, '2021-12-22 08:56:09', NULL, NULL, 'Aktif'),
(15, 6, 10, 2, '2021-12-09', '2021-12-22', 'Dikembalikan', 'Denda', '2021-12-22 10:09:17', '2021-12-22 20:21:30', NULL, 'Aktif'),
(16, 2, 3, 2, '2021-12-20', '2021-12-22', 'Dikembalikan', 'Non Denda', '2021-12-22 09:12:38', '2021-12-22 09:14:32', NULL, 'Aktif'),
(17, 4, 4, 2, '2021-12-14', NULL, 'Dipinjam', NULL, '2021-12-22 09:54:06', NULL, NULL, 'Aktif'),
(18, 3, 7, 2, '2021-12-09', '2021-12-22', 'Dikembalikan', 'Denda', '2021-12-22 20:20:30', '2021-12-22 20:20:39', NULL, 'Aktif');

--
-- Triggers `tb_peminjaman`
--
DELIMITER $$
CREATE TRIGGER `tr_sebelum_kembali` BEFORE UPDATE ON `tb_peminjaman` FOR EACH ROW BEGIN
DECLARE jarak_waktu INT;
DECLARE total_denda BIGINT;
SET jarak_waktu = DATEDIFF(new.tgl_kembali, new.tgl_pinjam);
IF(jarak_waktu > 7) THEN
SET total_denda = (jarak_waktu - 7) * 15000;
SET new.keterangan = 'Denda';
INSERT INTO tb_denda
(id_peminjaman, tgl_pembayaran, jumlah)
VALUES
(new.id_peminjaman, NOW(), total_denda);
ELSE
SET new.keterangan = 'Non Denda';
END IF;

IF(new.status_data = 'Tidak Aktif') THEN
update tb_denda SET status_data='Tidak Aktif' WHERE id_peminjaman=new.id_peminjaman;
END IF;
set new.diubah = NOW();
set new.status_peminjaman = 'Dikembalikan';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_sebelum_pinjam` BEFORE INSERT ON `tb_peminjaman` FOR EACH ROW BEGIN
set new.status_peminjaman = 'Dipinjam';
set new.dibuat = NOW();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_setelah_kembali` AFTER UPDATE ON `tb_peminjaman` FOR EACH ROW BEGIN
update tb_buku set jumlah = jumlah + 1 where id_buku = new.id_buku;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_setelah_pinjam` AFTER INSERT ON `tb_peminjaman` FOR EACH ROW BEGIN
DECLARE id_penerbit_terpilih int;
set id_penerbit_terpilih = (select id_penerbit from tb_buku where id_buku = new.id_buku);
update tb_penerbit set jumlah_dipinjam = jumlah_dipinjam + 1 where id_penerbit = id_penerbit_terpilih;
update tb_buku set jumlah = jumlah - 1 where id_buku = new.id_buku;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_penerbit`
--

CREATE TABLE `tb_penerbit` (
  `id_penerbit` int(11) NOT NULL,
  `nama_penerbit` varchar(255) NOT NULL,
  `jumlah_dipinjam` int(11) DEFAULT 0,
  `dibuat` datetime DEFAULT NULL,
  `diubah` datetime DEFAULT NULL,
  `dihapus` datetime DEFAULT NULL,
  `status_data` enum('Aktif','Tidak Aktif') DEFAULT 'Aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_penerbit`
--

INSERT INTO `tb_penerbit` (`id_penerbit`, `nama_penerbit`, `jumlah_dipinjam`, `dibuat`, `diubah`, `dihapus`, `status_data`) VALUES
(1, 'Gramedia Pustaka Utama', 3, '2021-12-20 10:06:49', '2021-12-22 07:50:11', NULL, 'Aktif'),
(2, 'Republika', 1, '2021-12-20 10:06:49', '2021-12-21 20:56:23', NULL, 'Aktif'),
(3, 'Bentang Pustaka', 1, '2021-12-20 10:07:30', '2021-12-22 09:12:38', NULL, 'Aktif'),
(4, 'Elex Media Komputindo', 1, '2021-12-20 10:07:30', '2021-12-22 01:38:35', NULL, 'Aktif'),
(5, 'Grasindo', 1, '2021-12-20 10:08:07', '2021-12-22 09:54:06', NULL, 'Aktif'),
(6, 'kompas', 7, '2021-12-20 10:08:07', '2021-12-22 10:09:17', NULL, 'Aktif'),
(7, 'Deepublish', 1, '2021-12-20 10:08:49', '2021-12-21 00:31:27', NULL, 'Aktif'),
(8, 'Circa', 3, '2021-12-20 10:08:49', '2021-12-22 20:20:30', NULL, 'Aktif'),
(9, 'Pastel Books', 1, '2021-12-21 18:29:09', '2021-12-22 07:49:07', NULL, 'Aktif'),
(10, 'Lentera Dipantara', 0, '2021-12-21 19:11:14', NULL, NULL, 'Aktif'),
(11, 'Kepustakaan Populer Gramedia', 0, '2021-12-22 00:42:07', NULL, NULL, 'Aktif'),
(12, 'Truedee Books', 0, '2021-12-22 07:12:33', NULL, NULL, 'Aktif'),
(13, 'Matahari ', 0, '2021-12-22 09:00:39', NULL, NULL, 'Aktif'),
(14, 'Bulan', 0, '2021-12-22 09:34:47', NULL, NULL, 'Aktif');

--
-- Triggers `tb_penerbit`
--
DELIMITER $$
CREATE TRIGGER `tr_penerbit_dibuat` BEFORE INSERT ON `tb_penerbit` FOR EACH ROW BEGIN
set new.dibuat = NOW();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_penerbit_diubah` BEFORE UPDATE ON `tb_penerbit` FOR EACH ROW BEGIN
set new.diubah = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_penulis`
--

CREATE TABLE `tb_penulis` (
  `id_penulis` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jenis_kelamin` enum('Laki-Laki','Perempuan') NOT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `dibuat` datetime DEFAULT NULL,
  `diubah` datetime DEFAULT NULL,
  `dihapus` datetime DEFAULT NULL,
  `status_data` enum('Aktif','Tidak Aktif') DEFAULT 'Aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_penulis`
--

INSERT INTO `tb_penulis` (`id_penulis`, `nama`, `jenis_kelamin`, `tanggal_lahir`, `dibuat`, `diubah`, `dihapus`, `status_data`) VALUES
(1, 'Eka Kurniawan', 'Laki-Laki', '1975-11-28', '2021-12-20 10:12:56', NULL, NULL, 'Aktif'),
(2, 'Tere Liye', 'Laki-Laki', '1979-05-21', '2021-12-20 10:12:56', NULL, NULL, 'Aktif'),
(3, 'Andrea Hirata', 'Laki-Laki', '1967-10-24', '2021-12-20 10:20:54', NULL, NULL, 'Aktif'),
(4, 'Mark Manson', 'Laki-Laki', '1984-03-09', '2021-12-20 10:20:54', NULL, NULL, 'Aktif'),
(5, 'Alberthiene Endah', 'Perempuan', '1970-09-16', '2021-12-20 10:20:54', '2021-12-20 10:21:18', NULL, 'Aktif'),
(6, 'Zaid Romegar Mair', 'Laki-Laki', '1986-02-13', '2021-12-20 10:24:20', NULL, NULL, 'Aktif'),
(7, 'Albert Einstein', 'Laki-Laki', '1879-03-14', '2021-12-20 10:26:28', NULL, NULL, 'Aktif'),
(8, 'Tjahja Gunawan Diredja', 'Laki-Laki', '1966-03-08', '2021-12-20 10:26:28', NULL, NULL, 'Aktif'),
(9, 'Chairul Tanjung', 'Laki-Laki', '1962-06-16', '2021-12-20 10:26:28', '2021-12-20 10:26:41', NULL, 'Aktif'),
(10, 'Hendrick Tanuwidjaja', 'Laki-Laki', NULL, '2021-12-21 16:53:17', NULL, NULL, 'Aktif'),
(11, 'Henry Manampiring', 'Laki-Laki', NULL, '2021-12-21 16:53:17', NULL, NULL, 'Aktif'),
(12, 'Pramoedya Ananta Toer', 'Laki-Laki', '1965-02-06', '2021-12-21 19:12:23', '2021-12-21 19:12:43', NULL, 'Aktif'),
(13, 'Pidi Baiq', 'Laki-Laki', '1972-08-08', '2021-12-21 18:30:36', '2021-12-21 19:12:53', NULL, 'Aktif'),
(14, 'Petrus Kanisius Ojong', 'Laki-Laki', '1920-07-25', '2021-12-21 18:11:35', NULL, NULL, 'Aktif'),
(15, 'Ayu Utami', 'Perempuan', '1968-11-21', '2021-12-22 00:41:36', NULL, NULL, 'Aktif'),
(16, 'Dewi Lestari', 'Perempuan', '1976-01-20', '2021-12-22 07:13:28', NULL, NULL, 'Aktif'),
(17, 'RH Sianipar', 'Laki-Laki', '2002-09-12', '2021-12-22 09:01:51', NULL, NULL, 'Aktif'),
(18, 'Chilidsh Gambino', 'Laki-Laki', '1978-02-18', '2021-12-22 09:33:35', NULL, NULL, 'Aktif');

--
-- Triggers `tb_penulis`
--
DELIMITER $$
CREATE TRIGGER `tr_penulis_dibuat` BEFORE INSERT ON `tb_penulis` FOR EACH ROW BEGIN
set new.dibuat = NOW();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_penulis_diubah` BEFORE UPDATE ON `tb_penulis` FOR EACH ROW BEGIN
set new.diubah = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `dibuat` datetime DEFAULT NULL,
  `diubah` datetime DEFAULT NULL,
  `dihapus` datetime DEFAULT NULL,
  `status_data` enum('Aktif','Tidak Aktif') DEFAULT 'Aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `username`, `password`, `dibuat`, `diubah`, `dihapus`, `status_data`) VALUES
(1, 'manager', '123456', '2021-12-19 14:00:50', '2021-12-21 20:50:34', NULL, 'Aktif'),
(2, 'pegawai1', 'qwerty', '2021-12-19 14:00:50', '2021-12-21 20:50:42', NULL, 'Aktif'),
(3, 'pegawai2', 'drovak', '2021-12-19 17:21:40', '2021-12-21 20:50:52', NULL, 'Aktif');

--
-- Triggers `tb_user`
--
DELIMITER $$
CREATE TRIGGER `tr_user_dibuat` BEFORE INSERT ON `tb_user` FOR EACH ROW BEGIN
set new.dibuat = NOW();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_user_diubah` BEFORE UPDATE ON `tb_user` FOR EACH ROW BEGIN
set new.diubah = NOW();
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_buku`
--
ALTER TABLE `tb_buku`
  ADD PRIMARY KEY (`id_buku`),
  ADD KEY `id_penerbit` (`id_penerbit`);

--
-- Indexes for table `tb_denda`
--
ALTER TABLE `tb_denda`
  ADD PRIMARY KEY (`id_denda`),
  ADD KEY `id_peminjaman` (`id_peminjaman`);

--
-- Indexes for table `tb_kepengarangan`
--
ALTER TABLE `tb_kepengarangan`
  ADD PRIMARY KEY (`id_buku`,`id_penulis`),
  ADD KEY `id_penulis` (`id_penulis`);

--
-- Indexes for table `tb_log_login_logout`
--
ALTER TABLE `tb_log_login_logout`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  ADD PRIMARY KEY (`id_pegawai`),
  ADD UNIQUE KEY `NIK` (`NIK`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `tb_peminjam`
--
ALTER TABLE `tb_peminjam`
  ADD PRIMARY KEY (`id_member`),
  ADD UNIQUE KEY `NIK` (`NIK`);

--
-- Indexes for table `tb_peminjaman`
--
ALTER TABLE `tb_peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `id_member` (`id_member`),
  ADD KEY `id_buku` (`id_buku`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `tb_penerbit`
--
ALTER TABLE `tb_penerbit`
  ADD PRIMARY KEY (`id_penerbit`);

--
-- Indexes for table `tb_penulis`
--
ALTER TABLE `tb_penulis`
  ADD PRIMARY KEY (`id_penulis`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_buku`
--
ALTER TABLE `tb_buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tb_denda`
--
ALTER TABLE `tb_denda`
  MODIFY `id_denda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_log_login_logout`
--
ALTER TABLE `tb_log_login_logout`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  MODIFY `id_pegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_peminjam`
--
ALTER TABLE `tb_peminjam`
  MODIFY `id_member` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tb_peminjaman`
--
ALTER TABLE `tb_peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tb_penerbit`
--
ALTER TABLE `tb_penerbit`
  MODIFY `id_penerbit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tb_penulis`
--
ALTER TABLE `tb_penulis`
  MODIFY `id_penulis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_buku`
--
ALTER TABLE `tb_buku`
  ADD CONSTRAINT `tb_buku_ibfk_1` FOREIGN KEY (`id_penerbit`) REFERENCES `tb_penerbit` (`id_penerbit`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_denda`
--
ALTER TABLE `tb_denda`
  ADD CONSTRAINT `tb_denda_ibfk_1` FOREIGN KEY (`id_peminjaman`) REFERENCES `tb_peminjaman` (`id_peminjaman`);

--
-- Constraints for table `tb_kepengarangan`
--
ALTER TABLE `tb_kepengarangan`
  ADD CONSTRAINT `tb_kepengarangan_ibfk_1` FOREIGN KEY (`id_buku`) REFERENCES `tb_buku` (`id_buku`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_kepengarangan_ibfk_2` FOREIGN KEY (`id_penulis`) REFERENCES `tb_penulis` (`id_penulis`) ON UPDATE CASCADE;

--
-- Constraints for table `tb_log_login_logout`
--
ALTER TABLE `tb_log_login_logout`
  ADD CONSTRAINT `tb_log_login_logout_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `tb_pegawai` (`id_pegawai`);

--
-- Constraints for table `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  ADD CONSTRAINT `foreign key` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_peminjaman`
--
ALTER TABLE `tb_peminjaman`
  ADD CONSTRAINT `tb_peminjaman_ibfk_1` FOREIGN KEY (`id_member`) REFERENCES `tb_peminjam` (`id_member`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_peminjaman_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `tb_buku` (`id_buku`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_peminjaman_ibfk_3` FOREIGN KEY (`id_pegawai`) REFERENCES `tb_pegawai` (`id_pegawai`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
