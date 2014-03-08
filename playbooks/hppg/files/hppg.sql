-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: hppg
-- ------------------------------------------------------
-- Server version	5.5.35-0+wheezy1

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
-- Table structure for table `lh_article_static`
--

DROP TABLE IF EXISTS `lh_article_static`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_article_static` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_article_static`
--

LOCK TABLES `lh_article_static` WRITE;
/*!40000 ALTER TABLE `lh_article_static` DISABLE KEYS */;
INSERT INTO `lh_article_static` VALUES (1,'Contact','<p>\r\n	Contact information goes here</p>\r\n'),(2,'Conditions','<p>\r\n	Somes conditions goes here</p>\r\n'),(3,'Gallery footer text','<p>\r\n	&copy; 2010 <a href=\"lh:article/static/2\">Conditions</a> | <a href=\"lh:article/static/1\">Contact</a> | <a href=\"lh:feedback/form\">Feedback</a></p>\r\n');
/*!40000 ALTER TABLE `lh_article_static` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_delay_image_hit`
--

DROP TABLE IF EXISTS `lh_delay_image_hit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_delay_image_hit` (
  `pid` int(11) NOT NULL,
  `mtime` int(11) NOT NULL,
  KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_delay_image_hit`
--

LOCK TABLES `lh_delay_image_hit` WRITE;
/*!40000 ALTER TABLE `lh_delay_image_hit` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_delay_image_hit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_forgotpasswordhash`
--

DROP TABLE IF EXISTS `lh_forgotpasswordhash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_forgotpasswordhash` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `hash` varchar(100) NOT NULL,
  `created` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_forgotpasswordhash`
--

LOCK TABLES `lh_forgotpasswordhash` WRITE;
/*!40000 ALTER TABLE `lh_forgotpasswordhash` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_forgotpasswordhash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_forum_category`
--

DROP TABLE IF EXISTS `lh_forum_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_forum_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(200) NOT NULL,
  `name` varchar(50) NOT NULL,
  `placement` int(11) NOT NULL DEFAULT '0',
  `parent` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `topic_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Static counter for performance',
  `message_count` int(11) NOT NULL DEFAULT '0',
  `last_topic_id` int(11) NOT NULL DEFAULT '0' COMMENT 'For performance we store last topic id with message',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  KEY `id` (`placement`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_forum_category`
--

LOCK TABLES `lh_forum_category` WRITE;
/*!40000 ALTER TABLE `lh_forum_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_forum_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_forum_file`
--

DROP TABLE IF EXISTS `lh_forum_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_forum_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `file_path` varchar(250) NOT NULL,
  `file_size` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `message_id` (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_forum_file`
--

LOCK TABLES `lh_forum_file` WRITE;
/*!40000 ALTER TABLE `lh_forum_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_forum_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_forum_message`
--

DROP TABLE IF EXISTS `lh_forum_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_forum_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL,
  `ctime` int(11) NOT NULL,
  `content` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip` varchar(39) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `topic_id` (`topic_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_forum_message`
--

LOCK TABLES `lh_forum_message` WRITE;
/*!40000 ALTER TABLE `lh_forum_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_forum_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_forum_message_delta`
--

DROP TABLE IF EXISTS `lh_forum_message_delta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_forum_message_delta` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_forum_message_delta`
--

LOCK TABLES `lh_forum_message_delta` WRITE;
/*!40000 ALTER TABLE `lh_forum_message_delta` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_forum_message_delta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_forum_report`
--

DROP TABLE IF EXISTS `lh_forum_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_forum_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `ctime` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `msg_id` (`msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_forum_report`
--

LOCK TABLES `lh_forum_report` WRITE;
/*!40000 ALTER TABLE `lh_forum_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_forum_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_forum_topic`
--

DROP TABLE IF EXISTS `lh_forum_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_forum_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ctime` int(11) NOT NULL DEFAULT '0',
  `topic_name` varchar(200) NOT NULL,
  `path_1` int(11) NOT NULL DEFAULT '0',
  `path_2` int(11) NOT NULL,
  `path_3` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `path_0` int(11) NOT NULL DEFAULT '0',
  `message_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Static counter for performance',
  `last_message_ctime` int(11) NOT NULL DEFAULT '0',
  `topic_status` tinyint(1) NOT NULL DEFAULT '0',
  `main_category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `path_1` (`path_1`,`last_message_ctime`,`id`),
  KEY `path_0` (`path_0`,`last_message_ctime`,`id`),
  KEY `path_3` (`path_3`,`last_message_ctime`,`id`),
  KEY `path_2` (`path_2`,`last_message_ctime`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_forum_topic`
--

LOCK TABLES `lh_forum_topic` WRITE;
/*!40000 ALTER TABLE `lh_forum_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_forum_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_gallery_albums`
--

DROP TABLE IF EXISTS `lh_gallery_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_gallery_albums` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `pos` int(11) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '0',
  `keyword` varchar(50) DEFAULT NULL,
  `owner_id` int(11) NOT NULL,
  `public` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `album_pid` int(11) NOT NULL DEFAULT '0',
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  KEY `owner_id` (`owner_id`),
  KEY `addtime` (`addtime`),
  KEY `alb_category` (`category`,`hidden`,`pos`,`aid`),
  KEY `aid` (`category`,`pos`,`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_gallery_albums`
--

LOCK TABLES `lh_gallery_albums` WRITE;
/*!40000 ALTER TABLE `lh_gallery_albums` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_gallery_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_gallery_categorys`
--

DROP TABLE IF EXISTS `lh_gallery_categorys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_gallery_categorys` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `pos` int(11) NOT NULL DEFAULT '0',
  `parent` int(11) NOT NULL DEFAULT '0',
  `hide_frontpage` int(11) NOT NULL,
  `has_albums` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `cat_parent` (`parent`),
  KEY `cat_pos` (`pos`),
  KEY `cat_owner_id` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_gallery_categorys`
--

LOCK TABLES `lh_gallery_categorys` WRITE;
/*!40000 ALTER TABLE `lh_gallery_categorys` DISABLE KEYS */;
INSERT INTO `lh_gallery_categorys` VALUES (1,1,'Users galleries','',0,0,1,0);
/*!40000 ALTER TABLE `lh_gallery_categorys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_gallery_comments`
--

DROP TABLE IF EXISTS `lh_gallery_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_gallery_comments` (
  `pid` mediumint(10) NOT NULL DEFAULT '0',
  `msg_id` mediumint(10) NOT NULL AUTO_INCREMENT,
  `msg_author` varchar(25) NOT NULL DEFAULT '',
  `msg_body` text NOT NULL,
  `msg_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `msg_raw_ip` tinytext,
  `msg_hdr_ip` tinytext,
  `author_md5_id` varchar(32) NOT NULL DEFAULT '',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `lang` varchar(5) NOT NULL,
  PRIMARY KEY (`msg_id`),
  KEY `com_pic_id` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_gallery_comments`
--

LOCK TABLES `lh_gallery_comments` WRITE;
/*!40000 ALTER TABLE `lh_gallery_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_gallery_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_gallery_duplicate_collection`
--

DROP TABLE IF EXISTS `lh_gallery_duplicate_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_gallery_duplicate_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_gallery_duplicate_collection`
--

LOCK TABLES `lh_gallery_duplicate_collection` WRITE;
/*!40000 ALTER TABLE `lh_gallery_duplicate_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_gallery_duplicate_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_gallery_duplicate_image`
--

DROP TABLE IF EXISTS `lh_gallery_duplicate_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_gallery_duplicate_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `duplicate_collection_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_gallery_duplicate_image`
--

LOCK TABLES `lh_gallery_duplicate_image` WRITE;
/*!40000 ALTER TABLE `lh_gallery_duplicate_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_gallery_duplicate_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_gallery_duplicate_image_hash`
--

DROP TABLE IF EXISTS `lh_gallery_duplicate_image_hash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_gallery_duplicate_image_hash` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `hash` varchar(40) NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_gallery_duplicate_image_hash`
--

LOCK TABLES `lh_gallery_duplicate_image_hash` WRITE;
/*!40000 ALTER TABLE `lh_gallery_duplicate_image_hash` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_gallery_duplicate_image_hash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_gallery_face_data`
--

DROP TABLE IF EXISTS `lh_gallery_face_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_gallery_face_data` (
  `pid` int(11) NOT NULL,
  `data` text NOT NULL,
  `sphinx_data` varchar(255) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_gallery_face_data`
--

LOCK TABLES `lh_gallery_face_data` WRITE;
/*!40000 ALTER TABLE `lh_gallery_face_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_gallery_face_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_gallery_filetypes`
--

DROP TABLE IF EXISTS `lh_gallery_filetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_gallery_filetypes` (
  `extension` char(7) NOT NULL DEFAULT '',
  `mime` char(254) DEFAULT NULL,
  `content` char(15) DEFAULT NULL,
  `player` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`extension`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_gallery_filetypes`
--

LOCK TABLES `lh_gallery_filetypes` WRITE;
/*!40000 ALTER TABLE `lh_gallery_filetypes` DISABLE KEYS */;
INSERT INTO `lh_gallery_filetypes` VALUES ('avi','video/x-msvideo','movie','VIDEO'),('bmp','image/bmp','image','IMAGE'),('flv','video/x-flv','movie','FLV'),('gif','image/gif','image','IMAGE'),('iff','image/iff','image','IMAGE'),('jb2','image/jb2','image','IMAGE'),('jp2','image/jp2','image','IMAGE'),('jpc','image/jpc','image','IMAGE'),('jpe','image/jpe','image','IMAGE'),('jpeg','image/jpeg','image','IMAGE'),('jpg','image/jpg','image','IMAGE'),('jpx','image/jpx','image','IMAGE'),('mp4','video/mp4','movie','VIDEO'),('mpeg','video/mpeg','movie','VIDEO'),('mpg','video/mpeg','movie','VIDEO'),('oga','audio/ogg','audio','HTMLA'),('ogg','audio/ogg','audio','HTMLA'),('ogv','video/ogg','movie','HTMLV'),('png','image/png','image','IMAGE'),('psd','image/psd','image','IMAGE'),('swc','image/swc','image','IMAGE'),('swf','application/x-shockwave-flash','movie','SWF'),('wmv','video/x-ms-wmv','movie','VIDEO');
/*!40000 ALTER TABLE `lh_gallery_filetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_gallery_images`
--

DROP TABLE IF EXISTS `lh_gallery_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_gallery_images` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL DEFAULT '0',
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(11) NOT NULL DEFAULT '0',
  `total_filesize` int(11) NOT NULL DEFAULT '0',
  `pwidth` smallint(6) NOT NULL DEFAULT '0',
  `pheight` smallint(6) NOT NULL DEFAULT '0',
  `hits` int(10) NOT NULL DEFAULT '0',
  `ctime` int(11) NOT NULL DEFAULT '0',
  `owner_id` int(11) NOT NULL DEFAULT '0',
  `pic_rating` int(11) NOT NULL DEFAULT '0',
  `votes` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `caption` text NOT NULL,
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `pic_raw_ip` tinytext,
  `approved` int(11) NOT NULL DEFAULT '0',
  `mtime` int(11) NOT NULL,
  `comtime` int(11) NOT NULL,
  `has_preview` int(11) NOT NULL DEFAULT '0' COMMENT 'Used for video files',
  `anaglyph` int(11) NOT NULL DEFAULT '0',
  `rtime` int(11) NOT NULL,
  `media_type` tinyint(4) NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `owner_id` (`owner_id`),
  KEY `pic_hits` (`hits`),
  KEY `pic_rate` (`pic_rating`),
  KEY `pic_aid` (`aid`),
  KEY `mtime` (`mtime`),
  KEY `pid_3` (`ctime`),
  KEY `aid_4` (`aid`,`approved`,`pwidth`,`pheight`,`comtime`,`pid`),
  KEY `approved` (`approved`,`pid`),
  KEY `pid_12` (`pwidth`,`pheight`,`approved`,`pid`),
  KEY `pid_4` (`approved`,`hits`,`pid`),
  KEY `pid_4res` (`pwidth`,`pheight`,`approved`,`hits`,`pid`),
  KEY `pid_5` (`approved`,`pic_rating`,`votes`,`pid`),
  KEY `pwidth_2` (`pwidth`,`pheight`,`approved`,`pic_rating`,`votes`,`pid`),
  KEY `pid` (`approved`,`mtime`,`pid`),
  KEY `pwidth` (`pwidth`,`pheight`,`approved`,`mtime`,`pid`),
  KEY `comtime` (`approved`,`comtime`,`pid`),
  KEY `pid_com_res` (`pwidth`,`pheight`,`approved`,`comtime`,`pid`),
  KEY `pid_7` (`aid`,`approved`,`hits`,`pid`),
  KEY `pid_6` (`aid`,`approved`,`pid`),
  KEY `pid_8` (`aid`,`approved`,`mtime`,`pid`),
  KEY `pid_9` (`aid`,`approved`,`pic_rating`,`votes`,`pid`),
  KEY `pid_10` (`aid`,`approved`,`comtime`,`pid`),
  KEY `aid` (`aid`,`pwidth`,`pheight`,`approved`,`pid`),
  KEY `pid_2` (`ctime`,`approved`,`pid`),
  KEY `pid_11` (`aid`,`pwidth`,`pheight`,`approved`,`hits`,`pid`),
  KEY `aid_2` (`aid`,`pwidth`,`pheight`,`approved`,`mtime`,`pid`),
  KEY `aid_3` (`aid`,`pwidth`,`pheight`,`approved`,`pic_rating`,`votes`,`pid`),
  KEY `approved_2` (`approved`),
  KEY `rated_gen` (`approved`,`rtime`,`pid`),
  KEY `rated_gen_res` (`pwidth`,`pheight`,`approved`,`rtime`,`pid`),
  KEY `a_rated_gen_res` (`aid`,`pwidth`,`pheight`,`approved`,`rtime`,`pid`),
  KEY `a_rated_gen` (`aid`,`approved`,`rtime`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_gallery_images`
--

LOCK TABLES `lh_gallery_images` WRITE;
/*!40000 ALTER TABLE `lh_gallery_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_gallery_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_gallery_images_comment_ban_ip`
--

DROP TABLE IF EXISTS `lh_gallery_images_comment_ban_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_gallery_images_comment_ban_ip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(39) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_gallery_images_comment_ban_ip`
--

LOCK TABLES `lh_gallery_images_comment_ban_ip` WRITE;
/*!40000 ALTER TABLE `lh_gallery_images_comment_ban_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_gallery_images_comment_ban_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_gallery_images_delta`
--

DROP TABLE IF EXISTS `lh_gallery_images_delta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_gallery_images_delta` (
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_gallery_images_delta`
--

LOCK TABLES `lh_gallery_images_delta` WRITE;
/*!40000 ALTER TABLE `lh_gallery_images_delta` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_gallery_images_delta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_gallery_images_rate_ban_ip`
--

DROP TABLE IF EXISTS `lh_gallery_images_rate_ban_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_gallery_images_rate_ban_ip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(39) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_gallery_images_rate_ban_ip`
--

LOCK TABLES `lh_gallery_images_rate_ban_ip` WRITE;
/*!40000 ALTER TABLE `lh_gallery_images_rate_ban_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_gallery_images_rate_ban_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_gallery_images_rate_last_ip`
--

DROP TABLE IF EXISTS `lh_gallery_images_rate_last_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_gallery_images_rate_last_ip` (
  `pid` int(11) NOT NULL,
  `ip` varchar(39) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_gallery_images_rate_last_ip`
--

LOCK TABLES `lh_gallery_images_rate_last_ip` WRITE;
/*!40000 ALTER TABLE `lh_gallery_images_rate_last_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_gallery_images_rate_last_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_gallery_last_index`
--

DROP TABLE IF EXISTS `lh_gallery_last_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_gallery_last_index` (
  `identifier` varchar(50) NOT NULL,
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_gallery_last_index`
--

LOCK TABLES `lh_gallery_last_index` WRITE;
/*!40000 ALTER TABLE `lh_gallery_last_index` DISABLE KEYS */;
INSERT INTO `lh_gallery_last_index` VALUES ('face_index',0),('image_index',0),('imgseek_index',0),('sphinx_index',0);
/*!40000 ALTER TABLE `lh_gallery_last_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_gallery_lastsearch`
--

DROP TABLE IF EXISTS `lh_gallery_lastsearch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_gallery_lastsearch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `countresult` int(11) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_gallery_lastsearch`
--

LOCK TABLES `lh_gallery_lastsearch` WRITE;
/*!40000 ALTER TABLE `lh_gallery_lastsearch` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_gallery_lastsearch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_gallery_myfavorites_images`
--

DROP TABLE IF EXISTS `lh_gallery_myfavorites_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_gallery_myfavorites_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_gallery_myfavorites_images`
--

LOCK TABLES `lh_gallery_myfavorites_images` WRITE;
/*!40000 ALTER TABLE `lh_gallery_myfavorites_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_gallery_myfavorites_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_gallery_myfavorites_session`
--

DROP TABLE IF EXISTS `lh_gallery_myfavorites_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_gallery_myfavorites_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `session_hash` varchar(40) NOT NULL,
  `mtime` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `session_hash` (`session_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_gallery_myfavorites_session`
--

LOCK TABLES `lh_gallery_myfavorites_session` WRITE;
/*!40000 ALTER TABLE `lh_gallery_myfavorites_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_gallery_myfavorites_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_gallery_pallete`
--

DROP TABLE IF EXISTS `lh_gallery_pallete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_gallery_pallete` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `red` int(11) NOT NULL DEFAULT '0',
  `green` int(11) NOT NULL DEFAULT '0',
  `blue` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `position` (`position`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_gallery_pallete`
--

LOCK TABLES `lh_gallery_pallete` WRITE;
/*!40000 ALTER TABLE `lh_gallery_pallete` DISABLE KEYS */;
INSERT INTO `lh_gallery_pallete` VALUES (1,213,245,254,20),(2,174,235,253,40),(3,136,225,251,60),(4,108,213,250,80),(5,89,175,213,100),(6,76,151,177,120),(7,60,118,140,140),(8,43,85,100,160),(9,32,62,74,180),(10,255,255,255,200),(11,247,247,247,400),(12,215,230,253,220),(13,176,205,252,240),(14,132,179,252,260),(15,90,152,250,280),(16,55,120,250,300),(17,49,105,209,320),(18,38,83,165,340),(19,28,61,120,360),(20,20,43,86,380),(21,205,200,252,420),(22,153,139,250,440),(23,101,79,249,460),(24,64,50,230,480),(25,54,38,175,500),(26,39,31,144,520),(27,32,25,116,540),(28,21,18,82,560),(29,16,13,61,580),(30,228,228,228,600),(31,224,200,252,620),(32,194,144,251,640),(33,165,87,249,660),(34,142,57,239,680),(35,116,45,184,700),(36,92,37,154,720),(37,73,29,121,740),(38,53,21,88,760),(39,37,15,63,780),(40,203,203,203,800),(41,238,210,226,820),(42,224,162,197,840),(43,210,112,166,860),(44,199,62,135,880),(45,159,49,105,900),(46,132,41,89,920),(47,104,32,71,940),(48,75,24,51,960),(49,54,15,36,980),(50,175,175,175,1000),(51,244,216,218,1020),(52,235,175,176,1040),(53,227,133,135,1060),(54,219,87,88,1080),(55,215,50,36,1100),(56,187,25,7,1120),(57,149,20,6,1140),(58,107,14,4,1160),(59,77,9,3,1180),(60,144,144,144,1200),(61,247,221,214,1220),(62,241,187,171,1240),(63,234,151,126,1260),(64,229,115,76,1280),(65,227,82,24,1300),(66,190,61,15,1320),(67,150,48,12,1340),(68,107,34,8,1360),(69,79,25,6,1380),(70,113,113,113,1400),(71,250,232,213,1420),(72,245,207,169,1440),(73,240,183,122,1460),(74,236,159,74,1480),(75,234,146,37,1500),(76,193,111,28,1520),(77,152,89,22,1540),(78,110,64,16,1560),(79,80,47,12,1580),(80,82,82,82,1600),(81,251,236,213,1620),(82,247,218,170,1640),(83,244,200,124,1660),(84,241,182,77,1680),(85,239,174,44,1700),(86,196,137,34,1720),(87,154,108,27,1740),(88,111,77,19,1760),(89,80,56,14,1780),(90,54,54,54,1800),(91,254,248,221,1820),(92,254,243,187,1840),(93,253,237,153,1860),(94,253,231,117,1880),(95,254,232,85,1900),(96,242,212,53,1920),(97,192,169,42,1940),(98,138,120,30,1960),(99,101,87,22,1980),(100,29,29,29,2000),(101,250,248,220,2020),(102,247,243,185,2040),(103,243,239,148,2060),(104,239,232,111,2080),(105,235,229,76,2100),(106,208,200,55,2120),(107,164,157,43,2140),(108,118,114,31,2160),(109,86,82,21,2180),(110,9,9,9,2200),(111,230,237,212,2220),(112,218,232,182,2240),(113,198,221,143,2260),(114,181,210,103,2280),(115,154,186,76,2300),(116,130,155,64,2320),(117,102,121,50,2340),(118,74,88,36,2360),(119,54,64,26,2380),(120,0,0,0,2400);
/*!40000 ALTER TABLE `lh_gallery_pallete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_gallery_pallete_images`
--

DROP TABLE IF EXISTS `lh_gallery_pallete_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_gallery_pallete_images` (
  `pid` int(11) NOT NULL,
  `pallete_id` smallint(3) NOT NULL,
  `count` smallint(5) NOT NULL,
  PRIMARY KEY (`pallete_id`,`pid`),
  KEY `pid` (`pallete_id`,`count`,`pid`),
  KEY `pallete_id` (`pallete_id`),
  KEY `pid_2` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_gallery_pallete_images`
--

LOCK TABLES `lh_gallery_pallete_images` WRITE;
/*!40000 ALTER TABLE `lh_gallery_pallete_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_gallery_pallete_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_gallery_pallete_images_stats`
--

DROP TABLE IF EXISTS `lh_gallery_pallete_images_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_gallery_pallete_images_stats` (
  `pid` int(11) NOT NULL,
  `colors` varchar(100) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_gallery_pallete_images_stats`
--

LOCK TABLES `lh_gallery_pallete_images_stats` WRITE;
/*!40000 ALTER TABLE `lh_gallery_pallete_images_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_gallery_pallete_images_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_gallery_pending_convert`
--

DROP TABLE IF EXISTS `lh_gallery_pending_convert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_gallery_pending_convert` (
  `pid` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_gallery_pending_convert`
--

LOCK TABLES `lh_gallery_pending_convert` WRITE;
/*!40000 ALTER TABLE `lh_gallery_pending_convert` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_gallery_pending_convert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_gallery_popular24`
--

DROP TABLE IF EXISTS `lh_gallery_popular24`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_gallery_popular24` (
  `pid` int(11) NOT NULL,
  `hits` int(11) NOT NULL,
  `added` int(11) NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `hits` (`hits`,`pid`),
  KEY `added` (`added`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_gallery_popular24`
--

LOCK TABLES `lh_gallery_popular24` WRITE;
/*!40000 ALTER TABLE `lh_gallery_popular24` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_gallery_popular24` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_gallery_rated24`
--

DROP TABLE IF EXISTS `lh_gallery_rated24`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_gallery_rated24` (
  `pid` int(11) NOT NULL,
  `pic_rating` int(11) NOT NULL,
  `votes` int(11) NOT NULL,
  `added` int(11) NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `pic_rating` (`pic_rating`,`votes`,`pid`),
  KEY `added` (`added`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_gallery_rated24`
--

LOCK TABLES `lh_gallery_rated24` WRITE;
/*!40000 ALTER TABLE `lh_gallery_rated24` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_gallery_rated24` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_gallery_searchhistory`
--

DROP TABLE IF EXISTS `lh_gallery_searchhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_gallery_searchhistory` (
  `keyword` varchar(100) NOT NULL,
  `countresult` int(11) NOT NULL,
  `last_search` int(11) NOT NULL,
  `searches_done` int(11) NOT NULL,
  PRIMARY KEY (`keyword`),
  KEY `last_search` (`last_search`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_gallery_searchhistory`
--

LOCK TABLES `lh_gallery_searchhistory` WRITE;
/*!40000 ALTER TABLE `lh_gallery_searchhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_gallery_searchhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_gallery_shard_limit`
--

DROP TABLE IF EXISTS `lh_gallery_shard_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_gallery_shard_limit` (
  `pid` int(11) NOT NULL DEFAULT '0',
  `offset` int(11) NOT NULL DEFAULT '0',
  `sort` varchar(40) NOT NULL,
  `filter` varchar(40) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  PRIMARY KEY (`offset`,`sort`,`filter`,`identifier`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_gallery_shard_limit`
--

LOCK TABLES `lh_gallery_shard_limit` WRITE;
/*!40000 ALTER TABLE `lh_gallery_shard_limit` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_gallery_shard_limit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_gallery_sphinx_search`
--

DROP TABLE IF EXISTS `lh_gallery_sphinx_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_gallery_sphinx_search` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `caption` text NOT NULL,
  `filename` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `mtime` int(11) NOT NULL,
  `comtime` int(11) NOT NULL,
  `rtime` int(11) NOT NULL,
  `pic_rating` int(11) NOT NULL,
  `votes` int(11) NOT NULL,
  `pwidth` smallint(6) NOT NULL,
  `pheight` smallint(6) NOT NULL,
  `colors` text NOT NULL,
  `text_index` text NOT NULL,
  `hits` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `text_index_length` mediumint(9) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_gallery_sphinx_search`
--

LOCK TABLES `lh_gallery_sphinx_search` WRITE;
/*!40000 ALTER TABLE `lh_gallery_sphinx_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_gallery_sphinx_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_gallery_upload_archive`
--

DROP TABLE IF EXISTS `lh_gallery_upload_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_gallery_upload_archive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(200) NOT NULL,
  `album_id` int(11) NOT NULL,
  `album_name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `keywords` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_gallery_upload_archive`
--

LOCK TABLES `lh_gallery_upload_archive` WRITE;
/*!40000 ALTER TABLE `lh_gallery_upload_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_gallery_upload_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_group`
--

DROP TABLE IF EXISTS `lh_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_group`
--

LOCK TABLES `lh_group` WRITE;
/*!40000 ALTER TABLE `lh_group` DISABLE KEYS */;
INSERT INTO `lh_group` VALUES (1,'Administrators'),(2,'Registered users'),(3,'Anonymous users group');
/*!40000 ALTER TABLE `lh_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_grouprole`
--

DROP TABLE IF EXISTS `lh_grouprole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_grouprole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`role_id`,`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_grouprole`
--

LOCK TABLES `lh_grouprole` WRITE;
/*!40000 ALTER TABLE `lh_grouprole` DISABLE KEYS */;
INSERT INTO `lh_grouprole` VALUES (1,1,1),(2,2,2),(3,2,3),(4,3,3);
/*!40000 ALTER TABLE `lh_grouprole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_groupuser`
--

DROP TABLE IF EXISTS `lh_groupuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_groupuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`),
  KEY `group_id_2` (`group_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_groupuser`
--

LOCK TABLES `lh_groupuser` WRITE;
/*!40000 ALTER TABLE `lh_groupuser` DISABLE KEYS */;
INSERT INTO `lh_groupuser` VALUES (1,1,1),(2,3,2);
/*!40000 ALTER TABLE `lh_groupuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_oid_associations`
--

DROP TABLE IF EXISTS `lh_oid_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_oid_associations` (
  `server_url` blob NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` blob NOT NULL,
  `issued` int(11) NOT NULL,
  `lifetime` int(11) NOT NULL,
  `assoc_type` varchar(64) NOT NULL,
  PRIMARY KEY (`server_url`(100),`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_oid_associations`
--

LOCK TABLES `lh_oid_associations` WRITE;
/*!40000 ALTER TABLE `lh_oid_associations` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_oid_associations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_oid_map`
--

DROP TABLE IF EXISTS `lh_oid_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_oid_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `open_id` blob NOT NULL,
  `user_id` int(11) NOT NULL,
  `open_id_type` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_oid_map`
--

LOCK TABLES `lh_oid_map` WRITE;
/*!40000 ALTER TABLE `lh_oid_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_oid_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_oid_nonces`
--

DROP TABLE IF EXISTS `lh_oid_nonces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_oid_nonces` (
  `server_url` varchar(2047) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `salt` char(40) NOT NULL,
  UNIQUE KEY `server_url` (`server_url`(100),`timestamp`,`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_oid_nonces`
--

LOCK TABLES `lh_oid_nonces` WRITE;
/*!40000 ALTER TABLE `lh_oid_nonces` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_oid_nonces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_role`
--

DROP TABLE IF EXISTS `lh_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_role`
--

LOCK TABLES `lh_role` WRITE;
/*!40000 ALTER TABLE `lh_role` DISABLE KEYS */;
INSERT INTO `lh_role` VALUES (1,'Administrators'),(2,'Registered users'),(3,'Anonymous users');
/*!40000 ALTER TABLE `lh_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_rolefunction`
--

DROP TABLE IF EXISTS `lh_rolefunction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_rolefunction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `module` varchar(100) NOT NULL,
  `function` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_rolefunction`
--

LOCK TABLES `lh_rolefunction` WRITE;
/*!40000 ALTER TABLE `lh_rolefunction` DISABLE KEYS */;
INSERT INTO `lh_rolefunction` VALUES (1,1,'*','*'),(2,2,'lhuser','selfedit'),(3,2,'lhgallery','use'),(4,2,'lhfb','use_registered'),(5,2,'lhgallery','personal_albums'),(6,2,'lhgallery','auto_approve'),(7,2,'lhforum','use'),(8,3,'lhforum','use_anonymous');
/*!40000 ALTER TABLE `lh_rolefunction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_shop_base_setting`
--

DROP TABLE IF EXISTS `lh_shop_base_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_shop_base_setting` (
  `identifier` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL,
  `explain` varchar(100) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_shop_base_setting`
--

LOCK TABLES `lh_shop_base_setting` WRITE;
/*!40000 ALTER TABLE `lh_shop_base_setting` DISABLE KEYS */;
INSERT INTO `lh_shop_base_setting` VALUES ('credit_price','0.65','Credit price'),('main_currency','EUR','Shop base currency'),('max_downloads','2','How many downloads can be done using download URL');
/*!40000 ALTER TABLE `lh_shop_base_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_shop_basket_image`
--

DROP TABLE IF EXISTS `lh_shop_basket_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_shop_basket_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `variation_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_shop_basket_image`
--

LOCK TABLES `lh_shop_basket_image` WRITE;
/*!40000 ALTER TABLE `lh_shop_basket_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_shop_basket_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_shop_basket_session`
--

DROP TABLE IF EXISTS `lh_shop_basket_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_shop_basket_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `session_hash_crc32` bigint(20) NOT NULL,
  `session_hash` varchar(40) NOT NULL,
  `mtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_shop_basket_session`
--

LOCK TABLES `lh_shop_basket_session` WRITE;
/*!40000 ALTER TABLE `lh_shop_basket_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_shop_basket_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_shop_image_variation`
--

DROP TABLE IF EXISTS `lh_shop_image_variation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_shop_image_variation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `credits` int(11) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_shop_image_variation`
--

LOCK TABLES `lh_shop_image_variation` WRITE;
/*!40000 ALTER TABLE `lh_shop_image_variation` DISABLE KEYS */;
INSERT INTO `lh_shop_image_variation` VALUES (1,800,800,'Small',3,20,0),(3,480,480,'Extra small',1,10,0),(4,1414,1414,'Medium',4,30,0),(5,1825,1825,'Large',5,40,0),(6,0,0,'Original',11,60,1);
/*!40000 ALTER TABLE `lh_shop_image_variation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_shop_order`
--

DROP TABLE IF EXISTS `lh_shop_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_shop_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_time` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `basket_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `payment_gateway` varchar(100) NOT NULL,
  `currency` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_shop_order`
--

LOCK TABLES `lh_shop_order` WRITE;
/*!40000 ALTER TABLE `lh_shop_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_shop_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_shop_order_item`
--

DROP TABLE IF EXISTS `lh_shop_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_shop_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `image_variation_id` int(11) NOT NULL,
  `hash` varchar(40) NOT NULL,
  `credit_price` decimal(10,4) NOT NULL,
  `credits` int(11) NOT NULL,
  `download_count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_shop_order_item`
--

LOCK TABLES `lh_shop_order_item` WRITE;
/*!40000 ALTER TABLE `lh_shop_order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_shop_order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_shop_payment_setting`
--

DROP TABLE IF EXISTS `lh_shop_payment_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_shop_payment_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `param` varchar(50) NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`,`param`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_shop_payment_setting`
--

LOCK TABLES `lh_shop_payment_setting` WRITE;
/*!40000 ALTER TABLE `lh_shop_payment_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_shop_payment_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_shop_user_credit`
--

DROP TABLE IF EXISTS `lh_shop_user_credit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_shop_user_credit` (
  `user_id` int(11) NOT NULL,
  `credits` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_shop_user_credit`
--

LOCK TABLES `lh_shop_user_credit` WRITE;
/*!40000 ALTER TABLE `lh_shop_user_credit` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_shop_user_credit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_shop_user_credit_order`
--

DROP TABLE IF EXISTS `lh_shop_user_credit_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_shop_user_credit_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `credits` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `payment_gateway` varchar(100) NOT NULL,
  `currency` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_shop_user_credit_order`
--

LOCK TABLES `lh_shop_user_credit_order` WRITE;
/*!40000 ALTER TABLE `lh_shop_user_credit_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_shop_user_credit_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_system_config`
--

DROP TABLE IF EXISTS `lh_system_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_system_config` (
  `identifier` varchar(50) NOT NULL,
  `value` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `explain` varchar(250) NOT NULL,
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_system_config`
--

LOCK TABLES `lh_system_config` WRITE;
/*!40000 ALTER TABLE `lh_system_config` DISABLE KEYS */;
INSERT INTO `lh_system_config` VALUES ('allowed_file_types','\'jpg\',\'gif\',\'png\',\'png\',\'bmp\',\'ogv\',\'swf\',\'flv\',\'mpeg\',\'avi\',\'mpg\',\'wmv\'',0,'List of allowed file types to upload',0),('file_queue_limit','20',0,'How many files user can upload in single session',0),('file_upload_limit','200',0,'How many files upload during one session',0),('flash_screenshot_command','bin/shell/xvfb-run.sh --server-args=\"-screen 0, 1024x2730x24\" bin/shell/screenshot.sh',0,'Command witch is executed for making flash screenshot',0),('footer_article_id','a:3:{s:3:\"eng\";s:1:\"3\";s:3:\"lit\";s:2:\"28\";s:10:\"site_admin\";s:2:\"29\";}',1,'Footer article ID',0),('forum_photo_height','500',0,'Forum photo height',0),('forum_photo_width','500',0,'Forum photo width',0),('full_image_quality','93',0,'Full image quality',0),('google_analytics_site_profile_id','',0,'Google analytics site profile id',0),('google_analytics_token','',0,'Google analytics API key',0),('google_translate_api_key','',0,'Google translate API key, can be obtained from https://code.google.com/apis/console/',0),('loop_video','0',0,'Should HTML5 video be looped? (1 - yes,0 - no))',0),('max_archive_size','20480',0,'Maximum archive size in kilobytes',0),('max_comment_length','1000',0,'Maximum comment length',0),('max_photo_size','5120',0,'Maximum photo size in kilobytes',0),('minimum_post_to_hot','20',0,'How many post to became hot topic',0),('normal_thumbnail_quality','93',0,'Converted normal thumbnail quality',0),('normal_thumbnail_width_x','400',0,'Normal size thumbnail width - x',0),('normal_thumbnail_width_y','400',0,'Normal size thumbnail width - y',0),('popularrecent_timeout','24',0,'Most popular images timeout in hours',0),('posts_per_page','20',0,'How many post messages show per page',0),('ratedrecent_timeout','24',0,'Recently images timeout in hours',0),('thumbnail_quality_default','93',0,'Converted small thumbnail image quality',0),('thumbnail_scale_algorithm','croppedThumbnail',0,'It can be \"scale\" or \"croppedThumbnail\" - makes perfect squares, or \"croppedThumbnailTop\" makes perfect squares, image cropped from top',0),('thumbnail_width_x','120',0,'Small thumbnail width - x',0),('thumbnail_width_y','130',0,'Small thumbnail width - Y',0),('video_convert_command','ffmpeg -y -i {original_file} -qmax 15 -s 580x440 -ar 22050 -ab 32 -f flv {converted_file} &> /dev/null',0,'',0),('watermark_data','a:9:{s:17:\"watermark_enabled\";b:0;s:21:\"watermark_enabled_all\";b:0;s:9:\"watermark\";s:0:\"\";s:6:\"size_x\";i:200;s:6:\"size_y\";i:50;s:18:\"watermark_disabled\";b:1;s:18:\"watermark_position\";s:12:\"bottom_right\";s:28:\"watermark_position_padding_x\";i:10;s:28:\"watermark_position_padding_y\";i:10;}',0,'Not shown public, editing is done in watermark module',1);
/*!40000 ALTER TABLE `lh_system_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_user_fb`
--

DROP TABLE IF EXISTS `lh_user_fb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_user_fb` (
  `user_id` int(11) NOT NULL,
  `fb_user_id` bigint(20) NOT NULL,
  `name` varchar(150) NOT NULL,
  `link` varchar(250) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fb_user_id` (`fb_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_user_fb`
--

LOCK TABLES `lh_user_fb` WRITE;
/*!40000 ALTER TABLE `lh_user_fb` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_user_fb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_users`
--

DROP TABLE IF EXISTS `lh_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `email` varchar(100) NOT NULL,
  `lastactivity` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_users`
--

LOCK TABLES `lh_users` WRITE;
/*!40000 ALTER TABLE `lh_users` DISABLE KEYS */;
INSERT INTO `lh_users` VALUES (1,'admin','a7025fea271f1609f715c043f835dfaef6fadec0','admin@example.com',0),(2,'anonymous','cf0d2d7f8ed2296d8c78ba7ce54209d880570050','admin@example.com',0);
/*!40000 ALTER TABLE `lh_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_users_profile`
--

DROP TABLE IF EXISTS `lh_users_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_users_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `surname` varchar(150) NOT NULL,
  `intro` text NOT NULL,
  `photo` varchar(100) NOT NULL,
  `variations` text NOT NULL,
  `filepath` varchar(200) NOT NULL,
  `website` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_users_profile`
--

LOCK TABLES `lh_users_profile` WRITE;
/*!40000 ALTER TABLE `lh_users_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_users_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-23  1:15:21
