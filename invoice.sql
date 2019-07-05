-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2019 at 06:23 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `invoice`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `phone`, `address`, `email`, `created_at`, `updated_at`) VALUES
(2, 'Nisrina Nadhifah', '0858818171046', 'kebo pedes', 'Nisrina@gmai.com', '2019-04-11 06:07:41', '2019-04-11 06:07:41'),
(3, 'Indah Puji Lestari', '08780987670', 'Cilebut', 'Indah78@gmail.com', '2019-04-22 08:12:12', '2019-04-22 08:56:00');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `customer_id`, `status`, `note`, `total`, `created_at`, `updated_at`) VALUES
(2, 3, 0, NULL, 21000000, '2019-05-06 20:44:37', '2019-05-06 20:45:15'),
(3, 2, 0, NULL, 10500000, '2019-05-14 19:44:08', '2019-05-14 19:44:31'),
(7, 2, 0, NULL, 21000000, '2019-05-19 18:50:58', '2019-05-19 18:51:51'),
(8, 3, 0, NULL, 10500000, '2019-05-19 19:22:26', '2019-05-19 19:22:44'),
(10, 2, 0, NULL, 10500000, '2019-05-21 19:02:38', '2019-05-21 19:02:52'),
(11, 2, 0, NULL, 10500000, '2019-06-18 08:19:36', '2019-06-18 08:19:54');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_details`
--

CREATE TABLE `invoice_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_details`
--

INSERT INTO `invoice_details` (`id`, `invoice_id`, `product_id`, `price`, `qty`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 10500000, 1, '2019-05-06 20:45:00', '2019-05-06 20:45:00'),
(2, 2, 5, 10500000, 1, '2019-05-06 20:45:14', '2019-05-06 20:45:14'),
(3, 3, 3, 10500000, 1, '2019-05-14 19:44:31', '2019-05-14 19:44:31'),
(4, 7, 3, 10500000, 2, '2019-05-19 18:51:13', '2019-05-19 18:51:51'),
(5, 8, 3, 10500000, 1, '2019-05-19 19:22:44', '2019-05-19 19:22:44'),
(6, 10, 3, 10500000, 1, '2019-05-21 19:02:52', '2019-05-21 19:02:52'),
(7, 11, 3, 10500000, 1, '2019-06-18 08:19:53', '2019-06-18 08:19:53');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_03_27_020733_create_customers_table', 2),
(4, '2019_03_27_021211_create_products_table', 2),
(5, '2019_03_27_021321_create_invoices_table', 2),
(6, '2019_04_07_134134_create_invoice_details_table', 2),
(7, '2019_04_09_122743_add_relationships_to_invoices_table', 3),
(8, '2019_04_09_123237_add_relationships_to_invoice_details_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `price`, `stock`, `created_at`, `updated_at`) VALUES
(3, 'Asus Rog Slim', 'Sebuah brand perangkat keras notebook khusus gaming dari ASUS', 10500000, 1, '2019-04-11 04:42:24', '2019-04-30 05:42:37'),
(5, 'Asus Rog Slim', 'Sebuah brand perangkat keras notebook khusus gaming dari ASUS', 10500000, 15, '2019-05-02 01:20:27', '2019-05-02 01:20:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Nisrina Nadhifah', 'Nisrina@gmai.com', NULL, '$2y$10$czTgY2jJJmQppasmjZTjSu/Emq4nL0Pkr0MqGoTE/htAnbf.2msGi', '0z84MOkBGrocuZyPI5GWhgZpbiyqOxV2KWP1wCqtSlSvuVFIAhh3AB29ersr', '2019-05-01 22:42:11', '2019-05-01 22:42:11'),
(4, 'Uning Widiastuti', 'Uning24@gmail.com', NULL, '$2y$10$oNcum.nmpGQUvaM0Xopss.Lzco5m2ubNMyqcpSHyP5pOCOmSDDLym', 'GcpxbiFCXlWha80M5UDy7g40uVGmhEBUwpgOi2bce2WCRHaHXajWlZXP1zB7', '2019-05-03 00:40:25', '2019-05-03 00:40:25'),
(5, 'Hildayah Shintia', 'Hilda20@gmail.com', NULL, '$2y$10$fOzrIg/58DmRObka3Jo/Su/3qvqABVZgwwqoR74qzGrtNylfAKsQa', 'f5tuUxGIdBd3UWeZLXjZEPcz8c9AzEDrEBKlpSGKLksonqz7P9V5yIemArS0', '2019-05-03 00:42:31', '2019-05-03 00:42:31'),
(8, 'Adelia Mulyani', 'Adelia@gmail.com', NULL, '$2y$10$e0J17kOCvyRij7xl1vdjVOTylBLN.f7G55sAj1QoTKKJYcMJ9wKWi', '56EmCqRqvOCwXVz9Ns853cVgaMNaTVlTOfKM5jOosS68iU1s9uf6WDpdhe1m', '2019-05-03 00:48:30', '2019-05-03 00:48:30'),
(9, 'Rista Restiana', 'Rista@gmail.com', NULL, '$2y$10$w7HVdAh9ZvPBvNpPihLWjOlnFGdK/i6gC8F8prRm45JoIK9YJrccG', 'j2dg8tCmzbh1MwBGoC4j5v5zHdgtIzMixGJLignpuGV0ca7sfZ7tJkpi4JSC', '2019-05-03 01:40:32', '2019-05-03 01:40:32'),
(10, 'Husnul Khotimah', 'Husnul11@gmail.com', NULL, '$2y$10$KsbQ.TACQnpwWnh7nXb63.uLPsmSGOfw2ELN7yBsF3kMll8rkP2Um', 'kM1yaBAFkDCu8LXcFYvBsiF5BS9DQTrLbVwoZm3jy524RBTWSRylkHlyvR8M', '2019-05-03 01:41:53', '2019-05-03 01:41:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_details_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_details_product_id_foreign` (`product_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `invoice_details`
--
ALTER TABLE `invoice_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD CONSTRAINT `invoice_details_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoice_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
