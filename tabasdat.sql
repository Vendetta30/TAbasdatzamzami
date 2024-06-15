-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2024 at 05:24 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tabasdat`
--

-- --------------------------------------------------------

--
-- Table structure for table `divisi`
--

CREATE TABLE `divisi` (
  `kode_divisi` int(15) NOT NULL,
  `nama_divisi` varchar(25) NOT NULL,
  `gaji_divisi` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `divisi`
--

INSERT INTO `divisi` (`kode_divisi`, `nama_divisi`, `gaji_divisi`) VALUES
(111, 'Design', 10000),
(112, 'Marketing', 20000),
(113, 'Divisi Inti', 30000);

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `kode_pegawai` int(15) NOT NULL,
  `nama_pegawai` varchar(25) NOT NULL,
  `alamat_pegawai` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`kode_pegawai`, `nama_pegawai`, `alamat_pegawai`) VALUES
(1, 'Pandu', 'Ohio'),
(2, 'Furqon', 'Birmingham'),
(3, 'Aziz', 'Los Angeles');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `kode_project` int(15) NOT NULL,
  `nama_project` varchar(25) NOT NULL,
  `anggaran_project` int(20) NOT NULL,
  `kode_divisi` int(15) NOT NULL,
  `kode_pegawai` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`kode_project`, `nama_project`, `anggaran_project`, `kode_divisi`, `kode_pegawai`) VALUES
(121, 'Video', 100000, 111, 3),
(122, 'Event', 100000, 112, 1),
(123, 'Game', 100000, 113, 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_project`
-- (See below for the actual view)
--
CREATE TABLE `v_project` (
`kode_project` int(15)
,`nama_project` varchar(25)
,`anggaran_project` int(20)
,`kode_divisi` int(15)
,`kode_pegawai` int(15)
);

-- --------------------------------------------------------

--
-- Structure for view `v_project`
--
DROP TABLE IF EXISTS `v_project`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_project`  AS SELECT `project`.`kode_project` AS `kode_project`, `project`.`nama_project` AS `nama_project`, `project`.`anggaran_project` AS `anggaran_project`, `project`.`kode_divisi` AS `kode_divisi`, `project`.`kode_pegawai` AS `kode_pegawai` FROM `project` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `divisi`
--
ALTER TABLE `divisi`
  ADD PRIMARY KEY (`kode_divisi`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`kode_pegawai`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`kode_project`),
  ADD KEY `fk_kode_divisi` (`kode_divisi`) USING BTREE,
  ADD KEY `fk_kode_pegawai` (`kode_pegawai`) USING BTREE;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`kode_pegawai`) REFERENCES `pegawai` (`kode_pegawai`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_ibfk_2` FOREIGN KEY (`kode_divisi`) REFERENCES `divisi` (`kode_divisi`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
