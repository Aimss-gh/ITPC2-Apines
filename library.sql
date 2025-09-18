-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 18, 2025 at 03:11 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `bookID` varchar(25) NOT NULL,
  `title` varchar(25) NOT NULL,
  `author` varchar(50) NOT NULL,
  `category` varchar(25) NOT NULL,
  `publishedYear` int NOT NULL,
  PRIMARY KEY (`bookID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`bookID`, `title`, `author`, `category`, `publishedYear`) VALUES
('1', 'So Its You', 'April Avery', 'Romance', 2023),
('2', 'Harry Potter', 'JK Rowling', 'Fantasy', 2016);

-- --------------------------------------------------------

--
-- Table structure for table `borrow`
--

DROP TABLE IF EXISTS `borrow`;
CREATE TABLE IF NOT EXISTS `borrow` (
  `borrowID` int NOT NULL,
  `bookID` varchar(25) NOT NULL,
  `memberID` int NOT NULL,
  `staffID` int NOT NULL,
  `borrowDate` date NOT NULL,
  KEY `bookID` (`bookID`),
  KEY `memberID` (`memberID`),
  KEY `staffID` (`staffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `borrow`
--

INSERT INTO `borrow` (`borrowID`, `bookID`, `memberID`, `staffID`, `borrowDate`) VALUES
(21, '1', 1001, 111, '2025-04-03'),
(22, '2', 1002, 222, '2025-07-17');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
CREATE TABLE IF NOT EXISTS `members` (
  `memberID` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(25) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  PRIMARY KEY (`memberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`memberID`, `name`, `email`, `mobile`, `address`) VALUES
(1001, 'Aimee Apines', 'apinesaimss@gmail.com', '09452275410', 'Bonifacio St. Arevalo'),
(1002, 'Anki Eliver', 'elianki@gmail.com', '09106911597', 'Villa, Sta. Cruz');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `staffID` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `position` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  PRIMARY KEY (`staffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staffID`, `name`, `position`, `email`, `password`) VALUES
(111, 'Rudolph Sy', 'Librarian', 'symboli@gmail.com', 'emperor'),
(222, 'Clarisse Ong', 'Assistant', 'arisse@gmail.com', 'qtrisse');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `borrow`
--
ALTER TABLE `borrow`
  ADD CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`bookID`) REFERENCES `books` (`bookID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`memberID`) REFERENCES `members` (`memberID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `borrow_ibfk_3` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
