-- MySQL dump 10.13  Distrib 5.7.24, for osx11.1 (x86_64)
--
-- Host: localhost    Database: potproj_restore
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add category',7,'add_category'),(26,'Can change category',7,'change_category'),(27,'Can delete category',7,'delete_category'),(28,'Can view category',7,'view_category'),(29,'Can add post',8,'add_post'),(30,'Can change post',8,'change_post'),(31,'Can delete post',8,'delete_post'),(32,'Can view post',8,'view_post'),(33,'Can add post',9,'add_post'),(34,'Can change post',9,'change_post'),(35,'Can delete post',9,'delete_post'),(36,'Can view post',9,'view_post'),(37,'Can add post2',10,'add_post2'),(38,'Can change post2',10,'change_post2'),(39,'Can delete post2',10,'delete_post2'),(40,'Can view post2',10,'view_post2');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$O4IPBMY8NIzaYBgLSHn0OI$BkMR0Dvs+qfIgMnD0nAO0JcHk8Gta6aHf98FVK/Sk/A=','2024-01-08 20:40:17.065473',1,'seyun4047','','','love4047@naver.com',1,1,'2024-01-08 20:36:38.595875');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_category`
--

DROP TABLE IF EXISTS `blog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `slug` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_category`
--

LOCK TABLES `blog_category` WRITE;
/*!40000 ALTER TABLE `blog_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_post`
--

DROP TABLE IF EXISTS `blog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_post` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `hook_text` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `head_image` varchar(100) NOT NULL,
  `file_upload` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `author_id` int DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_post_author_id_dd7a8485_fk_auth_user_id` (`author_id`),
  KEY `blog_post_category_id_c326dbf8_fk_blog_category_id` (`category_id`),
  CONSTRAINT `blog_post_author_id_dd7a8485_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `blog_post_category_id_c326dbf8_fk_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_post`
--

LOCK TABLES `blog_post` WRITE;
/*!40000 ALTER TABLE `blog_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-01-08 20:40:25.621963','1','1 in_img_1              2024-01-08 20:40:25.062396 2024-01-08 20:40:25.062404',1,'[{\"added\": {}}]',9,1),(2,'2024-01-08 20:40:56.372437','1','1 in_img_1              2024-01-08 20:40:25.062396 2024-01-08 20:40:25.062404',3,'',9,1),(3,'2024-01-08 20:41:01.731380','2','2 in_img_1              2024-01-08 20:41:01.290218 2024-01-08 20:41:01.290229',1,'[{\"added\": {}}]',9,1),(4,'2024-01-08 20:41:09.890926','3','3 in_img_3              2024-01-08 20:41:09.477042 2024-01-08 20:41:09.477052',1,'[{\"added\": {}}]',9,1),(5,'2024-01-08 20:41:14.800814','4','4 in_img_2              2024-01-08 20:41:14.375438 2024-01-08 20:41:14.375452',1,'[{\"added\": {}}]',9,1),(6,'2024-01-08 20:41:19.891819','5','5 in_img_4              2024-01-08 20:41:19.473473 2024-01-08 20:41:19.473488',1,'[{\"added\": {}}]',9,1),(7,'2024-01-08 20:41:24.346455','6','6 in_img_5              2024-01-08 20:41:23.926708 2024-01-08 20:41:23.926726',1,'[{\"added\": {}}]',9,1),(8,'2024-01-08 20:41:29.181085','7','7 in_img_6              2024-01-08 20:41:28.762760 2024-01-08 20:41:28.762765',1,'[{\"added\": {}}]',9,1),(9,'2024-01-08 20:42:25.369566','1','1 DSCF8542              2024-01-08 20:42:24.950889 2024-01-08 20:42:24.950902',1,'[{\"added\": {}}]',10,1),(10,'2024-01-08 20:42:31.883635','2','2 DSCF8761              2024-01-08 20:42:31.460382 2024-01-08 20:42:31.460399',1,'[{\"added\": {}}]',10,1),(11,'2024-01-08 20:42:35.884023','3','3 DSCF9005              2024-01-08 20:42:35.470989 2024-01-08 20:42:35.471002',1,'[{\"added\": {}}]',10,1),(12,'2024-01-08 20:42:44.619128','4','4 DSCF8391              2024-01-08 20:42:44.188064 2024-01-08 20:42:44.188075',1,'[{\"added\": {}}]',10,1),(13,'2024-01-08 20:42:49.070052','5','5 IMG_1764              2024-01-08 20:42:49.068161 2024-01-08 20:42:49.068212',1,'[{\"added\": {}}]',10,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'blog','category'),(8,'blog','post'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(9,'single_pages','post'),(10,'single_pages','post2');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-01-08 20:32:09.879717'),(2,'auth','0001_initial','2024-01-08 20:32:09.991811'),(3,'admin','0001_initial','2024-01-08 20:32:10.011943'),(4,'admin','0002_logentry_remove_auto_add','2024-01-08 20:32:10.014709'),(5,'admin','0003_logentry_add_action_flag_choices','2024-01-08 20:32:10.018030'),(6,'contenttypes','0002_remove_content_type_name','2024-01-08 20:32:10.031460'),(7,'auth','0002_alter_permission_name_max_length','2024-01-08 20:32:10.040420'),(8,'auth','0003_alter_user_email_max_length','2024-01-08 20:32:10.046702'),(9,'auth','0004_alter_user_username_opts','2024-01-08 20:32:10.049378'),(10,'auth','0005_alter_user_last_login_null','2024-01-08 20:32:10.059404'),(11,'auth','0006_require_contenttypes_0002','2024-01-08 20:32:10.060035'),(12,'auth','0007_alter_validators_add_error_messages','2024-01-08 20:32:10.062341'),(13,'auth','0008_alter_user_username_max_length','2024-01-08 20:32:10.072563'),(14,'auth','0009_alter_user_last_name_max_length','2024-01-08 20:32:10.083355'),(15,'auth','0010_alter_group_name_max_length','2024-01-08 20:32:10.088004'),(16,'auth','0011_update_proxy_permissions','2024-01-08 20:32:10.090422'),(17,'auth','0012_alter_user_first_name_max_length','2024-01-08 20:32:10.100119'),(18,'blog','0001_initial','2024-01-08 20:32:10.121875'),(19,'blog','0002_post2','2024-01-08 20:32:10.139073'),(20,'blog','0003_delete_post2','2024-01-08 20:32:10.142095'),(21,'blog','0004_post2','2024-01-08 20:32:10.144994'),(22,'blog','0005_delete_post2','2024-01-08 20:32:10.146658'),(23,'sessions','0001_initial','2024-01-08 20:32:10.151077'),(24,'single_pages','0001_initial','2024-01-08 20:32:10.154008'),(25,'single_pages','0002_post2_alter_post_options_alter_post_intro_img_and_more','2024-01-08 20:32:10.162761');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('pvl78q4yuv4cxo8vs5lsujrwx1nvw5ut','.eJxVjMsOwiAQRf-FtSG8HMCl-34DGWCQqoGktCvjv2uTLnR7zzn3xQJuaw3boCXMmV2YZKffLWJ6UNtBvmO7dZ56W5c58l3hBx186pme18P9O6g46rcmoQq57KT1RiQg9FGi8CoLp0ELQQ6wgEkAVp1jKtk7raWzCCSTNJ69P9ZiN0w:1rMnzN:VkaQ5rslp5DA81fSLUdqiGT3OlcqlukyFwh5IIoeMtQ','2024-01-22 20:40:17.066887');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `single_pages_post`
--

DROP TABLE IF EXISTS `single_pages_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `single_pages_post` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `intro_img` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `single_pages_post`
--

LOCK TABLES `single_pages_post` WRITE;
/*!40000 ALTER TABLE `single_pages_post` DISABLE KEYS */;
INSERT INTO `single_pages_post` VALUES (1,'in_img_1','intro/images/in_img_1.JPG','2001-10-20 19:07:07.070000','2001-10-20 21:07:07.070000'),(2,'in_img_1','intro/images/in_img_1.JPG','2024-01-08 20:41:01.290218','2024-01-08 20:41:01.290229'),(3,'in_img_3','intro/images/in_img_3.JPG','2024-01-08 20:41:09.477042','2024-01-08 20:41:09.477052'),(4,'in_img_2','intro/images/in_img_2.JPG','2024-01-08 20:41:14.375438','2024-01-08 20:41:14.375452'),(5,'in_img_4','intro/images/in_img_4.JPG','2024-01-08 20:41:19.473473','2024-01-08 20:41:19.473488'),(6,'in_img_5','intro/images/in_img_5.JPG','2024-01-08 20:41:23.926708','2024-01-08 20:41:23.926726'),(7,'in_img_6','intro/images/in_img_6.JPG','2024-01-08 20:41:28.762760','2024-01-08 20:41:28.762765');
/*!40000 ALTER TABLE `single_pages_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `single_pages_post2`
--

DROP TABLE IF EXISTS `single_pages_post2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `single_pages_post2` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `intro_img` varchar(100) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `single_pages_post2`
--

LOCK TABLES `single_pages_post2` WRITE;
/*!40000 ALTER TABLE `single_pages_post2` DISABLE KEYS */;
INSERT INTO `single_pages_post2` VALUES (1,'intro/images2/DSCF8542.JPG','DSCF8542','2024-01-08 20:42:24.950889','2024-01-08 20:42:24.950902'),(2,'intro/images2/DSCF8761.JPG','DSCF8761','2024-01-08 20:42:31.460382','2024-01-08 20:42:31.460399'),(3,'intro/images2/DSCF9005.JPG','DSCF9005','2024-01-08 20:42:35.470989','2024-01-08 20:42:35.471002'),(4,'intro/images2/DSCF8391.JPG','DSCF8391','2024-01-08 20:42:44.188064','2024-01-08 20:42:44.188075');
/*!40000 ALTER TABLE `single_pages_post2` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-08 21:07:03
