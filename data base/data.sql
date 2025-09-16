-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: smsatik
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `all_user_table`
--

DROP TABLE IF EXISTS `all_user_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `all_user_table` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `strole` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `all_user_table`
--

LOCK TABLES `all_user_table` WRITE;
/*!40000 ALTER TABLE `all_user_table` DISABLE KEYS */;
INSERT INTO `all_user_table` VALUES (1,'dge@gmail.com','Atiqur Rahman','1234','3'),(2,'Reja@gmail.com','Reja  Karim','1234','3');
/*!40000 ALTER TABLE `all_user_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apply_table`
--

DROP TABLE IF EXISTS `apply_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apply_table` (
  `appid` bigint NOT NULL AUTO_INCREMENT,
  `app_catogory` varchar(255) DEFAULT NULL,
  `app_clss` varchar(255) DEFAULT NULL,
  `app_email` varchar(255) DEFAULT NULL,
  `app_first_name` varchar(255) DEFAULT NULL,
  `app_phone` varchar(255) DEFAULT NULL,
  `applast_name` varchar(255) DEFAULT NULL,
  `approved` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`appid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apply_table`
--

LOCK TABLES `apply_table` WRITE;
/*!40000 ALTER TABLE `apply_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `apply_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance_table`
--

DROP TABLE IF EXISTS `attendance_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance_table` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `a_dates` varchar(255) DEFAULT NULL,
  `aattendance` varchar(255) DEFAULT NULL,
  `ssid` bigint NOT NULL,
  `sid` bigint DEFAULT NULL,
  PRIMARY KEY (`aid`),
  KEY `FKrg1h4eqkbcp4awhra0yd23c9c` (`sid`),
  CONSTRAINT `FKrg1h4eqkbcp4awhra0yd23c9c` FOREIGN KEY (`sid`) REFERENCES `student_table` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_table`
--

LOCK TABLES `attendance_table` WRITE;
/*!40000 ALTER TABLE `attendance_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_rutine_table`
--

DROP TABLE IF EXISTS `class_rutine_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_rutine_table` (
  `crid` int NOT NULL AUTO_INCREMENT,
  `cr_class` int NOT NULL,
  `cr_day` varchar(255) DEFAULT NULL,
  `cr_time1` varchar(255) DEFAULT NULL,
  `cr_time2` varchar(255) DEFAULT NULL,
  `cr_time3` varchar(255) DEFAULT NULL,
  `cr_time4` varchar(255) DEFAULT NULL,
  `cr_time5` varchar(255) DEFAULT NULL,
  `cr_time6` varchar(255) DEFAULT NULL,
  `cr_time7` varchar(255) DEFAULT NULL,
  `first_sub` varchar(255) DEFAULT NULL,
  `first_tea` varchar(255) DEFAULT NULL,
  `fivth_sub` varchar(255) DEFAULT NULL,
  `fivth_tea` varchar(255) DEFAULT NULL,
  `forth_sub` varchar(255) DEFAULT NULL,
  `forth_tea` varchar(255) DEFAULT NULL,
  `second_sub` varchar(255) DEFAULT NULL,
  `second_tea` varchar(255) DEFAULT NULL,
  `seven_sub` varchar(255) DEFAULT NULL,
  `seven_tea` varchar(255) DEFAULT NULL,
  `six_sub` varchar(255) DEFAULT NULL,
  `six_tea` varchar(255) DEFAULT NULL,
  `third_sub` varchar(255) DEFAULT NULL,
  `third_tea` varchar(255) DEFAULT NULL,
  `class_id` bigint DEFAULT NULL,
  `routine_id` int DEFAULT NULL,
  PRIMARY KEY (`crid`),
  KEY `FKoko6e1fijreryl8stedfuq2ys` (`class_id`),
  KEY `FK1oa3np5n033hphvhxq3m7psdi` (`routine_id`),
  CONSTRAINT `FK1oa3np5n033hphvhxq3m7psdi` FOREIGN KEY (`routine_id`) REFERENCES `teacher_table` (`tid`),
  CONSTRAINT `FKoko6e1fijreryl8stedfuq2ys` FOREIGN KEY (`class_id`) REFERENCES `class_table` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_rutine_table`
--

