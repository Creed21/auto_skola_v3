-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: auto_skola_3
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.22-MariaDB

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
-- Table structure for table `grupa`
--

DROP TABLE IF EXISTS `grupa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` text NOT NULL,
  `dtpoc` date DEFAULT NULL,
  `usc` varchar(35) DEFAULT NULL,
  `dtc` timestamp NULL DEFAULT current_timestamp(),
  `usm` varchar(35) DEFAULT NULL,
  `dtm` timestamp NULL DEFAULT current_timestamp(),
  `id_instruktor` int(11) DEFAULT NULL,
  `id_kategorija` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grupa_usc` (`usc`),
  KEY `fk_grupa_usm` (`usm`),
  KEY `fk_gr_inst` (`id_instruktor`),
  KEY `fk_gr_kateg` (`id_kategorija`),
  CONSTRAINT `fk_gr_inst` FOREIGN KEY (`id_instruktor`) REFERENCES `instruktor` (`id`),
  CONSTRAINT `fk_gr_kateg` FOREIGN KEY (`id_kategorija`) REFERENCES `kategorija` (`id`),
  CONSTRAINT `fk_grupa_usc` FOREIGN KEY (`usc`) REFERENCES `instruktor` (`username`),
  CONSTRAINT `fk_grupa_usm` FOREIGN KEY (`usm`) REFERENCES `instruktor` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupa`
--

