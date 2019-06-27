-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: sql7.freesqldatabase.com    Database: sql7296840
-- ------------------------------------------------------
-- Server version	5.5.58-0ubuntu0.14.04.1

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
-- Table structure for table `Cuisine`
--

DROP TABLE IF EXISTS `Cuisine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cuisine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `definition` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cuisine`
--

LOCK TABLES `Cuisine` WRITE;
/*!40000 ALTER TABLE `Cuisine` DISABLE KEYS */;
INSERT INTO `Cuisine` VALUES (1,'Italian'),(2,'Turkish'),(3,'Indian'),(4,'Thai'),(5,'Mexican'),(6,'Chinese'),(7,'Greek'),(8,'Japanese'),(9,'French'),(10,'Arab'),(11,'Polish'),(12,'Burgers'),(13,'German'),(14,'UK'),(15,'Spanish'),(16,'Russian'),(17,'Jewish'),(18,'Georgian'),(19,'American'),(20,'Argentina'),(21,'Anything');
/*!40000 ALTER TABLE `Cuisine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Interest`
--

DROP TABLE IF EXISTS `Interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Interest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `definition` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Interest`
--

LOCK TABLES `Interest` WRITE;
/*!40000 ALTER TABLE `Interest` DISABLE KEYS */;
INSERT INTO `Interest` VALUES (1,'3D printing'),(2,'Acrobatics'),(3,'Acting'),(4,'Amateur radio'),(5,'Animation'),(6,'Aquascaping'),(7,'Baking'),(8,'Baton twirling'),(9,'Beatboxing'),(10,'Blogging'),(11,'Building'),(12,'Board/tabletop games'),(13,'Book discussion clubs'),(14,'Book restoration'),(15,'Bowling'),(16,'Brazilian jiu-jitsu'),(17,'Breadmaking'),(18,'Cabaret'),(19,'Calligraphy'),(20,'Candle making'),(21,'Car fixing & building'),(22,'Card games'),(23,'Cheesemaking'),(24,'Clothesmaking'),(25,'Coffee roasting'),(26,'Collecting'),(27,'Coloring'),(28,'Computer programming'),(29,'Confectionery'),(30,'Cooking'),(31,'Cosplaying'),(32,'Couponing'),(33,'Craft'),(34,'Creative writing'),(35,'Crocheting'),(36,'Cross-stitch'),(37,'Crossword puzzles'),(38,'Cryptography'),(39,'Cue sports'),(40,'Dance'),(41,'Diary writing'),(42,'Digital arts'),(43,'Distro Hopping'),(44,'Do it yourself'),(45,'Drama'),(46,'Drawing'),(47,'Drink mixing'),(48,'Electronics'),(49,'Embroidery'),(50,'Experimenting'),(51,'Fantasy sports'),(52,'Fashion'),(53,'Fashion design'),(54,'Fishkeeping'),(55,'Flower arranging'),(56,'Foreign language learning'),(57,'Furniture building'),(58,'Gaming (tabletop games and role-playing games)'),(59,'Genealogy'),(60,'Gingerbread house making'),(61,'Glassblowing'),(62,'Graphic design'),(63,'Gunsmithing'),(64,'Herp keeping'),(65,'Home improvement'),(66,'Homebrewing'),(67,'Hula hooping'),(68,'Hydroponics'),(69,'Ice skating'),(70,'Jewelry making'),(71,'Jigsaw puzzles'),(72,'Juggling'),(73,'Karate'),(74,'Knife making'),(75,'Knitting'),(76,'Kombucha brewing'),(77,'Lace making'),(78,'Lapidary'),(79,'Leather crafting'),(80,'Lego building'),(81,'Lock picking'),(82,'Listening to music'),(83,'Machining'),(84,'Macrame'),(85,'Magic'),(86,'Makeup'),(87,'Meme Fact Checking'),(88,'Meme making'),(89,'Metalworking'),(90,'Model building'),(91,'Model engineering'),(92,'Needlepoint'),(93,'Origami'),(94,'Painting'),(95,'Pet adoption & fostering'),(96,'Philately'),(97,'Photography'),(98,'Pressed flower craft'),(99,'Playing musical instruments'),(100,'Poi'),(101,'Pottery'),(102,'Puzzles'),(103,'Quilling'),(104,'Quilting'),(105,'Quizzes'),(106,'Rail transport modeling'),(107,'Rapping'),(108,'Reading'),(109,'Refinishing'),(110,'Robot combat'),(111,'Scrapbooking'),(112,'Sculpting'),(113,'Sewing'),(114,'Shoemaking'),(115,'Singing'),(116,'Sketching'),(117,'Soapmaking'),(118,'Social media'),(119,'Stand-up comedy'),(120,'Table tennis'),(121,'Taxidermy'),(122,'Thrifting'),(123,'Video editing'),(124,'Video game developing'),(125,'Video gaming'),(126,'Watching movies'),(127,'Watching television'),(128,'Weaving'),(129,'Weight training'),(130,'Welding'),(131,'Whittling'),(132,'Wikipedia Editing'),(133,'Winemaking'),(134,'Wood carving'),(135,'Woodworking'),(136,'Worldbuilding'),(137,'Writing'),(138,'Yo-yoing'),(139,'Yoga'),(140,'Air sports'),(141,'Archery'),(142,'Astronomy'),(143,'Backpacking'),(144,'BASE jumping'),(145,'Baseball'),(146,'Basketball'),(147,'Beekeeping'),(148,'Bird watching'),(149,'Blacksmithing'),(150,'BMX'),(151,'Board sports'),(152,'Bodybuilding'),(153,'Butterfly watching'),(154,'Camping'),(155,'Canoeing'),(156,'Canyoning'),(157,'Composting'),(158,'Dowsing'),(159,'Driving'),(160,'Fishing'),(161,'Flag football'),(162,'Flower growing'),(163,'Flying'),(164,'Flying disc'),(165,'Foraging'),(166,'Freestyle football'),(167,'Gardening'),(168,'Geocaching'),(169,'Ghost hunting'),(170,'Gold prospecting'),(171,'Graffiti'),(172,'Handball'),(173,'Herbalism'),(174,'Herping'),(175,'High-power rocketry'),(176,'Hiking'),(177,'Hobby horsing'),(178,'Hooping'),(179,'Horseback riding'),(180,'Hunting'),(181,'Inline skating'),(182,'Jogging'),(183,'Kayaking'),(184,'Kite flying'),(185,'Kitesurfing'),(186,'LARPing'),(187,'Letterboxing'),(188,'Longboarding'),(189,'Martial arts'),(190,'Metal detecting'),(191,'Meteorology'),(192,'Motor sports'),(193,'Mountain biking'),(194,'Mountaineering'),(195,'Mushroom hunting/mycology'),(196,'Netball'),(197,'Nordic skating'),(198,'Orienteering'),(199,'Paintball'),(200,'Parkour'),(201,'Podcast hosting'),(202,'Polo'),(203,'Powerlifting'),(204,'Rafting'),(205,'Rappelling'),(206,'Road biking'),(207,'Rock climbing'),(208,'Roller skating'),(209,'Rugby'),(210,'Running'),(211,'Sailing'),(212,'Sand art'),(213,'Scouting'),(214,'Scuba diving'),(215,'Sculling or rowing'),(216,'Shooting'),(217,'Shopping'),(218,'Skateboarding'),(219,'Skiing'),(220,'Skimboarding'),(221,'Skydiving'),(222,'Slacklining'),(223,'Snowboarding'),(224,'Soccer'),(225,'Stone skipping'),(226,'Sun bathing'),(227,'Surfing'),(228,'Survivalism'),(229,'Swimming'),(230,'Taekwondo'),(231,'Tai chi'),(232,'Tennis'),(233,'Topiary'),(234,'Travel'),(235,'Urban exploration'),(236,'Vacation'),(237,'Vegetable farming'),(238,'Vehicle restoration'),(239,'Walking'),(240,'Water sports');
/*!40000 ALTER TABLE `Interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Meeting_History`
--

DROP TABLE IF EXISTS `Meeting_History`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Meeting_History` (
  `meeting_id` int(11) DEFAULT NULL,
  `request_id` int(11) NOT NULL,
  `request_date` date NOT NULL,
  `meeting_status` varchar(255) DEFAULT NULL,
  KEY `Meeting_History_fk0` (`request_id`),
  CONSTRAINT `Meeting_History_fk0` FOREIGN KEY (`request_id`) REFERENCES `User_Request` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Meeting_History`
--

LOCK TABLES `Meeting_History` WRITE;
/*!40000 ALTER TABLE `Meeting_History` DISABLE KEYS */;
/*!40000 ALTER TABLE `Meeting_History` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `bio` varchar(500) DEFAULT NULL,
  `frequency` varchar(100) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (12,'joe','krystian@ubs.com','Krystian','Roland','Abc','monthly',NULL),(13,'monia','monika@ubs.com','Monika','Zybel','Abc','monthly',NULL),(14,'kellind','kasia@ubs.com','Kasia','Holicka','Abc','weekly',NULL),(15,'pat','mariusz@ubs.com','Mariusz','Koral','Abc','monthly',NULL),(16,'karl','tomasz@ubs.com','Tomasz','Wielblad','Abc','weekly',NULL),(17,'agax','aleks@ubs.com','Aleks','Mika','Abc','monthly',NULL),(18,'jossi','ola@ubs.com','Ola','Kuc','Abc','monthly',NULL),(19,'fedal','krzysztof@ubs.com','Krzysztof','Olaf','Abc','weekly',NULL),(20,'mata','ania@ubs.com','Ania','Kamien','Abc','monthly',NULL),(21,'kozlo',NULL,'Karol','Kozlowski','just me','monthly',NULL);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Cuisine`
--

DROP TABLE IF EXISTS `User_Cuisine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Cuisine` (
  `user_id` int(11) NOT NULL,
  `cuisine_id` int(11) NOT NULL,
  KEY `User_Cuisine_fk0` (`user_id`),
  KEY `User_Cuisine_fk1` (`cuisine_id`),
  CONSTRAINT `User_Cuisine_fk1` FOREIGN KEY (`cuisine_id`) REFERENCES `Cuisine` (`id`),
  CONSTRAINT `User_Cuisine_fk0` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Cuisine`
--

LOCK TABLES `User_Cuisine` WRITE;
/*!40000 ALTER TABLE `User_Cuisine` DISABLE KEYS */;
INSERT INTO `User_Cuisine` VALUES (12,1),(12,3),(12,5),(12,14),(12,21),(13,7),(13,13),(13,15),(13,19),(13,2),(14,6),(14,9),(14,10),(14,13),(14,21),(15,1),(15,4),(15,15),(15,12),(15,21),(16,11),(16,13),(16,15),(16,12),(16,17),(17,3),(17,2),(17,15),(17,20),(17,19),(18,1),(18,2),(18,15),(18,14),(18,21),(19,1),(19,4),(19,5),(19,17),(19,18),(20,2),(20,3),(20,5),(20,10),(20,21);
/*!40000 ALTER TABLE `User_Cuisine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Interest`
--

DROP TABLE IF EXISTS `User_Interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Interest` (
  `user_id` int(11) NOT NULL,
  `interest_id` int(11) NOT NULL,
  KEY `User_Interest_fk0` (`user_id`),
  KEY `User_Interest_fk1` (`interest_id`),
  CONSTRAINT `User_Interest_fk1` FOREIGN KEY (`interest_id`) REFERENCES `Interest` (`id`),
  CONSTRAINT `User_Interest_fk0` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Interest`
--

LOCK TABLES `User_Interest` WRITE;
/*!40000 ALTER TABLE `User_Interest` DISABLE KEYS */;
INSERT INTO `User_Interest` VALUES (12,1),(12,5),(12,13),(12,109),(12,45),(13,19),(13,51),(13,43),(13,69),(14,155),(14,119),(14,151),(14,201),(14,34),(14,57),(15,44),(15,99),(15,199),(15,32),(15,23),(16,144),(16,179),(16,5),(16,35),(16,25),(17,44),(17,49),(17,79),(17,212),(17,123),(18,54),(18,65),(18,76),(18,87),(18,98),(19,56),(19,45),(19,34),(19,23),(19,92),(20,14),(20,59),(20,49),(20,72),(20,193);
/*!40000 ALTER TABLE `User_Interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Request`
--

DROP TABLE IF EXISTS `User_Request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `requested_time` enum('week','month') NOT NULL,
  `lunch_type` enum('pair','group') NOT NULL,
  `request_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `User_Request_fk0` (`user_id`),
  CONSTRAINT `User_Request_fk0` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Request`
--

LOCK TABLES `User_Request` WRITE;
/*!40000 ALTER TABLE `User_Request` DISABLE KEYS */;
INSERT INTO `User_Request` VALUES (1,12,'month','group','2019-06-27'),(2,13,'week','pair','2019-06-27'),(3,14,'month','group','2019-06-27'),(4,15,'month','group','2019-06-27'),(5,16,'week','group','2019-06-27'),(6,17,'week','pair','2019-06-27'),(7,18,'month','group','2019-06-27'),(8,19,'week','pair','2019-06-27'),(9,20,'month','group','2019-06-27');
/*!40000 ALTER TABLE `User_Request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sql7296840'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-27 21:45:59
