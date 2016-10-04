CREATE DATABASE  IF NOT EXISTS `dentaldb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dentaldb`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: dentaldb
-- ------------------------------------------------------
-- Server version	5.6.23-log

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
-- Table structure for table `acte`
--

DROP TABLE IF EXISTS `acte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acte` (
  `NUM_ACTE` int(11) NOT NULL AUTO_INCREMENT,
  `LIBELLE_ACTE` text,
  `PRIX_ACTE` float DEFAULT NULL,
  `COTATION` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`NUM_ACTE`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acte`
--

LOCK TABLES `acte` WRITE;
/*!40000 ALTER TABLE `acte` DISABLE KEYS */;
INSERT INTO `acte` VALUES (1,'Curtage molaire',800,'D40'),(2,'Detartrage S22',500,'D24'),(3,'Curtage inc-c',400,'D20'),(4,'Curtage premolaire',500,'D25'),(5,'Curtage molaire',800,'D40'),(8,'Curtage molaire',800,'D40'),(9,'ABC',600,'D50'),(10,'cons',200,'D111');
/*!40000 ALTER TABLE `acte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth`
--

DROP TABLE IF EXISTS `auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth` (
  `idAuth` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idAuth`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth`
--

LOCK TABLES `auth` WRITE;
/*!40000 ALTER TABLE `auth` DISABLE KEYS */;
INSERT INTO `auth` VALUES (1,'med','123456','MEDECIN'),(2,'sec','123','SECRETAIRE'),(16,'med2','1234','Medecin');
/*!40000 ALTER TABLE `auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charge`
--

DROP TABLE IF EXISTS `charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charge` (
  `ID_CHARGE` int(11) NOT NULL AUTO_INCREMENT,
  `ID_CHARGE_US` int(11) NOT NULL,
  `DATE_CHARGE` date DEFAULT NULL,
  PRIMARY KEY (`ID_CHARGE`),
  KEY `FK_DF3` (`ID_CHARGE_US`),
  CONSTRAINT `FK_DF3` FOREIGN KEY (`ID_CHARGE_US`) REFERENCES `charge_usuelle` (`ID_CHARGE_US`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charge`
--

LOCK TABLES `charge` WRITE;
/*!40000 ALTER TABLE `charge` DISABLE KEYS */;
INSERT INTO `charge` VALUES (5,5,'2015-06-28'),(7,7,'2015-06-30');
/*!40000 ALTER TABLE `charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charge_usuelle`
--

DROP TABLE IF EXISTS `charge_usuelle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charge_usuelle` (
  `ID_CHARGE_US` int(11) NOT NULL AUTO_INCREMENT,
  `LIBELLE_CHARGE` text,
  `MONTANT_CHARGE` float DEFAULT NULL,
  PRIMARY KEY (`ID_CHARGE_US`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charge_usuelle`
--

LOCK TABLES `charge_usuelle` WRITE;
/*!40000 ALTER TABLE `charge_usuelle` DISABLE KEYS */;
INSERT INTO `charge_usuelle` VALUES (3,'MP1',5000),(5,'loyer',2500),(7,'MP2',200);
/*!40000 ALTER TABLE `charge_usuelle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultation`
--

DROP TABLE IF EXISTS `consultation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consultation` (
  `ID_CONSULTATION` int(11) NOT NULL AUTO_INCREMENT,
  `ID_PAT` int(11) NOT NULL,
  `NUM_ACTE` int(11) DEFAULT NULL,
  `DATE_CONSULTATION` date DEFAULT NULL,
  `DENT` int(11) DEFAULT NULL,
  `TRAITEMENT` varchar(200) DEFAULT NULL,
  `REDUCTION` float DEFAULT NULL,
  `TOTAL_PAYE` float DEFAULT NULL,
  `RESTE_A_PAYER` float DEFAULT NULL,
  PRIMARY KEY (`ID_CONSULTATION`),
  KEY `FK_DF2` (`ID_PAT`),
  KEY `FK_CONS_ACTE` (`NUM_ACTE`),
  CONSTRAINT `FK_CONS_ACTE` FOREIGN KEY (`NUM_ACTE`) REFERENCES `acte` (`NUM_ACTE`),
  CONSTRAINT `FK_DF2` FOREIGN KEY (`ID_PAT`) REFERENCES `patient` (`ID_PAT`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultation`
--

LOCK TABLES `consultation` WRITE;
/*!40000 ALTER TABLE `consultation` DISABLE KEYS */;
INSERT INTO `consultation` VALUES (1,9,1,'2015-05-28',20,'deta 2 zvsdfdsv',0,100,100),(3,1,5,'2015-06-27',19,'sdgdv',0,750,50),(4,6,3,'2015-06-28',21,'fgezdf',0,400,0),(5,1,2,'2015-06-27',20,'ghhg',0,400,0),(6,2,3,'2015-06-27',17,'hbvihcbsijdv',0,400,0),(7,13,9,'2015-06-28',19,'ghvg',0,600,0),(8,2,3,'2015-06-28',17,'1-bnv vnv',0,400,0),(9,2,10,'2015-06-28',16,'1-bduhvbf',0,100,100),(10,1,8,'2015-06-30',17,'1-aaaaa\r\n2-bbbbb',0,500,300),(11,10,8,'2015-06-30',16,'jhj',0,800,0),(12,11,8,'2015-06-30',16,'jhv',0,800,0),(13,16,8,'2015-06-10',15,'jugtf',0,800,0);
/*!40000 ALTER TABLE `consultation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `ID_PAT` int(11) NOT NULL AUTO_INCREMENT,
  `CIN_PAT` text,
  `NOM_PAT` text,
  `PRENOM_PAT` text,
  `SEXE_PAT` int(11) DEFAULT NULL,
  `DATE_N_PAT` date DEFAULT NULL,
  `NUM_TEL_PAT` text,
  `PROF_PAT` text,
  `ADRESSE_PAT` text,
  `PROB_SANTE` text,
  `ANES_LOCALE` text,
  `ALLERGIE` text,
  `SAIGNE` text,
  `ENCEINTE` int(11) DEFAULT NULL,
  `PLAN_TRAIT` text,
  PRIMARY KEY (`ID_PAT`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'K52469','TAHAR','SAMI',1,'1980-02-15','0661698421','DIRECTEUR AGENCE','olem suissi Imm. Doubai No 55','aucun problem','pas','aucune','pas de saignement',0,'1-anesthésie local\r\n2-remplissage'),(2,'K22558','CHAFI','HAMID',1,'1982-05-19','0622445588','SDIR','lkj','lkjklj','lkjkjkj','lkjkjlkj','lkjlkjk',0,'kjhjh'),(6,'K26565','MOUAK','FATIMA ZAHRA',0,'1993-03-28','063254956','giniora','fdfs','jhvjhv','jhvjhv','jhvjhv','jhvjhv',0,'khgkjb'),(8,'K54212','SERKHITI','bourziz',1,'1992-05-14','0699887755','etud','fgihdfbvksjdvbsdfkjvbfdkjvbkv\r\nvkjdfvmojdfvbkdfjmvb','dfkbf','KJBHKJB','khb ','khbkhb',0,'efgfh'),(9,'DF2454','BENANI','JALLAL',0,'1996-02-19','06882126512','khbih','jhbjhvhv\r\njhvhjvhuvuyhvhuvuhv','luvjugv','uyhvg','jugv','jugv',1,',jvjhvbfgbf\r\nbdf\r\nbdfbdfbdfbdf'),(10,'FG54345','AIT BADDI','jamila',0,'1993-05-18','06213684','etu','fvdfvbdfvbdf5b46d5fv41df65vdfvdf\r\ndv dfvdfdfbdfdfdfbdfbdfbdfbdfbfdbfdbdf','dfvdfv','ukgvfugj','jgv','jgvugv',0,'jhvjhbvjh\r\nbdfbfdbfdbfdbd\r\ndfbdfbdfbdfbfdbdfbdfb'),(11,'GF65435','BENIS','maimoun',1,'1993-02-19','0684645465','fs','jgfvjuhvguhv*\r\nibgivbluhyvhvbhjvb','iulhyvuhvjuhv','jhvjuhvjuhv','ujvjgv','jugvjkgv',0,'khtutgougtgh\r\nihgpihvhuvhuv'),(13,'HG56545','BOUANANI','ADIL',1,'1993-05-19','069851512','jhvb','jhb ','jhbjhb','jhb','jlhb','jhb',1,'gtfhf'),(16,'GH65964','FARAJI','Salah',1,'1992-07-18','05165186','vojdn','ojbjdfvbfjv\r\njdfvbfdjvbfjvbfj','sfgsdv','iluygil','luhvguhyv','ugvugv',0,'fbvndsvbfdv\r\ndfbvkjsdbkjdfbvimsdb'),(17,'RT12588','a','b',1,'2000-01-01','06123456','none','none','none','none','none','none',0,'none'),(18,'FG65412','a','b',1,'2015-06-03','none','none','none','none','none','none','none',0,'none');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rdv`
--

DROP TABLE IF EXISTS `rdv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rdv` (
  `ID_RDV` int(11) NOT NULL AUTO_INCREMENT,
  `ID_PAT` int(11) NOT NULL,
  `DATE_RDV` date DEFAULT NULL,
  `HEURE_RDV` text,
  `COMMENTAIRE` text,
  PRIMARY KEY (`ID_RDV`),
  KEY `FK_DF1` (`ID_PAT`),
  CONSTRAINT `FK_DF1` FOREIGN KEY (`ID_PAT`) REFERENCES `patient` (`ID_PAT`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rdv`
--

LOCK TABLES `rdv` WRITE;
/*!40000 ALTER TABLE `rdv` DISABLE KEYS */;
INSERT INTO `rdv` VALUES (3,2,'2015-05-15','16:00','good'),(4,2,'2015-05-15','14:00','ddd'),(6,1,'2015-05-13','18:00','dc gg'),(9,13,'2015-05-21','15:00','ff'),(11,11,'2015-05-28','18:00','hhh'),(12,8,'2015-05-28','19:00','qsdfgds'),(13,13,'2015-05-15','16:01',''),(15,1,'2015-06-27','02:05','hhh'),(17,10,'2015-06-28','',''),(20,9,'2015-06-30','00:06','dd'),(24,11,'2015-06-30','01:17','');
/*!40000 ALTER TABLE `rdv` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-24 17:27:05
