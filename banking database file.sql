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
INSERT INTO `accphoto` VALUES ('53320100000104',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0,\0\0\0�\0\0\0m\�#=\0\0\0�PLTE\0\0\0\0\0��,?9\0\0{��\0~��s��3ICq�����6YQ%#=ian��z��@lap��v��>_Xf��\0\0w��Icas��Z�}6DB7LH9WRs��q��\0\0r��m��h��`~x\0$ $96\'21���l��u��LhcGddj��,./���apoOsn.)w��Itn�Ϳ!%(a��Xql%@6YddY��HjeDVRn}z���*(ipn�Ķ7\\P��*MB\\��wȲk��X`a1=;@FE\0\Z���P`Vx��cxo\�\0\0�IDATx�\�yW\�J�\�L\��hjh ,��\�J-�\�V\�b�v\����\�3����G��\�sMf\�<\�\�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�dĪ\���\���\�\���e��\�+\����`Y�A��{ВW$�Jm\�֗\�k�V]\�\"(�w�\�t;^/�m�A�\�{�̒4\�\�d\�:s�\�\�֟+˃Ǡ-w��\�\�I\�/\�=ˎ�\��\�a\�+Y\�\�	6U]h� \�\'Y�\�)-UYs\�!�5�,�ض\��\�Y��\�oɈzz\�\�\�Bd-\�\�\�\�\\Ћ�7��}{@\��t\�YTv;\Z��90T\�Ț�����\��\�\�C\���\�\�>ݦC֍��K\�<,�����\�\�<Q\�\�q\�]�5��9\��rt&F\��|Xp\�\�\�$d\�DV=\�\�BS�\�	\�q[\�,�/�Os@\�m�elm��])\�I�sJ>+�\�n�\�v  k�5�R\�\�C�;n��ġ\�\�sX�5\�\Z\�\�\�\�ڿ�\�S8���LCּ,^���,1\�\0YS~�%H\�\�W9�,g\�!dMY\�1	.\�ʘNk\�\0YcC!�%\�e�d\�\"�u�i\�\�\�9�\�\��(-\�٪˻:�\��NǞśŝO\�t���#(\�r�\�\"�\�\'Sf�#+��ʷsf\�\�,%S�\�\�\\�i�\�(\�\�\�#��\�u\�`M�t\�$7޻\���	�Ž�\�\��\�Y\���]�Ιg\�ٔ\�\�7?�	����\�\�l\�a.Ǫ��S���/\�q�\�6iד�R�\�.\��p\�\"\�h\'�?ɥ\�N*\�D/NN�_\�4e��Ŝ\�\\uY4��n�놡쐆�nv���U�\��2:���`[�S9\r*�I\�\��f�\�\�H\�\�]�;g�\�\�\��\"��u�;ؗ�%\�{��\�²,�B\�\�1�_���B=~��\�Id^4\\m	���*qբ\�\�;\�]R&�\�3�l�\�O�o��Dr	L�\�/2�\�\'�\�\�\�㽸*\�P�f�gy|%	\�/�VwWy\�Y%K�MQ�\�����\�w�Y�z�\�򅒣d�d�W��\�-M�fI{��R.���\n�e	*y\�`�$H\�\��\�;_SY�%ę�K�\�D\�m�m\r\�nd\�]]\�\�ע(M�(�_�S+�>m\�j?�r\�jGo��VT�\�8\�\�Z\\z��\�\�E��Q˝\\T��֊o\�O0Yd:%\��U\Z�Ӵ\�\�>pyV&\�]��L�2�EY\'Kt(W����\�]�\�E�\Z�;|�\��\�\�p\r;�3�,�\�G|��\�G�<$\Zx�,+\�h\�B�O\�\�N\�j\�{�-\�ե�-v2\�cj\�9O�-KYG�d\�P\�\�2\�4u�\�\�|O\�`97\�ԪKk�\�\���>�/55��?㋚N�\�y\��v.i\�|\�~ʟꜽ\�\�G\�_\�:\�P��Ϩ\�-X\�ky��X*~�\�U{��Nu�\�\n��b�ϝ\�\�-:r\�,��\\~ ���4\�\��_\�\�\�\\U\�u�B��s�\\5Od\�H\�\n��O��\�Z\�n\�^��i\���ѧ\r�+-)�#\�8�&[I���u4E*\0�\���5\�\��TpԞm\�`[u{�\�w�iwU:[�*3\\=q�u\�f_�,Agv��K�!\�\�v�u�%�g�X�\�/�9�\�7Y��\�\���wR׉��\�\�Eܨn|;��6�5�\�]\�qҕ�\�\�~\�\�N\�~e�z\�\�9\��J�k\�{\�\�[��\�\�\�\�ɩr%��HF\�;�\ZԂ�ޠ\�8�k߉Z|EOZ�r��\�*�}-��\��\�Ĩ���f\�4�[M��\�s�Gө�\�OK�9�r���1߃_GS��\�\�N\�?g*9ղԴ���\"<��\�\�\�x-\�y�\�ScI��Wvvեx$\�)��#G\�{�R\�(~Yu1��\�\��,��\�5W\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�h`i�\�Z�\�\�k=\\\0\0\0\0IEND�B`�');
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
