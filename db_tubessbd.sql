-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2023 at 05:21 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_tubessbd`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id_customer` int(6) NOT NULL,
  `nama_customer` varchar(50) NOT NULL,
  `email_customer` varchar(50) NOT NULL,
  `phone_customer` int(14) NOT NULL,
  `sex_customer` varchar(1) NOT NULL,
  `address_customer` varchar(250) NOT NULL,
  `birth_customer` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `customer`
--
DELIMITER $$
CREATE TRIGGER `tr_custkosong` BEFORE INSERT ON `customer` FOR EACH ROW BEGIN  IF NEW.nama_customer = ''   THEN    SIGNAL SQLSTATE '45000'    SET MESSAGE_TEXT = 'NAMA TIDAK BOLEH KOSONG';  END IF;  IF NEW.address_customer = ''   THEN    SIGNAL SQLSTATE '45000'    SET MESSAGE_TEXT = 'ALAMAT TIDAK BOLEH KOSONG';  END IF;  IF NEW.email_customer = ''   THEN    SIGNAL SQLSTATE '45000'    SET MESSAGE_TEXT = 'EMAIL TIDAK BOLEH KOSONG';  END IF;    IF NEW.phone_customer = ''   THEN    SIGNAL SQLSTATE '45000'    SET MESSAGE_TEXT = 'NOMOR TELEPON TIDAK BOLEH KOSONG';   END IF;END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_custkosong2` BEFORE INSERT ON `customer` FOR EACH ROW BEGIN
IF NEW.sex_customer= ''
  THEN
    SET NEW.sex_customer = 'L';
  END IF;
IF NEW.birth_customer= ''
  THEN
    SET NEW.birth_customer = '2000-01-01';
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_request`
--

