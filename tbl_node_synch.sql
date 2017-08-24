-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 24, 2017 at 06:33 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tbl_node_synch`
--

-- --------------------------------------------------------

--
-- Table structure for table `takes`
--

CREATE TABLE `takes` (
  `take_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `take_name` varchar(200) NOT NULL,
  `total_files_count` varchar(100) NOT NULL,
  `status` enum('complete','incomplete') NOT NULL DEFAULT 'incomplete',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `takes`
--

INSERT INTO `takes` (`take_id`, `user_id`, `take_name`, `total_files_count`, `status`, `created_at`) VALUES
(11, 40, 'mp3123', '0', 'complete', '2017-08-22 15:02:16'),
(12, 40, 'take_2', '0', 'complete', '2017-08-22 15:02:50'),
(13, 40, 'take_3', '3', 'incomplete', '2017-08-22 15:03:01'),
(14, 40, 'take_4', '2', 'incomplete', '2017-08-22 15:04:22'),
(15, 40, 'take_5', '0', 'complete', '2017-08-22 15:04:39'),
(16, 40, 'take_6', '0', 'complete', '2017-08-22 15:08:19'),
(17, 40, 'take_7', '0', 'complete', '2017-08-22 15:20:20'),
(18, 40, 'take_5h', '0', 'complete', '2017-08-22 15:04:39'),
(19, 40, 'take_6d', '0', 'complete', '2017-08-22 15:08:19'),
(20, 40, 'take_7d', '0', 'complete', '2017-08-22 15:20:20'),
(21, 1, 'lcal_take', '3', 'incomplete', '2017-08-23 09:11:13'),
(22, 1, 'take_test', '0', 'complete', '2017-08-23 09:21:14');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `video_id` int(11) NOT NULL,
  `take_id` int(11) NOT NULL,
  `file_name` varchar(500) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`video_id`, `take_id`, `file_name`, `created_at`) VALUES
(14, 11, 'tbl_product.sql', '2017-08-22 15:02:15'),
(15, 11, 'tbl_product.sql', '2017-08-22 15:02:16'),
(16, 12, 'tbl_product.sql', '2017-08-22 15:02:29'),
(17, 12, 'tbl_product.sql', '2017-08-22 15:02:32'),
(18, 12, 'tbl_product.sql', '2017-08-22 15:02:42'),
(19, 12, 'tbl_product.sql', '2017-08-22 15:02:50'),
(20, 13, 'tbl_product.sql', '2017-08-22 15:03:01'),
(21, 14, 'tbl_product.sql', '2017-08-22 15:04:22'),
(22, 15, 'tbl_product.sql', '2017-08-22 15:04:31'),
(23, 15, 'tbl_product.sql', '2017-08-22 15:04:38'),
(24, 15, 'tbl_product.sql', '2017-08-22 15:04:39'),
(25, 15, 'tbl_product.sql', '2017-08-22 15:07:00'),
(26, 16, 'How To Create Server-side MVC Apps with Node.js and Express.mp4', '2017-08-22 15:07:50'),
(27, 16, 'How To Create Server-side MVC Apps with Node.js and Express.mp4', '2017-08-22 15:08:19'),
(28, 16, 'How To Create Server-side MVC Apps with Node.js and Express.mp4', '2017-08-22 15:10:12'),
(29, 16, 'tbl_product.sql', '2017-08-22 15:10:18'),
(30, 17, 'tbl_product.sql', '2017-08-22 15:20:08'),
(31, 17, 'tbl_product.sql', '2017-08-22 15:20:20'),
(32, 21, 'forgot-jainam.html', '2017-08-23 09:11:13'),
(33, 22, 'Feedback.docx', '2017-08-23 09:21:04'),
(34, 22, 'freelapWP-CI-estimate', '2017-08-23 09:21:10'),
(35, 22, 'languageText-freelap-required', '2017-08-23 09:21:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `takes`
--
ALTER TABLE `takes`
  ADD PRIMARY KEY (`take_id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`video_id`),
  ADD KEY `user_id` (`take_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `takes`
--
ALTER TABLE `takes`
  MODIFY `take_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `video_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
