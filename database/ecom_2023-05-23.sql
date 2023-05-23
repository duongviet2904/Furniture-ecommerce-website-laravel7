# ************************************************************
# Sequel Ace SQL dump
# Version 20046
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: localhost (MySQL 5.7.41)
# Database: ecom
# Generation Time: 2023-05-23 10:02:27 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table banners
# ------------------------------------------------------------

DROP TABLE IF EXISTS `banners`;

CREATE TABLE `banners` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `banners_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`)
VALUES
	(1,'BESPOKE','lorem-ipsum-is','/storage/photos/1/Banner_1.jpeg','<h1><b style=\"color: rgb(239, 239, 239);\">ECOMMERCIAL FURNITURE</b></h1>','active','2020-08-14 08:47:38','2023-04-30 12:23:35'),
	(2,'Lorem Ipsum','lorem-ipsum','/storage/photos/1/Banner_2.jpeg','<p>Up to 90%</p>','active','2020-08-14 08:50:23','2023-04-27 19:51:22'),
	(4,'Banner','banner','/storage/photos/1/Banner_3.jpeg','<h2><span style=\"color: rgb(156, 0, 255); font-size: 2rem; font-weight: bold;\">Up to 40%</span><br></h2><h2><span style=\"color: rgb(156, 0, 255);\"></span></h2>','active','2020-08-18 03:46:59','2023-04-27 19:51:29');

/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table brands
# ------------------------------------------------------------

DROP TABLE IF EXISTS `brands`;

CREATE TABLE `brands` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brands_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`)
VALUES
	(1,'Ikie','ikie','active','2020-08-14 11:23:00','2020-08-14 11:23:00'),
	(2,'Hoa phat','hoa-phat','active','2020-08-14 11:23:08','2020-08-14 11:23:08');

/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table carts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `carts`;

CREATE TABLE `carts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `import_price` double(8,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_product_id_foreign` (`product_id`),
  KEY `carts_user_id_foreign` (`user_id`),
  KEY `carts_order_id_foreign` (`order_id`),
  CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`, `import_price`)
VALUES
	(18,13,10,30,94.05,'new',3,292.05,'2023-05-04 08:38:31','2023-05-18 15:32:46',NULL),
	(19,11,7,31,89.10,'new',1,89.10,'2023-05-17 16:44:40','2023-05-17 16:45:25',NULL),
	(20,13,9,31,94.05,'new',1,94.05,'2023-05-17 16:45:59','2023-05-17 16:46:29',NULL),
	(21,13,NULL,31,94.05,'new',1,94.05,'2023-05-17 16:52:44','2023-05-17 16:52:44',NULL),
	(22,12,NULL,1,107.10,'new',1,107.10,'2023-05-17 16:59:24','2023-05-17 16:59:24',NULL),
	(23,17,10,30,113.05,'new',1,113.05,'2023-05-18 15:32:03','2023-05-18 15:32:46',NULL),
	(24,15,11,30,89.10,'new',1,89.10,'2023-05-18 15:33:56','2023-05-18 15:35:13',NULL),
	(25,11,12,30,89.10,'new',1,89.10,'2023-05-19 14:24:25','2023-05-19 14:35:46',NULL),
	(26,13,12,30,94.05,'new',1,94.05,'2023-05-19 14:24:41','2023-05-19 14:35:46',NULL),
	(27,18,12,30,89.00,'new',1,89.00,'2023-05-19 14:24:47','2023-05-19 14:35:46',NULL),
	(28,18,13,30,89.00,'new',1,89.00,'2023-05-19 20:11:33','2023-05-19 20:11:57',NULL),
	(29,17,14,30,113.05,'new',1,113.05,'2023-05-19 20:18:27','2023-05-19 20:19:52',NULL),
	(30,22,15,30,161.10,'new',1,161.10,'2023-05-19 20:26:39','2023-05-19 20:27:23',NULL),
	(31,21,16,30,133.44,'new',1,133.44,'2023-05-19 20:29:21','2023-05-19 20:29:50',NULL),
	(32,23,28,30,189.05,'new',1,189.05,'2023-05-20 10:27:14','2023-05-20 14:45:56',99.00),
	(33,17,19,30,113.05,'new',1,113.05,'2023-05-20 10:27:36','2023-05-20 10:48:20',70.00),
	(34,19,25,30,122.55,'new',1,122.55,'2023-05-20 14:07:41','2023-05-20 14:22:36',80.00),
	(35,17,26,30,113.05,'new',1,113.05,'2023-05-20 14:39:46','2023-05-20 14:40:13',70.00),
	(36,22,29,30,161.10,'new',1,161.10,'2023-05-20 14:54:09','2023-05-20 14:54:54',109.00),
	(37,15,30,30,89.10,'new',1,89.10,'2023-05-20 15:02:56','2023-05-20 15:03:17',50.00),
	(38,18,31,30,89.00,'new',1,89.00,'2023-05-20 15:05:32','2023-05-20 15:05:51',50.00),
	(39,15,32,30,89.10,'new',1,89.10,'2023-05-20 16:22:19','2023-05-20 16:24:06',50.00),
	(40,20,32,30,146.64,'new',1,146.64,'2023-05-20 16:23:38','2023-05-20 16:24:06',100.00),
	(41,18,33,30,89.00,'new',1,89.00,'2023-05-20 16:27:34','2023-05-20 16:27:54',50.00),
	(42,21,34,30,133.44,'new',1,133.44,'2023-05-21 02:45:37','2023-05-21 02:47:25',89.00),
	(43,20,34,30,146.64,'new',1,146.64,'2023-05-21 02:46:52','2023-05-21 02:47:25',100.00),
	(44,22,NULL,30,161.10,'new',1,161.10,'2023-05-21 02:50:45','2023-05-21 02:50:45',109.00),
	(45,20,NULL,30,146.64,'new',1,146.64,'2023-05-21 02:50:49','2023-05-21 02:50:49',100.00);

