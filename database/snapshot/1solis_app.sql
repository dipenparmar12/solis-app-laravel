-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 14, 2022 at 04:03 PM
-- Server version: 8.0.27
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `solis_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `advances`
--

DROP TABLE IF EXISTS `advances`;
CREATE TABLE IF NOT EXISTS `advances` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `amount` int DEFAULT NULL,
  `paid_amount` int DEFAULT '0',
  `date` date NOT NULL,
  `settled` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'advance is paid by salary, or direct cash',
  `emi_info` json DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `advances_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `advances`
--

INSERT INTO `advances` (`id`, `user_id`, `amount`, `paid_amount`, `date`, `settled`, `emi_info`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 3023, 0, '2021-08-10', 0, NULL, 3, NULL, NULL, '2022-03-14 09:03:10', '2022-03-14 09:03:10', NULL),
(2, 3, 4601, 0, '2021-07-18', 1, NULL, 1, NULL, NULL, '2022-03-14 09:03:10', '2022-03-14 09:03:10', NULL),
(3, 3, 10484, 0, '2022-02-22', 0, NULL, 3, NULL, NULL, '2022-03-14 09:03:10', '2022-03-14 09:03:10', NULL),
(4, 4, 7914, 0, '2021-10-03', 1, NULL, 2, NULL, NULL, '2022-03-14 09:03:10', '2022-03-14 09:03:10', NULL),
(5, 4, 17729, 0, '2021-04-09', 0, NULL, 4, NULL, NULL, '2022-03-14 09:03:10', '2022-03-14 09:03:10', NULL),
(6, 4, 5554, 0, '2022-02-07', 0, NULL, 4, NULL, NULL, '2022-03-14 09:03:10', '2022-03-14 09:03:10', NULL),
(7, 5, 12797, 0, '2022-02-27', 0, NULL, 1, NULL, NULL, '2022-03-14 09:03:11', '2022-03-14 09:03:11', NULL),
(8, 5, 16060, 0, '2022-02-10', 0, NULL, 1, NULL, NULL, '2022-03-14 09:03:11', '2022-03-14 09:03:11', NULL),
(9, 5, 18408, 0, '2021-10-13', 0, NULL, 4, NULL, NULL, '2022-03-14 09:03:11', '2022-03-14 09:03:11', NULL),
(10, 6, 3561, 0, '2022-02-28', 0, NULL, 2, NULL, NULL, '2022-03-14 09:03:11', '2022-03-14 09:03:11', NULL),
(11, 6, 9679, 0, '2021-11-30', 1, NULL, 4, NULL, NULL, '2022-03-14 09:03:12', '2022-03-14 09:03:12', NULL),
(12, 6, 20888, 0, '2022-02-08', 0, NULL, 2, NULL, NULL, '2022-03-14 09:03:12', '2022-03-14 09:03:12', NULL),
(13, 7, 3544, 0, '2022-02-27', 1, NULL, 5, NULL, NULL, '2022-03-14 09:03:12', '2022-03-14 09:03:12', NULL),
(14, 7, 9704, 0, '2021-05-27', 1, NULL, 3, NULL, NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', NULL),
(15, 7, 21182, 0, '2021-12-07', 1, NULL, 5, NULL, NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', NULL),
(16, 8, 17553, 0, '2021-03-18', 0, NULL, 3, NULL, NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', NULL),
(17, 8, 14202, 0, '2022-02-22', 1, NULL, 3, NULL, NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', NULL),
(18, 8, 16032, 0, '2021-04-05', 1, NULL, 8, NULL, NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', NULL),
(19, 9, 22463, 0, '2021-07-14', 1, NULL, 9, NULL, NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', NULL),
(20, 9, 13838, 0, '2021-05-30', 0, NULL, 1, NULL, NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', NULL),
(21, 9, 13103, 0, '2021-08-27', 1, NULL, 6, NULL, NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', NULL),
(22, 10, 7729, 0, '2021-08-26', 1, NULL, 10, NULL, NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', NULL),
(23, 10, 18820, 0, '2021-04-27', 1, NULL, 3, NULL, NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', NULL),
(24, 10, 1569, 0, '2021-08-29', 0, NULL, 7, NULL, NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', NULL),
(25, 11, 4283, 0, '2021-06-17', 0, NULL, 4, NULL, NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', NULL),
(26, 11, 23027, 0, '2021-03-30', 0, NULL, 7, NULL, NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', NULL),
(27, 11, 2982, 0, '2021-10-21', 0, NULL, 3, NULL, NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', NULL),
(28, 12, 12654, 0, '2022-01-17', 0, NULL, 4, NULL, NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', NULL),
(29, 12, 22281, 0, '2021-11-29', 1, NULL, 8, NULL, NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', NULL),
(30, 12, 20861, 0, '2021-07-29', 1, NULL, 11, NULL, NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', NULL),
(31, 13, 8270, 0, '2021-09-28', 1, NULL, 10, NULL, NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', NULL),
(32, 13, 18532, 0, '2021-10-23', 1, NULL, 8, NULL, NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', NULL),
(33, 13, 24230, 0, '2021-08-27', 0, NULL, 7, NULL, NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', NULL),
(34, 14, 3066, 0, '2021-03-26', 0, NULL, 14, NULL, NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', NULL),
(35, 14, 1728, 0, '2021-08-21', 1, NULL, 8, NULL, NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', NULL),
(36, 14, 16394, 0, '2021-11-23', 0, NULL, 2, NULL, NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dealers`
--

DROP TABLE IF EXISTS `dealers`;
CREATE TABLE IF NOT EXISTS `dealers` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firm` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `status` int DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dealers`
--

INSERT INTO `dealers` (`id`, `name`, `mobile`, `firm`, `desc`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Sri balaji interiors', '9590687031', 'Bhomaram', 'Bannerughatta, Bengaluru, Karnataka 560083', 1, NULL, NULL, NULL),
(2, 'Vikash interiors', '8197669892', 'Rameshwar', NULL, 1, NULL, NULL, NULL),
(3, 'Dev Traders', '9986401107', 'Chandaram', 'bannerghatta', 1, NULL, NULL, NULL),
(4, 'Vijay Electrician', '7760921073', 'Vijay Electrician', NULL, 1, NULL, NULL, NULL),
(5, 'Arif Pop', '9060124126', 'Arif pop', NULL, 0, NULL, NULL, NULL),
(6, 'Ajit painter', '9742944071', 'Ajit painter', NULL, 1, NULL, NULL, NULL),
(7, 'Rajesh Painter', '8147823412', 'Rajesh painter', NULL, 1, NULL, NULL, NULL),
(8, 'Karthik & Shiva', '9148888845', 'Ekdanta factory', NULL, 1, NULL, NULL, NULL),
(9, 'Aristo vivek', '9606012426', 'K Bros Aristo', NULL, 0, NULL, NULL, NULL),
(10, 'KGP', '9036994544', 'KRISHNA PLYWOOD AND GLASS', 'Hoodi', 1, NULL, NULL, NULL),
(11, 'Dhiraj', '7874746138', 'solis interior', 'B-802 SBC THE NEST, SY#160/4, kannamangala', 1, NULL, NULL, NULL),
(12, 'Dhiraj Vendor', '7874746138', 'parmar', 'B-802 SBC THE NEST, SY#160/4, kannamangala', 1, NULL, NULL, NULL),
(13, 'Jai maa latiyal', '9902277810', 'Hukum singh carpenter', NULL, 0, NULL, NULL, NULL),
(14, 'Salary Account', '7665588566', 'account', NULL, 1, NULL, NULL, NULL),
(15, 'SOLIS INTERIORS', '9409254056', 'Salary Account', 'B-802 SBC THE NEST, SY#160/4, kannamangala', 1, NULL, NULL, NULL),
(16, 'Granite Work', '9636153371', 'Devkaran Granite work', NULL, 1, NULL, NULL, NULL),
(17, 'Painter Work', '9886733904', 'Geeri Painter', NULL, 0, NULL, NULL, NULL),
(18, 'Sofa Work', '9845210859', 'Chndramohan Sofa Work', NULL, 0, NULL, NULL, NULL),
(19, 'Ramesh', '7829224091', 'Krishna Hardware', 'Hoodi', 1, NULL, NULL, NULL),
(20, 'Pintu Krishna Hardware', '7829224091', 'Krishna Electrical', 'hoodi whitfield', 1, NULL, NULL, NULL),
(21, 'Kaluram Carpenter', '987654321', 'Kaluram Carpenter', NULL, 0, NULL, NULL, NULL),
(22, 'Maheshwari Impex', '987654321', 'Maheshwari Impex', NULL, 1, NULL, NULL, NULL),
(23, 'Mr Taj Grill & mosquito mesh', '987654321', 'Taj Grill & mosquito mesh', 'kanamagala road', 1, NULL, NULL, NULL),
(24, 'Sri Nandi Glass & Hardware & ETc', '9342889342', 'Sri Nandi Glass & Hardware & ETc', NULL, 1, NULL, NULL, NULL),
(25, 'N.K (Jyoti Factory)', '9945581775', 'N.k Company', NULL, 1, NULL, NULL, NULL),
(26, 'Bhadra Tarpaulin Industry Floor met', '123456789', 'Bhadra Tarpaulin Industry Floor met', NULL, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `estimates`
--

DROP TABLE IF EXISTS `estimates`;
CREATE TABLE IF NOT EXISTS `estimates` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` bigint UNSIGNED DEFAULT NULL,
  `dealer_id` bigint UNSIGNED DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `s_date` date DEFAULT NULL,
  `e_date` date DEFAULT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `group_id` text COLLATE utf8mb4_unicode_ci,
  `status` int DEFAULT '1',
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estimates_project_id_foreign` (`project_id`),
  KEY `estimates_dealer_id_foreign` (`dealer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `estimates`
--

INSERT INTO `estimates` (`id`, `project_id`, `dealer_id`, `amount`, `s_date`, `e_date`, `desc`, `group_id`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 500, '2022-12-01', '2022-12-12', 'Sri balaji interiors Bhomaram', NULL, 1, NULL, NULL, NULL, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(2, 1, 1, 1000, '2022-12-01', '2022-12-12', 'Vikash interiors Rameshwar', NULL, 1, NULL, NULL, NULL, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(3, 2, 2, 1500, '2022-12-01', '2022-12-12', 'Dev Traders Chandaram', NULL, 1, NULL, NULL, NULL, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(4, 1, 2, 2000, '2022-12-01', '2022-12-12', 'Vijay Electrician Vijay Electrician', NULL, 1, NULL, NULL, NULL, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(5, 3, 3, 2500, '2022-12-01', '2022-12-12', 'Arif Pop Arif pop', NULL, 0, NULL, NULL, NULL, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(6, 4, 3, 3000, '2022-12-01', '2022-12-12', 'Ajit painter Ajit painter', NULL, 1, NULL, NULL, NULL, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(7, 2, 1, 3500, '2022-12-01', '2022-12-12', 'Rajesh Painter Rajesh painter', NULL, 1, NULL, NULL, NULL, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(8, 1, 1, 4000, '2022-12-01', '2022-12-12', 'Karthik & Shiva Ekdanta factory', NULL, 1, NULL, NULL, NULL, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(9, 2, 2, 4500, '2022-12-01', '2022-12-12', 'Aristo vivek K Bros Aristo', NULL, 0, NULL, NULL, NULL, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(10, 1, 2, 5000, '2022-12-01', '2022-12-12', 'KGP KRISHNA PLYWOOD AND GLASS', NULL, 1, NULL, NULL, NULL, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(11, 3, 3, 5500, '2022-12-01', '2022-12-12', 'Dhiraj solis interior', NULL, 1, NULL, NULL, NULL, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(12, 4, 3, 6000, '2022-12-01', '2022-12-12', 'Dhiraj Vendor parmar', NULL, 1, NULL, NULL, NULL, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(13, 2, 1, 6500, '2022-12-01', '2022-12-12', 'Jai maa latiyal Hukum singh carpenter', NULL, 0, NULL, NULL, NULL, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(14, 1, 1, 7000, '2022-12-01', '2022-12-12', 'Salary Account account', NULL, 1, NULL, NULL, NULL, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(15, 2, 2, 7500, '2022-12-01', '2022-12-12', 'SOLIS INTERIORS Salary Account', NULL, 1, NULL, NULL, NULL, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(16, 1, 2, 8000, '2022-12-01', '2022-12-12', 'Granite Work Devkaran Granite work', NULL, 1, NULL, NULL, NULL, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(17, 3, 3, 8500, '2022-12-01', '2022-12-12', 'Painter Work Geeri Painter', NULL, 0, NULL, NULL, NULL, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(18, 4, 3, 9000, '2022-12-01', '2022-12-12', 'Sofa Work Chndramohan Sofa Work', NULL, 0, NULL, NULL, NULL, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(19, 2, 1, 9500, '2022-12-01', '2022-12-12', 'Ramesh Krishna Hardware', NULL, 1, NULL, NULL, NULL, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(20, 1, 1, 10000, '2022-12-01', '2022-12-12', 'Pintu Krishna Hardware Krishna Electrical', NULL, 1, NULL, NULL, NULL, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(21, 2, 2, 10500, '2022-12-01', '2022-12-12', 'Kaluram Carpenter Kaluram Carpenter', NULL, 0, NULL, NULL, NULL, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(22, 1, 2, 11000, '2022-12-01', '2022-12-12', 'Maheshwari Impex Maheshwari Impex', NULL, 1, NULL, NULL, NULL, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(23, 3, 3, 11500, '2022-12-01', '2022-12-12', 'Mr Taj Grill & mosquito mesh Taj Grill & mosquito mesh', NULL, 1, NULL, NULL, NULL, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(24, 4, 3, 12000, '2022-12-01', '2022-12-12', 'Sri Nandi Glass & Hardware & ETc Sri Nandi Glass & Hardware & ETc', NULL, 1, NULL, NULL, NULL, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(25, 2, 1, 12500, '2022-12-01', '2022-12-12', 'N.K (Jyoti Factory) N.k Company', NULL, 1, NULL, NULL, NULL, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(26, 1, 1, 13000, '2022-12-01', '2022-12-12', 'Bhadra Tarpaulin Industry Floor met Bhadra Tarpaulin Industry Floor met', NULL, 1, NULL, NULL, NULL, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
CREATE TABLE IF NOT EXISTS `expenses` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `particular` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` bigint NOT NULL DEFAULT '2000',
  `date` date NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `expense_by` bigint DEFAULT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_approved` tinyint(1) DEFAULT NULL,
  `approval_by` bigint UNSIGNED DEFAULT NULL,
  `project_id` bigint UNSIGNED DEFAULT NULL,
  `dealer_id` bigint UNSIGNED DEFAULT NULL,
  `transaction_id` bigint UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `created_by_origin` int UNSIGNED DEFAULT NULL,
  `status` int DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expenses_approval_by_foreign` (`approval_by`),
  KEY `expenses_project_id_foreign` (`project_id`),
  KEY `expenses_dealer_id_foreign` (`dealer_id`),
  KEY `expenses_transaction_id_foreign` (`transaction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `particular`, `amount`, `date`, `desc`, `expense_by`, `category`, `is_approved`, `approval_by`, `project_id`, `dealer_id`, `transaction_id`, `updated_by`, `created_by`, `deleted_by`, `created_by_origin`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Hello ex amount 1000  app', 1000, '2022-03-01', NULL, 1, 'project', 1, NULL, 1, 2, 3, 1, 1, NULL, NULL, 1, NULL, '2022-03-10 10:44:00', NULL),
(2, 'Hello ex amount 9000  app', 9000, '2022-03-01', NULL, 9, 'office', 1, NULL, 2, 9, 1, 1, 6, NULL, NULL, 1, NULL, '2022-03-10 22:44:00', NULL),
(3, 'Hello ex amount 3000  app', 3000, '2022-01-31', NULL, 9, 'project', 1, NULL, 1, 6, 3, 1, 8, NULL, NULL, 1, NULL, '2022-03-10 22:44:00', NULL),
(4, 'Hello ex amount 7000  app', 7000, '2022-01-31', NULL, 3, 'dealer', 1, NULL, NULL, 5, 5, 1, 5, NULL, NULL, 1, NULL, '2022-03-10 10:44:00', NULL),
(5, 'Hello ex amount 3000  app', 3000, '2022-01-31', NULL, 9, 'project', 0, NULL, 3, 1, 4, 1, 8, NULL, NULL, 1, NULL, '2022-03-10 22:44:00', NULL),
(6, 'Hello ex amount 9000  app', 9000, '2022-01-31', NULL, 6, 'dealer', 1, NULL, NULL, 1, 3, 1, 8, NULL, NULL, 1, NULL, '2022-03-10 10:44:00', NULL),
(7, 'Hello ex amount 8000  app', 8000, '2022-02-28', NULL, 10, 'project', 0, NULL, 1, 6, 5, 1, 10, NULL, NULL, 1, NULL, '2022-03-13 04:47:00', NULL),
(8, 'Hello ex amount 10000  app', 10000, '2021-08-28', NULL, 3, 'dealer', 1, NULL, NULL, 3, 5, 1, 6, NULL, NULL, 1, NULL, '2022-03-10 07:35:00', NULL),
(9, 'Hello ex amount 4000  app1', 4000, '2022-03-01', NULL, 10, 'project', NULL, NULL, 3, 5, 3, 1, 8, NULL, NULL, 1, NULL, '2022-03-10 07:35:00', NULL),
(10, 'Hello ex amount 5000  app1', 5000, '2022-03-01', NULL, 6, 'dealer', 1, NULL, NULL, 8, 3, 1, 6, NULL, NULL, 1, NULL, '2022-03-10 07:35:00', NULL),
(11, 'Hello ex amount 10000  app0', 10000, '2022-03-01', NULL, 4, 'project', 0, NULL, 2, 9, 4, 1, 1, NULL, NULL, 1, NULL, '2022-03-13 04:47:00', NULL),
(12, 'Hello ex amount 4000  app0', 4000, '2022-03-01', NULL, 4, 'dealer', 1, NULL, NULL, 3, 1, 1, 10, NULL, NULL, 1, NULL, '2022-03-10 07:34:00', NULL),
(13, 'Hello ex amount 2000  app1', 2000, '2022-01-31', NULL, 3, 'project', NULL, NULL, 4, 7, 5, 1, 5, NULL, NULL, 1, NULL, '2022-03-10 10:36:00', NULL),
(14, 'Hello ex amount 3000  app1', 3000, '2022-01-31', NULL, 4, 'office', NULL, NULL, 4, 9, 1, 1, 3, NULL, NULL, 1, NULL, '2022-03-10 07:34:00', NULL),
(15, 'Hello ex amount 1000  app0', 1000, '2022-01-31', NULL, 4, 'project', NULL, NULL, 4, 4, 5, 1, 10, NULL, NULL, 1, NULL, '2022-03-10 10:36:00', NULL),
(16, 'Hello ex amount 9000  app1', 9000, '2022-01-31', NULL, 7, 'personal', NULL, NULL, 6, 9, 3, 1, 1, NULL, NULL, 1, NULL, '2022-03-10 07:34:00', NULL),
(17, 'Hello ex amount 8000  app0', 8000, '2022-02-28', NULL, 2, 'dealer', 1, NULL, NULL, 4, 5, 1, 3, NULL, NULL, 1, NULL, '2022-03-10 07:31:00', NULL),
(18, 'Hello ex amount 1000  app1', 1000, '2022-02-28', NULL, 3, 'dealer', 1, NULL, NULL, 5, 3, 1, 4, NULL, NULL, 1, NULL, '2022-03-10 10:35:00', NULL),
(19, 'Hello ex amount 6000  app0', 6000, '2022-03-01', NULL, 7, 'project', NULL, NULL, 4, 2, 3, 1, 9, NULL, NULL, 1, NULL, '2022-03-10 10:36:00', NULL),
(20, 'Hello ex amount 1000  app0', 1000, '2022-03-01', NULL, 8, 'dealer', 1, NULL, NULL, 4, 2, 1, 1, NULL, NULL, 1, NULL, '2022-03-10 07:34:00', NULL),
(21, 'Hello ex amount 10000  app0', 10000, '2022-03-01', NULL, 5, 'project', NULL, NULL, 6, 7, 1, 1, 9, NULL, NULL, 1, NULL, '2022-03-10 10:35:00', NULL),
(22, 'Hello ex amount 9000  app1', 9000, '2022-03-01', NULL, 4, 'dealer', 1, NULL, NULL, 6, 3, 1, 10, NULL, NULL, 1, NULL, '2022-03-10 07:34:00', NULL),
(23, 'Hello ex amount 9000  app1', 9000, '2022-03-01', NULL, 7, 'project', NULL, NULL, 4, 5, 1, 1, 8, NULL, NULL, 1, NULL, '2022-03-10 10:36:00', NULL),
(24, 'Hello ex amount 5000  app1', 5000, '2022-01-31', NULL, 10, 'dealer', 1, NULL, NULL, 2, 4, 1, 6, NULL, NULL, 1, NULL, '2022-03-10 07:34:00', NULL),
(25, 'Hello ex amount 4000  app1', 4000, '2022-01-31', NULL, 8, 'project', NULL, NULL, 6, 9, 1, 1, 1, NULL, NULL, 1, NULL, '2022-03-10 10:36:00', NULL),
(26, 'Hello ex amount 4000  app1', 4000, '2022-01-31', NULL, 3, 'office', NULL, NULL, 4, 9, 4, 1, 4, NULL, NULL, 1, NULL, '2022-03-10 10:36:00', NULL),
(27, 'Hello ex amount 2000  app0', 2000, '2022-01-31', NULL, 2, 'project', NULL, NULL, 6, 1, 1, 1, 10, NULL, NULL, 1, NULL, '2022-03-10 10:36:00', NULL),
(28, 'Hello ex amount 5000  app0', 5000, '2022-02-28', NULL, 8, 'personal', NULL, NULL, 6, 5, 1, 1, 8, NULL, NULL, 1, NULL, '2022-03-10 07:35:00', NULL),
(29, 'Hello ex amount 9000  app0', 9000, '2022-02-28', NULL, 1, 'project', NULL, NULL, 6, 5, 2, 1, 9, NULL, NULL, 1, NULL, '2022-03-10 07:35:00', NULL),
(30, 'Dicta consequatur b', 5000, '2022-03-07', 'Expedita voluptatem', 1, 'project', 1, NULL, NULL, 2, 2, 1, 1, NULL, NULL, 1, '2022-03-10 07:49:00', '2022-03-10 10:35:00', NULL),
(31, 'Dicta consequatur b', 8000, '2022-03-07', 'Expedita voluptatem', 1, 'dealer', 1, NULL, NULL, 3, 2, 1, 1, NULL, NULL, 1, '2022-03-10 07:49:00', '2022-03-10 10:35:00', NULL),
(32, 'Dicta consequatur b', 10000, '2022-03-07', 'Expedita voluptatem', 1, 'dealer', 1, NULL, NULL, 4, 2, 1, 1, NULL, NULL, 1, '2022-03-10 07:49:00', '2022-03-10 10:35:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `funds`
--

DROP TABLE IF EXISTS `funds`;
CREATE TABLE IF NOT EXISTS `funds` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `date` datetime NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `transaction_id` bigint UNSIGNED DEFAULT NULL,
  `project_id` bigint UNSIGNED DEFAULT NULL,
  `pic` text COLLATE utf8mb4_unicode_ci,
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `status` int DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `funds_user_id_foreign` (`user_id`),
  KEY `funds_transaction_id_foreign` (`transaction_id`),
  KEY `funds_project_id_foreign` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=588 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `funds`
--

INSERT INTO `funds` (`id`, `amount`, `date`, `user_id`, `transaction_id`, `project_id`, `pic`, `created_by`, `updated_by`, `deleted_by`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 10409, '2022-01-24 02:54:23', 2, 5, 11, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(2, 9248, '2021-12-05 06:25:43', 1, 10, 10, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(3, 5572, '2022-02-19 17:49:02', 7, 1, 38, NULL, 1, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(4, 5194, '2022-01-25 06:26:19', 4, 4, NULL, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(5, 8315, '2021-12-16 10:18:20', 5, 3, NULL, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(6, 11105, '2022-02-15 06:19:05', 9, 3, NULL, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(7, 12201, '2022-02-28 22:22:13', 13, 10, 20, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(8, 5712, '2022-03-10 15:19:10', 12, 8, NULL, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(9, 6340, '2022-01-04 14:23:55', 6, 8, NULL, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(10, 4795, '2021-12-18 09:11:13', 12, 10, 19, NULL, 5, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(11, 13780, '2022-01-28 20:50:21', 3, 9, 33, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(12, 7336, '2022-03-06 22:54:12', 14, 8, 25, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(13, 10425, '2022-02-09 13:08:29', 11, 8, 24, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(14, 7255, '2021-11-15 21:34:26', 2, 9, 31, NULL, 12, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(15, 10504, '2022-01-09 18:00:10', 13, 8, NULL, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(16, 4730, '2021-11-25 06:52:56', 13, 6, NULL, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(17, 7855, '2021-10-31 01:43:07', 12, 10, 20, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(18, 8955, '2021-11-06 12:45:30', 12, 6, NULL, NULL, 1, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(19, 5510, '2021-12-18 17:41:25', 13, 3, 33, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(20, 8379, '2021-09-25 05:19:33', 2, 4, NULL, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(21, 7373, '2022-02-18 14:57:31', 10, 4, 18, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(22, 12137, '2021-09-23 05:51:36', 8, 7, 46, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(23, 10250, '2022-01-10 05:18:26', 9, 9, 27, NULL, 14, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(24, 9166, '2021-10-04 19:38:57', 4, 8, 23, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(25, 9247, '2021-09-21 10:17:57', 4, 4, NULL, NULL, 1, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(26, 6675, '2022-02-28 08:11:45', 7, 5, NULL, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(27, 14512, '2021-11-09 17:03:19', 5, 10, 10, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(28, 10898, '2022-02-15 01:44:37', 13, 8, NULL, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(29, 14740, '2021-09-24 23:29:14', 3, 1, 26, NULL, 5, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(30, 14938, '2021-09-22 01:50:58', 12, 3, 41, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(31, 14551, '2021-11-18 19:07:47', 4, 10, 50, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(32, 13421, '2021-11-29 12:32:56', 2, 7, NULL, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(33, 5609, '2022-01-15 15:19:39', 9, 8, 22, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(34, 7380, '2021-09-22 23:36:23', 10, 8, 18, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(35, 8869, '2022-01-11 08:01:23', 10, 2, 5, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(36, 12909, '2021-09-16 18:42:39', 13, 8, 34, NULL, 14, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(37, 12534, '2021-10-24 17:00:10', 6, 10, NULL, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(38, 4864, '2022-02-26 03:16:37', 14, 2, NULL, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(39, 9608, '2021-11-24 13:24:21', 2, 3, NULL, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(40, 8897, '2021-11-05 10:08:45', 7, 8, 35, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(41, 14288, '2022-01-23 19:25:16', 12, 6, 10, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(42, 9667, '2022-03-04 09:09:08', 1, 1, 46, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(43, 13211, '2021-10-17 07:04:21', 2, 2, 5, NULL, 14, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(44, 12894, '2022-01-25 18:01:41', 4, 5, NULL, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(45, 11157, '2022-03-08 00:59:53', 1, 5, 7, NULL, 14, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(46, 9843, '2021-09-27 22:46:56', 1, 3, NULL, NULL, 1, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(47, 12615, '2021-10-31 05:09:21', 11, 5, 6, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(48, 10259, '2021-12-29 14:56:22', 11, 7, 8, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(49, 5649, '2021-12-09 07:02:49', 5, 7, 16, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(50, 13152, '2021-12-14 01:57:01', 10, 1, NULL, NULL, 5, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(51, 10039, '2021-12-15 00:20:33', 8, 10, NULL, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(52, 10003, '2021-09-28 00:47:33', 9, 2, 40, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(53, 6504, '2022-02-13 04:50:32', 5, 4, NULL, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(54, 5585, '2021-11-12 21:14:18', 7, 1, 23, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(55, 9504, '2021-10-31 13:30:36', 2, 5, 33, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(56, 4751, '2021-12-13 14:58:10', 1, 9, 38, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(57, 5725, '2022-01-13 03:41:42', 3, 9, 6, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(58, 5285, '2021-12-29 10:16:14', 5, 7, 35, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(59, 7881, '2021-09-24 03:21:22', 4, 2, NULL, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(60, 11029, '2022-02-27 13:07:31', 2, 9, 41, NULL, 14, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(61, 12233, '2022-02-25 13:58:33', 9, 3, NULL, NULL, 5, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(62, 11956, '2021-10-04 01:25:15', 8, 3, NULL, NULL, 1, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(63, 12025, '2022-02-09 18:13:44', 3, 7, 30, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(64, 14369, '2022-02-22 11:10:54', 6, 5, 47, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(65, 14186, '2021-10-26 06:36:57', 11, 4, 47, NULL, 5, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(66, 13614, '2021-10-26 08:44:19', 14, 1, NULL, NULL, 5, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(67, 10437, '2021-11-26 19:47:24', 12, 3, NULL, NULL, 5, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(68, 13774, '2021-10-14 15:03:53', 10, 1, 14, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(69, 7267, '2021-12-28 07:55:06', 5, 3, NULL, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(70, 10894, '2022-03-02 03:49:36', 9, 9, NULL, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(71, 12408, '2022-02-10 17:48:47', 11, 4, 25, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(72, 8546, '2021-12-27 21:44:59', 1, 3, NULL, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(73, 12748, '2021-12-06 03:41:39', 4, 3, 15, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(74, 7268, '2021-11-15 00:55:45', 10, 4, 29, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(75, 6197, '2021-11-22 23:21:41', 2, 3, NULL, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(76, 11512, '2021-11-05 19:32:37', 6, 9, NULL, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(77, 14124, '2022-01-19 04:07:40', 10, 3, 13, NULL, 14, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(78, 14651, '2021-11-29 18:04:13', 10, 6, 49, NULL, 14, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(79, 5099, '2022-01-09 18:07:07', 4, 8, NULL, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(80, 10335, '2021-11-04 06:50:47', 1, 8, 26, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(81, 10353, '2021-10-12 19:49:56', 7, 6, NULL, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(82, 8325, '2021-10-12 20:08:41', 5, 4, 12, NULL, 14, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(83, 13210, '2022-03-12 18:54:14', 6, 3, NULL, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(84, 10749, '2021-12-13 07:26:31', 5, 2, 41, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(85, 10321, '2022-01-02 07:34:21', 5, 7, 29, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(86, 13067, '2021-10-30 03:42:37', 13, 2, 37, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(87, 11121, '2021-12-01 16:12:41', 10, 7, NULL, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(88, 9714, '2022-01-18 12:21:07', 12, 4, NULL, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(89, 10669, '2021-09-21 05:13:35', 14, 5, 11, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(90, 14823, '2021-12-14 03:45:10', 10, 4, NULL, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(91, 5417, '2021-12-25 15:49:19', 7, 3, 1, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(92, 11255, '2021-10-02 10:46:52', 3, 1, NULL, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(93, 14003, '2022-02-04 13:46:19', 7, 5, NULL, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(94, 10187, '2022-02-05 08:58:25', 1, 9, 35, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(95, 8152, '2021-10-19 08:20:35', 2, 5, NULL, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(96, 9066, '2021-11-04 04:53:59', 10, 2, 4, NULL, 12, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(97, 12814, '2022-01-30 07:10:00', 5, 9, NULL, NULL, 1, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(98, 7498, '2022-02-25 06:36:05', 12, 2, 30, NULL, 14, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(99, 12547, '2021-10-19 00:09:07', 4, 8, NULL, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(100, 14416, '2022-02-27 01:52:11', 5, 7, 21, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:19', '2022-03-14 09:03:19'),
(101, 13657, '2021-12-05 09:10:46', 2, 3, 19, NULL, 14, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(102, 6645, '2021-10-15 09:11:13', 1, 3, 34, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(103, 9713, '2022-03-03 01:32:12', 1, 4, 31, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(104, 8324, '2022-02-12 06:37:07', 12, 6, NULL, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(105, 14755, '2021-11-02 01:17:22', 7, 6, NULL, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(106, 9134, '2022-02-04 01:43:23', 7, 2, 13, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(107, 7187, '2022-03-10 10:34:21', 12, 6, 4, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(108, 7153, '2021-12-03 08:06:20', 14, 2, NULL, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(109, 14338, '2022-01-28 18:11:50', 13, 2, NULL, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(110, 10528, '2022-01-28 12:39:04', 8, 5, NULL, NULL, 5, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(111, 5132, '2022-01-17 04:00:28', 10, 2, NULL, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(112, 5273, '2021-11-09 07:06:46', 3, 10, 25, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(113, 7812, '2021-12-26 02:11:48', 1, 2, NULL, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(114, 7071, '2022-01-28 01:59:14', 12, 4, NULL, NULL, 14, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(115, 11576, '2021-11-26 02:34:48', 8, 8, 10, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(116, 5190, '2021-11-09 13:19:57', 1, 6, 15, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(117, 4568, '2021-09-27 10:54:35', 11, 5, 14, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(118, 12382, '2021-09-25 23:15:49', 7, 4, NULL, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(119, 7031, '2021-10-24 09:57:26', 6, 4, NULL, NULL, 12, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(120, 6058, '2021-12-19 06:42:20', 14, 8, 41, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(121, 8869, '2021-11-13 21:36:36', 14, 10, 41, NULL, 1, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(122, 13794, '2021-09-20 11:21:32', 10, 9, NULL, NULL, 14, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(123, 7878, '2021-10-11 07:18:32', 14, 5, 47, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(124, 14233, '2022-02-01 18:45:32', 13, 7, NULL, NULL, 1, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(125, 11909, '2022-01-14 17:46:40', 13, 10, 25, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(126, 12038, '2021-11-03 11:03:47', 11, 1, 6, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(127, 7532, '2021-10-19 02:48:55', 4, 4, NULL, NULL, 12, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(128, 9808, '2022-03-05 06:12:39', 14, 3, 39, NULL, 5, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(129, 11363, '2021-10-12 05:52:09', 6, 5, 30, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(130, 7400, '2021-10-18 17:26:40', 7, 1, NULL, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(131, 9695, '2022-02-22 02:44:48', 4, 6, NULL, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(132, 6675, '2022-03-05 19:52:20', 6, 8, 5, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(133, 7119, '2021-12-16 01:07:43', 10, 3, NULL, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(134, 8528, '2021-10-13 18:19:37', 4, 9, 22, NULL, 5, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(135, 12011, '2022-02-20 13:02:42', 14, 6, NULL, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(136, 9517, '2022-01-08 19:29:45', 4, 6, NULL, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(137, 8312, '2021-10-18 10:56:19', 13, 1, 10, NULL, 12, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(138, 14547, '2022-01-01 05:02:26', 8, 1, NULL, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(139, 11194, '2022-03-10 05:05:13', 7, 7, 47, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(140, 6495, '2021-11-15 02:31:58', 1, 3, 27, NULL, 14, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(141, 14876, '2021-10-17 04:38:15', 10, 1, NULL, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(142, 8736, '2022-02-23 06:33:11', 8, 3, 23, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(143, 7704, '2021-11-06 05:56:26', 4, 1, NULL, NULL, 5, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(144, 6450, '2022-03-10 09:37:17', 10, 10, 5, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(145, 13038, '2022-01-22 03:32:06', 10, 7, NULL, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(146, 10725, '2022-01-05 16:53:22', 12, 2, 9, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(147, 8859, '2021-11-16 03:37:25', 14, 4, NULL, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(148, 11969, '2022-01-30 13:43:10', 5, 2, NULL, NULL, 1, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(149, 14452, '2022-03-14 06:24:19', 13, 9, NULL, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(150, 12257, '2021-12-19 03:44:25', 4, 1, NULL, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(151, 4560, '2021-10-14 05:36:09', 9, 7, NULL, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(152, 11792, '2021-12-20 23:59:03', 2, 8, 39, NULL, 14, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(153, 9442, '2021-11-01 08:34:23', 8, 7, 7, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(154, 12190, '2022-01-16 04:54:17', 13, 6, 50, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(155, 12569, '2022-02-25 21:45:54', 4, 10, NULL, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(156, 7187, '2022-02-27 13:33:42', 5, 8, 16, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(157, 5664, '2022-01-30 06:20:23', 8, 3, 23, NULL, 14, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(158, 5281, '2021-10-11 09:35:16', 5, 9, NULL, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(159, 11593, '2022-03-08 00:37:57', 1, 9, 18, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(160, 14063, '2021-10-22 00:16:07', 1, 2, NULL, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(161, 12323, '2022-02-20 02:56:48', 7, 2, 21, NULL, 12, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(162, 14255, '2022-02-14 10:49:08', 7, 10, 34, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(163, 4698, '2021-09-18 14:04:49', 4, 1, NULL, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(164, 11579, '2021-11-02 14:25:19', 14, 2, 29, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(165, 5369, '2022-01-05 22:00:46', 3, 10, NULL, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(166, 5245, '2021-11-27 12:28:09', 8, 3, NULL, NULL, 12, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(167, 12888, '2022-01-31 09:17:38', 11, 8, 2, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(168, 4559, '2021-12-26 05:43:18', 14, 3, 24, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(169, 6470, '2021-12-22 02:58:03', 14, 2, 42, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(170, 7067, '2022-03-05 00:20:15', 13, 1, 23, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(171, 14036, '2021-12-18 15:57:10', 14, 10, 47, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(172, 6526, '2021-11-10 12:30:19', 3, 7, NULL, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(173, 5609, '2021-12-27 05:41:03', 11, 5, NULL, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(174, 5761, '2021-10-19 17:01:59', 4, 7, 14, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(175, 6065, '2021-10-14 03:31:38', 4, 1, NULL, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(176, 9424, '2021-10-25 15:04:20', 12, 10, NULL, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(177, 14670, '2021-12-24 11:28:59', 1, 6, NULL, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(178, 8464, '2022-01-03 23:36:53', 10, 9, 20, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(179, 5264, '2021-12-18 12:53:33', 14, 9, NULL, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(180, 13102, '2021-11-13 17:13:47', 7, 5, 4, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(181, 12502, '2022-01-15 11:08:31', 8, 1, NULL, NULL, 12, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(182, 11712, '2022-03-06 09:42:06', 10, 6, NULL, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(183, 8834, '2021-11-18 07:38:08', 9, 2, NULL, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(184, 5908, '2021-12-18 13:05:07', 8, 9, NULL, NULL, 12, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(185, 7373, '2022-03-04 13:53:30', 11, 2, NULL, NULL, 12, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(186, 14263, '2021-11-03 22:53:06', 14, 2, 46, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(187, 6345, '2021-12-06 19:48:44', 13, 8, NULL, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(188, 11943, '2021-12-04 11:15:03', 2, 2, NULL, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(189, 10280, '2022-02-19 06:31:42', 7, 4, NULL, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(190, 7468, '2021-11-18 20:14:35', 12, 1, 36, NULL, 14, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(191, 11514, '2021-11-30 21:53:39', 12, 9, NULL, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(192, 9386, '2021-10-07 16:12:12', 3, 7, 5, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(193, 11770, '2022-02-28 03:42:54', 7, 4, NULL, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(194, 10305, '2022-01-24 11:10:50', 6, 2, 18, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(195, 6195, '2022-01-19 10:10:19', 8, 3, 21, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(196, 12348, '2021-12-17 12:05:08', 12, 7, 26, NULL, 1, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(197, 9715, '2022-01-28 22:59:50', 6, 9, 41, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(198, 5354, '2021-10-05 22:04:38', 3, 9, NULL, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(199, 14309, '2022-01-19 06:39:18', 9, 2, NULL, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(200, 7930, '2021-12-13 01:46:13', 4, 6, NULL, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(201, 9759, '2021-12-07 19:39:27', 7, 10, NULL, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(202, 7141, '2022-02-09 01:02:31', 1, 7, NULL, NULL, 1, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(203, 7531, '2021-12-14 20:50:44', 1, 10, NULL, NULL, 1, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(204, 10952, '2021-11-16 08:44:53', 9, 8, NULL, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(205, 5521, '2021-12-31 18:53:34', 13, 8, 10, NULL, 1, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(206, 14563, '2022-02-21 22:09:45', 5, 3, 24, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(207, 10838, '2022-01-19 12:03:11', 7, 2, NULL, NULL, 12, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(208, 10585, '2022-03-12 17:00:50', 1, 5, 22, NULL, 14, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(209, 8461, '2021-09-17 10:31:39', 3, 3, NULL, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(210, 11975, '2022-02-16 07:41:12', 1, 10, 5, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(211, 7062, '2021-11-19 02:16:02', 13, 10, 18, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(212, 4672, '2021-11-26 10:22:45', 13, 5, NULL, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(213, 10657, '2021-10-27 06:02:46', 5, 7, 46, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(214, 13905, '2021-10-30 20:25:48', 13, 8, 16, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(215, 11506, '2021-11-27 01:33:41', 5, 2, 34, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(216, 8983, '2021-09-29 04:17:18', 6, 3, NULL, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(217, 6971, '2021-12-11 10:23:17', 3, 3, 13, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(218, 7649, '2021-12-01 22:14:19', 9, 8, NULL, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(219, 12983, '2021-12-13 03:41:57', 6, 1, 20, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(220, 11808, '2022-02-19 01:21:02', 1, 10, NULL, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(221, 13079, '2022-01-26 16:04:16', 1, 2, NULL, NULL, 1, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(222, 14281, '2021-12-20 17:59:43', 10, 5, NULL, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(223, 13535, '2021-12-14 14:40:04', 2, 7, NULL, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(224, 5869, '2021-12-17 15:48:19', 10, 1, NULL, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(225, 14805, '2021-12-31 19:26:20', 9, 4, NULL, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(226, 14828, '2021-11-26 16:29:21', 14, 10, NULL, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(227, 7410, '2021-11-15 02:47:12', 12, 3, NULL, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(228, 4753, '2021-12-27 08:37:30', 4, 2, 38, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(229, 11000, '2021-10-26 18:10:12', 14, 4, 16, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(230, 7066, '2021-10-31 19:56:35', 3, 6, NULL, NULL, 5, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(231, 5982, '2021-11-29 00:21:59', 10, 10, NULL, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(232, 11578, '2022-01-02 04:55:10', 12, 3, 41, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(233, 6168, '2021-11-16 03:30:33', 8, 1, NULL, NULL, 12, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(234, 6391, '2021-10-13 22:20:48', 6, 5, 23, NULL, 14, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(235, 12927, '2022-01-02 17:43:20', 9, 9, 36, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(236, 11081, '2022-01-27 11:02:14', 9, 6, NULL, NULL, 12, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(237, 5352, '2021-12-11 15:46:28', 12, 10, 13, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(238, 10232, '2022-02-07 18:46:30', 13, 8, NULL, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(239, 7961, '2022-01-04 20:20:25', 4, 9, NULL, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(240, 7949, '2022-02-18 22:03:22', 12, 9, NULL, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(241, 7713, '2022-02-12 07:58:13', 13, 3, NULL, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(242, 8117, '2022-01-09 18:52:12', 10, 5, NULL, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(243, 9087, '2022-01-12 22:26:37', 10, 6, 36, NULL, 5, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(244, 9008, '2022-02-28 16:30:40', 7, 3, NULL, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(245, 5877, '2021-12-04 21:44:23', 4, 9, NULL, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(246, 5664, '2021-09-30 12:21:47', 3, 8, 12, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(247, 13735, '2021-12-06 22:50:51', 7, 9, NULL, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(248, 10666, '2021-12-13 08:16:53', 12, 2, 34, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(249, 12114, '2022-02-09 07:39:17', 7, 5, NULL, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(250, 14498, '2022-02-11 02:49:24', 11, 3, 44, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(251, 4804, '2021-09-16 00:17:37', 8, 3, NULL, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(252, 8221, '2022-02-25 09:44:58', 1, 8, 2, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(253, 13888, '2021-10-21 20:34:56', 8, 3, NULL, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(254, 5822, '2022-01-13 05:32:05', 6, 9, NULL, NULL, 14, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(255, 7870, '2022-02-28 04:12:30', 9, 4, 2, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(256, 6389, '2021-12-24 15:31:41', 14, 5, NULL, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:20', '2022-03-14 09:03:20'),
(257, 14801, '2021-12-20 10:20:22', 12, 2, NULL, NULL, 1, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(258, 14522, '2022-01-31 09:25:27', 8, 3, NULL, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(259, 14281, '2022-01-31 13:17:55', 3, 4, 39, NULL, 14, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(260, 13168, '2021-12-24 00:24:58', 14, 3, NULL, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(261, 10922, '2022-02-13 12:32:37', 5, 10, 24, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(262, 6324, '2021-09-15 15:07:49', 1, 4, 37, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(263, 13761, '2022-02-07 15:27:42', 6, 8, 23, NULL, 12, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(264, 10288, '2021-09-27 19:08:15', 11, 4, NULL, NULL, 12, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(265, 5570, '2022-01-06 13:56:17', 1, 7, 17, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(266, 5272, '2022-01-14 13:58:56', 6, 3, NULL, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(267, 12838, '2021-12-06 06:38:58', 1, 5, NULL, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(268, 12450, '2021-12-15 01:06:37', 12, 9, NULL, NULL, 12, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(269, 5832, '2022-03-13 14:47:11', 4, 7, NULL, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(270, 13102, '2022-01-16 16:32:24', 4, 6, NULL, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(271, 10764, '2021-10-13 12:16:36', 7, 4, NULL, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(272, 13873, '2021-12-21 10:51:27', 12, 3, NULL, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(273, 12733, '2021-12-22 14:27:27', 7, 2, 26, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(274, 7397, '2021-10-13 09:49:17', 7, 2, 15, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(275, 14272, '2021-09-22 13:04:40', 11, 10, 49, NULL, 14, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(276, 14004, '2021-12-29 16:47:21', 7, 10, NULL, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(277, 14132, '2021-12-05 09:01:32', 14, 10, NULL, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(278, 9842, '2021-11-01 08:05:35', 5, 8, 37, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(279, 14698, '2022-02-26 02:01:53', 9, 9, 11, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(280, 6112, '2021-12-05 19:57:28', 13, 10, NULL, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(281, 10709, '2021-12-26 06:11:40', 9, 9, 24, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(282, 14997, '2022-01-25 19:41:24', 3, 10, 9, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(283, 4795, '2021-12-20 21:25:33', 7, 6, 30, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(284, 13556, '2021-11-12 00:14:23', 1, 4, 24, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(285, 4789, '2022-01-13 13:45:22', 7, 1, 39, NULL, 1, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(286, 9506, '2022-02-02 02:42:23', 13, 1, NULL, NULL, 14, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(287, 10319, '2021-10-09 15:20:03', 1, 1, 4, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(288, 11994, '2021-12-20 12:32:54', 7, 4, 10, NULL, 5, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(289, 6543, '2021-11-15 07:57:30', 14, 1, 4, NULL, 5, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(290, 5051, '2021-10-29 19:24:32', 4, 9, 49, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(291, 4566, '2021-10-02 12:34:51', 10, 6, NULL, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(292, 9078, '2021-10-27 05:59:31', 10, 3, NULL, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(293, 8681, '2022-03-07 14:12:17', 11, 8, NULL, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(294, 4565, '2022-02-09 11:45:17', 12, 6, 37, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(295, 14269, '2022-02-08 12:54:46', 5, 8, 41, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(296, 13608, '2021-12-05 04:11:02', 4, 3, NULL, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(297, 9372, '2021-11-10 09:58:46', 3, 5, 37, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(298, 7768, '2021-09-27 01:38:59', 2, 10, 26, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(299, 10450, '2021-10-12 02:44:29', 13, 1, 24, NULL, 12, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(300, 9840, '2022-02-03 12:53:07', 8, 6, NULL, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(301, 12408, '2022-03-11 14:49:38', 7, 7, NULL, NULL, 5, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(302, 10596, '2021-12-04 18:32:13', 11, 2, 28, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(303, 13614, '2021-12-30 21:17:21', 5, 2, 10, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(304, 11424, '2021-09-23 13:18:57', 12, 7, 13, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(305, 7332, '2021-12-10 23:12:23', 12, 2, NULL, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(306, 9813, '2022-02-12 23:22:54', 7, 4, 19, NULL, 12, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(307, 5116, '2021-12-03 10:03:18', 14, 8, 14, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(308, 6006, '2021-12-23 02:26:07', 6, 8, NULL, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(309, 7165, '2022-02-02 01:21:09', 5, 1, 42, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(310, 6103, '2022-02-25 11:06:09', 8, 8, NULL, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(311, 4982, '2021-09-30 12:54:39', 4, 2, 21, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(312, 4698, '2022-02-27 00:15:43', 6, 10, NULL, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(313, 5836, '2022-01-12 00:25:45', 8, 7, 23, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(314, 14329, '2021-12-16 17:45:53', 1, 1, 30, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(315, 13880, '2021-09-29 12:44:57', 9, 5, 9, NULL, 12, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(316, 9435, '2021-11-22 11:57:44', 8, 10, 20, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(317, 6252, '2021-11-29 10:55:43', 14, 7, 24, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(318, 12200, '2021-12-30 03:18:51', 6, 6, NULL, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(319, 7406, '2021-11-23 10:41:42', 12, 6, 32, NULL, 12, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(320, 13231, '2021-10-31 06:15:17', 7, 8, NULL, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(321, 6185, '2021-10-06 04:36:08', 7, 5, NULL, NULL, 12, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(322, 14812, '2021-10-22 03:34:39', 4, 10, 28, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(323, 5989, '2022-02-07 14:21:21', 2, 9, NULL, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(324, 11470, '2021-10-27 00:09:17', 1, 6, 2, NULL, 14, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(325, 7837, '2022-02-10 10:47:47', 5, 7, NULL, NULL, 14, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(326, 5006, '2021-12-31 12:01:11', 7, 10, NULL, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(327, 9176, '2021-12-23 22:01:38', 8, 1, NULL, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(328, 8792, '2021-12-15 12:41:32', 9, 1, NULL, NULL, 12, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(329, 14396, '2022-03-02 05:03:04', 2, 4, NULL, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(330, 4951, '2022-01-03 10:36:41', 14, 3, NULL, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(331, 12420, '2021-10-21 23:55:21', 2, 5, NULL, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(332, 9010, '2022-01-06 13:26:27', 4, 10, 29, NULL, 5, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(333, 8503, '2021-12-03 02:31:37', 5, 1, NULL, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(334, 4544, '2022-03-05 08:32:52', 8, 1, NULL, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(335, 5941, '2022-02-18 03:40:16', 11, 4, 49, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(336, 5679, '2021-10-21 21:44:09', 6, 10, 21, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(337, 10585, '2022-01-31 20:10:08', 6, 7, NULL, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(338, 12346, '2021-10-26 20:45:17', 3, 3, NULL, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(339, 11263, '2021-12-17 04:53:30', 6, 9, 30, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(340, 12770, '2021-12-22 11:51:59', 1, 9, NULL, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(341, 9720, '2021-12-10 16:00:56', 8, 4, NULL, NULL, 1, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(342, 11774, '2021-10-25 16:36:14', 6, 7, 11, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(343, 12724, '2021-12-19 23:26:25', 7, 8, 11, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(344, 4510, '2022-01-11 19:32:57', 2, 6, NULL, NULL, 5, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(345, 12981, '2021-12-08 03:53:04', 11, 4, NULL, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(346, 13305, '2021-11-09 09:23:07', 9, 8, NULL, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(347, 12675, '2022-02-19 14:54:54', 10, 1, 30, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(348, 6529, '2021-12-04 06:04:00', 11, 5, NULL, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(349, 8048, '2021-11-12 13:23:13', 11, 1, 43, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(350, 6047, '2021-10-16 10:25:24', 5, 3, 16, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(351, 5746, '2022-01-08 22:23:38', 4, 10, 12, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(352, 4991, '2021-11-13 00:29:40', 7, 9, 28, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(353, 4683, '2021-10-25 05:53:02', 6, 9, NULL, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(354, 9568, '2021-12-13 02:22:38', 5, 9, NULL, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(355, 4723, '2022-03-11 04:19:00', 10, 3, 5, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(356, 13792, '2021-11-05 09:49:06', 5, 6, NULL, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(357, 12725, '2021-12-26 23:51:02', 8, 8, NULL, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(358, 8904, '2022-01-24 02:34:24', 1, 4, 41, NULL, 12, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(359, 6134, '2022-02-28 12:49:05', 8, 2, 20, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(360, 9963, '2021-11-18 19:35:16', 11, 10, NULL, NULL, 5, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(361, 6077, '2022-01-18 17:57:44', 6, 2, 26, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(362, 6849, '2022-02-24 17:50:07', 7, 6, 26, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(363, 13666, '2021-11-27 18:48:58', 7, 1, NULL, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(364, 14265, '2022-02-01 05:09:41', 2, 7, NULL, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(365, 11517, '2021-10-12 02:59:33', 1, 7, NULL, NULL, 5, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(366, 4720, '2022-03-08 17:54:22', 3, 9, 2, NULL, 12, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(367, 12434, '2021-11-20 06:23:20', 4, 5, NULL, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(368, 5400, '2021-10-28 12:15:20', 5, 4, NULL, NULL, 5, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(369, 14628, '2021-10-28 08:20:56', 4, 5, 50, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(370, 8234, '2022-01-19 15:58:05', 10, 8, 4, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(371, 5318, '2021-09-24 18:48:33', 11, 9, NULL, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(372, 6308, '2021-10-26 19:12:52', 6, 8, 3, NULL, 5, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(373, 8015, '2021-12-28 09:26:07', 9, 10, NULL, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(374, 7645, '2021-11-13 14:07:14', 8, 8, 14, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(375, 7612, '2021-11-03 15:02:03', 9, 4, 49, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(376, 12951, '2021-10-18 09:55:43', 5, 2, NULL, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(377, 12492, '2021-12-30 01:38:26', 12, 7, NULL, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(378, 8255, '2021-11-08 05:33:07', 3, 8, NULL, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(379, 10961, '2022-01-12 15:04:53', 10, 9, NULL, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(380, 4813, '2022-03-14 11:33:53', 12, 5, 11, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(381, 12219, '2022-03-02 00:04:38', 3, 8, NULL, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(382, 7278, '2021-10-17 22:01:40', 10, 5, 49, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(383, 13272, '2021-10-22 17:09:45', 5, 1, 42, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(384, 14644, '2021-11-13 20:45:17', 1, 8, 44, NULL, 14, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(385, 7363, '2022-02-08 06:54:35', 4, 9, 2, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(386, 10941, '2021-11-12 21:35:06', 8, 1, 18, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(387, 4671, '2021-10-06 22:38:48', 8, 2, NULL, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(388, 9390, '2021-11-12 09:11:54', 6, 8, NULL, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(389, 6037, '2022-02-22 13:13:19', 9, 8, NULL, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(390, 9447, '2021-12-02 11:21:18', 12, 1, NULL, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(391, 6812, '2021-12-17 08:23:54', 3, 1, NULL, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(392, 9920, '2021-11-05 23:49:00', 1, 1, NULL, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(393, 7399, '2022-02-24 23:05:35', 3, 3, 45, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(394, 7941, '2022-02-13 09:03:17', 7, 8, NULL, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(395, 12845, '2022-02-02 05:28:18', 7, 10, 34, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(396, 11287, '2021-11-03 15:43:19', 9, 2, 17, NULL, 5, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(397, 11375, '2022-02-26 16:08:11', 7, 8, NULL, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(398, 14233, '2021-12-06 14:32:39', 9, 7, 29, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(399, 9513, '2022-03-05 21:46:41', 12, 4, 2, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(400, 8898, '2022-02-17 21:33:45', 7, 9, NULL, NULL, 5, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(401, 6041, '2022-02-14 10:46:36', 2, 8, 5, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(402, 8255, '2022-02-26 16:13:35', 2, 4, NULL, NULL, 1, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(403, 12836, '2021-10-13 16:44:24', 9, 5, 9, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(404, 8666, '2021-12-03 10:45:42', 5, 10, 9, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(405, 7539, '2022-03-05 15:28:17', 4, 6, 29, NULL, 14, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(406, 8625, '2022-03-13 15:39:37', 10, 3, 9, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(407, 7020, '2021-11-14 21:04:18', 1, 2, NULL, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(408, 11683, '2021-12-12 09:47:21', 14, 2, 7, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21');
INSERT INTO `funds` (`id`, `amount`, `date`, `user_id`, `transaction_id`, `project_id`, `pic`, `created_by`, `updated_by`, `deleted_by`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(409, 12160, '2021-11-12 03:07:49', 9, 10, NULL, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(410, 10498, '2021-11-27 09:12:51', 11, 9, NULL, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(411, 9606, '2021-12-08 10:29:34', 2, 1, 48, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(412, 11196, '2022-02-16 06:10:48', 12, 7, 20, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(413, 6005, '2021-12-06 20:08:06', 13, 7, NULL, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(414, 11285, '2022-01-10 15:28:59', 9, 3, NULL, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(415, 7462, '2022-01-24 20:16:00', 14, 2, 47, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(416, 9906, '2021-11-14 03:20:32', 6, 4, 46, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:21', '2022-03-14 09:03:21'),
(417, 13909, '2021-12-03 07:25:05', 6, 10, NULL, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(418, 13561, '2021-09-21 13:06:37', 5, 4, 21, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(419, 10694, '2022-02-26 09:32:19', 11, 10, 2, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(420, 9872, '2021-11-06 18:52:30', 4, 5, 13, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(421, 13940, '2022-03-13 14:38:21', 13, 1, NULL, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(422, 9619, '2022-02-08 04:49:22', 5, 9, 33, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(423, 13955, '2022-02-17 05:17:04', 12, 6, NULL, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(424, 14919, '2021-10-01 05:40:21', 4, 1, 16, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(425, 7633, '2022-02-13 17:43:06', 10, 9, NULL, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(426, 6184, '2021-12-16 06:04:16', 8, 10, NULL, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(427, 12493, '2022-02-13 01:48:00', 14, 2, NULL, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(428, 8742, '2021-10-05 03:18:46', 9, 9, NULL, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(429, 4872, '2021-09-18 08:15:27', 10, 3, 43, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(430, 4836, '2021-11-17 08:00:46', 6, 2, NULL, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(431, 12123, '2021-10-08 17:40:35', 14, 6, NULL, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(432, 7527, '2021-12-25 02:06:08', 8, 9, 41, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(433, 5207, '2021-09-26 00:56:55', 12, 3, NULL, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(434, 5618, '2022-01-24 19:56:22', 6, 2, NULL, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(435, 6381, '2022-01-20 22:25:47', 1, 9, NULL, NULL, 5, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(436, 7376, '2022-01-13 08:42:33', 12, 10, 12, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(437, 9014, '2022-01-05 04:50:18', 10, 4, NULL, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(438, 5386, '2022-03-07 19:39:45', 7, 9, 32, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(439, 6681, '2021-09-17 07:22:41', 8, 6, 37, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(440, 7189, '2022-02-03 10:54:12', 9, 2, NULL, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(441, 10459, '2021-10-13 23:48:23', 2, 3, NULL, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(442, 12083, '2022-02-06 15:23:49', 2, 5, 37, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(443, 12656, '2022-02-12 03:37:25', 9, 8, NULL, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(444, 10528, '2021-10-18 02:02:37', 14, 3, 31, NULL, 12, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(445, 11511, '2022-02-15 01:25:35', 4, 3, NULL, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(446, 12417, '2022-02-13 10:57:03', 9, 7, NULL, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(447, 6897, '2021-10-07 09:18:56', 11, 9, NULL, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(448, 10914, '2021-09-25 18:29:18', 5, 9, NULL, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(449, 6839, '2022-03-09 14:01:11', 3, 1, 41, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(450, 10432, '2021-10-29 18:42:54', 10, 8, NULL, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(451, 5472, '2021-12-24 18:55:23', 5, 6, NULL, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(452, 5561, '2021-11-12 21:08:27', 10, 10, 34, NULL, 14, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(453, 14673, '2021-11-06 17:07:47', 7, 6, NULL, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(454, 8299, '2021-12-14 08:07:22', 6, 7, NULL, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(455, 9914, '2021-12-20 15:02:20', 3, 3, 36, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(456, 5792, '2021-09-18 21:48:45', 6, 3, 4, NULL, 12, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(457, 11634, '2022-02-01 03:16:07', 13, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(458, 13976, '2021-11-14 04:05:20', 3, 2, NULL, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(459, 13237, '2021-10-29 08:49:34', 3, 7, NULL, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(460, 11334, '2021-10-07 09:43:55', 12, 9, NULL, NULL, 1, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(461, 10474, '2021-10-14 21:55:37', 4, 7, 47, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(462, 9605, '2021-11-15 10:12:16', 10, 5, 19, NULL, 1, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(463, 8948, '2022-01-26 13:47:56', 2, 4, 31, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(464, 14809, '2022-03-11 18:22:31', 5, 8, 10, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(465, 6809, '2021-12-20 17:23:48', 1, 4, NULL, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(466, 11512, '2022-02-20 02:43:03', 13, 4, 1, NULL, 1, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(467, 8999, '2021-11-12 05:12:01', 11, 4, NULL, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(468, 6661, '2021-11-17 22:40:00', 1, 6, 29, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(469, 7165, '2021-12-05 04:24:29', 6, 1, NULL, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(470, 9146, '2022-03-08 09:00:34', 10, 10, 11, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(471, 5696, '2021-10-31 17:56:44', 3, 7, 13, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(472, 14360, '2021-11-17 08:06:47', 7, 4, NULL, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(473, 12423, '2021-11-06 13:26:42', 14, 2, NULL, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(474, 11576, '2022-02-07 03:32:05', 1, 9, NULL, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(475, 5002, '2021-10-14 09:28:56', 8, 7, 41, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(476, 10921, '2022-02-05 10:46:32', 8, 8, 13, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(477, 14305, '2021-12-16 22:32:07', 14, 9, 24, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(478, 4523, '2022-01-19 09:18:09', 8, 3, NULL, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(479, 14698, '2021-11-07 16:15:22', 8, 9, 4, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(480, 11793, '2022-01-16 21:23:59', 13, 4, 41, NULL, 1, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(481, 13114, '2021-10-03 01:11:46', 1, 8, 21, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(482, 6522, '2021-10-19 09:50:06', 9, 2, NULL, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(483, 9567, '2022-03-01 18:51:09', 11, 1, NULL, NULL, 14, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(484, 8253, '2021-11-16 14:30:45', 11, 10, 41, NULL, 1, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(485, 12774, '2022-02-28 13:15:13', 14, 8, NULL, NULL, 5, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(486, 9948, '2021-10-12 10:19:38', 12, 1, 4, NULL, 5, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(487, 6358, '2021-12-24 16:16:00', 10, 4, NULL, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(488, 4871, '2021-11-21 15:35:51', 12, 2, NULL, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(489, 13287, '2022-02-01 08:52:21', 11, 2, NULL, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(490, 10902, '2021-09-26 09:24:11', 1, 3, 35, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(491, 12958, '2021-12-10 07:50:09', 1, 9, NULL, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(492, 6920, '2021-12-25 11:45:53', 5, 3, NULL, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(493, 11159, '2022-02-13 11:31:58', 9, 5, NULL, NULL, 5, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(494, 13851, '2021-11-14 15:14:16', 8, 3, NULL, NULL, 5, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(495, 13610, '2021-12-07 06:58:45', 7, 4, NULL, NULL, 14, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(496, 6671, '2021-12-14 12:55:57', 5, 2, 30, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(497, 6162, '2021-10-05 05:51:22', 2, 10, NULL, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(498, 14542, '2021-11-01 07:51:55', 7, 3, NULL, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(499, 9935, '2021-09-20 11:26:02', 1, 4, NULL, NULL, 5, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(500, 11485, '2021-10-19 12:00:30', 2, 2, NULL, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(501, 13615, '2022-01-07 22:30:10', 10, 8, 46, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(502, 12996, '2021-11-07 12:22:27', 8, 6, NULL, NULL, 1, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(503, 11074, '2022-02-18 15:47:42', 1, 8, NULL, NULL, 12, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(504, 13269, '2021-10-28 03:52:26', 4, 10, 31, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(505, 9934, '2022-01-05 09:44:50', 12, 9, 27, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(506, 9301, '2021-12-03 06:09:41', 10, 7, NULL, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(507, 4989, '2021-12-07 09:45:00', 5, 10, NULL, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(508, 11526, '2021-11-13 13:35:37', 4, 9, 3, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(509, 8158, '2021-09-16 15:51:05', 3, 8, 18, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(510, 13637, '2022-01-07 23:48:00', 8, 6, 11, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(511, 11378, '2021-10-04 10:36:01', 6, 6, NULL, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(512, 9160, '2022-01-12 00:31:00', 14, 1, 15, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(513, 11089, '2021-10-30 02:51:56', 3, 6, 39, NULL, 1, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(514, 5919, '2021-09-21 08:31:33', 7, 7, 3, NULL, 5, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(515, 9369, '2021-12-21 02:19:04', 11, 6, 1, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(516, 6048, '2022-02-08 07:01:33', 10, 5, NULL, NULL, 1, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(517, 4640, '2021-10-07 12:55:06', 9, 8, NULL, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(518, 10343, '2021-11-11 04:59:51', 2, 5, 9, NULL, 14, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(519, 12312, '2021-10-21 08:15:05', 14, 6, 17, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(520, 4908, '2021-12-14 12:39:07', 12, 6, NULL, NULL, 12, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(521, 5287, '2022-01-16 18:57:10', 10, 3, NULL, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(522, 11218, '2021-10-17 19:09:04', 3, 7, 42, NULL, 1, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(523, 10197, '2022-03-13 16:33:44', 9, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(524, 8200, '2021-12-31 06:40:51', 13, 5, 39, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(525, 14827, '2021-11-19 01:05:38', 1, 7, NULL, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(526, 10844, '2022-02-26 04:15:25', 2, 8, 48, NULL, 14, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(527, 13625, '2021-10-12 02:51:03', 10, 2, 49, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(528, 10632, '2021-12-15 22:17:18', 11, 4, NULL, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(529, 14865, '2021-12-08 19:42:48', 10, 4, 32, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(530, 10230, '2021-11-21 13:54:59', 13, 5, 13, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(531, 11440, '2021-11-21 07:09:01', 6, 9, NULL, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(532, 13471, '2021-12-26 23:55:31', 3, 6, 12, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(533, 10410, '2021-12-17 19:20:36', 5, 9, NULL, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(534, 9309, '2021-12-17 15:10:14', 12, 7, NULL, NULL, 1, NULL, NULL, 1, NULL, '2022-03-14 09:03:22', '2022-03-14 09:03:22'),
(535, 10919, '2021-10-17 19:00:32', 5, 8, NULL, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(536, 5682, '2021-10-31 04:34:35', 12, 5, 8, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(537, 9322, '2022-03-09 17:01:15', 3, 4, NULL, NULL, 12, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(538, 5330, '2022-01-12 23:17:10', 7, 2, NULL, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(539, 7207, '2022-02-19 19:47:37', 7, 1, NULL, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(540, 14601, '2021-12-22 01:52:30', 8, 8, NULL, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(541, 9082, '2021-09-20 23:27:22', 1, 4, 46, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(542, 11933, '2021-10-11 16:08:29', 14, 3, NULL, NULL, 14, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(543, 13404, '2022-02-23 20:42:59', 13, 2, 41, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(544, 8000, '2021-10-14 23:48:46', 1, 7, NULL, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(545, 4556, '2021-10-29 15:50:27', 3, 1, NULL, NULL, 12, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(546, 8923, '2022-01-16 10:05:47', 1, 10, NULL, NULL, 5, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(547, 11947, '2022-03-07 06:16:33', 13, 1, NULL, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(548, 8981, '2022-01-16 06:25:19', 11, 2, 47, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(549, 10943, '2021-12-20 17:17:53', 6, 5, 3, NULL, 5, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(550, 10887, '2022-01-27 17:19:07', 9, 9, NULL, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(551, 5247, '2021-10-15 15:22:00', 3, 9, NULL, NULL, 1, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(552, 9218, '2021-09-20 09:45:05', 7, 3, 32, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(553, 9451, '2022-01-26 18:15:58', 5, 1, NULL, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(554, 5550, '2021-09-15 20:51:47', 12, 10, NULL, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(555, 11768, '2021-11-24 21:12:42', 9, 2, NULL, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(556, 10272, '2021-12-21 22:16:55', 9, 8, NULL, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(557, 6310, '2021-11-29 03:45:10', 8, 3, NULL, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(558, 12469, '2022-02-24 02:40:14', 14, 4, NULL, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(559, 12583, '2021-10-23 01:40:39', 11, 6, 16, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(560, 9240, '2021-11-18 17:10:34', 14, 7, NULL, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(561, 7800, '2022-01-20 08:34:03', 4, 6, 44, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(562, 12462, '2022-03-04 00:39:47', 9, 4, NULL, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(563, 9620, '2021-09-21 13:25:21', 6, 2, 33, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(564, 13400, '2021-10-15 13:04:29', 3, 5, 37, NULL, 4, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(565, 7634, '2022-02-13 08:41:35', 8, 8, 12, NULL, 1, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(566, 14399, '2022-02-15 17:41:47', 13, 8, NULL, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(567, 7230, '2022-02-25 16:30:05', 14, 9, NULL, NULL, 11, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(568, 7101, '2021-12-01 13:39:22', 4, 3, 37, NULL, 14, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(569, 14129, '2022-03-07 22:53:35', 14, 8, 15, NULL, 3, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(570, 14916, '2021-12-26 22:42:43', 12, 10, 7, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(571, 8976, '2021-12-07 17:09:19', 1, 9, 45, NULL, 10, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(572, 8300, '2022-01-26 00:15:53', 13, 4, 18, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(573, 10615, '2022-02-17 10:37:24', 14, 8, NULL, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(574, 14726, '2021-11-02 15:29:17', 12, 7, 44, NULL, 2, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(575, 7461, '2022-01-09 22:02:34', 9, 9, 39, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(576, 13018, '2022-01-04 10:24:26', 12, 7, 41, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(577, 7531, '2021-11-01 02:29:42', 9, 5, NULL, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(578, 6331, '2021-12-07 16:38:04', 7, 8, NULL, NULL, 12, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(579, 6004, '2021-10-26 05:41:44', 8, 8, NULL, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(580, 5546, '2021-12-14 11:59:09', 7, 7, 19, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(581, 10717, '2022-03-03 06:20:34', 2, 2, NULL, NULL, 8, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(582, 10596, '2022-01-01 10:40:58', 12, 5, NULL, NULL, 9, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(583, 12849, '2021-11-21 15:24:55', 10, 2, NULL, NULL, 13, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(584, 8110, '2021-11-30 11:54:43', 10, 4, 10, NULL, 7, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(585, 7629, '2022-01-15 12:49:18', 14, 10, 38, NULL, 6, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(586, 5672, '2021-11-14 04:13:53', 4, 8, 30, NULL, 5, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23'),
(587, 5142, '2022-02-09 10:16:11', 5, 10, NULL, NULL, 14, NULL, NULL, 1, NULL, '2022-03-14 09:03:23', '2022-03-14 09:03:23');

-- --------------------------------------------------------

--
-- Table structure for table `incomes`
--

DROP TABLE IF EXISTS `incomes`;
CREATE TABLE IF NOT EXISTS `incomes` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` bigint UNSIGNED DEFAULT NULL,
  `transaction_id` bigint UNSIGNED DEFAULT NULL,
  `received_by` bigint UNSIGNED DEFAULT NULL,
  `from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `particular` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `status` int DEFAULT '1',
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `incomes_project_id_foreign` (`project_id`),
  KEY `incomes_transaction_id_foreign` (`transaction_id`),
  KEY `incomes_received_by_foreign` (`received_by`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `incomes`
--

INSERT INTO `incomes` (`id`, `project_id`, `transaction_id`, `received_by`, `from`, `amount`, `date`, `particular`, `desc`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 13, 2, 14, 'Laury', 3500, '2021-05-23', 'reminding amount received', 'Earum aut sunt sed eaque et. Saepe non sunt modi eum.', 1, 14, NULL, NULL, NULL, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(2, 15, 9, 11, 'Jed', 4000, '2021-06-18', 'Booking amount received', 'Voluptate eum eveniet adipisci ab qui. Sequi voluptatem illo quis neque.', 1, 1, NULL, NULL, NULL, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(3, 41, 1, 11, 'Demarcus', 5500, '2021-05-27', 'Booking amount received', 'Velit vel rem eveniet ea consequatur tempora. Delectus quam deserunt perspiciatis sit aut. Et ipsam unde dicta dignissimos.', 1, 6, NULL, NULL, NULL, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(4, 4, 7, 6, 'Hellen', 3500, '2021-09-06', 'reminding amount received', 'Repellat ex ut id repellendus modi sed quis et. Vitae qui vitae illum possimus qui.', 1, 11, NULL, NULL, NULL, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(5, 14, 1, 2, 'Damon', 7500, '2021-08-01', 'Booking amount received', 'Vero animi earum nostrum quia. Nam velit deserunt similique sint. Sit magnam sed dolores non non eos voluptatem.', 1, 14, NULL, NULL, NULL, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(6, 12, 1, 5, 'Favian', 2500, '2022-02-24', 'reminding amount received', 'Nobis maiores amet asperiores aut voluptas. Dolorem pariatur et omnis et perferendis libero. Quia voluptates voluptates adipisci ut est amet.', 1, 9, NULL, NULL, NULL, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(7, 28, 3, 1, 'Ryann', 2500, '2021-10-05', 'reminding amount received', 'A nostrum earum enim laudantium magni sunt ut. Quis dolorem et deserunt non aut. Est consequuntur repudiandae ullam in est repellendus vel facilis.', 1, 10, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(8, 4, 3, 8, 'Davion', 3000, '2021-09-03', 'reminding amount received', 'Totam quisquam aperiam voluptas commodi ipsum aut id. Incidunt omnis vel exercitationem et illum esse fugit autem. Est rerum accusantium iusto quidem.', 1, 13, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(9, 50, 8, 4, 'Kayleigh', 7000, '2021-05-10', 'reminding amount received', 'Molestiae et sed non sapiente ullam. Sunt ullam veniam voluptatem qui non earum. Officia pariatur architecto animi sequi iusto.', 1, 4, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(10, 19, 4, 3, 'Marisol', 7000, '2021-06-01', 'reminding amount received', 'Optio dicta deserunt excepturi pariatur. Ipsum optio accusantium sit dolores sit provident similique. Vitae cupiditate voluptatem blanditiis et ad.', 1, 2, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(11, 33, 5, 11, 'Ramon', 7000, '2022-01-16', 'reminding amount received', 'Iusto quae incidunt provident reiciendis voluptatem necessitatibus dolores. Ipsa unde in quia voluptatem at.', 1, 5, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(12, 43, 4, 9, 'Bryce', 4000, '2021-11-22', 'reminding amount received', 'Pariatur iste reprehenderit veritatis dolore. Et est odio doloribus ullam ut culpa saepe placeat.', 1, 4, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(13, 22, 2, 7, 'Jerome', 6500, '2021-11-24', 'Booking amount received', 'Consectetur enim illo possimus at autem porro. Ratione ducimus nihil nam voluptates beatae aspernatur culpa.', 1, 3, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(14, 39, 5, 1, 'Lauriane', 7000, '2021-05-21', 'reminding amount received', 'Odit aspernatur ut natus debitis. Et quia commodi modi quod cumque minus explicabo.', 1, 2, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(15, 35, 5, 4, 'Regan', 2500, '2022-01-10', 'reminding amount received', 'Voluptatem doloribus tempore ratione harum. Dolores qui aut aut rerum aperiam. Tempore perferendis aut praesentium dignissimos incidunt ullam.', 1, 1, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(16, 22, 2, 3, 'Guillermo', 7000, '2021-12-01', 'Booking amount received', 'Molestias et et quis quia quam praesentium. Qui et omnis ullam rerum laudantium voluptas aperiam.', 1, 12, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(17, 47, 3, 6, 'Alyce', 6000, '2021-04-20', 'partial amount received', 'Officia et amet dolores nulla eum. Quod voluptatem alias iste. Reiciendis expedita neque ut.', 1, 14, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(18, 20, 7, 2, 'Mark', 3500, '2021-07-21', 'Booking amount received', 'Deserunt corporis aspernatur fugit temporibus et. Iste dolores inventore sit laborum fuga nulla sint. Et repellat qui quasi vel dolorem velit dolore unde.', 1, 8, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(19, 26, 5, 1, 'Ora', 7000, '2021-06-07', 'reminding amount received', 'Rerum placeat veritatis sit qui veniam sit aliquam cum. Illum eveniet voluptatem recusandae accusamus labore facilis aut.', 1, 2, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(20, 41, 9, 9, 'Brandon', 3000, '2021-03-24', 'reminding amount received', 'Laborum aut consequuntur eum iste quis cumque. Officiis vel alias deleniti aliquam reiciendis iure explicabo.', 1, 7, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(21, 15, 2, 13, 'Mackenzie', 4000, '2021-11-30', 'partial amount received', 'Vel tenetur sed ad aut nesciunt blanditiis. Quibusdam culpa nostrum perferendis.', 1, 3, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(22, 33, 9, 12, 'Marcella', 3000, '2021-11-12', 'Booking amount received', 'Vero nulla nobis corporis illo ex ratione cumque. Voluptate doloribus neque et quo. Dolores quaerat non quam doloremque voluptas.', 1, 7, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(23, 32, 3, 6, 'Ariane', 6500, '2021-09-27', 'reminding amount received', 'Dolores qui cum reprehenderit facere sequi velit quisquam autem. Aliquid ab ipsam architecto officiis quo qui qui. Incidunt ullam et deserunt omnis earum.', 1, 6, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(24, 39, 6, 2, 'Clarabelle', 2000, '2021-04-04', 'Booking amount received', 'Dolores expedita modi esse aut odit. Et assumenda distinctio voluptatem.', 1, 4, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(25, 50, 8, 6, 'Murl', 3000, '2021-03-16', 'reminding amount received', 'Voluptatum eligendi aut quidem esse harum. Quibusdam unde praesentium eum voluptatum voluptate et ad aliquam.', 1, 8, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(26, 13, 3, 12, 'Leonel', 3500, '2022-01-19', 'reminding amount received', 'Ullam dignissimos corporis voluptatem omnis alias iure. Rem voluptates dolorum ea nobis quis dolor. Et culpa quis quam minus corporis sit.', 1, 3, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(27, 49, 2, 9, 'Hollie', 4000, '2021-09-28', 'Booking amount received', 'Ipsa cupiditate sunt et nisi aut quis totam culpa. Est quisquam non iste rerum enim accusantium. Sint inventore et quia nulla dolorum quia iure.', 1, 5, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(28, 31, 9, 10, 'Kaleigh', 2000, '2021-11-16', 'partial amount received', 'Natus voluptatibus qui esse quo. Voluptates libero recusandae ipsam eaque distinctio.', 1, 8, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(29, 44, 5, 13, 'Casandra', 2000, '2021-09-23', 'Booking amount received', 'Qui illum ex dolorum beatae molestiae non. Qui molestiae possimus voluptatem consequatur ducimus est. Illo rerum id doloribus et odit dignissimos quaerat.', 1, 10, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(30, 17, 2, 13, 'Wava', 3000, '2021-06-01', 'reminding amount received', 'Aut et non non perspiciatis cum. Blanditiis perferendis molestiae fugit laborum aut ratione.', 1, 5, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(31, 48, 7, 8, 'Sanford', 1500, '2021-07-05', 'partial amount received', 'Nobis qui quod quo est consequatur possimus quas. Quis omnis et labore asperiores. Sed possimus omnis minima ut.', 1, 1, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(32, 10, 4, 3, 'Tyra', 500, '2021-03-23', 'Booking amount received', 'Minima nihil at provident sit adipisci eos. Consequatur ex vel exercitationem harum. Aspernatur delectus similique quos porro dicta libero labore.', 1, 13, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(33, 47, 10, 2, 'Raymundo', 5500, '2022-01-22', 'Booking amount received', 'Nam reprehenderit alias corrupti non quidem. Aperiam omnis minima dolor inventore.', 1, 2, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(34, 10, 9, 8, 'Letitia', 6500, '2021-11-20', 'Booking amount received', 'Id velit id enim ipsa libero est est. Magni itaque quo velit minus aut.', 1, 12, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(35, 27, 2, 1, 'Kameron', 6000, '2022-02-05', 'partial amount received', 'Unde nesciunt beatae saepe sunt quo ullam veniam. Voluptatem dolore quaerat repudiandae ad nemo dolores quo ut. Placeat deserunt nesciunt totam consequatur odit voluptatum.', 1, 1, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(36, 4, 9, 12, 'Gia', 3000, '2021-07-28', 'Booking amount received', 'Rem sunt animi ex animi ea perferendis. Tenetur doloribus laboriosam sed dolorem aliquid possimus. Aut et aliquam rerum vitae soluta.', 1, 7, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(37, 49, 2, 2, 'Janelle', 6500, '2021-03-25', 'Booking amount received', 'Ad eligendi dolor veniam. Enim excepturi enim dolorem est voluptate et.', 1, 5, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(38, 38, 6, 7, 'Cleve', 500, '2022-02-08', 'partial amount received', 'Aut omnis repellendus consequatur repudiandae officiis qui. Velit ab quo officiis. Optio et sed et expedita sunt.', 1, 12, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(39, 5, 10, 12, 'Maude', 7000, '2021-09-19', 'Booking amount received', 'Dignissimos occaecati error mollitia adipisci pariatur consequatur amet. Quo fugit sequi id dignissimos dolorem. Hic minima sit atque aut incidunt inventore delectus.', 1, 9, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(40, 23, 3, 10, 'Percival', 2500, '2021-10-06', 'reminding amount received', 'Itaque maxime sunt consequatur eum. Iure aspernatur id qui.', 1, 1, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(41, 24, 8, 13, 'Adelle', 7500, '2022-02-21', 'Booking amount received', 'Commodi excepturi perferendis iste saepe soluta sunt. Ut velit debitis non perspiciatis consequatur voluptatem sed. Illum molestiae amet veritatis et.', 1, 5, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(42, 49, 2, 13, 'Carlotta', 6500, '2022-01-24', 'partial amount received', 'Voluptas culpa aut enim ipsam. Animi ut vel iure esse laborum sit voluptatem.', 1, 5, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(43, 4, 9, 12, 'Mallie', 5500, '2021-09-18', 'partial amount received', 'Facere consequatur est nemo illo. Facilis asperiores laudantium sed aut consequatur quam. Aut nobis error et.', 1, 14, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(44, 37, 5, 4, 'Shanie', 4000, '2021-11-28', 'Booking amount received', 'Autem qui sed quibusdam perferendis. Quod totam qui nihil eos. Dolorem praesentium qui ad rerum.', 1, 7, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(45, 21, 4, 11, 'Keon', 6000, '2021-04-04', 'reminding amount received', 'Aut dignissimos velit et et rerum repellat incidunt molestiae. Ullam qui quae harum reiciendis. Vitae consequatur enim vel.', 1, 5, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(46, 39, 6, 7, 'Deron', 6000, '2022-01-16', 'reminding amount received', 'Libero ad praesentium aliquid voluptatem. Voluptas sed voluptatem aut consequatur unde pariatur officia. Est rerum possimus in similique.', 1, 8, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(47, 4, 5, 5, 'Jordan', 3000, '2021-10-07', 'partial amount received', 'Voluptates eum aperiam a cum. Rem qui ducimus excepturi qui consequatur atque iusto.', 1, 7, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(48, 44, 5, 12, 'Judah', 3000, '2021-11-05', 'Booking amount received', 'Iure maiores accusantium a error. Ab recusandae non consectetur et. Et iusto deleniti tempora dicta placeat dolores nulla.', 1, 8, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(49, 14, 1, 11, 'Mya', 7500, '2021-10-01', 'Booking amount received', 'Enim eum nam hic qui officiis et eos. Mollitia quae numquam qui neque.', 1, 5, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(50, 26, 1, 13, 'Lillie', 3000, '2021-06-26', 'reminding amount received', 'Sit sit rerum error eius. Iste sit autem laboriosam aspernatur voluptas consequatur quo.', 1, 10, NULL, NULL, NULL, '2022-03-14 09:03:15', '2022-03-14 09:03:15'),
(51, 22, 2, 14, 'Madyson', 6000, '2021-11-30', 'reminding amount received', 'Quo voluptas quia impedit deserunt. Tempore asperiores ipsum ut voluptatum sint.', 1, 13, NULL, NULL, NULL, '2022-03-14 09:03:16', '2022-03-14 09:03:16'),
(52, 38, 8, 5, 'Edyth', 3000, '2021-10-02', 'Booking amount received', 'Ea distinctio temporibus quo corrupti nobis numquam sequi. Corrupti labore sit voluptatum id.', 1, 13, NULL, NULL, NULL, '2022-03-14 09:03:16', '2022-03-14 09:03:16'),
(53, 34, 5, 8, 'Adelbert', 3000, '2021-10-22', 'Booking amount received', 'Consequatur quae et necessitatibus pariatur. Harum neque nulla rerum et ipsum.', 1, 10, NULL, NULL, NULL, '2022-03-14 09:03:16', '2022-03-14 09:03:16'),
(54, 23, 9, 5, 'Tobin', 2500, '2022-03-10', 'reminding amount received', 'Vel distinctio assumenda sit. Debitis illo maiores quam aut nihil inventore. Sunt consequatur fugit minus iusto autem voluptates sit.', 1, 11, NULL, NULL, NULL, '2022-03-14 09:03:16', '2022-03-14 09:03:16'),
(55, 22, 9, 6, 'Orie', 3000, '2022-02-10', 'partial amount received', 'Eum nulla quia illum nobis quia. Id magni error vel sequi qui accusantium.', 1, 6, NULL, NULL, NULL, '2022-03-14 09:03:16', '2022-03-14 09:03:16'),
(56, 6, 5, 1, 'Ashtyn', 5500, '2021-04-05', 'Booking amount received', 'Ut vitae est enim debitis omnis praesentium et. Unde dignissimos sit doloremque eveniet nisi. Sequi nesciunt officiis quis commodi a perferendis.', 1, 2, NULL, NULL, NULL, '2022-03-14 09:03:16', '2022-03-14 09:03:16'),
(57, 38, 5, 5, 'Geo', 1500, '2021-12-13', 'Booking amount received', 'Qui voluptatem esse provident sit tempore. Similique iusto vel temporibus quisquam.', 1, 11, NULL, NULL, NULL, '2022-03-14 09:03:17', '2022-03-14 09:03:17'),
(58, 13, 2, 9, 'Oceane', 2000, '2022-01-16', 'reminding amount received', 'Magni rerum numquam sint quis. Tempora enim porro qui.', 1, 8, NULL, NULL, NULL, '2022-03-14 09:03:17', '2022-03-14 09:03:17'),
(59, 5, 2, 2, 'Merritt', 1500, '2021-04-04', 'reminding amount received', 'Id sed odio fuga ipsum occaecati. Maxime eum aut magnam vitae quo.', 1, 11, NULL, NULL, NULL, '2022-03-14 09:03:17', '2022-03-14 09:03:17'),
(60, 31, 7, 1, 'Lavern', 7000, '2021-05-31', 'partial amount received', 'Officiis laboriosam omnis aut dignissimos consequatur enim rerum quae. Quis in alias quo nemo sit.', 1, 1, NULL, NULL, NULL, '2022-03-14 09:03:17', '2022-03-14 09:03:17'),
(61, 26, 10, 11, 'Drew', 5500, '2021-07-29', 'reminding amount received', 'Ut non vero consequatur sed corrupti. Provident iusto quod omnis laboriosam quo omnis. Qui aut modi aut quia.', 1, 3, NULL, NULL, NULL, '2022-03-14 09:03:17', '2022-03-14 09:03:17'),
(62, 37, 7, 1, 'Bernardo', 2500, '2021-11-27', 'Booking amount received', 'Iure non rem expedita et magnam hic eum ad. Eos non in dolor voluptatem impedit ipsam neque. Similique est magni non officia.', 1, 2, NULL, NULL, NULL, '2022-03-14 09:03:17', '2022-03-14 09:03:17'),
(63, 29, 6, 8, 'Samir', 5000, '2022-01-10', 'partial amount received', 'Aut itaque nostrum totam quasi nesciunt maiores ducimus aut. Quod earum quia quidem dolorem aliquam ipsum. Quasi nulla sed est velit odit adipisci.', 1, 7, NULL, NULL, NULL, '2022-03-14 09:03:17', '2022-03-14 09:03:17'),
(64, 43, 7, 10, 'Maybell', 6000, '2021-08-01', 'reminding amount received', 'Ratione veritatis minima enim sint. Eum qui veniam amet sunt. Sequi praesentium dignissimos est neque qui occaecati earum.', 1, 14, NULL, NULL, NULL, '2022-03-14 09:03:17', '2022-03-14 09:03:17'),
(65, 1, 3, 14, 'Annamae', 3000, '2021-04-05', 'Booking amount received', 'Sed est aut ad sequi soluta laboriosam. Quos aspernatur omnis quae et quia.', 1, 3, NULL, NULL, NULL, '2022-03-14 09:03:17', '2022-03-14 09:03:17'),
(66, 38, 4, 10, 'Sasha', 3500, '2021-10-24', 'Booking amount received', 'Ipsum qui odio autem laudantium. Aut quidem beatae animi quia illo velit.', 1, 5, NULL, NULL, NULL, '2022-03-14 09:03:17', '2022-03-14 09:03:17'),
(67, 11, 7, 2, 'Leslie', 4000, '2021-11-14', 'reminding amount received', 'Eveniet quo placeat deleniti iste. Id aut qui quis laborum quas enim saepe.', 1, 5, NULL, NULL, NULL, '2022-03-14 09:03:17', '2022-03-14 09:03:17'),
(68, 37, 4, 4, 'Jasen', 4500, '2021-11-25', 'partial amount received', 'Amet nobis cupiditate iste officia aut. Qui sint voluptate velit ex.', 1, 14, NULL, NULL, NULL, '2022-03-14 09:03:17', '2022-03-14 09:03:17'),
(69, 5, 7, 3, 'Nick', 6500, '2021-03-22', 'partial amount received', 'Maiores consequatur cupiditate quidem soluta voluptate id aliquid. Et velit architecto consectetur voluptas sequi qui. Occaecati ut aut odio.', 1, 10, NULL, NULL, NULL, '2022-03-14 09:03:17', '2022-03-14 09:03:17'),
(70, 46, 4, 1, 'Abigayle', 4500, '2021-08-01', 'Booking amount received', 'Ea veniam velit dicta. Rem harum provident ea sed corrupti placeat. Quod est excepturi quo.', 1, 8, NULL, NULL, NULL, '2022-03-14 09:03:17', '2022-03-14 09:03:17'),
(71, 37, 8, 4, 'Thomas', 6500, '2021-03-20', 'partial amount received', 'Tempora vel quia minus et non optio. Sequi fuga nulla et quod laboriosam.', 1, 4, NULL, NULL, NULL, '2022-03-14 09:03:17', '2022-03-14 09:03:17'),
(72, 39, 1, 10, 'Lamont', 2000, '2021-12-12', 'partial amount received', 'Aut eius temporibus sed culpa dolorem aut. Itaque deleniti quo quia sapiente aut. Illo enim non iure ad a atque laudantium.', 1, 1, NULL, NULL, NULL, '2022-03-14 09:03:17', '2022-03-14 09:03:17'),
(73, 46, 9, 13, 'Janelle', 500, '2021-04-01', 'Booking amount received', 'Cumque autem excepturi vero libero quos velit non. Est facere vero neque totam dolore ratione et omnis. Earum repellendus et neque nihil maiores cumque facere.', 1, 5, NULL, NULL, NULL, '2022-03-14 09:03:17', '2022-03-14 09:03:17'),
(74, 3, 7, 11, 'Rose', 6000, '2021-08-21', 'reminding amount received', 'Debitis ipsum quisquam perferendis dicta non. Nam exercitationem exercitationem a odit.', 1, 14, NULL, NULL, NULL, '2022-03-14 09:03:17', '2022-03-14 09:03:17'),
(75, 37, 6, 1, 'Cayla', 6500, '2021-05-26', 'reminding amount received', 'Consequatur omnis eius omnis odio. Et rerum reprehenderit odio harum fuga et itaque. Laborum totam ea tempora nulla molestiae voluptate eveniet.', 1, 2, NULL, NULL, NULL, '2022-03-14 09:03:17', '2022-03-14 09:03:17'),
(76, 28, 2, 11, 'Olaf', 4500, '2021-07-08', 'partial amount received', 'Dicta quo enim pariatur qui quibusdam. Corporis quae ut molestiae error voluptatem.', 1, 7, NULL, NULL, NULL, '2022-03-14 09:03:17', '2022-03-14 09:03:17'),
(77, 34, 3, 3, 'Virginie', 7000, '2021-04-01', 'reminding amount received', 'Magnam voluptas inventore hic repellendus. Quasi animi ipsam architecto nisi. Illo nam harum aperiam.', 1, 10, NULL, NULL, NULL, '2022-03-14 09:03:17', '2022-03-14 09:03:17'),
(78, 39, 8, 5, 'River', 5000, '2022-03-02', 'partial amount received', 'Ex saepe a qui repellat esse deserunt quos at. Recusandae occaecati rerum quo veniam consequatur.', 1, 9, NULL, NULL, NULL, '2022-03-14 09:03:17', '2022-03-14 09:03:17'),
(79, 14, 7, 9, 'Hillary', 1500, '2021-05-19', 'Booking amount received', 'Esse placeat et et aliquid et adipisci deleniti. Qui accusantium possimus dolorem iusto enim eos dolorem. Iusto sunt illo enim unde aperiam perspiciatis dolorem.', 1, 9, NULL, NULL, NULL, '2022-03-14 09:03:17', '2022-03-14 09:03:17');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint UNSIGNED NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `generated_conversions` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_uuid_unique` (`uuid`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  KEY `media_order_column_index` (`order_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2021_12_18_155957_create_permission_tables', 1),
(7, '2021_12_18_163626_add_display_name_field_in_permissions_and_roles_table', 1),
(8, '2022_01_06_110554_create_media_table', 1),
(9, '2022_01_07_171602_create_projects_table', 1),
(10, '2022_01_11_075404_create_transactions_table', 1),
(11, '2022_01_11_111820_create_funds_table', 1),
(12, '2022_01_14_173854_create_salaries_table', 1),
(13, '2022_01_15_055851_create_advances_table', 1),
(14, '2022_02_18_112822_create_incomes_table', 1),
(15, '2022_03_04_130357_create_dealers_table', 1),
(16, '2022_03_05_050512_create_estimates_table', 1),
(17, '2022_03_08_154330_create_expenses_table', 1),
(18, '2022_03_14_141715_create_payments_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 1),
(4, 'App\\Models\\User', 1),
(5, 'App\\Models\\User', 1),
(6, 'App\\Models\\User', 1),
(7, 'App\\Models\\User', 1),
(8, 'App\\Models\\User', 1),
(9, 'App\\Models\\User', 1),
(10, 'App\\Models\\User', 1),
(11, 'App\\Models\\User', 1),
(12, 'App\\Models\\User', 1),
(13, 'App\\Models\\User', 1),
(14, 'App\\Models\\User', 1),
(15, 'App\\Models\\User', 1),
(16, 'App\\Models\\User', 1),
(17, 'App\\Models\\User', 1),
(18, 'App\\Models\\User', 1),
(19, 'App\\Models\\User', 1),
(20, 'App\\Models\\User', 1),
(21, 'App\\Models\\User', 1),
(22, 'App\\Models\\User', 1),
(23, 'App\\Models\\User', 1),
(24, 'App\\Models\\User', 1),
(25, 'App\\Models\\User', 1),
(26, 'App\\Models\\User', 1),
(27, 'App\\Models\\User', 1),
(28, 'App\\Models\\User', 1),
(29, 'App\\Models\\User', 1),
(30, 'App\\Models\\User', 1),
(31, 'App\\Models\\User', 1),
(32, 'App\\Models\\User', 1),
(33, 'App\\Models\\User', 1),
(34, 'App\\Models\\User', 1),
(35, 'App\\Models\\User', 1),
(36, 'App\\Models\\User', 1),
(37, 'App\\Models\\User', 1),
(38, 'App\\Models\\User', 1),
(39, 'App\\Models\\User', 1),
(40, 'App\\Models\\User', 1),
(41, 'App\\Models\\User', 1),
(42, 'App\\Models\\User', 1),
(43, 'App\\Models\\User', 1),
(44, 'App\\Models\\User', 1),
(45, 'App\\Models\\User', 1),
(46, 'App\\Models\\User', 1),
(47, 'App\\Models\\User', 1),
(48, 'App\\Models\\User', 1),
(49, 'App\\Models\\User', 1),
(50, 'App\\Models\\User', 1),
(51, 'App\\Models\\User', 1),
(52, 'App\\Models\\User', 1),
(53, 'App\\Models\\User', 1),
(54, 'App\\Models\\User', 1),
(55, 'App\\Models\\User', 1),
(56, 'App\\Models\\User', 1),
(57, 'App\\Models\\User', 1),
(58, 'App\\Models\\User', 1),
(59, 'App\\Models\\User', 1),
(60, 'App\\Models\\User', 1),
(61, 'App\\Models\\User', 1),
(62, 'App\\Models\\User', 1),
(63, 'App\\Models\\User', 1),
(64, 'App\\Models\\User', 1),
(65, 'App\\Models\\User', 1),
(66, 'App\\Models\\User', 1),
(67, 'App\\Models\\User', 1),
(68, 'App\\Models\\User', 1),
(69, 'App\\Models\\User', 1),
(70, 'App\\Models\\User', 1),
(71, 'App\\Models\\User', 1),
(72, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 2),
(4, 'App\\Models\\User', 2),
(5, 'App\\Models\\User', 2),
(6, 'App\\Models\\User', 2),
(7, 'App\\Models\\User', 2),
(8, 'App\\Models\\User', 2),
(9, 'App\\Models\\User', 2),
(10, 'App\\Models\\User', 2),
(11, 'App\\Models\\User', 2),
(12, 'App\\Models\\User', 2),
(13, 'App\\Models\\User', 2),
(14, 'App\\Models\\User', 2),
(15, 'App\\Models\\User', 2),
(16, 'App\\Models\\User', 2),
(17, 'App\\Models\\User', 2),
(18, 'App\\Models\\User', 2),
(19, 'App\\Models\\User', 2),
(20, 'App\\Models\\User', 2),
(21, 'App\\Models\\User', 2),
(22, 'App\\Models\\User', 2),
(23, 'App\\Models\\User', 2),
(24, 'App\\Models\\User', 2),
(25, 'App\\Models\\User', 2),
(26, 'App\\Models\\User', 2),
(27, 'App\\Models\\User', 2),
(28, 'App\\Models\\User', 2),
(29, 'App\\Models\\User', 2),
(30, 'App\\Models\\User', 2),
(31, 'App\\Models\\User', 2),
(32, 'App\\Models\\User', 2),
(33, 'App\\Models\\User', 2),
(34, 'App\\Models\\User', 2),
(35, 'App\\Models\\User', 2),
(36, 'App\\Models\\User', 2),
(37, 'App\\Models\\User', 2),
(38, 'App\\Models\\User', 2),
(39, 'App\\Models\\User', 2),
(40, 'App\\Models\\User', 2),
(41, 'App\\Models\\User', 2),
(42, 'App\\Models\\User', 2),
(43, 'App\\Models\\User', 2),
(44, 'App\\Models\\User', 2),
(45, 'App\\Models\\User', 2),
(46, 'App\\Models\\User', 2),
(47, 'App\\Models\\User', 2),
(48, 'App\\Models\\User', 2),
(49, 'App\\Models\\User', 2),
(50, 'App\\Models\\User', 2),
(51, 'App\\Models\\User', 2),
(52, 'App\\Models\\User', 2),
(53, 'App\\Models\\User', 2),
(54, 'App\\Models\\User', 2),
(55, 'App\\Models\\User', 2),
(56, 'App\\Models\\User', 2),
(57, 'App\\Models\\User', 2),
(58, 'App\\Models\\User', 2),
(59, 'App\\Models\\User', 2),
(60, 'App\\Models\\User', 2),
(61, 'App\\Models\\User', 2),
(62, 'App\\Models\\User', 2),
(63, 'App\\Models\\User', 2),
(64, 'App\\Models\\User', 2),
(65, 'App\\Models\\User', 2),
(66, 'App\\Models\\User', 2),
(67, 'App\\Models\\User', 2),
(68, 'App\\Models\\User', 2),
(69, 'App\\Models\\User', 2),
(70, 'App\\Models\\User', 2),
(71, 'App\\Models\\User', 2),
(72, 'App\\Models\\User', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 1),
(4, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 2),
(4, 'App\\Models\\User', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `particular` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` bigint NOT NULL DEFAULT '2000',
  `date` date NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `payment_by` bigint DEFAULT NULL,
  `transaction_id` bigint UNSIGNED DEFAULT NULL,
  `dealer_id` bigint UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `created_by_origin` int UNSIGNED DEFAULT NULL,
  `status` int DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_transaction_id_foreign` (`transaction_id`),
  KEY `payments_dealer_id_foreign` (`dealer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `particular`, `amount`, `date`, `desc`, `payment_by`, `transaction_id`, `dealer_id`, `updated_by`, `created_by`, `deleted_by`, `created_by_origin`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Hello ex amount 1000  app', 1000, '2022-03-01', NULL, 1, 3, 2, 1, 1, NULL, NULL, 1, NULL, '2022-03-10 10:44:00', NULL),
(2, 'Hello ex amount 9000  app', 9000, '2022-03-01', NULL, 9, 1, 9, 1, 6, NULL, NULL, 1, NULL, '2022-03-10 22:44:00', NULL),
(3, 'Hello ex amount 3000  app', 3000, '2022-01-31', NULL, 9, 3, 6, 1, 8, NULL, NULL, 1, NULL, '2022-03-10 22:44:00', NULL),
(4, 'Hello ex amount 7000  app', 7000, '2022-01-31', NULL, 3, 5, 5, 1, 5, NULL, NULL, 1, NULL, '2022-03-10 10:44:00', NULL),
(5, 'Hello ex amount 3000  app', 3000, '2022-01-31', NULL, 9, 4, 1, 1, 8, NULL, NULL, 1, NULL, '2022-03-10 22:44:00', NULL),
(6, 'Hello ex amount 9000  app', 9000, '2022-01-31', NULL, 6, 3, 1, 1, 8, NULL, NULL, 1, NULL, '2022-03-10 10:44:00', NULL),
(7, 'Hello ex amount 8000  app', 8000, '2022-02-28', NULL, 10, 5, 6, 1, 10, NULL, NULL, 1, NULL, '2022-03-13 04:47:00', NULL),
(8, 'Hello ex amount 10000  app', 10000, '2021-08-28', NULL, 3, 5, 3, 1, 6, NULL, NULL, 1, NULL, '2022-03-10 07:35:00', NULL),
(9, 'Hello ex amount 4000  app1', 4000, '2022-03-01', NULL, 10, 3, 5, 1, 8, NULL, NULL, 1, NULL, '2022-03-10 07:35:00', NULL),
(10, 'Hello ex amount 5000  app1', 5000, '2022-03-01', NULL, 6, 3, 8, 1, 6, NULL, NULL, 1, NULL, '2022-03-10 07:35:00', NULL),
(11, 'Hello ex amount 10000  app0', 10000, '2022-03-01', NULL, 4, 4, 9, 1, 1, NULL, NULL, 1, NULL, '2022-03-13 04:47:00', NULL),
(12, 'Hello ex amount 4000  app0', 4000, '2022-03-01', NULL, 4, 1, 3, 1, 10, NULL, NULL, 1, NULL, '2022-03-10 07:34:00', NULL),
(13, 'Hello ex amount 2000  app1', 2000, '2022-01-31', NULL, 3, 5, 7, 1, 5, NULL, NULL, 1, NULL, '2022-03-10 10:36:00', NULL),
(14, 'Hello ex amount 3000  app1', 3000, '2022-01-31', NULL, 4, 1, 9, 1, 3, NULL, NULL, 1, NULL, '2022-03-10 07:34:00', NULL),
(15, 'Hello ex amount 1000  app0', 1000, '2022-01-31', NULL, 4, 5, 4, 1, 10, NULL, NULL, 1, NULL, '2022-03-10 10:36:00', NULL),
(16, 'Hello ex amount 9000  app1', 9000, '2022-01-31', NULL, 7, 3, 9, 1, 1, NULL, NULL, 1, NULL, '2022-03-10 07:34:00', NULL),
(17, 'Hello ex amount 8000  app0', 8000, '2022-02-28', NULL, 2, 5, 4, 1, 3, NULL, NULL, 1, NULL, '2022-03-10 07:31:00', NULL),
(18, 'Hello ex amount 1000  app1', 1000, '2022-02-28', NULL, 3, 3, 5, 1, 4, NULL, NULL, 1, NULL, '2022-03-10 10:35:00', NULL),
(19, 'Hello ex amount 6000  app0', 6000, '2022-03-01', NULL, 7, 3, 2, 1, 9, NULL, NULL, 1, NULL, '2022-03-10 10:36:00', NULL),
(20, 'Hello ex amount 1000  app0', 1000, '2022-03-01', NULL, 8, 2, 4, 1, 1, NULL, NULL, 1, NULL, '2022-03-10 07:34:00', NULL),
(21, 'Hello ex amount 10000  app0', 10000, '2022-03-01', NULL, 5, 1, 7, 1, 9, NULL, NULL, 1, NULL, '2022-03-10 10:35:00', NULL),
(22, 'Hello ex amount 9000  app1', 9000, '2022-03-01', NULL, 4, 3, 6, 1, 10, NULL, NULL, 1, NULL, '2022-03-10 07:34:00', NULL),
(23, 'Hello ex amount 9000  app1', 9000, '2022-03-01', NULL, 7, 1, 5, 1, 8, NULL, NULL, 1, NULL, '2022-03-10 10:36:00', NULL),
(24, 'Hello ex amount 5000  app1', 5000, '2022-01-31', NULL, 10, 4, 2, 1, 6, NULL, NULL, 1, NULL, '2022-03-10 07:34:00', NULL),
(25, 'Hello ex amount 4000  app1', 4000, '2022-01-31', NULL, 8, 1, 9, 1, 1, NULL, NULL, 1, NULL, '2022-03-10 10:36:00', NULL),
(26, 'Hello ex amount 4000  app1', 4000, '2022-01-31', NULL, 3, 4, 9, 1, 4, NULL, NULL, 1, NULL, '2022-03-10 10:36:00', NULL),
(27, 'Hello ex amount 2000  app0', 2000, '2022-01-31', NULL, 2, 1, 1, 1, 10, NULL, NULL, 1, NULL, '2022-03-10 10:36:00', NULL),
(28, 'Hello ex amount 5000  app0', 5000, '2022-02-28', NULL, 8, 1, 5, 1, 8, NULL, NULL, 1, NULL, '2022-03-10 07:35:00', NULL),
(29, 'Hello ex amount 9000  app0', 9000, '2022-02-28', NULL, 1, 2, 5, 1, 9, NULL, NULL, 1, NULL, '2022-03-10 07:35:00', NULL),
(30, 'Dicta consequatur b', 5000, '2022-03-07', 'Expedita voluptatem', 1, 2, 2, 1, 1, NULL, NULL, 1, '2022-03-10 07:49:00', '2022-03-10 10:35:00', NULL),
(31, 'Dicta consequatur b', 8000, '2022-03-07', 'Expedita voluptatem', 1, 2, 3, 1, 1, NULL, NULL, 1, '2022-03-10 07:49:00', '2022-03-10 10:35:00', NULL),
(32, 'Dicta consequatur b', 10000, '2022-03-07', 'Expedita voluptatem', 1, 2, 4, 1, 1, NULL, NULL, 1, '2022-03-10 07:49:00', '2022-03-10 10:35:00', NULL),
(33, 'hello payment', 6000, '2022-01-31', '1000 Payment made to Dealer/Vendor', 1, 5, 2, 1, 1, NULL, NULL, 1, '2022-03-14 09:17:50', '2022-03-14 09:17:50', NULL),
(34, 'hello payment', 6000, '2022-01-31', '1000 Payment made to Dealer/Vendor', 1, 5, NULL, 1, 1, NULL, NULL, 1, '2022-03-14 09:18:07', '2022-03-14 09:18:07', NULL),
(35, 'hello payment', 6000, '2022-01-31', '1000 Payment made to Dealer/Vendor', 1, 5, 2, 1, 1, NULL, NULL, 1, '2022-03-14 09:18:43', '2022-03-14 09:18:43', NULL),
(36, 'hello payment', 6000, '2022-01-31', '1000 Payment made to Dealer/Vendor', 1, 5, 3, 1, 1, NULL, NULL, 1, '2022-03-14 09:18:46', '2022-03-14 09:18:46', NULL),
(37, 'hello payment', 6000, '2022-01-31', '1000 Payment made to Dealer/Vendor', 1, 5, 4, 1, 1, NULL, NULL, 1, '2022-03-14 09:18:48', '2022-03-14 09:18:48', NULL),
(38, 'hello payment', 6000, '2022-01-31', '1000 Payment made to Dealer/Vendor', 1, 5, 5, 1, 1, NULL, NULL, 1, '2022-03-14 09:18:51', '2022-03-14 09:18:51', NULL),
(39, 'hello payment', 6000, '2022-01-31', '1000 Payment made to Dealer/Vendor', 1, 5, 5, 1, 1, NULL, NULL, 1, '2022-03-14 09:19:27', '2022-03-14 09:19:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`, `display_name`) VALUES
(1, 'project-create', 'web', '2022-03-14 09:03:07', '2022-03-14 09:03:07', 'Project +Add'),
(2, 'project-show', 'web', '2022-03-14 09:03:07', '2022-03-14 09:03:07', 'Project View'),
(3, 'project-edit', 'web', '2022-03-14 09:03:07', '2022-03-14 09:03:07', 'Project modify'),
(4, 'project-delete', 'web', '2022-03-14 09:03:07', '2022-03-14 09:03:07', 'Project Delete'),
(5, 'project-list-all', 'web', '2022-03-14 09:03:07', '2022-03-14 09:03:07', 'Project list-all'),
(6, 'project-list-wip', 'web', '2022-03-14 09:03:07', '2022-03-14 09:03:07', 'Project list-wip'),
(7, 'project-list-finish', 'web', '2022-03-14 09:03:07', '2022-03-14 09:03:07', 'Project list-finish'),
(8, 'project-income-show', 'web', '2022-03-14 09:03:08', '2022-03-14 09:03:08', 'Project Income Visible '),
(9, 'project-expense-show', 'web', '2022-03-14 09:03:08', '2022-03-14 09:03:08', 'Project Expense Visible '),
(10, 'project-view-budget', 'web', '2022-03-14 09:03:08', '2022-03-14 09:03:08', 'Project Value Visible'),
(11, 'project-mark-as-finish', 'web', '2022-03-14 09:03:08', '2022-03-14 09:03:08', 'Project mark as completed'),
(12, 'fund-create', 'web', '2022-03-14 09:03:08', '2022-03-14 09:03:08', 'PettyCash +Add '),
(13, 'fund-list-self', 'web', '2022-03-14 09:03:08', '2022-03-14 09:03:08', 'PettyCash List self'),
(14, 'fund-list-all', 'web', '2022-03-14 09:03:08', '2022-03-14 09:03:08', 'PettyCash List All '),
(15, 'fund-show-self', 'web', '2022-03-14 09:03:08', '2022-03-14 09:03:08', 'PettyCash View only Self'),
(16, 'fund-delete-self', 'web', '2022-03-14 09:03:08', '2022-03-14 09:03:08', 'PettyCash Delete Self'),
(17, 'fund-delete-all', 'web', '2022-03-14 09:03:08', '2022-03-14 09:03:08', 'PettyCash Delete Any Entry'),
(18, 'expense-create', 'web', '2022-03-14 09:03:08', '2022-03-14 09:03:08', 'Expense Add'),
(19, 'expense-list-all', 'web', '2022-03-14 09:03:08', '2022-03-14 09:03:08', 'Expense list all'),
(20, 'expense-list-self', 'web', '2022-03-14 09:03:08', '2022-03-14 09:03:08', 'Expense list self'),
(21, 'expense-show-self', 'web', '2022-03-14 09:03:08', '2022-03-14 09:03:08', 'Expense View Self'),
(22, 'expense-show-all', 'web', '2022-03-14 09:03:08', '2022-03-14 09:03:08', 'Expense View all'),
(23, 'expense-approval', 'web', '2022-03-14 09:03:08', '2022-03-14 09:03:08', 'Expense Approval'),
(24, 'expense-edit', 'web', '2022-03-14 09:03:08', '2022-03-14 09:03:08', 'Expense edit'),
(25, 'expense-edit-self', 'web', '2022-03-14 09:03:08', '2022-03-14 09:03:08', 'Expense edit self'),
(26, 'expense-delete-self', 'web', '2022-03-14 09:03:08', '2022-03-14 09:03:08', 'Expense delete self'),
(27, 'income-create', 'web', '2022-03-14 09:03:08', '2022-03-14 09:03:08', 'Income Receive'),
(28, 'income-list-all', 'web', '2022-03-14 09:03:08', '2022-03-14 09:03:08', 'Income list-all'),
(29, 'income-list-self', 'web', '2022-03-14 09:03:08', '2022-03-14 09:03:08', 'income list-self'),
(30, 'income-delete-self', 'web', '2022-03-14 09:03:08', '2022-03-14 09:03:08', 'Income Delete Self'),
(31, 'income-delete-all', 'web', '2022-03-14 09:03:08', '2022-03-14 09:03:08', 'Income Delete Any Entry'),
(32, 'income-edit', 'web', '2022-03-14 09:03:08', '2022-03-14 09:03:08', 'Income edit'),
(33, 'income-edit-self', 'web', '2022-03-14 09:03:08', '2022-03-14 09:03:08', 'Income edit-self'),
(34, 'dealer-create', 'web', '2022-03-14 09:03:08', '2022-03-14 09:03:08', 'Vendor Add'),
(35, 'dealer-list', 'web', '2022-03-14 09:03:08', '2022-03-14 09:03:08', 'Vendor List all '),
(36, 'dealer-show', 'web', '2022-03-14 09:03:08', '2022-03-14 09:03:08', 'Vendor Show details'),
(37, 'dealer-edit', 'web', '2022-03-14 09:03:08', '2022-03-14 09:03:08', 'Vendor Edit'),
(38, 'dealer-delete', 'web', '2022-03-14 09:03:08', '2022-03-14 09:03:08', 'Vendor Delete'),
(39, 'transaction-create', 'web', '2022-03-14 09:03:08', '2022-03-14 09:03:08', 'Payment Transaction create'),
(40, 'transaction-list', 'web', '2022-03-14 09:03:08', '2022-03-14 09:03:08', 'Payment Transaction list'),
(41, 'transaction-edit', 'web', '2022-03-14 09:03:09', '2022-03-14 09:03:09', 'Payment Transaction edit'),
(42, 'transaction-delete', 'web', '2022-03-14 09:03:09', '2022-03-14 09:03:09', 'Payment Transaction delete'),
(43, 'role-list', 'web', '2022-03-14 09:03:09', '2022-03-14 09:03:09', 'Role list'),
(44, 'role-create', 'web', '2022-03-14 09:03:09', '2022-03-14 09:03:09', 'Role Add'),
(45, 'role-edit', 'web', '2022-03-14 09:03:09', '2022-03-14 09:03:09', 'Role Modify'),
(46, 'role-delete', 'web', '2022-03-14 09:03:09', '2022-03-14 09:03:09', 'Role Delete'),
(47, 'permission-list', 'web', '2022-03-14 09:03:09', '2022-03-14 09:03:09', 'Permission list'),
(48, 'permission-create', 'web', '2022-03-14 09:03:09', '2022-03-14 09:03:09', 'Permission Add'),
(49, 'permission-edit', 'web', '2022-03-14 09:03:09', '2022-03-14 09:03:09', 'Permission Modify'),
(50, 'user-create', 'web', '2022-03-14 09:03:09', '2022-03-14 09:03:09', 'User Register'),
(51, 'user-edit-all', 'web', '2022-03-14 09:03:09', '2022-03-14 09:03:09', 'User edit all'),
(52, 'user-edit-self', 'web', '2022-03-14 09:03:09', '2022-03-14 09:03:09', 'User edit self'),
(53, 'user-list-all', 'web', '2022-03-14 09:03:09', '2022-03-14 09:03:09', 'User List all '),
(54, 'dashboard-pivot', 'web', '2022-03-14 09:03:09', '2022-03-14 09:03:09', 'Dashboard View'),
(55, 'dashboard-project-expense', 'web', '2022-03-14 09:03:09', '2022-03-14 09:03:09', 'Dashboard For Project Expenses'),
(56, 'dashboard-all-project-expense', 'web', '2022-03-14 09:03:09', '2022-03-14 09:03:09', 'Dashboard For All Project Expenses'),
(57, 'dashboard-income-self', 'web', '2022-03-14 09:03:09', '2022-03-14 09:03:09', 'Dashboard For User income-self'),
(58, 'dashboard-income-all', 'web', '2022-03-14 09:03:09', '2022-03-14 09:03:09', 'Dashboard For User income-all'),
(59, 'switch-account', 'web', '2022-03-14 09:03:09', '2022-03-14 09:03:09', 'Switch Account'),
(60, 'export-dealer-expense', 'web', '2022-03-14 09:03:09', '2022-03-14 09:03:09', 'Export vendor expense sheet'),
(61, 'export-project-income', 'web', '2022-03-14 09:03:09', '2022-03-14 09:03:09', 'Export project income sheet'),
(62, 'salary-create', 'web', '2022-03-14 09:03:09', '2022-03-14 09:03:09', 'Salary Add'),
(63, 'salary-list-all', 'web', '2022-03-14 09:03:09', '2022-03-14 09:03:09', 'Salary list all'),
(64, 'salary-list-self', 'web', '2022-03-14 09:03:09', '2022-03-14 09:03:09', 'Salary list self'),
(65, 'salary-show-self', 'web', '2022-03-14 09:03:09', '2022-03-14 09:03:09', 'Salary View Self'),
(66, 'salary-show-all', 'web', '2022-03-14 09:03:09', '2022-03-14 09:03:09', 'Salary View all'),
(67, 'salary-edit-all', 'web', '2022-03-14 09:03:09', '2022-03-14 09:03:09', 'Salary edit all'),
(68, 'salary-edit-self', 'web', '2022-03-14 09:03:09', '2022-03-14 09:03:09', 'Salary edit self'),
(69, 'payment-list-all', 'web', '2022-03-14 09:03:09', '2022-03-14 09:03:09', 'Payment Add'),
(70, 'advance-create', 'web', '2022-03-14 09:03:09', '2022-03-14 09:03:09', 'Advance Add'),
(71, 'advance-list-all', 'web', '2022-03-14 09:03:09', '2022-03-14 09:03:09', 'Advance list all'),
(72, 'advance-list-self', 'web', '2022-03-14 09:03:09', '2022-03-14 09:03:09', 'Advance list self');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', '824e15859ccd08f95a4c37c5dd91ebb6cb9b75197d3597019fd373db9117e6f9', '[\"*\"]', '2022-03-14 09:31:59', '2022-03-14 09:05:49', '2022-03-14 09:31:59'),
(2, 'App\\Models\\User', 1, 'auth_token', '0217902c050b5559711390374cdda691c30b61e3f09da56522c9b16fd319049a', '[\"*\"]', '2022-03-14 10:29:04', '2022-03-14 09:20:04', '2022-03-14 10:29:04');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
CREATE TABLE IF NOT EXISTS `projects` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `client` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Compnay Client',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `budget` bigint NOT NULL DEFAULT '0',
  `s_date` date NOT NULL,
  `e_date` date DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Whitefield',
  `p_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sqft` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `wip` tinyint(1) NOT NULL DEFAULT '1',
  `address` text COLLATE utf8mb4_unicode_ci,
  `income` bigint NOT NULL DEFAULT '0',
  `expense` bigint NOT NULL DEFAULT '0',
  `updated_by` int UNSIGNED DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` int DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `projects_title_unique` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `client`, `title`, `budget`, `s_date`, `e_date`, `location`, `p_type`, `sqft`, `wip`, `address`, `income`, `expense`, `updated_by`, `created_by`, `deleted_by`, `deleted_at`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Irma Zemlak', 'hand.com153', 475256, '1990-08-09', '1990-09-13', 'Florineview', 'Penthouse', '9984', 1, 'Voluptatem expedita nobis doloremque fugit eius dolorum. Dolor ducimus voluptatem voluptatum nobis. Neque neque velit quidem et.', 8104, 6194, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(2, 'Grant Herzog', 'mccullough.net536', 745340, '1982-05-03', '1982-05-10', 'Hankton', 'ResidencyProType', '5694', 0, 'Fugiat dolorem sunt nobis aut quia dolor reprehenderit. Voluptates rerum molestiae aperiam pariatur qui. Dignissimos sunt quidem repudiandae sit. Ea molestias doloribus sequi harum recusandae.', 6600, 3093, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(3, 'Prof. Hillard Barrows', 'bernhard.com505', 383443, '2013-07-05', '2013-08-02', 'Pricetown', 'Villa', '8314', 1, 'Facere maxime dignissimos aut corrupti reprehenderit aut vero. Quod quas quis qui ad. Rerum facilis rerum quam. Tenetur voluptatibus necessitatibus rem minima ea. Facilis praesentium dolorem et nostrum quia ducimus omnis.', 6207, 8732, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(4, 'Miss Malvina King Sr.', 'miller.com294', 921066, '1985-11-21', '1985-12-19', 'Andersonbury', 'ResidencyProType', '3736', 0, 'Minus voluptatem esse consequatur ut architecto modi et. Aut ut dolorum deserunt ea facere quia ut. Est veniam unde repellat sint.', 9230, 6258, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(5, 'Ara Feest', 'goodwin.com630', 729526, '1990-07-21', '1990-08-25', 'East Emilbury', 'Apartment', '9719', 0, 'Amet rem quisquam repudiandae corrupti dolor nam. Eveniet ut unde est facilis voluptas. Molestias aut asperiores ut et.', 6859, 3816, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(6, 'Lamont Little', 'wilderman.com115', 201875, '2021-08-29', '2021-10-24', 'McDermottbury', 'ResidencyProType', '3691', 1, 'Enim atque rerum magni. Amet dicta sed culpa ab est et. Neque cum fugiat perferendis porro.', 5268, 5065, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(7, 'Mr. Gustave West', 'goodwin.net892', 990986, '1980-04-01', '1980-04-08', 'Gladysshire', 'ResidencyProType', '8533', 0, 'Quasi non est eos repellendus corrupti incidunt tempora veritatis. Excepturi ea sed aut error porro explicabo qui. Reprehenderit at consequatur culpa possimus et voluptatem.', 5482, 2072, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(8, 'Ms. June Heaney', 'stracke.com679', 564687, '2004-12-22', '2005-02-23', 'Rutherfordview', 'Apartment', '9004', 0, 'Aut quo sit ea ut. Omnis maxime vel quisquam doloribus sunt ut enim. Veniam quia quia blanditiis ab totam numquam similique rerum.', 8491, 9915, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(9, 'Trever Murphy III', 'bayer.com29', 486008, '2010-07-15', '2010-09-09', 'Shannontown', 'Villa', '5670', 0, 'Aut neque eum consequatur et optio ratione. Labore porro ut sint aut beatae qui. Sunt ut deserunt voluptate architecto tenetur praesentium. Ipsum nesciunt quae et ratione excepturi assumenda.', 201, 6044, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(10, 'Antonina Grady', 'howell.org499', 245054, '1989-07-29', '1989-08-26', 'North Lyda', 'Penthouse', '7767', 1, 'Omnis est laborum atque adipisci. Exercitationem enim perferendis incidunt dolor alias nostrum quibusdam. Tenetur id id ea qui. Vero aperiam qui consequuntur quibusdam sed aut et.', 1400, 5771, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(11, 'Elizabeth Upton', 'carter.com684', 334379, '1988-01-01', '1988-01-15', 'East Ivah', 'Villa', '5450', 1, 'Molestiae praesentium sint nisi consequatur. Omnis magni et velit beatae dignissimos eius. Et autem et eaque quis et. Molestias dicta officia sunt rerum. Voluptatem sed ut eius et.', 2434, 809, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(12, 'Bridget Brown', 'murphy.com459', 577276, '2015-06-22', '2015-08-17', 'O\'Konview', 'Villa', '6021', 0, 'Quia cumque saepe aspernatur ea totam beatae alias laudantium. Quo nostrum rem voluptatem recusandae consequatur quia. Iure fugit ut cumque consequatur et odio.', 2066, 5032, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(13, 'Sage Abernathy', 'gleichner.biz473', 320785, '2012-01-08', '2012-03-04', 'Wilfordstad', 'Penthouse', '6588', 0, 'Libero voluptatem voluptatibus rerum quas. Ut quo rem doloribus repellendus laudantium. Velit asperiores recusandae nisi omnis nostrum possimus.', 1206, 2992, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(14, 'Prof. Jermain Boyer', 'bergnaum.net893', 266462, '2006-11-02', '2007-01-04', 'Lake Margretberg', 'Villa', '3222', 0, 'Quis vitae dicta aut distinctio odit occaecati. Non dolores blanditiis nam illum. Dolorum tenetur corrupti omnis amet ad ut sunt. Dolorem repudiandae dicta placeat numquam.', 1033, 8214, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(15, 'Ivory O\'Reilly', 'lakin.com351', 848452, '2000-12-18', '2001-01-15', 'Marksville', 'Penthouse', '7817', 1, 'Magnam harum odio blanditiis fuga ab consequatur sit aut. Natus unde aspernatur sed voluptatibus et nemo. Et recusandae qui ut tenetur ipsum dolores. Sed sit saepe recusandae nostrum numquam voluptas.', 4533, 7590, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(16, 'Prof. Seth Heathcote II', 'thompson.com290', 477990, '1979-11-16', '1979-12-14', 'Lake Isaac', 'Villa', '4017', 0, 'Id et quo sed asperiores. Qui minus maxime enim temporibus tempore voluptatem ut. Praesentium quo consectetur voluptatem vel et natus corrupti.', 8383, 4811, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(17, 'Mr. Nathan Predovic', 'nikolaus.com985', 907659, '1989-08-25', '1989-09-01', 'Raynorland', 'Apartment', '8501', 1, 'Dolorum qui tenetur et ea. Ut sed delectus quia expedita qui. Ratione et provident et architecto nulla et voluptates molestiae.', 6601, 2023, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(18, 'Leland Sawayn', 'spinka.org782', 499638, '1976-10-31', '1976-11-07', 'Port Noelstad', 'Villa', '5364', 0, 'Quis nobis laborum dicta omnis voluptas provident. Perferendis voluptas laudantium velit ea sequi possimus saepe quaerat. Veniam iure qui et voluptatibus consequuntur culpa beatae quo.', 918, 6563, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(19, 'Ms. Minerva Fahey', 'skiles.com921', 465136, '2020-08-01', '2020-09-05', 'Agustintown', 'ResidencyProType', '4085', 0, 'Ut provident voluptatem et et voluptatem placeat. Dignissimos doloremque natus impedit aut. Optio aspernatur illo voluptatem dolores.', 8685, 7242, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(20, 'Dixie Monahan', 'purdy.com667', 426631, '1979-08-09', '1979-09-20', 'Lake Amaniville', 'Villa', '9810', 1, 'Facere sed quis sit dolores. Sint est et sint et at illum exercitationem rem. In quibusdam quia eos.', 4008, 3040, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(21, 'Brain Romaguera', 'swift.com341', 681639, '1992-11-14', '1992-12-19', 'West Mohammedburgh', 'Apartment', '8862', 0, 'Similique libero magnam blanditiis adipisci officiis. Assumenda eius sit et. Reiciendis tempora esse ut sapiente.', 4280, 1286, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(22, 'Earlene Reinger', 'davis.com336', 841844, '1984-06-08', '1984-07-27', 'South Lethafurt', 'Penthouse', '8446', 0, 'Maiores vitae nesciunt ex consequatur. Aut nemo provident sequi quos illo praesentium fuga. Sed pariatur libero natus ad.', 3406, 9328, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(23, 'Ms. Icie Lesch', 'heidenreich.com243', 591887, '1977-09-23', '1977-10-21', 'Williamsonfurt', 'Villa', '6305', 1, 'Qui tenetur eaque voluptatem quia et esse. Aspernatur sit consectetur ad optio dolorum voluptas. Praesentium sequi saepe libero a provident. Eum eligendi ex nostrum nesciunt sed.', 5626, 4398, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(24, 'Noelia Wolff', 'harvey.com873', 115560, '1990-07-02', '1990-09-10', 'Willystad', 'Penthouse', '7688', 0, 'Expedita aut vitae laborum iste quasi impedit sunt. Quidem nesciunt maiores et fugit. Eius aut fugiat in porro atque nostrum error enim.', 9077, 1004, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(25, 'Abelardo Lang', 'trantow.com663', 874410, '2008-02-14', '2008-04-10', 'Erdmanfort', 'ResidencyProType', '5521', 0, 'Aliquam necessitatibus fuga est neque quam reprehenderit quia. Reiciendis quibusdam eaque consequatur ab architecto et. Harum molestias enim illo soluta eum labore. Quia quia quisquam eum ea necessitatibus voluptas.', 1065, 2525, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(26, 'Marjolaine Mann', 'heaney.biz626', 235568, '2014-11-27', '2015-01-01', 'East Jonathon', 'Villa', '5968', 1, 'Sed fugit illo aut reiciendis saepe cupiditate sit. Aut quis expedita libero voluptatum. Rerum molestiae ut dicta saepe aut quam.', 8421, 7130, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(27, 'Mr. Barry Terry DDS', 'green.org875', 566485, '2014-06-26', '2014-07-10', 'Prosaccochester', 'Villa', '4390', 1, 'Impedit deserunt reiciendis aut. Aut neque debitis perspiciatis quia. Voluptates quo quasi debitis quia. Quo ducimus quaerat est suscipit dolor alias.', 3085, 9626, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(28, 'Felicia Metz PhD', 'von.com984', 394448, '1990-08-12', '1990-08-19', 'Kuvalisburgh', 'Villa', '9708', 1, 'Est ut magnam at eligendi asperiores. Similique dolore aut architecto in fugit. Et velit odio dolorem ut eaque dolor. Minima sapiente ratione corporis. Culpa repellendus soluta aliquam eligendi.', 1046, 953, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(29, 'Clair Kling', 'kozey.com59', 449011, '1986-09-18', '1986-10-16', 'Luzfurt', 'Villa', '5450', 1, 'Sint quis quis sed autem quia est praesentium illo. Rerum laudantium ut unde ea eos nihil quis.', 9682, 7754, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(30, 'Mr. Jonas Balistreri DDS', 'labadie.net57', 307183, '1983-05-01', '1983-05-08', 'Josefinafort', 'ResidencyProType', '5487', 0, 'Ab culpa vitae molestiae blanditiis nihil sint molestias excepturi. Est aut ullam enim sed. Placeat voluptatem occaecati nihil aut eius in eveniet.', 8194, 3203, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(31, 'Warren Carter', 'zboncak.com196', 994830, '2021-08-01', '2021-08-15', 'Halvorsonchester', 'Villa', '6181', 1, 'Dolorem aut velit dolorum. Ea autem sunt qui esse sed illum quo ex. Laboriosam qui ea vel sequi asperiores autem placeat.', 464, 9427, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(32, 'Ms. Stephania Kunde', 'spencer.com192', 755810, '2017-03-18', '2017-05-20', 'Port Timmothy', 'ResidencyProType', '5184', 0, 'Ut ratione dolorem consequatur suscipit est. Alias dolore quia et. Ea quod quo ea quia ipsum ut.', 1697, 5849, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(33, 'Colt Schmitt', 'bruen.com609', 937284, '1994-04-19', '1994-05-17', 'Kubport', 'Penthouse', '4582', 1, 'Optio reprehenderit dignissimos nisi laudantium fugiat. Possimus sit rerum libero molestiae modi. Dolor et voluptatem omnis voluptatibus eveniet perferendis.', 3441, 5864, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(34, 'Efren Stracke', 'bernier.com84', 191018, '1975-01-08', '1975-02-19', 'Angeloport', 'ResidencyProType', '6144', 0, 'Maxime minus reprehenderit omnis eum inventore totam. Aut quo sint sed est culpa.', 8341, 1683, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(35, 'Dr. Kassandra Boehm', 'bernier.biz34', 261794, '2006-01-08', '2006-01-15', 'North Wilhelmineborough', 'Villa', '8653', 0, 'Aut dolor ipsa natus explicabo optio consequatur. Quia tempore occaecati possimus ab nulla. Cum voluptas perferendis earum repellat et ex. Ducimus sit accusamus distinctio soluta numquam tempore quos laboriosam.', 9892, 704, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(36, 'Prof. Heather Borer', 'halvorson.org15', 962003, '1979-06-29', '1979-07-27', 'Toneyshire', 'ResidencyProType', '5871', 1, 'Officiis doloribus dignissimos sint. Possimus ea magni in nostrum nam reiciendis. Nisi molestiae deleniti cupiditate consequatur est. Et est a repellat.', 7754, 4462, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(37, 'Corrine O\'Conner', 'fay.biz2', 287194, '2019-02-13', '2019-04-10', 'East Providenciport', 'Penthouse', '7827', 1, 'Possimus vel ut illum. Ut atque expedita quisquam et officia rerum fuga. Ut id tempora occaecati.', 1237, 2388, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(38, 'Amiya Mosciski', 'ortiz.com216', 700579, '2001-02-06', '2001-04-10', 'Cartertown', 'Apartment', '8877', 0, 'Sit veritatis consequatur iusto quibusdam illo. Quos est nostrum impedit. Consequatur quo accusantium et fugit voluptatem tempora. Iure et ratione quasi et perferendis ullam illo.', 9188, 227, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(39, 'Leopold Fadel', 'stroman.com916', 746059, '2007-09-27', '2007-11-15', 'Oliverstad', 'Villa', '8816', 0, 'Reprehenderit aut autem voluptates ut et saepe iure itaque. Aut provident facilis qui accusantium autem autem nihil fuga. Et eaque voluptas assumenda sit dicta blanditiis animi. Qui qui sit voluptates quo ducimus et vel.', 3555, 6112, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(40, 'Mr. Regan Hyatt Sr.', 'haag.com673', 276832, '1987-04-02', '1987-05-07', 'East Everette', 'Apartment', '9529', 0, 'Aut non nisi doloribus quos quis dolorum necessitatibus. Placeat vitae est dolorem inventore. Quaerat culpa aut ut ut occaecati fuga error. Ut qui odio sit adipisci temporibus pariatur dolores.', 3234, 7156, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(41, 'Holly Herzog', 'cartwright.info439', 995868, '2020-02-24', '2020-05-04', 'Lake Zoe', 'Penthouse', '6832', 1, 'Fugit rem eum vel qui optio omnis sequi. Sit voluptatem praesentium quo nam. Quidem blanditiis perferendis occaecati eius. Labore animi facilis eveniet et harum perspiciatis.', 4125, 3941, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(42, 'Mrs. Genesis Johnson', 'mayert.net467', 574696, '1978-05-05', '1978-05-12', 'West Mabellestad', 'Villa', '4836', 0, 'Nihil et nihil nihil autem. Nihil ratione commodi neque repellendus esse. Atque modi accusantium facilis fuga ratione aliquam. Totam adipisci molestiae dolorem provident non.', 7102, 6959, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(43, 'Billy Gleichner MD', 'windler.com48', 118273, '1984-09-15', '1984-11-03', 'Langworthfort', 'ResidencyProType', '6622', 0, 'Numquam numquam rerum ut aut corrupti ut. Distinctio sint ut deleniti occaecati. Doloribus quis placeat blanditiis excepturi eum repudiandae sit. Inventore est eos adipisci qui dolor. Libero est omnis aliquid assumenda.', 9468, 3627, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(44, 'Salma Ryan', 'howell.biz141', 574799, '2015-06-05', '2015-06-26', 'Turnertown', 'Apartment', '6256', 1, 'Quibusdam cupiditate dicta quia consequatur ut illum earum. Quam alias deleniti rerum numquam reprehenderit ea. Quibusdam eligendi quod perferendis corporis. Quas aut earum sed quod eum explicabo excepturi.', 4652, 8093, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(45, 'Hank Bode', 'sporer.com649', 940976, '1995-09-11', '1995-11-20', 'West Yeseniaview', 'ResidencyProType', '6280', 0, 'Odit totam fuga ut dolore. Eligendi dolores distinctio ratione qui non perspiciatis sapiente. Eos facere velit non sunt ut qui. Possimus rem omnis voluptatem qui dolores.', 4841, 8132, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(46, 'Dr. Lorenza Christiansen', 'schultz.info91', 603062, '1996-06-07', '1996-08-09', 'West Bretmouth', 'Villa', '5840', 1, 'Eaque commodi est ab. Saepe qui facilis odio vero ipsam autem. Et et et facilis omnis perferendis beatae. Itaque corporis natus autem voluptate autem porro.', 6057, 390, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(47, 'Cristal Hoppe', 'kling.org395', 193634, '2005-06-15', '2005-07-13', 'Port Ulises', 'Apartment', '4635', 0, 'Aspernatur consequatur perspiciatis dolores accusantium debitis. Optio quo quis soluta ipsam dolorem corporis. Laborum autem placeat et aspernatur qui dolore facere. Sed et molestiae voluptates repellat sed non.', 2821, 5230, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(48, 'April Little', 'bins.org739', 837755, '2013-05-20', '2013-06-10', 'New Uriahville', 'ResidencyProType', '6691', 1, 'Explicabo a fugit inventore ratione. Rem voluptates ipsa neque cum sit reprehenderit quia. Illum et excepturi illum voluptate ullam est odio.', 7719, 6310, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(49, 'Prof. Chet Rippin Sr.', 'kihn.com891', 321252, '2010-08-08', '2010-08-22', 'West Jordanfurt', 'Apartment', '5369', 1, 'Aut voluptatem ipsa commodi necessitatibus nesciunt voluptas. Omnis reiciendis dolorem recusandae et molestias. In alias qui et est.', 1948, 9861, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(50, 'Prof. Ceasar Williamson', 'mohr.net587', 927522, '1982-05-29', '1982-06-26', 'Heidenreichville', 'Apartment', '5992', 1, 'Et sunt quisquam vel quo. Maiores vel ut dolor ducimus. Sint officiis consequatur vitae voluptatem.', 1709, 7881, NULL, NULL, NULL, NULL, 1, '2022-03-14 09:03:14', '2022-03-14 09:03:14');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`, `display_name`) VALUES
(1, 'admin', 'web', NULL, NULL, NULL),
(2, 'team', 'web', NULL, NULL, NULL),
(3, 'accountant', 'web', NULL, NULL, NULL),
(4, 'executive', 'web', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salaries`
--

DROP TABLE IF EXISTS `salaries`;
CREATE TABLE IF NOT EXISTS `salaries` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `month_year` date NOT NULL,
  `amount` int NOT NULL,
  `deduction` int DEFAULT '0',
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salaries_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salaries`
--

INSERT INTO `salaries` (`id`, `user_id`, `month_year`, `amount`, `deduction`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, '2021-12-17', 4500, 0, NULL, NULL, NULL, '2022-03-14 09:03:10', '2022-03-14 09:03:10', NULL),
(2, 4, '2021-12-30', 2500, 0, NULL, NULL, NULL, '2022-03-14 09:03:11', '2022-03-14 09:03:11', NULL),
(3, 5, '2021-09-10', 7000, 0, NULL, NULL, NULL, '2022-03-14 09:03:11', '2022-03-14 09:03:11', NULL),
(4, 6, '2021-12-28', 3500, 0, NULL, NULL, NULL, '2022-03-14 09:03:12', '2022-03-14 09:03:12', NULL),
(5, 7, '2021-11-23', 4500, 0, NULL, NULL, NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', NULL),
(6, 8, '2021-08-04', 1500, 0, NULL, NULL, NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', NULL),
(7, 9, '2022-01-08', 4500, 0, NULL, NULL, NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', NULL),
(8, 10, '2021-05-29', 1500, 0, NULL, NULL, NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', NULL),
(9, 11, '2021-07-10', 7000, 0, NULL, NULL, NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', NULL),
(10, 12, '2021-12-26', 1500, 0, NULL, NULL, NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', NULL),
(11, 13, '2021-04-20', 500, 0, NULL, NULL, NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', NULL),
(12, 14, '2022-01-25', 3000, 0, NULL, NULL, NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `status` int DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transactions_type_unique` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `type`, `desc`, `updated_by`, `created_by`, `deleted_by`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Cash', 'This is Description FOR Cash', NULL, NULL, NULL, 0, NULL, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(2, 'Google pay', 'This is Description FOR Google pay', NULL, NULL, NULL, 0, NULL, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(3, 'Phone Pay', 'This is Description FOR Phone Pay', NULL, NULL, NULL, 1, NULL, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(4, 'Paytm', 'This is Description FOR Paytm', NULL, NULL, NULL, 0, NULL, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(5, 'Account Transfer', 'This is Description FOR Account Transfer', NULL, NULL, NULL, 1, NULL, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(6, 'Cheque', 'This is Description FOR Cheque', NULL, NULL, NULL, 0, NULL, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(7, 'Card payment', 'This is Description FOR Card payment', NULL, NULL, NULL, 0, NULL, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(8, 'Current Account Transfer', 'This is Description FOR Current Account Transfer', NULL, NULL, NULL, 0, NULL, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(9, 'Deduction/Penalty', 'This is Description FOR Deduction/Penalty', NULL, NULL, NULL, 1, NULL, '2022-03-14 09:03:14', '2022-03-14 09:03:14'),
(10, 'Other', 'This is Description FOR Other', NULL, NULL, NULL, 1, NULL, '2022-03-14 09:03:14', '2022-03-14 09:03:14');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` int DEFAULT NULL,
  `fund` bigint NOT NULL DEFAULT '0',
  `role_id` int DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `doj` date DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `education` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'executive',
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint DEFAULT '1',
  `is_abstract` tinyint DEFAULT '0',
  `updated_by` int UNSIGNED DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `pic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `salary`, `fund`, `role_id`, `email`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `mobile`, `dob`, `doj`, `address`, `education`, `user_type`, `link`, `active`, `is_abstract`, `updated_by`, `created_by`, `deleted_by`, `pic`, `remember_token`, `deleted_at`, `created_at`, `updated_at`, `status`, `email_verified_at`) VALUES
(1, 'dipensavji', 20000, 0, 2, 'dipensavji@gmail.com', '$2y$10$0bJA0VENuOzRT2ZCs1O9ieY1SBPKMbXv2IeF5b1VPuRsdNBGFRoEy', NULL, NULL, '9725722743', '2020-12-14', '2021-09-14', 'Permanent Address of Users is ...', NULL, 'executive', 'www.facebook.com/dipen.parmar.186', 1, 0, NULL, NULL, NULL, 'img/profile_pic.png', NULL, NULL, '2022-03-14 09:03:09', '2022-03-14 09:03:09', 1, NULL),
(2, 'amar', 30000, 0, 2, 'amar@gmail.com', '$2y$10$N/Ys3JYil5nUFHFdKU34L.sJmI.aMhG2em6sfLDcba/bEe4szCIfq', NULL, NULL, '9725723241', '2021-06-14', '2020-05-14', 'Permanent Address of Users is ...', NULL, 'executive', 'www.facebook.com/dipen.parmar.186', 1, 0, NULL, NULL, NULL, 'img/profile_pic.png', NULL, NULL, '2022-03-14 09:03:10', '2022-03-14 09:03:10', 1, NULL),
(3, 'Mr. Cristobal Tremblay Jr.', NULL, 0, NULL, 'thilpert@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'executive', NULL, 1, 0, NULL, NULL, NULL, NULL, 'CGchPWt1Tp', NULL, '2022-03-14 09:03:10', '2022-03-14 09:03:10', 1, '2022-03-14 09:03:10'),
(4, 'Kameron Kulas', NULL, 0, NULL, 'hwaters@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'executive', NULL, 1, 0, NULL, NULL, NULL, NULL, 'InZ4MUGFgL', NULL, '2022-03-14 09:03:10', '2022-03-14 09:03:10', 1, '2022-03-14 09:03:10'),
(5, 'Maia Toy', NULL, 0, NULL, 'danielle.gutmann@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'executive', NULL, 1, 0, NULL, NULL, NULL, NULL, 'Ahz6Hh3KFL', NULL, '2022-03-14 09:03:11', '2022-03-14 09:03:11', 1, '2022-03-14 09:03:10'),
(6, 'Chasity Stroman', NULL, 0, NULL, 'nader.marilyne@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'executive', NULL, 1, 0, NULL, NULL, NULL, NULL, 'TYweuTrEKh', NULL, '2022-03-14 09:03:11', '2022-03-14 09:03:11', 1, '2022-03-14 09:03:10'),
(7, 'Dr. Kristian Cartwright III', NULL, 0, NULL, 'lizzie24@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'executive', NULL, 1, 0, NULL, NULL, NULL, NULL, 'V69Y3pSn35', NULL, '2022-03-14 09:03:12', '2022-03-14 09:03:12', 1, '2022-03-14 09:03:10'),
(8, 'Elva Jast', NULL, 0, NULL, 'nokon@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'executive', NULL, 1, 0, NULL, NULL, NULL, NULL, 'm7lcIcn6fv', NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', 1, '2022-03-14 09:03:10'),
(9, 'Morgan Lindgren', NULL, 0, NULL, 'rodrick.cole@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'executive', NULL, 1, 0, NULL, NULL, NULL, NULL, 'R6qBljECvq', NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', 1, '2022-03-14 09:03:10'),
(10, 'Lela Armstrong', NULL, 0, NULL, 'marquardt.ericka@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'executive', NULL, 1, 0, NULL, NULL, NULL, NULL, 'Awbru83ji2', NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', 1, '2022-03-14 09:03:10'),
(11, 'Dr. Karina McKenzie V', NULL, 0, NULL, 'wintheiser.billie@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'executive', NULL, 1, 0, NULL, NULL, NULL, NULL, 'A9q4HxbfSr', NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', 1, '2022-03-14 09:03:10'),
(12, 'Ms. Bernadine Koepp', NULL, 0, NULL, 'alanis.heathcote@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'executive', NULL, 1, 0, NULL, NULL, NULL, NULL, 'tS9et0yFJ8', NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', 1, '2022-03-14 09:03:10'),
(13, 'Carley O\'Hara', NULL, 0, NULL, 'jazlyn32@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'executive', NULL, 1, 0, NULL, NULL, NULL, NULL, 'b07dyvqGfy', NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', 1, '2022-03-14 09:03:10'),
(14, 'Tina Wisozk', NULL, 0, NULL, 'hiram70@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'executive', NULL, 1, 0, NULL, NULL, NULL, NULL, 'wcZ7Y2JVb8', NULL, '2022-03-14 09:03:13', '2022-03-14 09:03:13', 1, '2022-03-14 09:03:10');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `advances`
--
ALTER TABLE `advances`
  ADD CONSTRAINT `advances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `estimates`
--
ALTER TABLE `estimates`
  ADD CONSTRAINT `estimates_dealer_id_foreign` FOREIGN KEY (`dealer_id`) REFERENCES `dealers` (`id`),
  ADD CONSTRAINT `estimates_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`);

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_approval_by_foreign` FOREIGN KEY (`approval_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `expenses_dealer_id_foreign` FOREIGN KEY (`dealer_id`) REFERENCES `dealers` (`id`),
  ADD CONSTRAINT `expenses_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `expenses_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`);

--
-- Constraints for table `funds`
--
ALTER TABLE `funds`
  ADD CONSTRAINT `funds_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `funds_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`),
  ADD CONSTRAINT `funds_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `incomes`
--
ALTER TABLE `incomes`
  ADD CONSTRAINT `incomes_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `incomes_received_by_foreign` FOREIGN KEY (`received_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `incomes_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`);

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_dealer_id_foreign` FOREIGN KEY (`dealer_id`) REFERENCES `dealers` (`id`),
  ADD CONSTRAINT `payments_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`);

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `salaries`
--
ALTER TABLE `salaries`
  ADD CONSTRAINT `salaries_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
