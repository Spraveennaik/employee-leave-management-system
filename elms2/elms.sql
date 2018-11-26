-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2018 at 05:01 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elms`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `get` (IN `did` INT)  SELECT * from tbldepartments WHERE id=did$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'admin', '5c428d8875d2948607f3e3fe134d71b4', '2017-10-30 11:42:58');

-- --------------------------------------------------------

--
-- Table structure for table `departmenttrigger`
--

CREATE TABLE `departmenttrigger` (
  `id` int(11) NOT NULL,
  `departmentname` text NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departmenttrigger`
--

INSERT INTO `departmenttrigger` (`id`, `departmentname`, `date`) VALUES
(1, 'asfdasf', '2018-11-20 09:52:33'),
(2, 'Cyber Security', '2018-11-20 10:00:01'),
(3, 'Human Resource', '2018-11-20 10:03:46'),
(4, 'Research & Development', '2018-11-20 10:05:50'),
(5, 'asdfg', '2018-11-21 12:15:54');

-- --------------------------------------------------------

--
-- Table structure for table `tbldepartments`
--

CREATE TABLE `tbldepartments` (
  `id` int(11) NOT NULL,
  `DepartmentName` varchar(255) NOT NULL,
  `DepartmentShortName` text NOT NULL,
  `DepartmentCode` text,
  `CreationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `adminid` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbldepartments`
--

INSERT INTO `tbldepartments` (`id`, `DepartmentName`, `DepartmentShortName`, `DepartmentCode`, `CreationDate`, `adminid`) VALUES
(10, 'asdfg', 'rfghn', 'qwert', '2018-11-21 06:45:54', 1),
(7, 'Cyber Security', 'CR', 'crRY', '2018-11-20 04:30:01', 1),
(8, 'Human Resource', 'HR', 'hRrH', '2018-11-20 04:33:46', 1),
(9, 'Research & Development', 'R&D', 'dRDe', '2018-11-20 04:35:50', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblemployees`
--

CREATE TABLE `tblemployees` (
  `id` int(11) NOT NULL,
  `EmpId` varchar(100) NOT NULL,
  `FirstName` varchar(150) NOT NULL,
  `LastName` varchar(150) NOT NULL,
  `EmailId` varchar(200) NOT NULL,
  `Password` varchar(180) NOT NULL,
  `Gender` varchar(100) NOT NULL,
  `Dob` varchar(100) NOT NULL,
  `Department` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `City` varchar(200) NOT NULL,
  `Country` varchar(150) NOT NULL,
  `Phonenumber` char(11) NOT NULL,
  `Status` int(1) NOT NULL,
  `RegDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `adminid` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblemployees`
--

INSERT INTO `tblemployees` (`id`, `EmpId`, `FirstName`, `LastName`, `EmailId`, `Password`, `Gender`, `Dob`, `Department`, `Address`, `City`, `Country`, `Phonenumber`, `Status`, `RegDate`, `adminid`) VALUES
(3, 'emp123', 'Anushree', 'N.S', 'anushreecry@gmail.com', 'e19d5cd5af0378da05f63f891c7467af', 'Female', '4 July, 1998', 'Cyber Security', 'bangalore', 'bangalore', 'India', '9897965923', 1, '2018-11-20 04:47:19', 1),
(4, 'asdfg', 'Ganpathi', 'asd', 'gana9@gmail.com', 'd8578edf8458ce06fbc5bb76a58c5ca4', 'Male', '8 November, 2018', 'Cyber Security', 'asdsad', 'ewdw', 'ewdfwc', '9874663546', 1, '2018-11-21 06:35:43', 1),
(5, 'emp', 'Anushree', 'Ns', 'anucry@gmail.com', 'd8578edf8458ce06fbc5bb76a58c5ca4', 'Male', '17 November, 2018', 'Cyber Security', 'qwerty', 'we', 'sdfgh', '9875285266', 1, '2018-11-21 06:48:51', 1),
(6, 'emp26', 'shankar', 's', 'shankar@gmail.com', 'd8578edf8458ce06fbc5bb76a58c5ca4', 'Male', '1 November, 2011', 'Human Resource', 'bangalore', 'bangalore', 'India', '9874563210', 1, '2018-11-26 15:55:50', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblleaves`
--

CREATE TABLE `tblleaves` (
  `id` int(11) NOT NULL,
  `LeaveType` varchar(200) NOT NULL,
  `ToDate` varchar(120) NOT NULL,
  `FromDate` varchar(120) NOT NULL,
  `Description` mediumtext NOT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AdminRemark` mediumtext,
  `AdminRemarkDate` varchar(120) DEFAULT NULL,
  `Status` int(1) NOT NULL,
  `IsRead` int(1) NOT NULL,
  `empid` int(11) DEFAULT NULL,
  `adminid` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblleaves`
--

INSERT INTO `tblleaves` (`id`, `LeaveType`, `ToDate`, `FromDate`, `Description`, `PostingDate`, `AdminRemark`, `AdminRemarkDate`, `Status`, `IsRead`, `empid`, `adminid`) VALUES
(11, 'Casual Leave', '07/12/2018', '10/12/2018', 'going for trip with family', '2018-11-20 04:49:44', 'no time for fun', '2018-11-20 10:21:17 ', 2, 1, 3, 1),
(12, 'Casual Leave', '12/12/2012', '12/12/2013', 'sdfa', '2018-11-21 06:37:18', NULL, NULL, 0, 0, 4, 1),
(13, 'Casual Leave', '30/12/2018', '10/01/2019', 'dfghbjn', '2018-11-21 06:50:26', NULL, NULL, 0, 0, 5, 1),
(14, 'Casual Leave', '12/12/2018', '14/12/2018', 'wsedrftgyh', '2018-11-21 06:50:57', NULL, NULL, 0, 0, 5, 1),
(15, 'Medical Leave test', '29/11/2018', '30/11/2018', 'fever', '2018-11-26 15:57:13', NULL, NULL, 0, 0, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblleavetype`
--

CREATE TABLE `tblleavetype` (
  `id` int(11) NOT NULL,
  `LeaveType` varchar(200) NOT NULL,
  `Description` mediumtext,
  `CreationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `adminid` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblleavetype`
--

INSERT INTO `tblleavetype` (`id`, `LeaveType`, `Description`, `CreationDate`, `adminid`) VALUES
(1, 'Casual Leave', 'Casual Leave ', '2017-11-01 12:07:56', 1),
(4, 'erfgnxcvbn', 'dfghjk', '2018-11-21 06:46:24', 1),
(5, 'maternity leave', 'maternity leave', '2018-11-26 15:53:41', 1),
(2, 'Medical Leave test', 'Medical Leave  ', '2017-11-06 13:16:09', 1),
(3, 'Restricted Holiday(RH)', 'Restricted Holiday(RH)', '2017-11-06 13:16:38', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departmenttrigger`
--
ALTER TABLE `departmenttrigger`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbldepartments`
--
ALTER TABLE `tbldepartments`
  ADD PRIMARY KEY (`DepartmentName`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `fk4` (`adminid`);

--
-- Indexes for table `tblemployees`
--
ALTER TABLE `tblemployees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk3` (`adminid`),
  ADD KEY `fk7` (`Department`);

--
-- Indexes for table `tblleaves`
--
ALTER TABLE `tblleaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UserEmail` (`empid`),
  ADD KEY `fk2` (`adminid`),
  ADD KEY `fk6` (`LeaveType`);

--
-- Indexes for table `tblleavetype`
--
ALTER TABLE `tblleavetype`
  ADD PRIMARY KEY (`LeaveType`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `fk1` (`adminid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `departmenttrigger`
--
ALTER TABLE `departmenttrigger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbldepartments`
--
ALTER TABLE `tbldepartments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblemployees`
--
ALTER TABLE `tblemployees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblleaves`
--
ALTER TABLE `tblleaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tblleavetype`
--
ALTER TABLE `tblleavetype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbldepartments`
--
ALTER TABLE `tbldepartments`
  ADD CONSTRAINT `fk4` FOREIGN KEY (`adminid`) REFERENCES `admin` (`id`);

--
-- Constraints for table `tblemployees`
--
ALTER TABLE `tblemployees`
  ADD CONSTRAINT `fk3` FOREIGN KEY (`adminid`) REFERENCES `admin` (`id`),
  ADD CONSTRAINT `fk7` FOREIGN KEY (`Department`) REFERENCES `tbldepartments` (`DepartmentName`);

--
-- Constraints for table `tblleaves`
--
ALTER TABLE `tblleaves`
  ADD CONSTRAINT `fk2` FOREIGN KEY (`adminid`) REFERENCES `admin` (`id`),
  ADD CONSTRAINT `fk6` FOREIGN KEY (`LeaveType`) REFERENCES `tblleavetype` (`LeaveType`);

--
-- Constraints for table `tblleavetype`
--
ALTER TABLE `tblleavetype`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`adminid`) REFERENCES `admin` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