LOCK TABLES `grupa` WRITE;
/*!40000 ALTER TABLE `grupa` DISABLE KEYS */;
INSERT INTO `grupa` VALUES (1,'test grupa','2219-10-10','aca_janko',NULL,NULL,NULL,1,1),(2,'tttt','2022-03-06','aca_janko',NULL,'aca_janko','2022-03-30 21:24:11',1,1),(3,'A - mart 2022','2022-03-09',NULL,NULL,'aca_janko','2022-03-30 21:54:14',2,11),(4,'B1 - mart 2022','2022-03-18','aca_janko','2022-03-16 10:00:00','aca_janko','2022-03-30 21:54:14',2,11),(5,'C - feb 2022','2022-03-30','aca_janko','2022-03-30 18:30:29','aca_janko','2022-03-31 12:06:52',1,10),(6,'D - feb 2022','2022-03-15','aca_janko','2022-03-30 18:31:27','aca_janko','2022-03-31 12:06:52',1,10),(7,'123','2022-03-24','aca_janko','2022-03-30 22:20:59','aca_janko','2022-03-30 22:20:59',1,8);
/*!40000 ALTER TABLE `grupa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instruktor`
--

DROP TABLE IF EXISTS `instruktor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instruktor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ime` text NOT NULL,
  `prezime` text NOT NULL,
  `email` text NOT NULL,
  `jmbg` text NOT NULL,
  `telefon` text NOT NULL,
  `datrodj` date NOT NULL,
  `username` varchar(64) NOT NULL,
  `pass` text NOT NULL,
  `plata` double DEFAULT NULL,
  `datzap` date DEFAULT NULL,
  `usc` varchar(64) DEFAULT NULL,
  `dtc` timestamp NOT NULL DEFAULT current_timestamp(),
  `usm` varchar(64) DEFAULT NULL,
  `dtm` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`) USING HASH,
  UNIQUE KEY `jmbg` (`jmbg`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instruktor`
--

LOCK TABLES `instruktor` WRITE;
/*!40000 ALTER TABLE `instruktor` DISABLE KEYS */;
INSERT INTO `instruktor` VALUES (1,'aca','janko','aca_janko@email.com','123','+381 64/123-123','2022-02-15','aca_janko','1',555,'2022-02-20','','2022-02-15 18:58:12',NULL,NULL),(2,'test insert','test insert','email.com','0000','01234','3595-10-10','test_user','a',NULL,NULL,NULL,'2022-02-16 17:08:49',NULL,NULL),(4,'test insert','test insert','email111111.com','000000000000','01234','3595-10-10','test_user00000','a',NULL,NULL,NULL,'2022-02-16 17:10:04',NULL,NULL),(5,'test insert','test insert','email111111.cccom','224000000000000','0431234','3595-10-10','test_us343434er00000','a',NULL,NULL,NULL,'2022-02-16 17:12:53',NULL,NULL),(6,'test insert','test insert','email1211awqeom','000000123123000000','01234','3595-10-10','test_user0q23121313120000','a',NULL,NULL,NULL,'2022-02-16 17:16:41',NULL,NULL),(7,'test insert','test insert','eqqom','qqq000000','qqq01234','3595-10-10','tqqqq0000','a',NULL,NULL,NULL,'2022-02-16 17:18:17',NULL,NULL),(8,'test insert','test insert','xxx','xxx','xxx','3595-10-10','xx0000','a',NULL,NULL,NULL,'2022-02-16 17:22:00',NULL,NULL),(9,'test insert','test insert','yy','yy','yy','3595-10-10','y00','a',NULL,NULL,NULL,'2022-02-16 17:24:07',NULL,NULL),(10,'test insert','test insert','yy123','y23y','y333y','3595-10-10','123y00','a',NULL,NULL,NULL,'2022-02-16 17:33:19',NULL,NULL),(12,'a','a','a','aaa','mobilni','2022-03-02','a','a',0,'2022-03-02','admin','2022-03-02 15:20:00','admin','2022-03-02 15:20:00');
/*!40000 ALTER TABLE `instruktor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategorija`
--

DROP TABLE IF EXISTS `kategorija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategorija` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` text NOT NULL,
  `min_god` int(11) DEFAULT NULL,
  `usc` varchar(35) DEFAULT NULL,
  `dtc` timestamp NULL DEFAULT current_timestamp(),
  `usm` varchar(35) DEFAULT NULL,
  `dtm` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_kat_usc` (`usc`),
  KEY `fk_kat_usm` (`usm`),
  CONSTRAINT `fk_kat_usc` FOREIGN KEY (`usc`) REFERENCES `instruktor` (`username`),
  CONSTRAINT `fk_kat_usm` FOREIGN KEY (`usm`) REFERENCES `instruktor` (`username`),
  CONSTRAINT `check_kat_min_god` CHECK (`min_god` > 0)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategorija`
--

LOCK TABLES `kategorija` WRITE;
/*!40000 ALTER TABLE `kategorija` DISABLE KEYS */;
INSERT INTO `kategorija` VALUES (1,'A1',16,'aca_janko','2022-02-14 23:00:00',NULL,'2022-02-14 23:00:00'),(5,'XYX',22,NULL,NULL,'aca_janko','2022-03-01 20:15:00'),(6,'ZZZ',22,NULL,NULL,'aca_janko','2022-03-01 20:15:00'),(7,'BXY',34,'aca_janko','1992-04-01 08:20:00',NULL,NULL),(8,'11ww',54,'aca_janko','1992-04-01 08:20:00',NULL,NULL),(9,'BXY',34,'aca_janko','1992-04-01 08:20:00',NULL,NULL),(10,'11ww',54,'aca_janko','1992-04-01 08:20:00',NULL,NULL),(11,'B1',16,'aca_janko','2022-03-30 08:20:00',NULL,'2022-03-30 20:50:35');
/*!40000 ALTER TABLE `kategorija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odslusanicas`
--

DROP TABLE IF EXISTS `odslusanicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odslusanicas` (
  `rbr_teor_cas` int(11) NOT NULL,
  `id_ucenik` int(11) NOT NULL,
  `usc` varchar(35) DEFAULT NULL,
  `dtc` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`rbr_teor_cas`,`id_ucenik`),
  KEY `fk_odslusCas_ucenik` (`id_ucenik`),
  CONSTRAINT `fk_odslusCas_teorCas` FOREIGN KEY (`rbr_teor_cas`) REFERENCES `teorijskicas` (`rbr_teor_cas`),
  CONSTRAINT `fk_odslusCas_ucenik` FOREIGN KEY (`id_ucenik`) REFERENCES `ucenik` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odslusanicas`
--

LOCK TABLES `odslusanicas` WRITE;
/*!40000 ALTER TABLE `odslusanicas` DISABLE KEYS */;
INSERT INTO `odslusanicas` VALUES (48,3,'aca_janko','2022-03-16 23:00:00'),(48,6,'aca_janko','2022-03-16 23:00:00'),(48,7,'aca_janko','2022-03-16 23:00:00'),(48,10,'aca_janko','2022-03-16 23:00:00'),(49,3,'aca_janko','2022-03-31 19:10:49'),(49,4,'aca_janko','2022-03-31 19:10:49'),(49,5,'aca_janko','2022-03-31 19:10:49'),(49,6,'aca_janko','2022-03-31 19:10:49'),(49,7,'aca_janko','2022-03-31 19:10:49'),(49,10,'aca_janko','2022-03-31 19:10:49');
/*!40000 ALTER TABLE `odslusanicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polaznici`
--

DROP TABLE IF EXISTS `polaznici`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polaznici` (
  `id_grupa` int(11) NOT NULL,
  `id_ucenik` int(11) NOT NULL,
  `usc` varchar(35) DEFAULT NULL,
  `dtc` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_grupa`,`id_ucenik`),
  KEY `fk_polaznici_usc` (`usc`),
  KEY `fk_polaz_ucenik` (`id_ucenik`),
  CONSTRAINT `fk_polaz_grupa` FOREIGN KEY (`id_grupa`) REFERENCES `grupa` (`id`),
  CONSTRAINT `fk_polaz_ucenik` FOREIGN KEY (`id_ucenik`) REFERENCES `ucenik` (`id`),
  CONSTRAINT `fk_polaznici_usc` FOREIGN KEY (`usc`) REFERENCES `instruktor` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polaznici`
--

LOCK TABLES `polaznici` WRITE;
/*!40000 ALTER TABLE `polaznici` DISABLE KEYS */;
INSERT INTO `polaznici` VALUES (1,6,NULL,NULL),(2,3,'aca_janko','2022-03-21 14:06:37'),(2,5,'aca_janko','2022-03-30 22:32:43'),(2,6,'aca_janko','2022-03-30 22:32:43'),(2,7,'aca_janko','2022-03-30 22:32:43'),(3,2,'aca_janko','2022-03-31 20:08:29'),(3,10,'aca_janko','2022-03-31 20:08:29'),(3,12,'aca_janko','2022-03-31 20:08:29');
/*!40000 ALTER TABLE `polaznici` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prakticnicas`
--

DROP TABLE IF EXISTS `prakticnicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prakticnicas` (
  `rbr` int(11) NOT NULL AUTO_INCREMENT,
  `id_instruktor` int(11) NOT NULL,
  `id_ucenik` int(11) NOT NULL,
  `naziv` text DEFAULT NULL,
  `odrzan` date DEFAULT NULL,
  `usc` varchar(35) DEFAULT NULL,
  `dtc` date DEFAULT current_timestamp(),
  PRIMARY KEY (`rbr`,`id_instruktor`,`id_ucenik`),
  KEY `fk_prakCas_usc` (`usc`),
  KEY `fk_prakCas_instr` (`id_instruktor`),
  KEY `fk_prakCas_ucenik` (`id_ucenik`),
  CONSTRAINT `fk_prakCas_instr` FOREIGN KEY (`id_instruktor`) REFERENCES `instruktor` (`id`),
  CONSTRAINT `fk_prakCas_ucenik` FOREIGN KEY (`id_ucenik`) REFERENCES `ucenik` (`id`),
  CONSTRAINT `fk_prakCas_usc` FOREIGN KEY (`usc`) REFERENCES `instruktor` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prakticnicas`
--

LOCK TABLES `prakticnicas` WRITE;
/*!40000 ALTER TABLE `prakticnicas` DISABLE KEYS */;
INSERT INTO `prakticnicas` VALUES (1,1,2,'dlkjflsdjglsfg','2022-03-01','aca_janko','2022-03-15'),(2,1,2,'voznja magistralom','2022-03-03','aca_janko','2022-03-30'),(3,1,2,'voznja magistralom','2022-03-04','aca_janko','2022-03-31');
/*!40000 ALTER TABLE `prakticnicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teorijskicas`
--

DROP TABLE IF EXISTS `teorijskicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teorijskicas` (
  `id_instruktor` int(11) NOT NULL,
  `id_grupa` int(11) NOT NULL,
  `odrzan` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `rbr_teor_cas` int(11) NOT NULL AUTO_INCREMENT,
  `tema` text DEFAULT NULL,
  `usc` varchar(35) DEFAULT NULL,
  `dtc` date DEFAULT current_timestamp(),
  `usm` varchar(35) DEFAULT NULL,
  `dtm` date DEFAULT current_timestamp(),
  PRIMARY KEY (`id_grupa`,`id_instruktor`,`odrzan`),
  UNIQUE KEY `rbr_teor_cas` (`rbr_teor_cas`),
  KEY `fk_teorCas_instruktor` (`id_instruktor`),
  KEY `fk_teorCas_usc` (`usc`),
  KEY `fk_teorCas_usm` (`usm`),
  CONSTRAINT `fk_teorCas_grupa` FOREIGN KEY (`id_grupa`) REFERENCES `grupa` (`id`),
  CONSTRAINT `fk_teorCas_instruktor` FOREIGN KEY (`id_instruktor`) REFERENCES `instruktor` (`id`),
  CONSTRAINT `fk_teorCas_usc` FOREIGN KEY (`usc`) REFERENCES `instruktor` (`username`),
  CONSTRAINT `fk_teorCas_usm` FOREIGN KEY (`usm`) REFERENCES `instruktor` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teorijskicas`
--

LOCK TABLES `teorijskicas` WRITE;
/*!40000 ALTER TABLE `teorijskicas` DISABLE KEYS */;
INSERT INTO `teorijskicas` VALUES (1,1,'1981-02-02 08:45:00',36,'Volan','aca_janko','2022-02-16',NULL,NULL),(1,1,'1982-02-02 08:45:00',37,'Volan','aca_janko','2022-02-16',NULL,NULL),(1,1,'1983-02-02 08:45:00',38,'Volan','aca_janko','2022-02-16',NULL,NULL),(1,1,'1984-02-02 08:45:00',39,'Volan','aca_janko','2022-02-16',NULL,NULL),(1,1,'1985-02-02 08:45:00',40,'Volan','aca_janko','2022-02-16',NULL,NULL),(1,1,'1986-02-02 08:45:00',42,'Volan','aca_janko','2022-02-16',NULL,NULL),(1,1,'1987-02-02 08:45:00',43,'Volan','aca_janko','2022-02-16',NULL,NULL),(1,1,'1988-02-02 08:45:00',44,'Volan','aca_janko','2022-02-16',NULL,NULL),(1,1,'1991-02-02 08:45:00',23,'Volan','aca_janko','2022-02-16',NULL,NULL),(1,1,'1992-02-02 08:45:00',24,'Volan','aca_janko','2022-02-16',NULL,NULL),(1,1,'1993-02-02 08:45:00',26,'Volan','aca_janko','2022-02-16',NULL,NULL),(1,1,'1994-02-02 08:45:00',27,'Volan','aca_janko','2022-02-16',NULL,NULL),(1,1,'1995-02-02 08:45:00',28,'Volan','aca_janko','2022-02-16',NULL,NULL),(1,1,'1996-02-02 08:45:00',30,'Volan','aca_janko','2022-02-16',NULL,NULL),(1,1,'1997-02-02 08:45:00',32,'Volan','aca_janko','2022-02-16',NULL,NULL),(1,1,'2000-02-02 08:45:00',18,'Volan','aca_janko','2022-02-16',NULL,NULL),(1,1,'2010-02-02 08:45:00',19,'Volan','aca_janko','2022-02-16',NULL,NULL),(1,1,'2011-02-02 08:45:00',21,'Volan','aca_janko','2022-02-16',NULL,NULL),(1,1,'2022-03-03 23:24:00',47,'Unesite naziv teorijskog časa','aca_janko','2022-03-17','aca_janko','2022-03-17'),(1,1,'2022-03-03 23:29:00',48,'Unesite naziv teorijskog časa','aca_janko','2022-03-17','aca_janko','2022-03-17'),(1,3,'2022-09-30 16:00:00',46,'Unesite naziv teorijskog časa','aca_janko','2022-03-16','aca_janko','2022-03-16'),(1,4,'2021-03-03 16:15:00',49,'Unesite naziv teorijskog časa','aca_janko','2022-03-31','aca_janko','2022-03-31');
/*!40000 ALTER TABLE `teorijskicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ucenik`
--

DROP TABLE IF EXISTS `ucenik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ucenik` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ime` text NOT NULL,
  `prezime` text NOT NULL,
  `email` text NOT NULL,
  `jmbg` text NOT NULL,
  `telefon` text NOT NULL,
  `datrodj` date DEFAULT NULL,
  `usc` varchar(64) DEFAULT NULL,
  `dtc` timestamp NULL DEFAULT current_timestamp(),
  `usm` varchar(64) DEFAULT NULL,
  `dtm` timestamp NULL DEFAULT NULL,
  `zavrsio_teor` int(11) DEFAULT NULL,
  `zavrsio_prvu_pomoc` int(11) DEFAULT NULL,
  `zavrsio_prakticni` int(11) DEFAULT NULL,
  `polozio_prakticni` int(11) DEFAULT NULL,
  `polozio_teor` int(11) DEFAULT NULL,
  `dt_polozio` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`) USING HASH,
  UNIQUE KEY `jmbg` (`jmbg`) USING HASH,
  KEY `fk_ucenik_instrutkor_usc` (`usc`),
  KEY `fk_ucenik_instrutkor_usm` (`usm`),
  CONSTRAINT `fk_ucenik_instrutkor_usc` FOREIGN KEY (`usc`) REFERENCES `instruktor` (`username`),
  CONSTRAINT `fk_ucenik_instrutkor_usm` FOREIGN KEY (`usm`) REFERENCES `instruktor` (`username`),
  CONSTRAINT `check_zavr_teor` CHECK (`zavrsio_teor` in (0,1)),
  CONSTRAINT `check_zavr_prvu_pom` CHECK (`zavrsio_prvu_pomoc` in (0,1)),
  CONSTRAINT `check_zavr_prakt` CHECK (`zavrsio_prakticni` in (0,1)),
  CONSTRAINT `check_polozio_prakt` CHECK (`polozio_prakticni` in (0,1)),
  CONSTRAINT `check_polozio_teor` CHECK (`polozio_teor` in (0,1))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ucenik`
--

LOCK TABLES `ucenik` WRITE;
/*!40000 ALTER TABLE `ucenik` DISABLE KEYS */;
INSERT INTO `ucenik` VALUES (2,'Nikol','Rokvic','ucenik@email.com','21312455','2131245325','2199-01-01','aca_janko',NULL,'aca_janko','2022-04-01 09:08:04',1,1,1,1,0,NULL),(3,'ime','=prezime','imesad32@email.com','xasdd','lllkksad','2199-01-01','aca_janko',NULL,'aca_janko','2022-03-31 22:25:40',1,1,0,0,0,NULL),(4,'2','2','2','2','2',NULL,'aca_janko','2022-02-19 23:00:00','aca_janko','2022-03-31 22:25:32',1,0,0,0,0,NULL),(5,'3','3','3','3','3','1999-01-29','aca_janko','2022-02-19 23:00:00','aca_janko','2022-03-31 22:25:32',1,0,0,0,0,NULL),(6,'11','1','1','1','1','2022-02-02','aca_janko','2022-02-19 23:00:00','aca_janko','2022-03-31 22:25:32',1,0,0,0,0,NULL),(7,'test','test','eeeeee','eeeeee','01923341','2022-03-03','aca_janko','2022-03-05 23:00:00','aca_janko','2022-03-31 22:28:34',1,1,1,1,1,NULL),(10,'22','22','22','22','22','2022-03-01','aca_janko','2022-03-06 20:24:06','aca_janko','2022-03-06 20:24:06',NULL,NULL,NULL,NULL,NULL,NULL),(11,'33','33','33','33','33','2022-03-02','aca_janko','2022-03-06 20:24:53','aca_janko','2022-03-06 20:24:53',NULL,1,NULL,NULL,NULL,NULL),(12,'Marko','Zablaćanski','marko.zablacanski@test.com','122547896554','060 / 123 - 456','2000-02-03','aca_janko','2022-03-30 22:04:42','aca_janko','2022-03-30 22:04:42',NULL,NULL,1,NULL,NULL,NULL),(13,'Zoki','Zoki','zoki@test.com','1225478965542','060 / 123 - 456','2000-02-03','aca_janko','2022-03-30 22:05:16','aca_janko','2022-03-30 22:05:16',NULL,NULL,NULL,1,NULL,NULL),(14,'232','32323','23232','323232','23232','2022-03-01','aca_janko','2022-03-30 22:20:44','aca_janko','2022-03-30 22:20:44',NULL,NULL,NULL,NULL,NULL,'2022-03-05'),(15,'Ljubivoje','Dankovic','ljd@test.com','1233534656','1232431432','1940-05-03','aca_janko','2022-04-01 20:22:27','aca_janko','2022-04-01 20:22:27',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ucenik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `wx_grupa_dodaj_ucenika`
--

DROP TABLE IF EXISTS `wx_grupa_dodaj_ucenika`;
/*!50001 DROP VIEW IF EXISTS `wx_grupa_dodaj_ucenika`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `wx_grupa_dodaj_ucenika` (
  `id_grupa` tinyint NOT NULL,
  `naziv` tinyint NOT NULL,
  `dtpoc` tinyint NOT NULL,
  `id_instruktor` tinyint NOT NULL,
  `ime_instruktor` tinyint NOT NULL,
  `prezime_instruktor` tinyint NOT NULL,
  `id_kategorija` tinyint NOT NULL,
  `naziv_kategorija` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `wx_ucenik_group`
--

DROP TABLE IF EXISTS `wx_ucenik_group`;
/*!50001 DROP VIEW IF EXISTS `wx_ucenik_group`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `wx_ucenik_group` (
  `id` tinyint NOT NULL,
  `ime` tinyint NOT NULL,
  `prezime` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `telefon` tinyint NOT NULL,
  `datrodj` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'auto_skola_3'
--

--
-- Final view structure for view `wx_grupa_dodaj_ucenika`
--

/*!50001 DROP TABLE IF EXISTS `wx_grupa_dodaj_ucenika`*/;
/*!50001 DROP VIEW IF EXISTS `wx_grupa_dodaj_ucenika`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `wx_grupa_dodaj_ucenika` AS select `g`.`id` AS `id_grupa`,`g`.`naziv` AS `naziv`,`g`.`dtpoc` AS `dtpoc`,`g`.`id_instruktor` AS `id_instruktor`,`i`.`ime` AS `ime_instruktor`,`i`.`prezime` AS `prezime_instruktor`,`g`.`id_kategorija` AS `id_kategorija`,`k`.`naziv` AS `naziv_kategorija` from ((`grupa` `g` left join `instruktor` `i` on(`g`.`id_instruktor` = `i`.`id`)) left join `kategorija` `k` on(`g`.`id_kategorija` = `k`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `wx_ucenik_group`
--

/*!50001 DROP TABLE IF EXISTS `wx_ucenik_group`*/;
/*!50001 DROP VIEW IF EXISTS `wx_ucenik_group`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `wx_ucenik_group` AS select `ucenik`.`id` AS `id`,`ucenik`.`ime` AS `ime`,`ucenik`.`prezime` AS `prezime`,`ucenik`.`email` AS `email`,`ucenik`.`telefon` AS `telefon`,`ucenik`.`datrodj` AS `datrodj` from `ucenik` where !exists(select 1 from `polaznici` `p` where `p`.`id_ucenik` <> `ucenik`.`id` limit 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-09 16:32:19
