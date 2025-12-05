CREATE DATABASE  IF NOT EXISTS `af25nathm1_collegev4` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `af25nathm1_collegev4`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: af25nathm1_collegev4
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES (1,'Engineering Hall',101,60),(2,'Science Building',102,50),(3,'Liberal Arts',103,40),(4,'Technology Center',104,70),(5,'Administration',105,30);
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
  `course_credits` int(11) DEFAULT NULL,
  `course_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `audit_user_id` int(11) NOT NULL DEFAULT 1,
  `course_audited` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`course_id`),
  KEY `course_name` (`course_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'Introduction to Computer Science',3,'2025-11-11 10:00:00',1,'2025-11-11 10:00:00'),(2,'Data Structures',3,'2025-11-11 10:01:00',1,'2025-11-11 10:01:00'),(3,'Algorithms',4,'2025-11-11 10:02:00',1,'2025-11-11 10:02:00'),(4,'Database Design',3,'2025-11-11 10:03:00',1,'2025-11-11 10:03:00'),(5,'Calculus I',4,'2025-11-11 10:04:00',1,'2025-11-11 10:04:00'),(6,'Linear Algebra',3,'2025-11-11 10:05:00',1,'2025-11-11 10:05:00'),(7,'Physics I',4,'2025-11-11 10:06:00',1,'2025-11-11 10:06:00'),(8,'Philosophy 101',3,'2025-11-11 10:07:00',1,'2025-11-11 10:07:00'),(9,'Literature Survey',3,'2025-11-11 10:08:00',1,'2025-11-11 10:08:00'),(10,'World History',3,'2025-11-11 10:09:00',1,'2025-11-11 10:09:00');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_audit`
--

DROP TABLE IF EXISTS `course_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_audit` (
  `course_audit_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `action` varchar(50) DEFAULT NULL,
  `old_course_name` varchar(255) DEFAULT NULL,
  `new_course_name` varchar(255) DEFAULT NULL,
  `old_course_credit_hours` int(11) DEFAULT NULL,
  `new_course_credit_hours` int(11) DEFAULT NULL,
  `changed_by` varchar(50) NOT NULL,
  `changed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`course_audit_id`),
  KEY `fk_course_audit_course_idx` (`course_id`),
  KEY `idx_course_audit_changed_at` (`changed_at`),
  CONSTRAINT `fk_course_audit_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_audit`
--

LOCK TABLES `course_audit` WRITE;
/*!40000 ALTER TABLE `course_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_audit` ENABLE KEYS */;
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
  PRIMARY KEY (`department_id`,`course_id`),
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
INSERT INTO `course_has_department` VALUES (1,1),(1,2),(1,3),(1,4),(2,5),(2,6),(3,7),(4,8),(4,9),(4,10);
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
  `department_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `audit_user_id` int(11) NOT NULL DEFAULT 1,
  `department_audited` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`department_id`),
  KEY `fk_department_employee1_idx` (`employee_id`),
  CONSTRAINT `fk_department_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Computer Science','2025-11-11 10:00:00',1,'2025-11-11 10:00:00',1),(2,'Mathematics','2025-11-11 10:01:00',1,'2025-11-11 10:01:00',3),(3,'Physics','2025-11-11 10:02:00',1,'2025-11-11 10:02:00',7),(4,'Liberal Arts','2025-11-11 10:03:00',1,'2025-11-11 10:03:00',10);
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
  `employee_hire_date` date DEFAULT NULL,
  `employee_termination_date` date DEFAULT NULL,
  `employee_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `audit_user_id` int(11) NOT NULL DEFAULT 1,
  `employee_audited` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `lookup_employee_role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `fk_employee_lookup_employee_role1_idx` (`lookup_employee_role_id`),
  CONSTRAINT `fk_employee_lookup_employee_role1` FOREIGN KEY (`lookup_employee_role_id`) REFERENCES `lookup_employee_role` (`lookup_employee_role_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'2018-08-15',NULL,'2025-11-11 10:00:00',1,'2025-11-11 10:00:00',1),(2,'2019-01-10',NULL,'2025-11-11 10:01:00',1,'2025-11-11 10:01:00',1),(3,'2020-06-01',NULL,'2025-11-11 10:02:00',1,'2025-11-11 10:02:00',2),(4,'2021-02-15',NULL,'2025-11-11 10:03:00',1,'2025-11-11 10:03:00',2),(5,'2022-08-20',NULL,'2025-11-11 10:04:00',1,'2025-11-11 10:04:00',3),(6,'2022-09-01',NULL,'2025-11-11 10:05:00',1,'2025-11-11 10:05:00',3),(7,'2023-01-10',NULL,'2025-11-11 10:06:00',1,'2025-11-11 10:06:00',1),(8,'2023-03-15',NULL,'2025-11-11 10:07:00',1,'2025-11-11 10:07:00',2),(9,'2023-08-01',NULL,'2025-11-11 10:08:00',1,'2025-11-11 10:08:00',3),(10,'2024-01-20',NULL,'2025-11-11 10:09:00',1,'2025-11-11 10:09:00',4);
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
  `enrolment_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `audit_user_id` varchar(50) DEFAULT substring_index(current_user(),'@',1),
  `enrollment_audited` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES (1,'Active','2025-11-11 10:00:00','root','2025-11-11 10:00:00',1,1,1,1),(2,'Active','2025-11-11 10:01:00','root','2025-11-11 10:01:00',2,1,2,2),(3,'Active','2025-11-11 10:02:00','root','2025-11-11 10:02:00',3,1,1,3),(4,'Active','2025-11-11 10:03:00','root','2025-11-11 10:03:00',4,1,3,4),(5,'Completed','2025-11-11 10:04:00','root','2025-11-11 10:04:00',5,1,2,5),(6,'Active','2025-11-11 10:05:00','root','2025-11-11 10:05:00',6,1,1,6),(7,'Withdrawn','2025-11-11 10:06:00','root','2025-11-11 10:06:00',7,1,NULL,7),(8,'Active','2025-11-11 10:07:00','root','2025-11-11 10:07:00',8,1,2,8),(9,'Active','2025-11-11 10:08:00','root','2025-11-11 10:08:00',9,1,1,9),(10,'Completed','2025-11-11 10:09:00','root','2025-11-11 10:09:00',10,1,3,10),(11,'Active','2025-11-11 10:10:00','root','2025-11-11 10:10:00',1,2,NULL,1),(12,'Active','2025-11-11 10:11:00','root','2025-11-11 10:11:00',2,2,2,2),(13,'Active','2025-11-11 10:12:00','root','2025-11-11 10:12:00',3,2,1,3),(14,'Active','2025-11-11 10:13:00','root','2025-11-11 10:13:00',4,2,2,4),(15,'Completed','2025-11-11 10:14:00','root','2025-11-11 10:14:00',5,2,3,5),(16,'Active','2025-11-11 10:15:00','root','2025-11-11 10:15:00',6,2,1,6),(17,'Active','2025-11-11 10:16:00','root','2025-11-11 10:16:00',7,2,2,7),(18,'Active','2025-11-11 10:17:00','root','2025-11-11 10:17:00',8,2,1,8),(19,'Completed','2025-11-11 10:18:00','root','2025-11-11 10:18:00',9,2,3,9),(20,'Active','2025-11-11 10:19:00','root','2025-11-11 10:19:00',10,2,2,10),(21,'Active','2025-11-11 10:20:00','root','2025-11-11 10:20:00',11,1,1,1),(22,'Active','2025-11-11 10:21:00','root','2025-11-11 10:21:00',12,1,2,2),(23,'Active','2025-11-11 10:22:00','root','2025-11-11 10:22:00',13,1,1,3),(24,'Active','2025-11-11 10:23:00','root','2025-11-11 10:23:00',14,2,2,4),(25,'Active','2025-11-11 10:24:00','root','2025-11-11 10:24:00',15,2,3,5);
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment_audit`
--

