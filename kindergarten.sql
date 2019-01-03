-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 03 2019 г., 10:58
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
(1, 'Emmalee Kutch', 1, '07:29:15', '02:48:55', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(2, 'Dr. Jordy Brakus', 1, '11:21:14', '20:44:01', '2019-01-02 11:37:42', '2019-01-02 11:37:42');

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

--
-- Дамп данных таблицы `elective_groups`
--

INSERT INTO `elective_groups` (`electivy_id`, `group_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-01-02 12:38:21', '2019-01-02 12:38:21'),
(2, 2, '2019-01-02 12:38:34', '2019-01-02 12:38:34');

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
(1, 1, 'https://lorempixel.com/640/480/?25330', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(2, 1, 'https://lorempixel.com/640/480/?84475', '2019-01-02 11:37:42', '2019-01-02 11:37:42');

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
(1, 'Dr. Milo Jacobi', 1, 1, '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(2, 'Erin Block', 1, 1, '2019-01-02 11:37:42', '2019-01-02 11:37:42');

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
(45, '2014_10_12_000000_create_users_table', 1),
(46, '2014_10_12_100000_create_password_resets_table', 1),
(47, '2016_01_01_000000_create_posts_table', 1),
(48, '2018_08_08_100000_create_telescope_entries_table', 1),
(49, '2018_11_27_135607_create_schools_table', 1),
(50, '2018_11_27_140055_create_groups_table', 1),
(51, '2018_11_27_140409_create_schedules_table', 1),
(52, '2018_11_27_141826_create_lecturers_table', 1),
(53, '2018_11_27_144421_create_students_table', 1),
(54, '2018_11_28_124724_create_videos_table', 1),
(55, '2018_11_30_151109_create_electives_table', 1),
(56, '2018_11_30_151526_create_electivy_photos_table', 1),
(57, '2018_12_29_133217_create_notifications_table', 1),
(58, '2019_01_02_103941_create_elective_groups_table', 1),
(59, '2019_01_02_124851_create_post_groups_table', 1),
(60, '2019_01_02_133703_create_schools_groups_table', 1);

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
(1, 'Mrs.', 'Pariatur et doloribus voluptatum impedit aut. Autem saepe aut ipsum ipsum non. Aut sed velit aliquam qui. Nisi eum alias enim totam eligendi.', '1976-10-02', 1, 'https://lorempixel.com/640/480/?15579', 'https://lorempixel.com/640/480/?73381', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(2, 'Prof.', 'Ratione expedita eius eum ut fugit sed accusamus. Doloribus qui harum amet laborum vel et. Rem id et architecto nostrum in ab qui. Eligendi quas in aut sint.', '1998-09-06', 1, 'https://lorempixel.com/640/480/?71520', 'https://lorempixel.com/640/480/?28134', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(3, 'Dr.', 'Dolores ut dolore nobis quia voluptatibus eius. Quasi ut enim harum voluptatem nemo ab aliquam. Impedit aspernatur neque pariatur necessitatibus mollitia ipsa non illum.', '1974-05-12', 1, 'https://lorempixel.com/640/480/?94375', 'https://lorempixel.com/640/480/?86079', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(4, 'Dr.', 'Magnam repellat magnam ut ullam cupiditate. Voluptas possimus praesentium totam delectus.', '2006-08-15', 1, 'https://lorempixel.com/640/480/?52473', 'https://lorempixel.com/640/480/?56338', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(5, 'Mr.', 'Eum aut vero cumque sint. Voluptas amet est qui temporibus. Cupiditate voluptatum iusto unde et delectus quo quidem dolor.', '1980-12-07', 1, 'https://lorempixel.com/640/480/?93014', 'https://lorempixel.com/640/480/?26661', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(6, 'Prof.', 'Distinctio ex et repellendus enim quam explicabo animi. Animi aut et veniam tempore repellat rem.', '2005-06-23', 1, 'https://lorempixel.com/640/480/?67584', 'https://lorempixel.com/640/480/?13815', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(7, 'Prof.', 'Temporibus est consequatur alias est omnis et. Incidunt cum quisquam id autem. Suscipit voluptatem quidem aspernatur reiciendis reprehenderit aut aut quibusdam. Est repellat ipsum tempore.', '2003-04-05', 1, 'https://lorempixel.com/640/480/?23663', 'https://lorempixel.com/640/480/?91740', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(8, 'Prof.', 'Ipsum voluptas voluptas quas minima sed optio. Sint aut dolorum quibusdam et fugiat beatae pariatur placeat. Vero deleniti non eaque. Aperiam et sunt quia expedita aliquid nostrum.', '2007-05-29', 1, 'https://lorempixel.com/640/480/?90140', 'https://lorempixel.com/640/480/?80209', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(9, 'Prof.', 'Debitis facere explicabo ut exercitationem. Dolorum assumenda reiciendis et iure error autem eum. Laboriosam fugiat et iusto ullam assumenda expedita.', '2002-11-15', 1, 'https://lorempixel.com/640/480/?53395', 'https://lorempixel.com/640/480/?54419', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(10, 'Dr.', 'Eum et enim sint necessitatibus. Qui facere voluptatem explicabo culpa voluptas doloremque non. Nulla in nam incidunt unde facere numquam.', '1982-04-14', 1, 'https://lorempixel.com/640/480/?60881', 'https://lorempixel.com/640/480/?75211', '2019-01-02 11:37:42', '2019-01-02 11:37:42');

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
  `lecture_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'Emmalee Kutch', '2019-01-02 11:37:42', '2019-01-02 12:34:41'),
(2, 'Karl Rohan IV', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(4, 'MOTIP', '2019-01-02 12:28:31', '2019-01-02 12:28:31');

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
(4, 1, '2019-01-02 12:28:31', '2019-01-02 12:28:31'),
(1, 1, '2019-01-02 12:34:41', '2019-01-02 12:34:41'),
(1, 2, '2019-01-02 12:37:02', '2019-01-02 12:37:02'),
(2, 2, '2019-01-02 12:52:39', '2019-01-02 12:52:39');

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
(1, 'Mrs.', 1, 1, '1980-08-02', 'ACTIVE', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(2, 'Prof.', 1, 1, '2014-03-03', 'INACTIVE', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(3, 'Mr.', 1, 1, '1990-04-12', 'ACTIVE', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(4, 'Miss', 1, 1, '2010-09-17', 'INACTIVE', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(5, 'Mrs.', 1, 1, '2004-04-14', 'INACTIVE', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(6, 'Miss', 1, 1, '1983-05-07', 'INACTIVE', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(7, 'Dr.', 1, 1, '1997-05-04', 'INACTIVE', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(8, 'Mr.', 1, 1, '1994-07-02', 'INACTIVE', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(9, 'Prof.', 1, 1, '1987-01-25', 'ACTIVE', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(10, 'Miss', 1, 1, '1978-12-21', 'INACTIVE', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(11, 'Mr.', 1, 1, '2014-04-21', 'INACTIVE', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(12, 'Prof.', 1, 1, '1995-01-01', 'ACTIVE', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(13, 'Ms.', 1, 1, '2014-10-28', 'ACTIVE', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(14, 'Dr.', 1, 1, '1975-12-10', 'INACTIVE', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(15, 'Mr.', 1, 1, '1977-09-02', 'ACTIVE', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(16, 'Dr.', 1, 1, '1976-04-13', 'ACTIVE', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(17, 'Dr.', 1, 1, '1980-07-07', 'ACTIVE', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(18, 'Miss', 1, 1, '1970-03-14', 'INACTIVE', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(19, 'Mr.', 1, 1, '1980-01-03', 'ACTIVE', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(20, 'Prof.', 1, 1, '1973-07-05', 'INACTIVE', '2019-01-02 11:37:42', '2019-01-02 11:37:42');

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
(1, 'Станислав', 'Kian DuBuque', '574.858.4343', 'father', '162 Aurelia Springs\nWest Candice, CO 48188', '2005-05-20', 1, 1, 'active', 'admin@admin.com', '2019-01-02 11:37:42', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', '0SQQO', 'disabled', 'admin', 'xpdChvktvN', NULL, NULL),
(2, 'Kaylie Willms', 'Stevie Powlowski', '393.250.1453 x853', 'mother', '733 Wehner Spring Apt. 793\nRosieburgh, AZ 31119-2897', '1996-07-06', 1, 1, 'active', 'qlockman@example.net', '2019-01-02 11:37:42', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'wUai1', 'disabled', 'default', '0vzn0L4MB4', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(3, 'Mrs. Clotilde Bednar', 'Elvis Bechtelar', '1-663-288-2778 x5464', 'mother', '93913 Schaefer Plaza Suite 200\nJaskolskichester, MI 62638-4081', '2012-10-24', 1, 1, 'active', 'teresa32@example.com', '2019-01-02 11:37:42', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'AZwPZ', 'disabled', 'default', 'Z7QZsKL5DS', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(4, 'Ciara Hane', 'Reagan Upton', '994-565-6973 x269', 'father', '96155 Derek Island Apt. 765\nLeuschketon, MD 02030-6092', '1980-05-07', 1, 1, 'active', 'jerod89@example.org', '2019-01-02 11:37:42', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'feKrS', 'disabled', 'default', 'Y6L98SesAu', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(5, 'Jaylin Strosin', 'Tamia Moen', '1-412-991-2522 x15565', 'mother', '51171 Allen Summit Suite 106\nPort Lawsonmouth, DC 58869-0289', '2009-12-08', 1, 1, 'active', 'audrey.huel@example.net', '2019-01-02 11:37:42', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', '3cIUL', 'disabled', 'default', 'kDmucpwvUr', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(6, 'Patsy Simonis', 'Malachi Pollich', '1-208-315-0183 x14131', 'father', '88304 Gene Trail Suite 513\nWest Herminaview, IA 80818', '2013-09-09', 1, 1, 'active', 'gjaskolski@example.org', '2019-01-02 11:37:42', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'qedNr', 'enabled', 'default', 'wmSljPBLgw', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(7, 'Jacinthe Konopelski', 'Kallie Senger', '406.946.9083', 'father', '35608 Littel Stravenue\nZiemeberg, MN 84252', '1999-06-28', 1, 1, 'active', 'domenic.ankunding@example.org', '2019-01-02 11:37:42', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'LktJ4', 'enabled', 'default', 'qdh2Q3cRX9', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(8, 'Prof. Julio McKenzie DDS', 'Dr. Lourdes Satterfield III', '592.458.7411', 'father', '41081 Pfeffer Isle Suite 295\nVadafurt, UT 93264', '1974-04-30', 1, 1, 'active', 'nicolas.tyreek@example.org', '2019-01-02 11:37:42', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'rQb8T', 'disabled', 'default', 'DNkGtZaZQJ', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(9, 'Arely Hermann', 'Gilbert Osinski', '613.406.3884', 'father', '8845 Nikolas Brooks Suite 064\nEast Rahul, AK 25237-9715', '2005-07-20', 1, 1, 'active', 'xrempel@example.org', '2019-01-02 11:37:42', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'ttckc', 'disabled', 'default', 'Cb0ALMlCzQ', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(10, 'Prof. Suzanne Kirlin IV', 'Margaret Altenwerth', '271.295.5825 x884', 'mother', '7833 Talia Streets\nAlexafurt, NJ 19235-1018', '1986-08-09', 1, 1, 'active', 'ddaniel@example.com', '2019-01-02 11:37:42', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'cswxE', 'enabled', 'default', 'J7EFCqASKh', '2019-01-02 11:37:42', '2019-01-02 11:37:42'),
(11, 'Prof. Treva Lockman MD', 'Dr. Ardith Dach', '+1-303-842-8088', 'mother', '31827 Gislason Center\nRhiannachester, CA 31683', '1983-04-16', 1, 1, 'active', 'joey.hamill@example.com', '2019-01-02 11:37:42', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'NSF7z', 'enabled', 'default', 'RJUHN2moE2', '2019-01-02 11:37:42', '2019-01-02 11:37:42');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `schools`
--
ALTER TABLE `schools`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `students`
--
ALTER TABLE `students`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `telescope_entries`
--
ALTER TABLE `telescope_entries`
  MODIFY `sequence` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1431;

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
