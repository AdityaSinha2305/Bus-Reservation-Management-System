-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 30, 2022 at 08:39 AM
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
-- Database: `bms`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `buspro` ()  BEGIN
SELECT busname,source,dest,dept,arrival FROM buses;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `email` varchar(50) NOT NULL,
  `bbusno` int(11) NOT NULL,
  `bbusname` varchar(50) NOT NULL,
  `bbuscomp` varchar(50) NOT NULL,
  `bbustype` varchar(50) NOT NULL,
  `bsource` varchar(50) NOT NULL,
  `bdest` varchar(50) NOT NULL,
  `bdept` time NOT NULL,
  `barrival` time NOT NULL,
  `bprice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `buses`
--

CREATE TABLE `buses` (
  `busno` int(11) NOT NULL,
  `busname` varchar(50) NOT NULL,
  `buscomp` varchar(50) NOT NULL,
  `bustype` varchar(50) NOT NULL,
  `source` varchar(50) NOT NULL,
  `dest` varchar(50) NOT NULL,
  `dept` time NOT NULL,
  `arrival` time NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buses`
--

INSERT INTO `buses` (`busno`, `busname`, `buscomp`, `bustype`, `source`, `dest`, `dept`, `arrival`, `price`) VALUES
(1, 'VRLTravels', 'Volvo', 'Sleeper', 'Bengaluru', 'Mumbai', '16:00:00', '08:30:00', 1600),
(2, 'Orange_Tours_and_Travels', 'Volvo', 'AC', 'Bengaluru', 'Mumbai', '16:00:00', '09:00:00', 1800),
(3, 'VRLTravels', 'TataMotors', 'Sleeper', 'Bengaluru', 'Mumbai', '12:30:00', '05:30:00', 900),
(4, 'ReshmaTourist', 'BharatBenz', 'AC', 'Bengaluru', 'Mumbai', '19:00:00', '13:15:00', 1300),
(5, 'NationalTravels', 'BharatBenz', 'AC', 'Bengaluru', 'Mumbai', '14:10:00', '11:00:00', 1162),
(6, 'ReshmaTourist', 'BharatBenz', 'AC-Sleeper', 'Mumbai', 'Bengaluru', '15:00:00', '10:30:00', 1100),
(7, 'NationalTravels', 'BharatBenz', 'AC-Sleeper', 'Mumbai', 'Bengaluru', '14:45:00', '09:04:00', 1200),
(8, 'VRLTravels', 'Volvo', 'AC', 'Mumbai', 'Bengaluru', '12:30:00', '07:30:00', 1600),
(9, 'MRTravels', 'TataMotors', 'AC', 'Mumbai', 'Bengaluru', '15:35:00', '10:35:00', 1410),
(10, 'JakharTravels', 'Volvo', 'Sleeper', 'Mumbai', 'Bengaluru', '16:30:00', '10:30:00', 3010),
(11, 'JabbarTravels', 'BharatBenz', 'AC-Sleeper', 'Bengaluru', 'Hyderabad', '22:00:00', '06:30:00', 1400),
(12, 'IntercityTravels', 'BharatBenz', 'AC-Sleeper', 'Bengaluru', 'Hyderabad', '22:15:00', '06:30:00', 1400),
(13, 'KSM_Road_Lines', 'TataMotors', 'AC', 'Bengaluru', 'Hyderabad', '22:00:00', '06:35:00', 1599),
(14, 'RajanTransports', 'Volvo', 'AC', 'Bengaluru', 'Hyderabad', '21:45:00', '05:35:00', 1600),
(15, 'Hail_Trip', 'Volvo', 'Sleeper', 'Bengaluru', 'Hyderabad', '21:50:00', '08:00:00', 750),
(16, 'RajanTransports', 'Volvo', 'Sleeper', 'Hyderabad', 'Bengaluru', '16:00:00', '08:30:00', 1600),
(17, 'KSM_Road_Lines', 'Volvo', 'Sleeper', 'Hyderabad', 'Bengaluru', '16:00:00', '08:30:00', 1699),
(18, 'Orange_Tours_and_Travels', 'Volvo', 'Sleeper', 'Hyderabad', 'Bengaluru', '16:00:00', '08:30:00', 900),
(19, 'IntercityTravels', 'BharatBenz', 'AC', 'Hyderabad', 'Bengaluru', '16:00:00', '08:30:00', 1400),
(20, 'JabbarTravels', 'BharatBenz', 'AC', 'Hyderabad', 'Bengaluru', '16:00:00', '08:30:00', 1330),
(21, 'Venkatesh_Tours_and_Travels', 'BharatBenz', 'AC-Sleeper', 'Mumbai', 'Hyderabad', '17:00:00', '07:30:00', 1250),
(22, 'JabbarTravels', 'TataMotors', 'AC', 'Mumbai', 'Hyderabad', '16:35:00', '07:05:00', 1300),
(23, 'CityTours_and_Travels', 'BharatBenz', 'AC', 'Mumbai', 'Hyderabad', '16:00:00', '08:50:00', 900),
(24, 'Orange_Tours_and_Travels', 'Volvo', 'Sleeper', 'Mumbai', 'Hyderabad', '18:00:00', '07:30:00', 1500),
(25, 'SUR_Tours_and_Travels', 'TataMotors', 'AC', 'Mumbai', 'Hyderabad', '15:30:00', '06:30:00', 1790),
(26, 'JabbarTravels', 'Volvo', 'AC', 'Hyderabad', 'Mumbai', '21:15:00', '10:45:00', 950),
(27, 'Orange_Tours_and_Travels', 'TataMotors', 'AC-Sleeper', 'Hyderabad', 'Mumbai', '16:45:00', '08:00:00', 1500),
(28, 'City_Tours_and_Travels', 'BharatBenz', 'AC', 'Hyderabad', 'Mumbai', '15:00:00', '06:00:00', 900),
(29, 'SUR_Tours_and_Travels', 'TataMotors', 'Sleeper', 'Hyderabad', 'Mumbai', '21:00:00', '10:30:00', 1300),
(30, 'Venkatesh_Tours_and_Travels', 'TataMotors', 'AC', 'Hyderabad', 'Mumbai', '19:15:00', '10:30:00', 1100),
(31, 'MaaShanti_Travels', 'TataMotors', 'AC-Seater/Sleeper', 'Ranchi', 'Patna', '21:15:00', '06:00:00', 570),
(32, 'SubaTravels', 'TataMotors', 'AC-Seater/Sleeper', 'Ranchi', 'Patna', '20:30:00', '05:30:00', 570),
(33, 'PrithviVahan', 'Volvo', 'AC-Sleeper', 'Ranchi', 'Patna', '21:00:00', '05:00:00', 799),
(34, 'RoyalArzoo', 'BharatBenz', 'AC-Sleeper', 'Ranchi', 'Patna', '21:00:00', '05:30:00', 710),
(35, 'BharatParyatan', 'Volvo', 'AC-Seater/Sleeper', 'Ranchi', 'Patna', '20:30:00', '05:30:00', 570),
(36, 'MaaShanti_Travels', 'TataMotors', 'AC-Seater/Sleeper', 'Patna', 'Ranchi', '21:15:00', '06:25:00', 650),
(37, 'BharatParyatan', 'Volvo', 'AC-Sleeper', 'Patna', 'Ranchi', '21:00:00', '06:00:00', 619),
(38, 'RoyalArzoo', 'BharatBenz', 'AC', 'Patna', 'Ranchi', '21:00:00', '05:00:00', 710),
(39, 'KrishnaRath_Luxury', 'Volvo', 'AC-Sleeper', 'Patna', 'Ranchi', '21:00:00', '05:00:00', 400),
(40, 'VijayRathn', 'TataMotors', 'AC-Sleeper', 'Patna', 'Ranchi', '19:15:00', '04:45:00', 700),
(41, 'ShivamTravels', 'Volvo', 'AC', 'Kolkata', 'Ranchi', '21:00:00', '06:00:00', 570),
(42, 'SriSai_Travels', 'TataMotors', 'AC', 'Kolkata', 'Ranchi', '21:00:00', '05:30:00', 462),
(43, 'RoyalCruiser_Travel_WorldClass', 'Volvo', 'AC', 'Kolkata', 'Ranchi', '20:00:00', '05:20:00', 952),
(44, 'RoyalTravels', 'BharatBenz', 'AC', 'Kolkata', 'Ranchi', '20:30:00', '05:00:00', 510),
(45, 'BabaTravels', 'BharatBenz', 'Non-AC', 'Kolkata', 'Ranchi', '20:30:00', '06:00:00', 550),
(46, 'ShivamTravels', 'Volvo', 'AC', 'Ranchi', 'Kolkata', '20:30:00', '06:30:00', 475),
(47, 'RoyalCruiser', 'Volvo', 'AC', 'Ranchi', 'Kolkata', '20:30:00', '06:30:00', 475),
(48, 'SaiRath', 'TataMotors', 'AC-Sleeper', 'Ranchi', 'Kolkata', '21:00:00', '06:00:00', 462),
(49, 'RoyalTravels', 'BharatBenz', 'AC', 'Ranchi', 'Kolkata', '21:00:00', '05:30:00', 560),
(50, 'BabaTravels', 'BharatBenz', 'Non-AC', 'Ranchi', 'Kolkata', '20:30:00', '06:00:00', 550),
(51, 'BengalTiger', 'Volvo', 'AC', 'Patna', 'Kolkata', '17:15:00', '09:00:00', 700),
(52, 'BengalTiger', 'Volvo', 'Non-AC', 'Patna', 'Kolkata', '16:30:00', '09:30:00', 0),
(53, 'Dayan & Company', 'Tata Motors', 'Non-AC', 'Patna', 'Kolkata', '17:30:00', '09:00:00', 555),
(54, 'JGD Travels', 'Bharat Benz', 'AC-Sleeper', 'Patna', 'Kolkata', '17:45:00', '06:00:00', 1030),
(55, 'Aitiana Airways', 'Tata Motors', 'AC-Sleeper', 'Patna', 'Kolkata', '19:00:00', '08:30:00', 800),
(56, 'Bengal Tiger', 'Volvo', 'AC', 'Kolkata', 'Patna', '19:45:00', '09:30:00', 700),
(57, 'Bengal Tiger', 'Volvo', 'Non-AC', 'Kolkata', 'Patna', '16:40:00', '09:00:00', 555),
(58, 'Dayan & Company', 'Tata Motors', 'Non-AC', 'Kolkata', 'Patna', '19:30:00', '09:30:00', 555),
(59, 'JGD Travels', 'Bharat Benz', 'AC-Sleeper', 'Kolkata', 'Patna', '17:00:00', '09:15:00', 1330),
(60, 'Aitiana Airways', 'Tata Motors', 'AC-Sleeper', 'Kolkata', 'Patna', '20:00:00', '10:30:00', 800);

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `pid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `pemail` varchar(50) NOT NULL,
  `pfname` varchar(50) NOT NULL,
  `plname` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `doj` date NOT NULL,
  `pnumber` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `tid` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `number` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Triggers `ticket`
--
DELIMITER $$
CREATE TRIGGER `BookingDeleted` BEFORE DELETE ON `ticket` FOR EACH ROW INSERT INTO trigr VALUES (NULL,OLD.tid,OLD.email,OLD.fname,OLD.lname,'BOOKING DELETED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `BookingInsertion` AFTER INSERT ON `ticket` FOR EACH ROW INSERT INTO trigr VALUES (NULL,NEW.tid,NEW.email,NEW.fname,NEW.lname,'BOOKING INSERTED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `BookingUpdated` AFTER UPDATE ON `ticket` FOR EACH ROW INSERT INTO trigr VALUES (NULL,NEW.tid,NEW.email,NEW.fname,NEW.lname,'BOOKING UPDATED',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `trigr`
--

CREATE TABLE `trigr` (
  `trid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buses`
--
ALTER TABLE `buses`
  ADD PRIMARY KEY (`busno`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `trigr`
--
ALTER TABLE `trigr`
  ADD PRIMARY KEY (`trid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buses`
--
ALTER TABLE `buses`
  MODIFY `busno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `passenger`
--
ALTER TABLE `passenger`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `trigr`
--
ALTER TABLE `trigr`
  MODIFY `trid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=321;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
