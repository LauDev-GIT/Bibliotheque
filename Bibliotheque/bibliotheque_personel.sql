-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bibliotheque_personel
-- ------------------------------------------------------
-- Server version	9.0.0

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
 


-- ----------------------------------------------------------------------------------
-- CREATION DE LA DATABASE
--
DROP DATABASE bibliotheque_personel;
CREATE DATABASE bibliotheque_personel;
USE bibliotheque_personel;



--
-- Table structure for table `Belong`
--

DROP TABLE IF EXISTS `Belong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Belong` (
  `Book_id` int NOT NULL,
  `Type_id` int NOT NULL,
  PRIMARY KEY (`Book_id`,`Type_id`),
  KEY `Book_id` (`Book_id`),
  KEY `Belong_ibfk_2` (`type_id`),
  CONSTRAINT `Belong_ibfk_1` FOREIGN KEY (`Book_id`) REFERENCES `Book` (`id`),
  CONSTRAINT `Belong_ibfk_2` FOREIGN KEY (`Type_id`) REFERENCES `Type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


INSERT INTO `Belong` (`Book_id`,`Type_id`) VALUES
 (1,1),(2,2),(3,2);
--
-- Table structure for table `auteur`
--

DROP TABLE IF EXISTS `Author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Author` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `Author` (`id`,`first_name`,`last_name`,`nationality`) VALUES
 (1,'Ignatius Conan Doyle','Arthur','Écossaise'),
(2,'José','Mauro de Vasconcelos','Brésilienne'),
(3,' Allan Poe','Edgar','Américaine');
--
-- Table structure for table `comment`
-- CETTE TABLE A ETE  COMPLETEMENT RETIRE

DROP TABLE IF EXISTS `Comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


INSERT INTO `Comment` VALUES (1,'Je suis le Responable');

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `Image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_data` varchar(255) NOT NULL,
  `Book_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Book_id` (`Book_id`),
  CONSTRAINT `Image_ibfk_1` FOREIGN KEY (`Book_id`) REFERENCES `Book` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `Image` (`id`,`image_data`,`Book_id`) VALUES
 (1,'double-assassinat-dans-la-rue-morgue.jpeg',1),(2,'mon-bel-oranger.jpeg',2),(3,'la-ceinture-empoisonné.jpeg',3);
--
-- Table structure for table `Book`
--

DROP TABLE IF EXISTS `Book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Book` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `resume` text,
  `release_date` date DEFAULT NULL,
  `number_of_the_pages` int DEFAULT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  `User_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  KEY `User_id` (`User_id`),
  CONSTRAINT `Book_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `Book` (`id`,`title`,`resume`,`release_date`,`number_of_the_pages`,`image_name`,`User_id`) VALUES
 (1,'Double Assassinat dans la rue Morgue','La nouvelle met en scène le détective Dupin et l\'un de ses amis, qui joue le rôle de narrateur. L’histoire se déroule à Paris, au XIXe siècle. Cependant, la plupart des lieux cités dans la nouvelle, dont la rue Morgue, n\'existent pas','1841-04-01',346,'double-assassinat-dans-la-rue-morgue',1);
INSERT INTO `Book` (`id`,`title`,`resume`,`release_date`,`number_of_the_pages`,`image_name`,`User_id`) VALUES
(2,'Mon bel oranger','Zézé est un enfant de cinq ans, qui vit à Bangu, au Brésil. Il est doté d\'une extraordinaire maturité et plénitude, usant de son intelligence avec laquelle il a déjà appris à lire seul. Il est vraiment très maigre et ne fait pas du tout cinq ans. Issu d\'une famille pauvre, son père est sans emploi, sa mère travaille dans une fabrique pour un salaire de misère. À l\'exception de sa sœur aînée Gloria et de son petit frère Luís, ses nombreux frères et sœurs le battent car il enchaîne les bêtises. Zézé s\'invente un monde imaginaire et fantaisiste dans lequel un petit pied d\'oranges douces est son confident : Minguinho\ (l\'arbre lui parle…\).','1968-01-01',252,'mon-bel-oranger',1);

INSERT INTO `Book`(`id`,`title`,`resume`,`release_date`,`number_of_the_pages`,`image_name`,`User_id`) VALUES
 (3,'La Ceinture empoisonnée','En observant une modification de l\'apparence des spectres dans l\'espace qui entrainerait un changement de la nature de l\'éther (nom donné au vide interstellaire à l\'époque du roman) le professeur Challenger identifie un phénomène qui risque d\'entraîner la démence puis l’asphyxie des êtres vivants.Le professeur décide alors d\'inviter quelques amis (dont Edward Malone) chez lui en leur demandant de se procurer auparavant des bouteilles d\'oxygène afin qu\'ils se réfugient tous dans une pièce confinée de sa maison avant que l\'empoisonnement de l\'humanité ne commence.','1913-01-01',184,'la-ceinture-empoisonné',1);

--  1ère Mise a jour de la colonne image_name
-- 1)
UPDATE Book SET image_name ='double-assassinat-dans-la-rue-morgue.jpeg' 
WHERE image_name ='double-assassinat-dans-la-rue-morgue';

