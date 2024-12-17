-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-12-2024 a las 16:40:51
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pruebapubli`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignar`
--

CREATE TABLE `asignar` (
  `iddetalle` int NOT NULL,
  `empleadoid` int NOT NULL,
  `tareaid` int NOT NULL,
  `fecha` date NOT NULL,
  `created_at` timestamp NOT NULL,
  `update_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id` int NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `correo` varchar(70) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id`, `nombre`, `correo`, `fechaNacimiento`, `created_at`, `updated_at`) VALUES
(1, 'Juan Péres', 'juan.perez@example.com', '1990-01-01', '2024-12-14 22:15:57', '2024-12-17 00:48:15'),
(2, 'Julio Villanueva', 'julio@example.com', '2001-09-12', '2024-12-14 22:17:51', '2024-12-14 22:17:51'),
(3, 'John Doe', 'johndoe@example.com', '1990-01-01', '2024-12-17 01:58:49', '2024-12-17 01:58:49'),
(5, 'Ruth Nuñes', 'ruth@example.com', '2003-05-19', '2024-12-17 02:28:11', '2024-12-17 02:28:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_12_14_054421_create_personal_access_tokens_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 2, 'api-key', 'f0516800058b7977fedb74e007210b93f53a0dd511d2457395df47c440b56492', '[\"*\"]', NULL, NULL, '2024-12-14 23:58:47', '2024-12-14 23:58:47'),
(2, 'App\\Models\\User', 2, 'api-key', '2e8cb314ca15adbb468d1c263e634f6e2d5135383d0371023b38ef2908601d47', '[\"*\"]', NULL, NULL, '2024-12-15 01:38:35', '2024-12-15 01:38:35'),
(3, 'App\\Models\\User', 2, 'api-key', '856d2463c76d0cb3464816a4c18ecf1d8a1a905ea72f425c8cf3eb267d0c8a39', '[\"*\"]', '2024-12-15 01:50:43', NULL, '2024-12-15 01:46:11', '2024-12-15 01:50:43'),
(4, 'App\\Models\\User', 3, 'api-key', '34c81494f41509b56e7a125460b6bfcbef5fa380c55c5c4c909cd0b96374d1d9', '[\"*\"]', NULL, NULL, '2024-12-17 05:18:17', '2024-12-17 05:18:17'),
(5, 'App\\Models\\User', 3, 'api-key', 'eff6ce2262ef92354f99539e1da6bd5aca37a0441f69b935f1e24ec3071ebb5b', '[\"*\"]', NULL, NULL, '2024-12-17 05:19:57', '2024-12-17 05:19:57'),
(6, 'App\\Models\\User', 3, 'api-key', 'f47f85d6c9b09004b1fc406f1e986ca2dfd88c701cb92e3ffb1bb1f79bdeac90', '[\"*\"]', NULL, NULL, '2024-12-17 05:26:31', '2024-12-17 05:26:31'),
(7, 'App\\Models\\User', 3, 'api-key', '8ea869662cfdad05a008e01f485f52f37cf21705ccb03291826cb83b57f3aaab', '[\"*\"]', NULL, NULL, '2024-12-17 05:27:17', '2024-12-17 05:27:17'),
(8, 'App\\Models\\User', 3, 'api-key', 'c0553bca16d3d425044e45472862420b84ada8ad5a70e98e9d8821573afaa308', '[\"*\"]', NULL, NULL, '2024-12-17 05:43:09', '2024-12-17 05:43:09'),
(9, 'App\\Models\\User', 3, 'api-key', 'b76cac09080227564f958204f7172aed90f3b17fe17d7cf9320c52a0107e67b8', '[\"*\"]', NULL, NULL, '2024-12-17 05:53:46', '2024-12-17 05:53:46'),
(10, 'App\\Models\\User', 3, 'api-key', 'e5e8b3206042ea0ee63c721e40465064939bbd24ab23a0b4015dcd1c545e7e3a', '[\"*\"]', '2024-12-17 06:55:20', NULL, '2024-12-17 06:40:18', '2024-12-17 06:55:20'),
(11, 'App\\Models\\User', 3, 'api-key', 'c67b74e4bee9e1e703a0e3fcb8e7bc68b8e27b3b18c713c90304f27c2267b620', '[\"*\"]', NULL, NULL, '2024-12-17 06:55:58', '2024-12-17 06:55:58'),
(12, 'App\\Models\\User', 3, 'api-key', 'e18fd0a722631e66333d54cd7f0f51c4e63052a141ddb8411611262fae1084a2', '[\"*\"]', '2024-12-17 08:24:32', NULL, '2024-12-17 08:24:26', '2024-12-17 08:24:32'),
(13, 'App\\Models\\User', 3, 'api-key', '3b6a44e6f518d9c475a39e97c9f83ccf0db67c67402665e990aa469bb8887c19', '[\"*\"]', '2024-12-17 08:35:36', NULL, '2024-12-17 08:35:30', '2024-12-17 08:35:36'),
(14, 'App\\Models\\User', 4, 'api-key', '08ea996d6496ce81f5b66969c2dc06bad2b11955237f37fea7491ec645cccc82', '[\"*\"]', NULL, NULL, '2024-12-17 08:38:14', '2024-12-17 08:38:14'),
(15, 'App\\Models\\User', 4, 'api-key', '9ce6279bd92ca715ad3edd9950051c33df1e7df7d6e0e036dbe6be1db91efb9e', '[\"*\"]', '2024-12-17 11:09:34', NULL, '2024-12-17 08:38:37', '2024-12-17 11:09:34'),
(16, 'App\\Models\\User', 3, 'api-key', '82b874db29720c1fae0d667e3560eca03b211ddcdfdeca4eb24890f643ae08e1', '[\"*\"]', NULL, NULL, '2024-12-17 09:07:44', '2024-12-17 09:07:44'),
(17, 'App\\Models\\User', 3, 'api-key', '2e5d36daa3f61dc3a1c4ec415107d562894e928e175f76a606f1feb4647431ae', '[\"*\"]', '2024-12-17 21:39:27', NULL, '2024-12-17 09:16:08', '2024-12-17 21:39:27'),
(18, 'App\\Models\\User', 3, 'api-key', '12704050ff6e2f3ba058909b4af28cb221955df1ad41bd3f280063a4beae01dc', '[\"*\"]', '2024-12-17 11:16:16', NULL, '2024-12-17 11:10:11', '2024-12-17 11:16:16'),
(19, 'App\\Models\\User', 3, 'api-key', '3bddf70eb3fd118e7f890da7fa40dab3c419f581c3c672d7c82567744b742111', '[\"*\"]', '2024-12-17 21:39:16', NULL, '2024-12-17 21:26:29', '2024-12-17 21:39:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('gDBy6ijZy7mHUufBvPxdx8rpAdL3Sjbm6Wabv7mq', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRmNudlFaNUpNYVJuVFlNbUFQNDMzczVoMG5NYmR0Zmcxc3Y2ZDV2USI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734309658),
('gPOVUfC6eYo3kRg2xS6fddzsqXNO8XAajrQWENsU', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSGhieFhMZEJadjN2UXYxNGVqS2Q1U01wSFhMaHVBSmFXUDBKU0ZnTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734199121),
('miULmM7KhfWwOlUBY97dQI5JmyE10owZEGaa2fne', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiQ292SjNJdFJ4VjBRbzVmMFUyZVBZTmx2M090NklGa05EdjF6eWlmMSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1734156582),
('mMaGugjTwdoYKc11PWI2O6j35f4mSoGGVimL8tBo', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoib1ZMcW9rRUNweGd3cWwzQWUyMVg2bGpTOFhOYnYyNjVyVUF5VTBUWSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1734127991);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `descripcion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `estado` enum('pendiente','completado') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'pendiente',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`id`, `name`, `descripcion`, `estado`, `created_at`, `updated_at`) VALUES
(4, 'Control de Calidad', 'Realizar pruebas unitarias a la aplicacion y tambien testeo a la api.', 'pendiente', '2024-12-16 11:36:46', '2024-12-16 11:36:46'),
(6, 'Base de datos', 'Tenemos que hacer una base de datos que cumpla con el programa', 'pendiente', '2024-12-17 09:37:57', '2024-12-17 21:29:21'),
(7, 'Nueva tarea', 'Descripción de la tarea', 'pendiente', '2024-12-17 21:39:27', '2024-12-17 21:39:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Prueba', 'prueba@example.com', NULL, '$2y$12$QOhJ3Rtu9ybpp4wVIm9sT.euUpUsgUv.uj3A8O//kvjGAtIt3o9CK', NULL, '2024-12-14 23:58:47', '2024-12-14 23:58:47'),
(3, 'Carlos Olivares', 'carlos@example.com', NULL, '$2y$12$k3Gte/mWwlSlKmf1s.L9Gu8hFJVbQH4WKbl5LTgLh4pJlC5gm5ZHi', NULL, '2024-12-17 05:18:16', '2024-12-17 05:18:16'),
(4, 'Eduardo Ramirez', 'eduardo@example.com', NULL, '$2y$12$MTAKoZ4PljcUPKi1gZaZB.TTX4WqGmmyjLWL9s8nXjk2KhgyDmc62', NULL, '2024-12-17 08:38:14', '2024-12-17 08:38:14');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignar`
--
ALTER TABLE `asignar`
  ADD PRIMARY KEY (`iddetalle`),
  ADD KEY `fk_empleado` (`empleadoid`),
  ADD KEY `fk_tarea` (`tareaid`);

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignar`
--
ALTER TABLE `asignar`
  MODIFY `iddetalle` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignar`
--
ALTER TABLE `asignar`
  ADD CONSTRAINT `fk_empleado` FOREIGN KEY (`empleadoid`) REFERENCES `empleado` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_tarea` FOREIGN KEY (`tareaid`) REFERENCES `tareas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
