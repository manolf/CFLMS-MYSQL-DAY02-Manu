-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2020 at 02:16 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `transport`
--
CREATE DATABASE IF NOT EXISTS `transport` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `transport`;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `ADDRESS_ID` int(11) NOT NULL,
  `STREET` varchar(50) DEFAULT NULL,
  `ZIP_CODE` int(6) DEFAULT NULL,
  `CITY` varchar(30) DEFAULT NULL,
  `COUNTRY` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`ADDRESS_ID`, `STREET`, `ZIP_CODE`, `CITY`, `COUNTRY`) VALUES
(1, 'Erdbergstraße 88', 1030, 'Wien', 'Wien'),
(2, 'Minoritenplatz 1', 8600, 'Bruck a.d. Mur', 'Steiermark'),
(3, 'Jakominiplatz 3', 8010, 'Graz', 'Steiermark'),
(4, 'Ikeastraße 1', 9020, 'Klagenfurt', 'Kärnten'),
(5, 'Heiligengeistplatz 1', 9020, 'Klagenfurt', 'Kärnten'),
(6, 'Bahnhofstraße 1', 9400, 'Wolfsberg', 'Kärnten'),
(7, 'Hauptplatz 1', 8230, 'Hartberg', 'Steiermark'),
(8, 'Bahnhofplatz 2', 2700, 'Wiener Neustadt', 'Niederösterreich');

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

DROP TABLE IF EXISTS `bus`;
CREATE TABLE `bus` (
  `BUS_ID` int(11) NOT NULL,
  `LICENSE_NR` varchar(10) DEFAULT NULL,
  `CAPACITY` int(3) DEFAULT NULL,
  `MODEL` varchar(20) DEFAULT NULL,
  `DRIVER_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`BUS_ID`, `LICENSE_NR`, `CAPACITY`, `MODEL`, `DRIVER_ID`) VALUES
(1, 'W-69821B', 50, 'Mercedes', 1),
(2, 'W-FLY01', 50, 'Ford', 2),
(3, 'W-FLY02', 55, 'Ford', 3),
(4, 'W-FLY05', 57, 'Iveco', 5),
(5, 'W-FLY07', 59, 'MAN', 4);

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
CREATE TABLE `driver` (
  `DRIVER_ID` int(11) NOT NULL,
  `FIRST_NAME` varchar(50) DEFAULT NULL,
  `LAST_NAME` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`DRIVER_ID`, `FIRST_NAME`, `LAST_NAME`) VALUES
(1, 'Arnold', 'Bierheimer'),
(2, 'Fernando', 'Bendito-Santo'),
(3, 'Nora', 'Weinzierl'),
(4, 'Pilar', 'Bermudez-Gonzalez'),
(5, 'Karl', 'Schüttengruber');

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
CREATE TABLE `route` (
  `CODE` int(3) NOT NULL,
  `DISTANCE` float DEFAULT NULL,
  `SOURCE` varchar(20) DEFAULT NULL,
  `DESTINATION` varchar(20) DEFAULT NULL,
  `BUS_ID` int(11) DEFAULT NULL,
  `DETAIL_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`CODE`, `DISTANCE`, `SOURCE`, `DESTINATION`, `BUS_ID`, `DETAIL_ID`) VALUES
