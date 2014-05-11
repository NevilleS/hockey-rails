-- MySQL dump 10.10
--
-- Host: localhost    Database: hockey_development
-- ------------------------------------------------------
-- Server version	5.0.27-community

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
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
CREATE TABLE `games` (
  `id` int(11) NOT NULL auto_increment,
  `away_id` int(11) default NULL,
  `away_team` varchar(255) default NULL,
  `away_score` int(11) default NULL,
  `home_id` int(11) default NULL,
  `home_team` varchar(255) default NULL,
  `home_score` int(11) default NULL,
  `played_on` date default NULL,
  `updated_on` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (1,1,'Toronto',2,2,'New Jersey',4,'2007-07-24','2007-07-26'),(2,1,'Calgary',6,2,'Edmonton',4,'2007-07-24','2007-07-26'),(3,1,'Vancouver',3,2,'San Jose',4,'2007-07-25','2007-07-26'),(4,1,'Vancouver',1,2,'San Jose',2,'2007-07-25','2007-07-26'),(5,1,'Vancouver',3,2,'San Jose',2,'2007-07-25','2007-07-26'),(6,2,'Ottawa',2,1,'Colorado',3,'2007-07-28','2007-07-28'),(7,2,'San Jose',4,1,'Pittsburgh',6,'2007-07-28','2007-07-28'),(8,2,'San Jose',6,1,'Pittsburgh',7,'2007-07-28','2007-07-28'),(9,2,'Nashville',1,1,'Dallas',2,'2007-07-29','2007-07-29'),(10,2,'Nashville',2,1,'Dallas',6,'2007-07-29','2007-07-29'),(11,1,'Columbus',3,2,'Toronto',1,'2007-07-30','2007-07-30'),(12,1,'Montreal',2,2,'Minnesota',3,'2007-07-30','2007-07-30'),(13,1,'Montreal',5,2,'Minnesota',0,'2007-07-30','2007-07-30'),(14,2,'Montreal',1,1,'Tampa Bay',3,'2007-08-03','2007-08-03'),(15,2,'Montreal',4,1,'Tampa Bay',3,'2007-08-03','2007-08-03'),(16,2,'New Jersey',3,1,'Ottawa',2,'2007-08-06','2007-08-06'),(17,2,'New Jersey',2,1,'Ottawa',13,'2007-08-06','2007-08-06'),(18,1,'Buffalo',2,2,'San Jose',4,'2007-08-07','2007-08-07'),(19,1,'Buffalo',4,2,'San Jose',3,'2007-08-07','2007-08-07'),(20,1,'Colorado',6,2,'Vancouver',2,'2007-08-08','2007-08-08'),(21,1,'Colorado',3,2,'San Jose',2,'2007-08-08','2007-08-08'),(22,2,'NY Rangers',2,1,'NY Islanders',8,'2007-08-09','2007-08-09'),(23,1,'Anaheim',5,2,'New Jersey',4,'2007-08-10','2007-08-10'),(24,2,'Anaheim',5,1,'Nashville',6,'2007-08-11','2007-08-11'),(25,2,'Anaheim',4,1,'Nashville',5,'2007-08-11','2007-08-11'),(26,2,'Anaheim',4,1,'Nashville',3,'2007-08-11','2007-08-11');
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_info`
--

DROP TABLE IF EXISTS `schema_info`;
CREATE TABLE `schema_info` (
  `version` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schema_info`
--

LOCK TABLES `schema_info` WRITE;
/*!40000 ALTER TABLE `schema_info` DISABLE KEYS */;
INSERT INTO `schema_info` VALUES (1);
/*!40000 ALTER TABLE `schema_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Neville'),(2,'Jeff');
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

-- Dump completed on 2007-08-12 17:45:55
