-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 31 2019 г., 17:08
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
(1, '8ce027a7-aeab-4b03-a8e7-856034147ad8', '8ce027a7-b299-4e1e-9e01-ba657415d63d', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[1],\"sql\":\"select * from `users` where `id` = ? limit 1\",\"time\":\"0.34\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\app\\\\Http\\\\Middleware\\\\AccessAdminPanel.php\",\"line\":19,\"hostname\":\"SpriteS\"}', '2019-01-31 16:07:38'),
(2, '8ce027a7-afbf-475e-b27b-b6040e1fde11', '8ce027a7-b299-4e1e-9e01-ba657415d63d', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[1,1],\"sql\":\"select * from `conversations` where (`user1_id` = ?) or (`user2_id` = ?)\",\"time\":\"0.25\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\app\\\\Http\\\\Controllers\\\\MessagesController.php\",\"line\":263,\"hostname\":\"SpriteS\",\"user\":{\"id\":1,\"name\":\"\\u0421\\u0442\\u0430\\u043d\\u0438\\u0441\\u043b\\u0430\\u0432\",\"email\":\"admin@admin.com\"}}', '2019-01-31 16:07:38'),
(3, '8ce027a7-b104-4cca-9717-8c6f508466ed', '8ce027a7-b299-4e1e-9e01-ba657415d63d', NULL, 1, 'request', '{\"uri\":\"\\/admin\\/messages\\/unread_messages_counter\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\MessagesController@AdminMessagesCounter\",\"middleware\":[\"web\",\"access_admin\"],\"headers\":{\"host\":\"localhost:8000\",\"connection\":\"keep-alive\",\"accept\":\"application\\/json, text\\/javascript, *\\/*; q=0.01\",\"x-csrf-token\":\"6aLijzntiEwx3rWJ26kfJKEmjO4HNCvlFw7btqzl\",\"x-requested-with\":\"XMLHttpRequest\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/71.0.3578.98 Safari\\/537.36\",\"referer\":\"http:\\/\\/localhost:8000\\/admin\\/users\\/create\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7,de;q=0.6\",\"cookie\":\"SL_G_WPT_TO=ru; SL_GWPT_Show_Hide_tmp=undefined; SL_wptGlobTipTmp=undefined; BL_D_PROV=Google; Phpstorm-9e05da2c=c0ee55e8-3564-4fec-bd1c-728865982c2b; BL_T_PROV=Google; _ga=GA1.1.294944040.1548233716; intercom-id-n2cpz0ku=517ecbde-d1b9-4b0c-a5a7-202948c78881; XSRF-TOKEN=eyJpdiI6IkRTaFhiMnJUeGI1R3pocldyektwM2c9PSIsInZhbHVlIjoiZlA3Y0ZETjRScnJsZm5OTEZlQVdrME90UzVzTktRSytQeG55MUxoc2RcL0hBZ21NczNmbFhTckhGVnFYYUdhQjgiLCJtYWMiOiJlYTU0NDhhMDEwMDI0M2UzMWE2OTRhZjY4ZDhiZGNhODhiYmIyYmM4Yjk1MWZiN2VlM2MwNGFhYTFkODFmMDY5In0%3D; laravel_session=eyJpdiI6ImloNXNXYTJGaHhRdGUzOTdBQ1RrQ2c9PSIsInZhbHVlIjoiS0xpamY3YmtpdHRWYUxrNzl6SnMxNWdWcDZnNU53TmpUMUZzNlR4ZjFxVFB0ZHB4bURJbXZtVks2OEkzK3RvNyIsIm1hYyI6IjA1MWEwMWY0NGRiNzg4MmM1ZDM5Njk5YzA5MzcwNTU2MmIxYzhmODEwNTRjYTFiNmJjNDUwNDU1MTUzMmQzMTAifQ%3D%3D\"},\"payload\":[],\"session\":{\"_flash\":{\"old\":[],\"new\":[]},\"_token\":\"6aLijzntiEwx3rWJ26kfJKEmjO4HNCvlFw7btqzl\",\"_previous\":{\"url\":\"http:\\/\\/localhost:8000\\/admin\\/users\\/create\"},\"url\":[],\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_status\":200,\"response\":{\"success\":true,\"count\":0},\"duration\":121,\"hostname\":\"SpriteS\",\"user\":{\"id\":1,\"name\":\"\\u0421\\u0442\\u0430\\u043d\\u0438\\u0441\\u043b\\u0430\\u0432\",\"email\":\"admin@admin.com\"}}', '2019-01-31 16:07:38'),
(4, '8ce027ae-e749-4be8-9062-f94b478eb272', '8ce027ae-eb5d-476b-b11c-ca29fb464ba9', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[1],\"sql\":\"select * from `users` where `id` = ? limit 1\",\"time\":\"0.34\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\app\\\\Http\\\\Middleware\\\\AccessAdminPanel.php\",\"line\":19,\"hostname\":\"SpriteS\"}', '2019-01-31 16:07:43'),
(5, '8ce027ae-e86a-470c-9210-5ca9af4791ed', '8ce027ae-eb5d-476b-b11c-ca29fb464ba9', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[1,1],\"sql\":\"select * from `conversations` where (`user1_id` = ?) or (`user2_id` = ?)\",\"time\":\"0.33\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\app\\\\Http\\\\Controllers\\\\MessagesController.php\",\"line\":263,\"hostname\":\"SpriteS\",\"user\":{\"id\":1,\"name\":\"\\u0421\\u0442\\u0430\\u043d\\u0438\\u0441\\u043b\\u0430\\u0432\",\"email\":\"admin@admin.com\"}}', '2019-01-31 16:07:43'),
(6, '8ce027ae-e9d0-4ac0-a559-324e20071bfe', '8ce027ae-eb5d-476b-b11c-ca29fb464ba9', NULL, 1, 'request', '{\"uri\":\"\\/admin\\/messages\\/unread_messages_counter\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\MessagesController@AdminMessagesCounter\",\"middleware\":[\"web\",\"access_admin\"],\"headers\":{\"host\":\"localhost:8000\",\"connection\":\"keep-alive\",\"accept\":\"application\\/json, text\\/javascript, *\\/*; q=0.01\",\"x-csrf-token\":\"6aLijzntiEwx3rWJ26kfJKEmjO4HNCvlFw7btqzl\",\"x-requested-with\":\"XMLHttpRequest\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/71.0.3578.98 Safari\\/537.36\",\"referer\":\"http:\\/\\/localhost:8000\\/admin\\/users\\/create\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7,de;q=0.6\",\"cookie\":\"SL_G_WPT_TO=ru; SL_GWPT_Show_Hide_tmp=undefined; SL_wptGlobTipTmp=undefined; BL_D_PROV=Google; Phpstorm-9e05da2c=c0ee55e8-3564-4fec-bd1c-728865982c2b; BL_T_PROV=Google; _ga=GA1.1.294944040.1548233716; intercom-id-n2cpz0ku=517ecbde-d1b9-4b0c-a5a7-202948c78881; XSRF-TOKEN=eyJpdiI6Im9sREpsRk15RGwzdlVjcVJ3RFo0clE9PSIsInZhbHVlIjoibUpCaXV0TTNJdE1CZFk3bEJrQlpyeUtDcnQ0WWZSTHY5UnBGZzlhS0pZa0VkaXZyMk1pdk1OKzVXSFdnZkprciIsIm1hYyI6ImRkNGJkZmE5ZDI4NzA0ZDc4YWY5OGRiM2JhMjdhMzc4NDRmODJmZjA1NTJjNmZhYjk5ODIxNThiYTIyMDI1MzYifQ%3D%3D; laravel_session=eyJpdiI6IjNxKzBnUVJyRUVzS0NSdWRsR2FodWc9PSIsInZhbHVlIjoiT0tsVnVTMEpMV2VwUTI4WEo5OFVtXC81eFZhdG5vM1QxQmFGS1dBdUxyNnFjWFRaaE1lZnpcL2xxZ3V4dFZZSjJHIiwibWFjIjoiYzNiOTY0M2NlNWZlZmZiYzE1YTgxNjZiOWZiNzNmOThkMTRkZDAzZWQ5ODQ4NDM0YmUwOWNkZDFhZDA2ZjAxOCJ9\"},\"payload\":[],\"session\":{\"_flash\":{\"old\":[],\"new\":[]},\"_token\":\"6aLijzntiEwx3rWJ26kfJKEmjO4HNCvlFw7btqzl\",\"_previous\":{\"url\":\"http:\\/\\/localhost:8000\\/admin\\/users\\/create\"},\"url\":[],\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_status\":200,\"response\":{\"success\":true,\"count\":0},\"duration\":155,\"hostname\":\"SpriteS\",\"user\":{\"id\":1,\"name\":\"\\u0421\\u0442\\u0430\\u043d\\u0438\\u0441\\u043b\\u0430\\u0432\",\"email\":\"admin@admin.com\"}}', '2019-01-31 16:07:43'),
(7, '8ce027b6-f803-4e66-bd71-b549aa848b6b', '8ce027b6-fc69-47ba-a2b1-e14bda95b6ee', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[1],\"sql\":\"select * from `users` where `id` = ? limit 1\",\"time\":\"0.48\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\app\\\\Http\\\\Middleware\\\\AccessAdminPanel.php\",\"line\":19,\"hostname\":\"SpriteS\"}', '2019-01-31 16:07:48'),
(8, '8ce027b6-f996-4d44-997c-a106a3fb5df3', '8ce027b6-fc69-47ba-a2b1-e14bda95b6ee', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[1,1],\"sql\":\"select * from `conversations` where (`user1_id` = ?) or (`user2_id` = ?)\",\"time\":\"1.35\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\app\\\\Http\\\\Controllers\\\\MessagesController.php\",\"line\":263,\"hostname\":\"SpriteS\",\"user\":{\"id\":1,\"name\":\"\\u0421\\u0442\\u0430\\u043d\\u0438\\u0441\\u043b\\u0430\\u0432\",\"email\":\"admin@admin.com\"}}', '2019-01-31 16:07:48'),
(9, '8ce027b6-fae1-4770-80fc-15c55eff47aa', '8ce027b6-fc69-47ba-a2b1-e14bda95b6ee', NULL, 1, 'request', '{\"uri\":\"\\/admin\\/messages\\/unread_messages_counter\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\MessagesController@AdminMessagesCounter\",\"middleware\":[\"web\",\"access_admin\"],\"headers\":{\"host\":\"localhost:8000\",\"connection\":\"keep-alive\",\"accept\":\"application\\/json, text\\/javascript, *\\/*; q=0.01\",\"x-csrf-token\":\"6aLijzntiEwx3rWJ26kfJKEmjO4HNCvlFw7btqzl\",\"x-requested-with\":\"XMLHttpRequest\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/71.0.3578.98 Safari\\/537.36\",\"referer\":\"http:\\/\\/localhost:8000\\/admin\\/users\\/create\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7,de;q=0.6\",\"cookie\":\"SL_G_WPT_TO=ru; SL_GWPT_Show_Hide_tmp=undefined; SL_wptGlobTipTmp=undefined; BL_D_PROV=Google; Phpstorm-9e05da2c=c0ee55e8-3564-4fec-bd1c-728865982c2b; BL_T_PROV=Google; _ga=GA1.1.294944040.1548233716; intercom-id-n2cpz0ku=517ecbde-d1b9-4b0c-a5a7-202948c78881; XSRF-TOKEN=eyJpdiI6IlNiM2lXa08zUFhTRG1pUjdscEpTXC9BPT0iLCJ2YWx1ZSI6IlJvSHlxTHlPTXAxYVpWMTNVcDl5VjdwZk5TM1wvXC9Od0JuRlNjZDBoR3Z6Q3lmZjJIOVR4SnhEUXFGRlRJdVViUSIsIm1hYyI6ImRmNDVlNGYxNzdmMGYxYTE1YWFiMTdjYzk1ZTE5OGE1MzRkNWUxZmE1MGNlZmU3MWFmYjFkNmM5ZDBiYTM3YjIifQ%3D%3D; laravel_session=eyJpdiI6Ijc0ODhieCtVamhhM2hNeFJtUlBIZHc9PSIsInZhbHVlIjoiRXN5aFA3YTZuRTJrQmxDbHhmdjlCaktSRTBWakpNTVwvdDh4SUJtd2N5cTNzVm9QVHJuNU5ObUpNYlwvV3dDN1JYIiwibWFjIjoiZDA2MmMxMzRkOGI3MGY4NjhhNzY2NmM3N2YwNzE3NzI5MDg4NDVhZjFmZGRiYzJjMGNkNTVhN2MyMDAyMjU3YSJ9\"},\"payload\":[],\"session\":{\"_flash\":{\"old\":[],\"new\":[]},\"_token\":\"6aLijzntiEwx3rWJ26kfJKEmjO4HNCvlFw7btqzl\",\"_previous\":{\"url\":\"http:\\/\\/localhost:8000\\/admin\\/users\\/create\"},\"url\":[],\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_status\":200,\"response\":{\"success\":true,\"count\":0},\"duration\":138,\"hostname\":\"SpriteS\",\"user\":{\"id\":1,\"name\":\"\\u0421\\u0442\\u0430\\u043d\\u0438\\u0441\\u043b\\u0430\\u0432\",\"email\":\"admin@admin.com\"}}', '2019-01-31 16:07:48'),
(10, '8ce027be-1c8d-487f-8be0-fe79b94f1200', '8ce027be-2081-4a79-ab38-5b3305da7896', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[1],\"sql\":\"select * from `users` where `id` = ? limit 1\",\"time\":\"0.37\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\app\\\\Http\\\\Middleware\\\\AccessAdminPanel.php\",\"line\":19,\"hostname\":\"SpriteS\"}', '2019-01-31 16:07:53'),
(11, '8ce027be-1dad-4452-a643-96c8722a8af5', '8ce027be-2081-4a79-ab38-5b3305da7896', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[1,1],\"sql\":\"select * from `conversations` where (`user1_id` = ?) or (`user2_id` = ?)\",\"time\":\"0.24\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\app\\\\Http\\\\Controllers\\\\MessagesController.php\",\"line\":263,\"hostname\":\"SpriteS\",\"user\":{\"id\":1,\"name\":\"\\u0421\\u0442\\u0430\\u043d\\u0438\\u0441\\u043b\\u0430\\u0432\",\"email\":\"admin@admin.com\"}}', '2019-01-31 16:07:53'),
(12, '8ce027be-1ef7-4b3e-a975-37ecb63571a3', '8ce027be-2081-4a79-ab38-5b3305da7896', NULL, 1, 'request', '{\"uri\":\"\\/admin\\/messages\\/unread_messages_counter\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\MessagesController@AdminMessagesCounter\",\"middleware\":[\"web\",\"access_admin\"],\"headers\":{\"host\":\"localhost:8000\",\"connection\":\"keep-alive\",\"accept\":\"application\\/json, text\\/javascript, *\\/*; q=0.01\",\"x-csrf-token\":\"6aLijzntiEwx3rWJ26kfJKEmjO4HNCvlFw7btqzl\",\"x-requested-with\":\"XMLHttpRequest\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/71.0.3578.98 Safari\\/537.36\",\"referer\":\"http:\\/\\/localhost:8000\\/admin\\/users\\/create\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7,de;q=0.6\",\"cookie\":\"SL_G_WPT_TO=ru; SL_GWPT_Show_Hide_tmp=undefined; SL_wptGlobTipTmp=undefined; BL_D_PROV=Google; Phpstorm-9e05da2c=c0ee55e8-3564-4fec-bd1c-728865982c2b; BL_T_PROV=Google; _ga=GA1.1.294944040.1548233716; intercom-id-n2cpz0ku=517ecbde-d1b9-4b0c-a5a7-202948c78881; XSRF-TOKEN=eyJpdiI6Ik5MK0cwbU9IemxMRVRSZVpiT0ZEdXc9PSIsInZhbHVlIjoiQWQrOUVKUnBJZlBOTURjcUxRM3hheWd2aTNkRzluNmFzTzFWSHdnUW9CcHVNXC9hejNMMUlEYTU1XC83bE05eTFnIiwibWFjIjoiNTI4ZGFmNjQ5MWZmYzc0OGJhZTgxNDljZDc4OTc5ZTE0NzIzOTYxODU3YjEwOWJiOTQyYzljY2ViYWEzYjc3ZiJ9; laravel_session=eyJpdiI6IlBOSjBtOUgyaUgrY1dTWEZFMFo3RFE9PSIsInZhbHVlIjoiYys1dmllYWVkM3NZd0lJV1VsQmNEdlNnYjF6K1hhdmZrUVwvS1NpaVRLNVZPeXpXUFwvaWM0SGRKZ21TTzJTQVNwIiwibWFjIjoiNGJlNjNkOTZkYWYyZGY5ZTNhNDdkYTQ2N2Y5MTdjMzFkNzQ3ODQ2Yjg3NmJlNzlmM2YzZGI5ZjZiMWUyNmRmMCJ9\"},\"payload\":[],\"session\":{\"_flash\":{\"old\":[],\"new\":[]},\"_token\":\"6aLijzntiEwx3rWJ26kfJKEmjO4HNCvlFw7btqzl\",\"_previous\":{\"url\":\"http:\\/\\/localhost:8000\\/admin\\/users\\/create\"},\"url\":[],\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_status\":200,\"response\":{\"success\":true,\"count\":0},\"duration\":121,\"hostname\":\"SpriteS\",\"user\":{\"id\":1,\"name\":\"\\u0421\\u0442\\u0430\\u043d\\u0438\\u0441\\u043b\\u0430\\u0432\",\"email\":\"admin@admin.com\"}}', '2019-01-31 16:07:53'),
(13, '8ce027c6-3184-4539-9104-2a7c5a0632ec', '8ce027c6-3583-47d7-86b8-eba087993e07', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[1],\"sql\":\"select * from `users` where `id` = ? limit 1\",\"time\":\"0.36\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\app\\\\Http\\\\Middleware\\\\AccessAdminPanel.php\",\"line\":19,\"hostname\":\"SpriteS\"}', '2019-01-31 16:07:58'),
(14, '8ce027c6-3296-496e-8c81-2544c0a4f83f', '8ce027c6-3583-47d7-86b8-eba087993e07', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[1,1],\"sql\":\"select * from `conversations` where (`user1_id` = ?) or (`user2_id` = ?)\",\"time\":\"0.24\",\"slow\":false,\"file\":\"C:\\\\OpenServer\\\\OSPanel\\\\domains\\\\kinder\\\\app\\\\Http\\\\Controllers\\\\MessagesController.php\",\"line\":263,\"hostname\":\"SpriteS\",\"user\":{\"id\":1,\"name\":\"\\u0421\\u0442\\u0430\\u043d\\u0438\\u0441\\u043b\\u0430\\u0432\",\"email\":\"admin@admin.com\"}}', '2019-01-31 16:07:58'),
(15, '8ce027c6-33d7-4ad3-9191-e5a16c876027', '8ce027c6-3583-47d7-86b8-eba087993e07', NULL, 1, 'request', '{\"uri\":\"\\/admin\\/messages\\/unread_messages_counter\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\MessagesController@AdminMessagesCounter\",\"middleware\":[\"web\",\"access_admin\"],\"headers\":{\"host\":\"localhost:8000\",\"connection\":\"keep-alive\",\"accept\":\"application\\/json, text\\/javascript, *\\/*; q=0.01\",\"x-csrf-token\":\"6aLijzntiEwx3rWJ26kfJKEmjO4HNCvlFw7btqzl\",\"x-requested-with\":\"XMLHttpRequest\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/71.0.3578.98 Safari\\/537.36\",\"referer\":\"http:\\/\\/localhost:8000\\/admin\\/users\\/create\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7,de;q=0.6\",\"cookie\":\"SL_G_WPT_TO=ru; SL_GWPT_Show_Hide_tmp=undefined; SL_wptGlobTipTmp=undefined; BL_D_PROV=Google; Phpstorm-9e05da2c=c0ee55e8-3564-4fec-bd1c-728865982c2b; BL_T_PROV=Google; _ga=GA1.1.294944040.1548233716; intercom-id-n2cpz0ku=517ecbde-d1b9-4b0c-a5a7-202948c78881; XSRF-TOKEN=eyJpdiI6Ik5LQ0V5dGtsVFVXcllDSnY1b3FiSlE9PSIsInZhbHVlIjoiVXVmdWgxSkFLZ0RZUGZlU041VW5ReGlFZlRlRzBGcWVKd3lydHZudzUwUFVZM1RhMHQ3TXRxZEhhMGlPUFA4NiIsIm1hYyI6Ijg2N2JkYWRlNzEwMGM5YjNiMGViN2Y0Y2M5YTg5MmQwNWE2NGNhNTNhMDcxMmQ0OTQ4N2M5YzI3ZDhmMmQ2NzEifQ%3D%3D; laravel_session=eyJpdiI6Im0zd0dJMlYwaEFnOFZ6OUVkaWo3Y0E9PSIsInZhbHVlIjoiRGNiZG8yY3plcFJLUFdiNUlpSjRPSU9WK2dkajMrZDRzekJGbmVkcHJSQWNFNVJMeUNaUXZKQkFYZ1Y1YzBEbSIsIm1hYyI6IjEwYzI1OWJiMzcwM2M5MzQzMTM2M2ZlYmZhNzFmYWZjNDM1ZmI1ZTlhMWJhMWExMWJhMDY5OTliZjUyZjU1YTIifQ%3D%3D\"},\"payload\":[],\"session\":{\"_flash\":{\"old\":[],\"new\":[]},\"_token\":\"6aLijzntiEwx3rWJ26kfJKEmjO4HNCvlFw7btqzl\",\"_previous\":{\"url\":\"http:\\/\\/localhost:8000\\/admin\\/users\\/create\"},\"url\":[],\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_status\":200,\"response\":{\"success\":true,\"count\":0},\"duration\":117,\"hostname\":\"SpriteS\",\"user\":{\"id\":1,\"name\":\"\\u0421\\u0442\\u0430\\u043d\\u0438\\u0441\\u043b\\u0430\\u0432\",\"email\":\"admin@admin.com\"}}', '2019-01-31 16:07:58');

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
('8ce027ae-e86a-470c-9210-5ca9af4791ed', 'Auth:1'),
('8ce027ae-e9d0-4ac0-a559-324e20071bfe', 'Auth:1'),
('8ce027b6-f996-4d44-997c-a106a3fb5df3', 'Auth:1'),
('8ce027b6-fae1-4770-80fc-15c55eff47aa', 'Auth:1'),
('8ce027be-1dad-4452-a643-96c8722a8af5', 'Auth:1'),
('8ce027be-1ef7-4b3e-a975-37ecb63571a3', 'Auth:1'),
('8ce027c6-3296-496e-8c81-2544c0a4f83f', 'Auth:1'),
('8ce027c6-33d7-4ad3-9191-e5a16c876027', 'Auth:1');

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
(1, 'Станислав', 'Kayleigh Lindgren', '1-441-584-8450 x492', 'mother', '99283 Mabelle Point\nKemmerfort, CT 84668-6796', '1987-10-19', NULL, NULL, NULL, 'active', 'admin@admin.com', '2019-01-31 14:05:28', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'J6ZXB', 'disabled', NULL, 'admin', 'djBz5z6Zyx', NULL, NULL);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `sequence` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