-- 2)
UPDATE Book SET image_name ='mon-bel-oranger.jpeg' 
WHERE image_name ='mon-bel-oranger';

-- 3)
UPDATE Book SET image_name ='la-ceinture-empoisonné.jpeg' 
WHERE image_name ='la-ceinture-empoisonné';
-- 2ième Mise a jour de la colonne image_name
-- 1)
UPDATE Book SET image_name ='double-assassinat-dans-la-rue-morgue.jpg' 
WHERE image_name ='double-assassinat-dans-la-rue-morgue.jpeg';

-- 2)
UPDATE Book SET image_name ='mon-bel-oranger.jpg' 
WHERE image_name ='mon-bel-oranger.jpeg';

-- 3)
UPDATE Book SET image_name ='la-ceinture-empoisonné.jpg' 
WHERE image_name ='la-ceinture-empoisonné.jpeg';

--
-- Table structure for table `Write`
--

DROP TABLE IF EXISTS `Write`;
CREATE TABLE `Write` ( 
  `Book_id` INT NOT NULL,
  `Author_id` INT NOT NULL,
  PRIMARY KEY (`Book_id`,`Author_id`),
  KEY `Author_id`(`Author_id`),
  CONSTRAINT `Write_ibfk_1` FOREIGN KEY (`Book_id`) REFERENCES `Book`(`id`),
  CONSTRAINT `Write_ibfk_2` FOREIGN KEY (`Author_id`) REFERENCES `Author`(`id`)
);

INSERT INTO `Write` (`Book_id`,`Author_id`)VALUES
 (
1,3);
INSERT INTO `Write`(`Book_id`,`Author_id`)VALUES
 (
2,2);
INSERT INTO `Write` (`Book_id`,`Author_id`)VALUES
 (
3,1);
--
-- Table structure for table `Answer`
-- n'est pas encore enregister petit probleme avec la cle étrangère


DROP TABLE IF EXISTS `Answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE `Answer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `book_read` varchar(255) NOT NULL,
  `book_consulted` varchar(255) NOT NULL,
  `book_being_read`varchar(255) NOT NULL,
  `comment`varchar(255) NOT NULL,
  `User_id` INT NOT NULL,
  PRIMARY KEY (`id`),
 KEY `User_id` (`User_id`),
  CONSTRAINT `Answer_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `User`(`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `Answer` (`id`,`book_read`,`book_consulted`,`book_being_read`,`comment`,`User_id`)VALUES
 (1,'non','non','non','new book',1),(2,'non','non','non','new book',1),(3,'non','non','non','new book',1);
--
-- Table structure for table `Type`
--

DROP TABLE IF EXISTS `Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `Type` (`id`,`name`) VALUES 
(1,'égnimes'),(2,'aventures');

UPDATE Type SET name ='romans d\'aventures' 
WHERE name ='aventures' ;



-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `id` INT NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

 
INSERT INTO `User` (`id`, `first_name`, `last_name`,`password` ,`email` , `role`) VALUES
(1,'Pedro','Ricardo','titi','Pedro.Ricardo@yhaoo.com','Admin');

INSERT INTO `User` (`id`, `first_name`, `last_name`,`password` ,`email` , `role`) VALUES
(2,'Coriande','Ameli','test','Ameli.Coriande@yhaoo.com','User');
--
-- Dumping routines for database 'bibliotheque_personel'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-11 18:49:34
