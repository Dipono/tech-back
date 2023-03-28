-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2022 at 07:27 PM
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
(25, 5, 'B15G01', 'uvele ubone kuthi wee', 'Software', 'http://url', '2022-10-24', 'Banele', NULL),
(39, 0, '18-110', 'Busted Aircon', 'undefined', 'undefined', '2022-11-10', 'Phaidi', 'undefined'),
(46, 0, '45-5', 'xxxxxxxxxxxxxxxxx', 'undefined', 'undefined', '2022-11-03', 'pic', 'undefined');

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
  `user_type` varchar(100) NOT NULL,
  `staff_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `surname`, `contact`, `email_address`, `password`, `venue`, `department_id`, `user_type`, `staff_number`) VALUES
(3, 'Banele', 'Mpofu', '0136651234', 'mpofu@gmail', '123456', 'B15G01', 1, 'IT01', '21700000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jobcard`
--
ALTER TABLE `jobcard`
  ADD PRIMARY KEY (`jobcard_id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`request_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jobcard`
--
ALTER TABLE `jobcard`
  MODIFY `jobcard_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
