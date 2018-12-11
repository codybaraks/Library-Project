-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 11, 2018 at 11:29 AM
-- Server version: 10.0.36-MariaDB-0ubuntu0.16.04.1
-- PHP Version: 7.0.32-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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

CREATE TABLE `books` (
  `book_id` int(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `book_no` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `title`, `author`, `category`, `book_no`) VALUES
(1, 'adventure In 10 Easy Steps', 'jimmy', 'Adventure', 'B/001'),
(2, ' Easy To Understand adventure', 'tommy', 'Adventure', 'B/002'),
(3, 'adventure For Business', 'james', 'Adventure', 'B/003'),
(4, 'The Myth Of adventure', 'kenny', 'Adventure', 'b/004'),
(5, 'The Help" ', 'Kathryn Stockett', 'political', 'B/005'),
(6, 'Night', 'Elie Wiesel', 'Adventure', 'B/006'),
(7, 'Romeo and Juliet', 'WIlliam shakespeare', 'Adventure', 'B/007'),
(8, 'A Christmas Carol', 'charlse Dikens', 'political', 'B/008'),
(9, 'Why You Need To adventure', 'jenny', 'History', 'B/009'),
(10, 'The man', 'Bram stoker', 'History', 'B/010'),
(11, 'toys of peace', 'Hector', 'political', 'B/011'),
(12, 'Beasts and super Beats', 'charles Darwin', 'History', 'B/012'),
(13, 'The prince', 'niccolo', 'political', 'B/013'),
(14, 'The Arts of war', 'Sun Tzu', 'History', 'B/014'),
(15, 'Don Quixote', 'Miguel', 'History', 'B/015'),
(16, 'Uncle Tom\'s Cabin', 'Harriet Beecher', 'History', 'B/016'),
(17, 'Das Kapital', 'Karl max', 'History', 'B/017'),
(18, 'The Analects', 'Confucius', 'History', 'B/018'),
(157, 'Everything I Never Told You', 'Celeste Ng', 'History', 'B/019');

-- --------------------------------------------------------

--
-- Table structure for table `borrowers`
--

CREATE TABLE `borrowers` (
  `bid` int(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `borrowers`
--

INSERT INTO `borrowers` (`bid`, `name`, `email`, `phone`) VALUES
(4, 'ness', 'ness@gmail.com', 731289327),
(5, 'gegy', 'gegy@gmail.com', 97834290),
(6, 'joseph B', 'jose@yahoo.com', 876352),
(7, 'lenny', 'Lenny@gmail.com', 96384593),
(9, 'kinot', 'konot@gmail.com', 564748),
(10, 'larry page', 'page@yahoo.com', 96345);

-- --------------------------------------------------------

--
-- Table structure for table `charges`
--

CREATE TABLE `charges` (
  `cid` int(50) NOT NULL,
  `date_charged` date NOT NULL,
  `amount` int(100) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'Not paid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `trans_id` int(50) NOT NULL,
  `borrow_id` int(100) NOT NULL,
  `d_borowed` date NOT NULL,
  `d_returned` date DEFAULT NULL,
  `expect_return_d` date NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'Not Returned',
  `book_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`trans_id`, `borrow_id`, `d_borowed`, `d_returned`, `expect_return_d`, `status`, `book_id`) VALUES
(1, 1, '2018-12-10', NULL, '2018-12-15', 'Not Returned', 1),
(2, 64, '2018-12-10', NULL, '2018-12-15', 'Not Returned', 41),
(3, 89, '2018-12-10', NULL, '2018-12-15', 'Not Returned', 0),
(4, 10, '2018-12-11', NULL, '2018-12-16', 'Not Returned', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `role`) VALUES
(3, 'kom', 'kom@gmail.com', '42424', 'Normal'),
(4, 'earvin', 'earvinbaraka@gmail.com', 'earvinbaraka@gmail.com', 'Normal'),
(5, 'Larry', 'larry@yahoo.com', '57575757', 'Normal'),
(7, 'peter', 'r@gmail.com', '3421424', 'Normal'),
(8, 'Larry', 'l@yahoo.com', '44424', 'Normal'),
(11, 'jhdjsdjhd', 'fgaadgdag@gmail.com', '4234242', 'Normal'),
(12, 'asc', 'asc@gmail.com', '42424', 'Admin'),
(13, 'benson', 'benson@gmail.com', '745634', 'Normal'),
(15, 'hen', 'hene@gmail.com', '646', 'Normal'),
(17, 'hdhd', 't@yahoo.com', '5353', 'Admin'),
(19, 'ken', 'tre@gmail.com', '5353', 'Normal'),
(21, 'benad', 'benad@yahoo.com', '42424', 'Normal');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`),
  ADD UNIQUE KEY `book_number` (`book_no`);

--
-- Indexes for table `borrowers`
--
ALTER TABLE `borrowers`
  ADD PRIMARY KEY (`bid`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `phone_2` (`phone`);

--
-- Indexes for table `charges`
--
ALTER TABLE `charges`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`trans_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;
--
-- AUTO_INCREMENT for table `borrowers`
--
ALTER TABLE `borrowers`
  MODIFY `bid` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `charges`
--
ALTER TABLE `charges`
  MODIFY `cid` int(50) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `trans_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
