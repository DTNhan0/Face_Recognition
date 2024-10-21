CREATE DATABASE  IF NOT EXISTS `face_recognitiondb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `face_recognitiondb`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: face_recognitiondb
-- ------------------------------------------------------
-- Server version	8.0.38

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
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `Ma_Lop` varchar(20) NOT NULL,
  `ID_Department` int NOT NULL,
  PRIMARY KEY (`Ma_Lop`),
  UNIQUE KEY `Ma_Lop_UNIQUE` (`Ma_Lop`),
  KEY `FK_ID_Department_idx` (`ID_Department`),
  CONSTRAINT `FK_ID_Department` FOREIGN KEY (`ID_Department`) REFERENCES `department` (`ID_Department`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES ('D30CQCN01-N',1),('D30CQCN02-N',1),('D30CQDT01-N',2),('D30CQDT02-N',2),('D30CQMK01-N',3),('D30CQMK02-N',3),('D30CQKT01-N',4),('D30CQKT02-N',4),('D30CQVT01-N',5),('D30CQVT02-N',5);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `ID_Department` int NOT NULL AUTO_INCREMENT,
  `Name_Department` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_Department`),
  UNIQUE KEY `ID_UNIQUE` (`ID_Department`),
  UNIQUE KEY `Name_UNIQUE` (`Name_Department`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Công nghệ thông tin'),(2,'Điện - điện tử'),(5,'Điện tử viễn thông'),(4,'Kế toán'),(3,'Marketing');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `MSSV` varchar(20) DEFAULT NULL,
  `URL` longtext NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `FK_MSSV_idx` (`MSSV`),
  CONSTRAINT `FK_MSSV` FOREIGN KEY (`MSSV`) REFERENCES `personal_info` (`MSSV`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_info`
--

DROP TABLE IF EXISTS `personal_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_info` (
  `MSSV` varchar(20) NOT NULL,
  `Ma_Lop` varchar(20) NOT NULL,
  `Username` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Sex` tinyint NOT NULL DEFAULT '1',
  `Dob` date DEFAULT NULL,
  `Address` longtext,
  `Phone` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`MSSV`),
  UNIQUE KEY `ID_UNIQUE` (`MSSV`),
  KEY `FK_Ma_Lop_idx` (`Ma_Lop`),
  CONSTRAINT `FK_Ma_Lop` FOREIGN KEY (`Ma_Lop`) REFERENCES `class` (`Ma_Lop`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_info`
--

LOCK TABLES `personal_info` WRITE;
/*!40000 ALTER TABLE `personal_info` DISABLE KEYS */;
INSERT INTO `personal_info` VALUES ('N30DCCN001','D30CQCN01-N','Angelina Jolie',0,'2030-06-04','45 Đường Nguyễn Huệ, Quận 1, TP. Hồ Chí Minh','01234567890'),('N30DCCN002','D30CQCN02-N','Brad Pitt',1,'2030-12-18','15 Lý Thường Kiệt, Hoàn Kiếm, Hà Nội','01234567891'),('N30DCDT001','D30CQDT01-N','Denzel Washington',1,'2030-12-28','23 Trần Phú, Hải Châu, Đà Nẵng','01234567892'),('N30DCDT002','D30CQDT02-N','Hugh Jackman',1,'2030-10-12','108 Pasteur, Phường 6, Quận 3, TP. Hồ Chí Minh','01234567893'),('N30DCKT001','D30CQKT01-N','Sandra Bullock',0,'2030-07-26','35 Lê Lợi, Phường 6, TP. Tuy Hòa, Phú Yên','01234567896'),('N30DCKT002','D30CQKT02-N','Scarlett Johansson',0,'2030-11-22','62 Nguyễn Văn Cừ, Quận 5, TP. Hồ Chí Minh','01234567897'),('N30DCMK001','D30CQMK01-N','Jennifer Lawrence',0,'2030-08-15','73 Cầu Giấy, Dịch Vọng, Hà Nội','01234567894'),('N30DCMK002','D30CQMK02-N','Johnny Depp',1,'2030-06-09','128 Trường Sa, Phường 19, Bình Thạnh, TP. Hồ Chí Minh','01234567895'),('N30DCVT001','D30CQVT01-N','Tom Cruise',1,'2030-07-03','40 Phạm Văn Đồng, Dương Kinh, Hải Phòng','01234567898'),('N30DCVT002','D30CQVT02-N','Will Smith',1,'2030-09-25','50 Bạch Đằng, Hải Châu, Đà Nẵng','01234567899');
/*!40000 ALTER TABLE `personal_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'face_recognitiondb'
--

--
-- Dumping routines for database 'face_recognitiondb'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetStudentInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetStudentInfo`(IN p_MSSV VARCHAR(20))
BEGIN
    SELECT 
        Username, 
        class.Ma_Lop, 
        department.Name_Department 
    FROM 
        personal_info
    JOIN 
        class ON personal_info.Ma_Lop = class.Ma_Lop
    JOIN 
        department ON class.ID_Department = department.ID_Department
    WHERE 
        personal_info.MSSV = p_MSSV;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Personal_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Personal_info`()
BEGIN
	SELECT * FROM personal_info;
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

-- Dump completed on 2024-10-22  0:23:52
