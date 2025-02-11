-- MySQL dump 10.13  Distrib 8.0.41, for macos15 (arm64)
--
-- Host: 127.0.0.1    Database: spacecinemaexport
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `booking`
--
DROP SCHEMA IF EXISTS spacecinema;
CREATE SCHEMA spacecinema;
Use SpaceCinema;
DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `showing_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `total_price` int DEFAULT NULL,
  `created_datetime` date DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `showing_id` (`showing_id`),
  KEY `user_id` (`user_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,1,1,1,150,'2025-01-15'),(2,2,2,2,200,'2025-01-15'),(3,3,3,3,300,'2025-01-15'),(4,4,1,4,100,'2025-01-15'),(5,5,2,5,120,'2025-01-15'),(6,6,3,6,250,'2025-01-15');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_seat`
--

DROP TABLE IF EXISTS `booking_seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_seat` (
  `booking_id` int DEFAULT NULL,
  `seat_id` int DEFAULT NULL,
  `seat_qty` int DEFAULT NULL,
  KEY `booking_id` (`booking_id`),
  KEY `seat_id` (`seat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_seat`
--

LOCK TABLES `booking_seat` WRITE;
/*!40000 ALTER TABLE `booking_seat` DISABLE KEYS */;
INSERT INTO `booking_seat` VALUES (1,1,2),(1,2,1),(2,3,3),(2,4,1),(3,5,2),(3,6,1);
/*!40000 ALTER TABLE `booking_seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_snack`
--

DROP TABLE IF EXISTS `booking_snack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_snack` (
  `booking_id` int DEFAULT NULL,
  `snack_id` int DEFAULT NULL,
  `snack_qty` int DEFAULT NULL,
  KEY `snack_id` (`snack_id`),
  KEY `booking_id` (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_snack`
--

