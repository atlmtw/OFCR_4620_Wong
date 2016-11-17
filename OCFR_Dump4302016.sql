CREATE DATABASE  IF NOT EXISTS `ocfr_katemasondavid` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ocfr_katemasondavid`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win32 (AMD64)
--
-- Host: localhost    Database: ocfr_katemasondavid
-- ------------------------------------------------------
-- Server version	5.7.11-log

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
-- Table structure for table `certification`
--

DROP TABLE IF EXISTS `certification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certification` (
  `cert_id` int(11) NOT NULL,
  `cert_name` varchar(45) DEFAULT NULL,
  `cert_sponsor` varchar(45) DEFAULT NULL,
  `cert_expiry_type` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`cert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certification`
--

LOCK TABLES `certification` WRITE;
/*!40000 ALTER TABLE `certification` DISABLE KEYS */;
INSERT INTO `certification` VALUES (107,'Firefighter I Academy','OCFR','99'),(108,'Firefighter I State of Georgia','GPSTC','2'),(109,'CPR for the Professional Rescuer','American Heart Assoc.','2'),(111,'Firefighter II','OCFR','2'),(112,'Fire Inspector','GPSTC','2'),(113,'EMT','Department of State Health Services','2'),(114,'Hazardous Material','GPSTC','2'),(115,'Fire Prevention','GPSTC','2'),(116,'Fire Apparatus Management','GPSTC','2'),(117,'Fire Technology','GPSTC','2'),(118,'Ambulance Driver\'s License','Georgia Department of Public Health','10'),(119,'Fire Investigation','GPSTC','4'),(120,'Fire Science','GPSTC','4'),(121,'Swift Water Rescue','GPSTC','4'),(122,'Auto Extrication','GPSTC','4'),(123,'Volunteer Firefighter','OCFR','4'),(124,'Confined Space','GPSTC','4'),(125,'Structural Collapse','GPSTC','4'),(126,'Rescue Technician','GPSTC','4'),(127,'Fire Instructor','GPSTC','4');
/*!40000 ALTER TABLE `certification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `person_id` int(11) NOT NULL,
  `person_fn` varchar(12) DEFAULT NULL,
  `person_ln` varchar(12) DEFAULT NULL,
  `person_position` varchar(25) DEFAULT NULL,
  `person_suffix` varchar(5) DEFAULT NULL,
  `person_gender` varchar(5) DEFAULT NULL,
  `person_st_addr` varchar(45) DEFAULT NULL,
  `person_city` varchar(12) DEFAULT NULL,
  `person_county` varchar(24) DEFAULT NULL,
  `person_state` varchar(5) DEFAULT NULL,
  `person_zip` int(11) NOT NULL,
  `person_w_phone` varchar(12) DEFAULT NULL,
  `person_m_phone` varchar(12) DEFAULT NULL,
  `email_address` varchar(25) DEFAULT NULL,
  `radio_num` int(11) NOT NULL,
  `station_num` int(11) NOT NULL,
  `person_active` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`person_id`),
  KEY `person_zip_index` (`person_zip`),
  KEY `radio_num_index` (`radio_num`),
  KEY `station_num_index` (`station_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (5449,'Lenny','Watkinsons','Station Chief','IV','Male','55 Fairview Ave.','Watkinsville','Oconee','GA',30677,'706-769-3975','706-548-7788','lwatkins@ocfr.com',944,8,'Y'),(5450,'Tonya','Pierce','Firefighter/EMT',NULL,'F','844 Linden Ct.','Watkinsville','Oconee','GA',30677,'706-769-3976','706-258-7744','tpierce@ocfr.com',257,8,'N'),(5451,'Dominique','Williams','Firefighter',NULL,'F','6455 Harrison Ave. Apt. 9A','Commerce','Jackson','GA',30529,'706-769-3977','706-654-5486','dwilliams@ocfr.com',422,8,'N'),(5452,'Shelley','Watson','Fire Chief',NULL,'F','11 River St.','Jefferson','Jackson','GA',30549,'706-769-3978','706-247-1477','swatson@ocfr.com',855,2,'Y'),(5453,'Nathan','Green','Sergeant','III','M','357 Victoria Ct.','Athens','Clarke','GA',30601,'706-769-3979','706-358-6548','ngreen@ocfr.com',714,4,'Y'),(5454,'Frances','Azer','Reserve Firefighter',NULL,'F','6574 Beechwood Dr.','Athens','Clarke','GA',30601,'706-769-3980','706-352-4488','fazer@ocfr.com',965,4,'N'),(5455,'Dorothy','Harrison','Firefighter',NULL,'F','2477 Morris St.','Jefferson','Jackson','GA',30549,'706-769-3981','706-955-4561','dharrison@ocfr.com',658,5,'N'),(5456,'Jim','White','Lieutenant',NULL,'M','9465 Clinton St.','Commerce','Jackson','GA',30529,'706-769-3982','706-156-4896','jwhite@ocfr.com',523,5,'Y'),(5457,'Menguan','Lieu','Driver Engineer',NULL,'F','3558 Laurel Dr. Apt. C3','Watkinsville','Oconee','GA',30677,'706-769-3983','706-255-9663','mlieu@ocfr.com',325,6,'Y'),(5458,'Mindy','Link','Firefighter',NULL,'F','938 Madison Ave.','Bethlehem','Barrow','GA',30620,'706-769-3984','678-147-2546','mlink@ocfr.com',477,6,'Y'),(5459,'John','Berry','Firefighter/EMT',NULL,'M','912 Brandywine Dr.','Monroe','Walton','GA',30655,'706-769-3985','678-236-6113','jberry@ocfr.com',411,6,'Y'),(5460,'Adam','Braswell','Firefighter',NULL,'M','6488 Hawthorn Lane','Monroe','Walton','GA',30655,'706-769-3986','770-844-6148','abraswell@ocfr.com',255,7,'Y'),(5461,'Mindy','Brown','Reserve Firefighter',NULL,'F','2555 Aspen Ct.','Athens','Clarke','GA',30601,'706-769-3987','706-544-9554','mbrown@ocfr.com',588,7,'N'),(5462,'Irvin','Gore','Firefighter',NULL,'M','6778 School Bend Rd.','Athens','Clarke','GA',30601,'706-769-3988','706-365-6441','igore@ocfr.com',951,7,'Y'),(5463,'Phu','Nguyen','Assistant Chief',NULL,'M','6445 Adams St.','Jefferson','Jackson','GA',30549,'706-769-3989','706-104-4811','pnguyen@ocfr.com',753,1,'Y'),(5464,'Sebrina','Ogle','Firefighter',NULL,'F','115 2nd St. W.','Maysville','Jackson','GA',30558,'706-769-3990','706-544-9663','sogle@ocfr.com',357,1,'Y'),(5465,'Isabella','Heydman','Firefighter',NULL,'F','64 Spring St.','Watkinsville','Oconee','GA',30677,'706-769-3991','706-788-2332','iheydman@ocfr.com',148,1,'Y'),(5466,'Kathy','Black','Firefighter',NULL,'F','9887 Summit Ave.','Watkinsville','Oconee','GA',30677,'706-769-3992','706-477-9588','kblack@ocfr.com',254,2,'N'),(5467,'Kenny','Hill','Captain','VI','M','745 Grant St.','Elder','Oconee','GA',30677,'706-769-3993','706-244-8566','khill@ocfr.com',566,2,'N'),(5468,'Jose','Vasquez','Driver Engineer',NULL,'M','9454 Summer St.','Watkinsville','Oconee','GA',30677,'706-769-3994','706-844-3232','jvasquez@ocfr.com',147,4,'Y'),(5469,'Mason','McMillan','Reserve Firefighter',NULL,'M','355 Cross Ave.','Athens','Clarke','GA',30601,'706-769-3995','706-477-6598','mmcmillan@ocfr.com',963,4,'Y'),(5470,'Elijah','Wooddall','Firefighter/EMT',NULL,'M','944 Bayberry Dr.','Athens','Clarke','GA',30601,'706-769-3996','706-322-6599','ewooddall@ocfr.com',566,4,'Y'),(5471,'Tammy','Bryson','Firefighter',NULL,'F','6445 Primrose Ln.','Bogart','Oconee','GA',30622,'706-769-3997','706-244-1533','tbryson@ocfr.com',744,3,'N'),(5472,'John','Fuller','Firefighter',NULL,'M','3447 Court St.','Winterville','Clarke','GA',30683,'706-769-3998','706-355-9844','jfuller@ocfr.com',588,6,'Y'),(5473,'Emily','Singh','Sergeant',NULL,'F','356 West Ave.','Bogart','Oconee','GA',30622,'706-769-3999','706-244-7411','esingh@ocfr.com',255,6,'Y'),(5474,'Lucille','Yarbrough','Lieutenant',NULL,'F','779 Devon Rd.','Athens','Clarke','GA',30601,'706-769-4000','706-366-5145','lyarbrough@ocfr.com',955,6,'Y'),(5475,'Rusty','Gilbert','Firefighter',NULL,'M','6448 Ridgetop Ln.','Nicholson','Jackson','GA',30565,'706-769-4001','706-355-9877','rgilbert@ocfr.com',488,7,'Y'),(5476,'Joel','Sparks','Reserve Firefighter',NULL,'M','322 Maple Ave.','Nicholson','Jackson','GA',30565,'706-769-4002','706-322-3228','jsparks@ocfr.com',577,7,'Y'),(5477,'Doris','Rogers','Firefighter/EMT',NULL,'F','6448 Magnolia Dr.','Danielsville','Jackson','GA',30633,'706-769-4003','706-635-4499','drogers@ocfr.com',201,8,'Y'),(5478,'Joanie','Ginn','Firefighter Recruit',NULL,'F','2447 Main St. E.','Bethlehem','Barrow','GA',30620,'706-769-4004','770-322-8552','jginn@ocfr.com',203,5,'N'),(5479,'Mark','Walsh','Firefighter Recruit','Jr.','M','888 Lantern Ln.','Commerce','Jackson','GA',30529,'706-769-4005','706-947-3225','mwalsh@ocfr.com',955,5,'Y'),(5480,'Josh','Akins','Firefigher/EMT',NULL,'M','441 Hartford Rd.','Watkinsville','Oconee','GA',30677,'706-769-4006','706-255-4554','jakins@ocfr.com',855,2,'Y'),(5481,'Colin','Ferrell','Firefighter',NULL,'M','688 Durham Rd.','Watkinsville','Oconee','GA',30677,'706-769-4007','706-955-3211','cferrell@ocfr.com',477,1,'Y'),(5482,'Tanisha','Allen','Firefigher',NULL,'F','3112 1st St. Unit 74','Commerce','Jackson','GA',30529,'706-769-4008','706-255-9558','tallen@ocfr.com',658,3,'Y'),(5483,'Lydia','Marshall','Firefighter',NULL,'F','699 Canal St.','Nicholson','Jackson','GA',30565,'706-769-4009','706-477-4778','lmarshall@ocfr.com',258,3,'Y'),(5484,'Katie','Reynolds','Firefighter Recruit',NULL,'F','744 Roberts Rd.','Arcade','Jackson','GA',30549,'706-769-4010','706-322-5252','kreynolds@ocfr.com',954,5,'N'),(5485,'David','Austin','Captain',NULL,'M','3255 Grove Ave.','Comer','Madison','GA',30629,'706-769-4011','706-244-8585','daustin@ocfr.com',358,6,'Y'),(5486,'Kevin','Blair','Station Chief',NULL,'M','6447 Division St.','Arnoldsville','Oglethorpe','GA',30619,'706-769-4012','706-321-5487','kblair@ocfr.com',687,4,'Y'),(5487,'James','Jones','Firefighter/EMT',NULL,'M','344 Peen St.','Athens','Clarke','GA',30601,'706-769-4013','706-944-8522','jjones@ocfr.com',114,4,'Y'),(5488,'Gabriela','Ciorciog','Firefighter',NULL,'F','85 Creek Rd. Apt. 9448','Athens','Clarke','GA',30601,'706-769-4014','706-418-8563','gciorciog@ocfr.com',258,8,'N'),(5489,'Sonny','Doby','Firefighter',NULL,'M','247 Laurel Ln.','Watkinsville','Oconee','GA',30677,'706-769-4015','706-344-8774','sdoby@ocfr.com',657,5,'N'),(5490,'Priscilla','Foy','Sergeant',NULL,'F','741 Mulberry Ln.','Winterville','Oconee','GA',30683,'706-769-4016','706-244-5142','pfoy@ocfr.com',955,5,'Y'),(5491,'Joshua','Hutchins','Firefighter Recruit',NULL,'M','55 Church St. S.','Commerce','Jackson','GA',30529,'706-769-4017','706-355-4477','jhutchins@ocfr.com',174,8,'Y'),(5492,'Naomi','Trammell','Firefigher/EMT',NULL,'F','3997 Pine St.','Jefferson','Jackson','GA',30549,'706-769-4018','706-133-4866','ntrammell@ocfr.com',185,4,'Y'),(5493,'Debbie','Schwabb','Firefighter',NULL,'F','774 Lantern Ln.','Bethlehem','Barrow','GA',30620,'706-769-4019','678-441-2522','dschwabb@ocfr.com',195,7,'Y'),(5494,'Hannah','Goldman','Lieutenant',NULL,'F','997 Cambridge Rd.','Winder','Barrow','GA',30680,'706-769-4020','770-877-3211','hgoldman@ocfr.com',135,7,'Y'),(5495,'Matthew','Anderson','Firefighter','III','M','35 Washington St. Apt. J9','Winder','Barrow','GA',30680,'706-769-4021','770-614-9883','manderson@ocfr.com',142,1,'N'),(5496,'Rosemary','Voutas','Firefighter',NULL,'F','500 Somerset Dr.','Arnoldsville','Oglethorpe','GA',30619,'706-769-4022','706-544-8552','rvoutas@ocfr.com',162,5,'Y'),(5497,'Chevonne','Vincent','Corporal',NULL,'F','9887 7th St. Apt. 85','Athens','Clarke','GA',30601,'706-769-4023','706-321-5444','cvincent@ocfr.com',175,5,'Y'),(5498,'Gino','Aaron','Firefighter/EMT',NULL,'M','900 Deer Park Ave. Apt. E3','Bogart','Oconee','GA',30622,'706-769-4024','706-744-9663','gaaron@ocfr.com',185,2,'N');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_certificate`
--

DROP TABLE IF EXISTS `person_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_certificate` (
  `person_certificate_id` int(11) NOT NULL AUTO_INCREMENT,
  `cert_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `cert_rec_date` date DEFAULT NULL,
  `cert_ren_date` date DEFAULT NULL,
  PRIMARY KEY (`person_certificate_id`,`person_id`),
  KEY `cert_id` (`cert_id`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `person_certificate_ibfk_1` FOREIGN KEY (`cert_id`) REFERENCES `certification` (`cert_id`),
  CONSTRAINT `person_certificate_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
  CONSTRAINT `person_certificate_ibfk_3` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_certificate`
--

LOCK TABLES `person_certificate` WRITE;
/*!40000 ALTER TABLE `person_certificate` DISABLE KEYS */;
INSERT INTO `person_certificate` VALUES (2,107,5450,'2014-07-22','2999-01-02'),(3,107,5451,'2013-01-15','2999-01-03'),(4,107,5452,'1981-06-18','2999-01-04'),(5,107,5453,'2004-06-16','2999-01-05'),(6,107,5454,'2014-04-30','2999-01-06'),(7,107,5455,'2012-09-08','2999-01-07'),(8,107,5456,'1997-05-08','2999-01-08'),(9,107,5457,'2015-06-24','2999-01-09'),(10,107,5458,'2012-11-30','2999-01-10'),(11,107,5459,'2013-12-09','2999-01-11'),(12,107,5460,'2012-07-26','2999-01-12'),(13,107,5461,'2014-05-08','2999-01-13'),(14,107,5462,'2014-07-22','2999-01-14'),(15,107,5463,'2003-01-15','2999-01-15'),(16,107,5464,'2015-06-18','2999-01-16'),(17,107,5465,'2013-06-16','2999-01-17'),(18,107,5466,'2014-04-30','2999-01-18'),(19,107,5467,'2000-09-08','2999-01-19'),(20,107,5468,'2011-05-08','2999-01-20'),(21,107,5469,'2015-06-24','2999-01-21'),(22,107,5470,'2012-11-30','2999-01-22'),(23,107,5471,'2013-12-09','2999-01-23'),(24,107,5472,'2012-07-26','2999-01-24'),(25,107,5473,'2001-05-08','2999-01-25'),(26,107,5474,'1998-07-22','2999-01-26'),(27,107,5475,'2013-01-15','2999-01-27'),(28,107,5476,'2015-06-18','2999-01-28'),(29,107,5477,'2013-06-16','2999-01-29'),(30,107,5478,'2014-04-30','2999-01-30'),(31,107,5479,'2012-09-08','2999-01-31'),(32,107,5480,'2011-05-08','2999-02-01'),(33,107,5481,'2015-06-24','2999-02-02'),(34,107,5482,'2012-11-30','2999-02-03'),(35,107,5483,'2013-12-09','2999-02-04'),(36,107,5484,'2012-07-26','2999-02-05'),(37,107,5485,'1992-09-08','2999-02-06'),(38,107,5486,'1990-07-22','2999-02-07'),(39,107,5487,'2013-04-15','2999-02-08'),(40,107,5488,'2015-06-18','2999-02-09'),(41,107,5489,'2013-06-16','2999-02-10'),(42,107,5490,'2004-04-30','2999-02-11'),(43,107,5491,'2012-09-29','2999-02-12'),(44,107,5492,'2011-05-08','2999-02-13'),(45,107,5493,'2013-06-24','2999-02-14'),(46,107,5494,'1995-11-08','2999-02-15'),(47,107,5495,'2013-12-29','2999-02-16'),(48,107,5496,'2012-11-26','2999-02-17'),(49,107,5497,'2004-09-08','2999-02-18'),(50,107,5498,'2014-03-22','2999-02-19'),(51,108,5468,'2014-08-07','2016-08-07'),(52,108,5458,'2015-06-24','2017-06-24'),(53,108,5467,'2014-11-02','2016-11-02'),(54,109,5482,'2015-12-09','2017-12-09'),(55,109,5460,'2015-09-26','2017-09-26'),(56,109,5451,'2014-04-30','2016-04-30'),(58,111,5463,'2016-01-08','2018-01-08'),(59,111,5490,'2016-03-26','2018-03-26'),(60,112,5481,'2015-07-26','2017-07-26'),(61,112,5480,'2014-05-08','2016-05-08'),(62,112,5488,'2014-07-22','2016-07-22'),(63,113,5455,'2015-06-18','2017-06-18'),(64,114,5466,'2012-11-30','2014-11-30'),(65,115,5453,'2013-12-09','2015-12-09'),(67,117,5478,'2015-06-18','2017-06-18'),(68,118,5470,'2013-06-16','2023-06-16'),(69,119,5495,'2014-04-30','2018-04-30'),(70,120,5493,'2013-01-15','2017-01-15'),(71,121,5496,'2015-06-18','2019-06-18'),(72,122,5484,'2013-06-16','2017-06-16'),(73,123,5469,'2014-04-30','2018-04-30'),(74,124,5476,'2012-09-08','2016-09-08'),(75,125,5452,'2012-01-15','2016-01-15'),(76,126,5459,'2015-06-27','2019-06-27'),(77,127,5497,'2013-06-16','2017-06-16'),(78,113,5454,'2014-04-15','2016-04-15'),(79,114,5491,'2012-09-28','2014-09-28'),(80,115,5492,'2016-01-12','2018-01-12'),(81,116,5472,'2015-06-18','2017-06-18'),(82,117,5483,'2013-06-30','2015-06-30'),(83,118,5494,'2014-04-30','2024-04-30'),(84,119,5475,'2012-09-08','2016-09-08'),(85,120,5473,'2013-04-15','2017-04-15'),(86,121,5457,'2015-06-18','2019-06-18'),(87,122,5489,'2013-06-16','2017-06-16'),(88,123,5485,'2013-01-15','2017-01-15'),(89,124,5487,'2015-09-18','2019-09-18'),(90,125,5461,'2013-04-16','2017-04-16'),(91,126,5479,'2013-03-25','2017-03-25'),(92,127,5471,'2015-09-28','2019-09-28'),(93,109,5450,'2013-01-26','2015-01-26'),(94,109,5462,'2013-04-15','2015-04-15'),(95,109,5486,'2015-06-18','2017-06-18'),(96,113,5465,'2013-06-16','2015-06-16'),(97,113,5456,'2013-12-29','2015-12-29'),(98,113,5464,'2012-11-26','2014-11-26'),(99,118,5477,'2014-09-08','2024-09-08'),(100,118,5474,'2014-03-22','2024-03-22'),(101,122,5451,'2016-04-29','2020-04-29'),(102,108,5449,'2016-04-29','2018-04-29'),(103,107,5449,'2016-04-29','2115-04-29'),(107,118,5480,'2016-04-29','2026-04-29'),(113,111,5449,'2016-04-30','2018-04-30');
/*!40000 ALTER TABLE `person_certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(3) NOT NULL,
  `username` varchar(12) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (437,'astephens','0a4346f806b28b3ce94905c3ac56fcd5ee2337d8613161696aba52eb0c3551cc'),(438,'owilson','88506a70a834009fc503db6480749b2ebc96b9c5deab3d1c7ddd802611c87642'),(452,'jennyk','4c22167332932e559f6d1ecf2d9766639a6b6445f5a1f98f230359900c5eb3c8'),(477,'proth5','58380162a660f4d095d76d5379238ede50ad62bf1da116bd40169b11e656a006');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-30  2:41:39
