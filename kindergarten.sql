-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 08 2019 г., 11:10
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
(1, 1, 'Alf Hill', '18:39:38', '06:28:15', NULL, NULL),
(2, 1, 'Alverta Kessler DVM', '00:29:41', '05:14:34', NULL, NULL),
(3, 1, 'Glenda Crona', '04:09:31', '09:49:50', NULL, NULL),
(4, 1, 'Lynn Prosacco', '07:02:30', '09:55:27', NULL, NULL),
(5, 2, 'Tristin Thompson', '19:33:21', '07:20:04', NULL, NULL),
(6, 2, 'Jadyn Casper', '13:42:42', '21:09:09', NULL, NULL),
(7, 2, 'Dr. Cristian Tillman MD', '06:40:34', '04:18:42', NULL, NULL),
(8, 2, 'Fred Kreiger III', '23:12:18', '15:18:37', NULL, NULL),
(9, 3, 'Magdalena Hill PhD', '09:24:53', '08:53:18', NULL, NULL),
(10, 3, 'Heaven West', '08:42:06', '16:21:33', NULL, NULL),
(11, 3, 'Prof. Cyril Hill', '02:50:09', '20:49:22', NULL, NULL),
(12, 3, 'Erik Terry I', '17:27:21', '00:34:40', NULL, NULL),
(13, 4, 'Mr. Sylvester Cormier IV', '14:13:55', '04:04:01', NULL, NULL),
(14, 4, 'Jeremie Schmidt', '02:03:56', '07:35:49', NULL, NULL),
(15, 4, 'Casandra Schamberger', '16:17:10', '03:42:52', NULL, NULL),
(16, 4, 'Zora Brown PhD', '17:19:45', '05:20:39', NULL, NULL),
(17, 5, 'Prof. Jordon Nitzsche', '05:25:51', '19:27:39', NULL, NULL),
(18, 5, 'Roxanne Breitenberg', '14:49:53', '06:48:54', NULL, NULL),
(19, 5, 'Russel Huels', '20:40:01', '09:43:50', NULL, NULL),
(20, 5, 'Mae Carroll', '19:56:15', '10:36:45', NULL, NULL),
(21, 6, 'Jamal Wyman III', '06:18:39', '12:07:52', NULL, NULL),
(22, 6, 'Mr. Abraham Lebsack', '22:10:36', '17:12:47', NULL, NULL),
(23, 7, 'Ms. Madalyn Ward', '03:32:41', '01:58:22', NULL, NULL);

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
(1, 'Bill Pouros', 1, '04:25:38', '02:20:55', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(2, 'Florine Runolfsson', 1, '18:04:54', '00:40:35', '2019-01-08 05:36:13', '2019-01-08 05:36:13');

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
(1, 1, 'https://lorempixel.com/640/480/?76236', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(2, 1, 'https://lorempixel.com/640/480/?64659', '2019-01-08 05:36:13', '2019-01-08 05:36:13');

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
(1, 'Miss Felipa Hammes Jr.', 1, 1, '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(2, 'Adrianna Borer', 1, 1, '2019-01-08 05:36:13', '2019-01-08 05:36:13');

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
(1, 'Dr.', 'Et excepturi repellendus error sint et est nulla. Est est ut earum sint est voluptates. Excepturi id aut qui aperiam magnam natus inventore perferendis.', '2014-12-10', 1, 'https://lorempixel.com/640/480/?54472', 'https://lorempixel.com/640/480/?36019', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(2, 'Dr.', 'Quia quaerat qui non sapiente rerum quo enim aperiam. Est nesciunt facilis hic. Tenetur quo qui necessitatibus qui voluptatem. Animi adipisci aut tempore impedit.', '1996-07-07', 1, 'https://lorempixel.com/640/480/?69943', 'https://lorempixel.com/640/480/?35973', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(3, 'Dr.', 'Ea sint aut quo. Perferendis assumenda in autem optio quod ab nostrum. Sint cupiditate expedita ducimus ducimus aut. Aut odit architecto architecto eius sit ut. Vel aut qui numquam occaecati sint.', '1985-03-16', 1, 'https://lorempixel.com/640/480/?80077', 'https://lorempixel.com/640/480/?38304', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(4, 'Miss', 'Aut voluptatem qui est quia dolorem. Et aperiam blanditiis porro. Autem praesentium rerum sed quia et tempora nesciunt.', '1997-06-27', 1, 'https://lorempixel.com/640/480/?52964', 'https://lorempixel.com/640/480/?88298', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(5, 'Prof.', 'Impedit assumenda magnam cumque ullam alias. Accusantium rem maiores veritatis laborum. Quam numquam commodi incidunt quod. Saepe ut laudantium dignissimos repudiandae voluptas ex expedita.', '1980-07-17', 1, 'https://lorempixel.com/640/480/?47974', 'https://lorempixel.com/640/480/?64422', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(6, 'Dr.', 'Ut inventore sunt ipsam non numquam non sit adipisci. Eum alias qui consequuntur.', '2003-01-16', 1, 'https://lorempixel.com/640/480/?65180', 'https://lorempixel.com/640/480/?85042', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(7, 'Prof.', 'Et sed ex fugiat voluptatem delectus et. Id eos sed vitae sapiente. Incidunt autem ut molestias nemo possimus possimus fugiat.', '2013-06-18', 1, 'https://lorempixel.com/640/480/?32117', 'https://lorempixel.com/640/480/?50622', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(8, 'Ms.', 'Id eligendi harum nostrum ut laudantium. Expedita aliquam pariatur quia omnis itaque. Et consequatur et maxime eum omnis non. Omnis itaque quo aliquam quas.', '1992-06-09', 1, 'https://lorempixel.com/640/480/?88655', 'https://lorempixel.com/640/480/?87347', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(9, 'Mr.', 'Soluta unde nulla aliquid in et. Eveniet quam ut et. Dignissimos exercitationem voluptates voluptate corrupti. Esse eum sunt nihil magni voluptatem rerum ullam.', '1997-08-31', 1, 'https://lorempixel.com/640/480/?72829', 'https://lorempixel.com/640/480/?31657', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(10, 'Dr.', 'Quia qui eum iusto eaque. Cum sed laborum quas aut quod aliquid itaque omnis. Dolores maxime ut voluptatem est cumque.', '2017-07-31', 1, 'https://lorempixel.com/640/480/?32996', 'https://lorempixel.com/640/480/?55481', '2019-01-08 05:36:13', '2019-01-08 05:36:13');

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
(1, 'Dr. Carol Swift V', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(2, 'Lilla Schaefer DDS', '2019-01-08 05:36:13', '2019-01-08 05:36:13');

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
(1, 'Prof.', 1, 1, '1974-05-24', 'ACTIVE', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(2, 'Dr.', 1, 1, '2015-01-11', 'ACTIVE', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(3, 'Prof.', 1, 1, '2007-07-01', 'INACTIVE', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(4, 'Prof.', 1, 1, '1991-10-24', 'INACTIVE', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(5, 'Dr.', 1, 1, '1995-03-29', 'INACTIVE', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(6, 'Dr.', 1, 1, '1988-10-08', 'INACTIVE', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(7, 'Mr.', 1, 1, '1973-09-20', 'ACTIVE', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(8, 'Mr.', 1, 1, '1973-05-27', 'INACTIVE', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(9, 'Miss', 1, 1, '2013-07-19', 'ACTIVE', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(10, 'Prof.', 1, 1, '2000-12-12', 'ACTIVE', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(11, 'Ms.', 1, 1, '1973-10-05', 'INACTIVE', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(12, 'Prof.', 1, 1, '1990-03-31', 'ACTIVE', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(13, 'Dr.', 1, 1, '2018-08-13', 'INACTIVE', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(14, 'Ms.', 1, 1, '1982-10-08', 'ACTIVE', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(15, 'Dr.', 1, 1, '1994-08-21', 'ACTIVE', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(16, 'Mrs.', 1, 1, '1971-04-25', 'ACTIVE', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(17, 'Mr.', 1, 1, '1995-09-29', 'ACTIVE', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(18, 'Prof.', 1, 1, '2007-06-19', 'INACTIVE', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(19, 'Mrs.', 1, 1, '2015-03-27', 'ACTIVE', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(20, 'Dr.', 1, 1, '2012-07-29', 'ACTIVE', '2019-01-08 05:36:13', '2019-01-08 05:36:13');

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

-- --------------------------------------------------------

--
-- Структура таблицы `telescope_entries_tags`
--

CREATE TABLE `telescope_entries_tags` (
  `entry_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

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
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `parent_name`, `parent_phone`, `parents`, `address`, `birthday`, `avatar`, `school_id`, `group_id`, `status`, `email`, `email_verified_at`, `password`, `token`, `push`, `type`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Станислав', 'Mr. Uriel Monahan', '(507) 577-4477', 'mother', '633 Mayert Run Apt. 429\nGleasonstad, MN 47504-8908', '1982-08-30', NULL, 1, 1, 'active', 'admin@admin.com', '2019-01-08 05:36:13', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'GoXOS', 'enabled', 'admin', 'MaTbSVM2O9', NULL, NULL),
(2, 'Jesse Prosacco', 'Kendra Carroll', '605.723.6748 x35835', 'mother', '29625 D\'Amore Rapids\nTheresaside, TN 22238-2477', '1998-08-30', NULL, 1, 1, 'active', 'ublock@example.com', '2019-01-08 05:36:13', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'WdmzC', 'enabled', 'default', 'bfrvafyP8n', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(3, 'Micheal Monahan', 'Ms. Lina Ritchie', '1-639-966-1107 x241', 'mother', '47022 Stark Fields\nNew Remingtonland, NJ 71786-8291', '1987-06-22', NULL, 1, 1, 'active', 'lkub@example.org', '2019-01-08 05:36:13', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'dg8UE', 'disabled', 'default', 'AxiqS5XDmx', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(4, 'Mayra Labadie', 'Cary Anderson', '413.489.1924', 'father', '841 Candido Pines\nNorth Gail, OH 17085', '1994-10-26', NULL, 1, 1, 'active', 'becker.opal@example.net', '2019-01-08 05:36:13', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'yg2uM', 'disabled', 'default', 'vUJtFNKcRX', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(5, 'Sandra Huels', 'Dr. Dallin Wilkinson IV', '727.685.8979', 'mother', '384 Watsica Divide\nNellaside, HI 49129-7635', '1996-02-12', NULL, 1, 1, 'active', 'damore.claud@example.net', '2019-01-08 05:36:13', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'bL3E0', 'enabled', 'default', '7OZXNmzb6W', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(6, 'Anita Russel DVM', 'Hugh Goodwin', '230-845-5703 x384', 'mother', '766 Olson Lane\nSouth Jaceborough, MD 48443-7373', '1977-02-25', NULL, 1, 1, 'active', 'qtromp@example.org', '2019-01-08 05:36:13', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'KOGFw', 'enabled', 'default', 'Mw9pugpRZA', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(7, 'Prof. Hilario O\'Conner MD', 'Marco Cormier I', '(254) 588-9835 x346', 'mother', '71857 Hamill Ways Suite 589\nCassandraport, HI 19173-2257', '1992-12-29', NULL, 1, 1, 'active', 'dora47@example.net', '2019-01-08 05:36:13', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'whEDW', 'enabled', 'default', 'qjSZSA2iSa', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(8, 'Ericka Windler', 'Dr. Gunnar Doyle', '539-717-2393 x1077', 'mother', '336 Greenfelder Mountain Apt. 241\nHolliemouth, NH 51747', '1982-07-21', NULL, 1, 1, 'active', 'flatley.arturo@example.org', '2019-01-08 05:36:13', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'MnyTb', 'enabled', 'default', '7Yf0CNBtaO', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(9, 'Wilfred Wisoky', 'Velma Lakin', '+1-330-352-3192', 'father', '476 Nathaniel Via Suite 210\nLake Aurelio, MN 83670-2280', '1987-11-10', NULL, 1, 1, 'active', 'jose03@example.org', '2019-01-08 05:36:13', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'PJyMU', 'disabled', 'default', '0xW2VXYwVT', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(10, 'Tillman Jakubowski', 'Dr. Keyshawn Zboncak MD', '+1 (543) 822-0897', 'father', '689 Derrick Villages\nReynoldsport, DC 05139', '1977-04-23', NULL, 1, 1, 'active', 'clubowitz@example.org', '2019-01-08 05:36:13', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'Tig4M', 'disabled', 'default', 'u9QduLekkd', '2019-01-08 05:36:13', '2019-01-08 05:36:13'),
(11, 'Marcelina Walter I', 'Ariane Willms', '418-504-6509', 'mother', '7402 Wisoky Spring\nPort Bernadine, AK 47093-4981', '1971-07-03', NULL, 1, 1, 'active', 'ndoyle@example.net', '2019-01-08 05:36:13', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'pPmXD', 'enabled', 'default', 'cfgCioqW2T', '2019-01-08 05:36:13', '2019-01-08 05:36:13');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `sequence` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
