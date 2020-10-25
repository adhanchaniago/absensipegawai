-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 25, 2020 at 12:42 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bg_pegawai`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi_karyawan`
--

CREATE TABLE `absensi_karyawan` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `absen` int(11) NOT NULL,
  `hadir` int(11) NOT NULL,
  `tidak_hadir` int(11) NOT NULL,
  `izin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `absensi_karyawan`
--

INSERT INTO `absensi_karyawan` (`id`, `nama`, `absen`, `hadir`, `tidak_hadir`, `izin`) VALUES
(1, 'Muhammad Julfansa', 1, 1, 0, 1),
(2, 'Robby Takdirillah', 1, 1, 0, 1),
(3, 'Ilham Mantiqi', 0, 0, 1, 1),
(4, 'Larasati Hartawan', 0, 0, 2, 0),
(5, 'Desta Riany', 1, 1, 0, 0),
(6, 'Euis Gumelis', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `absen_karyawan`
--

CREATE TABLE `absen_karyawan` (
  `id` int(11) NOT NULL,
  `id_karyawan` int(11) NOT NULL,
  `jam_masuk` time NOT NULL,
  `jam_keluar` time DEFAULT NULL,
  `tanggal` date NOT NULL,
  `terlambat` int(11) DEFAULT NULL,
  `lembur` int(11) DEFAULT NULL,
  `jam_kerja` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `absen_karyawan`
--

INSERT INTO `absen_karyawan` (`id`, `id_karyawan`, `jam_masuk`, `jam_keluar`, `tanggal`, `terlambat`, `lembur`, `jam_kerja`) VALUES
(15, 6, '08:00:08', '18:00:32', '2020-09-08', 0, 1, 8),
(16, 6, '09:00:00', '22:00:00', '2020-09-19', NULL, NULL, 8),
(17, 6, '09:00:00', '22:00:00', '2020-08-18', NULL, NULL, 8),
(18, 6, '09:59:47', NULL, '2020-09-21', 2, NULL, NULL),
(19, 6, '12:24:05', NULL, '2020-10-03', 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `alasan_karyawan`
--

CREATE TABLE `alasan_karyawan` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alasan` varchar(255) NOT NULL,
  `tanggal` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alasan_karyawan`
--

INSERT INTO `alasan_karyawan` (`id`, `nama`, `alasan`, `tanggal`) VALUES
(1, 'Muhammad Julfansa', 'Izin cuti mengikuti seminar di jakarta.', '08/04/2019'),
(2, 'Ilham Mantiqi', 'Medical Check Up', '15/09/2019'),
(3, 'Larasati Hartawan', 'Holiday', '15/09/2019'),
(4, 'Ilham Mantiqi', 'Sakit', '15/09/2019'),
(5, 'Robby Takdirillah', 'sakit', '21/10/2019');

-- --------------------------------------------------------

--
-- Table structure for table `data_karyawan`
--

CREATE TABLE `data_karyawan` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `start_date` varchar(255) NOT NULL,
  `salary` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `handphone` varchar(255) NOT NULL,
  `nik` varchar(255) NOT NULL,
  `tentang` varchar(255) NOT NULL,
  `image_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_karyawan`
--

INSERT INTO `data_karyawan` (`id`, `name`, `position`, `age`, `start_date`, `salary`, `email`, `handphone`, `nik`, `tentang`, `image_name`) VALUES
(2, 'Robby Takdirillah', 'Analys Credit', 21, '03/12/2013', 9000000, 'robbytakdirillah@gmail.com', '85210245370', '1630511087', 'Karyawan Terbaik', '5.jpg'),
(3, 'Ilham Mantiqi', 'Marketing', 26, '12/01/2012', 6000000, 'ilham.m@yahoo.com', '85210254318', '1630511090', 'Marketing', '2.jpg'),
(4, 'Larasati Hartawan', 'Costumer Service', 22, '09/09/2016', 7400000, 'yayas.h@gmail.com', '85623421109', '1630510999', 'CS', '4.jpg'),
(5, 'Desta Riany', 'Head Recruitment', 21, '02/12/1997', 6700000, 'destar@outlook.com', '087899921102', '1630511088', 'HR', '3.jpg'),
(6, 'Euis Gumelis', 'Purchasing Staff', 18, '12/05/2018', 4500000, 'euis.ss@gmail.com', '08921123871', '1630511000', 'Pegawai', '68716523_2339633979686519_1692806943491133910_n.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `history_karyawan`
--

CREATE TABLE `history_karyawan` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `info` varchar(255) NOT NULL,
  `tanggal` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history_karyawan`
