CREATE DATABASE  IF NOT EXISTS `joblight` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `joblight`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: joblight
-- ------------------------------------------------------
-- Server version	5.5.16

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
-- Temporary table structure for view `getjobs`
--

DROP TABLE IF EXISTS `getjobs`;
/*!50001 DROP VIEW IF EXISTS `getjobs`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `getjobs` (
  `idJobs` int(11),
  `scategory` varchar(100),
  `sTitle` varchar(255),
  `sShortDescription` varchar(255),
  `sFreeText` varchar(255),
  `sDescription` longtext,
  `sterm` varchar(100),
  `dtEnteredDate` date,
  `sSalaryText` varchar(100),
  `sMinSal` int(11),
  `EmployeeID` int(11),
  `termid` int(11),
  `sMaxSal` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `jobtorecruiter`
--

DROP TABLE IF EXISTS `jobtorecruiter`;
/*!50001 DROP VIEW IF EXISTS `jobtorecruiter`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `jobtorecruiter` (
  `idjobs` int(11),
  `empid` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tb_blockedrecs`
--

DROP TABLE IF EXISTS `tb_blockedrecs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_blockedrecs` (
  `idtb_blockedrecs` int(11) NOT NULL AUTO_INCREMENT,
  `idCandidates` int(11) DEFAULT NULL,
  `EmpID` int(11) DEFAULT NULL,
  PRIMARY KEY (`idtb_blockedrecs`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_blockedrecs`
--

LOCK TABLES `tb_blockedrecs` WRITE;
/*!40000 ALTER TABLE `tb_blockedrecs` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_blockedrecs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `jobpostedview`
--

DROP TABLE IF EXISTS `jobpostedview`;
/*!50001 DROP VIEW IF EXISTS `jobpostedview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `jobpostedview` (
  `idjobs` bigint(21),
  `empid` int(11),
  `dtentered` date
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `br_mainstart`
--

DROP TABLE IF EXISTS `br_mainstart`;
/*!50001 DROP VIEW IF EXISTS `br_mainstart`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `br_mainstart` (
  `termid` int(11),
  `sterm` varchar(100),
  `ctotals` bigint(21)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `aggregatedmpage`
--

DROP TABLE IF EXISTS `aggregatedmpage`;
/*!50001 DROP VIEW IF EXISTS `aggregatedmpage`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `aggregatedmpage` (
  `applicationvolume` bigint(21),
  `idJobs` int(11),
  `sTitle` varchar(255),
  `sShortDescription` varchar(255),
  `sFreeText` varchar(255),
  `sDescription` longtext,
  `dtEnteredDate` date,
  `sSalaryText` varchar(100),
  `sMinSal` int(11),
  `EmployeeID` int(11),
  `sMaxSal` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tb_cpanel`
--

DROP TABLE IF EXISTS `tb_cpanel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cpanel` (
  `idtb_cpanel` int(11) NOT NULL AUTO_INCREMENT,
  `kpiname` varchar(45) DEFAULT NULL,
  `kpivalue` int(11) DEFAULT NULL,
  PRIMARY KEY (`idtb_cpanel`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cpanel`
--

LOCK TABLES `tb_cpanel` WRITE;
/*!40000 ALTER TABLE `tb_cpanel` DISABLE KEYS */;
INSERT INTO `tb_cpanel` VALUES (1,'rss',0),(2,'googleads',0),(3,'multilanguage',0);
/*!40000 ALTER TABLE `tb_cpanel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `getapp`
--

DROP TABLE IF EXISTS `getapp`;
/*!50001 DROP VIEW IF EXISTS `getapp`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `getapp` (
  `idJobs` int(11),
  `sTitle` varchar(255),
  `sShortDescription` varchar(255),
  `sDescription` longtext,
  `completeurl` varchar(500),
  `dtEnteredDate` date,
  `sSalaryText` varchar(100),
  `sMinSal` int(11),
  `sMaxSal` int(11),
  `sRef` varchar(45),
  `sFreeText` varchar(255),
  `sJobstartdate` date,
  `sJobenddate` date,
  `idApplications` int(11),
  `liCandidateID` int(11),
  `dtEntered` date,
  `aFirstName` varchar(45),
  `aLastName` varchar(45),
  `aDateofbirth` date,
  `aProfileSummary` varchar(500),
  `documentID` int(11),
  `aApplicationEmail` varchar(255),
  `empid` int(11),
  `srecruitername` varchar(100)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `categorytoterm`
--

DROP TABLE IF EXISTS `categorytoterm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorytoterm` (
  `idCategorytoTerm` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Catid` int(11) DEFAULT NULL,
  `Termid` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCategorytoTerm`)
) ENGINE=MyISAM AUTO_INCREMENT=507 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorytoterm`
--

LOCK TABLES `categorytoterm` WRITE;
/*!40000 ALTER TABLE `categorytoterm` DISABLE KEYS */;
INSERT INTO `categorytoterm` VALUES (246,1002,3000),(247,1002,3001),(248,1002,3002),(249,1003,3003),(250,1003,3004),(251,1000,4001),(252,1000,4002),(253,1000,4003),(254,1000,4004),(255,1000,4005),(256,1000,4006),(257,1000,4007),(258,1000,4008),(259,1000,4009),(260,1000,4010),(261,1000,4011),(262,1000,4012),(263,1000,4013),(264,1000,4014),(265,1000,4015),(266,1000,4016),(267,1000,4017),(268,1000,4018),(269,1000,4019),(270,1000,4020),(271,1000,4021),(272,1000,4022),(273,1000,4023),(274,1000,4024),(275,1000,4025),(276,1000,4026),(277,1000,4027),(278,1000,4028),(279,1000,4029),(280,1000,4030),(281,1000,4031),(282,1000,4032),(283,1000,4033),(284,1000,4034),(285,1000,4035),(286,1000,4036),(287,1000,4037),(288,1000,4038),(289,1000,4039),(290,1000,4040),(291,1000,4041),(292,1000,4042),(293,1000,4043),(294,1000,4044),(295,1000,4045),(296,1000,4046),(297,1000,4047),(298,1000,4048),(299,1000,4049),(300,1000,4050),(301,1000,4051),(302,1000,4052),(303,1000,4053),(304,1000,4054),(305,1000,4055),(306,1000,4056),(307,1000,4057),(308,1000,4058),(309,1000,4059),(310,1000,4060),(311,1000,4061),(312,1000,4062),(313,1000,4063),(314,1000,4064),(315,1000,4065),(316,1000,4066),(317,1000,4067),(318,1000,4068),(319,1000,4069),(320,1000,4070),(321,1000,4071),(322,1000,4072),(323,1000,4073),(324,1000,4074),(325,1000,4075),(326,1000,4076),(327,1000,4077),(328,1000,4078),(329,1000,4079),(330,1000,4080),(331,1000,4081),(332,1000,4082),(333,1000,4083),(334,1000,4084),(335,1000,4085),(336,1000,4086),(337,1000,4087),(338,1000,4088),(339,1000,4089),(340,1000,4090),(341,1000,4091),(342,1000,4092),(343,1000,4093),(344,1000,4094),(345,1000,4095),(346,1000,4096),(347,1000,4097),(348,1000,4098),(349,1000,4099),(350,1000,4100),(351,1000,4101),(352,1000,4102),(353,1000,4103),(354,1000,4104),(355,1000,4105),(356,1000,4106),(357,1000,4107),(358,1000,4108),(359,1000,4109),(360,1000,4110),(361,1000,4111),(362,1000,4112),(363,1000,4113),(364,1000,4114),(365,1000,4115),(366,1000,4116),(367,1000,4117),(368,1000,4118),(369,1000,4119),(370,1000,4120),(371,1000,4121),(372,1000,4122),(373,1000,4123),(374,1000,4124),(375,1000,4125),(376,1000,4126),(377,1000,4127),(378,1000,4128),(379,1000,4129),(380,1000,4130),(381,1000,4131),(382,1000,4132),(383,1000,4133),(384,1000,4134),(385,1000,4135),(386,1000,4136),(387,1000,4137),(388,1000,4138),(389,1000,4139),(390,1000,4140),(391,1000,4141),(392,1000,4142),(393,1000,4143),(394,1000,4144),(395,1000,4145),(396,1000,4146),(397,1000,4147),(398,1000,4148),(399,1000,4149),(400,1000,4150),(401,1000,4151),(402,1000,4152),(403,1000,4153),(404,1000,4154),(405,1000,4155),(406,1000,4156),(407,1000,4157),(408,1000,4158),(409,1000,4159),(410,1000,4160),(411,1000,4161),(412,1000,4162),(413,1000,4163),(414,1000,4164),(415,1000,4165),(416,1000,4166),(417,1000,4167),(418,1000,4168),(419,1000,4169),(420,1000,4170),(421,1000,4171),(422,1000,4172),(423,1000,4173),(424,1000,4174),(425,1000,4175),(426,1000,4176),(427,1000,4177),(428,1000,4178),(429,1000,4179),(430,1000,4180),(431,1000,4181),(432,1000,4182),(433,1000,4183),(434,1000,4184),(435,1000,4185),(436,1000,4186),(437,1000,4187),(438,1000,4188),(439,1000,4189),(440,1000,4190),(441,1000,4191),(442,1000,4192),(443,1000,4193),(444,1000,4194),(445,1000,4195),(446,1000,4196),(447,1000,4197),(448,1000,4198),(449,1000,4199),(450,1000,4200),(451,1000,4201),(452,1000,4202),(453,1000,4203),(454,1000,4204),(455,1000,4205),(456,1000,4206),(457,1000,4207),(458,1000,4208),(459,1000,4209),(460,1000,4210),(461,1000,4211),(462,1000,4212),(463,1000,4213),(464,1000,4214),(465,1000,4215),(466,1000,4216),(467,1000,4217),(468,1000,4218),(469,1000,4219),(470,1000,4220),(471,1000,4221),(472,1000,4222),(473,1000,4223),(474,1000,4224),(475,1000,4225),(476,1000,4226),(477,1000,4227),(478,1000,4228),(479,1000,4229),(480,1000,4230),(481,1000,4231),(482,1000,4232),(483,1001,5000),(484,1001,5001),(485,1001,5002),(486,1001,5003),(487,1001,5004),(488,1001,5005),(489,1001,5006),(490,1001,5007),(491,1001,5008),(492,1001,5009),(493,1001,5010),(494,1001,5011),(495,1001,5012),(496,1001,5013),(497,1001,5014),(498,1005,6000),(499,1005,6001),(500,1005,6002),(501,1005,6003),(502,1005,6004),(503,1005,6005),(504,1004,7000),(505,1004,7001),(506,10000,10000);
/*!40000 ALTER TABLE `categorytoterm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `aggregatedmulti`
--

DROP TABLE IF EXISTS `aggregatedmulti`;
/*!50001 DROP VIEW IF EXISTS `aggregatedmulti`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `aggregatedmulti` (
  `applicationvolume` bigint(21),
  `sterm` varchar(100),
  `idJobs` int(11),
  `sTitle` varchar(255),
  `scategory` varchar(100),
  `sShortDescription` varchar(255),
  `sFreeText` varchar(255),
  `sDescription` longtext,
  `dtEnteredDate` date,
  `sSalaryText` varchar(100),
  `sMinSal` int(11),
  `EmployeeID` int(11),
  `termid` int(11),
  `sMaxSal` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_getjobsarch`
--

DROP TABLE IF EXISTS `vw_getjobsarch`;
/*!50001 DROP VIEW IF EXISTS `vw_getjobsarch`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_getjobsarch` (
  `idJobs` int(11),
  `sTitle` varchar(255),
  `sShortDescription` varchar(255),
  `sFreeText` varchar(255),
  `sDescription` longtext,
  `sjobenddate` date,
  `dtEnteredDate` date,
  `sSalaryText` varchar(100),
  `sMinSal` int(11),
  `EmployeeID` int(11),
  `sMaxSal` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `getmyapps`
--

DROP TABLE IF EXISTS `getmyapps`;
/*!50001 DROP VIEW IF EXISTS `getmyapps`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `getmyapps` (
  `idApplications` int(11),
  `sRecruiterName` varchar(100),
  `Applicationstatus` varchar(255),
  `stitle` varchar(255),
  `liCandidateID` int(11),
  `dtEntered` date,
  `aFirstName` varchar(45),
  `aLastName` varchar(45),
  `aProfileSummary` varchar(500),
  `uusername` varchar(255),
  `idCandidates` int(11),
  `cCandidateName` varchar(255),
  `cFirstName` varchar(255),
  `cLastName` varchar(255),
  `idusers` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_adgen`
--

DROP TABLE IF EXISTS `vw_adgen`;
/*!50001 DROP VIEW IF EXISTS `vw_adgen`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_adgen` (
  `adpath` varchar(500),
  `adsection` varchar(100),
  `adkey` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `termslist`
--

DROP TABLE IF EXISTS `termslist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `termslist` (
  `idtermslist` int(11) NOT NULL AUTO_INCREMENT,
  `termid` int(11) DEFAULT NULL,
  `termlevel` int(11) DEFAULT NULL,
  PRIMARY KEY (`idtermslist`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `termslist`
--

LOCK TABLES `termslist` WRITE;
/*!40000 ALTER TABLE `termslist` DISABLE KEYS */;
INSERT INTO `termslist` VALUES (1,4012,20000),(2,4012,20001),(3,4012,20002);
/*!40000 ALTER TABLE `termslist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `br_filter`
--

DROP TABLE IF EXISTS `br_filter`;
/*!50001 DROP VIEW IF EXISTS `br_filter`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `br_filter` (
  `termid` int(11),
  `sterm` varchar(100),
  `ctotals` bigint(21),
  `catid` int(11),
  `scategory` varchar(100)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `DocumentID` int(11) NOT NULL AUTO_INCREMENT,
  `documentname` varchar(100) DEFAULT NULL,
  `Doc_data` text,
  `doc_url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`DocumentID`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (30,'test','test','test');
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `getdetailspages`
--

DROP TABLE IF EXISTS `getdetailspages`;
/*!50001 DROP VIEW IF EXISTS `getdetailspages`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `getdetailspages` (
  `idJobs` int(11),
  `minrange` int(11),
  `maxrange` int(11),
  `Termid` int(11),
  `catid` int(11),
  `sTerm` varchar(100)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_jobsoutmail`
--

DROP TABLE IF EXISTS `vw_jobsoutmail`;
/*!50001 DROP VIEW IF EXISTS `vw_jobsoutmail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_jobsoutmail` (
  `emailaddress` varchar(500),
  `idjobs` int(11),
  `stitle` varchar(255)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tb_spamreport`
--

DROP TABLE IF EXISTS `tb_spamreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_spamreport` (
  `idtb_spamreport` int(11) NOT NULL AUTO_INCREMENT,
  `spamindex` int(11) DEFAULT NULL,
  `spamreason` varchar(1000) DEFAULT NULL,
  `dtentered` datetime DEFAULT NULL,
  `ipuser` varchar(45) DEFAULT NULL,
  `useragents` varchar(1000) DEFAULT NULL,
  `jobid` int(11) DEFAULT NULL,
  PRIMARY KEY (`idtb_spamreport`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_spamreport`
--

LOCK TABLES `tb_spamreport` WRITE;
/*!40000 ALTER TABLE `tb_spamreport` DISABLE KEYS */;
INSERT INTO `tb_spamreport` VALUES (1,2,'','2011-09-07 03:50:44',NULL,NULL,NULL),(2,3,'','2011-09-07 03:56:01','127.0.0.1','Mozilla/5.0 (Windows NT 5.1; rv:6.0.1) Gecko/20100101 Firefox/6.0.1',NULL),(3,4,'why are you advertizing this page...','2011-09-07 04:09:04','127.0.0.1','Mozilla/5.0 (Windows NT 5.1; rv:6.0.1) Gecko/20100101 Firefox/6.0.1',NULL),(4,3,'','2011-09-07 04:13:46','127.0.0.1','Mozilla/5.0 (Windows NT 5.1; rv:6.0.1) Gecko/20100101 Firefox/6.0.1',26),(5,3,'','2011-09-07 04:14:42','127.0.0.1','Mozilla/5.0 (Windows NT 5.1; rv:6.0.1) Gecko/20100101 Firefox/6.0.1',26),(6,1,'','2011-09-09 18:19:41','127.0.0.1','Mozilla/5.0 (Windows NT 5.1; rv:6.0.2) Gecko/20100101 Firefox/6.0.2',25),(7,1,'','2011-09-10 11:24:05','127.0.0.1','Mozilla/5.0 (Windows NT 5.1; rv:6.0.2) Gecko/20100101 Firefox/6.0.2',28),(8,1,'','2011-09-10 16:15:53','127.0.0.1','Mozilla/5.0 (Windows NT 5.1; rv:6.0.2) Gecko/20100101 Firefox/6.0.2',31),(9,1,'','2011-09-12 10:59:53','127.0.0.1','Mozilla/5.0 (Windows NT 5.1) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782.220 Safari/535.1',35),(10,3,'','2011-09-12 17:13:25','127.0.0.1','Mozilla/5.0 (Windows NT 5.1; rv:6.0.2) Gecko/20100101 Firefox/6.0.2',33),(11,1,'','2011-09-13 20:00:11','127.0.0.1','Mozilla/5.0 (Windows NT 5.1) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782.220 Safari/535.1',23),(12,1,'','2011-09-14 12:09:38','127.0.0.1','Mozilla/5.0 (Windows NT 5.1; rv:6.0.2) Gecko/20100101 Firefox/6.0.2',23),(13,1,'','2012-08-13 20:51:09','127.0.0.1','Mozilla/5.0 (Windows NT 5.1; rv:11.0) Gecko/20100101 Firefox/11.0',1),(14,1,'','2012-08-14 00:06:54','127.0.0.1','Mozilla/5.0 (Windows NT 5.1; rv:11.0) Gecko/20100101 Firefox/11.0',20),(15,1,'','2012-08-14 00:10:31','127.0.0.1','Mozilla/5.0 (Windows NT 5.1; rv:11.0) Gecko/20100101 Firefox/11.0',9),(16,1,'','2012-08-14 07:07:00','127.0.0.1','Mozilla/5.0 (Windows NT 5.1; rv:11.0) Gecko/20100101 Firefox/11.0',15),(17,1,'','2012-10-22 02:29:22','127.0.0.1','Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET4.0C; .NET4.0E; InfoPath.3)',1),(18,1,'','2012-10-23 15:09:17','127.0.0.1','Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET4.0C; .NET4.0E; .NET CLR 3.0.30618; .NET CLR 3.5.30729)',1),(19,1,'','2012-10-24 00:12:15','127.0.0.1','Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET4.0C; .NET4.0E; .NET CLR 3.0.30618; .NET CLR 3.5.30729)',1),(20,1,'','2012-10-25 05:59:11','127.0.0.1','Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET4.0C; .NET4.0E; .NET CLR 3.0.30618; .NET CLR 3.5.30729)',3),(21,1,'','2012-10-25 09:13:39','127.0.0.1','Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET4.0C; .NET4.0E; .NET CLR 3.0.30618; .NET CLR 3.5.30729)',18),(22,1,'','2012-10-25 09:15:46','127.0.0.1','Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET4.0C; .NET4.0E; .NET CLR 3.0.30618; .NET CLR 3.5.30729)',34),(23,1,'','2012-10-26 09:52:13','127.0.0.1','Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET4.0C; .NET4.0E; .NET CLR 3.0.30618; .NET CLR 3.5.30729)',33),(24,1,'','2012-10-27 08:15:18','127.0.0.1','Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET4.0C; .NET4.0E; .NET CLR 3.0.30618; .NET CLR 3.5.30729)',17);
/*!40000 ALTER TABLE `tb_spamreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_branding`
--

DROP TABLE IF EXISTS `tb_branding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_branding` (
  `idtb_branding` int(11) NOT NULL AUTO_INCREMENT,
  `kpiname` varchar(45) DEFAULT NULL,
  `kpivalue` longtext,
  PRIMARY KEY (`idtb_branding`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_branding`
--

LOCK TABLES `tb_branding` WRITE;
/*!40000 ALTER TABLE `tb_branding` DISABLE KEYS */;
INSERT INTO `tb_branding` VALUES (1,'pagetitle','Ahrcloud'),(2,'recpagetitle','Ahrcloud - Recruiters'),(3,'jobseekertitle','Ahrcloud - Jobseekers');
/*!40000 ALTER TABLE `tb_branding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_getblockedrec`
--

DROP TABLE IF EXISTS `vw_getblockedrec`;
/*!50001 DROP VIEW IF EXISTS `vw_getblockedrec`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_getblockedrec` (
  `empid` int(11),
  `srecruitername` varchar(100),
  `idcandidates` binary(0)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `jobapplicationview`
--

DROP TABLE IF EXISTS `jobapplicationview`;
/*!50001 DROP VIEW IF EXISTS `jobapplicationview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `jobapplicationview` (
  `dtEntered` date,
  `idjobs` int(11),
  `empid` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `version` (
  `idversion` int(11) NOT NULL,
  `versionnumber` varchar(45) DEFAULT NULL,
  `checkout` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idversion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` VALUES (1,'0.1','\0'),(2,'0.2','\0'),(3,'2.2','');
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidates`
--

DROP TABLE IF EXISTS `candidates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidates` (
  `idCandidates` int(11) NOT NULL,
  `cCandidateName` varchar(255) DEFAULT NULL,
  `cFirstName` varchar(255) DEFAULT NULL,
  `cLastName` varchar(255) DEFAULT NULL,
  `cAddress1` varchar(45) DEFAULT NULL,
  `cAddress2` varchar(45) DEFAULT NULL,
  `cAddress3` varchar(45) DEFAULT NULL,
  `cTown` varchar(45) DEFAULT NULL,
  `cCounty` varchar(45) DEFAULT NULL,
  `cPostcode` varchar(45) DEFAULT NULL,
  `cHomephone` varchar(45) DEFAULT NULL,
  `cWorkphone` varchar(45) DEFAULT NULL,
  `cdtEntered` datetime DEFAULT NULL,
  `cCountry` varchar(45) DEFAULT NULL,
  `cDateofbirth` date DEFAULT NULL,
  PRIMARY KEY (`idCandidates`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidates`
--

LOCK TABLES `candidates` WRITE;
/*!40000 ALTER TABLE `candidates` DISABLE KEYS */;
INSERT INTO `candidates` VALUES (0,'TestMarker',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1,'mike henry','mike','henry','a1','add2','add3','tow1','count1','post1','393939','999999','2011-04-14 11:52:25','country1',NULL),(2,'more then','more','then','add10','Add11','Add12','Tow1','Countu1','BR2','077','0777666','2011-04-15 12:14:31','UK',NULL),(3,'drinking shoes','drinking','shoes','add10','16/10/1983','Add12','Tow1','count1','post1','998899','889988','2011-04-15 12:30:11','country1',NULL),(4,'Moeen khursheed','Moeen','khursheed','25','Longridge Avenue','Saltdean','Brighton','Brighton','BN2 8LG','07735553569','02081444827','2011-04-21 12:21:18','UK','1983-10-16'),(5,'p p','p','p','p','p','p','p','p','p','00','00','2011-09-07 19:44:19','p','2011-09-02'),(6,'w w','w','w','w','w','w','w','w','w','999','999','2011-09-07 19:47:40','w','2011-09-01'),(7,'taleo corp','taleo','corp','a','a','a','a','a','BR2 9SH','07735553569','0208','2011-09-08 15:37:00','a','1983-10-16'),(8,'taleo corp','taleo','corp','a','a','a','a','a','BR2 9SH','07735553569','0208','2011-09-08 15:38:00','a','1983-10-16'),(9,'r r','r','r','r','r','r','r','r','r','07735553569','0208','2011-09-08 15:39:27','r','1983-10-16'),(10,'smooth y','smooth','y','a','l','l','ll','l','l','044','044','2011-09-08 16:13:37','l','1983-10-16'),(11,'jack d','jack','d','','','','','','','','','2011-09-13 16:02:49','',NULL),(12,'heat on','heat','on','','','','','','','','','2011-09-13 16:04:52','',NULL),(13,'millli sanders','millli','sanders','add1','add2','add3','a','a','a','3333333333','3333333333','2011-09-13 16:17:32','a','1983-10-17');
/*!40000 ALTER TABLE `candidates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailtypes`
--

DROP TABLE IF EXISTS `emailtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailtypes` (
  `rEmailtype` int(11) NOT NULL DEFAULT '0',
  `sText` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`rEmailtype`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailtypes`
--

LOCK TABLES `emailtypes` WRITE;
/*!40000 ALTER TABLE `emailtypes` DISABLE KEYS */;
INSERT INTO `emailtypes` VALUES (0,'ApplicationConfirmation'),(1,'RecruiterConfirmation'),(2,'UserConfirmation'),(3,'NewsLetter'),(4,'Jobsbyemail');
/*!40000 ALTER TABLE `emailtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_adverts`
--

DROP TABLE IF EXISTS `tb_adverts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_adverts` (
  `idtb_adverts` int(11) NOT NULL AUTO_INCREMENT,
  `adsection` varchar(100) DEFAULT NULL,
  `adkey` int(11) DEFAULT NULL,
  PRIMARY KEY (`idtb_adverts`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_adverts`
--

LOCK TABLES `tb_adverts` WRITE;
/*!40000 ALTER TABLE `tb_adverts` DISABLE KEYS */;
INSERT INTO `tb_adverts` VALUES (1,'login',1);
/*!40000 ALTER TABLE `tb_adverts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `recusers`
--

DROP TABLE IF EXISTS `recusers`;
/*!50001 DROP VIEW IF EXISTS `recusers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `recusers` (
  `idjobs` int(11),
  `empid` int(11),
  `uFirstName` varchar(255),
  `ulastname` varchar(255)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `emailtemplates`
--

DROP TABLE IF EXISTS `emailtemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailtemplates` (
  `idemailtemplates` int(11) NOT NULL AUTO_INCREMENT,
  `eheader` longtext,
  `edescription` longtext,
  `efooter` longtext,
  `etemplatechkid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idemailtemplates`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailtemplates`
--

LOCK TABLES `emailtemplates` WRITE;
/*!40000 ALTER TABLE `emailtemplates` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailtemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terms`
--

DROP TABLE IF EXISTS `terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `terms` (
  `Termid` int(11) NOT NULL,
  `sTerm` varchar(100) DEFAULT NULL,
  `minrange` int(11) DEFAULT '0',
  `maxrange` int(11) DEFAULT '0',
  `liparent` bit(1) DEFAULT b'0',
  PRIMARY KEY (`Termid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terms`
--

LOCK TABLES `terms` WRITE;
/*!40000 ALTER TABLE `terms` DISABLE KEYS */;
INSERT INTO `terms` VALUES (3000,'Permanent',0,0,'\0'),(3001,'Temporary',0,0,'\0'),(3002,'Contract',0,0,'\0'),(3003,'Full Time',0,0,'\0'),(3004,'Part Time',0,0,'\0'),(7000,'Direct',0,0,'\0'),(7001,'Agents',0,0,'\0'),(4001,'Zurich',0,0,'\0'),(4002,'Geneva',0,0,'\0'),(4003,'Bern',0,0,'\0'),(4004,'Basel',0,0,'\0'),(4005,'Lausanne',0,0,'\0'),(4006,'Lucerne',0,0,'\0'),(4007,'Winterthur',0,0,'\0'),(4008,'St. Gallen',0,0,'\0'),(4009,'Lugano',0,0,'\0'),(4010,'Beil',0,0,'\0'),(4011,'Thun',0,0,'\0'),(4012,'Koniz',0,0,''),(4013,'La Chaux-de-fonds',0,0,'\0'),(4014,'Schaffhausen',0,0,'\0'),(4015,'Fribourg',0,0,'\0'),(4016,'Vernier',0,0,'\0'),(4017,'Chur',0,0,'\0'),(4018,'Neuchatel',0,0,'\0'),(4019,'Uster',0,0,'\0'),(4020,'Sion',0,0,'\0'),(5000,'Arts',0,0,'\0'),(5001,'Management',0,0,'\0'),(5002,'HR & Training',0,0,'\0'),(5003,'Charities',0,0,'\0'),(5004,'Volunteering',0,0,'\0'),(5005,'Sales',0,0,'\0'),(5006,'IT & Telecom',0,0,'\0'),(5007,'Finance',0,0,'\0'),(5008,'Recruitment',0,0,'\0'),(5009,'Executive',0,0,'\0'),(5010,'Marketing',0,0,'\0'),(5011,'Media',0,0,'\0'),(5012,'Health',0,0,'\0'),(5013,'Social Care',0,0,'\0'),(5014,'Secretarial',0,0,'\0'),(6000,'0-10,000',0,10000,'\0'),(6001,'10,000-20,000',10000,20000,'\0'),(6002,'20,000-30,000',20000,30000,'\0'),(6003,'30,000-40,000',30000,40000,'\0'),(6004,'40,000-50,000',40000,50000,'\0'),(6005,'+50,000',50000,100000,'\0'),(10000,'Default',0,0,'\0'),(8001,'NE',0,0,'\0');
/*!40000 ALTER TABLE `terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `idUsers` int(11) NOT NULL,
  `uUserType` int(11) DEFAULT NULL,
  `uUsername` varchar(255) DEFAULT NULL,
  `uPassword` varchar(45) DEFAULT NULL,
  `uPasswordHint` varchar(255) DEFAULT NULL,
  `uFirstName` varchar(255) DEFAULT NULL,
  `uLastName` varchar(255) DEFAULT NULL,
  `uIsPrimary` bit(1) DEFAULT NULL,
  `uCandidateID` int(11) DEFAULT NULL,
  `uActivation` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idUsers`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (230002,1,'moeens@ahrcloud.com','098f6bcd4621d373cade4e832627b4f6','hint','moeen','khurshid','',NULL,NULL),(20030003,1,'adam@ahrcloud.com','098f6bcd4621d373cade4e832627b4f6','hint','adam','smith','',NULL,NULL),(90000000,2,'mark@ahrcloud.com','098f6bcd4621d373cade4e832627b4f6','hint','Mark','henry','',NULL,NULL),(90000001,2,'micheal@ahrcloud.com','098f6bcd4621d373cade4e832627b4f6','na','micheal','gordon',NULL,NULL,NULL),(90000002,2,'michelle@ahrcloud.com','098f6bcd4621d373cade4e832627b4f6','na','michelle','simpson',NULL,NULL,NULL),(90000003,2,'sara@ahrcloud.com','098f6bcd4621d373cade4e832627b4f6','na','sara','parker',NULL,NULL,NULL),(90000004,2,'sam@ahrcloud.com','098f6bcd4621d373cade4e832627b4f6','na','sameer','roy',NULL,NULL,NULL),(90000005,2,'samir@ahrcloud.com','098f6bcd4621d373cade4e832627b4f6','na','sameer','chandhna',NULL,NULL,NULL),(90000006,2,'ali@ahrcloud.com','098f6bcd4621d373cade4e832627b4f6','strom','ali','bajwa',NULL,NULL,NULL),(90000007,2,'alexis@ahrcloud.com','098f6bcd4621d373cade4e832627b4f6','aaa','alexis','nexis',NULL,4,NULL),(90000008,2,'nexis@ahrcloud.com','098f6bcd4621d373cade4e832627b4f6','sam','nexis','look',NULL,NULL,NULL),(20030009,1,'kat@ahrcloud.com','098f6bcd4621d373cade4e832627b4f6','hint','katherine','parker','',-1,NULL),(20030010,1,'medaline@ahrcloud.com','098f6bcd4621d373cade4e832627b4f6','hint','medaline','prescot','',-1,NULL),(20030011,1,'mike@ahrcloud.com','098f6bcd4621d373cade4e832627b4f6','hint','mike','jordan','',-1,NULL),(20030012,1,'mkh@ahrcloud.com','098f6bcd4621d373cade4e832627b4f6','hint','moin','khan','',-1,NULL),(20030013,1,'simon@ahrcloud.com','098f6bcd4621d373cade4e832627b4f6','hint','simon','hasroy','',-1,NULL),(20030014,1,'pam@ahrcloud.com','098f6bcd4621d373cade4e832627b4f6','hint','pamela','anderson','',-1,NULL),(20030015,1,'anderson@ahrcloud.com','098f6bcd4621d373cade4e832627b4f6','hint','anderson','micheal','',-1,NULL),(20030016,1,'adnan@ahrcloud.com','098f6bcd4621d373cade4e832627b4f6','hint','adnan','chaudhury','',-1,NULL),(20030017,1,'masood@ahrcloud.com','098f6bcd4621d373cade4e832627b4f6','hint','masood','butt','',-1,NULL),(20030018,1,'farhan@ahrcloud.com','098f6bcd4621d373cade4e832627b4f6','hint','farhan','ahmed','',-1,NULL),(20030019,1,'amy@ahrcloud.com','098f6bcd4621d373cade4e832627b4f6','hint','amy','clasper','',-1,NULL),(20030020,1,'andrea@ahrcloud.com','098f6bcd4621d373cade4e832627b4f6','hint','andrea','simpson','',-1,NULL),(90000009,2,'tiscali@ahrcloud.com','098f6bcd4621d373cade4e832627b4f6','app','tiscali','scott','',5,NULL),(90000010,2,'aws@ahrcloud.com','098f6bcd4621d373cade4e832627b4f6','app','aws','machine','',6,NULL),(90000011,2,'tamain@ahrcloud.com','098f6bcd4621d373cade4e832627b4f6','app','tamain','ahsan','',7,NULL),(90000012,2,'tamoor@ahrcloud.com','098f6bcd4621d373cade4e832627b4f6','app','tamoor','malik','',8,NULL),(90000013,2,'sim@ahrcloud.com','098f6bcd4621d373cade4e832627b4f6','app','sim','shah','',9,NULL),(90000014,2,'cindy@ahrcloud.com','098f6bcd4621d373cade4e832627b4f6','sm','cindy','parker','',10,NULL),(90000015,2,'steve@ahrcloud.com','098f6bcd4621d373cade4e832627b4f6','app','steve','john','',11,NULL),(90000016,2,'john@ahrcloud.com','098f6bcd4621d373cade4e832627b4f6','app','john','mcroy','',11,NULL),(90000017,2,'james@ahrcloud.com','098f6bcd4621d373cade4e832627b4f6','app','james','caan','',12,NULL),(90000018,2,'millie@ahrcloud.com','098f6bcd4621d373cade4e832627b4f6','test','millie','anderson','',13,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `br_subview`
--

DROP TABLE IF EXISTS `br_subview`;
/*!50001 DROP VIEW IF EXISTS `br_subview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `br_subview` (
  `termid` int(11),
  `sterm` varchar(100),
  `ctotals` bigint(21)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tb_subscriptions`
--

DROP TABLE IF EXISTS `tb_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_subscriptions` (
  `idtb_subscriptions` int(11) NOT NULL AUTO_INCREMENT,
  `emailaddress` varchar(500) DEFAULT NULL,
  `catid` int(11) DEFAULT NULL,
  `termid` int(11) DEFAULT NULL,
  PRIMARY KEY (`idtb_subscriptions`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_subscriptions`
--

LOCK TABLES `tb_subscriptions` WRITE;
/*!40000 ALTER TABLE `tb_subscriptions` DISABLE KEYS */;
INSERT INTO `tb_subscriptions` VALUES (1,'moeeens@yahoo.com',1000,4001),(2,'moeeens@yahoo.com',1000,4002),(3,'moeeens@yahoo.com',1001,5000),(4,'moeeens@yahoo.com',1001,5001),(5,'moeeens@yahoo.com',1001,5003),(6,'moeeens@yahoo.com',1002,3000),(7,'moeeens@yahoo.com',1002,3001),(8,'moeeens@yahoo.com',1002,3002),(9,'moeeens@yahoo.com',1003,3003),(10,'moeeens@yahoo.com',1004,7000),(11,'moeeens@yahoo.com',1005,6000),(12,'moeeens@yahoo.com',1005,6001),(13,'moeeens@yahoo.com',1005,6002),(14,'moeeens@yahoo.com',1005,6003),(15,'moeeens@yahoo.com',1005,6004),(16,'moeeens@yahoo.com',1005,6005),(17,'mark@yahoo.com',1000,4002),(18,'mark@yahoo.com',1000,4003),(19,'mark@yahoo.com',1000,4004),(20,'mark@yahoo.com',1001,5001),(21,'mark@yahoo.com',1001,5002),(22,'mark@yahoo.com',1002,3000),(23,'mark@yahoo.com',1002,3001),(24,'mark@yahoo.com',1002,3002),(25,'mark@yahoo.com',1003,3004),(26,'mark@yahoo.com',1004,7000),(27,'mark@yahoo.com',1005,6000),(28,'mark@yahoo.com',1005,6001),(29,'mark@yahoo.com',1005,6002),(30,'mark@yahoo.com',1005,6003),(31,'mark@yahoo.com',1005,6004),(32,'moeeens@yahoo.com',1000,4001),(33,'moeeens@yahoo.com',1000,4002),(34,'moeeens@yahoo.com',1000,4003),(35,'moeeens@yahoo.com',1001,5011),(36,'moeeens@yahoo.com',1001,5012),(37,'moeeens@yahoo.com',1001,5000),(38,'moeeens@yahoo.com',1001,5001),(39,'moeeens@yahoo.com',1000,4002),(40,'moeeens@yahoo.com',1000,4003),(41,'moeeens@yahoo.com',1000,4004),(42,'moeeens@yahoo.com',1001,5000),(43,'moeeens@yahoo.com',1001,5002),(44,'moeeens@yahoo.com',1001,5003),(45,'moeeens@yahoo.com',1001,5004),(46,'moeeens@yahoo.com',1002,3000),(47,'moeeens@yahoo.com',1002,3001),(48,'moeeens@yahoo.com',1003,3003),(49,'moeeens@yahoo.com',1003,3004),(50,'moeeens@yahoo.com',1004,7000),(51,'moeeens@yahoo.com',1004,7001),(52,'moeeens@yahoo.com',1005,6002),(53,'moeeens@yahoo.com',1005,6003),(54,'moeeens@yahoo.com',1005,6004);
/*!40000 ALTER TABLE `tb_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recusermapper`
--

DROP TABLE IF EXISTS `recusermapper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recusermapper` (
  `idusermapper` int(11) NOT NULL AUTO_INCREMENT,
  `EmpID` int(11) DEFAULT NULL,
  `idUsers` int(11) DEFAULT NULL,
  PRIMARY KEY (`idusermapper`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recusermapper`
--

LOCK TABLES `recusermapper` WRITE;
/*!40000 ALTER TABLE `recusermapper` DISABLE KEYS */;
INSERT INTO `recusermapper` VALUES (1,30002,230002),(2,30003,20030003),(3,30010,20030010),(4,30011,20030011),(5,30012,20030012),(6,30016,20030016),(7,30017,20030017),(8,30018,20030018),(9,30020,20030020);
/*!40000 ALTER TABLE `recusermapper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `getusercans`
--

DROP TABLE IF EXISTS `getusercans`;
/*!50001 DROP VIEW IF EXISTS `getusercans`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `getusercans` (
  `idUsers` int(11),
  `uUserType` int(11),
  `uUsername` varchar(255),
  `uPassword` varchar(45),
  `uPasswordHint` varchar(255),
  `uFirstName` varchar(255),
  `uLastName` varchar(255),
  `uIsPrimary` bit(1),
  `uCandidateID` int(11),
  `idCandidates` int(11),
  `cCandidateName` varchar(255),
  `cFirstName` varchar(255),
  `cdateofbirth` date,
  `cLastName` varchar(255),
  `cAddress1` varchar(45),
  `cAddress2` varchar(45),
  `cAddress3` varchar(45),
  `cTown` varchar(45),
  `cCounty` varchar(45),
  `cPostcode` varchar(45),
  `cHomephone` varchar(45),
  `cWorkphone` varchar(45),
  `cdtEntered` datetime,
  `cCountry` varchar(45)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `getjobssingle`
--

DROP TABLE IF EXISTS `getjobssingle`;
/*!50001 DROP VIEW IF EXISTS `getjobssingle`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `getjobssingle` (
  `idJobs` int(11),
  `sTitle` varchar(255),
  `sShortDescription` varchar(255),
  `sFreeText` varchar(255),
  `sDescription` longtext,
  `sjobenddate` date,
  `dtEnteredDate` date,
  `sSalaryText` varchar(100),
  `sMinSal` int(11),
  `EmployeeID` int(11),
  `sMaxSal` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_jobtrendsectors`
--

DROP TABLE IF EXISTS `vw_jobtrendsectors`;
/*!50001 DROP VIEW IF EXISTS `vw_jobtrendsectors`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_jobtrendsectors` (
  `jbtotal` bigint(21),
  `sterm` varchar(100)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `recruiters`
--

DROP TABLE IF EXISTS `recruiters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruiters` (
  `EmpID` int(11) NOT NULL AUTO_INCREMENT,
  `sRecruiterName` varchar(100) DEFAULT NULL,
  `sAddress1` varchar(255) DEFAULT NULL,
  `sAddress2` varchar(255) DEFAULT NULL,
  `sAddress3` varchar(255) DEFAULT NULL,
  `sTown` varchar(50) DEFAULT NULL,
  `sCounty` varchar(50) DEFAULT NULL,
  `sCountry` varchar(45) DEFAULT NULL,
  `sPostcode` varchar(10) DEFAULT NULL,
  `sEmailAddress` varchar(255) DEFAULT NULL,
  `sWebsite` varchar(500) DEFAULT NULL,
  `sDescription` varchar(500) DEFAULT NULL,
  `sCompleteDesc` text,
  `sdtEntered` datetime DEFAULT NULL,
  `sEnteredbyID` int(11) DEFAULT NULL,
  `sIsFeatured` bit(1) DEFAULT NULL,
  `sArticleId` int(11) DEFAULT NULL,
  `sIsActive` bit(1) DEFAULT NULL,
  PRIMARY KEY (`EmpID`),
  UNIQUE KEY `sRecruiterName_UNIQUE` (`sRecruiterName`)
) ENGINE=MyISAM AUTO_INCREMENT=30021 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruiters`
--

LOCK TABLES `recruiters` WRITE;
/*!40000 ALTER TABLE `recruiters` DISABLE KEYS */;
INSERT INTO `recruiters` VALUES (30000,'Harverd Brown','Manchester',NULL,NULL,NULL,'Manchester','UK','MP2','harverd.brown@hbrown.com','www.harwardbrown.com','Harward Brown Associates','test recruiter Main accountabilities to include but not be limited to:',NULL,NULL,'',20000,''),(30001,'HBO','add1','add2','add3','town1','county1','postcode1','SERVENT','moeens@yahoo.com','website','desc','completedesc','2011-01-01 00:00:00',1,'',10030006,''),(30002,'IBM','add1','add2','add3','town1','county1','postcode1','SERVENT','moeens@yahoo.com','website','desc','completedesc','2011-01-01 00:00:00',1,'',10030003,''),(30003,'TNT','','','','','','','','','website','desc','completedesc','2011-01-01 00:00:00',1,'',10030007,'\0'),(30004,'HP','add1','add2','add3','town1','county1','postcode1','SERVENT','moeens@yahoo.com','website','desc','completedesc','2011-01-01 00:00:00',1,'',130002,'\0'),(30005,'SONY','add1','add2','add3','town1','county1','postcode1','SERVENT','moeens@yahoo.com','website','desc','completedesc','2011-01-01 00:00:00',1,'',10030004,'\0'),(30006,'ka','k','k','k','k','k','GB','k','kk@pat.com','k','kk','k','2011-09-05 21:36:18',1,'',10030006,''),(30007,'kb','k','k','k','k','k','GB','k','kk@pat.com','k','kk','k','2011-09-05 21:37:06',1,'',10030007,''),(30008,'kc','k','k','k','k','k','GB','k','kk@pat.com','k','kk','k','2011-09-05 21:38:10',1,'',10030008,''),(30009,'kd','k','k','k','k','k','GB','k','kk@pat.com','k','kk','k','2011-09-05 21:38:42',1,'',10030009,''),(30010,'ke','k','k','k','k','k','GB','k','kkpt@yahoo.com','k','kk','k','2011-09-05 21:39:49',1,'',10030010,''),(30011,'ra','r','r','r','r','r','GB','r','route@yahoo.com','r','r','r','2011-09-05 21:41:07',1,'',10030011,''),(30012,'kf','k','k','k','k','k','GB','k','mkh@yahoo.com','k','k','k','2011-09-05 21:43:23',1,'',10030012,''),(30013,'testcompany','test','test','test','test','test','GB','test','testcomp@yahoo.com','testweb','a test','Main accountabilities to include but not be limited to:Ensure that the Health and Safety procedures are followed by all personnel.Keep and maintain accurate records for health and safety including safe systems of work, training records and agency induction.Assist security when doing end of shift searches, in being a witness and also be of support when required for random searches.Managing the activities and resources to achieve financial, operational and customer service objectives.Plan and manage the staffing levels, ordering or canceling agency staff when required to ensure optimum level of staffing is being used within budget.Monitor levels of consumables and conveying this information to administration when supplies are low.Ensure equipment is operational and relevant checks are made and maintained. When problems arise, contact the relevant contractors to resolve the issue.Ensure the AMP scheme is used to manage absence using disciplinary system where necessary up to and including the written warning stage. Assisting in the recruitment, training and development of individuals and the team, using company procedures and in house resources available.Conduct appraisals with employees and monitor performance, giving feedback to individuals.Assist in the management productivity to achieve KPIs, changing priorities where necessary, and be proactive in looking for continuous improvements.Ensure company policies are adhered to and administration functions completed.Promote harmonious and effective working relationships both internally and externally, ensuring excellent customer service through a combination of communication, team work, motivation and leadership.Communicating information to incoming team leaders to have an effective shift handover procedure. Also to communicate both upwards and downwards to enhance staff morale and understanding of business needs.Ensure you have a full working knowledge of all operational systems and have the ability to help staff where necessary.Seek and partake in opportunities to develop own capability and competence in the role.The ideal candidate will: Be customer focused and experienced working within a warehouse/logistics/production environment.Be a staff motivator and have the ability to communicate at all levels.Be an organized and effective planner with proactice decision making skills.Have strong listening skills and have the ability to effectively handle conflict situationsHave experience of working in a multi paced environment, able to multi task.Be assertive and have the ability to coach and train.Strong PC and systems skills. Main accountabilities to include but not be limited to:Ensure that the Health and Safety procedures are followed by all personnel.Keep and maintain accurate records for health and safety including safe systems of work, training records and agency induction.Assist security when doing end of shift searches, in being a witness and also be of support when required for random searches.Managing the activities and resources to achieve financial, operational and customer service objectives.Plan and manage the staffing levels, ordering or canceling agency staff when required to ensure optimum level of staffing is being used within budget.Monitor levels of consumables and conveying this information to administration when supplies are low.Ensure equipment is operational and relevant checks are made and maintained. When problems arise, contact the relevant contractors to resolve the issue.Ensure the AMP scheme is used to manage absence using disciplinary system where necessary up to and including the written warning stage. Assisting in the recruitment, training and development of individuals and the team, using company procedures and in house resources available.Conduct appraisals with employees and monitor performance, giving feedback to individuals.Assist in the management productivity to achieve KPIs, changing priorities where necessary, and be proactive in looking for continuous improvements.Ensure company policies are adhered to and administration functions completed.Promote harmonious and effective working relationships both internally and externally, ensuring excellent customer service through a combination of communication, team work, motivation and leadership.Communicating information to incoming team leaders to have an effective shift handover procedure. Also to communicate both upwards and downwards to enhance staff morale and understanding of business needs.Ensure you have a full working knowledge of all operational systems and have the ability to help staff where necessary.Seek and partake in opportunities to develop own capability and competence in the role.The ideal candidate will: Be customer focused and experienced working within a warehouse/logistics/production environment.Be a staff motivator and have the ability to communicate at all levels.Be an organized and effective planner with proactice decision making skills.Have strong listening skills and have the ability to effectively handle conflict situationsHave experience of working in a multi paced environment, able to multi task.Be assertive and have the ability to coach and train.Strong PC and systems skills.','2011-09-07 07:12:50',1,'',10030013,''),(30014,'ppcomp','l','l','l','l','l','GB','l','acompany@ya.com','pcom','a company','Main accountabilities to include but not be limited to:Ensure that the Health and Safety procedures are followed by all personnel.Keep and maintain accurate records for health and safety including safe systems of work, training records and agency induction.Assist security when doing end of shift searches, in being a witness and also be of support when required for random searches.Managing the activities and resources to achieve financial, operational and customer service objectives.Plan and manage the staffing levels, ordering or canceling agency staff when required to ensure optimum level of staffing is being used within budget.Monitor levels of consumables and conveying this information to administration when supplies are low.Ensure equipment is operational and relevant checks are made and maintained. When problems arise, contact the relevant contractors to resolve the issue.Ensure the AMP scheme is used to manage absence using disciplinary system where necessary up to and including the written warning stage. Assisting in the recruitment, training and development of individuals and the team, using company procedures and in house resources available.Conduct appraisals with employees and monitor performance, giving feedback to individuals.Assist in the management productivity to achieve KPIs, changing priorities where necessary, and be proactive in looking for continuous improvements.Ensure company policies are adhered to and administration functions completed.Promote harmonious and effective working relationships both internally and externally, ensuring excellent customer service through a combination of communication, team work, motivation and leadership.Communicating information to incoming team leaders to have an effective shift handover procedure. Also to communicate both upwards and downwards to enhance staff morale and understanding of business needs.Ensure you have a full working knowledge of all operational systems and have the ability to help staff where necessary.Seek and partake in opportunities to develop own capability and competence in the role.The ideal candidate will: Be customer focused and experienced working within a warehouse/logistics/production environment.Be a staff motivator and have the ability to communicate at all levels.Be an organized and effective planner with proactice decision making skills.Have strong listening skills and have the ability to effectively handle conflict situationsHave experience of working in a multi paced environment, able to multi task.Be assertive and have the ability to coach and train.Strong PC and systems skills. Main accountabilities to include but not be limited to:Ensure that the Health and Safety procedures are followed by all personnel.Keep and maintain accurate records for health and safety including safe systems of work, training records and agency induction.Assist security when doing end of shift searches, in being a witness and also be of support when required for random searches.Managing the activities and resources to achieve financial, operational and customer service objectives.Plan and manage the staffing levels, ordering or canceling agency staff when required to ensure optimum level of staffing is being used within budget.Monitor levels of consumables and conveying this information to administration when supplies are low.Ensure equipment is operational and relevant checks are made and maintained. When problems arise, contact the relevant contractors to resolve the issue.Ensure the AMP scheme is used to manage absence using disciplinary system where necessary up to and including the written warning stage. Assisting in the recruitment, training and development of individuals and the team, using company procedures and in house resources available.Conduct appraisals with employees and monitor performance, giving feedback to individuals.Assist in the management productivity to achieve KPIs, changing priorities where necessary, and be proactive in looking for continuous improvements.Ensure company policies are adhered to and administration functions completed.Promote harmonious and effective working relationships both internally and externally, ensuring excellent customer service through a combination of communication, team work, motivation and leadership.Communicating information to incoming team leaders to have an effective shift handover procedure. Also to communicate both upwards and downwards to enhance staff morale and understanding of business needs.Ensure you have a full working knowledge of all operational systems and have the ability to help staff where necessary.Seek and partake in opportunities to develop own capability and competence in the role.The ideal candidate will: Be customer focused and experienced working within a warehouse/logistics/production environment.Be a staff motivator and have the ability to communicate at all levels.Be an organized and effective planner with proactice decision making skills.Have strong listening skills and have the ability to effectively handle conflict situationsHave experience of working in a multi paced environment, able to multi task.Be assertive and have the ability to coach and train.Strong PC and systems skills.','2011-09-07 07:14:44',1,'',10030014,''),(30015,'aas','a','a','a','a','a','GB','a','bmail@yahoo.com','a','a','Main accountabilities to include but not be limited to:Ensure that the Health and Safety procedures are followed by all personnel.Keep and maintain accurate records for health and safety including safe systems of work, training records and agency induction.Assist security when doing end of shift searches, in being a witness and also be of support when required for random searches.Managing the activities and resources to achieve financial, operational and customer service objectives.Plan and manage the staffing levels, ordering or canceling agency staff when required to ensure optimum level of staffing is being used within budget.Monitor levels of consumables and conveying this information to administration when supplies are low.Ensure equipment is operational and relevant checks are made and maintained. When problems arise, contact the relevant contractors to resolve the issue.Ensure the AMP scheme is used to manage absence using disciplinary system where necessary up to and including the written warning stage. Assisting in the recruitment, training and development of individuals and the team, using company procedures and in house resources available.Conduct appraisals with employees and monitor performance, giving feedback to individuals.Assist in the management productivity to achieve KPIs, changing priorities where necessary, and be proactive in looking for continuous improvements.Ensure company policies are adhered to and administration functions completed.Promote harmonious and effective working relationships both internally and externally, ensuring excellent customer service through a combination of communication, team work, motivation and leadership.Communicating information to incoming team leaders to have an effective shift handover procedure. Also to communicate both upwards and downwards to enhance staff morale and understanding of business needs.Ensure you have a full working knowledge of all operational systems and have the ability to help staff where necessary.Seek and partake in opportunities to develop own capability and competence in the role.The ideal candidate will: Be customer focused and experienced working within a warehouse/logistics/production environment.Be a staff motivator and have the ability to communicate at all levels.Be an organized and effective planner with proactice decision making skills.Have strong listening skills and have the ability to effectively handle conflict situationsHave experience of working in a multi paced environment, able to multi task.Be assertive and have the ability to coach and train.Strong PC and systems skills. Main accountabilities to include but not be limited to:Ensure that the Health and Safety procedures are followed by all personnel.Keep and maintain accurate records for health and safety including safe systems of work, training records and agency induction.Assist security when doing end of shift searches, in being a witness and also be of support when required for random searches.Managing the activities and resources to achieve financial, operational and customer service objectives.Plan and manage the staffing levels, ordering or canceling agency staff when required to ensure optimum level of staffing is being used within budget.Monitor levels of consumables and conveying this information to administration when supplies are low.Ensure equipment is operational and relevant checks are made and maintained. When problems arise, contact the relevant contractors to resolve the issue.Ensure the AMP scheme is used to manage absence using disciplinary system where necessary up to and including the written warning stage. Assisting in the recruitment, training and development of individuals and the team, using company procedures and in house resources available.Conduct appraisals with employees and monitor performance, giving feedback to individuals.Assist in the management productivity to achieve KPIs, changing priorities where necessary, and be proactive in looking for continuous improvements.Ensure company policies are adhered to and administration functions completed.Promote harmonious and effective working relationships both internally and externally, ensuring excellent customer service through a combination of communication, team work, motivation and leadership.Communicating information to incoming team leaders to have an effective shift handover procedure. Also to communicate both upwards and downwards to enhance staff morale and understanding of business needs.Ensure you have a full working knowledge of all operational systems and have the ability to help staff where necessary.Seek and partake in opportunities to develop own capability and competence in the role.The ideal candidate will: Be customer focused and experienced working within a warehouse/logistics/production environment.Be a staff motivator and have the ability to communicate at all levels.Be an organized and effective planner with proactice decision making skills.Have strong listening skills and have the ability to effectively handle conflict situationsHave experience of working in a multi paced environment, able to multi task.Be assertive and have the ability to coach and train.Strong PC and systems skills.','2011-09-07 07:17:32',1,'',10030015,''),(30016,'peacock','p','p','p','p','p','GB','p','peacock@aa.com','peacock','test company','Main accountabilities to include but not be limited to:Ensure that the Health and Safety procedures are followed by all personnel.Keep and maintain accurate records for health and safety including safe systems of work, training records and agency induction.Assist security when doing end of shift searches, in being a witness and also be of support when required for random searches.Managing the activities and resources to achieve financial, operational and customer service objectives.Plan and manage the staffing levels, ordering or canceling agency staff when required to ensure optimum level of staffing is being used within budget.Monitor levels of consumables and conveying this information to administration when supplies are low.Ensure equipment is operational and relevant checks are made and maintained. When problems arise, contact the relevant contractors to resolve the issue.Ensure the AMP scheme is used to manage absence using disciplinary system where necessary up to and including the written warning stage. Assisting in the recruitment, training and development of individuals and the team, using company procedures and in house resources available.Conduct appraisals with employees and monitor performance, giving feedback to individuals.Assist in the management productivity to achieve KPIs, changing priorities where necessary, and be proactive in looking for continuous improvements.Ensure company policies are adhered to and administration functions completed.Promote harmonious and effective working relationships both internally and externally, ensuring excellent customer service through a combination of communication, team work, motivation and leadership.Communicating information to incoming team leaders to have an effective shift handover procedure. Also to communicate both upwards and downwards to enhance staff morale and understanding of business needs.Ensure you have a full working knowledge of all operational systems and have the ability to help staff where necessary.Seek and partake in opportunities to develop own capability and competence in the role.The ideal candidate will: Be customer focused and experienced working within a warehouse/logistics/production environment.Be a staff motivator and have the ability to communicate at all levels.Be an organized and effective planner with proactice decision making skills.Have strong listening skills and have the ability to effectively handle conflict situationsHave experience of working in a multi paced environment, able to multi task.Be assertive and have the ability to coach and train.Strong PC and systems skills. Main accountabilities to include but not be limited to:Ensure that the Health and Safety procedures are followed by all personnel.Keep and maintain accurate records for health and safety including safe systems of work, training records and agency induction.Assist security when doing end of shift searches, in being a witness and also be of support when required for random searches.Managing the activities and resources to achieve financial, operational and customer service objectives.Plan and manage the staffing levels, ordering or canceling agency staff when required to ensure optimum level of staffing is being used within budget.Monitor levels of consumables and conveying this information to administration when supplies are low.Ensure equipment is operational and relevant checks are made and maintained. When problems arise, contact the relevant contractors to resolve the issue.Ensure the AMP scheme is used to manage absence using disciplinary system where necessary up to and including the written warning stage. Assisting in the recruitment, training and development of individuals and the team, using company procedures and in house resources available.Conduct appraisals with employees and monitor performance, giving feedback to individuals.Assist in the management productivity to achieve KPIs, changing priorities where necessary, and be proactive in looking for continuous improvements.Ensure company policies are adhered to and administration functions completed.Promote harmonious and effective working relationships both internally and externally, ensuring excellent customer service through a combination of communication, team work, motivation and leadership.Communicating information to incoming team leaders to have an effective shift handover procedure. Also to communicate both upwards and downwards to enhance staff morale and understanding of business needs.Ensure you have a full working knowledge of all operational systems and have the ability to help staff where necessary.Seek and partake in opportunities to develop own capability and competence in the role.The ideal candidate will: Be customer focused and experienced working within a warehouse/logistics/production environment.Be a staff motivator and have the ability to communicate at all levels.Be an organized and effective planner with proactice decision making skills.Have strong listening skills and have the ability to effectively handle conflict situationsHave experience of working in a multi paced environment, able to multi task.Be assertive and have the ability to coach and train.Strong PC and systems skills.','2011-09-07 07:22:52',1,'',10030016,''),(30017,'iphone','i','i','i','i','i','GB','i','apple@app.com','iphone','iphone is a the brand which you all know about, do we need to say more....','CUPERTINO, California—May 3, 2011—Apple® today updated its signature all-in-one iMac® with next generation quad-core processors, powerful new graphics, groundbreaking high-speed Thunderbolt I/O technology and a new FaceTime® HD camera. Starting at $1,199, the new iMac is up to 70 percent faster and new graphics deliver up to three times the performance of the previous generation.*\r\n“Our customers love the iMac’s aluminum enclosure, gorgeous display and all-in-one design,” said Philip Schiller, Apple’s senior vice president of Worldwide Product Marketing. “With next generation quad-core processors, powerful new graphics, Thunderbolt technology and a FaceTime HD camera, we\'ve made the world’s best desktop even better.”\r\nThe new iMac features quad-core Intel Core i5 processors with an option for customers to choose Core i7 processors up to 3.4 GHz. These next generation processors feature an integrated memory controller for an amazingly responsive experience and a powerful new media engine for high-performance video encoding and decoding. With new AMD Radeon HD graphics processors, the new iMac has the most powerful graphics ever in an all-in-one desktop.\r\niMac is the first desktop computer on the market to include groundbreaking Thunderbolt I/O technology. The 21.5-inch iMac has a single Thunderbolt port while the 27-inch model features two ports for even greater expansion. Developed by Intel with collaboration from Apple, Thunderbolt enables expandability never before possible on an all-in-one computer. Featuring two bi-directional channels with transfer speeds up to an amazing 10Gbps each, Thunderbolt delivers PCI Express directly to external high performance peripherals such as RAID arrays, and can support FireWire® and USB consumer devices, and Gigabit Ethernet networks via adapters. Thunderbolt also supports DisplayPort for high resolution displays and works with existing adapters for HDMI, DVI and VGA displays. Freely available for implementation on systems, cables and devices, Thunderbolt technology is expected to be widely adopted as a new standard for high performance I/O.\r\niMac includes a built-in FaceTime HD camera and Apple’s innovative FaceTime software for crisp, widescreen video calling the whole family can enjoy. The new camera supports high definition video calls between all FaceTime HD-enabled Macs and standard resolution calls with iPad® 2, iPhone® 4, the current generation iPod touch® and other Intel-based Macs. The iMac continues to feature its signature aluminum and glass design, gorgeous IPS LED-backlit high resolution display, SD card slot and comes with Apple’s innovative Magic Mouse or Magic Trackpad.\r\nContinuing Apple’s commitment to the environment, Apple’s desktop line is a leader in green design. The iMac meets stringent Energy Star 5.2 requirements and achieves EPEAT Gold rating.** iMac features LED-backlit displays that are mercury-free and made with arsenic-free glass. iMac uses PVC-free components and cables, contains no brominated flame retardants, uses highly recyclable materials and features material-efficient system and packaging designs.\r\nEvery Mac comes with Mac OS® X Snow Leopard®, the world’s most advanced operating system, and iLife®, Apple’s innovative suite of applications for creating and sharing great photos, movies and music. Snow Leopard builds on more than a decade of innovation and includes the Mac App Store? for finding great new apps for your Mac. iLife ’11 features iPhoto® with stunning full screen views for browsing, editing and sharing photos; iMovie® with powerful easy-to-use tools to transform home videos into fun theatrical trailers; and GarageBand® with new ways to improve your playing and create great sounding songs.\r\nPricing & Availability \r\nThe new iMac is available through the Apple Store® (www.apple.com), Apple’s retail stores and Apple Authorized Resellers. The 21.5-inch iMac is available in two configurations: one with a 2.5 GHz quad-core Intel Core i5, AMD Radeon HD 6750M and 500GB hard drive for a suggested retail price of $1,199 (US); and one with a 2.7 GHz quad-core Intel Core i5, AMD Radeon HD 6770M and 1TB hard drive for a suggested retail price of $1,499 (US). The new 27-inch iMac is available in two models: one with a 2.7 GHz quad-core Intel Core i5, AMD Radeon HD 6770M and 1TB hard drive for a suggested retail price of $1,699 (US); and one with a 3.1 GHz quad-core Intel Core i5, AMD Radeon HD 6970M and 1TB hard drive for a suggested retail price of $1,999 (US).\r\nConfigure-to-order options include faster Intel Core i7 processors up to 3.4 GHz, additional hard drive capacity up to 2TB, a 256GB solid state drive, additional DDR3 memory and AppleCare® Protection Plan. Additional technical specifications and configure-to-order options and accessories are available online at www.apple.com/imac.\r\n*Testing conducted by Apple in April 2011 using preproduction iMac configurations. For more information visit www.apple.com/imac/features.html.\r\n**Claim based on energy efficiency categories and products listed within the EPA ENERGY STAR 5.2 energy database as of April 2011. EPEAT is an independent organization that helps customers compare the environmental performance of notebooks and desktops. Products meeting all of the 23 required criteria and at least 75 percent of the optional criteria are recognized as EPEAT Gold products. The EPEAT program was conceived by the US EPA and is based on IEEE 1680 standard for Environmental Assessment of Personal Computer Products. For more information visit www.epeat.net.\r\nApple designs Macs, the best personal computers in the world, along with OS X, iLife, iWork and professional software. Apple leads the digital music revolution with its iPods and iTunes online store. Apple has reinvented the mobile phone with its revolutionary iPhone and App Store, and has recently introduced iPad 2 which is defining the future of mobile media and computing devices.\r\n\r\n','2011-09-07 07:31:46',1,'',10030017,''),(30018,'ras','r','r','r','r','r','GB','r','rrrr','r','rrrr','rrrr','2011-09-07 07:33:44',1,'',10030018,''),(30019,'apple inc','o','o','o','o','o','GB','o','apple@app2.com','apple inc','apple inc','apple industry','2011-09-07 07:39:03',1,'',10030019,''),(30020,'apple corporation','i','i','i','i','i','GB','i','apple@corp.com','apple','apple','apple','2011-09-07 07:42:48',1,'',10030020,'');
/*!40000 ALTER TABLE `recruiters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applications` (
  `idApplications` int(11) NOT NULL AUTO_INCREMENT,
  `liCandidateID` int(11) DEFAULT NULL,
  `dtEntered` date DEFAULT NULL,
  `aFirstName` varchar(45) DEFAULT NULL,
  `aLastName` varchar(45) DEFAULT NULL,
  `aDateofbirth` date DEFAULT NULL,
  `aProfileSummary` varchar(500) DEFAULT NULL,
  `documentID` int(11) DEFAULT NULL,
  `aApplicationEmail` varchar(255) DEFAULT NULL,
  `aApplicationStatus` int(11) DEFAULT '0',
  `dtstatuschanged` datetime DEFAULT NULL,
  PRIMARY KEY (`idApplications`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (1,NULL,NULL,'Test','Test','2012-10-25','This is a test profile summary which was put in covering letter...',0,NULL,0,NULL);
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_advertdetail`
--

DROP TABLE IF EXISTS `tb_advertdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_advertdetail` (
  `idtb_advertdetail` int(11) NOT NULL AUTO_INCREMENT,
  `adkey` int(11) DEFAULT NULL,
  `adpath` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idtb_advertdetail`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_advertdetail`
--

LOCK TABLES `tb_advertdetail` WRITE;
/*!40000 ALTER TABLE `tb_advertdetail` DISABLE KEYS */;
INSERT INTO `tb_advertdetail` VALUES (1,1,'/adverts/ad_andriod.png'),(2,1,'/adverts/ad_mac.png'),(3,1,'/adverts/ad_nokia.png'),(4,1,'/adverts/ad_winserv2.png'),(11,1,'/adverts/ad_burberry.png'),(10,1,'/adverts/ad_gucci.png'),(9,1,'/adverts/ad_ysl.png');
/*!40000 ALTER TABLE `tb_advertdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `getjobsarchived`
--

DROP TABLE IF EXISTS `getjobsarchived`;
/*!50001 DROP VIEW IF EXISTS `getjobsarchived`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `getjobsarchived` (
  `idJobs` int(11),
  `sTitle` varchar(255),
  `sShortDescription` varchar(255),
  `sFreeText` varchar(255),
  `sDescription` longtext,
  `dtEnteredDate` date,
  `sSalaryText` varchar(100),
  `sMinSal` int(11),
  `EmployeeID` int(11),
  `termid` int(11),
  `sMaxSal` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tb_applicationstatus`
--

DROP TABLE IF EXISTS `tb_applicationstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_applicationstatus` (
  `idtb_applicationstatus` int(11) NOT NULL AUTO_INCREMENT,
  `aApplicationstatus` int(11) DEFAULT NULL,
  `sTerm` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idtb_applicationstatus`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_applicationstatus`
--

LOCK TABLES `tb_applicationstatus` WRITE;
/*!40000 ALTER TABLE `tb_applicationstatus` DISABLE KEYS */;
INSERT INTO `tb_applicationstatus` VALUES (1,0,'Application Under Review'),(2,1,'Invited for interview'),(3,2,'Formal Job offer');
/*!40000 ALTER TABLE `tb_applicationstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailresponseterms`
--

DROP TABLE IF EXISTS `emailresponseterms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailresponseterms` (
  `idemailresponseterms` int(11) NOT NULL AUTO_INCREMENT,
  `idemailresponse` int(11) DEFAULT NULL,
  `Catid` int(11) DEFAULT NULL,
  `Termid` int(11) DEFAULT NULL,
  PRIMARY KEY (`idemailresponseterms`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailresponseterms`
--

LOCK TABLES `emailresponseterms` WRITE;
/*!40000 ALTER TABLE `emailresponseterms` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailresponseterms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appjobmapper`
--

DROP TABLE IF EXISTS `appjobmapper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appjobmapper` (
  `idappjobmapper` int(11) NOT NULL AUTO_INCREMENT,
  `idApplications` int(11) DEFAULT NULL,
  `idjobs` int(11) DEFAULT NULL,
  PRIMARY KEY (`idappjobmapper`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appjobmapper`
--

LOCK TABLES `appjobmapper` WRITE;
/*!40000 ALTER TABLE `appjobmapper` DISABLE KEYS */;
/*!40000 ALTER TABLE `appjobmapper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `Catid` int(11) NOT NULL,
  `sCategory` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Catid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1000,'Location'),(1001,'Industry'),(1002,'Contract Type'),(1003,'Hours'),(1004,'Employer'),(1005,'Salary'),(10000,'Default');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailresponse`
--

DROP TABLE IF EXISTS `emailresponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailresponse` (
  `idemailresponse` int(11) NOT NULL AUTO_INCREMENT,
  `rStatus` int(11) DEFAULT NULL,
  `rdtsent` date DEFAULT NULL,
  `rEmailtype` int(11) DEFAULT NULL,
  `rEmailaddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idemailresponse`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailresponse`
--

LOCK TABLES `emailresponse` WRITE;
/*!40000 ALTER TABLE `emailresponse` DISABLE KEYS */;
INSERT INTO `emailresponse` VALUES (1,1,'2011-04-21',0,'moeeens@yahoo.com'),(2,1,'2011-04-21',0,'moeeens@yahoo.com'),(3,1,'2011-04-21',0,'moeeens@yahoo.com1'),(4,0,'2011-09-05',1,'route@yahoo.com'),(5,0,'2011-09-05',1,'mkh@yahoo.com'),(6,0,'2011-09-07',1,'peacock@aa.com'),(7,0,'2011-09-07',1,'apple@app.com'),(8,0,'2011-09-07',1,'rrrr'),(9,0,'2011-09-07',1,'apple@corp.com'),(10,0,'2011-09-07',2,'tp@yahoo.com'),(11,0,'2011-09-07',2,'aws@yahoo.com'),(12,0,'2011-09-08',2,'taleocorp'),(13,0,'2011-09-08',2,'taleocorp1'),(14,0,'2011-09-08',2,'route@route.com'),(15,0,'2011-09-08',2,'smoothy@yahoo.com'),(16,0,'2011-09-08',0,'jen.humphrey@yahoo.com'),(17,0,'2011-09-08',0,'ss@yahoo.com'),(18,0,'2011-09-08',0,'moeeens@yahoo.com'),(19,0,'2011-09-08',0,'moeeens@yahoo.com'),(20,0,'2011-09-08',0,'moeeen@yahoo.com'),(21,0,'2011-09-08',0,'moeeen@yahoo.com'),(22,0,'2011-09-08',1,'moin@hot.com'),(23,0,'2011-09-08',1,'moin@hot.com'),(24,0,'2011-09-08',1,'moin@hot.com'),(25,0,'2011-09-08',1,'moin@hot.com'),(26,0,'2011-09-08',1,'moin@hot.com'),(27,0,'2011-09-08',1,'smoothy@yahoo.com'),(28,0,'2011-09-08',0,'alice.murphy@tt.com'),(29,0,'2011-09-13',2,'jackd@ymail.com'),(30,0,'2011-09-13',2,'heaton@yahoo.com'),(31,0,'2011-09-13',2,'picomilli@y.com'),(32,0,'2012-10-27',0,'moeeens@yahoo.com'),(33,0,'2012-10-27',0,'moeeens@yahoo.com'),(34,0,'2012-10-27',0,'moeeens@yahoo.com'),(35,0,'2012-10-27',0,'moeeens@yahoo.com'),(36,0,'2012-10-27',0,'moeeens@yahoo.com'),(37,0,'2012-10-27',0,'moeeens@yahoo.com');
/*!40000 ALTER TABLE `emailresponse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `sArticleID` int(11) NOT NULL,
  `ArticleName` varchar(100) DEFAULT NULL,
  `Article_data` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`sArticleID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (20000,'Harwardbrown','/articles/getasset.gif'),(130002,'HP','/articles/hp-logo.jpg'),(10030003,'IBM','/articles/ibm-logo.jpg'),(10030004,'SONY','/articles/sony_logo_section.jpg'),(10030005,'APPLE','/articles/Apple_logo.png'),(10030006,'HBO','/articles/hbo_logo.jpg'),(10030007,'TNT','/articles/TNT_Logo2.jpg'),(10030009,'test.PNG','/articles/10030009test.PNG'),(10030010,'test.PNG','/articles/10030010test.PNG'),(10030011,'test.PNG','/articles/10030011test.PNG'),(10030012,'yslogo.jpg','/articles/yslogo.jpg'),(10030013,'logotest.png','/articles/logotest.png'),(10030014,'logotest.png','/articles/logotest.png'),(10030015,'logotest.png','/articles/logotest.png'),(10030016,'logo.jpg','/articles/logo.jpg'),(10030017,'logotest.png','/articles/logotest.png'),(10030018,'logotest.png','/articles/logotest.png'),(10030019,'silver-apple-logo.png','/articles/silver-apple-logo.png'),(10030020,'silver-apple-logo.png','/articles/silver-apple-logo.png');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `applicationaggregate`
--

DROP TABLE IF EXISTS `applicationaggregate`;
/*!50001 DROP VIEW IF EXISTS `applicationaggregate`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `applicationaggregate` (
  `idjobs` int(11),
  `applicationvolume` bigint(21)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `idJobs` int(11) NOT NULL AUTO_INCREMENT,
  `sTitle` varchar(255) DEFAULT NULL,
  `sShortDescription` varchar(255) DEFAULT NULL,
  `sDescription` longtext,
  `dtEnteredDate` date DEFAULT NULL,
  `sSalaryText` varchar(100) DEFAULT NULL,
  `sMinSal` int(11) DEFAULT NULL,
  `sMaxSal` int(11) DEFAULT NULL,
  `sRef` varchar(45) DEFAULT NULL,
  `sFreeText` varchar(255) DEFAULT NULL,
  `sJobstartdate` date DEFAULT NULL,
  `sJobenddate` date DEFAULT NULL,
  PRIMARY KEY (`idJobs`),
  FULLTEXT KEY `Ind2` (`sFreeText`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,'Consultants Required','My client is a highly entrepreneurial and success driven recruitment company specialising in a number of lucrative sectors within the industry. They cover markets such as banking and finance, IT, engineering, are looking for consultants','My client is a highly entrepreneurial and success driven recruitment company specialising in a number of lucrative sectors within the industry. They cover markets such as banking and finance, IT, engineering, are looking for consultants','2012-10-27','18-22K',0,0,'R1','Consultants Required','2012-10-11','2013-02-11'),(2,'SQL Developer','SQL Developer with good knowledge and atleast 2-4 years of experience in field of .NET SSIS, SASS, SSRS is required by our corporate client who is willing to pay handsome packages to the eligible candidate. Ideally you should','SQL Developer with good knowledge and atleast 2-4 years of experience in field of .NET SSIS, SASS, SSRS is required by our corporate client who is willing to pay handsome packages to the eligible candidate. Ideally you should','2012-10-27','30-35K',0,0,'R2','SQL Developer','2012-07-11','2013-09-11'),(3,'ETL Developer','* ETL, SSIS, SSRS, SQL Sevrer, T-SQL, BI, developemnt*Role- ETL/SSIS DeveloperLocation- Central London Role Description:My Client are a successful corporate organization based in Central London, where you will be','* ETL, SSIS, SSRS, SQL Sevrer, T-SQL, BI, developemnt*Role- ETL/SSIS DeveloperLocation- Central London Role Description:My Client are a successful corporate organization based in Central London, where you will be','2012-10-27','40-45K',0,0,'R3','ETL Developer','2012-05-11','2013-02-11'),(4,'BI Consultant required for SQL Server 2012','Business Intelligence Consultant, SQL Server, BI, SSAS, SSIS Our client is seeking to hire 2 new recruits, a stellar Business Intelligence Consultant and a Senior Business Intelligence Consultant to joing their leading and powerfull team','Business Intelligence Consultant, SQL Server, BI, SSAS, SSIS Our client is seeking to hire 2 new recruits, a stellar Business Intelligence Consultant and a Senior Business Intelligence Consultant to joing their leading and powerfull team','2012-10-27','30-40K',0,0,'R4','BI Consultant required for SQL Server 2012','2012-03-11','2013-08-11'),(37,'delivery driver required urgently','we are urgently looking for delivery drivers for our warehouse, must have good moral character, ethical and hardworking, should be able to get the job done','we are urgently looking for delivery drivers for our warehouse, must have good moral character, ethical and hardworking, should be able to get the job done','2012-10-29','Negotiable',0,0,'JREF 2002','delivery driver required urgently','2012-09-11','2013-02-11'),(6,'Dot Net - Senior Developer','This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - ','This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - ','2012-10-27','22-40K',0,0,'R5','Dot Net - Senior Developer','2012-02-11','2013-04-11'),(7,'Data Analyst','We are currently seeking a data analyst with good knowledge over SPSS , Weka and other data modeling tools along with atleast 3-5 years of experience in industry and client interation. Ideally you should have worked with corporate','We are currently seeking a data analyst with good knowledge over SPSS , Weka and other data modeling tools along with atleast 3-5 years of experience in industry and client interation. Ideally you should have worked with corporate','2012-10-27','Negotiable $',0,0,'RA001','Data Analyst','2012-05-11','2013-03-11'),(8,'Iphone App Developer','Our corporate client is seeking Iphone developers for it\'s new products which are to be released in the last quarter of this year, we are on the tight schedule so we need to get the best people in as soon as possible, please get in touch','Our corporate client is seeking Iphone developers for it\'s new products which are to be released in the last quarter of this year, we are on the tight schedule so we need to get the best people in as soon as possible, please get in touch','2012-10-27','$ Attractive',0,0,'MX1011','Iphone App Developer','2012-09-11','2013-01-11'),(9,'App developer required','working for one of the most prestigius companies in the world sony vaio gives the flexi\r\nbility for you to do that\r\n\r\nwe offer \r\n\r\n1- attractive salary\r\n2- long term pension or 401K\r\n3- test work\r\n\r\n\r\n','working for one of the most prestigius companies in the world sony vaio gives the flexi\r\nbility for you to do that\r\n\r\nwe offer \r\n\r\n1- attractive salary\r\n2- long term pension or 401K\r\n3- test work\r\n\r\n\r\n','2012-10-27','Testjobsin',0,0,'JB11','App developer required','2012-09-11','2013-08-11'),(10,'C++ developer required','My client is looking for a C++ developer who can work in collaboration with a few other companies and vendors in the market to take our new product to the next level, this includes but not limited to traveling occasionally and on clients demand.','My client is looking for a C++ developer who can work in collaboration with a few other companies and vendors in the market to take our new product to the next level, this includes but not limited to traveling occasionally and on clients demand.','2012-10-27','$ Attractive',0,0,'IBM101','C++ developer required','2012-03-11','2013-05-11'),(11,'Tester Required','This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - ','This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - ','2012-10-27','$ Attractive',0,0,'IBM102','Tester Required','2012-01-11','2013-09-11'),(12,'Tester Required X 2','This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - ','This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - ','2012-10-27','$ Attractive',0,0,'Add12','Tester Required X 2','2012-07-11','2013-09-11'),(13,'Blade Server Technician Required','We are looking for someone with experience in the support role who has already worked in the industry and is experienced and knows what he/she is doing. You should be punctual and should be able to come to the work place on shift timings.','We are looking for someone with experience in the support role who has already worked in the industry and is experienced and knows what he/she is doing. You should be punctual and should be able to come to the work place on shift timings.','2012-10-27','$ Attractive',0,0,'Add12','Blade Server Technician Required','2012-09-11','2013-06-11'),(14,'Designer Required','We are looking for innovative designers who can work from home or office and complete the tasks when and where required, this role is based in our Newzealand office and you would need to travel frequently to the destination when required','We are looking for innovative designers who can work from home or office and complete the tasks when and where required, this role is based in our Newzealand office and you would need to travel frequently to the destination when required','2012-10-27','$ Attractive',0,0,'Add12','Designer Required','2012-02-11','2013-01-11'),(15,'Testers Required','This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - ','This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - ','2012-10-27','$ Attractive',0,0,'Add12','Testers Required','2012-03-11','2013-10-11'),(16,'Senior Managers From Food Background','This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - ','This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - This is a test post please donot apply - ','2012-10-27','po',0,0,'RP1','Senior Managers From Food Background','2012-07-11','2013-03-11'),(17,'Assistant Manager','We are currently seeking assistant managers to work at our facility and with other senior partners as / when required. Ideally you should have expereince in working on the same platform, we donot discriminate based on race, religioni, sex','We are currently seeking assistant managers to work at our facility and with other senior partners as / when required. Ideally you should have expereince in working on the same platform, we donot discriminate based on race, religioni, sex','2012-10-27','$ Attractive',0,0,'RP2','Assistant Manager','2012-06-11','2013-06-11'),(18,'Office Assistant','Looking for all the people who want to be in an easy but responsible role as a office assistant, ideally you should live locally and will be from around the local neighbourhood','Looking for all the people who want to be in an easy but responsible role as a office assistant, ideally you should live locally and will be from around the local neighbourhood','2012-10-27','add1',0,0,'RP3','Office Assistant','2012-06-11','2013-09-11'),(19,'Retail Assistant','We are actively seeking retail assistants to work for us at our premises and unsupervised if you think you have what it takes please give us a call at your earliest, we will close the positions if we find a suitable candidate','We are actively seeking retail assistants to work for us at our premises and unsupervised if you think you have what it takes please give us a call at your earliest, we will close the positions if we find a suitable candidate','2012-10-27','add1',0,0,'RP4','Retail Assistant','2012-03-11','2013-03-11'),(20,'Apple / IMAC dev','tester developer required for working on our imac apple based products the person should \r\nbe able to develop rapid applications and should have an expereince in developing\r\nwindows based mobile appli','tester developer required for working on our imac apple based products the person should \r\nbe able to develop rapid applications and should have an expereince in developing\r\nwindows based mobile appli','2012-10-27','$ Attrac$$$tive',0,0,'RP5','Apple / IMAC dev','2012-06-11','2013-11-11'),(21,'SQL Developers required','BI Developer, SQL Server, SSAS, SSIS, SSRS, £50K, LondonSQL Server BI Developer urgently required by the largest global online vendor. They are looking for somebody that is experienced with the  person should have idea of SQL/NOSQL','BI Developer, SQL Server, SSAS, SSIS, SSRS, £50K, LondonSQL Server BI Developer urgently required by the largest global online vendor. They are looking for somebody that is experienced with the  person should have idea of SQL/NOSQL','2012-10-27','30-35K',0,0,'RP6','SQL Developers required','2012-09-11','2013-11-11'),(22,'SQL Developer','SQL Developer/SSRS/SSIS/.NET/Insurance DomainA major insurance provider require a proven SQL Developer, SSRS,SSIS.NET to join a fast growing team, be responsible for the development and ongoing suppor','SQL Developer/SSRS/SSIS/.NET/Insurance DomainA major insurance provider require a proven SQL Developer, SSRS,SSIS.NET to join a fast growing team, be responsible for the development and ongoing suppor','2012-10-27','30-35K',0,0,'TT500','SQL Developer','2012-05-11','2013-02-11'),(23,'SQL Developer for contractual projects','SQL Developer/SSRS/SSIS/.NET/Insurance DomainA major insurance provider require a proven SQL Developer, SSRS,SSIS.NET to join a fast growing team, be responsible for the development and ongoing suppor','SQL Developer/SSRS/SSIS/.NET/Insurance DomainA major insurance provider require a proven SQL Developer, SSRS,SSIS.NET to join a fast growing team, be responsible for the development and ongoing suppor','2012-10-27','30-35K',0,0,'TRR55','SQL Developer for contractual projects','2012-10-11','2013-07-11'),(25,'Designers Required Urgently','We are looking for innovative designers who can work from home or office and complete the tasks when and where required, this role is based in our Newzealand office and you would need to travel frequently to the destination when required','We are looking for innovative designers who can work from home or office and complete the tasks when and where required, this role is based in our Newzealand office and you would need to travel frequently to the destination when required','2012-10-27','$negotiable',0,0,'KRG111','Designers Required Urgently','2012-10-11','2013-08-11'),(27,'Customer Care Assistant, Online Fashion Company','We are looking for beauty and pr sales assistants who can work at our retails unsupervised and without any guidance, ideally you should have expereince of working in a  similar role.','We are looking for beauty and pr sales assistants who can work at our retails unsupervised and without any guidance, ideally you should have expereince of working in a  similar role.','2012-10-27','$negotiable',0,0,'KE450','Customer Care Assistant, Online Fashion Company','2012-08-11','2013-06-11'),(28,'Creative Director, EU Fashion','We are currently looking for a creative director who can assist us with the heavy workload which we are in as of 2011, the ideal candidate must have expereince in the role in previous position','We are currently looking for a creative director who can assist us with the heavy workload which we are in as of 2011, the ideal candidate must have expereince in the role in previous position','2012-10-27','$negotiable',0,0,'KW999','Creative Director, EU Fashion','2012-10-11','2013-08-11'),(29,'Finance Manager - Retail & Fashion','We are looking for beauty and pr sales assistants who can work at our retails unsupervised and without any guidance, ideally you should have expereince of working in a  similar role.','We are looking for beauty and pr sales assistants who can work at our retails unsupervised and without any guidance, ideally you should have expereince of working in a  similar role.','2012-10-27','$negotiable',0,0,'JR12','Finance Manager - Retail & Fashion','2012-05-11','2013-07-11'),(30,'Beauty and Fashion PR Account Executive','We are looking for beauty and pr sales assistants who can work at our retails unsupervised and without any guidance, ideally you should have expereince of working in a  similar role.','We are looking for beauty and pr sales assistants who can work at our retails unsupervised and without any guidance, ideally you should have expereince of working in a  similar role.','2012-10-27','$negotiable',0,0,'KE5353','Beauty and Fashion PR Account Executive','2012-07-11','2013-03-11'),(31,'Fashionwear designers required','We are looking for innovative designers who can work from home or office and complete the tasks when and where required, this role is based in our Newzealand office and you would need to travel frequently to the destination when required','We are looking for innovative designers who can work from home or office and complete the tasks when and where required, this role is based in our Newzealand office and you would need to travel frequently to the destination when required','2012-10-27','$negotiable',0,0,'KWER3','Fashionwear designers required','2012-05-11','2013-02-11'),(36,'In House delivery Manager','we are looking for an inhouse delivery manager who would be able to supervise the packaging, operations and transportation of goods from our local warehouse to','we are looking for an inhouse delivery manager who would be able to supervise the packaging, operations and transportation of goods from our local warehouse to','2012-10-29','Negotiable',0,0,'JR1000','In House delivery Manager','2012-05-11','2013-03-11'),(32,'Assistant Manager','We are currently seeking assistant managers to work at our facility and with other senior partners as / when required. Ideally you should have expereince in working on the same platform, we donot discriminate based on race, religioni, sex','We are currently seeking assistant managers to work at our facility and with other senior partners as / when required. Ideally you should have expereince in working on the same platform, we donot discriminate based on race, religioni, sex','2012-10-27','20K-30K',0,0,'KIWI','Assistant Manager','2012-09-11','2013-08-11'),(33,'Hardware engineer at apple','We are seeking an assistant manager to work at our remote location and to supervise our new team, please contact us ASAP if you have the expereince in this sector.','We are seeking an assistant manager to work at our remote location and to supervise our new team, please contact us ASAP if you have the expereince in this sector.','2012-10-27','15000',0,0,'KIWI2','Hardware engineer at apple','2012-06-11','2013-06-11'),(34,'Garment Technician Required','we are looking for  a garment technician with a degree in fashion or design, ideally you have passion for design and fashion and should be able to work without any guidance in the field and with other designers, must be quick learner','we are looking for  a garment technician with a degree in fashion or design, ideally you have passion for design and fashion and should be able to work without any guidance in the field and with other designers, must be quick learner','2012-10-27','$competetive',0,0,'9000','Garment Technician Required','2012-03-11','2013-07-11'),(35,'Operations Director','we are currently seeking an operations director who can work within our headoffice and manage our offshore teams both directed and un-directed, you should ideally have an expereince of working in large corporations before','we are currently seeking an operations director who can work within our headoffice and manage our offshore teams both directed and un-directed, you should ideally have an expereince of working in large corporations before','2012-10-27','Above 80K PA',0,0,'JT','Operations Director','2012-09-11','2013-05-11');
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salaryoccupations`
--

DROP TABLE IF EXISTS `salaryoccupations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salaryoccupations` (
  `idsalaryoccupations` int(11) NOT NULL AUTO_INCREMENT,
  `occupationname` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idsalaryoccupations`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salaryoccupations`
--

LOCK TABLES `salaryoccupations` WRITE;
/*!40000 ALTER TABLE `salaryoccupations` DISABLE KEYS */;
INSERT INTO `salaryoccupations` VALUES (1,'Arts'),(2,'Management'),(3,'HR & Training'),(4,'Charities'),(5,'Volunteering'),(6,'Sales'),(7,'IT & Telecom'),(8,'Finance'),(9,'Recruitment'),(10,'Executive'),(11,'Marketing'),(12,'Media'),(13,'Health'),(14,'Social Care'),(15,'Secretarial');
/*!40000 ALTER TABLE `salaryoccupations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salarycalc`
--

DROP TABLE IF EXISTS `salarycalc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salarycalc` (
  `idSalaryCalc` int(11) NOT NULL AUTO_INCREMENT,
  `Question1` varchar(200) DEFAULT NULL,
  `Question2` varchar(200) DEFAULT NULL,
  `Question3` varchar(200) DEFAULT NULL,
  `Question4` varchar(200) DEFAULT NULL,
  `Question5` varchar(200) DEFAULT NULL,
  `Question6` varchar(200) DEFAULT NULL,
  `Question7` varchar(200) DEFAULT NULL,
  `Question8` varchar(200) DEFAULT NULL,
  `dtEntered` datetime DEFAULT NULL,
  `dtEnteredByip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idSalaryCalc`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salarycalc`
--

LOCK TABLES `salarycalc` WRITE;
/*!40000 ALTER TABLE `salarycalc` DISABLE KEYS */;
INSERT INTO `salarycalc` VALUES (1,'Arts','1','0-10000','1','GCSE','1','','','2011-09-09 16:01:23','127.0.0.1'),(2,'Arts','1','0-10000','1','GCSE','1','','','2011-09-09 16:02:45','127.0.0.1'),(3,'Arts','1','0-10000','1','GCSE','1','','','2011-09-09 16:03:58','127.0.0.1'),(4,'Arts','1','0-10000','1','GCSE','1','','','2011-09-09 16:05:14','127.0.0.1'),(5,'Arts','1','0-10000','1','GCSE','1','','','2012-10-21 13:52:59','::1');
/*!40000 ALTER TABLE `salarycalc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobviews`
--

DROP TABLE IF EXISTS `jobviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobviews` (
  `idjobviews` int(11) NOT NULL AUTO_INCREMENT,
  `empid` int(11) DEFAULT NULL,
  `dtentered` date DEFAULT NULL,
  PRIMARY KEY (`idjobviews`)
) ENGINE=MyISAM AUTO_INCREMENT=1990 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobviews`
--

LOCK TABLES `jobviews` WRITE;
/*!40000 ALTER TABLE `jobviews` DISABLE KEYS */;
INSERT INTO `jobviews` VALUES (1,30012,'2011-09-05'),(2,30012,'2011-09-05'),(3,30012,'2011-09-05'),(4,30002,'2011-09-05'),(5,30012,'2011-09-05'),(6,30012,'2011-09-05'),(7,30002,'2011-09-05'),(8,30012,'2011-09-05'),(9,30012,'2011-09-05'),(10,30012,'2011-09-05'),(11,30012,'2011-09-05'),(12,30012,'2011-09-05'),(13,30012,'2011-09-05'),(14,30012,'2011-09-05'),(15,30002,'2011-09-05'),(16,30002,'2011-09-05'),(17,30012,'2011-09-05'),(18,30012,'2011-09-05'),(19,30012,'2011-09-05'),(20,30012,'2011-09-05'),(21,30012,'2011-09-05'),(22,30002,'2011-09-05'),(23,30012,'2011-09-05'),(24,30012,'2011-09-05'),(25,30002,'2011-09-06'),(26,30012,'2011-09-06'),(27,30012,'2011-09-06'),(28,30002,'2011-09-06'),(29,30002,'2011-09-06'),(30,30002,'2011-09-06'),(31,30002,'2011-09-06'),(32,30002,'2011-09-06'),(33,30012,'2011-09-06'),(34,30012,'2011-09-06'),(35,30002,'2011-09-06'),(36,30002,'2011-09-06'),(37,30012,'2011-09-06'),(38,30012,'2011-09-06'),(39,30012,'2011-09-06'),(40,30002,'2011-09-06'),(41,30002,'2011-09-06'),(42,30002,'2011-09-06'),(43,30002,'2011-09-06'),(44,30002,'2011-09-06'),(45,30002,'2011-09-06'),(46,30002,'2011-09-06'),(47,30002,'2011-09-06'),(48,30002,'2011-09-06'),(49,30012,'2011-09-06'),(50,30012,'2011-09-06'),(51,30002,'2011-09-06'),(52,30002,'2011-09-06'),(53,30002,'2011-09-06'),(54,30002,'2011-09-06'),(55,30012,'2011-09-06'),(56,30012,'2011-09-06'),(57,30012,'2011-09-06'),(58,30012,'2011-09-06'),(59,30002,'2011-09-06'),(60,30012,'2011-09-06'),(61,30012,'2011-09-06'),(62,30012,'2011-09-07'),(63,30012,'2011-09-07'),(64,30012,'2011-09-07'),(65,30002,'2011-09-07'),(66,30002,'2011-09-07'),(67,30012,'2011-09-07'),(68,30012,'2011-09-07'),(69,30012,'2011-09-07'),(70,30002,'2011-09-07'),(71,30012,'2011-09-07'),(72,30012,'2011-09-07'),(73,30012,'2011-09-07'),(74,30012,'2011-09-07'),(75,30002,'2011-09-07'),(76,30002,'2011-09-07'),(77,30002,'2011-09-07'),(78,30002,'2011-09-07'),(79,30002,'2011-09-07'),(80,30002,'2011-09-07'),(81,30002,'2011-09-07'),(82,30002,'2011-09-07'),(83,30012,'2011-09-07'),(84,30012,'2011-09-07'),(85,30012,'2011-09-07'),(86,30012,'2011-09-07'),(87,30012,'2011-09-07'),(88,30002,'2011-09-07'),(89,30002,'2011-09-07'),(90,30002,'2011-09-07'),(91,30002,'2011-09-07'),(92,30002,'2011-09-07'),(93,30012,'2011-09-07'),(94,30012,'2011-09-07'),(95,30012,'2011-09-07'),(96,30012,'2011-09-07'),(97,30012,'2011-09-07'),(98,30012,'2011-09-07'),(99,30012,'2011-09-07'),(100,30012,'2011-09-07'),(101,30012,'2011-09-07'),(102,30012,'2011-09-07'),(103,30012,'2011-09-07'),(104,30012,'2011-09-07'),(105,30012,'2011-09-07'),(106,30012,'2011-09-07'),(107,30012,'2011-09-07'),(108,30012,'2011-09-07'),(109,30012,'2011-09-07'),(110,30012,'2011-09-07'),(111,30012,'2011-09-07'),(112,30012,'2011-09-07'),(113,30012,'2011-09-07'),(114,30012,'2011-09-07'),(115,30012,'2011-09-07'),(116,30012,'2011-09-07'),(117,30012,'2011-09-07'),(118,30012,'2011-09-07'),(119,30012,'2011-09-07'),(120,30012,'2011-09-07'),(121,30012,'2011-09-07'),(122,30012,'2011-09-07'),(123,30012,'2011-09-07'),(124,30012,'2011-09-07'),(125,30012,'2011-09-07'),(126,30012,'2011-09-07'),(127,30012,'2011-09-07'),(128,30012,'2011-09-07'),(129,30012,'2011-09-07'),(130,30012,'2011-09-07'),(131,30012,'2011-09-07'),(132,30012,'2011-09-07'),(133,30012,'2011-09-07'),(134,30012,'2011-09-07'),(135,30012,'2011-09-07'),(136,30012,'2011-09-07'),(137,30012,'2011-09-07'),(138,30012,'2011-09-07'),(139,30012,'2011-09-07'),(140,30012,'2011-09-07'),(141,30012,'2011-09-07'),(142,30012,'2011-09-07'),(143,30012,'2011-09-07'),(144,30012,'2011-09-07'),(145,30002,'2011-09-07'),(146,30012,'2011-09-07'),(147,30012,'2011-09-07'),(148,30012,'2011-09-07'),(149,30012,'2011-09-07'),(150,30012,'2011-09-07'),(151,30012,'2011-09-07'),(152,30012,'2011-09-07'),(153,30012,'2011-09-07'),(154,30002,'2011-09-07'),(155,30002,'2011-09-07'),(156,30012,'2011-09-07'),(157,30012,'2011-09-07'),(158,30012,'2011-09-07'),(159,30012,'2011-09-07'),(160,30002,'2011-09-07'),(161,30002,'2011-09-07'),(162,30002,'2011-09-07'),(163,30002,'2011-09-07'),(164,30012,'2011-09-07'),(165,30012,'2011-09-07'),(166,30012,'2011-09-07'),(167,30012,'2011-09-07'),(168,30012,'2011-09-07'),(169,30012,'2011-09-07'),(170,30012,'2011-09-07'),(171,30012,'2011-09-07'),(172,30012,'2011-09-07'),(173,30012,'2011-09-07'),(174,30012,'2011-09-07'),(175,30002,'2011-09-07'),(176,30002,'2011-09-07'),(177,30012,'2011-09-07'),(178,30012,'2011-09-07'),(179,30012,'2011-09-07'),(180,30012,'2011-09-07'),(181,30012,'2011-09-07'),(182,30020,'2011-09-07'),(183,30020,'2011-09-07'),(184,30020,'2011-09-07'),(185,30020,'2011-09-07'),(186,30020,'2011-09-07'),(187,30020,'2011-09-07'),(188,30012,'2011-09-07'),(189,30012,'2011-09-07'),(190,30012,'2011-09-07'),(191,30002,'2011-09-07'),(192,30012,'2011-09-07'),(193,30012,'2011-09-07'),(194,30012,'2011-09-07'),(195,30002,'2011-09-07'),(196,30002,'2011-09-07'),(197,30012,'2011-09-07'),(198,30012,'2011-09-07'),(199,30012,'2011-09-07'),(200,30012,'2011-09-07'),(201,30002,'2011-09-07'),(202,30012,'2011-09-07'),(203,30012,'2011-09-07'),(204,30002,'2011-09-07'),(205,30002,'2011-09-07'),(206,30002,'2011-09-07'),(207,30002,'2011-09-07'),(208,30012,'2011-09-07'),(209,30012,'2011-09-07'),(210,30012,'2011-09-07'),(211,30012,'2011-09-07'),(212,30012,'2011-09-07'),(213,30012,'2011-09-07'),(214,30012,'2011-09-07'),(215,30012,'2011-09-07'),(216,30012,'2011-09-07'),(217,30002,'2011-09-07'),(218,30002,'2011-09-07'),(219,30012,'2011-09-07'),(220,30012,'2011-09-07'),(221,30012,'2011-09-07'),(222,30012,'2011-09-07'),(223,30012,'2011-09-07'),(224,30020,'2011-09-07'),(225,30012,'2011-09-07'),(226,30012,'2011-09-07'),(227,30012,'2011-09-07'),(228,30012,'2011-09-07'),(229,30012,'2011-09-07'),(230,30020,'2011-09-07'),(231,30012,'2011-09-08'),(232,30012,'2011-09-08'),(233,30012,'2011-09-08'),(234,30012,'2011-09-08'),(235,30020,'2011-09-08'),(236,30020,'2011-09-08'),(237,30012,'2011-09-08'),(238,30020,'2011-09-08'),(239,30020,'2011-09-08'),(240,30012,'2011-09-08'),(241,30012,'2011-09-08'),(242,30020,'2011-09-08'),(243,30020,'2011-09-08'),(244,30012,'2011-09-08'),(245,30012,'2011-09-08'),(246,30012,'2011-09-08'),(247,30012,'2011-09-08'),(248,30012,'2011-09-08'),(249,30012,'2011-09-08'),(250,30012,'2011-09-08'),(251,30012,'2011-09-08'),(252,30012,'2011-09-08'),(253,30012,'2011-09-08'),(254,30012,'2011-09-08'),(255,30012,'2011-09-08'),(256,30012,'2011-09-08'),(257,30012,'2011-09-08'),(258,30012,'2011-09-08'),(259,30012,'2011-09-08'),(260,30012,'2011-09-08'),(261,30012,'2011-09-08'),(262,30012,'2011-09-08'),(263,30012,'2011-09-08'),(264,30012,'2011-09-08'),(265,30012,'2011-09-08'),(266,30012,'2011-09-08'),(267,30012,'2011-09-08'),(268,30012,'2011-09-08'),(269,30012,'2011-09-08'),(270,30012,'2011-09-08'),(271,30012,'2011-09-08'),(272,30012,'2011-09-08'),(273,30012,'2011-09-08'),(274,30012,'2011-09-08'),(275,30012,'2011-09-08'),(276,30012,'2011-09-08'),(277,30020,'2011-09-08'),(278,30020,'2011-09-08'),(279,30020,'2011-09-08'),(280,30020,'2011-09-08'),(281,30012,'2011-09-08'),(282,30012,'2011-09-08'),(283,30012,'2011-09-08'),(284,30012,'2011-09-08'),(285,30012,'2011-09-08'),(286,30012,'2011-09-08'),(287,30012,'2011-09-08'),(288,30002,'2011-09-09'),(289,30012,'2011-09-09'),(290,30012,'2011-09-09'),(291,30012,'2011-09-09'),(292,30012,'2011-09-09'),(293,30002,'2011-09-09'),(294,30002,'2011-09-09'),(295,30002,'2011-09-09'),(296,30020,'2011-09-09'),(297,30002,'2011-09-09'),(298,30012,'2011-09-09'),(299,30002,'2011-09-09'),(300,30012,'2011-09-09'),(301,30012,'2011-09-09'),(302,30012,'2011-09-09'),(303,30012,'2011-09-09'),(304,30012,'2011-09-09'),(305,30012,'2011-09-09'),(306,30012,'2011-09-09'),(307,30012,'2011-09-09'),(308,30012,'2011-09-09'),(309,30012,'2011-09-09'),(310,30012,'2011-09-09'),(311,30012,'2011-09-09'),(312,30012,'2011-09-09'),(313,30012,'2011-09-09'),(314,30012,'2011-09-09'),(315,30012,'2011-09-09'),(316,30012,'2011-09-09'),(317,30012,'2011-09-09'),(318,30012,'2011-09-09'),(319,30012,'2011-09-09'),(320,30012,'2011-09-09'),(321,30012,'2011-09-09'),(322,30012,'2011-09-09'),(323,30012,'2011-09-09'),(324,30012,'2011-09-09'),(325,30012,'2011-09-09'),(326,30012,'2011-09-09'),(327,30012,'2011-09-09'),(328,30012,'2011-09-09'),(329,30012,'2011-09-09'),(330,30012,'2011-09-09'),(331,30012,'2011-09-09'),(332,30012,'2011-09-09'),(333,30012,'2011-09-09'),(334,30012,'2011-09-09'),(335,30012,'2011-09-09'),(336,30012,'2011-09-09'),(337,30012,'2011-09-09'),(338,30012,'2011-09-09'),(339,30012,'2011-09-09'),(340,30012,'2011-09-09'),(341,30012,'2011-09-09'),(342,30012,'2011-09-09'),(343,30012,'2011-09-09'),(344,30012,'2011-09-09'),(345,30012,'2011-09-09'),(346,30012,'2011-09-09'),(347,30012,'2011-09-09'),(348,30012,'2011-09-09'),(349,30012,'2011-09-09'),(350,30012,'2011-09-09'),(351,30012,'2011-09-09'),(352,30012,'2011-09-09'),(353,30012,'2011-09-09'),(354,30012,'2011-09-09'),(355,30012,'2011-09-09'),(356,30012,'2011-09-09'),(357,30012,'2011-09-09'),(358,30012,'2011-09-09'),(359,30012,'2011-09-09'),(360,30012,'2011-09-09'),(361,30012,'2011-09-09'),(362,30012,'2011-09-09'),(363,30012,'2011-09-09'),(364,30012,'2011-09-09'),(365,30012,'2011-09-09'),(366,30012,'2011-09-09'),(367,30012,'2011-09-09'),(368,30012,'2011-09-09'),(369,30012,'2011-09-09'),(370,30012,'2011-09-09'),(371,30012,'2011-09-09'),(372,30012,'2011-09-09'),(373,30012,'2011-09-09'),(374,30012,'2011-09-09'),(375,30012,'2011-09-09'),(376,30012,'2011-09-09'),(377,30012,'2011-09-09'),(378,30012,'2011-09-09'),(379,30012,'2011-09-09'),(380,30012,'2011-09-09'),(381,30012,'2011-09-09'),(382,30012,'2011-09-09'),(383,30012,'2011-09-09'),(384,30012,'2011-09-09'),(385,30002,'2011-09-09'),(386,30002,'2011-09-09'),(387,30012,'2011-09-09'),(388,30012,'2011-09-09'),(389,30012,'2011-09-09'),(390,30012,'2011-09-09'),(391,30012,'2011-09-09'),(392,30012,'2011-09-09'),(393,30012,'2011-09-09'),(394,30012,'2011-09-09'),(395,30012,'2011-09-09'),(396,30012,'2011-09-09'),(397,30012,'2011-09-09'),(398,30012,'2011-09-09'),(399,30002,'2011-09-09'),(400,30012,'2011-09-09'),(401,30002,'2011-09-09'),(402,30002,'2011-09-09'),(403,30012,'2011-09-09'),(404,30012,'2011-09-09'),(405,30012,'2011-09-09'),(406,30012,'2011-09-09'),(407,30020,'2011-09-09'),(408,30020,'2011-09-09'),(409,30012,'2011-09-09'),(410,30012,'2011-09-09'),(411,30012,'2011-09-09'),(412,30012,'2011-09-09'),(413,30012,'2011-09-09'),(414,30012,'2011-09-09'),(415,30012,'2011-09-09'),(416,30002,'2011-09-09'),(417,30012,'2011-09-09'),(418,30012,'2011-09-09'),(419,30012,'2011-09-09'),(420,30020,'2011-09-10'),(421,30020,'2011-09-10'),(422,30002,'2011-09-10'),(423,30002,'2011-09-10'),(424,30012,'2011-09-10'),(425,30002,'2011-09-10'),(426,30012,'2011-09-10'),(427,30012,'2011-09-10'),(428,30002,'2011-09-10'),(429,30002,'2011-09-10'),(430,30012,'2011-09-10'),(431,30012,'2011-09-10'),(432,30012,'2011-09-10'),(433,30012,'2011-09-10'),(434,30002,'2011-09-10'),(435,30002,'2011-09-10'),(436,30012,'2011-09-10'),(437,30012,'2011-09-10'),(438,30012,'2011-09-10'),(439,30012,'2011-09-10'),(440,30012,'2011-09-10'),(441,30012,'2011-09-10'),(442,30012,'2011-09-10'),(443,30002,'2011-09-10'),(444,30002,'2011-09-10'),(445,30012,'2011-09-10'),(446,30012,'2011-09-10'),(447,30012,'2011-09-10'),(448,30012,'2011-09-10'),(449,30012,'2011-09-10'),(450,30012,'2011-09-10'),(451,30012,'2011-09-10'),(452,30012,'2011-09-10'),(453,30012,'2011-09-10'),(454,30002,'2011-09-10'),(455,30002,'2011-09-10'),(456,30020,'2011-09-10'),(457,30020,'2011-09-10'),(458,30012,'2011-09-10'),(459,30012,'2011-09-10'),(460,30002,'2011-09-10'),(461,30002,'2011-09-10'),(462,30012,'2011-09-10'),(463,30002,'2011-09-10'),(464,30002,'2011-09-10'),(465,30002,'2011-09-10'),(466,30002,'2011-09-10'),(467,30012,'2011-09-10'),(468,30012,'2011-09-10'),(469,30002,'2011-09-10'),(470,30002,'2011-09-10'),(471,30012,'2011-09-10'),(472,30012,'2011-09-10'),(473,30012,'2011-09-10'),(474,30012,'2011-09-10'),(475,30020,'2011-09-11'),(476,30020,'2011-09-11'),(477,30020,'2011-09-11'),(478,30020,'2011-09-11'),(479,30020,'2011-09-11'),(480,30002,'2011-09-11'),(481,30002,'2011-09-11'),(482,30002,'2011-09-11'),(483,30002,'2011-09-11'),(484,30020,'2011-09-11'),(485,30002,'2011-09-11'),(486,30002,'2011-09-11'),(487,30002,'2011-09-11'),(488,30002,'2011-09-11'),(489,30002,'2011-09-11'),(490,30002,'2011-09-11'),(491,30020,'2011-09-11'),(492,30020,'2011-09-11'),(493,30020,'2011-09-11'),(494,30002,'2011-09-11'),(495,30002,'2011-09-11'),(496,30020,'2011-09-11'),(497,30020,'2011-09-11'),(498,30002,'2011-09-11'),(499,30002,'2011-09-11'),(500,30020,'2011-09-11'),(501,30020,'2011-09-11'),(502,30020,'2011-09-11'),(503,30020,'2011-09-11'),(504,30002,'2011-09-11'),(505,30002,'2011-09-11'),(506,30002,'2011-09-11'),(507,30002,'2011-09-11'),(508,30020,'2011-09-11'),(509,30020,'2011-09-11'),(510,30002,'2011-09-11'),(511,30002,'2011-09-11'),(512,30002,'2011-09-11'),(513,30002,'2011-09-11'),(514,30020,'2011-09-11'),(515,30002,'2011-09-11'),(516,30020,'2011-09-12'),(517,30020,'2011-09-12'),(518,30002,'2011-09-12'),(519,30002,'2011-09-12'),(520,30002,'2011-09-12'),(521,30002,'2011-09-12'),(522,30020,'2011-09-12'),(523,30020,'2011-09-12'),(524,30002,'2011-09-12'),(525,30002,'2011-09-12'),(526,30002,'2011-09-12'),(527,30002,'2011-09-12'),(528,30002,'2011-09-12'),(529,30002,'2011-09-12'),(530,30002,'2011-09-12'),(531,30020,'2011-09-12'),(532,30020,'2011-09-12'),(533,30020,'2011-09-12'),(534,30002,'2011-09-12'),(535,30020,'2011-09-12'),(536,30020,'2011-09-12'),(537,30002,'2011-09-12'),(538,30002,'2011-09-12'),(539,30002,'2011-09-12'),(540,30002,'2011-09-12'),(541,30002,'2011-09-12'),(542,30002,'2011-09-12'),(543,30020,'2011-09-12'),(544,30002,'2011-09-12'),(545,30002,'2011-09-12'),(546,30002,'2011-09-12'),(547,30002,'2011-09-12'),(548,30020,'2011-09-12'),(549,30002,'2011-09-12'),(550,30002,'2011-09-12'),(551,30002,'2011-09-12'),(552,30002,'2011-09-12'),(553,30002,'2011-09-12'),(554,30002,'2011-09-12'),(555,30002,'2011-09-12'),(556,30002,'2011-09-12'),(557,30020,'2011-09-12'),(558,30002,'2011-09-12'),(559,30002,'2011-09-12'),(560,30002,'2011-09-12'),(561,30002,'2011-09-12'),(562,30002,'2011-09-12'),(563,30002,'2011-09-12'),(564,30002,'2011-09-12'),(565,30002,'2011-09-12'),(566,30020,'2011-09-12'),(567,30020,'2011-09-12'),(568,30020,'2011-09-12'),(569,30020,'2011-09-12'),(570,30002,'2011-09-12'),(571,30020,'2011-09-12'),(572,30002,'2011-09-12'),(573,30002,'2011-09-12'),(574,30020,'2011-09-12'),(575,30020,'2011-09-12'),(576,30002,'2011-09-12'),(577,30002,'2011-09-12'),(578,30002,'2011-09-12'),(579,30002,'2011-09-12'),(580,30002,'2011-09-12'),(581,30002,'2011-09-12'),(582,30002,'2011-09-12'),(583,30020,'2011-09-12'),(584,30002,'2011-09-12'),(585,30002,'2011-09-12'),(586,30002,'2011-09-12'),(587,30002,'2011-09-12'),(588,30002,'2011-09-12'),(589,30002,'2011-09-12'),(590,30002,'2011-09-12'),(591,30020,'2011-09-12'),(592,30020,'2011-09-12'),(593,30020,'2011-09-12'),(594,30020,'2011-09-12'),(595,30020,'2011-09-12'),(596,30002,'2011-09-12'),(597,30020,'2011-09-12'),(598,30020,'2011-09-12'),(599,30020,'2011-09-12'),(600,30002,'2011-09-12'),(601,30002,'2011-09-12'),(602,30020,'2011-09-12'),(603,30020,'2011-09-12'),(604,30002,'2011-09-12'),(605,30002,'2011-09-12'),(606,30020,'2011-09-12'),(607,30020,'2011-09-12'),(608,30002,'2011-09-12'),(609,30002,'2011-09-12'),(610,30002,'2011-09-12'),(611,30020,'2011-09-12'),(612,30020,'2011-09-12'),(613,30020,'2011-09-12'),(614,30020,'2011-09-12'),(615,30020,'2011-09-12'),(616,30020,'2011-09-12'),(617,30020,'2011-09-12'),(618,30002,'2011-09-12'),(619,30002,'2011-09-12'),(620,30002,'2011-09-12'),(621,30002,'2011-09-12'),(622,30002,'2011-09-12'),(623,30002,'2011-09-12'),(624,30020,'2011-09-12'),(625,30020,'2011-09-12'),(626,30020,'2011-09-12'),(627,30020,'2011-09-12'),(628,30002,'2011-09-12'),(629,30002,'2011-09-12'),(630,30002,'2011-09-12'),(631,30002,'2011-09-12'),(632,30002,'2011-09-12'),(633,30002,'2011-09-12'),(634,30020,'2011-09-12'),(635,30020,'2011-09-12'),(636,30020,'2011-09-12'),(637,30002,'2011-09-12'),(638,30002,'2011-09-12'),(639,30002,'2011-09-12'),(640,30002,'2011-09-12'),(641,30002,'2011-09-12'),(642,30020,'2011-09-12'),(643,30002,'2011-09-12'),(644,30002,'2011-09-12'),(645,30020,'2011-09-12'),(646,30002,'2011-09-12'),(647,30002,'2011-09-12'),(648,30002,'2011-09-12'),(649,30002,'2011-09-12'),(650,30002,'2011-09-12'),(651,30002,'2011-09-12'),(652,30002,'2011-09-12'),(653,30002,'2011-09-12'),(654,30002,'2011-09-12'),(655,30020,'2011-09-12'),(656,30020,'2011-09-12'),(657,30002,'2011-09-12'),(658,30002,'2011-09-12'),(659,30020,'2011-09-12'),(660,30020,'2011-09-12'),(661,30002,'2011-09-12'),(662,30020,'2011-09-12'),(663,30002,'2011-09-12'),(664,30002,'2011-09-12'),(665,30002,'2011-09-12'),(666,30002,'2011-09-12'),(667,30020,'2011-09-12'),(668,30002,'2011-09-13'),(669,30002,'2011-09-13'),(670,30002,'2011-09-13'),(671,30020,'2011-09-13'),(672,30002,'2011-09-13'),(673,30002,'2011-09-13'),(674,30002,'2011-09-13'),(675,30002,'2011-09-13'),(676,30002,'2011-09-13'),(677,30002,'2011-09-13'),(678,30002,'2011-09-13'),(679,30002,'2011-09-13'),(680,30002,'2011-09-13'),(681,30002,'2011-09-13'),(682,30002,'2011-09-13'),(683,30002,'2011-09-13'),(684,30020,'2011-09-13'),(685,30002,'2011-09-13'),(686,30020,'2011-09-13'),(687,30002,'2011-09-13'),(688,30002,'2011-09-13'),(689,30002,'2011-09-13'),(690,30020,'2011-09-13'),(691,30020,'2011-09-13'),(692,30020,'2011-09-13'),(693,30002,'2011-09-13'),(694,30002,'2011-09-13'),(695,30002,'2011-09-13'),(696,30002,'2011-09-13'),(697,30020,'2011-09-13'),(698,30020,'2011-09-13'),(699,30002,'2011-09-13'),(700,30002,'2011-09-13'),(701,30020,'2011-09-13'),(702,30002,'2011-09-13'),(703,30002,'2011-09-13'),(704,30002,'2011-09-13'),(705,30020,'2011-09-13'),(706,30020,'2011-09-13'),(707,30020,'2011-09-13'),(708,30020,'2011-09-13'),(709,30002,'2011-09-13'),(710,30002,'2011-09-13'),(711,30002,'2011-09-13'),(712,30002,'2011-09-13'),(713,30002,'2011-09-13'),(714,30002,'2011-09-13'),(715,30020,'2011-09-13'),(716,30002,'2011-09-13'),(717,30002,'2011-09-13'),(718,30002,'2011-09-13'),(719,30020,'2011-09-13'),(720,30020,'2011-09-13'),(721,30002,'2011-09-13'),(722,30002,'2011-09-13'),(723,30002,'2011-09-13'),(724,30002,'2011-09-13'),(725,30002,'2011-09-13'),(726,30002,'2011-09-13'),(727,30002,'2011-09-13'),(728,30020,'2011-09-13'),(729,30020,'2011-09-13'),(730,30020,'2011-09-13'),(731,30020,'2011-09-13'),(732,30002,'2011-09-13'),(733,30002,'2011-09-13'),(734,30020,'2011-09-13'),(735,30020,'2011-09-13'),(736,30020,'2011-09-13'),(737,30002,'2011-09-13'),(738,30002,'2011-09-13'),(739,30002,'2011-09-13'),(740,30002,'2011-09-13'),(741,30002,'2011-09-13'),(742,30002,'2011-09-13'),(743,30020,'2011-09-13'),(744,30020,'2011-09-13'),(745,30002,'2011-09-13'),(746,30002,'2011-09-13'),(747,30002,'2011-09-13'),(748,30002,'2011-09-13'),(749,30002,'2011-09-13'),(750,30002,'2011-09-13'),(751,30002,'2011-09-13'),(752,30002,'2011-09-13'),(753,30002,'2011-09-13'),(754,30002,'2011-09-13'),(755,30002,'2011-09-13'),(756,30002,'2011-09-13'),(757,30002,'2011-09-13'),(758,30002,'2011-09-13'),(759,30002,'2011-09-13'),(760,30002,'2011-09-13'),(761,30002,'2011-09-13'),(762,30002,'2011-09-13'),(763,30020,'2011-09-13'),(764,30002,'2011-09-13'),(765,30020,'2011-09-13'),(766,30020,'2011-09-13'),(767,30020,'2011-09-13'),(768,30020,'2011-09-13'),(769,30020,'2011-09-13'),(770,30020,'2011-09-13'),(771,30020,'2011-09-13'),(772,30020,'2011-09-13'),(773,30002,'2011-09-13'),(774,30020,'2011-09-13'),(775,30020,'2011-09-13'),(776,30002,'2011-09-13'),(777,30020,'2011-09-13'),(778,30002,'2011-09-13'),(779,30002,'2011-09-13'),(780,30020,'2011-09-13'),(781,30020,'2011-09-13'),(782,30002,'2011-09-13'),(783,30002,'2011-09-13'),(784,30020,'2011-09-13'),(785,30020,'2011-09-13'),(786,30020,'2011-09-13'),(787,30020,'2011-09-13'),(788,30020,'2011-09-13'),(789,30002,'2011-09-13'),(790,30020,'2011-09-13'),(791,30020,'2011-09-13'),(792,30020,'2011-09-13'),(793,30002,'2011-09-13'),(794,30002,'2011-09-13'),(795,30002,'2011-09-13'),(796,30020,'2011-09-13'),(797,30020,'2011-09-13'),(798,30002,'2011-09-13'),(799,30002,'2011-09-13'),(800,30020,'2011-09-13'),(801,30002,'2011-09-13'),(802,30002,'2011-09-13'),(803,30002,'2011-09-13'),(804,30002,'2011-09-13'),(805,30020,'2011-09-13'),(806,30002,'2011-09-13'),(807,30002,'2011-09-13'),(808,30002,'2011-09-13'),(809,30020,'2011-09-13'),(810,30002,'2011-09-14'),(811,30002,'2011-09-14'),(812,30020,'2011-09-14'),(813,30020,'2011-09-14'),(814,30020,'2011-09-14'),(815,30020,'2011-09-14'),(816,30020,'2011-09-14'),(817,30020,'2011-09-14'),(818,30020,'2011-09-14'),(819,30020,'2011-09-14'),(820,30020,'2011-09-14'),(821,30020,'2011-09-14'),(822,30020,'2011-09-14'),(823,30020,'2011-09-14'),(824,30020,'2011-09-14'),(825,30002,'2011-09-14'),(826,30020,'2011-09-14'),(827,30002,'2011-09-14'),(828,30020,'2011-09-14'),(829,30020,'2011-09-14'),(830,30002,'2011-09-14'),(831,30002,'2011-09-14'),(832,30002,'2011-09-14'),(833,30002,'2011-09-14'),(834,30020,'2011-09-14'),(835,30020,'2011-09-14'),(836,30020,'2011-09-14'),(837,30002,'2011-09-14'),(838,30002,'2011-09-14'),(839,30020,'2011-09-14'),(840,30020,'2011-09-14'),(841,30020,'2011-09-14'),(842,30002,'2011-09-14'),(843,30002,'2011-09-14'),(844,30020,'2011-09-14'),(845,30020,'2011-09-14'),(846,30002,'2011-09-14'),(847,30002,'2011-09-14'),(848,30002,'2011-09-14'),(849,30002,'2011-09-14'),(850,30020,'2011-09-14'),(851,30002,'2011-09-14'),(852,30020,'2011-09-14'),(853,30020,'2011-09-14'),(854,30020,'2011-09-14'),(855,30012,'2011-09-14'),(856,30002,'2011-09-14'),(857,30002,'2011-09-14'),(858,30004,'2011-09-14'),(859,30002,'2011-09-14'),(860,30002,'2011-09-14'),(861,30020,'2011-09-14'),(862,30020,'2011-09-14'),(863,30012,'2011-09-14'),(864,30012,'2011-09-14'),(865,30002,'2011-09-14'),(866,30004,'2011-09-14'),(867,30012,'2011-09-14'),(868,30002,'2011-09-14'),(869,30002,'2011-09-14'),(870,30012,'2011-09-14'),(871,30012,'2011-09-14'),(872,30002,'2011-09-20'),(873,30002,'2011-09-20'),(874,30002,'2011-09-20'),(875,30012,'2011-09-20'),(876,30002,'2011-09-20'),(877,30002,'2011-09-20'),(878,30012,'2011-09-20'),(879,30004,'2011-09-20'),(880,30004,'2011-09-20'),(881,30020,'2011-09-20'),(882,30020,'2011-09-20'),(883,30012,'2011-09-20'),(884,30012,'2011-09-20'),(885,30002,'2011-09-20'),(886,30002,'2011-09-20'),(887,30002,'2011-09-20'),(888,30002,'2011-09-20'),(889,30002,'2011-09-20'),(890,30002,'2011-09-20'),(891,30003,'2011-09-20'),(892,30003,'2011-09-20'),(893,30002,'2011-09-20'),(894,30002,'2011-09-20'),(895,30002,'2011-09-20'),(896,30002,'2011-09-20'),(897,30003,'2011-09-20'),(898,30003,'2011-09-20'),(899,30002,'2011-09-20'),(900,30002,'2011-09-20'),(901,30002,'2011-09-20'),(902,30002,'2011-09-20'),(903,30002,'2011-09-20'),(904,30002,'2011-09-20'),(905,30002,'2011-09-20'),(906,30002,'2011-09-20'),(907,30002,'2011-09-20'),(908,30002,'2011-09-20'),(909,30012,'2011-09-20'),(910,30002,'2011-09-20'),(911,30003,'2011-09-21'),(912,30003,'2011-09-21'),(913,30002,'2011-09-23'),(914,30002,'2011-09-23'),(915,30016,'2011-09-24'),(916,30016,'2011-09-24'),(917,30016,'2011-09-24'),(918,30012,'2011-09-24'),(919,30002,'2011-09-24'),(920,30002,'2011-09-24'),(921,30002,'2011-09-24'),(922,30002,'2011-09-24'),(923,30002,'2011-09-24'),(924,30012,'2011-09-24'),(925,30002,'2011-09-24'),(926,30012,'2011-09-24'),(927,30012,'2011-09-24'),(928,30012,'2011-09-24'),(929,30002,'2011-09-24'),(930,30002,'2011-09-24'),(931,30002,'2011-09-24'),(932,30003,'2011-09-24'),(933,30003,'2011-09-24'),(934,30012,'2011-09-24'),(935,30012,'2011-09-24'),(936,30002,'2011-09-24'),(937,30002,'2011-09-24'),(938,30002,'2011-09-24'),(939,30002,'2011-09-24'),(940,30002,'2011-09-24'),(941,30002,'2011-09-24'),(942,30002,'2011-09-24'),(943,30002,'2011-09-24'),(944,30002,'2011-09-24'),(945,30002,'2011-09-24'),(946,30002,'2011-09-24'),(947,30002,'2011-09-24'),(948,30002,'2011-09-24'),(949,30003,'2011-09-24'),(950,30002,'2011-09-24'),(951,30004,'2011-09-24'),(952,30004,'2011-09-24'),(953,30002,'2011-09-24'),(954,30002,'2011-09-24'),(955,30002,'2011-09-24'),(956,30002,'2012-08-13'),(957,30002,'2012-08-13'),(958,30002,'2012-08-13'),(959,30002,'2012-08-13'),(960,30002,'2012-08-13'),(961,30002,'2012-08-13'),(962,30002,'2012-08-13'),(963,30002,'2012-08-13'),(964,30002,'2012-08-13'),(965,30002,'2012-08-13'),(966,30002,'2012-08-13'),(967,30002,'2012-08-13'),(968,30002,'2012-08-13'),(969,30002,'2012-08-13'),(970,30002,'2012-08-13'),(971,30004,'2012-08-13'),(972,30002,'2012-08-13'),(973,30002,'2012-08-13'),(974,30002,'2012-08-13'),(975,30002,'2012-08-13'),(976,30002,'2012-08-13'),(977,30002,'2012-08-13'),(978,30002,'2012-08-13'),(979,30002,'2012-08-13'),(980,30002,'2012-08-13'),(981,30002,'2012-08-13'),(982,30002,'2012-08-13'),(983,30002,'2012-08-13'),(984,30004,'2012-08-13'),(985,30004,'2012-08-13'),(986,30002,'2012-08-13'),(987,30002,'2012-08-13'),(988,30016,'2012-08-13'),(989,30016,'2012-08-13'),(990,30002,'2012-08-13'),(991,30002,'2012-08-13'),(992,30002,'2012-08-13'),(993,30002,'2012-08-13'),(994,30003,'2012-08-13'),(995,30002,'2012-08-13'),(996,30004,'2012-08-13'),(997,30004,'2012-08-13'),(998,30004,'2012-08-13'),(999,30004,'2012-08-13'),(1000,30004,'2012-08-13'),(1001,30002,'2012-08-13'),(1002,30002,'2012-08-13'),(1003,30002,'2012-08-13'),(1004,30002,'2012-08-13'),(1005,30002,'2012-08-13'),(1006,30002,'2012-08-13'),(1007,30002,'2012-08-13'),(1008,30002,'2012-08-13'),(1009,30002,'2012-08-13'),(1010,30002,'2012-08-13'),(1011,30002,'2012-08-13'),(1012,30002,'2012-08-13'),(1013,30003,'2012-08-13'),(1014,30003,'2012-08-13'),(1015,30020,'2012-08-13'),(1016,30020,'2012-08-13'),(1017,30002,'2012-08-14'),(1018,30002,'2012-08-14'),(1019,30002,'2012-08-14'),(1020,30002,'2012-08-14'),(1021,30002,'2012-08-14'),(1022,30002,'2012-08-14'),(1023,30002,'2012-08-14'),(1024,30002,'2012-08-14'),(1025,30002,'2012-08-14'),(1026,30002,'2012-08-14'),(1027,30002,'2012-08-14'),(1028,30002,'2012-08-14'),(1029,30002,'2012-08-14'),(1030,30012,'2012-08-14'),(1031,30002,'2012-08-14'),(1032,30002,'2012-08-14'),(1033,30002,'2012-08-14'),(1034,30002,'2012-08-14'),(1035,30002,'2012-08-14'),(1036,30002,'2012-08-14'),(1037,30002,'2012-08-14'),(1038,30002,'2012-08-14'),(1039,30002,'2012-08-14'),(1040,30002,'2012-08-14'),(1041,30002,'2012-08-14'),(1042,30002,'2012-08-14'),(1043,30002,'2012-08-14'),(1044,30002,'2012-08-14'),(1045,30003,'2012-08-14'),(1046,30002,'2012-08-14'),(1047,30002,'2012-08-14'),(1048,30002,'2012-08-14'),(1049,30002,'2012-08-14'),(1050,30002,'2012-08-14'),(1051,30002,'2012-08-14'),(1052,30002,'2012-08-14'),(1053,30002,'2012-08-14'),(1054,30002,'2012-08-14'),(1055,30002,'2012-08-14'),(1056,30002,'2012-08-14'),(1057,30002,'2012-08-14'),(1058,30002,'2012-08-14'),(1059,30002,'2012-08-14'),(1060,30002,'2012-08-14'),(1061,30002,'2012-08-14'),(1062,30002,'2012-08-14'),(1063,30002,'2012-08-14'),(1064,30002,'2012-08-14'),(1065,30002,'2012-08-14'),(1066,30002,'2012-08-14'),(1067,30002,'2012-08-14'),(1068,30002,'2012-08-14'),(1069,30002,'2012-08-14'),(1070,30002,'2012-08-14'),(1071,30002,'2012-08-14'),(1072,30002,'2012-08-14'),(1073,30002,'2012-08-14'),(1074,30002,'2012-08-14'),(1075,30002,'2012-08-14'),(1076,30004,'2012-08-14'),(1077,30004,'2012-08-14'),(1078,30002,'2012-08-14'),(1079,30002,'2012-08-14'),(1080,30003,'2012-08-14'),(1081,30003,'2012-08-14'),(1082,30002,'2012-08-14'),(1083,30002,'2012-08-14'),(1084,30002,'2012-08-14'),(1085,30002,'2012-08-14'),(1086,30002,'2012-08-14'),(1087,30002,'2012-08-14'),(1088,30002,'2012-08-14'),(1089,30002,'2012-08-14'),(1090,30002,'2012-08-14'),(1091,30002,'2012-08-14'),(1092,30002,'2012-08-14'),(1093,30002,'2012-08-14'),(1094,30002,'2012-08-14'),(1095,30002,'2012-08-14'),(1096,30002,'2012-08-14'),(1097,30002,'2012-08-14'),(1098,30003,'2012-08-14'),(1099,30003,'2012-08-14'),(1100,30002,'2012-08-14'),(1101,30002,'2012-08-14'),(1102,30004,'2012-08-14'),(1103,30004,'2012-08-14'),(1104,30002,'2012-08-14'),(1105,30002,'2012-08-14'),(1106,30002,'2012-08-14'),(1107,30002,'2012-08-14'),(1108,30002,'2012-08-14'),(1109,30002,'2012-08-14'),(1110,30002,'2012-08-14'),(1111,30002,'2012-08-14'),(1112,30002,'2012-08-14'),(1113,30002,'2012-08-14'),(1114,30002,'2012-08-14'),(1115,30016,'2012-08-14'),(1116,30002,'2012-08-14'),(1117,30002,'2012-08-14'),(1118,30002,'2012-08-14'),(1119,30002,'2012-08-14'),(1120,30002,'2012-08-14'),(1121,30002,'2012-08-14'),(1122,30002,'2012-08-14'),(1123,30002,'2012-08-14'),(1124,30002,'2012-08-14'),(1125,30002,'2012-08-14'),(1126,30003,'2012-08-14'),(1127,30003,'2012-08-14'),(1128,30002,'2012-08-14'),(1129,30002,'2012-08-14'),(1130,30002,'2012-08-14'),(1131,30002,'2012-08-14'),(1132,30002,'2012-08-14'),(1133,30002,'2012-08-14'),(1134,30002,'2012-08-14'),(1135,30002,'2012-08-14'),(1136,30002,'2012-08-14'),(1137,30002,'2012-10-21'),(1138,30002,'2012-10-21'),(1139,30002,'2012-10-21'),(1140,30002,'2012-10-21'),(1141,30002,'2012-10-21'),(1142,30002,'2012-10-21'),(1143,30002,'2012-10-21'),(1144,30002,'2012-10-22'),(1145,30002,'2012-10-22'),(1146,30002,'2012-10-22'),(1147,30002,'2012-10-22'),(1148,30012,'2012-10-22'),(1149,30012,'2012-10-22'),(1150,30002,'2012-10-22'),(1151,30002,'2012-10-22'),(1152,30002,'2012-10-22'),(1153,30002,'2012-10-22'),(1154,30002,'2012-10-22'),(1155,30002,'2012-10-22'),(1156,30002,'2012-10-22'),(1157,30002,'2012-10-22'),(1158,30002,'2012-10-22'),(1159,30002,'2012-10-22'),(1160,30002,'2012-10-22'),(1161,30002,'2012-10-22'),(1162,30002,'2012-10-22'),(1163,30002,'2012-10-23'),(1164,30002,'2012-10-23'),(1165,30002,'2012-10-23'),(1166,30002,'2012-10-23'),(1167,30002,'2012-10-23'),(1168,30002,'2012-10-23'),(1169,30002,'2012-10-23'),(1170,30002,'2012-10-23'),(1171,30002,'2012-10-23'),(1172,30002,'2012-10-23'),(1173,30002,'2012-10-23'),(1174,30002,'2012-10-23'),(1175,30002,'2012-10-23'),(1176,30002,'2012-10-23'),(1177,30002,'2012-10-23'),(1178,30002,'2012-10-23'),(1179,30002,'2012-10-23'),(1180,30002,'2012-10-23'),(1181,30002,'2012-10-23'),(1182,30002,'2012-10-24'),(1183,30002,'2012-10-24'),(1184,30002,'2012-10-24'),(1185,30002,'2012-10-24'),(1186,30002,'2012-10-24'),(1187,30002,'2012-10-24'),(1188,30002,'2012-10-24'),(1189,30002,'2012-10-24'),(1190,30012,'2012-10-24'),(1191,30002,'2012-10-24'),(1192,30002,'2012-10-24'),(1193,30002,'2012-10-24'),(1194,30002,'2012-10-24'),(1195,30004,'2012-10-24'),(1196,30004,'2012-10-24'),(1197,30002,'2012-10-24'),(1198,30002,'2012-10-24'),(1199,30002,'2012-10-24'),(1200,30002,'2012-10-24'),(1201,30002,'2012-10-24'),(1202,30002,'2012-10-25'),(1203,30002,'2012-10-25'),(1204,30002,'2012-10-25'),(1205,30002,'2012-10-25'),(1206,30002,'2012-10-25'),(1207,30002,'2012-10-25'),(1208,30002,'2012-10-25'),(1209,30002,'2012-10-25'),(1210,30002,'2012-10-25'),(1211,30002,'2012-10-25'),(1212,30002,'2012-10-25'),(1213,30002,'2012-10-25'),(1214,30002,'2012-10-25'),(1215,30002,'2012-10-25'),(1216,30002,'2012-10-25'),(1217,30002,'2012-10-25'),(1218,30002,'2012-10-25'),(1219,30002,'2012-10-25'),(1220,30002,'2012-10-25'),(1221,30002,'2012-10-25'),(1222,30002,'2012-10-25'),(1223,30004,'2012-10-25'),(1224,30004,'2012-10-25'),(1225,30004,'2012-10-25'),(1226,30002,'2012-10-25'),(1227,30002,'2012-10-25'),(1228,30004,'2012-10-25'),(1229,30002,'2012-10-25'),(1230,30002,'2012-10-25'),(1231,30002,'2012-10-25'),(1232,30002,'2012-10-25'),(1233,30003,'2012-10-25'),(1234,30002,'2012-10-25'),(1235,30012,'2012-10-25'),(1236,30002,'2012-10-25'),(1237,30002,'2012-10-25'),(1238,30002,'2012-10-25'),(1239,30002,'2012-10-25'),(1240,30002,'2012-10-25'),(1241,30003,'2012-10-25'),(1242,30004,'2012-10-25'),(1243,30002,'2012-10-25'),(1244,30002,'2012-10-25'),(1245,30002,'2012-10-25'),(1246,30002,'2012-10-25'),(1247,30002,'2012-10-25'),(1248,30002,'2012-10-25'),(1249,30002,'2012-10-25'),(1250,30002,'2012-10-25'),(1251,30003,'2012-10-25'),(1252,30004,'2012-10-25'),(1253,30002,'2012-10-25'),(1254,30002,'2012-10-25'),(1255,30002,'2012-10-25'),(1256,30002,'2012-10-25'),(1257,30002,'2012-10-25'),(1258,30002,'2012-10-25'),(1259,30002,'2012-10-25'),(1260,30002,'2012-10-25'),(1261,30002,'2012-10-25'),(1262,30002,'2012-10-25'),(1263,30002,'2012-10-25'),(1264,30002,'2012-10-25'),(1265,30002,'2012-10-25'),(1266,30002,'2012-10-25'),(1267,30002,'2012-10-25'),(1268,30002,'2012-10-25'),(1269,30002,'2012-10-25'),(1270,30002,'2012-10-25'),(1271,30012,'2012-10-25'),(1272,30012,'2012-10-25'),(1273,30012,'2012-10-25'),(1274,30012,'2012-10-25'),(1275,30012,'2012-10-25'),(1276,30012,'2012-10-25'),(1277,30016,'2012-10-25'),(1278,30020,'2012-10-25'),(1279,30012,'2012-10-25'),(1280,30002,'2012-10-25'),(1281,30002,'2012-10-25'),(1282,30003,'2012-10-25'),(1283,30002,'2012-10-25'),(1284,30002,'2012-10-25'),(1285,30002,'2012-10-25'),(1286,30012,'2012-10-25'),(1287,30002,'2012-10-25'),(1288,30002,'2012-10-25'),(1289,30002,'2012-10-25'),(1290,30002,'2012-10-25'),(1291,30002,'2012-10-25'),(1292,30002,'2012-10-25'),(1293,30012,'2012-10-25'),(1294,30012,'2012-10-25'),(1295,30002,'2012-10-25'),(1296,30002,'2012-10-25'),(1297,30002,'2012-10-25'),(1298,30004,'2012-10-25'),(1299,30004,'2012-10-25'),(1300,30002,'2012-10-25'),(1301,30002,'2012-10-25'),(1302,30002,'2012-10-25'),(1303,30002,'2012-10-25'),(1304,30002,'2012-10-25'),(1305,30002,'2012-10-25'),(1306,30002,'2012-10-25'),(1307,30002,'2012-10-25'),(1308,30002,'2012-10-25'),(1309,30002,'2012-10-25'),(1310,30002,'2012-10-25'),(1311,30002,'2012-10-25'),(1312,30002,'2012-10-25'),(1313,30002,'2012-10-25'),(1314,30002,'2012-10-25'),(1315,30002,'2012-10-25'),(1316,30002,'2012-10-25'),(1317,30002,'2012-10-25'),(1318,30002,'2012-10-25'),(1319,30002,'2012-10-25'),(1320,30002,'2012-10-25'),(1321,30002,'2012-10-25'),(1322,30002,'2012-10-25'),(1323,30002,'2012-10-25'),(1324,30012,'2012-10-25'),(1325,30012,'2012-10-25'),(1326,30004,'2012-10-25'),(1327,30004,'2012-10-25'),(1328,30002,'2012-10-25'),(1329,30002,'2012-10-25'),(1330,30002,'2012-10-25'),(1331,30012,'2012-10-25'),(1332,30012,'2012-10-25'),(1333,30002,'2012-10-25'),(1334,30002,'2012-10-25'),(1335,30004,'2012-10-25'),(1336,30004,'2012-10-25'),(1337,30002,'2012-10-25'),(1338,30002,'2012-10-25'),(1339,30002,'2012-10-25'),(1340,30002,'2012-10-25'),(1341,30002,'2012-10-25'),(1342,30002,'2012-10-25'),(1343,30004,'2012-10-25'),(1344,30004,'2012-10-25'),(1345,30002,'2012-10-25'),(1346,30002,'2012-10-25'),(1347,30002,'2012-10-25'),(1348,30002,'2012-10-25'),(1349,30002,'2012-10-25'),(1350,30002,'2012-10-25'),(1351,30002,'2012-10-25'),(1352,30002,'2012-10-25'),(1353,30002,'2012-10-25'),(1354,30002,'2012-10-25'),(1355,30002,'2012-10-25'),(1356,30012,'2012-10-25'),(1357,30002,'2012-10-25'),(1358,30002,'2012-10-25'),(1359,30004,'2012-10-25'),(1360,30004,'2012-10-25'),(1361,30004,'2012-10-25'),(1362,30004,'2012-10-25'),(1363,30002,'2012-10-25'),(1364,30002,'2012-10-25'),(1365,30002,'2012-10-25'),(1366,30002,'2012-10-25'),(1367,30012,'2012-10-25'),(1368,30012,'2012-10-25'),(1369,30002,'2012-10-25'),(1370,30002,'2012-10-25'),(1371,30002,'2012-10-25'),(1372,30002,'2012-10-25'),(1373,30012,'2012-10-25'),(1374,30002,'2012-10-25'),(1375,30002,'2012-10-25'),(1376,30002,'2012-10-25'),(1377,30002,'2012-10-25'),(1378,30004,'2012-10-25'),(1379,30004,'2012-10-25'),(1380,30002,'2012-10-25'),(1381,30002,'2012-10-25'),(1382,30002,'2012-10-25'),(1383,30002,'2012-10-25'),(1384,30002,'2012-10-25'),(1385,30002,'2012-10-25'),(1386,30002,'2012-10-25'),(1387,30002,'2012-10-25'),(1388,30002,'2012-10-25'),(1389,30002,'2012-10-25'),(1390,30002,'2012-10-25'),(1391,30002,'2012-10-25'),(1392,30002,'2012-10-25'),(1393,30002,'2012-10-25'),(1394,30002,'2012-10-25'),(1395,30002,'2012-10-25'),(1396,30002,'2012-10-25'),(1397,30002,'2012-10-25'),(1398,30002,'2012-10-25'),(1399,30002,'2012-10-25'),(1400,30002,'2012-10-25'),(1401,30002,'2012-10-25'),(1402,30002,'2012-10-25'),(1403,30002,'2012-10-25'),(1404,30003,'2012-10-25'),(1405,30002,'2012-10-25'),(1406,30002,'2012-10-25'),(1407,30002,'2012-10-25'),(1408,30002,'2012-10-25'),(1409,30012,'2012-10-25'),(1410,30002,'2012-10-25'),(1411,30002,'2012-10-25'),(1412,30002,'2012-10-25'),(1413,30002,'2012-10-25'),(1414,30002,'2012-10-25'),(1415,30002,'2012-10-25'),(1416,30002,'2012-10-25'),(1417,30002,'2012-10-25'),(1418,30002,'2012-10-25'),(1419,30020,'2012-10-25'),(1420,30020,'2012-10-25'),(1421,30002,'2012-10-25'),(1422,30002,'2012-10-25'),(1423,30002,'2012-10-25'),(1424,30002,'2012-10-25'),(1425,30002,'2012-10-25'),(1426,30020,'2012-10-25'),(1427,30020,'2012-10-25'),(1428,30020,'2012-10-25'),(1429,30020,'2012-10-25'),(1430,30002,'2012-10-25'),(1431,30002,'2012-10-25'),(1432,30002,'2012-10-25'),(1433,30002,'2012-10-25'),(1434,30016,'2012-10-25'),(1435,30016,'2012-10-25'),(1436,30002,'2012-10-25'),(1437,30002,'2012-10-25'),(1438,30002,'2012-10-25'),(1439,30002,'2012-10-25'),(1440,30002,'2012-10-25'),(1441,30002,'2012-10-25'),(1442,30002,'2012-10-25'),(1443,30002,'2012-10-25'),(1444,30002,'2012-10-25'),(1445,30002,'2012-10-25'),(1446,30002,'2012-10-25'),(1447,30012,'2012-10-25'),(1448,30002,'2012-10-25'),(1449,30002,'2012-10-25'),(1450,30002,'2012-10-25'),(1451,30002,'2012-10-25'),(1452,30002,'2012-10-25'),(1453,30002,'2012-10-25'),(1454,30002,'2012-10-25'),(1455,30002,'2012-10-25'),(1456,30012,'2012-10-25'),(1457,30002,'2012-10-25'),(1458,30002,'2012-10-25'),(1459,30002,'2012-10-25'),(1460,30003,'2012-10-25'),(1461,30004,'2012-10-25'),(1462,30002,'2012-10-25'),(1463,30002,'2012-10-25'),(1464,30002,'2012-10-25'),(1465,30002,'2012-10-25'),(1466,30002,'2012-10-25'),(1467,30002,'2012-10-26'),(1468,30002,'2012-10-26'),(1469,30002,'2012-10-26'),(1470,30002,'2012-10-26'),(1471,30002,'2012-10-26'),(1472,30002,'2012-10-26'),(1473,30002,'2012-10-26'),(1474,30002,'2012-10-26'),(1475,30002,'2012-10-26'),(1476,30002,'2012-10-26'),(1477,30002,'2012-10-26'),(1478,30002,'2012-10-26'),(1479,30002,'2012-10-26'),(1480,30002,'2012-10-26'),(1481,30002,'2012-10-26'),(1482,30002,'2012-10-26'),(1483,30002,'2012-10-26'),(1484,30002,'2012-10-26'),(1485,30002,'2012-10-26'),(1486,30002,'2012-10-26'),(1487,30016,'2012-10-26'),(1488,30016,'2012-10-26'),(1489,30002,'2012-10-26'),(1490,30002,'2012-10-26'),(1491,30002,'2012-10-26'),(1492,30002,'2012-10-26'),(1493,30002,'2012-10-26'),(1494,30002,'2012-10-26'),(1495,30002,'2012-10-26'),(1496,30002,'2012-10-26'),(1497,30020,'2012-10-26'),(1498,30020,'2012-10-26'),(1499,30002,'2012-10-26'),(1500,30002,'2012-10-26'),(1501,30002,'2012-10-26'),(1502,30002,'2012-10-26'),(1503,30002,'2012-10-26'),(1504,30002,'2012-10-26'),(1505,30002,'2012-10-26'),(1506,30002,'2012-10-26'),(1507,30002,'2012-10-26'),(1508,30002,'2012-10-26'),(1509,30002,'2012-10-26'),(1510,30002,'2012-10-26'),(1511,30002,'2012-10-26'),(1512,30002,'2012-10-26'),(1513,30002,'2012-10-26'),(1514,30002,'2012-10-26'),(1515,30002,'2012-10-26'),(1516,30002,'2012-10-26'),(1517,30002,'2012-10-26'),(1518,30002,'2012-10-26'),(1519,30002,'2012-10-26'),(1520,30002,'2012-10-26'),(1521,30012,'2012-10-26'),(1522,30012,'2012-10-26'),(1523,30020,'2012-10-26'),(1524,30020,'2012-10-26'),(1525,30002,'2012-10-26'),(1526,30002,'2012-10-27'),(1527,30002,'2012-10-27'),(1528,30002,'2012-10-27'),(1529,30002,'2012-10-27'),(1530,30002,'2012-10-27'),(1531,30002,'2012-10-27'),(1532,30002,'2012-10-27'),(1533,30002,'2012-10-27'),(1534,30002,'2012-10-27'),(1535,30002,'2012-10-27'),(1536,30002,'2012-10-27'),(1537,30002,'2012-10-27'),(1538,30002,'2012-10-27'),(1539,30002,'2012-10-27'),(1540,30002,'2012-10-27'),(1541,30002,'2012-10-27'),(1542,30002,'2012-10-27'),(1543,30002,'2012-10-27'),(1544,30002,'2012-10-27'),(1545,30002,'2012-10-27'),(1546,30002,'2012-10-27'),(1547,30002,'2012-10-27'),(1548,30002,'2012-10-27'),(1549,30002,'2012-10-27'),(1550,30002,'2012-10-27'),(1551,30002,'2012-10-27'),(1552,30002,'2012-10-27'),(1553,30002,'2012-10-27'),(1554,30002,'2012-10-27'),(1555,30002,'2012-10-27'),(1556,30002,'2012-10-27'),(1557,30002,'2012-10-27'),(1558,30002,'2012-10-27'),(1559,30002,'2012-10-27'),(1560,30002,'2012-10-27'),(1561,30002,'2012-10-27'),(1562,30002,'2012-10-27'),(1563,30016,'2012-10-27'),(1564,30016,'2012-10-27'),(1565,30002,'2012-10-27'),(1566,30002,'2012-10-27'),(1567,30002,'2012-10-27'),(1568,30002,'2012-10-27'),(1569,30002,'2012-10-27'),(1570,30002,'2012-10-27'),(1571,30002,'2012-10-27'),(1572,30012,'2012-10-27'),(1573,30002,'2012-10-27'),(1574,30002,'2012-10-27'),(1575,30002,'2012-10-27'),(1576,30002,'2012-10-27'),(1577,30002,'2012-10-27'),(1578,30002,'2012-10-27'),(1579,30002,'2012-10-27'),(1580,30002,'2012-10-27'),(1581,30002,'2012-10-27'),(1582,30002,'2012-10-27'),(1583,30002,'2012-10-27'),(1584,30002,'2012-10-27'),(1585,30002,'2012-10-27'),(1586,30002,'2012-10-27'),(1587,30002,'2012-10-27'),(1588,30002,'2012-10-27'),(1589,30003,'2012-10-27'),(1590,30002,'2012-10-27'),(1591,30002,'2012-10-27'),(1592,30002,'2012-10-27'),(1593,30002,'2012-10-27'),(1594,30002,'2012-10-27'),(1595,30002,'2012-10-27'),(1596,30012,'2012-10-27'),(1597,30012,'2012-10-27'),(1598,30002,'2012-10-27'),(1599,30002,'2012-10-27'),(1600,30002,'2012-10-27'),(1601,30002,'2012-10-27'),(1602,30002,'2012-10-27'),(1603,30002,'2012-10-27'),(1604,30002,'2012-10-27'),(1605,30002,'2012-10-27'),(1606,30002,'2012-10-27'),(1607,30002,'2012-10-27'),(1608,30002,'2012-10-27'),(1609,30002,'2012-10-27'),(1610,30002,'2012-10-27'),(1611,30002,'2012-10-27'),(1612,30002,'2012-10-27'),(1613,30004,'2012-10-27'),(1614,30004,'2012-10-27'),(1615,30002,'2012-10-27'),(1616,30002,'2012-10-27'),(1617,30002,'2012-10-27'),(1618,30002,'2012-10-27'),(1619,30002,'2012-10-27'),(1620,30002,'2012-10-27'),(1621,30002,'2012-10-27'),(1622,30012,'2012-10-27'),(1623,30012,'2012-10-27'),(1624,30002,'2012-10-27'),(1625,30002,'2012-10-27'),(1626,30002,'2012-10-27'),(1627,30002,'2012-10-27'),(1628,30002,'2012-10-27'),(1629,30002,'2012-10-27'),(1630,30002,'2012-10-27'),(1631,30002,'2012-10-27'),(1632,30003,'2012-10-27'),(1633,30003,'2012-10-27'),(1634,30002,'2012-10-27'),(1635,30002,'2012-10-27'),(1636,30012,'2012-10-27'),(1637,30002,'2012-10-27'),(1638,30002,'2012-10-27'),(1639,30002,'2012-10-27'),(1640,30002,'2012-10-27'),(1641,30002,'2012-10-27'),(1642,30002,'2012-10-27'),(1643,30012,'2012-10-27'),(1644,30012,'2012-10-27'),(1645,30002,'2012-10-27'),(1646,30002,'2012-10-27'),(1647,30002,'2012-10-27'),(1648,30002,'2012-10-27'),(1649,30002,'2012-10-27'),(1650,30002,'2012-10-27'),(1651,30020,'2012-10-27'),(1652,30020,'2012-10-27'),(1653,30003,'2012-10-27'),(1654,30003,'2012-10-27'),(1655,30002,'2012-10-27'),(1656,30002,'2012-10-27'),(1657,30002,'2012-10-27'),(1658,30002,'2012-10-27'),(1659,30002,'2012-10-27'),(1660,30002,'2012-10-27'),(1661,30002,'2012-10-27'),(1662,30002,'2012-10-27'),(1663,30003,'2012-10-27'),(1664,30003,'2012-10-27'),(1665,30002,'2012-10-27'),(1666,30002,'2012-10-27'),(1667,30002,'2012-10-27'),(1668,30002,'2012-10-27'),(1669,30004,'2012-10-27'),(1670,30004,'2012-10-27'),(1671,30003,'2012-10-27'),(1672,30003,'2012-10-27'),(1673,30002,'2012-10-27'),(1674,30002,'2012-10-27'),(1675,30002,'2012-10-27'),(1676,30002,'2012-10-27'),(1677,30003,'2012-10-27'),(1678,30004,'2012-10-27'),(1679,30002,'2012-10-27'),(1680,30002,'2012-10-27'),(1681,30002,'2012-10-27'),(1682,30002,'2012-10-27'),(1683,30002,'2012-10-27'),(1684,30002,'2012-10-28'),(1685,30002,'2012-10-28'),(1686,30003,'2012-10-28'),(1687,30002,'2012-10-28'),(1688,30002,'2012-10-28'),(1689,30002,'2012-10-28'),(1690,30002,'2012-10-28'),(1691,30002,'2012-10-28'),(1692,30002,'2012-10-28'),(1693,30002,'2012-10-28'),(1694,30002,'2012-10-28'),(1695,30002,'2012-10-28'),(1696,30002,'2012-10-28'),(1697,30002,'2012-10-28'),(1698,30002,'2012-10-28'),(1699,30002,'2012-10-28'),(1700,30002,'2012-10-28'),(1701,30012,'2012-10-28'),(1702,30002,'2012-10-28'),(1703,30020,'2012-10-28'),(1704,30016,'2012-10-28'),(1705,30002,'2012-10-28'),(1706,30002,'2012-10-28'),(1707,30002,'2012-10-28'),(1708,30002,'2012-10-28'),(1709,30002,'2012-10-28'),(1710,30002,'2012-10-28'),(1711,30002,'2012-10-28'),(1712,30002,'2012-10-28'),(1713,30002,'2012-10-28'),(1714,30002,'2012-10-28'),(1715,30002,'2012-10-28'),(1716,30002,'2012-10-28'),(1717,30002,'2012-10-28'),(1718,30002,'2012-10-28'),(1719,30002,'2012-10-28'),(1720,30002,'2012-10-28'),(1721,30002,'2012-10-28'),(1722,30002,'2012-10-28'),(1723,30002,'2012-10-28'),(1724,30002,'2012-10-28'),(1725,30002,'2012-10-28'),(1726,30002,'2012-10-28'),(1727,30002,'2012-10-28'),(1728,30002,'2012-10-28'),(1729,30002,'2012-10-28'),(1730,30002,'2012-10-28'),(1731,30002,'2012-10-28'),(1732,30002,'2012-10-28'),(1733,30002,'2012-10-28'),(1734,30002,'2012-10-28'),(1735,30002,'2012-10-28'),(1736,30002,'2012-10-28'),(1737,30002,'2012-10-28'),(1738,30002,'2012-10-28'),(1739,30002,'2012-10-28'),(1740,30002,'2012-10-28'),(1741,30002,'2012-10-28'),(1742,30002,'2012-10-28'),(1743,30002,'2012-10-28'),(1744,30002,'2012-10-28'),(1745,30002,'2012-10-28'),(1746,30002,'2012-10-28'),(1747,30002,'2012-10-28'),(1748,30002,'2012-10-28'),(1749,30002,'2012-10-28'),(1750,30002,'2012-10-28'),(1751,30012,'2012-10-28'),(1752,30012,'2012-10-28'),(1753,30002,'2012-10-28'),(1754,30002,'2012-10-28'),(1755,30002,'2012-10-28'),(1756,30002,'2012-10-28'),(1757,30002,'2012-10-28'),(1758,30002,'2012-10-28'),(1759,30002,'2012-10-28'),(1760,30002,'2012-10-28'),(1761,30003,'2012-10-28'),(1762,30003,'2012-10-28'),(1763,30002,'2012-10-28'),(1764,30002,'2012-10-28'),(1765,30002,'2012-10-28'),(1766,30002,'2012-10-28'),(1767,30002,'2012-10-28'),(1768,30002,'2012-10-28'),(1769,30002,'2012-10-28'),(1770,30002,'2012-10-28'),(1771,30002,'2012-10-28'),(1772,30002,'2012-10-28'),(1773,30002,'2012-10-28'),(1774,30020,'2012-10-28'),(1775,30020,'2012-10-28'),(1776,30002,'2012-10-28'),(1777,30002,'2012-10-28'),(1778,30002,'2012-10-28'),(1779,30002,'2012-10-28'),(1780,30002,'2012-10-28'),(1781,30002,'2012-10-28'),(1782,30002,'2012-10-28'),(1783,30002,'2012-10-28'),(1784,30002,'2012-10-28'),(1785,30002,'2012-10-28'),(1786,30002,'2012-10-28'),(1787,30002,'2012-10-28'),(1788,30002,'2012-10-28'),(1789,30002,'2012-10-28'),(1790,30002,'2012-10-28'),(1791,30002,'2012-10-28'),(1792,30003,'2012-10-28'),(1793,30003,'2012-10-28'),(1794,30002,'2012-10-28'),(1795,30002,'2012-10-28'),(1796,30002,'2012-10-28'),(1797,30002,'2012-10-28'),(1798,30002,'2012-10-28'),(1799,30002,'2012-10-28'),(1800,30002,'2012-10-28'),(1801,30002,'2012-10-28'),(1802,30002,'2012-10-28'),(1803,30003,'2012-10-28'),(1804,30003,'2012-10-28'),(1805,30002,'2012-10-28'),(1806,30002,'2012-10-28'),(1807,30002,'2012-10-28'),(1808,30002,'2012-10-28'),(1809,30002,'2012-10-28'),(1810,30002,'2012-10-28'),(1811,30002,'2012-10-28'),(1812,30002,'2012-10-28'),(1813,30002,'2012-10-28'),(1814,30002,'2012-10-28'),(1815,30002,'2012-10-28'),(1816,30002,'2012-10-28'),(1817,30002,'2012-10-28'),(1818,30002,'2012-10-28'),(1819,30002,'2012-10-28'),(1820,30003,'2012-10-28'),(1821,30003,'2012-10-28'),(1822,30002,'2012-10-28'),(1823,30002,'2012-10-28'),(1824,30002,'2012-10-28'),(1825,30002,'2012-10-28'),(1826,30002,'2012-10-28'),(1827,30012,'2012-10-28'),(1828,30012,'2012-10-28'),(1829,30012,'2012-10-28'),(1830,30002,'2012-10-28'),(1831,30012,'2012-10-28'),(1832,30012,'2012-10-28'),(1833,30002,'2012-10-28'),(1834,30003,'2012-10-28'),(1835,30002,'2012-10-28'),(1836,30020,'2012-10-29'),(1837,30002,'2012-10-29'),(1838,30003,'2012-10-29'),(1839,30003,'2012-10-29'),(1840,30003,'2012-10-29'),(1841,30003,'2012-10-29'),(1842,30003,'2012-10-29'),(1843,30003,'2012-10-29'),(1844,30003,'2012-10-29'),(1845,30003,'2012-10-29'),(1846,30003,'2012-10-29'),(1847,30012,'2012-10-29'),(1848,30002,'2012-10-29'),(1849,30002,'2012-10-29'),(1850,30002,'2012-10-29'),(1851,30003,'2012-10-29'),(1852,30002,'2012-10-29'),(1853,30002,'2012-10-29'),(1854,30002,'2012-10-29'),(1855,30002,'2012-10-29'),(1856,30002,'2012-10-29'),(1857,30002,'2012-10-29'),(1858,30002,'2012-10-29'),(1859,30002,'2012-10-29'),(1860,30003,'2012-10-29'),(1861,30002,'2012-10-29'),(1862,30002,'2012-10-29'),(1863,30012,'2012-10-29'),(1864,30012,'2012-10-29'),(1865,30002,'2012-10-29'),(1866,30002,'2012-10-29'),(1867,30002,'2012-10-29'),(1868,30002,'2012-10-29'),(1869,30002,'2012-10-29'),(1870,30002,'2012-10-29'),(1871,30003,'2012-10-29'),(1872,30002,'2012-10-29'),(1873,30002,'2012-10-29'),(1874,30020,'2012-10-29'),(1875,30002,'2012-10-29'),(1876,30002,'2012-10-29'),(1877,30002,'2012-10-29'),(1878,30002,'2012-10-29'),(1879,30002,'2012-10-29'),(1880,30002,'2012-10-29'),(1881,30002,'2012-10-29'),(1882,30002,'2012-10-29'),(1883,30002,'2012-10-29'),(1884,30002,'2012-10-29'),(1885,30002,'2012-10-29'),(1886,30002,'2012-10-29'),(1887,30002,'2012-10-29'),(1888,30002,'2012-10-29'),(1889,30002,'2012-10-29'),(1890,30002,'2012-10-29'),(1891,30002,'2012-10-29'),(1892,30002,'2012-10-29'),(1893,30002,'2012-10-29'),(1894,30002,'2012-10-29'),(1895,30002,'2012-10-29'),(1896,30002,'2012-10-29'),(1897,30002,'2012-10-29'),(1898,30002,'2012-10-29'),(1899,30002,'2012-10-29'),(1900,30002,'2012-10-29'),(1901,30002,'2012-10-29'),(1902,30020,'2012-10-29'),(1903,30002,'2012-10-30'),(1904,30002,'2012-10-30'),(1905,30012,'2012-10-30'),(1906,30012,'2012-10-30'),(1907,30002,'2012-10-30'),(1908,30002,'2012-10-30'),(1909,30002,'2012-10-30'),(1910,30002,'2012-10-30'),(1911,30002,'2012-10-30'),(1912,30002,'2012-10-30'),(1913,30002,'2012-10-30'),(1914,30002,'2012-10-30'),(1915,30002,'2012-10-30'),(1916,30002,'2012-10-30'),(1917,30002,'2012-10-30'),(1918,30002,'2012-10-30'),(1919,30002,'2012-10-30'),(1920,30002,'2012-10-30'),(1921,30002,'2012-10-30'),(1922,30002,'2012-10-30'),(1923,30002,'2012-10-30'),(1924,30002,'2012-10-30'),(1925,30002,'2012-10-30'),(1926,30012,'2012-10-30'),(1927,30002,'2012-10-30'),(1928,30002,'2012-10-30'),(1929,30002,'2012-10-30'),(1930,30002,'2012-10-30'),(1931,30002,'2012-10-30'),(1932,30016,'2012-10-30'),(1933,30002,'2012-10-30'),(1934,30002,'2012-10-30'),(1935,30002,'2012-10-31'),(1936,30002,'2012-10-31'),(1937,30002,'2012-10-31'),(1938,30002,'2012-10-31'),(1939,30002,'2012-10-31'),(1940,30002,'2012-10-31'),(1941,30002,'2012-10-31'),(1942,30002,'2012-10-31'),(1943,30003,'2012-10-31'),(1944,30003,'2012-10-31'),(1945,30002,'2012-10-31'),(1946,30002,'2012-10-31'),(1947,30002,'2012-10-31'),(1948,30002,'2012-10-31'),(1949,30002,'2012-10-31'),(1950,30002,'2012-10-31'),(1951,30002,'2012-10-31'),(1952,30016,'2012-10-31'),(1953,30016,'2012-10-31'),(1954,30002,'2012-10-31'),(1955,30002,'2012-10-31'),(1956,30002,'2012-10-31'),(1957,30002,'2012-10-31'),(1958,30002,'2012-10-31'),(1959,30002,'2012-10-31'),(1960,30002,'2012-10-31'),(1961,30002,'2012-10-31'),(1962,30003,'2012-10-31'),(1963,30003,'2012-10-31'),(1964,30002,'2012-10-31'),(1965,30002,'2012-10-31'),(1966,30002,'2012-10-31'),(1967,30002,'2012-10-31'),(1968,30002,'2012-10-31'),(1969,30002,'2012-10-31'),(1970,30002,'2012-10-31'),(1971,30002,'2012-10-31'),(1972,30020,'2012-10-31'),(1973,30020,'2012-10-31'),(1974,30002,'2012-11-01'),(1975,30002,'2012-11-01'),(1976,30002,'2012-11-01'),(1977,30002,'2012-11-01'),(1978,30002,'2012-11-01'),(1979,30002,'2012-11-01'),(1980,30002,'2012-11-01'),(1981,30012,'2012-11-01'),(1982,30002,'2012-11-01'),(1983,30002,'2012-11-01'),(1984,30002,'2012-11-01'),(1985,30002,'2012-11-01'),(1986,30002,'2012-11-01'),(1987,30002,'2012-11-01'),(1988,30002,'2012-11-01'),(1989,30002,'2012-11-01');
/*!40000 ALTER TABLE `jobviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `getallrec`
--

DROP TABLE IF EXISTS `getallrec`;
/*!50001 DROP VIEW IF EXISTS `getallrec`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `getallrec` (
  `empid` int(11),
  `sCompleteDesc` text,
  `sDescription` varchar(500),
  `article_data` varchar(1000),
  `sRecruiterName` varchar(100),
  `swebsite` varchar(500),
  `semailaddress` varchar(255),
  `totaljobs` bigint(21)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `jobtable`
--

DROP TABLE IF EXISTS `jobtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobtable` (
  `idJobs` int(11) DEFAULT NULL,
  `Catid` int(11) DEFAULT NULL,
  `Termid` int(11) DEFAULT NULL,
  `EmpID` int(11) DEFAULT NULL,
  `JtabID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`JtabID`)
) ENGINE=MyISAM AUTO_INCREMENT=463 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobtable`
--

LOCK TABLES `jobtable` WRITE;
/*!40000 ALTER TABLE `jobtable` DISABLE KEYS */;
INSERT INTO `jobtable` VALUES (1,10000,10000,30002,1),(2,10000,10000,30002,2),(3,10000,10000,30002,3),(4,10000,10000,30003,4),(36,1001,5001,30003,445),(6,10000,10000,30002,6),(7,10000,10000,30002,7),(8,10000,10000,30002,8),(9,10000,10000,30002,9),(10,10000,10000,30002,15),(11,10000,10000,30002,22),(12,10000,10000,30002,27),(13,10000,10000,30002,28),(14,10000,10000,30002,29),(15,10000,10000,30002,30),(16,10000,10000,30002,31),(17,10000,10000,30002,35),(18,10000,10000,30002,49),(19,10000,10000,30002,60),(20,10000,10000,30002,69),(21,10000,10000,30002,83),(22,10000,10000,30002,91),(23,10000,10000,30002,93),(25,10000,10000,30012,103),(26,10000,10000,30012,114),(37,1005,6002,30003,462),(37,1005,6001,30003,461),(37,1005,6000,30003,460),(37,1004,7001,30003,459),(27,10000,10000,30012,156),(37,1003,3004,30003,458),(37,1002,3002,30003,457),(37,1002,3001,30003,456),(37,1001,5014,30003,455),(37,1000,4001,30003,454),(37,10000,10000,30003,453),(36,1005,6003,30003,452),(36,1005,6002,30003,451),(36,1005,6001,30003,450),(36,1005,6000,30003,449),(36,1004,7000,30003,448),(28,10000,10000,30012,168),(36,1003,3003,30003,447),(36,1002,3000,30003,446),(33,1004,7000,30020,441),(33,1003,3003,30020,440),(33,1002,3000,30020,439),(32,1004,7000,30016,438),(32,1003,3003,30016,437),(32,1002,3000,30016,436),(34,1004,7000,30012,435),(34,1003,3004,30012,434),(34,1002,3001,30012,433),(31,1004,7000,30012,432),(31,1003,3004,30012,431),(31,1002,3001,30012,430),(29,10000,10000,30012,183),(30,1004,7000,30012,429),(30,1003,3004,30012,428),(30,1002,3001,30012,427),(29,1004,7000,30012,426),(29,1003,3003,30012,425),(29,1002,3000,30012,424),(28,1004,7000,30012,423),(28,1003,3003,30012,422),(28,1002,3000,30012,421),(30,10000,10000,30012,193),(27,1004,7000,30012,420),(27,1003,3003,30012,419),(27,1002,3000,30012,418),(25,1004,7000,30012,417),(25,1003,3003,30012,416),(25,1002,3000,30012,415),(35,1004,7000,30002,414),(35,1003,3003,30002,413),(35,1002,3000,30002,412),(23,1004,7000,30002,411),(23,1003,3003,30002,410),(31,10000,10000,30012,205),(23,1002,3000,30002,409),(22,1004,7000,30002,408),(22,1003,3003,30002,407),(22,1002,3001,30002,406),(21,1004,7000,30002,405),(21,1003,3003,30002,404),(21,1002,3000,30002,403),(20,1004,7000,30002,402),(20,1003,3004,30002,401),(20,1002,3001,30002,400),(19,1004,7000,30002,399),(19,1003,3004,30002,398),(32,10000,10000,30016,218),(19,1002,3001,30002,397),(18,1004,7000,30002,396),(18,1003,3003,30002,395),(18,1002,3000,30002,394),(17,1004,7000,30002,393),(17,1003,3003,30002,392),(17,1002,3000,30002,391),(16,1004,7000,30002,390),(33,10000,10000,30020,227),(16,1003,3004,30002,389),(16,1002,3001,30002,388),(15,1004,7001,30002,387),(15,1003,3004,30002,386),(15,1002,3001,30002,385),(14,1004,7001,30002,384),(14,1003,3004,30002,383),(14,1002,3001,30002,382),(34,10000,10000,30012,236),(13,1004,7000,30002,381),(13,1003,3004,30002,380),(13,1002,3001,30002,379),(12,1004,7000,30002,378),(12,1003,3003,30002,377),(12,1002,3001,30002,376),(11,1004,7000,30002,375),(11,1003,3003,30002,374),(11,1002,3000,30002,373),(10,1004,7000,30002,372),(10,1003,3004,30002,371),(10,1002,3002,30002,370),(9,1004,7001,30002,369),(35,10000,10000,30002,250),(9,1003,3003,30002,368),(9,1002,3000,30002,367),(8,1004,7000,30002,366),(8,1003,3003,30002,365),(8,1002,3000,30002,364),(7,1004,7000,30002,363),(7,1003,3003,30002,362),(7,1002,3000,30002,361),(6,1004,7000,30002,360),(6,1003,3003,30002,359),(6,1002,3001,30002,358),(3,1004,7000,30002,357),(3,1003,3003,30002,356),(3,1002,3001,30002,355),(2,1004,7000,30002,354),(2,1003,3003,30002,353),(2,1002,3000,30002,352),(1,1004,7000,30002,351),(1,1003,3003,30002,350),(1,1002,3000,30002,349),(36,1000,4003,30003,444),(36,10000,10000,30003,327),(36,1000,4002,30003,443),(36,1000,4001,30003,442),(4,1004,7000,30003,345),(4,1003,3003,30003,344),(4,1002,3000,30003,343);
/*!40000 ALTER TABLE `jobtable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertype`
--

DROP TABLE IF EXISTS `usertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usertype` (
  `uUserType` int(11) NOT NULL DEFAULT '0',
  `sText` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`uUserType`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertype`
--

LOCK TABLES `usertype` WRITE;
/*!40000 ALTER TABLE `usertype` DISABLE KEYS */;
INSERT INTO `usertype` VALUES (0,'CMSAdministrator'),(1,'Recruiter'),(2,'JobSeeker');
/*!40000 ALTER TABLE `usertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `getjobssinglearch`
--

DROP TABLE IF EXISTS `getjobssinglearch`;
/*!50001 DROP VIEW IF EXISTS `getjobssinglearch`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `getjobssinglearch` (
  `idJobs` int(11),
  `sTitle` varchar(255),
  `sShortDescription` varchar(255),
  `sFreeText` varchar(255),
  `sDescription` longtext,
  `dtEnteredDate` date,
  `sSalaryText` varchar(100),
  `sMinSal` int(11),
  `EmployeeID` int(11),
  `termid` int(11),
  `sMaxSal` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `getsubjectemailapps`
--

DROP TABLE IF EXISTS `getsubjectemailapps`;
/*!50001 DROP VIEW IF EXISTS `getsubjectemailapps`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `getsubjectemailapps` (
  `sRef` varchar(45),
  `stitle` varchar(255),
  `idjobs` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `getjobs`
--

/*!50001 DROP TABLE IF EXISTS `getjobs`*/;
/*!50001 DROP VIEW IF EXISTS `getjobs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `getjobs` AS select `jbs`.`idJobs` AS `idJobs`,`cat`.`sCategory` AS `scategory`,`jbs`.`sTitle` AS `sTitle`,`jbs`.`sShortDescription` AS `sShortDescription`,`jbs`.`sFreeText` AS `sFreeText`,`jbs`.`sDescription` AS `sDescription`,`trm`.`sTerm` AS `sterm`,`jbs`.`sJobstartdate` AS `dtEnteredDate`,`jbs`.`sSalaryText` AS `sSalaryText`,`jbs`.`sMinSal` AS `sMinSal`,`rec`.`EmpID` AS `EmployeeID`,`jt`.`Termid` AS `termid`,`jbs`.`sMaxSal` AS `sMaxSal` from ((((`jobs` `jbs` join `jobtable` `jt`) join `recruiters` `rec`) join `categories` `cat`) join `terms` `trm`) where ((`jbs`.`idJobs` = `jt`.`idJobs`) and (`rec`.`EmpID` = `jt`.`EmpID`) and (`cat`.`Catid` = `jt`.`Catid`) and (`trm`.`Termid` = `jt`.`Termid`) and (`jbs`.`sJobenddate` >= curdate())) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `jobtorecruiter`
--

/*!50001 DROP TABLE IF EXISTS `jobtorecruiter`*/;
/*!50001 DROP VIEW IF EXISTS `jobtorecruiter`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `jobtorecruiter` AS select `j`.`idJobs` AS `idjobs`,`r`.`EmpID` AS `empid` from ((`jobs` `j` join `jobtable` `jt`) join `recruiters` `r`) where ((`j`.`idJobs` = `jt`.`idJobs`) and (`jt`.`EmpID` = `r`.`EmpID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `jobpostedview`
--

/*!50001 DROP TABLE IF EXISTS `jobpostedview`*/;
/*!50001 DROP VIEW IF EXISTS `jobpostedview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `jobpostedview` AS select count(`jobs`.`idJobs`) AS `idjobs`,`recruiters`.`EmpID` AS `empid`,`jobs`.`dtEnteredDate` AS `dtentered` from ((`jobs` join `jobtable`) join `recruiters`) where ((`jobs`.`idJobs` = `jobtable`.`idJobs`) and (`jobtable`.`EmpID` = `recruiters`.`EmpID`) and (`jobtable`.`Catid` = 10000) and (`jobtable`.`Termid` = 10000)) group by `jobs`.`dtEnteredDate`,`recruiters`.`EmpID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `br_mainstart`
--

/*!50001 DROP TABLE IF EXISTS `br_mainstart`*/;
/*!50001 DROP VIEW IF EXISTS `br_mainstart`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `br_mainstart` AS select `terms`.`Termid` AS `termid`,`categories`.`sCategory` AS `sterm`,count(`jobtable`.`Catid`) AS `ctotals` from (((`jobs` join `jobtable`) join `terms`) join `categories`) where ((`jobs`.`idJobs` = `jobtable`.`idJobs`) and (`jobtable`.`Catid` <> 10000) and (`jobs`.`sJobenddate` >= curdate()) and (`categories`.`Catid` = `jobtable`.`Catid`) and (`jobtable`.`Termid` = `terms`.`Termid`)) group by `jobtable`.`Catid` order by count(`jobtable`.`Catid`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `aggregatedmpage`
--

/*!50001 DROP TABLE IF EXISTS `aggregatedmpage`*/;
/*!50001 DROP VIEW IF EXISTS `aggregatedmpage`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `aggregatedmpage` AS select `appagr`.`applicationvolume` AS `applicationvolume`,`getjobssingle`.`idJobs` AS `idJobs`,`getjobssingle`.`sTitle` AS `sTitle`,`getjobssingle`.`sShortDescription` AS `sShortDescription`,`getjobssingle`.`sFreeText` AS `sFreeText`,`getjobssingle`.`sDescription` AS `sDescription`,`getjobssingle`.`dtEnteredDate` AS `dtEnteredDate`,`getjobssingle`.`sSalaryText` AS `sSalaryText`,`getjobssingle`.`sMinSal` AS `sMinSal`,`getjobssingle`.`EmployeeID` AS `EmployeeID`,`getjobssingle`.`sMaxSal` AS `sMaxSal` from (`getjobssingle` left join `applicationaggregate` `appagr` on((`getjobssingle`.`idJobs` = `appagr`.`idjobs`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `getapp`
--

/*!50001 DROP TABLE IF EXISTS `getapp`*/;
/*!50001 DROP VIEW IF EXISTS `getapp`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `getapp` AS select `jobs`.`idJobs` AS `idJobs`,`jobs`.`sTitle` AS `sTitle`,`jobs`.`sShortDescription` AS `sShortDescription`,`jobs`.`sDescription` AS `sDescription`,`dcs`.`doc_url` AS `completeurl`,`jobs`.`dtEnteredDate` AS `dtEnteredDate`,`jobs`.`sSalaryText` AS `sSalaryText`,`jobs`.`sMinSal` AS `sMinSal`,`jobs`.`sMaxSal` AS `sMaxSal`,`jobs`.`sRef` AS `sRef`,`jobs`.`sFreeText` AS `sFreeText`,`jobs`.`sJobstartdate` AS `sJobstartdate`,`jobs`.`sJobenddate` AS `sJobenddate`,`app`.`idApplications` AS `idApplications`,`app`.`liCandidateID` AS `liCandidateID`,`app`.`dtEntered` AS `dtEntered`,`app`.`aFirstName` AS `aFirstName`,`app`.`aLastName` AS `aLastName`,`app`.`aDateofbirth` AS `aDateofbirth`,`app`.`aProfileSummary` AS `aProfileSummary`,`app`.`documentID` AS `documentID`,`app`.`aApplicationEmail` AS `aApplicationEmail`,`rec`.`EmpID` AS `empid`,`rec`.`sRecruiterName` AS `srecruitername` from (((((`applications` `app` join `appjobmapper` `ajm`) join `documents` `dcs`) join `jobs`) join `jobtable` `jt`) join `recruiters` `rec`) where ((`app`.`idApplications` = `ajm`.`idApplications`) and (`ajm`.`idjobs` = `jobs`.`idJobs`) and (`jobs`.`idJobs` = `jt`.`idJobs`) and (`jt`.`EmpID` = `rec`.`EmpID`) and (`dcs`.`DocumentID` = `app`.`documentID`) and (`jt`.`Catid` = 10000)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `aggregatedmulti`
--

/*!50001 DROP TABLE IF EXISTS `aggregatedmulti`*/;
/*!50001 DROP VIEW IF EXISTS `aggregatedmulti`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `aggregatedmulti` AS select `appagr`.`applicationvolume` AS `applicationvolume`,`getjobs`.`sterm` AS `sterm`,`getjobs`.`idJobs` AS `idJobs`,`getjobs`.`sTitle` AS `sTitle`,`getjobs`.`scategory` AS `scategory`,`getjobs`.`sShortDescription` AS `sShortDescription`,`getjobs`.`sFreeText` AS `sFreeText`,`getjobs`.`sDescription` AS `sDescription`,`getjobs`.`dtEnteredDate` AS `dtEnteredDate`,`getjobs`.`sSalaryText` AS `sSalaryText`,`getjobs`.`sMinSal` AS `sMinSal`,`getjobs`.`EmployeeID` AS `EmployeeID`,`getjobs`.`termid` AS `termid`,`getjobs`.`sMaxSal` AS `sMaxSal` from (`getjobs` left join `applicationaggregate` `appagr` on((`getjobs`.`idJobs` = `appagr`.`idjobs`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_getjobsarch`
--

/*!50001 DROP TABLE IF EXISTS `vw_getjobsarch`*/;
/*!50001 DROP VIEW IF EXISTS `vw_getjobsarch`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_getjobsarch` AS select `jbs`.`idJobs` AS `idJobs`,`jbs`.`sTitle` AS `sTitle`,`jbs`.`sShortDescription` AS `sShortDescription`,`jbs`.`sFreeText` AS `sFreeText`,`jbs`.`sDescription` AS `sDescription`,`jbs`.`sJobenddate` AS `sjobenddate`,`jbs`.`sJobstartdate` AS `dtEnteredDate`,`jbs`.`sSalaryText` AS `sSalaryText`,`jbs`.`sMinSal` AS `sMinSal`,`rec`.`EmpID` AS `EmployeeID`,`jbs`.`sMaxSal` AS `sMaxSal` from ((((`jobs` `jbs` join `jobtable` `jt`) join `recruiters` `rec`) join `categories` `cat`) join `terms` `trm`) where ((`jbs`.`idJobs` = `jt`.`idJobs`) and (`rec`.`EmpID` = `jt`.`EmpID`) and (`cat`.`Catid` = `jt`.`Catid`) and (`trm`.`Termid` = `jt`.`Termid`) and (`jt`.`Catid` = 10000) and (`jbs`.`sJobenddate` <= curdate())) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `getmyapps`
--

/*!50001 DROP TABLE IF EXISTS `getmyapps`*/;
/*!50001 DROP VIEW IF EXISTS `getmyapps`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `getmyapps` AS select `apps`.`idApplications` AS `idApplications`,`rec`.`sRecruiterName` AS `sRecruiterName`,`astat`.`sTerm` AS `Applicationstatus`,`jb`.`sTitle` AS `stitle`,`apps`.`liCandidateID` AS `liCandidateID`,`apps`.`dtEntered` AS `dtEntered`,`apps`.`aFirstName` AS `aFirstName`,`apps`.`aLastName` AS `aLastName`,`apps`.`aProfileSummary` AS `aProfileSummary`,`usr`.`uUsername` AS `uusername`,`can`.`idCandidates` AS `idCandidates`,`can`.`cCandidateName` AS `cCandidateName`,`can`.`cFirstName` AS `cFirstName`,`can`.`cLastName` AS `cLastName`,`usr`.`idUsers` AS `idusers` from (((((((`applications` `apps` join `tb_applicationstatus` `astat`) join `users` `usr`) join `candidates` `can`) join `appjobmapper` `ajb`) join `jobs` `jb`) join `jobtable` `jtab`) join `recruiters` `rec`) where ((`astat`.`aApplicationstatus` = `apps`.`aApplicationStatus`) and (`apps`.`liCandidateID` = `can`.`idCandidates`) and (`usr`.`uCandidateID` = `can`.`idCandidates`) and (`apps`.`idApplications` = `ajb`.`idApplications`) and (`ajb`.`idjobs` = `jb`.`idJobs`) and (`jb`.`idJobs` = `jtab`.`idJobs`) and (`jtab`.`Catid` = 10000) and (`jtab`.`Termid` = 10000) and (`jtab`.`EmpID` = `rec`.`EmpID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_adgen`
--

/*!50001 DROP TABLE IF EXISTS `vw_adgen`*/;
/*!50001 DROP VIEW IF EXISTS `vw_adgen`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_adgen` AS select `tdt`.`adpath` AS `adpath`,`tadv`.`adsection` AS `adsection`,`tadv`.`adkey` AS `adkey` from (`tb_adverts` `tadv` join `tb_advertdetail` `tdt`) where (`tadv`.`adkey` = `tdt`.`adkey`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `br_filter`
--

/*!50001 DROP TABLE IF EXISTS `br_filter`*/;
/*!50001 DROP VIEW IF EXISTS `br_filter`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `br_filter` AS select `br_subview`.`termid` AS `termid`,`br_subview`.`sterm` AS `sterm`,`br_subview`.`ctotals` AS `ctotals`,`categories`.`Catid` AS `catid`,`categories`.`sCategory` AS `scategory` from ((`br_subview` join `categorytoterm`) join `categories`) where ((`br_subview`.`termid` = `categorytoterm`.`Termid`) and (`categorytoterm`.`Catid` = `categories`.`Catid`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `getdetailspages`
--

/*!50001 DROP TABLE IF EXISTS `getdetailspages`*/;
/*!50001 DROP VIEW IF EXISTS `getdetailspages`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `getdetailspages` AS select `jobs`.`idJobs` AS `idJobs`,`terms`.`minrange` AS `minrange`,`terms`.`maxrange` AS `maxrange`,`terms`.`Termid` AS `Termid`,`jobtable`.`Catid` AS `catid`,`terms`.`sTerm` AS `sTerm` from ((`jobtable` join `jobs`) join `terms`) where ((`jobtable`.`idJobs` = `jobs`.`idJobs`) and (`jobtable`.`Termid` = `terms`.`Termid`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_jobsoutmail`
--

/*!50001 DROP TABLE IF EXISTS `vw_jobsoutmail`*/;
/*!50001 DROP VIEW IF EXISTS `vw_jobsoutmail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_jobsoutmail` AS select `s`.`emailaddress` AS `emailaddress`,`j`.`idJobs` AS `idjobs`,`j`.`sTitle` AS `stitle` from (((`tb_subscriptions` `s` join `terms` `t`) join `jobtable` `jt`) join `jobs` `j`) where ((`s`.`termid` = `t`.`Termid`) and (`jt`.`Termid` = `t`.`Termid`) and (`j`.`idJobs` = `jt`.`idJobs`) and (`j`.`sJobenddate` >= curdate())) group by `j`.`idJobs` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_getblockedrec`
--

/*!50001 DROP TABLE IF EXISTS `vw_getblockedrec`*/;
/*!50001 DROP VIEW IF EXISTS `vw_getblockedrec`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_getblockedrec` AS select `rec`.`EmpID` AS `empid`,`rec`.`sRecruiterName` AS `srecruitername`,NULL AS `idcandidates` from `jd`.`recruiters` `rec` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `jobapplicationview`
--

/*!50001 DROP TABLE IF EXISTS `jobapplicationview`*/;
/*!50001 DROP VIEW IF EXISTS `jobapplicationview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `jobapplicationview` AS select `applications`.`dtEntered` AS `dtEntered`,`jobs`.`idJobs` AS `idjobs`,`recruiters`.`EmpID` AS `empid` from ((((`appjobmapper` join `jobs`) join `applications`) join `jobtable`) join `recruiters`) where ((`appjobmapper`.`idjobs` = `jobs`.`idJobs`) and (`appjobmapper`.`idApplications` = `applications`.`idApplications`) and (`jobtable`.`idJobs` = `jobs`.`idJobs`) and (`jobtable`.`EmpID` = `recruiters`.`EmpID`) and (`jobtable`.`Catid` = 10000) and (`jobtable`.`Termid` = 10000)) group by `applications`.`dtEntered` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `recusers`
--

/*!50001 DROP TABLE IF EXISTS `recusers`*/;
/*!50001 DROP VIEW IF EXISTS `recusers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `recusers` AS select `j`.`idJobs` AS `idjobs`,`rec`.`EmpID` AS `empid`,`usr`.`uFirstName` AS `uFirstName`,`usr`.`uLastName` AS `ulastname` from ((((`jobtable` `jt` join `jobs` `j`) join `recruiters` `rec`) join `recusermapper` `rmap`) join `users` `usr`) where ((`rec`.`EmpID` = `rmap`.`EmpID`) and (`rmap`.`idUsers` = `usr`.`idUsers`) and (`rec`.`EmpID` = `jt`.`EmpID`) and (`jt`.`idJobs` = `j`.`idJobs`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `br_subview`
--

/*!50001 DROP TABLE IF EXISTS `br_subview`*/;
/*!50001 DROP VIEW IF EXISTS `br_subview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `br_subview` AS select `terms`.`Termid` AS `termid`,`terms`.`sTerm` AS `sterm`,count(`terms`.`sTerm`) AS `ctotals` from ((`jobs` join `jobtable`) join `terms`) where ((`jobs`.`sJobenddate` >= curdate()) and (`jobs`.`idJobs` = `jobtable`.`idJobs`) and (`jobtable`.`Termid` = `terms`.`Termid`)) group by `terms`.`sTerm` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `getusercans`
--

/*!50001 DROP TABLE IF EXISTS `getusercans`*/;
/*!50001 DROP VIEW IF EXISTS `getusercans`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `getusercans` AS select `usr`.`idUsers` AS `idUsers`,`usr`.`uUserType` AS `uUserType`,`usr`.`uUsername` AS `uUsername`,`usr`.`uPassword` AS `uPassword`,`usr`.`uPasswordHint` AS `uPasswordHint`,`usr`.`uFirstName` AS `uFirstName`,`usr`.`uLastName` AS `uLastName`,`usr`.`uIsPrimary` AS `uIsPrimary`,`usr`.`uCandidateID` AS `uCandidateID`,`can`.`idCandidates` AS `idCandidates`,`can`.`cCandidateName` AS `cCandidateName`,`can`.`cFirstName` AS `cFirstName`,`can`.`cDateofbirth` AS `cdateofbirth`,`can`.`cLastName` AS `cLastName`,`can`.`cAddress1` AS `cAddress1`,`can`.`cAddress2` AS `cAddress2`,`can`.`cAddress3` AS `cAddress3`,`can`.`cTown` AS `cTown`,`can`.`cCounty` AS `cCounty`,`can`.`cPostcode` AS `cPostcode`,`can`.`cHomephone` AS `cHomephone`,`can`.`cWorkphone` AS `cWorkphone`,`can`.`cdtEntered` AS `cdtEntered`,`can`.`cCountry` AS `cCountry` from (`users` `usr` join `candidates` `can`) where ((`usr`.`uUserType` = 2) and (`can`.`idCandidates` = `usr`.`uCandidateID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `getjobssingle`
--

/*!50001 DROP TABLE IF EXISTS `getjobssingle`*/;
/*!50001 DROP VIEW IF EXISTS `getjobssingle`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `getjobssingle` AS select `jbs`.`idJobs` AS `idJobs`,`jbs`.`sTitle` AS `sTitle`,`jbs`.`sShortDescription` AS `sShortDescription`,`jbs`.`sFreeText` AS `sFreeText`,`jbs`.`sDescription` AS `sDescription`,`jbs`.`sJobenddate` AS `sjobenddate`,`jbs`.`sJobstartdate` AS `dtEnteredDate`,`jbs`.`sSalaryText` AS `sSalaryText`,`jbs`.`sMinSal` AS `sMinSal`,`rec`.`EmpID` AS `EmployeeID`,`jbs`.`sMaxSal` AS `sMaxSal` from ((((`jobs` `jbs` join `jobtable` `jt`) join `recruiters` `rec`) join `categories` `cat`) join `terms` `trm`) where ((`jbs`.`idJobs` = `jt`.`idJobs`) and (`rec`.`EmpID` = `jt`.`EmpID`) and (`cat`.`Catid` = `jt`.`Catid`) and (`trm`.`Termid` = `jt`.`Termid`) and (`jt`.`Catid` = 10000) and (`jbs`.`sJobenddate` >= curdate())) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_jobtrendsectors`
--

/*!50001 DROP TABLE IF EXISTS `vw_jobtrendsectors`*/;
/*!50001 DROP VIEW IF EXISTS `vw_jobtrendsectors`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_jobtrendsectors` AS select count(`jobs`.`idJobs`) AS `jbtotal`,`terms`.`sTerm` AS `sterm` from ((`jobtable` join `jobs`) join `terms`) where ((`jobtable`.`idJobs` = `jobs`.`idJobs`) and (`jobtable`.`Catid` = 1001) and (`jobtable`.`Termid` = `terms`.`Termid`)) group by `terms`.`Termid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `getjobsarchived`
--

/*!50001 DROP TABLE IF EXISTS `getjobsarchived`*/;
/*!50001 DROP VIEW IF EXISTS `getjobsarchived`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `getjobsarchived` AS select `jbs`.`idJobs` AS `idJobs`,`jbs`.`sTitle` AS `sTitle`,`jbs`.`sShortDescription` AS `sShortDescription`,`jbs`.`sFreeText` AS `sFreeText`,`jbs`.`sDescription` AS `sDescription`,`jbs`.`sJobstartdate` AS `dtEnteredDate`,`jbs`.`sSalaryText` AS `sSalaryText`,`jbs`.`sMinSal` AS `sMinSal`,`rec`.`EmpID` AS `EmployeeID`,`jt`.`Termid` AS `termid`,`jbs`.`sMaxSal` AS `sMaxSal` from ((((`jobs` `jbs` join `jobtable` `jt`) join `recruiters` `rec`) join `categories` `cat`) join `terms` `trm`) where ((`jbs`.`idJobs` = `jt`.`idJobs`) and (`rec`.`EmpID` = `jt`.`EmpID`) and (`cat`.`Catid` = `jt`.`Catid`) and (`trm`.`Termid` = `jt`.`Termid`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `applicationaggregate`
--

/*!50001 DROP TABLE IF EXISTS `applicationaggregate`*/;
/*!50001 DROP VIEW IF EXISTS `applicationaggregate`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `applicationaggregate` AS select `appjobmapper`.`idjobs` AS `idjobs`,count(`applications`.`idApplications`) AS `applicationvolume` from (`applications` join `appjobmapper`) where (`applications`.`idApplications` = `appjobmapper`.`idApplications`) group by `appjobmapper`.`idjobs` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `getallrec`
--

/*!50001 DROP TABLE IF EXISTS `getallrec`*/;
/*!50001 DROP VIEW IF EXISTS `getallrec`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `getallrec` AS select `rec`.`EmpID` AS `empid`,`rec`.`sCompleteDesc` AS `sCompleteDesc`,`rec`.`sDescription` AS `sDescription`,`ar`.`Article_data` AS `article_data`,`rec`.`sRecruiterName` AS `sRecruiterName`,`rec`.`sWebsite` AS `swebsite`,`rec`.`sEmailAddress` AS `semailaddress`,count(`jt`.`idJobs`) AS `totaljobs` from ((`recruiters` `rec` join `jobtable` `jt`) join `articles` `ar`) where ((`rec`.`EmpID` = `jt`.`EmpID`) and (`ar`.`sArticleID` = `rec`.`sArticleId`) and (`jt`.`Catid` = 10000) and (`jt`.`Termid` = 10000)) group by `rec`.`EmpID`,`rec`.`sRecruiterName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `getjobssinglearch`
--

/*!50001 DROP TABLE IF EXISTS `getjobssinglearch`*/;
/*!50001 DROP VIEW IF EXISTS `getjobssinglearch`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `getjobssinglearch` AS select `jbs`.`idJobs` AS `idJobs`,`jbs`.`sTitle` AS `sTitle`,`jbs`.`sShortDescription` AS `sShortDescription`,`jbs`.`sFreeText` AS `sFreeText`,`jbs`.`sDescription` AS `sDescription`,`jbs`.`sJobstartdate` AS `dtEnteredDate`,`jbs`.`sSalaryText` AS `sSalaryText`,`jbs`.`sMinSal` AS `sMinSal`,`rec`.`EmpID` AS `EmployeeID`,`jt`.`Termid` AS `termid`,`jbs`.`sMaxSal` AS `sMaxSal` from ((((`jobs` `jbs` join `jobtable` `jt`) join `recruiters` `rec`) join `categories` `cat`) join `terms` `trm`) where ((`jbs`.`idJobs` = `jt`.`idJobs`) and (`rec`.`EmpID` = `jt`.`EmpID`) and (`cat`.`Catid` = `jt`.`Catid`) and (`trm`.`Termid` = `jt`.`Termid`) and (`jt`.`Termid` = 10000) and (`jt`.`Catid` = 10000)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `getsubjectemailapps`
--

/*!50001 DROP TABLE IF EXISTS `getsubjectemailapps`*/;
/*!50001 DROP VIEW IF EXISTS `getsubjectemailapps`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `getsubjectemailapps` AS select `jobs`.`sRef` AS `sRef`,`jobs`.`sTitle` AS `stitle`,`jobs`.`idJobs` AS `idjobs` from `jobs` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'joblight'
--

--
-- Dumping routines for database 'joblight'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-11-01  2:50:31
