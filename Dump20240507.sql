-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: agile
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
-- Table structure for table `chatbots`
--

DROP TABLE IF EXISTS `chatbots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chatbots` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bot_name` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `project_id` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `fk_project_id` (`project_id`),
  CONSTRAINT `chatbots_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `chatbots_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `fk_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatbots`
--

LOCK TABLES `chatbots` WRITE;
/*!40000 ALTER TABLE `chatbots` DISABLE KEYS */;
INSERT INTO `chatbots` VALUES (1,'vehicle_bot','open',1,1,4),(2,'mobile_bot','open',5,2,2),(3,'leave_bot','open',6,3,4),(4,'crowd_bot','open',7,4,2);
/*!40000 ALTER TABLE `chatbots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(20) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `projects_id` int DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `projects_id` (`projects_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`projects_id`) REFERENCES `projects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'fardeen','engineer',23,1),(2,'arjun','leader',22,6),(3,'darshan','tester',24,7),(4,'sreeram','engineer',23,1);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_name` varchar(20) DEFAULT NULL,
  `project_id` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `posts_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'vehicle',1,2,3),(2,'mobile',5,4,1),(3,'crowd',7,2,1),(4,'leave details',1,3,4);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_name` varchar(20) DEFAULT NULL,
  `description` varchar(70) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `owner_manager` varchar(20) DEFAULT NULL,
  `client` varchar(20) DEFAULT NULL,
  `updated_by` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'vechicle','vehicle charging','2024-05-02','2024-06-02','ongoing','John','Tom','1'),(5,'mobile manager','mobile data','2024-05-02','2025-08-02','ongoing','Williams','Mike','2'),(6,'employee leave','veryfing employee leave data','2024-05-02','2024-11-02','ongoing','West','Kanye','3'),(7,'crowd maangement','managing crowd data','2024-05-02','2026-01-29','ongoing','Asap','Rocky','4');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reply` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reply` varchar(100) DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `post_id` int DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_id` (`employee_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `reply_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (3,'great',1,1,'2024-05-02'),(4,'ok',2,3,'2024-05-02'),(5,'done',2,1,'2024-05-02'),(6,'yes',4,2,'2024-05-02');
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-07 15:15:57
