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
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `id` int NOT NULL AUTO_INCREMENT,
  `country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Afghanistan'),(2,'Aland Islands'),(3,'Albania'),(4,'Algeria'),(5,'American Samoa'),(6,'Andorra'),(7,'Angola'),(8,'Anguilla'),(9,'Antarctica'),(10,'Antigua and Barbuda'),(11,'Argentina'),(12,'Armenia'),(13,'Aruba'),(14,'Australia'),(15,'Austria'),(16,'Azerbaijan'),(17,'Bahamas'),(18,'Bahrain'),(19,'Bangladesh'),(20,'Barbados'),(21,'Belarus'),(22,'Belgium'),(23,'Belize'),(24,'Benin'),(25,'Bermuda'),(26,'Bhutan'),(27,'Bolivia'),(28,'Bonaire, Sint Eustatius and Saba'),(29,'Bosnia and Herzegovina'),(30,'Botswana'),(31,'Bouvet Island'),(32,'Brazil'),(33,'British Indian Ocean Territory'),(34,'Brunei Darussalam'),(35,'Bulgaria'),(36,'Burkina Faso'),(37,'Burundi'),(38,'Cambodia'),(39,'Cameroon'),(40,'Canada'),(41,'Cape Verde'),(42,'Cayman Islands'),(43,'Central African Republic'),(44,'Chad'),(45,'Chile'),(46,'China'),(47,'Christmas Island'),(48,'Cocos (Keeling) Islands'),(49,'Colombia'),(50,'Comoros'),(51,'Congo'),(52,'Congo, Democratic Republic of the Congo'),(53,'Cook Islands'),(54,'Costa Rica'),(55,'Cote D\'Ivoire'),(56,'Croatia'),(57,'Cuba'),(58,'Curacao'),(59,'Cyprus'),(60,'Czech Republic'),(61,'Denmark'),(62,'Djibouti'),(63,'Dominica'),(64,'Dominican Republic'),(65,'Ecuador'),(66,'Egypt'),(67,'El Salvador'),(68,'Equatorial Guinea'),(69,'Eritrea'),(70,'Estonia'),(71,'Ethiopia'),(72,'Falkland Islands (Malvinas)'),(73,'Faroe Islands'),(74,'Fiji'),(75,'Finland'),(76,'France'),(77,'French Guiana'),(78,'French Polynesia'),(79,'French Southern Territories'),(80,'Gabon'),(81,'Gambia'),(82,'Georgia'),(83,'Germany'),(84,'Ghana'),(85,'Gibraltar'),(86,'Greece'),(87,'Greenland'),(88,'Grenada'),(89,'Guadeloupe'),(90,'Guam'),(91,'Guatemala'),(92,'Guernsey'),(93,'Guinea'),(94,'Guinea-Bissau'),(95,'Guyana'),(96,'Haiti'),(97,'Heard Island and Mcdonald Islands'),(98,'Holy See (Vatican City State)'),(99,'Honduras'),(100,'Hong Kong'),(101,'Hungary'),(102,'Iceland'),(103,'India'),(104,'Indonesia'),(105,'Iran, Islamic Republic of'),(106,'Iraq'),(107,'Ireland'),(108,'Isle of Man'),(109,'Israel'),(110,'Italy'),(111,'Jamaica'),(112,'Japan'),(113,'Jersey'),(114,'Jordan'),(115,'Kazakhstan'),(116,'Kenya'),(117,'Kiribati'),(118,'Korea, Democratic People\'s Republic of'),(119,'Korea, Republic of'),(120,'Kosovo'),(121,'Kuwait'),(122,'Kyrgyzstan'),(123,'Lao People\'s Democratic Republic'),(124,'Latvia'),(125,'Lebanon'),(126,'Lesotho'),(127,'Liberia'),(128,'Libyan Arab Jamahiriya'),(129,'Liechtenstein'),(130,'Lithuania'),(131,'Luxembourg'),(132,'Macao'),(133,'Macedonia, the Former Yugoslav Republic of'),(134,'Madagascar'),(135,'Malawi'),(136,'Malaysia'),(137,'Maldives'),(138,'Mali'),(139,'Malta'),(140,'Marshall Islands'),(141,'Martinique'),(142,'Mauritania'),(143,'Mauritius'),(144,'Mayotte'),(145,'Mexico'),(146,'Micronesia, Federated States of'),(147,'Moldova, Republic of'),(148,'Monaco'),(149,'Mongolia'),(150,'Montenegro'),(151,'Montserrat'),(152,'Morocco'),(153,'Mozambique'),(154,'Myanmar'),(155,'Namibia'),(156,'Nauru'),(157,'Nepal'),(158,'Netherlands'),(159,'Netherlands Antilles'),(160,'New Caledonia'),(161,'New Zealand'),(162,'Nicaragua'),(163,'Niger'),(164,'Nigeria'),(165,'Niue'),(166,'Norfolk Island'),(167,'Northern Mariana Islands'),(168,'Norway'),(169,'Oman'),(170,'Pakistan'),(171,'Palau'),(172,'Palestinian Territory, Occupied'),(173,'Panama'),(174,'Papua New Guinea'),(175,'Paraguay'),(176,'Peru'),(177,'Philippines'),(178,'Pitcairn'),(179,'Poland'),(180,'Portugal'),(181,'Puerto Rico'),(182,'Qatar'),(183,'Reunion'),(184,'Romania'),(185,'Russian Federation'),(186,'Rwanda'),(187,'Saint Barthelemy'),(188,'Saint Helena'),(189,'Saint Kitts and Nevis'),(190,'Saint Lucia'),(191,'Saint Martin'),(192,'Saint Pierre and Miquelon'),(193,'Saint Vincent and the Grenadines'),(194,'Samoa'),(195,'San Marino'),(196,'Sao Tome and Principe'),(197,'Saudi Arabia'),(198,'Senegal'),(199,'Serbia'),(200,'Serbia and Montenegro'),(201,'Seychelles'),(202,'Sierra Leone'),(203,'Singapore'),(204,'Sint Maarten'),(205,'Slovakia'),(206,'Slovenia'),(207,'Solomon Islands'),(208,'Somalia'),(209,'South Africa'),(210,'South Georgia and the South Sandwich Islands'),(211,'South Sudan'),(212,'Spain'),(213,'Sri Lanka'),(214,'Sudan'),(215,'Suriname'),(216,'Svalbard and Jan Mayen'),(217,'Swaziland'),(218,'Sweden'),(219,'Switzerland'),(220,'Syrian Arab Republic'),(221,'Taiwan, Province of China'),(222,'Tajikistan'),(223,'Tanzania, United Republic of'),(224,'Thailand'),(225,'Timor-Leste'),(226,'Togo'),(227,'Tokelau'),(228,'Tonga'),(229,'Trinidad and Tobago'),(230,'Tunisia'),(231,'Turkey'),(232,'Turkmenistan'),(233,'Turks and Caicos Islands'),(234,'Tuvalu'),(235,'Uganda'),(236,'Ukraine'),(237,'United Arab Emirates'),(238,'United Kingdom'),(239,'United States'),(240,'United States Minor Outlying Islands'),(241,'Uruguay'),(242,'Uzbekistan'),(243,'Vanuatu'),(244,'Venezuela'),(245,'Viet Nam'),(246,'Virgin Islands, British'),(247,'Virgin Islands, U.s.'),(248,'Wallis and Futuna'),(249,'Western Sahara'),(250,'Yemen'),(251,'Zambia'),(252,'Zimbabwe');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-07 20:25:55
