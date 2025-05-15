-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2025 at 06:58 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smart_canteen`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `station` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `station`, `created_at`) VALUES
(1, 'Main Course', 'Station 2', '2025-05-15 11:59:49'),
(2, 'Dessert', 'Station 2', '2025-05-15 12:08:56');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `category` varchar(255) NOT NULL,
  `station` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `name`, `price`, `category`, `station`, `created_at`, `image`) VALUES
(1, 'Burger', 50.00, 'Main Course', 'Station 2', '2025-05-15 12:00:42', 'uploads/1747281642_burger.jpg'),
(2, 'Ice Cream', 25.00, 'Dessert', 'Station 2', '2025-05-15 12:09:54', ''),
(3, 'Ice Cream', 35.00, 'Dessert', 'Station 2', '2025-05-15 12:11:18', 'uploads/1747282278_cream ice.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notif_id` int(11) NOT NULL,
  `admin_username` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `timestamp` datetime DEFAULT current_timestamp(),
  `is_read` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `items` text NOT NULL,
  `products` text NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `status` enum('Pending','Preparing','Completed','Cancelled') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`id`, `email`, `token`, `created_at`) VALUES
(1, 'trishiamae.manabat@gmail.com', 'ab7adb754f1bddbb17f65e171c065535ae7ebb25899d5f7dd342bbe963a051537cd54a5b7abe2374cf07b145e7355db5cdc1', '2025-04-19 14:51:19');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `station` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `station`, `name`, `contact`, `email`, `username`, `password`, `created_at`) VALUES
(1, '', 'Miyaxaki', '09354508020', 'trishiamae.manabat@gmail.com', 'miyazaki26', '$2y$10$2LVFSK3XJG6b6qv/yH2fCO5EJlDR6fp.qfwM4lfySj14h6ig0oMKy', '2025-04-17 05:41:30'),
(2, '', 'Trishia', '09097541389', 'ayizaki2004@gmail.com', 'zaki@gmail.com', '$2y$10$fjuaW3sUbf9L1cX1PRC8MeNA1iEwO/K1UNvagbV9pfOp0Jgi7N.va', '2025-04-17 05:59:15'),
(3, '', 'TrishiaMaee', '09097541389', 'mayi2004@gmail.com', 'mayi26@gmail.com', '$2y$10$CtPzaJUpt2hx49Jg23xYgeqaEx6E1Bg5YQpmtDwNDeJDyVtF3COEG', '2025-04-17 06:07:46'),
(5, '', 'akki', '09123345678', 'aki26@gmail.com', 'akitot20@gmail.com', '$2y$10$F/xFLN4VHBPsoGoj4a7FFeT0FQIG/n5S4cuhNsrm48t5ufjFx.tQi', '2025-04-17 06:52:50'),
(6, 'Station 1', 'Ivsei', '09234445955', 'sei@gmail.com', 'sei06@gmail.com', '$2y$10$1Y3wXeZLqJv8ZuKmLviHuOWZi5g9sir7rqEwbczhFxePrKPh2DF1a', '2025-04-17 13:19:00'),
(7, 'Station 3', 'Jaehyun', '09897654321', 'jee@gmail.com', 'jaee@gmail.com', '$2y$10$Tn4Uy2ONMn2EL3oz/SYTYu.V9IgiBNxVLhawkU0OnfeFl//Wm6J.i', '2025-04-17 15:12:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notif_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notif_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