LOCK TABLES `booking_snack` WRITE;
/*!40000 ALTER TABLE `booking_snack` DISABLE KEYS */;
INSERT INTO `booking_snack` VALUES (1,1,2),(1,3,1),(2,2,1),(2,4,2),(3,5,1),(4,6,2),(5,1,1),(6,2,3);
/*!40000 ALTER TABLE `booking_snack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_ticket`
--

DROP TABLE IF EXISTS `booking_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_ticket` (
  `ticket_type_id` int DEFAULT NULL,
  `booking_id` int DEFAULT NULL,
  `ticket_qty` int DEFAULT NULL,
  KEY `ticket_type_id` (`ticket_type_id`),
  KEY `booking_id` (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_ticket`
--

LOCK TABLES `booking_ticket` WRITE;
/*!40000 ALTER TABLE `booking_ticket` DISABLE KEYS */;
INSERT INTO `booking_ticket` VALUES (1,1,2),(2,1,1),(1,2,3),(3,3,2),(2,4,1),(1,5,2),(3,6,3);
/*!40000 ALTER TABLE `booking_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cast_member`
--

DROP TABLE IF EXISTS `cast_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cast_member` (
  `cast_id` int NOT NULL AUTO_INCREMENT,
  `cast_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`cast_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cast_member`
--

LOCK TABLES `cast_member` WRITE;
/*!40000 ALTER TABLE `cast_member` DISABLE KEYS */;
INSERT INTO `cast_member` VALUES (1,'Harrison Ford'),(2,'Leonardo DiCaprio'),(3,'Sam Worthington'),(4,'Uma Thurman'),(5,'Robert De Niro'),(6,'Rutger Hauer');
/*!40000 ALTER TABLE `cast_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema`
--

DROP TABLE IF EXISTS `cinema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinema` (
  `cinema_id` int NOT NULL AUTO_INCREMENT,
  `cinema_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cinema_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema`
--

LOCK TABLES `cinema` WRITE;
/*!40000 ALTER TABLE `cinema` DISABLE KEYS */;
INSERT INTO `cinema` VALUES (1,'SpaceCinema Đà Nẵng'),(2,'SpaceCinema Huế'),(3,'SpaceCinema Hà Nội'),(4,'SpaceCinema Hồ Chí Minh'),(5,'SpaceCinema Gia Lai'),(6,'SpaceCinema Đắk Lắk');
/*!40000 ALTER TABLE `cinema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'John Doe','123456789','john.doe@example.com','2025-01-17 21:17:18','2025-01-17 21:17:18','admin','admin'),(2,'Jane Smith','987654321','jane.smith@example.com','2025-01-17 21:17:18','2025-01-17 21:17:18','admin','admin'),(3,'Bob Johnson','555555555','bob.johnson@example.com','2025-01-17 21:17:18','2025-01-17 21:17:18','admin','admin'),(4,'Alice Williams','666666666','alice.williams@example.com','2025-01-17 21:17:18','2025-01-17 21:17:18','admin','admin'),(5,'Charlie Brown','777777777','charlie.brown@example.com','2025-01-17 21:17:18','2025-01-17 21:17:18','admin','admin'),(6,'David Jones','888888888','david.jones@example.com','2025-01-17 21:17:18','2025-01-17 21:17:18','admin','admin');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `director` (
  `director_id` int NOT NULL AUTO_INCREMENT,
  `director_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`director_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` VALUES (1,'Steven Spielberg'),(2,'Christopher Nolan'),(3,'James Cameron'),(4,'Quentin Tarantino'),(5,'Martin Scorsese'),(6,'Ridley Scott');
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feature`
--

DROP TABLE IF EXISTS `feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feature` (
  `feature_id` int NOT NULL AUTO_INCREMENT,
  `type_id` int DEFAULT NULL,
  `feature_name` varchar(200) DEFAULT NULL,
  `feature_description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`feature_id`),
  KEY `type_id` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feature`
--

LOCK TABLES `feature` WRITE;
/*!40000 ALTER TABLE `feature` DISABLE KEYS */;
INSERT INTO `feature` VALUES (1,1,'3D Experience','Enjoy the movie in 3D format with immersive visuals.'),(2,2,'IMAX','Watch the movie on an IMAX screen for a larger-than-life experience.'),(3,3,'Subtitles','English subtitles available for all movies.'),(4,4,'VIP Seating','Premium seating for a comfortable viewing experience.'),(5,5,'Dolby Atmos','Experience 3D sound technology with Dolby Atmos.'),(6,6,'Standard','Regular screening without any special features.');
/*!40000 ALTER TABLE `feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feature_type`
--

DROP TABLE IF EXISTS `feature_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feature_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feature_type`
--

LOCK TABLES `feature_type` WRITE;
/*!40000 ALTER TABLE `feature_type` DISABLE KEYS */;
INSERT INTO `feature_type` VALUES (1,'3D'),(2,'IMAX'),(3,'Subtitles'),(4,'VIP'),(5,'Dolby Atmos'),(6,'Standard');
/*!40000 ALTER TABLE `feature_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `genre_id` int NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Action'),(2,'Adventure'),(3,'Sci-Fi'),(4,'Drama'),(5,'Thriller'),(6,'Comedy');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `movie_id` int NOT NULL AUTO_INCREMENT,
  `director_id` int DEFAULT NULL,
  `title` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `age_rating` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `runtime_min` int DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `trailer_link` varchar(1000) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `banner_text` varchar(1000) DEFAULT NULL,
  `header_image` varchar(1000) DEFAULT NULL,
  `poster_image` varchar(1000) DEFAULT NULL,
  `synopsis` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`movie_id`),
  KEY `director_id` (`director_id`),
  KEY `status_id` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,1,'Jurassic Park',1,'PG-13',127,'1993-06-11','https://www.youtube.com/watch?v=Y2Z6JgjEkkM','Dinosaur theme park goes wrong.','Experience the thrill','https://images.hdqwalls.com/download/jurassic-world-fallen-kingdom-movie-sj-1024x768.jpg','http://link.com/poster1.jpg','A theme park featuring cloned dinosaurs leads to disaster.'),(2,2,'Inception',1,'PG-13',148,'2010-07-16','https://www.youtube.com/watch?v=1KX_rcFoXZ0','Mind-bending heist involving dreams.','Dreams within dreams','https://images.hdqwalls.com/download/kakashi-unbreakable-spirit-st-1024x768.jpg','http://link.com/poster2.jpg','A thief who enters the dreams of others to steal secrets is given a chance to have his criminal record erased.'),(3,3,'Avatar',2,'PG-13',162,'2009-12-18','https://www.youtube.com/watch?v=_X1EPM8QAgU','The fight for Pandora.','A new world awaits','https://images.hdqwalls.com/download/fiery-dragon-slayer-natsu-dragneel-28-1024x768.jpg','http://link.com/poster3.jpg','A paraplegic marine dispatched to the moon Pandora on a unique mission becomes torn between following his orders and protecting the world he feels is his home.'),(4,4,'Pulp Fiction',1,'R',154,'1994-10-14','https://www.youtube.com/watch?v=q1bQ2LOUh6s','Interwoven stories of crime and redemption.','Classic Tarantino','https://images.hdqwalls.com/download/fly-high-goku-x-akira-toriyama-1z-1024x768.jpg','http://link.com/poster4.jpg','The lives of two mob hitmen, a boxer, a gangster’s wife, and a pair of diner bandits intertwine in four tales of violence and redemption.'),(5,5,'Goodfellas',1,'R',146,'1990-09-19','https://www.youtube.com/watch?v=MLo3HlqemoQ','Rise and fall of a mobster.','An offer you can’t refuse','https://images.hdqwalls.com/download/assassins-creed-shadows-2025-ye-1024x768.jpg','http://link.com/poster5.jpg','The story of Henry Hill and his life in the mob, covering his relationship with his wife Karen and his mob partners.'),(6,6,'Blade Runner',3,'R',117,'1982-06-25','https://www.youtube.com/watch?v=9F9vb-nA0lE','Replicants and humans clash.','What does it mean to be human?','https://images.hdqwalls.com/download/assassins-creed-shadows-2024-game-tm-1024x768.jpg','http://link.com/poster6.jpg','A blade runner must pursue and terminate four replicants who stole a ship in space and have returned to Earth to find their creator.');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_cast`
--

DROP TABLE IF EXISTS `movie_cast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_cast` (
  `movie_id` int DEFAULT NULL,
  `cast_id` int DEFAULT NULL,
  KEY `movie_id` (`movie_id`),
  KEY `cast_id` (`cast_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_cast`
--

LOCK TABLES `movie_cast` WRITE;
/*!40000 ALTER TABLE `movie_cast` DISABLE KEYS */;
INSERT INTO `movie_cast` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6);
/*!40000 ALTER TABLE `movie_cast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_genre`
--

DROP TABLE IF EXISTS `movie_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_genre` (
  `movie_id` int DEFAULT NULL,
  `genre_id` int DEFAULT NULL,
  KEY `movie_id` (`movie_id`),
  KEY `genre_id` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_genre`
--

LOCK TABLES `movie_genre` WRITE;
/*!40000 ALTER TABLE `movie_genre` DISABLE KEYS */;
INSERT INTO `movie_genre` VALUES (1,1),(2,1),(3,3),(4,4),(5,4),(6,3);
/*!40000 ALTER TABLE `movie_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_status`
--

DROP TABLE IF EXISTS `movie_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_status` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `status_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_status`
--

LOCK TABLES `movie_status` WRITE;
/*!40000 ALTER TABLE `movie_status` DISABLE KEYS */;
INSERT INTO `movie_status` VALUES (1,'Now Showing'),(2,'Coming Soon'),(3,'Archived');
/*!40000 ALTER TABLE `movie_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin','ADMIN',NULL,NULL,NULL,NULL),(2,'User','USER',NULL,NULL,NULL,NULL),(3,'Manager','MANAGER',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat` (
  `seat_id` int NOT NULL AUTO_INCREMENT,
  `seat_type_id` int DEFAULT NULL,
  `theatre_id` int DEFAULT NULL,
  `seat_location` varchar(5) DEFAULT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`seat_id`),
  KEY `seat_type_id` (`seat_type_id`),
  KEY `theatre_id` (`theatre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (1,1,1,'A1',30),(2,2,2,'B2',40),(3,3,3,'C3',30),(4,4,4,'D4',40),(5,5,5,'E5',35),(6,6,6,'F6',45);
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat_type`
--

DROP TABLE IF EXISTS `seat_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat_type`
--

LOCK TABLES `seat_type` WRITE;
/*!40000 ALTER TABLE `seat_type` DISABLE KEYS */;
INSERT INTO `seat_type` VALUES (1,'Regular'),(2,'VIP'),(3,'Couple'),(4,'Premium'),(5,'Standard'),(6,'Accessible');
/*!40000 ALTER TABLE `seat_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `showing_feature`
--

DROP TABLE IF EXISTS `showing_feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `showing_feature` (
  `showing_id` int DEFAULT NULL,
  `feature_id` int DEFAULT NULL,
  KEY `showing_id` (`showing_id`),
  KEY `feature_id` (`feature_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `showing_feature`
--

LOCK TABLES `showing_feature` WRITE;
/*!40000 ALTER TABLE `showing_feature` DISABLE KEYS */;
INSERT INTO `showing_feature` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6);
/*!40000 ALTER TABLE `showing_feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `showing_time`
--

DROP TABLE IF EXISTS `showing_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `showing_time` (
  `time_id` int NOT NULL AUTO_INCREMENT,
  `theatre_id` int DEFAULT NULL,
  `movie_id` int DEFAULT NULL,
  `showing_datetime` date DEFAULT NULL,
  PRIMARY KEY (`time_id`),
  KEY `theatre_id` (`theatre_id`),
  KEY `movie_id` (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `showing_time`
--

LOCK TABLES `showing_time` WRITE;
/*!40000 ALTER TABLE `showing_time` DISABLE KEYS */;
INSERT INTO `showing_time` VALUES (1,1,1,'2025-01-20'),(2,2,2,'2025-01-21'),(3,3,3,'2025-01-22'),(4,4,4,'2025-01-23'),(5,5,5,'2025-01-24'),(6,6,6,'2025-01-25'),(7,1,2,'2025-01-23'),(8,1,1,'2025-02-25');
/*!40000 ALTER TABLE `showing_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snack`
--

DROP TABLE IF EXISTS `snack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `snack` (
  `snack_id` int NOT NULL AUTO_INCREMENT,
  `snack_type_id` int DEFAULT NULL,
  `snack_name` varchar(50) DEFAULT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`snack_id`),
  KEY `snack_type_id` (`snack_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snack`
--

LOCK TABLES `snack` WRITE;
/*!40000 ALTER TABLE `snack` DISABLE KEYS */;
INSERT INTO `snack` VALUES (1,1,'Salted Popcorn',30),(2,1,'Caramel Popcorn',35),(3,2,'Coke',20),(4,2,'Pepsi',20),(5,3,'Chocolate Bar',25),(6,3,'Gummy Bears',15);
/*!40000 ALTER TABLE `snack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snack_type`
--

DROP TABLE IF EXISTS `snack_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `snack_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snack_type`
--

LOCK TABLES `snack_type` WRITE;
/*!40000 ALTER TABLE `snack_type` DISABLE KEYS */;
INSERT INTO `snack_type` VALUES (1,'Popcorn'),(2,'Drinks'),(3,'Candy');
/*!40000 ALTER TABLE `snack_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theatre`
--

DROP TABLE IF EXISTS `theatre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theatre` (
  `theatre_id` int NOT NULL AUTO_INCREMENT,
  `cinema_id` int DEFAULT NULL,
  `theatre_num` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`theatre_id`),
  KEY `cinema_id` (`cinema_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theatre`
--

LOCK TABLES `theatre` WRITE;
/*!40000 ALTER TABLE `theatre` DISABLE KEYS */;
INSERT INTO `theatre` VALUES (1,1,'A1'),(2,2,'B2'),(3,3,'C3'),(4,4,'D4'),(5,5,'E5'),(6,6,'F6');
/*!40000 ALTER TABLE `theatre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_type`
--

DROP TABLE IF EXISTS `ticket_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `ticket_type_name` varchar(50) DEFAULT NULL,
  `ticket_price` int DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_type`
--

LOCK TABLES `ticket_type` WRITE;
/*!40000 ALTER TABLE `ticket_type` DISABLE KEYS */;
INSERT INTO `ticket_type` VALUES (1,'Standard',50),(2,'VIP',80),(3,'Couple',100);
/*!40000 ALTER TABLE `ticket_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_detail`
--

DROP TABLE IF EXISTS `time_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_detail` (
  `time_detail_id` int NOT NULL AUTO_INCREMENT,
  `showing_time_id` int DEFAULT NULL,
  `timedetail` time NOT NULL,
  PRIMARY KEY (`time_detail_id`),
  KEY `showing_time_id` (`showing_time_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_detail`
--

LOCK TABLES `time_detail` WRITE;
/*!40000 ALTER TABLE `time_detail` DISABLE KEYS */;
INSERT INTO `time_detail` VALUES (1,1,'10:30:00'),(2,1,'12:30:00'),(3,1,'15:00:00'),(4,1,'18:00:00');
/*!40000 ALTER TABLE `time_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` int NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'john_doe','password123','John Doe','123456789','john.doe@example.com',1,'2025-01-17 21:17:18','2025-01-17 21:17:18','admin','admin'),(2,'jane_smith','password456','Jane Smith','987654321','jane.smith@example.com',0,'2025-01-17 21:17:18','2025-01-17 21:17:18','admin','admin'),(3,'bob_johnson','password789','Bob Johnson','555555555','bob.johnson@example.com',1,'2025-01-17 21:17:18','2025-01-17 21:17:18','admin','admin'),(4,'alice_williams','password101','Alice Williams','666666666','alice.williams@example.com',1,'2025-01-17 21:17:18','2025-01-17 21:17:18','admin','admin'),(5,'charlie_brown','password202','Charlie Brown','777777777','charlie.brown@example.com',1,'2025-01-17 21:17:18','2025-01-17 21:17:18','admin','admin'),(6,'david_jones','password303','David Jones','888888888','david.jones@example.com',1,'2025-01-17 21:17:18','2025-01-17 21:17:18','admin','admin'),(13,'giabao362004','123','Le Bao','0914099834','giabao362004@gmail.com',1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_role_id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL,
  `user_id` int NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_role_id`),
  KEY `fk_user_role` (`user_id`),
  KEY `fk_role_user` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1,1,NULL,NULL,NULL,NULL),(2,1,2,NULL,NULL,NULL,NULL),(3,1,3,NULL,NULL,NULL,NULL),(4,2,4,NULL,NULL,NULL,NULL),(5,2,5,NULL,NULL,NULL,NULL),(6,2,6,NULL,NULL,NULL,NULL),(10,2,13,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_voucher`
--

DROP TABLE IF EXISTS `user_voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_voucher` (
  `user_voucher_id` int NOT NULL AUTO_INCREMENT,
  `voucher_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`user_voucher_id`),
  KEY `user_id` (`user_id`),
  KEY `voucher_id` (`voucher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_voucher`
--

LOCK TABLES `user_voucher` WRITE;
/*!40000 ALTER TABLE `user_voucher` DISABLE KEYS */;
INSERT INTO `user_voucher` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6);
/*!40000 ALTER TABLE `user_voucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher`
--

DROP TABLE IF EXISTS `voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voucher` (
  `voucher_id` int NOT NULL AUTO_INCREMENT,
  `voucher_name` varchar(100) DEFAULT NULL,
  `description` varchar(350) DEFAULT NULL,
  `discount` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`voucher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher`
--

LOCK TABLES `voucher` WRITE;
/*!40000 ALTER TABLE `voucher` DISABLE KEYS */;
INSERT INTO `voucher` VALUES (1,'New Year Sale','10% off for New Year',10),(2,'Christmas Special','20% off for Christmas',20),(3,'Summer Offer','15% off for Summer',15),(4,'Birthday Discount','25% off for Birthday',25),(5,'Weekend Sale','30% off for Weekend',30),(6,'Loyalty Reward','50% off for Loyalty',50);
/*!40000 ALTER TABLE `voucher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-09 17:26:19
