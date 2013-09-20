CREATE DATABASE  IF NOT EXISTS `extracredit` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `extracredit`;
-- MySQL dump 10.13  Distrib 5.6.11, for osx10.6 (i386)
--
-- Host: 127.0.0.1    Database: extracredit
-- ------------------------------------------------------
-- Server version	5.5.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Laptop`
--

DROP TABLE IF EXISTS `Laptop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Laptop` (
  `model` int(4) NOT NULL,
  `speed` float NOT NULL,
  `ram` int(4) NOT NULL,
  `hd` int(3) NOT NULL,
  `screen` float NOT NULL,
  `price` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Laptop`
--

LOCK TABLES `Laptop` WRITE;
/*!40000 ALTER TABLE `Laptop` DISABLE KEYS */;
INSERT INTO `Laptop` VALUES (2001,2,2048,240,20.1,3673),(2002,1.73,1024,80,17,949),(2003,1.8,512,60,15.4,549),(2004,2,512,60,13.3,1150),(2005,2.16,1024,120,17,2500),(2006,2,2048,80,15.4,1700),(2007,1.83,1024,120,13.3,1429),(2008,1.6,1024,100,15.4,900),(2009,1.6,512,80,14.1,680),(2010,2,2048,160,15.4,2300);
/*!40000 ALTER TABLE `Laptop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PC`
--

DROP TABLE IF EXISTS `PC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PC` (
  `model` int(4) NOT NULL,
  `speed` float NOT NULL,
  `ram` int(4) NOT NULL,
  `hd` int(3) NOT NULL,
  `price` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PC`
--

LOCK TABLES `PC` WRITE;
/*!40000 ALTER TABLE `PC` DISABLE KEYS */;
INSERT INTO `PC` VALUES (1001,2.66,1024,250,2114),(1002,2.1,512,250,995),(1003,1.42,512,80,478),(1004,2.8,1024,250,649),(1005,3.2,512,250,630),(1009,2,1024,250,650),(1010,2.8,2048,300,770),(1011,1.86,2048,160,959),(1012,2.8,1024,160,649),(1013,3.06,512,80,529),(1006,3.2,1024,320,1049),(1007,2.2,1024,200,510),(1008,2.2,2048,250,770);
/*!40000 ALTER TABLE `PC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Printer`
--

DROP TABLE IF EXISTS `Printer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Printer` (
  `model` int(4) NOT NULL,
  `color` enum('true','false') NOT NULL,
  `type` enum('ink-jet','laser') NOT NULL,
  `price` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Printer`
--

LOCK TABLES `Printer` WRITE;
/*!40000 ALTER TABLE `Printer` DISABLE KEYS */;
INSERT INTO `Printer` VALUES (3001,'true','ink-jet',99),(3002,'false','laser',239),(3003,'true','laser',899),(3004,'true','ink-jet',120),(3005,'false','laser',120),(3006,'true','ink-jet',100),(3007,'true','laser',200);
/*!40000 ALTER TABLE `Printer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product` (
  `maker` varchar(1) NOT NULL,
  `model` int(11) NOT NULL,
  `type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES ('A',1001,'pc'),('A',1002,'pc'),('A',1003,'pc'),('A',2004,'laptop'),('A',2005,'laptop'),('A',2006,'laptop'),('B',1004,'pc'),('B',1005,'pc'),('B',1006,'pc'),('B',2007,'laptop'),('C',1007,'pc'),('D',1008,'pc'),('D',1009,'pc'),('D',1010,'pc'),('D',3004,'printer'),('D',3005,'printer'),('E',1011,'pc'),('E',1012,'pc'),('E',1013,'pc'),('E',2001,'laptop'),('E',2002,'laptop'),('E',2003,'laptop'),('E',3001,'printer'),('E',3002,'printer'),('E',3003,'printer'),('F',2008,'laptop'),('F',2009,'laptop'),('G',2010,'laptop'),('H',3006,'printer'),('H',3007,'printer'),('A',1001,'pc'),('A',1002,'pc'),('A',1003,'pc'),('A',2004,'laptop'),('A',2005,'laptop'),('A',2006,'laptop'),('B',1004,'pc'),('B',1005,'pc'),('B',1006,'pc'),('B',2007,'laptop'),('C',1007,'pc'),('D',1008,'pc'),('D',1009,'pc'),('D',1010,'pc'),('D',3004,'printer'),('D',3005,'printer'),('E',1011,'pc'),('E',1012,'pc'),('E',1013,'pc'),('E',2001,'laptop'),('E',2002,'laptop'),('E',2003,'laptop'),('E',3001,'printer'),('E',3002,'printer'),('E',3003,'printer'),('F',2008,'laptop'),('F',2009,'laptop'),('G',2010,'laptop'),('H',3006,'printer'),('H',3007,'printer');
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-09-20  0:30:02
