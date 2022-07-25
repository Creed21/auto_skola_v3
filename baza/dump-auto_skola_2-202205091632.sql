-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: auto_skola_2
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
  `id` int(11) NOT NULL,
  `naziv` text NOT NULL,
  `dtpoc` date DEFAULT NULL,
  `usc` varchar(35) DEFAULT NULL,
  `dtc` date DEFAULT current_timestamp(),
  `usm` varchar(35) DEFAULT NULL,
  `dtm` date DEFAULT current_timestamp(),
  `id_instr` int(11) DEFAULT NULL,
  `id_kategor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grupa_usc` (`usc`),
  KEY `fk_grupa_usm` (`usm`),
  KEY `fk_gr_inst` (`id_instr`),
  KEY `fk_gr_kateg` (`id_kategor`),
  CONSTRAINT `fk_gr_inst` FOREIGN KEY (`id_instr`) REFERENCES `instruktor` (`id`),
  CONSTRAINT `fk_gr_kateg` FOREIGN KEY (`id_kategor`) REFERENCES `kategorija` (`id`),
  CONSTRAINT `fk_grupa_usc` FOREIGN KEY (`usc`) REFERENCES `instruktor` (`username`),
  CONSTRAINT `fk_grupa_usm` FOREIGN KEY (`usm`) REFERENCES `instruktor` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupa`
--

LOCK TABLES `grupa` WRITE;
/*!40000 ALTER TABLE `grupa` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instruktor`
--

