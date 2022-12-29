-- MySQLShell dump 1.0.2  Distrib Ver 8.0.26 for Win64 on x86_64 - for MySQL 8.0.26 (MySQL Community Server (GPL)), for Win64 (x86_64)
--
-- Host: localhost    Database: ds2    Table: orderlines
-- ------------------------------------------------------
-- Server version	8.0.31

--
-- Table structure for table `orderlines`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `orderlines` (
  `ORDERLINEID` smallint NOT NULL,
  `ORDERID` int NOT NULL,
  `PROD_ID` int NOT NULL,
  `QUANTITY` smallint NOT NULL,
  `ORDERDATE` date NOT NULL,
  UNIQUE KEY `IX_ORDERLINES_ORDERID` (`ORDERID`,`ORDERLINEID`),
  CONSTRAINT `FK_ORDERID` FOREIGN KEY (`ORDERID`) REFERENCES `orders` (`ORDERID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
