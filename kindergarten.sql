-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 02 2019 г., 12:07
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
(1, 'Clementine Mayer', 1, '19:57:51', '23:16:32', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(2, 'Luigi Leannon', 1, '19:08:22', '17:38:31', '2018-12-29 11:34:37', '2018-12-29 11:34:37');

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
(1, 1, 'https://lorempixel.com/640/480/?16763', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(2, 1, 'https://lorempixel.com/640/480/?61128', '2018-12-29 11:34:37', '2018-12-29 11:34:37');

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
(1, 'Kiara Mitchell', 1, 1, '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(2, 'Kendra Welch', 1, 1, '2018-12-29 11:34:37', '2018-12-29 11:34:37');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_create_posts_table', 1),
(4, '2018_08_08_100000_create_telescope_entries_table', 1),
(5, '2018_11_27_135607_create_schools_table', 1),
(6, '2018_11_27_140055_create_groups_table', 1),
(7, '2018_11_27_140409_create_schedules_table', 1),
(8, '2018_11_27_141826_create_lecturers_table', 1),
(9, '2018_11_27_144421_create_students_table', 1),
(10, '2018_11_28_124724_create_videos_table', 1),
(11, '2018_11_30_151109_create_electives_table', 1),
(12, '2018_11_30_151526_create_electivy_photos_table', 1),
(13, '2018_12_29_133217_create_notifications_table', 1);

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
(1, 'Miss', 'Esse veritatis perferendis qui odit. Minima ut provident aliquam unde. Totam iure tenetur esse omnis quo. Et enim ut quibusdam laborum illum tempore.', '2013-12-20', 1, 'https://lorempixel.com/640/480/?46490', 'https://lorempixel.com/640/480/?81193', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(2, 'Miss', 'Laudantium ab eum perferendis et sint. Debitis non molestiae aspernatur officiis velit. Fugiat beatae nesciunt ad ad neque. Omnis eveniet voluptas nulla asperiores nostrum possimus numquam.', '1999-07-13', 1, 'https://lorempixel.com/640/480/?20650', 'https://lorempixel.com/640/480/?10950', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(3, 'Prof.', 'Repellendus dolorum error consectetur corporis aliquam nam necessitatibus ad. Illo minus saepe consequatur dicta aut.', '1971-12-05', 1, 'https://lorempixel.com/640/480/?81610', 'https://lorempixel.com/640/480/?34801', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(4, 'Dr.', 'Et vel voluptatibus nostrum dolor et est perferendis. Fugit sapiente id hic ut dolor nemo fugiat.', '2007-06-30', 1, 'https://lorempixel.com/640/480/?64167', 'https://lorempixel.com/640/480/?80784', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(5, 'Prof.', 'Ut mollitia nostrum at quidem eos illum. Doloremque fugiat non repellat id ratione sed. Quia architecto atque perferendis nisi molestias consequatur velit.', '1992-09-06', 1, 'https://lorempixel.com/640/480/?40875', 'https://lorempixel.com/640/480/?78470', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(6, 'Prof.', 'Officiis aut cupiditate omnis alias ipsam. Fugiat optio vel iusto pariatur quia eum alias. Ut dolor fuga mollitia accusamus qui doloremque perferendis.', '2010-05-27', 1, 'https://lorempixel.com/640/480/?35573', 'https://lorempixel.com/640/480/?26541', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(7, 'Prof.', 'Laudantium vero fuga maxime atque eveniet. Sed doloribus exercitationem ex voluptas. Aut mollitia sit id laborum quaerat dolorum. Iste tempore necessitatibus repudiandae qui.', '1984-07-10', 1, 'https://lorempixel.com/640/480/?71010', 'https://lorempixel.com/640/480/?65905', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(8, 'Dr.', 'Ut est quisquam harum molestias est ducimus. Et exercitationem consectetur aperiam. Molestias quibusdam unde fuga. Consequatur consequatur dignissimos similique saepe impedit labore rerum.', '2004-02-15', 1, 'https://lorempixel.com/640/480/?64706', 'https://lorempixel.com/640/480/?26609', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(9, 'Ms.', 'Accusamus voluptas molestias similique vel maiores sed dolores repellat. Voluptatem totam pariatur esse repellendus veniam ut quia et. Quibusdam sunt consequatur consequatur.', '2007-03-04', 1, 'https://lorempixel.com/640/480/?42693', 'https://lorempixel.com/640/480/?48555', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(10, 'Dr.', 'Laudantium unde dolor beatae facere. Sit commodi facere in facere vitae.', '1988-04-17', 1, 'https://lorempixel.com/640/480/?76185', 'https://lorempixel.com/640/480/?65306', '2018-12-29 11:34:37', '2018-12-29 11:34:37');

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
(1, 'Mr. Trace Bernier DVM', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(2, 'Russel Stamm', '2018-12-29 11:34:37', '2018-12-29 11:34:37');

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
(1, 'Prof.', 1, 1, '1990-09-27', 'INACTIVE', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(2, 'Dr.', 1, 1, '2011-04-01', 'INACTIVE', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(3, 'Mr.', 1, 1, '2009-06-24', 'INACTIVE', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(4, 'Prof.', 1, 1, '2010-07-24', 'ACTIVE', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(5, 'Dr.', 1, 1, '1982-10-11', 'ACTIVE', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(6, 'Dr.', 1, 1, '2016-06-16', 'ACTIVE', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(7, 'Miss', 1, 1, '2010-03-02', 'INACTIVE', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(8, 'Ms.', 1, 1, '1979-05-10', 'INACTIVE', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(9, 'Mr.', 1, 1, '1972-11-24', 'ACTIVE', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(10, 'Prof.', 1, 1, '2015-08-08', 'ACTIVE', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(11, 'Mr.', 1, 1, '1980-02-14', 'ACTIVE', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(12, 'Mrs.', 1, 1, '2002-07-10', 'ACTIVE', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(13, 'Prof.', 1, 1, '2000-03-01', 'ACTIVE', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(14, 'Prof.', 1, 1, '1993-02-28', 'INACTIVE', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(15, 'Dr.', 1, 1, '2006-01-27', 'INACTIVE', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(16, 'Mrs.', 1, 1, '2008-07-10', 'INACTIVE', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(17, 'Prof.', 1, 1, '2004-07-14', 'INACTIVE', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(18, 'Mr.', 1, 1, '1977-11-25', 'ACTIVE', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(19, 'Prof.', 1, 1, '2016-10-10', 'INACTIVE', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(20, 'Miss', 1, 1, '1980-01-20', 'INACTIVE', '2018-12-29 11:34:37', '2018-12-29 11:34:37');

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
(1, 'Станислав', 'Wilson Hessel', '+1.373.312.9729', 'mother', '77875 Pouros Squares Apt. 942\nLake Elsemouth, NC 32845-3866', '1987-09-17', 1, 1, 'active', 'admin@admin.com', '2018-12-29 11:34:37', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', '6QhAD', 'enabled', 'admin', 'F97vwcDExw', NULL, NULL),
(2, 'Jermain Turcotte Sr.', 'Dr. Karelle Hintz DVM', '1-993-725-6816', 'mother', '48397 Schaden Island Apt. 236\nPort Ceciliaburgh, NE 50231-4945', '1992-01-15', 1, 1, 'active', 'schuppe.nathanial@example.net', '2018-12-29 11:34:37', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'V4p6I', 'disabled', 'default', 'GHaSL1Q9Nl', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(3, 'Casimir Schroeder', 'Domenick Strosin', '(921) 870-4096 x9664', 'father', '232 Wiegand Valley Apt. 685\nHammesburgh, VA 40164', '2012-12-13', 1, 1, 'active', 'monahan.annie@example.net', '2018-12-29 11:34:37', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'OApqr', 'enabled', 'default', 'j8BE3NUPsy', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(4, 'Mr. Johathan Fisher V', 'Jeffrey Farrell', '+1-723-582-3256', 'father', '13487 Moen Mission\nNorth Oma, VT 63559-3511', '2001-07-27', 1, 1, 'active', 'pconnelly@example.net', '2018-12-29 11:34:37', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', '7NMM0', 'disabled', 'default', 'W4JSgvpf1t', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(5, 'Mrs. Ruthie Dach Jr.', 'Dr. Shane Dooley', '(847) 779-9863', 'mother', '6770 McLaughlin Loaf\nPort Danikaborough, AL 57602-2907', '1980-04-18', 1, 1, 'active', 'dulce15@example.com', '2018-12-29 11:34:37', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'BO3bg', 'disabled', 'default', 'GcM3mlRa6n', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(6, 'Charley Kling', 'Leonard Fahey', '(904) 454-4668 x035', 'father', '971 Bins Neck\nEast Calliefort, NH 91970', '1990-05-05', 1, 1, 'active', 'ana73@example.org', '2018-12-29 11:34:37', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'duPPk', 'enabled', 'default', 'kHhV3ZKwFx', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(7, 'Althea Prosacco', 'Cathrine Leffler', '(202) 963-3848 x651', 'father', '57647 Buford Turnpike\nProvidenciland, NY 28420', '1980-07-25', 1, 1, 'active', 'vandervort.ettie@example.org', '2018-12-29 11:34:37', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'wnDrg', 'enabled', 'default', 'w3HxmnV6Iq', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(8, 'Roman O\'Keefe IV', 'Coby Lehner V', '328.323.2611 x774', 'father', '560 Elnora Passage\nJastmouth, IN 12112-6586', '1981-12-17', 1, 1, 'active', 'rowe.markus@example.org', '2018-12-29 11:34:37', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', '2AETj', 'enabled', 'default', 'ViKo5W6HIW', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(9, 'Makenzie Pouros III', 'Dr. Ernesto Heller II', '1-936-989-3953', 'mother', '13103 Kshlerin Stravenue Suite 370\nSouth Justen, CA 74855', '1970-12-26', 1, 1, 'active', 'noemy68@example.net', '2018-12-29 11:34:37', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'Z1k21', 'disabled', 'default', 'fJhBbJS2S6', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(10, 'Genevieve Kohler', 'Dr. Lurline Russel', '892-791-2006 x975', 'father', '481 Toy Road\nPort Terrell, MN 11759-8972', '1989-03-14', 1, 1, 'active', 'jkris@example.com', '2018-12-29 11:34:37', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'RoVh9', 'enabled', 'default', 'nvNTRJtCRV', '2018-12-29 11:34:37', '2018-12-29 11:34:37'),
(11, 'Werner Borer', 'Zoie Heaney', '285-415-8889 x730', 'father', '66231 Loyce Overpass Apt. 301\nEast Kaley, OR 09845-4443', '1993-06-24', 1, 1, 'active', 'graciela.pacocha@example.org', '2018-12-29 11:34:37', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'bXN82', 'disabled', 'default', 'OjuDfLbrcB', '2018-12-29 11:34:37', '2018-12-29 11:34:37');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  MODIFY `sequence` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
-- Ограничения внешнего ключа таблицы `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
