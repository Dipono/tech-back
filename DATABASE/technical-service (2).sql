-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2023 at 01:10 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `technical-service`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminId` int(11) NOT NULL,
  `adminNo` int(11) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `campus_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminId`, `adminNo`, `firstname`, `lastname`, `campus_name`, `email`, `password`) VALUES
(1, 123456, 'lethabo', 'makena', 'soshanguve', 'makena@tut4life.ac.za', 'zxc123'),
(2, 123654, 'james', 'kekana', 'polokoane', 'kekana@tut4life.ac.za', 'zxc123');

-- --------------------------------------------------------

--
-- Table structure for table `artisan`
--

CREATE TABLE `artisan` (
  `artisanId` int(11) NOT NULL,
  `artisanNo` int(11) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `campus_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `artisan`
--

INSERT INTO `artisan` (`artisanId`, `artisanNo`, `firstname`, `lastname`, `campus_name`, `email`, `password`) VALUES
(1, 0, NULL, NULL, NULL, NULL, NULL),
(2, 142536, 'given', 'mabena', 'polokwane', 'mabena@tut4life.ac.za', 'zxc123'),
(3, 124536, 'lethabo', 'mabaso', 'soshanguve', 'mabaso@tut4life.ac.za', 'zxc123');

-- --------------------------------------------------------

--
-- Table structure for table `jobcard`
--

CREATE TABLE `jobcard` (
  `jobcardId` int(11) NOT NULL,
  `referenceNo` varchar(20) DEFAULT NULL,
  `vanue` varchar(10) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `date_to_fix` varchar(50) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `artisanId` int(10) DEFAULT NULL,
  `staffId` int(11) DEFAULT NULL,
  `adminId` int(11) DEFAULT NULL,
  `time` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jobcard`
--

INSERT INTO `jobcard` (`jobcardId`, `referenceNo`, `vanue`, `category`, `description`, `date_created`, `date_to_fix`, `image`, `artisanId`, `staffId`, `adminId`, `time`) VALUES
(3, '1679923303638', '10-212', 'technical', 'mouse', '2023-03-27', '2023-03-27', NULL, 3, 1, NULL, '12:30'),
(5, '1680087371937', '10-212', 'infrastructure', 'window', '2023-03-29', '2023-03-30', NULL, 1, 1, NULL, '13:00');

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `reportId` int(11) NOT NULL,
  `jobcardId` int(11) DEFAULT NULL,
  `job_status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`reportId`, `jobcardId`, `job_status`) VALUES
(1, 3, 'Complete'),
(2, 3, 'progress'),
(3, 3, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staffId` int(11) NOT NULL,
  `staffNo` int(11) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `campus_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staffId`, `staffNo`, `firstname`, `lastname`, `campus_name`, `email`, `role`) VALUES
(1, 123564, 'steve', 'scott', 'soshanguve', 'scott@tut4life.ac.za', 'lecture'),
(2, 321654, 'mpho', 'maja', 'polokwane', 'maja@tut4life.ac.za', 'hod');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminId`);

--
-- Indexes for table `artisan`
--
ALTER TABLE `artisan`
  ADD PRIMARY KEY (`artisanId`);

--
-- Indexes for table `jobcard`
--
ALTER TABLE `jobcard`
  ADD PRIMARY KEY (`jobcardId`),
  ADD KEY `job_artisan` (`artisanId`),
  ADD KEY `job_staff` (`staffId`),
  ADD KEY `job_admin` (`adminId`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`reportId`),
  ADD KEY `rep_job` (`jobcardId`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staffId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `artisan`
--
ALTER TABLE `artisan`
  MODIFY `artisanId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jobcard`
--
ALTER TABLE `jobcard`
  MODIFY `jobcardId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `reportId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staffId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jobcard`
--
ALTER TABLE `jobcard`
  ADD CONSTRAINT `job_admin` FOREIGN KEY (`adminId`) REFERENCES `admin` (`adminId`),
  ADD CONSTRAINT `job_artisan` FOREIGN KEY (`artisanId`) REFERENCES `artisan` (`artisanId`),
  ADD CONSTRAINT `job_staff` FOREIGN KEY (`staffId`) REFERENCES `staff` (`staffId`);

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `rep_job` FOREIGN KEY (`jobcardId`) REFERENCES `jobcard` (`jobcardId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
