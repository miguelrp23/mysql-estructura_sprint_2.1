CREATE DATABASE  IF NOT EXISTS `optica cul d'ampolla` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `optica cul d'ampolla`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: optica cul d'ampolla
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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `direccion_postal` int NOT NULL,
  `telefono` int NOT NULL,
  `correo_electronico` varchar(45) NOT NULL,
  `fecha_registro` date NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Santiago',8001,664328723,'santia2go19@gmail.com','2019-06-20'),(2,'Ximena',8005,650101222,'x_mena32@gmai.com','2019-07-12'),(3,'Manuel',8003,677403906,'manuelulleras2@gmail.com','2019-10-19'),(4,'Erika',8001,61975320,'rioserika90@gmail.com','2020-01-05');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `id_Direccion` int NOT NULL,
  `calle` varchar(10) NOT NULL,
  `numero` int NOT NULL,
  `piso` int NOT NULL,
  `puerta` int NOT NULL,
  `ciudad` varchar(15) NOT NULL,
  `codigo_postal` int NOT NULL,
  `pais` varchar(20) NOT NULL,
  PRIMARY KEY (`id_Direccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1,'Lleo',20,3,3,'Barcelona',8001,'España'),(2,'Diputacio',35,2,1,'Barcelona',8005,'España'),(3,'Deia',56,1,2,'Barcelona',8003,'España'),(4,'lledo',33,1,1,'Barcelona',8001,'España');
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id_empleado` int NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `cantidad_ventas` int DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `fk_ventas_gafas_idx` (`cantidad_ventas`),
  CONSTRAINT `fk_ventas_gafas` FOREIGN KEY (`cantidad_ventas`) REFERENCES `ventas` (`id_ventas`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Angel Baron',1),(2,'Sara nuñez',2),(3,'Erika perez',1);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gafas`
--

DROP TABLE IF EXISTS `gafas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gafas` (
  `idGafas` int NOT NULL,
  `Marca` varchar(20) NOT NULL,
  `Graduacion izq` decimal(3,0) NOT NULL,
  `graduacion derl` decimal(3,0) NOT NULL,
  `tipo_montura` int NOT NULL,
  `color` varchar(10) NOT NULL,
  `color izq` varchar(10) NOT NULL,
  `color der` varchar(10) NOT NULL,
  `precio` int NOT NULL,
  PRIMARY KEY (`idGafas`),
  KEY `fk_tipo_montura_gafas_idx` (`tipo_montura`),
  CONSTRAINT `fk_tipo_montura_gafas` FOREIGN KEY (`tipo_montura`) REFERENCES `tipo_marco` (`id_tipo_marco`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gafas`
--

LOCK TABLES `gafas` WRITE;
/*!40000 ALTER TABLE `gafas` DISABLE KEYS */;
INSERT INTO `gafas` VALUES (1,'Ray Ban',4,2,2,'Negro','sin color','sin color',60),(2,'barckey',2,3,1,'Dorado','dorado','dorado',40),(3,'Ray Ban',1,3,3,'Azul','sin color','sin color',70),(4,'Ray Ban',2,1,2,'cafe','sin color','sin color',50);
/*!40000 ALTER TABLE `gafas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `IdProveedor` int NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `direccion` int NOT NULL,
  `telefono` int NOT NULL,
  `fax` int NOT NULL,
  `NIF` varchar(9) NOT NULL,
  PRIMARY KEY (`IdProveedor`),
  KEY `fk_direccion_proveedor_idx` (`direccion`),
  CONSTRAINT `fk_direccion_proveedor` FOREIGN KEY (`direccion`) REFERENCES `direccion` (`id_Direccion`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_marca_gafas` FOREIGN KEY (`IdProveedor`) REFERENCES `gafas` (`idGafas`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Ray Ban',1,92313812,92138121,'64920195P'),(2,'Barckey',3,81648291,98123938,'94201923C');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `proveedor_gafas_count`
--

DROP TABLE IF EXISTS `proveedor_gafas_count`;
/*!50001 DROP VIEW IF EXISTS `proveedor_gafas_count`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `proveedor_gafas_count` AS SELECT 
 1 AS `proveedor`,
 1 AS `cantidad_gafas_suministradas`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tipo_marco`
--

DROP TABLE IF EXISTS `tipo_marco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_marco` (
  `id_tipo_marco` int NOT NULL,
  `flotante` varchar(2) NOT NULL,
  `pasta` varchar(2) NOT NULL,
  `metalica` varchar(2) NOT NULL,
  PRIMARY KEY (`id_tipo_marco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_marco`
--

LOCK TABLES `tipo_marco` WRITE;
/*!40000 ALTER TABLE `tipo_marco` DISABLE KEYS */;
INSERT INTO `tipo_marco` VALUES (1,'NO','SI','NO'),(2,'NO','NO','SI'),(3,'SI','NO','NO');
/*!40000 ALTER TABLE `tipo_marco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id_ventas` int NOT NULL,
  `precio` int NOT NULL,
  `tipo_gafas` int NOT NULL,
  `id_empleado_venta` int NOT NULL,
  `id_cliente` int NOT NULL,
  PRIMARY KEY (`id_ventas`),
  KEY `fk_tipo_gafas_idx` (`tipo_gafas`),
  KEY `fk_compra_cliente_idx` (`id_cliente`),
  KEY `fk_ventas_empleado_idx` (`id_empleado_venta`),
  CONSTRAINT `fk_tipo_gafas` FOREIGN KEY (`tipo_gafas`) REFERENCES `gafas` (`idGafas`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_venta_clientes` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,120,3,2,2),(2,110,1,1,4),(3,150,4,2,1),(4,135,2,3,3);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ventas_empleados`
--

DROP TABLE IF EXISTS `ventas_empleados`;
/*!50001 DROP VIEW IF EXISTS `ventas_empleados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ventas_empleados` AS SELECT 
 1 AS `id_empleado`,
 1 AS `cantidad_ventas`,
 1 AS `nombre_empleado`,
 1 AS `valor_total_ventas`,
 1 AS `nombre_cliente`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `proveedor_gafas_count`
--

/*!50001 DROP VIEW IF EXISTS `proveedor_gafas_count`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `proveedor_gafas_count` AS select `p`.`Nombre` AS `proveedor`,count(`g`.`idGafas`) AS `cantidad_gafas_suministradas` from (`proveedor` `p` join `gafas` `g` on((`p`.`Nombre` = `g`.`Marca`))) group by `p`.`Nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ventas_empleados`
--

/*!50001 DROP VIEW IF EXISTS `ventas_empleados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ventas_empleados` AS select `e`.`id_empleado` AS `id_empleado`,count(`ve`.`id_ventas`) AS `cantidad_ventas`,`e`.`nombre` AS `nombre_empleado`,sum(`ve`.`precio`) AS `valor_total_ventas`,`c`.`nombre` AS `nombre_cliente` from (((`empleado` `e` join `ventas` `ve` on((`e`.`id_empleado` = `ve`.`id_empleado_venta`))) join `gafas` `g` on((`ve`.`tipo_gafas` = `g`.`idGafas`))) join `cliente` `c` on((`ve`.`id_cliente` = `c`.`id_cliente`))) group by `e`.`id_empleado`,`e`.`nombre`,`c`.`nombre` order by `cantidad_ventas` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-02 20:51:28
