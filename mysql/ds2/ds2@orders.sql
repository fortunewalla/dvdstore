-- MySQLShell dump 1.0.2  Distrib Ver 8.0.26 for Win64 on x86_64 - for MySQL 8.0.26 (MySQL Community Server (GPL)), for Win64 (x86_64)
--
-- Host: localhost    Database: ds2    Table: orders
-- ------------------------------------------------------
-- Server version	8.0.31

--
-- Table structure for table `orders`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `orders` (
  `ORDERID` int NOT NULL AUTO_INCREMENT,
  `ORDERDATE` date NOT NULL,
  `CUSTOMERID` int DEFAULT NULL,
  `NETAMOUNT` decimal(12,2) NOT NULL,
  `TAX` decimal(12,2) NOT NULL,
  `TOTALAMOUNT` decimal(12,2) NOT NULL,
  PRIMARY KEY (`ORDERID`),
  KEY `IX_ORDER_CUSTID` (`CUSTOMERID`),
  CONSTRAINT `FK_CUSTOMERID` FOREIGN KEY (`CUSTOMERID`) REFERENCES `customers` (`CUSTOMERID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=12001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
