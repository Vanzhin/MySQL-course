-- MariaDB dump 10.17  Distrib 10.4.15-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_20
-- ------------------------------------------------------
-- Server version	10.4.15-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `approved_tests`
--

DROP TABLE IF EXISTS `approved_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approved_tests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primer_id` int(10) unsigned NOT NULL,
  `primer_dft` tinyint(4) DEFAULT NULL,
  `midcoat_id` int(10) unsigned DEFAULT NULL,
  `midcoat_dft` tinyint(4) DEFAULT NULL,
  `topcoat_id` int(10) unsigned DEFAULT NULL,
  `topcoat_dft` tinyint(4) DEFAULT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issued_at` date DEFAULT NULL,
  `expires_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filename` (`filename`),
  KEY `primer_id` (`primer_id`),
  KEY `midcoat_id` (`midcoat_id`),
  KEY `topcoat_id` (`topcoat_id`),
  CONSTRAINT `approved_tests_ibfk_1` FOREIGN KEY (`primer_id`) REFERENCES `products` (`id`),
  CONSTRAINT `approved_tests_ibfk_2` FOREIGN KEY (`midcoat_id`) REFERENCES `products` (`id`),
  CONSTRAINT `approved_tests_ibfk_3` FOREIGN KEY (`topcoat_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='сертификаты истытаний систем покрытий';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approved_tests`
--

LOCK TABLES `approved_tests` WRITE;
/*!40000 ALTER TABLE `approved_tests` DISABLE KEYS */;
INSERT INTO `approved_tests` VALUES (1,'Osinski, Block and Howe',1,127,1,127,1,127,'Omnis unde iusto porro et itaque voluptate. Ducimus velit soluta fugiat enim. Iure nulla non nulla atque non. Impedit porro accusamus deserunt soluta a a adipisci aut.','application/xml','2017-11-01','2016-03-07'),(2,'Bernier, Luettgen and Kuvalis',2,50,2,127,2,70,'Excepturi sint dolore inventore. Accusamus harum temporibus quae ut nesciunt. Fugiat esse quia provident voluptatem.','application/vnd.openxmlformats-officedocument.spreadsheetml.template','1985-12-15','2011-11-21'),(3,'Simonis-Mann',3,66,3,127,3,127,'Et qui ut quia magnam sapiente. Et nesciunt ab quo iste quae voluptatem. Eius commodi molestiae ut neque.','application/octet-stream','1986-03-16','2020-06-24'),(4,'Murray, Harber and Roberts',4,43,4,127,4,58,'Qui consectetur repellendus quae quasi quas. Quaerat mollitia non iure ut. Porro sed est cumque est.','image/x-icon','2019-02-28','2020-11-22'),(5,'Weimann LLC',5,46,5,127,5,101,'Reiciendis ipsa assumenda rerum labore nulla et ipsam dignissimos. Optio totam et in eveniet porro excepturi et laudantium. Fugit adipisci ipsam eligendi autem quia. Rerum tempore omnis sint quia harum et distinctio.','application/vnd.kde.kword','2008-05-23','2020-08-30'),(6,'Monahan, Bernhard and Jerde',6,50,6,127,6,72,'Perspiciatis eum iste incidunt reiciendis qui. Quia qui repellat voluptatem occaecati itaque qui incidunt.','application/vnd.openxmlformats-officedocument.presentationml.slideshow','1995-05-22','2019-11-07'),(7,'Feil, Anderson and Eichmann',7,43,7,127,7,56,'Dolores dolorem neque iste mollitia nam. Saepe iste quia accusamus quisquam. Asperiores vel possimus est assumenda corporis dolor neque consectetur.','application/winhlp','1977-10-13','2013-05-25'),(8,'Kub, Bins and Koelpin',8,38,8,87,8,47,'Et minima accusantium sapiente dolores. Odit et eos quo et. Alias et velit quam consectetur enim. Sit rerum aut voluptas tenetur explicabo ab est corrupti.','application/x-director','2005-09-30','2020-07-24'),(9,'Cartwright, Williamson and Pacocha',9,105,9,127,9,118,'In et natus in quia nihil in ullam. In aut qui aperiam ea. Est voluptatem in non quia nulla. Incidunt veniam vero id sapiente recusandae dolorum nisi.','application/x-gtar','1985-08-01','2021-01-12'),(10,'Rath, Lockman and O\'Conner',10,94,10,127,10,48,'Eligendi sunt necessitatibus quod aperiam. Illum molestiae veritatis voluptas perferendis earum. Qui nostrum tenetur quos et et earum cum. Aut deserunt et consequuntur sint.','image/vnd.wap.wbmp','2006-01-20','2013-12-02');
/*!40000 ALTER TABLE `approved_tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `binders`
--

