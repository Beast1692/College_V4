CREATE DATABASE  IF NOT EXISTS `af25onalm1_collegev4` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `af25onalm1_collegev4`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: af25onalm1_collegev4
-- ------------------------------------------------------
-- Server version	5.5.5-10.11.6-MariaDB-0+deb12u1

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
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building` (
  `building_id` int(11) NOT NULL AUTO_INCREMENT,
  `building_name` varchar(255) DEFAULT NULL,
  `building_room_number` int(11) DEFAULT NULL,
  `building_room_capacity` int(11) DEFAULT NULL,
  PRIMARY KEY (`building_id`),
  KEY `BUILDING_NAME` (`building_name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES (5,'Engineering Hall',101,50),(6,'Physics Lab',102,40),(7,'Chemistry Lab',103,35),(8,'Biology Hall',104,45),(9,'Philosophy Hall',105,30),(10,'Sociology Center',106,40),(11,'Political Science Hall',107,50),(12,'Psychology Lab',108,35),(13,'Cognitive Science Hall',109,45),(14,'IT Center',110,60);
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) DEFAULT NULL,
  `course_credit_hours` int(11) DEFAULT NULL,
  `course_created` timestamp NULL DEFAULT current_timestamp(),
  `audit_user_id` int(11) NOT NULL,
  `course_audited` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`course_id`),
  KEY `course_name` (`course_name`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (5,'Data Structures',3,'2025-11-11 18:56:22',1,'2025-11-11 18:56:22'),(6,'Algorithms',3,'2025-11-11 18:56:22',1,'2025-11-11 18:56:22'),(7,'Software Engineering',3,'2025-11-11 18:56:22',2,'2025-11-11 18:56:22'),(8,'Artificial Intelligence',3,'2025-11-11 18:56:22',2,'2025-11-11 18:56:22'),(9,'Machine Learning',3,'2025-11-11 18:56:22',3,'2025-11-11 18:56:22'),(10,'Operating Systems',4,'2025-11-11 18:56:22',3,'2025-11-11 18:56:22'),(11,'Database Design',3,'2025-11-11 18:56:22',4,'2025-11-11 18:56:22'),(12,'Network Security',3,'2025-11-11 18:56:22',4,'2025-11-11 18:56:22'),(13,'Calculus II',4,'2025-11-11 18:56:22',1,'2025-11-11 18:56:22'),(14,'Statistics',3,'2025-11-11 18:56:22',1,'2025-11-11 18:56:22'),(15,'Linear Programming',3,'2025-11-11 18:56:22',2,'2025-11-11 18:56:22'),(16,'Econometrics',3,'2025-11-11 18:56:22',2,'2025-11-11 18:56:22'),(17,'Philosophy 101',3,'2025-11-11 18:56:22',3,'2025-11-11 18:56:22'),(18,'Sociology',3,'2025-11-11 18:56:22',3,'2025-11-11 18:56:22'),(19,'Political Science',3,'2025-11-11 18:56:22',4,'2025-11-11 18:56:22'),(20,'Psychology 201',3,'2025-11-11 18:56:22',4,'2025-11-11 18:56:22'),(21,'Cognitive Science',3,'2025-11-11 18:56:22',1,'2025-11-11 18:56:22'),(22,'Web Development',3,'2025-11-11 18:56:22',2,'2025-11-11 18:56:22'),(23,'Mobile App Development',3,'2025-11-11 18:56:22',3,'2025-11-11 18:56:22'),(24,'Game Development',3,'2025-11-11 18:56:22',4,'2025-11-11 18:56:22');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_has_department`
--

DROP TABLE IF EXISTS `course_has_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_has_department` (
  `department_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  KEY `fk_course_has_department_department1_idx` (`department_id`),
  KEY `fk_course_has_department_course1_idx` (`course_id`),
  CONSTRAINT `fk_course_has_department_course1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_course_has_department_department1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_has_department`
--

LOCK TABLES `course_has_department` WRITE;
/*!40000 ALTER TABLE `course_has_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_has_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(255) DEFAULT NULL,
  `department_created` timestamp NULL DEFAULT current_timestamp(),
  `audit_user_id` int(11) NOT NULL,
  `department_audited` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`department_id`),
  KEY `department_name` (`department_name`),
  KEY `fk_department_employee1_idx` (`employee_id`),
  CONSTRAINT `fk_department_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (107,'Engineering','2025-11-11 18:56:22',1,'2025-11-11 18:56:22',5),(108,'Physics','2025-11-11 18:56:22',2,'2025-11-11 18:56:22',6),(109,'Chemistry','2025-11-11 18:56:22',3,'2025-11-11 18:56:22',7),(110,'Biology','2025-11-11 18:56:22',4,'2025-11-11 18:56:22',8),(111,'Philosophy','2025-11-11 18:56:22',1,'2025-11-11 18:56:22',9),(112,'Sociology','2025-11-11 18:56:22',2,'2025-11-11 18:56:22',10),(113,'Political Science','2025-11-11 18:56:22',3,'2025-11-11 18:56:22',11),(114,'Psychology','2025-11-11 18:56:22',4,'2025-11-11 19:08:32',12),(115,'Cognitive Science','2025-11-11 18:56:22',1,'2025-11-11 18:56:22',13),(116,'Information Technology','2025-11-11 18:56:22',2,'2025-11-11 18:56:22',14);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_start_date` date DEFAULT NULL,
  `employee_end_date` date DEFAULT NULL,
  `employee_created` timestamp NULL DEFAULT current_timestamp(),
  `audit_user_id` int(11) NOT NULL,
  `employee_edited` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `lookup_employee_role_id` int(11) NOT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `fk_employee_lookup_employee_role1_idx` (`lookup_employee_role_id`),
  CONSTRAINT `fk_employee_lookup_employee_role1` FOREIGN KEY (`lookup_employee_role_id`) REFERENCES `lookup_employee_role` (`lookup_employee_role_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (9,'2020-05-05',NULL,'2025-11-11 18:56:22',1,'2025-11-11 18:56:22',1),(10,'2020-06-06',NULL,'2025-11-11 18:56:22',1,'2025-11-11 18:56:22',2),(11,'2020-07-07',NULL,'2025-11-11 18:56:22',2,'2025-11-11 18:56:22',3),(12,'2020-08-08',NULL,'2025-11-11 18:56:22',2,'2025-11-11 18:56:22',4),(13,'2020-09-09',NULL,'2025-11-11 18:56:22',3,'2025-11-11 18:56:22',1),(14,'2020-10-10',NULL,'2025-11-11 18:56:22',3,'2025-11-11 18:56:22',2),(15,'2020-11-11',NULL,'2025-11-11 18:56:22',4,'2025-11-11 18:56:22',3),(16,'2020-12-12',NULL,'2025-11-11 18:56:22',4,'2025-11-11 18:56:22',4),(17,'2021-01-01',NULL,'2025-11-11 18:56:22',1,'2025-11-11 18:56:22',1),(18,'2021-02-02',NULL,'2025-11-11 18:56:22',1,'2025-11-11 18:56:22',2),(19,'2021-03-03',NULL,'2025-11-11 18:56:22',2,'2025-11-11 18:56:22',3),(20,'2021-04-04',NULL,'2025-11-11 18:56:22',2,'2025-11-11 18:56:22',4),(21,'2021-05-05',NULL,'2025-11-11 18:56:22',3,'2025-11-11 18:56:22',1),(22,'2021-06-06',NULL,'2025-11-11 18:56:22',3,'2025-11-11 18:56:22',2),(23,'2021-07-07',NULL,'2025-11-11 18:56:22',4,'2025-11-11 18:56:22',3),(24,'2021-08-08',NULL,'2025-11-11 18:56:22',4,'2025-11-11 18:56:22',4),(25,'2021-09-09',NULL,'2025-11-11 18:56:22',1,'2025-11-11 18:56:22',1),(26,'2021-10-10',NULL,'2025-11-11 18:56:22',1,'2025-11-11 18:56:22',2),(27,'2021-11-11',NULL,'2025-11-11 18:56:22',2,'2025-11-11 18:56:22',3),(28,'2021-12-12',NULL,'2025-11-11 18:56:22',2,'2025-11-11 18:56:22',4);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollment` (
  `enrollment_id` int(11) NOT NULL AUTO_INCREMENT,
  `enrollment_status` varchar(255) DEFAULT '"Active"',
  `enrolment_created` timestamp NULL DEFAULT current_timestamp(),
  `audit_user_id` int(11) NOT NULL,
  `enrollment_audited` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `student_student_id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `lookup_grade_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`enrollment_id`),
  KEY `fk_enrollment_student1_idx` (`student_student_id`),
  KEY `fk_enrollment_semester1_idx` (`semester_id`),
  KEY `fk_enrollment_lookup_grade1_idx` (`lookup_grade_id`),
  KEY `idx_enrollment_section` (`section_id`),
  CONSTRAINT `fk_enrollment_semester1` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`semester_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_enrollment_student1` FOREIGN KEY (`student_student_id`) REFERENCES `student` (`student_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES (5,'Active','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',1,1,1,NULL),(6,'Completed','2025-11-11 18:56:24',2,'2025-11-11 18:56:24',2,1,2,NULL),(7,'Active','2025-11-11 18:56:24',3,'2025-11-11 18:56:24',3,1,1,NULL),(8,'Withdrawn','2025-11-11 18:56:24',4,'2025-11-11 18:56:24',4,1,5,NULL),(9,'Active','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',5,2,2,NULL),(10,'Completed','2025-11-11 18:56:24',2,'2025-11-11 18:56:24',6,2,3,NULL),(11,'Active','2025-11-11 18:56:24',3,'2025-11-11 18:56:24',7,2,1,NULL),(12,'Withdrawn','2025-11-11 18:56:24',4,'2025-11-11 18:56:24',8,2,4,NULL),(13,'Active','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',9,1,2,NULL),(14,'Completed','2025-11-11 18:56:24',2,'2025-11-11 18:56:24',10,1,3,NULL),(15,'Active','2025-11-11 18:56:24',3,'2025-11-11 18:56:24',11,2,1,NULL),(16,'Withdrawn','2025-11-11 18:56:24',4,'2025-11-11 18:56:24',12,2,5,NULL),(17,'Active','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',13,1,2,NULL),(18,'Completed','2025-11-11 18:56:24',2,'2025-11-11 18:56:24',14,1,3,NULL),(19,'Active','2025-11-11 18:56:24',3,'2025-11-11 18:56:24',15,2,1,NULL),(20,'Withdrawn','2025-11-11 18:56:24',4,'2025-11-11 18:56:24',16,2,4,NULL),(21,'Active','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',17,1,2,NULL),(22,'Completed','2025-11-11 18:56:24',2,'2025-11-11 18:56:24',18,1,3,NULL),(23,'Active','2025-11-11 18:56:24',3,'2025-11-11 18:56:24',19,2,1,NULL),(24,'Withdrawn','2025-11-11 18:56:24',4,'2025-11-11 18:56:24',20,2,5,NULL),(25,'Active','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',21,1,2,NULL),(26,'Completed','2025-11-11 18:56:24',2,'2025-11-11 18:56:24',22,1,3,NULL),(27,'Active','2025-11-11 18:56:24',3,'2025-11-11 18:56:24',23,2,1,NULL),(28,'Withdrawn','2025-11-11 18:56:24',4,'2025-11-11 18:56:24',24,2,4,NULL),(29,'Active','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',25,1,2,NULL),(30,'Completed','2025-11-11 18:56:24',2,'2025-11-11 18:56:24',26,1,3,NULL),(31,'Active','2025-11-11 18:56:24',3,'2025-11-11 18:56:24',27,2,1,NULL),(32,'Withdrawn','2025-11-11 18:56:24',4,'2025-11-11 18:56:24',28,2,4,NULL),(33,'Active','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',29,1,2,NULL),(34,'Completed','2025-11-11 18:56:24',2,'2025-11-11 18:56:24',30,1,3,NULL),(35,'Active','2025-11-11 18:56:24',3,'2025-11-11 18:56:24',31,2,1,NULL),(36,'Withdrawn','2025-11-11 18:56:24',4,'2025-11-11 18:56:24',32,2,4,NULL),(37,'Active','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',33,1,2,NULL),(38,'Completed','2025-11-11 18:56:24',2,'2025-11-11 18:56:24',34,1,3,NULL),(39,'Active','2025-11-11 18:56:24',3,'2025-11-11 18:56:24',35,2,1,NULL),(40,'Withdrawn','2025-11-11 18:56:24',4,'2025-11-11 18:56:24',36,2,4,NULL),(41,'Active','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',37,1,2,NULL),(42,'Completed','2025-11-11 18:56:24',2,'2025-11-11 18:56:24',38,1,3,NULL),(43,'Active','2025-11-11 18:56:24',3,'2025-11-11 18:56:24',39,2,1,NULL),(44,'Withdrawn','2025-11-11 18:56:24',4,'2025-11-11 18:56:24',40,2,4,NULL),(45,'Active','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',41,1,2,NULL),(46,'Completed','2025-11-11 18:56:24',2,'2025-11-11 18:56:24',42,1,3,NULL),(47,'Active','2025-11-11 18:56:24',3,'2025-11-11 18:56:24',43,2,1,NULL),(48,'Withdrawn','2025-11-11 18:56:24',4,'2025-11-11 18:56:24',44,2,4,NULL),(49,'Active','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',45,1,2,NULL),(50,'Completed','2025-11-11 18:56:24',2,'2025-11-11 18:56:24',46,1,3,NULL),(51,'Active','2025-11-11 18:56:24',3,'2025-11-11 18:56:24',47,2,1,NULL),(52,'Withdrawn','2025-11-11 18:56:24',4,'2025-11-11 18:56:24',48,2,4,NULL),(53,'Active','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',49,1,2,NULL),(54,'Completed','2025-11-11 18:56:24',2,'2025-11-11 18:56:24',50,1,3,NULL);
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment_backup`
--

DROP TABLE IF EXISTS `enrollment_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollment_backup` (
  `enrollment_id` int(11) NOT NULL AUTO_INCREMENT,
  `enrollment_status` varchar(255) DEFAULT NULL,
  `enrolment_created` timestamp NULL DEFAULT current_timestamp(),
  `audit_user_id` int(11) NOT NULL,
  `enrollment_audited` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `student_student_id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `lookup_grade_id` int(11) NOT NULL,
  `section_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`enrollment_id`),
  KEY `fk_enrollment_student1_idx` (`student_student_id`),
  KEY `fk_enrollment_semester1_idx` (`semester_id`),
  KEY `fk_enrollment_lookup_grade1_idx` (`lookup_grade_id`),
  KEY `idx_enrollment_section` (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment_backup`
--

LOCK TABLES `enrollment_backup` WRITE;
/*!40000 ALTER TABLE `enrollment_backup` DISABLE KEYS */;
INSERT INTO `enrollment_backup` VALUES (5,'Active','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',1,1,1,NULL),(6,'Completed','2025-11-11 18:56:24',2,'2025-11-11 18:56:24',2,1,2,NULL),(7,'Active','2025-11-11 18:56:24',3,'2025-11-11 18:56:24',3,1,1,NULL),(8,'Withdrawn','2025-11-11 18:56:24',4,'2025-11-11 18:56:24',4,1,5,NULL),(9,'Active','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',5,2,2,NULL),(10,'Completed','2025-11-11 18:56:24',2,'2025-11-11 18:56:24',6,2,3,NULL),(11,'Active','2025-11-11 18:56:24',3,'2025-11-11 18:56:24',7,2,1,NULL),(12,'Withdrawn','2025-11-11 18:56:24',4,'2025-11-11 18:56:24',8,2,4,NULL),(13,'Active','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',9,1,2,NULL),(14,'Completed','2025-11-11 18:56:24',2,'2025-11-11 18:56:24',10,1,3,NULL),(15,'Active','2025-11-11 18:56:24',3,'2025-11-11 18:56:24',11,2,1,NULL),(16,'Withdrawn','2025-11-11 18:56:24',4,'2025-11-11 18:56:24',12,2,5,NULL),(17,'Active','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',13,1,2,NULL),(18,'Completed','2025-11-11 18:56:24',2,'2025-11-11 18:56:24',14,1,3,NULL),(19,'Active','2025-11-11 18:56:24',3,'2025-11-11 18:56:24',15,2,1,NULL),(20,'Withdrawn','2025-11-11 18:56:24',4,'2025-11-11 18:56:24',16,2,4,NULL),(21,'Active','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',17,1,2,NULL),(22,'Completed','2025-11-11 18:56:24',2,'2025-11-11 18:56:24',18,1,3,NULL),(23,'Active','2025-11-11 18:56:24',3,'2025-11-11 18:56:24',19,2,1,NULL),(24,'Withdrawn','2025-11-11 18:56:24',4,'2025-11-11 18:56:24',20,2,5,NULL),(25,'Active','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',21,1,2,NULL),(26,'Completed','2025-11-11 18:56:24',2,'2025-11-11 18:56:24',22,1,3,NULL),(27,'Active','2025-11-11 18:56:24',3,'2025-11-11 18:56:24',23,2,1,NULL),(28,'Withdrawn','2025-11-11 18:56:24',4,'2025-11-11 18:56:24',24,2,4,NULL),(29,'Active','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',25,1,2,NULL),(30,'Completed','2025-11-11 18:56:24',2,'2025-11-11 18:56:24',26,1,3,NULL),(31,'Active','2025-11-11 18:56:24',3,'2025-11-11 18:56:24',27,2,1,NULL),(32,'Withdrawn','2025-11-11 18:56:24',4,'2025-11-11 18:56:24',28,2,4,NULL),(33,'Active','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',29,1,2,NULL),(34,'Completed','2025-11-11 18:56:24',2,'2025-11-11 18:56:24',30,1,3,NULL),(35,'Active','2025-11-11 18:56:24',3,'2025-11-11 18:56:24',31,2,1,NULL),(36,'Withdrawn','2025-11-11 18:56:24',4,'2025-11-11 18:56:24',32,2,4,NULL),(37,'Active','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',33,1,2,NULL),(38,'Completed','2025-11-11 18:56:24',2,'2025-11-11 18:56:24',34,1,3,NULL),(39,'Active','2025-11-11 18:56:24',3,'2025-11-11 18:56:24',35,2,1,NULL),(40,'Withdrawn','2025-11-11 18:56:24',4,'2025-11-11 18:56:24',36,2,4,NULL),(41,'Active','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',37,1,2,NULL),(42,'Completed','2025-11-11 18:56:24',2,'2025-11-11 18:56:24',38,1,3,NULL),(43,'Active','2025-11-11 18:56:24',3,'2025-11-11 18:56:24',39,2,1,NULL),(44,'Withdrawn','2025-11-11 18:56:24',4,'2025-11-11 18:56:24',40,2,4,NULL),(45,'Active','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',41,1,2,NULL),(46,'Completed','2025-11-11 18:56:24',2,'2025-11-11 18:56:24',42,1,3,NULL),(47,'Active','2025-11-11 18:56:24',3,'2025-11-11 18:56:24',43,2,1,NULL),(48,'Withdrawn','2025-11-11 18:56:24',4,'2025-11-11 18:56:24',44,2,4,NULL),(49,'Active','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',45,1,2,NULL),(50,'Completed','2025-11-11 18:56:24',2,'2025-11-11 18:56:24',46,1,3,NULL),(51,'Active','2025-11-11 18:56:24',3,'2025-11-11 18:56:24',47,2,1,NULL),(52,'Withdrawn','2025-11-11 18:56:24',4,'2025-11-11 18:56:24',48,2,4,NULL),(53,'Active','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',49,1,2,NULL),(54,'Completed','2025-11-11 18:56:24',2,'2025-11-11 18:56:24',50,1,3,NULL);
/*!40000 ALTER TABLE `enrollment_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lookup_employee_role`
--

DROP TABLE IF EXISTS `lookup_employee_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lookup_employee_role` (
  `lookup_employee_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `lookup_employee_role_name` varchar(255) DEFAULT NULL,
  `lookup_employee_role_security_level` int(11) DEFAULT NULL,
  PRIMARY KEY (`lookup_employee_role_id`),
  KEY `role` (`lookup_employee_role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lookup_employee_role`
--

LOCK TABLES `lookup_employee_role` WRITE;
/*!40000 ALTER TABLE `lookup_employee_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `lookup_employee_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lookup_grade`
--

DROP TABLE IF EXISTS `lookup_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lookup_grade` (
  `lookup_grade_id` int(11) NOT NULL AUTO_INCREMENT,
  `lookup_grade_letter` varchar(255) DEFAULT NULL,
  `lookup_grade_point_value` int(11) DEFAULT NULL,
  PRIMARY KEY (`lookup_grade_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lookup_grade`
--

LOCK TABLES `lookup_grade` WRITE;
/*!40000 ALTER TABLE `lookup_grade` DISABLE KEYS */;
/*!40000 ALTER TABLE `lookup_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_name` varchar(255) DEFAULT NULL,
  `room_capacity` int(11) DEFAULT NULL,
  `room_created` timestamp NULL DEFAULT current_timestamp(),
  `audit_user_id` int(11) NOT NULL DEFAULT 0,
  `room_audited` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `section_id` int(11) NOT NULL DEFAULT 0,
  `student_id` int(11) NOT NULL DEFAULT 0,
  `building_id` int(11) NOT NULL DEFAULT 0,
  `employee_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`room_id`),
  KEY `fk_room_section1_idx` (`section_id`),
  KEY `fk_room_student1_idx` (`student_id`),
  KEY `fk_room_building1_idx` (`building_id`),
  KEY `fk_room_employee1_idx` (`employee_id`),
  CONSTRAINT `fk_room_building1` FOREIGN KEY (`building_id`) REFERENCES `building` (`building_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_room_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_room_section1` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_room_student1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (5,'Eng 101A',50,'2025-11-11 18:56:23',1,'2025-11-11 18:56:23',1,1,1,1),(6,'Physics 102B',40,'2025-11-11 18:56:23',2,'2025-11-11 18:56:23',2,2,2,2),(7,'Chem 103C',35,'2025-11-11 18:56:23',3,'2025-11-11 18:56:23',3,3,3,3),(8,'Bio 104D',45,'2025-11-11 18:56:23',4,'2025-11-11 18:56:23',4,4,4,4),(9,'Phil 105E',30,'2025-11-11 18:56:23',1,'2025-11-11 18:56:23',5,5,5,5),(10,'Soc 106F',40,'2025-11-11 18:56:23',2,'2025-11-11 18:56:23',6,6,6,6),(11,'Pol 107G',50,'2025-11-11 18:56:23',3,'2025-11-11 18:56:23',7,7,7,7),(12,'Psych 108H',35,'2025-11-11 18:56:23',4,'2025-11-11 18:56:23',8,8,8,8),(13,'CogSci 109I',45,'2025-11-11 18:56:23',1,'2025-11-11 18:56:23',9,9,9,9),(14,'IT 110J',60,'2025-11-11 18:56:23',2,'2025-11-11 18:56:23',10,10,10,10),(15,'Eng 101B',50,'2025-11-11 18:56:23',3,'2025-11-11 18:56:23',11,11,1,11),(16,'Physics 102C',40,'2025-11-11 18:56:23',4,'2025-11-11 18:56:23',12,12,2,12),(17,'Chem 103D',35,'2025-11-11 18:56:23',1,'2025-11-11 18:56:23',13,13,3,13),(18,'Bio 104E',45,'2025-11-11 18:56:23',2,'2025-11-11 18:56:23',14,14,4,14),(19,'Phil 105F',30,'2025-11-11 18:56:23',3,'2025-11-11 18:56:23',15,15,5,15),(20,'Soc 106G',40,'2025-11-11 18:56:23',4,'2025-11-11 18:56:23',16,16,6,16),(21,'Pol 107H',50,'2025-11-11 18:56:23',1,'2025-11-11 18:56:23',17,17,7,17),(22,'Psych 108I',35,'2025-11-11 18:56:23',2,'2025-11-11 18:56:23',18,18,8,18),(23,'CogSci 109J',45,'2025-11-11 18:56:23',3,'2025-11-11 18:56:23',19,19,9,19),(24,'IT 110K',60,'2025-11-11 18:56:23',4,'2025-11-11 18:56:23',20,20,10,20),(25,NULL,30,'2025-11-11 23:27:00',1,'2025-11-11 23:27:00',0,0,0,0);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section` (
  `section_id` int(11) NOT NULL AUTO_INCREMENT,
  `section_days` varchar(255) DEFAULT NULL,
  `section_times` varchar(255) DEFAULT NULL,
  `section_delivery_method` varchar(255) DEFAULT NULL,
  `course_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `room_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`section_id`),
  KEY `fk_section_course1_idx` (`course_id`),
  KEY `fk_section_employee1_idx` (`employee_id`),
  KEY `fk_section_student1_idx` (`student_id`),
  KEY `fk_section_room` (`room_id`),
  CONSTRAINT `fk_section_course1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_section_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_section_room` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_section_student1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (5,'MWF','09:00-09:50','In-Person',1,1,1,NULL),(6,'TTh','10:00-11:15','Online',2,2,2,NULL),(7,'MWF','13:00-13:50','Hybrid',3,3,3,NULL),(8,'TTh','15:00-16:15','In-Person',4,4,4,NULL),(9,'MWF','08:00-08:50','In-Person',5,5,5,NULL),(10,'TTh','12:00-13:15','Hybrid',6,6,6,NULL),(11,'MWF','10:00-10:50','Online',7,7,7,NULL),(12,'TTh','13:00-14:15','In-Person',8,8,8,NULL),(13,'MWF','09:00-09:50','Hybrid',9,9,9,NULL),(14,'TTh','14:00-15:15','Online',10,10,10,NULL),(15,'MWF','11:00-11:50','In-Person',11,11,11,NULL),(16,'TTh','10:00-11:15','Hybrid',12,12,12,NULL),(17,'MWF','13:00-13:50','Online',13,13,13,NULL),(18,'TTh','15:00-16:15','In-Person',14,14,14,NULL),(19,'MWF','08:00-08:50','Hybrid',15,15,15,NULL),(20,'TTh','12:00-13:15','Online',16,16,16,NULL),(21,'MWF','10:00-10:50','In-Person',17,17,17,NULL),(22,'TTh','13:00-14:15','Hybrid',18,18,18,NULL),(23,'MWF','09:00-09:50','Online',19,19,19,NULL),(24,'TTh','14:00-15:15','In-Person',20,20,20,NULL),(25,'MWF','11:00-11:50','Hybrid',21,21,21,NULL),(26,'TTh','10:00-11:15','Online',22,22,22,NULL),(27,'MWF','13:00-13:50','In-Person',23,23,23,NULL),(28,'TTh','15:00-16:15','Hybrid',24,24,24,NULL),(29,'MWF','08:00-08:50','Online',25,25,25,NULL),(30,'TTh','12:00-13:15','In-Person',26,26,26,NULL),(31,'MWF','10:00-10:50','Hybrid',27,27,27,NULL),(32,'TTh','13:00-14:15','Online',28,28,28,NULL),(33,'MWF','09:00-09:50','In-Person',29,29,29,NULL),(34,'TTh','14:00-15:15','Hybrid',30,30,30,NULL);
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semester` (
  `semester_id` int(11) NOT NULL,
  `semester_season` varchar(255) DEFAULT NULL,
  `audit_user_id` int(11) NOT NULL,
  PRIMARY KEY (`semester_id`),
  KEY `semester_season` (`semester_season`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semester`
--

LOCK TABLES `semester` WRITE;
/*!40000 ALTER TABLE `semester` DISABLE KEYS */;
/*!40000 ALTER TABLE `semester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_admission_date` date DEFAULT NULL,
  `student_graduation_date` date DEFAULT NULL,
  `student_created` timestamp NULL DEFAULT current_timestamp(),
  `audit_user_id` int(11) NOT NULL,
  `faculty_edited` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (5,'2019-08-20','2023-05-15','2025-11-11 18:56:22',1,'2025-11-11 18:56:22'),(6,'2020-01-15',NULL,'2025-11-11 18:56:22',2,'2025-11-11 18:56:22'),(7,'2020-09-01',NULL,'2025-11-11 18:56:22',3,'2025-11-11 18:56:22'),(8,'2021-01-10',NULL,'2025-11-11 18:56:22',4,'2025-11-11 18:56:22'),(9,'2021-08-20',NULL,'2025-11-11 18:56:22',1,'2025-11-11 18:56:22'),(10,'2022-01-15',NULL,'2025-11-11 18:56:22',2,'2025-11-11 18:56:22'),(11,'2022-09-01',NULL,'2025-11-11 18:56:22',3,'2025-11-11 18:56:22'),(12,'2023-01-10',NULL,'2025-11-11 18:56:22',4,'2025-11-11 18:56:22'),(13,'2023-08-20',NULL,'2025-11-11 18:56:22',1,'2025-11-11 18:56:22'),(14,'2024-01-15',NULL,'2025-11-11 18:56:22',2,'2025-11-11 18:56:22'),(15,'2024-09-01',NULL,'2025-11-11 18:56:22',3,'2025-11-11 18:56:22'),(16,'2025-01-10',NULL,'2025-11-11 18:56:22',4,'2025-11-11 18:56:22'),(17,'2020-08-20',NULL,'2025-11-11 18:56:22',1,'2025-11-11 18:56:22'),(18,'2021-08-20',NULL,'2025-11-11 18:56:22',2,'2025-11-11 18:56:22'),(19,'2022-08-20',NULL,'2025-11-11 18:56:22',3,'2025-11-11 18:56:22'),(20,'2023-08-20',NULL,'2025-11-11 18:56:22',4,'2025-11-11 18:56:22'),(21,'2019-01-10','2022-05-15','2025-11-11 18:56:22',1,'2025-11-11 18:56:22'),(22,'2019-08-20','2023-05-15','2025-11-11 18:56:22',2,'2025-11-11 18:56:22'),(23,'2020-01-15',NULL,'2025-11-11 18:56:22',3,'2025-11-11 18:56:22'),(24,'2020-09-01',NULL,'2025-11-11 18:56:22',4,'2025-11-11 18:56:22'),(25,'2021-01-10',NULL,'2025-11-11 18:56:22',1,'2025-11-11 18:56:22'),(26,'2021-08-20',NULL,'2025-11-11 18:56:22',2,'2025-11-11 18:56:22'),(27,'2022-01-15',NULL,'2025-11-11 18:56:22',3,'2025-11-11 18:56:22'),(28,'2022-09-01',NULL,'2025-11-11 18:56:22',4,'2025-11-11 18:56:22'),(29,'2023-01-10',NULL,'2025-11-11 18:56:22',1,'2025-11-11 18:56:22'),(30,'2023-08-20',NULL,'2025-11-11 18:56:22',2,'2025-11-11 18:56:22'),(31,'2024-01-15',NULL,'2025-11-11 18:56:22',3,'2025-11-11 18:56:22'),(32,'2024-09-01',NULL,'2025-11-11 18:56:22',4,'2025-11-11 18:56:22'),(33,'2025-01-10',NULL,'2025-11-11 18:56:22',1,'2025-11-11 18:56:22'),(34,'2020-05-05',NULL,'2025-11-11 18:56:22',2,'2025-11-11 18:56:22'),(35,'2020-06-06',NULL,'2025-11-11 18:56:22',3,'2025-11-11 18:56:22'),(36,'2020-07-07',NULL,'2025-11-11 18:56:22',4,'2025-11-11 18:56:22'),(37,'2020-08-08',NULL,'2025-11-11 18:56:22',1,'2025-11-11 18:56:22'),(38,'2020-09-09',NULL,'2025-11-11 18:56:22',2,'2025-11-11 18:56:22'),(39,'2020-10-10',NULL,'2025-11-11 18:56:22',3,'2025-11-11 18:56:22'),(40,'2020-11-11',NULL,'2025-11-11 18:56:22',4,'2025-11-11 18:56:22'),(41,'2020-12-12',NULL,'2025-11-11 18:56:22',1,'2025-11-11 18:56:22'),(42,'2021-01-01',NULL,'2025-11-11 18:56:22',2,'2025-11-11 18:56:22'),(43,'2021-02-02',NULL,'2025-11-11 18:56:22',3,'2025-11-11 18:56:22'),(44,'2021-03-03',NULL,'2025-11-11 18:56:22',4,'2025-11-11 18:56:22'),(45,'2021-04-04',NULL,'2025-11-11 18:56:22',1,'2025-11-11 18:56:22'),(46,'2021-05-05',NULL,'2025-11-11 18:56:22',2,'2025-11-11 18:56:22'),(47,'2021-06-06',NULL,'2025-11-11 18:56:22',3,'2025-11-11 18:56:22'),(48,'2021-07-07',NULL,'2025-11-11 18:56:22',4,'2025-11-11 18:56:22'),(49,'2021-08-08',NULL,'2025-11-11 18:56:22',1,'2025-11-11 18:56:22'),(50,'2021-09-09',NULL,'2025-11-11 18:56:22',2,'2025-11-11 18:56:22'),(51,'2021-10-10',NULL,'2025-11-11 18:56:22',3,'2025-11-11 18:56:22'),(52,'2021-11-11',NULL,'2025-11-11 18:56:22',4,'2025-11-11 18:56:22'),(53,'2021-12-12',NULL,'2025-11-11 18:56:22',1,'2025-11-11 18:56:22');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_fname` varchar(255) DEFAULT NULL,
  `user_lname` varchar(255) DEFAULT NULL,
  `user_created` timestamp NULL DEFAULT current_timestamp(),
  `audit_id` int(11) NOT NULL,
  `user_audited` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `employee_employee_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `system_userid` varchar(50) NOT NULL,
  `campus_email` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_user_employee_idx` (`employee_employee_id`),
  KEY `first_name` (`user_fname`),
  KEY `last_name` (`user_lname`),
  KEY `fk_user_student1_idx` (`student_id`),
  CONSTRAINT `fk_user_employee` FOREIGN KEY (`employee_employee_id`) REFERENCES `employee` (`employee_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_user_student1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (5,'Alice','Johnson','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',1,NULL,'',''),(6,'Bob','Smith','2025-11-11 18:56:24',2,'2025-11-11 18:56:24',2,NULL,'',''),(7,'Charlie','Brown','2025-11-11 18:56:24',3,'2025-11-11 18:56:24',NULL,1,'',''),(8,'Diana','Lopez','2025-11-11 18:56:24',4,'2025-11-11 18:56:24',NULL,2,'',''),(9,'Ethan','White','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',3,NULL,'',''),(10,'Fiona','Green','2025-11-11 18:56:24',2,'2025-11-11 18:56:24',4,NULL,'',''),(11,'George','Adams','2025-11-11 18:56:24',3,'2025-11-11 18:56:24',NULL,3,'',''),(12,'Hannah','Nelson','2025-11-11 18:56:24',4,'2025-11-11 18:56:24',NULL,4,'',''),(13,'Ian','Baker','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',5,NULL,'',''),(14,'Julia','Carter','2025-11-11 18:56:24',2,'2025-11-11 18:56:24',6,NULL,'',''),(15,'Kevin','Mitchell','2025-11-11 18:56:24',3,'2025-11-11 18:56:24',NULL,5,'',''),(16,'Laura','Perez','2025-11-11 18:56:24',4,'2025-11-11 18:56:24',NULL,6,'',''),(17,'Mike','Roberts','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',7,NULL,'',''),(18,'Nina','Turner','2025-11-11 18:56:24',2,'2025-11-11 18:56:24',8,NULL,'',''),(19,'Oscar','Phillips','2025-11-11 18:56:24',3,'2025-11-11 18:56:24',NULL,7,'',''),(20,'Paula','Campbell','2025-11-11 18:56:24',4,'2025-11-11 18:56:24',NULL,8,'',''),(21,'Quinn','Parker','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',9,NULL,'',''),(22,'Rachel','Evans','2025-11-11 18:56:24',2,'2025-11-11 18:56:24',10,NULL,'',''),(23,'Sam','Edwards','2025-11-11 18:56:24',3,'2025-11-11 18:56:24',NULL,9,'',''),(24,'Tina','Collins','2025-11-11 18:56:24',4,'2025-11-11 18:56:24',NULL,10,'',''),(25,'Ulysses','Stewart','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',11,NULL,'',''),(26,'Vera','Morris','2025-11-11 18:56:24',2,'2025-11-11 18:56:24',12,NULL,'',''),(27,'Will','Murphy','2025-11-11 18:56:24',3,'2025-11-11 18:56:24',NULL,11,'',''),(28,'Xena','Cook','2025-11-11 18:56:24',4,'2025-11-11 18:56:24',NULL,12,'',''),(29,'Yuri','Rogers','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',13,NULL,'',''),(30,'Zoe','Reed','2025-11-11 18:56:24',2,'2025-11-11 18:56:24',14,NULL,'',''),(31,'Jack','Hunt','2025-11-11 18:56:24',4,'2025-11-11 18:56:24',NULL,18,'',''),(32,'Oliver','King','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',1,NULL,'',''),(33,'Emma','Scott','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',2,NULL,'',''),(34,'Noah','Reed','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',3,NULL,'',''),(35,'Ava','Murphy','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',4,NULL,'',''),(36,'Liam','Brooks','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',5,NULL,'',''),(37,'Sophia','Jenkins','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',6,NULL,'',''),(38,'Mason','Perez','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',7,NULL,'',''),(39,'Isabella','Long','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',8,NULL,'',''),(40,'Lucas','Cruz','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',9,NULL,'',''),(41,'Mia','Reynolds','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',10,NULL,'',''),(42,'Ethan','Bell','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',11,NULL,'',''),(43,'Harper','Cole','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',12,NULL,'',''),(44,'James','Woods','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',13,NULL,'',''),(45,'Amelia','Fisher','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',14,NULL,'',''),(46,'Benjamin','Warren','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',15,NULL,'',''),(47,'Evelyn','Hart','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',16,NULL,'',''),(48,'Logan','Santos','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',17,NULL,'',''),(49,'Abigail','Patterson','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',18,NULL,'',''),(50,'Caleb','Gomez','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',19,NULL,'',''),(51,'Ella','Morris','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',20,NULL,'',''),(52,'Oliver','Reyes','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',21,NULL,'',''),(53,'Scarlett','Hunt','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',22,NULL,'',''),(54,'Jacob','Wang','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',23,NULL,'',''),(55,'Luna','Flores','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',24,NULL,'',''),(56,'Daniel','Khan','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',25,NULL,'',''),(57,'Grace','Kim','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',26,NULL,'',''),(58,'Henry','Nguyen','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',27,NULL,'',''),(59,'Zoe','Park','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',28,NULL,'',''),(60,'Owen','Diaz','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',29,NULL,'',''),(61,'Addison','Foster','2025-11-11 18:56:24',1,'2025-11-11 18:56:24',30,NULL,'','');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`af25onalm1`@`localhost`*/ /*!50003 TRIGGER trg_users_insert
BEFORE INSERT ON user
FOR EACH ROW
BEGIN
    DECLARE base VARCHAR(50);
    DECLARE suffix INT DEFAULT 1;
    DECLARE final_userid VARCHAR(50);

    -- Generate base userid
    SET base = generate_base_userid(NEW.user_fname, NEW.user_lname);
    SET final_userid = base;

    -- Ensure uniqueness
    WHILE EXISTS (SELECT 1 FROM users WHERE system_userid = final_userid) DO
        SET final_userid = CONCAT(base, suffix);
        SET suffix = suffix + 1;
    END WHILE;

    -- Assign userid and campus email
    SET NEW.system_userid = final_userid;
    SET NEW.campus_email = CONCAT(final_userid, '@wsc.edu');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'af25onalm1_collegev4'
--

--
-- Dumping routines for database 'af25onalm1_collegev4'
--
/*!50003 DROP FUNCTION IF EXISTS `available_seats` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`af25onalm1`@`localhost` FUNCTION `available_seats`(in_section_id INT) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE room_cap INT DEFAULT 0;
    DECLARE enrolled INT DEFAULT 0;
    DECLARE avail INT DEFAULT 0;

    SELECT COALESCE(r.room_capacity, 0) INTO room_cap
    FROM section s
    LEFT JOIN room r ON r.room_id = s.room_id
    WHERE s.section_id = in_section_id
    LIMIT 1;

    SELECT COUNT(*) INTO enrolled
    FROM enrollment e
    WHERE e.section_id = in_section_id;

    SET avail = room_cap - COALESCE(enrolled,0);
    IF avail < 0 THEN SET avail = 0; END IF;
    RETURN avail;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `generate_base_userid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`af25onalm1`@`localhost` FUNCTION `generate_base_userid`(fname VARCHAR(50), lname VARCHAR(50)) RETURNS varchar(50) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
    DETERMINISTIC
BEGIN
    DECLARE base VARCHAR(50);

    -- Take first 2 letters of first name
    -- Take up to 5 letters of last name (or entire last name if shorter)
    SET base = LOWER(CONCAT(
        LEFT(fname, 2),
        LEFT(lname, LEAST(5, CHAR_LENGTH(lname)))
    ));

    RETURN base;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `assign_employee_to_department` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`af25onalm1`@`localhost` PROCEDURE `assign_employee_to_department`(
    IN in_employee_id INT,
    IN in_department_id INT
)
BEGIN
    DECLARE v_exists INT DEFAULT 0;

    START TRANSACTION;

    -- verify employee exists
    SELECT COUNT(*) INTO v_exists FROM employee WHERE employee_id = in_employee_id;
    IF v_exists = 0 THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Employee not found';
    END IF;

    -- verify department exists
    SELECT COUNT(*) INTO v_exists FROM department WHERE department_id = in_department_id;
    IF v_exists = 0 THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Department not found';
    END IF;

    -- perform assignment
    UPDATE department
    SET employee_id = in_employee_id
    WHERE department_id = in_department_id;

    SELECT department_id, department_name, employee_id
    FROM department
    WHERE department_id = in_department_id;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_enroll_student` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`af25onalm1`@`localhost` PROCEDURE `sp_enroll_student`(
  IN p_student_id INT,
  IN p_semester_id INT,
  IN p_audit_user_id INT,
  OUT p_enrollment_id INT
)
BEGIN
  DECLARE v_exists INT DEFAULT 0;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SET p_enrollment_id = -1;
  END;

  START TRANSACTION;

  IF p_student_id IS NULL OR p_student_id <= 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid student_id';
  END IF;

  IF p_semester_id IS NULL OR p_semester_id <= 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid semester_id';
  END IF;

  IF p_audit_user_id IS NULL OR p_audit_user_id <= 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid audit_user_id';
  END IF;

  SELECT COUNT(*) INTO v_exists FROM af25nathm1_collegev3.student WHERE student_id = p_student_id;
  IF v_exists = 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Student not found';
  END IF;

  SELECT COUNT(*) INTO v_exists FROM af25nathm1_collegev3.semester WHERE semester_id = p_semester_id;
  IF v_exists = 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Semester not found';
  END IF;

  SELECT COUNT(*) INTO v_exists
  FROM af25nathm1_collegev3.enrollment
  WHERE student_student_id = p_student_id AND semester_id = p_semester_id;
  IF v_exists > 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Student already enrolled for this semester';
  END IF;

  INSERT INTO af25nathm1_collegev3.enrollment
    (enrollment_status, audit_user_id, student_student_id, semester_id, lookup_grade_id)
  VALUES
    ('Active', p_audit_user_id, p_student_id, p_semester_id, NULL);

  SET p_enrollment_id = LAST_INSERT_ID();

  COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-02 13:50:22
