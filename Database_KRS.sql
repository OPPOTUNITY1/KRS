CREATE DATABASE  IF NOT EXISTS `krs` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `krs`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: krs
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_contact`
--

DROP TABLE IF EXISTS `admin_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_contact` (
  `full_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `setting_id` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `subject_name` varchar(100) DEFAULT NULL,
  `message` text,
  `contact_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`contact_id`),
  KEY `admin_contact_system_setting_setting_id_fk` (`setting_id`),
  KEY `admin_contact_user_user_id_fk` (`created_by`),
  CONSTRAINT `admin_contact_system_setting_setting_id_fk` FOREIGN KEY (`setting_id`) REFERENCES `system_setting` (`setting_id`),
  CONSTRAINT `admin_contact_user_user_id_fk` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_contact`
--

LOCK TABLES `admin_contact` WRITE;
/*!40000 ALTER TABLE `admin_contact` DISABLE KEYS */;
INSERT INTO `admin_contact` VALUES ('Esteem Wilson','trongwilson2k3@gmail.com','0365299680',12,2,'Error','ok',7);
/*!40000 ALTER TABLE `admin_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `class_id` int NOT NULL AUTO_INCREMENT,
  `class_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `teacher_id` int DEFAULT NULL,
  `setting_id` int DEFAULT NULL,
  PRIMARY KEY (`class_id`),
  KEY `class_creater_idx` (`created_by`),
  KEY `class_teacher_idx` (`teacher_id`),
  KEY `class_updater_idx` (`updated_by`),
  KEY `fk_setting_id` (`setting_id`),
  CONSTRAINT `class_creater` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`),
  CONSTRAINT `class_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `class_updater` FOREIGN KEY (`updated_by`) REFERENCES `user` (`user_id`),
  CONSTRAINT `fk_setting_id` FOREIGN KEY (`setting_id`) REFERENCES `system_setting` (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,'SE1808','SWP',NULL,NULL,NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_list`
--

DROP TABLE IF EXISTS `class_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_list` (
  `list_id` int NOT NULL AUTO_INCREMENT,
  `class_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`list_id`),
  KEY `class_list_user_idx` (`user_id`),
  KEY `class_list_id` (`class_id`),
  CONSTRAINT `class_list_id` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`),
  CONSTRAINT `class_list_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_list`
--

LOCK TABLES `class_list` WRITE;
/*!40000 ALTER TABLE `class_list` DISABLE KEYS */;
INSERT INTO `class_list` VALUES (1,1,1),(2,1,3),(3,1,4),(4,1,5);
/*!40000 ALTER TABLE `class_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_subject`
--

DROP TABLE IF EXISTS `class_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_subject` (
  `class_id` int NOT NULL,
  `subject_id` int NOT NULL,
  PRIMARY KEY (`class_id`,`subject_id`),
  KEY `class_subject_subject_subject_id_fk` (`subject_id`),
  CONSTRAINT `class_subject_class_class_id_fk` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`),
  CONSTRAINT `class_subject_subject_subject_id_fk` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_subject`
--

LOCK TABLES `class_subject` WRITE;
/*!40000 ALTER TABLE `class_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam` (
  `exam_id` int NOT NULL AUTO_INCREMENT,
  `exam_name` varchar(300) DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  PRIMARY KEY (`exam_id`),
  KEY `class_exam_idx` (`subject_id`),
  CONSTRAINT `class_exam` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_config`
--

DROP TABLE IF EXISTS `exam_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_config` (
  `config_id` int NOT NULL,
  `lesson_id` int DEFAULT NULL,
  `exam_id` int DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `maxium_score` int DEFAULT NULL,
  `pass_score` float DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `question_count` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`config_id`),
  KEY `exam_config_id_idx` (`exam_id`),
  KEY `exam_config_lesson` (`lesson_id`),
  CONSTRAINT `exam_config_id` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`exam_id`),
  CONSTRAINT `exam_config_lesson` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`lesson_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_config`
--

LOCK TABLES `exam_config` WRITE;
/*!40000 ALTER TABLE `exam_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_question`
--

DROP TABLE IF EXISTS `exam_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_question` (
  `exam_id` int NOT NULL,
  `question_id` int DEFAULT NULL,
  PRIMARY KEY (`exam_id`),
  KEY `exam_question_idx` (`question_id`),
  CONSTRAINT `exam_question` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`),
  CONSTRAINT `exam_question_id` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_question`
--

LOCK TABLES `exam_question` WRITE;
/*!40000 ALTER TABLE `exam_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_result`
--

DROP TABLE IF EXISTS `exam_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_result` (
  `result_id` int NOT NULL AUTO_INCREMENT,
  `exam_id` int DEFAULT NULL,
  `result` float DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`result_id`),
  KEY `exam_result_id_idx` (`exam_id`),
  KEY `exam_result_user_idx` (`user_id`),
  CONSTRAINT `exam_result_id` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`exam_id`),
  CONSTRAINT `exam_result_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_result`
--

LOCK TABLES `exam_result` WRITE;
/*!40000 ALTER TABLE `exam_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson`
--

DROP TABLE IF EXISTS `lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lesson` (
  `lesson_id` int NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `title` varchar(100) DEFAULT NULL,
  `video_url` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `description` text,
  `parent_id` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  PRIMARY KEY (`lesson_id`),
  KEY `lesson_lesson_lesson_id_fk` (`parent_id`),
  KEY `lesson_subject_subject_id_fk` (`subject_id`),
  CONSTRAINT `lesson_lesson_lesson_id_fk` FOREIGN KEY (`parent_id`) REFERENCES `lesson` (`lesson_id`),
  CONSTRAINT `lesson_subject_subject_id_fk` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson`
--

LOCK TABLES `lesson` WRITE;
/*!40000 ALTER TABLE `lesson` DISABLE KEYS */;
INSERT INTO `lesson` VALUES (1,'<h1 class=\"h1\" style=\"margin: 5px 0px 0px; padding: 0px; line-height: 1.3em; font-family: erdana, helvetica, arial, sans-serif; font-size: 29px; color: rgb(97, 11, 56); text-align: justify;\">Learn JavaScript Tutorial</h1><h3 class=\"title\" style=\"margin-right: 0px; margin-bottom: 12px; margin-left: 0px; padding: 0px; line-height: var(--tg-heading-line-height); color: var(--tg-heading-color); font-size: 24px; font-family: var(--tg-heading-font-family);\"><img src=\"https://static.javatpoint.com/images/javascript/javascript_logo.png\" width=\"200\" height=\"200\" alt=\"JavaScript Tutorial\" class=\"imageright\" style=\"margin: 0px 0px 0px 20px; padding: 0px; max-width: 100%; height: auto; float: right; color: rgb(51, 51, 51); font-family: inter-regular, system-ui, -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 16px; text-align: justify;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: inter-regular, system-ui, -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 16px; text-align: justify;\">Our <span style=\"margin: 0px; padding: 0px; font-family: inter-bold, system-ui, -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-weight: 700;\">JavaScript Tutorial</span> is designed for beginners and professionals both. JavaScript is used to create client-side dynamic pages.</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: inter-regular, system-ui, -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 16px; text-align: justify;\">JavaScript is <em style=\"margin: 0px; padding: 0px;\">an object-based scripting language</em> which is lightweight and cross-platform.</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: inter-regular, system-ui, -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 16px; text-align: justify;\">JavaScript is not a compiled language, but it is a translated language. The JavaScript Translator (embedded in the browser) is responsible for translating the JavaScript code for the web browser.</p></h3><h2 class=\"h2\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; line-height: 1.3em; font-family: erdana, helvetica, arial, sans-serif; color: rgb(97, 11, 56); font-size: 25px; text-align: justify;\">What is JavaScript</h2><h3 class=\"title\" style=\"margin-right: 0px; margin-bottom: 12px; margin-left: 0px; padding: 0px; line-height: var(--tg-heading-line-height); color: var(--tg-heading-color); font-size: 24px; font-family: var(--tg-heading-font-family);\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: inter-regular, system-ui, -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 16px; text-align: justify;\">JavaScript (js) is a light-weight object-oriented programming language which is used by several websites for scripting the webpages. It is an interpreted, full-fledged programming language that enables dynamic interactivity on websites when applied to an HTML document. It was introduced in the year 1995 for adding programs to the webpages in the Netscape Navigator browser. Since then, it has been adopted by all other graphical web browsers. With JavaScript, users can build modern web applications to interact directly without reloading the page every time. The traditional website uses js to provide several forms of interactivity and simplicity.<span id=\"jizsl_dggnangiabgoan\" class=\"jizsl_vkdsku20k5vdbjk2mk9y2121k5\" style=\"margin: 10px auto 30px; padding: 0px; display: block; clear: both;\"></span></p><div style=\"margin: 0px; padding: 0px; display: flex; justify-content: center; align-items: center; position: relative;\"><iframe src=\"about:blank\" enjgioijew=\"\" width=\"730\" height=\"90\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" scrolling=\"no\" data-gtm-yt-inspected-6=\"true\" style=\"margin: 0px; padding: 0px; width: 730px !important;\"></iframe></div><p></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: inter-regular, system-ui, -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 16px; text-align: justify;\">Although, JavaScript has no connectivity with Java programming language. The name was suggested and provided in the times when Java was gaining popularity in the market. In addition to web browsers, databases such as CouchDB and MongoDB uses JavaScript as their scripting and query language.</p></h3><h2 class=\"h2\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; line-height: 1.3em; font-family: erdana, helvetica, arial, sans-serif; color: rgb(97, 11, 56); font-size: 25px; text-align: justify;\">Features of JavaScript</h2><h3 class=\"title\" style=\"margin-right: 0px; margin-bottom: 12px; margin-left: 0px; padding: 0px; line-height: var(--tg-heading-line-height); color: var(--tg-heading-color); font-size: 24px; font-family: var(--tg-heading-font-family);\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: inter-regular, system-ui, -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 16px; text-align: justify;\">There are following features of JavaScript:</p><ol class=\"points\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 0px; color: rgb(51, 51, 51); font-family: inter-regular, system-ui, -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 16px; text-align: justify;\"><li style=\"margin: 4px 0px 0px; padding: 0.2em; line-height: 25px; color: rgb(0, 0, 0);\">All popular web browsers support JavaScript as they provide built-in execution environments.</li><li style=\"margin: 4px 0px 0px; padding: 0.2em; line-height: 25px; color: rgb(0, 0, 0);\">JavaScript follows the syntax and structure of the C programming language. Thus, it is a structured programming language.</li><li style=\"margin: 4px 0px 0px; padding: 0.2em; line-height: 25px; color: rgb(0, 0, 0);\">JavaScript is a weakly typed language, where certain types are implicitly cast (depending on the operation).</li><li style=\"margin: 4px 0px 0px; padding: 0.2em; line-height: 25px; color: rgb(0, 0, 0);\">JavaScript is an object-oriented programming language that uses prototypes rather than using classes for inheritance.</li><li style=\"margin: 4px 0px 0px; padding: 0.2em; line-height: 25px; color: rgb(0, 0, 0);\">It is a light-weighted and interpreted language.</li><li style=\"margin: 4px 0px 0px; padding: 0.2em; line-height: 25px; color: rgb(0, 0, 0);\">It is a case-sensitive language.</li><li style=\"margin: 4px 0px 0px; padding: 0.2em; line-height: 25px; color: rgb(0, 0, 0);\">JavaScript is supportable in several operating systems including, Windows, macOS, etc.</li><li style=\"margin: 4px 0px 0px; padding: 0.2em; line-height: 25px; color: rgb(0, 0, 0);\">It provides good control to the users over the web browsers.</li></ol></h3><h2 class=\"h2\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; line-height: 1.3em; font-family: erdana, helvetica, arial, sans-serif; color: rgb(97, 11, 56); font-size: 25px; text-align: justify;\">History of JavaScript</h2><h3 class=\"title\" style=\"margin-right: 0px; margin-bottom: 12px; margin-left: 0px; padding: 0px; line-height: var(--tg-heading-line-height); color: var(--tg-heading-color); font-size: 24px; font-family: var(--tg-heading-font-family);\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: inter-regular, system-ui, -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 16px; text-align: justify;\">In 1993, <span style=\"margin: 0px; padding: 0px; font-family: inter-bold, system-ui, -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-weight: 700;\">Mosaic</span>, the first popular web browser, came into existence. In the <span style=\"margin: 0px; padding: 0px; font-family: inter-bold, system-ui, -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-weight: 700;\">year 1994</span>, <span style=\"margin: 0px; padding: 0px; font-family: inter-bold, system-ui, -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-weight: 700;\">Netscape</span> was founded by <span style=\"margin: 0px; padding: 0px; font-family: inter-bold, system-ui, -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-weight: 700;\">Marc Andreessen</span>. He realized that the web needed to become more dynamic. Thus, a \'glue language\' was believed to be provided to HTML to make web designing easy for designers and part-time programmers. Consequently, in 1995, the company recruited <span style=\"margin: 0px; padding: 0px; font-family: inter-bold, system-ui, -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-weight: 700;\">Brendan Eich</span> intending to implement and embed Scheme programming language to the browser. But, before Brendan could start, the company merged with <span style=\"margin: 0px; padding: 0px; font-family: inter-bold, system-ui, -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-weight: 700;\">Sun Microsystems</span> for adding Java into its Navigator so that it could compete with Microsoft over the web technologies and platforms. Now, two languages were there: Java and the scripting language. Further, Netscape decided to give a similar name to the scripting language as Java\'s. It led to \'Javascript\'. Finally, in May 1995, Marc Andreessen coined the first code of Javascript named \'<span style=\"margin: 0px; padding: 0px; font-family: inter-bold, system-ui, -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-weight: 700;\">Mocha</span>\'. Later, the marketing team replaced the name with \'<span style=\"margin: 0px; padding: 0px; font-family: inter-bold, system-ui, -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-weight: 700;\">LiveScript</span>\'. But, due to trademark reasons and certain other reasons, in December 1995, the language was finally renamed to \'JavaScript\'. From then, JavaScript came into existence.</p></h3><h2 class=\"h2\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; line-height: 1.3em; font-family: erdana, helvetica, arial, sans-serif; color: rgb(97, 11, 56); font-size: 25px; text-align: justify;\">Application of JavaScript</h2><h3 class=\"title\" style=\"margin-right: 0px; margin-bottom: 12px; margin-left: 0px; padding: 0px; line-height: var(--tg-heading-line-height); color: var(--tg-heading-color); font-size: 24px; font-family: var(--tg-heading-font-family);\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: inter-regular, system-ui, -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 16px; text-align: justify;\">JavaScript is used to create interactive websites. It is mainly used for:</p><ul class=\"points\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-type: circle; line-height: 24px; font-size: 16px; text-align: justify; font-family: inter-regular, system-ui, -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, \"Helvetica Neue\", Helvetica, Arial, sans-serif; color: rgb(51, 51, 51);\"><li style=\"margin: 4px 0px 0px; padding: 0.2em; line-height: 25px; color: rgb(0, 0, 0);\">Client-side validation,</li><li style=\"margin: 4px 0px 0px; padding: 0.2em; line-height: 25px; color: rgb(0, 0, 0);\">Dynamic drop-down menus,</li><li style=\"margin: 4px 0px 0px; padding: 0.2em; line-height: 25px; color: rgb(0, 0, 0);\">Displaying date and time,</li><li style=\"margin: 4px 0px 0px; padding: 0.2em; line-height: 25px; color: rgb(0, 0, 0);\">Displaying pop-up windows and dialog boxes (like an alert dialog box, confirm dialog box and prompt dialog box),</li><li style=\"margin: 4px 0px 0px; padding: 0.2em; line-height: 25px; color: rgb(0, 0, 0);\">Displaying clocks etc.</li></ul></h3>','JavaScript Basics aaa','https://www.youtube.com/embed/0SJE9dYdpps?si=Rs-LcgnakvaEjeHe','2024-06-14 11:00:00',2,'2024-06-14 00:00:00',1,'Working with Document Object Model (DOM) in JavaScript.',7,1),(7,'Introduction to basic JavaScript programming.','JavaScript','https://example.com/sql_intro','2024-06-14 10:00:00',1,'2024-06-14 10:00:00',1,'Introduction to SQL',NULL,1),(9,'Joins and relationships between tables.','JavaScript ES6','https://www.youtube.com/embed/orIXdOPFWeM?si=GbvIUfWjCdMsdvaP\n','2024-06-14 12:00:00',1,'2024-06-14 12:00:00',1,'Understanding SQL joins and their usage.',7,1),(10,'Grouping data and using aggregate functions.','Aggregate Functions','https://www.youtube.com/embed/CLbx37dqYEI?si=mde9anMMUSJqKJIW\n','2024-06-14 13:00:00',2,'2024-06-14 13:00:00',2,'How to use aggregate functions in SQL queries.',7,1),(11,'Basic introduction to Python programming language.','Python Basics','https://example.com/python_intro','2024-06-14 14:00:00',1,'2024-06-14 14:00:00',1,'Introduction to Python',NULL,1),(12,'Python data types and variables.','Python Variables','https://example.com/python_variables','2024-06-14 15:00:00',2,'2024-06-14 15:00:00',2,'Understanding Python variables and data types.',11,1),(13,'Control flow and decision-making in Python.','Python Control Flow','https://example.com/python_control_flow','2024-06-14 16:00:00',1,'2024-06-14 16:00:00',1,'How to use if statements and loops in Python.',11,1),(14,'Functions and modules in Python.','Python Functions','https://example.com/python_functions','2024-06-14 17:00:00',2,'2024-06-14 17:00:00',2,'Defining functions and using modules in Python.',11,1),(15,'Introduction to SQL covering basic queries and concepts.','JavaScript Basics','https://example.com/javascript_intro','2024-06-14 18:00:00',1,'2024-06-14 18:00:00',1,'Introduction to JavaScript',NULL,1),(16,'DOM manipulation and event handling.','JavaScript DOM','https://example.com/javascript_dom','2024-06-14 19:00:00',2,'2024-06-14 19:00:00',2,'Working with Document Object Model (DOM) in JavaScript.',15,1),(17,'AJAX and asynchronous JavaScript.','JavaScript AJAX','https://example.com/javascript_ajax','2024-06-14 20:00:00',1,'2024-06-14 20:00:00',1,'Using AJAX for asynchronous communication in JavaScript.',15,1),(36,'<p>scscsc</p>','Lesson demo','htppdcsdcs','2024-07-18 10:18:21',1,'2024-07-18 10:18:21',1,'ok des',NULL,1),(37,'<p>scscsc</p>','Lesson 1','scscsc','2024-07-18 10:24:31',1,'2024-07-18 00:00:00',1,'scscscsc',NULL,1),(40,'<p>ôko</p>','Lesson demo 1','htppdvdvdvdvdv','2024-07-18 11:39:11',1,'2024-07-18 11:39:11',1,'ok desumyumum',NULL,4);
/*!40000 ALTER TABLE `lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material` (
  `id` int NOT NULL AUTO_INCREMENT,
  `material_file` varchar(300) NOT NULL,
  `subject_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `material_subject_subject_id_fk` (`subject_id`),
  CONSTRAINT `material_subject_subject_id_fk` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (2,'files/blog-3.jpg',2);
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `post_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `content` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `thumbnail` varchar(300) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `setting_id` int DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `user_id_idx` (`created_by`),
  KEY `user_id_idx1` (`updated_by`),
  KEY `post_setting_idx` (`setting_id`),
  CONSTRAINT `post_setting` FOREIGN KEY (`setting_id`) REFERENCES `system_setting` (`setting_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_id2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (9,'Get Started With UI Design With Tips To Speed','<h3 class=\"title\" style=\"margin-bottom: 10px; font-weight: var(--tg-fw-semi-bold); line-height: var(--tg-heading-line-height); color: var(--tg-heading-color); font-size: 36px; font-family: var(--tg-heading-font-family);\"><span style=\"color: rgb(109, 108, 128); font-family: Inter, sans-serif; font-size: 16px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">Maximus ligula eleifend id nisl quis interdum. Sed malesuada tortor non turpis semper bibendum. Ut ac nisi porta, malesuada risus nonrra dolo areay Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae in tristique libero, quis ultrices diamraesent varius diam dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra.Maximus ligula eleifend.</span><br></h3><h4 class=\"title\" style=\"margin-bottom: 0px; font-weight: 600; line-height: var(--tg-heading-line-height); color: var(--tg-heading-color); font-size: 20px; font-family: var(--tg-heading-font-family);\"><p style=\"margin-bottom: 10px; font-family: Inter, sans-serif; font-size: 16px; line-height: var(--tg-body-line-height); font-weight: 400; color: rgb(109, 108, 128);\">Maximus ligula eleifend id nisl quis interdum. Sed malesuada tortor non turpis semper bibendum. Ut ac nisi porta, malesuada risus nonrra dolo areay Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae in tristique libero, quis ultrices diamraesent varius diam dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra.Maximus ligula eleifend.</p><blockquote style=\"margin: 40px 90px; background: rgb(239, 238, 254); padding: 35px 120px 35px 45px; position: relative; z-index: 1; color: rgb(109, 108, 128); font-family: Inter, sans-serif; font-size: 16px; font-weight: 400;\"><p style=\"margin-bottom: 0px; font-family: var(--tg-heading-font-family); font-size: 20px; line-height: var(--tg-body-line-height); color: var(--tg-common-color-dark); font-style: italic;\">“ urabitur varius eros rutrum consequat Mauris areathe sollicitudin enim condimentum luctus enim justo non molestie nisl ”</p></blockquote><p style=\"margin-bottom: 10px; font-family: Inter, sans-serif; font-size: 16px; line-height: var(--tg-body-line-height); font-weight: 400; color: rgb(109, 108, 128);\">Maximus ligula eleifend id nisl quis interdum. Sed malesuada tortor non turpis semper bibendum. Ut ac nisi porta, malesuada risus nonrra dolo areay Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae.</p></h4><h4 class=\"inner-title\" style=\"margin-bottom: 10px; font-weight: var(--tg-fw-semi-bold); line-height: var(--tg-heading-line-height); color: var(--tg-heading-color); font-size: 30px; font-family: var(--tg-heading-font-family); text-transform: unset;\">What Will I Learn From This Course?</h4><h4 class=\"title\" style=\"margin-bottom: 0px; font-weight: 600; line-height: var(--tg-heading-line-height); color: var(--tg-heading-color); font-size: 20px; font-family: var(--tg-heading-font-family);\"><div class=\"blog__details-content-inner\" style=\"margin: 30px 0px 25px; color: rgb(109, 108, 128); font-family: Inter, sans-serif; font-size: 16px; font-weight: 400;\"><p style=\"margin-bottom: 20px; font-family: var(--tg-body-font-family); font-size: var(--tg-body-font-size); line-height: var(--tg-body-line-height); font-weight: var(--tg-fw-regular); color: var(--tg-body-color);\">Maximus ligula eleifend id nisl quis interdum. Sed malesuada tortor non turpis semper bibendum. Ut ac nisi porta, malesuada risus non viverra dolor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere.</p><ul class=\"about__info-list list-wrap\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\"><li class=\"about__info-list-item\" style=\"display: flex; align-items: flex-start; gap: 13px; margin: 0px 0px 15px; list-style: none;\"><i class=\"flaticon-angle-right\" style=\"display: flex; line-height: 0; width: 30px; height: 30px; align-items: center; justify-content: center; flex: 0 0 30px; background: var(--tg-theme-secondary); border: 1px solid rgb(40, 37, 104); border-radius: 50%; box-shadow: rgba(0, 0, 0, 0.25) 4px 3px 0px 0px; transition: 0.3s ease-out; color: var(--tg-heading-color);\"></i><p class=\"content\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: var(--tg-heading-font-family); font-size: 18px; line-height: var(--tg-body-line-height); font-weight: var(--tg-fw-semi-bold); color: var(--tg-heading-color);\">Work with color &amp; Gradients &amp; Grids</p></li><li class=\"about__info-list-item\" style=\"display: flex; align-items: flex-start; gap: 13px; margin: 0px 0px 15px; list-style: none;\"><i class=\"flaticon-angle-right\" style=\"display: flex; line-height: 0; width: 30px; height: 30px; align-items: center; justify-content: center; flex: 0 0 30px; background: var(--tg-theme-secondary); border: 1px solid rgb(40, 37, 104); border-radius: 50%; box-shadow: rgba(0, 0, 0, 0.25) 4px 3px 0px 0px; transition: 0.3s ease-out; color: var(--tg-heading-color);\"></i><p class=\"content\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: var(--tg-heading-font-family); font-size: 18px; line-height: var(--tg-body-line-height); font-weight: var(--tg-fw-semi-bold); color: var(--tg-heading-color);\">All the useful shortcuts</p></li><li class=\"about__info-list-item\" style=\"display: flex; align-items: flex-start; gap: 13px; margin: 0px 0px 15px; list-style: none;\"><i class=\"flaticon-angle-right\" style=\"display: flex; line-height: 0; width: 30px; height: 30px; align-items: center; justify-content: center; flex: 0 0 30px; background: var(--tg-theme-secondary); border: 1px solid rgb(40, 37, 104); border-radius: 50%; box-shadow: rgba(0, 0, 0, 0.25) 4px 3px 0px 0px; transition: 0.3s ease-out; color: var(--tg-heading-color);\"></i><p class=\"content\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: var(--tg-heading-font-family); font-size: 18px; line-height: var(--tg-body-line-height); font-weight: var(--tg-fw-semi-bold); color: var(--tg-heading-color);\">Be able to create Flyers, Brochures, Advertisements</p></li><li class=\"about__info-list-item\" style=\"display: flex; align-items: flex-start; gap: 13px; margin: 0px; list-style: none;\"><i class=\"flaticon-angle-right\" style=\"display: flex; line-height: 0; width: 30px; height: 30px; align-items: center; justify-content: center; flex: 0 0 30px; background: var(--tg-theme-secondary); border: 1px solid rgb(40, 37, 104); border-radius: 50%; box-shadow: rgba(0, 0, 0, 0.25) 4px 3px 0px 0px; transition: 0.3s ease-out; color: var(--tg-heading-color);\"></i><p class=\"content\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: var(--tg-heading-font-family); font-size: 18px; line-height: var(--tg-body-line-height); font-weight: var(--tg-fw-semi-bold); color: var(--tg-heading-color);\">How to work with Images &amp; Text</p></li></ul></div><p style=\"margin-bottom: 10px; font-family: Inter, sans-serif; font-size: 16px; line-height: var(--tg-body-line-height); font-weight: 400; color: rgb(109, 108, 128);\">Maximus ligula eleifend id nisl quis interdum. Sed malesuada tortor non turpis semper bibendum. Ut ac nisi porta, malesuada risus nonrra dolo areay Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae in tristique libero, quis ultrices diamraesent varius diam dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra.Maximus ligula eleifend id nisl quis interdum. Sed malesuada tortor non turpis semper bibendum. Ut ac nisi porta, malesuada risus nonVestibulum ante ipsum primis</p></h4>','images/177f4d008a6e8498a078cd7b4004cf3abd34e7c66149b61bf2dbde1b84dbdf0b.jpg','2024-07-27 00:00:00',5,'2024-07-27 00:00:00',5,6),(10,'Music reduces stress,Lorem Ipsum is not','<div class=\"blog__details-content\" style=\"color: rgb(109, 108, 128); font-family: Inter, sans-serif; font-size: 16px;\"><h3 class=\"title\" style=\"margin-bottom: 10px; font-weight: var(--tg-fw-semi-bold); line-height: var(--tg-heading-line-height); color: var(--tg-heading-color); font-size: 36px; font-family: var(--tg-heading-font-family); text-transform: unset;\"><span style=\"font-size: 16px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">Maximus ligula eleifend id nisl quis interdum. Sed malesuada tortor non turpis semper bibendum. Ut ac nisi porta, malesuada risus nonrra dolo areay Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae in tristique libero, quis ultrices diamraesent varius diam dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra.Maximus ligula eleifend.</span><br></h3><h4 class=\"title\" style=\"margin-bottom: 0px; font-weight: 600; line-height: var(--tg-heading-line-height); color: var(--tg-heading-color); font-size: 20px; font-family: var(--tg-heading-font-family); text-transform: unset;\"><p style=\"margin-bottom: 10px; font-size: 16px; line-height: var(--tg-body-line-height); font-weight: 400;\">Maximus ligula eleifend id nisl quis interdum. Sed malesuada tortor non turpis semper bibendum. Ut ac nisi porta, malesuada risus nonrra dolo areay Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae in tristique libero, quis ultrices diamraesent varius diam dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra.Maximus ligula eleifend.</p><blockquote style=\"margin: 40px 90px; background: rgb(239, 238, 254); padding: 35px 120px 35px 45px; position: relative; z-index: 1; font-size: 16px; font-weight: 400;\"><p style=\"margin-bottom: 0px; font-family: var(--tg-heading-font-family); font-size: 20px; line-height: var(--tg-body-line-height); color: var(--tg-common-color-dark); font-style: italic;\">“ urabitur varius eros rutrum consequat Mauris areathe sollicitudin enim condimentum luctus enim justo non molestie nisl ”</p></blockquote><p style=\"margin-bottom: 10px; font-size: 16px; line-height: var(--tg-body-line-height); font-weight: 400;\">Maximus ligula eleifend id nisl quis interdum. Sed malesuada tortor non turpis semper bibendum. Ut ac nisi porta, malesuada risus nonrra dolo areay Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae.</p></h4><h4 class=\"inner-title\" style=\"margin-bottom: 10px; font-weight: var(--tg-fw-semi-bold); line-height: var(--tg-heading-line-height); color: var(--tg-heading-color); font-size: 30px; font-family: var(--tg-heading-font-family); text-transform: unset;\">What Will I Learn From This Course?</h4><h4 class=\"title\" style=\"margin-bottom: 0px; font-weight: 600; line-height: var(--tg-heading-line-height); color: var(--tg-heading-color); font-size: 20px; font-family: var(--tg-heading-font-family); text-transform: unset;\"><div class=\"blog__details-content-inner\" style=\"margin: 30px 0px 25px; font-size: 16px; font-weight: 400;\"><p style=\"margin-bottom: 20px; font-family: var(--tg-body-font-family); font-size: var(--tg-body-font-size); line-height: var(--tg-body-line-height); font-weight: var(--tg-fw-regular); color: var(--tg-body-color);\">Maximus ligula eleifend id nisl quis interdum. Sed malesuada tortor non turpis semper bibendum. Ut ac nisi porta, malesuada risus non viverra dolor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere.</p><ul class=\"about__info-list list-wrap\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\"><li class=\"about__info-list-item\" style=\"display: flex; align-items: flex-start; gap: 13px; margin: 0px 0px 15px; list-style: none;\"><i class=\"flaticon-angle-right\" style=\"display: flex; line-height: 0; width: 30px; height: 30px; align-items: center; justify-content: center; flex: 0 0 30px; background: var(--tg-theme-secondary); border: 1px solid rgb(40, 37, 104); border-radius: 50%; box-shadow: rgba(0, 0, 0, 0.25) 4px 3px 0px 0px; transition: 0.3s ease-out; color: var(--tg-heading-color);\"></i><p class=\"content\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: var(--tg-heading-font-family); font-size: 18px; line-height: var(--tg-body-line-height); font-weight: var(--tg-fw-semi-bold); color: var(--tg-heading-color);\">Work with color &amp; Gradients &amp; Grids</p></li><li class=\"about__info-list-item\" style=\"display: flex; align-items: flex-start; gap: 13px; margin: 0px 0px 15px; list-style: none;\"><i class=\"flaticon-angle-right\" style=\"display: flex; line-height: 0; width: 30px; height: 30px; align-items: center; justify-content: center; flex: 0 0 30px; background: var(--tg-theme-secondary); border: 1px solid rgb(40, 37, 104); border-radius: 50%; box-shadow: rgba(0, 0, 0, 0.25) 4px 3px 0px 0px; transition: 0.3s ease-out; color: var(--tg-heading-color);\"></i><p class=\"content\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: var(--tg-heading-font-family); font-size: 18px; line-height: var(--tg-body-line-height); font-weight: var(--tg-fw-semi-bold); color: var(--tg-heading-color);\">All the useful shortcuts</p></li><li class=\"about__info-list-item\" style=\"display: flex; align-items: flex-start; gap: 13px; margin: 0px 0px 15px; list-style: none;\"><i class=\"flaticon-angle-right\" style=\"display: flex; line-height: 0; width: 30px; height: 30px; align-items: center; justify-content: center; flex: 0 0 30px; background: var(--tg-theme-secondary); border: 1px solid rgb(40, 37, 104); border-radius: 50%; box-shadow: rgba(0, 0, 0, 0.25) 4px 3px 0px 0px; transition: 0.3s ease-out; color: var(--tg-heading-color);\"></i><p class=\"content\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: var(--tg-heading-font-family); font-size: 18px; line-height: var(--tg-body-line-height); font-weight: var(--tg-fw-semi-bold); color: var(--tg-heading-color);\">Be able to create Flyers, Brochures, Advertisements</p></li><li class=\"about__info-list-item\" style=\"display: flex; align-items: flex-start; gap: 13px; margin: 0px; list-style: none;\"><i class=\"flaticon-angle-right\" style=\"display: flex; line-height: 0; width: 30px; height: 30px; align-items: center; justify-content: center; flex: 0 0 30px; background: var(--tg-theme-secondary); border: 1px solid rgb(40, 37, 104); border-radius: 50%; box-shadow: rgba(0, 0, 0, 0.25) 4px 3px 0px 0px; transition: 0.3s ease-out; color: var(--tg-heading-color);\"></i><p class=\"content\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: var(--tg-heading-font-family); font-size: 18px; line-height: var(--tg-body-line-height); font-weight: var(--tg-fw-semi-bold); color: var(--tg-heading-color);\">How to work with Images &amp; Text</p></li></ul></div><p style=\"margin-bottom: 10px; font-size: 16px; line-height: var(--tg-body-line-height); font-weight: 400;\">Maximus ligula eleifend id nisl quis interdum. Sed malesuada tortor non turpis semper bibendum. Ut ac nisi porta, malesuada risus nonrra dolo areay Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae in tristique libero, quis ultrices diamraesent varius diam dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra.Maximus ligula eleifend id nisl quis interdum. Sed malesuada tortor non turpis semper bibendum. Ut ac nisi porta, malesuada risus nonVestibulum ante ipsum primis</p></h4></div><p style=\"margin-bottom: 15px; font-family: Inter, sans-serif; font-size: 16px; line-height: var(--tg-body-line-height); color: rgb(109, 108, 128);\">Maximus ligula eleifend id nisl quis interdum. Sed malesuada tortor non turpis semper bibendum. Ut ac nisi porta, malesuada risus nonrra dolo areay Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae in tristique libero, quis ultrices diamraesent varius diam dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra.Maximus ligula eleifend id nisl quis interdum. Sed malesuada tortor non turpis semper bibendum. Ut ac nisi porta, malesuada risus nonVestibulum ante ipsum primis</p>','images/aaa6581179d0b0728ef45e2afc373513864ef3cdf726bd98cd21ffcaf705b107.jpg','2024-07-27 03:00:33',5,'2024-07-27 03:00:33',5,6),(11,'Sports reduced risk of obesity, Lorem Ipsum is not','<div class=\"blog__details-content\" style=\"color: rgb(109, 108, 128); font-family: Inter, sans-serif; font-size: 16px;\"><h3 class=\"title\" style=\"margin-bottom: 10px; font-weight: var(--tg-fw-semi-bold); line-height: var(--tg-heading-line-height); color: var(--tg-heading-color); font-size: 36px; font-family: var(--tg-heading-font-family); text-transform: unset;\"><span style=\"font-size: 16px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">Maximus ligula eleifend id nisl quis interdum. Sed malesuada tortor non turpis semper bibendum. Ut ac nisi porta, malesuada risus nonrra dolo areay Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae in tristique libero, quis ultrices diamraesent varius diam dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra.Maximus ligula eleifend.</span><br></h3><h4 class=\"title\" style=\"margin-bottom: 0px; font-weight: 600; line-height: var(--tg-heading-line-height); color: var(--tg-heading-color); font-size: 20px; font-family: var(--tg-heading-font-family); text-transform: unset;\"><p style=\"margin-bottom: 10px; font-size: 16px; line-height: var(--tg-body-line-height); font-weight: 400;\">Maximus ligula eleifend id nisl quis interdum. Sed malesuada tortor non turpis semper bibendum. Ut ac nisi porta, malesuada risus nonrra dolo areay Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae in tristique libero, quis ultrices diamraesent varius diam dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra.Maximus ligula eleifend.</p><blockquote style=\"margin: 40px 90px; background: rgb(239, 238, 254); padding: 35px 120px 35px 45px; position: relative; z-index: 1; font-size: 16px; font-weight: 400;\"><p style=\"margin-bottom: 0px; font-family: var(--tg-heading-font-family); font-size: 20px; line-height: var(--tg-body-line-height); color: var(--tg-common-color-dark); font-style: italic;\">“ urabitur varius eros rutrum consequat Mauris areathe sollicitudin enim condimentum luctus enim justo non molestie nisl ”</p></blockquote><p style=\"margin-bottom: 10px; font-size: 16px; line-height: var(--tg-body-line-height); font-weight: 400;\">Maximus ligula eleifend id nisl quis interdum. Sed malesuada tortor non turpis semper bibendum. Ut ac nisi porta, malesuada risus nonrra dolo areay Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae.</p></h4><h4 class=\"inner-title\" style=\"margin-bottom: 10px; font-weight: var(--tg-fw-semi-bold); line-height: var(--tg-heading-line-height); color: var(--tg-heading-color); font-size: 30px; font-family: var(--tg-heading-font-family); text-transform: unset;\">What Will I Learn From This Course?</h4><h4 class=\"title\" style=\"margin-bottom: 0px; font-weight: 600; line-height: var(--tg-heading-line-height); color: var(--tg-heading-color); font-size: 20px; font-family: var(--tg-heading-font-family); text-transform: unset;\"><div class=\"blog__details-content-inner\" style=\"margin: 30px 0px 25px; font-size: 16px; font-weight: 400;\"><p style=\"margin-bottom: 20px; font-family: var(--tg-body-font-family); font-size: var(--tg-body-font-size); line-height: var(--tg-body-line-height); font-weight: var(--tg-fw-regular); color: var(--tg-body-color);\">Maximus ligula eleifend id nisl quis interdum. Sed malesuada tortor non turpis semper bibendum. Ut ac nisi porta, malesuada risus non viverra dolor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere.</p><ul class=\"about__info-list list-wrap\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\"><li class=\"about__info-list-item\" style=\"display: flex; align-items: flex-start; gap: 13px; margin: 0px 0px 15px; list-style: none;\"><i class=\"flaticon-angle-right\" style=\"display: flex; line-height: 0; width: 30px; height: 30px; align-items: center; justify-content: center; flex: 0 0 30px; background: var(--tg-theme-secondary); border: 1px solid rgb(40, 37, 104); border-radius: 50%; box-shadow: rgba(0, 0, 0, 0.25) 4px 3px 0px 0px; transition: 0.3s ease-out; color: var(--tg-heading-color);\"></i><p class=\"content\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: var(--tg-heading-font-family); font-size: 18px; line-height: var(--tg-body-line-height); font-weight: var(--tg-fw-semi-bold); color: var(--tg-heading-color);\">Work with color &amp; Gradients &amp; Grids</p></li><li class=\"about__info-list-item\" style=\"display: flex; align-items: flex-start; gap: 13px; margin: 0px 0px 15px; list-style: none;\"><i class=\"flaticon-angle-right\" style=\"display: flex; line-height: 0; width: 30px; height: 30px; align-items: center; justify-content: center; flex: 0 0 30px; background: var(--tg-theme-secondary); border: 1px solid rgb(40, 37, 104); border-radius: 50%; box-shadow: rgba(0, 0, 0, 0.25) 4px 3px 0px 0px; transition: 0.3s ease-out; color: var(--tg-heading-color);\"></i><p class=\"content\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: var(--tg-heading-font-family); font-size: 18px; line-height: var(--tg-body-line-height); font-weight: var(--tg-fw-semi-bold); color: var(--tg-heading-color);\">All the useful shortcuts</p></li><li class=\"about__info-list-item\" style=\"display: flex; align-items: flex-start; gap: 13px; margin: 0px 0px 15px; list-style: none;\"><i class=\"flaticon-angle-right\" style=\"display: flex; line-height: 0; width: 30px; height: 30px; align-items: center; justify-content: center; flex: 0 0 30px; background: var(--tg-theme-secondary); border: 1px solid rgb(40, 37, 104); border-radius: 50%; box-shadow: rgba(0, 0, 0, 0.25) 4px 3px 0px 0px; transition: 0.3s ease-out; color: var(--tg-heading-color);\"></i><p class=\"content\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: var(--tg-heading-font-family); font-size: 18px; line-height: var(--tg-body-line-height); font-weight: var(--tg-fw-semi-bold); color: var(--tg-heading-color);\">Be able to create Flyers, Brochures, Advertisements</p></li><li class=\"about__info-list-item\" style=\"display: flex; align-items: flex-start; gap: 13px; margin: 0px; list-style: none;\"><i class=\"flaticon-angle-right\" style=\"display: flex; line-height: 0; width: 30px; height: 30px; align-items: center; justify-content: center; flex: 0 0 30px; background: var(--tg-theme-secondary); border: 1px solid rgb(40, 37, 104); border-radius: 50%; box-shadow: rgba(0, 0, 0, 0.25) 4px 3px 0px 0px; transition: 0.3s ease-out; color: var(--tg-heading-color);\"></i><p class=\"content\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: var(--tg-heading-font-family); font-size: 18px; line-height: var(--tg-body-line-height); font-weight: var(--tg-fw-semi-bold); color: var(--tg-heading-color);\">How to work with Images &amp; Text</p></li></ul></div><p style=\"margin-bottom: 10px; font-size: 16px; line-height: var(--tg-body-line-height); font-weight: 400;\">Maximus ligula eleifend id nisl quis interdum. Sed malesuada tortor non turpis semper bibendum. Ut ac nisi porta, malesuada risus nonrra dolo areay Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae in tristique libero, quis ultrices diamraesent varius diam dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra.Maximus ligula eleifend id nisl quis interdum. Sed malesuada tortor non turpis semper bibendum. Ut ac nisi porta, malesuada risus nonVestibulum ante ipsum primis</p></h4></div><p style=\"margin-bottom: 15px; font-family: Inter, sans-serif; font-size: 16px; line-height: var(--tg-body-line-height); color: rgb(109, 108, 128);\">Maximus ligula eleifend id nisl quis interdum. Sed malesuada tortor non turpis semper bibendum. Ut ac nisi porta, malesuada risus nonrra dolo areay Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae in tristique libero, quis ultrices diamraesent varius diam dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra.Maximus ligula eleifend id nisl quis interdum. Sed malesuada tortor non turpis semper bibendum. Ut ac nisi porta, malesuada risus nonVestibulum ante ipsum primis</p>','images/7d9be95174732bf6f85506b4762e97b3258992f4c019d2e9aef8b755bd142455.jpg','2024-07-27 03:00:54',5,'2024-07-27 03:00:54',5,10),(12,'Yoga can ease arthritis symptoms','<div class=\"blog__details-content\" style=\"color: rgb(109, 108, 128); font-family: Inter, sans-serif; font-size: 16px;\"><h3 class=\"title\" style=\"margin-bottom: 10px; font-weight: var(--tg-fw-semi-bold); line-height: var(--tg-heading-line-height); color: var(--tg-heading-color); font-size: 36px; font-family: var(--tg-heading-font-family); text-transform: unset;\"><span style=\"font-size: 16px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">Maximus ligula eleifend id nisl quis interdum. Sed malesuada tortor non turpis semper bibendum. Ut ac nisi porta, malesuada risus nonrra dolo areay Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae in tristique libero, quis ultrices diamraesent varius diam dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra.Maximus ligula eleifend.</span><br></h3><h4 class=\"title\" style=\"margin-bottom: 0px; font-weight: 600; line-height: var(--tg-heading-line-height); color: var(--tg-heading-color); font-size: 20px; font-family: var(--tg-heading-font-family); text-transform: unset;\"><p style=\"margin-bottom: 10px; font-size: 16px; line-height: var(--tg-body-line-height); font-weight: 400;\">Maximus ligula eleifend id nisl quis interdum. Sed malesuada tortor non turpis semper bibendum. Ut ac nisi porta, malesuada risus nonrra dolo areay Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae in tristique libero, quis ultrices diamraesent varius diam dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra.Maximus ligula eleifend.</p><blockquote style=\"margin: 40px 90px; background: rgb(239, 238, 254); padding: 35px 120px 35px 45px; position: relative; z-index: 1; font-size: 16px; font-weight: 400;\"><p style=\"margin-bottom: 0px; font-family: var(--tg-heading-font-family); font-size: 20px; line-height: var(--tg-body-line-height); color: var(--tg-common-color-dark); font-style: italic;\">“ urabitur varius eros rutrum consequat Mauris areathe sollicitudin enim condimentum luctus enim justo non molestie nisl ”</p></blockquote><p style=\"margin-bottom: 10px; font-size: 16px; line-height: var(--tg-body-line-height); font-weight: 400;\">Maximus ligula eleifend id nisl quis interdum. Sed malesuada tortor non turpis semper bibendum. Ut ac nisi porta, malesuada risus nonrra dolo areay Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae.</p></h4><h4 class=\"inner-title\" style=\"margin-bottom: 10px; font-weight: var(--tg-fw-semi-bold); line-height: var(--tg-heading-line-height); color: var(--tg-heading-color); font-size: 30px; font-family: var(--tg-heading-font-family); text-transform: unset;\">What Will I Learn From This Course?</h4><h4 class=\"title\" style=\"margin-bottom: 0px; font-weight: 600; line-height: var(--tg-heading-line-height); color: var(--tg-heading-color); font-size: 20px; font-family: var(--tg-heading-font-family); text-transform: unset;\"><div class=\"blog__details-content-inner\" style=\"margin: 30px 0px 25px; font-size: 16px; font-weight: 400;\"><p style=\"margin-bottom: 20px; font-family: var(--tg-body-font-family); font-size: var(--tg-body-font-size); line-height: var(--tg-body-line-height); font-weight: var(--tg-fw-regular); color: var(--tg-body-color);\">Maximus ligula eleifend id nisl quis interdum. Sed malesuada tortor non turpis semper bibendum. Ut ac nisi porta, malesuada risus non viverra dolor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere.</p><ul class=\"about__info-list list-wrap\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\"><li class=\"about__info-list-item\" style=\"display: flex; align-items: flex-start; gap: 13px; margin: 0px 0px 15px; list-style: none;\"><i class=\"flaticon-angle-right\" style=\"display: flex; line-height: 0; width: 30px; height: 30px; align-items: center; justify-content: center; flex: 0 0 30px; background: var(--tg-theme-secondary); border: 1px solid rgb(40, 37, 104); border-radius: 50%; box-shadow: rgba(0, 0, 0, 0.25) 4px 3px 0px 0px; transition: 0.3s ease-out; color: var(--tg-heading-color);\"></i><p class=\"content\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: var(--tg-heading-font-family); font-size: 18px; line-height: var(--tg-body-line-height); font-weight: var(--tg-fw-semi-bold); color: var(--tg-heading-color);\">Work with color &amp; Gradients &amp; Grids</p></li><li class=\"about__info-list-item\" style=\"display: flex; align-items: flex-start; gap: 13px; margin: 0px 0px 15px; list-style: none;\"><i class=\"flaticon-angle-right\" style=\"display: flex; line-height: 0; width: 30px; height: 30px; align-items: center; justify-content: center; flex: 0 0 30px; background: var(--tg-theme-secondary); border: 1px solid rgb(40, 37, 104); border-radius: 50%; box-shadow: rgba(0, 0, 0, 0.25) 4px 3px 0px 0px; transition: 0.3s ease-out; color: var(--tg-heading-color);\"></i><p class=\"content\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: var(--tg-heading-font-family); font-size: 18px; line-height: var(--tg-body-line-height); font-weight: var(--tg-fw-semi-bold); color: var(--tg-heading-color);\">All the useful shortcuts</p></li><li class=\"about__info-list-item\" style=\"display: flex; align-items: flex-start; gap: 13px; margin: 0px 0px 15px; list-style: none;\"><i class=\"flaticon-angle-right\" style=\"display: flex; line-height: 0; width: 30px; height: 30px; align-items: center; justify-content: center; flex: 0 0 30px; background: var(--tg-theme-secondary); border: 1px solid rgb(40, 37, 104); border-radius: 50%; box-shadow: rgba(0, 0, 0, 0.25) 4px 3px 0px 0px; transition: 0.3s ease-out; color: var(--tg-heading-color);\"></i><p class=\"content\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: var(--tg-heading-font-family); font-size: 18px; line-height: var(--tg-body-line-height); font-weight: var(--tg-fw-semi-bold); color: var(--tg-heading-color);\">Be able to create Flyers, Brochures, Advertisements</p></li><li class=\"about__info-list-item\" style=\"display: flex; align-items: flex-start; gap: 13px; margin: 0px; list-style: none;\"><i class=\"flaticon-angle-right\" style=\"display: flex; line-height: 0; width: 30px; height: 30px; align-items: center; justify-content: center; flex: 0 0 30px; background: var(--tg-theme-secondary); border: 1px solid rgb(40, 37, 104); border-radius: 50%; box-shadow: rgba(0, 0, 0, 0.25) 4px 3px 0px 0px; transition: 0.3s ease-out; color: var(--tg-heading-color);\"></i><p class=\"content\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: var(--tg-heading-font-family); font-size: 18px; line-height: var(--tg-body-line-height); font-weight: var(--tg-fw-semi-bold); color: var(--tg-heading-color);\">How to work with Images &amp; Text</p></li></ul></div><p style=\"margin-bottom: 10px; font-size: 16px; line-height: var(--tg-body-line-height); font-weight: 400;\">Maximus ligula eleifend id nisl quis interdum. Sed malesuada tortor non turpis semper bibendum. Ut ac nisi porta, malesuada risus nonrra dolo areay Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae in tristique libero, quis ultrices diamraesent varius diam dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra.Maximus ligula eleifend id nisl quis interdum. Sed malesuada tortor non turpis semper bibendum. Ut ac nisi porta, malesuada risus nonVestibulum ante ipsum primis</p></h4></div><p style=\"margin-bottom: 15px; font-family: Inter, sans-serif; font-size: 16px; line-height: var(--tg-body-line-height); color: rgb(109, 108, 128);\">Maximus ligula eleifend id nisl quis interdum. Sed malesuada tortor non turpis semper bibendum. Ut ac nisi porta, malesuada risus nonrra dolo areay Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae in tristique libero, quis ultrices diamraesent varius diam dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra.Maximus ligula eleifend id nisl quis interdum. Sed malesuada tortor non turpis semper bibendum. Ut ac nisi porta, malesuada risus nonVestibulum ante ipsum primis</p>','images/323ebed47c0586832cf99323695d109d3da7fc486f907f860023f4fb5c4a9459.jpg','2024-07-27 03:01:12',5,'2024-07-27 03:01:12',5,10);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_comment`
--

DROP TABLE IF EXISTS `post_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_comment` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `user_id` int NOT NULL,
  `comment` longtext,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `user_id_idx` (`user_id`),
  KEY `post_comment_post_post_id_fk` (`post_id`),
  CONSTRAINT `comment_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `post_comment_post_post_id_fk` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_comment`
--

LOCK TABLES `post_comment` WRITE;
/*!40000 ALTER TABLE `post_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `question_id` int NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `option_a` text NOT NULL,
  `option_b` text NOT NULL,
  `option_c` text NOT NULL,
  `option_d` text NOT NULL,
  `correct_option` char(1) NOT NULL,
  `lesson_id` int DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  KEY `question_lesson_lesson_id_fk` (`lesson_id`),
  CONSTRAINT `question_lesson_lesson_id_fk` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`lesson_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (7,'Hello','Xin chao','Tam biet','May man','Tuyet voi','A',1),(8,'Goodbye','Xin chao','Tam biet','May man','Tuyet voi','B',1);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_set`
--

DROP TABLE IF EXISTS `study_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `study_set` (
  `set_id` int NOT NULL AUTO_INCREMENT,
  `set_name` varchar(45) DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`set_id`),
  KEY `subject_id_idx` (`subject_id`),
  KEY `set_user_id` (`user_id`),
  CONSTRAINT `set_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`),
  CONSTRAINT `set_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_set`
--

LOCK TABLES `study_set` WRITE;
/*!40000 ALTER TABLE `study_set` DISABLE KEYS */;
INSERT INTO `study_set` VALUES (1,'SWP',1,1);
/*!40000 ALTER TABLE `study_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `subject_id` int NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(100) NOT NULL,
  `description` longtext,
  `thumbail` varchar(300) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `setting_id` int DEFAULT NULL,
  PRIMARY KEY (`subject_id`),
  KEY `subject_updater_idx` (`updated_by`),
  KEY `subject__idx` (`created_by`,`updated_by`),
  KEY `subject_setting_idx` (`setting_id`),
  CONSTRAINT `subject_creater` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`),
  CONSTRAINT `subject_setting` FOREIGN KEY (`setting_id`) REFERENCES `system_setting` (`setting_id`),
  CONSTRAINT `subject_updater` FOREIGN KEY (`updated_by`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'Learning JavaScript With Imagination','<h3 class=\"title\" style=\"margin-right: 0px; margin-bottom: 12px; margin-left: 0px; line-height: var(--tg-heading-line-height); color: var(--tg-heading-color); font-size: 24px; font-family: var(--tg-heading-font-family); padding: 0px;\"><span style=\"font-weight: bolder;\">Course Description</span></h3><h3><font color=\"#6d6c80\" face=\"Inter, sans-serif\"><span style=\"font-size: 16px;\">This course introduces you to the fundamental concepts of JavaScript, a powerful programming language used to create interactive and dynamic web applications. From understanding the basics to exploring advanced features, this course covers everything you need to become proficient in JavaSkjhihjhjjjjjjjjjjjjjjjjcript. Whether you\'re a beginner looking to start your programming journey or an experienced developer seeking to enhance your skills, this course has something for you.</span></font></h3><h3><font color=\"#6d6c80\" face=\"Inter, sans-serif\"><span style=\"font-size: 16px;\"><br></span></font><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; font-family: Inter, sans-serif; font-size: 16px; line-height: var(--tg-body-line-height); color: rgb(109, 108, 128);\"><span style=\"font-weight: bolder;\"><span style=\"color: var(--tg-heading-color); font-family: var(--tg-heading-font-family); font-size: 24px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">What you\'ll learn in this course?</span><br></span></p></h3><h3><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; line-height: var(--tg-body-line-height);\"><font color=\"#6d6c80\" face=\"Inter, sans-serif\"><span style=\"font-size: 16px;\">This course is designed to provide a comprehensive understanding of JavaScript and its applications. By the end of this course, you will be able to build interactive web applications and have a solid foundation to continue learning more advanced topics in web development.</span></font><br></p><ul class=\"about__info-list list-wrap\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(109, 108, 128); font-family: Inter, sans-serif; font-size: 16px;\"><li class=\"about__info-list-item\" style=\"margin: 0px 0px 15px; padding: 0px; display: flex; align-items: flex-start; gap: 13px; list-style: none;\"><p class=\"content\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-family: var(--tg-heading-font-family); font-size: 18px; line-height: var(--tg-body-line-height); color: var(--tg-heading-color);\">Such as:</p></li><li class=\"about__info-list-item\" style=\"margin: 0px 0px 15px; padding: 0px; display: flex; align-items: flex-start; gap: 13px; list-style: none;\"><i class=\"flaticon-angle-right\" style=\"margin: 0px; padding: 0px; display: flex; line-height: 0; width: 30px; height: 30px; align-items: center; justify-content: center; flex: 0 0 30px; background: var(--tg-theme-secondary); border: 1px solid rgb(40, 37, 104); border-radius: 50%; box-shadow: rgba(0, 0, 0, 0.25) 4px 3px 0px 0px; transition: all 0.3s ease-out 0s; color: var(--tg-heading-color);\"></i><p class=\"content\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-family: var(--tg-heading-font-family); font-size: 18px; line-height: var(--tg-body-line-height); color: var(--tg-heading-color);\">All the useful shortcuts</p></li><li class=\"about__info-list-item\" style=\"margin: 0px 0px 15px; padding: 0px; display: flex; align-items: flex-start; gap: 13px; list-style: none;\"><i class=\"flaticon-angle-right\" style=\"margin: 0px; padding: 0px; display: flex; line-height: 0; width: 30px; height: 30px; align-items: center; justify-content: center; flex: 0 0 30px; background: var(--tg-theme-secondary); border: 1px solid rgb(40, 37, 104); border-radius: 50%; box-shadow: rgba(0, 0, 0, 0.25) 4px 3px 0px 0px; transition: all 0.3s ease-out 0s; color: var(--tg-heading-color);\"></i><p class=\"content\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-family: var(--tg-heading-font-family); font-size: 18px; line-height: var(--tg-body-line-height); color: var(--tg-heading-color);\">Be able to create Flyers, Brochures, Advertisements</p></li><li class=\"about__info-list-item\" style=\"margin: 0px; padding: 0px; display: flex; align-items: flex-start; gap: 13px; list-style: none;\"><i class=\"flaticon-angle-right\" style=\"margin: 0px; padding: 0px; display: flex; line-height: 0; width: 30px; height: 30px; align-items: center; justify-content: center; flex: 0 0 30px; background: var(--tg-theme-secondary); border: 1px solid rgb(40, 37, 104); border-radius: 50%; box-shadow: rgba(0, 0, 0, 0.25) 4px 3px 0px 0px; transition: all 0.3s ease-out 0s; color: var(--tg-heading-color);\"></i><p class=\"content\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-family: var(--tg-heading-font-family); font-size: 18px; line-height: var(--tg-body-line-height); color: var(--tg-heading-color);\">How to work with Images & Text</p></li></ul><p class=\"last-info\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-family: Inter, sans-serif; font-size: 16px; line-height: var(--tg-body-line-height); color: rgb(109, 108, 128);\"><br></p></h3>','course_thumb01.jpg','2024-06-02 10:54:22',1,'2024-06-02 10:54:28',1,4.8,9),(2,'The Complete Graphic Design for Beginners','Start your journey in graphic design with this comprehensive course. Learn the basics of design, color theory, typography, and the essential tools needed to create stunning visuals.\n','course_thumb02.jpg','2024-06-02 10:57:07',1,'2024-06-02 10:57:08',1,2,6),(3,'Learning Digital Marketing on Facebook','Master Facebook marketing strategies to grow your business. This course covers everything from creating effective ads to analyzing performance metrics and optimizing your campaigns.\n','course_thumb03.jpg','2024-06-02 10:57:58',1,'2024-06-02 10:58:02',1,1.3,10),(4,'Financial Analyst Training & Investing Course','Become a proficient financial analyst with this in-depth course. Learn how to evaluate financial statements, perform valuations, and make informed investment decisions.\n','course_thumb04.jpg','2024-06-02 10:59:03',1,'2024-06-02 10:59:07',1,3.8,10),(5,'Data Analysis & Visualization Masterclass','Learn to analyze and visualize data like a pro. This course covers essential tools and techniques for data manipulation, statistical analysis, and creating compelling data visualizations.\n','course_thumb05.jpg','2024-06-02 10:59:41',1,'2024-06-02 10:59:44',1,4.5,11),(6,'Master the Fundamentals of Math','Strengthen your math skills with this foundational course. Covering essential topics from arithmetic to algebra, this course is perfect for students and professionals alike.\n','course_thumb06.jpg','2024-06-02 11:00:27',1,'2024-06-02 11:00:30',1,4.7,7),(7,'How To Build A Localized Website With Hugo And Strapi','Learn to create a multilingual website using Hugo and Strapi. This course guides you through setting up, configuring, and deploying a localized site to reach a global audience.\n','course_thumb07.jpg','2024-06-02 11:01:23',1,'2024-06-02 11:01:26',1,1.8,11),(43,'CSharp','<p>okokok</p>','id_CSharp_1721277449682.jpg','2024-07-18 11:37:29',1,'2024-07-18 11:37:29',1,4.5,9);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_manager`
--

DROP TABLE IF EXISTS `subject_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_manager` (
  `user_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`subject_id`),
  KEY `subject_id_idx` (`subject_id`),
  CONSTRAINT `subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`),
  CONSTRAINT `subject_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_manager`
--

LOCK TABLES `subject_manager` WRITE;
/*!40000 ALTER TABLE `subject_manager` DISABLE KEYS */;
INSERT INTO `subject_manager` VALUES (1,43,'public'),(3,1,'public'),(3,3,'public'),(3,4,'public'),(3,5,'public'),(3,6,'public'),(3,7,'public'),(4,2,'public');
/*!40000 ALTER TABLE `subject_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_setting`
--

DROP TABLE IF EXISTS `system_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_setting` (
  `setting_id` int NOT NULL AUTO_INCREMENT,
  `setting_type` varchar(10) DEFAULT NULL,
  `setting_name` varchar(100) DEFAULT NULL,
  `setting_value` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`setting_id`),
  KEY `system_setting_user_user_id_fk` (`created_by`),
  KEY `system_setting_user_user_id_fk_2` (`updated_by`),
  CONSTRAINT `system_setting_user_user_id_fk` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`),
  CONSTRAINT `system_setting_user_user_id_fk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_setting`
--

LOCK TABLES `system_setting` WRITE;
/*!40000 ALTER TABLE `system_setting` DISABLE KEYS */;
INSERT INTO `system_setting` VALUES (1,'user','user_role','admin','2024-06-08 05:41:58',NULL,NULL,NULL),(2,'user','user_role','manager',NULL,'2024-06-08 05:42:00',NULL,NULL),(3,'user','user_role','teacher','2024-06-08 05:42:02',NULL,NULL,NULL),(4,'user','user_role','student',NULL,NULL,NULL,NULL),(5,'subject','subject_category','Marketing',NULL,NULL,NULL,NULL),(6,'subject','subject_category','Design',NULL,NULL,NULL,NULL),(7,'subject','subject_category','Mathematic',NULL,NULL,NULL,NULL),(8,'subject','subject_category','DataScience',NULL,NULL,NULL,NULL),(9,'subject','subject_category','Language',NULL,NULL,NULL,NULL),(10,'subject','subject_category','Business','2024-06-08 05:42:02',NULL,NULL,NULL),(11,'subject','subject_category','Development',NULL,NULL,NULL,NULL),(12,'contact','Contact Admin','esteemws203@gmail.com',NULL,NULL,NULL,NULL),(13,'contact','Issue Class','esteemws203@gmail.com',NULL,NULL,NULL,NULL),(14,'contact','Issue Subject','esteemws203@gmail.com',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `system_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term`
--

DROP TABLE IF EXISTS `term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `term` (
  `term_id` int NOT NULL AUTO_INCREMENT,
  `term` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `definition` tinytext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `study_set_id` int DEFAULT NULL,
  PRIMARY KEY (`term_id`),
  KEY `term_study_set_idx` (`study_set_id`),
  CONSTRAINT `term_study_set` FOREIGN KEY (`study_set_id`) REFERENCES `study_set` (`set_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term`
--

LOCK TABLES `term` WRITE;
/*!40000 ALTER TABLE `term` DISABLE KEYS */;
INSERT INTO `term` VALUES (1,'Hello','Xin chao',1),(3,'Bye','Tam biet',1);
/*!40000 ALTER TABLE `term` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(300) NOT NULL,
  `fullname` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `isVerified_email` tinyint DEFAULT NULL,
  `setting_id` int DEFAULT '2',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `system_setting_idx` (`setting_id`),
  CONSTRAINT `system_setting` FOREIGN KEY (`setting_id`) REFERENCES `system_setting` (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','$2a$12$cUYz1sC8VSWCwsCq3WL5r.4ydv53mwEHz1Ca2o8sz601r/pzSl8YS','Administrator','M','2024-05-31 00:44:17','esteemws203@gmail.com','0362815301','2024-05-31 00:44:38','2024-07-17 17:09:31','id-1-1721210971709.png',1,1,1),(2,'user_default','$2a$12$ueKpjYjeZ8sMYZXjpopcq.Q/AeQ7l/TO52j4kmQWaW/Zkss36EL.6','Guess','M','2024-05-16 17:15:55',NULL,NULL,'2024-06-17 05:55:49','2024-07-28 05:55:33','id-5-1721989771047.jpg',1,1,4),(3,'manager123','$2a$12$cUYz1sC8VSWCwsCq3WL5r.4ydv53mwEHz1Ca2o8sz601r/pzSl8YS','Tiến Nguyễn','M','2024-06-02 13:02:09','esteemwilson2k3@gmail.com',NULL,'2024-05-17 17:23:39','2024-07-28 05:55:34','id-5-1721989771047.jpg',1,1,2),(4,'student123','$2a$12$cUYz1sC8VSWCwsCq3WL5r.4ydv53mwEHz1Ca2o8sz601r/pzSl8YS','Vũ Văn Trọng','F','2024-07-16 17:15:57','',NULL,'2024-02-02 21:48:03','2024-06-03 08:16:42','id-5-1721989771047.jpg',1,1,4),(5,'teacher123','$2a$12$BE7IAwBCidqdx44/EsXVA.skgFOpoLbT16ilOjddZ59pNH8qdA2.i','Nguyễn Ngọc Tiến','M','2024-06-26 23:16:02','trongwilson2k3@gmail.com','0365299680','2024-01-03 08:10:31','2024-07-26 17:56:53','id-5-1721989771047.jpg',1,1,3);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-28 12:40:31
