-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2026 at 02:46 PM
-- Server version: 10.11.16-MariaDB
-- PHP Version: 8.3.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hatbodol`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(80) NOT NULL,
  `icon` varchar(20) DEFAULT '?'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `icon`) VALUES
(1, 'বই ও নোট', '📚'),
(2, 'পোশাক', '👕'),
(3, 'ইলেকট্রনিক্স', '💻'),
(4, 'হোস্টেল সামগ্রী', '🛏️'),
(5, 'খেলাধুলা', '⚽'),
(6, 'বিনোদন', '🎸'),
(7, 'ব্যাগ ও আনুষঙ্গিক', '🎒'),
(8, 'অন্যান্য', '🧩');

-- --------------------------------------------------------

--
-- Table structure for table `listings`
--

CREATE TABLE `listings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `university_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(160) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `condition_type` enum('নতুন','প্রায় নতুন','ব্যবহৃত') NOT NULL DEFAULT 'ব্যবহৃত',
  `image_path` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(25) DEFAULT NULL,
  `whatsapp` varchar(40) DEFAULT NULL,
  `facebook_url` varchar(255) DEFAULT NULL,
  `location` varchar(120) DEFAULT NULL,
  `status` enum('active','sold','hidden') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `listings`
--

INSERT INTO `listings` (`id`, `user_id`, `category_id`, `university_id`, `title`, `description`, `price`, `condition_type`, `image_path`, `contact_phone`, `whatsapp`, `facebook_url`, `location`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, 'Casual Shirt', 'শার্টটি একদম নতুন, কখনো ব্যবহার করা হয়নি। উন্নত মানের কাপড় দিয়ে তৈরি এবং দেখতে বেশ আকর্ষণীয়। এখনো ট্যাগসহ অক্ষত অবস্থায় রয়েছে। অনলাইনে অর্ডার করেছিলাম, কিন্তু সাইজ ঠিক না হওয়ায় বিক্রি করতে চাচ্ছি।', 499.00, 'নতুন', 'uploads/41e0c66e90303c456835bb0fcee93366.jpg', '01452545565', '01452545565', 'https://www.facebook.com/profile', 'ভদ্রা', 'active', '2026-11-07 09:37:18', '2026-11-18 11:11:12'),
(2, 1, 1, 1, 'Java Book', 'sdacg ciuc cdsicbab', 100.00, 'ব্যবহৃত', 'uploads/eb91b11787f51d1896161c98db180397.jpg', '01452545565', '01715975176', 'https://www.facebook.com/', 'Rajshahi', 'active', '2026-11-07 16:49:33', '2026-11-16 13:11:43'),
(3, 2, 2, 3, 'Apron', 'অ্যাপ্রনটি প্রায় ৩ মাস ব্যবহার করা হয়েছে এবং এখনো ভালো অবস্থায় রয়েছে। কাপড়ের মান ভালো এবং সহজে পরিষ্কার করা যায়। রান্না ও ল্যাবের কাজে ব্যবহার করা হয়েছে। কোনো ছেঁড়া বা বড় ধরনের দাগ নেই। বর্তমানে আর প্রয়োজন না হওয়ায় এটি বিক্রি করতে চাচ্ছি।', 250.00, 'ব্যবহৃত', 'uploads/800b2d8dd9cadef1ea6a5d14fcef4936.jpg', '0142565263', '0142565263', NULL, 'Rajshahi', 'active', '2026-11-13 04:50:05', '2026-11-18 11:18:51'),
(4, 3, 3, 2, 'Calculator CSIRO', 'ক্যালকুলেটরটি প্রায় ৬ মাস ব্যবহার করা হয়েছে এবং এখনো বেশ ভালো অবস্থায় রয়েছে। সব বাটন ঠিকভাবে কাজ করে এবং হিসাব করতে কোনো সমস্যা হয় না। দেখতে প্রায় নতুনের মতো, কোনো দৃশ্যমান ক্ষতি নেই। নতুন সায়েন্টিফিক ক্যালকুলেটর কেনার জন্য এটি বিক্রি করতে চাচ্ছি।', 700.00, 'ব্যবহৃত', 'uploads/5bab7bce7748f2c82443e4418a0588db.jpg', '01452545565', '01452545565', 'https://www.facebook.com/profile', 'দেবিশিংপাড়া, ভদ্রা', 'active', '2026-11-18 10:46:42', '2026-11-18 10:46:42'),
(5, 3, 6, 3, 'Guitar', 'গিটারটি প্রায় ৮ মাস ব্যবহার করা হয়েছে এবং এখনো বেশ ভালো অবস্থায় রয়েছে। সবগুলো স্ট্রিং ঠিকভাবে কাজ করে এবং সাউন্ড কোয়ালিটিও ভালো। নিয়মিত যত্ন নেওয়ার কারণে গিটারে তেমন কোনো দাগ বা ক্ষতি নেই। বর্তমানে সময়ের অভাবে আর বাজানো হয় না, তাই বিক্রি করতে চাচ্ছি।', 8500.00, 'ব্যবহৃত', 'uploads/56d3903b2e87e6a1cf844858d713963d.jpg', '01452545565', '01452545565', 'https://www.facebook.com/profile', 'দেবিশিংপাড়া, ভদ্রা', 'active', '2026-11-18 10:48:57', '2026-11-18 10:48:57'),
(6, 4, 3, 4, 'Arduino', 'Arduino বোর্ডটি প্রায় ১ মাস ব্যবহার করা হয়েছে এবং এখনো ভালো অবস্থায় রয়েছে। সব পিন ও কম্পোনেন্ট ঠিকভাবে কাজ করে। বিভিন্ন ইলেকট্রনিক্স ও প্রোগ্রামিং প্রজেক্টে ব্যবহার করা হয়েছে। কোনো ধরনের সমস্যা নেই এবং বোর্ডটি সচল রয়েছে। বর্তমানে নতুন প্রজেক্টে কাজ করার জন্য এটি বিক্রি করতে চাচ্ছি।', 550.00, 'প্রায় নতুন', 'uploads/0da7026b39bb181f4035d129607ce1a9.png', '01452545565', '01452545565', 'https://www.facebook.com/profile', 'ভদ্রা', 'active', '2026-11-18 10:50:40', '2026-11-18 10:50:40'),
(7, 4, 5, 6, 'Bat', 'ব্যাটটি প্রায় ৬ মাস ব্যবহার করা হয়েছে এবং এখনো ভালো অবস্থায় রয়েছে। ব্যাটের গ্রিপ ও হ্যান্ডেল বেশ মজবুত। নিয়মিত ক্রিকেট খেলার জন্য ব্যবহার করা হয়েছে। ব্যাটে তেমন কোনো ফাটল বা বড় ধরনের ক্ষতি নেই। বর্তমানে খেলার সময় কমে যাওয়ায় এটি বিক্রি করতে চাচ্ছি।', 999.00, 'ব্যবহৃত', 'uploads/9b3885c72fb86c8c8a0fd8fd3e3c7b09.jpg', '01452545565', '01452545565', 'https://www.facebook.com/profile', 'ভদ্রা', 'active', '2026-11-18 10:52:01', '2026-11-18 10:52:01'),
(8, 4, 1, 5, 'Database Management Systems', 'বইটি প্রায় ১ বছর ব্যবহার করা হয়েছে এবং এখনো ভালো অবস্থায় রয়েছে। সব পৃষ্ঠা অক্ষত আছে এবং কোনো পৃষ্ঠা ছেঁড়া বা হারিয়ে যায়নি। DBMS কোর্সের পড়াশোনার জন্য ব্যবহার করা হয়েছে। বইটিতে কিছু গুরুত্বপূর্ণ জায়গায় পেন্সিল দিয়ে দাগানো আছে। কোর্স শেষ হওয়ায় আর প্রয়োজন নেই, তাই বিক্রি করতে চাচ্ছি।', 150.00, 'ব্যবহৃত', 'uploads/46950d39135c0e59b760a48cbf276eda.jpg', '01452545565', '01452545565', 'https://www.facebook.com/profile', 'ভদ্রা', 'active', '2026-11-18 10:58:10', '2026-11-18 11:16:55'),
(9, 3, 8, 1, 'ME with Panjabi', 'পাঞ্জাবিটি মাত্র ২ বার ব্যবহার করা হয়েছে এবং এখনো প্রায় নতুনের মতো রয়েছে। কাপড়ের মান ভালো এবং রং একদম ঠিক আছে। কোনো দাগ, ছেঁড়া বা সেলাইয়ের সমস্যা নেই। বিশেষ অনুষ্ঠানে পরার জন্য কেনা হয়েছিল। বর্তমানে ব্যবহার না হওয়ায় এটি বিক্রি করতে চাচ্ছি।', 2.00, 'প্রায় নতুন', 'uploads/b160df2ea9aa596b27e3fe7461aed264.jpg', '01452545565', '01452545565', 'https://www.facebook.com/profile', 'দেবিশিংপাড়া, ভদ্রা', 'active', '2026-11-18 11:08:59', '2026-11-18 11:08:59'),
(10, 1, 3, 1, 'HP Laptop 15', 'HP Laptop 15 | 2025 Model | 15.6″ FHD Display Laptop ( I5-1334U, 8GB, 512GB SSD, Intel, W11 )\r\nIntel® Core™ i5-1334U (up to 4.6 GHz with Intel® Turbo Boost Technology, 12 MB L3 cache, 10 cores, 12 threads) Processor\r\n8 GB DDR4-3200 MT/s RAM\r\n512 GB SSD Hard Drive\r\nIntel® Iris® Xᶱ Graphics\r\n15.6″ diagonal, FHD (1920 x 1080), micro-edge, anti-glare, 250 nits, 45% NTSC Display\r\nWindows 11 Home', 90000.00, 'প্রায় নতুন', 'uploads/70c53a172574ee4d9e28dbfb23de149c.jpg', '01452545565', '01452545565', 'https://www.facebook.com/profile', 'Rajshahi', 'active', '2026-11-18 11:15:04', '2026-11-18 11:15:04');

-- --------------------------------------------------------

--
-- Table structure for table `universities`
--

CREATE TABLE `universities` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(180) NOT NULL,
  `short_name` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `universities`
--

INSERT INTO `universities` (`id`, `name`, `short_name`, `created_at`) VALUES
(1, 'বরেন্দ্র বিশ্ববিদ্যালয়', 'VU', '2026-11-07 09:29:23'),
(2, 'রাজশাহী বিশ্ববিদ্যালয়', 'RU', '2026-11-07 09:29:23'),
(3, 'রাজশাহী প্রকৌশল ও প্রযুক্তি বিশ্ববিদ্যালয়', 'RUET', '2026-11-07 09:29:23'),
(4, 'ঢাকা বিশ্ববিদ্যালয়', 'DU', '2026-11-07 09:29:23'),
(5, 'বাংলাদেশ প্রকৌশল বিশ্ববিদ্যালয়', 'BUET', '2026-11-07 09:29:23'),
(6, 'খুলনা প্রকৌশল ও প্রযুক্তি বিশ্ববিদ্যালয়', 'KUET', '2026-11-07 09:29:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(190) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `university_id` int(10) UNSIGNED DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `role` enum('admin','user') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password_hash`, `university_id`, `phone`, `created_at`, `role`) VALUES
(1, 'Sami', 'abidsamicr@gmail.com', '$2y$10$2dEmW1liBd51x6i0Ji2cB.UjU5waegteCYlyk6P8bECaiVcAZaZWO', 1, NULL, '2026-11-07 09:36:23', 'admin'),
(2, 'Ragib Hasan', 'abid@gmail.com', '$2y$10$pZgtti6s2B/.j/apkDE7OOiibANEmLwIm1SXm6et0J6e3XYzBt3x.', 4, NULL, '2026-11-13 04:48:49', 'user'),
(3, 'Soma', 'soma@gmail.com', '$2y$10$xjca1pjRQo60vbx.64Ud6.QeJFkhRQMDM6OHnMnsOiOssOevLJcui', 1, NULL, '2026-11-18 10:40:30', 'user'),
(4, 'Rabbi', 'rabbi@gmail.com', '$2y$10$2TTCe9FKkZoqDi9ZXikT3O5XbVTvUhmK4QvFWg3UqitmGu02FRfCO', 4, NULL, '2026-11-18 10:49:31', 'user'),
(5, 'Sami', 'sami@gmail.com', '$2y$10$C/bWDmqB8x6AtKmIXIM/OuKBWv/4fAmWVNx8LdRDQ7PS5.Qf96icy', 1, '01715975176', '2026-11-18 11:27:21', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `listings`
--
ALTER TABLE `listings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_listing_search` (`status`,`category_id`,`university_id`,`created_at`),
  ADD KEY `idx_listing_title` (`title`),
  ADD KEY `fk_listing_user` (`user_id`),
  ADD KEY `fk_listing_category` (`category_id`),
  ADD KEY `fk_listing_university` (`university_id`);

--
-- Indexes for table `universities`
--
ALTER TABLE `universities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_users_university` (`university_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `listings`
--
ALTER TABLE `listings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `universities`
--
ALTER TABLE `universities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `listings`
--
ALTER TABLE `listings`
  ADD CONSTRAINT `fk_listing_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `fk_listing_university` FOREIGN KEY (`university_id`) REFERENCES `universities` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_listing_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_university` FOREIGN KEY (`university_id`) REFERENCES `universities` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
