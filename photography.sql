-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2025 at 12:53 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `photography`
--

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`, `deletedAt`) VALUES
(1, 'create-user', 'Create User', '', '2025-01-23 11:24:19', '2025-01-23 11:28:01', '2025-01-23 11:28:01'),
(2, 'read-user', 'Read User', '', '2025-01-23 11:24:26', '2025-01-23 11:24:26', NULL),
(3, 'delete-user', 'Delete User', '', '2025-01-23 11:24:32', '2025-01-23 11:24:32', NULL),
(4, 'update-user', 'Update User', '', '2025-01-23 11:24:38', '2025-01-23 11:24:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(2, 'Customer', 'Customer', 'This is Customer Role', '2025-01-23 10:51:36', '2025-01-23 10:51:36');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(2, 2, '2025-01-23 11:52:47', '2025-01-23 11:52:47'),
(2, 3, '2025-01-23 11:52:47', '2025-01-23 11:52:47'),
(2, 4, '2025-01-23 11:52:47', '2025-01-23 11:52:47');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `unique_id` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` text DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_by` varchar(255) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `unique_id`, `full_name`, `email`, `password`, `token`, `role_id`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzM3NjMwODM3fQ.jJpDtFQ4jbABCRAM1mHzqOwjvrLo35HBHWA0XTu2z1U', NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:12:25', '2025-01-23 11:13:57'),
(2, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:13:00', '2025-01-23 11:13:00'),
(3, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:13:15', '2025-01-23 11:13:15'),
(4, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:13:16', '2025-01-23 11:13:16'),
(5, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:13:18', '2025-01-23 11:13:18'),
(6, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:13:51', '2025-01-23 11:13:51'),
(7, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:13:52', '2025-01-23 11:13:52'),
(8, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:15:59', '2025-01-23 11:15:59'),
(9, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:16:17', '2025-01-23 11:16:17'),
(10, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:16:24', '2025-01-23 11:16:24'),
(11, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:16:29', '2025-01-23 11:16:29'),
(12, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:16:31', '2025-01-23 11:16:31'),
(13, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:16:32', '2025-01-23 11:16:32'),
(14, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:21:39', '2025-01-23 11:21:39'),
(15, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:21:48', '2025-01-23 11:21:48'),
(16, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:21:53', '2025-01-23 11:21:53'),
(17, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:21:58', '2025-01-23 11:21:58'),
(18, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:22:03', '2025-01-23 11:22:03'),
(19, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:22:23', '2025-01-23 11:22:23'),
(20, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:22:30', '2025-01-23 11:22:30'),
(21, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:22:31', '2025-01-23 11:22:31'),
(22, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:22:34', '2025-01-23 11:22:34'),
(23, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:22:50', '2025-01-23 11:22:50'),
(24, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:22:58', '2025-01-23 11:22:58'),
(25, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:22:59', '2025-01-23 11:22:59'),
(26, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:23:14', '2025-01-23 11:23:14'),
(27, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:23:21', '2025-01-23 11:23:21'),
(28, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:23:27', '2025-01-23 11:23:27'),
(29, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:23:36', '2025-01-23 11:23:36'),
(30, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:23:40', '2025-01-23 11:23:40'),
(31, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:23:41', '2025-01-23 11:23:41'),
(32, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:26:30', '2025-01-23 11:26:30'),
(33, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:28:20', '2025-01-23 11:28:20'),
(34, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:39:55', '2025-01-23 11:39:55'),
(35, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:40:17', '2025-01-23 11:40:17'),
(36, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:44:20', '2025-01-23 11:44:20'),
(37, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:44:24', '2025-01-23 11:44:24'),
(38, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:44:30', '2025-01-23 11:44:30'),
(39, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:44:32', '2025-01-23 11:44:32'),
(40, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:46:03', '2025-01-23 11:46:03'),
(41, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:46:05', '2025-01-23 11:46:05'),
(42, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:46:14', '2025-01-23 11:46:14'),
(43, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:46:16', '2025-01-23 11:46:16'),
(44, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:46:28', '2025-01-23 11:46:28'),
(45, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:46:32', '2025-01-23 11:46:32'),
(46, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:46:39', '2025-01-23 11:46:39'),
(47, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:46:40', '2025-01-23 11:46:40'),
(48, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:46:49', '2025-01-23 11:46:49'),
(49, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:46:52', '2025-01-23 11:46:52'),
(50, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:46:58', '2025-01-23 11:46:58'),
(51, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:47:01', '2025-01-23 11:47:01'),
(52, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:47:13', '2025-01-23 11:47:13'),
(53, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:47:15', '2025-01-23 11:47:15'),
(54, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:47:16', '2025-01-23 11:47:16'),
(55, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:47:19', '2025-01-23 11:47:19'),
(56, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:47:22', '2025-01-23 11:47:22'),
(57, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:47:30', '2025-01-23 11:47:30'),
(58, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:48:52', '2025-01-23 11:48:52'),
(59, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:49:00', '2025-01-23 11:49:00'),
(60, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:51:10', '2025-01-23 11:51:10'),
(61, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:51:39', '2025-01-23 11:51:39'),
(62, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:51:41', '2025-01-23 11:51:41'),
(63, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:51:43', '2025-01-23 11:51:43'),
(64, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:51:45', '2025-01-23 11:51:45'),
(65, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:51:47', '2025-01-23 11:51:47'),
(66, NULL, 'Super Admin', 'admin@gmail.com', '$2b$10$GvIF5MJ9VfDOczivFX018eQPVtQAQUJfPCNmjMXQDx9VAu4e5PMmO', NULL, NULL, 'active', NULL, NULL, NULL, NULL, '2025-01-23 11:52:11', '2025-01-23 11:52:11');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date_of_birth` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `joining_date` varchar(255) DEFAULT NULL,
  `permanent_address` text DEFAULT NULL,
  `current_address` text DEFAULT NULL,
  `emergency_contact_name` varchar(255) DEFAULT NULL,
  `emergency_contact_number` varchar(255) DEFAULT NULL,
  `relation` varchar(255) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_by` varchar(255) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD UNIQUE KEY `role_permissions_permission_id_role_id_unique` (`role_id`,`permission_id`),
  ADD KEY `permission_id` (`permission_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD CONSTRAINT `role_permissions_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_permissions_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_details`
--
ALTER TABLE `user_details`
  ADD CONSTRAINT `user_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
