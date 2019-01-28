-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 28 2019 г., 17:39
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
(1, 1, 'Annie Luettgen', '02:35:07', '16:21:10', NULL, NULL),
(2, 1, 'Tyshawn Marquardt', '22:23:54', '00:01:30', NULL, NULL),
(3, 1, 'Ewald Luettgen', '04:43:06', '00:21:09', NULL, NULL),
(4, 1, 'Ms. Leda Ortiz', '12:16:47', '03:20:08', NULL, NULL),
(5, 2, 'Judd Sawayn', '06:31:56', '12:12:29', NULL, NULL),
(6, 2, 'Dr. Jovany Blanda', '06:22:23', '19:10:21', NULL, NULL),
(7, 2, 'Dr. Maverick Thompson Jr.', '15:18:53', '14:40:51', NULL, NULL),
(8, 2, 'Karine Cruickshank II', '00:36:43', '02:58:40', NULL, NULL),
(9, 3, 'Delphia Marvin IV', '05:34:16', '15:02:22', NULL, NULL),
(10, 3, 'Emmalee Gibson', '21:13:10', '21:46:14', NULL, NULL),
(11, 3, 'Maximillia Anderson', '13:02:43', '05:06:38', NULL, NULL),
(12, 3, 'Jerad Okuneva Sr.', '13:02:39', '23:37:07', NULL, NULL),
(13, 4, 'Ms. Marcelina Lockman IV', '07:23:57', '03:21:00', NULL, NULL),
(14, 4, 'Cullen Flatley', '04:24:52', '17:53:34', NULL, NULL),
(15, 4, 'Geraldine Wolf', '13:54:36', '13:20:44', NULL, NULL),
(16, 4, 'Ashlynn Mante Sr.', '11:14:03', '19:28:05', NULL, NULL),
(17, 5, 'Leanna Roob', '18:15:06', '07:18:50', NULL, NULL),
(18, 5, 'Leann Labadie', '09:10:30', '03:09:42', NULL, NULL),
(19, 5, 'Tatum Yost', '08:07:00', '11:31:18', NULL, NULL),
(20, 5, 'Wilford Konopelski', '05:44:14', '03:29:48', NULL, NULL),
(21, 6, 'Destin Kreiger', '14:35:26', '20:27:32', NULL, NULL),
(22, 6, 'Estel Rowe', '02:03:36', '04:05:21', NULL, NULL),
(23, 7, 'Madonna Corkery', '15:12:01', '15:24:24', NULL, NULL);

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
(1, 1, 'Gerald Strosin', 'lunch', NULL, NULL),
(2, 1, 'Ron McKenzie', 'afternoon-tea', NULL, NULL),
(3, 1, 'Maribel Huel', 'lunch', NULL, NULL),
(4, 1, 'Hattie Roberts', 'dinner', NULL, NULL),
(5, 2, 'Janiya Parker DDS', 'lunch', NULL, NULL),
(6, 2, 'Ms. Zola Becker', 'breakfast', NULL, NULL),
(7, 2, 'Sigurd Reilly', 'breakfast', NULL, NULL),
(8, 2, 'Hadley Waters', 'breakfast', NULL, NULL),
(9, 3, 'Myrtice Hintz', 'dinner', NULL, NULL),
(10, 3, 'Mrs. Adele Will', 'afternoon-tea', NULL, NULL),
(11, 3, 'Ms. Cecilia Fadel Jr.', 'afternoon-tea', NULL, NULL),
(12, 3, 'Evan Kautzer', 'afternoon-tea', NULL, NULL),
(13, 4, 'Maudie White', 'lunch', NULL, NULL),
(14, 4, 'Miguel Kulas', 'breakfast', NULL, NULL),
(15, 4, 'Chadrick Cruickshank', 'dinner', NULL, NULL),
(16, 4, 'Marvin Wisozk', 'afternoon-tea', NULL, NULL),
(17, 5, 'Angelo Schaden', 'afternoon-tea', NULL, NULL),
(18, 5, 'Lulu Ankunding', 'afternoon-tea', NULL, NULL),
(19, 5, 'Russel Bins', 'afternoon-tea', NULL, NULL),
(20, 5, 'Mrs. Rubye Weber', 'afternoon-tea', NULL, NULL),
(21, 6, 'Mack Feeney', 'dinner', NULL, NULL),
(22, 6, 'Molly Zemlak II', 'dinner', NULL, NULL),
(23, 7, 'Carolanne Bradtke', 'breakfast', NULL, NULL);

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
(1, 'Lyda Williamson', 1, 1, '2019-01-28 14:37:23', '2019-01-28 14:37:23'),
(2, 'Antwon Frami', 1, 1, '2019-01-28 14:37:23', '2019-01-28 14:37:23');

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
(1, 1, 1, '2019-01-28 14:37:51', '2019-01-28 14:37:51'),
(2, 2, 2, '2019-01-28 14:37:54', '2019-01-28 14:37:54');

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
(8, '2019_01_02_124851_create_post_groups_table', 1),
(9, '2019_01_02_133703_create_schools_groups_table', 1),
(10, '2019_01_03_092037_create_classes_table', 1),
(11, '2019_01_16_124620_create_nutritions_table', 1),
(12, '2019_01_16_124705_create_foods_table', 1),
(13, '2019_01_23_142400_create_conversations_table', 1),
(14, '2019_01_25_092738_create_messages_table', 1);

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
(1, 'Miss', 'Repellendus non ut alias. Consequuntur facilis recusandae error voluptatem repudiandae officiis. Veritatis enim est tempora sit. Ut eum adipisci rerum rerum officia.', '1987-12-30', 1, 'https://lorempixel.com/640/480/?51350', 'https://lorempixel.com/640/480/?76489', '2019-01-28 14:37:23', '2019-01-28 14:37:23'),
(2, 'Prof.', 'Officia non et quo et minus. Explicabo est et praesentium a nihil.', '1988-12-01', 1, 'https://lorempixel.com/640/480/?30845', 'https://lorempixel.com/640/480/?81939', '2019-01-28 14:37:23', '2019-01-28 14:37:23'),
(3, 'Ms.', 'Nostrum modi sed laudantium vitae qui et. Nam itaque quis tempora debitis.', '2001-05-31', 1, 'https://lorempixel.com/640/480/?15546', 'https://lorempixel.com/640/480/?43847', '2019-01-28 14:37:23', '2019-01-28 14:37:23'),
(4, 'Mr.', 'Quibusdam sed deserunt repellat sit natus sed esse quos. Hic non sunt explicabo necessitatibus laudantium ipsa libero. Sunt ea atque ipsam. Error officia aut eveniet est.', '2014-03-29', 1, 'https://lorempixel.com/640/480/?74658', 'https://lorempixel.com/640/480/?20611', '2019-01-28 14:37:23', '2019-01-28 14:37:23'),
(5, 'Prof.', 'Totam officia sit necessitatibus tenetur et autem. Consequatur ipsa et cumque sit architecto repellat quibusdam corrupti. Enim sint aut quos quibusdam aut totam ipsam.', '1981-06-22', 1, 'https://lorempixel.com/640/480/?90479', 'https://lorempixel.com/640/480/?20067', '2019-01-28 14:37:23', '2019-01-28 14:37:23'),
(6, 'Prof.', 'Sed explicabo in molestias. Debitis corporis doloribus tempora dolorem officia. Sed voluptate possimus soluta excepturi ut quia. Ducimus quia laboriosam aut veniam.', '2012-12-12', 1, 'https://lorempixel.com/640/480/?90484', 'https://lorempixel.com/640/480/?15473', '2019-01-28 14:37:23', '2019-01-28 14:37:23'),
(7, 'Miss', 'Eaque atque libero ut exercitationem vero quisquam totam id. Delectus error nostrum labore. Ab atque culpa accusamus dolor non quo. Est officiis occaecati laboriosam similique.', '1988-12-17', 1, 'https://lorempixel.com/640/480/?61041', 'https://lorempixel.com/640/480/?83660', '2019-01-28 14:37:23', '2019-01-28 14:37:23'),
(8, 'Mr.', 'Excepturi sint sed ut minus. Atque quis architecto perferendis dolores accusantium. Rerum culpa iste ullam nulla sit ratione.', '1987-09-13', 1, 'https://lorempixel.com/640/480/?90770', 'https://lorempixel.com/640/480/?87689', '2019-01-28 14:37:23', '2019-01-28 14:37:23'),
(9, 'Mr.', 'Suscipit quasi maiores voluptas mollitia voluptas. Enim explicabo deserunt sequi suscipit assumenda. Quis iusto aut facere ut sit et et earum.', '2013-10-03', 1, 'https://lorempixel.com/640/480/?13439', 'https://lorempixel.com/640/480/?37045', '2019-01-28 14:37:23', '2019-01-28 14:37:23'),
(10, 'Mrs.', 'Aut facere perferendis cupiditate omnis. Sit omnis esse quos doloribus. Voluptas et ut deserunt voluptatem quia. Repellendus consequatur a deleniti.', '1987-07-09', 1, 'https://lorempixel.com/640/480/?13355', 'https://lorempixel.com/640/480/?29819', '2019-01-28 14:37:23', '2019-01-28 14:37:23');

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
  `group_id` int(11) NOT NULL,
  `day` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `schedules`
