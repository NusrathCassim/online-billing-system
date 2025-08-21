-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: pahan_edu_db
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
-- Table structure for table `bill_item`
--

DROP TABLE IF EXISTS `bill_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bill_id` int NOT NULL,
  `item_id` int NOT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `quantity` int NOT NULL,
  `unit_price` double NOT NULL,
  `total_price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_item`
--

LOCK TABLES `bill_item` WRITE;
/*!40000 ALTER TABLE `bill_item` DISABLE KEYS */;
INSERT INTO `bill_item` VALUES (1,1,1,'Atlas A4 Book CR 40 Pages',1,130,130),(2,1,4,'Color Pencils (12)',1,230,230),(3,2,2,'Atlas Chooty Blue Pen (2 Items)',2,65,130),(4,2,5,'Highlighter Pack (10 Colors)',2,600,1200),(5,3,6,'A4 Mathematic Book 200pgs',2,150,300),(6,3,2,'Atlas Chooty Blue Pen (2 Items)',1,65,65),(7,4,8,'Atlas A4 Book CR 400 Pages',2,540,1080),(8,4,9,'Crayon pack (20)',2,230,460),(9,4,5,'Highlighter Pack (10 Colors)',1,600,600),(10,5,6,'A4 Mathematic Book 200pgs',1,150,150),(11,5,9,'Crayon pack (20)',2,230,460),(12,5,10,'Table Lamp',2,540,1080),(13,6,1,'Atlas A4 Book CR 40 Pages',1,130,130),(14,6,2,'Atlas Chooty Blue Pen (2 Items)',2,65,130),(15,7,9,'Crayon pack (20)',2,230,460),(16,7,5,'Highlighter Pack (10 Colors)',1,600,600),(17,8,1,'Atlas A4 Book CR 40 Pages',1,150,150),(18,8,11,'Pencil Pack 10',2,240,480),(19,9,11,'Pencil Pack 10',2,240,480),(20,9,12,'Atlas A4 Book CR 60 Pages',3,40,120),(21,10,9,'Crayon pack (20)',2,230,460),(22,10,8,'Atlas A4 Book CR 400 Pages',2,540,1080);
/*!40000 ALTER TABLE `bill_item` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-21  9:28:40
