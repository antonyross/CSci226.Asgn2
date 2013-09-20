CREATE DATABASE  IF NOT EXISTS `assign.2` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `assign.2`;
-- MySQL dump 10.13  Distrib 5.6.11, for osx10.6 (i386)
--
-- Host: 127.0.0.1    Database: assign.2
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
-- Table structure for table `R1`
--

DROP TABLE IF EXISTS `R1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `R1` (
  `K` int(2) NOT NULL,
  `A` int(2) NOT NULL,
  `B` int(2) NOT NULL,
  `C` int(2) NOT NULL,
  PRIMARY KEY (`K`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `R1`
--

LOCK TABLES `R1` WRITE;
/*!40000 ALTER TABLE `R1` DISABLE KEYS */;
INSERT INTO `R1` VALUES (1,1,3,8),(2,1,3,7),(3,2,3,3),(4,2,0,6),(5,2,0,5);
/*!40000 ALTER TABLE `R1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `R2`
--

DROP TABLE IF EXISTS `R2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `R2` (
  `K` int(2) NOT NULL,
  `D` int(2) NOT NULL,
  `E` int(2) NOT NULL,
  PRIMARY KEY (`K`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `R2`
--

LOCK TABLES `R2` WRITE;
/*!40000 ALTER TABLE `R2` DISABLE KEYS */;
INSERT INTO `R2` VALUES (1,1,8),(2,1,7),(3,1,3),(4,1,6),(5,1,5);
/*!40000 ALTER TABLE `R2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `R3`
--

DROP TABLE IF EXISTS `R3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `R3` (
  `A` int(2) NOT NULL,
  `A1` int(2) NOT NULL,
  `A2` int(2) NOT NULL,
  `A3` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `R3`
--

LOCK TABLES `R3` WRITE;
/*!40000 ALTER TABLE `R3` DISABLE KEYS */;
INSERT INTO `R3` VALUES (2,4,6,8),(1,2,3,4),(1,2,3,4),(2,4,6,8),(2,4,6,8);
/*!40000 ALTER TABLE `R3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `R4`
--

DROP TABLE IF EXISTS `R4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `R4` (
  `B` int(2) NOT NULL,
  `B1` int(2) NOT NULL,
  `B2` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `R4`
--

LOCK TABLES `R4` WRITE;
/*!40000 ALTER TABLE `R4` DISABLE KEYS */;
INSERT INTO `R4` VALUES (0,0,0),(0,0,0),(3,9,27),(3,9,27),(3,9,27);
/*!40000 ALTER TABLE `R4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `R5`
--

DROP TABLE IF EXISTS `R5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `R5` (
  `C` int(2) NOT NULL,
  `C1` int(2) NOT NULL,
  `C2` int(2) NOT NULL,
  `C3` int(2) NOT NULL,
  `C4` int(2) NOT NULL,
  `C5` int(2) NOT NULL,
  PRIMARY KEY (`C`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `R5`
--

LOCK TABLES `R5` WRITE;
/*!40000 ALTER TABLE `R5` DISABLE KEYS */;
INSERT INTO `R5` VALUES (1,1,3,8,1,8),(2,1,3,7,1,7),(3,2,3,3,1,3),(4,2,0,6,1,6),(5,2,0,5,1,5);
/*!40000 ALTER TABLE `R5` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-09-19 22:48:04
