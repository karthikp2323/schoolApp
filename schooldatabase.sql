-- MySQL dump 10.13  Distrib 5.6.27, for osx10.11 (x86_64)
--
-- Host: localhost    Database: twitter_school_development
-- ------------------------------------------------------
-- -- Server version	5.6.27
-- use database twitter_school_development;
use twitter_school_development;
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
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `message` text,
  `activity_type` tinyint(1) DEFAULT NULL,
  `allow_comment` tinyint(1) DEFAULT NULL,
  `classroom_id` int(11) DEFAULT NULL,
  `school_user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `image_file_name` varchar(255) DEFAULT NULL,
  `image_content_type` varchar(255) DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_activities_on_classroom_id` (`classroom_id`),
  KEY `index_activities_on_school_user_id` (`school_user_id`),
  KEY `index_activities_on_school_id` (`school_id`),
  CONSTRAINT `fk_rails_31b7c63acf` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`),
  CONSTRAINT `fk_rails_5af32a838a` FOREIGN KEY (`classroom_id`) REFERENCES `classrooms` (`id`),
  CONSTRAINT `fk_rails_ab419b9587` FOREIGN KEY (`school_user_id`) REFERENCES `school_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES (1,'First post','Sample post',NULL,1,5,5,'2015-11-22 22:39:23','2015-11-22 22:39:23',NULL,NULL,NULL,NULL,NULL),(2,'First post','Sample post',NULL,1,5,5,'2015-11-22 22:40:46','2015-11-22 22:40:46',NULL,NULL,NULL,NULL,NULL),(27,'ajax 8','ajax 8.33333',NULL,0,5,5,'2015-11-23 19:11:33','2015-11-23 19:11:33',NULL,NULL,NULL,NULL,2),(35,'ajax 16','sdfsdfsd',NULL,0,5,5,'2015-11-23 19:58:00','2015-11-23 19:58:00',NULL,NULL,NULL,NULL,2),(36,'ajax 17','qweqweqwe',NULL,0,5,5,'2015-11-23 19:58:08','2015-11-23 19:58:08',NULL,NULL,NULL,NULL,2),(37,'ajax 18','new ',NULL,0,5,5,'2015-11-24 19:22:52','2015-11-24 19:22:52',NULL,NULL,NULL,NULL,2),(38,'ajax 19','new ',NULL,0,5,5,'2015-11-24 19:22:52','2015-11-24 19:22:52',NULL,NULL,NULL,NULL,2),(39,'ajax 20','new 1',NULL,0,5,5,'2015-11-24 19:23:01','2015-11-24 19:23:01',NULL,NULL,NULL,NULL,2),(40,'ajax 21','new 2',NULL,0,5,5,'2015-11-24 19:23:06','2015-11-24 19:23:06',NULL,NULL,NULL,NULL,2),(41,'ajax 22','new 3',NULL,0,5,5,'2015-11-24 19:23:27','2015-11-24 19:23:27',NULL,NULL,NULL,NULL,2),(42,'ajax 23','new 3',NULL,0,5,5,'2015-11-24 19:23:44','2015-11-24 19:23:44',NULL,NULL,NULL,NULL,2),(43,'New post','posted after css changes',NULL,0,5,5,'2015-12-02 17:52:48','2015-12-02 17:52:48',NULL,NULL,NULL,NULL,2),(44,'sample','sampleeeeeeeee',NULL,0,5,5,'2015-12-02 20:57:03','2015-12-02 20:57:03',NULL,NULL,NULL,NULL,2),(45,'another','another one',NULL,0,5,5,'2015-12-02 21:11:02','2015-12-02 21:11:02',NULL,NULL,NULL,NULL,2),(46,'one more','one more time',NULL,0,5,5,'2015-12-02 21:12:06','2015-12-02 21:12:06',NULL,NULL,NULL,NULL,2),(55,'lol 7 ','lol 7',NULL,0,5,5,'2015-12-02 23:22:08','2015-12-02 23:22:08',NULL,NULL,NULL,NULL,2),(63,'Sample big','Let\'s look at this line with care. I\'m rendering the same partial I was rendering in items#index, and the local variable for the partial is now the array of Item instances that match a given category. The difference is that I\'m doing this through AJAX, so there\'s no need to reload the entire page.',NULL,0,5,5,'2015-12-03 00:27:01','2015-12-03 00:27:01',NULL,NULL,NULL,NULL,2),(64,'Today post','Dec 3rd 2014',NULL,0,5,5,'2015-12-03 15:44:37','2015-12-03 15:44:37',NULL,NULL,NULL,NULL,2),(65,'Post by venkat','Venkat\'s message to every one!!!',NULL,0,5,5,'2015-12-04 19:04:40','2015-12-04 19:04:40',NULL,NULL,NULL,NULL,2),(66,'Dec 8th','Dec 8th post new one',NULL,0,5,5,'2015-12-08 15:41:39','2015-12-08 15:41:39',NULL,NULL,NULL,NULL,2),(68,'New one','new one',NULL,0,5,4,'2015-12-14 01:38:20','2015-12-14 01:38:20',NULL,NULL,NULL,NULL,2),(69,'Picture post','Post with picture',NULL,0,5,4,'2015-12-14 01:45:04','2015-12-14 01:45:04',NULL,NULL,NULL,NULL,2),(70,'Post with picture 2','post with picture 2',0,0,5,4,'2015-12-14 02:09:11','2015-12-14 02:09:11','download.jpeg','image/jpeg',11717,'2015-12-14 02:09:11',2),(71,'Post with picture 3','Post with picture 3 blahhh',0,0,5,4,'2015-12-14 02:15:35','2015-12-14 02:15:35','download.jpeg','image/jpeg',11717,'2015-12-14 02:15:35',2),(83,'sample','sample post',0,0,5,4,'2015-12-15 18:01:23','2015-12-15 18:01:23',NULL,NULL,NULL,NULL,2),(84,'Another sample','ANOTHER SAMPLE POST',0,0,5,4,'2015-12-15 18:07:46','2015-12-15 18:07:46',NULL,NULL,NULL,NULL,2),(85,'New post 2','New post 2',0,0,5,4,'2015-12-15 18:13:08','2015-12-15 18:13:08',NULL,NULL,NULL,NULL,2),(86,'Next one','next one',0,0,5,4,'2015-12-15 18:15:05','2015-12-15 18:15:05',NULL,NULL,NULL,NULL,2),(87,'Next one 2','next one 2',0,0,5,4,'2015-12-15 18:15:24','2015-12-15 18:15:24',NULL,NULL,NULL,NULL,2),(88,'next one 3','next one 3',0,0,5,4,'2015-12-15 18:18:17','2015-12-15 18:18:17',NULL,NULL,NULL,NULL,2),(89,'next one 4','next one 4',0,0,5,4,'2015-12-15 18:19:17','2015-12-15 18:19:17',NULL,NULL,NULL,NULL,2),(90,'blah','blah 2',0,0,5,4,'2015-12-15 18:24:08','2015-12-15 18:24:08',NULL,NULL,NULL,NULL,2),(91,'one more ','one more',0,0,5,4,'2015-12-15 18:25:22','2015-12-15 18:25:22',NULL,NULL,NULL,NULL,2),(92,'ascasc','ascascas',0,0,5,4,'2015-12-15 18:35:43','2015-12-15 18:35:43','download.jpeg','image/jpeg',11717,'2015-12-15 18:35:43',2),(93,'sdcsdcsd','sdcsdcdsc',0,0,5,4,'2015-12-15 18:46:45','2015-12-15 18:46:45','download.jpeg','image/jpeg',11717,'2015-12-15 18:46:45',2),(94,'Post with picture new','Post with picture newwwww',0,0,5,4,'2015-12-15 19:13:01','2015-12-15 19:13:01','Polina_DL.JPG','image/jpeg',186795,'2015-12-15 19:13:01',2),(95,'Without pic','test without pic',0,0,5,4,'2015-12-16 17:42:19','2015-12-16 17:42:19',NULL,NULL,NULL,NULL,2),(96,'Without pic','test without pic',0,0,5,4,'2015-12-16 17:42:34','2015-12-16 17:42:34','Polina_DL.JPG','image/jpeg',186795,'2015-12-16 17:42:34',2),(97,'Post with new link','posted with new link',0,0,5,4,'2015-12-21 16:54:59','2015-12-21 16:54:59','download.jpeg','image/jpeg',11717,'2015-12-21 16:54:59',2),(100,'New year post','New year new post',0,0,1,5,'2016-01-04 01:16:25','2016-01-04 01:16:25','download.jpeg','image/jpeg',11717,'2016-01-04 01:16:25',2),(101,'sample','sample one',0,0,1,5,'2016-01-04 05:10:34','2016-01-04 05:10:34','download.jpeg','image/jpeg',11717,'2016-01-04 05:10:34',2),(102,'test','test jan 4th',0,0,1,5,'2016-01-04 14:38:55','2016-01-04 14:38:55','download.jpeg','image/jpeg',11717,'2016-01-04 14:25:05',2),(103,'Hello',NULL,NULL,NULL,NULL,5,'2016-01-05 15:12:46','2016-01-05 15:12:46',NULL,NULL,NULL,NULL,NULL),(104,'Hello',NULL,NULL,NULL,NULL,5,'2016-01-05 17:28:55','2016-01-05 17:28:55',NULL,NULL,NULL,NULL,NULL),(105,'Hello',NULL,NULL,NULL,NULL,5,'2016-01-05 18:45:22','2016-01-05 18:45:22',NULL,NULL,NULL,NULL,NULL),(106,'2',NULL,NULL,NULL,NULL,5,'2016-01-05 19:35:32','2016-01-05 19:35:32',NULL,NULL,NULL,NULL,NULL),(107,'2',NULL,NULL,NULL,NULL,5,'2016-01-06 04:15:59','2016-01-06 04:15:59',NULL,NULL,NULL,NULL,NULL),(108,'Jan 6th post','jan 6th post blah',0,0,1,5,'2016-01-06 17:06:17','2016-01-06 17:06:17','download.jpeg','image/jpeg',11717,'2016-01-06 17:05:51',2),(109,'Another post','another cool post',0,0,1,5,'2016-01-06 17:36:42','2016-01-06 17:36:42','download.jpeg','image/jpeg',11717,'2016-01-06 17:33:42',2),(110,'jpg post','jpg post',0,0,1,5,'2016-01-06 17:46:45','2016-01-06 17:46:45','11148752_988279394524463_8675313156332693243_n.jpg','image/jpeg',35248,'2016-01-06 17:46:40',2),(111,'jpg post another','jpg post another',0,0,1,5,'2016-01-06 18:25:38','2016-01-06 18:25:38','sample.jpg','image/jpeg',35248,'2016-01-06 18:23:39',2),(112,'jpg post another','jpg post another ding',0,0,1,5,'2016-01-06 19:10:32','2016-01-06 19:10:32','sample.jpg','image/jpeg',35248,'2016-01-06 19:10:23',2),(113,'jpg post another','jpg post another ding 2',0,0,1,5,'2016-01-06 19:11:20','2016-01-06 19:11:20','sample.jpg','image/jpeg',35248,'2016-01-06 19:11:01',2),(114,'Ionic post','Posted from mobile.... Cheers!!',NULL,NULL,NULL,5,'2016-01-06 19:36:06','2016-01-06 19:36:06','adam.jpg','image/jpg',11717,'2016-01-06 19:36:06',NULL),(115,'Post from mobile','Sample post from mobile',NULL,NULL,NULL,5,'2016-01-09 06:17:39','2016-01-09 06:17:39','adam.jpg','image/jpg',11717,'2016-01-09 06:17:39',NULL),(116,'Post from mobile','Sample post from mobile',NULL,NULL,NULL,5,'2016-01-09 06:30:07','2016-01-09 06:30:07','adam.jpg','image/jpg',11717,'2016-01-09 06:30:07',NULL),(117,NULL,NULL,NULL,NULL,NULL,5,'2016-01-10 00:36:32','2016-01-10 00:36:32',NULL,NULL,NULL,NULL,NULL),(118,NULL,NULL,NULL,NULL,NULL,5,'2016-01-10 00:37:07','2016-01-10 00:37:07',NULL,NULL,NULL,NULL,NULL),(119,NULL,NULL,NULL,NULL,NULL,4,'2016-01-10 21:08:55','2016-01-10 21:08:55',NULL,NULL,NULL,NULL,NULL),(120,'sample','sample',NULL,NULL,5,5,'2016-01-11 02:48:24','2016-01-11 02:48:24','download.jpeg','image/jpeg',11717,'2016-01-11 02:48:24',NULL),(121,'','',NULL,NULL,NULL,4,'2016-01-11 04:15:03','2016-01-11 04:15:03','download.jpeg','image/jpeg',11717,'2016-01-11 04:15:02',NULL),(122,'ebetb','betbeb',NULL,NULL,5,5,'2016-01-11 04:17:09','2016-01-11 04:17:09','download.jpeg','image/jpeg',11717,'2016-01-11 04:17:09',NULL),(123,'Post with school id','New post with school id',0,0,5,5,'2016-02-02 17:31:02','2016-02-02 17:31:02','download.jpeg','image/jpeg',11717,'2016-02-02 17:31:01',2),(124,'Teacher Post with school id','Teacher Post with school id',0,0,8,4,'2016-02-02 17:33:25','2016-02-02 17:33:25','download.jpeg','image/jpeg',11717,'2016-02-02 17:33:25',2),(125,'sample','sample post',0,0,5,4,'2016-02-16 03:07:17','2016-02-16 03:07:17',NULL,NULL,NULL,NULL,2),(127,'asdad','asdasd',NULL,NULL,2,4,'2016-02-16 03:21:38','2016-02-16 03:21:38',NULL,NULL,NULL,NULL,2),(131,'Sddfsdf','Ssdfsdf',NULL,NULL,2,4,'2016-02-16 04:24:58','2016-02-16 04:24:58','uploadedBY_PrarthanaBu','image/jpeg',27692,'2016-02-16 04:24:53',2),(133,'CSS fixing','Css fixing post',0,0,5,4,'2016-02-24 16:32:21','2016-02-24 16:32:21',NULL,NULL,NULL,NULL,2),(134,'CSS fixing 2222','Css fixing post 2222222',0,0,5,4,'2016-02-24 16:32:35','2016-02-24 16:32:35',NULL,NULL,NULL,NULL,2),(135,'Admin post','Post from admin',0,0,1,5,'2016-02-25 04:05:48','2016-02-25 04:05:48',NULL,NULL,NULL,NULL,2),(136,'Super','Super vinod post',0,0,1,5,'2016-03-17 19:26:47','2016-03-17 19:26:47',NULL,NULL,NULL,NULL,2),(137,'Post with name','Posted with  name',0,0,1,5,'2016-03-25 15:36:18','2016-03-25 15:36:18',NULL,NULL,NULL,NULL,2);
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_registrations`
--

DROP TABLE IF EXISTS `class_registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_registrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classroom_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_class_registrations_on_classroom_id` (`classroom_id`),
  KEY `index_class_registrations_on_student_id` (`student_id`),
  CONSTRAINT `fk_rails_7991358f20` FOREIGN KEY (`classroom_id`) REFERENCES `classrooms` (`id`),
  CONSTRAINT `fk_rails_90821922f7` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_registrations`