LOCK TABLES `class_rutine_table` WRITE;
/*!40000 ALTER TABLE `class_rutine_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_rutine_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_table`
--

DROP TABLE IF EXISTS `class_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_table` (
  `cid` bigint NOT NULL AUTO_INCREMENT,
  `c_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_table`
--

LOCK TABLES `class_table` WRITE;
/*!40000 ALTER TABLE `class_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_rutine_table`
--

DROP TABLE IF EXISTS `exam_rutine_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_rutine_table` (
  `exid` bigint NOT NULL AUTO_INCREMENT,
  `ex_class` varchar(255) DEFAULT NULL,
  `ex_subject1` varchar(255) DEFAULT NULL,
  `ex_subject2` varchar(255) DEFAULT NULL,
  `ex_subject3` varchar(255) DEFAULT NULL,
  `ex_subject4` varchar(255) DEFAULT NULL,
  `ex_subject5` varchar(255) DEFAULT NULL,
  `ex_subject6` varchar(255) DEFAULT NULL,
  `ex_subject7` varchar(255) DEFAULT NULL,
  `ex_time` varchar(255) DEFAULT NULL,
  `exdate1` varchar(255) DEFAULT NULL,
  `exdate2` varchar(255) DEFAULT NULL,
  `exdate3` varchar(255) DEFAULT NULL,
  `exdate4` varchar(255) DEFAULT NULL,
  `exdate5` varchar(255) DEFAULT NULL,
  `exdate6` varchar(255) DEFAULT NULL,
  `exdate7` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`exid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_rutine_table`
--

LOCK TABLES `exam_rutine_table` WRITE;
/*!40000 ALTER TABLE `exam_rutine_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_rutine_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_rutine_table_subject_model`
--

DROP TABLE IF EXISTS `exam_rutine_table_subject_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_rutine_table_subject_model` (
  `exam_rutine_model_exid` bigint NOT NULL,
  `subject_model_subid` int NOT NULL,
  UNIQUE KEY `UK_dra2l4vkpqybm54gw73m82ex3` (`subject_model_subid`),
  KEY `FKc7gps2k3rc6vgd6j187bau4dg` (`exam_rutine_model_exid`),
  CONSTRAINT `FK9ryghsjjt5kl5x2q9v901rdy7` FOREIGN KEY (`subject_model_subid`) REFERENCES `subject_table` (`subid`),
  CONSTRAINT `FKc7gps2k3rc6vgd6j187bau4dg` FOREIGN KEY (`exam_rutine_model_exid`) REFERENCES `exam_rutine_table` (`exid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_rutine_table_subject_model`
--

LOCK TABLES `exam_rutine_table_subject_model` WRITE;
/*!40000 ALTER TABLE `exam_rutine_table_subject_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_rutine_table_subject_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fee_catagory_model`
--

DROP TABLE IF EXISTS `fee_catagory_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fee_catagory_model` (
  `feeid` bigint NOT NULL AUTO_INCREMENT,
  `fee_amount` varchar(255) DEFAULT NULL,
  `fee_catagory` varchar(255) DEFAULT NULL,
  `fee_month` varchar(255) DEFAULT NULL,
  `payment_date` varchar(255) DEFAULT NULL,
  `sid` bigint DEFAULT NULL,
  PRIMARY KEY (`feeid`),
  KEY `FKpbgud5j439bio4ahyqj98npow` (`sid`),
  CONSTRAINT `FKpbgud5j439bio4ahyqj98npow` FOREIGN KEY (`sid`) REFERENCES `student_table` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fee_catagory_model`
--

LOCK TABLES `fee_catagory_model` WRITE;
/*!40000 ALTER TABLE `fee_catagory_model` DISABLE KEYS */;
INSERT INTO `fee_catagory_model` VALUES (8,'2500','Exam Fee','September','2025-09-16',1),(9,'500','Monthly','','2025-09-16',1),(10,'2500','Registration','September','2025-09-16',1),(11,'1200','Exam','November','2025-09-16',1);
/*!40000 ALTER TABLE `fee_catagory_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_data`
--

DROP TABLE IF EXISTS `image_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image_data` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `imagedata` longblob,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_data`
--

LOCK TABLES `image_data` WRITE;
/*!40000 ALTER TABLE `image_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `image_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice_table`
--

DROP TABLE IF EXISTS `notice_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice_table` (
  `nid` bigint NOT NULL AUTO_INCREMENT,
  `n_image` varchar(255) DEFAULT NULL,
  `n_short_discription` varchar(255) DEFAULT NULL,
  `nlong_discription` varchar(255) DEFAULT NULL,
  `ntitel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice_table`
--

LOCK TABLES `notice_table` WRITE;
/*!40000 ALTER TABLE `notice_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_tanle`
--

DROP TABLE IF EXISTS `payment_tanle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_tanle` (
  `pid` bigint NOT NULL AUTO_INCREMENT,
  `p_date` date DEFAULT NULL,
  `p_month` varchar(255) DEFAULT NULL,
  `p_roll` varchar(255) DEFAULT NULL,
  `pclass` varchar(255) DEFAULT NULL,
  `cid` bigint DEFAULT NULL,
  `sid` bigint DEFAULT NULL,
  `tid` int DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `FK5dyxqv6xav95ef9pb1viu25au` (`cid`),
  KEY `FKbmvwaqsa69ofi8sa02aa8mamq` (`sid`),
  KEY `FKt1uugin91mqll7hbfdgl2nel8` (`tid`),
  CONSTRAINT `FK5dyxqv6xav95ef9pb1viu25au` FOREIGN KEY (`cid`) REFERENCES `class_table` (`cid`),
  CONSTRAINT `FKbmvwaqsa69ofi8sa02aa8mamq` FOREIGN KEY (`sid`) REFERENCES `student_table` (`sid`),
  CONSTRAINT `FKt1uugin91mqll7hbfdgl2nel8` FOREIGN KEY (`tid`) REFERENCES `teacher_table` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_tanle`
--

LOCK TABLES `payment_tanle` WRITE;
/*!40000 ALTER TABLE `payment_tanle` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_tanle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result_sheet_table`
--

DROP TABLE IF EXISTS `result_sheet_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `result_sheet_table` (
  `rid` bigint NOT NULL AUTO_INCREMENT,
  `ravg` double NOT NULL,
  `rbangla` int NOT NULL,
  `renglish` int NOT NULL,
  `rexamcatagory` varchar(255) DEFAULT NULL,
  `rgpa` double NOT NULL,
  `rgrade` varchar(255) DEFAULT NULL,
  `rislam` int NOT NULL,
  `rmath` int NOT NULL,
  `rpass_fail` varchar(255) DEFAULT NULL,
  `rscince` int NOT NULL,
  `rsocial` int NOT NULL,
  `rtotalmark` int NOT NULL,
  `stid` bigint NOT NULL,
  `sid` bigint DEFAULT NULL,
  PRIMARY KEY (`rid`),
  KEY `FK96mk7blilmrnn2m2gtwp09l37` (`sid`),
  CONSTRAINT `FK96mk7blilmrnn2m2gtwp09l37` FOREIGN KEY (`sid`) REFERENCES `student_table` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result_sheet_table`
--

LOCK TABLES `result_sheet_table` WRITE;
/*!40000 ALTER TABLE `result_sheet_table` DISABLE KEYS */;
INSERT INTO `result_sheet_table` VALUES (1,77.5,65,75,'HElF_YEARLY',4,'A',74,88,'Pass',85,78,465,0,2);
/*!40000 ALTER TABLE `result_sheet_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_table`
--

DROP TABLE IF EXISTS `role_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_table` (
  `roleid` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_table`
--

LOCK TABLES `role_table` WRITE;
/*!40000 ALTER TABLE `role_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_table`
--

DROP TABLE IF EXISTS `student_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_table` (
  `sid` bigint NOT NULL AUTO_INCREMENT,
  `batch_id` varchar(255) DEFAULT NULL,
  `session` varchar(255) DEFAULT NULL,
  `st_class` varchar(255) DEFAULT NULL,
  `st_photo` varchar(255) DEFAULT NULL,
  `st_roll` varchar(255) DEFAULT NULL,
  `staddress` varchar(255) DEFAULT NULL,
  `stdob` varchar(255) DEFAULT NULL,
  `stemail` varchar(255) DEFAULT NULL,
  `stfathersname` varchar(255) DEFAULT NULL,
  `stfirstname` varchar(255) DEFAULT NULL,
  `stgender` varchar(255) DEFAULT NULL,
  `stlastname` varchar(255) DEFAULT NULL,
  `stmothersname` varchar(255) DEFAULT NULL,
  `stpassword` varchar(255) DEFAULT NULL,
  `stphone` varchar(255) DEFAULT NULL,
  `strole` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_table`
--

LOCK TABLES `student_table` WRITE;
/*!40000 ALTER TABLE `student_table` DISABLE KEYS */;
INSERT INTO `student_table` VALUES (1,'B','2024','7','','5','Agargaon','2025-09-22','dge@gmail.com','rtgtr','Atiqur','Male','Rahman','hty','1234','01683022109','3'),(2,'B','2025','8','','55','sonkor','2025-09-01','Reja@gmail.com','unknown','Reja','Male',' Karim','unknown','1234','147852369','3');
/*!40000 ALTER TABLE `student_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_table`
--

DROP TABLE IF EXISTS `subject_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_table` (
  `subid` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`subid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_table`
--

LOCK TABLES `subject_table` WRITE;
/*!40000 ALTER TABLE `subject_table` DISABLE KEYS */;
INSERT INTO `subject_table` VALUES (1,'bangla'),(2,'eng'),(3,'science');
/*!40000 ALTER TABLE `subject_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `syllabus_table`
--

DROP TABLE IF EXISTS `syllabus_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `syllabus_table` (
  `syid` bigint NOT NULL AUTO_INCREMENT,
  `discription` varchar(255) DEFAULT NULL,
  `exam_catagory` varchar(255) DEFAULT NULL,
  `page_no` varchar(255) DEFAULT NULL,
  `sclass` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  PRIMARY KEY (`syid`),
  UNIQUE KEY `UK_mbmaehi842nktp7lkco63xm2q` (`subject`),
  KEY `FKdfv71ufg44dwetrj1opq20mvk` (`subject_id`),
  CONSTRAINT `FKdfv71ufg44dwetrj1opq20mvk` FOREIGN KEY (`subject_id`) REFERENCES `subject_table` (`subid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `syllabus_table`
--

LOCK TABLES `syllabus_table` WRITE;
/*!40000 ALTER TABLE `syllabus_table` DISABLE KEYS */;
INSERT INTO `syllabus_table` VALUES (1,'All about the page','1st Mid','20-25','6',NULL,1),(2,'all about the page','2nd Mid','30-35','7',NULL,3);
/*!40000 ALTER TABLE `syllabus_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_table`
--

DROP TABLE IF EXISTS `teacher_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_table` (
  `tid` int NOT NULL AUTO_INCREMENT,
  `tcv` varchar(255) DEFAULT NULL,
  `tdesignation` varchar(255) DEFAULT NULL,
  `tdob` varchar(255) DEFAULT NULL,
  `temail` varchar(255) NOT NULL,
  `tfathersname` varchar(255) DEFAULT NULL,
  `tgender` varchar(255) DEFAULT NULL,
  `tjoining_date` varchar(255) DEFAULT NULL,
  `tmothersname` varchar(255) DEFAULT NULL,
  `tname` varchar(255) NOT NULL,
  `tpassword` varchar(255) NOT NULL,
  `tphone` varchar(255) DEFAULT NULL,
  `tphoto` varchar(255) DEFAULT NULL,
  `trole` varchar(255) DEFAULT NULL,
  `tsalary` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tid`),
  UNIQUE KEY `UK_qqk4eo2x7wns481rr6ncw19r8` (`temail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_table`
--

LOCK TABLES `teacher_table` WRITE;
/*!40000 ALTER TABLE `teacher_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_table_payment_model`
--

DROP TABLE IF EXISTS `teacher_table_payment_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_table_payment_model` (
  `teacher_info_table_tid` int NOT NULL,
  `payment_model_pid` bigint NOT NULL,
  UNIQUE KEY `UK_3fdhvbgnxsd8htrbllacu058c` (`payment_model_pid`),
  KEY `FKqlc3gi9klwo9abd0mklpxnw4l` (`teacher_info_table_tid`),
  CONSTRAINT `FKglxo33j6rh5v5hhmw58a2k2dq` FOREIGN KEY (`payment_model_pid`) REFERENCES `payment_tanle` (`pid`),
  CONSTRAINT `FKqlc3gi9klwo9abd0mklpxnw4l` FOREIGN KEY (`teacher_info_table_tid`) REFERENCES `teacher_table` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_table_payment_model`
--

LOCK TABLES `teacher_table_payment_model` WRITE;
/*!40000 ALTER TABLE `teacher_table_payment_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher_table_payment_model` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-16 18:59:30