DROP TABLE IF EXISTS `enrollment_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollment_audit` (
  `enrollment_audit_id` int(11) NOT NULL AUTO_INCREMENT,
  `enrollment_id` int(11) NOT NULL,
  `action` varchar(50) DEFAULT NULL,
  `old_enrollment_status` varchar(255) DEFAULT NULL,
  `new_enrollment_status` varchar(255) DEFAULT NULL,
  `old_lookup_grade_id` int(11) DEFAULT NULL,
  `new_lookup_grade_id` int(11) DEFAULT NULL,
  `changed_by` varchar(50) NOT NULL,
  `changed_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`enrollment_audit_id`),
  KEY `fk_enrollment_audit_enrollment_idx` (`enrollment_id`),
  KEY `idx_audit_changed_at` (`changed_at`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment_audit`
--

LOCK TABLES `enrollment_audit` WRITE;
/*!40000 ALTER TABLE `enrollment_audit` DISABLE KEYS */;
INSERT INTO `enrollment_audit` VALUES (1,1,'INSERT',NULL,'Active',NULL,1,'root','2025-11-11 10:00:00'),(2,5,'INSERT',NULL,'Active',NULL,1,'root','2025-11-11 10:04:00'),(3,5,'UPDATE','Active','Completed',1,2,'root','2025-11-11 10:30:00'),(4,7,'INSERT',NULL,'Active',NULL,NULL,'root','2025-11-11 10:06:00'),(5,7,'UPDATE','Active','Withdrawn',NULL,NULL,'root','2025-11-11 10:35:00'),(6,10,'INSERT',NULL,'Active',NULL,1,'root','2025-11-11 10:09:00'),(7,10,'UPDATE','Active','Completed',1,3,'root','2025-11-11 10:40:00');
/*!40000 ALTER TABLE `enrollment_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment_backup`
--

DROP TABLE IF EXISTS `enrollment_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollment_backup` (
  `enrollment_id` int(11) NOT NULL AUTO_INCREMENT,
  `enrollment_status` varchar(255) DEFAULT '"Active"',
  `enrolment_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `audit_user_id` int(11) NOT NULL,
  `enrollment_audited` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `student_student_id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `lookup_grade_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`enrollment_id`),
  KEY `fk_enrollment_student1_idx` (`student_student_id`),
  KEY `fk_enrollment_semester1_idx` (`semester_id`),
  KEY `fk_enrollment_lookup_grade1_idx` (`lookup_grade_id`),
  KEY `idx_enrollment_section` (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment_backup`
--

LOCK TABLES `enrollment_backup` WRITE;
/*!40000 ALTER TABLE `enrollment_backup` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lookup_employee_role`
--

LOCK TABLES `lookup_employee_role` WRITE;
/*!40000 ALTER TABLE `lookup_employee_role` DISABLE KEYS */;
INSERT INTO `lookup_employee_role` VALUES (1,'Professor',3),(2,'Associate Professor',2),(3,'Teaching Assistant',1),(4,'Department Chair',4);
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
INSERT INTO `lookup_grade` VALUES (1,'A',4),(2,'B',3),(3,'C',2),(4,'D',1),(5,'F',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'Lab 101',40,'2025-11-11 10:00:00',1,'2025-11-11 10:00:00',1,1,1,1),(2,'Lecture 202',60,'2025-11-11 10:01:00',1,'2025-11-11 10:01:00',2,2,1,2),(3,'Lab 103',35,'2025-11-11 10:02:00',1,'2025-11-11 10:02:00',3,3,2,3),(4,'Seminar 204',25,'2025-11-11 10:03:00',1,'2025-11-11 10:03:00',4,4,3,4),(5,'Lecture 301',70,'2025-11-11 10:04:00',1,'2025-11-11 10:04:00',5,5,4,5),(6,'Lab 304',40,'2025-11-11 10:05:00',1,'2025-11-11 10:05:00',6,6,1,6),(7,'Discussion 205',30,'2025-11-11 10:06:00',1,'2025-11-11 10:06:00',7,7,2,7),(8,'Lecture 401',65,'2025-11-11 10:07:00',1,'2025-11-11 10:07:00',8,8,3,8),(9,'Lab 105',45,'2025-11-11 10:08:00',1,'2025-11-11 10:08:00',9,9,4,9),(10,'Seminar 206',20,'2025-11-11 10:09:00',1,'2025-11-11 10:09:00',10,10,1,10);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (1,'MWF','09:00-10:00','In-Person',1,1,1,1),(2,'TTh','10:00-11:30','Online',2,2,2,2),(3,'MWF','13:00-14:00','Hybrid',3,3,3,3),(4,'TTh','15:00-16:30','In-Person',4,4,4,4),(5,'MWF','11:00-12:00','In-Person',5,5,5,5),(6,'TTh','13:00-14:30','Online',6,6,6,6),(7,'MWF','14:00-15:00','Hybrid',7,7,7,7),(8,'TTh','09:00-10:30','In-Person',8,8,8,8),(9,'MWF','15:00-16:00','Online',9,9,9,9),(10,'TTh','11:00-12:30','Hybrid',10,10,10,10);
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
INSERT INTO `semester` VALUES (1,'Fall 2024',1),(2,'Spring 2025',1),(3,'Summer 2025',1);
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
  `student_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `audit_user_id` varchar(50) DEFAULT substring_index(current_user(),'@',1),
  `faculty_edited` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'2023-08-15',NULL,'2025-11-11 10:00:00','root','2025-11-11 10:00:00'),(2,'2023-09-01',NULL,'2025-11-11 10:01:00','root','2025-11-11 10:01:00'),(3,'2023-08-20',NULL,'2025-11-11 10:02:00','root','2025-11-11 10:02:00'),(4,'2024-01-15',NULL,'2025-11-11 10:03:00','root','2025-11-11 10:03:00'),(5,'2024-02-10',NULL,'2025-11-11 10:04:00','root','2025-11-11 10:04:00'),(6,'2024-08-15',NULL,'2025-11-11 10:05:00','root','2025-11-11 10:05:00'),(7,'2022-08-20','2025-05-20','2025-11-11 10:06:00','root','2025-11-11 10:06:00'),(8,'2023-01-10',NULL,'2025-11-11 10:07:00','root','2025-11-11 10:07:00'),(9,'2023-06-01',NULL,'2025-11-11 10:08:00','root','2025-11-11 10:08:00'),(10,'2024-03-20',NULL,'2025-11-11 10:09:00','root','2025-11-11 10:09:00'),(11,'2024-09-01',NULL,'2025-11-11 10:10:00','root','2025-11-11 10:10:00'),(12,'2023-10-15',NULL,'2025-11-11 10:11:00','root','2025-11-11 10:11:00'),(13,'2024-07-20',NULL,'2025-11-11 10:12:00','root','2025-11-11 10:12:00'),(14,'2023-12-01',NULL,'2025-11-11 10:13:00','root','2025-11-11 10:13:00'),(15,'2024-04-10',NULL,'2025-11-11 10:14:00','root','2025-11-11 10:14:00');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_audit`
--

DROP TABLE IF EXISTS `student_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_audit` (
  `student_audit_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `action` varchar(50) DEFAULT NULL,
  `old_admission_date` date DEFAULT NULL,
  `new_admission_date` date DEFAULT NULL,
  `old_graduation_date` date DEFAULT NULL,
  `new_graduation_date` date DEFAULT NULL,
  `changed_by` varchar(50) NOT NULL,
  `changed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`student_audit_id`),
  KEY `fk_student_audit_student_idx` (`student_id`),
  KEY `idx_student_audit_changed_at` (`changed_at`),
  CONSTRAINT `fk_student_audit_student` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_audit`
--

LOCK TABLES `student_audit` WRITE;
/*!40000 ALTER TABLE `student_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_audit` ENABLE KEYS */;
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
  `user_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `audit_id` varchar(50) DEFAULT substring_index(current_user(),'@',1),
  `user_audited` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `employee_employee_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `system_userid` varchar(50) DEFAULT NULL,
  `campus_email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_user_employee_idx` (`employee_employee_id`),
  KEY `first_name` (`user_fname`),
  KEY `last_name` (`user_lname`),
  KEY `fk_user_student1_idx` (`student_id`),
  CONSTRAINT `fk_user_employee` FOREIGN KEY (`employee_employee_id`) REFERENCES `employee` (`employee_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_user_student1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Dr. Robert','Smith','2025-11-11 10:00:00','root','2025-11-11 10:00:00',1,NULL,'drrobert','drrobert@wsc.edu'),(2,'Dr. Sarah','Johnson','2025-11-11 10:01:00','root','2025-11-11 10:01:00',2,NULL,'drsarah','drsarah@wsc.edu'),(3,'Prof. Michael','Brown','2025-11-11 10:02:00','root','2025-11-11 10:02:00',3,NULL,'profmich','profmich@wsc.edu'),(4,'Prof. Jennifer','Davis','2025-11-11 10:03:00','root','2025-11-11 10:03:00',4,NULL,'profjenn','profjenn@wsc.edu'),(5,'Mrs. Emily','Wilson','2025-11-11 10:04:00','root','2025-11-11 10:04:00',5,NULL,'mrsemily','mrsemily@wsc.edu'),(6,'Mr. James','Taylor','2025-11-11 10:05:00','root','2025-11-11 10:05:00',6,NULL,'mrjames','mrjames@wsc.edu'),(7,'Dr. Patricia','Anderson','2025-11-11 10:06:00','root','2025-11-11 10:06:00',7,NULL,'drpatric','drpatric@wsc.edu'),(8,'Prof. David','Thomas','2025-11-11 10:07:00','root','2025-11-11 10:07:00',8,NULL,'profdavi','profdavi@wsc.edu'),(9,'Mrs. Karen','Jackson','2025-11-11 10:08:00','root','2025-11-11 10:08:00',9,NULL,'mrskaren','mrskaren@wsc.edu'),(10,'Dr. Charles','White','2025-11-11 10:09:00','root','2025-11-11 10:09:00',10,NULL,'drcharl','drcharl@wsc.edu'),(11,'Alice','Martinez','2025-11-11 10:10:00','root','2025-11-11 10:10:00',NULL,1,'alicmart','alicmart@wsc.edu'),(12,'Bob','Garcia','2025-11-11 10:11:00','root','2025-11-11 10:11:00',NULL,2,'bobgarc','bobgarc@wsc.edu'),(13,'Carol','Rodriguez','2025-11-11 10:12:00','root','2025-11-11 10:12:00',NULL,3,'carolro','carolro@wsc.edu'),(14,'David','Lee','2025-11-11 10:13:00','root','2025-11-11 10:13:00',NULL,4,'davidle','davidle@wsc.edu'),(15,'Emma','Perez','2025-11-11 10:14:00','root','2025-11-11 10:14:00',NULL,5,'emmaper','emmaper@wsc.edu'),(16,'Frank','Hernandez','2025-11-11 10:15:00','root','2025-11-11 10:15:00',NULL,6,'frankhern','frankhern@wsc.edu'),(17,'Grace','Lopez','2025-11-11 10:16:00','root','2025-11-11 10:16:00',NULL,7,'gracelop','gracelop@wsc.edu'),(18,'Henry','Gonzalez','2025-11-11 10:17:00','root','2025-11-11 10:17:00',NULL,8,'henrygon','henrygon@wsc.edu'),(19,'Ivy','Wilson','2025-11-11 10:18:00','root','2025-11-11 10:18:00',NULL,9,'ivywilso','ivywilso@wsc.edu'),(20,'Jack','Anderson','2025-11-11 10:19:00','root','2025-11-11 10:19:00',NULL,10,'jackandr','jackandr@wsc.edu'),(21,'Karen','Thomas','2025-11-11 10:20:00','root','2025-11-11 10:20:00',NULL,11,'karentha','karentha@wsc.edu'),(22,'Leo','Taylor','2025-11-11 10:21:00','root','2025-11-11 10:21:00',NULL,12,'leotayl','leotayl@wsc.edu'),(23,'Maria','Moore','2025-11-11 10:22:00','root','2025-11-11 10:22:00',NULL,13,'mariamoo','mariamoo@wsc.edu'),(24,'Nathan','Jackson','2025-11-11 10:23:00','root','2025-11-11 10:23:00',NULL,14,'nathanja','nathanja@wsc.edu'),(25,'Olivia','White','2025-11-11 10:24:00','root','2025-11-11 10:24:00',NULL,15,'oliviaw','oliviaw@wsc.edu');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_audit`
--

DROP TABLE IF EXISTS `user_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_audit` (
  `user_audit_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `action` varchar(50) DEFAULT NULL,
  `old_fname` varchar(255) DEFAULT NULL,
  `new_fname` varchar(255) DEFAULT NULL,
  `old_lname` varchar(255) DEFAULT NULL,
  `new_lname` varchar(255) DEFAULT NULL,
  `old_system_userid` varchar(50) DEFAULT NULL,
  `new_system_userid` varchar(50) DEFAULT NULL,
  `old_campus_email` varchar(100) DEFAULT NULL,
  `new_campus_email` varchar(100) DEFAULT NULL,
  `changed_by` varchar(50) NOT NULL,
  `changed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`user_audit_id`),
  KEY `fk_user_audit_user_idx` (`user_id`),
  KEY `idx_user_audit_changed_at` (`changed_at`),
  CONSTRAINT `fk_user_audit_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_audit`
--

LOCK TABLES `user_audit` WRITE;
/*!40000 ALTER TABLE `user_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'af25nathm1_collegev4'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `truncate_course_audit_monthly` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb3 */ ;;
/*!50003 SET character_set_results = utf8mb3 */ ;;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = '+00:00' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`af25nathm1`@`localhost`*/ /*!50106 EVENT `truncate_course_audit_monthly` ON SCHEDULE EVERY 1 MONTH STARTS '2025-12-04 19:34:05' ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM `course_audit` WHERE `changed_at` < DATE_SUB(NOW(), INTERVAL 1 MONTH) */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `truncate_enrollment_audit_monthly` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = '+00:00' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`af25nathm1`@`localhost`*/ /*!50106 EVENT `truncate_enrollment_audit_monthly` ON SCHEDULE EVERY 1 MONTH STARTS '2025-12-05 21:30:08' ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM `enrollment_audit` WHERE `changed_at` < DATE_SUB(NOW(), INTERVAL 1 MONTH) */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `truncate_student_audit_monthly` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb3 */ ;;
/*!50003 SET character_set_results = utf8mb3 */ ;;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = '+00:00' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`af25nathm1`@`localhost`*/ /*!50106 EVENT `truncate_student_audit_monthly` ON SCHEDULE EVERY 1 MONTH STARTS '2025-12-04 19:34:05' ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM `student_audit` WHERE `changed_at` < DATE_SUB(NOW(), INTERVAL 1 MONTH) */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `truncate_user_audit_monthly` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb3 */ ;;
/*!50003 SET character_set_results = utf8mb3 */ ;;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = '+00:00' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`af25nathm1`@`localhost`*/ /*!50106 EVENT `truncate_user_audit_monthly` ON SCHEDULE EVERY 1 MONTH STARTS '2025-12-04 19:34:05' ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM `user_audit` WHERE `changed_at` < DATE_SUB(NOW(), INTERVAL 1 MONTH) */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'af25nathm1_collegev4'
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
CREATE DEFINER=`af25nathm1`@`localhost` FUNCTION `available_seats`(in_section_id INT) RETURNS int(11)
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
CREATE DEFINER=`af25nathm1`@`localhost` FUNCTION `generate_base_userid`(fname VARCHAR(50), lname VARCHAR(50)) RETURNS varchar(50) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
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
CREATE DEFINER=`af25nathm1`@`localhost` PROCEDURE `assign_employee_to_department`(
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
CREATE DEFINER=`af25nathm1`@`localhost` PROCEDURE `sp_enroll_student`(
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_log_enrollment_audit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`af25nathm1`@`localhost` PROCEDURE `sp_log_enrollment_audit`(
    IN p_enrollment_id INT,
    IN p_action VARCHAR(50),
    IN p_old_status VARCHAR(255),
    IN p_new_status VARCHAR(255),
    IN p_old_grade_id INT,
    IN p_new_grade_id INT,
    IN p_changed_by VARCHAR(50)
)
BEGIN
    INSERT INTO `enrollment_audit` (
        enrollment_id, action, 
        old_enrollment_status, new_enrollment_status,
        old_lookup_grade_id, new_lookup_grade_id, 
        changed_by, changed_at
    ) VALUES (
        p_enrollment_id, p_action,
        p_old_status, p_new_status,
        p_old_grade_id, p_new_grade_id,
        p_changed_by, NOW()
    );
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

-- Dump completed on 2025-12-05 15:55:04