--

LOCK TABLES `class_registrations` WRITE;
/*!40000 ALTER TABLE `class_registrations` DISABLE KEYS */;
INSERT INTO `class_registrations` VALUES (2,2,3,'2015-12-07 03:34:44','2015-12-07 03:34:44'),(12,2,30,'2015-12-07 17:46:22','2015-12-07 17:46:22'),(21,8,42,'2016-03-09 16:30:17','2016-03-09 16:30:17'),(22,8,43,'2016-03-09 16:34:52','2016-03-09 16:34:52'),(23,8,44,'2016-03-09 16:48:40','2016-03-09 16:48:40'),(25,5,46,'2016-03-14 16:13:54','2016-03-14 16:13:54'),(28,5,54,'2016-03-14 18:47:00','2016-03-14 18:47:00'),(29,5,55,'2016-03-14 18:47:32','2016-03-14 18:47:32'),(30,5,56,'2016-03-14 18:49:26','2016-03-14 18:49:26'),(31,5,57,'2016-03-14 18:51:58','2016-03-14 18:51:58'),(32,5,58,'2016-03-14 18:53:42','2016-03-14 18:53:42'),(34,5,61,'2016-03-15 14:30:10','2016-03-15 14:30:10'),(35,NULL,62,'2016-03-23 16:04:37','2016-03-23 16:04:37'),(36,2,63,'2016-03-23 16:25:38','2016-03-23 16:25:38'),(48,12,75,'2016-03-23 18:50:37','2016-03-23 18:50:37'),(49,11,76,'2016-03-23 18:51:58','2016-03-23 18:51:58'),(50,11,77,'2016-03-23 18:53:27','2016-03-23 18:53:27'),(51,12,78,'2016-03-23 19:06:39','2016-03-23 19:06:39'),(52,12,79,'2016-03-23 19:08:32','2016-03-23 19:08:32'),(53,12,80,'2016-03-23 19:50:46','2016-03-23 19:50:46'),(54,11,81,'2016-03-23 19:53:55','2016-03-23 19:53:55'),(55,8,82,'2016-03-23 19:55:57','2016-03-23 19:55:57'),(56,8,83,'2016-03-23 20:00:13','2016-03-23 20:00:13'),(58,12,85,'2016-03-23 20:03:32','2016-03-23 20:03:32'),(59,12,86,'2016-03-23 20:04:21','2016-03-23 20:04:21'),(60,8,87,'2016-03-23 20:06:33','2016-03-23 20:06:33'),(61,12,88,'2016-03-24 14:20:46','2016-03-24 14:20:46'),(62,5,89,'2016-03-28 16:20:32','2016-03-28 16:20:32'),(63,5,90,'2016-03-28 17:02:31','2016-03-28 17:02:31'),(64,5,91,'2016-03-28 17:07:33','2016-03-28 17:07:33'),(65,5,92,'2016-03-28 17:10:25','2016-03-28 17:10:25'),(66,5,93,'2016-03-28 17:12:54','2016-03-28 17:12:54'),(67,8,94,'2016-03-28 17:17:57','2016-03-28 17:17:57'),(68,8,95,'2016-03-28 17:19:01','2016-03-28 17:19:01'),(69,8,96,'2016-03-28 17:21:57','2016-03-28 17:21:57'),(71,8,98,'2016-03-28 17:43:06','2016-03-28 17:43:06'),(72,8,99,'2016-03-28 18:44:13','2016-03-28 18:44:13'),(73,8,100,'2016-03-28 18:47:17','2016-03-28 18:47:17'),(74,8,101,'2016-03-28 18:50:31','2016-03-28 18:50:31'),(82,8,109,'2016-03-28 23:18:48','2016-03-28 23:18:48'),(85,8,112,'2016-03-28 23:31:07','2016-03-28 23:31:07'),(86,8,113,'2016-03-28 23:32:18','2016-03-28 23:32:18'),(87,8,114,'2016-03-29 00:17:56','2016-03-29 00:17:56'),(88,8,115,'2016-03-29 00:20:00','2016-03-29 00:20:00'),(89,8,116,'2016-03-29 00:23:13','2016-03-29 00:23:13'),(90,8,117,'2016-03-29 00:41:08','2016-03-29 00:41:08'),(92,5,119,'2016-03-29 14:28:38','2016-03-29 14:28:38'),(93,5,120,'2016-03-29 14:34:30','2016-03-29 14:34:30'),(94,5,122,'2016-03-29 17:27:14','2016-03-29 17:27:14');
/*!40000 ALTER TABLE `class_registrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classrooms`
--

DROP TABLE IF EXISTS `classrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classrooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) DEFAULT NULL,
  `class_location` varchar(255) DEFAULT NULL,
  `class_level` varchar(255) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `school_user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_classrooms_on_school_id` (`school_id`),
  KEY `index_classrooms_on_school_user_id` (`school_user_id`),
  CONSTRAINT `fk_rails_5a2e2c8060` FOREIGN KEY (`school_user_id`) REFERENCES `school_users` (`id`),
  CONSTRAINT `fk_rails_a25c8939da` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classrooms`
--

LOCK TABLES `classrooms` WRITE;
/*!40000 ALTER TABLE `classrooms` DISABLE KEYS */;
INSERT INTO `classrooms` VALUES (1,'Math','LBV Center','Grade 1',2,NULL,'2015-11-22 19:11:12','2015-11-22 19:11:12'),(2,'Chemistry','LBV Center','Grade 6',2,NULL,'2015-11-22 19:16:34','2015-11-22 19:16:34'),(4,'Physics ','Bullock hall','Grade 6',2,5,'2015-11-22 19:24:29','2016-03-22 17:57:29'),(5,'Ruby Adv','Bullock hall 104','Graduate',2,4,'2015-11-22 19:55:42','2016-03-23 13:38:43'),(7,'Social','STC 101','Grade 10',2,NULL,'2015-11-22 20:52:04','2015-11-22 20:54:36'),(8,'Ruby 1','LBV Center1','Graduate 1',2,4,'2015-11-22 21:00:54','2016-03-23 13:38:32'),(10,'English 12','STC 1011','Grade 6',2,5,'2015-11-22 22:23:55','2015-11-22 22:24:05'),(11,'Bio chemical','Dublin','Grade 10',2,5,'2015-12-03 15:50:05','2016-03-23 19:51:29'),(12,'Advanced C#','BLK 104','Senior',2,5,'2015-12-08 02:00:20','2016-03-24 14:19:32'),(14,'Venkat sample class 2','Hillard','Junior',2,6,'2015-12-08 02:10:04','2015-12-08 02:10:04'),(15,'Harsh class','Hyderabd','High school',2,7,'2015-12-08 03:52:20','2015-12-08 03:52:20'),(16,'Harsh class 2','Nagole','Senior',2,7,'2015-12-08 03:53:37','2015-12-08 03:53:37'),(17,'Sreenu class','Dublin','Senior',2,11,'2015-12-08 14:41:49','2015-12-08 14:41:49'),(21,'Math','Dublin','Level 8',2,64,'2016-03-22 14:41:07','2016-03-22 14:41:07'),(24,'Social','Dublin','Level 10',2,64,'2016-03-22 15:03:05','2016-03-22 15:03:05'),(25,'C programming','Room 105','Level 10',2,64,'2016-03-22 15:55:39','2016-03-22 15:55:39'),(26,'English','Bullock hall','Grade 1',2,5,'2016-03-22 17:40:18','2016-03-22 17:40:18'),(27,'English 1','Bullock hall','Grade 1',2,5,'2016-03-22 17:42:22','2016-03-22 17:42:22'),(28,'Drones','STC 101','Level 10',2,14,'2016-03-24 00:18:38','2016-03-24 00:18:38'),(29,'Cultural','STC 101','Grade 2',2,14,'2016-03-24 13:16:48','2016-03-24 13:16:48'),(30,'Social','STC 101','Grade 2',2,14,'2016-03-24 14:13:32','2016-03-24 14:13:32'),(31,'Physics','STC 101','Level 10',2,NULL,'2016-03-25 15:59:36','2016-03-25 15:59:36'),(32,'Physics','STC 101','Level 10',2,NULL,'2016-03-25 16:03:22','2016-03-25 16:03:22'),(33,'Physics','STC 101','Level 10',2,14,'2016-03-25 16:26:07','2016-03-25 16:26:07');
/*!40000 ALTER TABLE `classrooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_text` text,
  `activity_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `school_user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_activity_id` (`activity_id`),
  KEY `index_comments_on_parent_id` (`parent_id`),
  KEY `index_comments_on_school_user_id` (`school_user_id`),
  CONSTRAINT `fk_rails_31554e7034` FOREIGN KEY (`parent_id`) REFERENCES `parents` (`id`),
  CONSTRAINT `fk_rails_4a8da7c691` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`),
  CONSTRAINT `fk_rails_92d9987afd` FOREIGN KEY (`school_user_id`) REFERENCES `school_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'Hello',2,3,NULL,'2015-11-22 22:39:23','2015-11-22 22:39:23');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_statuses`
--

DROP TABLE IF EXISTS `event_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id_declined` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_event_statuses_on_event_id` (`event_id`),
  KEY `index_event_statuses_on_parent_id` (`parent_id`),
  CONSTRAINT `fk_rails_65f6e40fc1` FOREIGN KEY (`parent_id`) REFERENCES `parents` (`id`),
  CONSTRAINT `fk_rails_95d5921ee4` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_statuses`
--

LOCK TABLES `event_statuses` WRITE;
/*!40000 ALTER TABLE `event_statuses` DISABLE KEYS */;
INSERT INTO `event_statuses` VALUES (8,NULL,2,3,'2016-01-17 23:22:54','2016-01-17 23:22:54'),(9,3,1,NULL,'2016-01-17 23:22:54','2016-01-17 23:22:54'),(10,NULL,1,10,'2016-01-17 23:22:54','2016-01-17 23:22:54'),(11,NULL,1,34,'2016-01-17 23:22:54','2016-01-17 23:22:54'),(12,NULL,2,35,'2016-01-17 23:22:54','2016-01-17 23:22:54'),(13,NULL,2,39,'2016-01-17 23:22:54','2016-01-17 23:22:54'),(14,NULL,2,34,'2016-01-17 23:22:54','2016-01-17 23:22:54'),(15,NULL,3,3,'2016-02-02 14:33:52','2016-02-02 14:33:52'),(18,NULL,4,3,'2016-02-02 14:46:39','2016-02-02 14:46:39'),(19,NULL,5,3,'2016-02-02 15:04:59','2016-02-02 15:04:59');
/*!40000 ALTER TABLE `event_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_title` varchar(255) DEFAULT NULL,
  `event_description` varchar(255) DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `event_time` varchar(255) DEFAULT NULL,
  `event_location` varchar(255) DEFAULT NULL,
  `school_user_id` int(11) DEFAULT NULL,
  `classroom_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `event_end_time` date DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_events_on_school_user_id` (`school_user_id`),
  KEY `index_events_on_classroom_id` (`classroom_id`),
  KEY `index_events_on_school_id` (`school_id`),
  CONSTRAINT `fk_rails_1beae4dfaa` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`),
  CONSTRAINT `fk_rails_443ddd1f10` FOREIGN KEY (`classroom_id`) REFERENCES `classrooms` (`id`),
  CONSTRAINT `fk_rails_7d1730c297` FOREIGN KEY (`school_user_id`) REFERENCES `school_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'First meet','You can use limit to specify the number of records to be retrieved, and use offset to specify the number of records to skip before starting to return the records. For example','2016-01-19','10:23:00 am','5131 Post road',4,2,'2016-01-17 23:22:54','2016-01-17 23:22:54',NULL,2),(2,'Second one','You can use limit to specify the number of records to be retrieved, and use offset to specify the number of records to skip before starting to return the records. For example','2016-01-20','10:23:00 am','Columbus, Oh',4,2,'2016-01-18 15:24:01','2016-01-18 15:24:01',NULL,2),(3,'Third','You can use limit to specify the number of records to be retrieved, and use offset to specify the number of records to skip before starting to return the records. For example','2016-02-18','11:30:00 pm','Columbus oh',4,2,'2016-01-18 16:27:45','2016-01-18 16:27:45',NULL,2),(4,'Fourth','You can use limit to specify the number of records to be retrieved, and use offset to specify the number of records to skip before starting to return the records. For example','2016-02-18','11:30:00 pm','Columbus oh',4,2,'2016-01-18 16:28:33','2016-01-18 16:28:33',NULL,2),(5,'Five','You can use limit to specify the number of records to be retrieved, and use offset to specify the number of records to skip before starting to return the records. For example','2016-02-18','11:30:00 pm','Columbus oh',4,2,'2016-01-18 16:31:01','2016-01-18 16:31:01',NULL,2),(6,'Six','You can use limit to specify the number of records to be retrieved, and use offset to specify the number of records to skip before starting to return the records. For example','2016-02-18','11:30:00 pm','Columbus oh',4,2,'2016-01-18 16:31:36','2016-01-18 16:31:36',NULL,2),(7,'Seven','You can use limit to specify the number of records to be retrieved, and use offset to specify the number of records to skip before starting to return the records. For example','2016-02-18','11:30:00 pm','Columbus oh',4,2,'2016-01-18 16:33:47','2016-01-18 16:33:47',NULL,2),(8,'Sample eight','You can use limit to specify the number of records to be retrieved, and use offset to specify the number of records to skip before starting to return the records. For example','2016-02-19','11:45 pm','columbus',4,2,'2016-01-18 17:02:33','2016-01-18 17:02:33',NULL,2),(9,'Sample nine','You can use limit to specify the number of records to be retrieved, and use offset to specify the number of records to skip before starting to return the records. For example','2016-02-19','11:45 pm','columbus',4,2,'2016-01-18 17:02:35','2016-01-18 17:02:35',NULL,2),(10,'Sample ten','You can use limit to specify the number of records to be retrieved, and use offset to specify the number of records to skip before starting to return the records. For example','2016-01-24','12:02:00 pm','gfxxtrx',4,2,'2016-01-18 17:02:36','2016-01-18 17:02:36',NULL,2),(11,'Sample eleven','You can use limit to specify the number of records to be retrieved, and use offset to specify the number of records to skip before starting to return the records. For example','2016-02-19','11:00 pm','sdvasvsv',4,2,'2016-01-18 17:11:59','2016-01-18 17:11:59',NULL,2);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_text` text,
  `parent_id` int(11) DEFAULT NULL,
  `school_user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_messages_on_parent_id` (`parent_id`),
  KEY `index_messages_on_school_user_id` (`school_user_id`),
  CONSTRAINT `fk_rails_aafcb31dbf` FOREIGN KEY (`parent_id`) REFERENCES `parents` (`id`),
  CONSTRAINT `fk_rails_f22ce84d57` FOREIGN KEY (`school_user_id`) REFERENCES `school_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parents`
--

DROP TABLE IF EXISTS `parents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mom_fname` varchar(255) DEFAULT NULL,
  `mom_lname` varchar(255) DEFAULT NULL,
  `dad_fname` varchar(255) DEFAULT NULL,
  `dad_lname` varchar(255) DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `login_id` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parents`
--

LOCK TABLES `parents` WRITE;
/*!40000 ALTER TABLE `parents` DISABLE KEYS */;
INSERT INTO `parents` VALUES (2,'prarthana','byre','appa','amma','prarthana77@yahoo.com','9564153297','umesh','p2711990','2015-11-20 21:00:37','2015-11-20 21:02:52'),(3,'Usha','P','Surendra','P','suren@gmail.com','9876543211','suren','suren123','2015-12-03 14:22:39','2015-12-03 14:22:39'),(4,'mom','mom','umesh','b','','','','','2015-12-06 20:51:28','2015-12-06 20:51:28'),(10,'','','','','','','','','2015-12-07 03:34:44','2015-12-07 03:34:44'),(25,'','','dcsv','','','','','','2015-12-07 17:26:28','2015-12-07 17:26:28'),(29,'','','cerver','','','','','','2015-12-07 17:43:32','2015-12-07 17:43:32'),(33,'','','Fina','final','','','','','2015-12-07 18:40:04','2015-12-07 18:40:04'),(34,'Usha','P','Suren','P','suren@gmail.com',NULL,NULL,NULL,'2015-12-08 01:49:50','2015-12-08 01:49:50'),(35,'shyamal','k','suresh','k','suren@gmail.com',NULL,NULL,NULL,'2015-12-08 14:46:15','2015-12-08 14:46:15'),(39,'kols mom','kols lmom','kols dada','kols ldad','karthikpolina@gmail.com',NULL,NULL,NULL,'2015-12-14 07:02:23','2015-12-14 07:02:23'),(40,'kishore fmom','kishore lmom','kishor fdad','kishore ldad','karthikpolina@gmail.com',NULL,NULL,NULL,'2016-03-08 20:47:35','2016-03-08 20:47:35'),(41,'23f2f33','23f31f','asdasd','adadqdef','karthikpolina@gmail.com',NULL,'asdasdasdasd534','asdaasdasd275','2016-03-09 16:30:17','2016-03-09 16:30:17'),(42,'23f2f33','23f31f','asdasd','adadqdef','karthikpolina@gmail.com',NULL,'asdasdasdasd855','asdaasdasd975','2016-03-09 16:34:52','2016-03-09 16:34:52'),(43,'venkat mom','Venkat mom','venkat dad','Venkat da','venkat.anugu5113@gmail.com',NULL,'Venkatjaja862','Venkjaja131','2016-03-09 16:48:40','2016-03-09 16:48:40'),(44,'Vinod MOM','Vinod MOM','Vinod DAD','Vinod DAD','jsatyavinod@gmail.com ',NULL,'Vinodjaka94','Vinojaka819','2016-03-09 16:50:44','2016-03-09 16:50:44'),(45,'Sathya','Sathya','Uma','Uma','karthikpolina@gmail.com',NULL,'510','693','2016-03-14 16:13:54','2016-03-29 17:59:40'),(46,'','','','','',NULL,'388','794','2016-03-14 16:49:25','2016-03-14 16:49:25'),(47,'Ram Mom','Ram Lmom','Ram dad','Ram Ldad','karthikpolina@gmail.com',NULL,'Ram dadRam Ldad449','Ram Ram Ldad533','2016-03-14 18:22:43','2016-03-14 18:22:43'),(48,'Ram Mom','Ram Lmom','Ram dad','Ram Ldad','karthikpolina@gmail.com',NULL,'Ram dadRam Ldad101','Ram Ram Ldad952','2016-03-14 18:29:02','2016-03-14 18:29:02'),(49,'Ram Mom','Ram Lmom','Ram dad','Ram Ldad','karthikpolina@gmail.com',NULL,'Ram dadRam Ldad226','Ram Ram Ldad417','2016-03-14 18:36:21','2016-03-14 18:36:21'),(50,'Ram Mom','Ram Lmom','Ram dad','Ram Ldad','karthikpolina@gmail.com',NULL,'Ram dadRam Ldad81','Ram Ram Ldad691','2016-03-14 18:38:32','2016-03-14 18:38:32'),(51,'Ram Mom','Ram Lmom','Ram dad','Ram Ldad','karthikpolina@gmail.com',NULL,'Ram dadRam Ldad539','Ram Ram Ldad104','2016-03-14 18:43:15','2016-03-14 18:43:15'),(52,'Ram Mom','Ram Lmom','Ram dad','Ram Ldad','karthikpolina@gmail.com',NULL,'Ram dadRam Ldad51','Ram Ram Ldad58','2016-03-14 18:45:40','2016-03-14 18:45:40'),(53,'Ram Mom','Ram Lmom','Ram dad','Ram Ldad','karthikpolina@gmail.com',NULL,'Ram dadRam Ldad691','Ram Ram Ldad482','2016-03-14 18:47:00','2016-03-14 18:47:00'),(54,'Ram Mom','Ram Lmom','Ram dad','Ram Ldad','karthikpolina@gmail.com',NULL,'Ram dadRam Ldad635','Ram Ram Ldad610','2016-03-14 18:47:32','2016-03-14 18:47:32'),(55,'Ram Mom','Ram Lmom','Ram dad','Ram Ldad','karthikpolina@gmail.com',NULL,'Ram dadRam Ldad444','Ram Ram Ldad563','2016-03-14 18:49:26','2016-03-14 18:49:26'),(56,'Ram Mom','Ram Lmom','Ram dad','Ram Ldad','karthikpolina@gmail.com',NULL,'Ram dadRam Ldad128','Ram Ram Ldad811','2016-03-14 18:51:58','2016-03-14 18:51:58'),(57,'SreeNishita','Yarlagadda','Sreekanth','N','karthikpolina@gmail.com',NULL,'SreekanthN975','SreeN876','2016-03-14 18:53:42','2016-03-14 18:53:42'),(58,'','','','','',NULL,'867','834','2016-03-14 19:01:31','2016-03-14 19:01:31'),(59,'SreeNishita','Yarlagadda','Karthik','Polina','karthikpolina@gmail.com',NULL,'KarthikPolina252','KartPolina35','2016-03-15 14:24:24','2016-03-15 14:24:24'),(60,'SreeNishita','Yarlagadda','Karthik','Polina','karthikpolina@gmail.com',NULL,'KarthikPolina812','KartPolina758','2016-03-15 14:30:00','2016-03-15 14:30:00'),(61,'sathya','jaku','venkat','jaku','karthikpolina@gmail.com',NULL,'venkatjaku243','venkjaku241','2016-03-23 15:47:19','2016-03-23 15:47:19'),(62,'Karthik','Polina','Karthik','Polina','karthikpolina@gmail.com',NULL,'KarthikPolina890','KartPolina50','2016-03-23 16:25:24','2016-03-23 16:25:24'),(63,'Sonali','Nigam','Suud','Nigam','karthikpolina@gmail.com',NULL,'SuudNigam611','SuudNigam674','2016-03-23 16:29:49','2016-03-23 16:29:49'),(64,'Anusha','Pola','Pratap','Pola','karthikpolina@gmail.com',NULL,'PratapPola845','PratPola842','2016-03-23 17:43:21','2016-03-23 17:43:21'),(65,'Karthik','Polina','Karthik','Polina','karthikpolina@gmail.com',NULL,'KarthikPolina868','KartPolina984','2016-03-23 17:48:43','2016-03-23 17:48:43'),(66,'Karthik','Polina','Karthik','Polina','karthikpolina@gmail.com',NULL,'KarthikPolina539','KartPolina689','2016-03-23 17:48:52','2016-03-23 17:48:52'),(67,'Karthik','Polina','Karthik','Polina','karthikpolina@gmail.com',NULL,'KarthikPolina28','KartPolina282','2016-03-23 18:02:28','2016-03-23 18:02:28'),(68,'Karthik','Polina','Karthik','Polina','karthikpolina@gmail.com',NULL,'KarthikPolina264','KartPolina172','2016-03-23 18:10:04','2016-03-23 18:10:04'),(70,'Karthik','Polina','Karthik','Polina','karthikpolina@gmail.com',NULL,'KarthikPolina934','KartPolina827','2016-03-23 18:13:41','2016-03-23 18:13:41'),(71,'Karthik','Polina','Karthik','Polina','karthikpolina@gmail.com',NULL,'KarthikPolina574','KartPolina198','2016-03-23 18:19:09','2016-03-23 18:19:09'),(72,'Karthik','Polina','Karthik','Polina','karthikpolina@gmail.com',NULL,'KarthikPolina312','KartPolina853','2016-03-23 18:30:18','2016-03-23 18:30:18'),(73,'','','','','',NULL,'697','634','2016-03-23 18:35:23','2016-03-23 18:35:23'),(74,'Sushma','That','Ram','That','karthikpolina@gmail.com',NULL,'RamThat933','RamThat671','2016-03-23 18:50:37','2016-03-23 18:50:37'),(75,'Karthik','Polina','Karthik','N','karthikpolina@gmail.com',NULL,'KarthikN644','KartN150','2016-03-23 18:51:58','2016-03-23 18:51:58'),(76,'Karthik','Polina','Karthik','N','karthikpolina@gmail.com',NULL,'KarthikN881','KartN893','2016-03-23 18:53:23','2016-03-23 18:53:23'),(77,'Karthik','Polina','Sreekanth','N','karthikpolina@gmail.com',NULL,'SreekanthN567','SreeN204','2016-03-23 19:06:39','2016-03-23 19:06:39'),(78,'Karthik','Polina','Karthik','Polina','karthikpolina@gmail.com',NULL,'KarthikPolina658','KartPolina430','2016-03-23 19:08:32','2016-03-23 19:08:32'),(79,'Sreekanth','N','Karthik','Polina','karthikpolina@gmail.com',NULL,'KarthikPolina91','KartPolina976','2016-03-23 19:50:46','2016-03-23 19:50:46'),(80,'Sathya','Puram ','Ashi','Puram','jsatyavinod@gmail.com ',NULL,'AshiPuram510','AshiPuram151','2016-03-23 19:53:55','2016-03-23 19:53:55'),(81,'Kruthi','N','Sreekanth','N','prarthana77@yahoo.com',NULL,'SreekanthN997','SreeN377','2016-03-23 19:55:57','2016-03-23 19:55:57'),(82,'Karthik','Polina','Karthik','Polina','karthikpolina@gmail.com',NULL,'KarthikPolina526','KartPolina296','2016-03-23 19:57:09','2016-03-23 19:57:09'),(83,'Karthik','Polina','Karthik','Polina','karthikpolina@gmail.com',NULL,'KarthikPolina456','KartPolina915','2016-03-23 20:02:10','2016-03-23 20:02:10'),(84,'SreeNishita','Yarlagadda','Sreekanth','N','prarthana77@yahoo.com',NULL,'SreekanthN163','SreeN352','2016-03-23 20:03:00','2016-03-23 20:03:00'),(85,'Karthik','Polina','Sreekanth','N','prarthana77@yahoo.com',NULL,'SreekanthN796','SreeN676','2016-03-23 20:04:21','2016-03-23 20:04:21'),(86,'Karthik','Polina','Nishi','Yarlagadda','sreenishi.1991@gmail.com',NULL,'NishiYarlagadda564','NishYarlagadda29','2016-03-23 20:06:32','2016-03-23 20:06:32'),(87,'SreeNishita','Yarlagadda','Karthik','Polina','karthikpolina@gmail.com',NULL,'KarthikPolina51','KartPolina572','2016-03-24 14:20:46','2016-03-24 14:20:46'),(88,'Momu','Prasadu','Ramu','Prasadu','karthikpolina@gmail.com',NULL,'RamuPrasadu9','RamuPrasadu234','2016-03-28 16:20:32','2016-03-28 16:20:32'),(89,'Karthik','Polina','Sreekanth','N','karthikpolina@gmail.com',NULL,'SreekanthN348','SreeN686','2016-03-28 17:02:31','2016-03-28 17:02:31'),(90,'Karthik','Polina','SreeNishita','Yarlagadda','karthikpolina@gmail.com',NULL,'SreeNishitaYarlagadda198','SreeYarlagadda806','2016-03-28 17:07:33','2016-03-28 17:07:33'),(91,'Sreekanth','N','Karthik','Polina','prarthana77@yahoo.com',NULL,'KarthikPolina777','KartPolina987','2016-03-28 17:10:25','2016-03-28 17:10:25'),(92,'SreeNishita','Yarlagadda','Karthik','Polina','prarthana77@yahoo.com',NULL,'KarthikPolina571','KartPolina266','2016-03-28 17:12:54','2016-03-28 17:12:54'),(93,'SreeNishita','Yarlagadda','SreeNishita','Yarlagadda','karthikpolina@gmail.com',NULL,'SreeNishitaYarlagadda306','SreeYarlagadda683','2016-03-28 17:17:57','2016-03-28 17:17:57'),(94,'Akash mom','K','Kranthi ','k','karthikpolina@gmail.com',NULL,'Kranthi k691','Krank897','2016-03-28 17:19:01','2016-03-28 17:19:01'),(95,'Karthik','Polina','Karthik','Polina','karthikpolina@gmail.com',NULL,'KarthikPolina840','KartPolina171','2016-03-28 17:21:57','2016-03-28 17:21:57'),(96,'SreeNishita','Yarlagadda','Sreekanth','N','karthikpolina@gmail.com',NULL,'SreekanthN353','SreeN570','2016-03-28 17:32:12','2016-03-28 17:32:12'),(97,'Karthik','N','Sreekanth','N','karthikpolina@gmail.com',NULL,'SreekanthN681','SreeN813','2016-03-28 17:43:06','2016-03-28 17:43:06'),(98,'Sreekanth','N','Karthik','Polina','karthikpolina@gmail.com',NULL,'KarthikPolina899','KartPolina545','2016-03-28 18:44:13','2016-03-28 18:44:13'),(99,'Karthik','Polina','SreeNishita','Yarlagadda','karthikpolina@gmail.com',NULL,'SreeNishitaYarlagadda107','SreeYarlagadda919','2016-03-28 18:47:17','2016-03-28 18:47:17'),(100,'Sreekanth','N','Karthik','Polina','karthikpolina@gmail.com',NULL,'KarthikPolina428','KartPolina116','2016-03-28 18:50:30','2016-03-28 18:50:30'),(101,'Sreekanth','N','Karthik','Polina','karthikpolina@gmail.com',NULL,'KarthikPolina269','KartPolina777','2016-03-28 18:52:52','2016-03-28 18:52:52'),(102,'','','','','',NULL,'306','873','2016-03-28 18:54:23','2016-03-28 18:54:23'),(103,'Sreekanth','N','Karthik','Polina','prarthana77@yahoo.com',NULL,'KarthikPolina82','KartPolina729','2016-03-28 18:55:43','2016-03-28 18:55:43'),(104,'Sreekanth','N','Karthik','Polina','karthikpolina@gmail.com',NULL,'KarthikPolina110','KartPolina3','2016-03-28 18:57:43','2016-03-28 18:57:43'),(105,'Karthik','Polina','SreeNishita','Yarlagadda','karthikpolina@gmail.com',NULL,'SreeNishitaYarlagadda115','SreeYarlagadda636','2016-03-28 19:01:42','2016-03-28 19:01:42'),(106,'SreeNishita','Yarlagadda','Sreekanth','N','karthikpolina@gmail.com',NULL,'SreekanthN138','SreeN406','2016-03-28 19:02:37','2016-03-28 19:02:37'),(107,'Karthik','Polina','Karthik','Polina','karthikpolina@gmail.com',NULL,'KarthikPolina421','KartPolina402','2016-03-28 19:25:38','2016-03-28 19:25:38'),(108,'Karthik','Polina','Karthik','Polina','karthikpolina@gmail.com',NULL,'KarthikPolina854','KartPolina828','2016-03-28 23:18:48','2016-03-28 23:18:48'),(109,'SreeNishita','Yarlagadda','Karthik','Polina','karthikpolina@gmail.com',NULL,'KarthikPolina897','KartPolina364','2016-03-28 23:29:09','2016-03-28 23:29:09'),(110,'Karthik','Polina','SreeNishita','Yarlagadda','karthikpolina@gmail.com',NULL,'SreeNishitaYarlagadda834','SreeYarlagadda240','2016-03-28 23:30:07','2016-03-28 23:30:07'),(111,'SreeNishita','Yarlagadda','Sreekanth','N','prarthana77@yahoo.com',NULL,'SreekanthN676','SreeN747','2016-03-28 23:31:07','2016-03-28 23:31:07'),(112,'Singam','Sad','Sonu','sad','karthikpolina@gmail.com',NULL,'Sonusad709','Sonusad770','2016-03-28 23:32:18','2016-03-28 23:32:18'),(113,'Usha','Polina','Suren','Polina','karthikpolina@gmail.com',NULL,'SurenPolina984','SurePolina73','2016-03-29 00:17:56','2016-03-29 00:17:56'),(114,'Usha','Dodda','Jyothi ','Dodda','karthikpolina@gmail.com',NULL,'Jyothi Dodda777','JyotDodda934','2016-03-29 00:20:00','2016-03-29 00:20:00'),(115,'Sulochana','Dodda','Jyothi','Dodda','karthikpolina@gmail.com',NULL,'JyothiDodda682','JyotDodda6','2016-03-29 00:23:13','2016-03-29 00:23:13'),(116,'Sulochana','N','Nagabhyru','N','karthikpolina@gmail.com',NULL,'NagabhyruN226','NagaN239','2016-03-29 00:41:08','2016-03-29 00:41:08'),(117,'','','','','',NULL,'487','977','2016-03-29 13:33:19','2016-03-29 13:33:19'),(118,'Sathya','Sathya','Uma','Uma','karthikpolina@gmail.com',NULL,'UmaKarnati630','UmaKarnati994','2016-03-29 14:28:38','2016-03-29 17:19:04'),(119,'kishore fmom','kishore lmom','kishor fdad','kishore ldad','karthikpolina@gmail.com',NULL,'kishor fdadkishore ldad840','kishkishore ldad380','2016-03-29 14:34:30','2016-03-29 14:34:30'),(120,'Sulochana','Dodda','Jyothi','Dodda','karthikpolina@gmail.com',NULL,'JyothiDodda391','JyotDodda68','2016-03-29 17:27:14','2016-03-29 17:27:14');
/*!40000 ALTER TABLE `parents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_type` varchar(25) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin',NULL,NULL),(2,'Teacher',NULL,NULL),(3,'Parent',NULL,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20151118182214'),('20151118183247'),('20151118194159'),('20151119030032'),('20151119030409'),('20151119031025'),('20151119144123'),('20151119145131'),('20151119145329'),('20151119145738'),('20151119145825'),('20151120213435'),('20151121002003'),('20151122031018'),('20151214004419'),('20160115172657'),('20160115174506'),('20160202171318'),('20160218192208'),('20160218194111'),('20160314174936'),('20160324144602');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_users`
--

DROP TABLE IF EXISTS `school_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `login_id` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `password_digest` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_school_users_on_role_id` (`role_id`),
  KEY `index_school_users_on_school_id` (`school_id`),
  CONSTRAINT `fk_rails_28d26482c3` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `fk_rails_767c074902` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_users`
--

LOCK TABLES `school_users` WRITE;
/*!40000 ALTER TABLE `school_users` DISABLE KEYS */;
INSERT INTO `school_users` VALUES (1,'Karthik','Polina','karthikpolina@gmail.com','98766543321','kar123',1,1,'2015-11-21 00:45:13','2015-11-21 00:45:13',NULL),(2,'Sreekanth','N','graduateschool@tamiu.edu','98766543321','sr123',1,2,'2015-11-21 22:18:30','2015-11-21 22:18:30',NULL),(4,'Prarthana','Basgod','prat@gmail.com','123456789','prat123',2,2,'2015-11-22 01:20:02','2016-03-22 14:53:15','$2a$10$QCOPmPel1hpjyvZUYQP5rOurDdbckAFl16gtk1z2sOarv7Mpw89W6'),(5,'Lekhya','P','lek@gmail.com','1234567899','lek123',1,2,'2015-11-22 03:25:36','2015-11-22 03:25:36','$2a$10$3A5UcwFeD1H/ZRpMY5pvAOI9ya3a47vQuYIelQmICC0pxNsj05oje'),(6,'Venkat','Anugu','venkat@gmail.com','9561234780','venkat123',2,2,'2015-12-01 18:15:32','2015-12-01 18:15:32','$2a$10$PpFJv9pWS4N92ms4jf4cveuh3oax.SkZp9ZVS1LG2PH2L3GIGhKve'),(7,'Harsha ','Vardhan Reddy','harsha@gmail.com','9876543211','harsha123',2,2,'2015-12-03 03:51:58','2015-12-08 05:05:36','$2a$10$0KGRL.X37Sfg11P3I9PFx.xqjuzmn3xjhBdcW.NJIOWTnUCj4XAze'),(8,'Nikesh','bathula','nikesh@gmail.com','95678912345','nik',2,2,'2015-12-03 04:01:27','2015-12-03 04:01:27','$2a$10$GwZBdG0LrcuVKGJMqFcBu.eM/d6oYMW4I2jxqCnz5tyk6bxA7Gn3O'),(9,'Harsha','Gosula','karthikpolina@gmail.com','9876543214','harsha123',2,2,'2015-12-04 05:31:12','2015-12-08 05:10:38','$2a$10$Q3tQCYIrCaAgxUT8N5q12ei0Vx/lIhK0/zxALgyTCAwtcEn/AK11a'),(11,'Sreenu','G','karthikpolina@gmail.com','9561234780','sreenu',2,2,'2015-12-08 14:37:34','2015-12-08 14:37:34','$2a$10$jg/uwJFlrqGPVGch/WMA.eY54SVu6D/bxUpMfEc1SIVMKaug/vTea'),(13,'keith','seq','keith@gmail.com','987654321','keith123',1,7,'2015-12-14 15:53:04','2015-12-14 15:53:04','$2a$10$8PAhWo37ct1o3UwmNab2uOK1adC3v/AZwchA9z9v/ijq.QB3Dg9XK'),(14,'Bala','Chinappa','karthikp2323@gmail.com','9561234780','bala',2,2,'2016-02-02 19:19:05','2016-03-24 13:16:31','$2a$10$bpa1ymkxTJU0gpcjevgZUehTWSkw2HPaWgsiVxfyWtIYZQOsscO6C'),(15,'Rithvin','B','karthikpolina@gmail.com','9561234780','rithvik',2,7,'2016-02-02 19:35:44','2016-02-02 19:35:44','$2a$10$2X.rSHlOFIVXs3HpJHynl.vYsr0nxy7Ze6/1/zICfld.VMI7loUtS'),(16,'Vinod','Jak','vinod@gmail.com','956-314-2689','vinod123',1,8,'2016-03-01 02:44:04','2016-03-01 02:44:04','$2a$10$3ot6e98rxvUT6XLGAmgDeuxJQ9kdFjK9c00kLt0TQwynxGCzFUPJu'),(51,'Karthik','Polina','karthikpolina@gmail.com','9561234780','KarthikPolina904',2,2,'2016-03-16 14:49:50','2016-03-24 14:18:24','$2a$10$4Vv29.wa5SCKqgp2hG/zjedi1PcvLPAFFTdFf5ZnWrMyh3EBKPc1K'),(61,'Sreekanth','N','karthikpolina@gmail.com','9561234780','SreekanthN871',2,2,'2016-03-16 16:45:01','2016-03-16 16:45:01','$2a$10$93NqyCi9XZHVHyRrJZFyiuHSwzdyMSPBy5Dx3F7Fbe1neuCwL3KRO'),(64,'Kruthika','Gasi','karthikpolina@gmail.com','9561234780','KruthikaGasi776',2,2,'2016-03-18 01:35:36','2016-03-22 14:52:45','$2a$10$fL9QMYT3Ca4J8f3dcPCDfulNBlkNoozzyGyPL1WuZWKSXFoOneYaW');
/*!40000 ALTER TABLE `school_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schools`
--

DROP TABLE IF EXISTS `schools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_name` varchar(100) DEFAULT NULL,
  `address_line1` varchar(100) DEFAULT NULL,
  `address_line2` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `zip` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `fax` varchar(15) DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `working_hours` varchar(50) DEFAULT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `email_id` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schools`
--

LOCK TABLES `schools` WRITE;
/*!40000 ALTER TABLE `schools` DISABLE KEYS */;
INSERT INTO `schools` VALUES (1,'First school','Plot no: 669, Prashanthnagar\r\nVanasthalipuram','','Hyderabad','500070','telangana','India','','9876543210','','Karthik','karthikpolina@gmail.com','2015-11-21 00:45:13','2015-11-21 00:45:13'),(2,'Ohio kindergarden','7550 Country Club Dr\r\nApt 4108','','Laredo','500070','Texas','United States','','9876543210','','Sreekanth','sr123@gmail.com','2015-11-21 22:18:30','2015-11-21 22:18:30'),(7,'Dublin school',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9876543210',NULL,NULL,'dublin@gmail.com','2015-12-14 15:53:04','2015-12-14 15:53:04'),(8,'St Patric',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'956-314-2689',NULL,NULL,'stpatric@gmail.com','2016-03-01 02:44:04','2016-03-01 02:44:04'),(9,'asdasd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'123123',NULL,NULL,'adsa','2016-03-03 19:54:28','2016-03-03 19:54:28'),(10,'asdasd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'123123',NULL,NULL,'adsa','2016-03-03 19:57:09','2016-03-03 19:57:09'),(11,'Tuttle bethel school',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9876543210',NULL,NULL,'prarthana77@yahoo.com','2016-03-06 21:38:42','2016-03-06 21:38:42'),(12,'Tuttle bethel school',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9876543210',NULL,NULL,'karthikpolina@gmail.com','2016-03-06 21:50:33','2016-03-06 21:50:33'),(13,'Tuttle bethel school',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9876543210',NULL,NULL,'karthikpolina@gmail.com','2016-03-06 21:51:31','2016-03-06 21:51:31'),(14,'Tuttle bethel school',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9876543210',NULL,NULL,'karthikpolina@gmail.com','2016-03-06 21:55:11','2016-03-06 21:55:11'),(15,'Tuttle bethel school',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9876543210',NULL,NULL,'karthikpolina@gmail.com','2016-03-06 22:51:52','2016-03-06 22:51:52');
/*!40000 ALTER TABLE `schools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentlogindetails`
--

DROP TABLE IF EXISTS `studentlogindetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentlogindetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` varchar(255) DEFAULT NULL,
  `password_digest` varchar(255) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_studentlogindetails_on_student_id` (`student_id`),
  CONSTRAINT `fk_rails_7244322e5c` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentlogindetails`
--

LOCK TABLES `studentlogindetails` WRITE;
/*!40000 ALTER TABLE `studentlogindetails` DISABLE KEYS */;
INSERT INTO `studentlogindetails` VALUES (1,'sASCADCASC737','sASCDCASC868',3,'2016-03-14 16:13:52','2016-03-14 16:13:52'),(2,'sASCADCASC797','$2a$10$z/zAt/G9lfObrBfb0lXtvu/FqhJMD0NlsfwIFt.c7rdRO4dvdRKHO',3,'2016-03-14 16:49:25','2016-03-14 16:49:25'),(3,'RamPak664','$2a$10$bSzIiIoz96BBt241lyR0K../snUoxwBQUM.vnlnYN6hEPkobQ6Fla',3,'2016-03-14 18:22:43','2016-03-14 18:22:43'),(4,'RamPak770','$2a$10$ypSpg5jW9XrB.TU70MrfJ.fcI0BVc8h01MBjTcTK6rLolh0yCdBmu',3,'2016-03-14 18:29:02','2016-03-14 18:29:02'),(5,'RamPak9','$2a$10$73onbXpN.s.h0RCxWAvNl.21waHhusT8hUbsysYgCiTQmIY15XMjS',3,'2016-03-14 18:36:42','2016-03-14 18:36:42'),(6,'RamPak643','$2a$10$ZxmbpmfmBuUg2BYqCzOfIuLzzvQNY9ojKURDmvBGU4Le5KmxW.znS',3,'2016-03-14 18:38:43','2016-03-14 18:38:43'),(7,'RamPak561','$2a$10$eSyE2Ypn8w87tA3xytUK1.H/pNn0kb/BdSByqdCQjYgeGLfcHIahq',3,'2016-03-14 18:43:22','2016-03-14 18:43:22'),(8,'RamPak220','$2a$10$ctu3y9iLC0OEvOqX85FHVOhVVx1W4hl7KM5vzALO8j643V77eRrqq',3,'2016-03-14 18:45:40','2016-03-14 18:45:40'),(9,'RamPak846','$2a$10$eh3h15pRqN.IFU6PwSYWk.oyPZyHd6LWtgiRZDIrHPNWrttqAqYuO',3,'2016-03-14 18:47:00','2016-03-14 18:47:00'),(10,'RamPak454','$2a$10$kE0kjpwC2jSsGJdlD3rsuO9tIVXfsIKielD1muCbxgPssH2lcL8ay',3,'2016-03-14 18:47:32','2016-03-14 18:47:32'),(11,'RamPak803','$2a$10$nDnq3quXgieGMaaIuwSW9OqPk9IjckEApLVJ3dlSEE8MVbCdFpBk6',3,'2016-03-14 18:49:26','2016-03-14 18:49:26'),(12,'RamPak803','$2a$10$Ap8gwXxtYTpWGUWbZ86uQusAJ2vDXlRLyfQY/j1xqeD.Oag7e5VGW',3,'2016-03-14 18:51:58','2016-03-14 18:51:58'),(13,'KarthikPolina519','$2a$10$XLgzGEHlfwQAGdG1FpgsAOz8ERxyzVBTUIjx6gDGpKORZdvWsWehS',3,'2016-03-14 18:53:42','2016-03-14 18:53:42'),(14,'917','$2a$10$E3H/9xCct97Mov9iTsgEuODZxJIgsd/RgbnPOwmVytYz39tjABB4K',3,'2016-03-14 19:01:31','2016-03-14 19:01:31'),(15,'RithvikSoleti722','$2a$10$/3mHRVwAz/jjU8wtYzUFoea0EaIFlv47UzRDWNbgMltqjfnjdGboa',61,'2016-03-15 14:30:10','2016-03-15 14:30:10'),(16,'VinodJeeth903','$2a$10$eV.IF.YghymVgnAZFsHuZOyuLewTrhr.nIyPyZ8yVj7sRpdfxNGMG',62,'2016-03-23 16:04:11','2016-03-23 16:04:11'),(17,'SubhaPolina472','$2a$10$53zz0/GnXkVgfv2n/0w9XefaAh4vTGnwYK4.PLNuaR8.txT9bsI9K',86,'2016-03-23 20:04:21','2016-03-23 20:04:21'),(18,'NishithaN307','$2a$10$Lfd2Rvs.XZ7.Ttz8Pi3yqeNGF0T7GbrBykP6qtT9CTh4uZeLEaFFi',87,'2016-03-23 20:06:33','2016-03-23 20:06:33');
/*!40000 ALTER TABLE `studentlogindetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `emergency_contact` varchar(255) DEFAULT NULL,
  `address_line1` varchar(255) DEFAULT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `IsLogIn` tinyint(1) DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_students_on_school_id` (`school_id`),
  KEY `index_students_on_parent_id` (`parent_id`),
  CONSTRAINT `fk_rails_0adebddbd5` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`),
  CONSTRAINT `fk_rails_d3631a714a` FOREIGN KEY (`parent_id`) REFERENCES `parents` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (3,'pruthvi','raj',NULL,'6647899595959','tgyhfh','brittonwoods','banglore','8774774oh','Ohio','United States',NULL,3,'2015-11-20 21:00:37','2015-11-20 21:02:11',NULL,NULL),(4,'Karthik','Polina','2015-12-11','987654322','Plot no: 669, Prashanthnagar','Vanasthalipuram','Hyderabad','500070','New Jersey','India',NULL,3,'2015-12-03 14:22:39','2015-12-03 14:22:39',NULL,NULL),(5,'prarthana','b','2015-12-06','','','','','','','',NULL,4,'2015-12-06 20:51:28','2015-12-06 20:51:28',NULL,NULL),(11,'','',NULL,'','','','','','','',NULL,10,'2015-12-07 03:34:44','2015-12-07 03:34:44',NULL,NULL),(30,'ververv','',NULL,'','','','','','','',NULL,33,'2015-12-07 17:43:32','2015-12-07 17:43:32',NULL,NULL),(34,'new ','new',NULL,'','','','','','','',NULL,33,'2015-12-07 18:40:04','2015-12-07 18:40:04',NULL,NULL),(35,'Lekhya','Polina','2015-12-14','','','','','','','',NULL,34,'2015-12-08 01:49:50','2015-12-14 14:45:19',NULL,NULL),(36,'Kranthi','K',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,'2015-12-08 14:46:15','2015-12-08 14:46:15',NULL,NULL),(40,'kols','mich',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39,'2015-12-14 07:02:23','2015-12-14 07:02:23',NULL,NULL),(42,'Swaraj','Mazda','2016-03-09','','','','','','','',NULL,41,'2016-03-09 16:30:17','2016-03-09 18:31:59',NULL,NULL),(43,'Kranthi','asdasd','2016-03-09','','','','','','','',NULL,42,'2016-03-09 16:34:52','2016-03-09 19:09:53',NULL,NULL),(44,'Venkat','Reddy','2016-03-09','','','','','','','',NULL,43,'2016-03-09 16:48:40','2016-03-09 17:59:37',NULL,NULL),(45,'Vinod','jaka',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,'2016-03-09 16:50:44','2016-03-09 16:50:44',NULL,NULL),(46,'sASCA','DCASC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,'2016-03-14 16:13:54','2016-03-29 17:51:24',0,''),(47,'sASCA','DCASC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,'2016-03-14 16:49:25','2016-03-14 16:49:25',NULL,NULL),(48,'Ram','Pak',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,'2016-03-14 18:22:43','2016-03-14 18:22:43',NULL,NULL),(49,'Ram','Pak',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,'2016-03-14 18:29:02','2016-03-14 18:29:02',NULL,NULL),(50,'Ram','Pak',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,'2016-03-14 18:36:21','2016-03-14 18:36:21',NULL,NULL),(51,'Ram','Pak',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,'2016-03-14 18:38:32','2016-03-14 18:38:32',NULL,NULL),(52,'Ram','Pak',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,51,'2016-03-14 18:43:15','2016-03-14 18:43:15',1,'karthikpolina@gmail.com'),(53,'Ram','Pak',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,52,'2016-03-14 18:45:40','2016-03-14 18:45:40',1,'karthikpolina@gmail.com'),(54,'Ram','Pak',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,53,'2016-03-14 18:47:00','2016-03-14 18:47:00',1,'karthikpolina@gmail.com'),(55,'Ram','Pak',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,54,'2016-03-14 18:47:32','2016-03-14 18:47:32',1,'karthikpolina@gmail.com'),(56,'Ram','Pak',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,55,'2016-03-14 18:49:26','2016-03-14 18:49:26',1,'karthikpolina@gmail.com'),(57,'Ram','Pak',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,56,'2016-03-14 18:51:58','2016-03-14 18:51:58',1,'karthikpolina@gmail.com'),(58,'Karthik','Polina',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,57,'2016-03-14 18:53:42','2016-03-14 18:53:42',1,'karthikpolina@gmail.com'),(59,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,58,'2016-03-14 19:01:31','2016-03-14 19:01:31',1,''),(60,'Rithvik','Soleti',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,59,'2016-03-15 14:24:24','2016-03-15 14:24:24',1,'karthikpolina@gmail.com'),(61,'Rithvik','Soleti',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,60,'2016-03-15 14:30:00','2016-03-15 14:30:00',1,'karthikpolina@gmail.com'),(62,'Vinod','Jeeth',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,61,'2016-03-23 15:47:19','2016-03-23 15:47:19',0,''),(63,'Karthik','Polina',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,62,'2016-03-23 16:25:24','2016-03-23 16:25:24',0,''),(69,'Karthik','Polina',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,68,'2016-03-23 18:10:04','2016-03-23 18:10:04',0,''),(75,'Sudheer','Thai',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,74,'2016-03-23 18:50:37','2016-03-23 18:50:37',1,'karthikpolina@gmail.com'),(76,'Karthik','Polina',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,75,'2016-03-23 18:51:58','2016-03-23 18:51:58',0,''),(77,'Karthik','Polina',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,76,'2016-03-23 18:53:23','2016-03-23 18:53:23',0,''),(78,'Karthik','Polina',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,77,'2016-03-23 19:06:39','2016-03-23 19:06:39',0,''),(79,'SreeNishita','Yarlagadda',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,78,'2016-03-23 19:08:32','2016-03-23 19:08:32',0,''),(80,'Vinod','Polina',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,79,'2016-03-23 19:50:46','2016-03-23 19:50:46',0,''),(81,'Kiran','Puram',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,80,'2016-03-23 19:53:55','2016-03-23 19:53:55',0,''),(82,'Subh','Polina',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,81,'2016-03-23 19:55:57','2016-03-23 19:55:57',1,'karthikpolina@gmail.com'),(83,'Sreekanth','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,82,'2016-03-23 19:57:09','2016-03-23 19:57:09',1,'karthikpolina@gmail.com'),(84,'Karthik','Polina',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,83,'2016-03-23 20:02:10','2016-03-23 20:02:10',1,'karthikpolina@gmail.com'),(85,'Subha','Polina',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,84,'2016-03-23 20:03:00','2016-03-23 20:03:00',1,'karthikpolina@gmail.com'),(86,'Subha','Polina',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,85,'2016-03-23 20:04:21','2016-03-23 20:04:21',1,'karthikpolina@gmail.com'),(87,'Nishitha','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,86,'2016-03-23 20:06:32','2016-03-23 20:06:32',1,'sreenishitay@gmail.com '),(88,'Sreekanth','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,87,'2016-03-24 14:20:46','2016-03-24 14:20:46',0,''),(89,'Ram','Prasadu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,88,'2016-03-28 16:20:32','2016-03-28 16:20:32',0,''),(90,'Ram','Polina',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,89,'2016-03-28 17:02:31','2016-03-28 17:02:31',0,''),(91,'Sreekanth','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,90,'2016-03-28 17:07:33','2016-03-28 17:07:33',0,''),(92,'Karthik','Polina',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,91,'2016-03-28 17:10:25','2016-03-28 17:10:25',0,''),(93,'texas','university',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,92,'2016-03-28 17:12:54','2016-03-28 17:12:54',0,''),(94,'Ram','kukatla',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,93,'2016-03-28 17:17:57','2016-03-28 17:17:57',0,''),(95,'Akash','K',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,94,'2016-03-28 17:19:01','2016-03-28 17:19:01',0,''),(96,'Abhinav','K',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,95,'2016-03-28 17:21:57','2016-03-28 17:21:57',0,''),(97,'Karthik','Polina',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,96,'2016-03-28 17:32:12','2016-03-28 17:32:12',0,''),(98,'Sreekanth','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,97,'2016-03-28 17:43:06','2016-03-28 17:43:06',0,''),(99,'Vinod','jaka',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,98,'2016-03-28 18:44:13','2016-03-28 18:44:13',0,''),(100,'SreeNishita','Yarlagadda',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,99,'2016-03-28 18:47:17','2016-03-28 18:47:17',0,''),(101,'Sathi','jaja',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100,'2016-03-28 18:50:30','2016-03-28 18:50:30',0,''),(109,'Sreekanth','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,108,'2016-03-28 23:18:48','2016-03-28 23:18:48',0,''),(110,'Karthik','Polina',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,109,'2016-03-28 23:29:09','2016-03-28 23:29:09',0,''),(112,'Karthik','Polina',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,111,'2016-03-28 23:31:07','2016-03-28 23:31:07',0,''),(113,'Abhi','sad',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,112,'2016-03-28 23:32:18','2016-03-28 23:32:18',0,''),(114,'Karthik','Polina',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,113,'2016-03-29 00:17:56','2016-03-29 00:17:56',0,''),(115,'Suresh ','DOdda',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,114,'2016-03-29 00:20:00','2016-03-29 00:20:00',0,''),(116,'Ramesh','Dodda',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,115,'2016-03-29 00:23:13','2016-03-29 00:23:13',0,''),(117,'Dhanunjai','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,116,'2016-03-29 00:41:08','2016-03-29 00:41:08',0,''),(119,'Ajay','Karnati',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,118,'2016-03-29 14:28:38','2016-03-29 17:44:20',0,''),(120,'Kishore','Pola',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,119,'2016-03-29 14:34:30','2016-03-29 14:34:30',0,''),(121,'Ram','Pak',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,'2016-03-29 14:41:42','2016-03-29 14:41:42',0,''),(122,'Usha','Polina',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,120,'2016-03-29 17:27:14','2016-03-29 17:27:14',0,'');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'prarthana77@yahoo.com','$2a$10$a4q2hjN6cCypPxXawiAck.f/OJCfukwb7b25rj.XEokiIOjn16eGi',NULL,NULL,NULL,1,'2015-11-20 22:05:02','2015-11-20 22:05:02','::1','::1','2015-11-20 22:05:02','2015-11-20 22:05:02'),(2,'karthikpolina@gmail.com','$2a$10$rT5JyTNl6vo3bdnx9cYd.Op4xtp4m4PLiFDO8/yohvbyVok8l4SiC',NULL,NULL,NULL,1,'2015-11-21 03:12:15','2015-11-21 03:12:15','::1','::1','2015-11-21 03:12:15','2015-11-21 03:12:15');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-29 15:15:34