DROP TABLE IF EXISTS `instruktor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instruktor` (
  `id` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instruktor`
--

LOCK TABLES `instruktor` WRITE;
/*!40000 ALTER TABLE `instruktor` DISABLE KEYS */;
INSERT INTO `instruktor` VALUES (1,'Aleksandar','Jankovic','aj@email.com','1234567891234','+38164234887','1995-10-29','aca','a',12345,'2022-01-21','aca','2022-01-20 23:00:00',NULL,NULL);
/*!40000 ALTER TABLE `instruktor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategorija`
--

DROP TABLE IF EXISTS `kategorija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategorija` (
  `id` int(11) NOT NULL,
  `naziv` text NOT NULL,
  `min_god` int(11) DEFAULT NULL,
  `usc` varchar(35) DEFAULT NULL,
  `dtc` date DEFAULT current_timestamp(),
  `usm` varchar(35) DEFAULT NULL,
  `dtm` date DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_kat_usc` (`usc`),
  KEY `fk_kat_usm` (`usm`),
  CONSTRAINT `fk_kat_usc` FOREIGN KEY (`usc`) REFERENCES `instruktor` (`username`),
  CONSTRAINT `fk_kat_usm` FOREIGN KEY (`usm`) REFERENCES `instruktor` (`username`),
  CONSTRAINT `check_kat_min_god` CHECK (`min_god` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategorija`
--

LOCK TABLES `kategorija` WRITE;
/*!40000 ALTER TABLE `kategorija` DISABLE KEYS */;
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
  `dtc` date DEFAULT current_timestamp(),
  PRIMARY KEY (`rbr_teor_cas`,`id_ucenik`),
  KEY `fk_odslusCas_ucenik` (`id_ucenik`),
  KEY `fk_odslusCas_usc` (`usc`),
  CONSTRAINT `fk_odslusCas_teorCas` FOREIGN KEY (`rbr_teor_cas`) REFERENCES `teorijskicas` (`rbr_teor_cas`),
  CONSTRAINT `fk_odslusCas_ucenik` FOREIGN KEY (`id_ucenik`) REFERENCES `ucenik` (`id`),
  CONSTRAINT `fk_odslusCas_usc` FOREIGN KEY (`usc`) REFERENCES `instruktor` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odslusanicas`
--

LOCK TABLES `odslusanicas` WRITE;
/*!40000 ALTER TABLE `odslusanicas` DISABLE KEYS */;
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
  `dtc` date DEFAULT current_timestamp(),
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
/*!40000 ALTER TABLE `polaznici` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prakticnicas`
--

DROP TABLE IF EXISTS `prakticnicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prakticnicas` (
  `rbr` int(11) NOT NULL,
  `id_instr` int(11) NOT NULL,
  `id_ucenik` int(11) NOT NULL,
  `naziv` text DEFAULT NULL,
  `odrzan` date DEFAULT NULL,
  `usc` varchar(35) DEFAULT NULL,
  `dtc` date DEFAULT current_timestamp(),
  PRIMARY KEY (`rbr`,`id_instr`,`id_ucenik`),
  KEY `fk_prakCas_usc` (`usc`),
  KEY `fk_prakCas_instr` (`id_instr`),
  KEY `fk_prakCas_ucenik` (`id_ucenik`),
  CONSTRAINT `fk_prakCas_instr` FOREIGN KEY (`id_instr`) REFERENCES `instruktor` (`id`),
  CONSTRAINT `fk_prakCas_ucenik` FOREIGN KEY (`id_ucenik`) REFERENCES `ucenik` (`id`),
  CONSTRAINT `fk_prakCas_usc` FOREIGN KEY (`usc`) REFERENCES `instruktor` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prakticnicas`
--

LOCK TABLES `prakticnicas` WRITE;
/*!40000 ALTER TABLE `prakticnicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `prakticnicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teorijskicas`
--

DROP TABLE IF EXISTS `teorijskicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teorijskicas` (
  `id_instr` int(11) DEFAULT NULL,
  `id_grupa` int(11) DEFAULT NULL,
  `dt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `rbr_teor_cas` int(11) NOT NULL AUTO_INCREMENT,
  `tema` text DEFAULT NULL,
  `usc` varchar(35) DEFAULT NULL,
  `dtc` date DEFAULT current_timestamp(),
  `usm` varchar(35) DEFAULT NULL,
  `dtm` date DEFAULT current_timestamp(),
  PRIMARY KEY (`rbr_teor_cas`),
  UNIQUE KEY `rbr_teor_cas` (`rbr_teor_cas`),
  KEY `fk_teorCas_grupa` (`id_grupa`),
  KEY `fk_teorCas_instruktor` (`id_instr`),
  KEY `fk_teorCas_usc` (`usc`),
  KEY `fk_teorCas_usm` (`usm`),
  CONSTRAINT `fk_teorCas_grupa` FOREIGN KEY (`id_grupa`) REFERENCES `grupa` (`id`),
  CONSTRAINT `fk_teorCas_instruktor` FOREIGN KEY (`id_instr`) REFERENCES `instruktor` (`id`),
  CONSTRAINT `fk_teorCas_usc` FOREIGN KEY (`usc`) REFERENCES `instruktor` (`username`),
  CONSTRAINT `fk_teorCas_usm` FOREIGN KEY (`usm`) REFERENCES `instruktor` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teorijskicas`
--

LOCK TABLES `teorijskicas` WRITE;
/*!40000 ALTER TABLE `teorijskicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `teorijskicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `val` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,'x'),(2,'x'),(3,'x');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ucenik`
--

DROP TABLE IF EXISTS `ucenik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ucenik` (
  `id` int(11) NOT NULL,
  `ime` text NOT NULL,
  `prezime` text NOT NULL,
  `email` text NOT NULL,
  `jmbg` text NOT NULL,
  `telefon` text NOT NULL,
  `datrodj` date NOT NULL,
  `usc` varchar(64) DEFAULT NULL,
  `dtc` date NOT NULL DEFAULT current_timestamp(),
  `usm` varchar(64) DEFAULT NULL,
  `dtm` timestamp NULL DEFAULT NULL,
  `zavrsio_teor` int(11) DEFAULT 0,
  `zavrsio_prvu_pomoc` int(11) DEFAULT 0,
  `zavrsio_prakticni` int(11) DEFAULT 0,
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
  CONSTRAINT `check_polozio_teor` CHECK (`polozio_teor` in (0,1)),
  CONSTRAINT `dt_polozio` CHECK (`polozio_prakticni` = 1 and `polozio_teor` = 1)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ucenik`
--

LOCK TABLES `ucenik` WRITE;
/*!40000 ALTER TABLE `ucenik` DISABLE KEYS */;
INSERT INTO `ucenik` VALUES (1,'test','test','test','test','test','2021-12-08',NULL,'2021-12-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'aca','janko','aca_janko@email.com','1234','0989231','1995-10-29',NULL,'2021-12-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ucenik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'auto_skola_2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-09 16:32:19
