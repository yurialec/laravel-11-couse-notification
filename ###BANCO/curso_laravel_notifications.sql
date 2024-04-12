-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 12-Abr-2024 às 00:27
-- Versão do servidor: 5.7.40
-- versão do PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `curso_laravel_notifications`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `comments_title_unique` (`title`),
  KEY `comments_post_id_foreign` (`post_id`),
  KEY `comments_user_id_foreign` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_04_11_233809_create_posts_table', 1),
(5, '2024_04_11_234656_create_comments_table', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_title_unique` (`title`),
  KEY `posts_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `body`, `created_at`, `updated_at`) VALUES
(1, 1, 'rerum', 'Rerum libero magni omnis.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(2, 1, 'assumenda', 'Repellendus sed voluptatum aliquid voluptas voluptatem.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(3, 1, 'harum', 'Ut eius qui illo ut necessitatibus est odit.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(4, 1, 'nam', 'Natus dolores et dicta est.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(5, 1, 'illo', 'Modi fuga aut libero perferendis.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(6, 1, 'dignissimos', 'Aperiam perferendis et deleniti.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(7, 1, 'amet', 'Omnis aut blanditiis recusandae et blanditiis consequatur illo.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(8, 1, 'ut', 'Corrupti quia quia porro quia aspernatur illum eos doloribus.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(9, 1, 'nobis', 'Iusto quae aliquam voluptatibus quibusdam non.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(10, 1, 'enim', 'Ea sed maxime enim ab officiis inventore voluptatem.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(11, 1, 'velit', 'Dicta voluptatem non earum accusantium molestiae nesciunt quas.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(12, 1, 'ab', 'Natus voluptate inventore ut provident labore est ut.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(13, 1, 'accusamus', 'Voluptatibus eius sed praesentium nulla voluptas inventore.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(14, 1, 'hic', 'Nemo temporibus animi qui omnis incidunt.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(15, 1, 'qui', 'Est repellat ipsum vero laboriosam.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(16, 1, 'mollitia', 'Sit qui ut et sit consequatur.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(17, 1, 'dolorem', 'Deleniti ea necessitatibus et quo ipsam et omnis.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(18, 1, 'consequuntur', 'Aspernatur illum aut temporibus quo neque voluptatem esse suscipit.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(19, 1, 'cumque', 'Placeat vel sint voluptate explicabo rem.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(20, 1, 'facilis', 'Rerum fuga sed quae ut non.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(21, 1, 'totam', 'Labore perspiciatis ut eos velit debitis omnis.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(22, 1, 'cupiditate', 'Quaerat doloribus odio laborum incidunt porro illum.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(23, 1, 'eaque', 'Necessitatibus asperiores enim eveniet nobis aut et quasi sit.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(24, 1, 'animi', 'Mollitia iusto atque fugiat ipsa.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(25, 1, 'doloremque', 'Architecto beatae aut cumque et numquam.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(26, 1, 'error', 'Consequuntur et doloremque esse dolor.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(27, 1, 'earum', 'Iure veniam recusandae molestiae cupiditate at at omnis.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(28, 1, 'aspernatur', 'Cupiditate cupiditate porro placeat possimus dolor eaque.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(29, 1, 'veniam', 'Libero eligendi voluptatem consectetur dolorum ea accusantium.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(30, 1, 'facere', 'Eius nulla aut deleniti aut qui sequi quaerat.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(31, 1, 'aut', 'Numquam voluptatibus enim enim rerum sint enim.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(32, 1, 'et', 'Nulla aut omnis inventore vitae at amet id aut.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(33, 1, 'quae', 'Est delectus harum minus voluptas praesentium qui magnam similique.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(34, 1, 'expedita', 'Omnis aut nam sequi ea.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(35, 1, 'consequatur', 'Et sed quia modi ullam.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(36, 1, 'sunt', 'Deserunt omnis assumenda nemo assumenda aliquid libero atque.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(37, 1, 'sint', 'Eos sed inventore dolorum facilis sit quis eligendi.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(38, 1, 'a', 'Omnis enim sint est quae eveniet.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(39, 1, 'eligendi', 'Et asperiores quibusdam consequatur dolores.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(40, 1, 'nesciunt', 'Aut aspernatur officiis eos accusantium.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(41, 1, 'architecto', 'Aut fuga incidunt et sunt a illum in.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(42, 1, 'omnis', 'Earum dolor soluta qui suscipit accusantium possimus dolor quasi.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(43, 1, 'blanditiis', 'Quaerat enim aliquid animi sunt.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(44, 1, 'eos', 'Inventore eligendi minus quisquam eveniet atque asperiores corporis.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(45, 1, 'odit', 'Aliquam amet libero eveniet eligendi voluptate enim sit.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(46, 1, 'eveniet', 'Neque consequatur distinctio nam iusto.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(47, 1, 'possimus', 'In earum nulla perferendis cupiditate similique recusandae.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(48, 1, 'minus', 'Architecto maiores autem sed aut nam ea animi perferendis.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(49, 1, 'corrupti', 'Quis suscipit consequatur odio architecto numquam.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(50, 1, 'numquam', 'Cumque quia provident aspernatur assumenda voluptatem nesciunt.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(51, 1, 'maiores', 'Nesciunt qui molestiae similique et dolores.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(52, 1, 'iure', 'Numquam et occaecati voluptas itaque sint dolor impedit.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(53, 1, 'veritatis', 'Repudiandae deserunt culpa porro accusantium laborum et.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(54, 1, 'dolor', 'Et cumque animi itaque et facere qui id.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(55, 1, 'officiis', 'Et cupiditate numquam rem rerum.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(56, 1, 'voluptatem', 'Nobis ullam voluptatem voluptatibus atque.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(57, 1, 'provident', 'Omnis quidem et aut quod excepturi ea veritatis non.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(58, 1, 'quia', 'Hic fugiat similique ipsa quas.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(59, 1, 'quo', 'Et rem repudiandae quo sunt rerum fugit blanditiis.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(60, 1, 'aperiam', 'Necessitatibus voluptatem non et ad assumenda.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(61, 1, 'dolores', 'Dolores inventore dicta quibusdam.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(62, 1, 'repudiandae', 'Distinctio ut aliquid perferendis consequatur inventore sed quia.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(63, 1, 'voluptates', 'Voluptatem cupiditate natus hic aut.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(64, 1, 'illum', 'Doloremque repellat facere ratione libero.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(65, 1, 'maxime', 'Eos nulla provident et aperiam.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(66, 1, 'praesentium', 'Ea qui dolores facilis quia.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(67, 1, 'sed', 'Asperiores impedit dolorum sed qui quaerat quod perspiciatis.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(68, 1, 'reiciendis', 'Et eum quia veniam possimus quo voluptatem eos.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(69, 1, 'libero', 'Odit omnis illum aut minima et eum porro.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(70, 1, 'ad', 'Impedit labore quia mollitia.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(71, 1, 'iste', 'Dolorum ab quia hic voluptatem deserunt.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(72, 1, 'doloribus', 'Ut et in aut dolorem.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(73, 1, 'reprehenderit', 'Eum deserunt dolores excepturi mollitia.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(74, 1, 'sit', 'Sint reiciendis et dolorum necessitatibus vero.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(75, 1, 'dicta', 'Facere est possimus recusandae dolores dolor delectus natus.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(76, 1, 'ipsum', 'Soluta qui similique animi officia molestiae laboriosam.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(77, 1, 'tempora', 'Cupiditate aliquam sit ut saepe rerum.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(78, 1, 'molestias', 'Aut voluptatem voluptatem repellendus quod perspiciatis.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(79, 1, 'minima', 'Nihil provident neque est odio.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(80, 1, 'dolorum', 'Harum explicabo autem quibusdam.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(81, 1, 'necessitatibus', 'Assumenda qui quod officia voluptatum ex.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(82, 1, 'fugiat', 'Nobis consectetur amet qui totam tempore sint.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(83, 1, 'laudantium', 'Omnis in dignissimos quam sunt exercitationem voluptatum.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(84, 1, 'tenetur', 'Iure voluptas in officiis.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(85, 1, 'est', 'Voluptatem autem nesciunt soluta consequatur.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(86, 1, 'placeat', 'Adipisci ut rerum voluptates repudiandae velit.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(87, 1, 'molestiae', 'Temporibus quo et sunt nam recusandae cumque qui.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(88, 1, 'ea', 'Enim dolorem quae adipisci repellat deleniti.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(89, 1, 'nihil', 'Non aut dolor sunt et voluptatum consequuntur repellat.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(90, 1, 'laboriosam', 'Laudantium quibusdam similique ullam vero quibusdam omnis assumenda.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(91, 1, 'culpa', 'Eum natus qui omnis velit autem.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(92, 1, 'modi', 'Quam non ut quis sunt vel tempora itaque.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(93, 1, 'labore', 'Qui ipsa quis officia labore perspiciatis.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(94, 1, 'recusandae', 'Non sequi corrupti qui voluptatem praesentium deleniti corporis aut.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(95, 1, 'voluptas', 'Et ullam sequi similique voluptas.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(96, 1, 'nulla', 'Et pariatur sunt et excepturi facere neque cum.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(97, 1, 'asperiores', 'Et sed eveniet ex ut autem culpa quaerat.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(98, 1, 'alias', 'Nihil at id veritatis adipisci similique saepe quidem ipsam.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(99, 1, 'eum', 'Delectus quidem a aut iure sunt.', '2024-04-12 03:14:29', '2024-04-12 03:14:29'),
(100, 1, 'fugit', 'Debitis eveniet et laborum amet.', '2024-04-12 03:14:29', '2024-04-12 03:14:29');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('QME6jgEdovjbz6IjeBtVlT7kZ27uDAIOzJmtP3VI', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRk9PaEdBaDRQenQxYTVLT0ExTUE3MmdRcXl0T1VrRW13NDZleGxiaiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fX0=', 1712881432);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Yuri Chagas', 'yuri.chagas@gmail.com', NULL, '$2y$12$Cfo8wZW8NUblIu7sTYWAAelaAx4lD1eDhrH3OHzRaPVjddhf45WLm', NULL, '2024-04-12 03:14:29', '2024-04-12 03:14:29');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
