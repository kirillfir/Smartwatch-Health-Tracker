-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: healthtrackerdb
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity` (
  `ActivityID` int NOT NULL AUTO_INCREMENT,
  `Activity_name` varchar(100) NOT NULL,
  `Type` varchar(50) NOT NULL,
  PRIMARY KEY (`ActivityID`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (100,'Running','Cardio'),(101,'Walking','Cardio'),(102,'Swimming','Cardio'),(103,'Weight Lifting','Strength'),(104,'Sleeping','Rest');
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device` (
  `DeviceID` int NOT NULL AUTO_INCREMENT,
  `USERID` int NOT NULL,
  `Device_name` varchar(100) NOT NULL,
  `Device_type` varchar(50) NOT NULL,
  PRIMARY KEY (`DeviceID`),
  KEY `USERID` (`USERID`),
  CONSTRAINT `device_ibfk_1` FOREIGN KEY (`USERID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1016 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
INSERT INTO `device` VALUES (1010,1,'Fitbit Charge 5','Fitness Bracelet'),(1011,2,'Apple Watch Series 7','Smartwatch'),(1012,3,'Garmin Forerunner 245','Smartwatch');
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goal`
--

DROP TABLE IF EXISTS `goal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goal` (
  `GoalID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `Goal_Type` varchar(50) NOT NULL,
  `Goal_value` decimal(8,2) DEFAULT NULL,
  `Achieved` tinyint(1) NOT NULL DEFAULT '0',
  `Deadline_date` date DEFAULT NULL,
  PRIMARY KEY (`GoalID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `goal_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3013 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal`
--

LOCK TABLES `goal` WRITE;
/*!40000 ALTER TABLE `goal` DISABLE KEYS */;
INSERT INTO `goal` VALUES (3010,1,'Steps',10000.00,0,'2024-06-01'),(3011,2,'Sleep',8.00,1,'2024-05-10'),(3012,3,'Calories',500.00,0,NULL);
/*!40000 ALTER TABLE `goal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `healthstatistic`
--

DROP TABLE IF EXISTS `healthstatistic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `healthstatistic` (
  `HealthDataID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `DeviceID` int DEFAULT NULL,
  `GoalID` int DEFAULT NULL,
  `Date` date NOT NULL,
  `Sleep_hours` decimal(4,2) NOT NULL DEFAULT '0.00',
  `Calories_burned` decimal(6,2) DEFAULT NULL,
  `Distance` decimal(6,2) NOT NULL DEFAULT '0.00',
  `Blood_pressure` varchar(15) NOT NULL,
  `Oxygen_saturation` int DEFAULT NULL,
  `Steps` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`HealthDataID`),
  KEY `UserID` (`UserID`),
  KEY `DeviceID` (`DeviceID`),
  KEY `GoalID` (`GoalID`),
  CONSTRAINT `healthstatistic_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE,
  CONSTRAINT `healthstatistic_ibfk_2` FOREIGN KEY (`DeviceID`) REFERENCES `device` (`DeviceID`) ON DELETE SET NULL,
  CONSTRAINT `healthstatistic_ibfk_3` FOREIGN KEY (`GoalID`) REFERENCES `goal` (`GoalID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4019 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `healthstatistic`
--

LOCK TABLES `healthstatistic` WRITE;
/*!40000 ALTER TABLE `healthstatistic` DISABLE KEYS */;
INSERT INTO `healthstatistic` VALUES (4013,1,1010,3010,'2024-05-15',7.50,350.25,4.20,'120/80',97,10500),(4014,2,1011,3011,'2024-05-15',6.00,250.00,3.10,'125/85',95,8800),(4015,3,1012,3012,'2024-05-15',8.20,500.00,2.50,'130/90',98,12000),(4016,1,1010,3010,'2024-05-16',7.50,350.25,4.20,'110/88',97,7600),(4017,1,1010,3010,'2024-05-17',10.40,350.25,4.20,'110/88',97,15000),(4018,1,1010,3010,'2024-05-18',2.50,350.25,4.20,'110/88',97,2000);
/*!40000 ALTER TABLE `healthstatistic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(100) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Age` int NOT NULL,
  `Weight` decimal(5,2) NOT NULL,
  `Height` decimal(5,2) NOT NULL,
  `Phone_number` varchar(20) DEFAULT NULL,
  `Gender` char(1) NOT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'alice@example.com','Alice Johnson',28,65.50,170.00,'1234567890','F'),(2,'bob@example.com','Bob Smith',34,80.00,180.00,NULL,'M'),(3,'kirill@exampletheBEStstudent.com','Kirill Kuznetov',19,73.00,180.00,'89011091950','M');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_activity`
--

DROP TABLE IF EXISTS `user_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_activity` (
  `UserActivityID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `ActivityID` int NOT NULL,
  `Activity_date` date NOT NULL,
  `Duration_minutes` int NOT NULL,
  `Calories_burned` decimal(6,2) DEFAULT NULL,
  `Distance_km` decimal(6,2) DEFAULT NULL,
  `Intensity` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`UserActivityID`),
  KEY `UserID` (`UserID`),
  KEY `ActivityID` (`ActivityID`),
  CONSTRAINT `user_activity_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE,
  CONSTRAINT `user_activity_ibfk_2` FOREIGN KEY (`ActivityID`) REFERENCES `activity` (`ActivityID`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2014 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_activity`
--

LOCK TABLES `user_activity` WRITE;
/*!40000 ALTER TABLE `user_activity` DISABLE KEYS */;
INSERT INTO `user_activity` VALUES (2010,1,100,'2024-05-10',45,300.50,5.20,'High'),(2011,2,101,'2024-05-11',30,180.00,2.50,'Medium'),(2012,3,102,'2024-05-12',60,400.00,1.00,'Low'),(2013,2,102,'2024-05-11',30,180.00,2.50,'Medium');
/*!40000 ALTER TABLE `user_activity` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-19 21:07:46
