-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 18, 2021 at 05:36 PM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `cat_slug` varchar(200) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `cat_slug`, `description`) VALUES
(3, 'Shawls', 'Shawls', ''),
(4, 'Shirts', 'Shirts', ''),
(5, 'trousers', 'trousers', ''),
(6, 'Kurta', 'Kurta', ''),
(9, 'Dupatta', 'Dupatta', ''),
(10, 'Casual Shirts', 'Casual Shirts', '');

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE `details` (
  `id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_num` int(11) NOT NULL,
  `date` date NOT NULL,
  `location` text NOT NULL,
  `totals` double NOT NULL,
  `status` enum('new','hold','shipped','delivered','closed') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `slug` varchar(200) NOT NULL,
  `price` double NOT NULL,
  `color` varchar(10) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `date_view` date NOT NULL,
  `counter` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category_id`, `description`, `slug`, `price`, `color`, `photo`, `date_view`, `counter`) VALUES
(1, 'product1', 5, '', 'product1', 99, 'white', 'product1_1623363234.jpg', '2021-04-14', 11),
(2, 'product2', 9, 'You can create a pagination part for php for fetching data per window height and may decide a minimum number of content per page for both.', 'product2_slug', 100, '', '', '2021-04-14', 5),
(3, 'milk', 7, '', 'milk', 99, 'white', 'milk.jpg', '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `ID` int(11) NOT NULL,
  `product_ID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `totals` int(11) NOT NULL,
  `sales_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `ID` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `email` varchar(60) NOT NULL,
  `Company_name` varchar(60) NOT NULL,
  `Location` text NOT NULL,
  `status` int(11) NOT NULL,
  `created_on` date NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`ID`, `Name`, `email`, `Company_name`, `Location`, `status`, `created_on`, `Description`) VALUES
(0, '', '', 'xyz\'s company', '123, etc.', 1, '2021-06-05', 'The world\'s most popular and easiest to use icon set just got an upgrade. More icons. More styles'),
(0, 'abc', 'abc@gmail.com', '', 'acb ,123', 0, '2021-06-05', 'Wavesfactory – Strum Guitar Free Download Latest Version. It is full offline installer standalone setup of Wavesfactory – Strum Guitar'),
(2, 'abc', 'abc@gmail.com', '', 'acb ,123', 0, '2021-06-05', 'Wavesfactory – Strum Guitar Free Download Latest Version. It is full offline installer standalone setup of Wavesfactory – Strum Guitar');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(60) NOT NULL,
  `type` int(11) NOT NULL,
  `status` enum('new','active','banned','rejected') NOT NULL,
  `firstname` varchar(15) NOT NULL,
  `lastname` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `contact` varchar(12) NOT NULL,
  `activation_code` int(6) NOT NULL,
  `reset_code` int(6) NOT NULL,
  `photo` varchar(20) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `type`, `status`, `firstname`, `lastname`, `address`, `contact`, `activation_code`, `reset_code`, `photo`, `created_on`) VALUES
(4, 'admin@admin.com', '$2y$10$0SHFfoWzz8WZpdu9Qw//E.tWamILbiNCX7bqhy3od0gvK5.kSJ8N2', 1, 'new', 'A', 'B', 'abc', '+92300300000', 0, 0, 'female.jpg', '2021-05-24 00:00:00'),
(7, 'admin@qw.com', '$2y$10$GRlIeai8EiX7KDpZkW6U/O/dg.8lQi2xp5KhzXBbhmvvxABZTKpOe', 3, 'new', 'q', 'w', '123,abc', '+92300300000', 0, 0, '', '2021-06-05 00:00:00'),
(8, 'admin@gmail.com', '$2y$10$y31CA7Hd.pytcD9w25S9HuCMHSLbxFnt8jj3vvWZOnkKUuer5GbaO', 2, 'new', 'f', 'g', '123,abc', '+92300300000', 0, 0, '', '2021-06-05 00:00:00'),
(30, 'sa@admin.com', '$2y$10$cDbQQJsdscD9zX8gQlorD.LqPaxEmmFLhGk7O5bAwUbq7YTCq07qm', 3, 'new', 'a', 's', 'cba, 321', '03330033033', 0, 0, '', '2021-07-16 00:00:00'),
(32, 'aabb@gmail.com', '$2y$10$.3gaY7RMqqoo2FBioX8gWuArtJhnYkUlbk/UMxT3X.JKpRm3h9sra', 3, 'new', 'aa', 'bb', 'cba, 321', '03330033033', 0, 0, '', '2021-07-16 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `details`
--
ALTER TABLE `details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