/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `added_by` bigint(20) unsigned DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  KEY `categories_added_by_foreign` (`added_by`),
  CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`)
VALUES
	(1,'SEATING','seating',NULL,'/storage/photos/1/cate_seating.png',1,NULL,NULL,'active','2020-08-14 11:26:15','2023-04-30 08:57:45'),
	(2,'TABLES','tables',NULL,'/storage/photos/1/cate_tables.png',1,NULL,NULL,'active','2020-08-14 11:26:40','2023-04-30 08:58:02'),
	(4,'chair','chairt','<p>chair</p>',NULL,0,1,NULL,'active','2020-08-14 11:32:14','2023-05-17 16:11:15'),
	(5,'Tables','table',NULL,NULL,0,2,NULL,'active','2020-08-14 11:32:49','2023-05-17 16:11:21'),
	(12,'LOUNGES','lounges',NULL,'/storage/photos/1/cate_lounges.png',1,NULL,NULL,'active','2023-04-30 08:58:38','2023-04-30 08:58:38'),
	(13,'STOOLS','lounges-2305171211-676','<p>stools</p>','/storage/photos/1/cate_stools.png',1,NULL,NULL,'active','2023-05-17 16:12:11','2023-05-21 01:01:10'),
	(14,'test','test','<p>test</p>','/storage/photos/1/Banner_1.jpeg',1,NULL,NULL,'inactive','2023-05-21 00:44:27','2023-05-21 00:44:47');

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table coupons
# ------------------------------------------------------------

DROP TABLE IF EXISTS `coupons`;

CREATE TABLE `coupons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupons_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`)
VALUES
	(1,'free_ship','fixed',10.00,'active',NULL,'2023-05-20 12:16:34'),
	(2,'hot_summber','percent',10.00,'active',NULL,'2023-05-20 12:16:49'),
	(5,'abcd','fixed',250.00,'inactive','2020-08-18 03:54:58','2023-05-20 12:16:57');

/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table messages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;

INSERT INTO `messages` (`id`, `name`, `subject`, `email`, `photo`, `phone`, `message`, `read_at`, `created_at`, `updated_at`)
VALUES
	(1,'Prajwal Rai','About price','prajwal.iar@gmail.com',NULL,'9807009999','Hello sir i am from kathmandu nepal.','2020-08-14 15:25:46','2020-08-14 15:00:01','2020-08-14 15:25:46'),
	(2,'Prajwal Rai','About Price','prajwal.iar@gmail.com',NULL,'9800099000','Hello i am Prajwal Rai','2020-08-18 10:04:15','2020-08-15 14:52:39','2020-08-18 10:04:16'),
	(3,'Prajwal Rai','lorem ipsum','prajwal.iar@gmail.com',NULL,'1200990009','hello sir sdfdfd dfdjf ;dfjd fd ldkfd','2023-04-25 10:26:09','2020-08-18 04:15:12','2023-04-25 10:26:09');

/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2019_08_19_000000_create_failed_jobs_table',1),
	(4,'2020_07_10_021010_create_brands_table',1),
	(5,'2020_07_10_025334_create_banners_table',1),
	(6,'2020_07_10_112147_create_categories_table',1),
	(7,'2020_07_11_063857_create_products_table',1),
	(8,'2020_07_12_073132_create_post_categories_table',1),
	(9,'2020_07_12_073701_create_post_tags_table',1),
	(10,'2020_07_12_083638_create_posts_table',1),
	(11,'2020_07_13_151329_create_messages_table',1),
	(12,'2020_07_14_023748_create_shippings_table',1),
	(13,'2020_07_15_054356_create_orders_table',1),
	(14,'2020_07_15_102626_create_carts_table',1),
	(15,'2020_07_16_041623_create_notifications_table',1),
	(16,'2020_07_16_053240_create_coupons_table',1),
	(17,'2020_07_23_143757_create_wishlists_table',1),
	(18,'2020_07_24_074930_create_product_reviews_table',1),
	(19,'2020_07_24_131727_create_post_comments_table',1),
	(20,'2020_08_01_143408_create_settings_table',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table notifications
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`)
VALUES
	('020c1c8b-5f1a-4336-ab32-a0d8f176dc4f','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/bseatedglobal.test\\/admin\\/order\\/25\",\"fas\":\"fa-file-alt\"}',NULL,'2023-05-20 14:22:30','2023-05-20 14:22:30'),
	('08b3d9e5-a5dd-4962-b064-fc56e204a79e','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/bseatedglobal.test\\/admin\\/order\\/24\",\"fas\":\"fa-file-alt\"}',NULL,'2023-05-20 14:21:57','2023-05-20 14:21:57'),
	('1a4b3d48-96fd-4917-afcf-59edc34104a3','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/bseated-global.test\\/admin\\/order\\/8\",\"fas\":\"fa-file-alt\"}',NULL,'2023-05-17 16:45:25','2023-05-17 16:45:25'),
	('1f303c06-79a2-4b3c-9738-40c1a17556c2','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/bseated-global.test\\/admin\\/order\\/15\",\"fas\":\"fa-file-alt\"}',NULL,'2023-05-19 20:27:12','2023-05-19 20:27:12'),
	('2145a8e3-687d-444a-8873-b3b2fb77a342','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}',NULL,'2020-08-15 14:31:21','2020-08-15 14:31:21'),
	('33d8550e-ec99-433c-a388-79433615fe67','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/bseatedglobal.test\\/admin\\/order\\/19\",\"fas\":\"fa-file-alt\"}',NULL,'2023-05-20 10:48:20','2023-05-20 10:48:20'),
	('3501c38a-dd66-4e9a-a2cd-6161b35dfa2f','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/bseatedglobal.test\\/admin\\/order\\/23\",\"fas\":\"fa-file-alt\"}',NULL,'2023-05-20 14:16:19','2023-05-20 14:16:19'),
	('362e0d12-1e44-45e0-8253-5e6f23b45fba','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/bseatedglobal.test\\/admin\\/order\\/17\",\"fas\":\"fa-file-alt\"}',NULL,'2023-05-20 10:36:12','2023-05-20 10:36:12'),
	('3af39f84-cab4-4152-9202-d448435c67de','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/4\",\"fas\":\"fa-file-alt\"}',NULL,'2020-08-15 14:54:52','2020-08-15 14:54:52'),
	('3f61afea-ad3f-4625-9196-681aa8ddc6b4','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/bseatedglobal.test\\/admin\\/order\\/20\",\"fas\":\"fa-file-alt\"}',NULL,'2023-05-20 14:08:03','2023-05-20 14:08:03'),
	('45573a1b-d3e2-4f30-8b19-47cc3d2f1483','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/bseatedglobal.test\\/admin\\/order\\/31\",\"fas\":\"fa-file-alt\"}',NULL,'2023-05-20 15:05:50','2023-05-20 15:05:50'),
	('4797b084-557a-445e-981e-34c6e0711677','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/bseatedglobal.test\\/admin\\/order\\/26\",\"fas\":\"fa-file-alt\"}',NULL,'2023-05-20 14:40:12','2023-05-20 14:40:12'),
	('4a0afdb0-71ad-4ce6-bc70-c92ef491a525','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s\",\"fas\":\"fas fa-comment\"}',NULL,'2020-08-18 04:13:51','2020-08-18 04:13:51'),
	('540ca3e9-0ff9-4e2e-9db3-6b5abc823422','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}','2020-08-15 14:30:44','2020-08-14 14:12:28','2020-08-15 14:30:44'),
	('56e1d30d-59d8-472d-b422-119ce301ba94','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/bseatedglobal.test\\/admin\\/order\\/18\",\"fas\":\"fa-file-alt\"}',NULL,'2023-05-20 10:45:36','2023-05-20 10:45:36'),
	('5da09dd1-3ffc-43b0-aba2-a4260ba4cc76','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage\",\"fas\":\"fas fa-comment\"}',NULL,'2020-08-15 14:51:02','2020-08-15 14:51:02'),
	('5e91e603-024e-45c5-b22f-36931fef0d90','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/white-sports-casual-t\",\"fas\":\"fa-star\"}',NULL,'2020-08-15 14:44:07','2020-08-15 14:44:07'),
	('6009a6c7-9e10-4b5e-8dad-b30b871e91fa','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/bseatedglobal.test\\/admin\\/order\\/21\",\"fas\":\"fa-file-alt\"}',NULL,'2023-05-20 14:08:55','2023-05-20 14:08:55'),
	('61012bd1-2f2c-49a1-b05f-7854b9de1fa8','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/ecom2.test\\/admin\\/order\\/6\",\"fas\":\"fa-file-alt\"}','2023-04-25 11:37:20','2023-04-21 08:38:37','2023-04-25 11:37:20'),
	('6452e626-6535-426b-ab8a-cfe583fdc64e','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/bseatedglobal.test\\/admin\\/order\\/30\",\"fas\":\"fa-file-alt\"}',NULL,'2023-05-20 15:03:17','2023-05-20 15:03:17'),
	('6e96bf6a-1672-4e66-960b-bae14cde8ffa','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/bseated-global.test\\/admin\\/order\\/16\",\"fas\":\"fa-file-alt\"}',NULL,'2023-05-19 20:29:44','2023-05-19 20:29:44'),
	('73a3b51a-416a-4e7d-8ca2-53b216d9ad8e','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}',NULL,'2020-08-14 14:11:03','2020-08-14 14:11:03'),
	('77240ed1-4db5-46cd-86a0-67fa32b43023','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/bseated-global.test\\/admin\\/order\\/10\",\"fas\":\"fa-file-alt\"}',NULL,'2023-05-18 15:32:46','2023-05-18 15:32:46'),
	('8605db5d-1462-496e-8b5f-8b923d88912c','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/1\",\"fas\":\"fa-file-alt\"}',NULL,'2020-08-14 14:20:44','2020-08-14 14:20:44'),
	('89f4623e-3313-43bd-aed0-8379afce9dcd','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/bseated-global.test\\/admin\\/order\\/12\",\"fas\":\"fa-file-alt\"}',NULL,'2023-05-19 14:35:46','2023-05-19 14:35:46'),
	('90f221a7-46d4-4f79-b3f6-ea980796b9dd','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/bseatedglobal.test\\/admin\\/order\\/22\",\"fas\":\"fa-file-alt\"}',NULL,'2023-05-20 14:11:22','2023-05-20 14:11:22'),
	('9a6ac6e5-5b01-4ba5-9cb9-620a6f0810bc','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/bseated-global.test\\/admin\\/order\\/13\",\"fas\":\"fa-file-alt\"}',NULL,'2023-05-19 20:11:57','2023-05-19 20:11:57'),
	('9d5b65dc-52fa-43bc-97f6-ba39a9c42a93','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/bseated-global.test\\/admin\\/order\\/14\",\"fas\":\"fa-file-alt\"}',NULL,'2023-05-19 20:19:14','2023-05-19 20:19:14'),
	('a580d54f-05e6-401d-b2a4-7f9508334e0d','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/bseatedglobal.test\\/admin\\/order\\/34\",\"fas\":\"fa-file-alt\"}',NULL,'2023-05-21 02:47:25','2023-05-21 02:47:25'),
	('a6ec5643-748c-4128-92e2-9a9f293f53b5','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/5\",\"fas\":\"fa-file-alt\"}',NULL,'2020-08-18 04:17:03','2020-08-18 04:17:03'),
	('b186a883-42f2-4a05-8fc5-f0d3e10309ff','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/2\",\"fas\":\"fa-file-alt\"}','2020-08-15 11:17:24','2020-08-15 05:14:55','2020-08-15 11:17:24'),
	('bf88e2e6-6743-43a4-9b77-baf1a9fef2c2','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/bseatedglobal.test\\/admin\\/order\\/33\",\"fas\":\"fa-file-alt\"}',NULL,'2023-05-20 16:27:54','2023-05-20 16:27:54'),
	('c845e910-3205-45e0-9939-5c7b26daedbc','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/bseatedglobal.test\\/admin\\/order\\/28\",\"fas\":\"fa-file-alt\"}',NULL,'2023-05-20 14:45:55','2023-05-20 14:45:55'),
	('ccb98889-dabe-4b0b-b07f-000ef7d7ce57','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/bseated-global.test\\/admin\\/order\\/11\",\"fas\":\"fa-file-alt\"}',NULL,'2023-05-18 15:35:13','2023-05-18 15:35:13'),
	('cf6ad2b5-44af-4d19-ae5e-7ee99f1177b7','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/bseatedglobal.test\\/product-detail\\/merida-lounge-chair\",\"fas\":\"fa-star\"}',NULL,'2023-05-20 16:23:13','2023-05-20 16:23:13'),
	('d2fd7c33-b0fe-47d6-8bc6-f377d404080d','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}',NULL,'2020-08-14 14:08:50','2020-08-14 14:08:50'),
	('d616cfc8-c88d-41ac-b403-7b686c2af8f3','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/bseated-global.test\\/admin\\/order\\/9\",\"fas\":\"fa-file-alt\"}',NULL,'2023-05-17 16:46:29','2023-05-17 16:46:29'),
	('d776430e-2a4c-4fab-a002-945078a4e019','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/bseatedglobal.test\\/admin\\/order\\/32\",\"fas\":\"fa-file-alt\"}',NULL,'2023-05-20 16:24:06','2023-05-20 16:24:06'),
	('de24915e-39db-4e07-9b9d-ce8c9eb8f9e6','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/bseatedglobal.test\\/admin\\/order\\/27\",\"fas\":\"fa-file-alt\"}',NULL,'2023-05-20 14:42:33','2023-05-20 14:42:33'),
	('dff78b90-85c8-42ee-a5b1-de8ad0b21be4','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/3\",\"fas\":\"fa-file-alt\"}',NULL,'2020-08-15 13:40:54','2020-08-15 13:40:54'),
	('e28b0a73-4819-4016-b915-0e525d4148f5','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/lorem-ipsum-is-simply\",\"fas\":\"fa-star\"}',NULL,'2020-08-18 04:08:16','2020-08-18 04:08:16'),
	('f0dc1594-9451-43df-9974-894948a21756','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/ecom2.test\\/admin\\/order\\/7\",\"fas\":\"fa-file-alt\"}','2023-05-17 16:14:27','2023-04-25 15:50:47','2023-05-17 16:14:27'),
	('f89bab3d-0fc6-4c2e-858a-960036379fc7','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/bseatedglobal.test\\/admin\\/order\\/29\",\"fas\":\"fa-file-alt\"}',NULL,'2023-05-20 14:54:53','2023-05-20 14:54:53'),
	('ffffa177-c54e-4dfe-ba43-27c466ff1f4b','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s\",\"fas\":\"fas fa-comment\"}',NULL,'2020-08-18 04:13:29','2020-08-18 04:13:29');

