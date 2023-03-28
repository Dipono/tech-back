-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2022 at 08:30 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ts_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` bigint(20) NOT NULL,
  `admin_name` varchar(30) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` bigint(20) NOT NULL,
  `jobcard_id` int(30) NOT NULL,
  `staff_email` varchar(255) NOT NULL,
  `ref_number` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `image_id` bigint(20) NOT NULL,
  `image_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`image_id`, `image_url`) VALUES
(1, 'C:\\Users\\ICEP\\Desktop\\BACKEND\\Technical-Service_BE\\images\\1669102591040.webp');

-- --------------------------------------------------------

--
-- Table structure for table `jobcard`
--

CREATE TABLE `jobcard` (
  `jobcard_id` int(11) NOT NULL,
  `request_id` int(100) NOT NULL,
  `venue` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `category` varchar(100) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `createdAt` date DEFAULT NULL,
  `staff_name` varchar(255) DEFAULT NULL,
  `staff_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jobcard`
--

INSERT INTO `jobcard` (`jobcard_id`, `request_id`, `venue`, `description`, `category`, `picture`, `createdAt`, `staff_name`, `staff_number`) VALUES
(1, 1, '45-5', 'idk', 'Electrical', 'http://url_pic', '2022-11-02', 'Thabo', '21900000'),
(73, 6, 'B15G01', 'uvele ubone kuthi wee', 'Software', 'http://url', '2022-10-24', 'Banele', '2170000'),
(74, 6, 'B15G01', 'uvele ubone kuthi wee', 'Software', 'http://url', '2022-10-24', 'Banele', '2170000'),
(75, 0, 'thabo', 'hcg,kjbnm,', '1', 'undefined', '2022-11-28', 'thabo', 'thabo'),
(76, 0, 'B9', 'fbgjmu,', '1', 'undefined', '2022-11-28', 'thabo', '21784596'),
(77, 0, 'B7', 'enjkefiehfer', '2', 'undefined', '2022-11-28', 'pal', '217898989');

-- --------------------------------------------------------

--
-- Table structure for table `jobstatus`
--

CREATE TABLE `jobstatus` (
  `jobstatus_id` bigint(20) NOT NULL,
  `jobstatus` varchar(225) NOT NULL,
  `jobcard_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jobstatus`
--

INSERT INTO `jobstatus` (`jobstatus_id`, `jobstatus`, `jobcard_id`) VALUES
(0, 'completed', 0),
(1, 'started', 1),
(2, 'started', 1);

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `report_id` int(11) NOT NULL,
  `description` varchar(500) NOT NULL,
  `date` date NOT NULL,
  `category_type` varchar(255) NOT NULL,
  `staff_name` varchar(255) DEFAULT NULL,
  `artisan_name` varchar(255) DEFAULT NULL,
  `issue` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`report_id`, `description`, `date`, `category_type`, `staff_name`, `artisan_name`, `issue`) VALUES
(1, 'the screen just turned blank', '2022-10-25', 'hardware', 'banele', 'nkosinathi', 'monitor'),
(2, 'ZIYAKHALA, ZIKU-LOAD SPEAKER', '2022-10-25', 'hardware', 'Zanele', 'Nathi', 'Monitor'),
(4, 'kubi nam angaz', '0000-00-00', 'Hardware', 'banele mpofu', 'nathi mpofu', 'scanner'),
(5, 'screen doesn\'t display anything', '1899-11-30', 'Hardware', 'banele', 'nathi', 'Monitor');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `request_id` int(11) NOT NULL,
  `venue` varchar(100) NOT NULL,
  `time_requested` time NOT NULL,
  `date` date DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `staff_number` varchar(255) DEFAULT NULL,
  `staff_name` varchar(255) DEFAULT NULL,
  `issue` varchar(255) DEFAULT NULL,
  `category_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`request_id`, `venue`, `time_requested`, `date`, `picture`, `staff_number`, `staff_name`, `issue`, `category_type`) VALUES
(4, 'B16G01', '00:00:00', '2022-10-24', 'http://url', '21800000', NULL, NULL, NULL),
(5, 'B17G01', '00:00:00', '0000-00-00', 'http://url', '21900000', NULL, NULL, NULL),
(6, 'B17G01', '00:00:00', '0000-00-00', 'http://url', '22000000', 'banele', 'Monitor', 'Hardware');

-- --------------------------------------------------------

--
-- Table structure for table `response`
--

CREATE TABLE `response` (
  `responce_id` bigint(20) NOT NULL,
  `jobcard_id` int(30) NOT NULL,
  `artisan_name` varchar(255) NOT NULL,
  `ETC` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `response`
--

INSERT INTO `response` (`responce_id`, `jobcard_id`, `artisan_name`, `ETC`) VALUES
(1, 6, 'Banele', '0000-00-00'),
(2, 6, 'Banele', '0000-00-00'),
(3, 6, 'Banele', '0000-00-00'),
(4, 6, 'Banele', '0000-00-00'),
(5, 6, 'Banele', '0000-00-00'),
(6, 6, 'Banele', '0000-00-00'),
(7, 7, 'Banele Mpofu', '0000-00-00'),
(8, 7, 'Banele Mpofu', '0000-00-00'),
(9, 7, 'Banele Mpofu', '0000-00-00'),
(10, 7, 'Banele Mpofu', '0000-00-00'),
(11, 1, 'Sanele Mkhonza', '2022-11-23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `email_address` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `venue` varchar(100) NOT NULL,
  `department_id` int(100) NOT NULL,
  `staff_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `surname`, `contact`, `email_address`, `password`, `venue`, `department_id`, `staff_number`) VALUES
(3, 'Banele', 'Mpofu', '0136651234', 'mpofu@gmail', '123456', 'B15G01', 1, '21700000'),
(5, 'Nathi', 'Mpofu', '0136657894', 'mpofu1@gmail.com', '123456', 'B15', 0, NULL),
(6, 'Nathi', 'Mpofu', '0136657894', 'mpofu2@gmail.com', '123456', 'B15', 0, NULL),
(7, 'Nathi', 'Mpofu', '0136657894', 'mpofu3@gmail.com', '123456', 'B15', 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `jobcard`
--
ALTER TABLE `jobcard`
  ADD PRIMARY KEY (`jobcard_id`);

--
-- Indexes for table `jobstatus`
--
ALTER TABLE `jobstatus`
  ADD PRIMARY KEY (`jobstatus_id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`request_id`);

--
-- Indexes for table `response`
--
ALTER TABLE `response`
  ADD PRIMARY KEY (`responce_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `image_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobcard`
--
ALTER TABLE `jobcard`
  MODIFY `jobcard_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `jobstatus`
--
ALTER TABLE `jobstatus`
  MODIFY `jobstatus_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `response`
--
ALTER TABLE `response`
  MODIFY `responce_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
