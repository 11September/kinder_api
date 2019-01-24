-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 24 2019 г., 12:42
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
  `schedule_id` int(10) UNSIGNED NOT NULL,
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
(1, 1, 'Justina Von', '20:12:11', '02:55:09', NULL, NULL),
(2, 1, 'Tanner Baumbach DVM', '15:18:01', '09:37:30', NULL, NULL),
(3, 1, 'Cleve Moore DVM', '23:19:59', '12:53:54', NULL, NULL),
(4, 1, 'Lucio Gleichner', '20:10:07', '05:36:42', NULL, NULL),
(5, 2, 'Mia Denesik', '17:25:45', '22:23:36', NULL, NULL),
(6, 2, 'Miss Naomi Stracke', '11:16:46', '12:43:21', NULL, NULL),
(7, 2, 'Ezra Klocko', '01:28:46', '06:41:41', NULL, NULL),
(8, 2, 'Marilie Bruen', '10:08:34', '12:01:34', NULL, NULL),
(9, 3, 'Cruz Ferry', '14:50:20', '12:34:45', NULL, NULL),
(10, 3, 'Vance Greenfelder', '08:07:35', '22:59:52', NULL, NULL),
(11, 3, 'Avery Stoltenberg II', '12:09:02', '05:01:54', NULL, NULL),
(12, 3, 'Jerrold Skiles', '02:07:55', '04:36:41', NULL, NULL),
(13, 4, 'Royce Russel', '11:16:44', '03:12:11', NULL, NULL),
(14, 4, 'Miss Valentine Tromp', '11:24:16', '03:17:38', NULL, NULL),
(15, 4, 'Dr. Pietro Mann Sr.', '04:53:35', '11:01:39', NULL, NULL),
(16, 4, 'Trudie Torphy', '15:14:50', '00:51:51', NULL, NULL),
(17, 5, 'Miss Bailee Heller', '08:34:42', '06:57:06', NULL, NULL),
(18, 5, 'Garrison Predovic', '22:09:26', '17:06:21', NULL, NULL),
(19, 5, 'Adriana Mueller V', '18:28:24', '16:30:32', NULL, NULL),
(20, 5, 'Dr. Germaine Ward PhD', '17:55:01', '04:08:19', NULL, NULL),
(21, 6, 'Nicolas Reynolds', '10:33:20', '13:50:37', NULL, NULL),
(22, 6, 'Dr. Gaston Zulauf I', '03:14:32', '09:14:06', NULL, NULL),
(23, 7, 'Dr. Cheyenne Armstrong MD', '01:16:29', '05:42:03', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `conversations`
--

CREATE TABLE `conversations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user1_id` int(10) UNSIGNED NOT NULL,
  `user2_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `conversations`
--

INSERT INTO `conversations` (`id`, `user1_id`, `user2_id`, `created_at`, `updated_at`) VALUES
(14, 1, 2, '2019-01-24 07:15:55', '2019-01-24 07:15:55'),
(15, 1, 3, '2019-01-24 08:23:44', '2019-01-24 08:23:44'),
(16, 1, 4, '2019-01-24 08:25:15', '2019-01-24 08:25:15');

-- --------------------------------------------------------

--
-- Структура таблицы `foods`
--

CREATE TABLE `foods` (
  `id` int(10) UNSIGNED NOT NULL,
  `nutrition_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('breakfast','lunch','afternoon-tea','dinner') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `foods`
--

INSERT INTO `foods` (`id`, `nutrition_id`, `name`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 'Felix Ebert', 'lunch', NULL, NULL),
(2, 1, 'Mrs. Sarai Veum', 'lunch', NULL, NULL),
(3, 1, 'Keyon Schmidt', 'afternoon-tea', NULL, NULL),
(4, 1, 'Mose Bashirian DDS', 'lunch', NULL, NULL),
(5, 2, 'Mrs. Eileen Trantow', 'afternoon-tea', NULL, NULL),
(6, 2, 'Madisen Fadel', 'lunch', NULL, NULL),
(7, 2, 'Chester Waelchi', 'afternoon-tea', NULL, NULL),
(8, 2, 'Felipe Sporer', 'dinner', NULL, NULL),
(9, 3, 'Alf Corkery', 'lunch', NULL, NULL),
(10, 3, 'Keanu Russel II', 'breakfast', NULL, NULL),
(11, 3, 'Prof. Laurine Paucek II', 'afternoon-tea', NULL, NULL),
(12, 3, 'Lyda Spinka', 'breakfast', NULL, NULL),
(13, 4, 'Grayce Mohr Jr.', 'breakfast', NULL, NULL),
(14, 4, 'Newton Fay', 'breakfast', NULL, NULL),
(15, 4, 'Diego Pollich', 'dinner', NULL, NULL),
(16, 4, 'Junius Roob', 'breakfast', NULL, NULL),
(17, 5, 'Mr. Travis Sauer DDS', 'breakfast', NULL, NULL),
(18, 5, 'Danyka Torp', 'breakfast', NULL, NULL),
(19, 5, 'Xavier Parisian II', 'lunch', NULL, NULL),
(20, 5, 'Kory Lockman', 'lunch', NULL, NULL),
(21, 6, 'Roberta Quitzon', 'afternoon-tea', NULL, NULL),
(22, 6, 'Prof. Santina Kautzer', 'lunch', NULL, NULL),
(23, 7, 'Dr. Alphonso Krajcik II', 'afternoon-tea', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `groups`
--

CREATE TABLE `groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `moderator_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `groups`
--

INSERT INTO `groups` (`id`, `name`, `user_id`, `moderator_id`, `created_at`, `updated_at`) VALUES
(1, 'Jaunita Lueilwitz', 1, 1, '2019-01-23 14:48:17', '2019-01-23 14:48:17'),
(2, 'Miss Carrie Schamberger MD', 1, 1, '2019-01-23 14:48:17', '2019-01-23 14:48:17');

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
(1, 1, 1, '2019-01-23 14:48:29', '2019-01-23 14:48:29'),
(2, 2, 2, '2019-01-23 14:48:32', '2019-01-23 14:48:32');

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `conversation_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('read','unread') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `messages`
--

INSERT INTO `messages` (`id`, `conversation_id`, `user_id`, `message`, `status`, `created_at`, `updated_at`) VALUES
(19, 14, 1, 'dsa', 'unread', '2019-01-24 07:15:59', '2019-01-24 07:15:59'),
(20, 14, 1, 'Привет', 'unread', '2019-01-24 07:16:09', '2019-01-24 07:16:09'),
(21, 14, 2, 'Ну привет', 'unread', NULL, NULL),
(22, 14, 1, 'Даров', 'unread', '2019-01-24 07:18:48', '2019-01-24 07:18:48'),
(23, 14, 1, 'Ну привет', 'unread', '2019-01-24 08:25:08', '2019-01-24 08:25:08');

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
(8, '2018_12_29_133217_create_notifications_table', 1),
(9, '2019_01_02_124851_create_post_groups_table', 1),
(10, '2019_01_02_133703_create_schools_groups_table', 1),
(11, '2019_01_03_092037_create_classes_table', 1),
(12, '2019_01_14_072321_create_notification_groups_table', 1),
(13, '2019_01_14_085906_create_notification_schools_table', 1),
(14, '2019_01_16_124620_create_nutritions_table', 1),
(15, '2019_01_16_124705_create_foods_table', 1),
(16, '2019_01_23_142400_create_conversations_table', 1),
(17, '2019_01_25_092738_create_messages_table', 1);

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
(1, 'Mrs.', 'Voluptatum dicta porro vel quia non laboriosam. A numquam eos quidem et placeat asperiores. Odit voluptatem culpa soluta quis sed.', '2009-06-14', 1, 'https://lorempixel.com/640/480/?77880', 'https://lorempixel.com/640/480/?26280', '2019-01-23 14:48:17', '2019-01-23 14:48:17'),
(2, 'Mr.', 'Cupiditate itaque eum quo id blanditiis est voluptatem voluptatem. Porro dignissimos iure temporibus deserunt sunt. Et nisi voluptatibus dolores et incidunt distinctio enim.', '1991-03-29', 1, 'https://lorempixel.com/640/480/?26673', 'https://lorempixel.com/640/480/?21782', '2019-01-23 14:48:17', '2019-01-23 14:48:17'),
(3, 'Dr.', 'Est dolor nihil id a illum. Maxime et aut laborum qui. Dolorem sed eos ut in quia sequi ex. Quod voluptas voluptatem est rerum iure quia.', '1980-07-19', 1, 'https://lorempixel.com/640/480/?79749', 'https://lorempixel.com/640/480/?48138', '2019-01-23 14:48:17', '2019-01-23 14:48:17'),
(4, 'Prof.', 'Enim rerum qui voluptatem ipsa quae. Accusamus ad deserunt saepe odit necessitatibus sit.', '1993-12-28', 1, 'https://lorempixel.com/640/480/?99552', 'https://lorempixel.com/640/480/?74347', '2019-01-23 14:48:17', '2019-01-23 14:48:17'),
(5, 'Prof.', 'Vitae ut et eum. Iusto quam mollitia corrupti rem et dignissimos dolores quam. Quos quia incidunt provident accusamus tempore.', '1993-05-16', 1, 'https://lorempixel.com/640/480/?68617', 'https://lorempixel.com/640/480/?13714', '2019-01-23 14:48:17', '2019-01-23 14:48:17'),
(6, 'Ms.', 'Eaque qui officia magnam et soluta. Commodi repudiandae fugiat officia nemo. Occaecati quas deserunt natus enim laboriosam dignissimos.', '1982-12-18', 1, 'https://lorempixel.com/640/480/?67700', 'https://lorempixel.com/640/480/?44998', '2019-01-23 14:48:17', '2019-01-23 14:48:17'),
(7, 'Miss', 'Assumenda aut quisquam voluptas quia assumenda omnis nobis. Recusandae voluptatem est ullam expedita. Accusamus quo dolores ipsum.', '1982-09-07', 1, 'https://lorempixel.com/640/480/?29030', 'https://lorempixel.com/640/480/?31847', '2019-01-23 14:48:17', '2019-01-23 14:48:17'),
(8, 'Prof.', 'Officia est dolorem quia. Beatae tenetur illum reiciendis amet corrupti harum. A cumque dolor nihil odit dolor ipsa fugit inventore. Eaque nemo hic accusantium voluptas aut enim iste.', '1988-06-05', 1, 'https://lorempixel.com/640/480/?76403', 'https://lorempixel.com/640/480/?41593', '2019-01-23 14:48:17', '2019-01-23 14:48:17'),
(9, 'Mrs.', 'Omnis nemo molestiae aut maxime est beatae unde. Consequatur facilis ipsa id sed facere culpa. Est sequi vero cupiditate accusamus nemo inventore eos architecto.', '1990-07-07', 1, 'https://lorempixel.com/640/480/?12969', 'https://lorempixel.com/640/480/?25657', '2019-01-23 14:48:17', '2019-01-23 14:48:17'),
(10, 'Mr.', 'Molestiae sed voluptate quam consequuntur excepturi velit amet. Enim voluptas ad sunt laborum laudantium quas ipsum. Voluptatem maiores nesciunt delectus ut.', '2003-02-07', 1, 'https://lorempixel.com/640/480/?91477', 'https://lorempixel.com/640/480/?83594', '2019-01-23 14:48:17', '2019-01-23 14:48:17');

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
(1, 'Janae Weissnat', '2019-01-23 14:48:17', '2019-01-23 14:48:17'),
(2, 'Prof. Leon Christiansen V', '2019-01-23 14:48:17', '2019-01-23 14:48:17');

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
(1, 'Станислав', 'Dr. Katelin Jaskolski I', '262-429-6973 x20605', 'father', '7091 Mitchell Prairie\nNorth Brody, NC 58093', '2009-12-30', NULL, 1, 1, 'active', 'admin@admin.com', '2019-01-23 14:48:17', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'cW5Wb', 'enabled', NULL, 'admin', 'c8HCQmYvvq', NULL, NULL),
(2, 'Prof. Sid Mosciski', 'Loma Muller', '+1-838-239-5162', 'father', '1288 Shanahan Village Apt. 473\nWest Dashawnborough, SC 97149-3877', '2005-09-15', NULL, 1, 1, 'active', 'cooper48@example.com', '2019-01-23 14:48:17', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'IDJQl', 'enabled', NULL, 'default', 'Nx7ICos0bd', '2019-01-23 14:48:17', '2019-01-23 14:48:17'),
(3, 'Sunny Von', 'Dora Grady', '+1-265-320-2490', 'father', '11918 Pauline Mill Suite 106\nMurphybury, MO 19591', '2010-08-25', NULL, 1, 1, 'active', 'amelie16@example.net', '2019-01-23 14:48:17', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'ZNLCd', 'disabled', NULL, 'default', 'Maf5I5IDvt', '2019-01-23 14:48:17', '2019-01-23 14:48:17'),
(4, 'Felicita Wuckert', 'Cyrus Kuhlman', '(879) 661-0168', 'mother', '7017 Scarlett Court Suite 414\nLake Jazmyne, NC 98855', '1982-03-01', NULL, 1, 1, 'active', 'audra43@example.net', '2019-01-23 14:48:17', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'XBWGO', 'enabled', NULL, 'default', 'qDZrxNMkgJ', '2019-01-23 14:48:17', '2019-01-23 14:48:17'),
(5, 'Prof. Aniyah Jacobson DVM', 'Miss Rachelle Heaney Sr.', '(557) 583-3407 x15694', 'mother', '982 Brady Mountains\nVerniceland, TN 65041-4127', '1976-03-30', NULL, 1, 1, 'active', 'giovanni.considine@example.net', '2019-01-23 14:48:17', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', '0sA0T', 'enabled', NULL, 'default', 'RlF5AK8vde', '2019-01-23 14:48:17', '2019-01-23 14:48:17'),
(6, 'Marietta Kessler', 'Serena Rowe', '1-941-387-6910 x6274', 'mother', '7200 Richard Rue\nBreitenbergbury, AL 81855-3013', '2012-07-26', NULL, 1, 1, 'active', 'jaqueline.kunde@example.com', '2019-01-23 14:48:17', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'F3jJC', 'disabled', NULL, 'default', 'nMMBkl3NxQ', '2019-01-23 14:48:17', '2019-01-23 14:48:17'),
(7, 'Axel Lehner', 'Lenny Steuber', '950-502-1477', 'father', '25752 Dickens Fords Apt. 254\nNew Stephen, KS 66416', '1994-11-05', NULL, 1, 1, 'active', 'bette70@example.net', '2019-01-23 14:48:17', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'g5dAZ', 'disabled', NULL, 'default', 'Z6O7h3rY8P', '2019-01-23 14:48:17', '2019-01-23 14:48:17'),
(8, 'Dr. Fannie Herman Jr.', 'Concepcion Conn', '(685) 625-1960', 'mother', '39555 Kassulke Meadow\nLake Sethhaven, MS 47848', '2005-05-13', NULL, 1, 1, 'active', 'jo.parisian@example.org', '2019-01-23 14:48:17', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'EIPjB', 'disabled', NULL, 'default', 'qRlBDnOpiG', '2019-01-23 14:48:17', '2019-01-23 14:48:17'),
(9, 'Precious Swift MD', 'Angelita Mayer', '+1.252.672.4916', 'mother', '770 Peyton Crest\nNayelishire, NH 03768', '1991-05-18', NULL, 1, 1, 'active', 'annabelle51@example.org', '2019-01-23 14:48:17', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'w7UP1', 'disabled', NULL, 'default', 'in2DG6ZPIB', '2019-01-23 14:48:17', '2019-01-23 14:48:17'),
(10, 'Vance Parisian', 'Kari Stark', '+1-578-580-9606', 'father', '5729 Marks Plaza\nLeopoldoview, SC 06180-6813', '1996-07-22', NULL, 1, 1, 'active', 'dena.kihn@example.net', '2019-01-23 14:48:17', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'z2ORX', 'disabled', NULL, 'default', 'gyQ3NyJ81B', '2019-01-23 14:48:17', '2019-01-23 14:48:17'),
(11, 'Miss Bernadette Toy III', 'Felton Harber', '(951) 322-0493 x02621', 'father', '51560 Thomas Mall Apt. 269\nSchillertown, NH 07242', '1981-09-30', NULL, 1, 1, 'active', 'beaulah.murray@example.org', '2019-01-23 14:48:17', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'WQ0E8', 'enabled', NULL, 'default', 'kA3VNzft3J', '2019-01-23 14:48:17', '2019-01-23 14:48:17'),
(12, 'Станислав', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 'moderator@admin.com', NULL, '$2y$10$B3PdiTO1E.Kk0B7o3pXnCOWuItFRw4AL.aD6lGNvEMmSqsH7ogzoG', '$2y$10$Ufgaskg062B.Bm/Ytj58LO3LXB8kkE5MkQw9PEga2XxoZZWEgj4fu', 'enabled', NULL, 'moderator', NULL, '2019-01-24 09:24:24', '2019-01-24 09:24:24');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classes_schedule_id_foreign` (`schedule_id`);

--
-- Индексы таблицы `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conversations_user1_id_foreign` (`user1_id`),
  ADD KEY `conversations_user2_id_foreign` (`user2_id`);

--
-- Индексы таблицы `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foods_nutrition_id_foreign` (`nutrition_id`);

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
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_conversation_id_foreign` (`conversation_id`);

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
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT для таблицы `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

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
-- AUTO_INCREMENT для таблицы `telescope_entries`
--
ALTER TABLE `telescope_entries`
  MODIFY `sequence` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2356;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_schedule_id_foreign` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `conversations`
--
ALTER TABLE `conversations`
  ADD CONSTRAINT `conversations_user1_id_foreign` FOREIGN KEY (`user1_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `conversations_user2_id_foreign` FOREIGN KEY (`user2_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `foods`
--
ALTER TABLE `foods`
  ADD CONSTRAINT `foods_nutrition_id_foreign` FOREIGN KEY (`nutrition_id`) REFERENCES `nutritions` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `group_school`
--
ALTER TABLE `group_school`
  ADD CONSTRAINT `group_school_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `group_school_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`);

--
-- Ограничения внешнего ключа таблицы `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_conversation_id_foreign` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`) ON DELETE CASCADE;

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
  ADD CONSTRAINT `post_groups_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
