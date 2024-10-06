CREATE DATABASE  IF NOT EXISTS `youtube` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `youtube`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: youtube
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `canales`
--

DROP TABLE IF EXISTS `canales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canales` (
  `canal_id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text,
  `fecha_creacion` datetime DEFAULT NULL,
  PRIMARY KEY (`canal_id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `canales_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canales`
--

LOCK TABLES `canales` WRITE;
/*!40000 ALTER TABLE `canales` DISABLE KEYS */;
INSERT INTO `canales` VALUES (1,1,'roberto','videojuegos','2020-02-23 00:00:00'),(2,2,'liliana','consejos de vida','2020-04-30 00:00:00'),(3,3,'carlos','videojuegos','2020-08-08 00:00:00'),(4,4,'xavi','futbol','2020-12-07 00:00:00');
/*!40000 ALTER TABLE `canales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `comentario_id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int DEFAULT NULL,
  `video_id` int DEFAULT NULL,
  `texto` text,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`comentario_id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `video_id` (`video_id`),
  CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`),
  CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `videos` (`video_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (1,3,1,'gran video','2024-05-12 00:00:00'),(2,2,1,'saludos','2024-01-10 00:00:00'),(3,1,4,'felicidades','2024-10-01 00:00:00');
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etiquetas`
--

DROP TABLE IF EXISTS `etiquetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etiquetas` (
  `etiqueta_id` int NOT NULL AUTO_INCREMENT,
  `nombre_etiqueta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`etiqueta_id`),
  UNIQUE KEY `nombre_etiqueta` (`nombre_etiqueta`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etiquetas`
--

LOCK TABLES `etiquetas` WRITE;
/*!40000 ALTER TABLE `etiquetas` DISABLE KEYS */;
INSERT INTO `etiquetas` VALUES (4,'#dinero'),(2,'#game'),(5,'#lol'),(3,'#vida'),(1,'#viral');
/*!40000 ALTER TABLE `etiquetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes_dislikes_comentarios`
--

DROP TABLE IF EXISTS `likes_dislikes_comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes_dislikes_comentarios` (
  `usuario_id` int NOT NULL,
  `comentario_id` int NOT NULL,
  `tipo` enum('like','dislike') DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`usuario_id`,`comentario_id`),
  KEY `comentario_id` (`comentario_id`),
  CONSTRAINT `likes_dislikes_comentarios_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`),
  CONSTRAINT `likes_dislikes_comentarios_ibfk_2` FOREIGN KEY (`comentario_id`) REFERENCES `comentarios` (`comentario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes_dislikes_comentarios`
--

LOCK TABLES `likes_dislikes_comentarios` WRITE;
/*!40000 ALTER TABLE `likes_dislikes_comentarios` DISABLE KEYS */;
INSERT INTO `likes_dislikes_comentarios` VALUES (1,1,'like','2024-04-23 00:00:00'),(2,1,'like','2024-01-13 00:00:00');
/*!40000 ALTER TABLE `likes_dislikes_comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes_dislikes_videos`
--

DROP TABLE IF EXISTS `likes_dislikes_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes_dislikes_videos` (
  `usuario_id` int NOT NULL,
  `video_id` int NOT NULL,
  `tipo` enum('like','dislike') DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`usuario_id`,`video_id`),
  KEY `video_id` (`video_id`),
  CONSTRAINT `likes_dislikes_videos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`),
  CONSTRAINT `likes_dislikes_videos_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `videos` (`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes_dislikes_videos`
--

LOCK TABLES `likes_dislikes_videos` WRITE;
/*!40000 ALTER TABLE `likes_dislikes_videos` DISABLE KEYS */;
INSERT INTO `likes_dislikes_videos` VALUES (1,1,'like','2023-12-12 00:00:00');
/*!40000 ALTER TABLE `likes_dislikes_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists` (
  `playlist_id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `estado` enum('publica','privada') DEFAULT NULL,
  PRIMARY KEY (`playlist_id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `playlists_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists`
--

LOCK TABLES `playlists` WRITE;
/*!40000 ALTER TABLE `playlists` DISABLE KEYS */;
INSERT INTO `playlists` VALUES (1,1,'relax','2024-10-01 00:00:00','privada'),(2,3,'despecho','2023-03-08 00:00:00','publica');
/*!40000 ALTER TABLE `playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists_videos`
--

DROP TABLE IF EXISTS `playlists_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists_videos` (
  `playlist_id` int NOT NULL,
  `video_id` int NOT NULL,
  PRIMARY KEY (`playlist_id`,`video_id`),
  KEY `video_id` (`video_id`),
  CONSTRAINT `playlists_videos_ibfk_1` FOREIGN KEY (`playlist_id`) REFERENCES `playlists` (`playlist_id`),
  CONSTRAINT `playlists_videos_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `videos` (`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists_videos`
--

LOCK TABLES `playlists_videos` WRITE;
/*!40000 ALTER TABLE `playlists_videos` DISABLE KEYS */;
INSERT INTO `playlists_videos` VALUES (1,1),(1,2),(2,3),(2,4);
/*!40000 ALTER TABLE `playlists_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suscripciones`
--

DROP TABLE IF EXISTS `suscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suscripciones` (
  `usuario_id` int NOT NULL,
  `canal_id` int NOT NULL,
  `fecha_suscripcion` datetime DEFAULT NULL,
  PRIMARY KEY (`usuario_id`,`canal_id`),
  KEY `canal_id` (`canal_id`),
  CONSTRAINT `suscripciones_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`),
  CONSTRAINT `suscripciones_ibfk_2` FOREIGN KEY (`canal_id`) REFERENCES `canales` (`canal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suscripciones`
--

LOCK TABLES `suscripciones` WRITE;
/*!40000 ALTER TABLE `suscripciones` DISABLE KEYS */;
INSERT INTO `suscripciones` VALUES (1,3,'2024-01-04 00:00:00'),(2,4,'2024-04-29 00:00:00'),(3,1,'2024-05-12 00:00:00');
/*!40000 ALTER TABLE `suscripciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `usuario_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nombre_usuario` varchar(255) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `sexo` enum('masculino','femenino') DEFAULT NULL,
  `pais` varchar(100) DEFAULT NULL,
  `codigo_postal` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`usuario_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'robeerr@gmail.com','123456','robeerr','2000-08-20','masculino','Argentina','1273498'),(2,'lilianalol@gmail.com','908763','lilatips','1999-04-12','femenino','Mexico','5678912'),(3,'ffcar@gmail.com','893427','grifgame','2003-10-07','masculino','Colombia','7132819'),(4,'messi34@gmail.com','784352','soccerlife','2004-07-17','masculino','España','8943791');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videos` (
  `video_id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int DEFAULT NULL,
  `canal_id` int DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `tamano` bigint DEFAULT NULL,
  `archivo_video` varchar(255) DEFAULT NULL,
  `duracion` time DEFAULT NULL,
  `ruta_video` varchar(255) DEFAULT NULL,
  `reproducciones` int DEFAULT '0',
  `likes` int DEFAULT '0',
  `dislikes` int DEFAULT '0',
  `estado` enum('publico','oculto','privado') DEFAULT NULL,
  `fecha_subida` datetime DEFAULT NULL,
  PRIMARY KEY (`video_id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `canal_id` (`canal_id`),
  CONSTRAINT `videos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`),
  CONSTRAINT `videos_ibfk_2` FOREIGN KEY (`canal_id`) REFERENCES `canales` (`canal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
INSERT INTO `videos` VALUES (1,1,1,'sorpresa','nuevo juego',320,'mb','10:58:20','AJjskaJS.com',128929,38201,1503,'publico','2023-05-12 00:00:00'),(2,2,2,'base o rimel','ideas',120,'mb','09:12:51','j3ih4903ej.com',832914,32343,2312,'publico','2023-01-10 00:00:00'),(3,3,3,'ultima arma','final temporada',431,'mb','30:40:12','DmdijS.com',8397210,809201,3451,'publico','2023-12-26 00:00:00'),(4,4,4,'preguntas con ...','especial ',370,'mb','11:45:20','h83hk.com',10839173,9128387,56781,'publico','2024-04-05 00:00:00');
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos_etiquetas`
--

DROP TABLE IF EXISTS `videos_etiquetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videos_etiquetas` (
  `video_id` int NOT NULL,
  `etiqueta_id` int NOT NULL,
  PRIMARY KEY (`video_id`,`etiqueta_id`),
  KEY `etiqueta_id` (`etiqueta_id`),
  CONSTRAINT `videos_etiquetas_ibfk_1` FOREIGN KEY (`video_id`) REFERENCES `videos` (`video_id`),
  CONSTRAINT `videos_etiquetas_ibfk_2` FOREIGN KEY (`etiqueta_id`) REFERENCES `etiquetas` (`etiqueta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos_etiquetas`
--

LOCK TABLES `videos_etiquetas` WRITE;
/*!40000 ALTER TABLE `videos_etiquetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `videos_etiquetas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-02 20:54:45