/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `sub_total` double(8,2) NOT NULL,
  `shipping_id` bigint(20) unsigned DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `total_amount` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('cod','paypal') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel','transfer') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `import_amount` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_order_number_unique` (`order_number`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_shipping_id_foreign` (`shipping_id`),
  CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`, `import_amount`)
VALUES
	(1,'ORD-PMIQF5MYPK',3,14399.00,1,573.90,13925.10,6,'cod','unpaid','delivered','Prajwal','Rai','prajwal.iar@gmail.com','9800887778','NP','44600','Koteshwor','Kathmandu','2020-08-14 14:20:44','2020-08-14 16:37:37',0),
	(2,'ORD-YFF8BF0YBK',2,1939.03,1,NULL,2039.03,1,'cod','unpaid','delivered','Sandhya','Rai','user@gmail.com','90000000990','NP',NULL,'Lalitpur',NULL,'2020-08-15 05:14:49','2020-08-15 05:15:19',0),
	(3,'ORD-1CKWRWTTIK',3,200.00,1,NULL,300.00,1,'paypal','paid','process','Prajwal','Rai','prajwal.iar@gmail.com','9807009999','NP','44600','Kathmandu','Kadaghari','2020-08-15 13:40:49','2020-08-18 03:52:40',0),
	(4,'ORD-HVO0KX0YHW',3,23660.00,NULL,150.00,23910.00,6,'paypal','paid','new','Prajwal','Rai','prajwal.iar@gmail.com','9800098878','NP','44600','Pokhara',NULL,'2020-08-15 14:54:52','2020-08-15 14:54:52',0),
	(6,'ORD-STQ8W2VWRE',2,3650.00,NULL,NULL,4050.00,4,'paypal','paid','new','hi','hi','user@gmail.com','123123123','VN','fe','fe','fe','2023-04-21 08:38:37','2023-04-21 08:38:37',0),
	(7,'ORD-G3TYOXQQS4',30,390.00,5,NULL,790.00,2,'cod','unpaid','delivered','q','q','gangnam012001@gmail.com','123123123','VN',NULL,'123',NULL,'2023-04-25 15:50:47','2023-04-17 17:23:47',0),
	(9,'ORD-KRFN5TEDTH',31,94.05,5,NULL,106.05,1,'cod','unpaid','delivered','Harry','V','harryv1@gmail.com','1300994529','AU','2148','Level 2, Room 203, 85 Flushcombe Rd',NULL,'2023-05-17 16:46:29','2023-05-17 17:23:21',0),
	(10,'ORD-UNYYZ9N636',30,405.10,5,10.71,406.39,4,'cod','unpaid','new','Harry','V','harryv@gmail.com','0999999999','AT','3150','St Barnabas Glen Waverley Anglican Church, 800 Waverley Road',NULL,'2023-05-18 15:32:46','2023-05-19 09:21:28',0),
	(11,'ORD-XJOGDCQEUC',30,89.10,5,NULL,101.10,1,'paypal','paid','transfer','Harry','V','harryv1@gmail.com','1300994529','AU','2148','Level 2, Room 203, 85 Flushcombe Rd',NULL,'2023-05-18 15:35:13','2023-05-19 09:19:41',0),
	(12,'ORD-XLYRQT2N6I',30,272.15,5,NULL,284.15,3,'cod','unpaid','delivered','Harry','V','gangnam012001@gmail.com','0999999999','VN','3150','St Barnabas Glen Waverley Anglican Church, 800 Waverley Road',NULL,'2023-05-19 14:35:46','2023-05-19 18:34:13',0),
	(13,'ORD-309MMV9DA0',30,89.00,2,NULL,98.00,1,'paypal','paid','new','Harry','V','harryv@gmail.com','0999999999','AU','3150','St Barnabas Glen Waverley Anglican Church, 800 Waverley Road',NULL,'2023-05-19 20:11:57','2023-05-19 20:11:57',0),
	(14,'ORD-EKVU66N3TQ',30,113.05,5,NULL,125.05,1,'paypal','paid','new','Harry','V','harryv@gmail.com','0999999999','AU','3150','St Barnabas Glen Waverley Anglican Church, 800 Waverley Road',NULL,'2023-05-19 20:19:14','2023-05-19 20:19:14',0),
	(15,'ORD-ES2OJQOJCY',30,161.10,1,NULL,171.10,1,'paypal','paid','new','Harry','V','harryv@gmail.com','0999999999','AU','3150','St Barnabas Glen Waverley Anglican Church, 800 Waverley Road',NULL,'2023-05-19 20:27:12','2023-05-19 20:27:12',0),
	(16,'ORD-KOIM3BE96G',30,133.44,5,NULL,145.44,1,'paypal','paid','new','Harry','V','harryv1@gmail.com','999999999','AU','3150','St Barnabas Glen Waverley Anglican Church, 800 Waverley Road',NULL,'2023-05-19 20:29:44','2023-05-19 20:29:44',0),
	(19,'ORD-TMTHZENIWK',30,302.10,5,NULL,314.10,2,'cod','unpaid','delivered','Harry','V','harryv@gmail.com','0999999999','AU','3150','St Barnabas Glen Waverley Anglican Church, 800 Waverley Road',NULL,'2023-05-20 10:48:20','2023-05-20 11:02:02',169),
	(20,'ORD-PHDHKTSPRU',30,122.55,5,NULL,134.55,1,'paypal','paid','new','Harry','V','harryv@gmail.com','0999999999','AU','3150','St Barnabas Glen Waverley Anglican Church, 800 Waverley Road',NULL,'2023-05-20 14:08:03','2023-05-20 14:08:03',80),
	(21,'ORD-AHYFCEBAPU',30,122.55,5,NULL,134.55,1,'cod','unpaid','new','Harry','V','harryv@gmail.com','0999999999','VN','3150','St Barnabas Glen Waverley Anglican Church, 800 Waverley Road',NULL,'2023-05-20 14:08:55','2023-05-20 14:08:55',80),
	(22,'ORD-ZTO6M9LJEU',30,122.55,5,NULL,134.55,1,'paypal','paid','new','Harry','V','harryv@gmail.com','0999999999','AU','3150','St Barnabas Glen Waverley Anglican Church, 800 Waverley Road',NULL,'2023-05-20 14:11:21','2023-05-20 14:11:21',80),
	(23,'ORD-ICEQPTJSRN',30,122.55,5,NULL,134.55,1,'paypal','paid','new','Harry','V','harryv@gmail.com','0999999999','AU','3150','St Barnabas Glen Waverley Anglican Church, 800 Waverley Road',NULL,'2023-05-20 14:16:19','2023-05-20 14:16:19',80),
	(24,'ORD-42TZLCMRSY',30,122.55,5,NULL,134.55,1,'paypal','paid','new','Harry','V','harryv@gmail.com','0999999999','VN','3150','St Barnabas Glen Waverley Anglican Church, 800 Waverley Road',NULL,'2023-05-20 14:21:57','2023-05-20 14:21:57',80),
	(25,'ORD-CPWMEG72GX',30,122.55,5,NULL,134.55,1,'paypal','paid','new','Harry','V','harryv@gmail.com','0999999999','VN','3150','St Barnabas Glen Waverley Anglican Church, 800 Waverley Road',NULL,'2023-05-20 14:22:30','2023-05-20 14:22:30',80),
	(26,'ORD-5TGIUEBYU6',30,113.05,5,NULL,125.05,1,'paypal','paid','new','Harry','V','harryv@gmail.com','0999999999','AU','3150','St Barnabas Glen Waverley Anglican Church, 800 Waverley Road',NULL,'2023-05-20 14:40:12','2023-05-20 14:40:12',70),
	(27,'ORD-77AKRCX3K3',30,189.05,5,NULL,201.05,1,'paypal','paid','new','Harry','V','harryv@gmail.com','0999999999','AU','3150','St Barnabas Glen Waverley Anglican Church, 800 Waverley Road',NULL,'2023-05-20 14:42:33','2023-05-20 14:42:33',99),
	(28,'ORD-EKYQ3FCVI5',30,189.05,5,NULL,201.05,1,'paypal','paid','new','Harry','V','harryv@gmail.com','0999999999','AU','3150','St Barnabas Glen Waverley Anglican Church, 800 Waverley Road',NULL,'2023-05-20 14:45:55','2023-05-20 14:45:55',99),
	(29,'ORD-HQMKOJY601',30,161.10,5,NULL,173.10,1,'paypal','paid','new','Harry','V','harryv@gmail.com','0999999999','AU','3150','St Barnabas Glen Waverley Anglican Church, 800 Waverley Road',NULL,'2023-05-20 14:54:53','2023-05-20 14:54:53',109),
	(30,'ORD-RWSXDDO0KL',30,89.10,2,NULL,98.10,1,'paypal','paid','new','Harry','V','harryv@gmail.com','0999999999','AU','3150','St Barnabas Glen Waverley Anglican Church, 800 Waverley Road',NULL,'2023-05-20 15:03:17','2023-05-20 15:03:17',50),
	(31,'ORD-3FSXJP8ZNI',30,89.00,5,NULL,101.00,1,'paypal','paid','delivered','Harry','V','harryv@gmail.com','0999999999','AU','3150','St Barnabas Glen Waverley Anglican Church, 800 Waverley Road',NULL,'2023-05-20 15:05:50','2023-05-20 15:18:14',50),
	(32,'ORD-GZEE0NLC4L',30,235.74,5,NULL,247.74,2,'cod','unpaid','transfer','Harry','V','harryv@gmail.com','0999999999','AU','3150','St Barnabas Glen Waverley Anglican Church, 800 Waverley Road',NULL,'2023-05-20 16:24:06','2023-05-20 16:26:36',150),
	(33,'ORD-ETG9KPM5L2',30,89.00,5,NULL,101.00,1,'paypal','paid','new','Harry','V','harryv@gmail.com','0999999999','AU','3150','St Barnabas Glen Waverley Anglican Church, 800 Waverley Road',NULL,'2023-05-20 16:27:54','2023-05-20 16:27:54',50),
	(34,'ORD-HCJZNEGWSN',30,280.08,1,NULL,315.08,2,'cod','unpaid','transfer','Harry','V','harryv@gmail.com','0999999999','AU','3150','St Barnabas Glen Waverley Anglican Church, 800 Waverley Road',NULL,'2023-05-21 02:47:25','2023-05-21 02:49:34',189);

/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;

INSERT INTO `password_resets` (`email`, `token`, `created_at`)
VALUES
	('harryv@gmail.com','$2y$10$NcM8TrP6/Cv.Fi/CtHdevuFHz1ts4pDSXUiZq6g/5TnlU2SmUn.V6','2023-05-01 16:17:59'),
	('harryv1@gmail.com','$2y$10$2C.9Q/u46PDxlgT1rT/yfO4hbI6LiRGPbX/GQF5c3GRRs3hEpumKO','2023-05-18 19:52:51');

/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table post_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `post_categories`;

CREATE TABLE `post_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_categories_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;

INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`)
VALUES
	(1,'Travel','contrary','active','2020-08-14 08:51:03','2020-08-14 08:51:39'),
	(2,'Electronics','richard','active','2020-08-14 08:51:22','2020-08-14 08:52:00'),
	(3,'Cloths','cloths','active','2020-08-14 08:52:22','2020-08-14 08:52:22'),
	(4,'enjoy','enjoy','active','2020-08-14 10:16:10','2020-08-14 10:16:10'),
	(5,'Post Category','post-category','active','2020-08-15 13:59:04','2020-08-15 13:59:04');

/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table post_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `post_comments`;

CREATE TABLE `post_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `post_id` bigint(20) unsigned DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `replied_comment` text COLLATE utf8mb4_unicode_ci,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_comments_user_id_foreign` (`user_id`),
  KEY `post_comments_post_id_foreign` (`post_id`),
  CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `post_comments` WRITE;
/*!40000 ALTER TABLE `post_comments` DISABLE KEYS */;

INSERT INTO `post_comments` (`id`, `user_id`, `post_id`, `comment`, `status`, `replied_comment`, `parent_id`, `created_at`, `updated_at`)
VALUES
	(5,3,5,'nice blog','active',NULL,NULL,'2020-08-15 14:51:01','2020-08-15 14:51:01'),
	(6,2,3,'nice','active',NULL,NULL,'2020-08-18 04:13:29','2020-08-18 04:13:29'),
	(7,2,3,'really','active',NULL,6,'2020-08-18 04:13:51','2020-08-18 04:13:51');

/*!40000 ALTER TABLE `post_comments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table post_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `post_tags`;

