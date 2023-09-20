-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 20, 2023 lúc 08:43 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `sci-work`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `topic_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `content` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_08_31_031848_create_positions_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(5, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(6, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(7, '2016_06_01_000004_create_oauth_clients_table', 1),
(8, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(9, '2019_08_19_000000_create_failed_jobs_table', 1),
(10, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(11, '2023_08_31_031947_create_topics_table', 1),
(12, '2023_08_31_031948_create_userlists_table', 1),
(13, '2023_08_31_031959_create_categories_table', 1),
(14, '2023_08_31_032009_create_items_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('2d452abdcd4002f77d04c281210a95e2d0ae0a186de2ac5d6d7e02c86b76dbad4cca027d6ba53b0c', 1, 1, 'ducdm@scigroup.com.vn', '[]', 0, '2023-09-07 23:38:10', '2023-09-07 23:38:10', '2024-09-08 06:38:10'),
('2ed2ef18e32cfe6cac4a5fb8b68c7c94bd287493c499c604ace5cc5caddfecba742bba3b2436580b', 1, 1, 'ducdm@scigroup.com.vn', '[]', 0, '2023-09-19 19:07:42', '2023-09-19 19:07:42', '2024-09-20 02:07:42'),
('49c4799dca420bfffd7844f721581a1f9f94356aa0b4522588ecddf2a5f169dd0de47d22f9aa014a', 1, 1, 'ducdm@scigroup.com.vn', '[]', 0, '2023-09-19 19:07:58', '2023-09-19 19:07:58', '2024-09-20 02:07:58'),
('5b10cac6e10aa845a2af9fa6e9fd6d001867cca7ded938536ef1b7bcfbd364a12709aec6348b8126', 1, 1, 'ducdm@scigroup.com.vn', '[]', 0, '2023-09-07 00:21:15', '2023-09-07 00:21:15', '2024-09-07 07:21:15'),
('69ce88f083261d96c4ea48d9735e4c4e662d131d00848d98c72132738dee4f5262dea98d9c69ba31', 2, 1, 'ducdm1@scigroup.com.vn', '[]', 0, '2023-09-05 21:14:54', '2023-09-05 21:14:54', '2024-09-06 04:14:54'),
('72cbe3662d00736099bed1b78f8f3e27b89f3ee8636b6f1ad634336dcd31269b530926e755c82116', 1, 1, 'ducdm@scigroup.com.vn', '[]', 0, '2023-09-18 19:50:00', '2023-09-18 19:50:00', '2024-09-19 02:50:00'),
('8ea583a86345a74db0ffa008c31df89f02f2d8dbe09eabac5f259a70bb6eea4232c2d0d1cf05ed36', 1, 1, 'ducdm@scigroup.com.vn', '[]', 0, '2023-09-13 20:01:06', '2023-09-13 20:01:06', '2024-09-14 03:01:06'),
('9006101a6474286eedfc74d651406c9d6e3905298056b59833c2e4f401ad0bcff94f6c7e24948b58', 1, 1, 'ducdm@scigroup.com.vn', '[]', 0, '2023-09-18 19:49:50', '2023-09-18 19:49:50', '2024-09-19 02:49:50'),
('ad7dadf42ad78aa8c55fb7dcbb311269b7d9374e794d5ea07327c2d9bbeff68575b5174ed246dd19', 1, 1, 'ducdm@scigroup.com.vn', '[]', 0, '2023-09-19 02:24:21', '2023-09-19 02:24:21', '2024-09-19 09:24:21'),
('b0fb8803af0c792f54036c267e411b829702e682af93cb75cfe5e7c94de9689075e978fce48056d8', 1, 1, 'ducdm@scigroup.com.vn', '[]', 0, '2023-09-18 19:50:30', '2023-09-18 19:50:30', '2024-09-19 02:50:30'),
('b2bbd718402589311ec282581e0e70f3a04a7bb5fcb9a0e1f0ff2596d03ae2eb6342a9f31a8a6bb2', 1, 1, 'ducdm@scigroup.com.vn', '[]', 0, '2023-09-05 21:02:06', '2023-09-05 21:02:06', '2024-09-06 04:02:06'),
('c8eef35c37d941b2f832610231bcb7fb0350fb5c680729c14ab09cf6a7292b9982b85edc21b0d136', 1, 1, 'ducdm@scigroup.com.vn', '[]', 0, '2023-09-13 20:02:13', '2023-09-13 20:02:13', '2024-09-14 03:02:13'),
('d57d8928bc967c1a8b8ad30bc991afe1c6ed15e0b0343a15a3b80e76ee32269f2e38e261765ea31e', 1, 1, 'ducdm@scigroup.com.vn', '[]', 0, '2023-09-19 02:16:09', '2023-09-19 02:16:09', '2024-09-19 09:16:09'),
('d6a8e46e494a0eeb034e7d23219494d96417349d983e02d71f2fcbd042731be383cd84c1461f2ac1', 1, 1, 'ducdm@scigroup.com.vn', '[]', 0, '2023-09-19 02:20:57', '2023-09-19 02:20:57', '2024-09-19 09:20:57'),
('ef8da4b72854815b447c2aa6c9b34ec351e11a378ed5e9bd662963d1103c30278c881168570f71e5', 1, 1, 'ducdm@scigroup.com.vn', '[]', 0, '2023-09-19 19:06:55', '2023-09-19 19:06:55', '2024-09-20 02:06:55'),
('f287f7da9a2527bdd6fea177363726b430efd025bb5108f6ba50eb8515a95abe555e8214d58d9c5b', 1, 1, 'ducdm@scigroup.com.vn', '[]', 0, '2023-09-13 20:00:48', '2023-09-13 20:00:48', '2024-09-14 03:00:48'),
('f5959b2d85f9fbea2980f08942d7e5938c12b81d6372a93eeb19ce1fb7c74fd3b1d9e8dab4ca6d4c', 1, 1, 'ducdm@scigroup.com.vn', '[]', 0, '2023-09-13 19:54:28', '2023-09-13 19:54:28', '2024-09-14 02:54:28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'ooTksNj0SyGiNx6imfp6ISjg0hiWzGaVOP7DHxI6', NULL, 'http://localhost', 1, 0, 0, '2023-09-05 21:01:49', '2023-09-05 21:01:49'),
(2, NULL, 'Laravel Password Grant Client', 'HYZ4gvk4mmN80ATXizSTjWmXW69RYOLD2FYSQxrs', 'users', 'http://localhost', 0, 1, 0, '2023-09-05 21:01:49', '2023-09-05 21:01:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-09-05 21:01:49', '2023-09-05 21:01:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `positions`
--

CREATE TABLE `positions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `positions`
--

