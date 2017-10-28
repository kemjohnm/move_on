-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 28, 2017 at 03:47 PM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `move_on`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `adm_id` int(11) NOT NULL,
  `adm_username` varchar(255) NOT NULL,
  `adm_email` varchar(255) NOT NULL,
  `adm_password` text NOT NULL,
  `adm_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mover`
--

CREATE TABLE IF NOT EXISTS `mover` (
  `mov_id` int(11) NOT NULL,
  `mov_username` varchar(255) NOT NULL,
  `mov_email` varchar(255) NOT NULL,
  `mov_password` text NOT NULL,
  `mov_status` tinyint(1) NOT NULL,
  `adm_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `relocatee`
--

CREATE TABLE IF NOT EXISTS `relocatee` (
  `rel_id` int(11) NOT NULL,
  `rel_username` varchar(255) NOT NULL,
  `rel_email` varchar(255) NOT NULL,
  `rel_password` text NOT NULL,
  `rel_status` tinyint(1) NOT NULL,
  `adm_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE IF NOT EXISTS `report` (
  `rep_id` int(11) NOT NULL,
  `rep_numofusers` int(11) NOT NULL,
  `rep_numofveh` int(11) NOT NULL,
  `adm_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE IF NOT EXISTS `transaction` (
  `tr_id` int(11) NOT NULL,
  `tr_date` date NOT NULL,
  `tr_time` time NOT NULL,
  `adm_id` int(11) NOT NULL,
  `mov_id` int(11) NOT NULL,
  `rel_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE IF NOT EXISTS `vehicle` (
  `veh_id` int(11) NOT NULL,
  `veh_name` varchar(255) NOT NULL,
  `veh_type` varchar(255) NOT NULL,
  `veh_template` varchar(255) NOT NULL,
  `mov_id` int(11) NOT NULL,
  `adm_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adm_id`);

--
-- Indexes for table `mover`
--
ALTER TABLE `mover`
  ADD PRIMARY KEY (`mov_id`), ADD KEY `adm_id` (`adm_id`);

--
-- Indexes for table `relocatee`
--
ALTER TABLE `relocatee`
  ADD PRIMARY KEY (`rel_id`), ADD KEY `adm_id` (`adm_id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`rep_id`), ADD KEY `adm_id` (`adm_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`tr_id`), ADD KEY `adm_id` (`adm_id`), ADD KEY `mov_id` (`mov_id`), ADD KEY `rel_id` (`rel_id`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`veh_id`), ADD KEY `mov_id` (`mov_id`), ADD KEY `adm_id` (`adm_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adm_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `relocatee`
--
ALTER TABLE `relocatee`
  MODIFY `rel_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `rep_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `tr_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `veh_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `mover`
--
ALTER TABLE `mover`
ADD CONSTRAINT `mover_admin_constraint` FOREIGN KEY (`adm_id`) REFERENCES `admin` (`adm_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `relocatee`
--
ALTER TABLE `relocatee`
ADD CONSTRAINT `relocatee_admin_constraint` FOREIGN KEY (`adm_id`) REFERENCES `admin` (`adm_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `report`
--
ALTER TABLE `report`
ADD CONSTRAINT `report_admin_constraint` FOREIGN KEY (`adm_id`) REFERENCES `admin` (`adm_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
ADD CONSTRAINT `transaction_admin_constraint` FOREIGN KEY (`adm_id`) REFERENCES `admin` (`adm_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `transaction_mover_constraint` FOREIGN KEY (`mov_id`) REFERENCES `mover` (`mov_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `transaction_relocatee_constraint` FOREIGN KEY (`rel_id`) REFERENCES `relocatee` (`rel_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vehicle`
--
ALTER TABLE `vehicle`
ADD CONSTRAINT `vehicle_admin_constraint` FOREIGN KEY (`adm_id`) REFERENCES `admin` (`adm_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `vehicle_mover_constraint` FOREIGN KEY (`mov_id`) REFERENCES `mover` (`mov_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