CREATE TABLE `post_tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_tags_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;

INSERT INTO `post_tags` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`)
VALUES
	(1,'Enjoy','enjoy','active','2020-08-14 08:53:52','2020-08-14 08:53:52'),
	(2,'2020','2020','active','2020-08-14 08:54:09','2020-08-14 08:54:09'),
	(3,'Visit nepal 2020','visit-nepal-2020','active','2020-08-14 08:54:33','2020-08-14 08:54:33'),
	(4,'Tag','tag','active','2020-08-15 13:59:31','2020-08-15 13:59:31');

/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `quote` text COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_cat_id` bigint(20) unsigned DEFAULT NULL,
  `post_tag_id` bigint(20) unsigned DEFAULT NULL,
  `added_by` bigint(20) unsigned DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`),
  KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  KEY `posts_added_by_foreign` (`added_by`),
  CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `posts_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;

INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`)
VALUES
	(3,'The standard Lorem Ipsum passage, used since the 1500s','the-standard-lorem-ipsum-passage-used-since-the-1500s','<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit,</span><br></p>','<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>',NULL,'/storage/photos/1/blog3.webp','',3,NULL,3,'active','2020-08-14 09:59:33','2023-04-30 10:20:00'),
	(5,'The standard Lorem Ipsum passage,','the-standard-lorem-ipsum-passage','<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,</span><br></p>','<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">The standard Lorem Ipsum passage, used since the 1500s</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>','<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,</span><br></p>','/storage/photos/1/blog2.webp','Enjoy,2020,Visit nepal 2020',1,NULL,1,'active','2020-08-15 13:58:45','2023-04-30 10:19:51'),
	(6,'Lorem Ipsum is simply','lorem-ipsum-is-simply','<p><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry.</span><br></p>','<h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><hr><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p>',NULL,'/storage/photos/1/blog1.webp','Enjoy,2020',2,NULL,1,'active','2020-08-18 03:54:19','2023-04-30 10:19:43');

/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_reviews
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_reviews`;

CREATE TABLE `product_reviews` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT '0',
  `review` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_reviews_user_id_foreign` (`user_id`),
  KEY `product_reviews_product_id_foreign` (`product_id`),
  CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `product_reviews` WRITE;
