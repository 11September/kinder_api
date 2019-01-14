-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 14 2019 г., 14:55
-- Версия сервера: 5.7.20
-- Версия PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `kindergarten`
--

-- --------------------------------------------------------

--
-- Структура таблицы `classes`
--

CREATE TABLE `classes` (
  `id` int(10) UNSIGNED NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` time NOT NULL,
  `to` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `classes`
--

INSERT INTO `classes` (`id`, `schedule_id`, `name`, `from`, `to`, `created_at`, `updated_at`) VALUES
(1, 1, 'Nikko Orn Sr.', '11:15:27', '11:37:02', NULL, NULL),
(2, 1, 'Walker Adams', '05:08:25', '17:27:57', NULL, NULL),
(3, 1, 'Orland Littel', '03:50:41', '03:40:20', NULL, NULL),
(4, 1, 'Dr. Aurelia Koch IV', '10:47:41', '05:18:59', NULL, NULL),
(5, 2, 'Gertrude Kuvalis', '09:32:58', '23:40:38', NULL, NULL),
(6, 2, 'Mariana Brakus IV', '18:06:09', '10:47:02', NULL, NULL),
(7, 2, 'Eudora Botsford', '00:30:10', '05:09:35', NULL, NULL),
(8, 2, 'Ms. Jaunita Kling Jr.', '21:01:03', '18:30:36', NULL, NULL),
(9, 3, 'Sasha Reichert', '03:45:03', '02:42:23', NULL, NULL),
(10, 3, 'Dr. Elsa Schmeler', '19:15:29', '11:44:57', NULL, NULL),
(11, 3, 'Prof. Jeremy Kassulke', '17:40:44', '09:33:32', NULL, NULL),
(12, 3, 'Trever Weimann', '15:03:54', '20:45:30', NULL, NULL),
(13, 4, 'Tiara Spinka', '02:59:58', '06:13:24', NULL, NULL),
(14, 4, 'Evalyn Marvin', '21:18:10', '09:20:40', NULL, NULL),
(15, 4, 'Miss Blanca Okuneva PhD', '11:20:11', '14:08:34', NULL, NULL),
(16, 4, 'Miss Diana Bergnaum', '20:29:02', '13:52:51', NULL, NULL),
(17, 5, 'Alfred Schaden', '19:41:34', '22:07:39', NULL, NULL),
(18, 5, 'Levi Stokes', '20:23:18', '23:49:47', NULL, NULL),
(19, 5, 'Saige Strosin', '03:21:37', '00:05:42', NULL, NULL),
(20, 5, 'Agustina O\'Connell', '04:10:31', '20:11:12', NULL, NULL),
(21, 6, 'Dave Beer', '22:51:18', '05:46:02', NULL, NULL),
(22, 6, 'Mr. Elbert Skiles II', '21:47:37', '20:23:31', NULL, NULL),
(23, 7, 'Bart Schumm DVM', '15:13:04', '12:44:57', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `electives`
--

CREATE TABLE `electives` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` int(11) NOT NULL,
  `time_start` time NOT NULL,
  `time_end` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `electives`
--

INSERT INTO `electives` (`id`, `name`, `school_id`, `time_start`, `time_end`, `created_at`, `updated_at`) VALUES
(1, 'Dr. Carter Funk V', 1, '06:05:43', '00:27:18', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(2, 'Elsa Crooks DVM', 1, '12:37:37', '22:25:01', '2019-01-14 09:39:48', '2019-01-14 09:39:48');

-- --------------------------------------------------------

--
-- Структура таблицы `elective_groups`
--

CREATE TABLE `elective_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `electivy_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `groups`
--

CREATE TABLE `groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `groups`
--

INSERT INTO `groups` (`id`, `name`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Shannon Windler', 1, '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(2, 'Juliana Robel', 1, '2019-01-14 09:39:48', '2019-01-14 09:39:48');

-- --------------------------------------------------------

--
-- Структура таблицы `group_school`
--

CREATE TABLE `group_school` (
  `id` int(10) UNSIGNED NOT NULL,
  `school_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `group_school`
--

INSERT INTO `group_school` (`id`, `school_id`, `group_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2019-01-14 09:54:46', '2019-01-14 09:54:46'),
(2, 2, 2, '2019-01-14 09:54:50', '2019-01-14 09:54:50');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_create_posts_table', 1),
(4, '2018_08_08_100000_create_telescope_entries_table', 1),
(5, '2018_11_27_135607_create_schools_table', 1),
(6, '2018_11_27_140055_create_groups_table', 1),
(7, '2018_11_27_140409_create_schedules_table', 1),
(8, '2018_11_27_144421_create_students_table', 1),
(9, '2018_11_28_124724_create_videos_table', 1),
(10, '2018_11_30_151109_create_electives_table', 1),
(11, '2018_12_29_133217_create_notifications_table', 1),
(12, '2019_01_02_103941_create_elective_groups_table', 1),
(13, '2019_01_02_124851_create_post_groups_table', 1),
(14, '2019_01_02_133703_create_schools_groups_table', 1),
(15, '2019_01_03_092037_create_classes_table', 1),
(16, '2019_01_14_072321_create_notification_groups_table', 1),
(17, '2019_01_14_085906_create_notification_schools_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `notification_groups`
--

CREATE TABLE `notification_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `notification_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `notification_schools`
--

CREATE TABLE `notification_schools` (
  `id` int(10) UNSIGNED NOT NULL,
  `notification_id` int(10) UNSIGNED NOT NULL,
  `school_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `until` date NOT NULL,
  `school_id` int(11) NOT NULL,
  `preview` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `until`, `school_id`, `preview`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Ms.', 'Iure ab fuga hic tenetur praesentium et. Sit error inventore minima quis. Rem aut quia amet similique id et.', '1972-01-12', 1, 'https://lorempixel.com/640/480/?10684', 'https://lorempixel.com/640/480/?21253', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(2, 'Miss', 'Ea voluptas quia eligendi ut eum dicta. Alias facere et consequuntur suscipit enim mollitia. Molestias fugit quam aut quasi.', '1985-07-29', 1, 'https://lorempixel.com/640/480/?30463', 'https://lorempixel.com/640/480/?74615', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(3, 'Dr.', 'Et voluptas aliquid minus nemo id aliquam. Esse aut vero natus eum explicabo ea. Perferendis expedita exercitationem debitis explicabo est aut sunt officiis.', '1980-09-23', 1, 'https://lorempixel.com/640/480/?89904', 'https://lorempixel.com/640/480/?53347', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(4, 'Dr.', 'Placeat quis repellendus deserunt quas ex. Quisquam eum dignissimos enim. Quidem modi aut voluptatum est quod veniam neque. Fugit ut rerum perspiciatis dicta excepturi sit dolores.', '2014-12-05', 1, 'https://lorempixel.com/640/480/?45501', 'https://lorempixel.com/640/480/?42431', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(5, 'Miss', 'Odio ab perspiciatis consectetur enim aspernatur optio. Facere ab doloremque et. Omnis vel quae vel et aliquid rem.', '1983-11-19', 1, 'https://lorempixel.com/640/480/?55867', 'https://lorempixel.com/640/480/?85381', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(6, 'Dr.', 'Ut distinctio dolores voluptatem dolore tenetur qui. Quo est ab minima minus aut. Consectetur nihil aut ut aliquam magnam voluptatum illo.', '2013-03-19', 1, 'https://lorempixel.com/640/480/?99583', 'https://lorempixel.com/640/480/?91786', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(7, 'Mr.', 'Totam sed magnam fugiat aut nobis et. Vero sint officia quo magnam rerum qui velit. Vel ratione aspernatur nulla deleniti nesciunt quam. Unde quibusdam facere eum voluptatem.', '1984-01-07', 1, 'https://lorempixel.com/640/480/?99044', 'https://lorempixel.com/640/480/?29446', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(8, 'Mrs.', 'Esse nobis minus quidem consequatur soluta dolorem omnis. Maiores explicabo corporis vel odit natus eius ut. Ipsum et laboriosam aut voluptatem optio qui. Commodi illo quasi vitae cum sunt vel.', '2005-02-16', 1, 'https://lorempixel.com/640/480/?26769', 'https://lorempixel.com/640/480/?35653', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(9, 'Dr.', 'Numquam quo ut esse aliquid. Quo maxime vero dolor necessitatibus est. Ut voluptas quo pariatur aut.', '2011-12-24', 1, 'https://lorempixel.com/640/480/?27529', 'https://lorempixel.com/640/480/?14633', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(10, 'Dr.', 'Soluta ut deleniti saepe perferendis non asperiores et. Earum fugiat numquam autem dicta debitis.', '1998-09-11', 1, 'https://lorempixel.com/640/480/?82644', 'https://lorempixel.com/640/480/?25359', '2019-01-14 09:39:48', '2019-01-14 09:39:48');

-- --------------------------------------------------------

--
-- Структура таблицы `post_groups`
--

CREATE TABLE `post_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `schedules`
--

CREATE TABLE `schedules` (
  `id` int(10) UNSIGNED NOT NULL,
  `school_id` int(11) NOT NULL,
  `day` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `schedules`
--

INSERT INTO `schedules` (`id`, `school_id`, `day`, `created_at`, `updated_at`) VALUES
(1, 1, 'Monday', NULL, NULL),
(2, 1, 'Tuesday', NULL, NULL),
(3, 1, 'Wednesday', NULL, NULL),
(4, 1, 'Thursday', NULL, NULL),
(5, 1, 'Friday', NULL, NULL),
(6, 1, 'Saturday', NULL, NULL),
(7, 1, 'Sunday', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `schools`
--

CREATE TABLE `schools` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `schools`
--

INSERT INTO `schools` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Tressa Weissnat', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(2, 'Pearlie Douglas', '2019-01-14 09:39:48', '2019-01-14 09:39:48');

-- --------------------------------------------------------

--
-- Структура таблицы `students`
--

CREATE TABLE `students` (
  `id` int(10) UNSIGNED NOT NULL,
  `FIO` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `birthday` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `students`
--

INSERT INTO `students` (`id`, `FIO`, `group_id`, `user_id`, `birthday`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Prof.', 1, 1, '1974-10-13', 'ACTIVE', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(2, 'Mrs.', 1, 1, '1984-08-26', 'ACTIVE', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(3, 'Mr.', 1, 1, '2005-01-31', 'INACTIVE', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(4, 'Mr.', 1, 1, '1998-11-20', 'ACTIVE', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(5, 'Dr.', 1, 1, '1997-11-07', 'ACTIVE', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(6, 'Dr.', 1, 1, '1998-03-14', 'ACTIVE', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(7, 'Mr.', 1, 1, '2006-12-15', 'INACTIVE', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(8, 'Mr.', 1, 1, '1976-08-21', 'ACTIVE', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(9, 'Dr.', 1, 1, '2006-02-22', 'INACTIVE', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(10, 'Mrs.', 1, 1, '2005-04-17', 'ACTIVE', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(11, 'Dr.', 1, 1, '2013-05-27', 'ACTIVE', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(12, 'Mr.', 1, 1, '1993-05-06', 'ACTIVE', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(13, 'Dr.', 1, 1, '1985-05-10', 'INACTIVE', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(14, 'Prof.', 1, 1, '1976-05-11', 'ACTIVE', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(15, 'Prof.', 1, 1, '1988-08-06', 'ACTIVE', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(16, 'Mrs.', 1, 1, '2001-08-06', 'ACTIVE', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(17, 'Mr.', 1, 1, '2009-06-06', 'INACTIVE', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(18, 'Miss', 1, 1, '1989-05-28', 'INACTIVE', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(19, 'Mr.', 1, 1, '1978-04-16', 'INACTIVE', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(20, 'Mr.', 1, 1, '2000-10-20', 'INACTIVE', '2019-01-14 09:39:48', '2019-01-14 09:39:48');

-- --------------------------------------------------------

--
-- Структура таблицы `telescope_entries`
--

CREATE TABLE `telescope_entries` (
  `sequence` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_hash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `telescope_entries`
--

--
-- Структура таблицы `telescope_entries_tags`
--

CREATE TABLE `telescope_entries_tags` (
  `entry_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `telescope_entries_tags`
--

--
-- Структура таблицы `telescope_monitoring`
--

CREATE TABLE `telescope_monitoring` (
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parents` enum('father','mother') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `status` enum('active','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `push` enum('enabled','disabled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `player_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `parent_name`, `parent_phone`, `parents`, `address`, `birthday`, `avatar`, `school_id`, `group_id`, `status`, `email`, `email_verified_at`, `password`, `token`, `push`, `player_id`, `type`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Станислав', 'Prof. Nasir Veum II', '1-579-275-8728', 'father', '4738 Louisa Crest Apt. 911\nSouth Ryleyberg, IN 98663', '1971-06-15', NULL, 1, 1, 'active', 'admin@admin.com', '2019-01-14 09:39:48', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'bFloX', 'enabled', NULL, 'admin', 'JYx3ynIuB1', NULL, NULL),
(2, 'Kaya Pfeffer', 'Prof. Derick Langworth MD', '(705) 457-4190 x85797', 'father', '7586 Keebler Inlet Suite 865\nNew Colleenburgh, OR 43528', '1974-11-17', NULL, 1, 1, 'active', 'eliezer21@example.net', '2019-01-14 09:39:48', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'udq3z', 'disabled', NULL, 'default', 'AHNcv5KLEL', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(3, 'Simone Howell', 'Ebba Block Sr.', '491-782-0614 x954', 'father', '931 Jimmie Hollow Suite 467\nConsuelohaven, AZ 95740-3497', '1970-12-30', NULL, 1, 1, 'active', 'twila69@example.org', '2019-01-14 09:39:48', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'NkP3E', 'enabled', NULL, 'default', 'rzPGs1Jj7y', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(4, 'Carlotta Marvin II', 'Prof. Brady Koss Sr.', '1-392-513-2218 x807', 'father', '331 Daugherty Tunnel Apt. 029\nLake Keshawnstad, VA 95253', '2017-11-08', NULL, 1, 1, 'active', 'grimes.veda@example.com', '2019-01-14 09:39:48', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', '3iu1c', 'disabled', NULL, 'default', 'nOlUQr0pN6', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(5, 'Breanne Farrell', 'Chaim Abshire', '+18508069674', 'father', '12617 Kieran Springs\nWest Yazminside, PA 33015-4022', '1994-04-30', NULL, 1, 1, 'active', 'perry.hayes@example.net', '2019-01-14 09:39:48', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', '6bfpj', 'enabled', NULL, 'default', 'O24lhwWNq5', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(6, 'Tia Effertz IV', 'Frieda Lebsack', '1-373-922-4902 x058', 'mother', '6578 Jaquan Plains Apt. 588\nEast Chaunceyburgh, ME 27140', '1981-09-03', NULL, 1, 1, 'active', 'dora12@example.org', '2019-01-14 09:39:48', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'Ov7rN', 'disabled', NULL, 'default', 'uY0mkBATuR', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(7, 'Vida Fadel', 'Mrs. Juana Nikolaus Jr.', '(381) 810-1249 x0149', 'father', '79891 Harber Plaza Apt. 016\nNew Alberta, DC 84035-1369', '2002-08-01', NULL, 1, 1, 'active', 'schuster.rita@example.net', '2019-01-14 09:39:48', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'Czf1k', 'enabled', NULL, 'default', 'eNuFauhHpK', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(8, 'Chaya Harris', 'Prof. Leonard Grant', '1-790-587-1193', 'mother', '921 Gleichner Lodge\nNew Cody, SC 86309', '2000-05-18', NULL, 1, 1, 'active', 'lela.schaden@example.org', '2019-01-14 09:39:48', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'Bo5hP', 'disabled', NULL, 'default', 'aoKYyDTqRK', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(9, 'Ona Hudson', 'Lee Lynch', '496-313-1876 x2476', 'mother', '6122 Bergstrom Alley Suite 813\nNew Sisterborough, TN 82516', '1985-10-02', NULL, 1, 1, 'active', 'welch.elza@example.com', '2019-01-14 09:39:48', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', '4z2qF', 'disabled', NULL, 'default', 'MkxT6BxmNA', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(10, 'Bud Turner', 'Ms. Maye Shanahan', '1-240-233-8945 x13241', 'mother', '99807 Kassulke Mill\nAgneston, VA 39134', '2001-11-15', NULL, 1, 1, 'active', 'glenna13@example.org', '2019-01-14 09:39:48', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'Ro0Bp', 'disabled', NULL, 'default', 'mj5JYdPJEY', '2019-01-14 09:39:48', '2019-01-14 09:39:48'),
(11, 'Heather Williamson', 'Angelina Macejkovic', '1-949-257-3509', 'father', '54379 Trystan Fields Suite 668\nMaxberg, MS 26918-2577', '1994-03-16', NULL, 1, 1, 'active', 'abdiel18@example.com', '2019-01-14 09:39:48', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'XwlqS', 'enabled', NULL, 'default', 'FyJEknIOeP', '2019-01-14 09:39:48', '2019-01-14 09:39:48');

-- --------------------------------------------------------

--
-- Структура таблицы `videos`
--

CREATE TABLE `videos` (
  `id` int(10) UNSIGNED NOT NULL,
  `school_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `electives`
--
ALTER TABLE `electives`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `elective_groups`
--
ALTER TABLE `elective_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `elective_groups_electivy_id_foreign` (`electivy_id`),
  ADD KEY `elective_groups_group_id_foreign` (`group_id`);

--
-- Индексы таблицы `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `group_school`
--
ALTER TABLE `group_school`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_school_school_id_foreign` (`school_id`),
  ADD KEY `group_school_group_id_foreign` (`group_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `notification_groups`
--
ALTER TABLE `notification_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_groups_notification_id_foreign` (`notification_id`),
  ADD KEY `notification_groups_group_id_foreign` (`group_id`);

--
-- Индексы таблицы `notification_schools`
--
ALTER TABLE `notification_schools`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_schools_notification_id_foreign` (`notification_id`),
  ADD KEY `notification_schools_school_id_foreign` (`school_id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `post_groups`
--
ALTER TABLE `post_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_groups_post_id_foreign` (`post_id`),
  ADD KEY `post_groups_group_id_foreign` (`group_id`);

--
-- Индексы таблицы `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `telescope_entries`
--
ALTER TABLE `telescope_entries`
  ADD PRIMARY KEY (`sequence`),
  ADD UNIQUE KEY `telescope_entries_uuid_unique` (`uuid`),
  ADD KEY `telescope_entries_batch_id_index` (`batch_id`),
  ADD KEY `telescope_entries_type_should_display_on_index_index` (`type`,`should_display_on_index`),
  ADD KEY `telescope_entries_family_hash_index` (`family_hash`);

--
-- Индексы таблицы `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD KEY `telescope_entries_tags_entry_uuid_tag_index` (`entry_uuid`,`tag`),
  ADD KEY `telescope_entries_tags_tag_index` (`tag`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_token_unique` (`token`);

--
-- Индексы таблицы `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT для таблицы `electives`
--
ALTER TABLE `electives`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `elective_groups`
--
ALTER TABLE `elective_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `group_school`
--
ALTER TABLE `group_school`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `notification_groups`
--
ALTER TABLE `notification_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `notification_schools`
--
ALTER TABLE `notification_schools`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `post_groups`
--
ALTER TABLE `post_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `schools`
--
ALTER TABLE `schools`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `students`
--
ALTER TABLE `students`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `telescope_entries`
--
ALTER TABLE `telescope_entries`
  MODIFY `sequence` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `elective_groups`
--
ALTER TABLE `elective_groups`
  ADD CONSTRAINT `elective_groups_electivy_id_foreign` FOREIGN KEY (`electivy_id`) REFERENCES `electives` (`id`),
  ADD CONSTRAINT `elective_groups_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`);

--
-- Ограничения внешнего ключа таблицы `group_school`
--
ALTER TABLE `group_school`
  ADD CONSTRAINT `group_school_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `group_school_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`);

--
-- Ограничения внешнего ключа таблицы `notification_groups`
--
ALTER TABLE `notification_groups`
  ADD CONSTRAINT `notification_groups_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `notification_groups_notification_id_foreign` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`id`);

--
-- Ограничения внешнего ключа таблицы `notification_schools`
--
ALTER TABLE `notification_schools`
  ADD CONSTRAINT `notification_schools_notification_id_foreign` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`id`),
  ADD CONSTRAINT `notification_schools_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`);

--
-- Ограничения внешнего ключа таблицы `post_groups`
--
ALTER TABLE `post_groups`
  ADD CONSTRAINT `post_groups_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `post_groups_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

--
-- Ограничения внешнего ключа таблицы `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