INSERT INTO `positions` (`id`, `code`, `name`, `created_at`, `updated_at`) VALUES
(1, 'CODE', 'Phát triển web', '2023-09-05 21:01:55', '2023-09-05 21:01:55'),
(2, 'DESIGN', 'Thiết kế', '2023-09-19 02:22:22', '2023-09-19 02:22:22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `topics`
--

CREATE TABLE `topics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `topics`
--

INSERT INTO `topics` (`id`, `user_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Test2sds3', '2023-09-05 21:08:14', '2023-09-18 19:53:43'),
(2, 1, 'Test', '2023-09-05 21:08:37', '2023-09-05 21:08:37'),
(3, 1, 'Tes', '2023-09-05 21:08:49', '2023-09-19 00:07:22'),
(5, 2, 'Test23asdas', '2023-09-05 21:15:19', '2023-09-05 21:15:19'),
(6, 2, 'Test23asdas', '2023-09-07 01:26:02', '2023-09-07 01:26:02'),
(11, 2, 'Test23asdas', '2023-09-07 01:45:44', '2023-09-07 01:45:44'),
(12, 2, 'Test23asdas', '2023-09-07 01:46:51', '2023-09-07 01:46:51'),
(13, 2, 'Test23asdas', '2023-09-07 01:47:19', '2023-09-07 01:47:19'),
(14, 2, 'Test23asdas', '2023-09-07 01:48:55', '2023-09-07 01:48:55'),
(15, 2, 'Test23asdas', '2023-09-07 01:49:12', '2023-09-07 01:49:12'),
(16, 2, 'Test23asdas', '2023-09-07 01:50:06', '2023-09-07 01:50:06'),
(19, 1, 'tgest', '2023-09-07 02:01:15', '2023-09-19 01:00:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `userlists`
--

CREATE TABLE `userlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `topic_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `userlists`
--

INSERT INTO `userlists` (`id`, `user_id`, `topic_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2023-09-05 21:08:14', '2023-09-05 21:08:14'),
(2, 1, 2, '2023-09-05 21:08:37', '2023-09-05 21:08:37'),
(3, 1, 3, '2023-09-05 21:08:49', '2023-09-05 21:08:49'),
(5, 2, 5, '2023-09-05 21:15:19', '2023-09-05 21:15:19'),
(6, 2, 6, '2023-09-07 01:26:02', '2023-09-07 01:26:02'),
(11, 2, 11, '2023-09-07 01:45:44', '2023-09-07 01:45:44'),
(12, 2, 12, '2023-09-07 01:46:51', '2023-09-07 01:46:51'),
(13, 2, 13, '2023-09-07 01:47:19', '2023-09-07 01:47:19'),
(14, 2, 14, '2023-09-07 01:48:55', '2023-09-07 01:48:55'),
(15, 2, 15, '2023-09-07 01:49:12', '2023-09-07 01:49:12'),
(16, 2, 16, '2023-09-07 01:50:06', '2023-09-07 01:50:06'),
(19, 1, 19, '2023-09-07 02:01:15', '2023-09-07 02:01:15'),
(28, 2, 1, '2023-09-19 02:06:54', '2023-09-19 02:06:54'),
(32, 4, 1, '2023-09-19 20:55:38', '2023-09-19 20:55:38'),
(55, 3, 2, '2023-09-19 23:38:30', '2023-09-19 23:38:30'),
(58, 2, 2, '2023-09-19 23:39:48', '2023-09-19 23:39:48'),
(59, 4, 2, '2023-09-19 23:40:39', '2023-09-19 23:40:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `background` varchar(255) NOT NULL DEFAULT '#ffa500',
  `email` varchar(255) NOT NULL,
  `position_id` bigint(20) UNSIGNED NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `background`, `email`, `position_id`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Đoàn Minh', 'Đức', '#ffa500', 'ducdm@scigroup.com.vn', 1, NULL, '$2y$10$etOh79QB7TxWUGogz2bqde96YJEkb035ne8ZL0A4YJcUU6yBg9mNC', NULL, '2023-09-05 21:02:03', '2023-09-18 23:24:33'),
(2, 'Đoàn Minh', 'Đức', '#ffa500', 'ducdm1@scigroup.com.vn', 1, NULL, '$2y$10$SGEoN..JHDjqPuRYgMAj0uWEC/ap9PWXRj4aKrsPGoRpkTunK0HWm', NULL, '2023-09-05 21:14:28', '2023-09-05 21:14:28'),
(3, 'Trần Tiến', 'Đạt', '#ffa500', 'dattt@scigroup.com.vn', 2, NULL, '$2y$10$WYvaU0zgpdr/ShU7w85KBeEPuJ.LgX/kKapP4a/nvoLRyb18KW9RS', NULL, '2023-09-19 02:23:49', '2023-09-19 02:23:49'),
(4, 'Hoàng Minh', 'Cương', '#ffa500', 'cuonghm@scigroup.com.vn', 2, NULL, '$2y$10$19A5J2oNkzD/8teQFDgEvesJY8Cair9JNzldrmhzir5vK71ppUiSC', NULL, '2023-09-19 02:24:16', '2023-09-19 02:24:16');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_topic_id_foreign` (`topic_id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_category_id_foreign` (`category_id`),
  ADD KEY `items_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topics_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `userlists`
--
ALTER TABLE `userlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userlists_user_id_foreign` (`user_id`),
  ADD KEY `userlists_topic_id_foreign` (`topic_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_position_id_foreign` (`position_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `positions`
--
ALTER TABLE `positions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `topics`
--
ALTER TABLE `topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `userlists`
--
ALTER TABLE `userlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `topics`
--
ALTER TABLE `topics`
  ADD CONSTRAINT `topics_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `userlists`
--
ALTER TABLE `userlists`
  ADD CONSTRAINT `userlists_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`),
  ADD CONSTRAINT `userlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
