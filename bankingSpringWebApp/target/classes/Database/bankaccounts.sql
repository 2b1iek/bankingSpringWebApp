-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 11, 2025 at 02:25 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bankaccounts`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `accountId` int(11) NOT NULL,
  `accountType` varchar(50) DEFAULT NULL,
  `accountHolderName` varchar(100) DEFAULT NULL,
  `accountHolderContact` varchar(15) DEFAULT NULL,
  `accountBalance` decimal(15,2) DEFAULT NULL,
  `accountSetupDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`accountId`, `accountType`, `accountHolderName`, `accountHolderContact`, `accountBalance`, `accountSetupDate`) VALUES
(1, 'Savings', 'Paras Karsi', '9876543210', 1500.00, '2023-05-10'),
(2, 'Current', 'Azeez Ahmed', '9123456780', 25000.50, '2022-08-14'),
(3, 'Savings', 'Megha Magar', '9988776655', 5000.00, '2024-01-25'),
(4, 'Savings', 'John Smith', '9001122334', 1200.00, '2023-03-30'),
(5, 'Current', 'Alice Johnson', '9556677889', 32000.75, '2022-11-05'),
(8, 'Saving', 'Bibek Shrestha', '4379555719', 7000.00, '2025-07-04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`accountId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `accountId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