/*!40000 ALTER TABLE `product_reviews` DISABLE KEYS */;

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rate`, `review`, `status`, `created_at`, `updated_at`)
VALUES
	(1,30,23,5,'hi','active','2023-05-20 16:23:13','2023-05-20 16:23:13');

/*!40000 ALTER TABLE `product_reviews` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL DEFAULT '1',
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'M',
  `condition` enum('default','new','hot') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) DEFAULT '0.00',
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint(20) unsigned DEFAULT NULL,
  `child_cat_id` bigint(20) unsigned DEFAULT NULL,
  `brand_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `import_price` double(8,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  KEY `products_brand_id_foreign` (`brand_id`),
  KEY `products_cat_id_foreign` (`cat_id`),
  KEY `products_child_cat_id_foreign` (`child_cat_id`),
  CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;

INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`, `import_price`)
VALUES
	(11,'Chair1','chair1','<p>chair</p>','<p>chair</p>','/storage/photos/1/product1.webp',998,'','new','active',99.00,10.00,1,1,NULL,1,'2023-05-04 08:27:56','2023-05-19 18:34:13',60.00),
	(12,'chair 2','chair-2','<p>chair 2</p>','<p>chair 2</p>','/storage/photos/1/1.png',999,'','new','active',119.00,10.00,1,1,4,1,'2023-05-04 08:29:51','2023-05-04 08:29:51',70.00),
	(13,'chair 3','chair-3','<p>chair 3</p>',NULL,'/storage/photos/1/2.png',0,'','hot','active',99.00,5.00,1,12,NULL,2,'2023-05-04 08:30:34','2023-05-20 13:02:58',60.00),
	(15,'Africa Outdoor Stool','africa-outdoor-stool','<p><span style=\"color: rgb(12, 12, 12); font-family: &quot;Helvetica Neue&quot;, sans-serif; font-size: 14px;\">Made in Spain by Vondom Suitable for outdoor use Several styles available in the Africa Family For pricing and more information on this product please add to your enquiry list</span><br></p>','<h3 style=\"color: rgb(12, 12, 12); font-family: &quot;Anton Regular&quot;; line-height: 1.6; margin-right: 0px; margin-bottom: 0.5em; margin-left: 0px; text-transform: uppercase; font-size: 18px;\"><span style=\"font-weight: bolder;\">AFRICA STOOL</span></h3><p><span style=\"color: rgb(12, 12, 12); font-family: &quot;Helvetica Neue&quot;, sans-serif; font-size: 14px;\">Designed by Eugeni Quitllet for Vondom, the Africa Stool is one of their most popular additions to the Africa family. The family is known for their simple and natural forms which aim to bring you close to your \"tribe\" of friends. It is the perfect outdoor piece made of gas air moulding injected polypropylene with fiber glass. Uniquely the Africa Stool is able to stack, which also makes it a great space saving option.</span></p><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(12, 12, 12); font-family: &quot;Helvetica Neue&quot;, sans-serif; line-height: 1.6; transition: none 0s ease 0s;\">&nbsp;</p><h3 style=\"color: rgb(12, 12, 12); font-family: &quot;Anton Regular&quot;; line-height: 1.6; margin-right: 0px; margin-bottom: 0.5em; margin-left: 0px; text-transform: uppercase; font-size: 18px;\"><span style=\"font-weight: bolder;\">PRICING AVAILABLE ON ENQUIRY</span></h3><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(12, 12, 12); font-family: &quot;Helvetica Neue&quot;, sans-serif; line-height: 1.6; transition: none 0s ease 0s;\">If you require pricing or more information about this product, please add it to your enquiry list. On the enquiry list page please fill in the required details and submit the enquiry. Your enquiry will be sent to us and one of our sales representatives will be in touch with you within 24 hours to answer your questions and provide a quotation.</p><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(12, 12, 12); font-family: &quot;Helvetica Neue&quot;, sans-serif; line-height: 1.6; transition: none 0s ease 0s;\">&nbsp;</p><h3 style=\"color: rgb(12, 12, 12); font-family: &quot;Anton Regular&quot;; line-height: 1.6; margin-right: 0px; margin-bottom: 0.5em; margin-left: 0px; text-transform: uppercase; font-size: 18px;\"><span style=\"font-weight: bolder;\">AVAILABILITY, SHIPPING &amp; DELIVERY</span></h3><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(12, 12, 12); font-family: &quot;Helvetica Neue&quot;, sans-serif; line-height: 1.6; transition: none 0s ease 0s;\">If we have the furniture in stock in our Sydney warehouse it can be despatched within 5 business days of payment confirmation. If the product is not in stock or is a customised order, most products can be manufactured and delivered within 8-12 weeks of order placement. For accurate lead times please add the product to your enquiry list.</p><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(12, 12, 12); font-family: &quot;Helvetica Neue&quot;, sans-serif; line-height: 1.6; transition: none 0s ease 0s;\">&nbsp;</p><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(12, 12, 12); font-family: &quot;Helvetica Neue&quot;, sans-serif; line-height: 1.6; transition: none 0s ease 0s;\">If you have any further questions please refer to our&nbsp;<a href=\"https://www.bseatedglobal.com.au/faqs\" style=\"align-items: flex-start; color: rgb(12, 12, 12); display: inline-flex; line-height: 1.6; text-decoration-line: underline; transition: all 0.3s ease-in-out 0s; -webkit-tap-highlight-color: transparent; min-height: 35px; background-clip: content-box;\">FAQ</a>&nbsp;page or call us on 1300 727 637</p>','/storage/photos/1/stool1.png',99,'','new','active',99.00,10.00,1,13,NULL,NULL,'2023-05-18 15:10:34','2023-05-18 15:10:34',50.00),
	(17,'Valencia Timber Stool','valencia-timber-stool','<p><span style=\"color: rgb(12, 12, 12); font-family: &quot;Helvetica Neue&quot;, sans-serif;\">Elevate your hospitality space with our Valencia Timber Stool. Made in the heart of Spain, this heavy-duty stool is designed to withstand the rigors of high-traffic areas. With its elegant design and sturdy construction, the Valencia Timber Stool is a must-have for any hotel, bar, or restaurant.</span><br></p>','<table class=\"table table--scope-row\" id=\"product-attribute-specs-table\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-width: 1px 0px 0px; border-style: solid; border-color: rgb(247, 245, 241); border-image: initial; border-collapse: initial; border-radius: 0px; border-spacing: 0px; color: rgb(0, 0, 0); line-height: 1.6; margin: 8px 0px; padding: 0px; width: 896px; font-family: &quot;Helvetica Neue&quot;, sans-serif;\"><tbody><tr role=\"row\" style=\"border-bottom: 0px; padding: 0px;\"><th scope=\"row\" role=\"rowheader\" style=\"background: rgb(251, 251, 251); padding: 16px; text-align: left; border-right: 0px solid rgb(247, 245, 241); border-bottom: 1px solid rgb(247, 245, 241); border-left-width: 0px; font-weight: 400; width: 448px;\">Dimensions H x W x D (cm)</th><td role=\"gridcell\" data-th=\"Dimensions H x W x D (cm)\" style=\"background: rgb(251, 251, 251); padding: 16px; border-bottom: 1px solid rgb(247, 245, 241); border-right: 0px; flex-flow: row nowrap;\">62x58x107</td></tr><tr role=\"row\" style=\"border-bottom: 0px; padding: 0px;\"><th scope=\"row\" role=\"rowheader\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; padding: 16px; text-align: left; border-right: 0px solid rgb(247, 245, 241); border-bottom: 1px solid rgb(247, 245, 241); border-left-width: 0px; font-weight: 400; width: 448px;\">Lead time</th><td role=\"gridcell\" data-th=\"Lead time\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; padding: 16px; border-bottom: 1px solid rgb(247, 245, 241); border-right: 0px; flex-flow: row nowrap;\">12-14 weeks</td></tr><tr role=\"row\" style=\"border-bottom: 1px solid rgb(247, 245, 241); padding: 0px;\"><th scope=\"row\" role=\"rowheader\" style=\"background: rgb(251, 251, 251); padding: 16px; text-align: left; border-right: 0px solid rgb(247, 245, 241); border-bottom: 1px solid rgb(247, 245, 241); border-left-width: 0px; font-weight: 400; width: 448px;\">Notes</th><td role=\"gridcell\" data-th=\"Notes\" style=\"background: rgb(251, 251, 251); padding: 16px; border-bottom: 1px solid rgb(247, 245, 241); border-right: 0px; flex-flow: row nowrap; border-bottom-right-radius: 0px;\"><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(12, 12, 12); line-height: 1.6; transition: none 0s ease 0s;\">Code: ATEM 7279</p></td></tr></tbody></table>','/storage/photos/1/stool2.png',998,'','new','active',119.00,5.00,1,13,NULL,NULL,'2023-05-18 15:14:25','2023-05-20 11:02:02',70.00),
	(18,'Toledo Steel Barstool','toledo-steel-barstool','<span style=\"color: rgb(12, 12, 12); font-family: &quot;Helvetica Neue&quot;, sans-serif;\">Our Toledo Steel Barstool is the perfect blend of comfort and style. Made in the heart of Spain, this stool boasts a heavy-duty construction, making it perfect for high-traffic areas. Bring a touch of Spanish elegance to your hospitality space with our Toledo Steel Barstool</span>','<table class=\"table table--scope-row\" id=\"product-attribute-specs-table\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-width: 1px 0px 0px; border-style: solid; border-color: rgb(247, 245, 241); border-image: initial; border-collapse: initial; border-radius: 0px; border-spacing: 0px; color: rgb(0, 0, 0); line-height: 1.6; margin: 8px 0px; padding: 0px; width: 896px; font-family: &quot;Helvetica Neue&quot;, sans-serif;\"><tbody><tr role=\"row\" style=\"border-bottom: 1px solid rgb(247, 245, 241); padding: 0px;\"><th scope=\"row\" role=\"rowheader\" style=\"background: rgb(251, 251, 251); padding: 16px; text-align: left; border-right: 0px solid rgb(247, 245, 241); border-bottom: 1px solid rgb(247, 245, 241); border-left-width: 0px; font-weight: 400; width: 448px;\">Notes</th><td role=\"gridcell\" data-th=\"Notes\" style=\"background: rgb(251, 251, 251); padding: 16px; border-bottom: 1px solid rgb(247, 245, 241); border-right: 0px; flex-flow: row nowrap; border-bottom-right-radius: 0px;\"><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(12, 12, 12); line-height: 1.6; transition: none 0s ease 0s;\">Code: ASTON 7299/ 6B&nbsp;</p></td></tr></tbody></table>','/storage/photos/1/stool3.png',997,'','new','active',89.00,0.00,0,13,NULL,NULL,'2023-05-18 15:19:05','2023-05-20 15:18:14',50.00),
	(19,'Tortosa Armchair','tortosa-armchair','<p>This has no description</p>','<table class=\"table table--scope-row\" id=\"product-attribute-specs-table\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-width: 1px 0px 0px; border-style: solid; border-color: rgb(247, 245, 241); border-image: initial; border-collapse: initial; border-radius: 0px; border-spacing: 0px; color: rgb(0, 0, 0); line-height: 1.6; margin: 8px 0px; padding: 0px; width: 896px; font-family: &quot;Helvetica Neue&quot;, sans-serif;\"><tbody><tr role=\"row\" style=\"border-bottom: 1px solid rgb(247, 245, 241); padding: 0px;\"><th scope=\"row\" role=\"rowheader\" style=\"background: rgb(251, 251, 251); padding: 16px; text-align: left; border-right: 0px solid rgb(247, 245, 241); border-bottom: 1px solid rgb(247, 245, 241); border-left-width: 0px; font-weight: 400; width: 448px;\">Dimensions H x W x D (cm)</th><td role=\"gridcell\" data-th=\"Dimensions H x W x D (cm)\" style=\"background: rgb(251, 251, 251); padding: 16px; border-bottom: 1px solid rgb(247, 245, 241); border-right: 0px; flex-flow: row nowrap; border-bottom-right-radius: 0px;\">74 x 62 x 58</td></tr></tbody></table>','/storage/photos/1/chair1.png',99,'','new','active',129.00,5.00,1,1,4,NULL,'2023-05-19 19:43:39','2023-05-19 19:43:39',80.00),
	(20,'Leonese Armchair','leonese-armchair','<p>...</p>','<table class=\"table table--scope-row\" id=\"product-attribute-specs-table\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-width: 1px 0px 0px; border-style: solid; border-color: rgb(247, 245, 241); border-image: initial; border-collapse: initial; border-radius: 0px; border-spacing: 0px; color: rgb(0, 0, 0); line-height: 1.6; margin: 8px 0px; padding: 0px; width: 896px; font-family: &quot;Helvetica Neue&quot;, sans-serif;\"><caption class=\"table__caption\" style=\"clip: rect(0px, 0px, 0px, 0px); border: 0px; height: 1px; margin: -1px; overflow: hidden; padding: 0px; position: absolute; width: 1px;\">Product specification details</caption><tbody><tr role=\"row\" style=\"border-bottom: 1px solid rgb(247, 245, 241); padding: 0px;\"><th scope=\"row\" role=\"rowheader\" style=\"background: rgb(251, 251, 251); padding: 16px; text-align: left; border-right: 0px solid rgb(247, 245, 241); border-bottom: 1px solid rgb(247, 245, 241); border-left-width: 0px; font-weight: 400; width: 448px;\">Dimensions H x W x D (cm)</th><td role=\"gridcell\" data-th=\"Dimensions H x W x D (cm)\" style=\"background: rgb(251, 251, 251); padding: 16px; border-bottom: 1px solid rgb(247, 245, 241); border-right: 0px; flex-flow: row nowrap; border-bottom-right-radius: 0px;\">81 x 61 x 61</td></tr></tbody></table>','/storage/photos/1/chair2.png',99,'','new','active',156.00,6.00,1,1,4,NULL,'2023-05-19 19:44:39','2023-05-19 19:44:39',100.00),
	(21,'Lugo Armchair','lugo-armchair','<p>...</p>','<table class=\"table table--scope-row\" id=\"product-attribute-specs-table\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-width: 1px 0px 0px; border-style: solid; border-color: rgb(247, 245, 241); border-image: initial; border-collapse: initial; border-radius: 0px; border-spacing: 0px; color: rgb(0, 0, 0); line-height: 1.6; margin: 8px 0px; padding: 0px; width: 896px; font-family: &quot;Helvetica Neue&quot;, sans-serif;\"><caption class=\"table__caption\" style=\"clip: rect(0px, 0px, 0px, 0px); border: 0px; height: 1px; margin: -1px; overflow: hidden; padding: 0px; position: absolute; width: 1px;\">Product specification details</caption><tbody><tr role=\"row\" style=\"border-bottom: 1px solid rgb(247, 245, 241); padding: 0px;\"><th scope=\"row\" role=\"rowheader\" style=\"background: rgb(251, 251, 251); padding: 16px; text-align: left; border-right: 0px solid rgb(247, 245, 241); border-bottom: 1px solid rgb(247, 245, 241); border-left-width: 0px; font-weight: 400; width: 448px;\">Dimensions H x W x D (cm)</th><td role=\"gridcell\" data-th=\"Dimensions H x W x D (cm)\" style=\"background: rgb(251, 251, 251); padding: 16px; border-bottom: 1px solid rgb(247, 245, 241); border-right: 0px; flex-flow: row nowrap; border-bottom-right-radius: 0px;\">81 x 62 x 58</td></tr></tbody></table>','/storage/photos/1/chair3.png',99,'','new','active',139.00,4.00,1,1,NULL,NULL,'2023-05-19 19:45:47','2023-05-19 19:45:47',89.00),
	(22,'PYRAMID SIDE TABLE','pyramid-side-table','<ul style=\"color: rgb(12, 12, 12); font-family: &quot;Helvetica Neue&quot;, sans-serif; font-size: 14px;\"><li>Please add item to your enquiry list for pricing</li><li>We will respond within 24 hours with a quotation</li></ul>','<table class=\"table table--scope-row\" id=\"product-attribute-specs-table\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-width: 1px 0px 0px; border-style: solid; border-color: rgb(247, 245, 241); border-image: initial; border-collapse: initial; border-radius: 0px; border-spacing: 0px; color: rgb(0, 0, 0); line-height: 1.6; margin: 8px 0px; padding: 0px; width: 896px; font-family: &quot;Helvetica Neue&quot;, sans-serif;\"><tbody><tr role=\"row\" style=\"border-bottom: 0px; padding: 0px;\"><th scope=\"row\" role=\"rowheader\" style=\"background: rgb(251, 251, 251); padding: 16px; text-align: left; border-right: 0px solid rgb(247, 245, 241); border-bottom: 1px solid rgb(247, 245, 241); border-left-width: 0px; font-weight: 400; width: 448px;\">Brand</th><td role=\"gridcell\" data-th=\"Brand\" style=\"background: rgb(251, 251, 251); padding: 16px; border-bottom: 1px solid rgb(247, 245, 241); border-right: 0px; flex-flow: row nowrap;\">BSeated Global</td></tr><tr role=\"row\" style=\"border-bottom: 0px; padding: 0px;\"><th scope=\"row\" role=\"rowheader\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; padding: 16px; text-align: left; border-right: 0px solid rgb(247, 245, 241); border-bottom: 1px solid rgb(247, 245, 241); border-left-width: 0px; font-weight: 400; width: 448px;\">Dimensions H x W x D (cm)</th><td role=\"gridcell\" data-th=\"Dimensions H x W x D (cm)\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; padding: 16px; border-bottom: 1px solid rgb(247, 245, 241); border-right: 0px; flex-flow: row nowrap;\">50x50x50H</td></tr><tr role=\"row\" style=\"border-bottom: 0px; padding: 0px;\"><th scope=\"row\" role=\"rowheader\" style=\"background: rgb(251, 251, 251); padding: 16px; text-align: left; border-right: 0px solid rgb(247, 245, 241); border-bottom: 1px solid rgb(247, 245, 241); border-left-width: 0px; font-weight: 400; width: 448px;\">Stackable</th><td role=\"gridcell\" data-th=\"Stackable\" style=\"background: rgb(251, 251, 251); padding: 16px; border-bottom: 1px solid rgb(247, 245, 241); border-right: 0px; flex-flow: row nowrap;\">No</td></tr><tr role=\"row\" style=\"border-bottom: 0px; padding: 0px;\"><th scope=\"row\" role=\"rowheader\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; padding: 16px; text-align: left; border-right: 0px solid rgb(247, 245, 241); border-bottom: 1px solid rgb(247, 245, 241); border-left-width: 0px; font-weight: 400; width: 448px;\">Lead time</th><td role=\"gridcell\" data-th=\"Lead time\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; padding: 16px; border-bottom: 1px solid rgb(247, 245, 241); border-right: 0px; flex-flow: row nowrap;\">8-10 weeks</td></tr><tr role=\"row\" style=\"border-bottom: 1px solid rgb(247, 245, 241); padding: 0px;\"><th scope=\"row\" role=\"rowheader\" style=\"background: rgb(251, 251, 251); padding: 16px; text-align: left; border-right: 0px solid rgb(247, 245, 241); border-bottom: 1px solid rgb(247, 245, 241); border-left-width: 0px; font-weight: 400; width: 448px;\">Warranty</th><td role=\"gridcell\" data-th=\"Warranty\" style=\"background: rgb(251, 251, 251); padding: 16px; border-bottom: 1px solid rgb(247, 245, 241); border-right: 0px; flex-flow: row nowrap; border-bottom-right-radius: 0px;\">2 Years</td></tr></tbody></table>','/storage/photos/1/table3.png',99,'','new','active',179.00,10.00,0,2,5,NULL,'2023-05-19 19:51:00','2023-05-19 19:51:00',109.00),
	(23,'Merida Lounge Chair','merida-lounge-chair','<p>...</p>','<table class=\"table table--scope-row\" id=\"product-attribute-specs-table\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-width: 1px 0px 0px; border-style: solid; border-color: rgb(247, 245, 241); border-image: initial; border-collapse: initial; border-radius: 0px; border-spacing: 0px; color: rgb(0, 0, 0); line-height: 1.6; margin: 8px 0px; padding: 0px; width: 896px; font-family: &quot;Helvetica Neue&quot;, sans-serif;\"><tbody><tr role=\"row\" style=\"border-bottom: 1px solid rgb(247, 245, 241); padding: 0px;\"><th scope=\"row\" role=\"rowheader\" style=\"background: rgb(251, 251, 251); padding: 16px; text-align: left; border-right: 0px solid rgb(247, 245, 241); border-bottom: 1px solid rgb(247, 245, 241); border-left-width: 0px; font-weight: 400; width: 448px;\">Dimensions H x W x D (cm)</th><td role=\"gridcell\" data-th=\"Dimensions H x W x D (cm)\" style=\"background: rgb(251, 251, 251); padding: 16px; border-bottom: 1px solid rgb(247, 245, 241); border-right: 0px; flex-flow: row nowrap; border-bottom-right-radius: 0px;\">85 x 79 x 78</td></tr></tbody></table>','/storage/photos/1/lounge.png',98,'','new','active',199.00,5.00,1,12,NULL,NULL,'2023-05-20 10:14:49','2023-05-20 11:02:02',99.00);

/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_des` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`)
VALUES
	(1,'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis unde sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis unde omnis iste natus error sit voluptatem Excepteu\r\n\r\n                            sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspi deserunt mollit anim id est laborum. sed ut perspi.','Praesent dapibus, neque id cursus ucibus, tortor neque egestas augue, magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.','/storage/photos/1/logo.png','/storage/photos/1/blog3.jpg','216 Crown Street, Darlinghurst NSW 2010, Australia','+61 2 8916 6468','HELLO@BSEATEDGLOBAL.COM',NULL,'2023-04-30 10:43:24');

/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shippings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shippings`;

CREATE TABLE `shippings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `shippings` WRITE;
/*!40000 ALTER TABLE `shippings` DISABLE KEYS */;

INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`)
VALUES
	(1,'Australia Post',35.00,'active','2020-08-14 11:22:17','2023-05-04 07:13:31'),
	(2,'Fastway',7.50,'active','2020-08-14 11:22:41','2023-05-04 07:13:44'),
	(5,'Omni Parcel',10.50,'active','2023-05-04 07:13:58','2023-05-04 07:13:58');

