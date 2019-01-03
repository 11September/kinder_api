-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 03 2019 г., 18:35
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
(1, 1, 'Prof. Elisa DuBuque IV', '00:01:34', '17:52:47', NULL, NULL),
(2, 1, 'Ubaldo Schinner', '01:18:50', '10:52:45', NULL, NULL),
(3, 1, 'Kavon Stanton', '18:04:04', '19:35:36', NULL, NULL),
(4, 1, 'Bonita O\'Keefe', '22:42:01', '19:07:28', NULL, NULL),
(5, 2, 'Osborne Reichel', '01:02:47', '20:36:53', NULL, NULL),
(6, 2, 'Ms. Hettie Turcotte', '14:58:58', '11:07:22', NULL, NULL),
(7, 2, 'Karelle Kertzmann V', '22:45:50', '02:54:43', NULL, NULL),
(8, 2, 'Dr. Noelia Hodkiewicz II', '17:46:50', '02:46:32', NULL, NULL),
(9, 3, 'Dr. Flo Koss', '07:39:53', '19:00:57', NULL, NULL),
(10, 3, 'Casper Collier', '11:19:24', '01:37:00', NULL, NULL),
(11, 3, 'Roberta Renner', '14:15:14', '11:54:18', NULL, NULL),
(12, 3, 'Aliya Hayes PhD', '06:13:52', '22:05:13', NULL, NULL),
(13, 4, 'Dorothea Gutkowski', '23:49:45', '18:26:02', NULL, NULL),
(14, 4, 'Myrtle Keeling PhD', '07:11:42', '20:25:10', NULL, NULL),
(15, 4, 'Anjali Becker', '04:54:03', '19:42:05', NULL, NULL),
(16, 4, 'Mr. Angus Ortiz', '08:24:48', '02:28:19', NULL, NULL),
(17, 5, 'Micah Beer', '14:25:47', '19:13:36', NULL, NULL),
(18, 5, 'Kyra Fadel DVM', '21:45:36', '22:13:17', NULL, NULL),
(19, 5, 'Kailyn Hills', '19:28:36', '16:23:22', NULL, NULL),
(20, 5, 'Lawson Rosenbaum', '14:31:37', '04:11:58', NULL, NULL),
(21, 6, 'Ignatius Murray V', '16:25:12', '11:13:46', NULL, NULL),
(22, 6, 'Wilhelm Upton IV', '21:58:19', '18:51:42', NULL, NULL),
(23, 7, 'Mrs. Fabiola Brekke II', '19:14:34', '22:31:37', NULL, NULL);

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
(1, 'Giovanni Padberg', 1, '15:59:22', '01:16:42', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(2, 'Myrtis Klein', 1, '06:36:29', '09:53:50', '2019-01-03 10:03:50', '2019-01-03 10:03:50');

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
(1, 1, 'https://lorempixel.com/640/480/?80699', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(2, 1, 'https://lorempixel.com/640/480/?83763', '2019-01-03 10:03:50', '2019-01-03 10:03:50');

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
(1, 'Ubaldo Terry V', 1, 1, '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(2, 'Prof. Bria Wilderman MD', 1, 1, '2019-01-03 10:03:50', '2019-01-03 10:03:50');

-- --------------------------------------------------------

--
-- Структура таблицы `lecturers`
--

CREATE TABLE `lecturers` (
  `id` int(10) UNSIGNED NOT NULL,
  `FIO` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(52, '2018_11_27_141826_create_lecturers_table', 1),
(269, '2014_10_12_000000_create_users_table', 2),
(270, '2014_10_12_100000_create_password_resets_table', 2),
(271, '2016_01_01_000000_create_posts_table', 2),
(272, '2018_08_08_100000_create_telescope_entries_table', 2),
(273, '2018_11_27_135607_create_schools_table', 2),
(274, '2018_11_27_140055_create_groups_table', 2),
(275, '2018_11_27_140409_create_schedules_table', 2),
(276, '2018_11_27_144421_create_students_table', 2),
(277, '2018_11_28_124724_create_videos_table', 2),
(278, '2018_11_30_151109_create_electives_table', 2),
(279, '2018_11_30_151526_create_electivy_photos_table', 2),
(280, '2018_12_29_133217_create_notifications_table', 2),
(281, '2019_01_02_103941_create_elective_groups_table', 2),
(282, '2019_01_02_124851_create_post_groups_table', 2),
(283, '2019_01_02_133703_create_schools_groups_table', 2),
(284, '2019_01_03_092037_create_classes_table', 2);

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
(1, 'Mr.', 'Facilis atque dolor commodi quo fugiat ex dolore eos. Mollitia dolores qui commodi dolor voluptas. Adipisci eum fuga quos magni. Voluptatem ea qui autem.', '1991-09-27', 1, 'https://lorempixel.com/640/480/?54591', 'https://lorempixel.com/640/480/?96431', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(2, 'Dr.', 'Eaque asperiores sed nisi a qui numquam enim. Quidem nobis at mollitia ipsum neque in. Voluptas dolorem quidem eius saepe enim optio illo. Eum ut reiciendis iste quia ut quidem dignissimos.', '2017-11-02', 1, 'https://lorempixel.com/640/480/?56117', 'https://lorempixel.com/640/480/?56454', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(3, 'Dr.', 'Est non laboriosam dicta commodi. Architecto qui aspernatur odit similique aut. Aspernatur voluptas veritatis qui suscipit hic. Vitae voluptate natus sint voluptatibus sit similique.', '1999-05-03', 1, 'https://lorempixel.com/640/480/?56614', 'https://lorempixel.com/640/480/?33953', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(4, 'Prof.', 'Facere eius ut possimus natus. Assumenda autem voluptatem et ipsum iure dignissimos. Fugiat et soluta odio totam.', '1970-11-17', 1, 'https://lorempixel.com/640/480/?88002', 'https://lorempixel.com/640/480/?33772', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(5, 'Prof.', 'Vero labore vitae voluptatem et reprehenderit. Quam voluptatem atque dolores ipsam odit. Distinctio rem accusantium libero rem dicta quas qui sunt.', '1993-05-26', 1, 'https://lorempixel.com/640/480/?33576', 'https://lorempixel.com/640/480/?85663', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(6, 'Dr.', 'Eos illo sed nulla qui cupiditate et cupiditate. Fuga sit quo est animi et inventore dolores.', '1983-02-05', 1, 'https://lorempixel.com/640/480/?10006', 'https://lorempixel.com/640/480/?53718', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(7, 'Mr.', 'Ab sit sequi aspernatur vel aut. Ut optio enim non placeat cum aut. Quo error vel eveniet. Exercitationem enim magnam ut vitae aperiam aut.', '1998-04-29', 1, 'https://lorempixel.com/640/480/?73264', 'https://lorempixel.com/640/480/?77465', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(8, 'Dr.', 'Voluptatum reprehenderit dolores quaerat in assumenda. Qui quo explicabo quasi distinctio. Occaecati assumenda delectus neque voluptate. Praesentium dolore dicta pariatur neque.', '2008-08-22', 1, 'https://lorempixel.com/640/480/?17560', 'https://lorempixel.com/640/480/?24701', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(9, 'Dr.', 'Quia occaecati eveniet voluptatem. Qui inventore optio autem qui et laudantium a. In accusantium voluptas non saepe quas repellendus. Fugiat officiis vel voluptate totam error maiores.', '1971-01-08', 1, 'https://lorempixel.com/640/480/?94762', 'https://lorempixel.com/640/480/?21227', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(10, 'Dr.', 'Nihil mollitia possimus animi magnam. Quia tenetur est cum qui voluptas fugit sunt enim. Repellat minus beatae id et vitae consequuntur. Facilis sint iusto commodi non nemo.', '1993-02-24', 1, 'https://lorempixel.com/640/480/?71005', 'https://lorempixel.com/640/480/?37887', '2019-01-03 10:03:50', '2019-01-03 10:03:50');

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
(1, 'Dr. Benedict Feil V', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(2, 'Prof. Ahmed White MD', '2019-01-03 10:03:50', '2019-01-03 10:03:50');

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
(1, 'Mr.', 1, 1, '2010-11-20', 'INACTIVE', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(2, 'Prof.', 1, 1, '1975-12-01', 'ACTIVE', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(3, 'Mr.', 1, 1, '2006-02-11', 'INACTIVE', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(4, 'Dr.', 1, 1, '1991-10-07', 'ACTIVE', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(5, 'Prof.', 1, 1, '1978-12-11', 'INACTIVE', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(6, 'Miss', 1, 1, '1979-06-09', 'INACTIVE', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(7, 'Mr.', 1, 1, '2011-09-21', 'INACTIVE', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(8, 'Ms.', 1, 1, '2004-12-03', 'INACTIVE', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(9, 'Ms.', 1, 1, '1996-11-23', 'ACTIVE', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(10, 'Dr.', 1, 1, '1983-05-21', 'ACTIVE', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(11, 'Miss', 1, 1, '1979-02-04', 'INACTIVE', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(12, 'Prof.', 1, 1, '1976-08-06', 'ACTIVE', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(13, 'Prof.', 1, 1, '1978-04-30', 'ACTIVE', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(14, 'Mr.', 1, 1, '2016-11-20', 'ACTIVE', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(15, 'Dr.', 1, 1, '1973-06-09', 'ACTIVE', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(16, 'Mr.', 1, 1, '2006-10-12', 'ACTIVE', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(17, 'Mr.', 1, 1, '1978-10-07', 'ACTIVE', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(18, 'Dr.', 1, 1, '1985-01-03', 'INACTIVE', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(19, 'Prof.', 1, 1, '2006-01-05', 'ACTIVE', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(20, 'Dr.', 1, 1, '2012-03-28', 'ACTIVE', '2019-01-03 10:03:50', '2019-01-03 10:03:50');

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

--
-- Дамп данных таблицы `telescope_entries_tags`
--

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
(1, 'Станислав', 'Florence Boehm', '(454) 600-3672 x979', 'mother', '756 Haag Park Suite 525\nKatelinland, AK 35195-7050', '2002-08-07', 1, 1, 'active', 'admin@admin.com', '2019-01-03 10:03:50', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'H8Rn0', 'enabled', 'admin', 'rZ1fAhSxCZ', NULL, NULL),
(2, 'Alexandre Daniel II', 'Leonora Toy', '(608) 713-3925 x28009', 'mother', '38354 Walter Brook\nSouth Esperanza, NE 19663-1146', '1997-07-03', 1, 1, 'active', 'jayden.weimann@example.org', '2019-01-03 10:03:50', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'mfTnp', 'disabled', 'default', 'xqj5OGaySV', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(3, 'Melisa Roob', 'Prof. Eino Fay', '510-964-9695', 'mother', '2965 Rodriguez Port\nWest Krystelside, MD 42840-7972', '1985-09-03', 1, 1, 'active', 'jay74@example.org', '2019-01-03 10:03:50', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'OeHgN', 'enabled', 'default', '5I2etie3Io', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(4, 'Erwin Sporer', 'Dr. Andrew Krajcik', '760.227.6138 x88679', 'father', '4323 Raynor Trail\nBlockmouth, TN 62912-7765', '1971-04-06', 1, 1, 'active', 'lavina30@example.com', '2019-01-03 10:03:50', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'Pp8hd', 'enabled', 'default', 'CLVvWsc98N', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(5, 'Prof. Retta Crooks', 'Laurine Buckridge IV', '1-342-722-4399 x015', 'father', '790 Fay Brooks Apt. 099\nNorth Geo, PA 30520-3940', '1992-06-08', 1, 1, 'active', 'kira32@example.org', '2019-01-03 10:03:50', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'EgQQk', 'enabled', 'default', 'LNMHDNqTfH', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(6, 'Mr. Edd Christiansen', 'Cassie Lubowitz', '816-573-9905', 'father', '6022 Langosh Curve Suite 477\nSpencershire, HI 74692', '1975-08-01', 1, 1, 'active', 'rebeca.fay@example.com', '2019-01-03 10:03:50', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'bC6Yn', 'disabled', 'default', 'kwvLmB01Gc', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(7, 'Prof. Cathrine Gerlach DVM', 'Kelly Murazik', '(879) 271-1103 x23706', 'mother', '576 Konopelski Terrace Apt. 237\nLake Stella, AL 24465-6533', '2001-11-09', 1, 1, 'active', 'ulises84@example.com', '2019-01-03 10:03:50', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'BcCKk', 'disabled', 'default', 'onDzSmopuf', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(8, 'Miss Mina Schinner', 'Yesenia Sanford', '(745) 340-2275', 'father', '88409 Naomie Lane Suite 251\nRoybury, ID 32688-6430', '1998-11-12', 1, 1, 'active', 'darlene24@example.org', '2019-01-03 10:03:50', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'C4YF2', 'disabled', 'default', 'US2aUOWDpT', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(9, 'Lenore Murphy', 'Carolanne Shanahan', '751-924-8810 x2511', 'mother', '2201 Mertz Lake Suite 287\nLake Mortimer, AZ 88159', '2008-08-10', 1, 1, 'active', 'jakubowski.glenda@example.net', '2019-01-03 10:03:50', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'wxPOj', 'disabled', 'default', 'p6gJ8UkeIU', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(10, 'Camden Lemke', 'Jude Mueller', '783-869-9121', 'mother', '93767 Conroy Canyon\nWest Hudson, PA 49319', '2011-04-20', 1, 1, 'active', 'eusebio29@example.org', '2019-01-03 10:03:50', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', '74Gom', 'enabled', 'default', 'WRPBSkkFic', '2019-01-03 10:03:50', '2019-01-03 10:03:50'),
(11, 'Marcelle Herman V', 'Sigurd Connelly', '+1-991-903-4275', 'father', '33267 Klocko Cliff Apt. 226\nLake Zackland, ME 82654', '1971-06-17', 1, 1, 'active', 'michale.robel@example.org', '2019-01-03 10:03:50', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'Uo1Rt', 'disabled', 'default', 'QAjwYJqabQ', '2019-01-03 10:03:50', '2019-01-03 10:03:50');

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
-- Индексы таблицы `lecturers`
--
ALTER TABLE `lecturers`
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
-- AUTO_INCREMENT для таблицы `lecturers`
--
ALTER TABLE `lecturers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=285;

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
  MODIFY `sequence` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1231;

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
