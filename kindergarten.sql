-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 17 2019 г., 15:42
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
(1, 1, 'Savanah Schiller', '23:41:00', '08:45:59', NULL, NULL),
(2, 1, 'Ms. Leonor Stamm II', '22:47:28', '04:49:46', NULL, NULL),
(3, 1, 'Wilhelm Bosco I', '13:20:31', '10:19:28', NULL, NULL),
(4, 1, 'Prof. Dortha Waters', '05:30:48', '00:31:31', NULL, NULL),
(5, 2, 'Lavern Grady', '04:35:29', '19:57:54', NULL, NULL),
(6, 2, 'Maurine Williamson I', '23:12:07', '22:49:40', NULL, NULL),
(7, 2, 'Mrs. Rubie Funk', '12:46:22', '14:29:56', NULL, NULL),
(8, 2, 'Oleta Connelly Jr.', '09:05:21', '12:46:40', NULL, NULL),
(9, 3, 'Laurel Legros II', '17:15:24', '04:43:42', NULL, NULL),
(10, 3, 'Mr. Harmon Sipes DDS', '04:44:02', '09:35:17', NULL, NULL),
(11, 3, 'Maegan Spinka Jr.', '12:45:49', '16:41:17', NULL, NULL),
(12, 3, 'Kathlyn Smith', '07:57:40', '07:12:25', NULL, NULL),
(13, 4, 'Mr. Kip Dicki', '22:34:16', '14:29:14', NULL, NULL),
(14, 4, 'Abigale Williamson', '14:24:15', '21:52:47', NULL, NULL),
(15, 4, 'Dr. Cyrus Leannon III', '18:21:49', '06:58:39', NULL, NULL),
(16, 4, 'Dorthy Stoltenberg', '13:44:57', '11:18:06', NULL, NULL),
(17, 5, 'Miss Maybelle O\'Connell', '17:42:26', '00:22:33', NULL, NULL),
(18, 5, 'Faye Hoppe', '20:10:07', '19:59:08', NULL, NULL),
(19, 5, 'Reinhold Osinski IV', '06:08:40', '07:24:24', NULL, NULL),
(20, 5, 'Dr. Alana Donnelly', '01:05:37', '08:32:57', NULL, NULL),
(21, 6, 'Shanel Barrows', '19:05:55', '04:59:03', NULL, NULL),
(22, 6, 'Reggie Jast', '17:57:01', '16:54:07', NULL, NULL),
(23, 7, 'Arlie Mueller', '03:58:00', '20:50:02', NULL, NULL);

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
(1, 'Dr. Kayley Schuppe V', 1, '15:07:28', '22:05:40', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(2, 'Dr. Lucio Shields', 1, '10:01:15', '17:29:58', '2019-01-17 10:42:14', '2019-01-17 10:42:14');

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
-- Структура таблицы `foods`
--

CREATE TABLE `foods` (
  `id` int(10) UNSIGNED NOT NULL,
  `nutrition_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('breakfast','lunch','afternoon-tea','dinner') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `foods`
--

INSERT INTO `foods` (`id`, `nutrition_id`, `name`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 'Deron Abbott', 'dinner', NULL, NULL),
(2, 1, 'Miss Alena Huels', 'afternoon-tea', NULL, NULL),
(3, 1, 'Jaquan Predovic', 'dinner', NULL, NULL),
(4, 1, 'Ocie Schmeler', 'afternoon-tea', NULL, NULL),
(5, 2, 'Mr. Jasmin Botsford I', 'breakfast', NULL, NULL),
(6, 2, 'Sabrina Klocko', 'dinner', NULL, NULL),
(7, 2, 'Verdie Eichmann V', 'lunch', NULL, NULL),
(8, 2, 'Bill Ward', 'breakfast', NULL, NULL),
(9, 3, 'Veda Ratke', 'dinner', NULL, NULL),
(10, 3, 'Mr. Dedric Feest DVM', 'afternoon-tea', NULL, NULL),
(11, 3, 'Dr. Alanna Nolan', 'dinner', NULL, NULL),
(12, 3, 'Lavina Casper', 'breakfast', NULL, NULL),
(13, 4, 'Mrs. Oceane Cassin', 'breakfast', NULL, NULL),
(14, 4, 'Jett Nolan', 'lunch', NULL, NULL),
(15, 4, 'Dr. Torey Marvin III', 'lunch', NULL, NULL),
(16, 4, 'Wilburn Wisoky', 'dinner', NULL, NULL),
(17, 5, 'Prof. Lenna Ledner', 'breakfast', NULL, NULL),
(18, 5, 'Mrs. Yvonne Wilderman MD', 'dinner', NULL, NULL),
(19, 5, 'Mireille Goyette', 'breakfast', NULL, NULL),
(20, 5, 'Cristian Mueller', 'dinner', NULL, NULL),
(21, 6, 'Armando Wuckert', 'breakfast', NULL, NULL),
(22, 6, 'Vinnie Zemlak', 'breakfast', NULL, NULL),
(23, 7, 'Edward Koch', 'afternoon-tea', NULL, NULL);

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
(1, 'Rosetta Turner', 1, '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(2, 'Selena Walter II', 1, '2019-01-17 10:42:14', '2019-01-17 10:42:14');

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
(39, '2014_10_12_000000_create_users_table', 1),
(40, '2014_10_12_100000_create_password_resets_table', 1),
(41, '2016_01_01_000000_create_posts_table', 1),
(42, '2018_08_08_100000_create_telescope_entries_table', 1),
(43, '2018_11_27_135607_create_schools_table', 1),
(44, '2018_11_27_140055_create_groups_table', 1),
(45, '2018_11_27_140409_create_schedules_table', 1),
(46, '2018_11_27_144421_create_students_table', 1),
(47, '2018_11_28_124724_create_videos_table', 1),
(48, '2018_11_30_151109_create_electives_table', 1),
(49, '2018_12_29_133217_create_notifications_table', 1),
(50, '2019_01_02_103941_create_elective_groups_table', 1),
(51, '2019_01_02_124851_create_post_groups_table', 1),
(52, '2019_01_02_133703_create_schools_groups_table', 1),
(53, '2019_01_03_092037_create_classes_table', 1),
(54, '2019_01_14_072321_create_notification_groups_table', 1),
(55, '2019_01_14_085906_create_notification_schools_table', 1),
(56, '2019_01_16_124620_create_nutritions_table', 1),
(57, '2019_01_16_124705_create_foods_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Структура таблицы `nutritions`
--

CREATE TABLE `nutritions` (
  `id` int(10) UNSIGNED NOT NULL,
  `school_id` int(11) NOT NULL,
  `day` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `nutritions`
--

INSERT INTO `nutritions` (`id`, `school_id`, `day`, `created_at`, `updated_at`) VALUES
(1, 1, 'Monday', NULL, NULL),
(2, 1, 'Tuesday', NULL, NULL),
(3, 1, 'Wednesday', NULL, NULL),
(4, 1, 'Thursday', NULL, NULL),
(5, 1, 'Friday', NULL, NULL),
(6, 1, 'Saturday', NULL, NULL),
(7, 1, 'Sunday', NULL, NULL);

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
  `image` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `until`, `school_id`, `preview`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Prof.', 'Quia fugiat sunt quas dolor aperiam iste et et. Aut laudantium odio temporibus quia molestiae porro. Est in porro sunt vero vel velit. Repellat molestias repellendus ratione eos ut placeat nam.', '2015-12-16', 1, 'https://lorempixel.com/640/480/?69303', 'https://lorempixel.com/640/480/?55586', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(2, 'Prof.', 'Totam fuga velit dolorem quis vel. Debitis corrupti a magni nam aut ut. Alias sit fuga qui provident. Sint quos quos rem dolor.', '1983-06-24', 1, 'https://lorempixel.com/640/480/?60850', 'https://lorempixel.com/640/480/?96442', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(3, 'Prof.', 'Quod et magni et at ut molestias sed. Recusandae perspiciatis quaerat sed. Mollitia in qui quasi id asperiores et.', '1994-05-22', 1, 'https://lorempixel.com/640/480/?32825', 'https://lorempixel.com/640/480/?64823', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(4, 'Mrs.', 'Autem reprehenderit dolor aut autem asperiores officiis deserunt. Sit tempore architecto quasi dolorem totam fuga. Necessitatibus aut molestias optio ut officiis odio eveniet.', '1973-03-12', 1, 'https://lorempixel.com/640/480/?27096', 'https://lorempixel.com/640/480/?30823', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(5, 'Ms.', 'Et tempora temporibus aut velit ut deleniti. Possimus ut ut qui laudantium aliquid exercitationem aspernatur. Enim quod ratione est et aut officia.', '1972-12-10', 1, 'https://lorempixel.com/640/480/?86135', 'https://lorempixel.com/640/480/?71350', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(6, 'Miss', 'Id nemo distinctio eligendi. Quas modi et ut dolor aperiam. In itaque quia dolor autem est. Occaecati amet sint quas unde.', '2008-05-26', 1, 'https://lorempixel.com/640/480/?38486', 'https://lorempixel.com/640/480/?60324', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(7, 'Mrs.', 'Dolore consectetur ad et et quis. Ratione aliquid sunt reprehenderit est. Voluptatem qui maiores suscipit illum et maiores. Et consectetur suscipit qui perspiciatis quia similique.', '1980-09-19', 1, 'https://lorempixel.com/640/480/?29849', 'https://lorempixel.com/640/480/?28749', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(8, 'Prof.', 'Voluptas magni quas quos eum doloremque eligendi. Blanditiis consequatur a qui illo eligendi maxime. Laudantium repellat qui natus aut rerum. Odit explicabo quibusdam excepturi vero non saepe.', '2008-02-05', 1, 'https://lorempixel.com/640/480/?42520', 'https://lorempixel.com/640/480/?57793', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(9, 'Dr.', 'Sunt libero molestiae at quis et unde. Tempora consectetur officiis est nihil dolore sint labore. Omnis ut fuga quas. Veniam non est quod architecto.', '1970-01-17', 1, 'https://lorempixel.com/640/480/?13345', 'https://lorempixel.com/640/480/?17135', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(10, 'Ms.', 'Voluptatum molestias qui est numquam nisi. Quod quibusdam iusto et dolorem sapiente. Aut et ipsam facere nemo.', '2004-01-11', 1, 'https://lorempixel.com/640/480/?12968', 'https://lorempixel.com/640/480/?88626', '2019-01-17 10:42:14', '2019-01-17 10:42:14');

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
(1, 'Mr. Sylvan Strosin II', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(2, 'Miss Pinkie Keeling', '2019-01-17 10:42:14', '2019-01-17 10:42:14');

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
(1, 'Ms.', 1, 1, '1986-05-21', 'ACTIVE', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(2, 'Dr.', 1, 1, '1979-05-04', 'INACTIVE', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(3, 'Ms.', 1, 1, '1983-04-24', 'ACTIVE', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(4, 'Dr.', 1, 1, '1985-09-05', 'ACTIVE', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(5, 'Dr.', 1, 1, '2009-01-05', 'INACTIVE', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(6, 'Mr.', 1, 1, '1976-03-28', 'INACTIVE', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(7, 'Mrs.', 1, 1, '1999-06-24', 'INACTIVE', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(8, 'Mr.', 1, 1, '1986-06-05', 'ACTIVE', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(9, 'Dr.', 1, 1, '1999-11-04', 'ACTIVE', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(10, 'Prof.', 1, 1, '2012-08-20', 'INACTIVE', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(11, 'Mr.', 1, 1, '1998-10-16', 'ACTIVE', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(12, 'Mrs.', 1, 1, '1999-06-10', 'ACTIVE', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(13, 'Ms.', 1, 1, '1998-01-18', 'ACTIVE', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(14, 'Dr.', 1, 1, '2003-01-25', 'INACTIVE', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(15, 'Dr.', 1, 1, '1977-08-18', 'ACTIVE', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(16, 'Prof.', 1, 1, '1994-07-10', 'INACTIVE', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(17, 'Mrs.', 1, 1, '1996-01-28', 'INACTIVE', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(18, 'Prof.', 1, 1, '2002-12-03', 'ACTIVE', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(19, 'Prof.', 1, 1, '1992-11-11', 'INACTIVE', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(20, 'Miss', 1, 1, '1995-01-22', 'INACTIVE', '2019-01-17 10:42:14', '2019-01-17 10:42:14');

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

INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(1, '8cc3df55-353a-4eaf-aac2-c3c322b77333', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"kindergarten\",\"migrations\"],\"sql\":\"select * from information_schema.tables where table_schema = ? and table_name = ?\",\"time\":\"1.25\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(2, '8cc3df55-38b0-40e1-ac31-808585df47e9', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `migration` from `migrations` order by `batch` asc, `migration` asc\",\"time\":\"0.44\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(3, '8cc3df55-3cd3-4aa4-9c37-4e027f3166a3', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"drop table if exists `foods`\",\"time\":\"3.99\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2019_01_16_124705_create_foods_table.php\",\"line\":32,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(4, '8cc3df55-3d18-403b-83fe-cbd8d8bcfc2e', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2019_01_16_124705_create_foods_table\"],\"sql\":\"delete from `migrations` where `migration` = ?\",\"time\":\"0.31\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(5, '8cc3df55-3e24-426e-8b65-bd437b5aa22a', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"drop table if exists `nutritions`\",\"time\":\"1.91\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2019_01_16_124620_create_nutritions_table.php\",\"line\":31,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(6, '8cc3df55-3e6e-40a6-ac95-143aef178940', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2019_01_16_124620_create_nutritions_table\"],\"sql\":\"delete from `migrations` where `migration` = ?\",\"time\":\"0.32\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(7, '8cc3df55-3f53-4d68-b730-e553e4577a99', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"drop table if exists `notification_schools`\",\"time\":\"1.77\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2019_01_14_085906_create_notification_schools_table.php\",\"line\":36,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(8, '8cc3df55-3f8d-4240-8e19-8906543f1f03', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2019_01_14_085906_create_notification_schools_table\"],\"sql\":\"delete from `migrations` where `migration` = ?\",\"time\":\"0.24\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(9, '8cc3df55-4054-4408-aef0-f9a6bb0d94c3', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"drop table if exists `notification_groups`\",\"time\":\"1.58\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2019_01_14_072321_create_notification_groups_table.php\",\"line\":35,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(10, '8cc3df55-4088-4056-8c8d-64c212f9b14d', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2019_01_14_072321_create_notification_groups_table\"],\"sql\":\"delete from `migrations` where `migration` = ?\",\"time\":\"0.21\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(11, '8cc3df55-415c-4cfb-ae4c-f7b7b86b4b7a', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"drop table if exists `classes`\",\"time\":\"1.72\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2019_01_03_092037_create_classes_table.php\",\"line\":33,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(12, '8cc3df55-418f-4fd5-8c23-2c8ccabef419', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2019_01_03_092037_create_classes_table\"],\"sql\":\"delete from `migrations` where `migration` = ?\",\"time\":\"0.21\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(13, '8cc3df55-42b2-4204-b8f3-517539a6ba78', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"drop table if exists `group_school`\",\"time\":\"2.51\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2019_01_02_133703_create_schools_groups_table.php\",\"line\":35,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(14, '8cc3df55-42e8-4e14-8348-d0076616f3c3', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2019_01_02_133703_create_schools_groups_table\"],\"sql\":\"delete from `migrations` where `migration` = ?\",\"time\":\"0.23\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(15, '8cc3df55-43b9-481b-9136-8a4ffaee6d73', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"drop table if exists `post_groups`\",\"time\":\"1.72\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2019_01_02_124851_create_post_groups_table.php\",\"line\":36,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(16, '8cc3df55-43ec-452c-87e5-1ab291c70b9c', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2019_01_02_124851_create_post_groups_table\"],\"sql\":\"delete from `migrations` where `migration` = ?\",\"time\":\"0.21\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(17, '8cc3df55-44c0-4dc4-94fc-098198d67be9', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"drop table if exists `elective_groups`\",\"time\":\"1.72\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2019_01_02_103941_create_elective_groups_table.php\",\"line\":36,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(18, '8cc3df55-44f7-4a6c-8d8b-86721cca9f71', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2019_01_02_103941_create_elective_groups_table\"],\"sql\":\"delete from `migrations` where `migration` = ?\",\"time\":\"0.23\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(19, '8cc3df55-45cd-4c7a-b6df-104c2150805d', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"drop table if exists `notifications`\",\"time\":\"1.60\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2018_12_29_133217_create_notifications_table.php\",\"line\":31,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(20, '8cc3df55-4606-469a-8bec-ac64f70cc4b3', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2018_12_29_133217_create_notifications_table\"],\"sql\":\"delete from `migrations` where `migration` = ?\",\"time\":\"0.22\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(21, '8cc3df55-4707-467f-b844-9af9c57f8ebc', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"drop table if exists `electives`\",\"time\":\"2.17\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2018_11_30_151109_create_electives_table.php\",\"line\":33,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(22, '8cc3df55-473a-494c-bf8b-77ac0d16ae88', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2018_11_30_151109_create_electives_table\"],\"sql\":\"delete from `migrations` where `migration` = ?\",\"time\":\"0.20\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(23, '8cc3df55-4807-434d-8c15-069d97ea6ba0', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"drop table if exists `videos`\",\"time\":\"1.65\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2018_11_28_124724_create_videos_table.php\",\"line\":32,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(24, '8cc3df55-4839-4bdd-bc93-59832cff2321', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2018_11_28_124724_create_videos_table\"],\"sql\":\"delete from `migrations` where `migration` = ?\",\"time\":\"0.20\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(25, '8cc3df55-48f1-4a2e-bc36-6bfe46574eca', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"drop table if exists `students`\",\"time\":\"1.46\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2018_11_27_144421_create_students_table.php\",\"line\":34,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(26, '8cc3df55-492d-4853-a0f7-4b8807dc63fe', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2018_11_27_144421_create_students_table\"],\"sql\":\"delete from `migrations` where `migration` = ?\",\"time\":\"0.30\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(27, '8cc3df55-49f4-4d8d-b945-b8200807519e', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"drop table if exists `schedules`\",\"time\":\"1.53\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2018_11_27_140409_create_schedules_table.php\",\"line\":31,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(28, '8cc3df55-4a27-47dd-93fa-80db702b5b43', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2018_11_27_140409_create_schedules_table\"],\"sql\":\"delete from `migrations` where `migration` = ?\",\"time\":\"0.20\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(29, '8cc3df55-4ae3-4baa-9148-465249e7f07c', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"drop table if exists `groups`\",\"time\":\"1.49\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2018_11_27_140055_create_groups_table.php\",\"line\":32,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(30, '8cc3df55-4b20-44c5-91c6-751888aea1cd', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2018_11_27_140055_create_groups_table\"],\"sql\":\"delete from `migrations` where `migration` = ?\",\"time\":\"0.24\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(31, '8cc3df55-4c45-4216-b8b2-c202a1476209', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"drop table if exists `schools`\",\"time\":\"2.44\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2018_11_27_135607_create_schools_table.php\",\"line\":30,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(32, '8cc3df55-4c80-4a2e-9614-f18a6325b2c5', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2018_11_27_135607_create_schools_table\"],\"sql\":\"delete from `migrations` where `migration` = ?\",\"time\":\"0.25\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(33, '8cc3df55-4d65-49a7-9a19-54b5041cbde7', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"drop table if exists `telescope_entries_tags`\",\"time\":\"1.76\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(34, '8cc3df55-4e68-43c2-a89b-e5662e159c80', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"drop table if exists `telescope_entries`\",\"time\":\"2.27\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(35, '8cc3df55-4f58-4d27-9e88-0e784520d9a0', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"drop table if exists `telescope_monitoring`\",\"time\":\"2.06\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(36, '8cc3df55-4f9a-4d64-95c3-17d4b8b8dbf6', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2018_08_08_100000_create_telescope_entries_table\"],\"sql\":\"delete from `migrations` where `migration` = ?\",\"time\":\"0.27\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(37, '8cc3df55-50e6-488b-abb2-fafe780cd638', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"drop table `posts`\",\"time\":\"2.76\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2016_01_01_000000_create_posts_table.php\",\"line\":35,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(38, '8cc3df55-512d-4485-a2e3-5f6f1fcb4812', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2016_01_01_000000_create_posts_table\"],\"sql\":\"delete from `migrations` where `migration` = ?\",\"time\":\"0.32\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(39, '8cc3df55-522f-4111-b8ee-0801447139c0', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"drop table if exists `password_resets`\",\"time\":\"1.99\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2014_10_12_100000_create_password_resets_table.php\",\"line\":30,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(40, '8cc3df55-526d-44b6-8300-7942e4d58218', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2014_10_12_100000_create_password_resets_table\"],\"sql\":\"delete from `migrations` where `migration` = ?\",\"time\":\"0.25\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(41, '8cc3df55-5346-40ea-8bd2-09c120545304', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"drop table if exists `users`\",\"time\":\"1.69\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2014_10_12_000000_create_users_table.php\",\"line\":51,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(42, '8cc3df55-537a-4f0f-9827-1df9b2e66656', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2014_10_12_000000_create_users_table\"],\"sql\":\"delete from `migrations` where `migration` = ?\",\"time\":\"0.20\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(43, '8cc3df55-53d5-4aac-ab26-3d2c42d4cfd6', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"kindergarten\",\"migrations\"],\"sql\":\"select * from information_schema.tables where table_schema = ? and table_name = ?\",\"time\":\"0.35\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(44, '8cc3df55-5474-42a1-92ba-044dddc80d33', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `migration` from `migrations` order by `batch` asc, `migration` asc\",\"time\":\"0.19\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(45, '8cc3df55-54b4-4fc4-b7a9-6f3c7791aca9', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select max(`batch`) as aggregate from `migrations`\",\"time\":\"0.17\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(46, '8cc3df55-570f-4b3f-9b43-fd112bec1dac', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `users` (`id` int unsigned not null auto_increment primary key, `name` varchar(191) not null, `parent_name` varchar(191) null, `parent_phone` varchar(191) null, `parents` enum(\'father\', \'mother\') null, `address` varchar(191) null, `birthday` date null, `avatar` varchar(191) null, `school_id` int null, `group_id` int null, `status` enum(\'active\', \'disable\') not null default \'active\', `email` varchar(191) not null, `email_verified_at` timestamp null, `password` varchar(191) not null, `token` varchar(191) not null, `push` enum(\'enabled\', \'disabled\') not null, `player_id` varchar(36) null, `type` varchar(191) not null default \'default\', `remember_token` varchar(100) null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.10\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2014_10_12_000000_create_users_table.php\",\"line\":41,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(47, '8cc3df55-58e8-4ca0-b66e-9783ab63281a', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `users` add unique `users_email_unique`(`email`)\",\"time\":\"4.42\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2014_10_12_000000_create_users_table.php\",\"line\":41,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(48, '8cc3df55-5a69-4f14-8eb0-0ffbb303f101', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `users` add unique `users_token_unique`(`token`)\",\"time\":\"3.52\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2014_10_12_000000_create_users_table.php\",\"line\":41,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(49, '8cc3df55-5aa3-4177-a901-ee04026bd668', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2014_10_12_000000_create_users_table\",1],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (?, ?)\",\"time\":\"0.20\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(50, '8cc3df55-5cac-440a-a59c-2a5de1f9c957', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `password_resets` (`email` varchar(191) not null, `token` varchar(191) not null, `created_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.61\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2014_10_12_100000_create_password_resets_table.php\",\"line\":20,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(51, '8cc3df55-5e55-427d-bb6b-b3b910d68e86', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `password_resets` add index `password_resets_email_index`(`email`)\",\"time\":\"3.95\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2014_10_12_100000_create_password_resets_table.php\",\"line\":20,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(52, '8cc3df55-5e92-42a3-b932-3c697e969554', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2014_10_12_100000_create_password_resets_table\",1],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (?, ?)\",\"time\":\"0.22\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(53, '8cc3df55-60b9-4a12-a9e7-3e58818eccd9', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `posts` (`id` int unsigned not null auto_increment primary key, `title` varchar(191) not null, `body` text not null, `until` date not null, `school_id` int not null, `preview` varchar(191) null, `image` text null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.81\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2016_01_01_000000_create_posts_table.php\",\"line\":25,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(54, '8cc3df55-60ef-43d3-a135-4b09a0b25783', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2016_01_01_000000_create_posts_table\",1],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (?, ?)\",\"time\":\"0.19\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(55, '8cc3df55-6321-496a-b456-9efb393a7ffc', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `telescope_entries` (`sequence` bigint unsigned not null auto_increment primary key, `uuid` char(36) not null, `batch_id` char(36) not null, `family_hash` varchar(191) null, `should_display_on_index` tinyint(1) not null default \'1\', `type` varchar(20) not null, `content` text not null, `created_at` datetime null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.85\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(56, '8cc3df55-64cf-49c1-81bc-13472a6e3441', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add unique `telescope_entries_uuid_unique`(`uuid`)\",\"time\":\"3.98\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(57, '8cc3df55-663e-4e93-9be3-51fa8267baa3', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add index `telescope_entries_batch_id_index`(`batch_id`)\",\"time\":\"3.35\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(58, '8cc3df55-67c2-4cfc-93b9-19871070cd80', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add index `telescope_entries_type_should_display_on_index_index`(`type`, `should_display_on_index`)\",\"time\":\"3.51\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(59, '8cc3df55-6935-4e2a-8e4f-695dda1486d3', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add index `telescope_entries_family_hash_index`(`family_hash`)\",\"time\":\"3.35\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(60, '8cc3df55-6b34-42f0-acd1-b29f42c8fd1f', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `telescope_entries_tags` (`entry_uuid` char(36) not null, `tag` varchar(191) not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.62\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(61, '8cc3df55-6ce5-49a3-b097-6912a77e1026', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries_tags` add index `telescope_entries_tags_entry_uuid_tag_index`(`entry_uuid`, `tag`)\",\"time\":\"4.01\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(62, '8cc3df55-6e3b-4c86-93f9-79430065b12d', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries_tags` add index `telescope_entries_tags_tag_index`(`tag`)\",\"time\":\"3.09\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(63, '8cc3df55-727f-4692-a918-c055aacf335d', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries_tags` add constraint `telescope_entries_tags_entry_uuid_foreign` foreign key (`entry_uuid`) references `telescope_entries` (`uuid`) on delete cascade\",\"time\":\"10.59\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(64, '8cc3df55-7468-4813-8e06-ed187e68c0f2', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `telescope_monitoring` (`tag` varchar(191) not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.45\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(65, '8cc3df55-74a1-4e83-b407-919885de1546', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2018_08_08_100000_create_telescope_entries_table\",1],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (?, ?)\",\"time\":\"0.20\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(66, '8cc3df55-76a4-4e98-ae1c-15f065be7532', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `schools` (`id` int unsigned not null auto_increment primary key, `name` varchar(191) not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.60\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2018_11_27_135607_create_schools_table.php\",\"line\":20,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(67, '8cc3df55-76db-43eb-b85c-00db77e14503', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2018_11_27_135607_create_schools_table\",1],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (?, ?)\",\"time\":\"0.19\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(68, '8cc3df55-78d5-47cb-81e9-3491e9aaf21a', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `groups` (`id` int unsigned not null auto_increment primary key, `name` varchar(191) not null, `user_id` int not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.50\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2018_11_27_140055_create_groups_table.php\",\"line\":22,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(69, '8cc3df55-790a-4c04-9236-5f945b049aa1', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2018_11_27_140055_create_groups_table\",1],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (?, ?)\",\"time\":\"0.18\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(70, '8cc3df55-7b0b-4333-802b-120281699be2', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `schedules` (`id` int unsigned not null auto_increment primary key, `school_id` int not null, `day` enum(\'Monday\', \'Tuesday\', \'Wednesday\', \'Thursday\', \'Friday\', \'Saturday\', \'Sunday\') not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.59\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2018_11_27_140409_create_schedules_table.php\",\"line\":21,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(71, '8cc3df55-7b3d-41a8-b85b-49a002a0b054', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2018_11_27_140409_create_schedules_table\",1],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (?, ?)\",\"time\":\"0.18\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(72, '8cc3df55-7d56-4233-afa6-c82c8f0b9370', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `students` (`id` int unsigned not null auto_increment primary key, `FIO` varchar(191) not null, `group_id` int not null, `user_id` int not null, `birthday` varchar(191) not null, `status` enum(\'ACTIVE\', \'INACTIVE\') not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.74\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2018_11_27_144421_create_students_table.php\",\"line\":24,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(73, '8cc3df55-7d8b-4c05-9b20-6612dffbf1d5', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2018_11_27_144421_create_students_table\",1],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (?, ?)\",\"time\":\"0.19\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(74, '8cc3df55-7faa-42ac-a5f2-20acdcfd7afa', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `videos` (`id` int unsigned not null auto_increment primary key, `school_id` int not null, `name` varchar(191) not null, `url` varchar(191) not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.80\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2018_11_28_124724_create_videos_table.php\",\"line\":22,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(75, '8cc3df55-7fe6-497e-818e-a696e2a2a4ea', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2018_11_28_124724_create_videos_table\",1],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (?, ?)\",\"time\":\"0.21\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(76, '8cc3df55-81e8-4628-93e5-902c3244e0ae', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `electives` (`id` int unsigned not null auto_increment primary key, `name` varchar(191) not null, `school_id` int not null, `time_start` time not null, `time_end` time not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.51\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2018_11_30_151109_create_electives_table.php\",\"line\":23,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(77, '8cc3df55-8220-4bff-b3a4-8c67e3b992b3', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2018_11_30_151109_create_electives_table\",1],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (?, ?)\",\"time\":\"0.20\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(78, '8cc3df55-8403-4814-be40-64d6b5af734e', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `notifications` (`id` int unsigned not null auto_increment primary key, `title` varchar(191) not null, `message` text not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.31\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2018_12_29_133217_create_notifications_table.php\",\"line\":21,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(79, '8cc3df55-8436-407e-84d9-188ac0b55c7f', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2018_12_29_133217_create_notifications_table\",1],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (?, ?)\",\"time\":\"0.18\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(80, '8cc3df55-8634-4ac0-a9d4-309280597ff8', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `elective_groups` (`id` int unsigned not null auto_increment primary key, `electivy_id` int unsigned not null, `group_id` int unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.52\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2019_01_02_103941_create_elective_groups_table.php\",\"line\":26,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(81, '8cc3df55-8a35-48b0-9d3b-5d5416dc15b0', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `elective_groups` add constraint `elective_groups_electivy_id_foreign` foreign key (`electivy_id`) references `electives` (`id`)\",\"time\":\"9.91\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2019_01_02_103941_create_elective_groups_table.php\",\"line\":26,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(82, '8cc3df55-8e94-4933-bda7-5c2ccd6669dd', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `elective_groups` add constraint `elective_groups_group_id_foreign` foreign key (`group_id`) references `groups` (`id`)\",\"time\":\"10.82\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2019_01_02_103941_create_elective_groups_table.php\",\"line\":26,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(83, '8cc3df55-8ed6-44d7-85f7-ca48dcc13a49', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2019_01_02_103941_create_elective_groups_table\",1],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (?, ?)\",\"time\":\"0.24\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(84, '8cc3df55-91c1-4334-922b-bf7822b18c22', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `post_groups` (`id` int unsigned not null auto_increment primary key, `post_id` int unsigned not null, `group_id` int unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"6.79\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2019_01_02_124851_create_post_groups_table.php\",\"line\":25,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(85, '8cc3df55-964c-4a26-b377-e36bc620585f', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `post_groups` add constraint `post_groups_post_id_foreign` foreign key (`post_id`) references `posts` (`id`)\",\"time\":\"11.31\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2019_01_02_124851_create_post_groups_table.php\",\"line\":25,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(86, '8cc3df55-9aa3-49f0-8938-11855fa02619', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `post_groups` add constraint `post_groups_group_id_foreign` foreign key (`group_id`) references `groups` (`id`)\",\"time\":\"10.74\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2019_01_02_124851_create_post_groups_table.php\",\"line\":25,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(87, '8cc3df55-9ae3-4a99-b1d4-14fcd4462aba', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2019_01_02_124851_create_post_groups_table\",1],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (?, ?)\",\"time\":\"0.22\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(88, '8cc3df55-9ce0-4aea-bf4d-b8a9908d564a', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `group_school` (`id` int unsigned not null auto_increment primary key, `school_id` int unsigned not null, `group_id` int unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.43\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2019_01_02_133703_create_schools_groups_table.php\",\"line\":25,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(89, '8cc3df55-a10e-443f-860b-c31c044fdfb2', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `group_school` add constraint `group_school_school_id_foreign` foreign key (`school_id`) references `schools` (`id`)\",\"time\":\"10.34\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2019_01_02_133703_create_schools_groups_table.php\",\"line\":25,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(90, '8cc3df55-a58b-4d93-91f7-e6e234ba506c', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `group_school` add constraint `group_school_group_id_foreign` foreign key (`group_id`) references `groups` (`id`)\",\"time\":\"11.11\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2019_01_02_133703_create_schools_groups_table.php\",\"line\":25,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(91, '8cc3df55-a5cd-4e17-ba3a-d56b87bed6e3', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2019_01_02_133703_create_schools_groups_table\",1],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (?, ?)\",\"time\":\"0.23\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(92, '8cc3df55-a7d8-4a1c-b262-76d6dcdb49b3', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `classes` (`id` int unsigned not null auto_increment primary key, `schedule_id` int not null, `name` varchar(191) not null, `from` time not null, `to` time not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.57\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2019_01_03_092037_create_classes_table.php\",\"line\":23,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(93, '8cc3df55-a819-4f48-b46c-57cf3a7eecd0', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2019_01_03_092037_create_classes_table\",1],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (?, ?)\",\"time\":\"0.22\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(94, '8cc3df55-aa1a-4ea1-82a6-cadb8485619e', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `notification_groups` (`id` int unsigned not null auto_increment primary key, `notification_id` int unsigned not null, `group_id` int unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.48\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2019_01_14_072321_create_notification_groups_table.php\",\"line\":25,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(95, '8cc3df55-ae55-409c-91c4-03fa0e237890', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `notification_groups` add constraint `notification_groups_notification_id_foreign` foreign key (`notification_id`) references `notifications` (`id`)\",\"time\":\"10.52\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2019_01_14_072321_create_notification_groups_table.php\",\"line\":25,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(96, '8cc3df55-b289-493a-bf27-2e0028fff7e4', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `notification_groups` add constraint `notification_groups_group_id_foreign` foreign key (`group_id`) references `groups` (`id`)\",\"time\":\"10.40\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2019_01_14_072321_create_notification_groups_table.php\",\"line\":25,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(97, '8cc3df55-b2c8-42e9-acf1-2a0b5e4d56b0', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2019_01_14_072321_create_notification_groups_table\",1],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (?, ?)\",\"time\":\"0.22\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(98, '8cc3df55-b4e2-4f0b-9a9f-72c6c05b21ae', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `notification_schools` (`id` int unsigned not null auto_increment primary key, `notification_id` int unsigned not null, `school_id` int unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.64\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2019_01_14_085906_create_notification_schools_table.php\",\"line\":26,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(99, '8cc3df55-b8d9-4d9d-ad92-7c42c042a1fd', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `notification_schools` add constraint `notification_schools_notification_id_foreign` foreign key (`notification_id`) references `notifications` (`id`)\",\"time\":\"9.83\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2019_01_14_085906_create_notification_schools_table.php\",\"line\":26,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(100, '8cc3df55-bd1a-4c64-ad6b-408df62d009f', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `notification_schools` add constraint `notification_schools_school_id_foreign` foreign key (`school_id`) references `schools` (`id`)\",\"time\":\"10.55\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2019_01_14_085906_create_notification_schools_table.php\",\"line\":26,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(101, '8cc3df55-bd58-41d2-b8c6-45c0ccf2f48d', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2019_01_14_085906_create_notification_schools_table\",1],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (?, ?)\",\"time\":\"0.22\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(102, '8cc3df55-bf5a-4478-8c98-4fcf40950ebb', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `nutritions` (`id` int unsigned not null auto_increment primary key, `school_id` int not null, `day` enum(\'Monday\', \'Tuesday\', \'Wednesday\', \'Thursday\', \'Friday\', \'Saturday\', \'Sunday\') not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.53\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2019_01_16_124620_create_nutritions_table.php\",\"line\":21,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14');
INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(103, '8cc3df55-bf94-4e00-af05-ee2c9c04ca05', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2019_01_16_124620_create_nutritions_table\",1],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (?, ?)\",\"time\":\"0.20\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(104, '8cc3df55-c1b4-4143-803c-7ec9890922eb', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `foods` (`id` int unsigned not null auto_increment primary key, `nutrition_id` int not null, `name` varchar(191) not null, `type` enum(\'breakfast\', \'lunch\', \'afternoon-tea\', \'dinner\') not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.81\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\migrations\\\\2019_01_16_124705_create_foods_table.php\",\"line\":22,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(105, '8cc3df55-c1ef-4ca4-a10d-4cbdb2af92f5', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"2019_01_16_124705_create_foods_table\",1],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (?, ?)\",\"time\":\"0.20\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\artisan\",\"line\":37,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(106, '8cc3df55-cb8c-44a1-8b44-ec6bfb53f8d9', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"\\u0421\\u0442\\u0430\\u043d\\u0438\\u0441\\u043b\\u0430\\u0432\",\"admin@admin.com\",\"2019-01-17 12:42:14\",\"$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88\\/TXl7ZQFUcaF0hYpgJJwxwiS2\",\"AO5UH\",\"aFnhbzbT49\",\"disabled\",\"Ms. Alysa Walsh\",\"446.551.5872 x97820\",\"father\",\"9035 Daphnee Corner Suite 267\\nSouth Melvina, IN 48418-4933\",\"1980-09-12\",1,1,\"active\",\"admin\"],\"sql\":\"insert into `users` (`name`, `email`, `email_verified_at`, `password`, `token`, `remember_token`, `push`, `parent_name`, `parent_phone`, `parents`, `address`, `birthday`, `school_id`, `group_id`, `status`, `type`) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.45\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\factories\\\\UserFactory.php\",\"line\":57,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(107, '8cc3df55-cedf-4557-8c2e-d53a6e9b7dc7', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Prof. Drew Swift\",\"tlehner@example.org\",\"2019-01-17 12:42:14\",\"$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88\\/TXl7ZQFUcaF0hYpgJJwxwiS2\",\"QpC6g\",\"Emi8nWUFGW\",\"disabled\",\"Prince Crona\",\"(369) 512-0182\",\"father\",\"43489 Upton Overpass Apt. 272\\nCronabury, CA 65466\",\"2005-01-17\",1,1,\"active\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `users` (`name`, `email`, `email_verified_at`, `password`, `token`, `remember_token`, `push`, `parent_name`, `parent_phone`, `parents`, `address`, `birthday`, `school_id`, `group_id`, `status`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.37\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\UserSeeder.php\",\"line\":15,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(108, '8cc3df55-cf0a-4af2-b2a6-6b79d51f314e', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\User:2\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(109, '8cc3df55-cf57-4585-a3b0-569a0206f99a', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Adrianna Fadel\",\"stephon.parker@example.com\",\"2019-01-17 12:42:14\",\"$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88\\/TXl7ZQFUcaF0hYpgJJwxwiS2\",\"8I3YI\",\"2KJOIspeKp\",\"enabled\",\"Laverne Kessler\",\"341-716-9085\",\"mother\",\"16072 Lorenz Ridge\\nHaagtown, MN 29712-9382\",\"1999-10-08\",1,1,\"active\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `users` (`name`, `email`, `email_verified_at`, `password`, `token`, `remember_token`, `push`, `parent_name`, `parent_phone`, `parents`, `address`, `birthday`, `school_id`, `group_id`, `status`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.30\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\UserSeeder.php\",\"line\":15,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(110, '8cc3df55-cf6d-4cd9-81fd-7bfdcfc87ab9', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\User:3\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(111, '8cc3df55-cfc3-4992-85dc-e3cef023496b', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Dr. Osborne Monahan\",\"carolyn.pfeffer@example.com\",\"2019-01-17 12:42:14\",\"$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88\\/TXl7ZQFUcaF0hYpgJJwxwiS2\",\"5Rfej\",\"74iEnYUFo1\",\"enabled\",\"Trace Halvorson\",\"870.859.0361 x655\",\"mother\",\"705 Leora Stream\\nEast Araceli, NH 15437-7560\",\"2005-10-03\",1,1,\"active\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `users` (`name`, `email`, `email_verified_at`, `password`, `token`, `remember_token`, `push`, `parent_name`, `parent_phone`, `parents`, `address`, `birthday`, `school_id`, `group_id`, `status`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.28\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\UserSeeder.php\",\"line\":15,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(112, '8cc3df55-cfda-4662-afdd-7174d882a815', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\User:4\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(113, '8cc3df55-d01d-4cee-b6f1-3167d3fe2244', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Derek Muller\",\"gvolkman@example.org\",\"2019-01-17 12:42:14\",\"$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88\\/TXl7ZQFUcaF0hYpgJJwxwiS2\",\"wvmG5\",\"neMgfLCpv0\",\"enabled\",\"Mr. Stewart O\'Keefe\",\"523-655-4278 x172\",\"father\",\"34088 Margie Fork Apt. 439\\nSouth Alvinaborough, DC 48732\",\"1971-08-07\",1,1,\"active\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `users` (`name`, `email`, `email_verified_at`, `password`, `token`, `remember_token`, `push`, `parent_name`, `parent_phone`, `parents`, `address`, `birthday`, `school_id`, `group_id`, `status`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.28\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\UserSeeder.php\",\"line\":15,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(114, '8cc3df55-d031-441e-84d8-4ac04e25b908', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\User:5\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(115, '8cc3df55-d078-46ee-808c-a5dee1755e27', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Jaycee Lakin\",\"trantow.devan@example.com\",\"2019-01-17 12:42:14\",\"$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88\\/TXl7ZQFUcaF0hYpgJJwxwiS2\",\"pq3NC\",\"5VLObCLohl\",\"enabled\",\"Graham Eichmann\",\"+1 (436) 915-8339\",\"father\",\"15631 Green Mission\\nErlingbury, SD 00513\",\"1970-01-08\",1,1,\"active\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `users` (`name`, `email`, `email_verified_at`, `password`, `token`, `remember_token`, `push`, `parent_name`, `parent_phone`, `parents`, `address`, `birthday`, `school_id`, `group_id`, `status`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.29\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\UserSeeder.php\",\"line\":15,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(116, '8cc3df55-d08d-4cec-ba85-a237b6e6d4e6', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\User:6\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(117, '8cc3df55-d0d3-4300-8e6a-67b754d5b79c', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Mariela Green\",\"johns.melany@example.org\",\"2019-01-17 12:42:14\",\"$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88\\/TXl7ZQFUcaF0hYpgJJwxwiS2\",\"fgvll\",\"mEC3jX8ZVb\",\"disabled\",\"Mrs. Mariah Funk\",\"293-625-0939 x0870\",\"father\",\"2341 Tromp Parkways Suite 094\\nCarmelahaven, ID 26880-1683\",\"2013-02-28\",1,1,\"active\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `users` (`name`, `email`, `email_verified_at`, `password`, `token`, `remember_token`, `push`, `parent_name`, `parent_phone`, `parents`, `address`, `birthday`, `school_id`, `group_id`, `status`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.28\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\UserSeeder.php\",\"line\":15,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(118, '8cc3df55-d0e8-4c82-bf5a-8e41df009b3e', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\User:7\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(119, '8cc3df55-d12e-4bcc-8281-61af92062752', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Concepcion Paucek IV\",\"ezra79@example.org\",\"2019-01-17 12:42:14\",\"$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88\\/TXl7ZQFUcaF0hYpgJJwxwiS2\",\"UJiKj\",\"G30Ghz3QD7\",\"disabled\",\"Pascale Boyle\",\"(778) 833-1977 x960\",\"father\",\"511 Greenholt Pike\\nRalphburgh, OK 92790-0409\",\"1974-05-05\",1,1,\"active\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `users` (`name`, `email`, `email_verified_at`, `password`, `token`, `remember_token`, `push`, `parent_name`, `parent_phone`, `parents`, `address`, `birthday`, `school_id`, `group_id`, `status`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.28\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\UserSeeder.php\",\"line\":15,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(120, '8cc3df55-d142-46c0-bb2a-1fd2cf88d5ab', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\User:8\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(121, '8cc3df55-d187-4dd1-a068-8c75d507f401', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Dr. Alice Schmidt\",\"shanie92@example.com\",\"2019-01-17 12:42:14\",\"$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88\\/TXl7ZQFUcaF0hYpgJJwxwiS2\",\"ORE8n\",\"9TXG9vZMMp\",\"disabled\",\"Hayden Auer\",\"469.681.7781\",\"father\",\"6238 Murphy Meadows Apt. 123\\nPort Liana, MN 72903\",\"2001-03-27\",1,1,\"active\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `users` (`name`, `email`, `email_verified_at`, `password`, `token`, `remember_token`, `push`, `parent_name`, `parent_phone`, `parents`, `address`, `birthday`, `school_id`, `group_id`, `status`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.31\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\UserSeeder.php\",\"line\":15,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(122, '8cc3df55-d19c-48e8-a5f6-11062dfbe63c', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\User:9\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(123, '8cc3df55-d1e2-4002-a389-b3651f588e93', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Mr. Arch Reichel\",\"ethel75@example.net\",\"2019-01-17 12:42:14\",\"$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88\\/TXl7ZQFUcaF0hYpgJJwxwiS2\",\"neTBe\",\"nO3dAK1Mtj\",\"disabled\",\"Mr. Jaylan Kautzer\",\"1-251-509-5362\",\"mother\",\"90019 Retta Park\\nTiaraberg, MA 79033\",\"2006-01-19\",1,1,\"active\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `users` (`name`, `email`, `email_verified_at`, `password`, `token`, `remember_token`, `push`, `parent_name`, `parent_phone`, `parents`, `address`, `birthday`, `school_id`, `group_id`, `status`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.32\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\UserSeeder.php\",\"line\":15,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(124, '8cc3df55-d1f6-4d32-99c2-3aa6fd1ca704', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\User:10\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(125, '8cc3df55-d239-4473-a137-8e1c59ef639b', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Prof. Angel Mante\",\"adicki@example.com\",\"2019-01-17 12:42:14\",\"$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88\\/TXl7ZQFUcaF0hYpgJJwxwiS2\",\"ymoh9\",\"CxlivJ3pj3\",\"enabled\",\"Laverna Becker\",\"(820) 927-9132\",\"father\",\"3017 Kiana Row Apt. 109\\nVincenzofurt, KY 74748-8713\",\"1996-12-23\",1,1,\"active\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `users` (`name`, `email`, `email_verified_at`, `password`, `token`, `remember_token`, `push`, `parent_name`, `parent_phone`, `parents`, `address`, `birthday`, `school_id`, `group_id`, `status`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.28\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\UserSeeder.php\",\"line\":15,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(126, '8cc3df55-d24d-4da9-826e-06e7fba65d66', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\User:11\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(127, '8cc3df55-d349-4ef4-9006-1c65a55e0c3c', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Mr. Sylvan Strosin II\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `schools` (`name`, `updated_at`, `created_at`) values (?, ?, ?)\",\"time\":\"1.11\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\SchoolSeeder.php\",\"line\":14,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(128, '8cc3df55-d362-448a-a488-0fd801e877f6', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\School:1\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(129, '8cc3df55-d3a1-4198-b217-71fd89c49a5d', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Miss Pinkie Keeling\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `schools` (`name`, `updated_at`, `created_at`) values (?, ?, ?)\",\"time\":\"0.25\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\SchoolSeeder.php\",\"line\":14,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(130, '8cc3df55-d3bb-4a8a-b6fa-40134cb22597', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\School:2\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(131, '8cc3df55-d49c-4799-b812-44b569338b0b', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Rosetta Turner\",1,\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `groups` (`name`, `user_id`, `updated_at`, `created_at`) values (?, ?, ?, ?)\",\"time\":\"1.08\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\GroupSeeder.php\",\"line\":14,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(132, '8cc3df55-d4b2-4c5b-acd7-ecc468cde44c', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\Group:1\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(133, '8cc3df55-d4f0-4342-8f70-3bfa9ad6e5fb', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Selena Walter II\",1,\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `groups` (`name`, `user_id`, `updated_at`, `created_at`) values (?, ?, ?, ?)\",\"time\":\"0.26\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\GroupSeeder.php\",\"line\":14,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(134, '8cc3df55-d504-4200-b7cb-d67a04285458', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\Group:2\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(135, '8cc3df55-d609-422c-85a0-bc025603bc81', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Ms.\",1,1,\"1986-05-21\",\"active\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `students` (`FIO`, `group_id`, `user_id`, `birthday`, `status`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?)\",\"time\":\"1.00\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\StudentSeeder.php\",\"line\":15,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(136, '8cc3df55-d620-4191-b9e4-b5479400dc33', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\Student:1\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(137, '8cc3df55-d65e-41cd-829c-73e0a35b96ee', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Dr.\",1,1,\"1979-05-04\",\"inactive\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `students` (`FIO`, `group_id`, `user_id`, `birthday`, `status`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.27\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\StudentSeeder.php\",\"line\":15,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(138, '8cc3df55-d67b-46b9-96e5-f8bd2a8bc89e', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\Student:2\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(139, '8cc3df55-d6b9-43d5-a536-2a9119e98e18', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Ms.\",1,1,\"1983-04-24\",\"active\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `students` (`FIO`, `group_id`, `user_id`, `birthday`, `status`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.26\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\StudentSeeder.php\",\"line\":15,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(140, '8cc3df55-d6cd-4059-9eac-d2b418ab21af', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\Student:3\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(141, '8cc3df55-d70c-4584-b6e6-37d70a3a8cb1', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Dr.\",1,1,\"1985-09-05\",\"active\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `students` (`FIO`, `group_id`, `user_id`, `birthday`, `status`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.25\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\StudentSeeder.php\",\"line\":15,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(142, '8cc3df55-d720-48a6-a85e-245fe71475d3', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\Student:4\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(143, '8cc3df55-d75d-4626-9c12-3fd85803d20d', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Dr.\",1,1,\"2009-01-05\",\"inactive\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `students` (`FIO`, `group_id`, `user_id`, `birthday`, `status`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.28\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\StudentSeeder.php\",\"line\":15,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(144, '8cc3df55-d771-4e5e-99c8-f0c2e06f118e', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\Student:5\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(145, '8cc3df55-d7ab-48b8-957a-f428b22b89d6', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Mr.\",1,1,\"1976-03-28\",\"inactive\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `students` (`FIO`, `group_id`, `user_id`, `birthday`, `status`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.24\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\StudentSeeder.php\",\"line\":15,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(146, '8cc3df55-d7c0-4d63-8618-7cc23b165525', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\Student:6\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(147, '8cc3df55-d7fa-46fc-8996-b51659115089', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Mrs.\",1,1,\"1999-06-24\",\"inactive\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `students` (`FIO`, `group_id`, `user_id`, `birthday`, `status`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.25\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\StudentSeeder.php\",\"line\":15,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(148, '8cc3df55-d813-47e7-9874-431c7b505f77', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\Student:7\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(149, '8cc3df55-d85c-43a4-8bac-e1151f82e3f0', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Mr.\",1,1,\"1986-06-05\",\"active\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `students` (`FIO`, `group_id`, `user_id`, `birthday`, `status`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.24\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\StudentSeeder.php\",\"line\":15,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(150, '8cc3df55-d872-4f8f-996b-d22e94a5398e', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\Student:8\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(151, '8cc3df55-d8ac-4f92-a112-2a655220e4d3', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Dr.\",1,1,\"1999-11-04\",\"active\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `students` (`FIO`, `group_id`, `user_id`, `birthday`, `status`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.23\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\StudentSeeder.php\",\"line\":15,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(152, '8cc3df55-d8c1-42f9-ae79-12ee41ce54f6', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\Student:9\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(153, '8cc3df55-d8fb-46b3-8ddb-904e3e0b4947', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Prof.\",1,1,\"2012-08-20\",\"inactive\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `students` (`FIO`, `group_id`, `user_id`, `birthday`, `status`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.22\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\StudentSeeder.php\",\"line\":15,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(154, '8cc3df55-d910-4e01-a2f2-f56fdf8f3b08', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\Student:10\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(155, '8cc3df55-d94c-495b-9954-e79475f85cfa', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Mr.\",1,1,\"1998-10-16\",\"active\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `students` (`FIO`, `group_id`, `user_id`, `birthday`, `status`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.26\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\StudentSeeder.php\",\"line\":15,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(156, '8cc3df55-d960-47d0-a065-f043b96953e8', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\Student:11\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(157, '8cc3df55-d99b-49de-b56a-548511c52682', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Mrs.\",1,1,\"1999-06-10\",\"active\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `students` (`FIO`, `group_id`, `user_id`, `birthday`, `status`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.24\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\StudentSeeder.php\",\"line\":15,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(158, '8cc3df55-d9b3-4fbd-8154-8b32e8773ab8', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\Student:12\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(159, '8cc3df55-d9ec-4c37-8744-dd5cd8fc7933', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Ms.\",1,1,\"1998-01-18\",\"active\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `students` (`FIO`, `group_id`, `user_id`, `birthday`, `status`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.23\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\StudentSeeder.php\",\"line\":15,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(160, '8cc3df55-da00-4847-a2aa-1f58523ed0dd', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\Student:13\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(161, '8cc3df55-da39-4674-b845-573f013da994', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Dr.\",1,1,\"2003-01-25\",\"inactive\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `students` (`FIO`, `group_id`, `user_id`, `birthday`, `status`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.23\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\StudentSeeder.php\",\"line\":15,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(162, '8cc3df55-da4e-4117-aa32-7f5f771b388d', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\Student:14\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(163, '8cc3df55-da8e-4293-bf5f-3df31280f63a', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Dr.\",1,1,\"1977-08-18\",\"active\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `students` (`FIO`, `group_id`, `user_id`, `birthday`, `status`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.27\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\StudentSeeder.php\",\"line\":15,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(164, '8cc3df55-daa2-4002-aa51-dab385f6a44c', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\Student:15\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(165, '8cc3df55-dae0-4224-8d32-741e4ec3414e', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Prof.\",1,1,\"1994-07-10\",\"inactive\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `students` (`FIO`, `group_id`, `user_id`, `birthday`, `status`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.28\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\StudentSeeder.php\",\"line\":15,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(166, '8cc3df55-daf4-41ca-a0e4-40397b317544', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\Student:16\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(167, '8cc3df55-db32-4468-9485-62409a1f4442', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Mrs.\",1,1,\"1996-01-28\",\"inactive\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `students` (`FIO`, `group_id`, `user_id`, `birthday`, `status`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.25\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\StudentSeeder.php\",\"line\":15,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(168, '8cc3df55-db46-42fc-bb0a-e9681639d023', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\Student:17\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(169, '8cc3df55-db80-4a2c-ac68-dc7269c12dd3', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Prof.\",1,1,\"2002-12-03\",\"active\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `students` (`FIO`, `group_id`, `user_id`, `birthday`, `status`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.24\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\StudentSeeder.php\",\"line\":15,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(170, '8cc3df55-db99-4fd6-8dac-021bd81bd5af', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\Student:18\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(171, '8cc3df55-dbd3-4007-b200-d3be8b46f1cd', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Prof.\",1,1,\"1992-11-11\",\"inactive\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `students` (`FIO`, `group_id`, `user_id`, `birthday`, `status`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.25\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\StudentSeeder.php\",\"line\":15,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(172, '8cc3df55-dbe7-4131-a248-d8d61f9a41d5', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\Student:19\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(173, '8cc3df55-dc25-4d6b-a7d3-1886566cc219', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Miss\",1,1,\"1995-01-22\",\"inactive\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `students` (`FIO`, `group_id`, `user_id`, `birthday`, `status`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.25\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\StudentSeeder.php\",\"line\":15,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(174, '8cc3df55-dc39-4694-8016-43fcf4d46b69', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\Student:20\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(175, '8cc3df55-dd8f-4856-9946-77dc0f5c73c9', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Prof.\",\"Quia fugiat sunt quas dolor aperiam iste et et. Aut laudantium odio temporibus quia molestiae porro. Est in porro sunt vero vel velit. Repellat molestias repellendus ratione eos ut placeat nam.\",\"2015-12-16\",1,\"https:\\/\\/lorempixel.com\\/640\\/480\\/?55586\",\"https:\\/\\/lorempixel.com\\/640\\/480\\/?69303\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `posts` (`title`, `body`, `until`, `school_id`, `image`, `preview`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?, ?)\",\"time\":\"1.08\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\PostSeeder.php\",\"line\":14,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(176, '8cc3df55-dda5-4c56-b0f9-560b8b9520f8', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\Post:1\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(177, '8cc3df55-ddef-471f-ba2b-2184590825e4', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Prof.\",\"Totam fuga velit dolorem quis vel. Debitis corrupti a magni nam aut ut. Alias sit fuga qui provident. Sint quos quos rem dolor.\",\"1983-06-24\",1,\"https:\\/\\/lorempixel.com\\/640\\/480\\/?96442\",\"https:\\/\\/lorempixel.com\\/640\\/480\\/?60850\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `posts` (`title`, `body`, `until`, `school_id`, `image`, `preview`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.36\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\PostSeeder.php\",\"line\":14,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(178, '8cc3df55-de0c-41c2-8738-7cec1874af61', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\Post:2\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(179, '8cc3df55-de51-4a10-aa9f-0daffa42b57b', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Prof.\",\"Quod et magni et at ut molestias sed. Recusandae perspiciatis quaerat sed. Mollitia in qui quasi id asperiores et.\",\"1994-05-22\",1,\"https:\\/\\/lorempixel.com\\/640\\/480\\/?64823\",\"https:\\/\\/lorempixel.com\\/640\\/480\\/?32825\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `posts` (`title`, `body`, `until`, `school_id`, `image`, `preview`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.33\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\PostSeeder.php\",\"line\":14,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(180, '8cc3df55-de65-4cf6-8d9f-bd86f2055c79', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\Post:3\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(181, '8cc3df55-dea9-4f48-8f24-edcf44dcd6cc', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Mrs.\",\"Autem reprehenderit dolor aut autem asperiores officiis deserunt. Sit tempore architecto quasi dolorem totam fuga. Necessitatibus aut molestias optio ut officiis odio eveniet.\",\"1973-03-12\",1,\"https:\\/\\/lorempixel.com\\/640\\/480\\/?30823\",\"https:\\/\\/lorempixel.com\\/640\\/480\\/?27096\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `posts` (`title`, `body`, `until`, `school_id`, `image`, `preview`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.33\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\PostSeeder.php\",\"line\":14,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(182, '8cc3df55-dec1-4b59-b924-4825adaa8cfb', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\Post:4\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(183, '8cc3df55-df05-427f-aa54-f7e1377394c0', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Ms.\",\"Et tempora temporibus aut velit ut deleniti. Possimus ut ut qui laudantium aliquid exercitationem aspernatur. Enim quod ratione est et aut officia.\",\"1972-12-10\",1,\"https:\\/\\/lorempixel.com\\/640\\/480\\/?71350\",\"https:\\/\\/lorempixel.com\\/640\\/480\\/?86135\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `posts` (`title`, `body`, `until`, `school_id`, `image`, `preview`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.33\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\PostSeeder.php\",\"line\":14,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(184, '8cc3df55-df1b-421d-a748-b8a8a2c673cc', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\Post:5\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(185, '8cc3df55-df5e-40eb-af18-1d7e2825b2ba', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Miss\",\"Id nemo distinctio eligendi. Quas modi et ut dolor aperiam. In itaque quia dolor autem est. Occaecati amet sint quas unde.\",\"2008-05-26\",1,\"https:\\/\\/lorempixel.com\\/640\\/480\\/?60324\",\"https:\\/\\/lorempixel.com\\/640\\/480\\/?38486\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `posts` (`title`, `body`, `until`, `school_id`, `image`, `preview`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.32\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\PostSeeder.php\",\"line\":14,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(186, '8cc3df55-df73-4992-af3f-a0a7a0b2b8d5', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\Post:6\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(187, '8cc3df55-dfb4-4788-b9c8-53fd23146433', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Mrs.\",\"Dolore consectetur ad et et quis. Ratione aliquid sunt reprehenderit est. Voluptatem qui maiores suscipit illum et maiores. Et consectetur suscipit qui perspiciatis quia similique.\",\"1980-09-19\",1,\"https:\\/\\/lorempixel.com\\/640\\/480\\/?28749\",\"https:\\/\\/lorempixel.com\\/640\\/480\\/?29849\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `posts` (`title`, `body`, `until`, `school_id`, `image`, `preview`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.29\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\PostSeeder.php\",\"line\":14,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(188, '8cc3df55-dfc8-4269-932a-b01e5ea890a2', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\Post:7\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(189, '8cc3df55-e00f-4827-869e-78936338db76', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Prof.\",\"Voluptas magni quas quos eum doloremque eligendi. Blanditiis consequatur a qui illo eligendi maxime. Laudantium repellat qui natus aut rerum. Odit explicabo quibusdam excepturi vero non saepe.\",\"2008-02-05\",1,\"https:\\/\\/lorempixel.com\\/640\\/480\\/?57793\",\"https:\\/\\/lorempixel.com\\/640\\/480\\/?42520\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `posts` (`title`, `body`, `until`, `school_id`, `image`, `preview`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.33\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\PostSeeder.php\",\"line\":14,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(190, '8cc3df55-e023-4955-9235-4932fdf3382b', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\Post:8\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(191, '8cc3df55-e065-42f6-ba30-c508bb4459ae', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Dr.\",\"Sunt libero molestiae at quis et unde. Tempora consectetur officiis est nihil dolore sint labore. Omnis ut fuga quas. Veniam non est quod architecto.\",\"1970-01-17\",1,\"https:\\/\\/lorempixel.com\\/640\\/480\\/?17135\",\"https:\\/\\/lorempixel.com\\/640\\/480\\/?13345\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `posts` (`title`, `body`, `until`, `school_id`, `image`, `preview`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.31\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\PostSeeder.php\",\"line\":14,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(192, '8cc3df55-e079-486c-b774-2a1a592d6407', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\Post:9\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(193, '8cc3df55-e0c2-41cd-a424-82d6f2f20356', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Ms.\",\"Voluptatum molestias qui est numquam nisi. Quod quibusdam iusto et dolorem sapiente. Aut et ipsam facere nemo.\",\"2004-01-11\",1,\"https:\\/\\/lorempixel.com\\/640\\/480\\/?88626\",\"https:\\/\\/lorempixel.com\\/640\\/480\\/?12968\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `posts` (`title`, `body`, `until`, `school_id`, `image`, `preview`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?, ?)\",\"time\":\"0.37\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\PostSeeder.php\",\"line\":14,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(194, '8cc3df55-e0d7-4570-a44a-bdb478ed5f09', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\Post:10\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(195, '8cc3df55-e1cf-4467-94f6-eb19d82e7a5d', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Dr. Kayley Schuppe V\",1,\"15:07:28\",\"22:05:40\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `electives` (`name`, `school_id`, `time_start`, `time_end`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?)\",\"time\":\"1.29\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\ElectivesSeeder.php\",\"line\":14,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(196, '8cc3df55-e1fb-4d58-895d-cabb4edfba89', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\Electivy:1\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(197, '8cc3df55-e24a-44e0-9f22-b26d7dc7290f', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Dr. Lucio Shields\",1,\"10:01:15\",\"17:29:58\",\"2019-01-17 12:42:14\",\"2019-01-17 12:42:14\"],\"sql\":\"insert into `electives` (`name`, `school_id`, `time_start`, `time_end`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?)\",\"time\":\"0.33\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\ElectivesSeeder.php\",\"line\":14,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(198, '8cc3df55-e25f-46e7-9576-ae8ba5818082', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\Electivy:2\",\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(199, '8cc3df55-e374-4f3d-8ca9-39aa1acae166', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"23:41:00\",\"Savanah Schiller\",1,\"08:45:59\",\"22:47:28\",\"Ms. Leonor Stamm II\",1,\"04:49:46\",\"13:20:31\",\"Wilhelm Bosco I\",1,\"10:19:28\",\"05:30:48\",\"Prof. Dortha Waters\",1,\"00:31:31\",\"04:35:29\",\"Lavern Grady\",2,\"19:57:54\",\"23:12:07\",\"Maurine Williamson I\",2,\"22:49:40\",\"12:46:22\",\"Mrs. Rubie Funk\",2,\"14:29:56\",\"09:05:21\",\"Oleta Connelly Jr.\",2,\"12:46:40\",\"17:15:24\",\"Laurel Legros II\",3,\"04:43:42\",\"04:44:02\",\"Mr. Harmon Sipes DDS\",3,\"09:35:17\",\"12:45:49\",\"Maegan Spinka Jr.\",3,\"16:41:17\",\"07:57:40\",\"Kathlyn Smith\",3,\"07:12:25\",\"22:34:16\",\"Mr. Kip Dicki\",4,\"14:29:14\",\"14:24:15\",\"Abigale Williamson\",4,\"21:52:47\",\"18:21:49\",\"Dr. Cyrus Leannon III\",4,\"06:58:39\",\"13:44:57\",\"Dorthy Stoltenberg\",4,\"11:18:06\",\"17:42:26\",\"Miss Maybelle O\'Connell\",5,\"00:22:33\",\"20:10:07\",\"Faye Hoppe\",5,\"19:59:08\",\"06:08:40\",\"Reinhold Osinski IV\",5,\"07:24:24\",\"01:05:37\",\"Dr. Alana Donnelly\",5,\"08:32:57\",\"19:05:55\",\"Shanel Barrows\",6,\"04:59:03\",\"17:57:01\",\"Reggie Jast\",6,\"16:54:07\",\"03:58:00\",\"Arlie Mueller\",7,\"20:50:02\"],\"sql\":\"insert into `classes` (`from`, `name`, `schedule_id`, `to`) values (?, ?, ?, ?), (?, ?, ?, ?), (?, ?, ?, ?), (?, ?, ?, ?), (?, ?, ?, ?), (?, ?, ?, ?), (?, ?, ?, ?), (?, ?, ?, ?), (?, ?, ?, ?), (?, ?, ?, ?), (?, ?, ?, ?), (?, ?, ?, ?), (?, ?, ?, ?), (?, ?, ?, ?), (?, ?, ?, ?), (?, ?, ?, ?), (?, ?, ?, ?), (?, ?, ?, ?), (?, ?, ?, ?), (?, ?, ?, ?), (?, ?, ?, ?), (?, ?, ?, ?), (?, ?, ?, ?)\",\"time\":\"1.26\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\ClassesSeeder.php\",\"line\":47,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(200, '8cc3df55-e425-4d8f-a27a-f2f112162d69', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Monday\",1,\"Tuesday\",1,\"Wednesday\",1,\"Thursday\",1,\"Friday\",1,\"Saturday\",1,\"Sunday\",1],\"sql\":\"insert into `schedules` (`day`, `school_id`) values (?, ?), (?, ?), (?, ?), (?, ?), (?, ?), (?, ?), (?, ?)\",\"time\":\"1.07\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\ScheduleSeeder.php\",\"line\":15,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(201, '8cc3df55-e51e-445a-8316-5c1af7c5eda3', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Deron Abbott\",1,\"dinner\",\"Miss Alena Huels\",1,\"afternoon-tea\",\"Jaquan Predovic\",1,\"dinner\",\"Ocie Schmeler\",1,\"afternoon-tea\",\"Mr. Jasmin Botsford I\",2,\"breakfast\",\"Sabrina Klocko\",2,\"dinner\",\"Verdie Eichmann V\",2,\"lunch\",\"Bill Ward\",2,\"breakfast\",\"Veda Ratke\",3,\"dinner\",\"Mr. Dedric Feest DVM\",3,\"afternoon-tea\",\"Dr. Alanna Nolan\",3,\"dinner\",\"Lavina Casper\",3,\"breakfast\",\"Mrs. Oceane Cassin\",4,\"breakfast\",\"Jett Nolan\",4,\"lunch\",\"Dr. Torey Marvin III\",4,\"lunch\",\"Wilburn Wisoky\",4,\"dinner\",\"Prof. Lenna Ledner\",5,\"breakfast\",\"Mrs. Yvonne Wilderman MD\",5,\"dinner\",\"Mireille Goyette\",5,\"breakfast\",\"Cristian Mueller\",5,\"dinner\",\"Armando Wuckert\",6,\"breakfast\",\"Vinnie Zemlak\",6,\"breakfast\",\"Edward Koch\",7,\"afternoon-tea\"],\"sql\":\"insert into `foods` (`name`, `nutrition_id`, `type`) values (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?)\",\"time\":\"1.24\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\FoodsSeeder.php\",\"line\":47,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14'),
(202, '8cc3df55-e641-4718-9721-cfe110e06d0b', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[\"Monday\",1,\"Tuesday\",1,\"Wednesday\",1,\"Thursday\",1,\"Friday\",1,\"Saturday\",1,\"Sunday\",1],\"sql\":\"insert into `nutritions` (`day`, `school_id`) values (?, ?), (?, ?), (?, ?), (?, ?), (?, ?), (?, ?), (?, ?)\",\"time\":\"2.29\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\database\\\\seeds\\\\NutritionSeeder.php\",\"line\":15,\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14');
INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(203, '8cc3df55-e67c-4b33-9a4a-27e6597da431', '8cc3df55-e695-4589-9aa0-3578d9c7e84a', NULL, 1, 'command', '{\"command\":\"migrate:refresh\",\"exit_code\":0,\"arguments\":{\"command\":\"migrate:refresh\"},\"options\":{\"database\":null,\"force\":false,\"path\":null,\"realpath\":false,\"seed\":true,\"seeder\":null,\"step\":null,\"help\":false,\"quiet\":false,\"verbose\":false,\"version\":false,\"ansi\":false,\"no-ansi\":false,\"no-interaction\":false,\"env\":null},\"hostname\":\"SpriteS\"}', '2019-01-17 12:42:14');

-- --------------------------------------------------------

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

INSERT INTO `telescope_entries_tags` (`entry_uuid`, `tag`) VALUES
('8cc3df55-cf0a-4af2-b2a6-6b79d51f314e', 'App\\User:2'),
('8cc3df55-cf6d-4cd9-81fd-7bfdcfc87ab9', 'App\\User:3'),
('8cc3df55-cfda-4662-afdd-7174d882a815', 'App\\User:4'),
('8cc3df55-d031-441e-84d8-4ac04e25b908', 'App\\User:5'),
('8cc3df55-d08d-4cec-ba85-a237b6e6d4e6', 'App\\User:6'),
('8cc3df55-d0e8-4c82-bf5a-8e41df009b3e', 'App\\User:7'),
('8cc3df55-d142-46c0-bb2a-1fd2cf88d5ab', 'App\\User:8'),
('8cc3df55-d19c-48e8-a5f6-11062dfbe63c', 'App\\User:9'),
('8cc3df55-d1f6-4d32-99c2-3aa6fd1ca704', 'App\\User:10'),
('8cc3df55-d24d-4da9-826e-06e7fba65d66', 'App\\User:11'),
('8cc3df55-d362-448a-a488-0fd801e877f6', 'App\\School:1'),
('8cc3df55-d3bb-4a8a-b6fa-40134cb22597', 'App\\School:2'),
('8cc3df55-d4b2-4c5b-acd7-ecc468cde44c', 'App\\Group:1'),
('8cc3df55-d504-4200-b7cb-d67a04285458', 'App\\Group:2'),
('8cc3df55-d620-4191-b9e4-b5479400dc33', 'App\\Student:1'),
('8cc3df55-d67b-46b9-96e5-f8bd2a8bc89e', 'App\\Student:2'),
('8cc3df55-d6cd-4059-9eac-d2b418ab21af', 'App\\Student:3'),
('8cc3df55-d720-48a6-a85e-245fe71475d3', 'App\\Student:4'),
('8cc3df55-d771-4e5e-99c8-f0c2e06f118e', 'App\\Student:5'),
('8cc3df55-d7c0-4d63-8618-7cc23b165525', 'App\\Student:6'),
('8cc3df55-d813-47e7-9874-431c7b505f77', 'App\\Student:7'),
('8cc3df55-d872-4f8f-996b-d22e94a5398e', 'App\\Student:8'),
('8cc3df55-d8c1-42f9-ae79-12ee41ce54f6', 'App\\Student:9'),
('8cc3df55-d910-4e01-a2f2-f56fdf8f3b08', 'App\\Student:10'),
('8cc3df55-d960-47d0-a065-f043b96953e8', 'App\\Student:11'),
('8cc3df55-d9b3-4fbd-8154-8b32e8773ab8', 'App\\Student:12'),
('8cc3df55-da00-4847-a2aa-1f58523ed0dd', 'App\\Student:13'),
('8cc3df55-da4e-4117-aa32-7f5f771b388d', 'App\\Student:14'),
('8cc3df55-daa2-4002-aa51-dab385f6a44c', 'App\\Student:15'),
('8cc3df55-daf4-41ca-a0e4-40397b317544', 'App\\Student:16'),
('8cc3df55-db46-42fc-bb0a-e9681639d023', 'App\\Student:17'),
('8cc3df55-db99-4fd6-8dac-021bd81bd5af', 'App\\Student:18'),
('8cc3df55-dbe7-4131-a248-d8d61f9a41d5', 'App\\Student:19'),
('8cc3df55-dc39-4694-8016-43fcf4d46b69', 'App\\Student:20'),
('8cc3df55-dda5-4c56-b0f9-560b8b9520f8', 'App\\Post:1'),
('8cc3df55-de0c-41c2-8738-7cec1874af61', 'App\\Post:2'),
('8cc3df55-de65-4cf6-8d9f-bd86f2055c79', 'App\\Post:3'),
('8cc3df55-dec1-4b59-b924-4825adaa8cfb', 'App\\Post:4'),
('8cc3df55-df1b-421d-a748-b8a8a2c673cc', 'App\\Post:5'),
('8cc3df55-df73-4992-af3f-a0a7a0b2b8d5', 'App\\Post:6'),
('8cc3df55-dfc8-4269-932a-b01e5ea890a2', 'App\\Post:7'),
('8cc3df55-e023-4955-9235-4932fdf3382b', 'App\\Post:8'),
('8cc3df55-e079-486c-b774-2a1a592d6407', 'App\\Post:9'),
('8cc3df55-e0d7-4570-a44a-bdb478ed5f09', 'App\\Post:10'),
('8cc3df55-e1fb-4d58-895d-cabb4edfba89', 'App\\Electivy:1'),
('8cc3df55-e25f-46e7-9576-ae8ba5818082', 'App\\Electivy:2');

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
(1, 'Станислав', 'Ms. Alysa Walsh', '446.551.5872 x97820', 'father', '9035 Daphnee Corner Suite 267\nSouth Melvina, IN 48418-4933', '1980-09-12', NULL, 1, 1, 'active', 'admin@admin.com', '2019-01-17 10:42:14', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'AO5UH', 'disabled', NULL, 'admin', 'aFnhbzbT49', NULL, NULL),
(2, 'Prof. Drew Swift', 'Prince Crona', '(369) 512-0182', 'father', '43489 Upton Overpass Apt. 272\nCronabury, CA 65466', '2005-01-17', NULL, 1, 1, 'active', 'tlehner@example.org', '2019-01-17 10:42:14', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'QpC6g', 'disabled', NULL, 'default', 'Emi8nWUFGW', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(3, 'Adrianna Fadel', 'Laverne Kessler', '341-716-9085', 'mother', '16072 Lorenz Ridge\nHaagtown, MN 29712-9382', '1999-10-08', NULL, 1, 1, 'active', 'stephon.parker@example.com', '2019-01-17 10:42:14', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', '8I3YI', 'enabled', NULL, 'default', '2KJOIspeKp', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(4, 'Dr. Osborne Monahan', 'Trace Halvorson', '870.859.0361 x655', 'mother', '705 Leora Stream\nEast Araceli, NH 15437-7560', '2005-10-03', NULL, 1, 1, 'active', 'carolyn.pfeffer@example.com', '2019-01-17 10:42:14', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', '5Rfej', 'enabled', NULL, 'default', '74iEnYUFo1', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(5, 'Derek Muller', 'Mr. Stewart O\'Keefe', '523-655-4278 x172', 'father', '34088 Margie Fork Apt. 439\nSouth Alvinaborough, DC 48732', '1971-08-07', NULL, 1, 1, 'active', 'gvolkman@example.org', '2019-01-17 10:42:14', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'wvmG5', 'enabled', NULL, 'default', 'neMgfLCpv0', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(6, 'Jaycee Lakin', 'Graham Eichmann', '+1 (436) 915-8339', 'father', '15631 Green Mission\nErlingbury, SD 00513', '1970-01-08', NULL, 1, 1, 'active', 'trantow.devan@example.com', '2019-01-17 10:42:14', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'pq3NC', 'enabled', NULL, 'default', '5VLObCLohl', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(7, 'Mariela Green', 'Mrs. Mariah Funk', '293-625-0939 x0870', 'father', '2341 Tromp Parkways Suite 094\nCarmelahaven, ID 26880-1683', '2013-02-28', NULL, 1, 1, 'active', 'johns.melany@example.org', '2019-01-17 10:42:14', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'fgvll', 'disabled', NULL, 'default', 'mEC3jX8ZVb', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(8, 'Concepcion Paucek IV', 'Pascale Boyle', '(778) 833-1977 x960', 'father', '511 Greenholt Pike\nRalphburgh, OK 92790-0409', '1974-05-05', NULL, 1, 1, 'active', 'ezra79@example.org', '2019-01-17 10:42:14', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'UJiKj', 'disabled', NULL, 'default', 'G30Ghz3QD7', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(9, 'Dr. Alice Schmidt', 'Hayden Auer', '469.681.7781', 'father', '6238 Murphy Meadows Apt. 123\nPort Liana, MN 72903', '2001-03-27', NULL, 1, 1, 'active', 'shanie92@example.com', '2019-01-17 10:42:14', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'ORE8n', 'disabled', NULL, 'default', '9TXG9vZMMp', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(10, 'Mr. Arch Reichel', 'Mr. Jaylan Kautzer', '1-251-509-5362', 'mother', '90019 Retta Park\nTiaraberg, MA 79033', '2006-01-19', NULL, 1, 1, 'active', 'ethel75@example.net', '2019-01-17 10:42:14', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'neTBe', 'disabled', NULL, 'default', 'nO3dAK1Mtj', '2019-01-17 10:42:14', '2019-01-17 10:42:14'),
(11, 'Prof. Angel Mante', 'Laverna Becker', '(820) 927-9132', 'father', '3017 Kiana Row Apt. 109\nVincenzofurt, KY 74748-8713', '1996-12-23', NULL, 1, 1, 'active', 'adicki@example.com', '2019-01-17 10:42:14', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'ymoh9', 'enabled', NULL, 'default', 'CxlivJ3pj3', '2019-01-17 10:42:14', '2019-01-17 10:42:14');

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
-- Индексы таблицы `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`id`);

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
-- Индексы таблицы `nutritions`
--
ALTER TABLE `nutritions`
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
-- AUTO_INCREMENT для таблицы `foods`
--
ALTER TABLE `foods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT для таблицы `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `group_school`
--
ALTER TABLE `group_school`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

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
-- AUTO_INCREMENT для таблицы `nutritions`
--
ALTER TABLE `nutritions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `sequence` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

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
