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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessments`
--

LOCK TABLES `assessments` WRITE;
/*!40000 ALTER TABLE `assessments` DISABLE KEYS */;
INSERT INTO `assessments` VALUES (7,12,12,1),(8,12,12,2),(9,12,12,1),(10,11,12,2),(11,12,12,3),(12,10,12,4),(13,10,15,1),(14,9,15,2),(15,11,15,6),(16,8,15,9),(17,2,15,3),(18,12,15,4),(19,12,16,1),(20,12,16,2),(21,12,16,3),(22,12,16,4),(23,12,16,5),(24,12,16,6),(25,12,16,7),(26,12,16,8),(27,12,16,9),(28,12,16,10);
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
-- Table structure for table `schedule_10`
--

DROP TABLE IF EXISTS `schedule_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_10` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `monday` bigint DEFAULT NULL,
  `tuesday` bigint DEFAULT NULL,
  `wednesday` bigint DEFAULT NULL,
  `thursday` bigint DEFAULT NULL,
  `friday` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `monday_fk_10` (`monday`),
  KEY `tuesday_fk_10` (`tuesday`),
  KEY `wednesday_fk_10` (`wednesday`),
  KEY `thursday_fk_10` (`thursday`),
  KEY `friday_fk_10` (`friday`),
  CONSTRAINT `friday_fk_10` FOREIGN KEY (`friday`) REFERENCES `school_subject` (`id`),
  CONSTRAINT `monday_fk_10` FOREIGN KEY (`monday`) REFERENCES `school_subject` (`id`),
  CONSTRAINT `thursday_fk_10` FOREIGN KEY (`thursday`) REFERENCES `school_subject` (`id`),
  CONSTRAINT `tuesday_fk_10` FOREIGN KEY (`tuesday`) REFERENCES `school_subject` (`id`),
  CONSTRAINT `wednesday_fk_10` FOREIGN KEY (`wednesday`) REFERENCES `school_subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_10`
--

LOCK TABLES `schedule_10` WRITE;
/*!40000 ALTER TABLE `schedule_10` DISABLE KEYS */;
INSERT INTO `schedule_10` VALUES (1,9,1,5,8,2),(2,7,2,2,9,6),(3,3,3,4,10,7),(4,8,4,6,1,8),(5,10,5,8,3,5),(6,6,7,NULL,3,2),(7,4,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `schedule_10` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_11`
--

DROP TABLE IF EXISTS `schedule_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_11` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `monday` bigint DEFAULT NULL,
  `tuesday` bigint DEFAULT NULL,
  `wednesday` bigint DEFAULT NULL,
  `thursday` bigint DEFAULT NULL,
  `friday` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `monday_fk_11` (`monday`),
  KEY `tuesday_fk_11` (`tuesday`),
  KEY `wednesday_fk_11` (`wednesday`),
  KEY `thursday_fk_11` (`thursday`),
  KEY `friday_fk_11` (`friday`),
  CONSTRAINT `friday_fk_11` FOREIGN KEY (`friday`) REFERENCES `school_subject` (`id`),
  CONSTRAINT `monday_fk_11` FOREIGN KEY (`monday`) REFERENCES `school_subject` (`id`),
  CONSTRAINT `thursday_fk_11` FOREIGN KEY (`thursday`) REFERENCES `school_subject` (`id`),
  CONSTRAINT `tuesday_fk_11` FOREIGN KEY (`tuesday`) REFERENCES `school_subject` (`id`),
  CONSTRAINT `wednesday_fk_11` FOREIGN KEY (`wednesday`) REFERENCES `school_subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_11`
--

LOCK TABLES `schedule_11` WRITE;
/*!40000 ALTER TABLE `schedule_11` DISABLE KEYS */;
INSERT INTO `schedule_11` VALUES (1,3,2,9,2,2),(2,1,3,5,9,6),(3,6,4,3,1,7),(4,5,5,7,10,8),(5,10,6,8,7,5),(6,8,NULL,1,4,2),(7,9,NULL,10,2,NULL);
/*!40000 ALTER TABLE `schedule_11` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_subject`
--

LOCK TABLES `school_subject` WRITE;
/*!40000 ALTER TABLE `school_subject` DISABLE KEYS */;
INSERT INTO `school_subject` VALUES (1,'Математика'),(2,'Українська мова'),(3,'Історія України'),(4,'Всесвітня історія'),(5,'Хімія'),(6,'Українстька література'),(7,'Біологія'),(8,'Географія'),(9,'Англійська мова'),(10,'Фізика');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (13,'Фисак','Богдан',12,2,'Романович'),(16,'Порошенко','Петро',15,1,'Олексіївич'),(17,'Бандера','Степан',16,3,'Андрійович');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (12,'123','123'),(15,'loggin','password'),(16,'12345','12345');
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

-- Dump completed on 2023-11-23 18:53:52
