CREATE DATABASE  IF NOT EXISTS `onlinecouredetaildb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `onlinecouredetaildb`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: onlinecouredetaildb
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` text,
  `instructor_id` int NOT NULL,
  `duration` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `instructor_id` (`instructor_id`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`instructor_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'SQL Basics','Intro to SQL',21,20,'2026-01-10','2026-01-20'),(2,'Advanced SQL','Joins and Subqueries',21,30,'2026-02-01','2026-02-20'),(3,'DBMS Fundamentals','Database basics',22,25,'2026-01-15','2026-02-10'),(4,'DBMS Advanced','Indexes and Optimization',22,35,'2026-02-15','2026-03-20'),(5,'Python Basics','Intro to Python',23,40,'2026-01-05','2026-02-05'),(6,'Python Advanced','OOP and Libraries',23,45,'2026-02-10','2026-03-25'),(7,'Data Analytics','Data Analysis concepts',24,30,'2026-02-01','2026-02-28'),(8,'Machine Learning','Basics of ML',21,60,'2026-03-01','2026-04-30'),(9,'AI Fundamentals','Artificial Intelligence basics',22,45,'2026-03-10','2026-04-20'),(10,'Cloud Computing','Cloud concepts',23,35,'2026-01-25','2026-02-25'),(11,'Cyber Security','Security fundamentals',24,40,'2026-02-05','2026-03-15'),(12,'IoT Systems','IoT basics',21,30,'2026-02-10','2026-03-10'),(13,'Embedded Systems','Microcontrollers',22,45,'2026-03-01','2026-04-15'),(14,'Big Data','Big Data tools',23,50,'2026-03-05','2026-04-30');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollments`
--

DROP TABLE IF EXISTS `enrollments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `course_id` int NOT NULL,
  `date_enrolled` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`course_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollments`
--

LOCK TABLES `enrollments` WRITE;
/*!40000 ALTER TABLE `enrollments` DISABLE KEYS */;
INSERT INTO `enrollments` VALUES (1,1,1,'2026-01-01'),(2,2,1,'2026-01-01'),(3,3,2,'2026-01-02'),(4,4,2,'2026-01-02'),(5,5,3,'2026-01-03'),(6,6,3,'2026-01-03'),(7,7,4,'2026-01-04'),(8,8,4,'2026-01-04'),(9,9,5,'2026-01-05'),(10,10,5,'2026-01-05'),(11,11,6,'2026-01-06'),(12,12,6,'2026-01-06'),(13,13,7,'2026-01-07'),(14,14,7,'2026-01-07'),(15,15,8,'2026-01-08'),(16,16,8,'2026-01-08'),(17,17,9,'2026-01-09'),(18,18,9,'2026-01-09'),(19,19,10,'2026-01-10'),(20,20,10,'2026-01-10'),(21,21,11,'2026-01-11'),(22,22,11,'2026-01-11'),(23,23,12,'2026-01-12'),(24,24,12,'2026-01-12'),(25,25,13,'2026-01-13'),(26,26,13,'2026-01-13'),(27,27,14,'2026-01-14'),(28,28,14,'2026-01-14'),(52,30,11,'2026-01-11'),(53,31,12,'2026-01-12'),(54,32,12,'2026-01-12'),(55,33,13,'2026-01-13'),(56,34,13,'2026-01-13'),(57,35,14,'2026-01-14'),(58,36,14,'2026-01-14');
/*!40000 ALTER TABLE `enrollments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progress`
--

DROP TABLE IF EXISTS `progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `progress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `enrollment_id` int NOT NULL,
  `module_name` varchar(100) DEFAULT NULL,
  `completion_status` enum('Not Started','In Progress','Completed') DEFAULT 'Not Started',
  `score` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `enrollment_id` (`enrollment_id`),
  CONSTRAINT `progress_ibfk_1` FOREIGN KEY (`enrollment_id`) REFERENCES `enrollments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progress`
--

LOCK TABLES `progress` WRITE;
/*!40000 ALTER TABLE `progress` DISABLE KEYS */;
INSERT INTO `progress` VALUES (1,1,'Introduction','Completed',85.00),(2,2,'Introduction','Completed',88.00),(3,4,'Module 1','Completed',90.00),(4,5,'Module 2','Completed',78.00),(5,6,'Module 2','Completed',80.00),(6,8,'Module 3','Completed',92.00),(7,9,'Module 4','Completed',75.00),(8,10,'Module 4','Completed',77.00),(9,11,'Module 5','Completed',83.00),(10,13,'Module 6','Completed',89.00),(11,14,'Module 6','Completed',91.00),(12,15,'Module 7','Completed',76.00),(13,17,'Module 8','Completed',84.00),(14,18,'Module 8','Completed',86.00),(15,19,'Module 9','Completed',90.00),(16,21,'Module 10','Completed',88.00),(17,22,'Module 10','Completed',87.00),(18,23,'Module 11','Completed',79.00),(19,24,'Module 11','Completed',81.00),(20,25,'Module 12','Completed',85.00),(21,27,'Module 13','Completed',90.00),(22,28,'Module 13','Completed',92.00),(25,1,'Introduction','Completed',85.00),(26,2,'Introduction','Completed',88.00),(27,3,'Module 1','In Progress',NULL),(28,4,'Module 1','Completed',90.00),(29,5,'Module 2','Completed',78.00),(30,6,'Module 2','Completed',80.00),(31,7,'Module 3','In Progress',NULL),(32,8,'Module 3','Completed',92.00),(33,9,'Module 4','Completed',75.00),(34,10,'Module 4','Completed',77.00),(35,11,'Module 5','Completed',83.00),(36,12,'Module 5','In Progress',NULL),(37,13,'Module 6','Completed',89.00),(38,14,'Module 6','Completed',91.00),(39,15,'Module 7','Completed',76.00),(40,16,'Module 7','In Progress',NULL),(41,17,'Module 8','Completed',84.00),(42,18,'Module 8','Completed',86.00),(43,19,'Module 9','Completed',90.00),(44,20,'Module 9','In Progress',NULL),(45,21,'Module 10','Completed',88.00),(46,22,'Module 10','Completed',87.00),(47,23,'Module 11','Completed',79.00),(48,24,'Module 11','Completed',81.00),(49,25,'Module 12','Completed',85.00),(50,26,'Module 12','In Progress',NULL),(51,27,'Module 13','Completed',90.00),(52,28,'Module 13','Completed',92.00);
/*!40000 ALTER TABLE `progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` enum('Student','Instructor','Admin') NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Alice','alice1@gmail.com','Student','pass123'),(2,'Bob','bob1@gmail.com','Student','pass123'),(3,'Charlie','charlie1@gmail.com','Student','pass123'),(4,'David','david1@gmail.com','Student','pass123'),(5,'Eva','eva1@gmail.com','Student','pass123'),(6,'Frank','frank1@gmail.com','Student','pass123'),(7,'Grace','grace1@gmail.com','Student','pass123'),(8,'Hannah','hannah1@gmail.com','Student','pass123'),(9,'Ian','ian1@gmail.com','Student','pass123'),(10,'Jack','jack1@gmail.com','Student','pass123'),(11,'Kevin','kevin1@gmail.com','Student','pass123'),(12,'Laura','laura1@gmail.com','Student','pass123'),(13,'Mike','mike1@gmail.com','Student','pass123'),(14,'Nina','nina1@gmail.com','Student','pass123'),(15,'Oscar','oscar1@gmail.com','Student','pass123'),(16,'Paul','paul1@gmail.com','Student','pass123'),(17,'Queen','queen1@gmail.com','Student','pass123'),(18,'Rachel','rachel1@gmail.com','Student','pass123'),(19,'Sam','sam1@gmail.com','Student','pass123'),(20,'Tina','tina1@gmail.com','Student','pass123'),(21,'Instructor1','inst1@gmail.com','Instructor','teach123'),(22,'Instructor2','inst2@gmail.com','Instructor','teach123'),(23,'Instructor3','inst3@gmail.com','Instructor','teach123'),(24,'Instructor4','inst4@gmail.com','Instructor','teach123'),(25,'Admin1','admin1@gmail.com','Admin','admin123'),(26,'Admin2','admin2@gmail.com','Admin','admin123'),(27,'Admin3','admin3@gmail.com','Admin','admin123'),(28,'Admin4','admin4@gmail.com','Admin','admin123'),(29,'Admin5','admin5@gmail.com','Admin','admin123'),(30,'Student21','stud21@gmail.com','Student','pass123'),(31,'Student22','stud22@gmail.com','Student','pass123'),(32,'Student23','stud23@gmail.com','Student','pass123'),(33,'Student24','stud24@gmail.com','Student','pass123'),(34,'Student25','stud25@gmail.com','Student','pass123'),(35,'Student26','stud26@gmail.com','Student','pass123'),(36,'Student27','stud27@gmail.com','Student','pass123'),(37,'Student28','stud28@gmail.com','Student','pass123'),(38,'Student29','stud29@gmail.com','Student','pass123'),(39,'Student30','stud30@gmail.com','Student','pass123');
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

-- Dump completed on 2026-01-11  7:37:40
