-- MySQLShell dump 1.0.2  Distrib Ver 8.0.26 for Win64 on x86_64 - for MySQL 8.0.26 (MySQL Community Server (GPL)), for Win64 (x86_64)
--
-- Host: localhost    Database: ds2    Table: customers
-- ------------------------------------------------------
-- Server version	8.0.31

--
-- Table structure for table `customers`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `customers` (
  `CUSTOMERID` int NOT NULL AUTO_INCREMENT,
  `FIRSTNAME` varchar(50) NOT NULL,
  `LASTNAME` varchar(50) NOT NULL,
  `ADDRESS1` varchar(50) NOT NULL,
  `ADDRESS2` varchar(50) DEFAULT NULL,
  `CITY` varchar(50) NOT NULL,
  `STATE` varchar(50) DEFAULT NULL,
  `ZIP` int DEFAULT NULL,
  `COUNTRY` varchar(50) NOT NULL,
  `REGION` tinyint NOT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `PHONE` varchar(50) DEFAULT NULL,
  `CREDITCARDTYPE` int NOT NULL,
  `CREDITCARD` varchar(50) NOT NULL,
  `CREDITCARDEXPIRATION` varchar(50) NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `PASSWORD` varchar(50) NOT NULL,
  `AGE` tinyint DEFAULT NULL,
  `INCOME` int DEFAULT NULL,
  `GENDER` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`CUSTOMERID`),
  UNIQUE KEY `IX_CUST_USERNAME` (`USERNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=20001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
