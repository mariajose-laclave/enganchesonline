-- MySQL dump 10.17  Distrib 10.3.25-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: enganches_
-- ------------------------------------------------------
-- Server version	10.3.25-MariaDB-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_analytics_usage_version_log`
--

DROP TABLE IF EXISTS `admin_analytics_usage_version_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_analytics_usage_version_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `last_viewed_in_version` varchar(50) NOT NULL COMMENT 'Viewer last viewed on product version',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ADMIN_ANALYTICS_USAGE_VERSION_LOG_LAST_VIEWED_IN_VERSION` (`last_viewed_in_version`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Admin Notification Viewer Log Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_analytics_usage_version_log`
--

LOCK TABLES `admin_analytics_usage_version_log` WRITE;
/*!40000 ALTER TABLE `admin_analytics_usage_version_log` DISABLE KEYS */;
INSERT INTO `admin_analytics_usage_version_log` VALUES (1,'2.3.6');
/*!40000 ALTER TABLE `admin_analytics_usage_version_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_passwords`
--

DROP TABLE IF EXISTS `admin_passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_passwords` (
  `password_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Password ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'User ID',
  `password_hash` varchar(100) DEFAULT NULL COMMENT 'Password Hash',
  `expires` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Deprecated',
  `last_updated` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Last Updated',
  PRIMARY KEY (`password_id`),
  KEY `ADMIN_PASSWORDS_USER_ID` (`user_id`),
  CONSTRAINT `ADMIN_PASSWORDS_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Admin Passwords';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_passwords`
--

LOCK TABLES `admin_passwords` WRITE;
/*!40000 ALTER TABLE `admin_passwords` DISABLE KEYS */;
INSERT INTO `admin_passwords` VALUES (1,1,'47fbfff03da848c5b5501893acaf9abf58a303702eac8d571a65bba7550ef89e:OmkS0m1fVBAiy8Ma:2',0,1617113476),(2,1,'4b8d1974d0151d80685c62c2cacabd6828eb3c1a5cae0883c0623ef587e316f3:1M2y0eOjGR5KpmzM:2',0,1619508650);
/*!40000 ALTER TABLE `admin_passwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_system_messages`
--

DROP TABLE IF EXISTS `admin_system_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_system_messages` (
  `identity` varchar(100) NOT NULL COMMENT 'Message ID',
  `severity` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Problem type',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Create date',
  PRIMARY KEY (`identity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Admin System Messages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_system_messages`
--

LOCK TABLES `admin_system_messages` WRITE;
/*!40000 ALTER TABLE `admin_system_messages` DISABLE KEYS */;
INSERT INTO `admin_system_messages` VALUES ('6574525426784678a4023b3d1743a4de',1,'2021-04-27 10:27:36'),('7c5954236edabc5914c82fdddb8d479e',2,'2021-04-27 07:37:55'),('stripe_payments_notification_webhooks_unconfigured',2,'2021-03-31 10:16:14');
/*!40000 ALTER TABLE `admin_system_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user`
--

DROP TABLE IF EXISTS `admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'User ID',
  `firstname` varchar(32) DEFAULT NULL COMMENT 'User First Name',
  `lastname` varchar(32) DEFAULT NULL COMMENT 'User Last Name',
  `email` varchar(128) DEFAULT NULL COMMENT 'User Email',
  `username` varchar(40) DEFAULT NULL COMMENT 'User Login',
  `password` varchar(255) NOT NULL COMMENT 'User Password',
  `created` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'User Created Time',
  `modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'User Modified Time',
  `logdate` timestamp NULL DEFAULT NULL COMMENT 'User Last Login Time',
  `lognum` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'User Login Number',
  `reload_acl_flag` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Reload ACL',
  `is_active` smallint(6) NOT NULL DEFAULT 1 COMMENT 'User Is Active',
  `extra` text DEFAULT NULL COMMENT 'User Extra Data',
  `rp_token` text DEFAULT NULL COMMENT 'Reset Password Link Token',
  `rp_token_created_at` timestamp NULL DEFAULT NULL COMMENT 'Reset Password Link Token Creation Date',
  `interface_locale` varchar(16) NOT NULL DEFAULT 'en_US' COMMENT 'Backend interface locale',
  `failures_num` smallint(6) DEFAULT 0 COMMENT 'Failure Number',
  `first_failure` timestamp NULL DEFAULT NULL COMMENT 'First Failure',
  `lock_expires` timestamp NULL DEFAULT NULL COMMENT 'Expiration Lock Dates',
  `refresh_token` text DEFAULT NULL COMMENT 'Email connector refresh token',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `ADMIN_USER_USERNAME` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Admin User Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user`
--

LOCK TABLES `admin_user` WRITE;
/*!40000 ALTER TABLE `admin_user` DISABLE KEYS */;
INSERT INTO `admin_user` VALUES (1,'admin','admin','grant@laclave.es','admin','4b8d1974d0151d80685c62c2cacabd6828eb3c1a5cae0883c0623ef587e316f3:1M2y0eOjGR5KpmzM:2','2021-03-30 14:11:16','2021-04-27 10:27:34','2021-04-27 08:58:27',10,0,1,'{\"configState\":{\"catalog_search\":\"1\",\"themeoption_general\":\"0\",\"themeoption_header\":\"0\",\"themeoption_font\":\"0\",\"themeoption_page\":\"1\",\"themeoption_main\":\"1\",\"themeoption_fake_order\":\"1\",\"themeoption_about_us\":\"1\",\"themeoption_contact\":\"1\",\"themeoption_blog\":\"1\",\"catalog_layered_navigation\":\"0\",\"catalog_downloadable\":\"1\",\"catalog_navigation\":\"1\",\"general_country\":\"0\",\"general_region\":\"0\",\"general_locale\":\"0\",\"general_store_information\":\"1\",\"general_single_store_mode\":\"1\",\"web_secure\":\"0\",\"web_unsecure\":\"0\",\"web_seo\":\"0\",\"web_url\":\"0\",\"web_default_layouts\":\"0\",\"web_default\":\"1\",\"admin_startup\":\"0\",\"admin_emails\":\"0\",\"admin_url\":\"0\",\"admin_security\":\"1\",\"rokanthemes_searchsuite_searchsuiteautocomplete_main\":\"1\",\"wa_chat_general\":\"1\",\"payment_us_checkmo\":\"0\",\"payment_us_cashondelivery\":\"0\",\"payment_us_banktransfer\":\"0\",\"payment_us_authorizenet_acceptjs\":\"0\",\"payment_us_authorizenet_directpost\":\"0\",\"payment_us_stripe_payments\":\"0\",\"mailchimp_general\":\"1\",\"mailchimp_ecommerce\":\"0\",\"mailchimp_abandonedcart\":\"1\",\"abandoned_carts_program\":\"1\",\"import_export_import\":\"1\",\"web_cookie\":\"0\",\"web_session\":\"0\",\"web_browser_capabilities\":\"0\",\"themeoption_colors\":\"0\",\"themeoption_newsletter\":\"0\",\"themeoption_background_module\":\"0\",\"themeoption_newsletter_form\":\"0\",\"rokanthemesbrand_general_settings\":\"0\",\"rokanthemesbrand_product_view_page\":\"0\",\"rokanthemesbrand_brand_list_page\":\"0\",\"rokanthemesbrand_group_page\":\"0\",\"instagramsection_instagramgroup\":\"0\",\"payment_us_purchaseorder\":\"0\",\"payment_us_other_payment_methods\":\"1\",\"payment_us_other_paypal_payment_solutions\":\"0\",\"payment_us_recommended_solutions\":\"0\",\"payment_es_other_payment_methods\":\"1\",\"payment_es_other_paypal_payment_solutions\":\"0\",\"payment_es_redsys\":\"1\",\"payment_es_account\":\"1\",\"payment_es_recommended_solutions\":\"1\",\"payment_es_express_checkout_other\":\"0\",\"payment_es_stripe_payments\":\"0\",\"payment_es_paypal_group_all_in_one\":\"1\",\"payment_es_klarna_section\":\"0\",\"payment_es_amazon_payment\":\"0\",\"payment_es_checkmo\":\"0\",\"payment_es_cashondelivery\":\"0\",\"payment_es_banktransfer\":\"0\",\"payment_es_free\":\"0\",\"payment_es_purchaseorder\":\"0\",\"payment_es_deprecated_payment_methods\":\"1\",\"payment_es_authorizenet_acceptjs\":\"0\",\"payment_es_authorizenet_directpost\":\"0\"}}',NULL,NULL,'en_US',0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user_session`
--

DROP TABLE IF EXISTS `admin_user_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_user_session` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `session_id` varchar(128) NOT NULL COMMENT 'Session ID value',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT 'Admin User ID',
  `status` smallint(5) unsigned NOT NULL DEFAULT 1 COMMENT 'Current Session status',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created Time',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Update Time',
  `ip` varchar(15) NOT NULL COMMENT 'Remote user IP',
  PRIMARY KEY (`id`),
  KEY `ADMIN_USER_SESSION_SESSION_ID` (`session_id`),
  KEY `ADMIN_USER_SESSION_USER_ID` (`user_id`),
  CONSTRAINT `ADMIN_USER_SESSION_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='Admin User sessions table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user_session`
--

LOCK TABLES `admin_user_session` WRITE;
/*!40000 ALTER TABLE `admin_user_session` DISABLE KEYS */;
INSERT INTO `admin_user_session` VALUES (1,'vrvc5jl0s60vsec3t0rsfs79ea',1,1,'2021-03-30 14:37:18','2021-03-30 14:58:46','81.43.73.42'),(2,'k1hvm1lbubqn45s3ukclhu6ivn',1,1,'2021-03-31 06:36:46','2021-03-31 06:37:16','81.43.73.42'),(3,'jetbhh6iqjfeui8gsd5dq7s02p',1,1,'2021-03-31 07:06:49','2021-03-31 07:10:34','81.43.73.42'),(4,'5e6oouhj9eoere53eok59cj9hc',1,1,'2021-03-31 07:42:23','2021-03-31 07:42:51','81.43.73.42'),(5,'orou3hjd3c1gker12btik7ijdg',1,1,'2021-03-31 08:17:26','2021-03-31 08:29:14','81.43.73.42'),(6,'8sdgnh04p0l4gc7dnhnfetpu3e',1,1,'2021-03-31 08:44:28','2021-03-31 09:35:02','81.43.73.42'),(7,'89ibe75n5o4kli2ou1t8dtl65a',1,1,'2021-03-31 09:58:41','2021-03-31 10:31:20','81.43.73.42'),(8,'9gmrel4orak1uaudvnkif8mfbo',1,1,'2021-04-27 07:37:47','2021-04-27 07:53:38','81.43.73.42'),(9,'ubi3pbdl9rms8m01clrurr40j9',1,1,'2021-04-27 08:12:08','2021-04-27 08:37:46','81.43.73.42'),(10,'oih6gh8p1fq2448h70at16vdh9',1,1,'2021-04-27 08:58:27','2021-04-27 10:46:06','81.43.73.42');
/*!40000 ALTER TABLE `admin_user_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminnotification_inbox`
--

DROP TABLE IF EXISTS `adminnotification_inbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminnotification_inbox` (
  `notification_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Notification ID',
  `severity` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Problem type',
  `date_added` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Create date',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `description` text DEFAULT NULL COMMENT 'Description',
  `url` varchar(255) DEFAULT NULL COMMENT 'Url',
  `is_read` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Flag if notification read',
  `is_remove` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Flag if notification might be removed',
  PRIMARY KEY (`notification_id`),
  KEY `ADMINNOTIFICATION_INBOX_SEVERITY` (`severity`),
  KEY `ADMINNOTIFICATION_INBOX_IS_READ` (`is_read`),
  KEY `ADMINNOTIFICATION_INBOX_IS_REMOVE` (`is_remove`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Adminnotification Inbox';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminnotification_inbox`
--

LOCK TABLES `adminnotification_inbox` WRITE;
/*!40000 ALTER TABLE `adminnotification_inbox` DISABLE KEYS */;
INSERT INTO `adminnotification_inbox` VALUES (1,4,'2021-03-30 14:11:13','Deprecation Notice','Catalog Search is currently configured to use the MySQL engine, which has been deprecated. Consider migrating to one of\nthe Elasticsearch engines now to ensure there are no service interruptions during your next upgrade.','',0,0),(2,4,'2021-03-30 14:11:14','Disable Notice','To improve performance, collecting statistics for the Magento Report module is disabled by default. \nYou can enable it in System Config.','',0,0);
/*!40000 ALTER TABLE `adminnotification_inbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adobe_stock_asset`
--

DROP TABLE IF EXISTS `adobe_stock_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adobe_stock_asset` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `media_gallery_id` int(10) unsigned DEFAULT NULL COMMENT 'Media gallery ID',
  `category_id` int(10) unsigned DEFAULT NULL COMMENT 'Category ID',
  `creator_id` int(10) unsigned DEFAULT NULL COMMENT 'Creator ID',
  `is_licensed` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Licensed',
  `creation_date` varchar(255) DEFAULT NULL COMMENT 'Creation Date',
  PRIMARY KEY (`id`),
  KEY `ADOBE_STOCK_ASSET_MEDIA_GALLERY_ID_MEDIA_GALLERY_ASSET_ID` (`media_gallery_id`),
  KEY `ADOBE_STOCK_ASSET_ID` (`id`),
  KEY `ADOBE_STOCK_ASSET_CATEGORY_ID` (`category_id`),
  KEY `ADOBE_STOCK_ASSET_CREATOR_ID` (`creator_id`),
  CONSTRAINT `ADOBE_STOCK_ASSET_CATEGORY_ID_ADOBE_STOCK_CATEGORY_ID` FOREIGN KEY (`category_id`) REFERENCES `adobe_stock_category` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ADOBE_STOCK_ASSET_CREATOR_ID_ADOBE_STOCK_CREATOR_ID` FOREIGN KEY (`creator_id`) REFERENCES `adobe_stock_creator` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ADOBE_STOCK_ASSET_MEDIA_GALLERY_ID_MEDIA_GALLERY_ASSET_ID` FOREIGN KEY (`media_gallery_id`) REFERENCES `media_gallery_asset` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Adobe Stock Asset';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adobe_stock_asset`
--

LOCK TABLES `adobe_stock_asset` WRITE;
/*!40000 ALTER TABLE `adobe_stock_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `adobe_stock_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adobe_stock_category`
--

DROP TABLE IF EXISTS `adobe_stock_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adobe_stock_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  PRIMARY KEY (`id`),
  KEY `ADOBE_STOCK_CATEGORY_ID` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Adobe Stock Category';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adobe_stock_category`
--

LOCK TABLES `adobe_stock_category` WRITE;
/*!40000 ALTER TABLE `adobe_stock_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `adobe_stock_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adobe_stock_creator`
--

DROP TABLE IF EXISTS `adobe_stock_creator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adobe_stock_creator` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Asset creator''s name',
  PRIMARY KEY (`id`),
  KEY `ADOBE_STOCK_CREATOR_ID` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Adobe Stock Creator';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adobe_stock_creator`
--

LOCK TABLES `adobe_stock_creator` WRITE;
/*!40000 ALTER TABLE `adobe_stock_creator` DISABLE KEYS */;
/*!40000 ALTER TABLE `adobe_stock_creator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adobe_user_profile`
--

DROP TABLE IF EXISTS `adobe_user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adobe_user_profile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `admin_user_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Admin User Id',
  `name` varchar(255) NOT NULL COMMENT 'Display Name',
  `email` varchar(255) NOT NULL COMMENT 'user profile email',
  `image` varchar(255) NOT NULL COMMENT 'user profile avatar',
  `account_type` varchar(255) DEFAULT NULL COMMENT 'Account Type',
  `access_token` text DEFAULT NULL COMMENT 'Access Token',
  `refresh_token` text DEFAULT NULL COMMENT 'Refresh Token',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Updated At',
  `access_token_expires_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Access Token Expires At',
  PRIMARY KEY (`id`),
  KEY `ADOBE_USER_PROFILE_ADMIN_USER_ID_ADMIN_USER_USER_ID` (`admin_user_id`),
  KEY `ADOBE_USER_PROFILE_ID` (`id`),
  CONSTRAINT `ADOBE_USER_PROFILE_ADMIN_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`admin_user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Adobe IMS User Profile';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adobe_user_profile`
--

LOCK TABLES `adobe_user_profile` WRITE;
/*!40000 ALTER TABLE `adobe_user_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `adobe_user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amazon_customer`
--

DROP TABLE IF EXISTS `amazon_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amazon_customer` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity_id',
  `customer_id` int(10) unsigned NOT NULL COMMENT 'Customer_id',
  `amazon_id` varchar(255) NOT NULL COMMENT 'Amazon_id',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `AMAZON_CUSTOMER_CUSTOMER_ID_AMAZON_ID` (`customer_id`,`amazon_id`),
  UNIQUE KEY `AMAZON_CUSTOMER_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `AMAZON_CUSTOMER_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='amazon_customer';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amazon_customer`
--

LOCK TABLES `amazon_customer` WRITE;
/*!40000 ALTER TABLE `amazon_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `amazon_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amazon_pending_authorization`
--

DROP TABLE IF EXISTS `amazon_pending_authorization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amazon_pending_authorization` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity_id',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order_id',
  `payment_id` int(10) unsigned NOT NULL COMMENT 'Payment_id',
  `authorization_id` varchar(255) DEFAULT NULL COMMENT 'Authorization_id',
  `created_at` datetime NOT NULL COMMENT 'Created_at',
  `updated_at` datetime DEFAULT NULL COMMENT 'Updated_at',
  `processed` smallint(5) unsigned DEFAULT 0 COMMENT 'Initial authorization processed',
  `capture` smallint(5) unsigned DEFAULT 0 COMMENT 'Initial authorization has capture',
  `capture_id` varchar(255) DEFAULT NULL COMMENT 'Initial authorization capture id',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_E6CCA08713FB32BB136A56837009C371` (`order_id`,`payment_id`,`authorization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='amazon_pending_authorization';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amazon_pending_authorization`
--

LOCK TABLES `amazon_pending_authorization` WRITE;
/*!40000 ALTER TABLE `amazon_pending_authorization` DISABLE KEYS */;
/*!40000 ALTER TABLE `amazon_pending_authorization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amazon_pending_capture`
--

DROP TABLE IF EXISTS `amazon_pending_capture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amazon_pending_capture` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity_id',
  `capture_id` varchar(255) NOT NULL COMMENT 'Capture_id',
  `created_at` datetime NOT NULL COMMENT 'Created_at',
  `order_id` int(10) unsigned NOT NULL COMMENT 'order id',
  `payment_id` int(10) unsigned NOT NULL COMMENT 'payment id',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `AMAZON_PENDING_CAPTURE_ORDER_ID_PAYMENT_ID_CAPTURE_ID` (`order_id`,`payment_id`,`capture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='amazon_pending_capture';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amazon_pending_capture`
--

LOCK TABLES `amazon_pending_capture` WRITE;
/*!40000 ALTER TABLE `amazon_pending_capture` DISABLE KEYS */;
/*!40000 ALTER TABLE `amazon_pending_capture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amazon_pending_refund`
--

DROP TABLE IF EXISTS `amazon_pending_refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amazon_pending_refund` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity_id',
  `refund_id` varchar(255) NOT NULL COMMENT 'Refund_id',
  `created_at` datetime NOT NULL COMMENT 'Created_at',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order_id',
  `payment_id` int(10) unsigned NOT NULL COMMENT 'Payment_id',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `AMAZON_PENDING_REFUND_ORDER_ID_PAYMENT_ID_REFUND_ID` (`order_id`,`payment_id`,`refund_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='amazon_pending_refund';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amazon_pending_refund`
--

LOCK TABLES `amazon_pending_refund` WRITE;
/*!40000 ALTER TABLE `amazon_pending_refund` DISABLE KEYS */;
/*!40000 ALTER TABLE `amazon_pending_refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amazon_quote`
--

DROP TABLE IF EXISTS `amazon_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amazon_quote` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `quote_id` int(10) unsigned NOT NULL COMMENT 'Quote ID',
  `amazon_order_reference_id` varchar(255) NOT NULL COMMENT 'Amazon Order Reference ID',
  `sandbox_simulation_reference` varchar(255) DEFAULT NULL COMMENT 'Sandbox simulation reference',
  `confirmed` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Quote confirmed with Amazon',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `AMAZON_QUOTE_QUOTE_ID` (`quote_id`),
  CONSTRAINT `AMAZON_QUOTE_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='amazon_quote';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amazon_quote`
--

LOCK TABLES `amazon_quote` WRITE;
/*!40000 ALTER TABLE `amazon_quote` DISABLE KEYS */;
/*!40000 ALTER TABLE `amazon_quote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amazon_sales_order`
--

DROP TABLE IF EXISTS `amazon_sales_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amazon_sales_order` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order ID',
  `amazon_order_reference_id` varchar(255) NOT NULL COMMENT 'Amazon Order Reference ID',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `AMAZON_SALES_ORDER_ORDER_ID` (`order_id`),
  CONSTRAINT `AMAZON_SALES_ORDER_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='amazon_sales_order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amazon_sales_order`
--

LOCK TABLES `amazon_sales_order` WRITE;
/*!40000 ALTER TABLE `amazon_sales_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `amazon_sales_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorization_role`
--

DROP TABLE IF EXISTS `authorization_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorization_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Role ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Parent Role ID',
  `tree_level` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Role Tree Level',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Role Sort Order',
  `role_type` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Role Type',
  `user_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'User ID',
  `user_type` varchar(16) DEFAULT NULL COMMENT 'User Type',
  `role_name` varchar(50) DEFAULT NULL COMMENT 'Role Name',
  PRIMARY KEY (`role_id`),
  KEY `AUTHORIZATION_ROLE_PARENT_ID_SORT_ORDER` (`parent_id`,`sort_order`),
  KEY `AUTHORIZATION_ROLE_TREE_LEVEL` (`tree_level`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Admin Role Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorization_role`
--

LOCK TABLES `authorization_role` WRITE;
/*!40000 ALTER TABLE `authorization_role` DISABLE KEYS */;
INSERT INTO `authorization_role` VALUES (1,0,1,1,'G',0,'2','Administrators'),(2,1,2,0,'U',1,'2','admin');
/*!40000 ALTER TABLE `authorization_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorization_rule`
--

DROP TABLE IF EXISTS `authorization_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorization_rule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule ID',
  `role_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Role ID',
  `resource_id` varchar(255) DEFAULT NULL COMMENT 'Resource ID',
  `privileges` varchar(20) DEFAULT NULL COMMENT 'Privileges',
  `permission` varchar(10) DEFAULT NULL COMMENT 'Permission',
  PRIMARY KEY (`rule_id`),
  KEY `AUTHORIZATION_RULE_RESOURCE_ID_ROLE_ID` (`resource_id`,`role_id`),
  KEY `AUTHORIZATION_RULE_ROLE_ID_RESOURCE_ID` (`role_id`,`resource_id`),
  CONSTRAINT `AUTHORIZATION_RULE_ROLE_ID_AUTHORIZATION_ROLE_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `authorization_role` (`role_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Admin Rule Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorization_rule`
--

LOCK TABLES `authorization_rule` WRITE;
/*!40000 ALTER TABLE `authorization_rule` DISABLE KEYS */;
INSERT INTO `authorization_rule` VALUES (1,1,'Magento_Backend::all',NULL,'allow');
/*!40000 ALTER TABLE `authorization_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `id` varchar(200) NOT NULL COMMENT 'Cache Id',
  `data` mediumblob DEFAULT NULL COMMENT 'Cache Data',
  `create_time` int(11) DEFAULT NULL COMMENT 'Cache Creation Time',
  `update_time` int(11) DEFAULT NULL COMMENT 'Time of Cache Updating',
  `expire_time` int(11) DEFAULT NULL COMMENT 'Cache Expiration Time',
  PRIMARY KEY (`id`),
  KEY `CACHE_EXPIRE_TIME` (`expire_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_tag`
--

DROP TABLE IF EXISTS `cache_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_tag` (
  `tag` varchar(100) NOT NULL COMMENT 'Tag',
  `cache_id` varchar(200) NOT NULL COMMENT 'Cache Id',
  PRIMARY KEY (`tag`,`cache_id`),
  KEY `CACHE_TAG_CACHE_ID` (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag Caches';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_tag`
--

LOCK TABLES `cache_tag` WRITE;
/*!40000 ALTER TABLE `cache_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captcha_log`
--

DROP TABLE IF EXISTS `captcha_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `captcha_log` (
  `type` varchar(32) NOT NULL COMMENT 'Type',
  `value` varchar(255) NOT NULL COMMENT 'Value',
  `count` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Count',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`type`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Count Login Attempts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_log`
--

LOCK TABLES `captcha_log` WRITE;
/*!40000 ALTER TABLE `captcha_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `captcha_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity`
--

DROP TABLE IF EXISTS `catalog_category_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute Set ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Parent Category ID',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Update Time',
  `path` varchar(255) NOT NULL COMMENT 'Tree Path',
  `position` int(11) NOT NULL COMMENT 'Position',
  `level` int(11) NOT NULL DEFAULT 0 COMMENT 'Tree Level',
  `children_count` int(11) NOT NULL COMMENT 'Child Count',
  PRIMARY KEY (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_LEVEL` (`level`),
  KEY `CATALOG_CATEGORY_ENTITY_PATH` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=638 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity`
--

LOCK TABLES `catalog_category_entity` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity` DISABLE KEYS */;
INSERT INTO `catalog_category_entity` VALUES (1,3,0,'2021-03-30 14:11:13','2021-04-27 09:35:45','1',0,0,27),(2,3,1,'2021-03-30 14:11:13','2021-03-30 14:11:13','1/2',1,1,0),(612,3,1,'2021-04-27 07:55:24','2021-04-27 09:44:29','1/612',2,1,14),(613,3,612,'2021-04-27 07:55:24','2021-04-27 09:44:18','1/612/613',1,2,0),(614,3,612,'2021-04-27 07:55:24','2021-04-27 09:44:18','1/612/614',2,2,0),(615,3,612,'2021-04-27 07:55:24','2021-04-27 09:44:19','1/612/615',3,2,0),(616,3,612,'2021-04-27 07:55:24','2021-04-27 09:44:19','1/612/616',4,2,0),(617,3,612,'2021-04-27 07:55:24','2021-04-27 09:44:21','1/612/617',5,2,0),(618,3,612,'2021-04-27 07:55:24','2021-04-27 09:44:23','1/612/618',6,2,0),(619,3,612,'2021-04-27 07:55:24','2021-04-27 09:44:23','1/612/619',7,2,0),(620,3,612,'2021-04-27 07:55:24','2021-04-27 09:44:23','1/612/620',8,2,0),(621,3,612,'2021-04-27 07:55:24','2021-04-27 09:44:24','1/612/621',9,2,0),(622,3,612,'2021-04-27 07:55:24','2021-04-27 09:44:26','1/612/622',10,2,0),(623,3,612,'2021-04-27 07:55:24','2021-04-27 09:44:26','1/612/623',11,2,0),(624,3,612,'2021-04-27 07:55:25','2021-04-27 09:44:27','1/612/624',12,2,0),(625,3,612,'2021-04-27 07:55:25','2021-04-27 09:44:28','1/612/625',13,2,0),(626,3,612,'2021-04-27 07:55:25','2021-04-27 09:44:29','1/612/626',14,2,0),(627,3,1,'2021-04-27 07:55:25','2021-04-27 09:45:11','1/627',3,1,10),(628,3,627,'2021-04-27 07:55:25','2021-04-27 09:44:31','1/627/628',1,2,0),(629,3,627,'2021-04-27 07:55:25','2021-04-27 09:44:32','1/627/629',2,2,0),(630,3,627,'2021-04-27 07:55:25','2021-04-27 09:44:34','1/627/630',3,2,0),(631,3,627,'2021-04-27 07:55:25','2021-04-27 09:44:38','1/627/631',4,2,0),(632,3,627,'2021-04-27 07:55:25','2021-04-27 09:44:39','1/627/632',5,2,0),(633,3,627,'2021-04-27 07:55:25','2021-04-27 09:45:11','1/627/633',6,2,0),(634,3,627,'2021-04-27 09:01:57','2021-04-27 09:35:58','1/627/634',7,2,0),(635,3,627,'2021-04-27 09:35:45','2021-04-27 09:36:07','1/627/635',8,2,0),(636,3,627,'2021-04-27 09:35:45','2021-04-27 09:36:30','1/627/636',9,2,0),(637,3,627,'2021-04-27 09:35:45','2021-04-27 09:36:33','1/627/637',10,2,0);
/*!40000 ALTER TABLE `catalog_category_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity_datetime`
--

DROP TABLE IF EXISTS `catalog_category_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_DTIME_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Datetime Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity_datetime`
--

LOCK TABLES `catalog_category_entity_datetime` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity_decimal`
--

DROP TABLE IF EXISTS `catalog_category_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` decimal(20,6) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_DEC_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Decimal Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity_decimal`
--

LOCK TABLES `catalog_category_entity_decimal` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity_int`
--

DROP TABLE IF EXISTS `catalog_category_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` int(11) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_INT_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_CATEGORY_ENTITY_INT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_INT_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2127 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Integer Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity_int`
--

LOCK TABLES `catalog_category_entity_int` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_int` DISABLE KEYS */;
INSERT INTO `catalog_category_entity_int` VALUES (1,69,0,1,1),(2,46,0,2,1),(3,69,0,2,1),(1997,46,0,612,1),(1998,54,0,612,1),(1999,69,0,612,1),(2000,46,0,613,1),(2001,54,0,613,1),(2002,69,0,613,1),(2003,46,0,614,1),(2004,54,0,614,1),(2005,69,0,614,1),(2006,46,0,615,1),(2007,54,0,615,1),(2008,69,0,615,1),(2009,46,0,616,1),(2010,54,0,616,1),(2011,69,0,616,1),(2012,46,0,617,1),(2013,54,0,617,1),(2014,69,0,617,1),(2015,46,0,618,1),(2016,54,0,618,1),(2017,69,0,618,1),(2018,46,0,619,1),(2019,54,0,619,1),(2020,69,0,619,1),(2021,46,0,620,1),(2022,54,0,620,1),(2023,69,0,620,1),(2024,46,0,621,1),(2025,54,0,621,1),(2026,69,0,621,1),(2027,46,0,622,1),(2028,54,0,622,1),(2029,69,0,622,1),(2030,46,0,623,1),(2031,54,0,623,1),(2032,69,0,623,1),(2033,46,0,624,1),(2034,54,0,624,1),(2035,69,0,624,1),(2036,46,0,625,1),(2037,54,0,625,1),(2038,69,0,625,1),(2039,46,0,626,1),(2040,54,0,626,1),(2041,69,0,626,1),(2042,46,0,627,1),(2043,54,0,627,1),(2044,69,0,627,1),(2045,46,0,628,1),(2046,54,0,628,1),(2047,69,0,628,1),(2048,46,0,629,1),(2049,54,0,629,1),(2050,69,0,629,1),(2051,46,0,630,1),(2052,54,0,630,1),(2053,69,0,630,1),(2054,46,0,631,1),(2055,54,0,631,1),(2056,69,0,631,1),(2057,46,0,632,1),(2058,54,0,632,1),(2059,69,0,632,1),(2060,46,0,633,1),(2061,54,0,633,1),(2062,69,0,633,1),(2063,46,1,612,1),(2064,69,1,612,1),(2065,46,1,627,1),(2066,69,1,627,1),(2067,46,0,634,1),(2068,54,0,634,1),(2069,69,0,634,1),(2070,46,1,618,1),(2071,69,1,618,1),(2072,46,1,619,1),(2073,69,1,619,1),(2074,46,1,620,1),(2075,69,1,620,1),(2076,46,1,621,1),(2077,69,1,621,1),(2078,46,1,622,1),(2079,69,1,622,1),(2080,46,1,623,1),(2081,69,1,623,1),(2082,46,1,624,1),(2083,69,1,624,1),(2084,46,1,625,1),(2085,69,1,625,1),(2086,46,1,626,1),(2087,69,1,626,1),(2088,46,1,628,1),(2089,69,1,628,1),(2090,46,1,629,1),(2091,69,1,629,1),(2092,46,1,630,1),(2093,69,1,630,1),(2094,46,0,635,1),(2095,54,0,635,1),(2096,69,0,635,1),(2097,46,0,636,1),(2098,54,0,636,1),(2099,69,0,636,1),(2100,46,0,637,1),(2101,54,0,637,1),(2102,69,0,637,1),(2103,46,1,634,1),(2104,69,1,634,1),(2105,46,1,635,1),(2106,69,1,635,1),(2107,46,1,636,1),(2108,69,1,636,1),(2109,46,1,637,1),(2110,69,1,637,1),(2111,46,1,613,1),(2112,69,1,613,1),(2113,46,1,614,1),(2114,69,1,614,1),(2115,46,1,615,1),(2116,69,1,615,1),(2117,46,1,616,1),(2118,69,1,616,1),(2119,46,1,617,1),(2120,69,1,617,1),(2121,46,1,631,1),(2122,69,1,631,1),(2123,46,1,632,1),(2124,69,1,632,1),(2125,46,1,633,1),(2126,69,1,633,1);
/*!40000 ALTER TABLE `catalog_category_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity_text`
--

DROP TABLE IF EXISTS `catalog_category_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` text DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_TEXT_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_TEXT_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Text Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity_text`
--

LOCK TABLES `catalog_category_entity_text` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_text` DISABLE KEYS */;
INSERT INTO `catalog_category_entity_text` VALUES (86,59,0,612,'613,614,615,616,617,618,619,620,621,622,623,624,625,626'),(87,59,0,627,'628,629,630,631,632,633,634,635,636,637');
/*!40000 ALTER TABLE `catalog_category_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity_varchar`
--

DROP TABLE IF EXISTS `catalog_category_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_VCHR_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2694 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Varchar Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity_varchar`
--

LOCK TABLES `catalog_category_entity_varchar` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_varchar` DISABLE KEYS */;
INSERT INTO `catalog_category_entity_varchar` VALUES (1,45,0,1,'Root Catalog'),(2,45,0,2,'Default Category'),(3,52,0,2,'PRODUCTS'),(2110,45,0,612,'ALFA ROMEO'),(2111,121,0,612,'6087c36c270dc'),(2112,45,0,613,'145'),(2113,121,0,613,'6087c36c6e4f2'),(2114,122,0,613,'6087c36c6e4f2'),(2115,45,0,614,'146'),(2116,121,0,614,'6087c36c81130'),(2117,122,0,614,'6087c36c81130'),(2118,45,0,615,'147'),(2119,121,0,615,'6087c36c8bca4'),(2120,122,0,615,'6087c36c8bca4'),(2121,45,0,616,'155'),(2122,121,0,616,'6087c36c967da'),(2123,122,0,616,'6087c36c967da'),(2124,45,0,617,'156'),(2125,121,0,617,'6087c36ca1fdc'),(2126,122,0,617,'6087c36ca1fdc'),(2127,45,0,618,'159'),(2128,121,0,618,'6087c36cad243'),(2129,122,0,618,'6087c36cad243'),(2130,45,0,619,'166'),(2131,121,0,619,'6087c36cb7c37'),(2132,122,0,619,'6087c36cb7c37'),(2133,45,0,620,'33'),(2134,121,0,620,'6087c36cc26f3'),(2135,122,0,620,'6087c36cc26f3'),(2136,45,0,621,'Giulia'),(2137,121,0,621,'6087c36cceff8'),(2138,122,0,621,'6087c36cceff8'),(2139,45,0,622,'Giulietta'),(2140,121,0,622,'6087c36cde6a5'),(2141,122,0,622,'6087c36cde6a5'),(2142,45,0,623,'GT'),(2143,121,0,623,'6087c36cef93c'),(2144,122,0,623,'6087c36cef93c'),(2145,45,0,624,'Mito'),(2146,121,0,624,'6087c36d0b794'),(2147,122,0,624,'6087c36d0b794'),(2148,45,0,625,'Sprint'),(2149,121,0,625,'6087c36d1b0e6'),(2150,122,0,625,'6087c36d1b0e6'),(2151,45,0,626,'Stelvio'),(2152,121,0,626,'6087c36d278e7'),(2153,122,0,626,'6087c36d278e7'),(2154,45,0,627,'AUDI'),(2155,121,0,627,'6087c36d338c3'),(2156,45,0,628,' 80'),(2157,121,0,628,'6087c36d3c4f9'),(2158,122,0,628,'6087c36d3c4f9'),(2159,45,0,629,' 90'),(2160,121,0,629,'6087c36d47dff'),(2161,122,0,629,'6087c36d47dff'),(2162,45,0,630,'100'),(2163,121,0,630,'6087c36d5443e'),(2164,122,0,630,'6087c36d5443e'),(2165,45,0,631,'A1'),(2166,121,0,631,'6087c36d612a6'),(2167,122,0,631,'6087c36d612a6'),(2168,45,0,632,'A2'),(2169,121,0,632,'6087c36d6d071'),(2170,122,0,632,'6087c36d6d071'),(2171,45,0,633,'A3'),(2172,121,0,633,'6087c36d796de'),(2173,122,0,633,'6087c36d796de'),(2174,45,1,612,'ALFA ROMEO'),(2175,121,1,612,'6087dcf2073fd'),(2176,122,1,612,NULL),(2177,45,1,627,'AUDI'),(2178,121,1,627,'6087dcf2385d0'),(2179,122,1,627,NULL),(2180,45,0,634,'A4'),(2181,121,0,634,'6087d305595de'),(2182,122,0,634,'6087d305595de'),(2185,45,1,618,'159'),(2186,121,1,618,'6087c36cad243'),(2195,45,1,619,'166'),(2196,121,1,619,'6087c36cb7c37'),(2199,45,1,620,'33'),(2200,121,1,620,'6087c36cc26f3'),(2203,45,1,621,'Giulia'),(2204,121,1,621,'6087c36cceff8'),(2211,45,1,622,'Giulietta'),(2212,121,1,622,'6087c36cde6a5'),(2219,45,1,623,'GT'),(2220,121,1,623,'6087c36cef93c'),(2225,45,1,624,'Mito'),(2226,121,1,624,'6087c36d0b794'),(2231,45,1,625,'Sprint'),(2232,121,1,625,'6087c36d1b0e6'),(2235,45,1,626,'Stelvio'),(2236,121,1,626,'6087c36d278e7'),(2243,45,1,628,' 80'),(2244,121,1,628,'6087c36d3c4f9'),(2253,45,1,629,' 90'),(2254,121,1,629,'6087c36d47dff'),(2259,45,1,630,'100'),(2260,121,1,630,'6087c36d5443e'),(2266,45,0,635,'A5'),(2267,121,0,635,'6087daf16c309'),(2268,122,0,635,'6087daf16c309'),(2270,45,0,636,'A6'),(2271,121,0,636,'6087daf187ea6'),(2272,122,0,636,'6087daf187ea6'),(2274,45,0,637,'A7'),(2275,121,0,637,'6087daf194bff'),(2276,122,0,637,'6087daf194bff'),(2279,45,1,634,'A4'),(2280,121,1,634,'6087d305595de'),(2351,122,1,634,'6087d305595de'),(2353,45,1,635,'A5'),(2354,121,1,635,'6087daf16c309'),(2389,122,1,635,'6087daf16c309'),(2391,45,1,636,'A6'),(2392,121,1,636,'6087daf187ea6'),(2467,122,1,636,'6087daf187ea6'),(2469,45,1,637,'A7'),(2470,121,1,637,'6087daf194bff'),(2477,122,1,637,'6087daf194bff'),(2479,45,1,613,'145'),(2480,121,1,613,'6087c36c6e4f2'),(2481,122,1,613,'6087c36c6e4f2'),(2483,45,1,614,'146'),(2484,121,1,614,'6087c36c81130'),(2485,122,1,614,'6087c36c81130'),(2487,45,1,615,'147'),(2488,121,1,615,'6087c36c8bca4'),(2491,122,1,615,'6087c36c8bca4'),(2493,45,1,616,'155'),(2494,121,1,616,'6087c36c967da'),(2495,122,1,616,'6087c36c967da'),(2497,45,1,617,'156'),(2498,121,1,617,'6087c36ca1fdc'),(2509,122,1,617,'6087c36ca1fdc'),(2517,122,1,618,'6087c36cad243'),(2519,122,1,619,'6087c36cb7c37'),(2521,122,1,620,'6087c36cc26f3'),(2527,122,1,621,'6087c36cceff8'),(2533,122,1,622,'6087c36cde6a5'),(2537,122,1,623,'6087c36cef93c'),(2541,122,1,624,'6087c36d0b794'),(2543,122,1,625,'6087c36d1b0e6'),(2549,122,1,626,'6087c36d278e7'),(2557,122,1,628,'6087c36d3c4f9'),(2561,122,1,629,'6087c36d47dff'),(2569,122,1,630,'6087c36d5443e'),(2571,45,1,631,'A1'),(2572,121,1,631,'6087c36d612a6'),(2589,122,1,631,'6087c36d612a6'),(2591,45,1,632,'A2'),(2592,121,1,632,'6087c36d6d071'),(2593,122,1,632,'6087c36d6d071'),(2595,45,1,633,'A3'),(2596,121,1,633,'6087c36d796de'),(2693,122,1,633,'6087c36d796de');
/*!40000 ALTER TABLE `catalog_category_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product`
--

DROP TABLE IF EXISTS `catalog_category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product` (
  `entity_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `position` int(11) NOT NULL DEFAULT 0 COMMENT 'Position',
  PRIMARY KEY (`entity_id`,`category_id`,`product_id`),
  UNIQUE KEY `CATALOG_CATEGORY_PRODUCT_CATEGORY_ID_PRODUCT_ID` (`category_id`,`product_id`),
  KEY `CATALOG_CATEGORY_PRODUCT_PRODUCT_ID` (`product_id`),
  CONSTRAINT `CAT_CTGR_PRD_CTGR_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_PRD_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=946 DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Category Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product`
--

LOCK TABLES `catalog_category_product` WRITE;
/*!40000 ALTER TABLE `catalog_category_product` DISABLE KEYS */;
INSERT INTO `catalog_category_product` VALUES (746,612,1621,0),(747,613,1621,0),(748,612,1622,0),(749,614,1622,0),(750,612,1623,0),(751,615,1623,0),(752,612,1624,0),(753,615,1624,0),(754,612,1625,0),(755,616,1625,0),(756,612,1626,0),(757,617,1626,0),(758,612,1627,0),(759,617,1627,0),(760,612,1628,0),(761,617,1628,0),(762,612,1629,0),(763,617,1629,0),(764,612,1630,0),(765,617,1630,0),(766,612,1631,0),(767,617,1631,0),(768,612,1632,0),(769,618,1632,0),(770,612,1633,0),(771,618,1633,0),(772,612,1634,0),(773,618,1634,0),(774,612,1635,0),(775,618,1635,0),(776,612,1636,0),(777,619,1636,0),(778,612,1637,0),(779,620,1637,0),(780,612,1638,0),(781,621,1638,0),(782,612,1639,0),(783,621,1639,0),(784,612,1640,0),(785,621,1640,0),(786,612,1641,0),(787,622,1641,0),(788,612,1642,0),(789,622,1642,0),(790,612,1643,0),(791,622,1643,0),(792,612,1644,0),(793,623,1644,0),(794,612,1645,0),(795,623,1645,0),(796,612,1646,0),(797,624,1646,0),(798,612,1647,0),(799,624,1647,0),(800,612,1648,0),(801,625,1648,0),(802,612,1649,0),(803,626,1649,0),(804,612,1650,0),(805,626,1650,0),(806,612,1651,0),(807,626,1651,0),(808,627,1652,0),(809,628,1652,0),(810,627,1653,0),(811,628,1653,0),(812,627,1654,0),(813,628,1654,0),(814,627,1655,0),(815,628,1655,0),(816,627,1656,0),(817,629,1656,0),(818,627,1657,0),(819,629,1657,0),(820,627,1658,0),(821,630,1658,0),(822,627,1659,0),(823,630,1659,0),(824,627,1660,0),(825,630,1660,0),(826,627,1661,0),(827,630,1661,0),(828,627,1662,0),(829,631,1662,0),(830,627,1663,0),(831,631,1663,0),(832,627,1664,0),(833,631,1664,0),(834,627,1665,0),(835,631,1665,0),(836,627,1666,0),(837,631,1666,0),(838,627,1667,0),(839,631,1667,0),(840,627,1668,0),(841,631,1668,0),(842,627,1669,0),(843,631,1669,0),(844,627,1670,0),(845,631,1670,0),(846,627,1671,0),(847,632,1671,0),(848,627,1672,0),(849,633,1672,0),(850,627,1673,0),(851,633,1673,0),(852,627,1674,0),(853,633,1674,0),(854,627,1675,0),(855,633,1675,0),(856,627,1676,0),(857,633,1676,0),(858,627,1677,0),(859,633,1677,0),(860,627,1678,0),(861,633,1678,0),(862,627,1679,0),(863,633,1679,0),(864,627,1680,0),(865,633,1680,0),(866,627,1681,0),(867,633,1681,0),(868,627,1682,0),(869,633,1682,0),(870,627,1683,0),(871,633,1683,0),(872,627,1684,0),(873,633,1684,0),(874,627,1685,0),(875,633,1685,0),(876,627,1686,0),(877,633,1686,0),(878,627,1687,0),(879,633,1687,0),(880,627,1688,0),(881,633,1688,0),(882,627,1689,0),(883,633,1689,0),(884,627,1690,0),(885,633,1690,0),(886,627,1691,0),(887,633,1691,0),(888,627,1692,0),(889,633,1692,0),(890,627,1693,0),(891,633,1693,0),(892,627,1694,0),(893,633,1694,0),(894,627,1695,0),(895,633,1695,0),(896,627,1696,0),(897,633,1696,0),(898,627,1697,0),(899,633,1697,0),(900,627,1698,0),(901,633,1698,0),(902,627,1699,0),(903,633,1699,0),(904,627,1700,0),(905,633,1700,0),(906,627,1701,0),(907,633,1701,0),(908,627,1702,0),(909,633,1702,0),(910,627,1703,0),(911,633,1703,0),(912,627,1704,0),(913,633,1704,0),(914,627,1705,0),(915,633,1705,0),(916,627,1706,0),(917,633,1706,0),(918,627,1707,0),(919,633,1707,0),(920,627,1708,0),(921,633,1708,0),(922,627,1709,0),(923,633,1709,0),(924,627,1710,0),(925,633,1710,0),(926,627,1711,0),(927,633,1711,0),(928,627,1712,0),(929,633,1712,0),(930,627,1713,0),(931,633,1713,0),(932,627,1714,0),(933,633,1714,0),(934,627,1715,0),(935,633,1715,0),(936,627,1716,0),(937,633,1716,0),(938,627,1717,0),(939,633,1717,0),(940,627,1718,0),(941,633,1718,0),(942,627,1719,0),(943,633,1719,0),(944,627,1720,0),(945,633,1720,0);
/*!40000 ALTER TABLE `catalog_category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product_index`
--

DROP TABLE IF EXISTS `catalog_category_product_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product_index` (
  `category_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `position` int(11) DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `CAT_CTGR_PRD_IDX_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `CAT_CTGR_PRD_IDX_STORE_ID_CTGR_ID_VISIBILITY_IS_PARENT_POSITION` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product_index`
--

LOCK TABLES `catalog_category_product_index` WRITE;
/*!40000 ALTER TABLE `catalog_category_product_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_product_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product_index_replica`
--

DROP TABLE IF EXISTS `catalog_category_product_index_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product_index_replica` (
  `category_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `position` int(11) DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `CAT_CTGR_PRD_IDX_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `CAT_CTGR_PRD_IDX_STORE_ID_CTGR_ID_VISIBILITY_IS_PARENT_POSITION` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product_index_replica`
--

LOCK TABLES `catalog_category_product_index_replica` WRITE;
/*!40000 ALTER TABLE `catalog_category_product_index_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_product_index_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product_index_store1`
--

DROP TABLE IF EXISTS `catalog_category_product_index_store1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product_index_store1` (
  `category_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Category Id',
  `product_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Product Id',
  `position` int(11) DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store Id',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `CAT_CTGR_PRD_IDX_STORE1_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `IDX_216E521C8AD125E066D2B0BAB4A08412` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Index Store1';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product_index_store1`
--

LOCK TABLES `catalog_category_product_index_store1` WRITE;
/*!40000 ALTER TABLE `catalog_category_product_index_store1` DISABLE KEYS */;
INSERT INTO `catalog_category_product_index_store1` VALUES (2,1621,0,1,1,4),(2,1622,0,1,1,4),(2,1623,0,1,1,4),(2,1624,0,1,1,4),(2,1625,0,1,1,4),(2,1626,0,1,1,4),(2,1627,0,1,1,4),(2,1628,0,1,1,4),(2,1629,0,1,1,4),(2,1630,0,1,1,4),(2,1631,0,1,1,4),(2,1632,0,1,1,4),(2,1633,0,1,1,4),(2,1634,0,1,1,4),(2,1635,0,1,1,4),(2,1636,0,1,1,4),(2,1637,0,1,1,4),(2,1638,0,1,1,4),(2,1639,0,1,1,4),(2,1640,0,1,1,4),(2,1641,0,1,1,4),(2,1642,0,1,1,4),(2,1643,0,1,1,4),(2,1644,0,1,1,4),(2,1645,0,1,1,4),(2,1646,0,1,1,4),(2,1647,0,1,1,4),(2,1648,0,1,1,4),(2,1649,0,1,1,4),(2,1650,0,1,1,4),(2,1651,0,1,1,4),(2,1652,0,1,1,4),(2,1653,0,1,1,4),(2,1654,0,1,1,4),(2,1655,0,1,1,4),(2,1656,0,1,1,4),(2,1657,0,1,1,4),(2,1658,0,1,1,4),(2,1659,0,1,1,4),(2,1660,0,1,1,4),(2,1661,0,1,1,4),(2,1662,0,1,1,4),(2,1663,0,1,1,4),(2,1664,0,1,1,4),(2,1665,0,1,1,4),(2,1666,0,1,1,4),(2,1667,0,1,1,4),(2,1668,0,1,1,4),(2,1669,0,1,1,4),(2,1670,0,1,1,4),(2,1671,0,1,1,4),(2,1672,0,1,1,4),(2,1673,0,1,1,4),(2,1674,0,1,1,4),(2,1675,0,1,1,4),(2,1676,0,1,1,4),(2,1677,0,1,1,4),(2,1678,0,1,1,4),(2,1679,0,1,1,4),(2,1680,0,1,1,4),(2,1681,0,1,1,4),(2,1682,0,1,1,4),(2,1683,0,1,1,4),(2,1684,0,1,1,4),(2,1685,0,1,1,4),(2,1686,0,1,1,4),(2,1687,0,1,1,4),(2,1688,0,1,1,4),(2,1689,0,1,1,4),(2,1690,0,1,1,4),(2,1691,0,1,1,4),(2,1692,0,1,1,4),(2,1693,0,1,1,4),(2,1694,0,1,1,4),(2,1695,0,1,1,4),(2,1696,0,1,1,4),(2,1697,0,1,1,4),(2,1698,0,1,1,4),(2,1699,0,1,1,4),(2,1700,0,1,1,4),(2,1701,0,1,1,4),(2,1702,0,1,1,4),(2,1703,0,1,1,4),(2,1704,0,1,1,4),(2,1705,0,1,1,4),(2,1706,0,1,1,4),(2,1707,0,1,1,4),(2,1708,0,1,1,4),(2,1709,0,1,1,4),(2,1710,0,1,1,4),(2,1711,0,1,1,4),(2,1712,0,1,1,4),(2,1713,0,1,1,4),(2,1714,0,1,1,4),(2,1715,0,1,1,4),(2,1716,0,1,1,4),(2,1717,0,1,1,4),(2,1718,0,1,1,4),(2,1719,0,1,1,4),(2,1720,0,1,1,4),(612,1621,0,0,1,4),(612,1622,0,0,1,4),(612,1623,0,0,1,4),(612,1624,0,0,1,4),(612,1625,0,0,1,4),(612,1626,0,0,1,4),(612,1627,0,0,1,4),(612,1628,0,0,1,4),(612,1629,0,0,1,4),(612,1630,0,0,1,4),(612,1631,0,0,1,4),(612,1632,0,0,1,4),(612,1633,0,0,1,4),(612,1634,0,0,1,4),(612,1635,0,0,1,4),(612,1636,0,0,1,4),(612,1637,0,0,1,4),(612,1638,0,0,1,4),(612,1639,0,0,1,4),(612,1640,0,0,1,4),(612,1641,0,0,1,4),(612,1642,0,0,1,4),(612,1643,0,0,1,4),(612,1644,0,0,1,4),(612,1645,0,0,1,4),(612,1646,0,0,1,4),(612,1647,0,0,1,4),(612,1648,0,0,1,4),(612,1649,0,0,1,4),(612,1650,0,0,1,4),(612,1651,0,0,1,4),(627,1652,0,0,1,4),(627,1653,0,0,1,4),(627,1654,0,0,1,4),(627,1655,0,0,1,4),(627,1656,0,0,1,4),(627,1657,0,0,1,4),(627,1658,0,0,1,4),(627,1659,0,0,1,4),(627,1660,0,0,1,4),(627,1661,0,0,1,4),(627,1662,0,0,1,4),(627,1663,0,0,1,4),(627,1664,0,0,1,4),(627,1665,0,0,1,4),(627,1666,0,0,1,4),(627,1667,0,0,1,4),(627,1668,0,0,1,4),(627,1669,0,0,1,4),(627,1670,0,0,1,4),(627,1671,0,0,1,4),(627,1672,0,0,1,4),(627,1673,0,0,1,4),(627,1674,0,0,1,4),(627,1675,0,0,1,4),(627,1676,0,0,1,4),(627,1677,0,0,1,4),(627,1678,0,0,1,4),(627,1679,0,0,1,4),(627,1680,0,0,1,4),(627,1681,0,0,1,4),(627,1682,0,0,1,4),(627,1683,0,0,1,4),(627,1684,0,0,1,4),(627,1685,0,0,1,4),(627,1686,0,0,1,4),(627,1687,0,0,1,4),(627,1688,0,0,1,4),(627,1689,0,0,1,4),(627,1690,0,0,1,4),(627,1691,0,0,1,4),(627,1692,0,0,1,4),(627,1693,0,0,1,4),(627,1694,0,0,1,4),(627,1695,0,0,1,4),(627,1696,0,0,1,4),(627,1697,0,0,1,4),(627,1698,0,0,1,4),(627,1699,0,0,1,4),(627,1700,0,0,1,4),(627,1701,0,0,1,4),(627,1702,0,0,1,4),(627,1703,0,0,1,4),(627,1704,0,0,1,4),(627,1705,0,0,1,4),(627,1706,0,0,1,4),(627,1707,0,0,1,4),(627,1708,0,0,1,4),(627,1709,0,0,1,4),(627,1710,0,0,1,4),(627,1711,0,0,1,4),(627,1712,0,0,1,4),(627,1713,0,0,1,4),(627,1714,0,0,1,4),(627,1715,0,0,1,4),(627,1716,0,0,1,4),(627,1717,0,0,1,4),(627,1718,0,0,1,4),(627,1719,0,0,1,4),(627,1720,0,0,1,4);
/*!40000 ALTER TABLE `catalog_category_product_index_store1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product_index_store1_replica`
--

DROP TABLE IF EXISTS `catalog_category_product_index_store1_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product_index_store1_replica` (
  `category_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Category Id',
  `product_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Product Id',
  `position` int(11) DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store Id',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `IDX_4B965DC45C352D6E4C9DC0FF50B1FCF5` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `IDX_47AB760CD6A893ACEA69A9C2E0112C60` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Index Store1 Replica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product_index_store1_replica`
--

LOCK TABLES `catalog_category_product_index_store1_replica` WRITE;
/*!40000 ALTER TABLE `catalog_category_product_index_store1_replica` DISABLE KEYS */;
INSERT INTO `catalog_category_product_index_store1_replica` VALUES (2,1486,0,0,1,4);
/*!40000 ALTER TABLE `catalog_category_product_index_store1_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product_index_tmp`
--

DROP TABLE IF EXISTS `catalog_category_product_index_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product_index_tmp` (
  `category_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `position` int(11) NOT NULL DEFAULT 0 COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `CAT_CTGR_PRD_IDX_TMP_PRD_ID_CTGR_ID_STORE_ID` (`product_id`,`category_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Indexer temporary table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product_index_tmp`
--

LOCK TABLES `catalog_category_product_index_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_category_product_index_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_product_index_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_compare_item`
--

DROP TABLE IF EXISTS `catalog_compare_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_compare_item` (
  `catalog_compare_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Compare Item ID',
  `visitor_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Visitor ID',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  PRIMARY KEY (`catalog_compare_item_id`),
  KEY `CATALOG_COMPARE_ITEM_PRODUCT_ID` (`product_id`),
  KEY `CATALOG_COMPARE_ITEM_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  KEY `CATALOG_COMPARE_ITEM_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `CATALOG_COMPARE_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_COMPARE_ITEM_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_COMPARE_ITEM_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_COMPARE_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Compare Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_compare_item`
--

LOCK TABLES `catalog_compare_item` WRITE;
/*!40000 ALTER TABLE `catalog_compare_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_compare_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_eav_attribute`
--

DROP TABLE IF EXISTS `catalog_eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `frontend_input_renderer` varchar(255) DEFAULT NULL COMMENT 'Frontend Input Renderer',
  `is_global` smallint(5) unsigned NOT NULL DEFAULT 1 COMMENT 'Is Global',
  `is_visible` smallint(5) unsigned NOT NULL DEFAULT 1 COMMENT 'Is Visible',
  `is_searchable` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Searchable',
  `is_filterable` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Filterable',
  `is_comparable` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Comparable',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Visible On Front',
  `is_html_allowed_on_front` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is HTML Allowed On Front',
  `is_used_for_price_rules` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Used For Price Rules',
  `is_filterable_in_search` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Filterable In Search',
  `used_in_product_listing` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Used In Product Listing',
  `used_for_sort_by` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Used For Sorting',
  `apply_to` varchar(255) DEFAULT NULL COMMENT 'Apply To',
  `is_visible_in_advanced_search` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Visible In Advanced Search',
  `position` int(11) NOT NULL DEFAULT 0 COMMENT 'Position',
  `is_wysiwyg_enabled` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is WYSIWYG Enabled',
  `is_used_for_promo_rules` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Used For Promo Rules',
  `is_required_in_admin_store` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Required In Admin Store',
  `is_used_in_grid` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Used in Grid',
  `is_visible_in_grid` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Visible in Grid',
  `is_filterable_in_grid` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Filterable in Grid',
  `search_weight` float NOT NULL DEFAULT 1 COMMENT 'Search Weight',
  `additional_data` text DEFAULT NULL COMMENT 'Additional swatch attributes data',
  `custom_entity_attribute_set_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Additional swatch attributes data',
  PRIMARY KEY (`attribute_id`),
  KEY `CATALOG_EAV_ATTRIBUTE_USED_FOR_SORT_BY` (`used_for_sort_by`),
  KEY `CATALOG_EAV_ATTRIBUTE_USED_IN_PRODUCT_LISTING` (`used_in_product_listing`),
  KEY `CAT_EAV_ATTR_CUSTOM_ENTT_ATTR_SET_ID_EAV_ATTR_SET_ATTR_SET_ID` (`custom_entity_attribute_set_id`),
  CONSTRAINT `CATALOG_EAV_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_EAV_ATTR_CUSTOM_ENTT_ATTR_SET_ID_EAV_ATTR_SET_ATTR_SET_ID` FOREIGN KEY (`custom_entity_attribute_set_id`) REFERENCES `eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog EAV Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_eav_attribute`
--

LOCK TABLES `catalog_eav_attribute` WRITE;
/*!40000 ALTER TABLE `catalog_eav_attribute` DISABLE KEYS */;
INSERT INTO `catalog_eav_attribute` VALUES (45,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(46,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(47,NULL,0,1,0,0,0,0,1,0,0,0,0,NULL,0,0,1,0,0,0,0,0,1,NULL,NULL),(48,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(49,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(50,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(51,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(52,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(53,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(54,NULL,1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(55,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(56,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(57,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(58,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(59,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(60,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(61,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(62,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(63,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(64,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(65,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(66,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(67,'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Sortby\\Available',0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(68,'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Sortby\\DefaultSortby',0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(69,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(70,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(71,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(72,'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Pricestep',0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(73,NULL,0,1,1,0,0,0,0,0,0,1,1,NULL,1,0,0,0,0,0,0,0,5,NULL,NULL),(74,NULL,1,1,1,0,1,0,0,0,0,0,0,NULL,1,0,0,0,0,0,0,0,6,NULL,NULL),(75,NULL,0,1,1,0,1,0,1,0,0,0,0,NULL,1,0,1,0,0,0,0,0,1,NULL,NULL),(76,NULL,0,1,1,0,1,0,1,0,0,1,0,NULL,1,0,1,0,0,1,0,0,1,NULL,NULL),(77,NULL,1,1,1,1,0,0,0,0,0,1,1,'simple,virtual,configurable,downloadable,bundle',1,0,0,0,0,0,0,0,1,NULL,NULL),(78,NULL,1,1,0,0,0,0,0,0,0,1,0,'simple,virtual,configurable,downloadable,bundle',0,0,0,0,0,1,0,1,1,NULL,NULL),(79,NULL,2,1,0,0,0,0,0,0,0,1,0,'simple,virtual,configurable,downloadable,bundle',0,0,0,0,0,1,0,0,1,NULL,NULL),(80,NULL,2,1,0,0,0,0,0,0,0,1,0,'simple,virtual,configurable,downloadable,bundle',0,0,0,0,0,1,0,0,1,NULL,NULL),(81,NULL,1,1,0,0,0,0,0,0,0,0,0,'simple,virtual,downloadable',0,0,0,0,0,1,0,1,1,NULL,NULL),(82,'Magento\\Catalog\\Block\\Adminhtml\\Product\\Helper\\Form\\Weight',1,1,0,0,0,0,0,0,0,0,0,'simple,virtual,configurable,downloadable,bundle',0,0,0,0,0,1,0,1,1,NULL,NULL),(83,NULL,1,1,1,1,1,0,0,0,0,0,0,'simple,configurable',1,0,0,0,0,1,0,1,1,NULL,NULL),(84,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,1,1,NULL,NULL),(85,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,1,1,NULL,NULL),(86,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,1,1,NULL,NULL),(87,NULL,0,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(88,NULL,0,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(89,NULL,0,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(90,NULL,1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(91,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(92,NULL,2,1,0,0,0,0,0,0,0,0,0,'simple,virtual,downloadable,bundle',0,0,0,0,0,0,0,0,1,NULL,NULL),(93,NULL,1,1,1,1,1,0,0,0,0,0,0,'simple,virtual,configurable',1,0,0,0,0,1,0,1,1,NULL,NULL),(94,NULL,2,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,1,0,0,1,NULL,NULL),(95,NULL,2,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,1,0,0,1,NULL,NULL),(96,NULL,1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(97,'Magento\\Framework\\Data\\Form\\Element\\Hidden',2,1,1,0,0,0,0,0,0,1,0,NULL,0,0,0,0,1,0,0,0,1,NULL,NULL),(98,NULL,0,0,0,0,0,0,0,0,0,0,0,'simple,virtual,configurable,downloadable,bundle',0,0,0,0,0,0,0,0,1,NULL,NULL),(99,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,1,0,0,0,1,NULL,NULL),(100,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,1,1,NULL,NULL),(101,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,0,1,NULL,NULL),(102,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,0,1,NULL,NULL),(103,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(104,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,0,1,NULL,NULL),(105,'Magento\\Catalog\\Block\\Adminhtml\\Product\\Helper\\Form\\Category',1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(106,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(107,NULL,1,0,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(108,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(109,NULL,0,0,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(110,NULL,0,0,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(111,NULL,0,0,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(112,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(113,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(114,NULL,2,1,0,0,0,0,0,0,0,0,0,'simple,bundle,configurable,grouped',0,0,0,0,0,1,0,1,1,NULL,NULL),(115,'Magento\\CatalogInventory\\Block\\Adminhtml\\Form\\Field\\Stock',1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(116,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,0,1,NULL,NULL),(117,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(118,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(119,'Magento\\Msrp\\Block\\Adminhtml\\Product\\Helper\\Form\\Type',1,1,0,0,0,0,0,0,0,1,0,'simple,virtual,downloadable,bundle,configurable',0,0,0,0,0,1,0,1,1,NULL,NULL),(120,'Magento\\Msrp\\Block\\Adminhtml\\Product\\Helper\\Form\\Type\\Price',2,1,0,0,0,0,0,0,0,1,0,'simple,virtual,downloadable,bundle,configurable',0,0,0,0,0,0,0,0,1,NULL,NULL),(121,NULL,0,1,1,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(122,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(123,NULL,0,1,1,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,1,0,1,1,NULL,NULL),(124,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(125,NULL,1,0,0,0,0,0,0,0,0,1,0,'downloadable',0,0,0,0,0,0,0,0,1,NULL,NULL),(126,NULL,0,0,0,0,0,0,0,0,0,0,0,'downloadable',0,0,0,0,0,0,0,0,1,NULL,NULL),(127,NULL,0,0,0,0,0,0,0,0,0,0,0,'downloadable',0,0,0,0,0,0,0,0,1,NULL,NULL),(128,NULL,1,0,0,0,0,0,0,0,0,1,0,'downloadable',0,0,0,0,0,0,0,0,1,NULL,NULL),(129,'Magento\\GiftMessage\\Block\\Adminhtml\\Product\\Helper\\Form\\Config',1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,0,1,NULL,NULL),(130,NULL,1,1,0,0,0,0,0,0,0,1,0,'bundle',0,0,0,0,0,0,0,0,1,NULL,NULL),(131,NULL,1,1,0,0,0,0,0,0,0,0,0,'bundle',0,0,0,0,0,0,0,0,1,NULL,NULL),(132,NULL,1,1,0,0,0,0,0,0,0,1,0,'bundle',0,0,0,0,0,0,0,0,1,NULL,NULL),(133,NULL,1,1,0,0,0,0,0,0,0,1,0,'bundle',0,0,0,0,0,0,0,0,1,NULL,NULL),(134,NULL,1,1,0,0,0,0,0,0,0,1,0,'bundle',0,0,0,0,0,0,0,0,1,NULL,NULL),(135,NULL,0,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(136,NULL,2,1,1,0,0,0,0,0,0,1,0,'simple,virtual,configurable,downloadable,bundle',0,0,0,0,0,1,0,1,1,NULL,NULL),(137,NULL,1,1,0,0,0,0,0,0,0,1,0,NULL,0,2,0,0,0,0,0,0,1,NULL,NULL),(138,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(139,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(140,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(141,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(142,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(143,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(144,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(145,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(146,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(147,NULL,0,1,0,0,0,0,1,0,0,0,0,NULL,0,0,1,0,0,0,0,0,1,NULL,NULL),(148,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(149,NULL,0,1,0,0,0,0,1,0,0,0,0,NULL,0,0,1,0,0,0,0,0,1,NULL,NULL),(150,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(151,NULL,0,1,0,0,0,0,1,0,0,0,0,NULL,0,0,1,0,0,0,0,0,1,NULL,NULL),(152,NULL,0,1,0,0,0,0,1,0,0,0,0,NULL,0,0,1,0,0,0,0,0,1,NULL,NULL),(153,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(154,NULL,1,1,0,0,0,0,0,0,0,1,0,'simple,configurable,bundle,virtual,downloadable',0,0,0,0,0,0,0,1,1,NULL,NULL),(155,NULL,1,1,0,0,0,0,0,0,0,0,0,'simple,configurable,bundle,virtual,downloadable',0,0,0,0,0,0,0,1,1,NULL,NULL),(156,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(157,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(158,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(159,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(160,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(161,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(162,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(163,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(164,NULL,0,1,0,0,0,0,1,0,0,0,0,NULL,0,0,1,0,0,0,0,0,1,NULL,NULL),(165,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(166,NULL,0,1,0,0,0,0,1,0,0,0,0,NULL,0,0,1,0,0,0,0,0,1,NULL,NULL),(167,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL,NULL),(168,NULL,0,1,0,0,0,0,1,0,0,0,0,NULL,0,0,1,0,0,0,0,0,1,NULL,NULL),(169,NULL,0,1,0,0,0,0,1,0,0,0,0,NULL,0,0,1,0,0,0,0,0,1,NULL,NULL),(170,NULL,0,1,0,0,0,0,0,0,0,0,0,'simple,virtual',0,0,0,1,0,0,0,0,1,NULL,NULL),(171,NULL,0,1,0,0,0,0,0,0,0,0,0,'simple,virtual',0,0,0,1,0,0,0,0,1,NULL,NULL),(172,NULL,0,1,0,0,0,0,0,0,0,0,0,'simple,virtual',0,0,0,1,0,0,0,0,1,NULL,NULL),(173,NULL,0,1,0,0,0,0,0,0,0,0,0,'simple,virtual',0,0,0,1,0,0,0,0,1,NULL,NULL),(174,NULL,0,1,0,0,0,0,0,0,0,0,0,'simple,virtual',0,0,0,1,0,0,0,0,1,NULL,NULL),(181,NULL,0,1,0,0,0,0,1,0,0,0,0,NULL,0,0,0,0,0,1,1,1,1,NULL,NULL),(182,NULL,0,1,0,0,0,0,1,0,0,0,0,NULL,0,0,0,0,0,1,1,1,1,NULL,NULL),(183,NULL,0,1,0,0,0,0,1,0,0,0,0,NULL,0,0,0,0,0,1,1,1,1,NULL,NULL),(184,NULL,0,1,0,0,0,0,1,0,0,0,0,NULL,0,0,0,0,0,1,1,1,1,NULL,NULL),(185,NULL,0,1,0,0,0,0,1,0,0,0,0,NULL,0,0,0,0,0,1,1,1,1,NULL,NULL),(186,NULL,0,1,0,0,0,0,1,0,0,0,0,NULL,0,0,0,0,0,1,1,1,1,NULL,NULL),(187,NULL,0,1,0,0,0,0,1,0,0,0,0,NULL,0,0,0,0,0,1,1,1,1,NULL,NULL),(188,NULL,0,1,0,0,0,0,1,0,0,0,0,NULL,0,0,0,0,0,1,1,1,1,NULL,NULL),(189,NULL,0,1,0,0,0,0,1,0,0,0,0,NULL,0,0,0,0,0,1,1,1,1,NULL,NULL);
/*!40000 ALTER TABLE `catalog_eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_bundle_option`
--

DROP TABLE IF EXISTS `catalog_product_bundle_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_bundle_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option ID',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `required` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Required',
  `position` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Position',
  `type` varchar(255) DEFAULT NULL COMMENT 'Type',
  PRIMARY KEY (`option_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_OPTION_PARENT_ID` (`parent_id`),
  CONSTRAINT `CAT_PRD_BNDL_OPT_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Option';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_bundle_option`
--

LOCK TABLES `catalog_product_bundle_option` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_bundle_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_bundle_option_value`
--

DROP TABLE IF EXISTS `catalog_product_bundle_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_bundle_option_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `option_id` int(10) unsigned NOT NULL COMMENT 'Option ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `parent_product_id` int(10) unsigned NOT NULL COMMENT 'Parent Product ID',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_BNDL_OPT_VAL_OPT_ID_PARENT_PRD_ID_STORE_ID` (`option_id`,`parent_product_id`,`store_id`),
  CONSTRAINT `CAT_PRD_BNDL_OPT_VAL_OPT_ID_CAT_PRD_BNDL_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Option Value';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_bundle_option_value`
--

LOCK TABLES `catalog_product_bundle_option_value` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_option_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_bundle_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_bundle_price_index`
--

DROP TABLE IF EXISTS `catalog_product_bundle_price_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_bundle_price_index` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group ID',
  `min_price` decimal(20,6) NOT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) NOT NULL COMMENT 'Max Price',
  PRIMARY KEY (`entity_id`,`website_id`,`customer_group_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_WEBSITE_ID` (`website_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_CUSTOMER_GROUP_ID` (`customer_group_id`),
  CONSTRAINT `CAT_PRD_BNDL_PRICE_IDX_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_BNDL_PRICE_IDX_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_BNDL_PRICE_IDX_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Price Index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_bundle_price_index`
--

LOCK TABLES `catalog_product_bundle_price_index` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_price_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_bundle_price_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_bundle_selection`
--

DROP TABLE IF EXISTS `catalog_product_bundle_selection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_bundle_selection` (
  `selection_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Selection ID',
  `option_id` int(10) unsigned NOT NULL COMMENT 'Option ID',
  `parent_product_id` int(10) unsigned NOT NULL COMMENT 'Parent Product ID',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product ID',
  `position` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Position',
  `is_default` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Default',
  `selection_price_type` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Selection Price Type',
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Selection Price Value',
  `selection_qty` decimal(12,4) DEFAULT NULL COMMENT 'Selection Qty',
  `selection_can_change_qty` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Selection Can Change Qty',
  PRIMARY KEY (`selection_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_SELECTION_OPTION_ID` (`option_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_SELECTION_PRODUCT_ID` (`product_id`),
  CONSTRAINT `CAT_PRD_BNDL_SELECTION_OPT_ID_CAT_PRD_BNDL_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_BNDL_SELECTION_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Selection';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_bundle_selection`
--

LOCK TABLES `catalog_product_bundle_selection` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_selection` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_bundle_selection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_bundle_selection_price`
--

DROP TABLE IF EXISTS `catalog_product_bundle_selection_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_bundle_selection_price` (
  `selection_id` int(10) unsigned NOT NULL COMMENT 'Selection ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `selection_price_type` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Selection Price Type',
  `selection_price_value` decimal(20,6) NOT NULL DEFAULT 0.000000 COMMENT 'Selection Price Value',
  `parent_product_id` int(10) unsigned NOT NULL COMMENT 'Parent Product ID',
  PRIMARY KEY (`selection_id`,`parent_product_id`,`website_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_SELECTION_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CAT_PRD_BNDL_SELECTION_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_DCF37523AA05D770A70AA4ED7C2616E4` FOREIGN KEY (`selection_id`) REFERENCES `catalog_product_bundle_selection` (`selection_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Selection Price';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_bundle_selection_price`
--

LOCK TABLES `catalog_product_bundle_selection_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_selection_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_bundle_selection_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_bundle_stock_index`
--

DROP TABLE IF EXISTS `catalog_product_bundle_stock_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_bundle_stock_index` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Option ID',
  `stock_status` smallint(6) DEFAULT 0 COMMENT 'Stock Status',
  PRIMARY KEY (`entity_id`,`website_id`,`stock_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Stock Index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_bundle_stock_index`
--

LOCK TABLES `catalog_product_bundle_stock_index` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_stock_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_bundle_stock_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity`
--

DROP TABLE IF EXISTS `catalog_product_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute Set ID',
  `type_id` varchar(32) NOT NULL DEFAULT 'simple' COMMENT 'Type ID',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `has_options` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Has Options',
  `required_options` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Required Options',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Update Time',
  PRIMARY KEY (`entity_id`),
  KEY `CATALOG_PRODUCT_ENTITY_ATTRIBUTE_SET_ID` (`attribute_set_id`),
  KEY `CATALOG_PRODUCT_ENTITY_SKU` (`sku`)
) ENGINE=InnoDB AUTO_INCREMENT=1721 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity`
--

LOCK TABLES `catalog_product_entity` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity` DISABLE KEYS */;
INSERT INTO `catalog_product_entity` VALUES (1621,4,'simple','EI1489',0,0,'2021-04-27 09:44:18','2021-04-27 09:44:18'),(1622,4,'simple','EI1699',0,0,'2021-04-27 09:44:18','2021-04-27 09:44:18'),(1623,4,'simple','EI1060',0,0,'2021-04-27 09:44:19','2021-04-27 09:44:19'),(1624,4,'simple','EI1061',0,0,'2021-04-27 09:44:19','2021-04-27 09:44:19'),(1625,4,'simple','E00500',0,0,'2021-04-27 09:44:19','2021-04-27 09:44:19'),(1626,4,'simple','EI0063',0,0,'2021-04-27 09:44:19','2021-04-27 09:44:19'),(1627,4,'simple','EI1063',0,0,'2021-04-27 09:44:20','2021-04-27 09:44:20'),(1628,4,'simple','EI0062',0,0,'2021-04-27 09:44:20','2021-04-27 09:44:20'),(1629,4,'simple','EI1062',0,0,'2021-04-27 09:44:20','2021-04-27 09:44:20'),(1630,4,'simple','EI0062-1',0,0,'2021-04-27 09:44:21','2021-04-27 09:44:21'),(1631,4,'simple','EI1062-1',0,0,'2021-04-27 09:44:21','2021-04-27 09:44:21'),(1632,4,'simple','EI0064',0,0,'2021-04-27 09:44:21','2021-04-27 09:44:21'),(1633,4,'simple','EI1064',0,0,'2021-04-27 09:44:22','2021-04-27 09:44:22'),(1634,4,'simple','EI0064-1',0,0,'2021-04-27 09:44:22','2021-04-27 09:44:22'),(1635,4,'simple','EI1064-1',0,0,'2021-04-27 09:44:22','2021-04-27 09:44:22'),(1636,4,'simple','EI1065',0,0,'2021-04-27 09:44:23','2021-04-27 09:44:23'),(1637,4,'simple','E00002',0,0,'2021-04-27 09:44:23','2021-04-27 09:44:23'),(1638,4,'simple','EI0642',0,0,'2021-04-27 09:44:23','2021-04-27 09:44:23'),(1639,4,'simple','EI1642',0,0,'2021-04-27 09:44:24','2021-04-27 09:44:24'),(1640,4,'simple','EI4642',0,0,'2021-04-27 09:44:24','2021-04-27 09:44:24'),(1641,4,'simple','EI0052',0,0,'2021-04-27 09:44:24','2021-04-27 09:44:24'),(1642,4,'simple','EI1052',0,0,'2021-04-27 09:44:25','2021-04-27 09:44:25'),(1643,4,'simple','EI4052',0,0,'2021-04-27 09:44:25','2021-04-27 09:44:25'),(1644,4,'simple','EI0066',0,0,'2021-04-27 09:44:26','2021-04-27 09:44:26'),(1645,4,'simple','EI1066',0,0,'2021-04-27 09:44:26','2021-04-27 09:44:26'),(1646,4,'simple','EE0276',0,0,'2021-04-27 09:44:26','2021-04-27 09:44:26'),(1647,4,'simple','EE1276',0,0,'2021-04-27 09:44:27','2021-04-27 09:44:27'),(1648,4,'simple','E00002-1',0,0,'2021-04-27 09:44:27','2021-04-27 09:44:27'),(1649,4,'simple','EI0629',0,0,'2021-04-27 09:44:28','2021-04-27 09:44:28'),(1650,4,'simple','EI1629',0,0,'2021-04-27 09:44:28','2021-04-27 09:44:28'),(1651,4,'simple','EI4629',0,0,'2021-04-27 09:44:29','2021-04-27 09:44:29'),(1652,4,'simple','E00012',0,0,'2021-04-27 09:44:29','2021-04-27 09:44:29'),(1653,4,'simple','E00501',0,0,'2021-04-27 09:44:29','2021-04-27 09:44:29'),(1654,4,'simple','E00501A',0,0,'2021-04-27 09:44:30','2021-04-27 09:44:30'),(1655,4,'simple','E00501-1',0,0,'2021-04-27 09:44:30','2021-04-27 09:44:30'),(1656,4,'simple','E00012-1',0,0,'2021-04-27 09:44:31','2021-04-27 09:44:31'),(1657,4,'simple','E00607',0,0,'2021-04-27 09:44:31','2021-04-27 09:44:31'),(1658,4,'simple','EI0499',0,0,'2021-04-27 09:44:32','2021-04-27 09:44:32'),(1659,4,'simple','E00502',0,0,'2021-04-27 09:44:32','2021-04-27 09:44:32'),(1660,4,'simple','E00595',0,0,'2021-04-27 09:44:33','2021-04-27 09:44:33'),(1661,4,'simple','EI0499-1',0,0,'2021-04-27 09:44:33','2021-04-27 09:44:33'),(1662,4,'simple','EE0307',0,0,'2021-04-27 09:44:34','2021-04-27 09:44:34'),(1663,4,'simple','EE1307',0,0,'2021-04-27 09:44:34','2021-04-27 09:44:34'),(1664,4,'simple','EE4307',0,0,'2021-04-27 09:44:35','2021-04-27 09:44:35'),(1665,4,'simple','EE0307-1',0,0,'2021-04-27 09:44:35','2021-04-27 09:44:35'),(1666,4,'simple','EE1307-1',0,0,'2021-04-27 09:44:36','2021-04-27 09:44:36'),(1667,4,'simple','EE4307-1',0,0,'2021-04-27 09:44:36','2021-04-27 09:44:36'),(1668,4,'simple','EE0307-2',0,0,'2021-04-27 09:44:37','2021-04-27 09:44:37'),(1669,4,'simple','EE1307-2',0,0,'2021-04-27 09:44:37','2021-04-27 09:44:37'),(1670,4,'simple','EE4307-2',0,0,'2021-04-27 09:44:38','2021-04-27 09:44:38'),(1671,4,'simple','EI4067',0,0,'2021-04-27 09:44:38','2021-04-27 09:44:38'),(1672,4,'simple','EE0039',0,0,'2021-04-27 09:44:39','2021-04-27 09:44:39'),(1673,4,'simple','EE1039',0,0,'2021-04-27 09:44:39','2021-04-27 09:44:39'),(1674,4,'simple','EI4068',0,0,'2021-04-27 09:44:40','2021-04-27 09:44:40'),(1675,4,'simple','EE0188C',0,0,'2021-04-27 09:44:40','2021-04-27 09:44:40'),(1676,4,'simple','EE1188C',0,0,'2021-04-27 09:44:41','2021-04-27 09:44:41'),(1677,4,'simple','EI4070',0,0,'2021-04-27 09:44:41','2021-04-27 09:44:41'),(1678,4,'simple','EE0196C',0,0,'2021-04-27 09:44:42','2021-04-27 09:44:42'),(1679,4,'simple','EE1196C',0,0,'2021-04-27 09:44:42','2021-04-27 09:44:42'),(1680,4,'simple','EE4431C',0,0,'2021-04-27 09:44:43','2021-04-27 09:44:43'),(1681,4,'simple','EE0039-1',0,0,'2021-04-27 09:44:44','2021-04-27 09:44:44'),(1682,4,'simple','EE1039-1',0,0,'2021-04-27 09:44:44','2021-04-27 09:44:44'),(1683,4,'simple','EE0232C',0,0,'2021-04-27 09:44:45','2021-04-27 09:44:45'),(1684,4,'simple','EE1232C',0,0,'2021-04-27 09:44:45','2021-04-27 09:44:45'),(1685,4,'simple','EE0196L',0,0,'2021-04-27 09:44:46','2021-04-27 09:44:46'),(1686,4,'simple','EE1196L',0,0,'2021-04-27 09:44:47','2021-04-27 09:44:47'),(1687,4,'simple','EE4431L',0,0,'2021-04-27 09:44:47','2021-04-27 09:44:47'),(1688,4,'simple','EE0529',0,0,'2021-04-27 09:44:48','2021-04-27 09:44:48'),(1689,4,'simple','EE1529',0,0,'2021-04-27 09:44:48','2021-04-27 09:44:48'),(1690,4,'simple','EE4529',0,0,'2021-04-27 09:44:49','2021-04-27 09:44:49'),(1691,4,'simple','EE0188L',0,0,'2021-04-27 09:44:50','2021-04-27 09:44:50'),(1692,4,'simple','EE1188L',0,0,'2021-04-27 09:44:50','2021-04-27 09:44:50'),(1693,4,'simple','EE0196C-1',0,0,'2021-04-27 09:44:51','2021-04-27 09:44:51'),(1694,4,'simple','EE1196C-1',0,0,'2021-04-27 09:44:52','2021-04-27 09:44:52'),(1695,4,'simple','EE4431A',0,0,'2021-04-27 09:44:52','2021-04-27 09:44:52'),(1696,4,'simple','EE0529-1',0,0,'2021-04-27 09:44:53','2021-04-27 09:44:53'),(1697,4,'simple','EE1529-1',0,0,'2021-04-27 09:44:53','2021-04-27 09:44:53'),(1698,4,'simple','EE4529-1',0,0,'2021-04-27 09:44:54','2021-04-27 09:44:54'),(1699,4,'simple','EI0069',0,0,'2021-04-27 09:44:55','2021-04-27 09:44:55'),(1700,4,'simple','EI1069',0,0,'2021-04-27 09:44:55','2021-04-27 09:44:55'),(1701,4,'simple','EI0069-1',0,0,'2021-04-27 09:44:56','2021-04-27 09:44:56'),(1702,4,'simple','EI1069-1',0,0,'2021-04-27 09:44:57','2021-04-27 09:44:57'),(1703,4,'simple','EE0188C-1',0,0,'2021-04-27 09:44:58','2021-04-27 09:44:58'),(1704,4,'simple','EE1188C-1',0,0,'2021-04-27 09:44:58','2021-04-27 09:44:58'),(1705,4,'simple','EE0232C-1',0,0,'2021-04-27 09:44:59','2021-04-27 09:44:59'),(1706,4,'simple','EE1232C-1',0,0,'2021-04-27 09:45:00','2021-04-27 09:45:00'),(1707,4,'simple','EE0196L-1',0,0,'2021-04-27 09:45:00','2021-04-27 09:45:00'),(1708,4,'simple','EE1196L-1',0,0,'2021-04-27 09:45:01','2021-04-27 09:45:01'),(1709,4,'simple','EE4431A-1',0,0,'2021-04-27 09:45:02','2021-04-27 09:45:02'),(1710,4,'simple','EE0529-2',0,0,'2021-04-27 09:45:03','2021-04-27 09:45:03'),(1711,4,'simple','EE1529-2',0,0,'2021-04-27 09:45:04','2021-04-27 09:45:04'),(1712,4,'simple','EE4529-2',0,0,'2021-04-27 09:45:04','2021-04-27 09:45:04'),(1713,4,'simple','EI0806',0,0,'2021-04-27 09:45:05','2021-04-27 09:45:05'),(1714,4,'simple','EI1806',0,0,'2021-04-27 09:45:06','2021-04-27 09:45:06'),(1715,4,'simple','EI4806',0,0,'2021-04-27 09:45:07','2021-04-27 09:45:07'),(1716,4,'simple','EE0232C-2',0,0,'2021-04-27 09:45:08','2021-04-27 09:45:08'),(1717,4,'simple','EE1232C-2',0,0,'2021-04-27 09:45:08','2021-04-27 09:45:08'),(1718,4,'simple','EE0196L-2',0,0,'2021-04-27 09:45:09','2021-04-27 09:45:09'),(1719,4,'simple','EE1196L-2',0,0,'2021-04-27 09:45:10','2021-04-27 09:45:10'),(1720,4,'simple','EE4431L-1',0,0,'2021-04-27 09:45:11','2021-04-27 09:45:11');
/*!40000 ALTER TABLE `catalog_product_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_datetime`
--

DROP TABLE IF EXISTS `catalog_product_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_DTIME_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Datetime Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_datetime`
--

LOCK TABLES `catalog_product_entity_datetime` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_datetime` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_datetime` VALUES (138,79,0,1621,'2021-04-27 00:00:00'),(139,79,0,1622,'2021-04-27 00:00:00'),(140,79,0,1623,'2021-04-27 00:00:00'),(141,79,0,1624,'2021-04-27 00:00:00'),(142,79,0,1625,'2021-04-27 00:00:00'),(143,79,0,1626,'2021-04-27 00:00:00'),(144,79,0,1627,'2021-04-27 00:00:00'),(145,79,0,1628,'2021-04-27 00:00:00'),(146,79,0,1629,'2021-04-27 00:00:00'),(147,79,0,1630,'2021-04-27 00:00:00'),(148,79,0,1631,'2021-04-27 00:00:00'),(149,79,0,1632,'2021-04-27 00:00:00'),(150,79,0,1633,'2021-04-27 00:00:00'),(151,79,0,1634,'2021-04-27 00:00:00'),(152,79,0,1635,'2021-04-27 00:00:00'),(153,79,0,1636,'2021-04-27 00:00:00'),(154,79,0,1637,'2021-04-27 00:00:00'),(155,79,0,1638,'2021-04-27 00:00:00'),(156,79,0,1639,'2021-04-27 00:00:00'),(157,79,0,1640,'2021-04-27 00:00:00'),(158,79,0,1641,'2021-04-27 00:00:00'),(159,79,0,1642,'2021-04-27 00:00:00'),(160,79,0,1643,'2021-04-27 00:00:00'),(161,79,0,1644,'2021-04-27 00:00:00'),(162,79,0,1645,'2021-04-27 00:00:00'),(163,79,0,1646,'2021-04-27 00:00:00'),(164,79,0,1647,'2021-04-27 00:00:00'),(165,79,0,1648,'2021-04-27 00:00:00'),(166,79,0,1649,'2021-04-27 00:00:00'),(167,79,0,1650,'2021-04-27 00:00:00'),(168,79,0,1651,'2021-04-27 00:00:00'),(169,79,0,1652,'2021-04-27 00:00:00'),(170,79,0,1653,'2021-04-27 00:00:00'),(171,79,0,1654,'2021-04-27 00:00:00'),(172,79,0,1655,'2021-04-27 00:00:00'),(173,79,0,1656,'2021-04-27 00:00:00'),(174,79,0,1657,'2021-04-27 00:00:00'),(175,79,0,1658,'2021-04-27 00:00:00'),(176,79,0,1659,'2021-04-27 00:00:00'),(177,79,0,1660,'2021-04-27 00:00:00'),(178,79,0,1661,'2021-04-27 00:00:00'),(179,79,0,1662,'2021-04-27 00:00:00'),(180,79,0,1663,'2021-04-27 00:00:00'),(181,79,0,1664,'2021-04-27 00:00:00'),(182,79,0,1665,'2021-04-27 00:00:00'),(183,79,0,1666,'2021-04-27 00:00:00'),(184,79,0,1667,'2021-04-27 00:00:00'),(185,79,0,1668,'2021-04-27 00:00:00'),(186,79,0,1669,'2021-04-27 00:00:00'),(187,79,0,1670,'2021-04-27 00:00:00'),(188,79,0,1671,'2021-04-27 00:00:00'),(189,79,0,1672,'2021-04-27 00:00:00'),(190,79,0,1673,'2021-04-27 00:00:00'),(191,79,0,1674,'2021-04-27 00:00:00'),(192,79,0,1675,'2021-04-27 00:00:00'),(193,79,0,1676,'2021-04-27 00:00:00'),(194,79,0,1677,'2021-04-27 00:00:00'),(195,79,0,1678,'2021-04-27 00:00:00'),(196,79,0,1679,'2021-04-27 00:00:00'),(197,79,0,1680,'2021-04-27 00:00:00'),(198,79,0,1681,'2021-04-27 00:00:00'),(199,79,0,1682,'2021-04-27 00:00:00'),(200,79,0,1683,'2021-04-27 00:00:00'),(201,79,0,1684,'2021-04-27 00:00:00'),(202,79,0,1685,'2021-04-27 00:00:00'),(203,79,0,1686,'2021-04-27 00:00:00'),(204,79,0,1687,'2021-04-27 00:00:00'),(205,79,0,1688,'2021-04-27 00:00:00'),(206,79,0,1689,'2021-04-27 00:00:00'),(207,79,0,1690,'2021-04-27 00:00:00'),(208,79,0,1691,'2021-04-27 00:00:00'),(209,79,0,1692,'2021-04-27 00:00:00'),(210,79,0,1693,'2021-04-27 00:00:00'),(211,79,0,1694,'2021-04-27 00:00:00'),(212,79,0,1695,'2021-04-27 00:00:00'),(213,79,0,1696,'2021-04-27 00:00:00'),(214,79,0,1697,'2021-04-27 00:00:00'),(215,79,0,1698,'2021-04-27 00:00:00'),(216,79,0,1699,'2021-04-27 00:00:00'),(217,79,0,1700,'2021-04-27 00:00:00'),(218,79,0,1701,'2021-04-27 00:00:00'),(219,79,0,1702,'2021-04-27 00:00:00'),(220,79,0,1703,'2021-04-27 00:00:00'),(221,79,0,1704,'2021-04-27 00:00:00'),(222,79,0,1705,'2021-04-27 00:00:00'),(223,79,0,1706,'2021-04-27 00:00:00'),(224,79,0,1707,'2021-04-27 00:00:00'),(225,79,0,1708,'2021-04-27 00:00:00'),(226,79,0,1709,'2021-04-27 00:00:00'),(227,79,0,1710,'2021-04-27 00:00:00'),(228,79,0,1711,'2021-04-27 00:00:00'),(229,79,0,1712,'2021-04-27 00:00:00'),(230,79,0,1713,'2021-04-27 00:00:00'),(231,79,0,1714,'2021-04-27 00:00:00'),(232,79,0,1715,'2021-04-27 00:00:00'),(233,79,0,1716,'2021-04-27 00:00:00'),(234,79,0,1717,'2021-04-27 00:00:00'),(235,79,0,1718,'2021-04-27 00:00:00'),(236,79,0,1719,'2021-04-27 00:00:00'),(237,79,0,1720,'2021-04-27 00:00:00');
/*!40000 ALTER TABLE `catalog_product_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_decimal`
--

DROP TABLE IF EXISTS `catalog_product_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` decimal(20,6) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_DEC_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1961 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Decimal Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_decimal`
--

LOCK TABLES `catalog_product_entity_decimal` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_decimal` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_decimal` VALUES (1761,77,0,1621,767.140000),(1762,78,0,1621,591.752617),(1763,77,0,1622,527.560000),(1764,78,0,1622,406.946595),(1765,77,0,1623,481.580000),(1766,78,0,1623,371.478772),(1767,77,0,1624,498.520000),(1768,78,0,1624,384.545865),(1769,77,0,1625,332.750000),(1770,78,0,1625,256.675031),(1771,77,0,1626,361.790000),(1772,78,0,1626,279.075761),(1773,77,0,1627,574.750000),(1774,78,0,1627,443.347781),(1775,77,0,1628,329.120000),(1776,78,0,1628,253.874940),(1777,77,0,1629,492.470000),(1778,78,0,1629,379.879046),(1779,77,0,1630,329.120000),(1780,78,0,1630,253.874940),(1781,77,0,1631,492.470000),(1782,78,0,1631,379.879046),(1783,77,0,1632,359.370000),(1784,78,0,1632,277.209034),(1785,77,0,1633,584.430000),(1786,78,0,1633,450.814691),(1787,77,0,1634,359.370000),(1788,78,0,1634,277.209034),(1789,77,0,1635,584.430000),(1790,78,0,1635,450.814691),(1791,77,0,1636,600.160000),(1792,78,0,1636,462.948420),(1793,77,0,1637,332.750000),(1794,78,0,1637,256.675031),(1795,77,0,1638,289.190000),(1796,78,0,1638,223.073936),(1797,77,0,1639,452.540000),(1798,78,0,1639,349.078043),(1799,77,0,1640,497.310000),(1800,78,0,1640,383.612501),(1801,77,0,1641,301.290000),(1802,78,0,1641,232.407574),(1803,77,0,1642,444.070000),(1804,78,0,1642,342.544496),(1805,77,0,1643,565.070000),(1806,78,0,1643,435.880871),(1807,77,0,1644,350.900000),(1808,78,0,1644,270.675488),(1809,77,0,1645,574.750000),(1810,78,0,1645,443.347781),(1811,77,0,1646,234.740000),(1812,78,0,1646,181.072568),(1813,77,0,1647,361.790000),(1814,78,0,1647,279.075761),(1815,77,0,1648,332.750000),(1816,78,0,1648,256.675031),(1817,77,0,1649,308.550000),(1818,78,0,1649,238.007756),(1819,77,0,1650,471.900000),(1820,78,0,1650,364.011862),(1821,77,0,1651,542.080000),(1822,78,0,1651,418.146960),(1823,77,0,1652,332.750000),(1824,78,0,1652,256.675031),(1825,77,0,1653,332.750000),(1826,78,0,1653,256.675031),(1827,77,0,1654,332.750000),(1828,78,0,1654,256.675031),(1829,77,0,1655,332.750000),(1830,78,0,1655,256.675031),(1831,77,0,1656,332.750000),(1832,78,0,1656,256.675031),(1833,77,0,1657,332.750000),(1834,78,0,1657,256.675031),(1835,77,0,1658,396.880000),(1836,78,0,1658,306.143310),(1837,77,0,1659,332.750000),(1838,78,0,1659,256.675031),(1839,77,0,1660,332.750000),(1840,78,0,1660,256.675031),(1841,77,0,1661,396.880000),(1842,78,0,1661,306.143310),(1843,77,0,1662,240.790000),(1844,78,0,1662,185.739386),(1845,77,0,1663,356.950000),(1846,78,0,1663,275.342306),(1847,77,0,1664,514.250000),(1848,78,0,1664,396.679594),(1849,77,0,1665,240.790000),(1850,78,0,1665,185.739386),(1851,77,0,1666,356.950000),(1852,78,0,1666,275.342306),(1853,77,0,1667,514.250000),(1854,78,0,1667,396.679594),(1855,77,0,1668,240.790000),(1856,78,0,1668,185.739386),(1857,77,0,1669,356.950000),(1858,78,0,1669,275.342306),(1859,77,0,1670,514.250000),(1860,78,0,1670,396.679594),(1861,77,0,1671,617.100000),(1862,78,0,1671,476.015512),(1863,77,0,1672,205.700000),(1864,78,0,1672,158.671837),(1865,77,0,1673,365.420000),(1866,78,0,1673,281.875853),(1867,77,0,1674,540.870000),(1868,78,0,1674,417.213596),(1869,77,0,1675,211.750000),(1870,78,0,1675,163.338656),(1871,77,0,1676,354.530000),(1872,78,0,1676,273.475579),(1873,77,0,1677,516.670000),(1874,78,0,1677,398.546321),(1875,77,0,1678,225.060000),(1876,78,0,1678,173.605658),(1877,77,0,1679,335.170000),(1878,78,0,1679,258.541759),(1879,77,0,1680,486.420000),(1880,78,0,1680,375.212228),(1881,77,0,1681,205.700000),(1882,78,0,1681,158.671837),(1883,77,0,1682,365.420000),(1884,78,0,1682,281.875853),(1885,77,0,1683,216.590000),(1886,78,0,1683,167.072111),(1887,77,0,1684,360.580000),(1888,78,0,1684,278.142398),(1889,77,0,1685,211.750000),(1890,78,0,1685,163.338656),(1891,77,0,1686,347.270000),(1892,78,0,1686,267.875396),(1893,77,0,1687,504.570000),(1894,78,0,1687,389.212684),(1895,77,0,1688,258.940000),(1896,78,0,1688,199.739843),(1897,77,0,1689,370.260000),(1898,78,0,1689,285.609307),(1899,77,0,1690,496.100000),(1900,78,0,1690,382.679138),(1901,77,0,1691,211.750000),(1902,78,0,1691,163.338656),(1903,77,0,1692,375.100000),(1904,78,0,1692,289.342763),(1905,77,0,1693,225.060000),(1906,78,0,1693,173.605658),(1907,77,0,1694,335.170000),(1908,78,0,1694,258.541759),(1909,77,0,1695,505.780000),(1910,78,0,1695,390.146047),(1911,77,0,1696,258.940000),(1912,78,0,1696,199.739843),(1913,77,0,1697,370.260000),(1914,78,0,1697,285.609307),(1915,77,0,1698,496.100000),(1916,78,0,1698,382.679138),(1917,77,0,1699,369.050000),(1918,78,0,1699,284.675944),(1919,77,0,1700,509.410000),(1920,78,0,1700,392.946139),(1921,77,0,1701,369.050000),(1922,78,0,1701,284.675944),(1923,77,0,1702,509.410000),(1924,78,0,1702,392.946139),(1925,77,0,1703,211.750000),(1926,78,0,1703,163.338656),(1927,77,0,1704,354.530000),(1928,78,0,1704,273.475579),(1929,77,0,1705,216.590000),(1930,78,0,1705,167.072111),(1931,77,0,1706,360.580000),(1932,78,0,1706,278.142398),(1933,77,0,1707,211.750000),(1934,78,0,1707,163.338656),(1935,77,0,1708,347.270000),(1936,78,0,1708,267.875396),(1937,77,0,1709,505.780000),(1938,78,0,1709,390.146047),(1939,77,0,1710,258.940000),(1940,78,0,1710,199.739843),(1941,77,0,1711,370.260000),(1942,78,0,1711,285.609307),(1943,77,0,1712,496.100000),(1944,78,0,1712,382.679138),(1945,77,0,1713,268.620000),(1946,78,0,1713,207.206753),(1947,77,0,1714,438.020000),(1948,78,0,1714,337.877678),(1949,77,0,1715,502.150000),(1950,78,0,1715,387.345956),(1951,77,0,1716,216.590000),(1952,78,0,1716,167.072111),(1953,77,0,1717,360.580000),(1954,78,0,1717,278.142398),(1955,77,0,1718,211.750000),(1956,78,0,1718,163.338656),(1957,77,0,1719,347.270000),(1958,78,0,1719,267.875396),(1959,77,0,1720,504.570000),(1960,78,0,1720,389.212684);
/*!40000 ALTER TABLE `catalog_product_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_gallery`
--

DROP TABLE IF EXISTS `catalog_product_entity_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_gallery` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `position` int(11) NOT NULL DEFAULT 0 COMMENT 'Position',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_PRODUCT_ENTITY_GALLERY_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_GLR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_GLR_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Gallery Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_gallery`
--

LOCK TABLES `catalog_product_entity_gallery` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_int`
--

DROP TABLE IF EXISTS `catalog_product_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` int(11) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_INT_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE_ID_STORE_ID_VALUE` (`attribute_id`,`store_id`,`value`),
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_INT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_INT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6874 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Integer Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_int`
--

LOCK TABLES `catalog_product_entity_int` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_int` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_int` VALUES (6475,97,0,1621,1),(6476,99,0,1621,4),(6477,136,0,1621,0),(6478,97,0,1622,1),(6479,99,0,1622,4),(6480,115,0,1622,1),(6481,136,0,1622,0),(6482,97,0,1623,1),(6483,99,0,1623,4),(6484,115,0,1623,1),(6485,136,0,1623,0),(6486,97,0,1624,1),(6487,99,0,1624,4),(6488,115,0,1624,1),(6489,136,0,1624,0),(6490,97,0,1625,1),(6491,99,0,1625,4),(6492,115,0,1625,1),(6493,136,0,1625,0),(6494,97,0,1626,1),(6495,99,0,1626,4),(6496,115,0,1626,1),(6497,136,0,1626,0),(6498,97,0,1627,1),(6499,99,0,1627,4),(6500,115,0,1627,1),(6501,136,0,1627,0),(6502,97,0,1628,1),(6503,99,0,1628,4),(6504,115,0,1628,1),(6505,136,0,1628,0),(6506,97,0,1629,1),(6507,99,0,1629,4),(6508,115,0,1629,1),(6509,136,0,1629,0),(6510,97,0,1630,1),(6511,99,0,1630,4),(6512,115,0,1630,1),(6513,136,0,1630,0),(6514,97,0,1631,1),(6515,99,0,1631,4),(6516,115,0,1631,1),(6517,136,0,1631,0),(6518,97,0,1632,1),(6519,99,0,1632,4),(6520,115,0,1632,1),(6521,136,0,1632,0),(6522,97,0,1633,1),(6523,99,0,1633,4),(6524,115,0,1633,1),(6525,136,0,1633,0),(6526,97,0,1634,1),(6527,99,0,1634,4),(6528,115,0,1634,1),(6529,136,0,1634,0),(6530,97,0,1635,1),(6531,99,0,1635,4),(6532,115,0,1635,1),(6533,136,0,1635,0),(6534,97,0,1636,1),(6535,99,0,1636,4),(6536,115,0,1636,1),(6537,136,0,1636,0),(6538,97,0,1637,1),(6539,99,0,1637,4),(6540,115,0,1637,1),(6541,136,0,1637,0),(6542,97,0,1638,1),(6543,99,0,1638,4),(6544,115,0,1638,1),(6545,136,0,1638,0),(6546,97,0,1639,1),(6547,99,0,1639,4),(6548,115,0,1639,1),(6549,136,0,1639,0),(6550,97,0,1640,1),(6551,99,0,1640,4),(6552,115,0,1640,1),(6553,136,0,1640,0),(6554,97,0,1641,1),(6555,99,0,1641,4),(6556,115,0,1641,1),(6557,136,0,1641,0),(6558,97,0,1642,1),(6559,99,0,1642,4),(6560,115,0,1642,1),(6561,136,0,1642,0),(6562,97,0,1643,1),(6563,99,0,1643,4),(6564,115,0,1643,1),(6565,136,0,1643,0),(6566,97,0,1644,1),(6567,99,0,1644,4),(6568,115,0,1644,1),(6569,136,0,1644,0),(6570,97,0,1645,1),(6571,99,0,1645,4),(6572,115,0,1645,1),(6573,136,0,1645,0),(6574,97,0,1646,1),(6575,99,0,1646,4),(6576,115,0,1646,1),(6577,136,0,1646,0),(6578,97,0,1647,1),(6579,99,0,1647,4),(6580,115,0,1647,1),(6581,136,0,1647,0),(6582,97,0,1648,1),(6583,99,0,1648,4),(6584,115,0,1648,1),(6585,136,0,1648,0),(6586,97,0,1649,1),(6587,99,0,1649,4),(6588,115,0,1649,1),(6589,136,0,1649,0),(6590,97,0,1650,1),(6591,99,0,1650,4),(6592,115,0,1650,1),(6593,136,0,1650,0),(6594,97,0,1651,1),(6595,99,0,1651,4),(6596,115,0,1651,1),(6597,136,0,1651,0),(6598,97,0,1652,1),(6599,99,0,1652,4),(6600,115,0,1652,1),(6601,136,0,1652,0),(6602,97,0,1653,1),(6603,99,0,1653,4),(6604,115,0,1653,1),(6605,136,0,1653,0),(6606,97,0,1654,1),(6607,99,0,1654,4),(6608,115,0,1654,1),(6609,136,0,1654,0),(6610,97,0,1655,1),(6611,99,0,1655,4),(6612,115,0,1655,1),(6613,136,0,1655,0),(6614,97,0,1656,1),(6615,99,0,1656,4),(6616,115,0,1656,1),(6617,136,0,1656,0),(6618,97,0,1657,1),(6619,99,0,1657,4),(6620,115,0,1657,1),(6621,136,0,1657,0),(6622,97,0,1658,1),(6623,99,0,1658,4),(6624,115,0,1658,1),(6625,136,0,1658,0),(6626,97,0,1659,1),(6627,99,0,1659,4),(6628,115,0,1659,1),(6629,136,0,1659,0),(6630,97,0,1660,1),(6631,99,0,1660,4),(6632,115,0,1660,1),(6633,136,0,1660,0),(6634,97,0,1661,1),(6635,99,0,1661,4),(6636,115,0,1661,1),(6637,136,0,1661,0),(6638,97,0,1662,1),(6639,99,0,1662,4),(6640,115,0,1662,1),(6641,136,0,1662,0),(6642,97,0,1663,1),(6643,99,0,1663,4),(6644,115,0,1663,1),(6645,136,0,1663,0),(6646,97,0,1664,1),(6647,99,0,1664,4),(6648,115,0,1664,1),(6649,136,0,1664,0),(6650,97,0,1665,1),(6651,99,0,1665,4),(6652,115,0,1665,1),(6653,136,0,1665,0),(6654,97,0,1666,1),(6655,99,0,1666,4),(6656,115,0,1666,1),(6657,136,0,1666,0),(6658,97,0,1667,1),(6659,99,0,1667,4),(6660,115,0,1667,1),(6661,136,0,1667,0),(6662,97,0,1668,1),(6663,99,0,1668,4),(6664,115,0,1668,1),(6665,136,0,1668,0),(6666,97,0,1669,1),(6667,99,0,1669,4),(6668,115,0,1669,1),(6669,136,0,1669,0),(6670,97,0,1670,1),(6671,99,0,1670,4),(6672,115,0,1670,1),(6673,136,0,1670,0),(6674,97,0,1671,1),(6675,99,0,1671,4),(6676,115,0,1671,1),(6677,136,0,1671,0),(6678,97,0,1672,1),(6679,99,0,1672,4),(6680,115,0,1672,1),(6681,136,0,1672,0),(6682,97,0,1673,1),(6683,99,0,1673,4),(6684,115,0,1673,1),(6685,136,0,1673,0),(6686,97,0,1674,1),(6687,99,0,1674,4),(6688,115,0,1674,1),(6689,136,0,1674,0),(6690,97,0,1675,1),(6691,99,0,1675,4),(6692,115,0,1675,1),(6693,136,0,1675,0),(6694,97,0,1676,1),(6695,99,0,1676,4),(6696,115,0,1676,1),(6697,136,0,1676,0),(6698,97,0,1677,1),(6699,99,0,1677,4),(6700,115,0,1677,1),(6701,136,0,1677,0),(6702,97,0,1678,1),(6703,99,0,1678,4),(6704,115,0,1678,1),(6705,136,0,1678,0),(6706,97,0,1679,1),(6707,99,0,1679,4),(6708,115,0,1679,1),(6709,136,0,1679,0),(6710,97,0,1680,1),(6711,99,0,1680,4),(6712,115,0,1680,1),(6713,136,0,1680,0),(6714,97,0,1681,1),(6715,99,0,1681,4),(6716,115,0,1681,1),(6717,136,0,1681,0),(6718,97,0,1682,1),(6719,99,0,1682,4),(6720,115,0,1682,1),(6721,136,0,1682,0),(6722,97,0,1683,1),(6723,99,0,1683,4),(6724,115,0,1683,1),(6725,136,0,1683,0),(6726,97,0,1684,1),(6727,99,0,1684,4),(6728,115,0,1684,1),(6729,136,0,1684,0),(6730,97,0,1685,1),(6731,99,0,1685,4),(6732,115,0,1685,1),(6733,136,0,1685,0),(6734,97,0,1686,1),(6735,99,0,1686,4),(6736,115,0,1686,1),(6737,136,0,1686,0),(6738,97,0,1687,1),(6739,99,0,1687,4),(6740,115,0,1687,1),(6741,136,0,1687,0),(6742,97,0,1688,1),(6743,99,0,1688,4),(6744,115,0,1688,1),(6745,136,0,1688,0),(6746,97,0,1689,1),(6747,99,0,1689,4),(6748,115,0,1689,1),(6749,136,0,1689,0),(6750,97,0,1690,1),(6751,99,0,1690,4),(6752,115,0,1690,1),(6753,136,0,1690,0),(6754,97,0,1691,1),(6755,99,0,1691,4),(6756,115,0,1691,1),(6757,136,0,1691,0),(6758,97,0,1692,1),(6759,99,0,1692,4),(6760,115,0,1692,1),(6761,136,0,1692,0),(6762,97,0,1693,1),(6763,99,0,1693,4),(6764,115,0,1693,1),(6765,136,0,1693,0),(6766,97,0,1694,1),(6767,99,0,1694,4),(6768,115,0,1694,1),(6769,136,0,1694,0),(6770,97,0,1695,1),(6771,99,0,1695,4),(6772,115,0,1695,1),(6773,136,0,1695,0),(6774,97,0,1696,1),(6775,99,0,1696,4),(6776,115,0,1696,1),(6777,136,0,1696,0),(6778,97,0,1697,1),(6779,99,0,1697,4),(6780,115,0,1697,1),(6781,136,0,1697,0),(6782,97,0,1698,1),(6783,99,0,1698,4),(6784,115,0,1698,1),(6785,136,0,1698,0),(6786,97,0,1699,1),(6787,99,0,1699,4),(6788,115,0,1699,1),(6789,136,0,1699,0),(6790,97,0,1700,1),(6791,99,0,1700,4),(6792,115,0,1700,1),(6793,136,0,1700,0),(6794,97,0,1701,1),(6795,99,0,1701,4),(6796,115,0,1701,1),(6797,136,0,1701,0),(6798,97,0,1702,1),(6799,99,0,1702,4),(6800,115,0,1702,1),(6801,136,0,1702,0),(6802,97,0,1703,1),(6803,99,0,1703,4),(6804,115,0,1703,1),(6805,136,0,1703,0),(6806,97,0,1704,1),(6807,99,0,1704,4),(6808,115,0,1704,1),(6809,136,0,1704,0),(6810,97,0,1705,1),(6811,99,0,1705,4),(6812,115,0,1705,1),(6813,136,0,1705,0),(6814,97,0,1706,1),(6815,99,0,1706,4),(6816,115,0,1706,1),(6817,136,0,1706,0),(6818,97,0,1707,1),(6819,99,0,1707,4),(6820,115,0,1707,1),(6821,136,0,1707,0),(6822,97,0,1708,1),(6823,99,0,1708,4),(6824,115,0,1708,1),(6825,136,0,1708,0),(6826,97,0,1709,1),(6827,99,0,1709,4),(6828,115,0,1709,1),(6829,136,0,1709,0),(6830,97,0,1710,1),(6831,99,0,1710,4),(6832,115,0,1710,1),(6833,136,0,1710,0),(6834,97,0,1711,1),(6835,99,0,1711,4),(6836,115,0,1711,1),(6837,136,0,1711,0),(6838,97,0,1712,1),(6839,99,0,1712,4),(6840,115,0,1712,1),(6841,136,0,1712,0),(6842,97,0,1713,1),(6843,99,0,1713,4),(6844,115,0,1713,1),(6845,136,0,1713,0),(6846,97,0,1714,1),(6847,99,0,1714,4),(6848,115,0,1714,1),(6849,136,0,1714,0),(6850,97,0,1715,1),(6851,99,0,1715,4),(6852,115,0,1715,1),(6853,136,0,1715,0),(6854,97,0,1716,1),(6855,99,0,1716,4),(6856,115,0,1716,1),(6857,136,0,1716,0),(6858,97,0,1717,1),(6859,99,0,1717,4),(6860,115,0,1717,1),(6861,136,0,1717,0),(6862,97,0,1718,1),(6863,99,0,1718,4),(6864,115,0,1718,1),(6865,136,0,1718,0),(6866,97,0,1719,1),(6867,99,0,1719,4),(6868,115,0,1719,1),(6869,136,0,1719,0),(6870,97,0,1720,1),(6871,99,0,1720,4),(6872,115,0,1720,1),(6873,136,0,1720,0);
/*!40000 ALTER TABLE `catalog_product_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_media_gallery`
--

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_media_gallery` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  `media_type` varchar(32) NOT NULL DEFAULT 'image' COMMENT 'Media entry type',
  `disabled` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Visibility status',
  PRIMARY KEY (`value_id`),
  KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Media Gallery Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_media_gallery`
--

LOCK TABLES `catalog_product_entity_media_gallery` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_media_gallery_value`
--

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_media_gallery_value` (
  `value_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Value ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  `position` int(10) unsigned DEFAULT NULL COMMENT 'Position',
  `disabled` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Is Disabled',
  `record_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Record ID',
  PRIMARY KEY (`record_id`),
  KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_VALUE_ID` (`value_id`),
  KEY `CAT_PRD_ENTT_MDA_GLR_VAL_ENTT_ID_VAL_ID_STORE_ID` (`entity_id`,`value_id`,`store_id`),
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_VAL_ID_CAT_PRD_ENTT_MDA_GLR_VAL_ID` FOREIGN KEY (`value_id`) REFERENCES `catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Media Gallery Attribute Value Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_media_gallery_value`
--

LOCK TABLES `catalog_product_entity_media_gallery_value` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_media_gallery_value_to_entity`
--

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery_value_to_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_media_gallery_value_to_entity` (
  `value_id` int(10) unsigned NOT NULL COMMENT 'Value media Entry ID',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Product Entity ID',
  UNIQUE KEY `CAT_PRD_ENTT_MDA_GLR_VAL_TO_ENTT_VAL_ID_ENTT_ID` (`value_id`,`entity_id`),
  KEY `CAT_PRD_ENTT_MDA_GLR_VAL_TO_ENTT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` (`entity_id`),
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_TO_ENTT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A6C6C8FAA386736921D3A7C4B50B1185` FOREIGN KEY (`value_id`) REFERENCES `catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link Media value to Product entity table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_media_gallery_value_to_entity`
--

LOCK TABLES `catalog_product_entity_media_gallery_value_to_entity` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery_value_to_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery_value_to_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_media_gallery_value_video`
--

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery_value_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_media_gallery_value_video` (
  `value_id` int(10) unsigned NOT NULL COMMENT 'Media Entity ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `provider` varchar(32) DEFAULT NULL COMMENT 'Video provider ID',
  `url` text DEFAULT NULL COMMENT 'Video URL',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `description` text DEFAULT NULL COMMENT 'Page Meta Description',
  `metadata` text DEFAULT NULL COMMENT 'Video meta data',
  UNIQUE KEY `CAT_PRD_ENTT_MDA_GLR_VAL_VIDEO_VAL_ID_STORE_ID` (`value_id`,`store_id`),
  KEY `CAT_PRD_ENTT_MDA_GLR_VAL_VIDEO_STORE_ID_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_VIDEO_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_6FDF205946906B0E653E60AA769899F8` FOREIGN KEY (`value_id`) REFERENCES `catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Video Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_media_gallery_value_video`
--

LOCK TABLES `catalog_product_entity_media_gallery_value_video` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery_value_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery_value_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_text`
--

DROP TABLE IF EXISTS `catalog_product_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` text DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_TEXT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Text Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_text`
--

LOCK TABLES `catalog_product_entity_text` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_text` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_text` VALUES (142,76,0,1621,'Enganche LaFuente desmontable horizontal ideal para remolque en ALFA ROMEO, 145 Coupe  y matriculado 01/1995 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda visible cuando se desmonta.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable vertical</strong>, los cuales son obligados desmontar en caso de no transportar un remolque. \r\n'),(143,76,0,1622,'Enganche LaFuente desmontable horizontal ideal para remolque en ALFA ROMEO, 146 5 Puertas  y matriculado 01/1995 - 12/2001.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda visible cuando se desmonta.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable vertical</strong>, los cuales son obligados desmontar en caso de no transportar un remolque. \r\n'),(144,76,0,1623,'Enganche LaFuente desmontable horizontal ideal para remolque en ALFA ROMEO, 147 Turismo  y matriculado 01/2000 - 12/2004.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda visible cuando se desmonta.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable vertical</strong>, los cuales son obligados desmontar en caso de no transportar un remolque. \r\n'),(145,76,0,1624,'Enganche LaFuente desmontable horizontal ideal para remolque en ALFA ROMEO, 147 Turismo  y matriculado 01/2005 - 12/2010.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda visible cuando se desmonta.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable vertical</strong>, los cuales son obligados desmontar en caso de no transportar un remolque. \r\n'),(146,76,0,1625,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en ALFA ROMEO, 155 Turismo  y matriculado 01/1992 - 12/1997.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(147,76,0,1626,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en ALFA ROMEO, 156 Crosswagon Q4  y matriculado 01/2004 - 12/2007.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(148,76,0,1627,'Enganche LaFuente desmontable horizontal ideal para remolque en ALFA ROMEO, 156 Crosswagon Q4  y matriculado 01/2004 - 12/2007.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda visible cuando se desmonta.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable vertical</strong>, los cuales son obligados desmontar en caso de no transportar un remolque. \r\n'),(149,76,0,1628,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en ALFA ROMEO, 156 Familiar  y matriculado 01/2000 - 08/2005.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(150,76,0,1629,'Enganche LaFuente desmontable horizontal ideal para remolque en ALFA ROMEO, 156 Familiar  y matriculado 01/2000 - 08/2005.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda visible cuando se desmonta.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable vertical</strong>, los cuales son obligados desmontar en caso de no transportar un remolque. \r\n'),(151,76,0,1630,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en ALFA ROMEO, 156 Sedan  y matriculado 01/1997 - 08/2005.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(152,76,0,1631,'Enganche LaFuente desmontable horizontal ideal para remolque en ALFA ROMEO, 156 Sedan  y matriculado 01/1997 - 08/2005.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda visible cuando se desmonta.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable vertical</strong>, los cuales son obligados desmontar en caso de no transportar un remolque. \r\n'),(153,76,0,1632,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en ALFA ROMEO, 159 Familiar  y matriculado 09/2005 - 12/2011.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(154,76,0,1633,'Enganche LaFuente desmontable horizontal ideal para remolque en ALFA ROMEO, 159 Familiar  y matriculado 09/2005 - 12/2011.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda visible cuando se desmonta.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable vertical</strong>, los cuales son obligados desmontar en caso de no transportar un remolque. \r\n'),(155,76,0,1634,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en ALFA ROMEO, 159 Sedan  y matriculado 09/2005 - 12/2011.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(156,76,0,1635,'Enganche LaFuente desmontable horizontal ideal para remolque en ALFA ROMEO, 159 Sedan  y matriculado 09/2005 - 12/2011.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda visible cuando se desmonta.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable vertical</strong>, los cuales son obligados desmontar en caso de no transportar un remolque. \r\n'),(157,76,0,1636,'Enganche LaFuente desmontable horizontal ideal para remolque en ALFA ROMEO, 166 Turismo  y matriculado 01/1998 - 12/2007.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda visible cuando se desmonta.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable vertical</strong>, los cuales son obligados desmontar en caso de no transportar un remolque. \r\n'),(158,76,0,1637,'Enganche bola fija mono-block LaFuente para remolque en vehículos comerciales y 4x4  ALFA ROMEO, 33 Turismo  y matriculado 01/1983 - 12/1994.\r\n<br/>\r\nEs el modelo de enganche que por sus características se suele utilizar más en 4x4 y en vehículos comerciales. \r\n<br/>\r\nPuede desmontarse, pero siempre con la utilización de una herramienta manual.\r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda un enganche desmontable </strong>para evitar que los sensores detecten un obstáculo.\r\n'),(159,76,0,1638,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en ALFA ROMEO, Giulia Sedan  y matriculado 01/2016 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(160,76,0,1639,'Enganche LaFuente desmontable horizontal ideal para remolque en ALFA ROMEO, Giulia Sedan  y matriculado 01/2016 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda visible cuando se desmonta.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable vertical</strong>, los cuales son obligados desmontar en caso de no transportar un remolque. \r\n'),(161,76,0,1640,'Bola de remolque LaFuente desmontable vertical ideal para remolque en ALFA ROMEO, Giulia Sedan  y matriculado 01/2016 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche desmontable más cómodo y avanzado, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica no es visible al desmontarse.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable horizontal</strong> los cuales son obligados desmontar en caso de no transportar un remolque.\r\n'),(162,76,0,1641,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en ALFA ROMEO, Giulietta Berlina  y matriculado 06/2010 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(163,76,0,1642,'Enganche LaFuente desmontable horizontal ideal para remolque en ALFA ROMEO, Giulietta Berlina  y matriculado 06/2010 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda visible cuando se desmonta.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable vertical</strong>, los cuales son obligados desmontar en caso de no transportar un remolque. \r\n'),(164,76,0,1643,'Bola de remolque LaFuente desmontable vertical ideal para remolque en ALFA ROMEO, Giulietta Berlina  y matriculado 06/2010 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche desmontable más cómodo y avanzado, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica no es visible al desmontarse.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable horizontal</strong> los cuales son obligados desmontar en caso de no transportar un remolque.\r\n'),(165,76,0,1644,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en ALFA ROMEO, GT Coupe  y matriculado 01/2004 - 12/2010.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(166,76,0,1645,'Enganche LaFuente desmontable horizontal ideal para remolque en ALFA ROMEO, GT Coupe  y matriculado 01/2004 - 12/2010.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda visible cuando se desmonta.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable vertical</strong>, los cuales son obligados desmontar en caso de no transportar un remolque. \r\n'),(167,76,0,1646,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en ALFA ROMEO, Mito Turismo  y matriculado 01/2008 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(168,76,0,1647,'Enganche LaFuente desmontable horizontal ideal para remolque en ALFA ROMEO, Mito Turismo  y matriculado 01/2008 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda visible cuando se desmonta.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable vertical</strong>, los cuales son obligados desmontar en caso de no transportar un remolque. \r\n'),(169,76,0,1648,'Enganche bola fija mono-block LaFuente para remolque en vehículos comerciales y 4x4  ALFA ROMEO, Sprint Coupe  y matriculado 01/1983 - 12/1994.\r\n<br/>\r\nEs el modelo de enganche que por sus características se suele utilizar más en 4x4 y en vehículos comerciales. \r\n<br/>\r\nPuede desmontarse, pero siempre con la utilización de una herramienta manual.\r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda un enganche desmontable </strong>para evitar que los sensores detecten un obstáculo.\r\n'),(170,76,0,1649,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en ALFA ROMEO, Stelvio SUV  y matriculado 01/2016 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(171,76,0,1650,'Enganche LaFuente desmontable horizontal ideal para remolque en ALFA ROMEO, Stelvio SUV  y matriculado 01/2016 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda visible cuando se desmonta.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable vertical</strong>, los cuales son obligados desmontar en caso de no transportar un remolque. \r\n'),(172,76,0,1651,'Bola de remolque LaFuente desmontable vertical ideal para remolque en ALFA ROMEO, Stelvio SUV  y matriculado 01/2016 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche desmontable más cómodo y avanzado, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica no es visible al desmontarse.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable horizontal</strong> los cuales son obligados desmontar en caso de no transportar un remolque.\r\n'),(173,76,0,1652,'Enganche bola fija mono-block LaFuente para remolque en vehículos comerciales y 4x4  AUDI,  80 Berlina  y matriculado 01/1983 - 12/1991.\r\n<br/>\r\nEs el modelo de enganche que por sus características se suele utilizar más en 4x4 y en vehículos comerciales. \r\n<br/>\r\nPuede desmontarse, pero siempre con la utilización de una herramienta manual.\r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda un enganche desmontable </strong>para evitar que los sensores detecten un obstáculo.\r\n'),(174,76,0,1653,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI,  80 Berlina  y matriculado 01/1992 - 12/1997.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(175,76,0,1654,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI,  80 Coupe  y matriculado 01/1992 - 12/1997.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(176,76,0,1655,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI,  80 Familiar  y matriculado 01/1992 - 12/1997.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(177,76,0,1656,'Enganche bola fija mono-block LaFuente para remolque en vehículos comerciales y 4x4  AUDI,  90 Berlina  y matriculado 01/1983 - 12/1989.\r\n<br/>\r\nEs el modelo de enganche que por sus características se suele utilizar más en 4x4 y en vehículos comerciales. \r\n<br/>\r\nPuede desmontarse, pero siempre con la utilización de una herramienta manual.\r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda un enganche desmontable </strong>para evitar que los sensores detecten un obstáculo.\r\n'),(178,76,0,1657,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI,  90 Berlina  y matriculado 01/1990 - 12/1997.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(179,76,0,1658,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, 100 Avant  y matriculado 01/1991 - 12/1997.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(180,76,0,1659,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, 100 Berlina  y matriculado 01/1982 - 12/1990.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(181,76,0,1660,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, 100 Berlina  y matriculado 01/1991 - 12/1997.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(182,76,0,1661,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, 100 Berlina  y matriculado 01/1991 - 12/1997.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(183,76,0,1662,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A1 3 Puertas  y matriculado 08/2010 - 09/2018.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(184,76,0,1663,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A1 3 Puertas  y matriculado 08/2010 - 09/2018.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda visible cuando se desmonta.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable vertical</strong>, los cuales son obligados desmontar en caso de no transportar un remolque. \r\n'),(185,76,0,1664,'Bola de remolque LaFuente desmontable vertical ideal para remolque en AUDI, A1 3 Puertas  y matriculado 08/2010 - 09/2018.\r\n<br/>\r\nEs el modelo de enganche desmontable más cómodo y avanzado, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica no es visible al desmontarse.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable horizontal</strong> los cuales son obligados desmontar en caso de no transportar un remolque.\r\n'),(186,76,0,1665,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A1 5 Puertas  y matriculado 01/2012 - 09/2018.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(187,76,0,1666,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A1 5 Puertas  y matriculado 01/2012 - 09/2018.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda visible cuando se desmonta.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable vertical</strong>, los cuales son obligados desmontar en caso de no transportar un remolque. \r\n'),(188,76,0,1667,'Bola de remolque LaFuente desmontable vertical ideal para remolque en AUDI, A1 5 Puertas  y matriculado 01/2012 - 09/2018.\r\n<br/>\r\nEs el modelo de enganche desmontable más cómodo y avanzado, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica no es visible al desmontarse.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable horizontal</strong> los cuales son obligados desmontar en caso de no transportar un remolque.\r\n'),(189,76,0,1668,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A1 Sportback  y matriculado 01/2012 - 10/2018.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(190,76,0,1669,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A1 Sportback  y matriculado 01/2012 - 10/2018.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda visible cuando se desmonta.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable vertical</strong>, los cuales son obligados desmontar en caso de no transportar un remolque. \r\n'),(191,76,0,1670,'Bola de remolque LaFuente desmontable vertical ideal para remolque en AUDI, A1 Sportback  y matriculado 01/2012 - 10/2018.\r\n<br/>\r\nEs el modelo de enganche desmontable más cómodo y avanzado, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica no es visible al desmontarse.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable horizontal</strong> los cuales son obligados desmontar en caso de no transportar un remolque.\r\n'),(192,76,0,1671,'Bola de remolque LaFuente desmontable vertical ideal para remolque en AUDI, A2 Monovolumen  y matriculado 01/2000 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche desmontable más cómodo y avanzado, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica no es visible al desmontarse.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable horizontal</strong> los cuales son obligados desmontar en caso de no transportar un remolque.\r\n'),(193,76,0,1672,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 3 Puertas  y matriculado 01/1996 - 09/2003.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(194,76,0,1673,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A3 3 Puertas  y matriculado 01/1996 - 09/2003.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda visible cuando se desmonta.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable vertical</strong>, los cuales son obligados desmontar en caso de no transportar un remolque. \r\n'),(195,76,0,1674,'Bola de remolque LaFuente desmontable vertical ideal para remolque en AUDI, A3 3 Puertas  y matriculado 01/1996 - 09/2003.\r\n<br/>\r\nEs el modelo de enganche desmontable más cómodo y avanzado, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica no es visible al desmontarse.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable horizontal</strong> los cuales son obligados desmontar en caso de no transportar un remolque.\r\n'),(196,76,0,1675,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 3 Puertas  y matriculado 10/2003 - 10/2012.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(197,76,0,1676,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A3 3 Puertas  y matriculado 10/2003 - 10/2012.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda visible cuando se desmonta.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable vertical</strong>, los cuales son obligados desmontar en caso de no transportar un remolque. \r\n'),(198,76,0,1677,'Bola de remolque LaFuente desmontable vertical ideal para remolque en AUDI, A3 3 Puertas  y matriculado 10/2003 - 10/2012.\r\n<br/>\r\nEs el modelo de enganche desmontable más cómodo y avanzado, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica no es visible al desmontarse.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable horizontal</strong> los cuales son obligados desmontar en caso de no transportar un remolque.\r\n'),(199,76,0,1678,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 3 Puertas  y matriculado 11/2012 - 06/2016.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(200,76,0,1679,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A3 3 Puertas  y matriculado 11/2012 - 06/2016.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda visible cuando se desmonta.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable vertical</strong>, los cuales son obligados desmontar en caso de no transportar un remolque. \r\n'),(201,76,0,1680,'Bola de remolque LaFuente desmontable vertical ideal para remolque en AUDI, A3 3 Puertas  y matriculado 11/2012 - 06/2016.\r\n<br/>\r\nEs el modelo de enganche desmontable más cómodo y avanzado, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica no es visible al desmontarse.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable horizontal</strong> los cuales son obligados desmontar en caso de no transportar un remolque.\r\n'),(202,76,0,1681,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 5 Puertas  y matriculado 01/1996 - 12/2003.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(203,76,0,1682,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A3 5 Puertas  y matriculado 01/1996 - 12/2003.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda visible cuando se desmonta.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable vertical</strong>, los cuales son obligados desmontar en caso de no transportar un remolque. \r\n'),(204,76,0,1683,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 5 Puertas  y matriculado 01/2004 - 01/2013.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(205,76,0,1684,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A3 5 Puertas  y matriculado 01/2004 - 01/2013.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda visible cuando se desmonta.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable vertical</strong>, los cuales son obligados desmontar en caso de no transportar un remolque. \r\n'),(206,76,0,1685,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 5 Puertas  y matriculado 02/2013 - 08/2016.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(207,76,0,1686,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A3 5 Puertas  y matriculado 02/2013 - 08/2016.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda visible cuando se desmonta.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable vertical</strong>, los cuales son obligados desmontar en caso de no transportar un remolque. \r\n'),(208,76,0,1687,'Bola de remolque LaFuente desmontable vertical ideal para remolque en AUDI, A3 5 Puertas  y matriculado 02/2013 - 08/2016.\r\n<br/>\r\nEs el modelo de enganche desmontable más cómodo y avanzado, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica no es visible al desmontarse.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable horizontal</strong> los cuales son obligados desmontar en caso de no transportar un remolque.\r\n'),(209,76,0,1688,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 5 Puertas  y matriculado 09/2016 - 04/2020.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(210,76,0,1689,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A3 5 Puertas  y matriculado 09/2016 - 04/2020.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda visible cuando se desmonta.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable vertical</strong>, los cuales son obligados desmontar en caso de no transportar un remolque. \r\n'),(211,76,0,1690,'Bola de remolque LaFuente desmontable vertical ideal para remolque en AUDI, A3 5 Puertas  y matriculado 09/2016 - 04/2020.\r\n<br/>\r\nEs el modelo de enganche desmontable más cómodo y avanzado, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica no es visible al desmontarse.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable horizontal</strong> los cuales son obligados desmontar en caso de no transportar un remolque.\r\n'),(212,76,0,1691,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 Cabrio  y matriculado 04/2008 - 01/2014.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(213,76,0,1692,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A3 Cabrio  y matriculado 04/2008 - 01/2014.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda visible cuando se desmonta.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable vertical</strong>, los cuales son obligados desmontar en caso de no transportar un remolque. \r\n'),(214,76,0,1693,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 Cabrio  y matriculado 02/2014 - 06/2016.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(215,76,0,1694,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A3 Cabrio  y matriculado 02/2014 - 06/2016.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda visible cuando se desmonta.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable vertical</strong>, los cuales son obligados desmontar en caso de no transportar un remolque. \r\n'),(216,76,0,1695,'Bola de remolque LaFuente desmontable vertical ideal para remolque en AUDI, A3 Cabrio  y matriculado 02/2014 - 06/2016.\r\n<br/>\r\nEs el modelo de enganche desmontable más cómodo y avanzado, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica no es visible al desmontarse.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable horizontal</strong> los cuales son obligados desmontar en caso de no transportar un remolque.\r\n'),(217,76,0,1696,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 Cabrio  y matriculado 07/2016 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(218,76,0,1697,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A3 Cabrio  y matriculado 07/2016 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda visible cuando se desmonta.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable vertical</strong>, los cuales son obligados desmontar en caso de no transportar un remolque. \r\n'),(219,76,0,1698,'Bola de remolque LaFuente desmontable vertical ideal para remolque en AUDI, A3 Cabrio  y matriculado 07/2016 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche desmontable más cómodo y avanzado, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica no es visible al desmontarse.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable horizontal</strong> los cuales son obligados desmontar en caso de no transportar un remolque.\r\n'),(220,76,0,1699,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 Quattro  y matriculado 01/1999 - 12/2002.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(221,76,0,1700,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A3 Quattro  y matriculado 01/1999 - 12/2002.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda visible cuando se desmonta.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable vertical</strong>, los cuales son obligados desmontar en caso de no transportar un remolque. \r\n'),(222,76,0,1701,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 S3 3 Puertas  y matriculado 01/1999 - 10/2003.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(223,76,0,1702,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A3 S3 3 Puertas  y matriculado 01/1999 - 10/2003.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda visible cuando se desmonta.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable vertical</strong>, los cuales son obligados desmontar en caso de no transportar un remolque. \r\n'),(224,76,0,1703,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 S3 3 Puertas  y matriculado 11/2003 - 10/2012.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(225,76,0,1704,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A3 S3 3 Puertas  y matriculado 11/2003 - 10/2012.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda visible cuando se desmonta.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable vertical</strong>, los cuales son obligados desmontar en caso de no transportar un remolque. \r\n'),(226,76,0,1705,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 S3 5 Puertas  y matriculado 01/2004 - 01/2013.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(227,76,0,1706,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A3 S3 5 Puertas  y matriculado 01/2004 - 01/2013.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda visible cuando se desmonta.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable vertical</strong>, los cuales son obligados desmontar en caso de no transportar un remolque. \r\n'),(228,76,0,1707,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 Sedan  y matriculado 05/2013 - 08/2016.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(229,76,0,1708,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A3 Sedan  y matriculado 05/2013 - 08/2016.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda visible cuando se desmonta.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable vertical</strong>, los cuales son obligados desmontar en caso de no transportar un remolque. \r\n'),(230,76,0,1709,'Bola de remolque LaFuente desmontable vertical ideal para remolque en AUDI, A3 Sedan  y matriculado 05/2013 - 08/2016.\r\n<br/>\r\nEs el modelo de enganche desmontable más cómodo y avanzado, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica no es visible al desmontarse.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable horizontal</strong> los cuales son obligados desmontar en caso de no transportar un remolque.\r\n'),(231,76,0,1710,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 Sedan  y matriculado 09/2016 - 03/2020.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(232,76,0,1711,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A3 Sedan  y matriculado 09/2016 - 03/2020.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda visible cuando se desmonta.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable vertical</strong>, los cuales son obligados desmontar en caso de no transportar un remolque. \r\n'),(233,76,0,1712,'Bola de remolque LaFuente desmontable vertical ideal para remolque en AUDI, A3 Sedan  y matriculado 09/2016 - 03/2020.\r\n<br/>\r\nEs el modelo de enganche desmontable más cómodo y avanzado, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica no es visible al desmontarse.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable horizontal</strong> los cuales son obligados desmontar en caso de no transportar un remolque.\r\n'),(234,76,0,1713,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 Sedan  y matriculado 04/2020 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(235,76,0,1714,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 Sedan  y matriculado 04/2020 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(236,76,0,1715,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 Sedan  y matriculado 04/2020 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(237,76,0,1716,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 Sportback  y matriculado 01/2004 - 01/2013.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(238,76,0,1717,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A3 Sportback  y matriculado 01/2004 - 01/2013.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda visible cuando se desmonta.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable vertical</strong>, los cuales son obligados desmontar en caso de no transportar un remolque. \r\n'),(239,76,0,1718,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 Sportback  y matriculado 02/2013 - 08/2016.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación calidad-precio. \r\n<br/>\r\nEl enganche está siempre listo para usarse, aunque si lo desease podría ser desmontado mediante dos tornillos que se pueden extraer con la herramienta manual adecuada. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda los modelos de bola desmontable</strong> para evitar que los sensores detecten un obstáculo. \r\n'),(240,76,0,1719,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A3 Sportback  y matriculado 02/2013 - 08/2016.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda visible cuando se desmonta.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable vertical</strong>, los cuales son obligados desmontar en caso de no transportar un remolque. \r\n'),(241,76,0,1720,'Bola de remolque LaFuente desmontable vertical ideal para remolque en AUDI, A3 Sportback  y matriculado 02/2013 - 08/2016.\r\n<br/>\r\nEs el modelo de enganche desmontable más cómodo y avanzado, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica no es visible al desmontarse.\r\n<br/>\r\nTiene un volumen menor, lo que evita en muchos casos el recorte en el paragolpes además de un doble sistema de seguridad. \r\n<br/>\r\n<strong>En caso de que su vehículo equipe sensor trasero de aparcamiento, enganchesyrecambios.es recomienda este modelo o un desmontable horizontal</strong> los cuales son obligados desmontar en caso de no transportar un remolque.\r\n');
/*!40000 ALTER TABLE `catalog_product_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_tier_price`
--

DROP TABLE IF EXISTS `catalog_product_entity_tier_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_tier_price` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `all_groups` smallint(5) unsigned NOT NULL DEFAULT 1 COMMENT 'Is Applicable To All Customer Groups',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Customer Group ID',
  `qty` decimal(12,4) NOT NULL DEFAULT 1.0000 COMMENT 'QTY',
  `value` decimal(20,6) NOT NULL DEFAULT 0.000000 COMMENT 'Value',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `percentage_value` decimal(5,2) DEFAULT NULL COMMENT 'Percentage value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_E8AB433B9ACB00343ABB312AD2FAB087` (`entity_id`,`all_groups`,`customer_group_id`,`qty`,`website_id`),
  KEY `CATALOG_PRODUCT_ENTITY_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_ENTITY_TIER_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CAT_PRD_ENTT_TIER_PRICE_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_TIER_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_TIER_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Tier Price Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_tier_price`
--

LOCK TABLES `catalog_product_entity_tier_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_tier_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity_tier_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_varchar`
--

DROP TABLE IF EXISTS `catalog_product_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_VCHR_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11271 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Varchar Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_varchar`
--

LOCK TABLES `catalog_product_entity_varchar` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_varchar` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_varchar` VALUES (9875,73,0,1621,'Enganche de Remolque LaFuente Bola desmontable Horizontal para ALFA ROMEO, 145 Coupe , 01/1995 - 04/2021'),(9876,84,0,1621,'Enganche de Remolque LaFuente Bola desmontable Horizontal para ALFA ROMEO, 145 Coupe , 01/1995 - 04/2021'),(9877,86,0,1621,'Enganche LaFuente desmontable horizontal ideal para remolque en ALFA ROMEO, 145 Coupe  y matriculado 01/1995 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica '),(9878,123,0,1621,'enganche-de-remolque-lafuente-bola-desmontable-horizontal-para-alfa-romeo,-145-coupe-,-01-1995---04-2021ei1489'),(9879,182,0,1621,'01/1995 - 04/2021'),(9880,184,0,1621,'1300kg'),(9881,185,0,1621,'60-90 minutos'),(9882,186,0,1621,'7,5kg'),(9883,187,0,1621,'75kg'),(9884,188,0,1621,'Coupe '),(9885,73,0,1622,'Enganche de Remolque LaFuente Bola desmontable Horizontal para ALFA ROMEO, 146 5 Puertas , 01/1995 - 12/2001'),(9886,84,0,1622,'Enganche de Remolque LaFuente Bola desmontable Horizontal para ALFA ROMEO, 146 5 Puertas , 01/1995 - 12/2001'),(9887,86,0,1622,'Enganche LaFuente desmontable horizontal ideal para remolque en ALFA ROMEO, 146 5 Puertas  y matriculado 01/1995 - 12/2001.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctr'),(9888,106,0,1622,'container2'),(9889,120,0,1622,'0'),(9890,123,0,1622,'enganche-de-remolque-lafuente-bola-desmontable-horizontal-para-alfa-romeo,-146-5-puertas-,-01-1995---12-2001ei1699'),(9891,154,0,1622,'1'),(9892,155,0,1622,'1'),(9893,182,0,1622,'01/1995 - 12/2001'),(9894,184,0,1622,'1300kg'),(9895,185,0,1622,'>90 minutos'),(9896,186,0,1622,'7,8kg'),(9897,187,0,1622,'75kg'),(9898,188,0,1622,'5 Puertas '),(9899,73,0,1623,'Enganche de Remolque LaFuente Bola desmontable Horizontal para ALFA ROMEO, 147 Turismo , 01/2000 - 12/2004'),(9900,84,0,1623,'Enganche de Remolque LaFuente Bola desmontable Horizontal para ALFA ROMEO, 147 Turismo , 01/2000 - 12/2004'),(9901,86,0,1623,'Enganche LaFuente desmontable horizontal ideal para remolque en ALFA ROMEO, 147 Turismo  y matriculado 01/2000 - 12/2004.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctric'),(9902,106,0,1623,'container2'),(9903,120,0,1623,'0'),(9904,123,0,1623,'enganche-de-remolque-lafuente-bola-desmontable-horizontal-para-alfa-romeo,-147-turismo-,-01-2000---12-2004ei1060'),(9905,154,0,1623,'1'),(9906,155,0,1623,'1'),(9907,182,0,1623,'01/2000 - 12/2004'),(9908,184,0,1623,'1400kg'),(9909,185,0,1623,'60-90 minutos'),(9910,186,0,1623,'8,2kg'),(9911,187,0,1623,'60kg'),(9912,188,0,1623,'Turismo '),(9913,73,0,1624,'Enganche de Remolque LaFuente Bola desmontable Horizontal para ALFA ROMEO, 147 Turismo , 01/2005 - 12/2010'),(9914,84,0,1624,'Enganche de Remolque LaFuente Bola desmontable Horizontal para ALFA ROMEO, 147 Turismo , 01/2005 - 12/2010'),(9915,86,0,1624,'Enganche LaFuente desmontable horizontal ideal para remolque en ALFA ROMEO, 147 Turismo  y matriculado 01/2005 - 12/2010.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctric'),(9916,106,0,1624,'container2'),(9917,120,0,1624,'0'),(9918,123,0,1624,'enganche-de-remolque-lafuente-bola-desmontable-horizontal-para-alfa-romeo,-147-turismo-,-01-2005---12-2010ei1061'),(9919,154,0,1624,'1'),(9920,155,0,1624,'1'),(9921,182,0,1624,'01/2005 - 12/2010'),(9922,184,0,1624,'1450kg'),(9923,185,0,1624,'60-90 minutos'),(9924,186,0,1624,'8kg'),(9925,187,0,1624,'60kg'),(9926,188,0,1624,'Turismo '),(9927,73,0,1625,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para ALFA ROMEO, 155 Turismo , 01/1992 - 12/1997'),(9928,84,0,1625,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para ALFA ROMEO, 155 Turismo , 01/1992 - 12/1997'),(9929,86,0,1625,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en ALFA ROMEO, 155 Turismo  y matriculado 01/1992 - 12/1997.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente r'),(9930,106,0,1625,'container2'),(9931,120,0,1625,'0'),(9932,123,0,1625,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-alfa-romeo,-155-turismo-,-01-1992---12-1997e00500'),(9933,154,0,1625,'1'),(9934,155,0,1625,'1'),(9935,182,0,1625,'01/1992 - 12/1997'),(9936,184,0,1625,'1200kg'),(9937,185,0,1625,'30-60 minutos'),(9938,186,0,1625,'0kg'),(9939,187,0,1625,'50kg'),(9940,188,0,1625,'Turismo '),(9941,73,0,1626,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para ALFA ROMEO, 156 Crosswagon Q4 , 01/2004 - 12/2007'),(9942,84,0,1626,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para ALFA ROMEO, 156 Crosswagon Q4 , 01/2004 - 12/2007'),(9943,86,0,1626,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en ALFA ROMEO, 156 Crosswagon Q4  y matriculado 01/2004 - 12/2007.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excel'),(9944,106,0,1626,'container2'),(9945,120,0,1626,'0'),(9946,123,0,1626,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-alfa-romeo,-156-crosswagon-q4-,-01-2004---12-2007ei0063'),(9947,154,0,1626,'1'),(9948,155,0,1626,'1'),(9949,182,0,1626,'01/2004 - 12/2007'),(9950,184,0,1626,'1800kg'),(9951,185,0,1626,'30-60 minutos'),(9952,186,0,1626,'9,36kg'),(9953,187,0,1626,'65kg'),(9954,188,0,1626,'Crosswagon Q4 '),(9955,73,0,1627,'Enganche de Remolque LaFuente Bola desmontable Horizontal para ALFA ROMEO, 156 Crosswagon Q4 , 01/2004 - 12/2007'),(9956,84,0,1627,'Enganche de Remolque LaFuente Bola desmontable Horizontal para ALFA ROMEO, 156 Crosswagon Q4 , 01/2004 - 12/2007'),(9957,86,0,1627,'Enganche LaFuente desmontable horizontal ideal para remolque en ALFA ROMEO, 156 Crosswagon Q4  y matriculado 01/2004 - 12/2007.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña el'),(9958,106,0,1627,'container2'),(9959,120,0,1627,'0'),(9960,123,0,1627,'enganche-de-remolque-lafuente-bola-desmontable-horizontal-para-alfa-romeo,-156-crosswagon-q4-,-01-2004---12-2007ei1063'),(9961,154,0,1627,'1'),(9962,155,0,1627,'1'),(9963,182,0,1627,'01/2004 - 12/2007'),(9964,184,0,1627,'1800kg'),(9965,185,0,1627,'30-60 minutos'),(9966,186,0,1627,'9,36kg'),(9967,187,0,1627,'65kg'),(9968,188,0,1627,'Crosswagon Q4 '),(9969,73,0,1628,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para ALFA ROMEO, 156 Familiar , 01/2000 - 08/2005'),(9970,84,0,1628,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para ALFA ROMEO, 156 Familiar , 01/2000 - 08/2005'),(9971,86,0,1628,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en ALFA ROMEO, 156 Familiar  y matriculado 01/2000 - 08/2005.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente '),(9972,106,0,1628,'container2'),(9973,120,0,1628,'0'),(9974,123,0,1628,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-alfa-romeo,-156-familiar-,-01-2000---08-2005ei0062'),(9975,154,0,1628,'1'),(9976,155,0,1628,'1'),(9977,182,0,1628,'01/2000 - 08/2005'),(9978,184,0,1628,'1900kg'),(9979,185,0,1628,'30-60 minutos'),(9980,186,0,1628,'9kg'),(9981,187,0,1628,'60kg'),(9982,188,0,1628,'Familiar '),(9983,73,0,1629,'Enganche de Remolque LaFuente Bola desmontable Horizontal para ALFA ROMEO, 156 Familiar , 01/2000 - 08/2005'),(9984,84,0,1629,'Enganche de Remolque LaFuente Bola desmontable Horizontal para ALFA ROMEO, 156 Familiar , 01/2000 - 08/2005'),(9985,86,0,1629,'Enganche LaFuente desmontable horizontal ideal para remolque en ALFA ROMEO, 156 Familiar  y matriculado 01/2000 - 08/2005.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctri'),(9986,106,0,1629,'container2'),(9987,120,0,1629,'0'),(9988,123,0,1629,'enganche-de-remolque-lafuente-bola-desmontable-horizontal-para-alfa-romeo,-156-familiar-,-01-2000---08-2005ei1062'),(9989,154,0,1629,'1'),(9990,155,0,1629,'1'),(9991,182,0,1629,'01/2000 - 08/2005'),(9992,184,0,1629,'1900kg'),(9993,185,0,1629,'30-60 minutos'),(9994,186,0,1629,'9kg'),(9995,187,0,1629,'60kg'),(9996,188,0,1629,'Familiar '),(9997,73,0,1630,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para ALFA ROMEO, 156 Sedan , 01/1997 - 08/2005'),(9998,84,0,1630,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para ALFA ROMEO, 156 Sedan , 01/1997 - 08/2005'),(9999,86,0,1630,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en ALFA ROMEO, 156 Sedan  y matriculado 01/1997 - 08/2005.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente rel'),(10000,106,0,1630,'container2'),(10001,120,0,1630,'0'),(10002,123,0,1630,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-alfa-romeo,-156-sedan-,-01-1997---08-2005ei0062'),(10003,154,0,1630,'1'),(10004,155,0,1630,'1'),(10005,182,0,1630,'01/1997 - 08/2005'),(10006,184,0,1630,'1900kg'),(10007,185,0,1630,'30-60 minutos'),(10008,186,0,1630,'9kg'),(10009,187,0,1630,'60kg'),(10010,188,0,1630,'Sedan '),(10011,73,0,1631,'Enganche de Remolque LaFuente Bola desmontable Horizontal para ALFA ROMEO, 156 Sedan , 01/1997 - 08/2005'),(10012,84,0,1631,'Enganche de Remolque LaFuente Bola desmontable Horizontal para ALFA ROMEO, 156 Sedan , 01/1997 - 08/2005'),(10013,86,0,1631,'Enganche LaFuente desmontable horizontal ideal para remolque en ALFA ROMEO, 156 Sedan  y matriculado 01/1997 - 08/2005.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica '),(10014,106,0,1631,'container2'),(10015,120,0,1631,'0'),(10016,123,0,1631,'enganche-de-remolque-lafuente-bola-desmontable-horizontal-para-alfa-romeo,-156-sedan-,-01-1997---08-2005ei1062'),(10017,154,0,1631,'1'),(10018,155,0,1631,'1'),(10019,182,0,1631,'01/1997 - 08/2005'),(10020,184,0,1631,'1900kg'),(10021,185,0,1631,'30-60 minutos'),(10022,186,0,1631,'9kg'),(10023,187,0,1631,'60kg'),(10024,188,0,1631,'Sedan '),(10025,73,0,1632,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para ALFA ROMEO, 159 Familiar , 09/2005 - 12/2011'),(10026,84,0,1632,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para ALFA ROMEO, 159 Familiar , 09/2005 - 12/2011'),(10027,86,0,1632,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en ALFA ROMEO, 159 Familiar  y matriculado 09/2005 - 12/2011.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente '),(10028,106,0,1632,'container2'),(10029,120,0,1632,'0'),(10030,123,0,1632,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-alfa-romeo,-159-familiar-,-09-2005---12-2011ei0064'),(10031,154,0,1632,'1'),(10032,155,0,1632,'1'),(10033,182,0,1632,'09/2005 - 12/2011'),(10034,184,0,1632,'1800kg'),(10035,185,0,1632,'60-90 minutos'),(10036,186,0,1632,'10kg'),(10037,187,0,1632,'85kg'),(10038,188,0,1632,'Familiar '),(10039,73,0,1633,'Enganche de Remolque LaFuente Bola desmontable Horizontal para ALFA ROMEO, 159 Familiar , 09/2005 - 12/2011'),(10040,84,0,1633,'Enganche de Remolque LaFuente Bola desmontable Horizontal para ALFA ROMEO, 159 Familiar , 09/2005 - 12/2011'),(10041,86,0,1633,'Enganche LaFuente desmontable horizontal ideal para remolque en ALFA ROMEO, 159 Familiar  y matriculado 09/2005 - 12/2011.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctri'),(10042,106,0,1633,'container2'),(10043,120,0,1633,'0'),(10044,123,0,1633,'enganche-de-remolque-lafuente-bola-desmontable-horizontal-para-alfa-romeo,-159-familiar-,-09-2005---12-2011ei1064'),(10045,154,0,1633,'1'),(10046,155,0,1633,'1'),(10047,182,0,1633,'09/2005 - 12/2011'),(10048,184,0,1633,'1850kg'),(10049,185,0,1633,'60-90 minutos'),(10050,186,0,1633,'10kg'),(10051,187,0,1633,'85kg'),(10052,188,0,1633,'Familiar '),(10053,73,0,1634,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para ALFA ROMEO, 159 Sedan , 09/2005 - 12/2011'),(10054,84,0,1634,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para ALFA ROMEO, 159 Sedan , 09/2005 - 12/2011'),(10055,86,0,1634,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en ALFA ROMEO, 159 Sedan  y matriculado 09/2005 - 12/2011.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente rel'),(10056,106,0,1634,'container2'),(10057,120,0,1634,'0'),(10058,123,0,1634,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-alfa-romeo,-159-sedan-,-09-2005---12-2011ei0064'),(10059,154,0,1634,'1'),(10060,155,0,1634,'1'),(10061,182,0,1634,'09/2005 - 12/2011'),(10062,184,0,1634,'1800kg'),(10063,185,0,1634,'60-90 minutos'),(10064,186,0,1634,'10kg'),(10065,187,0,1634,'85kg'),(10066,188,0,1634,'Sedan '),(10067,73,0,1635,'Enganche de Remolque LaFuente Bola desmontable Horizontal para ALFA ROMEO, 159 Sedan , 09/2005 - 12/2011'),(10068,84,0,1635,'Enganche de Remolque LaFuente Bola desmontable Horizontal para ALFA ROMEO, 159 Sedan , 09/2005 - 12/2011'),(10069,86,0,1635,'Enganche LaFuente desmontable horizontal ideal para remolque en ALFA ROMEO, 159 Sedan  y matriculado 09/2005 - 12/2011.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica '),(10070,106,0,1635,'container2'),(10071,120,0,1635,'0'),(10072,123,0,1635,'enganche-de-remolque-lafuente-bola-desmontable-horizontal-para-alfa-romeo,-159-sedan-,-09-2005---12-2011ei1064'),(10073,154,0,1635,'1'),(10074,155,0,1635,'1'),(10075,182,0,1635,'09/2005 - 12/2011'),(10076,184,0,1635,'1850kg'),(10077,185,0,1635,'60-90 minutos'),(10078,186,0,1635,'10kg'),(10079,187,0,1635,'85kg'),(10080,188,0,1635,'Sedan '),(10081,73,0,1636,'Enganche de Remolque LaFuente Bola desmontable Horizontal para ALFA ROMEO, 166 Turismo , 01/1998 - 12/2007'),(10082,84,0,1636,'Enganche de Remolque LaFuente Bola desmontable Horizontal para ALFA ROMEO, 166 Turismo , 01/1998 - 12/2007'),(10083,86,0,1636,'Enganche LaFuente desmontable horizontal ideal para remolque en ALFA ROMEO, 166 Turismo  y matriculado 01/1998 - 12/2007.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctric'),(10084,106,0,1636,'container2'),(10085,120,0,1636,'0'),(10086,123,0,1636,'enganche-de-remolque-lafuente-bola-desmontable-horizontal-para-alfa-romeo,-166-turismo-,-01-1998---12-2007ei1065'),(10087,154,0,1636,'1'),(10088,155,0,1636,'1'),(10089,182,0,1636,'01/1998 - 12/2007'),(10090,184,0,1636,'1800kg'),(10091,185,0,1636,'>90 minutos'),(10092,186,0,1636,'10kg'),(10093,187,0,1636,'75kg'),(10094,188,0,1636,'Turismo '),(10095,73,0,1637,'Enganche de Remolque LaFuente Bola Fija Mono-Block / Placa (Fija) para ALFA ROMEO y 33 Turismo , 01/1983 - 12/1994'),(10096,84,0,1637,'Enganche de Remolque LaFuente Bola Fija Mono-Block / Placa (Fija) para ALFA ROMEO y 33 Turismo , 01/1983 - 12/1994'),(10097,86,0,1637,'Enganche bola fija mono-block LaFuente para remolque en vehículos comerciales y 4x4  ALFA ROMEO, 33 Turismo  y matriculado 01/1983 - 12/1994.\r\n<br/>\r\nEs el modelo de enganche que por sus características se suele utilizar más en 4x4 y en vehículos comercia'),(10098,106,0,1637,'container2'),(10099,120,0,1637,'0'),(10100,123,0,1637,'enganche-de-remolque-lafuente-bola-fija-mono-block---placa-(fija)-para-alfa-romeo-y-33-turismo-,-01-1983---12-1994e00002'),(10101,154,0,1637,'1'),(10102,155,0,1637,'1'),(10103,182,0,1637,'01/1983 - 12/1994'),(10104,184,0,1637,'1200kg'),(10105,185,0,1637,'30-60 minutos'),(10106,186,0,1637,'0kg'),(10107,187,0,1637,'50kg'),(10108,188,0,1637,'Turismo '),(10109,73,0,1638,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para ALFA ROMEO, Giulia Sedan , 01/2016 - 04/2021'),(10110,84,0,1638,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para ALFA ROMEO, Giulia Sedan , 01/2016 - 04/2021'),(10111,86,0,1638,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en ALFA ROMEO, Giulia Sedan  y matriculado 01/2016 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente '),(10112,106,0,1638,'container2'),(10113,120,0,1638,'0'),(10114,123,0,1638,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-alfa-romeo,-giulia-sedan-,-01-2016---04-2021ei0642'),(10115,154,0,1638,'1'),(10116,155,0,1638,'1'),(10117,182,0,1638,'01/2016 - 04/2021'),(10118,184,0,1638,'1600kg'),(10119,185,0,1638,'60-90 minutos'),(10120,186,0,1638,'9kg'),(10121,187,0,1638,'95kg'),(10122,188,0,1638,'Sedan '),(10123,73,0,1639,'Enganche de Remolque LaFuente Bola desmontable Horizontal para ALFA ROMEO, Giulia Sedan , 01/2016 - 04/2021'),(10124,84,0,1639,'Enganche de Remolque LaFuente Bola desmontable Horizontal para ALFA ROMEO, Giulia Sedan , 01/2016 - 04/2021'),(10125,86,0,1639,'Enganche LaFuente desmontable horizontal ideal para remolque en ALFA ROMEO, Giulia Sedan  y matriculado 01/2016 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctri'),(10126,106,0,1639,'container2'),(10127,120,0,1639,'0'),(10128,123,0,1639,'enganche-de-remolque-lafuente-bola-desmontable-horizontal-para-alfa-romeo,-giulia-sedan-,-01-2016---04-2021ei1642'),(10129,154,0,1639,'1'),(10130,155,0,1639,'1'),(10131,182,0,1639,'01/2016 - 04/2021'),(10132,184,0,1639,'1600kg'),(10133,185,0,1639,'60-90 minutos'),(10134,186,0,1639,'9kg'),(10135,187,0,1639,'95kg'),(10136,188,0,1639,'Sedan '),(10137,73,0,1640,'Enganche de Remolque LaFuente Bola desmontable Vertical para ALFA ROMEO y Giulia Sedan , 01/2016 - 04/2021'),(10138,84,0,1640,'Enganche de Remolque LaFuente Bola desmontable Vertical para ALFA ROMEO y Giulia Sedan , 01/2016 - 04/2021'),(10139,86,0,1640,'Bola de remolque LaFuente desmontable vertical ideal para remolque en ALFA ROMEO, Giulia Sedan  y matriculado 01/2016 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche desmontable más cómodo y avanzado, se monta y desmonta en segundos sin ninguna herramienta. L'),(10140,106,0,1640,'container2'),(10141,120,0,1640,'0'),(10142,123,0,1640,'enganche-de-remolque-lafuente-bola-desmontable-vertical-para-alfa-romeo-y-giulia-sedan-,-01-2016---04-2021ei4642'),(10143,154,0,1640,'1'),(10144,155,0,1640,'1'),(10145,182,0,1640,'01/2016 - 04/2021'),(10146,184,0,1640,'1600kg'),(10147,185,0,1640,'60-90 minutos'),(10148,186,0,1640,'9kg'),(10149,187,0,1640,'95kg'),(10150,188,0,1640,'Sedan '),(10151,73,0,1641,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para ALFA ROMEO, Giulietta Berlina , 06/2010 - 04/2021'),(10152,84,0,1641,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para ALFA ROMEO, Giulietta Berlina , 06/2010 - 04/2021'),(10153,86,0,1641,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en ALFA ROMEO, Giulietta Berlina  y matriculado 06/2010 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excel'),(10154,106,0,1641,'container2'),(10155,120,0,1641,'0'),(10156,123,0,1641,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-alfa-romeo,-giulietta-berlina-,-06-2010---04-2021ei0052'),(10157,154,0,1641,'1'),(10158,155,0,1641,'1'),(10159,182,0,1641,'06/2010 - 04/2021'),(10160,184,0,1641,'1300kg'),(10161,185,0,1641,'60-90 minutos'),(10162,186,0,1641,'7,7kg'),(10163,187,0,1641,'60kg'),(10164,188,0,1641,'Berlina '),(10165,73,0,1642,'Enganche de Remolque LaFuente Bola desmontable Horizontal para ALFA ROMEO, Giulietta Berlina , 06/2010 - 04/2021'),(10166,84,0,1642,'Enganche de Remolque LaFuente Bola desmontable Horizontal para ALFA ROMEO, Giulietta Berlina , 06/2010 - 04/2021'),(10167,86,0,1642,'Enganche LaFuente desmontable horizontal ideal para remolque en ALFA ROMEO, Giulietta Berlina  y matriculado 06/2010 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña el'),(10168,106,0,1642,'container2'),(10169,120,0,1642,'0'),(10170,123,0,1642,'enganche-de-remolque-lafuente-bola-desmontable-horizontal-para-alfa-romeo,-giulietta-berlina-,-06-2010---04-2021ei1052'),(10171,154,0,1642,'1'),(10172,155,0,1642,'1'),(10173,182,0,1642,'06/2010 - 04/2021'),(10174,184,0,1642,'1300kg'),(10175,185,0,1642,'60-90 minutos'),(10176,186,0,1642,'7,7kg'),(10177,187,0,1642,'60kg'),(10178,188,0,1642,'Berlina '),(10179,73,0,1643,'Enganche de Remolque LaFuente Bola desmontable Vertical para ALFA ROMEO y Giulietta Berlina , 06/2010 - 04/2021'),(10180,84,0,1643,'Enganche de Remolque LaFuente Bola desmontable Vertical para ALFA ROMEO y Giulietta Berlina , 06/2010 - 04/2021'),(10181,86,0,1643,'Bola de remolque LaFuente desmontable vertical ideal para remolque en ALFA ROMEO, Giulietta Berlina  y matriculado 06/2010 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche desmontable más cómodo y avanzado, se monta y desmonta en segundos sin ninguna herramien'),(10182,106,0,1643,'container2'),(10183,120,0,1643,'0'),(10184,123,0,1643,'enganche-de-remolque-lafuente-bola-desmontable-vertical-para-alfa-romeo-y-giulietta-berlina-,-06-2010---04-2021ei4052'),(10185,154,0,1643,'1'),(10186,155,0,1643,'1'),(10187,182,0,1643,'06/2010 - 04/2021'),(10188,184,0,1643,'1300kg'),(10189,185,0,1643,'60-90 minutos'),(10190,186,0,1643,'7,7kg'),(10191,187,0,1643,'60kg'),(10192,188,0,1643,'Berlina '),(10193,73,0,1644,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para ALFA ROMEO, GT Coupe , 01/2004 - 12/2010'),(10194,84,0,1644,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para ALFA ROMEO, GT Coupe , 01/2004 - 12/2010'),(10195,86,0,1644,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en ALFA ROMEO, GT Coupe  y matriculado 01/2004 - 12/2010.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente rela'),(10196,106,0,1644,'container2'),(10197,120,0,1644,'0'),(10198,123,0,1644,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-alfa-romeo,-gt-coupe-,-01-2004---12-2010ei0066'),(10199,154,0,1644,'1'),(10200,155,0,1644,'1'),(10201,182,0,1644,'01/2004 - 12/2010'),(10202,184,0,1644,'1850kg'),(10203,185,0,1644,'>90 minutos'),(10204,186,0,1644,'9kg'),(10205,187,0,1644,'75kg'),(10206,188,0,1644,'Coupe '),(10207,73,0,1645,'Enganche de Remolque LaFuente Bola desmontable Horizontal para ALFA ROMEO, GT Coupe , 01/2004 - 12/2010'),(10208,84,0,1645,'Enganche de Remolque LaFuente Bola desmontable Horizontal para ALFA ROMEO, GT Coupe , 01/2004 - 12/2010'),(10209,86,0,1645,'Enganche LaFuente desmontable horizontal ideal para remolque en ALFA ROMEO, GT Coupe  y matriculado 01/2004 - 12/2010.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica q'),(10210,106,0,1645,'container2'),(10211,120,0,1645,'0'),(10212,123,0,1645,'enganche-de-remolque-lafuente-bola-desmontable-horizontal-para-alfa-romeo,-gt-coupe-,-01-2004---12-2010ei1066'),(10213,154,0,1645,'1'),(10214,155,0,1645,'1'),(10215,182,0,1645,'01/2004 - 12/2010'),(10216,184,0,1645,'1850kg'),(10217,185,0,1645,'>90 minutos'),(10218,186,0,1645,'9kg'),(10219,187,0,1645,'75kg'),(10220,188,0,1645,'Coupe '),(10221,73,0,1646,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para ALFA ROMEO, Mito Turismo , 01/2008 - 04/2021'),(10222,84,0,1646,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para ALFA ROMEO, Mito Turismo , 01/2008 - 04/2021'),(10223,86,0,1646,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en ALFA ROMEO, Mito Turismo  y matriculado 01/2008 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente '),(10224,106,0,1646,'container2'),(10225,120,0,1646,'0'),(10226,123,0,1646,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-alfa-romeo,-mito-turismo-,-01-2008---04-2021ee0276'),(10227,154,0,1646,'1'),(10228,155,0,1646,'1'),(10229,182,0,1646,'01/2008 - 04/2021'),(10230,184,0,1646,'1100kg'),(10231,185,0,1646,'30-60 minutos'),(10232,186,0,1646,'6,7kg'),(10233,187,0,1646,'60kg'),(10234,188,0,1646,'Turismo '),(10235,73,0,1647,'Enganche de Remolque LaFuente Bola desmontable Horizontal para ALFA ROMEO, Mito Turismo , 01/2008 - 04/2021'),(10236,84,0,1647,'Enganche de Remolque LaFuente Bola desmontable Horizontal para ALFA ROMEO, Mito Turismo , 01/2008 - 04/2021'),(10237,86,0,1647,'Enganche LaFuente desmontable horizontal ideal para remolque en ALFA ROMEO, Mito Turismo  y matriculado 01/2008 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctri'),(10238,106,0,1647,'container2'),(10239,120,0,1647,'0'),(10240,123,0,1647,'enganche-de-remolque-lafuente-bola-desmontable-horizontal-para-alfa-romeo,-mito-turismo-,-01-2008---04-2021ee1276'),(10241,154,0,1647,'1'),(10242,155,0,1647,'1'),(10243,182,0,1647,'01/2008 - 04/2021'),(10244,184,0,1647,'1100kg'),(10245,185,0,1647,'30-60 minutos'),(10246,186,0,1647,'6,7kg'),(10247,187,0,1647,'60kg'),(10248,188,0,1647,'Turismo '),(10249,73,0,1648,'Enganche de Remolque LaFuente Bola Fija Mono-Block / Placa (Fija) para ALFA ROMEO y Sprint Coupe , 01/1983 - 12/1994'),(10250,84,0,1648,'Enganche de Remolque LaFuente Bola Fija Mono-Block / Placa (Fija) para ALFA ROMEO y Sprint Coupe , 01/1983 - 12/1994'),(10251,86,0,1648,'Enganche bola fija mono-block LaFuente para remolque en vehículos comerciales y 4x4  ALFA ROMEO, Sprint Coupe  y matriculado 01/1983 - 12/1994.\r\n<br/>\r\nEs el modelo de enganche que por sus características se suele utilizar más en 4x4 y en vehículos comerc'),(10252,106,0,1648,'container2'),(10253,120,0,1648,'0'),(10254,123,0,1648,'enganche-de-remolque-lafuente-bola-fija-mono-block---placa-(fija)-para-alfa-romeo-y-sprint-coupe-,-01-1983---12-1994e00002'),(10255,154,0,1648,'1'),(10256,155,0,1648,'1'),(10257,182,0,1648,'01/1983 - 12/1994'),(10258,184,0,1648,'1200kg'),(10259,185,0,1648,'30-60 minutos'),(10260,186,0,1648,'0kg'),(10261,187,0,1648,'50kg'),(10262,188,0,1648,'Coupe '),(10263,73,0,1649,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para ALFA ROMEO, Stelvio SUV , 01/2016 - 04/2021'),(10264,84,0,1649,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para ALFA ROMEO, Stelvio SUV , 01/2016 - 04/2021'),(10265,86,0,1649,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en ALFA ROMEO, Stelvio SUV  y matriculado 01/2016 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente r'),(10266,106,0,1649,'container2'),(10267,120,0,1649,'0'),(10268,123,0,1649,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-alfa-romeo,-stelvio-suv-,-01-2016---04-2021ei0629'),(10269,154,0,1649,'1'),(10270,155,0,1649,'1'),(10271,182,0,1649,'01/2016 - 04/2021'),(10272,184,0,1649,'2300kg'),(10273,185,0,1649,'60-90 minutos'),(10274,186,0,1649,'11,4kg'),(10275,187,0,1649,'120kg'),(10276,188,0,1649,'SUV '),(10277,73,0,1650,'Enganche de Remolque LaFuente Bola desmontable Horizontal para ALFA ROMEO, Stelvio SUV , 01/2016 - 04/2021'),(10278,84,0,1650,'Enganche de Remolque LaFuente Bola desmontable Horizontal para ALFA ROMEO, Stelvio SUV , 01/2016 - 04/2021'),(10279,86,0,1650,'Enganche LaFuente desmontable horizontal ideal para remolque en ALFA ROMEO, Stelvio SUV  y matriculado 01/2016 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctric'),(10280,106,0,1650,'container2'),(10281,120,0,1650,'0'),(10282,123,0,1650,'enganche-de-remolque-lafuente-bola-desmontable-horizontal-para-alfa-romeo,-stelvio-suv-,-01-2016---04-2021ei1629'),(10283,154,0,1650,'1'),(10284,155,0,1650,'1'),(10285,182,0,1650,'01/2016 - 04/2021'),(10286,184,0,1650,'2300kg'),(10287,185,0,1650,'60-90 minutos'),(10288,186,0,1650,'11,4kg'),(10289,187,0,1650,'120kg'),(10290,188,0,1650,'SUV '),(10291,73,0,1651,'Enganche de Remolque LaFuente Bola desmontable Vertical para ALFA ROMEO y Stelvio SUV , 01/2016 - 04/2021'),(10292,84,0,1651,'Enganche de Remolque LaFuente Bola desmontable Vertical para ALFA ROMEO y Stelvio SUV , 01/2016 - 04/2021'),(10293,86,0,1651,'Bola de remolque LaFuente desmontable vertical ideal para remolque en ALFA ROMEO, Stelvio SUV  y matriculado 01/2016 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche desmontable más cómodo y avanzado, se monta y desmonta en segundos sin ninguna herramienta. La'),(10294,106,0,1651,'container2'),(10295,120,0,1651,'0'),(10296,123,0,1651,'enganche-de-remolque-lafuente-bola-desmontable-vertical-para-alfa-romeo-y-stelvio-suv-,-01-2016---04-2021ei4629'),(10297,154,0,1651,'1'),(10298,155,0,1651,'1'),(10299,182,0,1651,'01/2016 - 04/2021'),(10300,184,0,1651,'2300kg'),(10301,185,0,1651,'60-90 minutos'),(10302,186,0,1651,'11,4kg'),(10303,187,0,1651,'120kg'),(10304,188,0,1651,'SUV '),(10305,73,0,1652,'Enganche de Remolque LaFuente Bola Fija Mono-Block / Placa (Fija) para AUDI y  80 Berlina , 01/1983 - 12/1991'),(10306,84,0,1652,'Enganche de Remolque LaFuente Bola Fija Mono-Block / Placa (Fija) para AUDI y  80 Berlina , 01/1983 - 12/1991'),(10307,86,0,1652,'Enganche bola fija mono-block LaFuente para remolque en vehículos comerciales y 4x4  AUDI,  80 Berlina  y matriculado 01/1983 - 12/1991.\r\n<br/>\r\nEs el modelo de enganche que por sus características se suele utilizar más en 4x4 y en vehículos comerciales. '),(10308,106,0,1652,'container2'),(10309,120,0,1652,'0'),(10310,123,0,1652,'enganche-de-remolque-lafuente-bola-fija-mono-block---placa-(fija)-para-audi-y--80-berlina-,-01-1983---12-1991e00012'),(10311,154,0,1652,'1'),(10312,155,0,1652,'1'),(10313,182,0,1652,'01/1983 - 12/1991'),(10314,184,0,1652,'1200kg'),(10315,185,0,1652,'30-60 minutos'),(10316,186,0,1652,'0kg'),(10317,187,0,1652,'50kg'),(10318,188,0,1652,'Berlina '),(10319,73,0,1653,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI,  80 Berlina , 01/1992 - 12/1997'),(10320,84,0,1653,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI,  80 Berlina , 01/1992 - 12/1997'),(10321,86,0,1653,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI,  80 Berlina  y matriculado 01/1992 - 12/1997.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relació'),(10322,106,0,1653,'container2'),(10323,120,0,1653,'0'),(10324,123,0,1653,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-audi,--80-berlina-,-01-1992---12-1997e00501'),(10325,154,0,1653,'1'),(10326,155,0,1653,'1'),(10327,182,0,1653,'01/1992 - 12/1997'),(10328,184,0,1653,'1200kg'),(10329,185,0,1653,'30-60 minutos'),(10330,186,0,1653,'0kg'),(10331,187,0,1653,'50kg'),(10332,188,0,1653,'Berlina '),(10333,73,0,1654,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI,  80 Coupe , 01/1992 - 12/1997'),(10334,84,0,1654,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI,  80 Coupe , 01/1992 - 12/1997'),(10335,86,0,1654,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI,  80 Coupe  y matriculado 01/1992 - 12/1997.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación '),(10336,106,0,1654,'container2'),(10337,120,0,1654,'0'),(10338,123,0,1654,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-audi,--80-coupe-,-01-1992---12-1997e00501a'),(10339,154,0,1654,'1'),(10340,155,0,1654,'1'),(10341,182,0,1654,'01/1992 - 12/1997'),(10342,184,0,1654,'1200kg'),(10343,185,0,1654,'30-60 minutos'),(10344,186,0,1654,'0kg'),(10345,187,0,1654,'50kg'),(10346,188,0,1654,'Coupe '),(10347,73,0,1655,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI,  80 Familiar , 01/1992 - 12/1997'),(10348,84,0,1655,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI,  80 Familiar , 01/1992 - 12/1997'),(10349,86,0,1655,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI,  80 Familiar  y matriculado 01/1992 - 12/1997.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relaci'),(10350,106,0,1655,'container2'),(10351,120,0,1655,'0'),(10352,123,0,1655,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-audi,--80-familiar-,-01-1992---12-1997e00501'),(10353,154,0,1655,'1'),(10354,155,0,1655,'1'),(10355,182,0,1655,'01/1992 - 12/1997'),(10356,184,0,1655,'1200kg'),(10357,185,0,1655,'30-60 minutos'),(10358,186,0,1655,'0kg'),(10359,187,0,1655,'50kg'),(10360,188,0,1655,'Familiar '),(10361,73,0,1656,'Enganche de Remolque LaFuente Bola Fija Mono-Block / Placa (Fija) para AUDI y  90 Berlina , 01/1983 - 12/1989'),(10362,84,0,1656,'Enganche de Remolque LaFuente Bola Fija Mono-Block / Placa (Fija) para AUDI y  90 Berlina , 01/1983 - 12/1989'),(10363,86,0,1656,'Enganche bola fija mono-block LaFuente para remolque en vehículos comerciales y 4x4  AUDI,  90 Berlina  y matriculado 01/1983 - 12/1989.\r\n<br/>\r\nEs el modelo de enganche que por sus características se suele utilizar más en 4x4 y en vehículos comerciales. '),(10364,106,0,1656,'container2'),(10365,120,0,1656,'0'),(10366,123,0,1656,'enganche-de-remolque-lafuente-bola-fija-mono-block---placa-(fija)-para-audi-y--90-berlina-,-01-1983---12-1989e00012'),(10367,154,0,1656,'1'),(10368,155,0,1656,'1'),(10369,182,0,1656,'01/1983 - 12/1989'),(10370,184,0,1656,'1200kg'),(10371,185,0,1656,'30-60 minutos'),(10372,186,0,1656,'0kg'),(10373,187,0,1656,'50kg'),(10374,188,0,1656,'Berlina '),(10375,73,0,1657,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI,  90 Berlina , 01/1990 - 12/1997'),(10376,84,0,1657,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI,  90 Berlina , 01/1990 - 12/1997'),(10377,86,0,1657,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI,  90 Berlina  y matriculado 01/1990 - 12/1997.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relació'),(10378,106,0,1657,'container2'),(10379,120,0,1657,'0'),(10380,123,0,1657,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-audi,--90-berlina-,-01-1990---12-1997e00607'),(10381,154,0,1657,'1'),(10382,155,0,1657,'1'),(10383,182,0,1657,'01/1990 - 12/1997'),(10384,184,0,1657,'1200kg'),(10385,185,0,1657,'<30 minutos'),(10386,186,0,1657,'0kg'),(10387,187,0,1657,'50kg'),(10388,188,0,1657,'Berlina '),(10389,73,0,1658,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, 100 Avant , 01/1991 - 12/1997'),(10390,84,0,1658,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, 100 Avant , 01/1991 - 12/1997'),(10391,86,0,1658,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, 100 Avant  y matriculado 01/1991 - 12/1997.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación '),(10392,106,0,1658,'container2'),(10393,120,0,1658,'0'),(10394,123,0,1658,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-audi,-100-avant-,-01-1991---12-1997ei0499'),(10395,154,0,1658,'1'),(10396,155,0,1658,'1'),(10397,182,0,1658,'01/1991 - 12/1997'),(10398,184,0,1658,'2100kg'),(10399,185,0,1658,'60-90 minutos'),(10400,186,0,1658,'11kg'),(10401,187,0,1658,'75kg'),(10402,188,0,1658,'Avant '),(10403,73,0,1659,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, 100 Berlina , 01/1982 - 12/1990'),(10404,84,0,1659,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, 100 Berlina , 01/1982 - 12/1990'),(10405,86,0,1659,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, 100 Berlina  y matriculado 01/1982 - 12/1990.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relació'),(10406,106,0,1659,'container2'),(10407,120,0,1659,'0'),(10408,123,0,1659,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-audi,-100-berlina-,-01-1982---12-1990e00502'),(10409,154,0,1659,'1'),(10410,155,0,1659,'1'),(10411,182,0,1659,'01/1982 - 12/1990'),(10412,184,0,1659,'1200kg'),(10413,185,0,1659,'30-60 minutos'),(10414,186,0,1659,'0kg'),(10415,187,0,1659,'50kg'),(10416,188,0,1659,'Berlina '),(10417,73,0,1660,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, 100 Berlina , 01/1991 - 12/1997'),(10418,84,0,1660,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, 100 Berlina , 01/1991 - 12/1997'),(10419,86,0,1660,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, 100 Berlina  y matriculado 01/1991 - 12/1997.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relació'),(10420,106,0,1660,'container2'),(10421,120,0,1660,'0'),(10422,123,0,1660,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-audi,-100-berlina-,-01-1991---12-1997e00595'),(10423,154,0,1660,'1'),(10424,155,0,1660,'1'),(10425,182,0,1660,'01/1991 - 12/1997'),(10426,184,0,1660,'1200kg'),(10427,185,0,1660,'30-60 minutos'),(10428,186,0,1660,'0kg'),(10429,187,0,1660,'50kg'),(10430,188,0,1660,'Berlina '),(10431,73,0,1661,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, 100 Berlina , 01/1991 - 12/1997'),(10432,84,0,1661,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, 100 Berlina , 01/1991 - 12/1997'),(10433,86,0,1661,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, 100 Berlina  y matriculado 01/1991 - 12/1997.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relació'),(10434,106,0,1661,'container2'),(10435,120,0,1661,'0'),(10436,123,0,1661,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-audi,-100-berlina-,-01-1991---12-1997ei0499'),(10437,154,0,1661,'1'),(10438,155,0,1661,'1'),(10439,182,0,1661,'01/1991 - 12/1997'),(10440,184,0,1661,'2100kg'),(10441,185,0,1661,'60-90 minutos'),(10442,186,0,1661,'11kg'),(10443,187,0,1661,'75kg'),(10444,188,0,1661,'Berlina '),(10445,73,0,1662,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A1 3 Puertas , 08/2010 - 09/2018'),(10446,84,0,1662,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A1 3 Puertas , 08/2010 - 09/2018'),(10447,86,0,1662,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A1 3 Puertas  y matriculado 08/2010 - 09/2018.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relaci'),(10448,106,0,1662,'container2'),(10449,120,0,1662,'0'),(10450,123,0,1662,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-audi,-a1-3-puertas-,-08-2010---09-2018ee0307'),(10451,154,0,1662,'1'),(10452,155,0,1662,'1'),(10453,182,0,1662,'08/2010 - 09/2018'),(10454,184,0,1662,'1300kg'),(10455,185,0,1662,'30-60 minutos'),(10456,186,0,1662,'7,23kg'),(10457,187,0,1662,'80kg'),(10458,188,0,1662,'3 Puertas '),(10459,73,0,1663,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A1 3 Puertas , 08/2010 - 09/2018'),(10460,84,0,1663,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A1 3 Puertas , 08/2010 - 09/2018'),(10461,86,0,1663,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A1 3 Puertas  y matriculado 08/2010 - 09/2018.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica que'),(10462,106,0,1663,'container2'),(10463,120,0,1663,'0'),(10464,123,0,1663,'enganche-de-remolque-lafuente-bola-desmontable-horizontal-para-audi,-a1-3-puertas-,-08-2010---09-2018ee1307'),(10465,154,0,1663,'1'),(10466,155,0,1663,'1'),(10467,182,0,1663,'08/2010 - 09/2018'),(10468,184,0,1663,'1300kg'),(10469,185,0,1663,'30-60 minutos'),(10470,186,0,1663,'7,23kg'),(10471,187,0,1663,'80kg'),(10472,188,0,1663,'3 Puertas '),(10473,73,0,1664,'Enganche de Remolque LaFuente Bola desmontable Vertical para AUDI y A1 3 Puertas , 08/2010 - 09/2018'),(10474,84,0,1664,'Enganche de Remolque LaFuente Bola desmontable Vertical para AUDI y A1 3 Puertas , 08/2010 - 09/2018'),(10475,86,0,1664,'Bola de remolque LaFuente desmontable vertical ideal para remolque en AUDI, A1 3 Puertas  y matriculado 08/2010 - 09/2018.\r\n<br/>\r\nEs el modelo de enganche desmontable más cómodo y avanzado, se monta y desmonta en segundos sin ninguna herramienta. La piña'),(10476,106,0,1664,'container2'),(10477,120,0,1664,'0'),(10478,123,0,1664,'enganche-de-remolque-lafuente-bola-desmontable-vertical-para-audi-y-a1-3-puertas-,-08-2010---09-2018ee4307'),(10479,154,0,1664,'1'),(10480,155,0,1664,'1'),(10481,182,0,1664,'08/2010 - 09/2018'),(10482,184,0,1664,'1300kg'),(10483,185,0,1664,'30-60 minutos'),(10484,186,0,1664,'7,23kg'),(10485,187,0,1664,'80kg'),(10486,188,0,1664,'3 Puertas '),(10487,73,0,1665,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A1 5 Puertas , 01/2012 - 09/2018'),(10488,84,0,1665,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A1 5 Puertas , 01/2012 - 09/2018'),(10489,86,0,1665,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A1 5 Puertas  y matriculado 01/2012 - 09/2018.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relaci'),(10490,106,0,1665,'container2'),(10491,120,0,1665,'0'),(10492,123,0,1665,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-audi,-a1-5-puertas-,-01-2012---09-2018ee0307'),(10493,154,0,1665,'1'),(10494,155,0,1665,'1'),(10495,182,0,1665,'01/2012 - 09/2018'),(10496,184,0,1665,'1300kg'),(10497,185,0,1665,'30-60 minutos'),(10498,186,0,1665,'7,23kg'),(10499,187,0,1665,'80kg'),(10500,188,0,1665,'5 Puertas '),(10501,73,0,1666,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A1 5 Puertas , 01/2012 - 09/2018'),(10502,84,0,1666,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A1 5 Puertas , 01/2012 - 09/2018'),(10503,86,0,1666,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A1 5 Puertas  y matriculado 01/2012 - 09/2018.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica que'),(10504,106,0,1666,'container2'),(10505,120,0,1666,'0'),(10506,123,0,1666,'enganche-de-remolque-lafuente-bola-desmontable-horizontal-para-audi,-a1-5-puertas-,-01-2012---09-2018ee1307'),(10507,154,0,1666,'1'),(10508,155,0,1666,'1'),(10509,182,0,1666,'01/2012 - 09/2018'),(10510,184,0,1666,'1300kg'),(10511,185,0,1666,'30-60 minutos'),(10512,186,0,1666,'7,23kg'),(10513,187,0,1666,'80kg'),(10514,188,0,1666,'5 Puertas '),(10515,73,0,1667,'Enganche de Remolque LaFuente Bola desmontable Vertical para AUDI y A1 5 Puertas , 01/2012 - 09/2018'),(10516,84,0,1667,'Enganche de Remolque LaFuente Bola desmontable Vertical para AUDI y A1 5 Puertas , 01/2012 - 09/2018'),(10517,86,0,1667,'Bola de remolque LaFuente desmontable vertical ideal para remolque en AUDI, A1 5 Puertas  y matriculado 01/2012 - 09/2018.\r\n<br/>\r\nEs el modelo de enganche desmontable más cómodo y avanzado, se monta y desmonta en segundos sin ninguna herramienta. La piña'),(10518,106,0,1667,'container2'),(10519,120,0,1667,'0'),(10520,123,0,1667,'enganche-de-remolque-lafuente-bola-desmontable-vertical-para-audi-y-a1-5-puertas-,-01-2012---09-2018ee4307'),(10521,154,0,1667,'1'),(10522,155,0,1667,'1'),(10523,182,0,1667,'01/2012 - 09/2018'),(10524,184,0,1667,'1300kg'),(10525,185,0,1667,'30-60 minutos'),(10526,186,0,1667,'7,23kg'),(10527,187,0,1667,'80kg'),(10528,188,0,1667,'5 Puertas '),(10529,73,0,1668,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A1 Sportback , 01/2012 - 10/2018'),(10530,84,0,1668,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A1 Sportback , 01/2012 - 10/2018'),(10531,86,0,1668,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A1 Sportback  y matriculado 01/2012 - 10/2018.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relaci'),(10532,106,0,1668,'container2'),(10533,120,0,1668,'0'),(10534,123,0,1668,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-audi,-a1-sportback-,-01-2012---10-2018ee0307'),(10535,154,0,1668,'1'),(10536,155,0,1668,'1'),(10537,182,0,1668,'01/2012 - 10/2018'),(10538,184,0,1668,'1300kg'),(10539,185,0,1668,'30-60 minutos'),(10540,186,0,1668,'7,23kg'),(10541,187,0,1668,'80kg'),(10542,188,0,1668,'Sportback '),(10543,73,0,1669,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A1 Sportback , 01/2012 - 10/2018'),(10544,84,0,1669,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A1 Sportback , 01/2012 - 10/2018'),(10545,86,0,1669,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A1 Sportback  y matriculado 01/2012 - 10/2018.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica que'),(10546,106,0,1669,'container2'),(10547,120,0,1669,'0'),(10548,123,0,1669,'enganche-de-remolque-lafuente-bola-desmontable-horizontal-para-audi,-a1-sportback-,-01-2012---10-2018ee1307'),(10549,154,0,1669,'1'),(10550,155,0,1669,'1'),(10551,182,0,1669,'01/2012 - 10/2018'),(10552,184,0,1669,'1300kg'),(10553,185,0,1669,'30-60 minutos'),(10554,186,0,1669,'7,23kg'),(10555,187,0,1669,'80kg'),(10556,188,0,1669,'Sportback '),(10557,73,0,1670,'Enganche de Remolque LaFuente Bola desmontable Vertical para AUDI y A1 Sportback , 01/2012 - 10/2018'),(10558,84,0,1670,'Enganche de Remolque LaFuente Bola desmontable Vertical para AUDI y A1 Sportback , 01/2012 - 10/2018'),(10559,86,0,1670,'Bola de remolque LaFuente desmontable vertical ideal para remolque en AUDI, A1 Sportback  y matriculado 01/2012 - 10/2018.\r\n<br/>\r\nEs el modelo de enganche desmontable más cómodo y avanzado, se monta y desmonta en segundos sin ninguna herramienta. La piña'),(10560,106,0,1670,'container2'),(10561,120,0,1670,'0'),(10562,123,0,1670,'enganche-de-remolque-lafuente-bola-desmontable-vertical-para-audi-y-a1-sportback-,-01-2012---10-2018ee4307'),(10563,154,0,1670,'1'),(10564,155,0,1670,'1'),(10565,182,0,1670,'01/2012 - 10/2018'),(10566,184,0,1670,'1300kg'),(10567,185,0,1670,'30-60 minutos'),(10568,186,0,1670,'7,23kg'),(10569,187,0,1670,'80kg'),(10570,188,0,1670,'Sportback '),(10571,73,0,1671,'Enganche de Remolque LaFuente Bola desmontable Vertical para AUDI y A2 Monovolumen , 01/2000 - 04/2021'),(10572,84,0,1671,'Enganche de Remolque LaFuente Bola desmontable Vertical para AUDI y A2 Monovolumen , 01/2000 - 04/2021'),(10573,86,0,1671,'Bola de remolque LaFuente desmontable vertical ideal para remolque en AUDI, A2 Monovolumen  y matriculado 01/2000 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche desmontable más cómodo y avanzado, se monta y desmonta en segundos sin ninguna herramienta. La pi'),(10574,106,0,1671,'container2'),(10575,120,0,1671,'0'),(10576,123,0,1671,'enganche-de-remolque-lafuente-bola-desmontable-vertical-para-audi-y-a2-monovolumen-,-01-2000---04-2021ei4067'),(10577,154,0,1671,'1'),(10578,155,0,1671,'1'),(10579,182,0,1671,'01/2000 - 04/2021'),(10580,184,0,1671,'1000kg'),(10581,185,0,1671,'30-60 minutos'),(10582,186,0,1671,'6kg'),(10583,187,0,1671,'50kg'),(10584,188,0,1671,'Monovolumen '),(10585,73,0,1672,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 3 Puertas , 01/1996 - 09/2003'),(10586,84,0,1672,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 3 Puertas , 01/1996 - 09/2003'),(10587,86,0,1672,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 3 Puertas  y matriculado 01/1996 - 09/2003.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relaci'),(10588,106,0,1672,'container2'),(10589,120,0,1672,'0'),(10590,123,0,1672,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-audi,-a3-3-puertas-,-01-1996---09-2003ee0039'),(10591,154,0,1672,'1'),(10592,155,0,1672,'1'),(10593,182,0,1672,'01/1996 - 09/2003'),(10594,184,0,1672,'1600kg'),(10595,185,0,1672,'30-60 minutos'),(10596,186,0,1672,'8,62kg'),(10597,187,0,1672,'75kg'),(10598,188,0,1672,'3 Puertas '),(10599,73,0,1673,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A3 3 Puertas , 01/1996 - 09/2003'),(10600,84,0,1673,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A3 3 Puertas , 01/1996 - 09/2003'),(10601,86,0,1673,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A3 3 Puertas  y matriculado 01/1996 - 09/2003.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica que'),(10602,106,0,1673,'container2'),(10603,120,0,1673,'0'),(10604,123,0,1673,'enganche-de-remolque-lafuente-bola-desmontable-horizontal-para-audi,-a3-3-puertas-,-01-1996---09-2003ee1039'),(10605,154,0,1673,'1'),(10606,155,0,1673,'1'),(10607,182,0,1673,'01/1996 - 09/2003'),(10608,184,0,1673,'1600kg'),(10609,185,0,1673,'30-60 minutos'),(10610,186,0,1673,'8,62kg'),(10611,187,0,1673,'75kg'),(10612,188,0,1673,'3 Puertas '),(10613,73,0,1674,'Enganche de Remolque LaFuente Bola desmontable Vertical para AUDI y A3 3 Puertas , 01/1996 - 09/2003'),(10614,84,0,1674,'Enganche de Remolque LaFuente Bola desmontable Vertical para AUDI y A3 3 Puertas , 01/1996 - 09/2003'),(10615,86,0,1674,'Bola de remolque LaFuente desmontable vertical ideal para remolque en AUDI, A3 3 Puertas  y matriculado 01/1996 - 09/2003.\r\n<br/>\r\nEs el modelo de enganche desmontable más cómodo y avanzado, se monta y desmonta en segundos sin ninguna herramienta. La piña'),(10616,106,0,1674,'container2'),(10617,120,0,1674,'0'),(10618,123,0,1674,'enganche-de-remolque-lafuente-bola-desmontable-vertical-para-audi-y-a3-3-puertas-,-01-1996---09-2003ei4068'),(10619,154,0,1674,'1'),(10620,155,0,1674,'1'),(10621,182,0,1674,'01/1996 - 09/2003'),(10622,184,0,1674,'1600kg'),(10623,185,0,1674,'30-60 minutos'),(10624,186,0,1674,'9kg'),(10625,187,0,1674,'75kg'),(10626,188,0,1674,'3 Puertas '),(10627,73,0,1675,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 3 Puertas , 10/2003 - 10/2012'),(10628,84,0,1675,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 3 Puertas , 10/2003 - 10/2012'),(10629,86,0,1675,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 3 Puertas  y matriculado 10/2003 - 10/2012.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relaci'),(10630,106,0,1675,'container2'),(10631,120,0,1675,'0'),(10632,123,0,1675,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-audi,-a3-3-puertas-,-10-2003---10-2012ee0188c'),(10633,154,0,1675,'1'),(10634,155,0,1675,'1'),(10635,182,0,1675,'10/2003 - 10/2012'),(10636,184,0,1675,'1800kg'),(10637,185,0,1675,'30-60 minutos'),(10638,186,0,1675,'9,48kg'),(10639,187,0,1675,'80kg'),(10640,188,0,1675,'3 Puertas '),(10641,73,0,1676,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A3 3 Puertas , 10/2003 - 10/2012'),(10642,84,0,1676,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A3 3 Puertas , 10/2003 - 10/2012'),(10643,86,0,1676,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A3 3 Puertas  y matriculado 10/2003 - 10/2012.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica que'),(10644,106,0,1676,'container2'),(10645,120,0,1676,'0'),(10646,123,0,1676,'enganche-de-remolque-lafuente-bola-desmontable-horizontal-para-audi,-a3-3-puertas-,-10-2003---10-2012ee1188c'),(10647,154,0,1676,'1'),(10648,155,0,1676,'1'),(10649,182,0,1676,'10/2003 - 10/2012'),(10650,184,0,1676,'1800kg'),(10651,185,0,1676,'30-60 minutos'),(10652,186,0,1676,'9,48kg'),(10653,187,0,1676,'80kg'),(10654,188,0,1676,'3 Puertas '),(10655,73,0,1677,'Enganche de Remolque LaFuente Bola desmontable Vertical para AUDI y A3 3 Puertas , 10/2003 - 10/2012'),(10656,84,0,1677,'Enganche de Remolque LaFuente Bola desmontable Vertical para AUDI y A3 3 Puertas , 10/2003 - 10/2012'),(10657,86,0,1677,'Bola de remolque LaFuente desmontable vertical ideal para remolque en AUDI, A3 3 Puertas  y matriculado 10/2003 - 10/2012.\r\n<br/>\r\nEs el modelo de enganche desmontable más cómodo y avanzado, se monta y desmonta en segundos sin ninguna herramienta. La piña'),(10658,106,0,1677,'container2'),(10659,120,0,1677,'0'),(10660,123,0,1677,'enganche-de-remolque-lafuente-bola-desmontable-vertical-para-audi-y-a3-3-puertas-,-10-2003---10-2012ei4070'),(10661,154,0,1677,'1'),(10662,155,0,1677,'1'),(10663,182,0,1677,'10/2003 - 10/2012'),(10664,184,0,1677,'1850kg'),(10665,185,0,1677,'30-60 minutos'),(10666,186,0,1677,'9kg'),(10667,187,0,1677,'80kg'),(10668,188,0,1677,'3 Puertas '),(10669,73,0,1678,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 3 Puertas , 11/2012 - 06/2016'),(10670,84,0,1678,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 3 Puertas , 11/2012 - 06/2016'),(10671,86,0,1678,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 3 Puertas  y matriculado 11/2012 - 06/2016.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relaci'),(10672,106,0,1678,'container2'),(10673,120,0,1678,'0'),(10674,123,0,1678,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-audi,-a3-3-puertas-,-11-2012---06-2016ee0196c'),(10675,154,0,1678,'1'),(10676,155,0,1678,'1'),(10677,182,0,1678,'11/2012 - 06/2016'),(10678,184,0,1678,'1600kg'),(10679,185,0,1678,'30-60 minutos'),(10680,186,0,1678,'8,18kg'),(10681,187,0,1678,'80kg'),(10682,188,0,1678,'3 Puertas '),(10683,73,0,1679,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A3 3 Puertas , 11/2012 - 06/2016'),(10684,84,0,1679,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A3 3 Puertas , 11/2012 - 06/2016'),(10685,86,0,1679,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A3 3 Puertas  y matriculado 11/2012 - 06/2016.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica que'),(10686,106,0,1679,'container2'),(10687,120,0,1679,'0'),(10688,123,0,1679,'enganche-de-remolque-lafuente-bola-desmontable-horizontal-para-audi,-a3-3-puertas-,-11-2012---06-2016ee1196c'),(10689,154,0,1679,'1'),(10690,155,0,1679,'1'),(10691,182,0,1679,'11/2012 - 06/2016'),(10692,184,0,1679,'1600kg'),(10693,185,0,1679,'30-60 minutos'),(10694,186,0,1679,'8,18kg'),(10695,187,0,1679,'80kg'),(10696,188,0,1679,'3 Puertas '),(10697,73,0,1680,'Enganche de Remolque LaFuente Bola desmontable Vertical para AUDI y A3 3 Puertas , 11/2012 - 06/2016'),(10698,84,0,1680,'Enganche de Remolque LaFuente Bola desmontable Vertical para AUDI y A3 3 Puertas , 11/2012 - 06/2016'),(10699,86,0,1680,'Bola de remolque LaFuente desmontable vertical ideal para remolque en AUDI, A3 3 Puertas  y matriculado 11/2012 - 06/2016.\r\n<br/>\r\nEs el modelo de enganche desmontable más cómodo y avanzado, se monta y desmonta en segundos sin ninguna herramienta. La piña'),(10700,106,0,1680,'container2'),(10701,120,0,1680,'0'),(10702,123,0,1680,'enganche-de-remolque-lafuente-bola-desmontable-vertical-para-audi-y-a3-3-puertas-,-11-2012---06-2016ee4431c'),(10703,154,0,1680,'1'),(10704,155,0,1680,'1'),(10705,182,0,1680,'11/2012 - 06/2016'),(10706,184,0,1680,'2000kg'),(10707,185,0,1680,'30-60 minutos'),(10708,186,0,1680,'10,28kg'),(10709,187,0,1680,'80kg'),(10710,188,0,1680,'3 Puertas '),(10711,73,0,1681,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 5 Puertas , 01/1996 - 12/2003'),(10712,84,0,1681,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 5 Puertas , 01/1996 - 12/2003'),(10713,86,0,1681,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 5 Puertas  y matriculado 01/1996 - 12/2003.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relaci'),(10714,106,0,1681,'container2'),(10715,120,0,1681,'0'),(10716,123,0,1681,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-audi,-a3-5-puertas-,-01-1996---12-2003ee0039'),(10717,154,0,1681,'1'),(10718,155,0,1681,'1'),(10719,182,0,1681,'01/1996 - 12/2003'),(10720,184,0,1681,'1600kg'),(10721,185,0,1681,'30-60 minutos'),(10722,186,0,1681,'8,62kg'),(10723,187,0,1681,'75kg'),(10724,188,0,1681,'5 Puertas '),(10725,73,0,1682,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A3 5 Puertas , 01/1996 - 12/2003'),(10726,84,0,1682,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A3 5 Puertas , 01/1996 - 12/2003'),(10727,86,0,1682,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A3 5 Puertas  y matriculado 01/1996 - 12/2003.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica que'),(10728,106,0,1682,'container2'),(10729,120,0,1682,'0'),(10730,123,0,1682,'enganche-de-remolque-lafuente-bola-desmontable-horizontal-para-audi,-a3-5-puertas-,-01-1996---12-2003ee1039'),(10731,154,0,1682,'1'),(10732,155,0,1682,'1'),(10733,182,0,1682,'01/1996 - 12/2003'),(10734,184,0,1682,'1600kg'),(10735,185,0,1682,'30-60 minutos'),(10736,186,0,1682,'8,62kg'),(10737,187,0,1682,'75kg'),(10738,188,0,1682,'5 Puertas '),(10739,73,0,1683,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 5 Puertas , 01/2004 - 01/2013'),(10740,84,0,1683,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 5 Puertas , 01/2004 - 01/2013'),(10741,86,0,1683,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 5 Puertas  y matriculado 01/2004 - 01/2013.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relaci'),(10742,106,0,1683,'container2'),(10743,120,0,1683,'0'),(10744,123,0,1683,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-audi,-a3-5-puertas-,-01-2004---01-2013ee0232c'),(10745,154,0,1683,'1'),(10746,155,0,1683,'1'),(10747,182,0,1683,'01/2004 - 01/2013'),(10748,184,0,1683,'1950kg'),(10749,185,0,1683,'60-90 minutos'),(10750,186,0,1683,'9,71kg'),(10751,187,0,1683,'80kg'),(10752,188,0,1683,'5 Puertas '),(10753,73,0,1684,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A3 5 Puertas , 01/2004 - 01/2013'),(10754,84,0,1684,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A3 5 Puertas , 01/2004 - 01/2013'),(10755,86,0,1684,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A3 5 Puertas  y matriculado 01/2004 - 01/2013.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica que'),(10756,106,0,1684,'container2'),(10757,120,0,1684,'0'),(10758,123,0,1684,'enganche-de-remolque-lafuente-bola-desmontable-horizontal-para-audi,-a3-5-puertas-,-01-2004---01-2013ee1232c'),(10759,154,0,1684,'1'),(10760,155,0,1684,'1'),(10761,182,0,1684,'01/2004 - 01/2013'),(10762,184,0,1684,'1950kg'),(10763,185,0,1684,'60-90 minutos'),(10764,186,0,1684,'9,71kg'),(10765,187,0,1684,'80kg'),(10766,188,0,1684,'5 Puertas '),(10767,73,0,1685,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 5 Puertas , 02/2013 - 08/2016'),(10768,84,0,1685,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 5 Puertas , 02/2013 - 08/2016'),(10769,86,0,1685,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 5 Puertas  y matriculado 02/2013 - 08/2016.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relaci'),(10770,106,0,1685,'container2'),(10771,120,0,1685,'0'),(10772,123,0,1685,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-audi,-a3-5-puertas-,-02-2013---08-2016ee0196l'),(10773,154,0,1685,'1'),(10774,155,0,1685,'1'),(10775,182,0,1685,'02/2013 - 08/2016'),(10776,184,0,1685,'1600kg'),(10777,185,0,1685,'30-60 minutos'),(10778,186,0,1685,'8,18kg'),(10779,187,0,1685,'80kg'),(10780,188,0,1685,'5 Puertas '),(10781,73,0,1686,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A3 5 Puertas , 02/2013 - 08/2016'),(10782,84,0,1686,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A3 5 Puertas , 02/2013 - 08/2016'),(10783,86,0,1686,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A3 5 Puertas  y matriculado 02/2013 - 08/2016.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica que'),(10784,106,0,1686,'container2'),(10785,120,0,1686,'0'),(10786,123,0,1686,'enganche-de-remolque-lafuente-bola-desmontable-horizontal-para-audi,-a3-5-puertas-,-02-2013---08-2016ee1196l'),(10787,154,0,1686,'1'),(10788,155,0,1686,'1'),(10789,182,0,1686,'02/2013 - 08/2016'),(10790,184,0,1686,'1600kg'),(10791,185,0,1686,'30-60 minutos'),(10792,186,0,1686,'8,18kg'),(10793,187,0,1686,'80kg'),(10794,188,0,1686,'5 Puertas '),(10795,73,0,1687,'Enganche de Remolque LaFuente Bola desmontable Vertical para AUDI y A3 5 Puertas , 02/2013 - 08/2016'),(10796,84,0,1687,'Enganche de Remolque LaFuente Bola desmontable Vertical para AUDI y A3 5 Puertas , 02/2013 - 08/2016'),(10797,86,0,1687,'Bola de remolque LaFuente desmontable vertical ideal para remolque en AUDI, A3 5 Puertas  y matriculado 02/2013 - 08/2016.\r\n<br/>\r\nEs el modelo de enganche desmontable más cómodo y avanzado, se monta y desmonta en segundos sin ninguna herramienta. La piña'),(10798,106,0,1687,'container2'),(10799,120,0,1687,'0'),(10800,123,0,1687,'enganche-de-remolque-lafuente-bola-desmontable-vertical-para-audi-y-a3-5-puertas-,-02-2013---08-2016ee4431l'),(10801,154,0,1687,'1'),(10802,155,0,1687,'1'),(10803,182,0,1687,'02/2013 - 08/2016'),(10804,184,0,1687,'2000kg'),(10805,185,0,1687,'30-60 minutos'),(10806,186,0,1687,'10,28kg'),(10807,187,0,1687,'80kg'),(10808,188,0,1687,'5 Puertas '),(10809,73,0,1688,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 5 Puertas , 09/2016 - 04/2020'),(10810,84,0,1688,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 5 Puertas , 09/2016 - 04/2020'),(10811,86,0,1688,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 5 Puertas  y matriculado 09/2016 - 04/2020.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relaci'),(10812,106,0,1688,'container2'),(10813,120,0,1688,'0'),(10814,123,0,1688,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-audi,-a3-5-puertas-,-09-2016---04-2020ee0529'),(10815,154,0,1688,'1'),(10816,155,0,1688,'1'),(10817,182,0,1688,'09/2016 - 04/2020'),(10818,184,0,1688,'2000kg'),(10819,185,0,1688,'30-60 minutos'),(10820,186,0,1688,'10,16kg'),(10821,187,0,1688,'90kg'),(10822,188,0,1688,'5 Puertas '),(10823,73,0,1689,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A3 5 Puertas , 09/2016 - 04/2020'),(10824,84,0,1689,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A3 5 Puertas , 09/2016 - 04/2020'),(10825,86,0,1689,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A3 5 Puertas  y matriculado 09/2016 - 04/2020.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica que'),(10826,106,0,1689,'container2'),(10827,120,0,1689,'0'),(10828,123,0,1689,'enganche-de-remolque-lafuente-bola-desmontable-horizontal-para-audi,-a3-5-puertas-,-09-2016---04-2020ee1529'),(10829,154,0,1689,'1'),(10830,155,0,1689,'1'),(10831,182,0,1689,'09/2016 - 04/2020'),(10832,184,0,1689,'2000kg'),(10833,185,0,1689,'30-60 minutos'),(10834,186,0,1689,'10,16kg'),(10835,187,0,1689,'90kg'),(10836,188,0,1689,'5 Puertas '),(10837,73,0,1690,'Enganche de Remolque LaFuente Bola desmontable Vertical para AUDI y A3 5 Puertas , 09/2016 - 04/2020'),(10838,84,0,1690,'Enganche de Remolque LaFuente Bola desmontable Vertical para AUDI y A3 5 Puertas , 09/2016 - 04/2020'),(10839,86,0,1690,'Bola de remolque LaFuente desmontable vertical ideal para remolque en AUDI, A3 5 Puertas  y matriculado 09/2016 - 04/2020.\r\n<br/>\r\nEs el modelo de enganche desmontable más cómodo y avanzado, se monta y desmonta en segundos sin ninguna herramienta. La piña'),(10840,106,0,1690,'container2'),(10841,120,0,1690,'0'),(10842,123,0,1690,'enganche-de-remolque-lafuente-bola-desmontable-vertical-para-audi-y-a3-5-puertas-,-09-2016---04-2020ee4529'),(10843,154,0,1690,'1'),(10844,155,0,1690,'1'),(10845,182,0,1690,'09/2016 - 04/2020'),(10846,184,0,1690,'2000kg'),(10847,185,0,1690,'30-60 minutos'),(10848,186,0,1690,'10,16kg'),(10849,187,0,1690,'90kg'),(10850,188,0,1690,'5 Puertas '),(10851,73,0,1691,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 Cabrio , 04/2008 - 01/2014'),(10852,84,0,1691,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 Cabrio , 04/2008 - 01/2014'),(10853,86,0,1691,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 Cabrio  y matriculado 04/2008 - 01/2014.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación '),(10854,106,0,1691,'container2'),(10855,120,0,1691,'0'),(10856,123,0,1691,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-audi,-a3-cabrio-,-04-2008---01-2014ee0188l'),(10857,154,0,1691,'1'),(10858,155,0,1691,'1'),(10859,182,0,1691,'04/2008 - 01/2014'),(10860,184,0,1691,'1800kg'),(10861,185,0,1691,'30-60 minutos'),(10862,186,0,1691,'9,48kg'),(10863,187,0,1691,'80kg'),(10864,188,0,1691,'Cabrio '),(10865,73,0,1692,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A3 Cabrio , 04/2008 - 01/2014'),(10866,84,0,1692,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A3 Cabrio , 04/2008 - 01/2014'),(10867,86,0,1692,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A3 Cabrio  y matriculado 04/2008 - 01/2014.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda '),(10868,106,0,1692,'container2'),(10869,120,0,1692,'0'),(10870,123,0,1692,'enganche-de-remolque-lafuente-bola-desmontable-horizontal-para-audi,-a3-cabrio-,-04-2008---01-2014ee1188l'),(10871,154,0,1692,'1'),(10872,155,0,1692,'1'),(10873,182,0,1692,'04/2008 - 01/2014'),(10874,184,0,1692,'1800kg'),(10875,185,0,1692,'30-60 minutos'),(10876,186,0,1692,'9,48kg'),(10877,187,0,1692,'80kg'),(10878,188,0,1692,'Cabrio '),(10879,73,0,1693,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 Cabrio , 02/2014 - 06/2016'),(10880,84,0,1693,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 Cabrio , 02/2014 - 06/2016'),(10881,86,0,1693,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 Cabrio  y matriculado 02/2014 - 06/2016.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación '),(10882,106,0,1693,'container2'),(10883,120,0,1693,'0'),(10884,123,0,1693,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-audi,-a3-cabrio-,-02-2014---06-2016ee0196c'),(10885,154,0,1693,'1'),(10886,155,0,1693,'1'),(10887,182,0,1693,'02/2014 - 06/2016'),(10888,184,0,1693,'1600kg'),(10889,185,0,1693,'30-60 minutos'),(10890,186,0,1693,'8,18kg'),(10891,187,0,1693,'80kg'),(10892,188,0,1693,'Cabrio '),(10893,73,0,1694,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A3 Cabrio , 02/2014 - 06/2016'),(10894,84,0,1694,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A3 Cabrio , 02/2014 - 06/2016'),(10895,86,0,1694,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A3 Cabrio  y matriculado 02/2014 - 06/2016.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda '),(10896,106,0,1694,'container2'),(10897,120,0,1694,'0'),(10898,123,0,1694,'enganche-de-remolque-lafuente-bola-desmontable-horizontal-para-audi,-a3-cabrio-,-02-2014---06-2016ee1196c'),(10899,154,0,1694,'1'),(10900,155,0,1694,'1'),(10901,182,0,1694,'02/2014 - 06/2016'),(10902,184,0,1694,'1600kg'),(10903,185,0,1694,'30-60 minutos'),(10904,186,0,1694,'8,18kg'),(10905,187,0,1694,'80kg'),(10906,188,0,1694,'Cabrio '),(10907,73,0,1695,'Enganche de Remolque LaFuente Bola desmontable Vertical para AUDI y A3 Cabrio , 02/2014 - 06/2016'),(10908,84,0,1695,'Enganche de Remolque LaFuente Bola desmontable Vertical para AUDI y A3 Cabrio , 02/2014 - 06/2016'),(10909,86,0,1695,'Bola de remolque LaFuente desmontable vertical ideal para remolque en AUDI, A3 Cabrio  y matriculado 02/2014 - 06/2016.\r\n<br/>\r\nEs el modelo de enganche desmontable más cómodo y avanzado, se monta y desmonta en segundos sin ninguna herramienta. La piña el'),(10910,106,0,1695,'container2'),(10911,120,0,1695,'0'),(10912,123,0,1695,'enganche-de-remolque-lafuente-bola-desmontable-vertical-para-audi-y-a3-cabrio-,-02-2014---06-2016ee4431a'),(10913,154,0,1695,'1'),(10914,155,0,1695,'1'),(10915,182,0,1695,'02/2014 - 06/2016'),(10916,184,0,1695,'2000kg'),(10917,185,0,1695,'30-60 minutos'),(10918,186,0,1695,'10,28kg'),(10919,187,0,1695,'80kg'),(10920,188,0,1695,'Cabrio '),(10921,73,0,1696,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 Cabrio , 07/2016 - 04/2021'),(10922,84,0,1696,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 Cabrio , 07/2016 - 04/2021'),(10923,86,0,1696,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 Cabrio  y matriculado 07/2016 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación '),(10924,106,0,1696,'container2'),(10925,120,0,1696,'0'),(10926,123,0,1696,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-audi,-a3-cabrio-,-07-2016---04-2021ee0529'),(10927,154,0,1696,'1'),(10928,155,0,1696,'1'),(10929,182,0,1696,'07/2016 - 04/2021'),(10930,184,0,1696,'2000kg'),(10931,185,0,1696,'30-60 minutos'),(10932,186,0,1696,'10,16kg'),(10933,187,0,1696,'90kg'),(10934,188,0,1696,'Cabrio '),(10935,73,0,1697,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A3 Cabrio , 07/2016 - 04/2021'),(10936,84,0,1697,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A3 Cabrio , 07/2016 - 04/2021'),(10937,86,0,1697,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A3 Cabrio  y matriculado 07/2016 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda '),(10938,106,0,1697,'container2'),(10939,120,0,1697,'0'),(10940,123,0,1697,'enganche-de-remolque-lafuente-bola-desmontable-horizontal-para-audi,-a3-cabrio-,-07-2016---04-2021ee1529'),(10941,154,0,1697,'1'),(10942,155,0,1697,'1'),(10943,182,0,1697,'07/2016 - 04/2021'),(10944,184,0,1697,'2000kg'),(10945,185,0,1697,'30-60 minutos'),(10946,186,0,1697,'10,16kg'),(10947,187,0,1697,'90kg'),(10948,188,0,1697,'Cabrio '),(10949,73,0,1698,'Enganche de Remolque LaFuente Bola desmontable Vertical para AUDI y A3 Cabrio , 07/2016 - 04/2021'),(10950,84,0,1698,'Enganche de Remolque LaFuente Bola desmontable Vertical para AUDI y A3 Cabrio , 07/2016 - 04/2021'),(10951,86,0,1698,'Bola de remolque LaFuente desmontable vertical ideal para remolque en AUDI, A3 Cabrio  y matriculado 07/2016 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche desmontable más cómodo y avanzado, se monta y desmonta en segundos sin ninguna herramienta. La piña el'),(10952,106,0,1698,'container2'),(10953,120,0,1698,'0'),(10954,123,0,1698,'enganche-de-remolque-lafuente-bola-desmontable-vertical-para-audi-y-a3-cabrio-,-07-2016---04-2021ee4529'),(10955,154,0,1698,'1'),(10956,155,0,1698,'1'),(10957,182,0,1698,'07/2016 - 04/2021'),(10958,184,0,1698,'2000kg'),(10959,185,0,1698,'30-60 minutos'),(10960,186,0,1698,'10,16kg'),(10961,187,0,1698,'90kg'),(10962,188,0,1698,'Cabrio '),(10963,73,0,1699,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 Quattro , 01/1999 - 12/2002'),(10964,84,0,1699,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 Quattro , 01/1999 - 12/2002'),(10965,86,0,1699,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 Quattro  y matriculado 01/1999 - 12/2002.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación'),(10966,106,0,1699,'container2'),(10967,120,0,1699,'0'),(10968,123,0,1699,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-audi,-a3-quattro-,-01-1999---12-2002ei0069'),(10969,154,0,1699,'1'),(10970,155,0,1699,'1'),(10971,182,0,1699,'01/1999 - 12/2002'),(10972,184,0,1699,'1600kg'),(10973,185,0,1699,'30-60 minutos'),(10974,186,0,1699,'9kg'),(10975,187,0,1699,'75kg'),(10976,188,0,1699,'Quattro '),(10977,73,0,1700,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A3 Quattro , 01/1999 - 12/2002'),(10978,84,0,1700,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A3 Quattro , 01/1999 - 12/2002'),(10979,86,0,1700,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A3 Quattro  y matriculado 01/1999 - 12/2002.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda'),(10980,106,0,1700,'container2'),(10981,120,0,1700,'0'),(10982,123,0,1700,'enganche-de-remolque-lafuente-bola-desmontable-horizontal-para-audi,-a3-quattro-,-01-1999---12-2002ei1069'),(10983,154,0,1700,'1'),(10984,155,0,1700,'1'),(10985,182,0,1700,'01/1999 - 12/2002'),(10986,184,0,1700,'1600kg'),(10987,185,0,1700,'30-60 minutos'),(10988,186,0,1700,'9kg'),(10989,187,0,1700,'75kg'),(10990,188,0,1700,'Quattro '),(10991,73,0,1701,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 S3 3 Puertas , 01/1999 - 10/2003'),(10992,84,0,1701,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 S3 3 Puertas , 01/1999 - 10/2003'),(10993,86,0,1701,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 S3 3 Puertas  y matriculado 01/1999 - 10/2003.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente rel'),(10994,106,0,1701,'container2'),(10995,120,0,1701,'0'),(10996,123,0,1701,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-audi,-a3-s3-3-puertas-,-01-1999---10-2003ei0069'),(10997,154,0,1701,'1'),(10998,155,0,1701,'1'),(10999,182,0,1701,'01/1999 - 10/2003'),(11000,184,0,1701,'1600kg'),(11001,185,0,1701,'30-60 minutos'),(11002,186,0,1701,'9kg'),(11003,187,0,1701,'75kg'),(11004,188,0,1701,'S3 3 Puertas '),(11005,73,0,1702,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A3 S3 3 Puertas , 01/1999 - 10/2003'),(11006,84,0,1702,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A3 S3 3 Puertas , 01/1999 - 10/2003'),(11007,86,0,1702,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A3 S3 3 Puertas  y matriculado 01/1999 - 10/2003.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica '),(11008,106,0,1702,'container2'),(11009,120,0,1702,'0'),(11010,123,0,1702,'enganche-de-remolque-lafuente-bola-desmontable-horizontal-para-audi,-a3-s3-3-puertas-,-01-1999---10-2003ei1069'),(11011,154,0,1702,'1'),(11012,155,0,1702,'1'),(11013,182,0,1702,'01/1999 - 10/2003'),(11014,184,0,1702,'1600kg'),(11015,185,0,1702,'30-60 minutos'),(11016,186,0,1702,'9kg'),(11017,187,0,1702,'75kg'),(11018,188,0,1702,'S3 3 Puertas '),(11019,73,0,1703,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 S3 3 Puertas , 11/2003 - 10/2012'),(11020,84,0,1703,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 S3 3 Puertas , 11/2003 - 10/2012'),(11021,86,0,1703,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 S3 3 Puertas  y matriculado 11/2003 - 10/2012.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente rel'),(11022,106,0,1703,'container2'),(11023,120,0,1703,'0'),(11024,123,0,1703,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-audi,-a3-s3-3-puertas-,-11-2003---10-2012ee0188c'),(11025,154,0,1703,'1'),(11026,155,0,1703,'1'),(11027,182,0,1703,'11/2003 - 10/2012'),(11028,184,0,1703,'1800kg'),(11029,185,0,1703,'30-60 minutos'),(11030,186,0,1703,'9,48kg'),(11031,187,0,1703,'80kg'),(11032,188,0,1703,'S3 3 Puertas '),(11033,73,0,1704,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A3 S3 3 Puertas , 11/2003 - 10/2012'),(11034,84,0,1704,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A3 S3 3 Puertas , 11/2003 - 10/2012'),(11035,86,0,1704,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A3 S3 3 Puertas  y matriculado 11/2003 - 10/2012.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica '),(11036,106,0,1704,'container2'),(11037,120,0,1704,'0'),(11038,123,0,1704,'enganche-de-remolque-lafuente-bola-desmontable-horizontal-para-audi,-a3-s3-3-puertas-,-11-2003---10-2012ee1188c'),(11039,154,0,1704,'1'),(11040,155,0,1704,'1'),(11041,182,0,1704,'11/2003 - 10/2012'),(11042,184,0,1704,'1800kg'),(11043,185,0,1704,'30-60 minutos'),(11044,186,0,1704,'9,48kg'),(11045,187,0,1704,'80kg'),(11046,188,0,1704,'S3 3 Puertas '),(11047,73,0,1705,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 S3 5 Puertas , 01/2004 - 01/2013'),(11048,84,0,1705,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 S3 5 Puertas , 01/2004 - 01/2013'),(11049,86,0,1705,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 S3 5 Puertas  y matriculado 01/2004 - 01/2013.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente rel'),(11050,106,0,1705,'container2'),(11051,120,0,1705,'0'),(11052,123,0,1705,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-audi,-a3-s3-5-puertas-,-01-2004---01-2013ee0232c'),(11053,154,0,1705,'1'),(11054,155,0,1705,'1'),(11055,182,0,1705,'01/2004 - 01/2013'),(11056,184,0,1705,'1950kg'),(11057,185,0,1705,'30-60 minutos'),(11058,186,0,1705,'9,71kg'),(11059,187,0,1705,'80kg'),(11060,188,0,1705,'S3 5 Puertas '),(11061,73,0,1706,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A3 S3 5 Puertas , 01/2004 - 01/2013'),(11062,84,0,1706,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A3 S3 5 Puertas , 01/2004 - 01/2013'),(11063,86,0,1706,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A3 S3 5 Puertas  y matriculado 01/2004 - 01/2013.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica '),(11064,106,0,1706,'container2'),(11065,120,0,1706,'0'),(11066,123,0,1706,'enganche-de-remolque-lafuente-bola-desmontable-horizontal-para-audi,-a3-s3-5-puertas-,-01-2004---01-2013ee1232c'),(11067,154,0,1706,'1'),(11068,155,0,1706,'1'),(11069,182,0,1706,'01/2004 - 01/2013'),(11070,184,0,1706,'1950kg'),(11071,185,0,1706,'30-60 minutos'),(11072,186,0,1706,'9,71kg'),(11073,187,0,1706,'80kg'),(11074,188,0,1706,'S3 5 Puertas '),(11075,73,0,1707,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 Sedan , 05/2013 - 08/2016'),(11076,84,0,1707,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 Sedan , 05/2013 - 08/2016'),(11077,86,0,1707,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 Sedan  y matriculado 05/2013 - 08/2016.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación c'),(11078,106,0,1707,'container2'),(11079,120,0,1707,'0'),(11080,123,0,1707,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-audi,-a3-sedan-,-05-2013---08-2016ee0196l'),(11081,154,0,1707,'1'),(11082,155,0,1707,'1'),(11083,182,0,1707,'05/2013 - 08/2016'),(11084,184,0,1707,'1600kg'),(11085,185,0,1707,'60-90 minutos'),(11086,186,0,1707,'8,18kg'),(11087,187,0,1707,'80kg'),(11088,188,0,1707,'Sedan '),(11089,73,0,1708,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A3 Sedan , 05/2013 - 08/2016'),(11090,84,0,1708,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A3 Sedan , 05/2013 - 08/2016'),(11091,86,0,1708,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A3 Sedan  y matriculado 05/2013 - 08/2016.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda v'),(11092,106,0,1708,'container2'),(11093,120,0,1708,'0'),(11094,123,0,1708,'enganche-de-remolque-lafuente-bola-desmontable-horizontal-para-audi,-a3-sedan-,-05-2013---08-2016ee1196l'),(11095,154,0,1708,'1'),(11096,155,0,1708,'1'),(11097,182,0,1708,'05/2013 - 08/2016'),(11098,184,0,1708,'1600kg'),(11099,185,0,1708,'60-90 minutos'),(11100,186,0,1708,'8,18kg'),(11101,187,0,1708,'80kg'),(11102,188,0,1708,'Sedan '),(11103,73,0,1709,'Enganche de Remolque LaFuente Bola desmontable Vertical para AUDI y A3 Sedan , 05/2013 - 08/2016'),(11104,84,0,1709,'Enganche de Remolque LaFuente Bola desmontable Vertical para AUDI y A3 Sedan , 05/2013 - 08/2016'),(11105,86,0,1709,'Bola de remolque LaFuente desmontable vertical ideal para remolque en AUDI, A3 Sedan  y matriculado 05/2013 - 08/2016.\r\n<br/>\r\nEs el modelo de enganche desmontable más cómodo y avanzado, se monta y desmonta en segundos sin ninguna herramienta. La piña elé'),(11106,106,0,1709,'container2'),(11107,120,0,1709,'0'),(11108,123,0,1709,'enganche-de-remolque-lafuente-bola-desmontable-vertical-para-audi-y-a3-sedan-,-05-2013---08-2016ee4431a'),(11109,154,0,1709,'1'),(11110,155,0,1709,'1'),(11111,182,0,1709,'05/2013 - 08/2016'),(11112,184,0,1709,'2000kg'),(11113,185,0,1709,'60-90 minutos'),(11114,186,0,1709,'10,28kg'),(11115,187,0,1709,'80kg'),(11116,188,0,1709,'Sedan '),(11117,73,0,1710,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 Sedan , 09/2016 - 03/2020'),(11118,84,0,1710,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 Sedan , 09/2016 - 03/2020'),(11119,86,0,1710,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 Sedan  y matriculado 09/2016 - 03/2020.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación c'),(11120,106,0,1710,'container2'),(11121,120,0,1710,'0'),(11122,123,0,1710,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-audi,-a3-sedan-,-09-2016---03-2020ee0529'),(11123,154,0,1710,'1'),(11124,155,0,1710,'1'),(11125,182,0,1710,'09/2016 - 03/2020'),(11126,184,0,1710,'2000kg'),(11127,185,0,1710,'30-60 minutos'),(11128,186,0,1710,'10,16kg'),(11129,187,0,1710,'90kg'),(11130,188,0,1710,'Sedan '),(11131,73,0,1711,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A3 Sedan , 09/2016 - 03/2020'),(11132,84,0,1711,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A3 Sedan , 09/2016 - 03/2020'),(11133,86,0,1711,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A3 Sedan  y matriculado 09/2016 - 03/2020.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica queda v'),(11134,106,0,1711,'container2'),(11135,120,0,1711,'0'),(11136,123,0,1711,'enganche-de-remolque-lafuente-bola-desmontable-horizontal-para-audi,-a3-sedan-,-09-2016---03-2020ee1529'),(11137,154,0,1711,'1'),(11138,155,0,1711,'1'),(11139,182,0,1711,'09/2016 - 03/2020'),(11140,184,0,1711,'2000kg'),(11141,185,0,1711,'30-60 minutos'),(11142,186,0,1711,'10,16kg'),(11143,187,0,1711,'90kg'),(11144,188,0,1711,'Sedan '),(11145,73,0,1712,'Enganche de Remolque LaFuente Bola desmontable Vertical para AUDI y A3 Sedan , 09/2016 - 03/2020'),(11146,84,0,1712,'Enganche de Remolque LaFuente Bola desmontable Vertical para AUDI y A3 Sedan , 09/2016 - 03/2020'),(11147,86,0,1712,'Bola de remolque LaFuente desmontable vertical ideal para remolque en AUDI, A3 Sedan  y matriculado 09/2016 - 03/2020.\r\n<br/>\r\nEs el modelo de enganche desmontable más cómodo y avanzado, se monta y desmonta en segundos sin ninguna herramienta. La piña elé'),(11148,106,0,1712,'container2'),(11149,120,0,1712,'0'),(11150,123,0,1712,'enganche-de-remolque-lafuente-bola-desmontable-vertical-para-audi-y-a3-sedan-,-09-2016---03-2020ee4529'),(11151,154,0,1712,'1'),(11152,155,0,1712,'1'),(11153,182,0,1712,'09/2016 - 03/2020'),(11154,184,0,1712,'2000kg'),(11155,185,0,1712,'30-60 minutos'),(11156,186,0,1712,'10,16kg'),(11157,187,0,1712,'90kg'),(11158,188,0,1712,'Sedan '),(11159,73,0,1713,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 Sedan , 04/2020 - 04/2021'),(11160,84,0,1713,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 Sedan , 04/2020 - 04/2021'),(11161,86,0,1713,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 Sedan  y matriculado 04/2020 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación c'),(11162,106,0,1713,'container2'),(11163,120,0,1713,'0'),(11164,123,0,1713,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-audi,-a3-sedan-,-04-2020---04-2021ei0806'),(11165,154,0,1713,'1'),(11166,155,0,1713,'1'),(11167,182,0,1713,'04/2020 - 04/2021'),(11168,184,0,1713,'1800kg'),(11169,185,0,1713,'60-90 minutos'),(11170,186,0,1713,'10kg'),(11171,187,0,1713,'90kg'),(11172,188,0,1713,'Sedan '),(11173,73,0,1714,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 Sedan , 04/2020 - 04/2021'),(11174,84,0,1714,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 Sedan , 04/2020 - 04/2021'),(11175,86,0,1714,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 Sedan  y matriculado 04/2020 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación c'),(11176,106,0,1714,'container2'),(11177,120,0,1714,'0'),(11178,123,0,1714,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-audi,-a3-sedan-,-04-2020---04-2021ei1806'),(11179,154,0,1714,'1'),(11180,155,0,1714,'1'),(11181,182,0,1714,'04/2020 - 04/2021'),(11182,184,0,1714,'1800kg'),(11183,185,0,1714,'60-90 minutos'),(11184,186,0,1714,'10kg'),(11185,187,0,1714,'90kg'),(11186,188,0,1714,'Sedan '),(11187,73,0,1715,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 Sedan , 04/2020 - 04/2021'),(11188,84,0,1715,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 Sedan , 04/2020 - 04/2021'),(11189,86,0,1715,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 Sedan  y matriculado 04/2020 - 04/2021.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relación c'),(11190,106,0,1715,'container2'),(11191,120,0,1715,'0'),(11192,123,0,1715,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-audi,-a3-sedan-,-04-2020---04-2021ei4806'),(11193,154,0,1715,'1'),(11194,155,0,1715,'1'),(11195,182,0,1715,'04/2020 - 04/2021'),(11196,184,0,1715,'1800kg'),(11197,185,0,1715,'60-90 minutos'),(11198,186,0,1715,'10kg'),(11199,187,0,1715,'90kg'),(11200,188,0,1715,'Sedan '),(11201,73,0,1716,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 Sportback , 01/2004 - 01/2013'),(11202,84,0,1716,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 Sportback , 01/2004 - 01/2013'),(11203,86,0,1716,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 Sportback  y matriculado 01/2004 - 01/2013.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relaci'),(11204,106,0,1716,'container2'),(11205,120,0,1716,'0'),(11206,123,0,1716,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-audi,-a3-sportback-,-01-2004---01-2013ee0232c'),(11207,154,0,1716,'1'),(11208,155,0,1716,'1'),(11209,182,0,1716,'01/2004 - 01/2013'),(11210,184,0,1716,'1950kg'),(11211,185,0,1716,'60-90 minutos'),(11212,186,0,1716,'9,71kg'),(11213,187,0,1716,'80kg'),(11214,188,0,1716,'Sportback '),(11215,73,0,1717,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A3 Sportback , 01/2004 - 01/2013'),(11216,84,0,1717,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A3 Sportback , 01/2004 - 01/2013'),(11217,86,0,1717,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A3 Sportback  y matriculado 01/2004 - 01/2013.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica que'),(11218,106,0,1717,'container2'),(11219,120,0,1717,'0'),(11220,123,0,1717,'enganche-de-remolque-lafuente-bola-desmontable-horizontal-para-audi,-a3-sportback-,-01-2004---01-2013ee1232c'),(11221,154,0,1717,'1'),(11222,155,0,1717,'1'),(11223,182,0,1717,'01/2004 - 01/2013'),(11224,184,0,1717,'1950kg'),(11225,185,0,1717,'60-90 minutos'),(11226,186,0,1717,'9,71kg'),(11227,187,0,1717,'80kg'),(11228,188,0,1717,'Sportback '),(11229,73,0,1718,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 Sportback , 02/2013 - 08/2016'),(11230,84,0,1718,'Enganche de Remolque LaFuente Bola Fija Cuello de cisne para AUDI, A3 Sportback , 02/2013 - 08/2016'),(11231,86,0,1718,'Enganche LaFuente bola fija tipo cuello de cisne idóneo para remolque en AUDI, A3 Sportback  y matriculado 02/2013 - 08/2016.\r\n<br/>\r\nEs el modelo de enganche más común y más básico, ya que es ideal para todo tipo de vehículos y tiene una excelente relaci'),(11232,106,0,1718,'container2'),(11233,120,0,1718,'0'),(11234,123,0,1718,'enganche-de-remolque-lafuente-bola-fija-cuello-de-cisne-para-audi,-a3-sportback-,-02-2013---08-2016ee0196l'),(11235,154,0,1718,'1'),(11236,155,0,1718,'1'),(11237,182,0,1718,'02/2013 - 08/2016'),(11238,184,0,1718,'1600kg'),(11239,185,0,1718,'30-60 minutos'),(11240,186,0,1718,'8,18kg'),(11241,187,0,1718,'80kg'),(11242,188,0,1718,'Sportback '),(11243,73,0,1719,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A3 Sportback , 02/2013 - 08/2016'),(11244,84,0,1719,'Enganche de Remolque LaFuente Bola desmontable Horizontal para AUDI, A3 Sportback , 02/2013 - 08/2016'),(11245,86,0,1719,'Enganche LaFuente desmontable horizontal ideal para remolque en AUDI, A3 Sportback  y matriculado 02/2013 - 08/2016.\r\n<br/>\r\nEs el modelo de enganche desmontable más económico, se monta y desmonta en segundos sin ninguna herramienta. La piña eléctrica que'),(11246,106,0,1719,'container2'),(11247,120,0,1719,'0'),(11248,123,0,1719,'enganche-de-remolque-lafuente-bola-desmontable-horizontal-para-audi,-a3-sportback-,-02-2013---08-2016ee1196l'),(11249,154,0,1719,'1'),(11250,155,0,1719,'1'),(11251,182,0,1719,'02/2013 - 08/2016'),(11252,184,0,1719,'1600kg'),(11253,185,0,1719,'30-60 minutos'),(11254,186,0,1719,'8,18kg'),(11255,187,0,1719,'80kg'),(11256,188,0,1719,'Sportback '),(11257,73,0,1720,'Enganche de Remolque LaFuente Bola desmontable Vertical para AUDI y A3 Sportback , 02/2013 - 08/2016'),(11258,84,0,1720,'Enganche de Remolque LaFuente Bola desmontable Vertical para AUDI y A3 Sportback , 02/2013 - 08/2016'),(11259,86,0,1720,'Bola de remolque LaFuente desmontable vertical ideal para remolque en AUDI, A3 Sportback  y matriculado 02/2013 - 08/2016.\r\n<br/>\r\nEs el modelo de enganche desmontable más cómodo y avanzado, se monta y desmonta en segundos sin ninguna herramienta. La piña'),(11260,106,0,1720,'container2'),(11261,120,0,1720,'0'),(11262,123,0,1720,'enganche-de-remolque-lafuente-bola-desmontable-vertical-para-audi-y-a3-sportback-,-02-2013---08-2016ee4431l'),(11263,154,0,1720,'1'),(11264,155,0,1720,'1'),(11265,182,0,1720,'02/2013 - 08/2016'),(11266,184,0,1720,'2000kg'),(11267,185,0,1720,'30-60 minutos'),(11268,186,0,1720,'10,28kg'),(11269,187,0,1720,'80kg'),(11270,188,0,1720,'Sportback ');
/*!40000 ALTER TABLE `catalog_product_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_frontend_action`
--

DROP TABLE IF EXISTS `catalog_product_frontend_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_frontend_action` (
  `action_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Action ID',
  `type_id` varchar(64) NOT NULL COMMENT 'Type of product action',
  `visitor_id` int(10) unsigned DEFAULT NULL COMMENT 'Visitor ID',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer ID',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product ID',
  `added_at` bigint(20) NOT NULL COMMENT 'Added At',
  PRIMARY KEY (`action_id`),
  UNIQUE KEY `CATALOG_PRODUCT_FRONTEND_ACTION_VISITOR_ID_PRODUCT_ID_TYPE_ID` (`visitor_id`,`product_id`,`type_id`),
  UNIQUE KEY `CATALOG_PRODUCT_FRONTEND_ACTION_CUSTOMER_ID_PRODUCT_ID_TYPE_ID` (`customer_id`,`product_id`,`type_id`),
  KEY `CAT_PRD_FRONTEND_ACTION_PRD_ID_CAT_PRD_ENTT_ENTT_ID` (`product_id`),
  CONSTRAINT `CAT_PRD_FRONTEND_ACTION_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_FRONTEND_ACTION_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Frontend Action Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_frontend_action`
--

LOCK TABLES `catalog_product_frontend_action` WRITE;
/*!40000 ALTER TABLE `catalog_product_frontend_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_frontend_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav`
--

DROP TABLE IF EXISTS `catalog_product_index_eav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Original entity ID for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav`
--

LOCK TABLES `catalog_product_index_eav` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav` DISABLE KEYS */;
INSERT INTO `catalog_product_index_eav` VALUES (1486,99,1,4,1486),(1487,99,1,4,1487),(1488,99,1,4,1488),(1489,99,1,4,1489),(1490,99,1,4,1490),(1491,99,1,4,1491),(1492,99,1,4,1492),(1493,99,1,4,1493),(1494,99,1,4,1494),(1495,99,1,4,1495),(1496,99,1,4,1496),(1497,99,1,4,1497),(1498,99,1,4,1498),(1499,99,1,4,1499),(1500,99,1,4,1500),(1501,99,1,4,1501),(1502,99,1,4,1502),(1503,99,1,4,1503),(1504,99,1,4,1504),(1505,99,1,4,1505),(1506,99,1,4,1506),(1507,99,1,4,1507),(1508,99,1,4,1508),(1509,99,1,4,1509),(1510,99,1,4,1510),(1511,99,1,4,1511),(1512,99,1,4,1512),(1513,99,1,4,1513),(1514,99,1,4,1514),(1515,99,1,4,1515),(1516,99,1,4,1516),(1517,99,1,4,1517),(1518,99,1,4,1518),(1519,99,1,4,1519),(1520,99,1,4,1520),(1521,99,1,4,1521),(1522,99,1,4,1522),(1523,99,1,4,1523),(1525,99,1,4,1525),(1526,99,1,4,1526),(1527,99,1,4,1527),(1528,99,1,4,1528),(1529,99,1,4,1529),(1530,99,1,4,1530),(1531,99,1,4,1531),(1532,99,1,4,1532),(1533,99,1,4,1533),(1534,99,1,4,1534),(1535,99,1,4,1535),(1536,99,1,4,1536),(1537,99,1,4,1537),(1538,99,1,4,1538),(1539,99,1,4,1539),(1540,99,1,4,1540),(1541,99,1,4,1541),(1542,99,1,4,1542),(1543,99,1,4,1543),(1544,99,1,4,1544),(1545,99,1,4,1545),(1546,99,1,4,1546),(1547,99,1,4,1547),(1548,99,1,4,1548),(1549,99,1,4,1549),(1550,99,1,4,1550),(1551,99,1,4,1551),(1552,99,1,4,1552),(1553,99,1,4,1553),(1554,99,1,4,1554),(1555,99,1,4,1555),(1556,99,1,4,1556),(1557,99,1,4,1557),(1558,99,1,4,1558),(1559,99,1,4,1559),(1560,99,1,4,1560),(1561,99,1,4,1561),(1562,99,1,4,1562),(1563,99,1,4,1563),(1564,99,1,4,1564),(1565,99,1,4,1565),(1566,99,1,4,1566),(1567,99,1,4,1567),(1568,99,1,4,1568),(1569,99,1,4,1569),(1570,99,1,4,1570),(1571,99,1,4,1571),(1572,99,1,4,1572),(1573,99,1,4,1573),(1574,99,1,4,1574),(1575,99,1,4,1575),(1576,99,1,4,1576),(1577,99,1,4,1577),(1578,99,1,4,1578),(1579,99,1,4,1579),(1580,99,1,4,1580),(1581,99,1,4,1581),(1582,99,1,4,1582),(1583,99,1,4,1583),(1584,99,1,4,1584),(1585,99,1,4,1585),(1586,99,1,4,1586),(1587,99,1,4,1587),(1588,99,1,4,1588),(1589,99,1,4,1589),(1590,99,1,4,1590),(1591,99,1,4,1591),(1592,99,1,4,1592),(1593,99,1,4,1593),(1594,99,1,4,1594),(1595,99,1,4,1595),(1596,99,1,4,1596),(1597,99,1,4,1597),(1598,99,1,4,1598),(1599,99,1,4,1599),(1600,99,1,4,1600),(1601,99,1,4,1601),(1602,99,1,4,1602),(1603,99,1,4,1603),(1604,99,1,4,1604),(1605,99,1,4,1605),(1606,99,1,4,1606),(1607,99,1,4,1607),(1608,99,1,4,1608),(1609,99,1,4,1609),(1610,99,1,4,1610),(1611,99,1,4,1611),(1612,99,1,4,1612),(1613,99,1,4,1613),(1614,99,1,4,1614),(1615,99,1,4,1615),(1616,99,1,4,1616),(1617,99,1,4,1617),(1618,99,1,4,1618),(1619,99,1,4,1619),(1620,99,1,4,1620),(1621,99,1,4,1621),(1622,99,1,4,1622),(1623,99,1,4,1623),(1624,99,1,4,1624),(1625,99,1,4,1625),(1626,99,1,4,1626),(1627,99,1,4,1627),(1628,99,1,4,1628),(1629,99,1,4,1629),(1630,99,1,4,1630),(1631,99,1,4,1631),(1632,99,1,4,1632),(1633,99,1,4,1633),(1634,99,1,4,1634),(1635,99,1,4,1635),(1636,99,1,4,1636),(1637,99,1,4,1637),(1638,99,1,4,1638),(1639,99,1,4,1639),(1640,99,1,4,1640),(1641,99,1,4,1641),(1642,99,1,4,1642),(1643,99,1,4,1643),(1644,99,1,4,1644),(1645,99,1,4,1645),(1646,99,1,4,1646),(1647,99,1,4,1647),(1648,99,1,4,1648),(1649,99,1,4,1649),(1650,99,1,4,1650),(1651,99,1,4,1651),(1652,99,1,4,1652),(1653,99,1,4,1653),(1654,99,1,4,1654),(1655,99,1,4,1655),(1656,99,1,4,1656),(1657,99,1,4,1657),(1658,99,1,4,1658),(1659,99,1,4,1659),(1660,99,1,4,1660),(1661,99,1,4,1661),(1662,99,1,4,1662),(1663,99,1,4,1663),(1664,99,1,4,1664),(1665,99,1,4,1665),(1666,99,1,4,1666),(1667,99,1,4,1667),(1668,99,1,4,1668),(1669,99,1,4,1669),(1670,99,1,4,1670),(1671,99,1,4,1671),(1672,99,1,4,1672),(1673,99,1,4,1673),(1674,99,1,4,1674),(1675,99,1,4,1675),(1676,99,1,4,1676),(1677,99,1,4,1677),(1678,99,1,4,1678),(1679,99,1,4,1679),(1680,99,1,4,1680),(1681,99,1,4,1681),(1682,99,1,4,1682),(1683,99,1,4,1683),(1684,99,1,4,1684),(1685,99,1,4,1685),(1686,99,1,4,1686),(1687,99,1,4,1687),(1688,99,1,4,1688),(1689,99,1,4,1689),(1690,99,1,4,1690),(1691,99,1,4,1691),(1692,99,1,4,1692),(1693,99,1,4,1693),(1694,99,1,4,1694),(1695,99,1,4,1695),(1696,99,1,4,1696),(1697,99,1,4,1697),(1698,99,1,4,1698),(1699,99,1,4,1699),(1700,99,1,4,1700),(1701,99,1,4,1701),(1702,99,1,4,1702),(1703,99,1,4,1703),(1704,99,1,4,1704),(1705,99,1,4,1705),(1706,99,1,4,1706),(1707,99,1,4,1707),(1708,99,1,4,1708),(1709,99,1,4,1709),(1710,99,1,4,1710),(1711,99,1,4,1711),(1712,99,1,4,1712),(1713,99,1,4,1713),(1714,99,1,4,1714),(1715,99,1,4,1715),(1716,99,1,4,1716),(1717,99,1,4,1717),(1718,99,1,4,1718),(1719,99,1,4,1719),(1720,99,1,4,1720);
/*!40000 ALTER TABLE `catalog_product_index_eav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav_decimal`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav_decimal` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Original entity ID for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav_decimal`
--

LOCK TABLES `catalog_product_index_eav_decimal` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav_decimal_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav_decimal_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Original entity ID for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Indexer Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav_decimal_idx`
--

LOCK TABLES `catalog_product_index_eav_decimal_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav_decimal_replica`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav_decimal_replica` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Original entity ID for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav_decimal_replica`
--

LOCK TABLES `catalog_product_index_eav_decimal_replica` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav_decimal_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav_decimal_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Original entity ID for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Indexer Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav_decimal_tmp`
--

LOCK TABLES `catalog_product_index_eav_decimal_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Original entity ID for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_IDX_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_IDX_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Indexer Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav_idx`
--

LOCK TABLES `catalog_product_index_eav_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_eav_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav_replica`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav_replica` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Original entity ID for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav_replica`
--

LOCK TABLES `catalog_product_index_eav_replica` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav_replica` DISABLE KEYS */;
INSERT INTO `catalog_product_index_eav_replica` VALUES (1484,99,1,4,1484),(1485,99,1,4,1485),(1486,99,1,4,1486);
/*!40000 ALTER TABLE `catalog_product_index_eav_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Original entity ID for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_TMP_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_TMP_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_TMP_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Indexer Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav_tmp`
--

LOCK TABLES `catalog_product_index_eav_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_eav_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price`
--

DROP TABLE IF EXISTS `catalog_product_index_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT 0 COMMENT 'Tax Class ID',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(20,6) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_MIN_PRICE` (`min_price`),
  KEY `CAT_PRD_IDX_PRICE_WS_ID_CSTR_GROUP_ID_MIN_PRICE` (`website_id`,`customer_group_id`,`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price`
--

LOCK TABLES `catalog_product_index_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price` DISABLE KEYS */;
INSERT INTO `catalog_product_index_price` VALUES (1621,0,1,0,767.140000,591.752617,591.752617,591.752617,NULL),(1621,1,1,0,767.140000,591.752617,591.752617,591.752617,NULL),(1621,2,1,0,767.140000,591.752617,591.752617,591.752617,NULL),(1621,3,1,0,767.140000,591.752617,591.752617,591.752617,NULL),(1622,0,1,0,527.560000,406.946595,406.946595,406.946595,NULL),(1622,1,1,0,527.560000,406.946595,406.946595,406.946595,NULL),(1622,2,1,0,527.560000,406.946595,406.946595,406.946595,NULL),(1622,3,1,0,527.560000,406.946595,406.946595,406.946595,NULL),(1623,0,1,0,481.580000,371.478772,371.478772,371.478772,NULL),(1623,1,1,0,481.580000,371.478772,371.478772,371.478772,NULL),(1623,2,1,0,481.580000,371.478772,371.478772,371.478772,NULL),(1623,3,1,0,481.580000,371.478772,371.478772,371.478772,NULL),(1624,0,1,0,498.520000,384.545865,384.545865,384.545865,NULL),(1624,1,1,0,498.520000,384.545865,384.545865,384.545865,NULL),(1624,2,1,0,498.520000,384.545865,384.545865,384.545865,NULL),(1624,3,1,0,498.520000,384.545865,384.545865,384.545865,NULL),(1625,0,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1625,1,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1625,2,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1625,3,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1626,0,1,0,361.790000,279.075761,279.075761,279.075761,NULL),(1626,1,1,0,361.790000,279.075761,279.075761,279.075761,NULL),(1626,2,1,0,361.790000,279.075761,279.075761,279.075761,NULL),(1626,3,1,0,361.790000,279.075761,279.075761,279.075761,NULL),(1627,0,1,0,574.750000,443.347781,443.347781,443.347781,NULL),(1627,1,1,0,574.750000,443.347781,443.347781,443.347781,NULL),(1627,2,1,0,574.750000,443.347781,443.347781,443.347781,NULL),(1627,3,1,0,574.750000,443.347781,443.347781,443.347781,NULL),(1628,0,1,0,329.120000,253.874940,253.874940,253.874940,NULL),(1628,1,1,0,329.120000,253.874940,253.874940,253.874940,NULL),(1628,2,1,0,329.120000,253.874940,253.874940,253.874940,NULL),(1628,3,1,0,329.120000,253.874940,253.874940,253.874940,NULL),(1629,0,1,0,492.470000,379.879046,379.879046,379.879046,NULL),(1629,1,1,0,492.470000,379.879046,379.879046,379.879046,NULL),(1629,2,1,0,492.470000,379.879046,379.879046,379.879046,NULL),(1629,3,1,0,492.470000,379.879046,379.879046,379.879046,NULL),(1630,0,1,0,329.120000,253.874940,253.874940,253.874940,NULL),(1630,1,1,0,329.120000,253.874940,253.874940,253.874940,NULL),(1630,2,1,0,329.120000,253.874940,253.874940,253.874940,NULL),(1630,3,1,0,329.120000,253.874940,253.874940,253.874940,NULL),(1631,0,1,0,492.470000,379.879046,379.879046,379.879046,NULL),(1631,1,1,0,492.470000,379.879046,379.879046,379.879046,NULL),(1631,2,1,0,492.470000,379.879046,379.879046,379.879046,NULL),(1631,3,1,0,492.470000,379.879046,379.879046,379.879046,NULL),(1632,0,1,0,359.370000,277.209034,277.209034,277.209034,NULL),(1632,1,1,0,359.370000,277.209034,277.209034,277.209034,NULL),(1632,2,1,0,359.370000,277.209034,277.209034,277.209034,NULL),(1632,3,1,0,359.370000,277.209034,277.209034,277.209034,NULL),(1633,0,1,0,584.430000,450.814691,450.814691,450.814691,NULL),(1633,1,1,0,584.430000,450.814691,450.814691,450.814691,NULL),(1633,2,1,0,584.430000,450.814691,450.814691,450.814691,NULL),(1633,3,1,0,584.430000,450.814691,450.814691,450.814691,NULL),(1634,0,1,0,359.370000,277.209034,277.209034,277.209034,NULL),(1634,1,1,0,359.370000,277.209034,277.209034,277.209034,NULL),(1634,2,1,0,359.370000,277.209034,277.209034,277.209034,NULL),(1634,3,1,0,359.370000,277.209034,277.209034,277.209034,NULL),(1635,0,1,0,584.430000,450.814691,450.814691,450.814691,NULL),(1635,1,1,0,584.430000,450.814691,450.814691,450.814691,NULL),(1635,2,1,0,584.430000,450.814691,450.814691,450.814691,NULL),(1635,3,1,0,584.430000,450.814691,450.814691,450.814691,NULL),(1636,0,1,0,600.160000,462.948420,462.948420,462.948420,NULL),(1636,1,1,0,600.160000,462.948420,462.948420,462.948420,NULL),(1636,2,1,0,600.160000,462.948420,462.948420,462.948420,NULL),(1636,3,1,0,600.160000,462.948420,462.948420,462.948420,NULL),(1637,0,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1637,1,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1637,2,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1637,3,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1638,0,1,0,289.190000,223.073936,223.073936,223.073936,NULL),(1638,1,1,0,289.190000,223.073936,223.073936,223.073936,NULL),(1638,2,1,0,289.190000,223.073936,223.073936,223.073936,NULL),(1638,3,1,0,289.190000,223.073936,223.073936,223.073936,NULL),(1639,0,1,0,452.540000,349.078043,349.078043,349.078043,NULL),(1639,1,1,0,452.540000,349.078043,349.078043,349.078043,NULL),(1639,2,1,0,452.540000,349.078043,349.078043,349.078043,NULL),(1639,3,1,0,452.540000,349.078043,349.078043,349.078043,NULL),(1640,0,1,0,497.310000,383.612501,383.612501,383.612501,NULL),(1640,1,1,0,497.310000,383.612501,383.612501,383.612501,NULL),(1640,2,1,0,497.310000,383.612501,383.612501,383.612501,NULL),(1640,3,1,0,497.310000,383.612501,383.612501,383.612501,NULL),(1641,0,1,0,301.290000,232.407574,232.407574,232.407574,NULL),(1641,1,1,0,301.290000,232.407574,232.407574,232.407574,NULL),(1641,2,1,0,301.290000,232.407574,232.407574,232.407574,NULL),(1641,3,1,0,301.290000,232.407574,232.407574,232.407574,NULL),(1642,0,1,0,444.070000,342.544496,342.544496,342.544496,NULL),(1642,1,1,0,444.070000,342.544496,342.544496,342.544496,NULL),(1642,2,1,0,444.070000,342.544496,342.544496,342.544496,NULL),(1642,3,1,0,444.070000,342.544496,342.544496,342.544496,NULL),(1643,0,1,0,565.070000,435.880871,435.880871,435.880871,NULL),(1643,1,1,0,565.070000,435.880871,435.880871,435.880871,NULL),(1643,2,1,0,565.070000,435.880871,435.880871,435.880871,NULL),(1643,3,1,0,565.070000,435.880871,435.880871,435.880871,NULL),(1644,0,1,0,350.900000,270.675488,270.675488,270.675488,NULL),(1644,1,1,0,350.900000,270.675488,270.675488,270.675488,NULL),(1644,2,1,0,350.900000,270.675488,270.675488,270.675488,NULL),(1644,3,1,0,350.900000,270.675488,270.675488,270.675488,NULL),(1645,0,1,0,574.750000,443.347781,443.347781,443.347781,NULL),(1645,1,1,0,574.750000,443.347781,443.347781,443.347781,NULL),(1645,2,1,0,574.750000,443.347781,443.347781,443.347781,NULL),(1645,3,1,0,574.750000,443.347781,443.347781,443.347781,NULL),(1646,0,1,0,234.740000,181.072568,181.072568,181.072568,NULL),(1646,1,1,0,234.740000,181.072568,181.072568,181.072568,NULL),(1646,2,1,0,234.740000,181.072568,181.072568,181.072568,NULL),(1646,3,1,0,234.740000,181.072568,181.072568,181.072568,NULL),(1647,0,1,0,361.790000,279.075761,279.075761,279.075761,NULL),(1647,1,1,0,361.790000,279.075761,279.075761,279.075761,NULL),(1647,2,1,0,361.790000,279.075761,279.075761,279.075761,NULL),(1647,3,1,0,361.790000,279.075761,279.075761,279.075761,NULL),(1648,0,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1648,1,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1648,2,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1648,3,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1649,0,1,0,308.550000,238.007756,238.007756,238.007756,NULL),(1649,1,1,0,308.550000,238.007756,238.007756,238.007756,NULL),(1649,2,1,0,308.550000,238.007756,238.007756,238.007756,NULL),(1649,3,1,0,308.550000,238.007756,238.007756,238.007756,NULL),(1650,0,1,0,471.900000,364.011862,364.011862,364.011862,NULL),(1650,1,1,0,471.900000,364.011862,364.011862,364.011862,NULL),(1650,2,1,0,471.900000,364.011862,364.011862,364.011862,NULL),(1650,3,1,0,471.900000,364.011862,364.011862,364.011862,NULL),(1651,0,1,0,542.080000,418.146960,418.146960,418.146960,NULL),(1651,1,1,0,542.080000,418.146960,418.146960,418.146960,NULL),(1651,2,1,0,542.080000,418.146960,418.146960,418.146960,NULL),(1651,3,1,0,542.080000,418.146960,418.146960,418.146960,NULL),(1652,0,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1652,1,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1652,2,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1652,3,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1653,0,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1653,1,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1653,2,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1653,3,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1654,0,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1654,1,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1654,2,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1654,3,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1655,0,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1655,1,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1655,2,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1655,3,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1656,0,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1656,1,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1656,2,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1656,3,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1657,0,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1657,1,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1657,2,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1657,3,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1658,0,1,0,396.880000,306.143310,306.143310,306.143310,NULL),(1658,1,1,0,396.880000,306.143310,306.143310,306.143310,NULL),(1658,2,1,0,396.880000,306.143310,306.143310,306.143310,NULL),(1658,3,1,0,396.880000,306.143310,306.143310,306.143310,NULL),(1659,0,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1659,1,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1659,2,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1659,3,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1660,0,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1660,1,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1660,2,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1660,3,1,0,332.750000,256.675031,256.675031,256.675031,NULL),(1661,0,1,0,396.880000,306.143310,306.143310,306.143310,NULL),(1661,1,1,0,396.880000,306.143310,306.143310,306.143310,NULL),(1661,2,1,0,396.880000,306.143310,306.143310,306.143310,NULL),(1661,3,1,0,396.880000,306.143310,306.143310,306.143310,NULL),(1662,0,1,0,240.790000,185.739386,185.739386,185.739386,NULL),(1662,1,1,0,240.790000,185.739386,185.739386,185.739386,NULL),(1662,2,1,0,240.790000,185.739386,185.739386,185.739386,NULL),(1662,3,1,0,240.790000,185.739386,185.739386,185.739386,NULL),(1663,0,1,0,356.950000,275.342306,275.342306,275.342306,NULL),(1663,1,1,0,356.950000,275.342306,275.342306,275.342306,NULL),(1663,2,1,0,356.950000,275.342306,275.342306,275.342306,NULL),(1663,3,1,0,356.950000,275.342306,275.342306,275.342306,NULL),(1664,0,1,0,514.250000,396.679594,396.679594,396.679594,NULL),(1664,1,1,0,514.250000,396.679594,396.679594,396.679594,NULL),(1664,2,1,0,514.250000,396.679594,396.679594,396.679594,NULL),(1664,3,1,0,514.250000,396.679594,396.679594,396.679594,NULL),(1665,0,1,0,240.790000,185.739386,185.739386,185.739386,NULL),(1665,1,1,0,240.790000,185.739386,185.739386,185.739386,NULL),(1665,2,1,0,240.790000,185.739386,185.739386,185.739386,NULL),(1665,3,1,0,240.790000,185.739386,185.739386,185.739386,NULL),(1666,0,1,0,356.950000,275.342306,275.342306,275.342306,NULL),(1666,1,1,0,356.950000,275.342306,275.342306,275.342306,NULL),(1666,2,1,0,356.950000,275.342306,275.342306,275.342306,NULL),(1666,3,1,0,356.950000,275.342306,275.342306,275.342306,NULL),(1667,0,1,0,514.250000,396.679594,396.679594,396.679594,NULL),(1667,1,1,0,514.250000,396.679594,396.679594,396.679594,NULL),(1667,2,1,0,514.250000,396.679594,396.679594,396.679594,NULL),(1667,3,1,0,514.250000,396.679594,396.679594,396.679594,NULL),(1668,0,1,0,240.790000,185.739386,185.739386,185.739386,NULL),(1668,1,1,0,240.790000,185.739386,185.739386,185.739386,NULL),(1668,2,1,0,240.790000,185.739386,185.739386,185.739386,NULL),(1668,3,1,0,240.790000,185.739386,185.739386,185.739386,NULL),(1669,0,1,0,356.950000,275.342306,275.342306,275.342306,NULL),(1669,1,1,0,356.950000,275.342306,275.342306,275.342306,NULL),(1669,2,1,0,356.950000,275.342306,275.342306,275.342306,NULL),(1669,3,1,0,356.950000,275.342306,275.342306,275.342306,NULL),(1670,0,1,0,514.250000,396.679594,396.679594,396.679594,NULL),(1670,1,1,0,514.250000,396.679594,396.679594,396.679594,NULL),(1670,2,1,0,514.250000,396.679594,396.679594,396.679594,NULL),(1670,3,1,0,514.250000,396.679594,396.679594,396.679594,NULL),(1671,0,1,0,617.100000,476.015512,476.015512,476.015512,NULL),(1671,1,1,0,617.100000,476.015512,476.015512,476.015512,NULL),(1671,2,1,0,617.100000,476.015512,476.015512,476.015512,NULL),(1671,3,1,0,617.100000,476.015512,476.015512,476.015512,NULL),(1672,0,1,0,205.700000,158.671837,158.671837,158.671837,NULL),(1672,1,1,0,205.700000,158.671837,158.671837,158.671837,NULL),(1672,2,1,0,205.700000,158.671837,158.671837,158.671837,NULL),(1672,3,1,0,205.700000,158.671837,158.671837,158.671837,NULL),(1673,0,1,0,365.420000,281.875853,281.875853,281.875853,NULL),(1673,1,1,0,365.420000,281.875853,281.875853,281.875853,NULL),(1673,2,1,0,365.420000,281.875853,281.875853,281.875853,NULL),(1673,3,1,0,365.420000,281.875853,281.875853,281.875853,NULL),(1674,0,1,0,540.870000,417.213596,417.213596,417.213596,NULL),(1674,1,1,0,540.870000,417.213596,417.213596,417.213596,NULL),(1674,2,1,0,540.870000,417.213596,417.213596,417.213596,NULL),(1674,3,1,0,540.870000,417.213596,417.213596,417.213596,NULL),(1675,0,1,0,211.750000,163.338656,163.338656,163.338656,NULL),(1675,1,1,0,211.750000,163.338656,163.338656,163.338656,NULL),(1675,2,1,0,211.750000,163.338656,163.338656,163.338656,NULL),(1675,3,1,0,211.750000,163.338656,163.338656,163.338656,NULL),(1676,0,1,0,354.530000,273.475579,273.475579,273.475579,NULL),(1676,1,1,0,354.530000,273.475579,273.475579,273.475579,NULL),(1676,2,1,0,354.530000,273.475579,273.475579,273.475579,NULL),(1676,3,1,0,354.530000,273.475579,273.475579,273.475579,NULL),(1677,0,1,0,516.670000,398.546321,398.546321,398.546321,NULL),(1677,1,1,0,516.670000,398.546321,398.546321,398.546321,NULL),(1677,2,1,0,516.670000,398.546321,398.546321,398.546321,NULL),(1677,3,1,0,516.670000,398.546321,398.546321,398.546321,NULL),(1678,0,1,0,225.060000,173.605658,173.605658,173.605658,NULL),(1678,1,1,0,225.060000,173.605658,173.605658,173.605658,NULL),(1678,2,1,0,225.060000,173.605658,173.605658,173.605658,NULL),(1678,3,1,0,225.060000,173.605658,173.605658,173.605658,NULL),(1679,0,1,0,335.170000,258.541759,258.541759,258.541759,NULL),(1679,1,1,0,335.170000,258.541759,258.541759,258.541759,NULL),(1679,2,1,0,335.170000,258.541759,258.541759,258.541759,NULL),(1679,3,1,0,335.170000,258.541759,258.541759,258.541759,NULL),(1680,0,1,0,486.420000,375.212228,375.212228,375.212228,NULL),(1680,1,1,0,486.420000,375.212228,375.212228,375.212228,NULL),(1680,2,1,0,486.420000,375.212228,375.212228,375.212228,NULL),(1680,3,1,0,486.420000,375.212228,375.212228,375.212228,NULL),(1681,0,1,0,205.700000,158.671837,158.671837,158.671837,NULL),(1681,1,1,0,205.700000,158.671837,158.671837,158.671837,NULL),(1681,2,1,0,205.700000,158.671837,158.671837,158.671837,NULL),(1681,3,1,0,205.700000,158.671837,158.671837,158.671837,NULL),(1682,0,1,0,365.420000,281.875853,281.875853,281.875853,NULL),(1682,1,1,0,365.420000,281.875853,281.875853,281.875853,NULL),(1682,2,1,0,365.420000,281.875853,281.875853,281.875853,NULL),(1682,3,1,0,365.420000,281.875853,281.875853,281.875853,NULL),(1683,0,1,0,216.590000,167.072111,167.072111,167.072111,NULL),(1683,1,1,0,216.590000,167.072111,167.072111,167.072111,NULL),(1683,2,1,0,216.590000,167.072111,167.072111,167.072111,NULL),(1683,3,1,0,216.590000,167.072111,167.072111,167.072111,NULL),(1684,0,1,0,360.580000,278.142398,278.142398,278.142398,NULL),(1684,1,1,0,360.580000,278.142398,278.142398,278.142398,NULL),(1684,2,1,0,360.580000,278.142398,278.142398,278.142398,NULL),(1684,3,1,0,360.580000,278.142398,278.142398,278.142398,NULL),(1685,0,1,0,211.750000,163.338656,163.338656,163.338656,NULL),(1685,1,1,0,211.750000,163.338656,163.338656,163.338656,NULL),(1685,2,1,0,211.750000,163.338656,163.338656,163.338656,NULL),(1685,3,1,0,211.750000,163.338656,163.338656,163.338656,NULL),(1686,0,1,0,347.270000,267.875396,267.875396,267.875396,NULL),(1686,1,1,0,347.270000,267.875396,267.875396,267.875396,NULL),(1686,2,1,0,347.270000,267.875396,267.875396,267.875396,NULL),(1686,3,1,0,347.270000,267.875396,267.875396,267.875396,NULL),(1687,0,1,0,504.570000,389.212684,389.212684,389.212684,NULL),(1687,1,1,0,504.570000,389.212684,389.212684,389.212684,NULL),(1687,2,1,0,504.570000,389.212684,389.212684,389.212684,NULL),(1687,3,1,0,504.570000,389.212684,389.212684,389.212684,NULL),(1688,0,1,0,258.940000,199.739843,199.739843,199.739843,NULL),(1688,1,1,0,258.940000,199.739843,199.739843,199.739843,NULL),(1688,2,1,0,258.940000,199.739843,199.739843,199.739843,NULL),(1688,3,1,0,258.940000,199.739843,199.739843,199.739843,NULL),(1689,0,1,0,370.260000,285.609307,285.609307,285.609307,NULL),(1689,1,1,0,370.260000,285.609307,285.609307,285.609307,NULL),(1689,2,1,0,370.260000,285.609307,285.609307,285.609307,NULL),(1689,3,1,0,370.260000,285.609307,285.609307,285.609307,NULL),(1690,0,1,0,496.100000,382.679138,382.679138,382.679138,NULL),(1690,1,1,0,496.100000,382.679138,382.679138,382.679138,NULL),(1690,2,1,0,496.100000,382.679138,382.679138,382.679138,NULL),(1690,3,1,0,496.100000,382.679138,382.679138,382.679138,NULL),(1691,0,1,0,211.750000,163.338656,163.338656,163.338656,NULL),(1691,1,1,0,211.750000,163.338656,163.338656,163.338656,NULL),(1691,2,1,0,211.750000,163.338656,163.338656,163.338656,NULL),(1691,3,1,0,211.750000,163.338656,163.338656,163.338656,NULL),(1692,0,1,0,375.100000,289.342763,289.342763,289.342763,NULL),(1692,1,1,0,375.100000,289.342763,289.342763,289.342763,NULL),(1692,2,1,0,375.100000,289.342763,289.342763,289.342763,NULL),(1692,3,1,0,375.100000,289.342763,289.342763,289.342763,NULL),(1693,0,1,0,225.060000,173.605658,173.605658,173.605658,NULL),(1693,1,1,0,225.060000,173.605658,173.605658,173.605658,NULL),(1693,2,1,0,225.060000,173.605658,173.605658,173.605658,NULL),(1693,3,1,0,225.060000,173.605658,173.605658,173.605658,NULL),(1694,0,1,0,335.170000,258.541759,258.541759,258.541759,NULL),(1694,1,1,0,335.170000,258.541759,258.541759,258.541759,NULL),(1694,2,1,0,335.170000,258.541759,258.541759,258.541759,NULL),(1694,3,1,0,335.170000,258.541759,258.541759,258.541759,NULL),(1695,0,1,0,505.780000,390.146047,390.146047,390.146047,NULL),(1695,1,1,0,505.780000,390.146047,390.146047,390.146047,NULL),(1695,2,1,0,505.780000,390.146047,390.146047,390.146047,NULL),(1695,3,1,0,505.780000,390.146047,390.146047,390.146047,NULL),(1696,0,1,0,258.940000,199.739843,199.739843,199.739843,NULL),(1696,1,1,0,258.940000,199.739843,199.739843,199.739843,NULL),(1696,2,1,0,258.940000,199.739843,199.739843,199.739843,NULL),(1696,3,1,0,258.940000,199.739843,199.739843,199.739843,NULL),(1697,0,1,0,370.260000,285.609307,285.609307,285.609307,NULL),(1697,1,1,0,370.260000,285.609307,285.609307,285.609307,NULL),(1697,2,1,0,370.260000,285.609307,285.609307,285.609307,NULL),(1697,3,1,0,370.260000,285.609307,285.609307,285.609307,NULL),(1698,0,1,0,496.100000,382.679138,382.679138,382.679138,NULL),(1698,1,1,0,496.100000,382.679138,382.679138,382.679138,NULL),(1698,2,1,0,496.100000,382.679138,382.679138,382.679138,NULL),(1698,3,1,0,496.100000,382.679138,382.679138,382.679138,NULL),(1699,0,1,0,369.050000,284.675944,284.675944,284.675944,NULL),(1699,1,1,0,369.050000,284.675944,284.675944,284.675944,NULL),(1699,2,1,0,369.050000,284.675944,284.675944,284.675944,NULL),(1699,3,1,0,369.050000,284.675944,284.675944,284.675944,NULL),(1700,0,1,0,509.410000,392.946139,392.946139,392.946139,NULL),(1700,1,1,0,509.410000,392.946139,392.946139,392.946139,NULL),(1700,2,1,0,509.410000,392.946139,392.946139,392.946139,NULL),(1700,3,1,0,509.410000,392.946139,392.946139,392.946139,NULL),(1701,0,1,0,369.050000,284.675944,284.675944,284.675944,NULL),(1701,1,1,0,369.050000,284.675944,284.675944,284.675944,NULL),(1701,2,1,0,369.050000,284.675944,284.675944,284.675944,NULL),(1701,3,1,0,369.050000,284.675944,284.675944,284.675944,NULL),(1702,0,1,0,509.410000,392.946139,392.946139,392.946139,NULL),(1702,1,1,0,509.410000,392.946139,392.946139,392.946139,NULL),(1702,2,1,0,509.410000,392.946139,392.946139,392.946139,NULL),(1702,3,1,0,509.410000,392.946139,392.946139,392.946139,NULL),(1703,0,1,0,211.750000,163.338656,163.338656,163.338656,NULL),(1703,1,1,0,211.750000,163.338656,163.338656,163.338656,NULL),(1703,2,1,0,211.750000,163.338656,163.338656,163.338656,NULL),(1703,3,1,0,211.750000,163.338656,163.338656,163.338656,NULL),(1704,0,1,0,354.530000,273.475579,273.475579,273.475579,NULL),(1704,1,1,0,354.530000,273.475579,273.475579,273.475579,NULL),(1704,2,1,0,354.530000,273.475579,273.475579,273.475579,NULL),(1704,3,1,0,354.530000,273.475579,273.475579,273.475579,NULL),(1705,0,1,0,216.590000,167.072111,167.072111,167.072111,NULL),(1705,1,1,0,216.590000,167.072111,167.072111,167.072111,NULL),(1705,2,1,0,216.590000,167.072111,167.072111,167.072111,NULL),(1705,3,1,0,216.590000,167.072111,167.072111,167.072111,NULL),(1706,0,1,0,360.580000,278.142398,278.142398,278.142398,NULL),(1706,1,1,0,360.580000,278.142398,278.142398,278.142398,NULL),(1706,2,1,0,360.580000,278.142398,278.142398,278.142398,NULL),(1706,3,1,0,360.580000,278.142398,278.142398,278.142398,NULL),(1707,0,1,0,211.750000,163.338656,163.338656,163.338656,NULL),(1707,1,1,0,211.750000,163.338656,163.338656,163.338656,NULL),(1707,2,1,0,211.750000,163.338656,163.338656,163.338656,NULL),(1707,3,1,0,211.750000,163.338656,163.338656,163.338656,NULL),(1708,0,1,0,347.270000,267.875396,267.875396,267.875396,NULL),(1708,1,1,0,347.270000,267.875396,267.875396,267.875396,NULL),(1708,2,1,0,347.270000,267.875396,267.875396,267.875396,NULL),(1708,3,1,0,347.270000,267.875396,267.875396,267.875396,NULL),(1709,0,1,0,505.780000,390.146047,390.146047,390.146047,NULL),(1709,1,1,0,505.780000,390.146047,390.146047,390.146047,NULL),(1709,2,1,0,505.780000,390.146047,390.146047,390.146047,NULL),(1709,3,1,0,505.780000,390.146047,390.146047,390.146047,NULL),(1710,0,1,0,258.940000,199.739843,199.739843,199.739843,NULL),(1710,1,1,0,258.940000,199.739843,199.739843,199.739843,NULL),(1710,2,1,0,258.940000,199.739843,199.739843,199.739843,NULL),(1710,3,1,0,258.940000,199.739843,199.739843,199.739843,NULL),(1711,0,1,0,370.260000,285.609307,285.609307,285.609307,NULL),(1711,1,1,0,370.260000,285.609307,285.609307,285.609307,NULL),(1711,2,1,0,370.260000,285.609307,285.609307,285.609307,NULL),(1711,3,1,0,370.260000,285.609307,285.609307,285.609307,NULL),(1712,0,1,0,496.100000,382.679138,382.679138,382.679138,NULL),(1712,1,1,0,496.100000,382.679138,382.679138,382.679138,NULL),(1712,2,1,0,496.100000,382.679138,382.679138,382.679138,NULL),(1712,3,1,0,496.100000,382.679138,382.679138,382.679138,NULL),(1713,0,1,0,268.620000,207.206753,207.206753,207.206753,NULL),(1713,1,1,0,268.620000,207.206753,207.206753,207.206753,NULL),(1713,2,1,0,268.620000,207.206753,207.206753,207.206753,NULL),(1713,3,1,0,268.620000,207.206753,207.206753,207.206753,NULL),(1714,0,1,0,438.020000,337.877678,337.877678,337.877678,NULL),(1714,1,1,0,438.020000,337.877678,337.877678,337.877678,NULL),(1714,2,1,0,438.020000,337.877678,337.877678,337.877678,NULL),(1714,3,1,0,438.020000,337.877678,337.877678,337.877678,NULL),(1715,0,1,0,502.150000,387.345956,387.345956,387.345956,NULL),(1715,1,1,0,502.150000,387.345956,387.345956,387.345956,NULL),(1715,2,1,0,502.150000,387.345956,387.345956,387.345956,NULL),(1715,3,1,0,502.150000,387.345956,387.345956,387.345956,NULL),(1716,0,1,0,216.590000,167.072111,167.072111,167.072111,NULL),(1716,1,1,0,216.590000,167.072111,167.072111,167.072111,NULL),(1716,2,1,0,216.590000,167.072111,167.072111,167.072111,NULL),(1716,3,1,0,216.590000,167.072111,167.072111,167.072111,NULL),(1717,0,1,0,360.580000,278.142398,278.142398,278.142398,NULL),(1717,1,1,0,360.580000,278.142398,278.142398,278.142398,NULL),(1717,2,1,0,360.580000,278.142398,278.142398,278.142398,NULL),(1717,3,1,0,360.580000,278.142398,278.142398,278.142398,NULL),(1718,0,1,0,211.750000,163.338656,163.338656,163.338656,NULL),(1718,1,1,0,211.750000,163.338656,163.338656,163.338656,NULL),(1718,2,1,0,211.750000,163.338656,163.338656,163.338656,NULL),(1718,3,1,0,211.750000,163.338656,163.338656,163.338656,NULL),(1719,0,1,0,347.270000,267.875396,267.875396,267.875396,NULL),(1719,1,1,0,347.270000,267.875396,267.875396,267.875396,NULL),(1719,2,1,0,347.270000,267.875396,267.875396,267.875396,NULL),(1719,3,1,0,347.270000,267.875396,267.875396,267.875396,NULL),(1720,0,1,0,504.570000,389.212684,389.212684,389.212684,NULL),(1720,1,1,0,504.570000,389.212684,389.212684,389.212684,NULL),(1720,2,1,0,504.570000,389.212684,389.212684,389.212684,NULL),(1720,3,1,0,504.570000,389.212684,389.212684,389.212684,NULL);
