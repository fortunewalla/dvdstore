-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: ds2
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `ds2`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ds2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ds2`;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `CATEGORY` tinyint NOT NULL AUTO_INCREMENT,
  `CATEGORYNAME` varchar(50) NOT NULL,
  PRIMARY KEY (`CATEGORY`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cust_hist`
--

DROP TABLE IF EXISTS `cust_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cust_hist` (
  `CUSTOMERID` int NOT NULL,
  `ORDERID` int NOT NULL,
  `PROD_ID` int NOT NULL,
  KEY `IX_CUST_HIST_CUSTOMERID` (`CUSTOMERID`),
  CONSTRAINT `FK_CUST_HIST_CUSTOMERID` FOREIGN KEY (`CUSTOMERID`) REFERENCES `customers` (`CUSTOMERID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
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

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `PROD_ID` int NOT NULL,
  `QUAN_IN_STOCK` int NOT NULL,
  `SALES` int NOT NULL,
  PRIMARY KEY (`PROD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orderlines`
--

DROP TABLE IF EXISTS `orderlines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderlines` (
  `ORDERLINEID` smallint NOT NULL,
  `ORDERID` int NOT NULL,
  `PROD_ID` int NOT NULL,
  `QUANTITY` smallint NOT NULL,
  `ORDERDATE` date NOT NULL,
  UNIQUE KEY `IX_ORDERLINES_ORDERID` (`ORDERID`,`ORDERLINEID`),
  CONSTRAINT `FK_ORDERID` FOREIGN KEY (`ORDERID`) REFERENCES `orders` (`ORDERID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
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

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
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

--
-- Table structure for table `reorder`
--

DROP TABLE IF EXISTS `reorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reorder` (
  `PROD_ID` int NOT NULL,
  `DATE_LOW` date NOT NULL,
  `QUAN_LOW` int NOT NULL,
  `DATE_REORDERED` date DEFAULT NULL,
  `QUAN_REORDERED` int DEFAULT NULL,
  `DATE_EXPECTED` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'ds2'
--
/*!50003 DROP PROCEDURE IF EXISTS `NEW_CUSTOMER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`remo`@`localhost` PROCEDURE `NEW_CUSTOMER`( IN firstname_in varchar(50), IN lastname_in varchar(50), IN address1_in varchar(50), IN address2_in varchar(50), IN city_in varchar(50), IN state_in varchar(50), IN zip_in int, IN country_in varchar(50), IN region_in int, IN email_in varchar(50), IN phone_in varchar(50), IN creditcardtype_in int, IN creditcard_in varchar(50), IN creditcardexpiration_in varchar(50), IN username_in varchar(50), IN password_in varchar(50), IN age_in int, IN income_in int, IN gender_in varchar(1), OUT customerid_out INT)
BEGIN
  DECLARE rows_returned INT;
  SELECT COUNT(*) INTO rows_returned FROM CUSTOMERS WHERE USERNAME = username_in;
  IF rows_returned = 0 
  THEN
    INSERT INTO CUSTOMERS
      (
      FIRSTNAME,
      LASTNAME,
      EMAIL,
      PHONE,
      USERNAME,
      PASSWORD,
      ADDRESS1,
      ADDRESS2,
      CITY,
      STATE,
      ZIP,
      COUNTRY,
      REGION,
      CREDITCARDTYPE,
      CREDITCARD,
      CREDITCARDEXPIRATION,
      AGE,
      INCOME,
      GENDER
      )
    VALUES
      (
      firstname_in,
      lastname_in,
      email_in,
      phone_in,
      username_in,
      password_in,
      address1_in,
      address2_in,
      city_in,
      state_in,
      zip_in,
      country_in,
      region_in,
      creditcardtype_in,
      creditcard_in,
      creditcardexpiration_in,
      age_in,
      income_in,
      gender_in
      )
      ;
    select last_insert_id() into customerid_out;
  ELSE SET customerid_out = 0;
  END IF;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-28 23:26:06