/*!40000 ALTER TABLE `shippings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'Duong Nguyen Viet','admin@gmail.com',NULL,'$2y$10$GOGIJdzJydYJ5nAZ42iZNO3IL1fdvXoSPdUOH3Ajy5hRmi0xBmTzm','/storage/photos/1/certi1.png','admin',NULL,NULL,'active','9BmbytIysORjQBfcfkGiVorKhXP7LpxoghNaTYWDtpZjWfHqCoImZb5S8eHl',NULL,'2023-04-25 10:27:44'),
	(2,'User','user@gmail.com',NULL,'$2y$10$10jB2lupSfvAUfocjguzSeN95LkwgZJUM7aQBdb2Op7XzJ.BhNoHq','/storage/photos/1/users/user2.jpg','user',NULL,NULL,'active',NULL,NULL,'2020-08-15 14:30:07'),
	(3,'Prajwal Rai','prajwal.iar@gmail.com',NULL,'$2y$10$15ZVMgH040v4Ukf9KSAFiucPJcfDwmeRKCaguVJBXplTs93m48F1G','/storage/photos/1/users/user3.jpg','user',NULL,NULL,'inactive',NULL,'2020-08-11 11:20:58','2023-05-18 15:28:14'),
	(4,'Cynthia Beier','ernestina.wehner@example.net','2020-08-15 04:18:52','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'user',NULL,NULL,'active','fzmQDfEoaP','2020-08-15 04:18:52','2020-08-15 04:18:52'),
	(5,'Prof. Maybell Zulauf','wolf.harvey@example.org','2020-08-15 04:18:52','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'user',NULL,NULL,'active','B8cYq4huyT','2020-08-15 04:18:54','2020-08-15 04:18:54'),
	(6,'Diego Lind II','schroeder.emile@example.net','2020-08-15 04:18:52','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'user',NULL,NULL,'active','xLUaF26dE1','2020-08-15 04:18:54','2020-08-15 04:18:54'),
	(7,'Ian Macejkovic','ashlee16@example.com','2020-08-15 04:18:52','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'user',NULL,NULL,'active','i2ZIKbiM9O','2020-08-13 04:18:54','2020-08-15 04:18:54'),
	(8,'Perry McClure DDS','mayer.ashlynn@example.org','2020-08-15 04:18:52','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'user',NULL,NULL,'active','VD1MlsvW3I','2020-08-15 04:18:55','2020-08-15 04:18:55'),
	(9,'Juana Yost','carter47@example.net','2020-08-15 04:19:50','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'user',NULL,NULL,'active','kARxoay0FT','2020-08-12 04:19:50','2020-08-15 04:19:50'),
	(10,'Louvenia Will DDS','lowell06@example.net','2020-08-15 04:19:50','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'user',NULL,NULL,'inactive','QkbNNnO7ZG','2020-08-11 04:19:50','2023-05-18 15:28:12'),
	(11,'Miss Layla McClure','dcummings@example.com','2020-08-15 04:19:50','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'user',NULL,NULL,'active','DFnCS0bKFa','2020-08-09 04:19:51','2020-08-15 04:19:51'),
	(12,'Mrs. Taya Ziemann','anderson.luz@example.net','2020-08-15 04:19:50','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'user',NULL,NULL,'active','4Xgvb1HnFT','2020-08-10 04:19:51','2020-08-15 04:19:51'),
	(13,'Porter Olson','jaden24@example.com','2020-08-15 04:19:50','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'user',NULL,NULL,'active','gFX2w4WaMj','2020-08-15 04:19:51','2020-08-15 04:19:51'),
	(29,'Prajwal Rai','rae.prajwal@gmail.com',NULL,NULL,NULL,'user','google','110717103019405487938','active',NULL,'2020-08-15 14:36:29','2020-08-15 14:36:29'),
	(30,'harry','harryv@gmail.com',NULL,'$2y$10$tCyp4kIdKOnCmizZ6/lqde.1KDEwtfjPDFn7zHdMoVSjY2L3vqfFC',NULL,'user',NULL,NULL,'active',NULL,'2023-04-25 10:23:59','2023-04-25 10:23:59'),
	(31,'Harry V','harryv1@gmail.com',NULL,'$2y$10$y9fvkx9FeN3Na9Iw5aIyjOdg7QyhvF89BUDQ8ExWcExfOc0Q3OnqK',NULL,'user',NULL,NULL,'active',NULL,'2023-05-17 16:43:46','2023-05-17 16:43:46');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wishlists
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wishlists`;

CREATE TABLE `wishlists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `cart_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `import_price` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlists_product_id_foreign` (`product_id`),
  KEY `wishlists_user_id_foreign` (`user_id`),
  KEY `wishlists_cart_id_foreign` (`cart_id`),
  CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wishlists` WRITE;
/*!40000 ALTER TABLE `wishlists` DISABLE KEYS */;

INSERT INTO `wishlists` (`id`, `product_id`, `cart_id`, `user_id`, `price`, `quantity`, `amount`, `created_at`, `updated_at`, `import_price`)
VALUES
	(1,11,NULL,1,89.10,1,89.10,'2023-05-17 17:11:16','2023-05-17 17:11:16',NULL),
	(2,13,23,30,94.05,1,94.05,'2023-05-18 10:51:31','2023-05-18 15:32:03',NULL),
	(3,17,23,30,113.05,1,113.05,'2023-05-18 15:31:24','2023-05-18 15:32:03',NULL),
	(4,19,32,30,122.55,1,122.55,'2023-05-20 10:27:09','2023-05-20 10:27:14',NULL),
	(5,15,34,30,89.10,1,89.10,'2023-05-20 10:27:43','2023-05-20 14:07:41',NULL),
	(6,22,39,30,161.10,1,161.10,'2023-05-20 16:22:12','2023-05-20 16:22:19',NULL),
	(7,20,40,30,146.64,1,146.64,'2023-05-20 16:22:27','2023-05-20 16:23:38',NULL);

/*!40000 ALTER TABLE `wishlists` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
