-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Фев 14 2019 г., 11:16
-- Версия сервера: 10.1.26-MariaDB-0+deb9u1
-- Версия PHP: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `8_dev_kit_ru_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('admin','moderator','default') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `parent_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parents` enum('father','mother') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `push` enum('enabled','disabled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `player_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `push_chat` enum('true','false') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `status` enum('active','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `type`, `token`, `school_id`, `group_id`, `parent_name`, `parent_phone`, `parents`, `address`, `birthday`, `avatar`, `email`, `email_verified_at`, `password`, `push`, `player_id`, `push_chat`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Станислав', 'admin', 'mNPxN', NULL, NULL, 'Forest McCullough', '(642) 962-4696 x049', 'father', '5567 Annabelle Brooks\nEast Dejah, AR 36878', '2002-09-21', NULL, 'admin@admin.com', '2019-02-08 12:11:48', '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', 'disabled', NULL, 'true', 'active', '31QIY1earl1IIlwfFwqMDXT06WicEEFr2LYRzOAXdfzgbuRLIaEgfq5L0okR', NULL, NULL),
(15, 'Ольга Тарасівна', 'moderator', '$2y$10$71RN39dxgrY94VgrE1NsCeuOZZ5KU9LsShmK4qOl8KUucV1cWkb6K', 3, 3, NULL, NULL, NULL, NULL, '2019-02-04', NULL, 'test@admin.com', NULL, '$2y$10$3wgO6ZgAWlF94oE5.PPS1O9yqbFBx4kC0hRUMtZ3ub1g9WWfV9/j6', 'enabled', NULL, 'true', 'active', NULL, '2019-02-12 07:36:04', '2019-02-12 07:36:25'),
(16, 'Катерина Іванівна', 'moderator', '$2y$10$mEOBzI0OaVDsZb/Cu1XuV.UWPDKJ3UKz5w5a5i7ZXHpIwjZ/lCZbC', 3, 4, NULL, NULL, NULL, NULL, '2018-08-08', NULL, 'sadok@skoryny.com', NULL, '$2y$10$J2Qzuq1PVpWOwJENe7jiNeLRn38rmnmq3X6yz/mw72ATE6Wo6dPrG', 'enabled', NULL, 'true', 'active', NULL, '2019-02-12 07:38:34', '2019-02-12 07:38:54'),
(17, 'Леся Петрівна', 'moderator', '$2y$10$.h.HFBha80pWko8VRf3thOUV5BHrrGu2gRv23395LKGqDTeqQOrFa', 3, 5, NULL, NULL, NULL, NULL, '2018-11-07', NULL, 'sad@dsd.com', NULL, '$2y$10$5tTWXBVGWxHkNLP3XlRM.OwqjSsusSbCY92WoOmVcxRZ.ukkdOueC', 'enabled', NULL, 'true', 'active', NULL, '2019-02-12 07:40:11', '2019-02-12 07:41:01'),
(18, 'Галина Василівна', 'moderator', '$2y$10$1vh3jMWKCT9oBS5XDlv89.bxE2vg3REOQmcKMG3IYWF5bzIJ1rcVS', 3, 5, NULL, NULL, NULL, NULL, '2018-08-06', NULL, 'gal@gal.com', NULL, '$2y$10$k/pXVBwWdFfG1r9ShLlWI.Am5atOoaQhkRRiakynWcVGGcjdqXU3S', 'enabled', NULL, 'true', 'active', NULL, '2019-02-12 07:40:41', '2019-02-12 07:41:01'),
(19, 'tester', 'default', '$2y$10$qR5pechuIDNvIjwuBUEhhesdjM8lyBupf7Ymf5aEPWXYUDDsnoeni', 4, 6, 'Тестер', '+38(012)-59-12-511', 'father', 'tester', '2018-10-05', '/images/uploads/avatars/1550044820-5c63ce94a2e52.png', 'test@test.com', NULL, '$2y$10$t/ZX4RwDLwnLjM4Uvp4T9OB.y9ENQnhq5bfzO0e0enU7eGM5H3A5.', 'enabled', '1b96389f-51aa-4e8f-83a2-0f21ca926831', 'true', 'active', NULL, '2019-02-12 07:42:36', '2019-02-13 14:44:05'),
(20, 'Софійка', 'default', '$2y$10$Ly3S1KXch6BR.a.Pg8vF4ODoIFea1ZngREAAa3q3.GEl.qeGIaB/i', 3, 3, 'Покора Олена Миронівна', '+38(063)-78-95-246', 'mother', NULL, '2019-02-01', NULL, 'olenka@admin.com', NULL, '$2y$10$SzcYykbsaRhU8wsm0zyU9e8e5.q2sxV243e8C6Eyd20LAqsgOjTCy', 'enabled', '5725f8e5-4972-4111-9a94-f754f29e17c4', 'true', 'active', NULL, '2019-02-12 07:54:45', '2019-02-12 07:55:28'),
(21, 'Тестовый воспитатель', 'moderator', '$2y$10$FF5fwPat468q7/I7D3Ozy.Hzgfk7Yi.SUpudbAT2PmlxSQWdIZkXG', 4, 6, NULL, NULL, NULL, NULL, '2016-01-01', NULL, 'test@moderator.com', NULL, '$2y$10$vBQpi5/uCKuPVVvx0aIxIu5tbj1nXSmTYxFCwjDqb0mTHm1ZXMkVG', 'enabled', '3416a924-0052-48a3-bf49-781c3a313ad9', 'true', 'active', NULL, '2019-02-12 10:11:51', '2019-02-12 13:12:38'),
(22, 'Дитина', 'default', '$2y$10$fru3H/tUI7QcDTrJrOzzA.oj04LSc7VF/mRb7RFqTovTLIGct1Y5u', 3, 3, 'Покора Олена', '+38(069)-54-21-854', 'father', NULL, '2019-02-01', NULL, 'olenka@sadok.com', NULL, '$2y$10$TnE7pUFpHHILY.dXTrQt8eL8BQJftfFZFx8CLucBXjVxphdK3p.RC', 'enabled', '5725f8e5-4972-4111-9a94-f754f29e17c4', 'true', 'active', NULL, '2019-02-12 11:49:22', '2019-02-12 11:49:54'),
(23, 'Aleksandr_do_not_delete_pls', 'default', '$2y$10$EeuwAiFF.P1lHEylveJsQOWI2NQn/LNd3I2HiQsNilmYI4l1lOB6y', 4, 6, 'Aleksandr', '+38(023)-12-31-231', 'father', NULL, '2044-12-12', NULL, 'test@admin.ua', NULL, '$2y$10$jl/rRAjKN7vyZDeRB.w1g.5oKPuvmx5D5SCLDYjIAbrN60rtW3m26', 'enabled', NULL, 'true', 'active', NULL, '2019-02-13 08:10:49', '2019-02-13 14:21:01');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_token_unique` (`token`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_parent_phone_unique` (`parent_phone`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