(100, 350, 'Wien', 'Klagenfurt', 5, NULL),
(101, 350, 'Klagenfurt', 'Wien', 5, NULL),
(200, 198, 'Wien', 'Graz', 5, NULL),
(201, 198, 'Graz', 'Wien', 5, NULL),
(300, 143, 'Graz', 'Klagenfurt', 2, NULL),
(301, 143, 'Klagenfurt', 'Graz', 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `routedetail`
--

DROP TABLE IF EXISTS `routedetail`;
CREATE TABLE `routedetail` (
  `DETAIL_ID` int(11) NOT NULL,
  `CODE` int(11) DEFAULT NULL,
  `STOP_ID` int(11) DEFAULT NULL,
  `ORDER_NR` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `routedetail`
--

INSERT INTO `routedetail` (`DETAIL_ID`, `CODE`, `STOP_ID`, `ORDER_NR`) VALUES
(8, 100, 1, 1),
(9, 100, 7, 2),
(10, 100, 8, 3),
(11, 100, 3, 4),
(12, 100, 6, 5),
(13, 100, 4, 6),
(14, 100, 5, 7),
(15, 300, 3, 1),
(16, 300, 6, 2),
(17, 300, 4, 6),
(18, 300, 5, 7),
(19, 200, 1, 1),
(20, 200, 7, 2),
(21, 200, 8, 3),
(22, 200, 2, 4),
(23, 200, 3, 5),
(24, 101, 1, 7),
(25, 101, 7, 6),
(26, 101, 8, 5),
(27, 101, 3, 4),
(28, 101, 6, 3),
(29, 101, 4, 2),
(30, 101, 5, 1),
(31, 301, 3, 4),
(32, 301, 6, 3),
(33, 301, 4, 2),
(34, 301, 5, 1),
(35, 201, 1, 5),
(36, 201, 7, 4),
(37, 201, 8, 3),
(38, 201, 2, 2),
(39, 201, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `station`
--

DROP TABLE IF EXISTS `station`;
CREATE TABLE `station` (
  `STOP_ID` int(11) NOT NULL,
  `PHONE` int(20) DEFAULT NULL,
  `ADDRESS_ID` int(11) DEFAULT NULL,
  `DETAIL_ID` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `station`
--

INSERT INTO `station` (`STOP_ID`, `PHONE`, `ADDRESS_ID`, `DETAIL_ID`, `name`) VALUES
(1, 900, 1, NULL, 'VIB Erdberg'),
(2, 301, 2, NULL, 'Minoritenplatz'),
(3, 316, 3, NULL, 'Bushaltestelle Watzk'),
(4, 800, 4, NULL, 'BH Haupteingang IKEA'),
(5, 800, 5, NULL, 'BH Am Lindwurm'),
(6, 800, 6, NULL, 'HBH Wolfsberg'),
(7, 800, 8, NULL, 'Post Wiener Neustadt'),
(8, 3338, 7, NULL, 'GH Zur Gretel');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`ADDRESS_ID`);

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`BUS_ID`),
  ADD KEY `DRIVER_ID` (`DRIVER_ID`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`DRIVER_ID`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`CODE`),
  ADD KEY `BUS_ID` (`BUS_ID`),
  ADD KEY `DETAIL_ID` (`DETAIL_ID`) USING BTREE;

--
-- Indexes for table `routedetail`
--
ALTER TABLE `routedetail`
  ADD PRIMARY KEY (`DETAIL_ID`),
  ADD KEY `CODE` (`CODE`),
  ADD KEY `STOP_ID` (`STOP_ID`);

--
-- Indexes for table `station`
--
ALTER TABLE `station`
  ADD PRIMARY KEY (`STOP_ID`),
  ADD KEY `ADDRESS_ID` (`ADDRESS_ID`),
  ADD KEY `DETAIL_ID` (`DETAIL_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `ADDRESS_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `bus`
--
ALTER TABLE `bus`
  MODIFY `BUS_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `DRIVER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `routedetail`
--
ALTER TABLE `routedetail`
  MODIFY `DETAIL_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `station`
--
ALTER TABLE `station`
  MODIFY `STOP_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bus`
--
ALTER TABLE `bus`
  ADD CONSTRAINT `bus_ibfk_1` FOREIGN KEY (`DRIVER_ID`) REFERENCES `driver` (`DRIVER_ID`);

--
-- Constraints for table `route`
--
ALTER TABLE `route`
  ADD CONSTRAINT `route_ibfk_1` FOREIGN KEY (`BUS_ID`) REFERENCES `bus` (`BUS_ID`);

--
-- Constraints for table `routedetail`
--
ALTER TABLE `routedetail`
  ADD CONSTRAINT `routedetail_ibfk_1` FOREIGN KEY (`CODE`) REFERENCES `route` (`CODE`),
  ADD CONSTRAINT `routedetail_ibfk_2` FOREIGN KEY (`CODE`) REFERENCES `route` (`CODE`),
  ADD CONSTRAINT `routedetail_ibfk_3` FOREIGN KEY (`STOP_ID`) REFERENCES `station` (`STOP_ID`);

--
-- Constraints for table `station`
--
ALTER TABLE `station`
  ADD CONSTRAINT `station_ibfk_1` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `address` (`ADDRESS_ID`),
  ADD CONSTRAINT `station_ibfk_2` FOREIGN KEY (`DETAIL_ID`) REFERENCES `routedetail` (`DETAIL_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
