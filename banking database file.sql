-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: banking
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `accphoto`
--

DROP TABLE IF EXISTS `accphoto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accphoto` (
  `acc_no` varchar(100) NOT NULL,
  `photo` mediumblob,
  PRIMARY KEY (`acc_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accphoto`
--

LOCK TABLES `accphoto` WRITE;
/*!40000 ALTER TABLE `accphoto` DISABLE KEYS */;
INSERT INTO `accphoto` VALUES ('53320100000104',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0,\0\0\0¨\0\0\0m\õ#=\0\0\0ÿPLTE\0\0\0\0\0¾³,?9\0\0{¶¯\0~½°sº±3ICq¼³½´6YQ%#=ian¦™zÁµ@lap¦ vÁ±>_Xf—’\0\0w¹²Icas§Z…}6DB7LH9WRs»®qž˜\0\0rˆmƒh“‰`~x\0$ $96\'21Œ¹³l¿­u·ªLhcGddj©,./‰µ¨apoOsn.)wŸšItnÍ¿!%(a›Xql%@6YddYŠ‚HjeDVRn}zˆ¤ *(ipnÄ¶7\\P°¬*MB\\ƒwÈ²k¯žX`a1=;@FE\0\Z€Ž‹P`Vx–cxo\ñ\0\0ºIDATxœ\íœyW\ÚJ‡\ßL\Ìhjh ,\õJ-®\ôV\ìb­v\ïýþŸ\å¾3€µ§øG‹’\ßsMf\â™<\ç\Í\ì‘\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0dÄª\ðˆ¾\Å‚¬\å\àœ†e­º\Ð+\ãþ‘•`Y†A­{Ð’W$ƒJm\×Ö—\Åk—V]\â\"(¯wº\æ’t;^/Ám‚Aÿ\è{Ì’4\ö\Üd\Ë:sƒ\å³\îÖŸ+ËƒÇ -wûŽ\ó\ÜI\à/\õ=ËŽû\ô¯\ëa\ò+Y\Ü\æ	6U]hú \ë\'Y²\ï)-UYs\Ü!‹5ù,©Ø¶\äû\ó¡Y‹‘\ÕoÉˆzz\é\ç\ÚBd-\È\ê\í\å\\Ð‹ý7µ}{@\ÆÀt\õYTv;\Z¸®90T\ÂÈš‰¬£ž\ôú\Ü\ñŒC\÷€ú\Ó\ó>Ý¦CÖ¬£K\Ç<,«³»Ž¾\Í\õ<Q\ö\Ðq\Ì]5••9\Í‘rt&F\áû|Xp\Â\ã\Ì$d\ÝDV=\ð®\ÃBSž\Ý	\íq[\Ø,„/¨Os@\Ömelm»ž])\ÒI»sJ>+ž\ënŸ\Ýv  k¶5¤R\ì\ÙCª;n™›Ä¡\í\ÅsX5\Ó\Z\Ê\á\Í\ËÚ¿„\ñS8¬½œLCÖ¼,^ŽýŠ,1\Î\0YS~’%H\ð\ãW9ü,g\Ô!dMY\î1	.\éÊ˜Nk\Ý\0YcC!”%\ã®eœd\Ë\"–ui\å¤\Ë\ê9Á\Ë\ô¯(-\îÙªË»:„\Ï›NÇžÅ›ÅO\ét¶¼º#(\ï¤r¹\Ô\"¹\Ü\'SfŽ#+¹²Ê·sf\î\É,%S¹\É\ç\\Ši¦\Î(\É\Ë\÷#ýú\Úu\æ`M¡t\õ$7Þ»\öŽ³	–Å½¨\Ò\æû\ÍY\Ê³†]þÎ™g\åÙ”\÷\ï7?¨	œ¤²¸\Ø\Ål\èa.Çªº¡Süùÿ/\êq \Æ6i×“²R¹\Ð.\Òüp\Ü\"\Ôh\'­?É¥\ÂN*\õD/NN_\Ñ4e¿Åœ\Ù\\uY4£ýn·ë†¡ì†¡nv»û£U—\éÁ2:¬§•`[±S9\r*‡I\Þ\ë–fù\Ú\ÚH\ð¸†\Æ]ª;g©\î\Î\íû\"Á½u’;Ø——%\î“{ý°\ÈÂ²,ùB\Å\ïž1­_­þ•B=~ûš\ÄId^4\\m	¡½Ž*qÕ¢\Ñ\Ù;\É]R&›\î3þlþ\ØO“oª¯Dr	L¨\å/2„\Ü\'¹\ã\Ê\Èã½¸*\ÙPf©gy|%	\Î/¿VwWy\çY%K†MQŠ\áû–­ž\Æw«Yšz‰\Éò…’£dùd¨WÁ‹\õ-MþfI{–ºR.”¾¨\ne	*y\É`™$H\Ô\ö\é;_SY“%Ä™ºKø\ÖD\Ím—m\r\ç¸nd\É]]\î¹\Ê×¢(Mý(Ž_ŸS+Š>m\Ôj?†r\ÚjGo²ÀVT«\õ8\ç\ëZ\\z½©\ï\ÊEŽ·QË\\ï¢¸TŒ‚ÖŠo\ìO0Yd:%\ê—U\Z¶Ó´\Û\õ>pyV&\ê]¼§L»2‘EY\'Kt(W¯®ƒ´\í]¢\òE\Zû;|²\àù\Â\Åp\r;¯3²,º\ÔG|«›\ÜG¸<$\Zx§,+\Öh\÷B®O\Ç\ìN\Éj\è{¬-\ëÕ¥¬-v2\Ðcj\Ø9OÁ-KYG”d\ÖP\Í\Ê2\Ý4u½\á\÷|O\ç`97\í·ÔªKkÁ\÷\ïùŠ>/55©§?ã‹šN—\Úy\ö–v.i\ä|\Ì~ÊŸêœ½\î\ÊG\Ô_\Ã:\ËP«„Ï¨\Ê-X\Ãkyú¨X*~þ\ÌU{ýºNu®\Å\nú³b‰Ï\í\é-:r\ã±,®\\~ ©©›4\Ô\÷Š_\Ò\é\Ï\\U\ÕuµB½Žs©\\5Od\ÑH\ç\nº«Oº\×Z\În\Ä^ú«i\î§©Ñ§\r‡+-)‹#\Ë8²&[I„Š¬u4E*\0²\ö©ú5\Ø\îûTpÔžm\Í`[u{»\ÈwŸiwU:[À*3\\=qu\Ìf_±,Agv´K§!\Û\îv¼u•%§g¶X–\Ö/¾9ý\Ê7Y­´\Ë\Õþ‹wR×‰ªµ\Ù\æEÜ¨n|;—²6¸5¼\È]\îqÒ•Ÿ\Ó\î~\Ð\çN\Ú~e·z\ð\í9\ôžJ¯k\è‹{\é\Ü[Š¯\â\è\Å\óÉ©r%¨HF\Ô;ª\ZÔ‚¸Þ \ó8Žkß‰Z|EOZ¼r¯£\Ã*ù}-§®\áþ\ãÄ¨µ–²f\ç4¹[MŸ\Ùs—GÓ©›\ÉOK»9¼rþ™ü1ßƒ_GS¡¾\Õ\ÝN\È?g*9Õ²Ô´ªü§\"<²¦\Ø\É\Óx-\Æy¦\í·ScIƒ‡WvvÕ¥x$\ô)¸#G\ð{úR\Ü(~Yu1¨–\î\ö‡,‘\ð5W\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0°\öh`iþ\âZ”\Ò\×k=\\\0\0\0\0IEND®B`‚');
/*!40000 ALTER TABLE `accphoto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `adminid` varchar(30) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin123','admin123');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `branchCode` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `ifsc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`branchCode`),
  UNIQUE KEY `ifsc` (`ifsc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (533201,'PQRST BRANCH 1','Bareilly','Uttar Pradesh','FAST0PQRST'),(533202,'ABDC BRANCH 2','Bareilly','Uttar Pradesh','FAST0ABDC ');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashinhand`
--

DROP TABLE IF EXISTS `cashinhand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cashinhand` (
  `balance` float DEFAULT NULL,
  `branchCode` int NOT NULL,
  `status` int DEFAULT '0',
  PRIMARY KEY (`branchCode`),
  CONSTRAINT `cashinhand_ibfk_1` FOREIGN KEY (`branchCode`) REFERENCES `branch` (`branchCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashinhand`
--

LOCK TABLES `cashinhand` WRITE;
/*!40000 ALTER TABLE `cashinhand` DISABLE KEYS */;
INSERT INTO `cashinhand` VALUES (3802500,533201,1),(0,533202,0);
/*!40000 ALTER TABLE `cashinhand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_photo`
--

DROP TABLE IF EXISTS `customer_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_photo` (
  `acc_no` varchar(100) DEFAULT NULL,
  `customer_id` varchar(100) DEFAULT NULL,
  `photo` blob,
  `sign` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_photo`
--

LOCK TABLES `customer_photo` WRITE;
/*!40000 ALTER TABLE `customer_photo` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `emp_id` varchar(30) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `post` varchar(50) DEFAULT NULL,
  `branchCode` int DEFAULT NULL,
  `gender` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `pno` varchar(30) DEFAULT NULL,
  `adhaar` varchar(100) DEFAULT NULL,
  `pan` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `branchCode` (`branchCode`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`branchCode`) REFERENCES `branch` (`branchCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('F0M0100101','Cashier1','cashier',533201,'Male','cashier1@gmail.com','a99, pqr colony','Bareilly','Uttar Pradesh','1234567890','123412341234','CAMFD049F','cashi59'),('F0M0100102','manager1','Manager',533201,'Male','manager1@gmail.com','q77, qwe colony','Bareilly','Uttar Pradesh','7387483902','121212121212','CAMFT049F','manag87'),('F0M0100103','officer 1','officer',533201,'Female','officer1@gmail.com','c-95, ghj colony','Bareilly','Uttar Pradesh','7897897890','123412341234','CUS45DH45','offic87');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `emailid` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('admin@gmail.com','admin123','officer'),('customer1@gmail.com','customer1','customer'),('customer2@gmail.com','customer2','customer'),('customer3@gmail.com','customer3','customer');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `officer`
--

DROP TABLE IF EXISTS `officer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `officer` (
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `emailid` varchar(100) NOT NULL,
  PRIMARY KEY (`emailid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `officer`
--

LOCK TABLES `officer` WRITE;
/*!40000 ALTER TABLE `officer` DISABLE KEYS */;
INSERT INTO `officer` VALUES ('Admin','admin123','admin@gmail.com');
/*!40000 ALTER TABLE `officer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pendingpayment`
--

DROP TABLE IF EXISTS `pendingpayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pendingpayment` (
  `acc_no` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `status` int DEFAULT NULL,
  `branchCode` int DEFAULT NULL,
  PRIMARY KEY (`acc_no`),
  KEY `branchCode` (`branchCode`),
  CONSTRAINT `pendingpayment_ibfk_1` FOREIGN KEY (`branchCode`) REFERENCES `branch` (`branchCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pendingpayment`
--

LOCK TABLES `pendingpayment` WRITE;
/*!40000 ALTER TABLE `pendingpayment` DISABLE KEYS */;
/*!40000 ALTER TABLE `pendingpayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query`
--

DROP TABLE IF EXISTS `query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `query` (
  `q_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `category` varchar(200) DEFAULT NULL,
  `query` varchar(400) DEFAULT NULL,
  `reply` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`q_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query`
--

LOCK TABLES `query` WRITE;
/*!40000 ALTER TABLE `query` DISABLE KEYS */;
INSERT INTO `query` VALUES (4,'11:Customer1','Other person did not received the money','acc no. 12','Error occurred due to server down. Now you can make payments'),(5,'11:Customer1','Error occurred but amount was deducted','','gjhkjhbk');
/*!40000 ALTER TABLE `query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `category` varchar(100) DEFAULT NULL,
  `report_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES ('deposit','2023-01-04 22:38:30'),('transfer','2023-01-04 22:40:27'),('deposit','2023-01-04 22:40:48'),('query','2023-01-04 22:41:05'),('transfer','2023-01-04 22:41:16');
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `tran_id` int NOT NULL AUTO_INCREMENT,
  `receiver` varchar(100) DEFAULT NULL,
  `sender` varchar(100) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `dot` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`tran_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (17,'53320100000101:Customer1','533201:BY CASH',500,'2023-02-21 20:35:42'),(18,'53320100000102:Customer2','533201:BY CASH',5000000,'2023-02-21 20:35:42'),(19,'533201:BY CASH','53320100000101:Customer1',100,'2023-02-21 21:07:20'),(20,'533201:BY CASH','53320100000102:Customer2',500,'2023-02-22 03:11:24'),(21,'53320100000101:Customer1','533201:BY CASH',2000,'2023-02-22 03:11:24'),(22,'53320100000101:Customer1','533201:BY CASH',2000,'2023-02-22 03:11:24'),(23,'533201:BY CASH','53320100000102:Customer2',400,'2023-02-22 03:11:24'),(24,'53320100000102:Customer2','533201:BY CASH',200,'2023-02-22 03:11:24'),(25,'53320100000101:Customer1','533201:BY CASH',1000,'2023-02-22 03:44:42'),(26,'53320100000101:Customer2','53320100000102:Customer1',500,'2023-02-22 21:53:24'),(27,'533201:BY CASH','53320100000102:Customer2',2000,'2023-02-23 00:43:41'),(28,'53320100000102:Customer2','53320100000101:Customer1',50,'2023-02-23 00:43:41'),(29,'53320100000102:Customer2','533201:BY CASH',1000,'2023-02-23 04:18:47'),(30,'533201:BY CASH','53320100000102:Customer2',1000,'2023-02-23 04:18:47'),(31,'533201:BY CASH','53320100000102:Customer2',2000100,'2023-02-23 05:01:24'),(32,'533201:BY CASH','53320100000102:Customer2',2000100,'2023-02-23 05:01:24'),(33,'53320100000102:Customer2','533201:BY CASH',3000000,'2023-02-23 05:15:21'),(34,'53320200000101:Customer3','533201:BY CASH',100,'2023-02-25 16:33:28'),(35,'533201:BY CASH','53320100000102:Customer2',200100,'2023-02-25 16:33:28');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `name` varchar(100) DEFAULT NULL,
  `emailid` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `pno` varchar(100) DEFAULT NULL,
  `adhaar` varchar(100) DEFAULT NULL,
  `pan` varchar(100) DEFAULT NULL,
  `balance` float DEFAULT NULL,
  `verify` varchar(100) DEFAULT NULL,
  `branchCode` int DEFAULT NULL,
  `acc_no` varchar(100) NOT NULL,
  `customer_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`acc_no`),
  UNIQUE KEY `customer_id` (`customer_id`),
  KEY `branchCode` (`branchCode`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`branchCode`) REFERENCES `branch` (`branchCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('Customer1','customer1@gmail.com','customer1','Male','a-52, xyz colony','Bareilly','Uttar Pradesh','5432167890','789078907890','CAMPS049F',5850,'verified',533201,'53320100000101','CUS0FM01'),('Customer2','customer2@gmail.com','customer2','Female','d-23,pqr colony','Bareilly','Uttar Pradesh','5432167890','432143214321','CAMPS049F',3796550,'verified',533201,'53320100000102','CUS0FM02'),('Customer4','customer4@gmail.com','customer4','Male','f-11, jkl colony','Bareilly','Uttar Pradesh','0987654321','123412341234','CAMPS0499F',0,'unverified',533201,'53320100000103','CUS0FM03'),('Customer23','customer23@gmail.com','customer23','Male','123gj, fgh colony','Bareilly','Uttar Pradesh','5432167890','121212121212','CUS123CU23',0,'unverified',533201,'53320100000104','CUS0FM06'),('Customer3','customer3@gmail.com','customer3','Female','d-23,pqr colony','Bareilly','Uttar Pradesh','1234567890','432143214321','CUS45DH45',100,'verified',533202,'53320200000101','CUS0FM04'),('Customer5','customer5@gmail.com','customer5','Male','h-08, hjk colony','Noida','Uttar Pradesh','7387483902','987667890987','CUS45DH45',0,'unverified',533202,'53320200000102','CUS0FM05');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-31 19:55:17
