-- MySQLShell dump 1.0.2  Distrib Ver 8.0.26 for Win64 on x86_64 - for MySQL 8.0.26 (MySQL Community Server (GPL)), for Win64 (x86_64)
--
-- Host: localhost    Database: ds2    Table: cust_hist
-- ------------------------------------------------------
-- Server version	8.0.31

--
-- Table structure for table `cust_hist`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `cust_hist` (
  `CUSTOMERID` int NOT NULL,
  `ORDERID` int NOT NULL,
  `PROD_ID` int NOT NULL,
  KEY `IX_CUST_HIST_CUSTOMERID` (`CUSTOMERID`),
  CONSTRAINT `FK_CUST_HIST_CUSTOMERID` FOREIGN KEY (`CUSTOMERID`) REFERENCES `customers` (`CUSTOMERID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
