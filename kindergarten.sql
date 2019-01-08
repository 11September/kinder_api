-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 04 2019 г., 17:41
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
(1, 1, 'Ms. Pasquale Renner', '22:18:49', '17:15:00', NULL, NULL),
(2, 1, 'Richmond Grimes', '18:15:55', '08:12:50', NULL, NULL),
(3, 1, 'Dr. Deron Eichmann', '10:58:22', '04:36:02', NULL, NULL),
(4, 1, 'Rosalee Kautzer', '20:24:34', '07:35:58', NULL, NULL),
(5, 2, 'Hilton Runolfsson', '03:03:04', '01:35:58', NULL, NULL),
(6, 2, 'Peter Price', '10:20:11', '07:45:44', NULL, NULL),
(7, 2, 'Cole Jerde DDS', '12:40:19', '22:11:16', NULL, NULL),
(8, 2, 'Mrs. Berenice Langworth I', '00:22:27', '11:01:35', NULL, NULL),
(9, 3, 'Mr. Elian Langworth I', '23:18:02', '23:21:29', NULL, NULL),
(10, 3, 'Rex Raynor V', '22:02:35', '18:46:48', NULL, NULL),
(11, 3, 'Adell Smith', '05:23:25', '03:21:14', NULL, NULL),
(12, 3, 'Prof. Katelynn Hoeger', '02:40:19', '16:31:49', NULL, NULL),
(13, 4, 'Stewart Dare', '09:41:25', '01:55:41', NULL, NULL),
(14, 4, 'Sidney Streich PhD', '11:07:27', '08:08:46', NULL, NULL),
(15, 4, 'Cortez Beatty III', '21:23:37', '02:58:29', NULL, NULL),
(16, 4, 'Rowland Stamm', '07:47:52', '01:48:48', NULL, NULL),
(17, 5, 'Gunner Lang', '20:00:33', '15:01:22', NULL, NULL),
(18, 5, 'Wendy Von', '16:47:24', '21:27:09', NULL, NULL),
(19, 5, 'Ms. Maggie Okuneva', '23:23:55', '03:54:03', NULL, NULL),
(20, 5, 'Dr. Vivien Carroll', '13:18:28', '01:57:29', NULL, NULL),
(21, 6, 'Elfrieda Wintheiser', '07:16:24', '10:24:25', NULL, NULL),
(22, 6, 'Elwyn Johns', '12:06:31', '21:11:04', NULL, NULL),
(23, 7, 'Elmira Gusikowski MD', '20:00:00', '16:48:16', NULL, NULL);

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
(1, 'Gerhard Botsford', 1, '06:30:19', '07:57:14', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(2, 'Destinee Murazik', 1, '09:05:04', '09:06:20', '2019-01-04 12:35:27', '2019-01-04 12:35:27');

-- --------------------------------------------------------

--
-- Структура таблицы `elective_groups`
--

CREATE TABLE `elective_groups` (
  `electivy_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `electivy_photos`
--

CREATE TABLE `electivy_photos` (
  `id` int(10) UNSIGNED NOT NULL,
  `electivy_id` int(11) NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `electivy_photos`
--

INSERT INTO `electivy_photos` (`id`, `electivy_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'https://lorempixel.com/640/480/?71830', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(2, 1, 'https://lorempixel.com/640/480/?87559', '2019-01-04 12:35:27', '2019-01-04 12:35:27');

-- --------------------------------------------------------

--
-- Структура таблицы `groups`
--

CREATE TABLE `groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `groups`
--

INSERT INTO `groups` (`id`, `name`, `user_id`, `school_id`, `created_at`, `updated_at`) VALUES
(1, 'Marcelle Kuphal', 1, 1, '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(2, 'Kailyn Cremin', 1, 1, '2019-01-04 12:35:27', '2019-01-04 12:35:27');

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
(11, '2018_11_30_151526_create_electivy_photos_table', 1),
(12, '2018_12_29_133217_create_notifications_table', 1),
(13, '2019_01_02_103941_create_elective_groups_table', 1),
(14, '2019_01_02_124851_create_post_groups_table', 1),
(15, '2019_01_02_133703_create_schools_groups_table', 1),
(16, '2019_01_03_092037_create_classes_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` int(11) NOT NULL,
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
(1, 'Prof.', 'Qui delectus eum id dolorum non. Doloremque eos rerum cupiditate delectus asperiores id. Veniam et eos repellendus impedit cumque ullam pariatur.', '1981-08-03', 1, 'https://lorempixel.com/640/480/?84786', 'https://lorempixel.com/640/480/?76568', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(2, 'Mr.', 'Porro in similique id quam qui a esse. Quia sit magnam voluptatem vero eius vitae. Atque qui animi consequuntur ipsa vitae cupiditate.', '1997-01-06', 1, 'https://lorempixel.com/640/480/?41623', 'https://lorempixel.com/640/480/?72460', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(4, 'Ms.', 'Ipsa numquam itaque officiis repellat dolorem est dolorem. Aperiam ducimus architecto facilis.', '1993-01-19', 1, 'https://lorempixel.com/640/480/?18762', 'https://lorempixel.com/640/480/?74387', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(5, 'Prof.', 'Eum corrupti odit possimus sit. Ut amet itaque minus eos rerum modi. Impedit distinctio est quaerat ut ea eveniet assumenda.', '1986-02-13', 1, 'https://lorempixel.com/640/480/?75301', 'https://lorempixel.com/640/480/?79586', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(6, 'Prof.', 'Et velit in est nulla eius ut. Minima quo quae ut. Voluptas hic eius id sapiente qui soluta. Quae temporibus nemo soluta explicabo est nostrum quas.', '2007-03-24', 1, 'https://lorempixel.com/640/480/?22055', 'https://lorempixel.com/640/480/?95962', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(7, 'Prof.', 'Harum error repudiandae quaerat ad ratione provident ut. Quo qui ut ut quaerat minima placeat.', '1985-10-23', 1, 'https://lorempixel.com/640/480/?74674', 'https://lorempixel.com/640/480/?55176', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(8, 'Prof.', 'Delectus saepe qui ducimus et omnis. Cumque delectus quibusdam excepturi dolor quia maiores minus nobis. Quia harum dolorem sapiente vel. Cumque aut provident officiis magnam explicabo.', '1976-10-11', 1, 'https://lorempixel.com/640/480/?34753', 'https://lorempixel.com/640/480/?14292', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(11, 'sadaaa', 'adad', '0001-03-21', 1, '/images/uploads/1546612750-5c2f700e2766d.png', '/images/uploads/1546612750-5c2f700e27a6b.png', '2019-01-04 12:39:10', '2019-01-04 12:39:10');

-- --------------------------------------------------------

--
-- Структура таблицы `post_groups`
--

CREATE TABLE `post_groups` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `post_groups`
--

INSERT INTO `post_groups` (`post_id`, `group_id`, `created_at`, `updated_at`) VALUES
(11, 1, '2019-01-04 12:39:10', '2019-01-04 12:39:10'),
(11, 2, '2019-01-04 12:39:10', '2019-01-04 12:39:10');

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
(1, 'Jolie Hoeger', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(2, 'Anjali Watsica', '2019-01-04 12:35:27', '2019-01-04 12:35:27');

-- --------------------------------------------------------

--
-- Структура таблицы `schools_groups`
--

CREATE TABLE `schools_groups` (
  `school_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `schools_groups`
--

INSERT INTO `schools_groups` (`school_id`, `group_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-01-04 12:35:49', '2019-01-04 12:35:49'),
(1, 2, '2019-01-04 12:35:49', '2019-01-04 12:35:49'),
(2, 1, '2019-01-04 12:35:53', '2019-01-04 12:35:53');

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
(1, 'Prof.', 1, 1, '2012-09-07', 'INACTIVE', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(2, 'Miss', 1, 1, '2018-02-09', 'INACTIVE', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(3, 'Ms.', 1, 1, '2004-01-25', 'ACTIVE', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(4, 'Prof.', 1, 1, '1988-03-14', 'ACTIVE', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(5, 'Mr.', 1, 1, '1993-08-20', 'INACTIVE', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(6, 'Mr.', 1, 1, '1999-02-28', 'INACTIVE', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(7, 'Mr.', 1, 1, '1975-10-16', 'ACTIVE', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(8, 'Mrs.', 1, 1, '2006-05-25', 'ACTIVE', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(9, 'Dr.', 1, 1, '1982-06-02', 'ACTIVE', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(10, 'Miss', 1, 1, '1984-10-08', 'INACTIVE', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(11, 'Dr.', 1, 1, '1993-10-12', 'INACTIVE', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(12, 'Miss', 1, 1, '1982-04-14', 'INACTIVE', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(13, 'Prof.', 1, 1, '1979-09-24', 'ACTIVE', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(14, 'Prof.', 1, 1, '1992-10-30', 'ACTIVE', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(15, 'Mr.', 1, 1, '1977-02-26', 'INACTIVE', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(16, 'Miss', 1, 1, '1996-06-14', 'ACTIVE', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(17, 'Mr.', 1, 1, '1991-05-27', 'ACTIVE', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(18, 'Dr.', 1, 1, '2014-08-06', 'ACTIVE', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(19, 'Dr.', 1, 1, '1998-10-19', 'INACTIVE', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(20, 'Dr.', 1, 1, '2009-08-09', 'INACTIVE', '2019-01-04 12:35:27', '2019-01-04 12:35:27');

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
  `school_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `status` enum('active','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `push` enum('enabled','disabled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `parent_name`, `parent_phone`, `parents`, `address`, `birthday`, `school_id`, `group_id`, `status`, `email`, `email_verified_at`, `password`, `token`, `push`, `type`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Станислав', 'Carole Gusikowski', '1-996-723-2561', 'mother', '32332 Tre Locks\nWest Salvador, IA 40819', '1991-01-14', 1, 1, 'active', 'admin@admin.com', '2019-01-04 12:35:27', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'rWvt0', 'enabled', 'admin', 'HV9Cz79vTU', NULL, NULL),
(2, 'Cecile Kihn', 'Walker Fay', '(613) 458-3044', 'mother', '7158 Armando Mission Suite 622\nHillshire, WI 62393-5609', '1992-12-16', 1, 1, 'active', 'shaag@example.com', '2019-01-04 12:35:27', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'iqtp9', 'disabled', 'default', 'AJxZQnCGrg', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(3, 'Emelia Beer I', 'Ashton Wilderman', '(251) 835-3244', 'father', '3992 Cathrine Shore\nGradyberg, MN 57435-7807', '2002-04-07', 1, 1, 'active', 'dee.deckow@example.com', '2019-01-04 12:35:27', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'd6h6e', 'enabled', 'default', 'QZcfTiatk7', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(4, 'Dr. Amara Hudson', 'Esperanza Zemlak', '1-518-776-8884', 'mother', '31189 Carolyne Parkway\nBrakusbury, IN 91734', '1970-11-02', 1, 1, 'active', 'boyer.anderson@example.org', '2019-01-04 12:35:27', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'j9WXc', 'enabled', 'default', '3RJDLL4GDV', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(5, 'Timothy Kovacek PhD', 'Mr. Rolando Langworth', '603.936.2223 x05473', 'mother', '777 Irwin Shores\nMarquardtborough, WI 29374-2639', '2007-02-10', 1, 1, 'active', 'brody.friesen@example.com', '2019-01-04 12:35:27', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'OXMBk', 'disabled', 'default', 'KMSrTnv9GY', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(6, 'Ernesto Murazik', 'Joany Heathcote', '1-816-986-1394 x9422', 'father', '281 Rodriguez Lake\nPort Alisaton, WV 46771', '1988-02-16', 1, 1, 'active', 'iupton@example.net', '2019-01-04 12:35:27', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'B7AVT', 'enabled', 'default', 'YlrnzXYYIQ', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(7, 'Abdul Schmidt', 'Mr. Terence Parker PhD', '(258) 284-7551 x37335', 'mother', '662 Retta Harbor\nWest Mckenzieton, PA 69550-6156', '1987-01-21', 1, 1, 'active', 'swift.lincoln@example.net', '2019-01-04 12:35:27', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'if909', 'disabled', 'default', 'qTrbLEA9dK', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(8, 'Juvenal Heaney', 'Tito Yost', '(631) 390-2722', 'father', '249 Ferry Circles\nThielmouth, NC 01265-7372', '1996-05-21', 1, 1, 'active', 'kdietrich@example.com', '2019-01-04 12:35:27', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', '9aT0e', 'enabled', 'default', '9k9BkLZGMc', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(9, 'Meda Collins', 'Mrs. Rosamond Witting', '260.326.8449', 'mother', '19595 Javonte Lake Suite 770\nMarksborough, WY 13060-1640', '1971-03-26', 1, 1, 'active', 'lucio.sporer@example.net', '2019-01-04 12:35:27', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'zGbKr', 'enabled', 'default', 'mpsme9d3z0', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(10, 'Faye Lind', 'Alba Lebsack', '+1-484-333-5367', 'mother', '8956 Lubowitz Fords Apt. 293\nHarmonytown, SC 34722-9980', '2001-03-13', 1, 1, 'active', 'ruecker.coby@example.net', '2019-01-04 12:35:27', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'qgJMc', 'disabled', 'default', '84E34836Po', '2019-01-04 12:35:27', '2019-01-04 12:35:27'),
(11, 'Evert Crooks', 'Dr. Melany Hayes Sr.', '1-918-438-5754', 'father', '4447 Jazmyne Turnpike Apt. 193\nPort Rebeccachester, VT 58476', '1987-12-11', 1, 1, 'active', 'georgiana.murphy@example.org', '2019-01-04 12:35:27', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'ri4Yj', 'enabled', 'default', 'FRyKOSNfi9', '2019-01-04 12:35:27', '2019-01-04 12:35:27');

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
  ADD KEY `elective_groups_electivy_id_foreign` (`electivy_id`),
  ADD KEY `elective_groups_group_id_foreign` (`group_id`);

--
-- Индексы таблицы `electivy_photos`
--
ALTER TABLE `electivy_photos`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

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
-- Индексы таблицы `schools_groups`
--
ALTER TABLE `schools_groups`
  ADD KEY `schools_groups_school_id_foreign` (`school_id`),
  ADD KEY `schools_groups_group_id_foreign` (`group_id`);

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
-- AUTO_INCREMENT для таблицы `electivy_photos`
--
ALTER TABLE `electivy_photos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  MODIFY `sequence` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=310;

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
-- Ограничения внешнего ключа таблицы `post_groups`
--
ALTER TABLE `post_groups`
  ADD CONSTRAINT `post_groups_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `post_groups_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

--
-- Ограничения внешнего ключа таблицы `schools_groups`
--
ALTER TABLE `schools_groups`
  ADD CONSTRAINT `schools_groups_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `schools_groups_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`);

--
-- Ограничения внешнего ключа таблицы `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
