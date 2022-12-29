-- MySQLShell dump 1.0.2  Distrib Ver 8.0.26 for Win64 on x86_64 - for MySQL 8.0.26 (MySQL Community Server (GPL)), for Win64 (x86_64)
--
-- Host: localhost    Database: ds2
-- ------------------------------------------------------
-- Server version	8.0.31

--
-- Current Database: ds2
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ds2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE ds2;

--
-- Dumping events for database 'ds2'
--

--
-- Dumping routines for database 'ds2'
--

-- begin procedure ds2.NEW_CUSTOMER
/*!50003 DROP PROCEDURE IF EXISTS NEW_CUSTOMER */;
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
-- end procedure ds2.NEW_CUSTOMER