DROP TABLE IF EXISTS `binders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `binders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('epoxy','polyurethane','ESI','phenolic') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='смолы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `binders`
--

LOCK TABLES `binders` WRITE;
/*!40000 ALTER TABLE `binders` DISABLE KEYS */;
INSERT INTO `binders` VALUES (1,'epoxy'),(2,'polyurethane'),(4,'ESI'),(3,'phenolic');
/*!40000 ALTER TABLE `binders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coat_seq`
--

DROP TABLE IF EXISTS `coat_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coat_seq` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sequence` enum('primer','midcoat','topcoat') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_seq` (`sequence`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='очередность покрытия в системе';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coat_seq`
--

LOCK TABLES `coat_seq` WRITE;
/*!40000 ALTER TABLE `coat_seq` DISABLE KEYS */;
INSERT INTO `coat_seq` VALUES (1,'primer'),(2,'midcoat'),(3,'topcoat');
/*!40000 ALTER TABLE `coat_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractors`
--

DROP TABLE IF EXISTS `contractors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contractors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='подрядчики';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractors`
--

LOCK TABLES `contractors` WRITE;
/*!40000 ALTER TABLE `contractors` DISABLE KEYS */;
INSERT INTO `contractors` VALUES (1,'Lehner, Schroeder and Zieme'),(2,'Renner-Kris'),(3,'McClure LLC'),(4,'Walker-Bins'),(5,'Marvin-Ritchie'),(6,'Brekke-Gerlach'),(7,'Pouros-Corkery'),(8,'Ratke PLC'),(9,'Labadie PLC'),(10,'West PLC');
/*!40000 ALTER TABLE `contractors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='заказчики';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Fundamental leadingedge openarchitecture'),(2,'Open-architected value-added core'),(3,'Universal transitional policy'),(4,'Cloned full-range standardization'),(5,'Ameliorated client-server installation'),(6,'Inverse contextually-based extranet'),(7,'Mandatory fresh-thinking processimprovement'),(8,'Business-focused secondary software'),(9,'Fully-configurable background groupware'),(10,'Open-architected system-worthy database');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_data`
--

DROP TABLE IF EXISTS `main_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_data` (
  `product_id` int(10) unsigned NOT NULL,
  `binder_id` int(10) unsigned NOT NULL,
  `volume_solid` tinyint(3) unsigned DEFAULT NULL,
  `standard_dft` int(10) unsigned DEFAULT NULL,
  `dry_to_touch` decimal(3,1) unsigned DEFAULT NULL,
  `seq_id` int(10) unsigned NOT NULL,
  `tolerance` bit(1) DEFAULT b'0',
  UNIQUE KEY `product_id` (`product_id`),
  KEY `binder_id` (`binder_id`),
  KEY `seq_id` (`seq_id`),
  CONSTRAINT `main_data_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `main_data_ibfk_2` FOREIGN KEY (`binder_id`) REFERENCES `binders` (`id`),
  CONSTRAINT `main_data_ibfk_3` FOREIGN KEY (`seq_id`) REFERENCES `coat_seq` (`id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`volume_solid` <= 100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='основные технические данные';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_data`
--

LOCK TABLES `main_data` WRITE;
/*!40000 ALTER TABLE `main_data` DISABLE KEYS */;
INSERT INTO `main_data` VALUES (1,1,100,165,3.0,1,'\0'),(2,2,34,224,4.0,2,''),(3,3,87,254,3.0,3,'\0'),(4,4,53,132,6.0,1,''),(5,1,66,168,5.0,2,''),(6,2,83,156,1.0,3,'\0'),(7,3,65,113,6.0,1,'\0'),(8,4,62,207,6.0,2,'\0'),(9,1,33,114,6.0,3,'\0'),(10,2,39,71,5.0,1,'\0');
/*!40000 ALTER TABLE `main_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pds`
--

DROP TABLE IF EXISTS `pds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pds` (
  `product_id` int(10) unsigned NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `product_id` (`product_id`),
  CONSTRAINT `pds_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='технические данные';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pds`
--

LOCK TABLES `pds` WRITE;
/*!40000 ALTER TABLE `pds` DISABLE KEYS */;
INSERT INTO `pds` VALUES (1,'http://lorempixel.com/600/400/city/','2015-01-10 00:10:39',NULL),(2,'http://lorempixel.com/600/400/city/','2018-02-11 19:57:31',NULL),(3,'http://lorempixel.com/600/400/city/','2017-09-22 12:16:27',NULL),(4,'http://lorempixel.com/600/400/city/','2018-09-23 17:37:42',NULL),(5,'http://lorempixel.com/600/400/city/','2021-08-03 12:08:56',NULL),(6,'http://lorempixel.com/600/400/city/','2016-02-19 07:09:50',NULL),(7,'http://lorempixel.com/600/400/city/','2018-11-17 16:33:52',NULL),(8,'http://lorempixel.com/600/400/city/','2020-12-22 03:42:44',NULL),(9,'http://lorempixel.com/600/400/city/','2018-09-16 17:09:03',NULL),(10,'http://lorempixel.com/600/400/city/','2017-08-14 15:32:50',NULL);
/*!40000 ALTER TABLE `pds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='материалы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'\"AMERCOAT 408\"'),(2,'\"AMERCOAT 082\"'),(3,'\"AMERCOAT 004\"'),(4,'\"AMERCOAT 029\"'),(5,'\"AMERCOAT 655\"'),(6,'\"AMERCOAT 333\"'),(7,'\"AMERCOAT 549\"'),(8,'\"AMERCOAT 843\"'),(9,'\"AMERCOAT 932\"'),(10,'\"AMERCOAT 718\"');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `contractor_id` int(10) unsigned DEFAULT NULL,
  `primer_id` int(10) unsigned NOT NULL,
  `primer_dft` tinyint(4) DEFAULT NULL,
  `midcoat_id` int(10) unsigned DEFAULT NULL,
  `midcoat_dft` tinyint(4) DEFAULT NULL,
  `topcoat_id` int(10) unsigned DEFAULT NULL,
  `topcoat_dft` tinyint(4) DEFAULT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `started_at` date DEFAULT NULL,
  `finished_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `contractor_id` (`contractor_id`),
  KEY `primer_id` (`primer_id`),
  KEY `midcoat_id` (`midcoat_id`),
  KEY `topcoat_id` (`topcoat_id`),
  CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `projects_ibfk_2` FOREIGN KEY (`contractor_id`) REFERENCES `contractors` (`id`),
  CONSTRAINT `projects_ibfk_3` FOREIGN KEY (`primer_id`) REFERENCES `products` (`id`),
  CONSTRAINT `projects_ibfk_4` FOREIGN KEY (`midcoat_id`) REFERENCES `products` (`id`),
  CONSTRAINT `projects_ibfk_5` FOREIGN KEY (`topcoat_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='проекты';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'Kuhic, Cummerata and Rutherford',1,1,1,67,1,127,1,80,NULL,'2014-04-19','2021-08-27'),(2,'Koch LLC',2,2,2,127,2,127,2,55,NULL,'2021-05-27','2021-08-19'),(3,'Crooks-Wehner',3,3,3,118,3,127,3,59,NULL,'2018-09-13','2021-08-25'),(4,'Hackett and Sons',4,4,4,109,4,100,4,98,NULL,'2015-06-26','2021-08-23'),(5,'Erdman, Quigley and Thiel',5,5,5,110,5,107,5,70,NULL,'2018-05-26','2021-08-31'),(6,'Jacobs-Keeling',6,6,6,123,6,127,6,76,NULL,'2017-12-29','2021-09-01'),(7,'Streich, McDermott and Heller',7,7,7,127,7,118,7,94,NULL,'2015-07-28','2021-08-23'),(8,'Huel, Wintheiser and Fahey',8,8,8,89,8,127,8,90,NULL,'2019-07-14','2021-08-09'),(9,'Kuvalis-Lindgren',9,9,9,97,9,127,9,51,NULL,'2016-10-20','2021-08-05'),(10,'Maggio-Hickle',10,10,10,51,10,127,10,66,NULL,'2018-01-09','2021-08-13');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_id` int(10) unsigned NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tsr_id` int(10) unsigned NOT NULL,
  `started_at` date DEFAULT NULL,
  `finished_at` date DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `tsr_id` (`tsr_id`),
  CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `reports_ibfk_2` FOREIGN KEY (`tsr_id`) REFERENCES `tsr` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='отчеты инспекций';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` VALUES (1,'Parisianport',1,'xm',1,'2015-03-06','2021-08-06','2021-09-02 16:16:57',NULL),(2,'Lake Ramon',2,'3gp',2,'2014-01-02','2021-08-26','2021-09-02 16:16:57',NULL),(3,'Lake Jerad',3,'dpg',3,'2015-01-02','2021-08-26','2021-09-02 16:16:57',NULL),(4,'Michaelashire',4,'psd',4,'2019-03-15','2021-08-13','2021-09-02 16:16:57',NULL),(5,'North Alanashire',5,'ogv',5,'2021-03-17','2021-08-13','2021-09-02 16:16:57',NULL),(6,'Port Cathryn',6,'m2v',6,'2016-10-30','2021-08-21','2021-09-02 16:16:57',NULL),(7,'Denesikchester',7,'rip',7,'2012-05-04','2021-08-17','2021-09-02 16:16:57',NULL),(8,'Lake Nickolasberg',8,'java',8,'2012-02-18','2021-08-16','2021-09-02 16:16:57',NULL),(9,'Heleneburgh',9,'lha',9,'2011-10-26','2021-08-28','2021-09-02 16:16:57',NULL),(10,'Anastasiaborough',10,'knp',10,'2019-12-01','2021-08-05','2021-09-02 16:16:57',NULL);
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sds`
--

DROP TABLE IF EXISTS `sds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sds` (
  `product_id` int(10) unsigned NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `product_id` (`product_id`),
  CONSTRAINT `sds_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='паспорт безопасности';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sds`
--

LOCK TABLES `sds` WRITE;
/*!40000 ALTER TABLE `sds` DISABLE KEYS */;
INSERT INTO `sds` VALUES (1,'http://lorempixel.com/600/400/technics/','2013-08-26 09:17:33',NULL),(2,'http://lorempixel.com/600/400/technics/','2021-02-24 14:59:13',NULL),(3,'http://lorempixel.com/600/400/technics/','2017-03-18 10:11:16',NULL),(4,'http://lorempixel.com/600/400/technics/','2014-09-04 21:12:38',NULL),(5,'http://lorempixel.com/600/400/technics/','2015-08-04 06:00:24',NULL),(6,'http://lorempixel.com/600/400/technics/','2020-04-15 07:33:09',NULL),(7,'http://lorempixel.com/600/400/technics/','2019-03-24 13:44:40',NULL),(8,'http://lorempixel.com/600/400/technics/','2011-12-02 15:37:22',NULL),(9,'http://lorempixel.com/600/400/technics/','2021-05-07 22:47:05',NULL),(10,'http://lorempixel.com/600/400/technics/','2019-10-02 02:51:54',NULL);
/*!40000 ALTER TABLE `sds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tsr`
--

DROP TABLE IF EXISTS `tsr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tsr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='технические специалисты';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tsr`
--

LOCK TABLES `tsr` WRITE;
/*!40000 ALTER TABLE `tsr` DISABLE KEYS */;
INSERT INTO `tsr` VALUES (1,'Darby','Simonis'),(2,'Jazmin','Fay'),(3,'Emie','Borer'),(4,'Ellen','Bergstrom'),(5,'Bell','Stiedemann'),(6,'Cynthia','McClure'),(7,'Emanuel','Jones'),(8,'Dulce','Kessler'),(9,'Einar','Bruen'),(10,'Effie','Smith');
/*!40000 ALTER TABLE `tsr` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-02 16:17:29
