-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: repn'trade
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `agente`
--

DROP TABLE IF EXISTS `agente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agente` (
  `CodAgente` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Tipo` enum('capo area','subagente') NOT NULL DEFAULT 'capo area',
  `Nome` varchar(45) NOT NULL,
  `Cognome` varchar(45) NOT NULL,
  `Telefono` bigint unsigned NOT NULL,
  `Email` varchar(45) NOT NULL,
  PRIMARY KEY (`CodAgente`,`Tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agente`
--

LOCK TABLES `agente` WRITE;
/*!40000 ALTER TABLE `agente` DISABLE KEYS */;
INSERT INTO `agente` VALUES (001,'subagente','Michelle','Pagac',785926690883934,'dillon.stoltenberg@example.com'),(002,'capo area','Leora','Ferry',594473591586574,'mschuster@example.org'),(003,'capo area','Miracle','Willms',504150975402444,'melvin92@example.com'),(004,'subagente','Domenica','Kessler',314823238831013,'modesto.terry@example.net'),(005,'subagente','Lindsay','Zieme',495939089916646,'king.howell@example.org'),(006,'subagente','Marilou','VonRueden',956689534941688,'carmel80@example.net'),(007,'subagente','Anahi','Gislason',112354122707620,'ghayes@example.net'),(008,'subagente','Georgianna','Heathcote',479517318867147,'qeichmann@example.org'),(009,'subagente','Horacio','Nikolaus',532950076134875,'terrance.brown@example.org'),(010,'capo area','Caleb','DuBuque',331333396630361,'kruecker@example.org');
/*!40000 ALTER TABLE `agente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appartenenza_geografica`
--

DROP TABLE IF EXISTS `appartenenza_geografica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appartenenza_geografica` (
  `CittàApp` varchar(45) NOT NULL,
  `ComuneApp` varchar(45) NOT NULL,
  `AgenteApp` int(3) unsigned zerofill NOT NULL,
  `TipoAgenteApp` enum('capo area','subagente') NOT NULL DEFAULT 'capo area',
  PRIMARY KEY (`CittàApp`,`ComuneApp`,`TipoAgenteApp`,`AgenteApp`),
  KEY `Agenteapp_idx` (`AgenteApp`,`TipoAgenteApp`) /*!80000 INVISIBLE */,
  CONSTRAINT `Agenteapp` FOREIGN KEY (`AgenteApp`, `TipoAgenteApp`) REFERENCES `agente` (`CodAgente`, `Tipo`),
  CONSTRAINT `Cittaapp` FOREIGN KEY (`CittàApp`, `ComuneApp`) REFERENCES `citta` (`Nome`, `Comune`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appartenenza_geografica`
--

LOCK TABLES `appartenenza_geografica` WRITE;
/*!40000 ALTER TABLE `appartenenza_geografica` DISABLE KEYS */;
INSERT INTO `appartenenza_geografica` VALUES ('Latina','Latina',010,'capo area'),('Latina','Latina',005,'subagente'),('Milano','Milano',003,'capo area'),('Milano','Milano',004,'subagente'),('Milano','Milano',008,'subagente'),('Napoli','Napoli',002,'capo area'),('Napoli','Napoli',001,'subagente'),('Napoli','Napoli',009,'subagente'),('Palermo','Palermo',010,'capo area'),('Palermo','Palermo',001,'subagente'),('Palermo','Palermo',005,'subagente'),('Roma','Roma',004,'subagente'),('Roma','Roma',006,'subagente'),('Torino','Torino',002,'capo area'),('Torino','Torino',001,'subagente'),('Torino','Torino',006,'subagente'),('Torino','Torino',007,'subagente'),('Torino','Torino',009,'subagente');
/*!40000 ALTER TABLE `appartenenza_geografica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appartenenza_zona`
--

DROP TABLE IF EXISTS `appartenenza_zona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appartenenza_zona` (
  `CAP` int(5) unsigned zerofill NOT NULL,
  `SubAgente` int(3) unsigned zerofill NOT NULL,
  `TipoSubAgente` enum('capo area','subagente') NOT NULL DEFAULT 'capo area',
  PRIMARY KEY (`SubAgente`,`CAP`,`TipoSubAgente`),
  KEY `SubAgenteapp_idx` (`SubAgente`,`TipoSubAgente`),
  KEY `CAPapp_idx` (`CAP`),
  CONSTRAINT `CAPapp` FOREIGN KEY (`CAP`) REFERENCES `zona` (`CAP`),
  CONSTRAINT `SubAgenteapp` FOREIGN KEY (`SubAgente`, `TipoSubAgente`) REFERENCES `agente` (`CodAgente`, `Tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appartenenza_zona`
--

LOCK TABLES `appartenenza_zona` WRITE;
/*!40000 ALTER TABLE `appartenenza_zona` DISABLE KEYS */;
INSERT INTO `appartenenza_zona` VALUES (00197,005,'subagente'),(01037,004,'subagente'),(01037,008,'subagente'),(02072,001,'subagente'),(02273,009,'subagente'),(02709,005,'subagente'),(02939,005,'subagente'),(03601,004,'subagente'),(03601,006,'subagente'),(03977,001,'subagente'),(03977,006,'subagente'),(04359,008,'subagente'),(05303,007,'subagente'),(06310,001,'subagente'),(06310,005,'subagente');
/*!40000 ALTER TABLE `appartenenza_zona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `azienda`
--

DROP TABLE IF EXISTS `azienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `azienda` (
  `PartitaIVA` bigint(11) unsigned zerofill NOT NULL,
  `CF` varchar(45) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Città` varchar(45) NOT NULL,
  `Via` varchar(45) NOT NULL,
  `Civico` int unsigned NOT NULL,
  `CAP` int(5) unsigned zerofill NOT NULL,
  PRIMARY KEY (`PartitaIVA`),
  UNIQUE KEY `CF_UNIQUE` (`CF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `azienda`
--

LOCK TABLES `azienda` WRITE;
/*!40000 ALTER TABLE `azienda` DISABLE KEYS */;
INSERT INTO `azienda` VALUES (00000000009,'jpxobg72n37i749b','bab','Roma','Torre',12,00023),(00000000010,'icfgfj13t65y651d','bob','Rimini','Astura',21,00193),(19723686273,'nfwzzp78j97p775u','Stark Inc','Ancona','Daphney Extension',1813,02292),(42586504722,'vgosfl74f08u426m','White-Corkery','Bologna','Axel Ports',1947,05176),(52737915382,'xnipob52z88t456n','Steuber Inc','Catania','Breitenberg Curve',530,00048),(79075416926,'mbdnit82x02p714s','Grimes-Kuhn','Domodossola','Josianne Forges',644,04756),(85383542626,'dyuvcg13i58l296m','Crist, Buckridge and Vandervort','Milano','Weber Bridge',236,03652),(85479336954,'lrqzme94n15l291m','Klein, Reilly and Hermiston','Napoli','Littel Harbor',796,07207),(95166185643,'qyqepv58c72n334q','Kuhlman-Graham','Anzio','Lorenza Oval',1778,05010);
/*!40000 ALTER TABLE `azienda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `bestdeals`
--

DROP TABLE IF EXISTS `bestdeals`;
/*!50001 DROP VIEW IF EXISTS `bestdeals`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `bestdeals` AS SELECT 
 1 AS `CodProd`,
 1 AS `Sconto`,
 1 AS `Fornitore`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `Nome` varchar(45) NOT NULL,
  PRIMARY KEY (`Nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES ('Banana'),('Bovino'),('Carne'),('Condimento'),('Frutta'),('Mela'),('Pepe'),('Pesce'),('Piselli'),('Pollo'),('Sale'),('Salmone'),('Spinaci'),('Tonno'),('Verdura'),('Vitello');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorizzazione`
--

DROP TABLE IF EXISTS `categorizzazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorizzazione` (
  `SuperCategoria` varchar(45) NOT NULL,
  `SottoCategoria` varchar(45) NOT NULL,
  PRIMARY KEY (`SuperCategoria`,`SottoCategoria`),
  KEY `SOTcategoria_idx` (`SottoCategoria`),
  CONSTRAINT `SOTcategoria` FOREIGN KEY (`SottoCategoria`) REFERENCES `categoria` (`Nome`),
  CONSTRAINT `SUPcategoria` FOREIGN KEY (`SuperCategoria`) REFERENCES `categoria` (`Nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorizzazione`
--

LOCK TABLES `categorizzazione` WRITE;
/*!40000 ALTER TABLE `categorizzazione` DISABLE KEYS */;
INSERT INTO `categorizzazione` VALUES ('Frutta','Banana'),('Carne','Bovino'),('Frutta','Mela'),('Condimento','Pepe'),('Verdura','Piselli'),('Carne','Pollo'),('Condimento','Sale'),('Pesce','Salmone'),('Verdura','Spinaci'),('Pesce','Tonno'),('Carne','Vitello');
/*!40000 ALTER TABLE `categorizzazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `categprodott`
--

DROP TABLE IF EXISTS `categprodott`;
/*!50001 DROP VIEW IF EXISTS `categprodott`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `categprodott` AS SELECT 
 1 AS `Categoria`,
 1 AS `Descrizione`,
 1 AS `Prodotto`,
 1 AS `DataScadenza`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `citta`
--

DROP TABLE IF EXISTS `citta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citta` (
  `Nome` varchar(45) NOT NULL,
  `Comune` varchar(45) NOT NULL,
  `Regione` varchar(45) NOT NULL,
  PRIMARY KEY (`Nome`,`Comune`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citta`
--

LOCK TABLES `citta` WRITE;
/*!40000 ALTER TABLE `citta` DISABLE KEYS */;
INSERT INTO `citta` VALUES ('Latina','Latina','Lazio'),('Milano','Milano','Lombardia'),('Napoli','Napoli','Campania'),('Palermo','Palermo','Sicilia'),('Roma','Roma','Lazio'),('Torino','Torino','Piemonte');
/*!40000 ALTER TABLE `citta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `cittàgestita`
--

DROP TABLE IF EXISTS `cittàgestita`;
/*!50001 DROP VIEW IF EXISTS `cittàgestita`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cittàgestita` AS SELECT 
 1 AS `Nome`,
 1 AS `Comune`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `etichetta`
--

DROP TABLE IF EXISTS `etichetta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etichetta` (
  `CategoriaEt` varchar(45) NOT NULL,
  `ProdottoEt` int(6) unsigned zerofill NOT NULL,
  `FornitoreEt` bigint(11) unsigned zerofill NOT NULL,
  PRIMARY KEY (`ProdottoEt`,`CategoriaEt`,`FornitoreEt`),
  KEY `Categoriaet_idx` (`CategoriaEt`),
  KEY `Prodottoet_idx` (`ProdottoEt`,`FornitoreEt`),
  CONSTRAINT `Categoriaet` FOREIGN KEY (`CategoriaEt`) REFERENCES `categoria` (`Nome`),
  CONSTRAINT `Prodottoet` FOREIGN KEY (`ProdottoEt`, `FornitoreEt`) REFERENCES `prodotto` (`CodProdotto`, `Fornitore`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etichetta`
--

LOCK TABLES `etichetta` WRITE;
/*!40000 ALTER TABLE `etichetta` DISABLE KEYS */;
INSERT INTO `etichetta` VALUES ('Pepe',000001,16839339717),('Pesce',000002,30297600664),('Banana',000003,29356208973),('Pollo',000004,30297600664),('Sale',000005,48081655178),('Tonno',000006,48081655178),('Salmone',000007,30297600664),('Spinaci',000008,48081655178),('Mela',000009,06730126797),('Condimento',000010,06730126797),('Pollo',001000,00000000001),('Pollo',001001,00000000001);
/*!40000 ALTER TABLE `etichetta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fattura`
--

DROP TABLE IF EXISTS `fattura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fattura` (
  `Ordine` int(9) unsigned zerofill NOT NULL,
  `FornitoreF` bigint(11) unsigned zerofill NOT NULL,
  `Agente` int(3) unsigned zerofill NOT NULL,
  `PrezzoAggiuntivo` double NOT NULL DEFAULT '0',
  `ModalitàPagamento` varchar(45) NOT NULL,
  `DataScadenzaPagamento` date NOT NULL,
  `Provvigione` double unsigned NOT NULL,
  `Pagato` tinyint NOT NULL DEFAULT '0',
  `DataConsegna` date DEFAULT NULL,
  `DataErogazione` date NOT NULL,
  PRIMARY KEY (`Ordine`),
  KEY `Agente_idx` (`Agente`),
  KEY `FornitoreF_idx` (`FornitoreF`),
  CONSTRAINT `Agente` FOREIGN KEY (`Agente`) REFERENCES `agente` (`CodAgente`),
  CONSTRAINT `Fornitoref` FOREIGN KEY (`FornitoreF`) REFERENCES `fornitore` (`PartitaIVA`),
  CONSTRAINT `Ordine` FOREIGN KEY (`Ordine`) REFERENCES `ordine` (`CodOrdine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fattura`
--

LOCK TABLES `fattura` WRITE;
/*!40000 ALTER TABLE `fattura` DISABLE KEYS */;
INSERT INTO `fattura` VALUES (000000001,16839339717,001,157,'Il c.d. bonifico. Assegni','2020-08-13',14.2,1,'2021-07-15','2021-03-23'),(000000002,30297600664,004,24,'Assegno circolare','2020-08-01',7.3,1,'2020-08-15','2021-06-07'),(000000003,30297600664,006,184,'Assegno bancario','2021-07-12',18.1,1,'2021-07-05','2021-05-01'),(000000005,48081655178,002,25,'Assegno circolare','2020-02-27',20.2,1,'2020-08-15','2021-06-01'),(000000006,48081655178,003,29,'Il c.d. bonifico. Assegni','2020-05-03',15.3,1,'2021-07-15','2021-06-04'),(000000008,48081655178,007,153,'Assegno circolare','2020-02-07',20.8,1,'2021-07-15','2021-05-08'),(000000009,30297600664,001,179,'Assegno bancario','2020-05-13',18.9,1,'2020-08-01','2021-06-04'),(000000010,16839339717,002,87,'Il c.d. bonifico. Assegni','2020-12-14',19.1,1,'2020-08-15','2021-05-23');
/*!40000 ALTER TABLE `fattura` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `fattura_BEFORE_INSERT` BEFORE INSERT ON `fattura` FOR EACH ROW BEGIN
IF (new.ModalitàPagamento <> (select `Modalità di Pagamento` from fornitura
where SedeOperativaFor in (select SedeOperativa from ordine 
where CodOrdine=new.Ordine)
and FornitoreFor=new.FornitoreF))
then  set new.ModalitàPagamento= (select `Modalità di Pagamento` from fornitura
where SedeOperativaFor in (select SedeOperativa from ordine 
where CodOrdine=new.Ordine)
and FornitoreFor=new.FornitoreF) ;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `fattura_BEFORE_INSERT_1` BEFORE INSERT ON `fattura` FOR EACH ROW BEGIN 
IF (new.Provvigione <=0 or new.Provvigione > 100) then
signal sqlstate '45000' set message_text = 'ValorePercentuale field not correct';
END IF;
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `fattura_BEFORE_INSERT_datae` BEFORE INSERT ON `fattura` FOR EACH ROW BEGIN
set new.DataErogazione=CURRENT_DATE;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `fattura_BEFORE_INSERT_forni` BEFORE INSERT ON `fattura` FOR EACH ROW BEGIN
set new.FornitoreF = (SELECT FornitoreIns
FROM Ordine, Inserimento
WHERE new.Ordine = CodOrdine AND CodOrdine = OrdineIns
LIMIT 1);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `fattura_BEFORE_UPDATE` BEFORE UPDATE ON `fattura` FOR EACH ROW begin
IF (new.ModalitàPagamento <> (select `Modalità di Pagamento` from fornitura
where SedeOperativaFor in (select SedeOperativa from ordine 
where CodOrdine=new.Ordine)
and FornitoreFor=new.FornitoreF))
then  set new.ModalitàPagamento= (select `Modalità di Pagamento` from fornitura
where SedeOperativaFor in (select SedeOperativa from ordine 
where CodOrdine=new.Ordine)
and FornitoreFor=new.FornitoreF) ;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `fattura_BEFORE_UPDATE_1` BEFORE UPDATE ON `fattura` FOR EACH ROW BEGIN
IF (new.Provvigione <=0 or new.Provvigione > 100) then
signal sqlstate '45000' set message_text = 'ValorePercentuale field not correct';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `fattura_BEFORE_UPDATE_forni` BEFORE UPDATE ON `fattura` FOR EACH ROW BEGIN
set new.FornitoreF = (SELECT FornitoreIns
FROM Ordine, Inserimento
WHERE new.Ordine = CodOrdine AND CodOrdine = OrdineIns
LIMIT 1);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `fatturatidelmese`
--

DROP TABLE IF EXISTS `fatturatidelmese`;
/*!50001 DROP VIEW IF EXISTS `fatturatidelmese`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `fatturatidelmese` AS SELECT 
 1 AS `Agente`,
 1 AS `Prez`,
 1 AS `Prov`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `fornitore`
--

DROP TABLE IF EXISTS `fornitore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornitore` (
  `PartitaIVA` bigint(11) unsigned zerofill NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Telefono` bigint unsigned NOT NULL,
  `Email` varchar(45) NOT NULL,
  `IBAN` varchar(45) NOT NULL,
  `Fatturato` int NOT NULL DEFAULT '0',
  `CF` varchar(45) NOT NULL,
  PRIMARY KEY (`PartitaIVA`),
  UNIQUE KEY `IBAN_UNIQUE` (`IBAN`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  UNIQUE KEY `Telefono_UNIQUE` (`Telefono`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornitore`
--

LOCK TABLES `fornitore` WRITE;
/*!40000 ALTER TABLE `fornitore` DISABLE KEYS */;
INSERT INTO `fornitore` VALUES (00000000001,'Pollos',333333333,'pollos.gmail.com','HJ768676589',0,'00000000001'),(06730126797,'Beier, Stroman and Greenholt',500973284011706,'ametz@example.org','px95l8629229852680205194532',4240,'rjnocz17i07f747b'),(16839339717,'Greenholt, Jaskolski and McKenzie',312821985268965,'gislason.evangeline@example.org','io42z2158533263270159238094',6316,'vlehqk34x83h677w'),(29356208973,'Jacobi-Runolfsson',547341576730832,'giovani.flatley@example.com','fn13o7676312755752918670194',3178,'fzlimk93r89o191s'),(30297600664,'Murazik LLC',186418931698426,'xwalker@example.net','bi62z8103663410269688247221',7776,'quqnkk03f35r995z'),(48081655178,'Oberbrunner, Gleason and Padberg',361851642886176,'dasia.hand@example.org','iy64w8647337442322586879840',9657,'olaxtx87f27c884z');
/*!40000 ALTER TABLE `fornitore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornitura`
--

DROP TABLE IF EXISTS `fornitura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornitura` (
  `SedeOperativaFor` int(6) unsigned zerofill NOT NULL,
  `FornitoreFor` bigint(11) unsigned zerofill NOT NULL,
  `Modalità di Pagamento` varchar(45) NOT NULL,
  PRIMARY KEY (`SedeOperativaFor`,`FornitoreFor`),
  KEY `Fornitorefor_idx` (`FornitoreFor`),
  CONSTRAINT `Fornitorefor` FOREIGN KEY (`FornitoreFor`) REFERENCES `fornitore` (`PartitaIVA`),
  CONSTRAINT `SedeOperativafor` FOREIGN KEY (`SedeOperativaFor`) REFERENCES `sede operativa` (`CodCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornitura`
--

LOCK TABLES `fornitura` WRITE;
/*!40000 ALTER TABLE `fornitura` DISABLE KEYS */;
INSERT INTO `fornitura` VALUES (000006,48081655178,'Il c.d. bonifico. Assegni'),(000007,30297600664,'Il c.d. bonifico. Assegni'),(000008,06730126797,'Il c.d. bonifico. Assegni'),(000009,06730126797,'Il c.d. bonifico. Assegni'),(000010,16839339717,'Il c.d. bonifico. Assegni'),(000011,00000000001,'Assegno bancario'),(000012,06730126797,'Assegno circolare'),(000013,00000000001,'Bancomat o carta di debito'),(000014,16839339717,'Carta di debito o carta prepagata'),(000015,16839339717,'Bancomat o carta di debito'),(000016,48081655178,'Assegno circolare'),(000017,00000000001,'Assegno circolare'),(000018,16839339717,'Assegno circolare'),(000019,48081655178,'Il c.d. bonifico. Assegni'),(000020,00000000001,'Assegno bancario'),(000020,16839339717,'Il c.d. bonifico. Assegni');
/*!40000 ALTER TABLE `fornitura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `guadagnodelmese`
--

DROP TABLE IF EXISTS `guadagnodelmese`;
/*!50001 DROP VIEW IF EXISTS `guadagnodelmese`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `guadagnodelmese` AS SELECT 
 1 AS `CodAgente`,
 1 AS `Nome`,
 1 AS `Cognome`,
 1 AS `GuadagnoTot`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `inserimento`
--

DROP TABLE IF EXISTS `inserimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inserimento` (
  `OrdineIns` int(9) unsigned zerofill NOT NULL,
  `ProdottoIns` int(6) unsigned zerofill NOT NULL,
  `FornitoreIns` bigint(11) unsigned zerofill NOT NULL,
  `Quantità` smallint unsigned NOT NULL,
  PRIMARY KEY (`OrdineIns`,`ProdottoIns`,`FornitoreIns`),
  KEY `Prodottoins_idx` (`ProdottoIns`,`FornitoreIns`),
  CONSTRAINT `Ordineins` FOREIGN KEY (`OrdineIns`) REFERENCES `ordine` (`CodOrdine`),
  CONSTRAINT `Prodottoins` FOREIGN KEY (`ProdottoIns`, `FornitoreIns`) REFERENCES `prodotto` (`CodProdotto`, `Fornitore`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inserimento`
--

LOCK TABLES `inserimento` WRITE;
/*!40000 ALTER TABLE `inserimento` DISABLE KEYS */;
INSERT INTO `inserimento` VALUES (000000001,000001,16839339717,29),(000000002,000004,30297600664,84),(000000003,000004,30297600664,82),(000000004,000006,48081655178,37),(000000005,000005,48081655178,90),(000000006,000008,48081655178,82),(000000007,000001,16839339717,67),(000000008,000008,48081655178,34),(000000009,000002,30297600664,31),(000000010,000001,16839339717,8);
/*!40000 ALTER TABLE `inserimento` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `inserimento_BEFORE_INSERT` BEFORE INSERT ON `inserimento` FOR EACH ROW BEGIN
IF (new.FornitoreIns = (select FornitoreIns from inserimento 
where new.OrdineIns=OrdineIns))
then signal sqlstate '45000' set message_text = 'Non è possibile avere Fornitori diversi in uno stesso Ordine';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `lavoro_s`
--

DROP TABLE IF EXISTS `lavoro_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lavoro_s` (
  `Responsabile` int(7) unsigned zerofill NOT NULL,
  `SedeOperativaRes` int(6) unsigned zerofill NOT NULL,
  PRIMARY KEY (`SedeOperativaRes`,`Responsabile`),
  KEY `Responsabile_idx` (`Responsabile`),
  CONSTRAINT `Responsabile` FOREIGN KEY (`Responsabile`) REFERENCES `responsabile_sede` (`CodResSede`),
  CONSTRAINT `SedeOperativares` FOREIGN KEY (`SedeOperativaRes`) REFERENCES `sede operativa` (`CodCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lavoro_s`
--

LOCK TABLES `lavoro_s` WRITE;
/*!40000 ALTER TABLE `lavoro_s` DISABLE KEYS */;
INSERT INTO `lavoro_s` VALUES (0000001,000004),(0000001,000010),(0000002,000008),(0000003,000017),(0000004,000008),(0000005,000009),(0000006,000012),(0000007,000020),(0000008,000013),(0000009,000007),(0000010,000019),(0000011,000012),(0000012,000010),(0000013,000010),(0000014,000009),(0000015,000020),(0000016,000015),(0000017,000020),(0000018,000007),(0000019,000013);
/*!40000 ALTER TABLE `lavoro_s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `numcittà`
--

DROP TABLE IF EXISTS `numcittà`;
/*!50001 DROP VIEW IF EXISTS `numcittà`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `numcittà` AS SELECT 
 1 AS `CodAgente`,
 1 AS `Nome`,
 1 AS `Cognome`,
 1 AS `Città`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ordine`
--

DROP TABLE IF EXISTS `ordine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordine` (
  `CodOrdine` int(9) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Totale` double unsigned NOT NULL DEFAULT '0',
  `SedeOperativa` int(6) unsigned zerofill NOT NULL,
  PRIMARY KEY (`CodOrdine`),
  KEY `SedeOp_idx` (`SedeOperativa`),
  CONSTRAINT `SedeOp` FOREIGN KEY (`SedeOperativa`) REFERENCES `sede operativa` (`CodCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordine`
--

LOCK TABLES `ordine` WRITE;
/*!40000 ALTER TABLE `ordine` DISABLE KEYS */;
INSERT INTO `ordine` VALUES (000000001,105,000020),(000000002,721,000018),(000000003,43,000014),(000000004,270,000013),(000000005,879,000012),(000000006,13,000020),(000000007,510,000007),(000000008,377,000018),(000000009,896,000017),(000000010,575,000009);
/*!40000 ALTER TABLE `ordine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `prodmese`
--

DROP TABLE IF EXISTS `prodmese`;
/*!50001 DROP VIEW IF EXISTS `prodmese`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `prodmese` AS SELECT 
 1 AS `Cliente`,
 1 AS `CodProd`,
 1 AS `Quant`,
 1 AS `Descriz`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `prodot3m`
--

DROP TABLE IF EXISTS `prodot3m`;
/*!50001 DROP VIEW IF EXISTS `prodot3m`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `prodot3m` AS SELECT 
 1 AS `Cliente`,
 1 AS `Prod`,
 1 AS `Descr`,
 1 AS `DataE`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `prodotto`
--

DROP TABLE IF EXISTS `prodotto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prodotto` (
  `CodProdotto` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Fornitore` bigint(11) unsigned zerofill NOT NULL,
  `DataScadenza` date NOT NULL,
  `Descrizione` tinyblob,
  `Quantità` smallint NOT NULL,
  `Prezzo` double NOT NULL,
  `Peso` double NOT NULL,
  `Provenienza` varchar(45) NOT NULL,
  `ScontoGenerale` double DEFAULT NULL,
  `IVA` int NOT NULL DEFAULT '4',
  `Conservazione` varchar(45) NOT NULL,
  PRIMARY KEY (`CodProdotto`,`Fornitore`),
  KEY `fornitore_idx` (`Fornitore`),
  CONSTRAINT `fornitore` FOREIGN KEY (`Fornitore`) REFERENCES `fornitore` (`PartitaIVA`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodotto`
--

LOCK TABLES `prodotto` WRITE;
/*!40000 ALTER TABLE `prodotto` DISABLE KEYS */;
INSERT INTO `prodotto` VALUES (000001,16839339717,'2021-08-20',NULL,15,92.85,1,'Cyprus',15,4,'congelamento'),(000002,30297600664,'2021-12-25',NULL,100,108.83,1,'Malaysia',NULL,4,'sott\'aceto'),(000003,29356208973,'2022-01-23',NULL,30,122.67,1,'Mozambique',NULL,4,'sotto sale'),(000004,30297600664,'2021-08-20',NULL,20,178.73,1,'Czech Republic',52.1,4,'sotto sale'),(000005,48081655178,'2022-01-20',NULL,30,148.26,1,'French Guiana',42.5,4,'congelamento'),(000006,48081655178,'2022-01-02',NULL,30,5.22,1,'Malaysia',NULL,4,'refrigerazione'),(000007,30297600664,'2021-12-20',NULL,10,126.26,1,'Australia',48.8,4,'sotto sale'),(000008,48081655178,'2022-01-02',NULL,15,113.68,1,'Northern Mariana Islands',65,4,'congelamento'),(000009,06730126797,'2021-08-20',NULL,10,70.34,1,'Kazakhstan',16.2,4,'sottovuoto'),(000010,06730126797,'2022-01-01',NULL,5,175.8,1,'Hong Kong',NULL,4,'sotto sale'),(001000,00000000001,'2021-10-10',NULL,10,30,5,'Lazio',NULL,4,'sottovuoto'),(001001,00000000001,'2021-10-10',NULL,20,50.3,10,'Lazio',15,4,'sottovuoto');
/*!40000 ALTER TABLE `prodotto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `res`
--

DROP TABLE IF EXISTS `res`;
/*!50001 DROP VIEW IF EXISTS `res`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `res` AS SELECT 
 1 AS `Responsabile`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `responsabile_fornitore`
--

DROP TABLE IF EXISTS `responsabile_fornitore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responsabile_fornitore` (
  `CodResForni` smallint(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `FornitoreRes` bigint(11) unsigned zerofill NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Cognome` varchar(45) NOT NULL,
  `Telefono` bigint unsigned NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Ruolo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CodResForni`),
  KEY `Fornitoreres_idx` (`FornitoreRes`),
  CONSTRAINT `Fornitoreres` FOREIGN KEY (`FornitoreRes`) REFERENCES `fornitore` (`PartitaIVA`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsabile_fornitore`
--

LOCK TABLES `responsabile_fornitore` WRITE;
/*!40000 ALTER TABLE `responsabile_fornitore` DISABLE KEYS */;
INSERT INTO `responsabile_fornitore` VALUES (0001,00000000001,'Presley','Franecki',395713574066758,'cory18@example.net',NULL),(0002,48081655178,'Jeffry','Schiller',425409449171274,'bcorwin@example.net',NULL),(0003,29356208973,'Catalina','Hyatt',930674553755670,'o\'conner.roderick@example.net',NULL),(0004,29356208973,'Zelma','Tillman',551465802919119,'rice.jonathon@example.net',NULL),(0005,29356208973,'Kassandra','O\'Conner',298064746195450,'hamill.damian@example.org',NULL),(0006,29356208973,'Autumn','Stehr',758681356115266,'wblanda@example.com',NULL),(0007,29356208973,'Julien','Effertz',844663340039551,'johns.floy@example.net',NULL),(0008,00000000001,'Roma','Gottlieb',741508564865216,'berge.derick@example.com',NULL),(0009,16839339717,'Dean','Ledner',769450104702264,'vinnie80@example.org',NULL),(0010,16839339717,'Stacey','Barrows',650297148851677,'rice.kellen@example.org',NULL);
/*!40000 ALTER TABLE `responsabile_fornitore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsabile_sede`
--

DROP TABLE IF EXISTS `responsabile_sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responsabile_sede` (
  `CodResSede` int(7) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Cognome` varchar(45) NOT NULL,
  `Telefono` bigint unsigned NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Ruolo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CodResSede`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsabile_sede`
--

LOCK TABLES `responsabile_sede` WRITE;
/*!40000 ALTER TABLE `responsabile_sede` DISABLE KEYS */;
INSERT INTO `responsabile_sede` VALUES (0000001,'Alex','HolyCross',5352157775,'ahc.gmail.com','titolare'),(0000002,'Karelle','D\'Amore',365766302216798,'vilma64@example.net','cuoco'),(0000003,'Oceane','Johnston',965626030927524,'eric.dare@example.com','magazzino'),(0000004,'Therese','Jenkins',920839550858363,'zula19@example.org','titolare'),(0000005,'Haskell','Romaguera',897051403718069,'skuhlman@example.net','titolare'),(0000006,'Samara','Rau',232998854480683,'nolan33@example.com','tirolare'),(0000007,'Sunny','Gaylord',156315693166106,'iturner@example.org','cuoco'),(0000008,'Hank','Herman',812665100721642,'pearlie50@example.net','magazzino'),(0000009,'Paris','Becker',765506166964769,'streich.randi@example.net',NULL),(0000010,'Lorena','Medhurst',764089804282411,'igleichner@example.org',NULL),(0000011,'Oren','Hand',790290751820430,'jstracke@example.org',NULL),(0000012,'Arvilla','Dibbert',101370174204930,'elfrieda58@example.com',NULL),(0000013,'Faustino','Runte',930234882701188,'ellis.bednar@example.com',NULL),(0000014,'Kenyon','Osinski',627946703461930,'danielle.kemmer@example.net',NULL),(0000015,'Earnest','Kovacek',890141626773402,'albertha.fay@example.com',NULL),(0000016,'Jewell','Hickle',711041268007829,'fklein@example.org',NULL),(0000017,'Lolita','Haley',189375927159562,'cmayer@example.net',NULL),(0000018,'Vernie','Walsh',726142080035060,'luigi25@example.net',NULL),(0000019,'Morton','Hudson',327876213192939,'virgil.schroeder@example.net',NULL);
/*!40000 ALTER TABLE `responsabile_sede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sconto_categoria`
--

DROP TABLE IF EXISTS `sconto_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sconto_categoria` (
  `CategoriaS` varchar(45) NOT NULL,
  `FornitoreSC` bigint(11) unsigned zerofill NOT NULL,
  `SedeOperativaSC` int(6) unsigned zerofill NOT NULL,
  `ValorePercentuale` double unsigned NOT NULL,
  `DataDiFine` date NOT NULL,
  PRIMARY KEY (`CategoriaS`,`FornitoreSC`,`SedeOperativaSC`),
  KEY `Fornitoresc_idx` (`FornitoreSC`),
  KEY `SedeOperativasc_idx` (`SedeOperativaSC`),
  CONSTRAINT `Categorias` FOREIGN KEY (`CategoriaS`) REFERENCES `categoria` (`Nome`),
  CONSTRAINT `Fornitoresc` FOREIGN KEY (`FornitoreSC`) REFERENCES `fornitore` (`PartitaIVA`),
  CONSTRAINT `SedeOperativasc` FOREIGN KEY (`SedeOperativaSC`) REFERENCES `sede operativa` (`CodCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sconto_categoria`
--

LOCK TABLES `sconto_categoria` WRITE;
/*!40000 ALTER TABLE `sconto_categoria` DISABLE KEYS */;
INSERT INTO `sconto_categoria` VALUES ('Banana',30297600664,000011,63.9,'2022-05-01'),('Banana',48081655178,000011,30.9,'2022-05-27'),('Bovino',06730126797,000018,6.2,'2022-01-27'),('Bovino',16839339717,000011,21.9,'2022-03-14'),('Bovino',29356208973,000013,4.6,'2020-11-16'),('Carne',30297600664,000020,30.9,'2022-05-15'),('Condimento',16839339717,000006,6.4,'2022-02-13'),('Condimento',29356208973,000015,59.1,'2021-12-13'),('Mela',06730126797,000008,24.6,'2021-10-03'),('Pepe',06730126797,000018,24.7,'2021-12-08'),('Pepe',29356208973,000008,53.5,'2022-04-13'),('Pesce',16839339717,000013,21.4,'2022-06-08'),('Pesce',30297600664,000008,54.2,'2021-09-17'),('Piselli',06730126797,000018,19,'2021-11-25'),('Pollo',00000000001,000004,40,'2022-03-10'),('Pollo',00000000001,000006,45,'2022-03-10'),('Pollo',48081655178,000008,26,'2021-12-18'),('Verdura',00000000001,000009,36,'2021-12-11'),('Vitello',16839339717,000018,53.7,'2022-05-10'),('Vitello',29356208973,000009,60.2,'2021-10-22'),('Vitello',29356208973,000015,34.4,'2021-10-19'),('Vitello',30297600664,000016,27.1,'2021-08-13');
/*!40000 ALTER TABLE `sconto_categoria` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sconto_categoria_BEFORE_INSERT` BEFORE INSERT ON `sconto_categoria` FOR EACH ROW BEGIN
IF (new.ValorePercentuale <=0 or new.ValorePercentuale > 100) then
signal sqlstate '45000' set message_text = 'ValorePercentuale field not correct';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sconto_categoria_BEFORE_UPDATE` BEFORE UPDATE ON `sconto_categoria` FOR EACH ROW BEGIN
IF (new.ValorePercentuale <=0 or new.ValorePercentuale > 100) then
signal sqlstate '45000' set message_text = 'ValorePercentuale field not correct';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sconto_prodotto`
--

DROP TABLE IF EXISTS `sconto_prodotto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sconto_prodotto` (
  `ProdottoS` int(6) unsigned zerofill NOT NULL,
  `FornitoreSP` bigint(11) unsigned zerofill NOT NULL,
  `SedeOperativaSP` int(6) unsigned zerofill NOT NULL,
  `ValorePercentuale` double NOT NULL,
  `DataDiFine` date NOT NULL,
  PRIMARY KEY (`ProdottoS`,`FornitoreSP`,`SedeOperativaSP`),
  KEY `Fornitoresp_idx` (`FornitoreSP`),
  KEY `SedeOperativasp_idx` (`SedeOperativaSP`),
  CONSTRAINT `Fornitoresp` FOREIGN KEY (`FornitoreSP`) REFERENCES `fornitore` (`PartitaIVA`),
  CONSTRAINT `Prodottos` FOREIGN KEY (`ProdottoS`) REFERENCES `prodotto` (`CodProdotto`),
  CONSTRAINT `SedeOperativasp` FOREIGN KEY (`SedeOperativaSP`) REFERENCES `sede operativa` (`CodCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sconto_prodotto`
--

LOCK TABLES `sconto_prodotto` WRITE;
/*!40000 ALTER TABLE `sconto_prodotto` DISABLE KEYS */;
INSERT INTO `sconto_prodotto` VALUES (000001,00000000001,000007,10.2,'2022-06-03'),(000001,00000000001,000016,44.8,'2021-10-24'),(000001,06730126797,000013,38.1,'2022-05-07'),(000001,06730126797,000015,63.6,'2021-11-07'),(000001,48081655178,000019,38.9,'2021-12-06'),(000003,06730126797,000007,31.4,'2021-07-29'),(000003,29356208973,000011,64.6,'2021-09-22'),(000005,00000000001,000006,44.6,'2022-06-13'),(000005,00000000001,000017,13.3,'2022-01-26'),(000005,16839339717,000017,38.7,'2022-10-15'),(000005,29356208973,000019,61.6,'2021-12-10'),(000007,16839339717,000018,29.6,'2022-03-13'),(000007,16839339717,000020,35.4,'2022-06-14'),(000008,00000000001,000006,23.6,'2022-04-21'),(000008,00000000001,000017,50.3,'2021-09-09'),(000008,06730126797,000007,57.9,'2021-08-30'),(000008,29356208973,000012,60.9,'2021-12-04'),(000008,48081655178,000017,45.7,'2022-04-16'),(000008,48081655178,000019,59.8,'2022-05-03'),(000010,29356208973,000016,22.5,'2021-10-29');
/*!40000 ALTER TABLE `sconto_prodotto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sconto_prodotto_BEFORE_INSERT` BEFORE INSERT ON `sconto_prodotto` FOR EACH ROW BEGIN
IF (new.ValorePercentuale <=0 or new.ValorePercentuale > 100) then
signal sqlstate '45000' set message_text = 'ValorePercentuale field not correct';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sconto_prodotto_BEFORE_UPDATE` BEFORE UPDATE ON `sconto_prodotto` FOR EACH ROW BEGIN
IF (new.ValorePercentuale <=0 or new.ValorePercentuale > 100) then
signal sqlstate '45000' set message_text = 'ValorePercentuale field not correct';
/*set new.ValorePercentuale = 0;*/
/*RAISE_APPLICATION_ERROR(-20004 , 'ValorePercentuale field not correct')*/
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sede operativa`
--

DROP TABLE IF EXISTS `sede operativa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sede operativa` (
  `CodCliente` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Tipo` enum('privato','aziendale') NOT NULL DEFAULT 'aziendale',
  `Nome` varchar(45) NOT NULL,
  `Azienda` bigint(11) unsigned zerofill DEFAULT NULL,
  `CF` varchar(45) NOT NULL,
  `Telefono` bigint unsigned NOT NULL,
  `email` varchar(45) NOT NULL,
  `Città` varchar(45) NOT NULL,
  `Via` varchar(45) NOT NULL,
  `Civico` int unsigned NOT NULL,
  `CAP` int(5) unsigned zerofill NOT NULL,
  PRIMARY KEY (`CodCliente`,`Tipo`),
  KEY `azienda_idx` (`Azienda`),
  CONSTRAINT `AziendaIVA` FOREIGN KEY (`Azienda`) REFERENCES `azienda` (`PartitaIVA`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sede operativa`
--

LOCK TABLES `sede operativa` WRITE;
/*!40000 ALTER TABLE `sede operativa` DISABLE KEYS */;
INSERT INTO `sede operativa` VALUES (000004,'aziendale','PollosRestaurant',00000000009,'9',57585746,'pmail.com','Roma','Polo',33,00176),(000006,'aziendale','BovinoHermanos',00000000010,'10',253363614,'bmail.com','Rimini','Dar',23,01945),(000007,'privato','Bartoletti-Kuhic',19723686273,'bxsfjs86e92y852y',260268343798816,'reynolds.lila@example.org','NorthCarolina','Effertz Canyon',708,08059),(000008,'aziendale','Cummings LLC',95166185643,'pmpvys31p85l196q',438751863641664,'quigley.mac@example.org','NorthCarolina','Ona Forest',28,04645),(000009,'aziendale','Kunze, Fisher and Jerde',79075416926,'uvlrpa11z68l937u',490453024487942,'klocko.jessica@example.com','NorthCarolina','Magnus Flats',1935,02644),(000010,'privato','Okuneva, Hane and Murazik',85383542626,'fksddt94r45s120l',704242451535537,'marquardt.jocelyn@example.net','NorthCarolina','O\'Hara Street',924,02226),(000011,'privato','Pacocha-Bergstrom',85383542626,'vjxkku40m99i398e',444280386762693,'boyle.dayton@example.org','NorthCarolina','Bogisich River',732,06878),(000012,'privato','Jaskolski-Kuhlman',52737915382,'upktdx38q49b725e',460746941901743,'stanton78@example.com','Washington','Nathen Creek',1417,01114),(000013,'privato','Hauck, Huel and Franecki',85479336954,'mgddur05e19a738z',319331872509792,'mcdermott.verda@example.com','Washington','Santina Lodge',1708,05431),(000014,'aziendale','Jenkins, Satterfield and Krajcik',52737915382,'phusta38j96s535b',621048660762608,'cnienow@example.org','Washington','Catalina Rest',638,01875),(000015,'privato','Will and Sons',19723686273,'ejckpe47m32a664w',718240512721240,'bo.dietrich@example.com','Washington','Maverick Forges',1581,08022),(000016,'privato','Tromp LLC',85479336954,'psvumy25j28d479o',702822332503274,'ebert.jerod@example.net','Washington','Cameron Circle',189,07468),(000017,'aziendale','Raynor LLC',85479336954,'qskwxe58e19y068s',790793748572468,'haven25@example.com','Washington','Manuel Squares',1839,00295),(000018,'privato','Glover, Christiansen and Collins',79075416926,'jvsgql90d21d385i',361737895430997,'gottlieb.kira@example.net','Massachusetts','Blanda Lakes',719,03971),(000019,'privato','Effertz-Pfeffer',52737915382,'wgbueg21i99y115y',531301634898409,'cebert@example.net','Massachusetts','Shawn Roads',1613,00943),(000020,'privato','Wintheiser Group',52737915382,'ysubhj86l32y369e',746233760938048,'xmills@example.net','Massachusetts','Willis Loaf',1113,03508);
/*!40000 ALTER TABLE `sede operativa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tramite`
--

DROP TABLE IF EXISTS `tramite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tramite` (
  `SedeOperativaTra` int(6) unsigned zerofill NOT NULL,
  `AgenteTra` int(3) unsigned zerofill NOT NULL,
  `TipoAgenteTra` enum('capo area','subagente') NOT NULL DEFAULT 'capo area',
  PRIMARY KEY (`SedeOperativaTra`,`AgenteTra`,`TipoAgenteTra`),
  KEY `Agentetra_idx` (`AgenteTra`,`TipoAgenteTra`),
  CONSTRAINT `Agentetra` FOREIGN KEY (`AgenteTra`, `TipoAgenteTra`) REFERENCES `agente` (`CodAgente`, `Tipo`),
  CONSTRAINT `SedeOperativatra` FOREIGN KEY (`SedeOperativaTra`) REFERENCES `sede operativa` (`CodCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tramite`
--

LOCK TABLES `tramite` WRITE;
/*!40000 ALTER TABLE `tramite` DISABLE KEYS */;
INSERT INTO `tramite` VALUES (000010,002,'capo area'),(000020,002,'capo area'),(000020,003,'capo area'),(000011,004,'subagente'),(000018,004,'subagente'),(000012,005,'subagente'),(000007,007,'subagente'),(000011,007,'subagente'),(000012,007,'subagente'),(000012,008,'subagente'),(000007,009,'subagente'),(000011,009,'subagente'),(000008,010,'capo area'),(000010,010,'capo area'),(000016,010,'capo area');
/*!40000 ALTER TABLE `tramite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zona`
--

DROP TABLE IF EXISTS `zona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zona` (
  `CAP` int(5) unsigned zerofill NOT NULL,
  `CittàZona` varchar(45) NOT NULL,
  `ComuneZona` varchar(45) NOT NULL,
  PRIMARY KEY (`CAP`),
  KEY `Cittazona_idx` (`CittàZona`,`ComuneZona`),
  CONSTRAINT `Cittazona` FOREIGN KEY (`CittàZona`, `ComuneZona`) REFERENCES `citta` (`Nome`, `Comune`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zona`
--

LOCK TABLES `zona` WRITE;
/*!40000 ALTER TABLE `zona` DISABLE KEYS */;
INSERT INTO `zona` VALUES (00197,'Latina','Latina'),(02709,'Latina','Latina'),(02939,'Latina','Latina'),(04406,'Latina','Latina'),(05166,'Latina','Latina'),(01037,'Milano','Milano'),(05362,'Milano','Milano'),(02072,'Napoli','Napoli'),(02273,'Napoli','Napoli'),(02553,'Napoli','Napoli'),(06310,'Palermo','Palermo'),(03601,'Roma','Roma'),(03977,'Torino','Torino'),(04359,'Torino','Torino'),(05303,'Torino','Torino');
/*!40000 ALTER TABLE `zona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `bestdeals`
--

/*!50001 DROP VIEW IF EXISTS `bestdeals`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bestdeals` (`CodProd`,`Sconto`,`Fornitore`) AS select `prodotto`.`CodProdotto` AS `CodProdotto`,`sconto_prodotto`.`ValorePercentuale` AS `ValorePercentuale`,`prodotto`.`Fornitore` AS `Fornitore` from (`prodotto` join `sconto_prodotto`) where ((`prodotto`.`CodProdotto` = `sconto_prodotto`.`ProdottoS`) and `sconto_prodotto`.`ValorePercentuale` >= all (select `sconto_prodotto`.`ValorePercentuale` from `sconto_prodotto` where (`prodotto`.`CodProdotto` = `sconto_prodotto`.`ProdottoS`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `categprodott`
--

/*!50001 DROP VIEW IF EXISTS `categprodott`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `categprodott` (`Categoria`,`Descrizione`,`Prodotto`,`DataScadenza`) AS select `etichetta`.`CategoriaEt` AS `CategoriaEt`,`prodotto`.`Descrizione` AS `Descrizione`,`prodotto`.`CodProdotto` AS `CodProdotto`,`prodotto`.`DataScadenza` AS `DataScadenza` from ((`prodotto` join `categoria`) join `etichetta`) where ((`categoria`.`Nome` = `etichetta`.`CategoriaEt`) and (`etichetta`.`ProdottoEt` = `prodotto`.`CodProdotto`) and (`etichetta`.`CategoriaEt` = 'Pollo')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cittàgestita`
--

/*!50001 DROP VIEW IF EXISTS `cittàgestita`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cittàgestita` AS select `c`.`Nome` AS `Nome`,`c`.`Comune` AS `Comune` from ((`agente` join `appartenenza_geografica` `ag`) join `citta` `c`) where ((`agente`.`CodAgente` = `ag`.`AgenteApp`) and (`agente`.`Tipo` = `ag`.`TipoAgenteApp`) and (`ag`.`CittàApp` = `c`.`Nome`) and (`ag`.`ComuneApp` = `c`.`Comune`) and (`agente`.`CodAgente` = '002') and (`agente`.`Tipo` = 'capo area')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `fatturatidelmese`
--

/*!50001 DROP VIEW IF EXISTS `fatturatidelmese`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `fatturatidelmese` (`Agente`,`Prez`,`Prov`) AS select `f`.`Agente` AS `Agente`,`ordine`.`Totale` AS `Totale`,`f`.`Provvigione` AS `Provvigione` from (`ordine` join `fattura` `f`) where ((`ordine`.`CodOrdine` = `f`.`Ordine`) and (month(`f`.`DataErogazione`) = month((curdate() - interval 1 month))) and (year(`f`.`DataErogazione`) = year((curdate() - interval 1 month))) and (`f`.`Pagato` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `guadagnodelmese`
--

/*!50001 DROP VIEW IF EXISTS `guadagnodelmese`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `guadagnodelmese` AS select `agente`.`CodAgente` AS `CodAgente`,`agente`.`Nome` AS `Nome`,`agente`.`Cognome` AS `Cognome`,sum(((`fdm`.`Prez` / 100) * `fdm`.`Prov`)) AS `GuadagnoTot` from (`agente` join `fatturatidelmese` `fdm`) where (`fdm`.`Agente` = `agente`.`CodAgente`) group by `agente`.`CodAgente`,`agente`.`Nome`,`agente`.`Cognome` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `numcittà`
--

/*!50001 DROP VIEW IF EXISTS `numcittà`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `numcittà` AS select `agente`.`CodAgente` AS `CodAgente`,`agente`.`Nome` AS `Nome`,`agente`.`Cognome` AS `Cognome`,count(0) AS `Città` from (`agente` join `appartenenza_geografica`) where ((`agente`.`CodAgente` = `appartenenza_geografica`.`AgenteApp`) and (`agente`.`Tipo` = 'subagente')) group by `agente`.`CodAgente` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `prodmese`
--

/*!50001 DROP VIEW IF EXISTS `prodmese`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `prodmese` (`Cliente`,`CodProd`,`Quant`,`Descriz`) AS select distinct `o`.`SedeOperativa` AS `SedeOperativa`,`p`.`CodProdotto` AS `CodProdotto`,`p`.`Quantità` AS `Quantità`,`p`.`Descrizione` AS `Descrizione` from (((`fattura` `f` join `ordine` `o`) join `inserimento` `i`) join `prodotto` `p`) where ((`f`.`Ordine` = `o`.`CodOrdine`) and (`o`.`CodOrdine` = `i`.`OrdineIns`) and (`i`.`ProdottoIns` = `p`.`CodProdotto`) and (month(`f`.`DataErogazione`) = month((curdate() - interval 1 month))) and (year(`f`.`DataErogazione`) = year((curdate() - interval 1 month)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `prodot3m`
--

/*!50001 DROP VIEW IF EXISTS `prodot3m`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `prodot3m` (`Cliente`,`Prod`,`Descr`,`DataE`) AS select `ordine`.`SedeOperativa` AS `SedeOperativa`,`prodotto`.`CodProdotto` AS `CodProdotto`,`prodotto`.`Descrizione` AS `Descrizione`,`f`.`DataErogazione` AS `DataErogazione` from (((`prodotto` join `inserimento`) join `ordine`) join `fattura` `f`) where ((`prodotto`.`CodProdotto` = `inserimento`.`ProdottoIns`) and (`inserimento`.`OrdineIns` = `ordine`.`CodOrdine`) and (`ordine`.`CodOrdine` = `f`.`Ordine`) and (`f`.`DataErogazione` >= (curdate() - interval 3 month))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `res`
--

/*!50001 DROP VIEW IF EXISTS `res`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `res` AS select `lavoro_s`.`Responsabile` AS `Responsabile` from `lavoro_s` where (`lavoro_s`.`SedeOperativaRes` = 10) */;
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

-- Dump completed on 2021-06-09 21:44:57
