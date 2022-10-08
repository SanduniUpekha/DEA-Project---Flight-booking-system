-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: flight_system
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES (1,'dhanu',1),(2,'session 1',1),(3,'session 2',0),(4,'session 3',0),(5,'session 5',0),(6,'Wf{nsiz%Imfszxmpf%wf{nsiz5=78',1),(7,'xioimkopximkqmfpxiimop%sj|xyfkk678',1),(8,'mjqqt%|twqi%mjqqt<:6',1),(9,'mjqqt%|twqi%mjqqt<:6',1),(10,'Wf{nsiz%Imfszxmpf%wf{nsiz<:6',1),(11,'sj|%xyfkk%yfxx<:6',1),(12,'Ljjymfs%ljjymfs<:6',1),(13,'sj|%xyfkk%7%xyfkk<:6',1),(14,'mjqqt%|twqi%mjqqt<:6',1),(15,'Mfxnsiz%Fszxmpf%mfxnsiz<:6',1),(16,'Rfwpxfi%Tyytxfi%Tyytxfi<:6',1),(17,'Wf{nsiz%Imfszxmpf%jv|jv',1),(18,'Wf{nsiz%Imfszxmpf%jv|jv',1),(19,'Wf{nsiz%Imfszxmpf%v|jv',1),(20,'Wf{nsiz%Imfszxmpf%v|jv',1),(21,'Wf{nsiz%Imfszxmpf%76v|j',1);
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-07 20:25:52
