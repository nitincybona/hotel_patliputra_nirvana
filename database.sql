-- MySQL dump 10.13  Distrib 8.1.0, for macos14.0 (arm64)
--
-- Host: localhost    Database: miranda
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` VALUES (1,1,'i7xjo6Uf2y1YmHcnorVVLtU4uhPoJ8OD',1,'2024-01-10 23:45:08','2024-01-10 23:45:08','2024-01-10 23:45:08'),(2,2,'GCyvyhTTb5tXkha0fVuL29zbZA7bFqb0',1,'2024-01-10 23:45:08','2024-01-10 23:45:08','2024-01-10 23:45:08');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_notifications`
--

DROP TABLE IF EXISTS `admin_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_notifications`
--

LOCK TABLES `admin_notifications` WRITE;
/*!40000 ALTER TABLE `admin_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_histories`
--

DROP TABLE IF EXISTS `audit_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_user` bigint unsigned NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_histories_user_id_index` (`user_id`),
  KEY `audit_histories_module_index` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_histories`
--

LOCK TABLES `audit_histories` WRITE;
/*!40000 ALTER TABLE `audit_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_index` (`parent_id`),
  KEY `categories_status_index` (`status`),
  KEY `categories_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'General',0,'Blanditiis harum suscipit ut omnis enim harum. Vel veritatis omnis assumenda aut nam et.','published',1,'Botble\\ACL\\Models\\User',NULL,0,0,1,'2024-01-10 23:44:58','2024-01-10 23:44:58'),(2,'Hotel',0,'Magni ipsam perspiciatis laudantium illo magnam. Sapiente sit molestiae nihil sint. Et velit ducimus est dicta numquam.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-01-10 23:44:58','2024-01-10 23:44:58'),(3,'Booking',0,'Fugiat dolorem dolores deserunt fuga temporibus. Ipsum vel qui cumque inventore corrupti. Cum itaque corporis et reprehenderit.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-01-10 23:44:58','2024-01-10 23:44:58'),(4,'Resort',0,'Atque sed est voluptate unde in minus quos dolorem. Architecto distinctio rerum beatae dolorem. Voluptatem officia numquam ipsum nihil. Dolor rerum hic nemo quia ullam sapiente.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-01-10 23:44:58','2024-01-10 23:44:58'),(5,'Travel',0,'Sint ut quo quod eum dolores velit. Praesentium perferendis repellendus ullam corrupti facere est. Repellat voluptatibus ea voluptatum excepturi. Voluptatibus quos expedita necessitatibus sed.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-01-10 23:44:58','2024-01-10 23:44:58');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_translations`
--

LOCK TABLES `categories_translations` WRITE;
/*!40000 ALTER TABLE `categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_replies`
--

DROP TABLE IF EXISTS `contact_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_replies`
--

LOCK TABLES `contact_replies` WRITE;
/*!40000 ALTER TABLE `contact_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widget_settings`
--

DROP TABLE IF EXISTS `dashboard_widget_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widget_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `widget_id` bigint unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  KEY `dashboard_widget_settings_widget_id_index` (`widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widget_settings`
--

LOCK TABLES `dashboard_widget_settings` WRITE;
/*!40000 ALTER TABLE `dashboard_widget_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widget_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widgets`
--

DROP TABLE IF EXISTS `dashboard_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widgets`
--

LOCK TABLES `dashboard_widgets` WRITE;
/*!40000 ALTER TABLE `dashboard_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `galleries_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` VALUES (1,'Duplex Restaurant','Nesciunt numquam ut quia et. Aperiam cupiditate nam et facere sed ipsam officia.',1,0,'galleries/01.jpg',1,'published','2024-01-10 23:45:07','2024-01-10 23:45:07'),(2,'Luxury room','Amet voluptates quae fugiat quos quod nemo. Doloribus non quia nobis soluta ullam. Iure tenetur ut delectus alias. Qui totam officia quos saepe aut.',1,0,'galleries/02.jpg',1,'published','2024-01-10 23:45:07','2024-01-10 23:45:07'),(3,'Pacific Room','Molestiae sed enim doloribus occaecati dignissimos amet quis. Nulla facere aut dolore dolore sit. Rerum totam vitae omnis voluptatem.',1,0,'galleries/03.jpg',1,'published','2024-01-10 23:45:07','2024-01-10 23:45:07'),(4,'Family Room','Facere modi ut praesentium sit numquam quam ut. Aut omnis eos modi consectetur. Eum totam quis esse qui facilis quia. Atque voluptas qui est omnis.',1,0,'galleries/04.jpg',1,'published','2024-01-10 23:45:07','2024-01-10 23:45:07'),(5,'King Bed','Omnis quis praesentium est aliquam rerum impedit sint. Fuga rem et tenetur nihil qui labore sit. Aliquid nisi maiores dolor rerum nihil.',1,0,'galleries/05.jpg',1,'published','2024-01-10 23:45:07','2024-01-10 23:45:07'),(6,'Special Foods','Amet non qui molestias pariatur. Esse et deleniti nihil sint. Officia accusantium ullam omnis fugiat. Nihil vitae voluptas expedita quos aut qui sed.',1,0,'galleries/06.jpg',1,'published','2024-01-10 23:45:07','2024-01-10 23:45:07');
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries_translations`
--

DROP TABLE IF EXISTS `galleries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `galleries_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`galleries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries_translations`
--

LOCK TABLES `galleries_translations` WRITE;
/*!40000 ALTER TABLE `galleries_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `galleries_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_meta`
--

DROP TABLE IF EXISTS `gallery_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `images` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gallery_meta_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_meta`
--

LOCK TABLES `gallery_meta` WRITE;
/*!40000 ALTER TABLE `gallery_meta` DISABLE KEYS */;
INSERT INTO `gallery_meta` VALUES (1,'\"[{\\\"img\\\":\\\"galleries\\\\\\/1.jpg\\\",\\\"description\\\":\\\"Sit saepe ut et cum quam repellat qui. Beatae voluptates voluptatem non et aperiam. Occaecati tenetur et sapiente dolorum.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/2.jpg\\\",\\\"description\\\":\\\"Omnis sint repellendus natus delectus cum similique. Iusto cumque qui hic quaerat. Dolorem consequatur assumenda consequatur eligendi quo.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/3.jpg\\\",\\\"description\\\":\\\"Neque culpa sed vel laborum et. Ipsam deserunt quasi voluptatem ducimus. Et repudiandae consequatur est excepturi numquam.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/4.jpg\\\",\\\"description\\\":\\\"Molestiae molestiae eligendi id. Omnis tempora dignissimos deleniti facere.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/5.jpg\\\",\\\"description\\\":\\\"Ut dolore aspernatur exercitationem sunt corporis velit qui aut. Delectus officiis neque rerum ducimus quae. Et et facilis et quia sunt nobis eos.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/6.jpg\\\",\\\"description\\\":\\\"Qui accusamus iure quisquam at atque iure fugiat. Nihil eius minus est dolor facilis. Quos harum reprehenderit ratione necessitatibus.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/7.jpg\\\",\\\"description\\\":\\\"Culpa eius id et nulla illum natus hic. Est eum aut voluptate praesentium ducimus possimus. Et vel magni delectus aut dolorum non.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/8.jpg\\\",\\\"description\\\":\\\"Quos blanditiis quam tempore. Itaque architecto omnis error dolorum et laborum. Vero autem rerum veritatis provident magnam et voluptatem.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/9.jpg\\\",\\\"description\\\":\\\"Et ut iusto vero. Dolores et qui animi et consequatur. Sed harum libero earum autem.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/10.jpg\\\",\\\"description\\\":\\\"Necessitatibus maxime explicabo et aspernatur qui. Dolorem sequi doloremque vel delectus. Dolore quibusdam ullam similique temporibus rerum.\\\"}]\"',1,'Botble\\Gallery\\Models\\Gallery','2024-01-10 23:45:07','2024-01-10 23:45:07'),(2,'\"[{\\\"img\\\":\\\"galleries\\\\\\/1.jpg\\\",\\\"description\\\":\\\"Sit saepe ut et cum quam repellat qui. Beatae voluptates voluptatem non et aperiam. Occaecati tenetur et sapiente dolorum.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/2.jpg\\\",\\\"description\\\":\\\"Omnis sint repellendus natus delectus cum similique. Iusto cumque qui hic quaerat. Dolorem consequatur assumenda consequatur eligendi quo.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/3.jpg\\\",\\\"description\\\":\\\"Neque culpa sed vel laborum et. Ipsam deserunt quasi voluptatem ducimus. Et repudiandae consequatur est excepturi numquam.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/4.jpg\\\",\\\"description\\\":\\\"Molestiae molestiae eligendi id. Omnis tempora dignissimos deleniti facere.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/5.jpg\\\",\\\"description\\\":\\\"Ut dolore aspernatur exercitationem sunt corporis velit qui aut. Delectus officiis neque rerum ducimus quae. Et et facilis et quia sunt nobis eos.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/6.jpg\\\",\\\"description\\\":\\\"Qui accusamus iure quisquam at atque iure fugiat. Nihil eius minus est dolor facilis. Quos harum reprehenderit ratione necessitatibus.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/7.jpg\\\",\\\"description\\\":\\\"Culpa eius id et nulla illum natus hic. Est eum aut voluptate praesentium ducimus possimus. Et vel magni delectus aut dolorum non.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/8.jpg\\\",\\\"description\\\":\\\"Quos blanditiis quam tempore. Itaque architecto omnis error dolorum et laborum. Vero autem rerum veritatis provident magnam et voluptatem.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/9.jpg\\\",\\\"description\\\":\\\"Et ut iusto vero. Dolores et qui animi et consequatur. Sed harum libero earum autem.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/10.jpg\\\",\\\"description\\\":\\\"Necessitatibus maxime explicabo et aspernatur qui. Dolorem sequi doloremque vel delectus. Dolore quibusdam ullam similique temporibus rerum.\\\"}]\"',2,'Botble\\Gallery\\Models\\Gallery','2024-01-10 23:45:07','2024-01-10 23:45:07'),(3,'\"[{\\\"img\\\":\\\"galleries\\\\\\/1.jpg\\\",\\\"description\\\":\\\"Sit saepe ut et cum quam repellat qui. Beatae voluptates voluptatem non et aperiam. Occaecati tenetur et sapiente dolorum.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/2.jpg\\\",\\\"description\\\":\\\"Omnis sint repellendus natus delectus cum similique. Iusto cumque qui hic quaerat. Dolorem consequatur assumenda consequatur eligendi quo.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/3.jpg\\\",\\\"description\\\":\\\"Neque culpa sed vel laborum et. Ipsam deserunt quasi voluptatem ducimus. Et repudiandae consequatur est excepturi numquam.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/4.jpg\\\",\\\"description\\\":\\\"Molestiae molestiae eligendi id. Omnis tempora dignissimos deleniti facere.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/5.jpg\\\",\\\"description\\\":\\\"Ut dolore aspernatur exercitationem sunt corporis velit qui aut. Delectus officiis neque rerum ducimus quae. Et et facilis et quia sunt nobis eos.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/6.jpg\\\",\\\"description\\\":\\\"Qui accusamus iure quisquam at atque iure fugiat. Nihil eius minus est dolor facilis. Quos harum reprehenderit ratione necessitatibus.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/7.jpg\\\",\\\"description\\\":\\\"Culpa eius id et nulla illum natus hic. Est eum aut voluptate praesentium ducimus possimus. Et vel magni delectus aut dolorum non.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/8.jpg\\\",\\\"description\\\":\\\"Quos blanditiis quam tempore. Itaque architecto omnis error dolorum et laborum. Vero autem rerum veritatis provident magnam et voluptatem.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/9.jpg\\\",\\\"description\\\":\\\"Et ut iusto vero. Dolores et qui animi et consequatur. Sed harum libero earum autem.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/10.jpg\\\",\\\"description\\\":\\\"Necessitatibus maxime explicabo et aspernatur qui. Dolorem sequi doloremque vel delectus. Dolore quibusdam ullam similique temporibus rerum.\\\"}]\"',3,'Botble\\Gallery\\Models\\Gallery','2024-01-10 23:45:07','2024-01-10 23:45:07'),(4,'\"[{\\\"img\\\":\\\"galleries\\\\\\/1.jpg\\\",\\\"description\\\":\\\"Sit saepe ut et cum quam repellat qui. Beatae voluptates voluptatem non et aperiam. Occaecati tenetur et sapiente dolorum.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/2.jpg\\\",\\\"description\\\":\\\"Omnis sint repellendus natus delectus cum similique. Iusto cumque qui hic quaerat. Dolorem consequatur assumenda consequatur eligendi quo.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/3.jpg\\\",\\\"description\\\":\\\"Neque culpa sed vel laborum et. Ipsam deserunt quasi voluptatem ducimus. Et repudiandae consequatur est excepturi numquam.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/4.jpg\\\",\\\"description\\\":\\\"Molestiae molestiae eligendi id. Omnis tempora dignissimos deleniti facere.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/5.jpg\\\",\\\"description\\\":\\\"Ut dolore aspernatur exercitationem sunt corporis velit qui aut. Delectus officiis neque rerum ducimus quae. Et et facilis et quia sunt nobis eos.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/6.jpg\\\",\\\"description\\\":\\\"Qui accusamus iure quisquam at atque iure fugiat. Nihil eius minus est dolor facilis. Quos harum reprehenderit ratione necessitatibus.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/7.jpg\\\",\\\"description\\\":\\\"Culpa eius id et nulla illum natus hic. Est eum aut voluptate praesentium ducimus possimus. Et vel magni delectus aut dolorum non.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/8.jpg\\\",\\\"description\\\":\\\"Quos blanditiis quam tempore. Itaque architecto omnis error dolorum et laborum. Vero autem rerum veritatis provident magnam et voluptatem.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/9.jpg\\\",\\\"description\\\":\\\"Et ut iusto vero. Dolores et qui animi et consequatur. Sed harum libero earum autem.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/10.jpg\\\",\\\"description\\\":\\\"Necessitatibus maxime explicabo et aspernatur qui. Dolorem sequi doloremque vel delectus. Dolore quibusdam ullam similique temporibus rerum.\\\"}]\"',4,'Botble\\Gallery\\Models\\Gallery','2024-01-10 23:45:07','2024-01-10 23:45:07'),(5,'\"[{\\\"img\\\":\\\"galleries\\\\\\/1.jpg\\\",\\\"description\\\":\\\"Sit saepe ut et cum quam repellat qui. Beatae voluptates voluptatem non et aperiam. Occaecati tenetur et sapiente dolorum.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/2.jpg\\\",\\\"description\\\":\\\"Omnis sint repellendus natus delectus cum similique. Iusto cumque qui hic quaerat. Dolorem consequatur assumenda consequatur eligendi quo.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/3.jpg\\\",\\\"description\\\":\\\"Neque culpa sed vel laborum et. Ipsam deserunt quasi voluptatem ducimus. Et repudiandae consequatur est excepturi numquam.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/4.jpg\\\",\\\"description\\\":\\\"Molestiae molestiae eligendi id. Omnis tempora dignissimos deleniti facere.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/5.jpg\\\",\\\"description\\\":\\\"Ut dolore aspernatur exercitationem sunt corporis velit qui aut. Delectus officiis neque rerum ducimus quae. Et et facilis et quia sunt nobis eos.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/6.jpg\\\",\\\"description\\\":\\\"Qui accusamus iure quisquam at atque iure fugiat. Nihil eius minus est dolor facilis. Quos harum reprehenderit ratione necessitatibus.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/7.jpg\\\",\\\"description\\\":\\\"Culpa eius id et nulla illum natus hic. Est eum aut voluptate praesentium ducimus possimus. Et vel magni delectus aut dolorum non.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/8.jpg\\\",\\\"description\\\":\\\"Quos blanditiis quam tempore. Itaque architecto omnis error dolorum et laborum. Vero autem rerum veritatis provident magnam et voluptatem.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/9.jpg\\\",\\\"description\\\":\\\"Et ut iusto vero. Dolores et qui animi et consequatur. Sed harum libero earum autem.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/10.jpg\\\",\\\"description\\\":\\\"Necessitatibus maxime explicabo et aspernatur qui. Dolorem sequi doloremque vel delectus. Dolore quibusdam ullam similique temporibus rerum.\\\"}]\"',5,'Botble\\Gallery\\Models\\Gallery','2024-01-10 23:45:07','2024-01-10 23:45:07'),(6,'\"[{\\\"img\\\":\\\"galleries\\\\\\/1.jpg\\\",\\\"description\\\":\\\"Sit saepe ut et cum quam repellat qui. Beatae voluptates voluptatem non et aperiam. Occaecati tenetur et sapiente dolorum.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/2.jpg\\\",\\\"description\\\":\\\"Omnis sint repellendus natus delectus cum similique. Iusto cumque qui hic quaerat. Dolorem consequatur assumenda consequatur eligendi quo.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/3.jpg\\\",\\\"description\\\":\\\"Neque culpa sed vel laborum et. Ipsam deserunt quasi voluptatem ducimus. Et repudiandae consequatur est excepturi numquam.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/4.jpg\\\",\\\"description\\\":\\\"Molestiae molestiae eligendi id. Omnis tempora dignissimos deleniti facere.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/5.jpg\\\",\\\"description\\\":\\\"Ut dolore aspernatur exercitationem sunt corporis velit qui aut. Delectus officiis neque rerum ducimus quae. Et et facilis et quia sunt nobis eos.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/6.jpg\\\",\\\"description\\\":\\\"Qui accusamus iure quisquam at atque iure fugiat. Nihil eius minus est dolor facilis. Quos harum reprehenderit ratione necessitatibus.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/7.jpg\\\",\\\"description\\\":\\\"Culpa eius id et nulla illum natus hic. Est eum aut voluptate praesentium ducimus possimus. Et vel magni delectus aut dolorum non.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/8.jpg\\\",\\\"description\\\":\\\"Quos blanditiis quam tempore. Itaque architecto omnis error dolorum et laborum. Vero autem rerum veritatis provident magnam et voluptatem.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/9.jpg\\\",\\\"description\\\":\\\"Et ut iusto vero. Dolores et qui animi et consequatur. Sed harum libero earum autem.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/10.jpg\\\",\\\"description\\\":\\\"Necessitatibus maxime explicabo et aspernatur qui. Dolorem sequi doloremque vel delectus. Dolore quibusdam ullam similique temporibus rerum.\\\"}]\"',6,'Botble\\Gallery\\Models\\Gallery','2024-01-10 23:45:07','2024-01-10 23:45:07');
/*!40000 ALTER TABLE `gallery_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_meta_translations`
--

DROP TABLE IF EXISTS `gallery_meta_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_meta_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gallery_meta_id` bigint unsigned NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`gallery_meta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_meta_translations`
--

LOCK TABLES `gallery_meta_translations` WRITE;
/*!40000 ALTER TABLE `gallery_meta_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `gallery_meta_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_amenities`
--

DROP TABLE IF EXISTS `ht_amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_amenities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_amenities`
--

LOCK TABLES `ht_amenities` WRITE;
/*!40000 ALTER TABLE `ht_amenities` DISABLE KEYS */;
INSERT INTO `ht_amenities` VALUES (1,'Air conditioner','fal fa-bath','published','2024-01-10 23:44:58','2024-01-10 23:44:58'),(2,'High speed WiFi','fal fa-wifi','published','2024-01-10 23:44:58','2024-01-10 23:44:58'),(3,'Strong Locker','fal fa-key','published','2024-01-10 23:44:58','2024-01-10 23:44:58'),(4,'Breakfast','fal fa-cut','published','2024-01-10 23:44:58','2024-01-10 23:44:58'),(5,'Kitchen','fal fa-guitar','published','2024-01-10 23:44:58','2024-01-10 23:44:58'),(6,'Smart Security','fal fa-lock','published','2024-01-10 23:44:58','2024-01-10 23:44:58'),(7,'Cleaning','fal fa-broom','published','2024-01-10 23:44:58','2024-01-10 23:44:58'),(8,'Shower','fal fa-shower','published','2024-01-10 23:44:58','2024-01-10 23:44:58'),(9,'24/7 Online Support','fal fa-headphones-alt','published','2024-01-10 23:44:58','2024-01-10 23:44:58'),(10,'Grocery','fal fa-shopping-basket','published','2024-01-10 23:44:58','2024-01-10 23:44:58'),(11,'Single bed','fal fa-bed','published','2024-01-10 23:44:58','2024-01-10 23:44:58'),(12,'Expert Team','fal fa-users','published','2024-01-10 23:44:58','2024-01-10 23:44:58'),(13,'Shop near','fal fa-shopping-cart','published','2024-01-10 23:44:58','2024-01-10 23:44:58'),(14,'Towels','fal fa-bus','published','2024-01-10 23:44:58','2024-01-10 23:44:58');
/*!40000 ALTER TABLE `ht_amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_amenities_translations`
--

DROP TABLE IF EXISTS `ht_amenities_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_amenities_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ht_amenities_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ht_amenities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_amenities_translations`
--

LOCK TABLES `ht_amenities_translations` WRITE;
/*!40000 ALTER TABLE `ht_amenities_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_amenities_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_booking_addresses`
--

DROP TABLE IF EXISTS `ht_booking_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_booking_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `booking_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_booking_addresses`
--

LOCK TABLES `ht_booking_addresses` WRITE;
/*!40000 ALTER TABLE `ht_booking_addresses` DISABLE KEYS */;
INSERT INTO `ht_booking_addresses` VALUES (1,'Quincy','Ward','1-715-819-1833','willis17@example.com','Christmas Island','Pasqualeside','Smithamhaven','00249-6746','4520 Walter Light Suite 954\nWest Evieshire, OK 22071',1,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(2,'Russ','Dietrich','1-303-747-2338','kzboncak@example.net','Greenland','South Sabinachester','Walshfurt','20620-9911','7073 Denesik Stream\nNorth Columbustown, TX 24513',2,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(3,'Annamae','Labadie','239.488.6764','weimann.darien@example.net','Niue','West Nelleside','Port Bertrandview','08340-1349','43830 Clarissa Square\nEast Brycetown, OH 80466-9836',3,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(4,'Zachary','Larson','435-627-8577','jaeden51@example.com','Sudan','Leoneburgh','Emmerichville','99603-8284','759 Jess Expressway\nNorth Carlo, ND 10161-2690',4,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(5,'Katelyn','Rutherford','+1.689.560.5307','richie71@example.net','Falkland Islands (Malvinas)','Port Florencehaven','Torpstad','42133','9578 Edna Vista Apt. 940\nLake Candida, ND 33597-7935',5,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(6,'Aliza','Schultz','1-917-435-6034','ward.adrien@example.com','Bouvet Island (Bouvetoya)','Emmerichville','Lake Kaelaburgh','48293-6776','45396 Doyle Plains\nPort Marysechester, CA 76156',6,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(7,'Martine','Lakin','763.496.1162','viva43@example.org','China','Connieton','North Raquelmouth','08167','514 Blanda Union Apt. 986\nDevonteville, TX 32670-3911',7,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(8,'Fermin','Osinski','+1 (445) 733-3929','tdooley@example.net','Hong Kong','Port Joe','Marquardtborough','71524-1183','1601 Edd Crest\nSatterfieldtown, AR 64644',8,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(9,'Linnie','Wilderman','1-678-370-8498','kautzer.jimmy@example.net','Colombia','West Gina','Karlieville','93882-4464','79910 Brandi Square Apt. 769\nWest Majorbury, NC 64743-1805',9,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(10,'Gregory','Gutkowski','(646) 995-5795','abagail.mraz@example.com','Slovakia (Slovak Republic)','South Lavonside','Terrellview','79939','460 Hartmann Heights Suite 891\nWest Thaddeusmouth, VA 04125',10,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(11,'Alicia','Langworth','570.320.6004','fernando.mcglynn@example.net','Jordan','South Sofia','Leannonburgh','77999','373 Nona Avenue Suite 146\nCronaview, FL 73913',11,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(12,'Justen','Wuckert','+1-509-613-0546','clueilwitz@example.com','Cuba','Murphyport','Konopelskitown','20340-3925','27853 Schaden Wall Suite 824\nLake Ryderfort, ME 11697',12,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(13,'Janet','Abernathy','940.812.4184','dino66@example.org','Myanmar','Bogisichview','North Shawnhaven','25408-3073','62749 Zula Drive\nPeggiemouth, WY 48041',13,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(14,'Loyce','Ziemann','859-305-7913','torrance84@example.org','Chad','Darrellmouth','East Einarfurt','87253','39929 Heaney Parkway\nDawsonland, AR 53431-6309',14,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(15,'Gardner','Schulist','305-404-3054','zachery50@example.org','Uzbekistan','Vernerbury','Mikeland','14514','691 Mary Oval\nWatsicastad, AK 06574',15,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(16,'Francesca','Feest','(575) 680-7783','zieme.dallin@example.net','Botswana','Tillmantown','North Elizaview','59751-7183','1083 Vivienne Court Suite 588\nMaidatown, OH 33744',16,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(17,'Keaton','Nolan','+14435661262','tracey70@example.org','Mongolia','Adrianside','Bartolettichester','03818-7141','592 Reichert Flat\nDorthyview, MS 10479',17,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(18,'Alfonso','Reynolds','+1.863.956.4428','avery.bode@example.com','Mozambique','Port Joshuaburgh','North Robinton','64405-3765','6957 Jamaal Flats\nLoyceland, FL 83640',18,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(19,'Theodora','Erdman','+1-760-458-4844','lblock@example.com','Afghanistan','Lake Alveraberg','New Aurore','64145-4635','36436 Clark Stravenue\nHaleyton, WI 72592-3180',19,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(20,'Wendell','Bergstrom','830.390.5880','smurray@example.net','Venezuela','North Eldora','Bransonstad','49150','970 Shaniya Centers\nLowellside, AK 90745-7986',20,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(21,'Janiya','Thompson','1-747-867-8936','valerie.jacobs@example.com','Turkey','East Macey','Rickyborough','69833','8561 Morar Trail Apt. 368\nRuthemouth, IN 29539',21,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(22,'Wilfredo','Boehm','+19737253223','luettgen.reid@example.org','Grenada','Kellenland','Meredithmouth','27911','950 Miller Stravenue Suite 076\nEast Connieville, NV 98186-9183',22,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(23,'Kaia','Wisozk','(940) 505-9877','foster.gibson@example.com','Togo','McDermottton','Celialand','61290-2117','182 Parisian Plaza\nElainashire, ME 37371',23,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(24,'Malachi','Spinka','973.437.2373','monte.gleichner@example.org','Latvia','Vincentchester','Marcellaview','20826','5655 Camren Trace Suite 331\nMariettaton, NV 06020',24,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(25,'Rosetta','Raynor','(341) 726-3153','gkling@example.org','Nauru','Okunevamouth','Weimannfurt','42511-9018','29734 Blanda Port Apt. 242\nErnserstad, WV 25288-4291',25,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(26,'Walton','Altenwerth','(650) 875-9486','amie.sanford@example.org','Central African Republic','Predovicland','South Tanner','71540','8944 Ratke Keys\nLake Israelport, NE 41013',26,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(27,'Hassan','Monahan','1-216-425-8609','kohler.glenna@example.org','Andorra','East Erikashire','Kelsiemouth','96157-9581','86362 Florence Islands Apt. 631\nMadilynview, WI 50573-9576',27,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(28,'Esta','Willms','+1-701-892-9121','feil.jack@example.com','Panama','Dickiville','Noemiville','39139-7733','6796 Cartwright Union\nCarytown, OH 64254',28,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(29,'Makayla','Marvin','1-972-361-6360','tkutch@example.net','Saint Martin','Johnsonport','North Vita','57696','81297 Nova Ridge Apt. 042\nCronintown, OK 26963-0139',29,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(30,'Oda','Howe','458.853.2916','esta77@example.net','Puerto Rico','West Cara','Turnerhaven','34122','7291 Trantow Roads\nPort Bonita, WI 44162',30,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(31,'Gregg','Ratke','724.204.8761','lois76@example.net','Brunei Darussalam','East Eladio','New Abdullahton','96000','3707 Chaim Burg\nNorth Pasqualeside, AR 51757',31,'2024-01-10 23:45:12','2024-01-10 23:45:12');
/*!40000 ALTER TABLE `ht_booking_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_booking_rooms`
--

DROP TABLE IF EXISTS `ht_booking_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_booking_rooms` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint unsigned NOT NULL,
  `room_id` bigint unsigned DEFAULT NULL,
  `room_image` text COLLATE utf8mb4_unicode_ci,
  `room_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `number_of_rooms` int NOT NULL DEFAULT '1',
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_booking_rooms`
--

LOCK TABLES `ht_booking_rooms` WRITE;
/*!40000 ALTER TABLE `ht_booking_rooms` DISABLE KEYS */;
INSERT INTO `ht_booking_rooms` VALUES (1,1,4,'rooms/04.jpg','Junior Suite',193.00,NULL,3,'2024-01-01','2024-01-02','2024-01-10 23:45:11','2024-01-10 23:45:11'),(2,2,5,'rooms/05.jpg','Family Suite',114.00,NULL,3,'2024-01-02','2024-01-03','2024-01-10 23:45:11','2024-01-10 23:45:11'),(3,3,3,'rooms/03.jpg','Pacific Room',198.00,NULL,2,'2024-01-03','2024-01-04','2024-01-10 23:45:11','2024-01-10 23:45:11'),(4,4,7,'rooms/01.jpg','Luxury Suite',183.00,NULL,2,'2024-01-04','2024-01-06','2024-01-10 23:45:11','2024-01-10 23:45:11'),(5,5,7,'rooms/01.jpg','Luxury Suite',183.00,NULL,2,'2024-01-05','2024-01-08','2024-01-10 23:45:11','2024-01-10 23:45:11'),(6,6,3,'rooms/03.jpg','Pacific Room',198.00,NULL,2,'2024-01-06','2024-01-09','2024-01-10 23:45:11','2024-01-10 23:45:11'),(7,7,1,'rooms/01.jpg','Luxury Hall Of Fame',113.00,NULL,3,'2024-01-07','2024-01-10','2024-01-10 23:45:11','2024-01-10 23:45:11'),(8,8,5,'rooms/05.jpg','Family Suite',114.00,NULL,1,'2024-01-08','2024-01-11','2024-01-10 23:45:11','2024-01-10 23:45:11'),(9,9,5,'rooms/05.jpg','Family Suite',114.00,NULL,2,'2024-01-09','2024-01-12','2024-01-10 23:45:11','2024-01-10 23:45:11'),(10,10,4,'rooms/04.jpg','Junior Suite',193.00,NULL,2,'2024-01-10','2024-01-12','2024-01-10 23:45:11','2024-01-10 23:45:11'),(11,11,6,'rooms/06.jpg','Relax Suite',150.00,NULL,1,'2024-01-11','2024-01-12','2024-01-10 23:45:11','2024-01-10 23:45:11'),(12,12,4,'rooms/04.jpg','Junior Suite',193.00,NULL,2,'2024-01-12','2024-01-13','2024-01-10 23:45:11','2024-01-10 23:45:11'),(13,13,1,'rooms/01.jpg','Luxury Hall Of Fame',113.00,NULL,1,'2024-01-13','2024-01-15','2024-01-10 23:45:11','2024-01-10 23:45:11'),(14,14,6,'rooms/06.jpg','Relax Suite',150.00,NULL,2,'2024-01-14','2024-01-15','2024-01-10 23:45:12','2024-01-10 23:45:12'),(15,15,3,'rooms/03.jpg','Pacific Room',198.00,NULL,3,'2024-01-15','2024-01-18','2024-01-10 23:45:12','2024-01-10 23:45:12'),(16,16,5,'rooms/05.jpg','Family Suite',114.00,NULL,1,'2024-01-16','2024-01-18','2024-01-10 23:45:12','2024-01-10 23:45:12'),(17,17,2,'rooms/02.jpg','Pendora Fame',168.00,NULL,1,'2024-01-17','2024-01-20','2024-01-10 23:45:12','2024-01-10 23:45:12'),(18,18,1,'rooms/01.jpg','Luxury Hall Of Fame',113.00,NULL,3,'2024-01-18','2024-01-20','2024-01-10 23:45:12','2024-01-10 23:45:12'),(19,19,8,'rooms/02.jpg','President Room',163.00,NULL,1,'2024-01-19','2024-01-22','2024-01-10 23:45:12','2024-01-10 23:45:12'),(20,20,4,'rooms/04.jpg','Junior Suite',193.00,NULL,1,'2024-01-20','2024-01-23','2024-01-10 23:45:12','2024-01-10 23:45:12'),(21,21,1,'rooms/01.jpg','Luxury Hall Of Fame',113.00,NULL,1,'2024-01-21','2024-01-23','2024-01-10 23:45:12','2024-01-10 23:45:12'),(22,22,3,'rooms/03.jpg','Pacific Room',198.00,NULL,2,'2024-01-22','2024-01-25','2024-01-10 23:45:12','2024-01-10 23:45:12'),(23,23,8,'rooms/02.jpg','President Room',163.00,NULL,1,'2024-01-23','2024-01-25','2024-01-10 23:45:12','2024-01-10 23:45:12'),(24,24,3,'rooms/03.jpg','Pacific Room',198.00,NULL,2,'2024-01-24','2024-01-26','2024-01-10 23:45:12','2024-01-10 23:45:12'),(25,25,2,'rooms/02.jpg','Pendora Fame',168.00,NULL,1,'2024-01-25','2024-01-26','2024-01-10 23:45:12','2024-01-10 23:45:12'),(26,26,7,'rooms/01.jpg','Luxury Suite',183.00,NULL,1,'2024-01-26','2024-01-27','2024-01-10 23:45:12','2024-01-10 23:45:12'),(27,27,6,'rooms/06.jpg','Relax Suite',150.00,NULL,2,'2024-01-27','2024-01-30','2024-01-10 23:45:12','2024-01-10 23:45:12'),(28,28,4,'rooms/04.jpg','Junior Suite',193.00,NULL,3,'2024-01-28','2024-01-30','2024-01-10 23:45:12','2024-01-10 23:45:12'),(29,29,8,'rooms/02.jpg','President Room',163.00,NULL,2,'2024-01-29','2024-02-01','2024-01-10 23:45:12','2024-01-10 23:45:12'),(30,30,3,'rooms/03.jpg','Pacific Room',198.00,NULL,3,'2024-01-30','2024-02-01','2024-01-10 23:45:12','2024-01-10 23:45:12'),(31,31,4,'rooms/04.jpg','Junior Suite',193.00,NULL,2,'2024-01-31','2024-02-01','2024-01-10 23:45:12','2024-01-10 23:45:12');
/*!40000 ALTER TABLE `ht_booking_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_booking_services`
--

DROP TABLE IF EXISTS `ht_booking_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_booking_services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint unsigned NOT NULL,
  `service_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_booking_services`
--

LOCK TABLES `ht_booking_services` WRITE;
/*!40000 ALTER TABLE `ht_booking_services` DISABLE KEYS */;
INSERT INTO `ht_booking_services` VALUES (1,1,2),(2,2,6),(3,3,2),(4,4,2),(5,5,5),(6,6,1),(7,7,6),(8,8,5),(9,9,5),(10,10,6),(11,11,4),(12,12,5),(13,13,4),(14,14,1),(15,15,3),(16,16,5),(17,17,5),(18,18,3),(19,19,1),(20,20,4),(21,21,2),(22,22,3),(23,23,2),(24,24,6),(25,25,6),(26,26,1),(27,27,6),(28,28,4),(29,29,2),(30,30,3),(31,31,2);
/*!40000 ALTER TABLE `ht_booking_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_bookings`
--

DROP TABLE IF EXISTS `ht_bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_bookings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `amount` decimal(15,2) NOT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `coupon_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `coupon_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_amount` decimal(15,2) NOT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `requests` text COLLATE utf8mb4_unicode_ci,
  `arrival_time` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_of_guests` int DEFAULT NULL,
  `payment_id` bigint unsigned DEFAULT NULL,
  `customer_id` bigint unsigned DEFAULT NULL,
  `transaction_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_bookings`
--

LOCK TABLES `ht_bookings` WRITE;
/*!40000 ALTER TABLE `ht_bookings` DISABLE KEYS */;
INSERT INTO `ht_bookings` VALUES (1,579.00,579.00,0.00,NULL,0.00,NULL,'Sunt culpa ea tempora officia.',NULL,3,1,4,'XYI8RDMhSJEbukkYHmnV','cancelled','2024-01-10 23:45:11','2024-01-10 23:45:11'),(2,342.00,342.00,0.00,NULL,0.00,NULL,'Officia nostrum nesciunt soluta eos incidunt officiis.',NULL,9,2,9,'h2yg3jeEoJ3TCWaAPL0Q','processing','2024-01-10 23:45:11','2024-01-10 23:45:11'),(3,396.00,396.00,0.00,NULL,0.00,NULL,'Tempore omnis est minus magni error molestiae explicabo accusamus.',NULL,2,3,1,'Bubq6JXb5j3FwDNruOez','processing','2024-01-10 23:45:11','2024-01-10 23:45:11'),(4,366.00,366.00,0.00,NULL,0.00,NULL,'Dolorem distinctio illo voluptatem quisquam quos esse qui.',NULL,4,4,7,'4z2ZUflV8XSiyiP5f36i','pending','2024-01-10 23:45:11','2024-01-10 23:45:11'),(5,366.00,366.00,0.00,NULL,0.00,NULL,'Inventore praesentium occaecati blanditiis a quae similique aut.',NULL,4,5,7,'XKTjh84jEKuqEUS8gpw9','cancelled','2024-01-10 23:45:11','2024-01-10 23:45:11'),(6,396.00,396.00,0.00,NULL,0.00,NULL,'Maiores dignissimos laboriosam assumenda quidem asperiores accusantium.',NULL,4,6,8,'uUZAKGU9PW2YyojRP0oG','cancelled','2024-01-10 23:45:11','2024-01-10 23:45:11'),(7,339.00,339.00,0.00,NULL,0.00,NULL,'Veniam provident vitae assumenda consequuntur.',NULL,3,7,10,'HI716kQ2m5v2yA0g62Z3','pending','2024-01-10 23:45:11','2024-01-10 23:45:11'),(8,114.00,114.00,0.00,NULL,0.00,NULL,'At aspernatur et earum nobis qui.',NULL,2,8,11,'mQUaKoH4UC02cjI5oALD','completed','2024-01-10 23:45:11','2024-01-10 23:45:11'),(9,228.00,228.00,0.00,NULL,0.00,NULL,'Quibusdam doloremque sapiente ea eius facilis ducimus et.',NULL,6,9,4,'jN2NIKsXtAHoi6iaCgYr','pending','2024-01-10 23:45:11','2024-01-10 23:45:11'),(10,386.00,386.00,0.00,NULL,0.00,NULL,'Explicabo qui nulla officia et totam et.',NULL,2,10,1,'G7FwV48Q0ijZUggAHw2e','processing','2024-01-10 23:45:11','2024-01-10 23:45:11'),(11,150.00,150.00,0.00,NULL,0.00,NULL,'Sapiente molestias omnis vero reiciendis cumque ea repudiandae distinctio.',NULL,1,11,11,'ZnwhYK0H54ZQDIQbK3Y3','completed','2024-01-10 23:45:11','2024-01-10 23:45:11'),(12,386.00,386.00,0.00,NULL,0.00,NULL,'Nisi perspiciatis expedita fugiat sed deserunt.',NULL,2,12,8,'sHKMtkoU454K3Z1xpvZd','pending','2024-01-10 23:45:11','2024-01-10 23:45:11'),(13,113.00,113.00,0.00,NULL,0.00,NULL,'Ullam perspiciatis eligendi ex beatae aut earum animi autem.',NULL,1,13,6,'kXMfWFYHR6z0x3glhN41','processing','2024-01-10 23:45:11','2024-01-10 23:45:11'),(14,300.00,300.00,0.00,NULL,0.00,NULL,'Ipsum est non tenetur vel minus.',NULL,6,14,8,'EqxrTsq167NUMkRzOhYh','pending','2024-01-10 23:45:12','2024-01-10 23:45:12'),(15,594.00,594.00,0.00,NULL,0.00,NULL,'Quasi assumenda officiis et.',NULL,3,15,11,'4t5uSWYLy4yRFf5NU3hk','completed','2024-01-10 23:45:12','2024-01-10 23:45:12'),(16,114.00,114.00,0.00,NULL,0.00,NULL,'Et necessitatibus aperiam quibusdam explicabo dolorem.',NULL,3,16,3,'Aj4eVUCcAgw5VjodT2nb','completed','2024-01-10 23:45:12','2024-01-10 23:45:12'),(17,168.00,168.00,0.00,NULL,0.00,NULL,'Corporis excepturi eos autem esse a quasi quae.',NULL,1,17,10,'qpfNYypRvKFj4ma1L4sf','processing','2024-01-10 23:45:12','2024-01-10 23:45:12'),(18,339.00,339.00,0.00,NULL,0.00,NULL,'Quibusdam ratione quia reprehenderit odit illum.',NULL,3,18,8,'VCPFL4tkYTO88MM687gO','completed','2024-01-10 23:45:12','2024-01-10 23:45:12'),(19,163.00,163.00,0.00,NULL,0.00,NULL,'Pariatur asperiores cumque architecto.',NULL,1,19,3,'A6qN5PPmIwDznWOc8Z0e','completed','2024-01-10 23:45:12','2024-01-10 23:45:12'),(20,193.00,193.00,0.00,NULL,0.00,NULL,'Reprehenderit sunt beatae natus.',NULL,1,20,1,'EW3sYbtVQ01mhbar18ua','pending','2024-01-10 23:45:12','2024-01-10 23:45:12'),(21,113.00,113.00,0.00,NULL,0.00,NULL,'Est officiis et nulla corrupti ratione.',NULL,3,21,5,'2wb9hWHNzDfZ0j6P9zta','completed','2024-01-10 23:45:12','2024-01-10 23:45:12'),(22,396.00,396.00,0.00,NULL,0.00,NULL,'Nihil voluptate praesentium sed.',NULL,4,22,7,'2ZBmTlbSPYiUteGxUXBJ','pending','2024-01-10 23:45:12','2024-01-10 23:45:12'),(23,163.00,163.00,0.00,NULL,0.00,NULL,'Neque ipsum qui sequi eius expedita qui.',NULL,1,23,3,'7nLZ7FvwNUxxVALTvvpa','cancelled','2024-01-10 23:45:12','2024-01-10 23:45:12'),(24,396.00,396.00,0.00,NULL,0.00,NULL,'Cumque blanditiis reprehenderit nulla ea in perspiciatis.',NULL,6,24,8,'mxjU1YiwV0VvokcfWt5N','completed','2024-01-10 23:45:12','2024-01-10 23:45:12'),(25,168.00,168.00,0.00,NULL,0.00,NULL,'Qui quam expedita voluptatem ullam quaerat molestiae.',NULL,1,25,6,'Wnt4AuvPcoITdQSmcf3T','completed','2024-01-10 23:45:12','2024-01-10 23:45:12'),(26,183.00,183.00,0.00,NULL,0.00,NULL,'Consequatur et tempora est voluptas doloremque laborum.',NULL,2,26,7,'rLuUh4lkYQYEV5QcBCE9','completed','2024-01-10 23:45:12','2024-01-10 23:45:12'),(27,300.00,300.00,0.00,NULL,0.00,NULL,'Rerum facilis odio officia distinctio.',NULL,2,27,2,'kJQkQmBkcDEvB6cQoFys','processing','2024-01-10 23:45:12','2024-01-10 23:45:12'),(28,579.00,579.00,0.00,NULL,0.00,NULL,'Ut laboriosam et magnam assumenda.',NULL,3,28,10,'7m4udMWPIHBAPlWnxZLG','pending','2024-01-10 23:45:12','2024-01-10 23:45:12'),(29,326.00,326.00,0.00,NULL,0.00,NULL,'Dolores laborum voluptates eveniet molestiae.',NULL,4,29,5,'rlHpytzU5YyaqYKyZD50','completed','2024-01-10 23:45:12','2024-01-10 23:45:12'),(30,594.00,594.00,0.00,NULL,0.00,NULL,'Blanditiis exercitationem consequatur et et deleniti occaecati aliquid.',NULL,6,30,9,'7BtgpD0gxPG0VmNoiNcT','processing','2024-01-10 23:45:12','2024-01-10 23:45:12'),(31,386.00,386.00,0.00,NULL,0.00,NULL,'Ut excepturi eveniet voluptatem ut.',NULL,4,31,1,'lmJF7ga3tUf5kzG329NN','pending','2024-01-10 23:45:12','2024-01-10 23:45:12');
/*!40000 ALTER TABLE `ht_bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_coupons`
--

DROP TABLE IF EXISTS `ht_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_coupons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `quantity` int DEFAULT NULL,
  `total_used` int unsigned NOT NULL DEFAULT '0',
  `expires_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ht_coupons_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_coupons`
--

LOCK TABLES `ht_coupons` WRITE;
/*!40000 ALTER TABLE `ht_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_currencies`
--

DROP TABLE IF EXISTS `ht_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_prefix_symbol` tinyint unsigned NOT NULL DEFAULT '0',
  `decimals` tinyint unsigned NOT NULL DEFAULT '0',
  `order` int unsigned NOT NULL DEFAULT '0',
  `is_default` tinyint NOT NULL DEFAULT '0',
  `exchange_rate` double NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_currencies`
--

LOCK TABLES `ht_currencies` WRITE;
/*!40000 ALTER TABLE `ht_currencies` DISABLE KEYS */;
INSERT INTO `ht_currencies` VALUES (1,'USD','$',1,2,0,1,1,'2024-01-10 23:44:58','2024-01-10 23:44:58'),(2,'EUR','€',0,2,1,0,0.91,'2024-01-10 23:44:58','2024-01-10 23:44:58'),(3,'VND','₫',0,0,2,0,23717.5,'2024-01-10 23:44:58','2024-01-10 23:44:58');
/*!40000 ALTER TABLE `ht_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_customer_password_resets`
--

DROP TABLE IF EXISTS `ht_customer_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_customer_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_customer_password_resets`
--

LOCK TABLES `ht_customer_password_resets` WRITE;
/*!40000 ALTER TABLE `ht_customer_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_customer_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_customers`
--

DROP TABLE IF EXISTS `ht_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ht_customers_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_customers`
--

LOCK TABLES `ht_customers` WRITE;
/*!40000 ALTER TABLE `ht_customers` DISABLE KEYS */;
INSERT INTO `ht_customers` VALUES (1,'Eugene','Goldner','hmedhurst@example.com','$2y$12$5hcgan5Zq2kkovvAbb1DU.6pyiupFKJ25ArUTstnz4V1hYUieTacu','customers/1.jpg',NULL,'+12247271011',NULL,NULL,NULL,NULL,NULL,'2024-01-10 23:45:04','2024-01-10 23:45:04',NULL,NULL),(2,'Cade','Lakin','jlabadie@example.com','$2y$12$NpF5bJVh22rkYsDoZomKUekIsZJcR2zBSwHLwbTyHpAMtrC98rp4.','customers/2.jpg',NULL,'+14014934242',NULL,NULL,NULL,NULL,NULL,'2024-01-10 23:45:04','2024-01-10 23:45:04',NULL,NULL),(3,'Meaghan','Tromp','qward@example.net','$2y$12$eHzwskiG2.yjx6CFq0343O7qadDWoFppn4W49idxV.rmJAoESm5XG','customers/3.jpg',NULL,'+15315484054',NULL,NULL,NULL,NULL,NULL,'2024-01-10 23:45:04','2024-01-10 23:45:04',NULL,NULL),(4,'Nicolas','Durgan','lafayette.sawayn@example.org','$2y$12$MtSzkKsn35CIb280elwAoeGcNqpPpLHsslqVqXHSdUbOo2Zakiq4y','customers/4.jpg',NULL,'+17637265996',NULL,NULL,NULL,NULL,NULL,'2024-01-10 23:45:04','2024-01-10 23:45:04',NULL,NULL),(5,'Robyn','Harvey','morar.gudrun@example.com','$2y$12$jG2y6.ErrGe5Tbdsl8vwIOI0YfEEwN7OVUmMC6QbKhFArUxS7X5ry','customers/5.jpg',NULL,'+15599373741',NULL,NULL,NULL,NULL,NULL,'2024-01-10 23:45:04','2024-01-10 23:45:04',NULL,NULL),(6,'Carlie','Lowe','tamia.bartoletti@example.com','$2y$12$RVzgFH/1SauSzA522946Huq4z6OMcquF4YTEsk4vACsQyZRGxwI8u','customers/6.jpg',NULL,'+16409046003',NULL,NULL,NULL,NULL,NULL,'2024-01-10 23:45:04','2024-01-10 23:45:04',NULL,NULL),(7,'Breanna','Wiza','elmira32@example.org','$2y$12$tswoLAvAOhvd9qU5pYa5ZO8Mzo4/q56s8p14uwfYAynMQhrIgTFyG','customers/7.jpg',NULL,'+14157379147',NULL,NULL,NULL,NULL,NULL,'2024-01-10 23:45:04','2024-01-10 23:45:04',NULL,NULL),(8,'Evans','Zemlak','ryan75@example.org','$2y$12$uZGUuIvX1Xji3hlvlQhGVeCuZErjnfwyuFNMrLc9ULfHA14lSlLPC','customers/8.jpg',NULL,'+12407673433',NULL,NULL,NULL,NULL,NULL,'2024-01-10 23:45:04','2024-01-10 23:45:04',NULL,NULL),(9,'Reta','Cormier','lavinia23@example.org','$2y$12$UftR95uD19B.lfGCk0VFTOgbhHQGM3kz188qRAG18oJYg.W69.szy','customers/9.jpg',NULL,'+18022716813',NULL,NULL,NULL,NULL,NULL,'2024-01-10 23:45:04','2024-01-10 23:45:04',NULL,NULL),(10,'Donato','Sauer','hsipes@example.com','$2y$12$Z.SGSPonvMt9FB.59M0RNedav6FRS3vWRCS/6rToFt7wyXDrv2kHK','customers/10.jpg',NULL,'+13528247741',NULL,NULL,NULL,NULL,NULL,'2024-01-10 23:45:04','2024-01-10 23:45:04',NULL,NULL),(11,'Lois','Koss','customer@archielite.com','$2y$12$A9C9SBN/30nVwAXHjddV9.jsd5ebrhTWp82wEYHUih569dTGU1RFu','customers/3.jpg',NULL,'+12289465060',NULL,NULL,NULL,NULL,NULL,'2024-01-10 23:45:04','2024-01-10 23:45:04',NULL,NULL);
/*!40000 ALTER TABLE `ht_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_features`
--

DROP TABLE IF EXISTS `ht_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_features` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `icon` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_features`
--

LOCK TABLES `ht_features` WRITE;
/*!40000 ALTER TABLE `ht_features` DISABLE KEYS */;
INSERT INTO `ht_features` VALUES (1,'Have High Rating','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','flaticon-rating',1,'published','2024-01-10 23:45:01','2024-01-10 23:45:01'),(2,'Quiet Hours','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','flaticon-clock',1,'published','2024-01-10 23:45:01','2024-01-10 23:45:01'),(3,'Best Locations','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','flaticon-location-pin',1,'published','2024-01-10 23:45:01','2024-01-10 23:45:01'),(4,'Free Cancellation','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','flaticon-clock-1',0,'published','2024-01-10 23:45:01','2024-01-10 23:45:01'),(5,'Payment Options','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','flaticon-credit-card',0,'published','2024-01-10 23:45:01','2024-01-10 23:45:01'),(6,'Special Offers','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','flaticon-discount',0,'published','2024-01-10 23:45:01','2024-01-10 23:45:01');
/*!40000 ALTER TABLE `ht_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_features_translations`
--

DROP TABLE IF EXISTS `ht_features_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_features_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ht_features_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ht_features_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_features_translations`
--

LOCK TABLES `ht_features_translations` WRITE;
/*!40000 ALTER TABLE `ht_features_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_features_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_food_types`
--

DROP TABLE IF EXISTS `ht_food_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_food_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_food_types`
--

LOCK TABLES `ht_food_types` WRITE;
/*!40000 ALTER TABLE `ht_food_types` DISABLE KEYS */;
INSERT INTO `ht_food_types` VALUES (1,'Chicken','flaticon-boiled','published','2024-01-10 23:44:59','2024-01-10 23:44:59'),(2,'Italian','flaticon-pizza','published','2024-01-10 23:44:59','2024-01-10 23:44:59'),(3,'Coffee','flaticon-coffee','published','2024-01-10 23:44:59','2024-01-10 23:44:59'),(4,'Bake Cake','flaticon-cake','published','2024-01-10 23:44:59','2024-01-10 23:44:59'),(5,'Cookies','flaticon-cookie','published','2024-01-10 23:44:59','2024-01-10 23:44:59'),(6,'Cocktail','flaticon-cocktail','published','2024-01-10 23:44:59','2024-01-10 23:44:59');
/*!40000 ALTER TABLE `ht_food_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_food_types_translations`
--

DROP TABLE IF EXISTS `ht_food_types_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_food_types_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ht_food_types_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ht_food_types_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_food_types_translations`
--

LOCK TABLES `ht_food_types_translations` WRITE;
/*!40000 ALTER TABLE `ht_food_types_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_food_types_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_foods`
--

DROP TABLE IF EXISTS `ht_foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_foods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(15,0) unsigned DEFAULT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `food_type_id` bigint unsigned NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_foods`
--

LOCK TABLES `ht_foods` WRITE;
/*!40000 ALTER TABLE `ht_foods` DISABLE KEYS */;
INSERT INTO `ht_foods` VALUES (1,'Eggs &amp; Bacon','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',147,NULL,1,'foods/01.jpg','published','2024-01-10 23:45:01','2024-01-10 23:45:01'),(2,'Tea or Coffee','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',129,NULL,1,'foods/02.jpg','published','2024-01-10 23:45:01','2024-01-10 23:45:01'),(3,'Chia Oatmeal','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',155,NULL,1,'foods/03.jpg','published','2024-01-10 23:45:01','2024-01-10 23:45:01'),(4,'Juice','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',105,NULL,1,'foods/04.jpg','published','2024-01-10 23:45:01','2024-01-10 23:45:01'),(5,'Chia Oatmeal','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',149,NULL,2,'foods/05.jpg','published','2024-01-10 23:45:01','2024-01-10 23:45:01'),(6,'Fruit Parfait','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',198,NULL,2,'foods/06.jpg','published','2024-01-10 23:45:01','2024-01-10 23:45:01'),(7,'Marmalade Selection','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',161,NULL,3,'foods/07.jpg','published','2024-01-10 23:45:01','2024-01-10 23:45:01'),(8,'Cheese Platen','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',161,NULL,4,'foods/08.jpg','published','2024-01-10 23:45:01','2024-01-10 23:45:01'),(9,'Avocado Toast','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',134,NULL,5,'foods/09.jpg','published','2024-01-10 23:45:01','2024-01-10 23:45:01'),(10,'Avocado Toast','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',134,NULL,6,'foods/10.jpg','published','2024-01-10 23:45:01','2024-01-10 23:45:01');
/*!40000 ALTER TABLE `ht_foods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_foods_translations`
--

DROP TABLE IF EXISTS `ht_foods_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_foods_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ht_foods_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ht_foods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_foods_translations`
--

LOCK TABLES `ht_foods_translations` WRITE;
/*!40000 ALTER TABLE `ht_foods_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_foods_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_invoice_items`
--

DROP TABLE IF EXISTS `ht_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_invoice_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int unsigned NOT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `amount` decimal(15,2) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_invoice_items`
--

LOCK TABLES `ht_invoice_items` WRITE;
/*!40000 ALTER TABLE `ht_invoice_items` DISABLE KEYS */;
INSERT INTO `ht_invoice_items` VALUES (1,1,'Junior Suite','',1,193.00,0.00,0.00,193.00,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(2,1,'Car Rental (extra service)','',1,30.00,0.00,0.00,30.00,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(3,2,'Family Suite','',1,114.00,0.00,0.00,114.00,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(4,2,'Breakfast (extra service)','',1,10.00,0.00,0.00,10.00,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(5,3,'Pacific Room','',1,198.00,0.00,0.00,198.00,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(6,3,'Car Rental (extra service)','',1,30.00,0.00,0.00,30.00,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(7,4,'Luxury Suite','',1,183.00,0.00,0.00,183.00,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(8,4,'Car Rental (extra service)','',1,30.00,0.00,0.00,30.00,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(9,5,'Luxury Suite','',1,183.00,0.00,0.00,183.00,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(10,5,'Laundry (extra service)','',1,10.00,0.00,0.00,10.00,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(11,6,'Pacific Room','',1,198.00,0.00,0.00,198.00,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(12,6,'Wifi (extra service)','',1,100.00,0.00,0.00,100.00,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(13,7,'Luxury Hall Of Fame','',1,113.00,0.00,0.00,113.00,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(14,7,'Breakfast (extra service)','',1,10.00,0.00,0.00,10.00,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(15,8,'Family Suite','',1,114.00,0.00,0.00,114.00,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(16,8,'Laundry (extra service)','',1,10.00,0.00,0.00,10.00,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(17,9,'Family Suite','',1,114.00,0.00,0.00,114.00,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(18,9,'Laundry (extra service)','',1,10.00,0.00,0.00,10.00,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(19,10,'Junior Suite','',1,193.00,0.00,0.00,193.00,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(20,10,'Breakfast (extra service)','',1,10.00,0.00,0.00,10.00,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(21,11,'Relax Suite','',1,150.00,0.00,0.00,150.00,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(22,11,'Sea View (extra service)','',1,10.00,0.00,0.00,10.00,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(23,12,'Junior Suite','',1,193.00,0.00,0.00,193.00,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(24,12,'Laundry (extra service)','',1,10.00,0.00,0.00,10.00,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(25,13,'Luxury Hall Of Fame','',1,113.00,0.00,0.00,113.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(26,13,'Sea View (extra service)','',1,10.00,0.00,0.00,10.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(27,14,'Relax Suite','',1,150.00,0.00,0.00,150.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(28,14,'Wifi (extra service)','',1,100.00,0.00,0.00,100.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(29,15,'Pacific Room','',1,198.00,0.00,0.00,198.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(30,15,'Satellite TV (extra service)','',1,50.00,0.00,0.00,50.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(31,16,'Family Suite','',1,114.00,0.00,0.00,114.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(32,16,'Laundry (extra service)','',1,10.00,0.00,0.00,10.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(33,17,'Pendora Fame','',1,168.00,0.00,0.00,168.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(34,17,'Laundry (extra service)','',1,10.00,0.00,0.00,10.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(35,18,'Luxury Hall Of Fame','',1,113.00,0.00,0.00,113.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(36,18,'Satellite TV (extra service)','',1,50.00,0.00,0.00,50.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(37,19,'President Room','',1,163.00,0.00,0.00,163.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(38,19,'Wifi (extra service)','',1,100.00,0.00,0.00,100.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(39,20,'Junior Suite','',1,193.00,0.00,0.00,193.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(40,20,'Sea View (extra service)','',1,10.00,0.00,0.00,10.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(41,21,'Luxury Hall Of Fame','',1,113.00,0.00,0.00,113.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(42,21,'Car Rental (extra service)','',1,30.00,0.00,0.00,30.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(43,22,'Pacific Room','',1,198.00,0.00,0.00,198.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(44,22,'Satellite TV (extra service)','',1,50.00,0.00,0.00,50.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(45,23,'President Room','',1,163.00,0.00,0.00,163.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(46,23,'Car Rental (extra service)','',1,30.00,0.00,0.00,30.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(47,24,'Pacific Room','',1,198.00,0.00,0.00,198.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(48,24,'Breakfast (extra service)','',1,10.00,0.00,0.00,10.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(49,25,'Pendora Fame','',1,168.00,0.00,0.00,168.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(50,25,'Breakfast (extra service)','',1,10.00,0.00,0.00,10.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(51,26,'Luxury Suite','',1,183.00,0.00,0.00,183.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(52,26,'Wifi (extra service)','',1,100.00,0.00,0.00,100.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(53,27,'Relax Suite','',1,150.00,0.00,0.00,150.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(54,27,'Breakfast (extra service)','',1,10.00,0.00,0.00,10.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(55,28,'Junior Suite','',1,193.00,0.00,0.00,193.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(56,28,'Sea View (extra service)','',1,10.00,0.00,0.00,10.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(57,29,'President Room','',1,163.00,0.00,0.00,163.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(58,29,'Car Rental (extra service)','',1,30.00,0.00,0.00,30.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(59,30,'Pacific Room','',1,198.00,0.00,0.00,198.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(60,30,'Satellite TV (extra service)','',1,50.00,0.00,0.00,50.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(61,31,'Junior Suite','',1,193.00,0.00,0.00,193.00,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(62,31,'Car Rental (extra service)','',1,30.00,0.00,0.00,30.00,'2024-01-10 23:45:12','2024-01-10 23:45:12');
/*!40000 ALTER TABLE `ht_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_invoices`
--

DROP TABLE IF EXISTS `ht_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned DEFAULT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `amount` decimal(15,2) unsigned NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ht_invoices_code_unique` (`code`),
  KEY `ht_invoices_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  KEY `ht_invoices_payment_id_index` (`payment_id`),
  KEY `ht_invoices_status_index` (`status`),
  KEY `ht_invoices_customer_id_index` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_invoices`
--

LOCK TABLES `ht_invoices` WRITE;
/*!40000 ALTER TABLE `ht_invoices` DISABLE KEYS */;
INSERT INTO `ht_invoices` VALUES (1,4,'QuincyWard','willis17@example.com','1-715-819-1833','4520 Walter Light Suite 954\nWest Evieshire, OK 22071, Smithamhaven, Pasqualeside, Christmas Island, 00249-6746, ','Sunt culpa ea tempora officia.',1,'Botble\\Hotel\\Models\\Booking',1,'INV-1',579.00,0.00,0.00,579.00,'canceled',NULL,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(2,9,'RussDietrich','kzboncak@example.net','1-303-747-2338','7073 Denesik Stream\nNorth Columbustown, TX 24513, Walshfurt, South Sabinachester, Greenland, 20620-9911, ','Officia nostrum nesciunt soluta eos incidunt officiis.',2,'Botble\\Hotel\\Models\\Booking',2,'INV-2',342.00,0.00,0.00,342.00,'canceled',NULL,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(3,1,'AnnamaeLabadie','weimann.darien@example.net','239.488.6764','43830 Clarissa Square\nEast Brycetown, OH 80466-9836, Port Bertrandview, West Nelleside, Niue, 08340-1349, ','Tempore omnis est minus magni error molestiae explicabo accusamus.',3,'Botble\\Hotel\\Models\\Booking',3,'INV-3',396.00,0.00,0.00,396.00,'canceled',NULL,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(4,7,'ZacharyLarson','jaeden51@example.com','435-627-8577','759 Jess Expressway\nNorth Carlo, ND 10161-2690, Emmerichville, Leoneburgh, Sudan, 99603-8284, ','Dolorem distinctio illo voluptatem quisquam quos esse qui.',4,'Botble\\Hotel\\Models\\Booking',4,'INV-4',366.00,0.00,0.00,366.00,'completed','2024-01-10 23:45:11','2024-01-10 23:45:11','2024-01-10 23:45:11'),(5,7,'KatelynRutherford','richie71@example.net','+1.689.560.5307','9578 Edna Vista Apt. 940\nLake Candida, ND 33597-7935, Torpstad, Port Florencehaven, Falkland Islands (Malvinas), 42133, ','Inventore praesentium occaecati blanditiis a quae similique aut.',5,'Botble\\Hotel\\Models\\Booking',5,'INV-5',366.00,0.00,0.00,366.00,'canceled',NULL,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(6,8,'AlizaSchultz','ward.adrien@example.com','1-917-435-6034','45396 Doyle Plains\nPort Marysechester, CA 76156, Lake Kaelaburgh, Emmerichville, Bouvet Island (Bouvetoya), 48293-6776, ','Maiores dignissimos laboriosam assumenda quidem asperiores accusantium.',6,'Botble\\Hotel\\Models\\Booking',6,'INV-6',396.00,0.00,0.00,396.00,'canceled',NULL,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(7,10,'MartineLakin','viva43@example.org','763.496.1162','514 Blanda Union Apt. 986\nDevonteville, TX 32670-3911, North Raquelmouth, Connieton, China, 08167, ','Veniam provident vitae assumenda consequuntur.',7,'Botble\\Hotel\\Models\\Booking',7,'INV-7',339.00,0.00,0.00,339.00,'completed','2024-01-10 23:45:11','2024-01-10 23:45:11','2024-01-10 23:45:11'),(8,11,'FerminOsinski','tdooley@example.net','+1 (445) 733-3929','1601 Edd Crest\nSatterfieldtown, AR 64644, Marquardtborough, Port Joe, Hong Kong, 71524-1183, ','At aspernatur et earum nobis qui.',8,'Botble\\Hotel\\Models\\Booking',8,'INV-8',114.00,0.00,0.00,114.00,'canceled',NULL,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(9,4,'LinnieWilderman','kautzer.jimmy@example.net','1-678-370-8498','79910 Brandi Square Apt. 769\nWest Majorbury, NC 64743-1805, Karlieville, West Gina, Colombia, 93882-4464, ','Quibusdam doloremque sapiente ea eius facilis ducimus et.',9,'Botble\\Hotel\\Models\\Booking',9,'INV-9',228.00,0.00,0.00,228.00,'completed','2024-01-10 23:45:11','2024-01-10 23:45:11','2024-01-10 23:45:11'),(10,1,'GregoryGutkowski','abagail.mraz@example.com','(646) 995-5795','460 Hartmann Heights Suite 891\nWest Thaddeusmouth, VA 04125, Terrellview, South Lavonside, Slovakia (Slovak Republic), 79939, ','Explicabo qui nulla officia et totam et.',10,'Botble\\Hotel\\Models\\Booking',10,'INV-10',386.00,0.00,0.00,386.00,'canceled',NULL,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(11,11,'AliciaLangworth','fernando.mcglynn@example.net','570.320.6004','373 Nona Avenue Suite 146\nCronaview, FL 73913, Leannonburgh, South Sofia, Jordan, 77999, ','Sapiente molestias omnis vero reiciendis cumque ea repudiandae distinctio.',11,'Botble\\Hotel\\Models\\Booking',11,'INV-11',150.00,0.00,0.00,150.00,'canceled',NULL,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(12,8,'JustenWuckert','clueilwitz@example.com','+1-509-613-0546','27853 Schaden Wall Suite 824\nLake Ryderfort, ME 11697, Konopelskitown, Murphyport, Cuba, 20340-3925, ','Nisi perspiciatis expedita fugiat sed deserunt.',12,'Botble\\Hotel\\Models\\Booking',12,'INV-12',386.00,0.00,0.00,386.00,'canceled',NULL,'2024-01-10 23:45:11','2024-01-10 23:45:11'),(13,6,'JanetAbernathy','dino66@example.org','940.812.4184','62749 Zula Drive\nPeggiemouth, WY 48041, North Shawnhaven, Bogisichview, Myanmar, 25408-3073, ','Ullam perspiciatis eligendi ex beatae aut earum animi autem.',13,'Botble\\Hotel\\Models\\Booking',13,'INV-13',113.00,0.00,0.00,113.00,'canceled',NULL,'2024-01-10 23:45:11','2024-01-10 23:45:12'),(14,8,'LoyceZiemann','torrance84@example.org','859-305-7913','39929 Heaney Parkway\nDawsonland, AR 53431-6309, East Einarfurt, Darrellmouth, Chad, 87253, ','Ipsum est non tenetur vel minus.',14,'Botble\\Hotel\\Models\\Booking',14,'INV-14',300.00,0.00,0.00,300.00,'canceled',NULL,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(15,11,'GardnerSchulist','zachery50@example.org','305-404-3054','691 Mary Oval\nWatsicastad, AK 06574, Mikeland, Vernerbury, Uzbekistan, 14514, ','Quasi assumenda officiis et.',15,'Botble\\Hotel\\Models\\Booking',15,'INV-15',594.00,0.00,0.00,594.00,'canceled',NULL,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(16,3,'FrancescaFeest','zieme.dallin@example.net','(575) 680-7783','1083 Vivienne Court Suite 588\nMaidatown, OH 33744, North Elizaview, Tillmantown, Botswana, 59751-7183, ','Et necessitatibus aperiam quibusdam explicabo dolorem.',16,'Botble\\Hotel\\Models\\Booking',16,'INV-16',114.00,0.00,0.00,114.00,'canceled',NULL,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(17,10,'KeatonNolan','tracey70@example.org','+14435661262','592 Reichert Flat\nDorthyview, MS 10479, Bartolettichester, Adrianside, Mongolia, 03818-7141, ','Corporis excepturi eos autem esse a quasi quae.',17,'Botble\\Hotel\\Models\\Booking',17,'INV-17',168.00,0.00,0.00,168.00,'canceled',NULL,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(18,8,'AlfonsoReynolds','avery.bode@example.com','+1.863.956.4428','6957 Jamaal Flats\nLoyceland, FL 83640, North Robinton, Port Joshuaburgh, Mozambique, 64405-3765, ','Quibusdam ratione quia reprehenderit odit illum.',18,'Botble\\Hotel\\Models\\Booking',18,'INV-18',339.00,0.00,0.00,339.00,'completed','2024-01-10 23:45:12','2024-01-10 23:45:12','2024-01-10 23:45:12'),(19,3,'TheodoraErdman','lblock@example.com','+1-760-458-4844','36436 Clark Stravenue\nHaleyton, WI 72592-3180, New Aurore, Lake Alveraberg, Afghanistan, 64145-4635, ','Pariatur asperiores cumque architecto.',19,'Botble\\Hotel\\Models\\Booking',19,'INV-19',163.00,0.00,0.00,163.00,'canceled',NULL,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(20,1,'WendellBergstrom','smurray@example.net','830.390.5880','970 Shaniya Centers\nLowellside, AK 90745-7986, Bransonstad, North Eldora, Venezuela, 49150, ','Reprehenderit sunt beatae natus.',20,'Botble\\Hotel\\Models\\Booking',20,'INV-20',193.00,0.00,0.00,193.00,'canceled',NULL,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(21,5,'JaniyaThompson','valerie.jacobs@example.com','1-747-867-8936','8561 Morar Trail Apt. 368\nRuthemouth, IN 29539, Rickyborough, East Macey, Turkey, 69833, ','Est officiis et nulla corrupti ratione.',21,'Botble\\Hotel\\Models\\Booking',21,'INV-21',113.00,0.00,0.00,113.00,'canceled',NULL,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(22,7,'WilfredoBoehm','luettgen.reid@example.org','+19737253223','950 Miller Stravenue Suite 076\nEast Connieville, NV 98186-9183, Meredithmouth, Kellenland, Grenada, 27911, ','Nihil voluptate praesentium sed.',22,'Botble\\Hotel\\Models\\Booking',22,'INV-22',396.00,0.00,0.00,396.00,'completed','2024-01-10 23:45:12','2024-01-10 23:45:12','2024-01-10 23:45:12'),(23,3,'KaiaWisozk','foster.gibson@example.com','(940) 505-9877','182 Parisian Plaza\nElainashire, ME 37371, Celialand, McDermottton, Togo, 61290-2117, ','Neque ipsum qui sequi eius expedita qui.',23,'Botble\\Hotel\\Models\\Booking',23,'INV-23',163.00,0.00,0.00,163.00,'canceled',NULL,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(24,8,'MalachiSpinka','monte.gleichner@example.org','973.437.2373','5655 Camren Trace Suite 331\nMariettaton, NV 06020, Marcellaview, Vincentchester, Latvia, 20826, ','Cumque blanditiis reprehenderit nulla ea in perspiciatis.',24,'Botble\\Hotel\\Models\\Booking',24,'INV-24',396.00,0.00,0.00,396.00,'canceled',NULL,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(25,6,'RosettaRaynor','gkling@example.org','(341) 726-3153','29734 Blanda Port Apt. 242\nErnserstad, WV 25288-4291, Weimannfurt, Okunevamouth, Nauru, 42511-9018, ','Qui quam expedita voluptatem ullam quaerat molestiae.',25,'Botble\\Hotel\\Models\\Booking',25,'INV-25',168.00,0.00,0.00,168.00,'canceled',NULL,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(26,7,'WaltonAltenwerth','amie.sanford@example.org','(650) 875-9486','8944 Ratke Keys\nLake Israelport, NE 41013, South Tanner, Predovicland, Central African Republic, 71540, ','Consequatur et tempora est voluptas doloremque laborum.',26,'Botble\\Hotel\\Models\\Booking',26,'INV-26',183.00,0.00,0.00,183.00,'completed','2024-01-10 23:45:12','2024-01-10 23:45:12','2024-01-10 23:45:12'),(27,2,'HassanMonahan','kohler.glenna@example.org','1-216-425-8609','86362 Florence Islands Apt. 631\nMadilynview, WI 50573-9576, Kelsiemouth, East Erikashire, Andorra, 96157-9581, ','Rerum facilis odio officia distinctio.',27,'Botble\\Hotel\\Models\\Booking',27,'INV-27',300.00,0.00,0.00,300.00,'completed','2024-01-10 23:45:12','2024-01-10 23:45:12','2024-01-10 23:45:12'),(28,10,'EstaWillms','feil.jack@example.com','+1-701-892-9121','6796 Cartwright Union\nCarytown, OH 64254, Noemiville, Dickiville, Panama, 39139-7733, ','Ut laboriosam et magnam assumenda.',28,'Botble\\Hotel\\Models\\Booking',28,'INV-28',579.00,0.00,0.00,579.00,'canceled',NULL,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(29,5,'MakaylaMarvin','tkutch@example.net','1-972-361-6360','81297 Nova Ridge Apt. 042\nCronintown, OK 26963-0139, North Vita, Johnsonport, Saint Martin, 57696, ','Dolores laborum voluptates eveniet molestiae.',29,'Botble\\Hotel\\Models\\Booking',29,'INV-29',326.00,0.00,0.00,326.00,'completed','2024-01-10 23:45:12','2024-01-10 23:45:12','2024-01-10 23:45:12'),(30,9,'OdaHowe','esta77@example.net','458.853.2916','7291 Trantow Roads\nPort Bonita, WI 44162, Turnerhaven, West Cara, Puerto Rico, 34122, ','Blanditiis exercitationem consequatur et et deleniti occaecati aliquid.',30,'Botble\\Hotel\\Models\\Booking',30,'INV-30',594.00,0.00,0.00,594.00,'pending',NULL,'2024-01-10 23:45:12','2024-01-10 23:45:12'),(31,1,'GreggRatke','lois76@example.net','724.204.8761','3707 Chaim Burg\nNorth Pasqualeside, AR 51757, New Abdullahton, East Eladio, Brunei Darussalam, 96000, ','Ut excepturi eveniet voluptatem ut.',31,'Botble\\Hotel\\Models\\Booking',31,'INV-31',386.00,0.00,0.00,386.00,'pending',NULL,'2024-01-10 23:45:12','2024-01-10 23:45:12');
/*!40000 ALTER TABLE `ht_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_places`
--

DROP TABLE IF EXISTS `ht_places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_places` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `distance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_places`
--

LOCK TABLES `ht_places` WRITE;
/*!40000 ALTER TABLE `ht_places` DISABLE KEYS */;
INSERT INTO `ht_places` VALUES (1,'Duplex Restaurant','1,500m | 21 min. Walk',NULL,'THAT\'S a good opportunity for making her escape; so she took up the chimney, and said to the Dormouse, after thinking a minute or two, and the moment she quite forgot how to begin.\' For, you see, so many lessons to learn! No, I\'ve made up my mind about it; and while she remembered that she began again: \'Ou est ma chatte?\' which was full of the water, and seemed to follow, except a tiny little thing!\' It did so indeed, and much sooner than she had put the Dormouse shook its head impatiently, and walked two and two, as the March Hare: she thought it would be the best of educations--in fact, we went to him,\' said Alice very humbly: \'you had got to see that queer little toss of her hedgehog. The hedgehog was engaged in a melancholy air, and, after folding his arms and legs in all their simple joys, remembering her own mind (as well as she could remember them, all these changes are! I\'m never sure what I\'m going to happen next. \'It\'s--it\'s a very difficult question. However, at last she.','places/01.jpg','published','2024-01-10 23:45:05','2024-01-10 23:45:05'),(2,'Duplex Restaurant','1,500m | 21 min. Walk',NULL,'And the Eaglet bent down its head down, and the sound of a well?\' \'Take some more tea,\' the Hatter began, in rather a handsome pig, I think.\' And she began nibbling at the great question is, what did the Dormouse sulkily remarked, \'If you didn\'t sign it,\' said Five, in a furious passion, and went back for a few minutes to see the Queen. \'Sentence first--verdict afterwards.\' \'Stuff and nonsense!\' said Alice in a hurried nervous manner, smiling at everything that Alice had never left off writing on his flappers, \'--Mystery, ancient and modern, with Seaography: then Drawling--the Drawling-master was an old woman--but then--always to have the experiment tried. \'Very true,\' said the Queen, who was passing at the window.\' \'THAT you won\'t\' thought Alice, \'to speak to this last remark. \'Of course not,\' said Alice thoughtfully: \'but then--I shouldn\'t be hungry for it, she found herself falling down a very hopeful tone though), \'I won\'t interrupt again. I dare say you never had fits, my dear.','places/02.jpg','published','2024-01-10 23:45:05','2024-01-10 23:45:05'),(3,'Duplex Restaurant','1,500m | 21 min. Walk',NULL,'I suppose it were white, but there were a Duck and a great deal to ME,\' said Alice in a melancholy way, being quite unable to move. She soon got it out to be full of the legs of the house!\' (Which was very provoking to find it out, we should all have our heads cut off, you know. Come on!\' So they got settled down again, the cook took the least idea what Latitude or Longitude I\'ve got to grow up any more HERE.\' \'But then,\' thought Alice, \'it\'ll never do to ask: perhaps I shall fall right THROUGH the earth! How funny it\'ll seem to encourage the witness at all: he kept shifting from one foot up the fan and a large mushroom growing near her, she began, rather timidly, as she swam nearer to make out exactly what they said. The executioner\'s argument was, that her shoulders were nowhere to be sure; but I hadn\'t drunk quite so much!\' said Alice, who had not long to doubt, for the hedgehogs; and in another moment that it was very fond of pretending to be told so. \'It\'s really dreadful,\' she.','places/03.jpg','published','2024-01-10 23:45:05','2024-01-10 23:45:05'),(4,'Duplex Restaurant','1,500m | 21 min. Walk',NULL,'Alice (she was rather doubtful whether she could not stand, and she at once crowded round it, panting, and asking, \'But who has won?\' This question the Dodo managed it.) First it marked out a box of comfits, (luckily the salt water had not noticed before, and he poured a little bird as soon as she went back to her: its face was quite tired and out of the deepest contempt. \'I\'ve seen hatters before,\' she said this, she came up to the Dormouse, not choosing to notice this question, but hurriedly went on, \'if you only walk long enough.\' Alice felt dreadfully puzzled. The Hatter\'s remark seemed to Alice a little scream of laughter. \'Oh, hush!\' the Rabbit say, \'A barrowful will do, to begin lessons: you\'d only have to go on. \'And so these three little sisters,\' the Dormouse turned out, and, by the officers of the Queen\'s absence, and were resting in the kitchen. \'When I\'M a Duchess,\' she said to the porpoise, \"Keep back, please: we don\'t want YOU with us!\"\' \'They were learning to draw.','places/04.jpg','published','2024-01-10 23:45:05','2024-01-10 23:45:05'),(5,'Duplex Restaurant','1,500m | 21 min. Walk',NULL,'Alice. The poor little thing sat down again into its mouth open, gazing up into the wood. \'It\'s the Cheshire Cat: now I shall fall right THROUGH the earth! How funny it\'ll seem to encourage the witness at all: he kept shifting from one end to the other, and growing sometimes taller and sometimes shorter, until she had hurt the poor little thing sobbed again (or grunted, it was a treacle-well.\' \'There\'s no sort of way, \'Do cats eat bats? Do cats eat bats?\' and sometimes, \'Do bats eat cats?\' for, you see, so many tea-things are put out here?\' she asked. \'Yes, that\'s it,\' said the Caterpillar called after her. \'I\'ve something important to say!\' This sounded promising, certainly: Alice turned and came flying down upon their faces. There was nothing on it (as she had plenty of time as she did so, very carefully, nibbling first at one end of his teacup instead of the tail, and ending with the words \'DRINK ME\' beautifully printed on it but tea. \'I don\'t think--\' \'Then you should say what.','places/05.jpg','published','2024-01-10 23:45:05','2024-01-10 23:45:05'),(6,'Duplex Restaurant','1,500m | 21 min. Walk',NULL,'WHAT? The other guests had taken advantage of the Gryphon, \'she wants for to know what a Mock Turtle yawned and shut his eyes.--\'Tell her about the whiting!\' \'Oh, as to the seaside once in a great many teeth, so she went on growing, and she drew herself up closer to Alice\'s side as she went on talking: \'Dear, dear! How queer everything is queer to-day.\' Just then her head pressing against the roof was thatched with fur. It was as steady as ever; Yet you balanced an eel on the twelfth?\' Alice went on in a low trembling voice, \'Let us get to the puppy; whereupon the puppy made another snatch in the pool rippling to the conclusion that it was over at last: \'and I wish you were down here with me! There are no mice in the middle, wondering how she would have this cat removed!\' The Queen had never done such a nice little histories about children who had been running half an hour or so there were any tears. No, there were no arches left, and all would change to dull reality--the grass would.','places/06.jpg','published','2024-01-10 23:45:05','2024-01-10 23:45:05');
/*!40000 ALTER TABLE `ht_places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_places_translations`
--

DROP TABLE IF EXISTS `ht_places_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_places_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ht_places_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `distance` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ht_places_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_places_translations`
--

LOCK TABLES `ht_places_translations` WRITE;
/*!40000 ALTER TABLE `ht_places_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_places_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_room_categories`
--

DROP TABLE IF EXISTS `ht_room_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_room_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_room_categories`
--

LOCK TABLES `ht_room_categories` WRITE;
/*!40000 ALTER TABLE `ht_room_categories` DISABLE KEYS */;
INSERT INTO `ht_room_categories` VALUES (1,'Luxury','published','2024-01-10 23:44:58','2024-01-10 23:44:58',0,1),(2,'Family','published','2024-01-10 23:44:58','2024-01-10 23:44:58',0,1),(3,'Double Bed','published','2024-01-10 23:44:58','2024-01-10 23:44:58',0,1),(4,'Relax','published','2024-01-10 23:44:58','2024-01-10 23:44:58',0,1);
/*!40000 ALTER TABLE `ht_room_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_room_categories_translations`
--

DROP TABLE IF EXISTS `ht_room_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_room_categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ht_room_categories_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ht_room_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_room_categories_translations`
--

LOCK TABLES `ht_room_categories_translations` WRITE;
/*!40000 ALTER TABLE `ht_room_categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_room_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_room_dates`
--

DROP TABLE IF EXISTS `ht_room_dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_room_dates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `room_id` bigint unsigned DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `value` decimal(15,2) DEFAULT NULL,
  `value_type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `max_guests` tinyint DEFAULT NULL,
  `active` tinyint DEFAULT '0',
  `note_to_customer` text COLLATE utf8mb4_unicode_ci,
  `note_to_admin` text COLLATE utf8mb4_unicode_ci,
  `number_of_rooms` smallint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_room_dates`
--

LOCK TABLES `ht_room_dates` WRITE;
/*!40000 ALTER TABLE `ht_room_dates` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_room_dates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_room_reviews`
--

DROP TABLE IF EXISTS `ht_room_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_room_reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned NOT NULL,
  `room_id` int NOT NULL,
  `star` tinyint NOT NULL,
  `content` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'approved',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_room_reviews`
--

LOCK TABLES `ht_room_reviews` WRITE;
/*!40000 ALTER TABLE `ht_room_reviews` DISABLE KEYS */;
INSERT INTO `ht_room_reviews` VALUES (1,2,1,4,'Top-notch accommodations! The room was well-appointed and had all the necessary amenities. The staff was incredibly friendly and made my stay even more enjoyable.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(2,11,6,5,'Five-star experience all the way. The room was meticulously maintained, and the staff was incredibly helpful throughout my stay. I’m already planning my next visit.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(3,1,2,5,'I couldn’t have asked for a better place to stay. The room’s design was elegant, and the comfort level was off the charts. Staying here added a layer of luxury to my trip.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(4,3,2,5,'Absolutely loved my experience here! The room was not only clean and comfortable but also offered stunning views of the surrounding area. A perfect choice for a relaxing getaway.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(5,9,2,5,'Five-star experience all the way. The room was meticulously maintained, and the staff was incredibly helpful throughout my stay. I’m already planning my next visit.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(6,5,6,4,'Top-notch accommodations! The room was well-appointed and had all the necessary amenities. The staff was incredibly friendly and made my stay even more enjoyable.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(7,4,3,4,'I couldn’t have asked for a better place to stay. The room’s design was elegant, and the comfort level was off the charts. Staying here added a layer of luxury to my trip.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(8,7,6,5,'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(9,10,6,5,'Absolutely loved my experience here! The room was not only clean and comfortable but also offered stunning views of the surrounding area. A perfect choice for a relaxing getaway.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(10,5,7,4,'Top-notch accommodations! The room was well-appointed and had all the necessary amenities. The staff was incredibly friendly and made my stay even more enjoyable.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(11,4,4,4,'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(12,9,2,4,'Exceeded all my hopes! The room was not only comfortable but also surprisingly spacious. I loved the attention to cleanliness and the warm, inviting atmosphere.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(13,8,4,4,'I couldn’t have asked for a better place to stay. The room’s design was elegant, and the comfort level was off the charts. Staying here added a layer of luxury to my trip.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(14,5,1,5,'Top-notch accommodations! The room was well-appointed and had all the necessary amenities. The staff was incredibly friendly and made my stay even more enjoyable.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(15,5,5,5,'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(16,6,2,5,'A hidden gem! The room was a haven of tranquility, providing a peaceful escape from the bustling city. I appreciated the little touches that made my stay truly special.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(17,3,5,4,'Five-star experience all the way. The room was meticulously maintained, and the staff was incredibly helpful throughout my stay. I’m already planning my next visit.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(18,2,8,4,'A hidden gem! The room was a haven of tranquility, providing a peaceful escape from the bustling city. I appreciated the little touches that made my stay truly special.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(19,10,5,4,'Top-notch accommodations! The room was well-appointed and had all the necessary amenities. The staff was incredibly friendly and made my stay even more enjoyable.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(20,8,3,5,'I couldn’t have asked for a better place to stay. The room’s design was elegant, and the comfort level was off the charts. Staying here added a layer of luxury to my trip.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(21,6,8,5,'A hidden gem! The room was a haven of tranquility, providing a peaceful escape from the bustling city. I appreciated the little touches that made my stay truly special.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(22,11,8,4,'I couldn’t have asked for a better place to stay. The room’s design was elegant, and the comfort level was off the charts. Staying here added a layer of luxury to my trip.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(23,10,1,4,'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(24,11,2,5,'Exceeded all my hopes! The room was not only comfortable but also surprisingly spacious. I loved the attention to cleanliness and the warm, inviting atmosphere.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(25,4,3,4,'Five-star experience all the way. The room was meticulously maintained, and the staff was incredibly helpful throughout my stay. I’m already planning my next visit.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(26,4,7,5,'Five-star experience all the way. The room was meticulously maintained, and the staff was incredibly helpful throughout my stay. I’m already planning my next visit.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(27,7,2,4,'Absolutely loved my experience here! The room was not only clean and comfortable but also offered stunning views of the surrounding area. A perfect choice for a relaxing getaway.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(28,10,2,5,'I couldn’t have asked for a better place to stay. The room’s design was elegant, and the comfort level was off the charts. Staying here added a layer of luxury to my trip.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(29,4,2,5,'Absolutely loved my experience here! The room was not only clean and comfortable but also offered stunning views of the surrounding area. A perfect choice for a relaxing getaway.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(30,10,4,5,'An incredible stay! The room was spacious and beautifully decorated. The amenities provided made me feel right at home. I can’t wait to come back.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(31,1,1,4,'Exceeded all my hopes! The room was not only comfortable but also surprisingly spacious. I loved the attention to cleanliness and the warm, inviting atmosphere.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(32,4,5,5,'Five-star experience all the way. The room was meticulously maintained, and the staff was incredibly helpful throughout my stay. I’m already planning my next visit.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(33,9,5,5,'Five-star experience all the way. The room was meticulously maintained, and the staff was incredibly helpful throughout my stay. I’m already planning my next visit.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(34,1,4,4,'Exceeded all my hopes! The room was not only comfortable but also surprisingly spacious. I loved the attention to cleanliness and the warm, inviting atmosphere.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(35,11,2,5,'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(36,9,5,4,'Exceeded all my hopes! The room was not only comfortable but also surprisingly spacious. I loved the attention to cleanliness and the warm, inviting atmosphere.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(37,6,1,4,'Absolutely loved my experience here! The room was not only clean and comfortable but also offered stunning views of the surrounding area. A perfect choice for a relaxing getaway.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(38,3,2,4,'A hidden gem! The room was a haven of tranquility, providing a peaceful escape from the bustling city. I appreciated the little touches that made my stay truly special.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(39,2,8,4,'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(40,8,7,5,'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(41,2,1,5,'Top-notch accommodations! The room was well-appointed and had all the necessary amenities. The staff was incredibly friendly and made my stay even more enjoyable.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(42,3,3,5,'An incredible stay! The room was spacious and beautifully decorated. The amenities provided made me feel right at home. I can’t wait to come back.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(43,9,8,5,'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(44,2,8,5,'A hidden gem! The room was a haven of tranquility, providing a peaceful escape from the bustling city. I appreciated the little touches that made my stay truly special.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(45,1,2,4,'An incredible stay! The room was spacious and beautifully decorated. The amenities provided made me feel right at home. I can’t wait to come back.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(46,10,5,5,'Five-star experience all the way. The room was meticulously maintained, and the staff was incredibly helpful throughout my stay. I’m already planning my next visit.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(47,8,4,4,'Absolutely loved my experience here! The room was not only clean and comfortable but also offered stunning views of the surrounding area. A perfect choice for a relaxing getaway.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(48,1,8,4,'An incredible stay! The room was spacious and beautifully decorated. The amenities provided made me feel right at home. I can’t wait to come back.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(49,9,7,4,'Absolutely loved my experience here! The room was not only clean and comfortable but also offered stunning views of the surrounding area. A perfect choice for a relaxing getaway.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04'),(50,9,5,4,'Top-notch accommodations! The room was well-appointed and had all the necessary amenities. The staff was incredibly friendly and made my stay even more enjoyable.','approved','2024-01-10 23:45:04','2024-01-10 23:45:04');
/*!40000 ALTER TABLE `ht_room_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_rooms`
--

DROP TABLE IF EXISTS `ht_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_rooms` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `images` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(15,0) unsigned DEFAULT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `number_of_rooms` int unsigned DEFAULT '0',
  `number_of_beds` int unsigned DEFAULT '0',
  `size` int unsigned DEFAULT '0',
  `max_adults` int DEFAULT '0',
  `max_children` int DEFAULT '0',
  `room_category_id` bigint unsigned DEFAULT NULL,
  `tax_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_rooms`
--

LOCK TABLES `ht_rooms` WRITE;
/*!40000 ALTER TABLE `ht_rooms` DISABLE KEYS */;
INSERT INTO `ht_rooms` VALUES (1,'Luxury Hall Of Fame','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,0,'[\"rooms\\/01.jpg\",\"rooms\\/02.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"]',113,NULL,6,3,109,3,3,1,1,'published','2024-01-10 23:44:59','2024-01-10 23:44:59',0),(2,'Pendora Fame','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,1,'[\"rooms\\/02.jpg\",\"rooms\\/01.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"]',168,NULL,6,2,162,6,3,1,1,'published','2024-01-10 23:44:59','2024-01-10 23:44:59',0),(3,'Pacific Room','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,0,'[\"rooms\\/03.jpg\",\"rooms\\/02.jpg\",\"rooms\\/01.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"]',198,NULL,5,4,115,2,3,1,1,'published','2024-01-10 23:44:59','2024-01-10 23:44:59',0),(4,'Junior Suite','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,1,'[\"rooms\\/04.jpg\",\"rooms\\/02.jpg\",\"rooms\\/01.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"]',193,NULL,7,3,187,2,2,1,1,'published','2024-01-10 23:44:59','2024-01-10 23:44:59',0),(5,'Family Suite','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,1,'[\"rooms\\/05.jpg\"]',114,NULL,1,3,178,2,3,1,1,'published','2024-01-10 23:44:59','2024-01-10 23:44:59',0),(6,'Relax Suite','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,0,'[\"rooms\\/06.jpg\",\"rooms\\/02.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/01.jpg\"]',150,NULL,7,1,133,4,3,2,1,'published','2024-01-10 23:44:59','2024-01-10 23:44:59',0),(7,'Luxury Suite','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,1,'[\"rooms\\/01.jpg\",\"rooms\\/02.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"]',183,NULL,4,2,122,4,2,2,1,'published','2024-01-10 23:44:59','2024-01-10 23:44:59',0),(8,'President Room','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,1,'[\"rooms\\/02.jpg\",\"rooms\\/01.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"]',163,NULL,5,2,146,3,3,3,1,'published','2024-01-10 23:44:59','2024-01-10 23:44:59',0);
/*!40000 ALTER TABLE `ht_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_rooms_amenities`
--

DROP TABLE IF EXISTS `ht_rooms_amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_rooms_amenities` (
  `amenity_id` bigint unsigned NOT NULL,
  `room_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`amenity_id`,`room_id`),
  KEY `ht_rooms_amenities_amenity_id_index` (`amenity_id`),
  KEY `ht_rooms_amenities_room_id_index` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_rooms_amenities`
--

LOCK TABLES `ht_rooms_amenities` WRITE;
/*!40000 ALTER TABLE `ht_rooms_amenities` DISABLE KEYS */;
INSERT INTO `ht_rooms_amenities` VALUES (1,1,NULL,NULL),(1,2,NULL,NULL),(1,3,NULL,NULL),(1,4,NULL,NULL),(1,5,NULL,NULL),(1,6,NULL,NULL),(1,7,NULL,NULL),(1,8,NULL,NULL),(2,1,NULL,NULL),(2,2,NULL,NULL),(2,3,NULL,NULL),(2,4,NULL,NULL),(2,5,NULL,NULL),(2,6,NULL,NULL),(2,7,NULL,NULL),(2,8,NULL,NULL),(3,1,NULL,NULL),(3,2,NULL,NULL),(3,3,NULL,NULL),(3,4,NULL,NULL),(3,5,NULL,NULL),(3,6,NULL,NULL),(3,7,NULL,NULL),(3,8,NULL,NULL),(4,1,NULL,NULL),(4,2,NULL,NULL),(4,3,NULL,NULL),(4,4,NULL,NULL),(4,5,NULL,NULL),(4,6,NULL,NULL),(4,7,NULL,NULL),(4,8,NULL,NULL),(6,1,NULL,NULL),(6,2,NULL,NULL),(6,3,NULL,NULL),(6,4,NULL,NULL),(6,5,NULL,NULL),(6,6,NULL,NULL),(6,7,NULL,NULL),(6,8,NULL,NULL),(7,1,NULL,NULL),(7,2,NULL,NULL),(7,3,NULL,NULL),(7,4,NULL,NULL),(7,5,NULL,NULL),(7,6,NULL,NULL),(7,7,NULL,NULL),(7,8,NULL,NULL),(9,1,NULL,NULL),(9,2,NULL,NULL),(9,3,NULL,NULL),(9,4,NULL,NULL),(9,5,NULL,NULL),(9,6,NULL,NULL),(9,7,NULL,NULL),(9,8,NULL,NULL),(11,1,NULL,NULL),(11,2,NULL,NULL),(11,3,NULL,NULL),(11,4,NULL,NULL),(11,5,NULL,NULL),(11,6,NULL,NULL),(11,7,NULL,NULL),(11,8,NULL,NULL);
/*!40000 ALTER TABLE `ht_rooms_amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_rooms_translations`
--

DROP TABLE IF EXISTS `ht_rooms_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_rooms_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ht_rooms_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ht_rooms_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_rooms_translations`
--

LOCK TABLES `ht_rooms_translations` WRITE;
/*!40000 ALTER TABLE `ht_rooms_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_rooms_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_services`
--

DROP TABLE IF EXISTS `ht_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `price` decimal(15,0) unsigned DEFAULT NULL,
  `price_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'once',
  `currency_id` bigint unsigned DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_services`
--

LOCK TABLES `ht_services` WRITE;
/*!40000 ALTER TABLE `ht_services` DISABLE KEYS */;
INSERT INTO `ht_services` VALUES (1,'Wifi','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,100,'once',NULL,NULL,'published','2024-01-10 23:45:01','2024-01-10 23:45:01'),(2,'Car Rental','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,30,'once',NULL,NULL,'published','2024-01-10 23:45:01','2024-01-10 23:45:01'),(3,'Satellite TV','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,50,'once',NULL,NULL,'published','2024-01-10 23:45:01','2024-01-10 23:45:01'),(4,'Sea View','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,10,'once',NULL,NULL,'published','2024-01-10 23:45:01','2024-01-10 23:45:01'),(5,'Laundry','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,10,'once',NULL,NULL,'published','2024-01-10 23:45:01','2024-01-10 23:45:01'),(6,'Breakfast','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,10,'once',NULL,NULL,'published','2024-01-10 23:45:01','2024-01-10 23:45:01');
/*!40000 ALTER TABLE `ht_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_services_translations`
--

DROP TABLE IF EXISTS `ht_services_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_services_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ht_services_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ht_services_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_services_translations`
--

LOCK TABLES `ht_services_translations` WRITE;
/*!40000 ALTER TABLE `ht_services_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_services_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_taxes`
--

DROP TABLE IF EXISTS `ht_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_taxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percentage` double(8,6) DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_taxes`
--

LOCK TABLES `ht_taxes` WRITE;
/*!40000 ALTER TABLE `ht_taxes` DISABLE KEYS */;
INSERT INTO `ht_taxes` VALUES (1,'VAT',10.000000,1,'published','2024-01-10 23:45:05','2024-01-10 23:45:05'),(2,'None',0.000000,2,'published','2024-01-10 23:45:05','2024-01-10 23:45:05');
/*!40000 ALTER TABLE `ht_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_meta`
--

DROP TABLE IF EXISTS `language_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_meta` (
  `lang_meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_meta_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_meta_origin` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lang_meta_id`),
  KEY `language_meta_reference_id_index` (`reference_id`),
  KEY `meta_code_index` (`lang_meta_code`),
  KEY `meta_origin_index` (`lang_meta_origin`),
  KEY `meta_reference_type_index` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_meta`
--

LOCK TABLES `language_meta` WRITE;
/*!40000 ALTER TABLE `language_meta` DISABLE KEYS */;
INSERT INTO `language_meta` VALUES (1,'en_US','101de2d6de63b361b1f79c8986ce145e',1,'Botble\\Testimonial\\Models\\Testimonial'),(2,'en_US','1aad8e8301060453897e20c272bbc4c6',2,'Botble\\Testimonial\\Models\\Testimonial'),(3,'en_US','ce3116ac7d4e6966e9ce6e571a2319eb',3,'Botble\\Testimonial\\Models\\Testimonial'),(4,'en_US','af988578333a172b3965c8a0435e6e8d',1,'Botble\\Menu\\Models\\MenuLocation'),(5,'en_US','0a56d728c6c46cb50cdd99bffbe5141f',1,'Botble\\Menu\\Models\\Menu'),(6,'en_US','173c92714e26c82bd08469613c145a74',2,'Botble\\Menu\\Models\\MenuLocation'),(7,'en_US','f74b4eaab5aebacfd9872352fd03f2a7',2,'Botble\\Menu\\Models\\Menu'),(8,'en_US','40f30459883231f7f4cfc56cc3b327ff',3,'Botble\\Menu\\Models\\Menu');
/*!40000 ALTER TABLE `language_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `lang_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `lang_order` int NOT NULL DEFAULT '0',
  `lang_is_rtl` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  KEY `lang_locale_index` (`lang_locale`),
  KEY `lang_code_index` (`lang_code`),
  KEY `lang_is_default_index` (`lang_is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','en_US','us',1,0,0);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_files`
--

DROP TABLE IF EXISTS `media_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` bigint unsigned NOT NULL DEFAULT '0',
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_files_user_id_index` (`user_id`),
  KEY `media_files_index` (`folder_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (1,0,'01','01',1,'image/jpeg',9392,'news/01.jpg','[]','2024-01-10 23:44:56','2024-01-10 23:44:56',NULL),(2,0,'02','02',1,'image/jpeg',9392,'news/02.jpg','[]','2024-01-10 23:44:57','2024-01-10 23:44:57',NULL),(3,0,'03','03',1,'image/jpeg',9392,'news/03.jpg','[]','2024-01-10 23:44:57','2024-01-10 23:44:57',NULL),(4,0,'04','04',1,'image/jpeg',9392,'news/04.jpg','[]','2024-01-10 23:44:57','2024-01-10 23:44:57',NULL),(5,0,'05','05',1,'image/jpeg',9392,'news/05.jpg','[]','2024-01-10 23:44:57','2024-01-10 23:44:57',NULL),(6,0,'06','06',1,'image/jpeg',9392,'news/06.jpg','[]','2024-01-10 23:44:57','2024-01-10 23:44:57',NULL),(7,0,'01','01',2,'image/jpeg',10705,'rooms/01.jpg','[]','2024-01-10 23:44:58','2024-01-10 23:44:58',NULL),(8,0,'02','02',2,'image/jpeg',10705,'rooms/02.jpg','[]','2024-01-10 23:44:58','2024-01-10 23:44:58',NULL),(9,0,'03','03',2,'image/jpeg',10705,'rooms/03.jpg','[]','2024-01-10 23:44:58','2024-01-10 23:44:58',NULL),(10,0,'04','04',2,'image/jpeg',10705,'rooms/04.jpg','[]','2024-01-10 23:44:58','2024-01-10 23:44:58',NULL),(11,0,'05','05',2,'image/jpeg',10705,'rooms/05.jpg','[]','2024-01-10 23:44:59','2024-01-10 23:44:59',NULL),(12,0,'06','06',2,'image/jpeg',10705,'rooms/06.jpg','[]','2024-01-10 23:44:59','2024-01-10 23:44:59',NULL),(13,0,'01','01',3,'image/jpeg',9730,'foods/01.jpg','[]','2024-01-10 23:44:59','2024-01-10 23:44:59',NULL),(14,0,'02','02',3,'image/jpeg',9730,'foods/02.jpg','[]','2024-01-10 23:44:59','2024-01-10 23:44:59',NULL),(15,0,'03','03',3,'image/jpeg',9730,'foods/03.jpg','[]','2024-01-10 23:44:59','2024-01-10 23:44:59',NULL),(16,0,'04','04',3,'image/jpeg',9730,'foods/04.jpg','[]','2024-01-10 23:45:00','2024-01-10 23:45:00',NULL),(17,0,'05','05',3,'image/jpeg',9730,'foods/05.jpg','[]','2024-01-10 23:45:00','2024-01-10 23:45:00',NULL),(18,0,'06','06',3,'image/jpeg',9730,'foods/06.jpg','[]','2024-01-10 23:45:00','2024-01-10 23:45:00',NULL),(19,0,'07','07',3,'image/jpeg',9730,'foods/07.jpg','[]','2024-01-10 23:45:00','2024-01-10 23:45:00',NULL),(20,0,'08','08',3,'image/jpeg',9730,'foods/08.jpg','[]','2024-01-10 23:45:00','2024-01-10 23:45:00',NULL),(21,0,'09','09',3,'image/jpeg',9730,'foods/09.jpg','[]','2024-01-10 23:45:01','2024-01-10 23:45:01',NULL),(22,0,'10','10',3,'image/jpeg',9730,'foods/10.jpg','[]','2024-01-10 23:45:01','2024-01-10 23:45:01',NULL),(23,0,'1','1',4,'image/jpeg',11752,'customers/1.jpg','[]','2024-01-10 23:45:01','2024-01-10 23:45:01',NULL),(24,0,'10','10',4,'image/jpeg',27814,'customers/10.jpg','[]','2024-01-10 23:45:01','2024-01-10 23:45:01',NULL),(25,0,'2','2',4,'image/jpeg',19005,'customers/2.jpg','[]','2024-01-10 23:45:01','2024-01-10 23:45:01',NULL),(26,0,'3','3',4,'image/jpeg',20400,'customers/3.jpg','[]','2024-01-10 23:45:01','2024-01-10 23:45:01',NULL),(27,0,'4','4',4,'image/jpeg',26819,'customers/4.jpg','[]','2024-01-10 23:45:01','2024-01-10 23:45:01',NULL),(28,0,'5','5',4,'image/jpeg',14367,'customers/5.jpg','[]','2024-01-10 23:45:01','2024-01-10 23:45:01',NULL),(29,0,'6','6',4,'image/jpeg',12367,'customers/6.jpg','[]','2024-01-10 23:45:01','2024-01-10 23:45:01',NULL),(30,0,'7','7',4,'image/jpeg',20652,'customers/7.jpg','[]','2024-01-10 23:45:01','2024-01-10 23:45:01',NULL),(31,0,'8','8',4,'image/jpeg',21164,'customers/8.jpg','[]','2024-01-10 23:45:02','2024-01-10 23:45:02',NULL),(32,0,'9','9',4,'image/jpeg',6084,'customers/9.jpg','[]','2024-01-10 23:45:02','2024-01-10 23:45:02',NULL),(33,0,'01','01',5,'image/jpeg',8787,'places/01.jpg','[]','2024-01-10 23:45:05','2024-01-10 23:45:05',NULL),(34,0,'02','02',5,'image/jpeg',8787,'places/02.jpg','[]','2024-01-10 23:45:05','2024-01-10 23:45:05',NULL),(35,0,'03','03',5,'image/jpeg',8787,'places/03.jpg','[]','2024-01-10 23:45:05','2024-01-10 23:45:05',NULL),(36,0,'04','04',5,'image/jpeg',8787,'places/04.jpg','[]','2024-01-10 23:45:05','2024-01-10 23:45:05',NULL),(37,0,'05','05',5,'image/jpeg',8787,'places/05.jpg','[]','2024-01-10 23:45:05','2024-01-10 23:45:05',NULL),(38,0,'06','06',5,'image/jpeg',8787,'places/06.jpg','[]','2024-01-10 23:45:05','2024-01-10 23:45:05',NULL),(39,0,'01','01',6,'image/png',9730,'testimonials/01.png','[]','2024-01-10 23:45:05','2024-01-10 23:45:05',NULL),(40,0,'02','02',6,'image/png',9730,'testimonials/02.png','[]','2024-01-10 23:45:06','2024-01-10 23:45:06',NULL),(41,0,'03','03',6,'image/png',9730,'testimonials/03.png','[]','2024-01-10 23:45:06','2024-01-10 23:45:06',NULL),(42,0,'01','01',7,'image/jpeg',9730,'galleries/01.jpg','[]','2024-01-10 23:45:06','2024-01-10 23:45:06',NULL),(43,0,'02','02',7,'image/jpeg',9730,'galleries/02.jpg','[]','2024-01-10 23:45:06','2024-01-10 23:45:06',NULL),(44,0,'03','03',7,'image/jpeg',9730,'galleries/03.jpg','[]','2024-01-10 23:45:06','2024-01-10 23:45:06',NULL),(45,0,'04','04',7,'image/jpeg',9730,'galleries/04.jpg','[]','2024-01-10 23:45:06','2024-01-10 23:45:06',NULL),(46,0,'05','05',7,'image/jpeg',9730,'galleries/05.jpg','[]','2024-01-10 23:45:07','2024-01-10 23:45:07',NULL),(47,0,'06','06',7,'image/jpeg',9730,'galleries/06.jpg','[]','2024-01-10 23:45:07','2024-01-10 23:45:07',NULL),(48,0,'07','07',7,'image/jpeg',9730,'galleries/07.jpg','[]','2024-01-10 23:45:07','2024-01-10 23:45:07',NULL),(49,0,'08','08',7,'image/jpeg',9730,'galleries/08.jpg','[]','2024-01-10 23:45:07','2024-01-10 23:45:07',NULL),(50,0,'01','01',8,'image/jpeg',4017,'general/01.jpg','[]','2024-01-10 23:45:08','2024-01-10 23:45:08',NULL),(51,0,'02','02',8,'image/jpeg',2939,'general/02.jpg','[]','2024-01-10 23:45:08','2024-01-10 23:45:08',NULL),(52,0,'03','03',8,'image/jpeg',5099,'general/03.jpg','[]','2024-01-10 23:45:08','2024-01-10 23:45:08',NULL),(53,0,'04','04',8,'image/jpeg',15744,'general/04.jpg','[]','2024-01-10 23:45:08','2024-01-10 23:45:08',NULL),(54,0,'banner-news','banner-news',8,'image/jpeg',8610,'general/banner-news.jpg','[]','2024-01-10 23:45:09','2024-01-10 23:45:09',NULL),(55,0,'bg','bg',8,'image/jpeg',20464,'general/bg.jpg','[]','2024-01-10 23:45:09','2024-01-10 23:45:09',NULL),(56,0,'favicon','favicon',8,'image/png',2386,'general/favicon.png','[]','2024-01-10 23:45:09','2024-01-10 23:45:09',NULL),(57,0,'logo-white','logo-white',8,'image/png',3052,'general/logo-white.png','[]','2024-01-10 23:45:09','2024-01-10 23:45:09',NULL),(58,0,'logo','logo',8,'image/png',3017,'general/logo.png','[]','2024-01-10 23:45:09','2024-01-10 23:45:09',NULL),(59,0,'video-background-02','video-background-02',8,'image/jpeg',19946,'general/video-background-02.jpg','[]','2024-01-10 23:45:09','2024-01-10 23:45:09',NULL),(60,0,'video-banner-01','video-banner-01',8,'image/jpeg',11487,'general/video-banner-01.jpg','[]','2024-01-10 23:45:10','2024-01-10 23:45:10',NULL),(61,0,'04','04',9,'image/jpeg',27518,'sliders/04.jpg','[]','2024-01-10 23:45:10','2024-01-10 23:45:10',NULL),(62,0,'05','05',9,'image/jpeg',27518,'sliders/05.jpg','[]','2024-01-10 23:45:10','2024-01-10 23:45:10',NULL);
/*!40000 ALTER TABLE `media_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folders`
--

DROP TABLE IF EXISTS `media_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_folders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_folders_user_id_index` (`user_id`),
  KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folders`
--

LOCK TABLES `media_folders` WRITE;
/*!40000 ALTER TABLE `media_folders` DISABLE KEYS */;
INSERT INTO `media_folders` VALUES (1,0,'news',NULL,'news',0,'2024-01-10 23:44:56','2024-01-10 23:44:56',NULL),(2,0,'rooms',NULL,'rooms',0,'2024-01-10 23:44:58','2024-01-10 23:44:58',NULL),(3,0,'foods',NULL,'foods',0,'2024-01-10 23:44:59','2024-01-10 23:44:59',NULL),(4,0,'customers',NULL,'customers',0,'2024-01-10 23:45:01','2024-01-10 23:45:01',NULL),(5,0,'places',NULL,'places',0,'2024-01-10 23:45:04','2024-01-10 23:45:04',NULL),(6,0,'testimonials',NULL,'testimonials',0,'2024-01-10 23:45:05','2024-01-10 23:45:05',NULL),(7,0,'galleries',NULL,'galleries',0,'2024-01-10 23:45:06','2024-01-10 23:45:06',NULL),(8,0,'general',NULL,'general',0,'2024-01-10 23:45:08','2024-01-10 23:45:08',NULL),(9,0,'sliders',NULL,'sliders',0,'2024-01-10 23:45:10','2024-01-10 23:45:10',NULL);
/*!40000 ALTER TABLE `media_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_settings`
--

DROP TABLE IF EXISTS `media_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `media_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_settings`
--

LOCK TABLES `media_settings` WRITE;
/*!40000 ALTER TABLE `media_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_locations`
--

DROP TABLE IF EXISTS `menu_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_locations_menu_id_created_at_index` (`menu_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_locations`
--

LOCK TABLES `menu_locations` WRITE;
/*!40000 ALTER TABLE `menu_locations` DISABLE KEYS */;
INSERT INTO `menu_locations` VALUES (1,1,'header-menu','2024-01-10 23:45:08','2024-01-10 23:45:08'),(2,2,'side-menu','2024-01-10 23:45:08','2024-01-10 23:45:08');
/*!40000 ALTER TABLE `menu_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_nodes`
--

DROP TABLE IF EXISTS `menu_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_nodes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `reference_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_nodes_menu_id_index` (`menu_id`),
  KEY `menu_nodes_parent_id_index` (`parent_id`),
  KEY `reference_id` (`reference_id`),
  KEY `reference_type` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_nodes`
--

LOCK TABLES `menu_nodes` WRITE;
/*!40000 ALTER TABLE `menu_nodes` DISABLE KEYS */;
INSERT INTO `menu_nodes` VALUES (1,1,0,NULL,NULL,'/',NULL,0,'Home',NULL,'_self',0,'2024-01-10 23:45:08','2024-01-10 23:45:08'),(2,1,0,NULL,NULL,'/rooms',NULL,0,'Rooms',NULL,'_self',1,'2024-01-10 23:45:08','2024-01-10 23:45:08'),(3,1,2,NULL,NULL,'/rooms/luxury-hall-of-fame',NULL,0,'Luxury Hall Of Fame',NULL,'_self',0,'2024-01-10 23:45:08','2024-01-10 23:45:08'),(4,1,2,NULL,NULL,'/rooms/pendora-fame',NULL,0,'Pendora Fame',NULL,'_self',0,'2024-01-10 23:45:08','2024-01-10 23:45:08'),(5,1,0,2,'Botble\\Page\\Models\\Page','/news',NULL,0,'News',NULL,'_self',0,'2024-01-10 23:45:08','2024-01-10 23:45:08'),(6,1,0,3,'Botble\\Page\\Models\\Page','/contact',NULL,0,'Contact',NULL,'_self',0,'2024-01-10 23:45:08','2024-01-10 23:45:08'),(7,2,0,6,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'About Us',NULL,'_self',0,'2024-01-10 23:45:08','2024-01-10 23:45:08'),(8,2,0,5,'Botble\\Page\\Models\\Page','/our-gallery',NULL,0,'Our Gallery',NULL,'_self',1,'2024-01-10 23:45:08','2024-01-10 23:45:08'),(9,2,8,NULL,NULL,'/galleries/king-bed',NULL,0,'King Bed',NULL,'_self',0,'2024-01-10 23:45:08','2024-01-10 23:45:08'),(10,2,8,NULL,NULL,'/galleries/duplex-restaurant',NULL,0,'Duplex Restaurant',NULL,'_self',0,'2024-01-10 23:45:08','2024-01-10 23:45:08'),(11,2,0,4,'Botble\\Page\\Models\\Page','/restaurant',NULL,0,'Restaurant',NULL,'_self',0,'2024-01-10 23:45:08','2024-01-10 23:45:08'),(12,2,0,7,'Botble\\Page\\Models\\Page','/places',NULL,0,'Places',NULL,'_self',0,'2024-01-10 23:45:08','2024-01-10 23:45:08'),(13,2,0,8,'Botble\\Page\\Models\\Page','/our-offers',NULL,0,'Our Offers',NULL,'_self',0,'2024-01-10 23:45:08','2024-01-10 23:45:08'),(14,3,0,NULL,NULL,'#',NULL,0,'Restaurant & Bar',NULL,'_self',0,'2024-01-10 23:45:08','2024-01-10 23:45:08'),(15,3,0,NULL,NULL,'#',NULL,0,'Swimming Pool',NULL,'_self',0,'2024-01-10 23:45:08','2024-01-10 23:45:08'),(16,3,0,NULL,NULL,'#',NULL,0,'Restaurant',NULL,'_self',0,'2024-01-10 23:45:08','2024-01-10 23:45:08'),(17,3,0,NULL,NULL,'#',NULL,0,'Conference Room',NULL,'_self',0,'2024-01-10 23:45:08','2024-01-10 23:45:08'),(18,3,0,NULL,NULL,'#',NULL,0,'Cocktail Party Houses',NULL,'_self',0,'2024-01-10 23:45:08','2024-01-10 23:45:08'),(19,3,0,NULL,NULL,'#',NULL,0,'Gaming Zone',NULL,'_self',0,'2024-01-10 23:45:08','2024-01-10 23:45:08'),(20,3,0,NULL,NULL,'#',NULL,0,'Marriage Party',NULL,'_self',0,'2024-01-10 23:45:08','2024-01-10 23:45:08'),(21,3,0,NULL,NULL,'#',NULL,0,'Party Planning',NULL,'_self',0,'2024-01-10 23:45:08','2024-01-10 23:45:08'),(22,3,0,NULL,NULL,'#',NULL,0,'Tour Consultancy',NULL,'_self',0,'2024-01-10 23:45:08','2024-01-10 23:45:08');
/*!40000 ALTER TABLE `menu_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Header menu','header-menu','published','2024-01-10 23:45:08','2024-01-10 23:45:08'),(2,'Our pages','our-pages','published','2024-01-10 23:45:08','2024-01-10 23:45:08'),(3,'Services.','services','published','2024-01-10 23:45:08','2024-01-10 23:45:08');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_boxes`
--

DROP TABLE IF EXISTS `meta_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_boxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_boxes_reference_id_index` (`reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_boxes`
--

LOCK TABLES `meta_boxes` WRITE;
/*!40000 ALTER TABLE `meta_boxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `meta_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2013_04_09_032329_create_base_tables',1),(2,'2013_04_09_062329_create_revisions_table',1),(3,'2014_10_12_000000_create_users_table',1),(4,'2014_10_12_100000_create_password_reset_tokens_table',1),(5,'2016_06_10_230148_create_acl_tables',1),(6,'2016_06_14_230857_create_menus_table',1),(7,'2016_06_28_221418_create_pages_table',1),(8,'2016_10_05_074239_create_setting_table',1),(9,'2016_11_28_032840_create_dashboard_widget_tables',1),(10,'2016_12_16_084601_create_widgets_table',1),(11,'2017_05_09_070343_create_media_tables',1),(12,'2017_11_03_070450_create_slug_table',1),(13,'2019_01_05_053554_create_jobs_table',1),(14,'2019_08_19_000000_create_failed_jobs_table',1),(15,'2019_12_14_000001_create_personal_access_tokens_table',1),(16,'2021_08_05_134214_fix_social_link_theme_options',1),(17,'2022_04_20_100851_add_index_to_media_table',1),(18,'2022_04_20_101046_add_index_to_menu_table',1),(19,'2022_07_10_034813_move_lang_folder_to_root',1),(20,'2022_08_04_051940_add_missing_column_expires_at',1),(21,'2022_09_01_000001_create_admin_notifications_tables',1),(22,'2022_10_14_024629_drop_column_is_featured',1),(23,'2022_11_18_063357_add_missing_timestamp_in_table_settings',1),(24,'2022_12_02_093615_update_slug_index_columns',1),(25,'2023_01_30_024431_add_alt_to_media_table',1),(26,'2023_02_16_042611_drop_table_password_resets',1),(27,'2023_04_23_005903_add_column_permissions_to_admin_notifications',1),(28,'2023_05_10_075124_drop_column_id_in_role_users_table',1),(29,'2023_08_21_090810_make_page_content_nullable',1),(30,'2023_09_14_021936_update_index_for_slugs_table',1),(31,'2023_12_06_100448_change_random_hash_for_media',1),(32,'2023_12_07_095130_add_color_column_to_media_folders_table',1),(33,'2023_12_17_162208_make_sure_column_color_in_media_folders_nullable',1),(34,'2015_06_29_025744_create_audit_history',2),(35,'2023_11_14_033417_change_request_column_in_table_audit_histories',2),(36,'2015_06_18_033822_create_blog_table',3),(37,'2021_02_16_092633_remove_default_value_for_author_type',3),(38,'2021_12_03_030600_create_blog_translations',3),(39,'2022_04_19_113923_add_index_to_table_posts',3),(40,'2023_08_29_074620_make_column_author_id_nullable',3),(41,'2016_06_17_091537_create_contacts_table',4),(42,'2023_11_10_080225_migrate_contact_blacklist_email_domains_to_core',4),(43,'2016_10_13_150201_create_galleries_table',5),(44,'2021_12_03_082953_create_gallery_translations',5),(45,'2022_04_30_034048_create_gallery_meta_translations_table',5),(46,'2023_08_29_075308_make_column_user_id_nullable',5),(47,'2020_09_02_033611_hotel_create_table',6),(48,'2021_06_25_084734_fix_theme_options',6),(49,'2021_08_18_011425_add_column_order_into_rooms',6),(50,'2021_08_25_153801_update_table_ht_room_categories',6),(51,'2021_08_29_031421_add_translations_tables_for_hotel',6),(52,'2023_04_09_083713_update_hotel_customers_table',6),(53,'2023_04_17_033111_add_booking_number_of_guests',6),(54,'2023_08_11_090349_add_column_password_customers_table',6),(55,'2023_08_14_090449_create_reset_password_table',6),(56,'2023_08_16_063152_update_ht_booking_room_table',6),(57,'2023_08_18_022454_add_new_field_to_ht_customers_table',6),(58,'2023_08_23_022361_create_ht_invoices_table',6),(59,'2023_08_23_041912_create_hotel_review_table',6),(60,'2023_08_23_443543_add_sub_total_to_booking_table',6),(61,'2023_08_23_904382_update_field_customer_id_to_invoice_table',6),(62,'2023_08_24_534892_add_fields_to_invoice_table',6),(63,'2023_08_24_745332_add_field_description_to_invoice_table',6),(64,'2023_08_25_061510_add_adjust_type_and_amount_column',6),(65,'2023_09_05_083354_create_ht_coupons_table',6),(66,'2023_09_06_062315_add_coupon_columns_to_booking_table',6),(67,'2023_10_18_024658_add_price_type_column_to_services_table',6),(68,'2023_10_24_014726_drop_unique_in_room_name',6),(69,'2016_10_03_032336_create_languages_table',7),(70,'2023_09_14_022423_add_index_for_language_table',7),(71,'2021_10_25_021023_fix-priority-load-for-language-advanced',8),(72,'2021_12_03_075608_create_page_translations',8),(73,'2023_07_06_011444_create_slug_translations_table',8),(74,'2017_10_24_154832_create_newsletter_table',9),(75,'2017_05_18_080441_create_payment_tables',10),(76,'2021_03_27_144913_add_customer_type_into_table_payments',10),(77,'2021_05_24_034720_make_column_currency_nullable',10),(78,'2021_08_09_161302_add_metadata_column_to_payments_table',10),(79,'2021_10_19_020859_update_metadata_field',10),(80,'2022_06_28_151901_activate_paypal_stripe_plugin',10),(81,'2022_07_07_153354_update_charge_id_in_table_payments',10),(82,'2018_07_09_214610_create_testimonial_table',11),(83,'2021_12_03_083642_create_testimonials_translations',11),(84,'2016_10_07_193005_create_translations_table',12),(85,'2023_12_12_105220_drop_translations_table',12);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Homepage','<div>[home-banner][/home-banner]</div><div>[check-availability-form][/check-availability-form]</div><div>[hotel-about title=\"since 1994\" subtitle=\"Situated In Prime Position At The Foot Of The Slopes Of Courchevel Moriond.\" block_icon_1=\"flaticon-coffee\" block_text_1=\"Breakfast\" block_link_1=\"#\" block_icon_2=\"flaticon-air-freight\" block_text_2=\"Airport Pickup\" block_link_2=\"#\" block_icon_3=\"flaticon-marker\" block_text_3=\"City Guide\" block_link_3=\"#\" block_icon_4=\"flaticon-barbecue\" block_text_4=\"BBQ Party\" block_link_4=\"#\" block_icon_5=\"flaticon-hotel\" block_text_5=\"Luxury Room\" block_link_5=\"#\"][/hotel-about]</div><div>[room-categories title=\"Room Type\" subtitle=\"Inspired Loading\" background_image=\"general/bg.jpg\"][/room-categories]</div><div>[hotel-featured-features title=\"The Thin Escape\" subtitle=\"Miranda has everything for your trip & every single things.\" button_text=\"Take a tour\" button_url=\"/rooms\"][/hotel-featured-features]</div><div>[rooms][/rooms]</div><div>[video-introduction title=\"Take a tour\" subtitle=\"Discover Our Underground.\" content=\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\" background_image=\"general/video-background-02.jpg\" video_image=\"general/video-banner-01.jpg\" video_url=\"https://www.youtube.com/watch?v=EEJFMdfraVY\" button_text=\"Book Now\" button_url=\"/rooms\"][/video-introduction]</div><div>[testimonial title=\"testimonials\" subtitle=\"Client Feedback\"][/testimonial]</div><div>[rooms-introduction title=\"Our rooms\" subtitle=\"Each of our nine lovely double guest rooms feature a private bath, wi-fi, cable television and include full breakfast.\" background_image=\"general/bg.jpg\" first_image=\"general/01.jpg\" second_image=\"general/02.jpg\" third_image=\"general/03.jpg\" button_text=\"Take a tour\" button_url=\"/rooms\"][/rooms-introduction]</div><div>[featured-news title=\"Blog\" subtitle=\"News Feeds\"][/featured-news]</div>',1,NULL,'homepage',NULL,'published','2024-01-10 23:45:05','2024-01-10 23:45:05'),(2,'News','<p>--</p>',1,NULL,'default',NULL,'published','2024-01-10 23:45:05','2024-01-10 23:45:05'),(3,'Contact','<div>[contact-info][/contact-info]</div><div>[google-map]19/A, Cirikon City hall Tower New York, NYC[/google-map]</div><div>[contact-form][/contact-form]</div>',1,NULL,'no-sidebar',NULL,'published','2024-01-10 23:45:05','2024-01-10 23:45:05'),(4,'Restaurant','<div>[food-types][/food-types]</div><div>[foods title=\"Restaurant\" subtitle=\"Trending Menu\"][/foods]</div>',1,NULL,'no-sidebar',NULL,'published','2024-01-10 23:45:05','2024-01-10 23:45:05'),(5,'Our Gallery','<div>[all-galleries title=\"Gallery\" subtitle=\"Our Rooms\"][/all-galleries]</div>',1,NULL,'no-sidebar',NULL,'published','2024-01-10 23:45:05','2024-01-10 23:45:05'),(6,'About us','<div>[youtube-video url=\"https://www.youtube.com/watch?v=EEJFMdfraVY\" background_image=\"general/04.jpg\"][/youtube-video]</div><p>Hello. Our hotel has been present for over 20 years. We make the best or all our customers. Hello. Our hotel has been present for over 20 years. We make the best or all our customers. Hello. Our hotel has been present for over 20 years. We make the best or all our customers.</p><div>[hotel-core-features title=\"Facilities\" subtitle=\"Core Features\"][/hotel-core-features]</div><div>[featured-news title=\"Blog\" subtitle=\"News Feeds\"][/featured-news]</div>',1,NULL,'no-sidebar',NULL,'published','2024-01-10 23:45:05','2024-01-10 23:45:05'),(7,'Places','<div>[places][/places]</div>',1,NULL,'no-sidebar',NULL,'published','2024-01-10 23:45:05','2024-01-10 23:45:05'),(8,'Our Offers','<div>[our-offers][/our-offers]</div>',1,NULL,'no-sidebar',NULL,'published','2024-01-10 23:45:05','2024-01-10 23:45:05'),(9,'Cookie Policy','<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>',1,NULL,'default',NULL,'published','2024-01-10 23:45:05','2024-01-10 23:45:05');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_translations`
--

DROP TABLE IF EXISTS `pages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`pages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_translations`
--

LOCK TABLES `pages_translations` WRITE;
/*!40000 ALTER TABLE `pages_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `charge_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_channel` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'confirm',
  `customer_id` bigint unsigned DEFAULT NULL,
  `refunded_amount` decimal(15,2) unsigned DEFAULT NULL,
  `refund_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,'USD',4,'TBvG0BmsuBrVOTnKWx02','cod',NULL,579.00,1,'fraud','direct',4,NULL,NULL,'2024-01-10 23:45:11','2024-01-10 23:45:11','Botble\\Hotel\\Models\\Customer',NULL),(2,'USD',9,'d5J0QTVSGGdDy3bKArnR','paypal',NULL,342.00,2,'refunded','direct',9,NULL,NULL,'2024-01-10 23:45:11','2024-01-10 23:45:11','Botble\\Hotel\\Models\\Customer',NULL),(3,'USD',1,'DqZENjb2Md9W9n4oShHF','bank_transfer',NULL,396.00,3,'refunding','direct',1,NULL,NULL,'2024-01-10 23:45:11','2024-01-10 23:45:11','Botble\\Hotel\\Models\\Customer',NULL),(4,'USD',7,'2IM5KfVn5Y5vQQqSvUo0','stripe',NULL,366.00,4,'completed','direct',7,NULL,NULL,'2024-01-10 23:45:11','2024-01-10 23:45:11','Botble\\Hotel\\Models\\Customer',NULL),(5,'USD',7,'MqV6ArHaR8EGg9ikF8fO','sslcommerz',NULL,366.00,5,'failed','direct',7,NULL,NULL,'2024-01-10 23:45:11','2024-01-10 23:45:11','Botble\\Hotel\\Models\\Customer',NULL),(6,'USD',8,'Bx69K7HRHQHQtCVNVjOI','bank_transfer',NULL,396.00,6,'failed','direct',8,NULL,NULL,'2024-01-10 23:45:11','2024-01-10 23:45:11','Botble\\Hotel\\Models\\Customer',NULL),(7,'USD',10,'TQwHN62Ey4wBPdJlz7NI','razorpay',NULL,339.00,7,'completed','direct',10,NULL,NULL,'2024-01-10 23:45:11','2024-01-10 23:45:11','Botble\\Hotel\\Models\\Customer',NULL),(8,'USD',11,'PmwDJsDhi9EjV8lbTZh5','bank_transfer',NULL,114.00,8,'refunded','direct',11,NULL,NULL,'2024-01-10 23:45:11','2024-01-10 23:45:11','Botble\\Hotel\\Models\\Customer',NULL),(9,'USD',4,'YSFL758AUdvZLCh0WCYa','paystack',NULL,228.00,9,'completed','direct',4,NULL,NULL,'2024-01-10 23:45:11','2024-01-10 23:45:11','Botble\\Hotel\\Models\\Customer',NULL),(10,'USD',1,'BjINCv8rY3SopbwKXJFn','paypal',NULL,386.00,10,'refunding','direct',1,NULL,NULL,'2024-01-10 23:45:11','2024-01-10 23:45:11','Botble\\Hotel\\Models\\Customer',NULL),(11,'USD',11,'eP6Zj35Ltt4ZdG4dxvx4','bank_transfer',NULL,150.00,11,'failed','direct',11,NULL,NULL,'2024-01-10 23:45:11','2024-01-10 23:45:11','Botble\\Hotel\\Models\\Customer',NULL),(12,'USD',8,'iGlGRVr1SUAtjIT6A7N7','razorpay',NULL,386.00,12,'failed','direct',8,NULL,NULL,'2024-01-10 23:45:11','2024-01-10 23:45:11','Botble\\Hotel\\Models\\Customer',NULL),(13,'USD',6,'IDSQzqRAxXk5ratDHxpK','paystack',NULL,113.00,13,'fraud','direct',6,NULL,NULL,'2024-01-10 23:45:11','2024-01-10 23:45:11','Botble\\Hotel\\Models\\Customer',NULL),(14,'USD',8,'6Xdqdct4vCMEeEtzGWFz','bank_transfer',NULL,300.00,14,'fraud','direct',8,NULL,NULL,'2024-01-10 23:45:12','2024-01-10 23:45:12','Botble\\Hotel\\Models\\Customer',NULL),(15,'USD',11,'L6vY8qjVCLrCQOqvfzAL','bank_transfer',NULL,594.00,15,'failed','direct',11,NULL,NULL,'2024-01-10 23:45:12','2024-01-10 23:45:12','Botble\\Hotel\\Models\\Customer',NULL),(16,'USD',3,'j7Pon7gDDulTuuiNEsSP','bank_transfer',NULL,114.00,16,'fraud','direct',3,NULL,NULL,'2024-01-10 23:45:12','2024-01-10 23:45:12','Botble\\Hotel\\Models\\Customer',NULL),(17,'USD',10,'fAmLzSlntCT2wOmcFw1e','sslcommerz',NULL,168.00,17,'refunding','direct',10,NULL,NULL,'2024-01-10 23:45:12','2024-01-10 23:45:12','Botble\\Hotel\\Models\\Customer',NULL),(18,'USD',8,'mPcC3uhgXoHu5SoNTet3','stripe',NULL,339.00,18,'completed','direct',8,NULL,NULL,'2024-01-10 23:45:12','2024-01-10 23:45:12','Botble\\Hotel\\Models\\Customer',NULL),(19,'USD',3,'bqugRJIqNPaxPEsT8Ui4','razorpay',NULL,163.00,19,'refunded','direct',3,NULL,NULL,'2024-01-10 23:45:12','2024-01-10 23:45:12','Botble\\Hotel\\Models\\Customer',NULL),(20,'USD',1,'cNuIxSUd2EEJBKD5JJKU','razorpay',NULL,193.00,20,'refunding','direct',1,NULL,NULL,'2024-01-10 23:45:12','2024-01-10 23:45:12','Botble\\Hotel\\Models\\Customer',NULL),(21,'USD',5,'qTyQFpL9eKAziY6azN0x','razorpay',NULL,113.00,21,'fraud','direct',5,NULL,NULL,'2024-01-10 23:45:12','2024-01-10 23:45:12','Botble\\Hotel\\Models\\Customer',NULL),(22,'USD',7,'SAjQqeJ1UxPdotfwiNAF','stripe',NULL,396.00,22,'completed','direct',7,NULL,NULL,'2024-01-10 23:45:12','2024-01-10 23:45:12','Botble\\Hotel\\Models\\Customer',NULL),(23,'USD',3,'9SM7gXn0z53iMp7UXgGw','bank_transfer',NULL,163.00,23,'failed','direct',3,NULL,NULL,'2024-01-10 23:45:12','2024-01-10 23:45:12','Botble\\Hotel\\Models\\Customer',NULL),(24,'USD',8,'K57hEQOMJACD80aVlKb4','bank_transfer',NULL,396.00,24,'fraud','direct',8,NULL,NULL,'2024-01-10 23:45:12','2024-01-10 23:45:12','Botble\\Hotel\\Models\\Customer',NULL),(25,'USD',6,'WmZLgnHDTorgE3IJYCMv','paystack',NULL,168.00,25,'failed','direct',6,NULL,NULL,'2024-01-10 23:45:12','2024-01-10 23:45:12','Botble\\Hotel\\Models\\Customer',NULL),(26,'USD',7,'ZwtKdn275hCQxv8xGuoB','razorpay',NULL,183.00,26,'completed','direct',7,NULL,NULL,'2024-01-10 23:45:12','2024-01-10 23:45:12','Botble\\Hotel\\Models\\Customer',NULL),(27,'USD',2,'50YU2OZaeOONvSECXIVp','stripe',NULL,300.00,27,'completed','direct',2,NULL,NULL,'2024-01-10 23:45:12','2024-01-10 23:45:12','Botble\\Hotel\\Models\\Customer',NULL),(28,'USD',10,'Z5jzqzSVbRq1DC3KWTJK','razorpay',NULL,579.00,28,'refunding','direct',10,NULL,NULL,'2024-01-10 23:45:12','2024-01-10 23:45:12','Botble\\Hotel\\Models\\Customer',NULL),(29,'USD',5,'wL76KJLTThjsASaz6IaP','paystack',NULL,326.00,29,'completed','direct',5,NULL,NULL,'2024-01-10 23:45:12','2024-01-10 23:45:12','Botble\\Hotel\\Models\\Customer',NULL),(30,'USD',9,'Kxp6m2ZliGqTkId5WWjI','cod',NULL,594.00,30,'pending','direct',9,NULL,NULL,'2024-01-10 23:45:12','2024-01-10 23:45:12','Botble\\Hotel\\Models\\Customer',NULL),(31,'USD',1,'77dnTpMQRAh2sX0h2Hv8','cod',NULL,386.00,31,'pending','direct',1,NULL,NULL,'2024-01-10 23:45:12','2024-01-10 23:45:12','Botble\\Hotel\\Models\\Customer',NULL);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_categories` (
  `category_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_categories_category_id_index` (`category_id`),
  KEY `post_categories_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` VALUES (2,1),(3,1),(1,2),(4,2),(1,3),(4,3),(1,4),(3,4),(1,5),(4,5),(1,6),(4,6);
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tags` (
  `tag_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_tags_tag_id_index` (`tag_id`),
  KEY `post_tags_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(1,2),(2,2),(3,2),(4,2),(5,2),(1,3),(2,3),(3,3),(4,3),(5,3),(1,4),(2,4),(3,4),(4,4),(5,4),(1,5),(2,5),(3,5),(4,5),(5,5),(1,6),(2,6),(3,6),(4,6),(5,6);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_status_index` (`status`),
  KEY `posts_author_id_index` (`author_id`),
  KEY `posts_author_type_index` (`author_type`),
  KEY `posts_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Each of our 8 double rooms has its own distinct.','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/04.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/05.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/06.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/01.jpg',842,NULL,'2024-01-10 23:44:58','2024-01-10 23:44:58'),(2,'Essential Qualities of Highly Successful Music','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/04.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/05.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/06.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/02.jpg',440,NULL,'2024-01-10 23:44:58','2024-01-10 23:44:58'),(3,'9 Things I Love About Shaving My Head','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/04.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/05.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/06.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/03.jpg',1613,NULL,'2024-01-10 23:44:58','2024-01-10 23:44:58'),(4,'Why Teamwork Really Makes The Dream Work','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/04.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/05.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/06.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/04.jpg',673,NULL,'2024-01-10 23:44:58','2024-01-10 23:44:58'),(5,'The World Caters to Average People','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/04.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/05.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/06.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/05.jpg',908,NULL,'2024-01-10 23:44:58','2024-01-10 23:44:58'),(6,'The litigants on the screen are not actors','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/04.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/05.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/06.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/06.jpg',577,NULL,'2024-01-10 23:44:58','2024-01-10 23:44:58');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_translations`
--

DROP TABLE IF EXISTS `posts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`posts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_translations`
--

LOCK TABLES `posts_translations` WRITE;
/*!40000 ALTER TABLE `posts_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_users` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_users_user_id_index` (`user_id`),
  KEY `role_users_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`),
  KEY `roles_created_by_index` (`created_by`),
  KEY `roles_updated_by_index` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Admin','{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.manage.license\":true,\"extensions.index\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.index\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.cronjob\":true,\"settings.admin-appearance\":true,\"settings.cache\":true,\"settings.datatables\":true,\"settings.email.rules\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"optimize.settings\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"widgets.index\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"analytics.settings\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"blog.settings\":true,\"plugins.captcha\":true,\"captcha.settings\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"contact.settings\":true,\"galleries.index\":true,\"galleries.create\":true,\"galleries.edit\":true,\"galleries.destroy\":true,\"room.index\":true,\"room.create\":true,\"room.edit\":true,\"room.destroy\":true,\"amenity.index\":true,\"amenity.create\":true,\"amenity.edit\":true,\"amenity.destroy\":true,\"food.index\":true,\"food.create\":true,\"food.edit\":true,\"food.destroy\":true,\"food-type.index\":true,\"food-type.create\":true,\"food-type.edit\":true,\"food-type.destroy\":true,\"booking.index\":true,\"booking.edit\":true,\"booking.destroy\":true,\"booking.reports.index\":true,\"booking-address.index\":true,\"booking-address.create\":true,\"booking-address.edit\":true,\"booking-address.destroy\":true,\"booking-room.index\":true,\"booking-room.create\":true,\"booking-room.edit\":true,\"booking-room.destroy\":true,\"customer.index\":true,\"customer.create\":true,\"customer.edit\":true,\"customer.destroy\":true,\"room-category.index\":true,\"room-category.create\":true,\"room-category.edit\":true,\"room-category.destroy\":true,\"feature.index\":true,\"feature.create\":true,\"feature.edit\":true,\"feature.destroy\":true,\"service.index\":true,\"service.create\":true,\"service.edit\":true,\"service.destroy\":true,\"place.index\":true,\"place.create\":true,\"place.edit\":true,\"place.destroy\":true,\"tax.index\":true,\"tax.create\":true,\"tax.edit\":true,\"tax.destroy\":true,\"invoice.template\":true,\"coupons.index\":true,\"coupons.create\":true,\"coupons.edit\":true,\"coupons.destroy\":true,\"hotel.settings\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"newsletter.index\":true,\"newsletter.destroy\":true,\"newsletter.settings\":true,\"payment.index\":true,\"payments.settings\":true,\"payment.destroy\":true,\"testimonial.index\":true,\"testimonial.create\":true,\"testimonial.edit\":true,\"testimonial.destroy\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true}','Admin users role',1,2,2,'2024-01-10 23:45:08','2024-01-10 23:45:08');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (2,'api_enabled','0',NULL,'2024-01-10 23:45:11'),(3,'activated_plugins','[\"language\",\"language-advanced\",\"analytics\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"contact\",\"cookie-consent\",\"gallery\",\"hotel\",\"newsletter\",\"payment\",\"paypal\",\"paystack\",\"razorpay\",\"sslcommerz\",\"stripe\",\"testimonial\",\"translation\"]',NULL,'2024-01-10 23:45:11'),(6,'language_hide_default','1',NULL,'2024-01-10 23:45:11'),(8,'language_display','all',NULL,'2024-01-10 23:45:11'),(9,'language_hide_languages','[]',NULL,'2024-01-10 23:45:11'),(10,'media_random_hash','a54c3d3ffc4749882ee11ac07d000036',NULL,'2024-01-10 23:45:11'),(11,'theme','miranda',NULL,'2024-01-10 23:45:11'),(12,'show_admin_bar','1',NULL,'2024-01-10 23:45:11'),(13,'language_switcher_display','dropdown',NULL,'2024-01-10 23:45:11'),(14,'admin_favicon','general/favicon.png',NULL,'2024-01-10 23:45:11'),(15,'admin_logo','general/logo-white.png',NULL,'2024-01-10 23:45:11'),(16,'permalink-botble-blog-models-post','news',NULL,'2024-01-10 23:45:11'),(17,'permalink-botble-blog-models-category','news',NULL,'2024-01-10 23:45:11'),(18,'payment_cod_status','1',NULL,'2024-01-10 23:45:11'),(19,'payment_cod_description','Please pay money directly to the postman, if you choose cash on delivery method (COD).',NULL,'2024-01-10 23:45:11'),(20,'payment_bank_transfer_status','1',NULL,'2024-01-10 23:45:11'),(21,'payment_bank_transfer_description','Please send money to our bank account: ACB - 69270 213 19.',NULL,'2024-01-10 23:45:11'),(22,'payment_stripe_payment_type','stripe_checkout',NULL,'2024-01-10 23:45:11'),(23,'theme-miranda-site_title','Hotel Miranda',NULL,NULL),(24,'theme-miranda-copyright','©2024 Miranda. All right reserved.',NULL,NULL),(25,'theme-miranda-cookie_consent_message','Your experience on this site will be improved by allowing cookies ',NULL,NULL),(26,'theme-miranda-cookie_consent_learn_more_url','/cookie-policy',NULL,NULL),(27,'theme-miranda-cookie_consent_learn_more_text','Cookie Policy',NULL,NULL),(28,'theme-miranda-homepage_id','1',NULL,NULL),(29,'theme-miranda-blog_page_id','2',NULL,NULL),(30,'theme-miranda-logo','general/logo.png',NULL,NULL),(31,'theme-miranda-logo_white','general/logo-white.png',NULL,NULL),(32,'theme-miranda-favicon','general/favicon.png',NULL,NULL),(33,'theme-miranda-email','info@webmail.com',NULL,NULL),(34,'theme-miranda-address','14/A, Miranda City, NYC',NULL,NULL),(35,'theme-miranda-hotline','+908 987 877 09',NULL,NULL),(36,'theme-miranda-news_banner','general/banner-news.jpg',NULL,NULL),(37,'theme-miranda-rooms_banner','general/banner-news.jpg',NULL,NULL),(38,'theme-miranda-term_of_use_url','#',NULL,NULL),(39,'theme-miranda-privacy_policy_url','#',NULL,NULL),(40,'theme-miranda-preloader_enabled','no',NULL,NULL),(41,'theme-miranda-about-us','Lorem ipsum dolor sit amet, consect etur adipisicing elit, sed doing eius mod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitat ion ullamco laboris nisi.',NULL,NULL),(42,'theme-miranda-hotel_rules','<ul><li>No smoking, parties or events.</li><li>Check-in time from 2 PM, check-out by 10 AM.</li><li>Time to time car parking</li><li>Download Our minimal app</li><li>Browse regular our website</li></ul>',NULL,NULL),(43,'theme-miranda-cancellation','<p>Phasellus volutpat neque a tellus venenatis, a euismod augue facilisis. Fusce ut metus mattis, consequat metus nec, luctus lectus. Pellentesque orci quis hendrerit sed eu dolor. <strong>Cancel up</strong> to <strong>14 days</strong> to get a full refund.</p>',NULL,NULL),(44,'theme-miranda-slider-image-1','sliders/04.jpg',NULL,NULL),(45,'theme-miranda-slider-title-1','The ultimate luxury experience',NULL,NULL),(46,'theme-miranda-slider-description-1','<p>The Perfect<br>Base For You</p>',NULL,NULL),(47,'theme-miranda-slider-primary-button-text-1','Take A tour',NULL,NULL),(48,'theme-miranda-slider-primary-button-url-1','/rooms',NULL,NULL),(49,'theme-miranda-slider-secondary-button-text-1','Learn more',NULL,NULL),(50,'theme-miranda-slider-secondary-button-url-1','/about-us',NULL,NULL),(51,'theme-miranda-slider-image-2','sliders/05.jpg',NULL,NULL),(52,'theme-miranda-slider-title-2','The ultimate luxury experience',NULL,NULL),(53,'theme-miranda-slider-description-2','<p>The Perfect<br>Base For You</p>',NULL,NULL),(54,'theme-miranda-slider-primary-button-text-2','Take A tour',NULL,NULL),(55,'theme-miranda-slider-primary-button-url-2','/rooms',NULL,NULL),(56,'theme-miranda-slider-secondary-button-text-2','Learn more',NULL,NULL),(57,'theme-miranda-slider-secondary-button-url-2','/about-us',NULL,NULL),(58,'theme-miranda-social_links','[[{\"key\":\"social-name\",\"value\":\"Facebook\"},{\"key\":\"social-icon\",\"value\":\"fab fa-facebook-f\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"social-name\",\"value\":\"Twitter\"},{\"key\":\"social-icon\",\"value\":\"fab fa-twitter\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"social-name\",\"value\":\"Youtube\"},{\"key\":\"social-icon\",\"value\":\"fab fa-youtube\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}],[{\"key\":\"social-name\",\"value\":\"Behance\"},{\"key\":\"social-icon\",\"value\":\"fab fa-behance\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.behance.com\\/\"}],[{\"key\":\"social-name\",\"value\":\"Linkedin\"},{\"key\":\"social-icon\",\"value\":\"fab fa-linkedin\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.linkedin.com\\/\"}]]',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slugs_reference_id_index` (`reference_id`),
  KEY `slugs_key_index` (`key`),
  KEY `slugs_prefix_index` (`prefix`),
  KEY `slugs_reference_index` (`reference_id`,`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (1,'general',1,'Botble\\Blog\\Models\\Category','news','2024-01-10 23:44:58','2024-01-10 23:45:08'),(2,'hotel',2,'Botble\\Blog\\Models\\Category','news','2024-01-10 23:44:58','2024-01-10 23:45:08'),(3,'booking',3,'Botble\\Blog\\Models\\Category','news','2024-01-10 23:44:58','2024-01-10 23:45:08'),(4,'resort',4,'Botble\\Blog\\Models\\Category','news','2024-01-10 23:44:58','2024-01-10 23:45:08'),(5,'travel',5,'Botble\\Blog\\Models\\Category','news','2024-01-10 23:44:58','2024-01-10 23:45:08'),(6,'general',1,'Botble\\Blog\\Models\\Tag','tag','2024-01-10 23:44:58','2024-01-10 23:44:58'),(7,'hotel',2,'Botble\\Blog\\Models\\Tag','tag','2024-01-10 23:44:58','2024-01-10 23:44:58'),(8,'booking',3,'Botble\\Blog\\Models\\Tag','tag','2024-01-10 23:44:58','2024-01-10 23:44:58'),(9,'resort',4,'Botble\\Blog\\Models\\Tag','tag','2024-01-10 23:44:58','2024-01-10 23:44:58'),(10,'travel',5,'Botble\\Blog\\Models\\Tag','tag','2024-01-10 23:44:58','2024-01-10 23:44:58'),(11,'each-of-our-8-double-rooms-has-its-own-distinct',1,'Botble\\Blog\\Models\\Post','news','2024-01-10 23:44:58','2024-01-10 23:45:08'),(12,'essential-qualities-of-highly-successful-music',2,'Botble\\Blog\\Models\\Post','news','2024-01-10 23:44:58','2024-01-10 23:45:08'),(13,'9-things-i-love-about-shaving-my-head',3,'Botble\\Blog\\Models\\Post','news','2024-01-10 23:44:58','2024-01-10 23:45:08'),(14,'why-teamwork-really-makes-the-dream-work',4,'Botble\\Blog\\Models\\Post','news','2024-01-10 23:44:58','2024-01-10 23:45:08'),(15,'the-world-caters-to-average-people',5,'Botble\\Blog\\Models\\Post','news','2024-01-10 23:44:58','2024-01-10 23:45:08'),(16,'the-litigants-on-the-screen-are-not-actors',6,'Botble\\Blog\\Models\\Post','news','2024-01-10 23:44:58','2024-01-10 23:45:08'),(17,'luxury-hall-of-fame',1,'Botble\\Hotel\\Models\\Room','rooms','2024-01-10 23:44:59','2024-01-10 23:44:59'),(18,'pendora-fame',2,'Botble\\Hotel\\Models\\Room','rooms','2024-01-10 23:44:59','2024-01-10 23:44:59'),(19,'pacific-room',3,'Botble\\Hotel\\Models\\Room','rooms','2024-01-10 23:44:59','2024-01-10 23:44:59'),(20,'junior-suite',4,'Botble\\Hotel\\Models\\Room','rooms','2024-01-10 23:44:59','2024-01-10 23:44:59'),(21,'family-suite',5,'Botble\\Hotel\\Models\\Room','rooms','2024-01-10 23:44:59','2024-01-10 23:44:59'),(22,'relax-suite',6,'Botble\\Hotel\\Models\\Room','rooms','2024-01-10 23:44:59','2024-01-10 23:44:59'),(23,'luxury-suite',7,'Botble\\Hotel\\Models\\Room','rooms','2024-01-10 23:44:59','2024-01-10 23:44:59'),(24,'president-room',8,'Botble\\Hotel\\Models\\Room','rooms','2024-01-10 23:44:59','2024-01-10 23:44:59'),(25,'duplex-restaurant',1,'Botble\\Hotel\\Models\\Place','places','2024-01-10 23:45:05','2024-01-10 23:45:05'),(26,'duplex-restaurant',2,'Botble\\Hotel\\Models\\Place','places','2024-01-10 23:45:05','2024-01-10 23:45:05'),(27,'duplex-restaurant',3,'Botble\\Hotel\\Models\\Place','places','2024-01-10 23:45:05','2024-01-10 23:45:05'),(28,'duplex-restaurant',4,'Botble\\Hotel\\Models\\Place','places','2024-01-10 23:45:05','2024-01-10 23:45:05'),(29,'duplex-restaurant',5,'Botble\\Hotel\\Models\\Place','places','2024-01-10 23:45:05','2024-01-10 23:45:05'),(30,'duplex-restaurant',6,'Botble\\Hotel\\Models\\Place','places','2024-01-10 23:45:05','2024-01-10 23:45:05'),(31,'homepage',1,'Botble\\Page\\Models\\Page','','2024-01-10 23:45:05','2024-01-10 23:45:05'),(32,'news',2,'Botble\\Page\\Models\\Page','','2024-01-10 23:45:05','2024-01-10 23:45:05'),(33,'contact',3,'Botble\\Page\\Models\\Page','','2024-01-10 23:45:05','2024-01-10 23:45:05'),(34,'restaurant',4,'Botble\\Page\\Models\\Page','','2024-01-10 23:45:05','2024-01-10 23:45:05'),(35,'our-gallery',5,'Botble\\Page\\Models\\Page','','2024-01-10 23:45:05','2024-01-10 23:45:05'),(36,'about-us',6,'Botble\\Page\\Models\\Page','','2024-01-10 23:45:05','2024-01-10 23:45:05'),(37,'places',7,'Botble\\Page\\Models\\Page','','2024-01-10 23:45:05','2024-01-10 23:45:05'),(38,'our-offers',8,'Botble\\Page\\Models\\Page','','2024-01-10 23:45:05','2024-01-10 23:45:05'),(39,'cookie-policy',9,'Botble\\Page\\Models\\Page','','2024-01-10 23:45:05','2024-01-10 23:45:05'),(40,'duplex-restaurant',1,'Botble\\Gallery\\Models\\Gallery','galleries','2024-01-10 23:45:07','2024-01-10 23:45:07'),(41,'luxury-room',2,'Botble\\Gallery\\Models\\Gallery','galleries','2024-01-10 23:45:07','2024-01-10 23:45:07'),(42,'pacific-room',3,'Botble\\Gallery\\Models\\Gallery','galleries','2024-01-10 23:45:07','2024-01-10 23:45:07'),(43,'family-room',4,'Botble\\Gallery\\Models\\Gallery','galleries','2024-01-10 23:45:07','2024-01-10 23:45:07'),(44,'king-bed',5,'Botble\\Gallery\\Models\\Gallery','galleries','2024-01-10 23:45:07','2024-01-10 23:45:07'),(45,'special-foods',6,'Botble\\Gallery\\Models\\Gallery','galleries','2024-01-10 23:45:07','2024-01-10 23:45:07'),(46,'wifi',1,'Botble\\Hotel\\Models\\Service','services','2024-01-10 23:45:12','2024-01-10 23:45:12'),(47,'car-rental',2,'Botble\\Hotel\\Models\\Service','services','2024-01-10 23:45:12','2024-01-10 23:45:12'),(48,'satellite-tv',3,'Botble\\Hotel\\Models\\Service','services','2024-01-10 23:45:12','2024-01-10 23:45:12'),(49,'sea-view',4,'Botble\\Hotel\\Models\\Service','services','2024-01-10 23:45:12','2024-01-10 23:45:12'),(50,'laundry',5,'Botble\\Hotel\\Models\\Service','services','2024-01-10 23:45:12','2024-01-10 23:45:12'),(51,'breakfast',6,'Botble\\Hotel\\Models\\Service','services','2024-01-10 23:45:12','2024-01-10 23:45:12');
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs_translations`
--

DROP TABLE IF EXISTS `slugs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slugs_id` bigint unsigned NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`lang_code`,`slugs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs_translations`
--

LOCK TABLES `slugs_translations` WRITE;
/*!40000 ALTER TABLE `slugs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `slugs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'General',1,'Botble\\ACL\\Models\\User','','published','2024-01-10 23:44:58','2024-01-10 23:44:58'),(2,'Hotel',1,'Botble\\ACL\\Models\\User','','published','2024-01-10 23:44:58','2024-01-10 23:44:58'),(3,'Booking',1,'Botble\\ACL\\Models\\User','','published','2024-01-10 23:44:58','2024-01-10 23:44:58'),(4,'Resort',1,'Botble\\ACL\\Models\\User','','published','2024-01-10 23:44:58','2024-01-10 23:44:58'),(5,'Travel',1,'Botble\\ACL\\Models\\User','','published','2024-01-10 23:44:58','2024-01-10 23:44:58');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_translations`
--

DROP TABLE IF EXISTS `tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_translations`
--

LOCK TABLES `tags_translations` WRITE;
/*!40000 ALTER TABLE `tags_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES (1,'Adam Williams','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua','testimonials/01.png','CEO Of Microsoft','published','2024-01-10 23:45:06','2024-01-10 23:45:06'),(2,'Retha Deowalim','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua','testimonials/02.png','CEO Of Apple','published','2024-01-10 23:45:06','2024-01-10 23:45:06'),(3,'Sam J. Wasim','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua','testimonials/03.png','Pio Founder','published','2024-01-10 23:45:06','2024-01-10 23:45:06');
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials_translations`
--

DROP TABLE IF EXISTS `testimonials_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testimonials_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`testimonials_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials_translations`
--

LOCK TABLES `testimonials_translations` WRITE;
/*!40000 ALTER TABLE `testimonials_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `testimonials_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_meta_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'quincy87@marvin.net',NULL,'$2y$12$6jyb.vH1tiQlm.e/00W9B.wQKsS/l/CWSvHlyl3B0FXdJZ8YZl/62',NULL,'2024-01-10 23:45:08','2024-01-10 23:45:08','Verona','Thompson','botble',NULL,1,1,NULL,NULL),(2,'kuvalis.grady@jaskolski.com',NULL,'$2y$12$IaPduVS5SZROmrNVPG4Lt.Bn1tEHMVGESfYKQFZSkk5ZEp18XzTSW',NULL,'2024-01-10 23:45:08','2024-01-10 23:45:08','Creola','Romaguera','admin',NULL,1,1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,'CustomMenuWidget','footer_sidebar','miranda',0,'{\"id\":\"CustomMenuWidget\",\"name\":\"Services.\",\"menu_id\":\"services\"}','2024-01-10 23:45:11','2024-01-10 23:45:11'),(2,'RecentPostsWidget','primary_sidebar','miranda',0,'{\"id\":\"RecentPostsWidget\",\"name\":\"Recent posts\",\"number_display\":5}','2024-01-10 23:45:11','2024-01-10 23:45:11'),(3,'BlogCategoriesWidget','primary_sidebar','miranda',1,'{\"id\":\"BlogCategoriesWidget\",\"name\":\"Categories\",\"number_display\":5}','2024-01-10 23:45:11','2024-01-10 23:45:11'),(4,'BlogTagsWidget','primary_sidebar','miranda',2,'{\"id\":\"BlogTagsWidget\",\"name\":\"Popular Tags\",\"number_display\":5}','2024-01-10 23:45:11','2024-01-10 23:45:11');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-11 13:45:14