--

INSERT INTO `schedules` (`id`, `school_id`, `group_id`, `day`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Monday', NULL, NULL),
(2, 1, 1, 'Tuesday', NULL, NULL),
(3, 1, 1, 'Wednesday', NULL, NULL),
(4, 1, 1, 'Thursday', NULL, NULL),
(5, 1, 1, 'Friday', NULL, NULL),
(6, 1, 1, 'Saturday', NULL, NULL),
(7, 1, 1, 'Sunday', NULL, NULL);

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
(1, 'Cydney Leffler', '2019-01-28 14:37:23', '2019-01-28 14:37:23'),
(2, 'Valentine Hudson', '2019-01-28 14:37:23', '2019-01-28 14:37:23');

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
(1, 'Станислав', 'Ms. Breanne Fay DDS', '1-570-745-8997', 'mother', '410 Maud Wells\nHarryshire, NJ 48308', '1982-02-15', NULL, 1, 1, 'active', 'admin@admin.com', '2019-01-28 14:37:23', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'Izoax', 'enabled', NULL, 'admin', 'aiLRN05L9h', NULL, NULL),
(2, 'Вихователь', 'Laurianne Batz II', '896.915.2307', 'father', '39200 Elmo Stream\nLeannachester, NJ 39055', '2016-07-16', NULL, 1, 1, 'active', 'moderator@admin.com', '2019-01-28 14:37:23', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'rinAn', 'disabled', NULL, 'moderator', 'ePg9hsjREE', NULL, NULL),
(3, 'Prof. Johann Waelchi II', 'Prof. Ruthie Dicki', '452.204.6370 x5050', 'father', '40435 Wiza Lane\nPowlowskiton, LA 97619-7226', '1994-04-22', NULL, 1, 1, 'active', 'christelle.white@example.com', '2019-01-28 14:37:23', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', '9lElM', 'disabled', NULL, 'default', 'qG33Pqt5dz', '2019-01-28 14:37:23', '2019-01-28 14:37:23'),
(4, 'Willie Rohan', 'Ms. Marquise Hane PhD', '615.373.3575 x11438', 'mother', '8016 Smith Lights Apt. 378\nPort Billyview, VA 92438-0335', '2013-09-16', NULL, 1, 1, 'active', 'hamill.oliver@example.net', '2019-01-28 14:37:23', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'xLHl6', 'enabled', NULL, 'default', 'v7yHcQD7Rw', '2019-01-28 14:37:23', '2019-01-28 14:37:23'),
(5, 'Sophie Mante PhD', 'Prof. Hollis Jast DVM', '552.295.3508 x95297', 'mother', '4008 Gorczany Passage Suite 057\nNew Goldashire, TN 48797-6727', '2008-07-11', NULL, 1, 1, 'active', 'weimann.zula@example.net', '2019-01-28 14:37:23', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'fk0KA', 'disabled', NULL, 'default', 'cfkRLfCgc3', '2019-01-28 14:37:23', '2019-01-28 14:37:23'),
(6, 'Casper Leffler IV', 'Meaghan Ebert IV', '657.225.0038 x030', 'mother', '6038 Konopelski Bridge\nLake Noemie, AK 66352-7250', '1981-08-02', NULL, 1, 1, 'active', 'angelo.bosco@example.com', '2019-01-28 14:37:23', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'rEw0v', 'enabled', NULL, 'default', 'YDdorPkiRr', '2019-01-28 14:37:23', '2019-01-28 14:37:23'),
(7, 'Cameron Lebsack', 'Hertha Conn', '413.376.6813', 'father', '1224 Ullrich Courts\nEdwinahaven, KS 34970', '1987-07-22', NULL, 1, 1, 'active', 'consuelo.schiller@example.net', '2019-01-28 14:37:23', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'DLj0E', 'disabled', NULL, 'default', 'vQjXyq7d0X', '2019-01-28 14:37:23', '2019-01-28 14:37:23'),
(8, 'Aurelia Hills', 'Jayde Denesik', '246-601-8940 x75936', 'mother', '83459 Johns Ford Apt. 116\nGiovanniside, WI 60945', '2009-02-23', NULL, 1, 1, 'active', 'kuphal.annie@example.net', '2019-01-28 14:37:23', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'u7zsN', 'disabled', NULL, 'default', 'kwj1SnmCRX', '2019-01-28 14:37:23', '2019-01-28 14:37:23'),
(9, 'Ernie Kris III', 'Kurt Skiles', '960.978.1085 x61430', 'father', '3876 Salvador Burg\nGoodwinshire, SD 34694-6502', '1995-08-24', NULL, 1, 1, 'active', 'davis.billy@example.org', '2019-01-28 14:37:23', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'NjCEn', 'enabled', NULL, 'default', 'EZAXbc8zxJ', '2019-01-28 14:37:23', '2019-01-28 14:37:23'),
(10, 'Prof. Calista Sawayn II', 'Maxine Lind', '(636) 856-2362 x423', 'father', '9451 Wuckert Stravenue\nKayliborough, CA 49564-7150', '1971-09-04', NULL, 1, 1, 'active', 'ggreen@example.org', '2019-01-28 14:37:23', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'pu8yC', 'enabled', NULL, 'default', '40DLtgOy5N', '2019-01-28 14:37:23', '2019-01-28 14:37:23'),
(11, 'William Eichmann', 'Theo Erdman', '(454) 586-9736 x016', 'mother', '15327 Audreanne Spring\nWest Annamarietown, DC 47465-4917', '1989-07-03', NULL, 1, 1, 'active', 'jerald.strosin@example.org', '2019-01-28 14:37:23', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', '41ga8', 'enabled', NULL, 'default', 'PYZyR2hMix', '2019-01-28 14:37:23', '2019-01-28 14:37:23'),
(12, 'Mr. Joshua Pollich', 'Ophelia Feest', '308.795.3293 x16041', 'mother', '9261 Nickolas Landing Apt. 068\nEvelinemouth, GA 56990', '1974-08-02', NULL, 1, 1, 'active', 'lue13@example.net', '2019-01-28 14:37:23', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'Dhync', 'disabled', NULL, 'default', 'nYbRb2YjVJ', '2019-01-28 14:37:23', '2019-01-28 14:37:23');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
  MODIFY `sequence` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

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