--

INSERT INTO `history_karyawan` (`id`, `nama`, `info`, `tanggal`) VALUES
(1, 'Admin', 'Admin telah melakukan login', '08/04/2019 11:03:54'),
(2, 'Admin', 'Admin telah melakukan login', '08/04/2019 11:04:22'),
(3, 'Muhammad Julfansa', 'Muhammad Julfansa Telah melakukan login', '08/04/2019 11:07:42'),
(4, 'Muhammad Julfansa', 'Muhammad Julfansa telah melakukan absen', '08/04/2019 11:08:05'),
(5, 'Muhammad Julfansa', 'Muhammad Julfansa Telah melakukan login', '08/04/2019 11:08:05'),
(6, 'Muhammad Julfansa', 'Muhammad Julfansa Telah melakukan login', '08/04/2019 11:08:29'),
(7, 'Admin', 'Admin telah melakukan login', '08/04/2019 11:08:43'),
(8, 'Muhammad Julfansa', 'Muhammad Julfansa Telah melakukan login', '08/04/2019 11:09:28'),
(9, 'Admin', 'Admin telah melakukan login', '15/09/2019 11:54:33'),
(10, 'Admin', 'Admin telah melakukan login', '15/09/2019 11:54:50'),
(11, 'Admin', 'Admin telah melakukan login', '15/09/2019 11:58:53'),
(12, 'Robby Takdirillah', 'Robby Takdirillah Telah melakukan login', '15/09/2019 11:59:09'),
(13, 'Robby Takdirillah', 'Robby Takdirillah Telah melakukan login', '15/09/2019 11:59:18'),
(14, 'Robby Takdirillah', 'Robby Takdirillah telah melakukan absen', '15/09/2019 11:59:25'),
(15, 'Robby Takdirillah', 'Robby Takdirillah Telah melakukan login', '15/09/2019 11:59:26'),
(16, 'Robby Takdirillah', 'Robby Takdirillah Telah melakukan login', '15/09/2019 11:59:44'),
(17, 'Robby Takdirillah', 'Robby Takdirillah Telah melakukan login', '15/09/2019 11:59:45'),
(18, 'Robby Takdirillah', 'Robby Takdirillah Telah melakukan login', '15/09/2019 11:59:46'),
(19, 'Robby Takdirillah', 'Robby Takdirillah Telah melakukan login', '15/09/2019 11:59:49'),
(20, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:00:30'),
(21, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:00:34'),
(22, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:18:47'),
(23, 'Desta Riany', 'Desta Riany Telah melakukan login', '15/09/2019 12:19:08'),
(24, 'Desta Riany', 'Desta Riany telah melakukan absen', '15/09/2019 12:19:12'),
(25, 'Desta Riany', 'Desta Riany Telah melakukan login', '15/09/2019 12:19:13'),
(26, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:19:47'),
(27, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:21:46'),
(28, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:23:18'),
(29, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:27:16'),
(30, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:27:54'),
(31, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:28:25'),
(32, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:28:43'),
(33, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:28:54'),
(34, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:29:17'),
(35, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:29:22'),
(36, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:29:49'),
(37, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:30:46'),
(38, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:31:03'),
(39, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:31:35'),
(40, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:32:24'),
(41, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:33:02'),
(42, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:33:16'),
(43, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:33:50'),
(44, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:34:03'),
(45, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:34:22'),
(46, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:34:39'),
(47, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:34:51'),
(48, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:35:47'),
(49, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:36:11'),
(50, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:36:27'),
(51, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:36:43'),
(52, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:37:00'),
(53, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:37:12'),
(54, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:37:29'),
(55, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:37:37'),
(56, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:38:03'),
(57, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:39:40'),
(58, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:39:49'),
(59, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:40:58'),
(60, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:41:57'),
(61, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:43:38'),
(62, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:45:00'),
(63, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:45:36'),
(64, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:45:52'),
(65, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:50:53'),
(66, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:56:20'),
(67, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:57:02'),
(68, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:57:44'),
(69, 'Admin', 'Admin telah melakukan login', '15/09/2019 12:57:54'),
(70, 'Admin', 'Admin telah melakukan login', '15/09/2019 18:19:55'),
(71, 'Admin', 'Admin telah melakukan login', '15/09/2019 21:03:04'),
(72, 'Admin', 'Admin telah melakukan login', '15/09/2019 21:04:17'),
(73, 'Admin', 'Admin telah melakukan login', '15/09/2019 21:04:41'),
(74, 'Admin', 'Admin telah melakukan login', '15/09/2019 21:04:57'),
(75, 'Admin', 'Admin telah melakukan login', '15/09/2019 21:06:04'),
(76, 'Admin', 'Admin telah melakukan login', '15/09/2019 21:06:50'),
(77, 'Admin', 'Admin telah melakukan login', '15/09/2019 21:07:13'),
(78, 'Admin', 'Admin telah melakukan login', '15/09/2019 21:08:12'),
(79, 'Admin', 'Admin telah melakukan login', '15/09/2019 21:08:50'),
(80, 'Admin', 'Admin telah melakukan login', '15/09/2019 21:09:29'),
(81, 'Admin', 'Admin telah melakukan login', '15/09/2019 21:09:57'),
(82, 'Admin', 'Admin telah melakukan login', '21/10/2019 19:38:08'),
(83, 'Admin', 'Admin telah melakukan login', '21/10/2019 19:38:27'),
(84, 'Admin', 'Admin telah melakukan login', '21/10/2019 19:39:19'),
(85, 'Admin', 'Admin telah melakukan login', '21/10/2019 19:41:39'),
(86, 'Admin', 'Admin telah melakukan login', '21/10/2019 19:42:19'),
(87, 'Admin', 'Admin telah melakukan login', '21/10/2019 19:42:47'),
(88, 'Admin', 'Admin telah melakukan login', '21/10/2019 19:43:04'),
(89, 'Admin', 'Admin telah melakukan login', '21/10/2019 19:43:14'),
(90, 'Admin', 'Admin telah melakukan login', '21/10/2019 19:43:38'),
(91, 'Admin', 'Admin telah melakukan login', '21/10/2019 19:44:02'),
(92, 'Admin', 'Admin telah melakukan login', '21/10/2019 19:44:15'),
(93, 'Admin', 'Admin telah melakukan login', '21/10/2019 19:44:25'),
(94, 'Admin', 'Admin telah melakukan login', '21/10/2019 19:45:54'),
(95, 'Admin', 'Admin telah melakukan login', '21/10/2019 19:46:04'),
(96, 'Admin', 'Admin telah melakukan login', '21/10/2019 19:46:26'),
(97, 'Admin', 'Admin telah melakukan login', '21/10/2019 19:46:43'),
(98, 'Admin', 'Admin telah melakukan login', '21/10/2019 19:47:18'),
(99, 'Admin', 'Admin telah melakukan login', '21/10/2019 19:47:32'),
(100, 'Admin', 'Admin telah melakukan login', '21/10/2019 19:48:38'),
(101, 'Admin', 'Admin telah melakukan login', '21/10/2019 19:49:52'),
(102, 'Admin', 'Admin telah melakukan login', '21/10/2019 19:50:11'),
(103, 'Admin', 'Admin telah melakukan login', '21/10/2019 19:50:30'),
(104, 'Admin', 'Admin telah melakukan login', '21/10/2019 19:51:09'),
(105, 'Admin', 'Admin telah melakukan login', '21/10/2019 19:51:38'),
(106, 'Admin', 'Admin telah melakukan login', '21/10/2019 19:53:37'),
(107, 'Admin', 'Admin telah melakukan login', '21/10/2019 19:55:16'),
(108, 'Admin', 'Admin telah melakukan login', '21/10/2019 19:55:50'),
(109, 'Admin', 'Admin telah melakukan login', '21/10/2019 19:57:28'),
(110, 'Admin', 'Admin telah melakukan login', '21/10/2019 19:57:40'),
(111, 'Admin', 'Admin telah melakukan login', '21/10/2019 19:57:42'),
(112, 'Admin', 'Admin telah melakukan login', '21/10/2019 19:57:47'),
(113, 'Admin', 'Admin telah melakukan login', '21/10/2019 19:58:10'),
(114, 'Admin', 'Admin telah melakukan login', '21/10/2019 19:59:03'),
(115, 'Admin', 'Admin telah melakukan login', '21/10/2019 19:59:22'),
(116, 'Admin', 'Admin telah melakukan login', '21/10/2019 19:59:38'),
(117, 'Admin', 'Admin telah melakukan login', '21/10/2019 19:59:58'),
(118, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:00:51'),
(119, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:01:22'),
(120, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:02:30'),
(121, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:03:07'),
(122, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:03:29'),
(123, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:03:50'),
(124, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:04:32'),
(125, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:04:58'),
(126, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:05:14'),
(127, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:05:16'),
(128, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:05:17'),
(129, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:05:20'),
(130, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:05:24'),
(131, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:05:26'),
(132, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:05:57'),
(133, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:06:53'),
(134, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:07:41'),
(135, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:08:24'),
(136, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:08:47'),
(137, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:08:50'),
(138, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:09:14'),
(139, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:09:15'),
(140, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:09:22'),
(141, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:09:57'),
(142, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:10:10'),
(143, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:10:22'),
(144, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:10:33'),
(145, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:10:49'),
(146, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:11:06'),
(147, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:12:22'),
(148, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:12:26'),
(149, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:12:42'),
(150, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:14:06'),
(151, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:14:19'),
(152, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:15:04'),
(153, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:19:03'),
(154, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:19:27'),
(155, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:20:07'),
(156, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:20:34'),
(157, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:20:38'),
(158, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:21:55'),
(159, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:22:33'),
(160, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:22:55'),
(161, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:23:07'),
(162, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:23:15'),
(163, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:23:23'),
(164, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:23:30'),
(165, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:31:17'),
(166, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:54:15'),
(167, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:55:03'),
(168, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:57:11'),
(169, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:58:00'),
(170, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:58:47'),
(171, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:59:14'),
(172, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:59:17'),
(173, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:59:22'),
(174, 'Admin', 'Admin telah melakukan login', '21/10/2019 20:59:39'),
(175, 'Admin', 'Admin telah melakukan login', '21/10/2019 21:04:33'),
(176, 'Admin', 'Admin telah melakukan login', '21/10/2019 21:04:41'),
(177, 'Admin', 'Admin telah melakukan login', '21/10/2019 21:06:55'),
(178, 'Robby Takdirillah', 'Robby Takdirillah Telah melakukan login', '21/10/2019 21:10:53'),
(179, 'Robby Takdirillah', 'Robby Takdirillah Telah melakukan login', '21/10/2019 21:11:05'),
(180, 'Robby Takdirillah', 'Robby Takdirillah Telah melakukan login', '21/10/2019 21:11:11'),
(181, 'Robby Takdirillah', 'Robby Takdirillah Telah melakukan login', '21/10/2019 21:11:17'),
(182, 'Robby Takdirillah', 'Robby Takdirillah Telah melakukan login', '21/10/2019 21:13:59'),
(183, 'Robby Takdirillah', 'Robby Takdirillah Telah melakukan login', '21/10/2019 21:14:23'),
(184, 'Robby Takdirillah', 'Robby Takdirillah Telah melakukan login', '21/10/2019 21:14:34'),
(185, 'Robby Takdirillah', 'Robby Takdirillah Telah melakukan login', '21/10/2019 21:14:51'),
(186, 'Robby Takdirillah', 'Robby Takdirillah Telah melakukan login', '21/10/2019 21:15:21'),
(187, 'Robby Takdirillah', 'Robby Takdirillah Telah melakukan login', '21/10/2019 21:15:43'),
(188, 'Robby Takdirillah', 'Robby Takdirillah Telah melakukan login', '21/10/2019 21:16:15'),
(189, 'Robby Takdirillah', 'Robby Takdirillah Telah melakukan login', '21/10/2019 21:16:46'),
(190, 'Robby Takdirillah', 'Robby Takdirillah Telah melakukan login', '21/10/2019 21:17:05'),
(191, 'Robby Takdirillah', 'Robby Takdirillah Telah melakukan login', '21/10/2019 21:17:39'),
(192, 'Robby Takdirillah', 'Robby Takdirillah Telah melakukan login', '21/10/2019 21:18:05'),
(193, 'Robby Takdirillah', 'Robby Takdirillah Telah melakukan login', '21/10/2019 21:18:17'),
(194, 'Robby Takdirillah', 'Robby Takdirillah Telah melakukan login', '21/10/2019 21:18:36'),
(195, 'Robby Takdirillah', 'Robby Takdirillah Telah melakukan login', '21/10/2019 21:18:46'),
(196, 'Robby Takdirillah', 'Robby Takdirillah Telah melakukan login', '21/10/2019 21:18:59'),
(197, 'Robby Takdirillah', 'Robby Takdirillah Telah melakukan login', '21/10/2019 21:19:19'),
(198, 'Robby Takdirillah', 'Robby Takdirillah Telah melakukan login', '21/10/2019 21:19:28'),
(199, 'Robby Takdirillah', 'Robby Takdirillah Telah melakukan login', '21/10/2019 21:19:51'),
(200, 'Robby Takdirillah', 'Robby Takdirillah Telah melakukan login', '21/10/2019 21:20:21'),
(201, 'Admin', 'Admin telah melakukan login', '21/10/2019 21:21:38'),
(202, 'Admin', 'Admin telah melakukan login', '21/10/2019 21:22:21'),
(203, 'Admin', 'Admin telah melakukan login', '21/10/2019 21:22:29'),
(204, 'Robby Takdirillah', 'Robby Takdirillah Telah melakukan login', '21/10/2019 21:22:43'),
(205, 'Admin', 'Admin telah melakukan login', '21/10/2019 21:23:03'),
(206, 'Admin', 'Admin telah melakukan login', '21/10/2019 21:23:08'),
(207, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '21/10/2019 21:30:11'),
(208, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 10:23:39'),
(209, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 10:23:52'),
(210, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 10:25:57'),
(211, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 11:19:57'),
(212, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 11:21:10'),
(213, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 11:22:22'),
(214, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 11:22:24'),
(215, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 13:55:53'),
(216, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 13:55:55'),
(217, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 13:56:11'),
(218, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 13:58:35'),
(219, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 13:58:43'),
(220, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 13:59:57'),
(221, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 14:00:10'),
(222, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 14:01:33'),
(223, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 14:01:35'),
(224, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 14:08:01'),
(225, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 14:08:03'),
(226, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 14:09:53'),
(227, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 14:10:00'),
(228, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 14:10:02'),
(229, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 14:10:06'),
(230, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 14:11:07'),
(231, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 14:11:09'),
(232, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 14:16:00'),
(233, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 14:16:04'),
(234, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 14:16:06'),
(235, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 14:19:47'),
(236, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 07:20:05'),
(237, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 07:43:49'),
(238, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 07:50:51'),
(239, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 07:50:53'),
(240, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 07:51:10'),
(241, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 07:51:40'),
(242, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 07:52:51'),
(243, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 07:52:53'),
(244, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 07:54:09'),
(245, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 07:54:12'),
(246, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 07:55:24'),
(247, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 07:55:26'),
(248, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 07:57:42'),
(249, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 08:04:55'),
(250, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 08:04:58'),
(251, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 08:08:01'),
(252, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 08:27:49'),
(253, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 08:27:51'),
(254, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 08:27:53'),
(255, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 08:29:22'),
(256, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 08:29:35'),
(257, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 08:29:37'),
(258, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 08:29:40'),
(259, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 08:30:09'),
(260, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 08:35:14'),
(261, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 08:36:27'),
(262, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 08:36:30'),
(263, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 08:37:30'),
(264, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 08:38:19'),
(265, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 18:39:37'),
(266, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 21:08:42'),
(267, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 18:34:30'),
(268, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 18:35:03'),
(269, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 18:35:06'),
(270, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 18:35:09'),
(271, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 18:35:24'),
(272, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 18:37:22'),
(273, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 08:00:09'),
(274, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '20/09/2020 18:00:33'),
(275, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '21/09/2020 09:03:52'),
(276, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '21/09/2020 09:05:59'),
(277, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '21/09/2020 09:06:01'),
(278, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '21/09/2020 09:06:41'),
(279, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '21/09/2020 09:06:44'),
(280, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '21/09/2020 09:07:16'),
(281, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '21/09/2020 09:57:21'),
(282, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '21/09/2020 09:57:29'),
(283, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '21/09/2020 09:58:39'),
(284, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '21/09/2020 09:59:21'),
(285, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '21/09/2020 09:59:47'),
(286, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '21/09/2020 10:02:52'),
(287, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '21/09/2020 10:15:40'),
(288, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '21/09/2020 10:42:02'),
(289, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '25/09/2020 14:21:43'),
(290, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '25/09/2020 14:21:53'),
(291, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '03/10/2020 12:23:26'),
(292, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '03/10/2020 12:23:44'),
(293, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '03/10/2020 12:24:05'),
(294, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '03/10/2020 12:25:55'),
(295, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '03/10/2020 12:26:14'),
(296, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '03/10/2020 12:27:02'),
(297, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '03/10/2020 12:28:21'),
(298, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '03/10/2020 13:06:03'),
(299, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '03/10/2020 13:11:52'),
(300, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '03/10/2020 13:15:14'),
(301, 'Euis Gumelis', 'Euis Gumelis Telah melakukan login', '03/10/2020 13:33:48');

-- --------------------------------------------------------

--
-- Table structure for table `rfid_karyawan`
--

CREATE TABLE `rfid_karyawan` (
  `id` int(11) NOT NULL,
  `kode_rfid` varchar(50) NOT NULL,
  `id_karyawan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rfid_karyawan`
--

INSERT INTO `rfid_karyawan` (`id`, `kode_rfid`, `id_karyawan`) VALUES
(1, '12345', 6),
(2, '23456', 7);

-- --------------------------------------------------------

--
-- Table structure for table `setting_absensi`
--

CREATE TABLE `setting_absensi` (
  `id` int(11) NOT NULL,
  `mulai_absen` varchar(255) NOT NULL,
  `selesai_absen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setting_absensi`
--

INSERT INTO `setting_absensi` (`id`, `mulai_absen`, `selesai_absen`) VALUES
(1, '06:00', '24:00');

-- --------------------------------------------------------

--
-- Table structure for table `users_karyawan`
--

CREATE TABLE `users_karyawan` (
  `id` int(11) NOT NULL,
  `nik` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_karyawan`
--

INSERT INTO `users_karyawan` (`id`, `nik`, `password`, `level`) VALUES
(3, '1630511087', '8d05dd2f03981f86b56c23951f3f34d7', 'Karyawan'),
(4, '1630511090', 'b63d204bf086017e34d8bd27ab969f28', 'Karyawan'),
(5, '1630510999', 'c31dce6ce8cb6b3a9cb1f182a403b902', 'Karyawan'),
(6, '1630511088', 'b2e7247ec64e0f7840538698b5146ab8', 'Karyawan'),
(7, '1630511100', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(8, '1630511000', '047aeeb234644b9e2d4138ed3bc7976a', 'Karyawan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi_karyawan`
--
ALTER TABLE `absensi_karyawan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `absen_karyawan`
--
ALTER TABLE `absen_karyawan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alasan_karyawan`
--
ALTER TABLE `alasan_karyawan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_karyawan`
--
ALTER TABLE `data_karyawan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history_karyawan`
--
ALTER TABLE `history_karyawan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rfid_karyawan`
--
ALTER TABLE `rfid_karyawan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting_absensi`
--
ALTER TABLE `setting_absensi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_karyawan`
--
ALTER TABLE `users_karyawan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensi_karyawan`
--
ALTER TABLE `absensi_karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `absen_karyawan`
--
ALTER TABLE `absen_karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `alasan_karyawan`
--
ALTER TABLE `alasan_karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `data_karyawan`
--
ALTER TABLE `data_karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `history_karyawan`
--
ALTER TABLE `history_karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=302;

--
-- AUTO_INCREMENT for table `rfid_karyawan`
--
ALTER TABLE `rfid_karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `setting_absensi`
--
ALTER TABLE `setting_absensi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users_karyawan`
--
ALTER TABLE `users_karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
