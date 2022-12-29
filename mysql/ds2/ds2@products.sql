-- MySQLShell dump 1.0.2  Distrib Ver 8.0.26 for Win64 on x86_64 - for MySQL 8.0.26 (MySQL Community Server (GPL)), for Win64 (x86_64)
--
-- Host: localhost    Database: ds2    Table: products
-- ------------------------------------------------------
-- Server version	8.0.31

--
-- Table structure for table `products`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `products` (
  `PROD_ID` int NOT NULL AUTO_INCREMENT,
  `CATEGORY` tinyint NOT NULL,
  `TITLE` varchar(50) NOT NULL,
  `ACTOR` varchar(50) NOT NULL,
  `PRICE` decimal(12,2) NOT NULL,
  `SPECIAL` tinyint DEFAULT NULL,
  `COMMON_PROD_ID` int NOT NULL,
  PRIMARY KEY (`PROD_ID`),
  KEY `IX_PROD_CATEGORY` (`CATEGORY`),
  KEY `IX_PROD_SPECIAL` (`SPECIAL`),
  FULLTEXT KEY `IX_PROD_ACTOR` (`ACTOR`),
  FULLTEXT KEY `IX_PROD_TITLE` (`TITLE`)
) ENGINE=MyISAM AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