CREATE TABLE `customer_request` (
  `id_cust_req` int(6) NOT NULL,
  `id_customer` int(6) NOT NULL,
  `id_sampah` int(1) NOT NULL,
  `id_ukuran` int(1) NOT NULL,
  `quantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_sampah`
--

CREATE TABLE `jenis_sampah` (
  `id_sampah` int(1) NOT NULL,
  `nama_sampah` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jenis_sampah`
--

INSERT INTO `jenis_sampah` (`id_sampah`, `nama_sampah`) VALUES
(1, 'Botol Plastik'),
(2, 'Botol Kaca'),
(3, 'Kaleng'),
(4, 'Gelas Plastik'),
(5, 'Botol HDPE');

-- --------------------------------------------------------

--
-- Table structure for table `ranger`
--

CREATE TABLE `ranger` (
  `id_ranger` int(6) NOT NULL,
  `name_ranger` varchar(50) NOT NULL,
  `email_ranger` varchar(50) NOT NULL,
  `phone_ranger` int(14) NOT NULL,
  `sex_ranger` varchar(1) NOT NULL,
  `address_ranger` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `ranger`
--
DELIMITER $$
CREATE TRIGGER `tr_rangerkosong` BEFORE INSERT ON `ranger` FOR EACH ROW BEGIN  IF NEW.name_ranger = ''   THEN    SIGNAL SQLSTATE '45000'    SET MESSAGE_TEXT = 'NAMA TIDAK BOLEH KOSONG';  END IF;  IF NEW.address_ranger = ''   THEN    SIGNAL SQLSTATE '45000'    SET MESSAGE_TEXT = 'ALAMAT TIDAK BOLEH KOSONG';  END IF;  IF NEW.email_ranger = ''   THEN    SIGNAL SQLSTATE '45000'    SET MESSAGE_TEXT = 'EMAIL TIDAK BOLEH KOSONG';  END IF;    IF NEW.phone_ranger = ''   THEN    SIGNAL SQLSTATE '45000'    SET MESSAGE_TEXT = 'NOMOR TELEPON TIDAK BOLEH KOSONG';   END IF;END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_rangerkosong2` BEFORE INSERT ON `ranger` FOR EACH ROW BEGIN
IF NEW.sex_ranger= ''
  THEN
    SET NEW.sex_ranger = 'L';
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `recycle_company`
--

CREATE TABLE `recycle_company` (
  `id_company` int(6) NOT NULL,
  `name_company` varchar(50) NOT NULL,
  `phone_company` int(14) NOT NULL,
  `email_company` varchar(50) NOT NULL,
  `address_company` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `recycle_company`
--
DELIMITER $$
CREATE TRIGGER `tr_companykosong` BEFORE INSERT ON `recycle_company` FOR EACH ROW BEGIN
  IF NEW.name_company = '' 
  THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'NAMA TIDAK BOLEH KOSONG';
  END IF;
  IF NEW.address_company = '' 
  THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'ALAMAT TIDAK BOLEH KOSONG';
  END IF;
  IF NEW.email_company = '' 
  THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'EMAIL TIDAK BOLEH KOSONG';
  END IF;
    IF NEW.phone_company = '' 
  THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'NOMOR TELEPON TIDAK BOLEH KOSONG';
   END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ukuran_sampah`
--

CREATE TABLE `ukuran_sampah` (
  `id_ukuran` int(1) NOT NULL,
  `jenis_ukuran` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ukuran_sampah`
--

INSERT INTO `ukuran_sampah` (`id_ukuran`, `jenis_ukuran`) VALUES
(1, 'Besar'),
(2, 'Sedang'),
(3, 'Kecil');

-- --------------------------------------------------------

--
-- Table structure for table `waste_collector`
--

CREATE TABLE `waste_collector` (
  `id_waste_collector` int(6) NOT NULL,
  `name_waste_collector` varchar(50) NOT NULL,
  `phone_waste_collector` int(14) NOT NULL,
  `address_waste_collector` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `waste_collector`
--
DELIMITER $$
CREATE TRIGGER `tr_wastekosong` BEFORE INSERT ON `waste_collector` FOR EACH ROW BEGIN
  IF NEW.name_waste_collector = '' 
  THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'NAMA TIDAK BOLEH KOSONG';
  END IF;
  IF NEW.address_waste_collector = '' 
  THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'ALAMAT TIDAK BOLEH KOSONG';
  END IF;
    IF NEW.phone_waste_collector = '' 
  THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'NOMOR TELEPON TIDAK BOLEH KOSONG';
   END IF;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `customer_request`
--
ALTER TABLE `customer_request`
  ADD PRIMARY KEY (`id_cust_req`);

--
-- Indexes for table `jenis_sampah`
--
ALTER TABLE `jenis_sampah`
  ADD PRIMARY KEY (`id_sampah`);

--
-- Indexes for table `ranger`
--
ALTER TABLE `ranger`
  ADD PRIMARY KEY (`id_ranger`);

--
-- Indexes for table `recycle_company`
--
ALTER TABLE `recycle_company`
  ADD PRIMARY KEY (`id_company`);

--
-- Indexes for table `ukuran_sampah`
--
ALTER TABLE `ukuran_sampah`
  ADD PRIMARY KEY (`id_ukuran`);

--
-- Indexes for table `waste_collector`
--
ALTER TABLE `waste_collector`
  ADD PRIMARY KEY (`id_waste_collector`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id_customer` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_request`
--
ALTER TABLE `customer_request`
  MODIFY `id_cust_req` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jenis_sampah`
--
ALTER TABLE `jenis_sampah`
  MODIFY `id_sampah` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ranger`
--
ALTER TABLE `ranger`
  MODIFY `id_ranger` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recycle_company`
--
ALTER TABLE `recycle_company`
  MODIFY `id_company` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ukuran_sampah`
--
ALTER TABLE `ukuran_sampah`
  MODIFY `id_ukuran` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `waste_collector`
--
ALTER TABLE `waste_collector`
  MODIFY `id_waste_collector` int(6) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
