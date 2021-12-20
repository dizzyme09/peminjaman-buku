-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2021 at 06:58 AM
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
(1, 'Cantik Itu Luka', 'Fiksi', 1, 2006, 17, '2021-12-20 10:28:21', NULL, NULL, 'Aktif'),
(2, 'Rindu', 'Fiksi', 2, 2014, 28, '2021-12-20 10:28:21', NULL, NULL, 'Aktif'),
(3, 'Ayah', 'Fiksi', 3, 2015, 4, '2021-12-20 10:30:46', NULL, NULL, 'Aktif'),
(4, 'Sebuah Seni Untuk Bersikap Bodo Amat', 'Non Fiksi', 5, 2016, 7, '2021-12-20 10:30:46', NULL, NULL, 'Aktif'),
(5, 'Mimpi sejuta dollar', 'Fiksi', 1, 2011, 11, '2021-12-20 10:31:49', NULL, NULL, 'Aktif'),
(6, 'Sistem Operasi', 'Non Fiksi', 7, 2018, 18, '2021-12-20 10:31:49', NULL, NULL, 'Aktif'),
(7, 'Sains dan Agama', 'Non Fiksi', 8, 2020, 8, '2021-12-20 10:32:33', NULL, NULL, 'Aktif'),
(8, 'Chairul Tanjung Si Anak Singkong', 'Non Fiksi', 6, 2012, 28, '2021-12-20 10:32:33', NULL, NULL, 'Aktif');

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
(8, 9, '2021-12-20 10:35:09', '2021-12-20 10:35:17', NULL, 'Aktif');

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
(1, 1, 'surti_menangis telah login', 'Login', '2021-12-19 20:27:50', '2021-12-19 20:27:50', NULL, NULL, 'Aktif'),
(2, 1, 'surti_menangis telah logout', 'Logout', '2021-12-19 20:37:55', '2021-12-19 20:37:55', NULL, NULL, 'Aktif'),
(3, 1, 'surti_menangis telah login', 'Login', '2021-12-19 22:45:25', '2021-12-19 22:45:25', NULL, NULL, 'Aktif'),
(4, 2, 'anjayri telah login', 'Login', '2021-12-20 09:01:24', '2021-12-20 09:01:24', NULL, NULL, 'Aktif'),
(5, 2, 'anjayri telah logout', 'Logout', '2021-12-20 09:01:34', '2021-12-20 09:01:34', NULL, NULL, 'Aktif'),
(6, 2, 'anjayri telah login', 'Login', '2021-12-20 09:04:14', '2021-12-20 09:04:14', NULL, NULL, 'Aktif'),
(7, 2, 'anjayri telah login', 'Login', '2021-12-20 12:01:43', '2021-12-20 12:01:43', NULL, NULL, 'Aktif'),
(8, 2, 'anjayri telah logout', 'Logout', '2021-12-20 12:05:23', '2021-12-20 12:05:23', NULL, NULL, 'Aktif'),
(9, 2, 'anjayri telah login', 'Login', '2021-12-20 12:05:43', '2021-12-20 12:05:43', NULL, NULL, 'Aktif'),
(10, 2, 'anjayri telah logout', 'Logout', '2021-12-20 12:05:45', '2021-12-20 12:05:45', NULL, NULL, 'Aktif'),
(11, 1, 'surti_menangis telah login', 'Login', '2021-12-20 12:06:14', '2021-12-20 12:06:14', NULL, NULL, 'Aktif'),
(12, 1, 'surti_menangis telah logout', 'Logout', '2021-12-20 12:08:30', '2021-12-20 12:08:30', NULL, NULL, 'Aktif'),
(13, 2, 'anjayri telah login', 'Login', '2021-12-20 12:08:53', '2021-12-20 12:08:53', NULL, NULL, 'Aktif'),
(14, 2, 'anjayri telah logout', 'Logout', '2021-12-20 12:22:43', '2021-12-20 12:22:43', NULL, NULL, 'Aktif'),
(15, 1, 'surti_menangis telah login', 'Login', '2021-12-20 12:25:20', '2021-12-20 12:25:20', NULL, NULL, 'Aktif'),
(16, 1, 'surti_menangis telah logout', 'Logout', '2021-12-20 12:41:41', '2021-12-20 12:41:41', NULL, NULL, 'Aktif'),
(17, 2, 'anjayri telah login', 'Login', '2021-12-20 12:41:49', '2021-12-20 12:41:49', NULL, NULL, 'Aktif'),
(18, 2, 'anjayri telah logout', 'Logout', '2021-12-20 12:42:04', '2021-12-20 12:42:04', NULL, NULL, 'Aktif'),
(19, 1, 'surti_menangis telah login', 'Login', '2021-12-20 12:42:16', '2021-12-20 12:42:16', NULL, NULL, 'Aktif'),
(20, 1, 'surti_menangis telah logout', 'Logout', '2021-12-20 12:43:54', '2021-12-20 12:43:54', NULL, NULL, 'Aktif'),
(21, 1, 'surti_menangis telah login', 'Login', '2021-12-20 12:48:40', '2021-12-20 12:48:40', NULL, NULL, 'Aktif'),
(22, 1, 'surti_menangis telah logout', 'Logout', '2021-12-20 12:48:43', '2021-12-20 12:48:43', NULL, NULL, 'Aktif'),
(23, 2, 'anjayri telah login', 'Login', '2021-12-20 12:49:02', '2021-12-20 12:49:02', NULL, NULL, 'Aktif'),
(24, 2, 'anjayri telah logout', 'Logout', '2021-12-20 12:49:04', '2021-12-20 12:49:04', NULL, NULL, 'Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pegawai`
--

CREATE TABLE `tb_pegawai` (
  `id_pegawai` int(11) NOT NULL,
  `NIK` varchar(255) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `nama` varchar(255) NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `tempat_lahir` varchar(255) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `no_telp` varchar(255) NOT NULL,
  `dibuat` datetime DEFAULT NULL,
  `diubah` datetime DEFAULT NULL,
  `dihapus` datetime DEFAULT NULL,
  `status_data` enum('Aktif','Tidak Aktif') DEFAULT 'Aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_pegawai`
--

INSERT INTO `tb_pegawai` (`id_pegawai`, `NIK`, `id_user`, `nama`, `jabatan`, `tempat_lahir`, `tanggal_lahir`, `no_telp`, `dibuat`, `diubah`, `dihapus`, `status_data`) VALUES
(1, '3911222902804324', 1, 'Surti Kades', 'Manager', 'Cikarang', '1980-04-12', '081380806556', '2021-12-19 14:18:35', '2021-12-19 19:44:42', NULL, 'Aktif'),
(2, '2001297892600134', 2, 'Anjari Sandoro', 'Pegawai', 'Bandung', '1999-03-25', '081390312256', '2021-12-19 14:19:52', '2021-12-19 19:44:51', NULL, 'Aktif'),
(3, '3451890880654344', 3, 'Mega Mendung', 'Pegawai', 'Jakarta', '1995-11-10', '081310099196', '2021-12-19 14:19:52', '2021-12-19 19:45:01', NULL, 'Aktif');

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
  `tempat_lahir` varchar(255) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `no_telp` varchar(255) NOT NULL,
  `dibuat` datetime DEFAULT NULL,
  `diubah` datetime DEFAULT NULL,
  `dihapus` datetime DEFAULT NULL,
  `status_data` enum('Aktif','Tidak Aktif') DEFAULT 'Aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_peminjam`
--

INSERT INTO `tb_peminjam` (`NIK`, `id_member`, `nama`, `tempat_lahir`, `tanggal_lahir`, `no_telp`, `dibuat`, `diubah`, `dihapus`, `status_data`) VALUES
('5371343332650924', 1, 'Aryo Sastro', 'Jakarta', '2002-09-20', '087867122189', '2021-12-19 14:21:21', NULL, NULL, 'Aktif'),
('6365891232638937', 2, 'Kunto Adit', 'Jakarta', '2000-12-03', '087887015751', '2021-12-19 14:21:21', NULL, NULL, 'Aktif');

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
(1, 'Gramedia Pustaka Utama', 0, '2021-12-20 10:06:49', NULL, NULL, 'Aktif'),
(2, 'Republika', 0, '2021-12-20 10:06:49', NULL, NULL, 'Aktif'),
(3, 'Bentang Pustaka', 0, '2021-12-20 10:07:30', NULL, NULL, 'Aktif'),
(4, 'Elex Media Komputindo', 0, '2021-12-20 10:07:30', NULL, NULL, 'Aktif'),
(5, 'Grasindo', 0, '2021-12-20 10:08:07', NULL, NULL, 'Aktif'),
(6, 'kompas', 0, '2021-12-20 10:08:07', NULL, NULL, 'Aktif'),
(7, 'Deepublish', 0, '2021-12-20 10:08:49', NULL, NULL, 'Aktif'),
(8, 'Circa', 0, '2021-12-20 10:08:49', NULL, NULL, 'Aktif');

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
  `tanggal_lahir` date NOT NULL,
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
(9, 'Chairul Tanjung', 'Laki-Laki', '1962-06-16', '2021-12-20 10:26:28', '2021-12-20 10:26:41', NULL, 'Aktif');

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
(1, 'surti_menangis', '123456', '2021-12-19 14:00:50', '2021-12-19 17:20:43', NULL, 'Aktif'),
(2, 'anjayri', 'qwerty', '2021-12-19 14:00:50', '2021-12-19 17:21:08', NULL, 'Aktif'),
(3, 'langitmendung', 'kagasih', '2021-12-19 17:21:40', NULL, NULL, 'Aktif');

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
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_denda`
--
ALTER TABLE `tb_denda`
  MODIFY `id_denda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_log_login_logout`
--
ALTER TABLE `tb_log_login_logout`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  MODIFY `id_pegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_peminjam`
--
ALTER TABLE `tb_peminjam`
  MODIFY `id_member` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_peminjaman`
--
ALTER TABLE `tb_peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_penerbit`
--
ALTER TABLE `tb_penerbit`
  MODIFY `id_penerbit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_penulis`
--
ALTER TABLE `tb_penulis`
  MODIFY `id_penulis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
