CREATE DATABASE  IF NOT EXISTS `fitnessdashboard` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fitnessdashboard`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: fitnessdashboard
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activities` (
  `activity_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `MET_value` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES (1,'Running','Outdoor running at moderate pace',9.80),(2,'Walking','Casual walking',3.50),(3,'Cycling','Stationary cycling, moderate effort',7.00),(4,'Yoga','Hatha yoga session',4.00),(5,'Strength Training','Weight lifting session',6.00),(6,'Swimming','Freestyle laps',8.00);
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ai_chat_conversations`
--

DROP TABLE IF EXISTS `ai_chat_conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ai_chat_conversations` (
  `conversation_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `message` text NOT NULL,
  `response` text,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`conversation_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `ai_chat_conversations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ai_chat_conversations`
--

LOCK TABLES `ai_chat_conversations` WRITE;
/*!40000 ALTER TABLE `ai_chat_conversations` DISABLE KEYS */;
INSERT INTO `ai_chat_conversations` VALUES (1,1,'How many calories did I burn today?','You burned approximately 450.25 kcal.','2025-03-31 07:47:59'),(2,1,'What’s my average sleep quality?','Your average sleep quality this week is Good.','2025-03-31 07:47:59');
/*!40000 ALTER TABLE `ai_chat_conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `body_composition`
--

DROP TABLE IF EXISTS `body_composition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `body_composition` (
  `composition_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `measurement_date` date NOT NULL,
  `body_fat_percentage` decimal(4,2) DEFAULT NULL,
  `muscle_mass_kg` decimal(5,2) DEFAULT NULL,
  `bone_density` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`composition_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `body_composition_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `body_composition`
--

LOCK TABLES `body_composition` WRITE;
/*!40000 ALTER TABLE `body_composition` DISABLE KEYS */;
INSERT INTO `body_composition` VALUES (1,1,'2025-03-24',18.50,28.20,1.20),(2,1,'2025-03-23',19.00,27.90,1.18),(3,4,'2025-03-24',17.80,27.50,1.18),(4,4,'2025-03-23',18.20,27.20,1.16),(5,4,'2025-03-24',17.80,27.50,1.18),(6,4,'2025-03-23',18.20,27.20,1.16),(7,4,'2025-03-24',17.80,27.50,1.18),(8,4,'2025-03-23',18.20,27.20,1.16);
/*!40000 ALTER TABLE `body_composition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diet_menu`
--

DROP TABLE IF EXISTS `diet_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diet_menu` (
  `diet_item_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `meal_type` enum('Breakfast','Lunch','Dinner','Snack') DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `calories` int DEFAULT NULL,
  `protein` int DEFAULT NULL,
  `fat` int DEFAULT NULL,
  `carbs` int DEFAULT NULL,
  `time` time DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`diet_item_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `diet_menu_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diet_menu`
--

LOCK TABLES `diet_menu` WRITE;
/*!40000 ALTER TABLE `diet_menu` DISABLE KEYS */;
INSERT INTO `diet_menu` VALUES (1,4,'Breakfast','Avocado salad','images/avocado.jpg',435,22,28,50,'10:00:00','Mash ripe avocados, mix with lime juice, salt, and pepper. Serve on whole grain toast or as a side with eggs.'),(2,4,'Breakfast','Blueberry','images/blueberry.jpg',98,2,4,18,'10:30:00','Rinse blueberries thoroughly. Enjoy fresh or mix into yogurt, oatmeal, or smoothies.'),(3,4,'Breakfast','Oatmeal with Nuts','images/oatmeal.jpg',310,15,12,40,'11:00:00','Cook rolled oats with water or milk. Stir in chopped nuts and cinnamon. Top with honey.'),(4,4,'Breakfast','Greek Yogurt','images/yogurt.jpg',150,20,5,8,'11:30:00','Spoon Greek yogurt into a bowl. Add fruits, honey, and granola for added texture and flavor.'),(5,4,'Breakfast','Avocado salad','images/avocado.jpg',435,22,28,50,'10:00:00',NULL),(6,4,'Breakfast','Blueberry','images/blueberry.jpg',98,2,4,18,'10:30:00',NULL),(7,4,'Breakfast','Oatmeal with Nuts','images/oatmeal.jpg',310,15,12,40,'11:00:00',NULL),(8,4,'Breakfast','Greek Yogurt','images/yogurt.jpg',150,20,5,8,'11:30:00',NULL);
/*!40000 ALTER TABLE `diet_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diet_plans`
--

DROP TABLE IF EXISTS `diet_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diet_plans` (
  `diet_plan_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `plan_name` varchar(100) NOT NULL,
  `description` text,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`diet_plan_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `diet_plans_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diet_plans`
--

LOCK TABLES `diet_plans` WRITE;
/*!40000 ALTER TABLE `diet_plans` DISABLE KEYS */;
INSERT INTO `diet_plans` VALUES (1,1,'Keto Plan','Low-carb high-fat diet','2025-03-01','2025-03-31'),(2,1,'Intermittent Fasting','16:8 fasting window','2025-03-10','2025-04-10'),(3,4,'Mediterranean Diet','Balanced diet with healthy fats','2025-03-01','2025-03-31'),(4,4,'High Protein Plan','Increased protein intake for muscle growth','2025-03-10','2025-04-10'),(5,4,'Mediterranean Diet','Balanced diet with healthy fats','2025-03-01','2025-03-31'),(6,4,'High Protein Plan','Increased protein intake for muscle growth','2025-03-10','2025-04-10'),(7,4,'Mediterranean Diet','Balanced diet with healthy fats','2025-03-01','2025-03-31'),(8,4,'High Protein Plan','Increased protein intake for muscle growth','2025-03-10','2025-04-10');
/*!40000 ALTER TABLE `diet_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goals`
--

DROP TABLE IF EXISTS `goals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goals` (
  `goal_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `target` varchar(50) DEFAULT NULL,
  `progress` int DEFAULT NULL,
  PRIMARY KEY (`goal_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `goals_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `goals_chk_1` CHECK ((`progress` between 0 and 100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goals`
--

LOCK TABLES `goals` WRITE;
/*!40000 ALTER TABLE `goals` DISABLE KEYS */;
/*!40000 ALTER TABLE `goals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monthly_progress`
--

DROP TABLE IF EXISTS `monthly_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monthly_progress` (
  `monthly_progress_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `month_year` date NOT NULL,
  `average_weight_kg` decimal(5,2) DEFAULT NULL,
  `average_body_fat_percentage` decimal(4,2) DEFAULT NULL,
  `total_steps` int DEFAULT NULL,
  `total_calories_burned` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`monthly_progress_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `monthly_progress_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monthly_progress`
--

LOCK TABLES `monthly_progress` WRITE;
/*!40000 ALTER TABLE `monthly_progress` DISABLE KEYS */;
INSERT INTO `monthly_progress` VALUES (1,1,'2025-03-01',70.80,18.70,150000,12000.50),(2,4,'2025-03-01',68.30,18.00,140000,11500.75),(3,4,'2025-03-01',68.30,18.00,140000,11500.75),(4,4,'2025-03-01',68.30,18.00,140000,11500.75);
/*!40000 ALTER TABLE `monthly_progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `notification_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`notification_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,1,'You have a new scheduled exercise today!',0,'2025-03-31 07:47:59'),(2,1,'Don’t forget to log your meals.',1,'2025-03-31 07:47:59'),(3,4,'Your workout plan has been updated',0,'2025-04-09 05:53:07'),(4,4,'Weekly progress report available',1,'2025-04-09 05:53:07');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommended_workouts`
--

DROP TABLE IF EXISTS `recommended_workouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recommended_workouts` (
  `workout_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `difficulty` int DEFAULT NULL,
  `likes` int DEFAULT NULL,
  `comments` int DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`workout_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `recommended_workouts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `recommended_workouts_chk_1` CHECK ((`difficulty` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommended_workouts`
--

LOCK TABLES `recommended_workouts` WRITE;
/*!40000 ALTER TABLE `recommended_workouts` DISABLE KEYS */;
INSERT INTO `recommended_workouts` VALUES (1,4,'Dumbbell Biceps','How to perform a proper dumbbell bicep curl:\n\n1. Stand upright with a dumbbell in each hand.\n2. Keep your elbows close to your torso and palms facing forward.\n3. Curl the weights while contracting your biceps.\n4. Pause briefly at the top, then lower slowly.\n5. Avoid swinging or using momentum.\n\nMaintain controlled movement and proper posture for best results.',2,25,104,'/images/dumbell.png'),(2,4,'Flex Biceps','Flex Biceps Technique:\n\n1. Stand tall with arms at your sides.\n2. Slowly raise your arms and flex your biceps tightly.\n3. Hold the flex for 3–5 seconds, focusing on peak contraction.\n4. Lower arms and repeat.\n5. Avoid jerking movements or shoulder strain.\n\nGreat for improving mind-muscle connection and bicep definition.',2,25,104,'/images/flex.png');
/*!40000 ALTER TABLE `recommended_workouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `running_sessions`
--

DROP TABLE IF EXISTS `running_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `running_sessions` (
  `session_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `session_date` date NOT NULL,
  `duration_minutes` int DEFAULT NULL,
  `distance_km` decimal(5,2) DEFAULT NULL,
  `average_pace_min_per_km` decimal(4,2) DEFAULT NULL,
  `calories_burned` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`session_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `running_sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `running_sessions`
--

LOCK TABLES `running_sessions` WRITE;
/*!40000 ALTER TABLE `running_sessions` DISABLE KEYS */;
INSERT INTO `running_sessions` VALUES (1,1,'2025-03-24',30,5.00,6.00,320.00),(2,1,'2025-03-22',45,7.50,6.00,470.00),(3,4,'2025-03-24',28,4.80,5.83,310.00),(4,4,'2025-03-22',42,7.20,5.83,450.00),(5,4,'2025-03-24',28,4.80,5.83,310.00),(6,4,'2025-03-22',42,7.20,5.83,450.00),(7,4,'2025-03-24',28,4.80,5.83,310.00),(8,4,'2025-03-22',42,7.20,5.83,450.00);
/*!40000 ALTER TABLE `running_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduled_exercises`
--

DROP TABLE IF EXISTS `scheduled_exercises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scheduled_exercises` (
  `schedule_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `exercise_name` varchar(100) NOT NULL,
  `scheduled_date` date NOT NULL,
  `scheduled_time` time DEFAULT NULL,
  `duration_minutes` int DEFAULT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `scheduled_exercises_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduled_exercises`
--

LOCK TABLES `scheduled_exercises` WRITE;
/*!40000 ALTER TABLE `scheduled_exercises` DISABLE KEYS */;
INSERT INTO `scheduled_exercises` VALUES (1,1,'Morning Yoga','2025-03-25','07:00:00',30),(2,1,'Evening Run','2025-03-25','18:30:00',45),(3,4,'Morning Yoga','2025-03-25','07:00:00',30),(4,4,'Yoga Class','2025-03-22','08:00:00',45),(5,4,'Swimming','2025-03-22','16:00:00',60),(6,4,'HIIT Session','2025-03-23','17:30:00',30),(7,4,'Meditation','2025-03-24','19:00:00',20),(8,4,'Morning Jog','2025-03-25','07:15:00',25),(9,4,'Evening Strength Training','2025-03-25','19:00:00',50),(10,4,'Morning Jog','2025-03-25','07:15:00',25),(11,4,'Evening Strength Training','2025-03-25','19:00:00',50),(12,4,'Morning Jog','2025-03-25','07:15:00',25),(13,4,'Evening Strength Training','2025-03-25','19:00:00',50);
/*!40000 ALTER TABLE `scheduled_exercises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sleep_logs`
--

DROP TABLE IF EXISTS `sleep_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sleep_logs` (
  `sleep_log_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `sleep_date` date NOT NULL,
  `sleep_start_time` time DEFAULT NULL,
  `sleep_end_time` time DEFAULT NULL,
  `duration_minutes` int DEFAULT NULL,
  `sleep_quality` enum('Poor','Fair','Good','Excellent') DEFAULT NULL,
  PRIMARY KEY (`sleep_log_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `sleep_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sleep_logs`
--

LOCK TABLES `sleep_logs` WRITE;
/*!40000 ALTER TABLE `sleep_logs` DISABLE KEYS */;
INSERT INTO `sleep_logs` VALUES (1,1,'2025-03-24','22:30:00','06:30:00',480,'Good'),(2,1,'2025-03-23','23:00:00','06:00:00',420,'Fair'),(3,4,'2025-03-24','22:45:00','06:15:00',450,'Good'),(4,4,'2025-03-23','23:15:00','06:00:00',405,'Fair'),(5,4,'2025-03-24','22:45:00','06:15:00',450,'Good'),(6,4,'2025-03-23','23:15:00','06:00:00',405,'Fair'),(7,4,'2025-03-24','22:45:00','06:15:00',450,'Good'),(8,4,'2025-03-23','23:15:00','06:00:00',405,'Fair');
/*!40000 ALTER TABLE `sleep_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_actions`
--

DROP TABLE IF EXISTS `user_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_actions` (
  `action_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `activity_id` int DEFAULT NULL,
  `action_date` date NOT NULL,
  `steps` int DEFAULT NULL,
  `calories_burned` decimal(6,2) DEFAULT NULL,
  `average_heart_rate` decimal(6,2) DEFAULT NULL,
  `water_intake_ml` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`action_id`),
  KEY `user_id` (`user_id`),
  KEY `activity_id` (`activity_id`),
  CONSTRAINT `user_actions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `user_actions_ibfk_2` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`activity_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_actions`
--

LOCK TABLES `user_actions` WRITE;
/*!40000 ALTER TABLE `user_actions` DISABLE KEYS */;
INSERT INTO `user_actions` VALUES (1,1,1,'2025-03-24',8000,450.25,120.50,750.00),(2,1,2,'2025-03-23',5000,250.75,98.30,600.00),(5,4,1,'2025-03-24',7500,420.50,115.75,800.00),(6,4,2,'2025-03-23',6000,300.25,102.40,700.00),(7,4,1,'2025-03-24',7500,420.50,115.75,800.00),(8,4,2,'2025-03-23',6000,300.25,102.40,700.00),(9,4,1,'2025-03-24',7500,420.50,115.75,800.00),(10,4,2,'2025-03-23',6000,300.25,102.40,700.00),(11,4,1,'2025-03-24',7500,420.50,115.75,800.00),(12,4,2,'2025-03-23',6000,300.25,102.40,700.00),(13,1,1,'2025-04-08',8000,450.25,120.50,750.00),(14,4,1,'2025-04-08',7500,420.50,115.75,800.00),(15,4,1,'2025-04-08',9000,420.50,115.75,800.00),(16,4,1,'2025-04-08',9000,420.50,115.75,800.00),(17,4,1,'2025-04-08',9000,420.50,115.75,800.00),(18,4,1,'2025-04-08',1111,1111.00,111.00,1000.00),(19,4,1,'2025-04-11',1000,1556.00,89.00,2000.00),(20,4,1,'2025-04-16',2000,1000.00,120.00,2000.00),(32,4,1,'2025-04-17',1000,1000.00,120.00,3000.00),(33,4,1,'2025-04-17',2024,1024.00,120.00,1000.00);
/*!40000 ALTER TABLE `user_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_progress`
--

DROP TABLE IF EXISTS `user_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_progress` (
  `progress_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `progress_date` date NOT NULL,
  `weight_kg` decimal(5,2) DEFAULT NULL,
  `body_fat_percentage` decimal(4,2) DEFAULT NULL,
  `muscle_mass_kg` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`progress_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_progress_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_progress`
--

LOCK TABLES `user_progress` WRITE;
/*!40000 ALTER TABLE `user_progress` DISABLE KEYS */;
INSERT INTO `user_progress` VALUES (1,1,'2025-03-24',70.50,18.50,28.20),(2,1,'2025-03-23',71.00,19.00,27.90),(3,4,'2025-03-24',68.20,17.80,27.50),(4,4,'2025-03-23',68.50,18.20,27.20),(5,4,'2025-03-24',68.20,17.80,27.50),(6,4,'2025-03-23',68.50,18.20,27.20),(7,4,'2025-03-24',68.20,17.80,27.50),(8,4,'2025-03-23',68.50,18.20,27.20),(9,4,'2025-03-24',68.20,17.80,27.50),(10,4,'2025-03-23',68.50,18.20,27.20),(11,4,'2025-04-07',70.00,18.50,30.00),(12,1,'2025-04-07',70.00,18.50,30.00),(13,4,'2025-04-07',70.00,NULL,NULL),(14,4,'2025-04-07',71.00,NULL,NULL);
/*!40000 ALTER TABLE `user_progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_settings`
--

DROP TABLE IF EXISTS `user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_settings` (
  `setting_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`setting_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_settings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_settings`
--

LOCK TABLES `user_settings` WRITE;
/*!40000 ALTER TABLE `user_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `height_cm` decimal(5,2) DEFAULT NULL,
  `weight_kg` decimal(5,2) DEFAULT NULL,
  `activity_level` enum('Sedentary','Lightly Active','Moderately Active','Very Active') DEFAULT NULL,
  `goal` enum('Lose Weight','Maintain Weight','Gain Weight') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'mike87','mike87@email.com','$2y$10$hashedpassword789...','Michael','Johnson','1987-09-22','Male',180.00,82.50,'Very Active','Gain Weight','2025-03-31 07:47:59'),(2,'sarah_b','sarah.b@email.com','$2y$10$hashedpassword101...','Sarah','Brown','1995-03-10','Female',170.20,65.00,'Lightly Active','Lose Weight','2025-03-31 07:47:59'),(3,'alex_n','alex.neutral@email.com','$2y$10$hashedpassword111...','Alex','Taylor','1992-11-30','Other',175.00,70.00,'Sedentary','Maintain Weight','2025-03-31 07:47:59'),(4,'testuser','test.user@email.com','$2a$12$bwn1wOlvu2GMRJBClxbzj.O3GZhviP415s5pScqUYpV.tNF5Cpzt2','Test','User','1990-01-01','Other',200.00,200.00,'Moderately Active','Maintain Weight','2025-03-31 07:47:59'),(5,'john_doe','john.doe@email.com','$2a$10$exampleHashValueHere','John','Doe','1990-05-15','Male',180.00,75.00,'Moderately Active','Lose Weight','2025-04-07 05:04:00'),(6,'johndoe2','johndo2e@example.com','$2b$10$fi/xQHg.Hhh.yDCc1tUXaedVzJWNMlpe.ECe2cnWMmhIOFrKzWkHK','John2','Doe2','1990-01-01','Male',175.00,70.00,'Sedentary','Lose Weight','2025-04-07 05:08:06'),(7,'testingignignign','test@email.com','$2b$10$TtbppCKBbXVduv7YKvpbk.ZOw1hqj0rD9J4Bl30q93qRlUjUk2LE6','testingaccount3','account','2016-06-09','Male',177.00,69.00,'Sedentary','Maintain Weight','2025-04-07 05:09:50'),(8,'adsadsd','iamgjraj@gmail.com','$2b$10$pYGTkQg7S1UMbcNk4b.9c.ED0CSGSWbU.tqZLcyV69/PUTbAOR.J2','Jairaj','Gogula','2000-02-02','Female',123.00,56.00,'Sedentary','Lose Weight','2025-04-12 02:15:24'),(9,'testin','test@gmail.com','$2b$10$5HPEJpNF.67wEuoXfYiS8uCnC2a5k25wIJxsnCH7fIx/2vFESe/Rm','Tstin','rja','2025-04-02','Male',167.00,76.00,'Lightly Active','Maintain Weight','2025-04-16 23:59:20');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weekly_activity`
--

DROP TABLE IF EXISTS `weekly_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weekly_activity` (
  `activity_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `day` enum('Mon','Tue','Wed','Thu','Fri','Sat','Sun') DEFAULT NULL,
  `value` int DEFAULT NULL,
  `calories` int DEFAULT NULL,
  `steps` int DEFAULT NULL,
  PRIMARY KEY (`activity_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `weekly_activity_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weekly_activity`
--

LOCK TABLES `weekly_activity` WRITE;
/*!40000 ALTER TABLE `weekly_activity` DISABLE KEYS */;
INSERT INTO `weekly_activity` VALUES (22,4,'Mon',66,41250,7500),(23,4,'Tue',67,51212,9200),(24,4,'Wed',70,48210,8300),(25,4,'Thu',65,430,7800),(26,4,'Fri',90,62120,11500),(27,4,'Sat',80,55120,9800),(28,4,'Sun',60,41210,6900);
/*!40000 ALTER TABLE `weekly_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workout_types`
--

DROP TABLE IF EXISTS `workout_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workout_types` (
  `workout_type_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `hours` int DEFAULT NULL,
  `color` varchar(7) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`workout_type_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `workout_types_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workout_types`
--

LOCK TABLES `workout_types` WRITE;
/*!40000 ALTER TABLE `workout_types` DISABLE KEYS */;
INSERT INTO `workout_types` VALUES (4,4,'Strength',20,'#8B5CF6','2025-04-08 22:08:14'),(6,4,'swimming',2,'#b12049','2025-04-08 22:08:14'),(8,4,'Swimming',4,'#11eee6','2025-04-09 02:36:03'),(9,4,'Cycling',3,'#82620d','2025-04-11 21:07:40'),(10,4,'Swimming',2,'#6772ca','2025-04-16 19:03:23');
/*!40000 ALTER TABLE `workout_types` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-18 21:22:34
