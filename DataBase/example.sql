CREATE DATABASE  IF NOT EXISTS `example` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `example`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: example
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
-- Table structure for table `assessments`
--

DROP TABLE IF EXISTS `assessments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assessments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `assessment` int NOT NULL,
  `users_id` bigint NOT NULL,
  `school_subject_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `a_users_id_fk` (`users_id`),
  KEY `a_school_subject_id_fk` (`school_subject_id`),
  CONSTRAINT `a_school_subject_id_fk` FOREIGN KEY (`school_subject_id`) REFERENCES `school_subject` (`id`),
  CONSTRAINT `a_users_id_fk` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessments`
--

LOCK TABLES `assessments` WRITE;
/*!40000 ALTER TABLE `assessments` DISABLE KEYS */;
INSERT INTO `assessments` VALUES (1,12,9,1),(2,10,9,1),(3,12,9,1),(4,8,9,3),(5,11,9,5);
/*!40000 ALTER TABLE `assessments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `class_name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,'10'),(2,'11'),(3,'9');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_9`
--

DROP TABLE IF EXISTS `schedule_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_9` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `monday` bigint DEFAULT NULL,
  `tuesday` bigint DEFAULT NULL,
  `wednesday` bigint DEFAULT NULL,
  `thursday` bigint DEFAULT NULL,
  `friday` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `monday_fk` (`monday`),
  KEY `tuesday_fk` (`tuesday`),
  KEY `wednesday_fk` (`wednesday`),
  KEY `thursday_fk` (`thursday`),
  KEY `friday_fk` (`friday`),
  CONSTRAINT `friday_fk` FOREIGN KEY (`friday`) REFERENCES `school_subject` (`id`),
  CONSTRAINT `monday_fk` FOREIGN KEY (`monday`) REFERENCES `school_subject` (`id`),
  CONSTRAINT `thursday_fk` FOREIGN KEY (`thursday`) REFERENCES `school_subject` (`id`),
  CONSTRAINT `tuesday_fk` FOREIGN KEY (`tuesday`) REFERENCES `school_subject` (`id`),
  CONSTRAINT `wednesday_fk` FOREIGN KEY (`wednesday`) REFERENCES `school_subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_9`
--

LOCK TABLES `schedule_9` WRITE;
/*!40000 ALTER TABLE `schedule_9` DISABLE KEYS */;
INSERT INTO `schedule_9` VALUES (1,1,5,2,8,1),(2,3,3,6,9,7),(3,3,3,6,9,7),(4,8,5,2,8,1),(5,NULL,NULL,4,3,2);
/*!40000 ALTER TABLE `schedule_9` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_subject`
--

DROP TABLE IF EXISTS `school_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_subject` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_subject`
--

LOCK TABLES `school_subject` WRITE;
/*!40000 ALTER TABLE `school_subject` DISABLE KEYS */;
INSERT INTO `school_subject` VALUES (1,'Математика'),(2,'Українська мова'),(3,'Історія України'),(4,'Всесвітня історія'),(5,'Хімія'),(6,'Українстька література'),(7,'Біологія'),(8,'Географія'),(9,'Англійська мова');
/*!40000 ALTER TABLE `school_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `users_id` bigint DEFAULT NULL,
  `class_id` bigint DEFAULT NULL,
  `patronymic` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_id_fk` (`users_id`),
  KEY `class_id_fk` (`class_id`),
  CONSTRAINT `class_id_fk` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`),
  CONSTRAINT `users_id_fk` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'gun','don',4,1,'ass'),(2,'gun','don',4,1,'ass'),(10,'00','000',2,3,'000'),(11,'Фисак','Богдан',9,3,'Романович'),(12,'Іван','Іван',10,2,'Іванович');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `loggin` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'login','password'),(2,'1','2'),(3,'login','notpassword'),(4,'1','3'),(9,'123','123'),(10,'ivan','ivan');
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

-- Dump completed on 2023-11-23 16:28:17
