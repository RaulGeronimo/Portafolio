-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: Series
-- ------------------------------------------------------
-- Server version	10.4.27-MariaDB

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
-- Table structure for table `anime`
--

DROP TABLE IF EXISTS `anime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anime` (
  `idAnime` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  `OtrosNombres` varchar(300) DEFAULT NULL,
  `Genero` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idAnime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anime`
--

LOCK TABLES `anime` WRITE;
/*!40000 ALTER TABLE `anime` DISABLE KEYS */;
/*!40000 ALTER TABLE `anime` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Agregar_Auditoria_Anime
AFTER INSERT ON Anime
FOR EACH ROW
INSERT INTO Auditoria_Anime(
    Nombre, OtrosNombres, Genero,
    usuario, modificado, proceso, idAnime)
VALUES(
    NEW.Nombre, NEW.OtrosNombres, NEW.Genero,
    USER(), NOW(), 'Dato Insertado', NEW.idAnime) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Actualiza_Auditoria_Anime
AFTER UPDATE ON Anime
FOR EACH ROW
INSERT INTO Auditoria_Anime(
    Nombre, OtrosNombres, Genero,
    usuario, modificado, proceso, idAnime)
VALUES(
    NEW.Nombre, NEW.OtrosNombres, NEW.Genero,
    USER(), NOW(), 'Dato Actualizado', NEW.idAnime) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Elimina_Auditoria_Anime
AFTER DELETE ON Anime
FOR EACH ROW
INSERT INTO Auditoria_Anime(
    Nombre, OtrosNombres, Genero,
    usuario, modificado, proceso, idAnime)
VALUES(
    OLD.Nombre, OLD.OtrosNombres, OLD.Genero,
    USER(), NOW(), 'Dato Eliminado', OLD.idAnime) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `auditoria_anime`
--

DROP TABLE IF EXISTS `auditoria_anime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditoria_anime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  `OtrosNombres` varchar(300) DEFAULT NULL,
  `Genero` varchar(100) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `modificado` datetime DEFAULT NULL,
  `proceso` varchar(45) DEFAULT NULL,
  `idAnime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_anime`
--

LOCK TABLES `auditoria_anime` WRITE;
/*!40000 ALTER TABLE `auditoria_anime` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria_anime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria_caricatura`
--

DROP TABLE IF EXISTS `auditoria_caricatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditoria_caricatura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(60) DEFAULT NULL,
  `OtrosNombres` varchar(60) DEFAULT NULL,
  `Genero` int(11) DEFAULT NULL,
  `idProductora` int(11) DEFAULT NULL,
  `idDistribuidora` int(11) DEFAULT NULL,
  `idDirector` int(11) DEFAULT NULL,
  `Portada` text DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `modificado` datetime DEFAULT NULL,
  `proceso` varchar(45) DEFAULT NULL,
  `idCaricatura` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_caricatura`
--

LOCK TABLES `auditoria_caricatura` WRITE;
/*!40000 ALTER TABLE `auditoria_caricatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria_caricatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria_director`
--

DROP TABLE IF EXISTS `auditoria_director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditoria_director` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(60) DEFAULT NULL,
  `Apellidos` varchar(60) DEFAULT NULL,
  `NombreArtistico` varchar(60) DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `FechaDefuncion` date DEFAULT NULL,
  `Sexo` char(1) DEFAULT NULL,
  `Estatura` double DEFAULT NULL,
  `Nacionalidad` int(11) DEFAULT NULL,
  `Usuario` varchar(45) DEFAULT NULL,
  `Modificado` datetime DEFAULT NULL,
  `Proceso` varchar(45) DEFAULT NULL,
  `idDirector` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_director`
--

LOCK TABLES `auditoria_director` WRITE;
/*!40000 ALTER TABLE `auditoria_director` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria_director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria_peliculas`
--

DROP TABLE IF EXISTS `auditoria_peliculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditoria_peliculas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(60) DEFAULT NULL,
  `OtrosNombres` varchar(60) DEFAULT NULL,
  `idProductora` int(11) DEFAULT NULL,
  `idDistribuidora` int(11) DEFAULT NULL,
  `Duracion` time DEFAULT NULL,
  `Genero` int(11) DEFAULT NULL,
  `Tipo` varchar(45) DEFAULT NULL,
  `Clasificacion` int(11) DEFAULT NULL,
  `Estreno` date DEFAULT NULL,
  `EstrenoMexico` date DEFAULT NULL,
  `Calificacion` double DEFAULT NULL,
  `idDirector` int(11) DEFAULT NULL,
  `Portada` text DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `modificado` datetime DEFAULT NULL,
  `proceso` varchar(45) DEFAULT NULL,
  `idPelicula` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_peliculas`
--

LOCK TABLES `auditoria_peliculas` WRITE;
/*!40000 ALTER TABLE `auditoria_peliculas` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria_peliculas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria_series`
--

DROP TABLE IF EXISTS `auditoria_series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditoria_series` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(60) DEFAULT NULL,
  `OtrosNombres` varchar(60) DEFAULT NULL,
  `Genero` varchar(60) DEFAULT NULL,
  `idProductora` int(11) DEFAULT NULL,
  `idDistribuidora` int(11) DEFAULT NULL,
  `idDirector` int(11) DEFAULT NULL,
  `Portada` text DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `modificado` datetime DEFAULT NULL,
  `proceso` varchar(45) DEFAULT NULL,
  `idSerie` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_series`
--

LOCK TABLES `auditoria_series` WRITE;
/*!40000 ALTER TABLE `auditoria_series` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria_series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria_temporadas_anime`
--

DROP TABLE IF EXISTS `auditoria_temporadas_anime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditoria_temporadas_anime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idAnime` int(11) DEFAULT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `OtrosNombres` varchar(300) DEFAULT NULL,
  `Capitulos` int(11) DEFAULT NULL,
  `Duracion` time DEFAULT NULL,
  `Idioma` varchar(50) DEFAULT NULL,
  `idTemporadaEmision` int(11) DEFAULT NULL,
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  `idEstudio` int(11) DEFAULT NULL,
  `Calificacion` double DEFAULT NULL,
  `Portada` text DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `modificado` datetime DEFAULT NULL,
  `proceso` varchar(45) DEFAULT NULL,
  `idTemporada` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_temporadas_anime`
--

LOCK TABLES `auditoria_temporadas_anime` WRITE;
/*!40000 ALTER TABLE `auditoria_temporadas_anime` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria_temporadas_anime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria_temporadas_caricatura`
--

DROP TABLE IF EXISTS `auditoria_temporadas_caricatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditoria_temporadas_caricatura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idCaricatura` int(11) DEFAULT NULL,
  `Nombre` varchar(60) DEFAULT NULL,
  `Capitulos` int(11) DEFAULT NULL,
  `Duracion` time DEFAULT NULL,
  `Calificacion` double DEFAULT NULL,
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `modificado` datetime DEFAULT NULL,
  `proceso` varchar(45) DEFAULT NULL,
  `idTemporada` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_temporadas_caricatura`
--

LOCK TABLES `auditoria_temporadas_caricatura` WRITE;
/*!40000 ALTER TABLE `auditoria_temporadas_caricatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria_temporadas_caricatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria_temporadas_emision`
--

DROP TABLE IF EXISTS `auditoria_temporadas_emision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditoria_temporadas_emision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `modificado` datetime DEFAULT NULL,
  `proceso` varchar(45) DEFAULT NULL,
  `idTemporada` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_temporadas_emision`
--

LOCK TABLES `auditoria_temporadas_emision` WRITE;
/*!40000 ALTER TABLE `auditoria_temporadas_emision` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria_temporadas_emision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria_temporadas_series`
--

DROP TABLE IF EXISTS `auditoria_temporadas_series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditoria_temporadas_series` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idSerie` int(11) DEFAULT NULL,
  `Nombre` varchar(60) DEFAULT NULL,
  `Capitulos` int(11) DEFAULT NULL,
  `Duracion` time DEFAULT NULL,
  `Calificacion` double DEFAULT NULL,
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `modificado` datetime DEFAULT NULL,
  `proceso` varchar(45) DEFAULT NULL,
  `idTemporada` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_temporadas_series`
--

LOCK TABLES `auditoria_temporadas_series` WRITE;
/*!40000 ALTER TABLE `auditoria_temporadas_series` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria_temporadas_series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria_usuario`
--

DROP TABLE IF EXISTS `auditoria_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditoria_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Paterno` varchar(45) DEFAULT NULL,
  `Materno` varchar(45) DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `Celular` bigint(20) DEFAULT NULL,
  `Sexo` char(1) DEFAULT NULL,
  `Correo` varchar(45) DEFAULT NULL,
  `Username` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `modificado` datetime DEFAULT NULL,
  `proceso` varchar(45) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_usuario`
--

LOCK TABLES `auditoria_usuario` WRITE;
/*!40000 ALTER TABLE `auditoria_usuario` DISABLE KEYS */;
INSERT INTO `auditoria_usuario` VALUES (1,'Raul Gabriel','Geronimo','Herrera','2000-09-07',5528973869,'H','raul090700@gmail.com','Raul','c90d6d172779ddee6dae9af3aa21d7bc','root@localhost','2023-02-08 19:09:30','Dato Insertado',1);
/*!40000 ALTER TABLE `auditoria_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caricatura`
--

DROP TABLE IF EXISTS `caricatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caricatura` (
  `idCaricatura` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(60) DEFAULT NULL,
  `OtrosNombres` varchar(60) DEFAULT NULL,
  `Genero` int(11) DEFAULT NULL,
  `idProductora` int(11) DEFAULT NULL,
  `idDistribuidora` int(11) DEFAULT NULL,
  `idDirector` int(11) DEFAULT NULL,
  `Portada` text DEFAULT NULL,
  PRIMARY KEY (`idCaricatura`),
  KEY `Genero` (`Genero`),
  KEY `idProductora` (`idProductora`),
  KEY `idDistribuidora` (`idDistribuidora`),
  KEY `idDirector` (`idDirector`),
  CONSTRAINT `caricatura_ibfk_1` FOREIGN KEY (`Genero`) REFERENCES `genero` (`idGenero`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `caricatura_ibfk_2` FOREIGN KEY (`idProductora`) REFERENCES `productora` (`idProductora`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `caricatura_ibfk_3` FOREIGN KEY (`idDistribuidora`) REFERENCES `distribuidora` (`idDistribuidora`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `caricatura_ibfk_4` FOREIGN KEY (`idDirector`) REFERENCES `director` (`idDirector`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caricatura`
--

LOCK TABLES `caricatura` WRITE;
/*!40000 ALTER TABLE `caricatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `caricatura` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Agregar_Auditoria_Caricatura
AFTER INSERT ON Caricatura
FOR EACH ROW
INSERT INTO Auditoria_Caricatura(
    Nombre, OtrosNombres, Genero,
    idProductora, idDistribuidora, idDirector, Portada,
    usuario, modificado, proceso, idCaricatura)
VALUES(
    NEW.Nombre, NEW.OtrosNombres, NEW.Genero,
    NEW.idProductora, NEW.idDistribuidora, NEW.idDirector, NEW.Portada,
    USER(), NOW(), 'Dato Insertado', NEW.idCaricatura) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Actualiza_Auditoria_Caricatura
AFTER UPDATE ON Caricatura
FOR EACH ROW
INSERT INTO Auditoria_Caricatura(
    Nombre, OtrosNombres, Genero,
    idProductora, idDistribuidora, idDirector, Portada,
    usuario, modificado, proceso, idCaricatura)
VALUES(
    NEW.Nombre, NEW.OtrosNombres, NEW.Genero,
    NEW.idProductora, NEW.idDistribuidora, NEW.idDirector, NEW.Portada,
    USER(), NOW(), 'Dato Actualizado', NEW.idCaricatura) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Elimina_Auditoria_Caricatura
AFTER DELETE ON Caricatura
FOR EACH ROW
INSERT INTO Auditoria_Caricatura(
    Nombre, OtrosNombres, Genero,
    idProductora, idDistribuidora, idDirector, Portada,
    usuario, modificado, proceso, idCaricatura)
VALUES(
    OLD.Nombre, OLD.OtrosNombres, OLD.Genero,
    OLD.idProductora, OLD.idDistribuidora, OLD.idDirector, OLD.Portada,
    USER(), NOW(), 'Dato Eliminado', OLD.idCaricatura) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `clasificacion`
--

DROP TABLE IF EXISTS `clasificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clasificacion` (
  `idClasificacion` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idClasificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clasificacion`
--

LOCK TABLES `clasificacion` WRITE;
/*!40000 ALTER TABLE `clasificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `clasificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `director` (
  `idDirector` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(60) DEFAULT NULL,
  `Apellidos` varchar(60) DEFAULT NULL,
  `NombreArtistico` varchar(60) DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `FechaDefuncion` date DEFAULT NULL,
  `Sexo` char(1) DEFAULT NULL,
  `Estatura` double DEFAULT NULL,
  `Nacionalidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDirector`),
  KEY `Nacionalidad` (`Nacionalidad`),
  CONSTRAINT `director_ibfk_1` FOREIGN KEY (`Nacionalidad`) REFERENCES `pais` (`idPais`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Agregar_Auditoria_Director
AFTER INSERT ON Director
FOR EACH ROW
INSERT INTO Auditoria_Director(
    Nombre, Apellidos, NombreArtistico,
    FechaNacimiento, FechaDefuncion, Sexo, Estatura, Nacionalidad,
    Usuario, Modificado, Proceso, idDirector)
VALUES(
    NEW.Nombre, NEW.Apellidos, NEW.NombreArtistico,
    NEW.FechaNacimiento, NEW.FechaDefuncion, NEW.Sexo, NEW.Estatura, NEW.Nacionalidad,
    USER(), NOW(), 'Dato Insertado', NEW.idDirector) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Actualiza_Auditoria_Director
AFTER UPDATE ON Director
FOR EACH ROW
INSERT INTO Auditoria_Director(
    Nombre, Apellidos, NombreArtistico,
    FechaNacimiento, FechaDefuncion, Sexo, Estatura, Nacionalidad,
    Usuario, Modificado, Proceso, idDirector)
VALUES(
    NEW.Nombre, NEW.Apellidos, NEW.NombreArtistico,
    NEW.FechaNacimiento, NEW.FechaDefuncion, NEW.Sexo, NEW.Estatura, NEW.Nacionalidad,
    USER(), NOW(), 'Dato Actualizado', NEW.idDirector) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Elimina_Auditoria_Director
AFTER DELETE ON Director
FOR EACH ROW
INSERT INTO Auditoria_Director(
    Nombre, Apellidos, NombreArtistico,
    FechaNacimiento, FechaDefuncion, Sexo, Estatura, Nacionalidad,
    Usuario, Modificado, Proceso, idDirector)
VALUES(
    OLD.Nombre, OLD.Apellidos, OLD.NombreArtistico,
    OLD.FechaNacimiento, OLD.FechaDefuncion, OLD.Sexo, OLD.Estatura, OLD.Nacionalidad,
    USER(), NOW(), 'Dato Eliminado', OLD.idDirector) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `distribuidora`
--

DROP TABLE IF EXISTS `distribuidora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distribuidora` (
  `idDistribuidora` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(60) DEFAULT NULL,
  `Genero` int(11) DEFAULT NULL,
  `SitioWeb` varchar(60) DEFAULT NULL,
  `Imagen` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idDistribuidora`),
  KEY `Genero` (`Genero`),
  CONSTRAINT `distribuidora_ibfk_1` FOREIGN KEY (`Genero`) REFERENCES `genero` (`idGenero`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distribuidora`
--

LOCK TABLES `distribuidora` WRITE;
/*!40000 ALTER TABLE `distribuidora` DISABLE KEYS */;
/*!40000 ALTER TABLE `distribuidora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudioanimacion`
--

DROP TABLE IF EXISTS `estudioanimacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudioanimacion` (
  `idEstudio` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Fundacion` date DEFAULT NULL,
  `Imagen` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idEstudio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudioanimacion`
--

LOCK TABLES `estudioanimacion` WRITE;
/*!40000 ALTER TABLE `estudioanimacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `estudioanimacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genero` (
  `idGenero` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(70) DEFAULT NULL,
  `Descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idGenero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `idPais` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(60) DEFAULT NULL,
  `Nacionalidad` varchar(60) DEFAULT NULL,
  `Continente` varchar(60) DEFAULT NULL,
  `Bandera` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idPais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peliculas`
--

DROP TABLE IF EXISTS `peliculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peliculas` (
  `idPelicula` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(60) DEFAULT NULL,
  `OtrosNombres` varchar(60) DEFAULT NULL,
  `idProductora` int(11) DEFAULT NULL,
  `idDistribuidora` int(11) DEFAULT NULL,
  `Duracion` time DEFAULT NULL,
  `Genero` int(11) DEFAULT NULL,
  `Tipo` varchar(45) DEFAULT NULL,
  `Clasificacion` int(11) DEFAULT NULL,
  `Estreno` date DEFAULT NULL,
  `EstrenoMexico` date DEFAULT NULL,
  `Calificacion` double DEFAULT NULL,
  `idDirector` int(11) DEFAULT NULL,
  `Portada` text DEFAULT NULL,
  PRIMARY KEY (`idPelicula`),
  KEY `idProductora` (`idProductora`),
  KEY `idDistribuidora` (`idDistribuidora`),
  KEY `Genero` (`Genero`),
  KEY `Clasificacion` (`Clasificacion`),
  KEY `idDirector` (`idDirector`),
  CONSTRAINT `peliculas_ibfk_1` FOREIGN KEY (`idProductora`) REFERENCES `productora` (`idProductora`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `peliculas_ibfk_2` FOREIGN KEY (`idDistribuidora`) REFERENCES `distribuidora` (`idDistribuidora`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `peliculas_ibfk_3` FOREIGN KEY (`Genero`) REFERENCES `genero` (`idGenero`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `peliculas_ibfk_4` FOREIGN KEY (`Clasificacion`) REFERENCES `clasificacion` (`idClasificacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `peliculas_ibfk_5` FOREIGN KEY (`idDirector`) REFERENCES `director` (`idDirector`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peliculas`
--

LOCK TABLES `peliculas` WRITE;
/*!40000 ALTER TABLE `peliculas` DISABLE KEYS */;
/*!40000 ALTER TABLE `peliculas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Agregar_Auditoria_Pelicula
AFTER INSERT ON Peliculas
FOR EACH ROW
INSERT INTO Auditoria_Peliculas(
    Nombre, OtrosNombres, idProductora, idDistribuidora, Duracion,
    Genero, Tipo, Clasificacion, Estreno, EstrenoMexico, Calificacion, idDirector, Portada,
    usuario, modificado, proceso, idPelicula)
VALUES(
    NEW.Nombre, NEW.OtrosNombres, NEW.idProductora, NEW.idDistribuidora, NEW.Duracion,
    NEW.Genero, NEW.Tipo, NEW.Clasificacion, NEW.Estreno, NEW.EstrenoMexico, NEW.Calificacion, NEW.idDirector, NEW.Portada,
    USER(), NOW(), 'Dato Insertado', NEW.idPelicula) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Actualiza_Auditoria_Pelicula
AFTER UPDATE ON Peliculas
FOR EACH ROW
INSERT INTO Auditoria_Peliculas(
    Nombre, OtrosNombres, idProductora, idDistribuidora, Duracion,
    Genero, Tipo, Clasificacion, Estreno, EstrenoMexico, Calificacion, idDirector, Portada,
    usuario, modificado, proceso, idPelicula)
VALUES(
    NEW.Nombre, NEW.OtrosNombres, NEW.idProductora, NEW.idDistribuidora, NEW.Duracion,
    NEW.Genero, NEW.Tipo, NEW.Clasificacion, NEW.Estreno, NEW.EstrenoMexico, NEW.Calificacion, NEW.idDirector, NEW.Portada,
    USER(), NOW(), 'Dato Actualizado', NEW.idPelicula) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Elimina_Auditoria_Pelicula
AFTER DELETE ON Peliculas
FOR EACH ROW
INSERT INTO Auditoria_Peliculas(
    Nombre, OtrosNombres, idProductora, idDistribuidora, Duracion,
    Genero, Tipo, Clasificacion, Estreno, EstrenoMexico, Calificacion, idDirector, Portada,
    usuario, modificado, proceso, idPelicula)
VALUES(
    OLD.Nombre, OLD.OtrosNombres, OLD.idProductora, OLD.idDistribuidora, OLD.Duracion,
    OLD.Genero, OLD.Tipo, OLD.Clasificacion, OLD.Estreno, OLD.EstrenoMexico, OLD.Calificacion, OLD.idDirector, OLD.Portada,
    USER(), NOW(), 'Dato Eliminado', OLD.idPelicula) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `productora`
--

DROP TABLE IF EXISTS `productora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productora` (
  `idProductora` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(60) DEFAULT NULL,
  `Genero` int(11) DEFAULT NULL,
  `SitioWeb` varchar(60) DEFAULT NULL,
  `Imagen` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idProductora`),
  KEY `Genero` (`Genero`),
  CONSTRAINT `productora_ibfk_1` FOREIGN KEY (`Genero`) REFERENCES `genero` (`idGenero`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productora`
--

LOCK TABLES `productora` WRITE;
/*!40000 ALTER TABLE `productora` DISABLE KEYS */;
/*!40000 ALTER TABLE `productora` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Agregar_Distribuidora
AFTER INSERT ON Productora
FOR EACH ROW
INSERT INTO Distribuidora (
    Nombre, Genero, SitioWeb, Imagen
    )
VALUES(
    NEW.Nombre, NEW.Genero, NEW.SitioWeb, NEW.Imagen
) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Actualiza_Distribuidora
AFTER UPDATE ON Productora
FOR EACH ROW
UPDATE Distribuidora SET Nombre = NEW.Nombre, Genero = NEW.Genero, SitioWeb = NEW.SitioWeb, Imagen = NEW.Imagen WHERE idDistribuidora = NEW.idProductora */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Elimina_Distribuidora
AFTER DELETE ON Productora
FOR EACH ROW
DELETE FROM Distribuidora WHERE idDistribuidora = OLD.idProductora */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `series` (
  `idSerie` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(60) DEFAULT NULL,
  `OtrosNombres` varchar(60) DEFAULT NULL,
  `Genero` int(11) DEFAULT NULL,
  `idProductora` int(11) DEFAULT NULL,
  `idDistribuidora` int(11) DEFAULT NULL,
  `idDirector` int(11) DEFAULT NULL,
  `Portada` text DEFAULT NULL,
  PRIMARY KEY (`idSerie`),
  KEY `Genero` (`Genero`),
  KEY `idProductora` (`idProductora`),
  KEY `idDistribuidora` (`idDistribuidora`),
  KEY `idDirector` (`idDirector`),
  CONSTRAINT `series_ibfk_1` FOREIGN KEY (`Genero`) REFERENCES `genero` (`idGenero`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `series_ibfk_2` FOREIGN KEY (`idProductora`) REFERENCES `productora` (`idProductora`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `series_ibfk_3` FOREIGN KEY (`idDistribuidora`) REFERENCES `distribuidora` (`idDistribuidora`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `series_ibfk_4` FOREIGN KEY (`idDirector`) REFERENCES `director` (`idDirector`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
/*!40000 ALTER TABLE `series` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Agregar_Auditoria_Series
AFTER INSERT ON Series
FOR EACH ROW
INSERT INTO Auditoria_Series(
    Nombre, OtrosNombres, Genero,
    idProductora, idDistribuidora, idDirector, Portada,
    usuario, modificado, proceso, idSerie)
VALUES(
    NEW.Nombre, NEW.OtrosNombres, NEW.Genero,
    NEW.idProductora, NEW.idDistribuidora, NEW.idDirector, NEW.Portada,
    USER(), NOW(), 'Dato Insertado', NEW.idSerie) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Actualiza_Auditoria_Series
AFTER UPDATE ON Series
FOR EACH ROW
INSERT INTO Auditoria_Series(
    Nombre, OtrosNombres, Genero,
    idProductora, idDistribuidora, idDirector, Portada,
    usuario, modificado, proceso, idSerie)
VALUES(
    NEW.Nombre, NEW.OtrosNombres, NEW.Genero,
    NEW.idProductora, NEW.idDistribuidora, NEW.idDirector, NEW.Portada,
    USER(), NOW(), 'Dato Actualizado', NEW.idSerie) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Elimina_Auditoria_Series
AFTER DELETE ON Series
FOR EACH ROW
INSERT INTO Auditoria_Series(
    Nombre, OtrosNombres, Genero,
    idProductora, idDistribuidora, idDirector, Portada,
    usuario, modificado, proceso, idSerie)
VALUES(
    OLD.Nombre, OLD.OtrosNombres, OLD.Genero,
    OLD.idProductora, OLD.idDistribuidora, OLD.idDirector, OLD.Portada,
    USER(), NOW(), 'Dato Eliminado', OLD.idSerie) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `temporadas_anime`
--

DROP TABLE IF EXISTS `temporadas_anime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temporadas_anime` (
  `idTemporada` int(11) NOT NULL AUTO_INCREMENT,
  `idAnime` int(11) DEFAULT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `OtrosNombres` varchar(300) DEFAULT NULL,
  `Capitulos` int(11) DEFAULT NULL,
  `Duracion` time DEFAULT NULL,
  `Idioma` varchar(50) DEFAULT NULL,
  `idTemporadaEmision` int(11) DEFAULT NULL,
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  `idEstudio` int(11) DEFAULT NULL,
  `Calificacion` double DEFAULT NULL,
  `Portada` text DEFAULT NULL,
  PRIMARY KEY (`idTemporada`),
  KEY `idAnime` (`idAnime`),
  KEY `idTemporadaEmision` (`idTemporadaEmision`),
  KEY `idEstudio` (`idEstudio`),
  CONSTRAINT `temporadas_anime_ibfk_1` FOREIGN KEY (`idAnime`) REFERENCES `anime` (`idAnime`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `temporadas_anime_ibfk_2` FOREIGN KEY (`idTemporadaEmision`) REFERENCES `temporadas_emision` (`idTemporada`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `temporadas_anime_ibfk_3` FOREIGN KEY (`idEstudio`) REFERENCES `estudioanimacion` (`idEstudio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temporadas_anime`
--

LOCK TABLES `temporadas_anime` WRITE;
/*!40000 ALTER TABLE `temporadas_anime` DISABLE KEYS */;
/*!40000 ALTER TABLE `temporadas_anime` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Agregar_Auditoria_Temporadas_Anime
AFTER INSERT ON Temporadas_Anime
FOR EACH ROW
INSERT INTO Auditoria_Temporadas_Anime(
    Nombre, idAnime, OtrosNombres, Capitulos, Duracion, Idioma,
    idTemporadaEmision, FechaInicio, FechaFin, idEstudio, Calificacion, Portada, 
    usuario, modificado, proceso, idTemporada)
VALUES(
    NEW.Nombre, NEW.idAnime, NEW.OtrosNombres, NEW.Capitulos, NEW.Duracion, NEW.Idioma,
    NEW.idTemporadaEmision, NEW.FechaInicio, NEW.FechaFin, NEW.idEstudio, NEW.Calificacion, NEW.Portada,
    USER(), NOW(), 'Dato Insertado', NEW.idTemporada) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Actualiza_Auditoria_Temporadas_Anime
AFTER UPDATE ON Temporadas_Anime
FOR EACH ROW
INSERT INTO Auditoria_Temporadas_Anime(
    Nombre, idAnime, OtrosNombres, Capitulos, Duracion, Idioma,
    idTemporadaEmision, FechaInicio, FechaFin, idEstudio, Calificacion, Portada, 
    usuario, modificado, proceso, idTemporada)
VALUES(
    NEW.Nombre, NEW.idAnime, NEW.OtrosNombres, NEW.Capitulos, NEW.Duracion, NEW.Idioma,
    NEW.idTemporadaEmision, NEW.FechaInicio, NEW.FechaFin, NEW.idEstudio, NEW.Calificacion, NEW.Portada,
    USER(), NOW(), 'Dato Actualizado', NEW.idTemporada) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Elimina_Auditoria_Temporadas_Anime
AFTER DELETE ON Temporadas_Anime
FOR EACH ROW
INSERT INTO Auditoria_Temporadas_Anime(
    Nombre, idAnime, OtrosNombres, Capitulos, Duracion, Idioma,
    idTemporadaEmision, FechaInicio, FechaFin, idEstudio, Calificacion, Portada, 
    usuario, modificado, proceso, idTemporada)
VALUES(
    OLD.Nombre, OLD.idAnime, OLD.OtrosNombres, OLD.Capitulos, OLD.Duracion, OLD.Idioma,
    OLD.idTemporadaEmision, OLD.FechaInicio, OLD.FechaFin, OLD.idEstudio, OLD.Calificacion, OLD.Portada,
    USER(), NOW(), 'Dato Eliminado', OLD.idTemporada) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `temporadas_caricatura`
--

DROP TABLE IF EXISTS `temporadas_caricatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temporadas_caricatura` (
  `idTemporada` int(11) NOT NULL AUTO_INCREMENT,
  `idCaricatura` int(11) DEFAULT NULL,
  `Nombre` varchar(60) DEFAULT NULL,
  `Capitulos` int(11) DEFAULT NULL,
  `Duracion` time DEFAULT NULL,
  `Calificacion` double DEFAULT NULL,
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  PRIMARY KEY (`idTemporada`),
  KEY `idCaricatura` (`idCaricatura`),
  CONSTRAINT `temporadas_caricatura_ibfk_1` FOREIGN KEY (`idCaricatura`) REFERENCES `caricatura` (`idCaricatura`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temporadas_caricatura`
--

LOCK TABLES `temporadas_caricatura` WRITE;
/*!40000 ALTER TABLE `temporadas_caricatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `temporadas_caricatura` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Agregar_Auditoria_Temporadas_Caricatura
AFTER INSERT ON Temporadas_Caricatura
FOR EACH ROW
INSERT INTO Auditoria_Temporadas_Caricatura(
    Nombre, idCaricatura, Capitulos, Duracion,
    Calificacion, FechaInicio, FechaFin,
    usuario, modificado, proceso, idTemporada)
VALUES(
    NEW.Nombre, NEW.idCaricatura, NEW.Capitulos, NEW.Duracion,
    NEW.Calificacion, NEW.FechaInicio, NEW.FechaFin,
    USER(), NOW(), 'Dato Insertado', NEW.idTemporada) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Actualiza_Auditoria_Temporadas_Caricatura
AFTER UPDATE ON Temporadas_Caricatura
FOR EACH ROW
INSERT INTO Auditoria_Temporadas_Caricatura(
    Nombre, idCaricatura, Capitulos, Duracion,
    Calificacion, FechaInicio, FechaFin,
    usuario, modificado, proceso, idTemporada)
VALUES(
    NEW.Nombre, NEW.idCaricatura, NEW.Capitulos, NEW.Duracion,
    NEW.Calificacion, NEW.FechaInicio, NEW.FechaFin,
    USER(), NOW(), 'Dato Actualizado', NEW.idTemporada) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Elimina_Auditoria_Temporadas_Caricatura
AFTER DELETE ON Temporadas_Caricatura
FOR EACH ROW
INSERT INTO Auditoria_Temporadas_Caricatura(
    Nombre, idCaricatura, Capitulos, Duracion,
    Calificacion, FechaInicio, FechaFin,
    usuario, modificado, proceso, idTemporada)
VALUES(
    OLD.Nombre, OLD.idCaricatura, OLD.Capitulos, OLD.Duracion,
    OLD.Calificacion, OLD.FechaInicio, OLD.FechaFin,
    USER(), NOW(), 'Dato Eliminado', OLD.idTemporada) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `temporadas_emision`
--

DROP TABLE IF EXISTS `temporadas_emision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temporadas_emision` (
  `idTemporada` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  PRIMARY KEY (`idTemporada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temporadas_emision`
--

LOCK TABLES `temporadas_emision` WRITE;
/*!40000 ALTER TABLE `temporadas_emision` DISABLE KEYS */;
/*!40000 ALTER TABLE `temporadas_emision` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Agregar_Auditoria_Temporadas_Emision
AFTER INSERT ON Temporadas_Emision
FOR EACH ROW
INSERT INTO Auditoria_Temporadas_Emision(
    Nombre, FechaInicio, FechaFin,
    usuario, modificado, proceso, idTemporada)
VALUES(
    NEW.Nombre, NEW.FechaInicio, NEW.FechaFin,
    USER(), NOW(), 'Dato Insertado', NEW.idTemporada) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Actualiza_Auditoria_Temporadas_Emision
AFTER UPDATE ON Temporadas_Emision
FOR EACH ROW
INSERT INTO Auditoria_Temporadas_Emision(
    Nombre, FechaInicio, FechaFin,
    usuario, modificado, proceso, idTemporada)
VALUES(
    NEW.Nombre, NEW.FechaInicio, NEW.FechaFin,
    USER(), NOW(), 'Dato Actualizado', NEW.idTemporada) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Elimina_Auditoria_Temporadas_Emision
AFTER DELETE ON Temporadas_Emision
FOR EACH ROW
INSERT INTO Auditoria_Temporadas_Emision(
    Nombre, FechaInicio, FechaFin,
    usuario, modificado, proceso, idTemporada)
VALUES(
    OLD.Nombre, OLD.FechaInicio, OLD.FechaFin,
    USER(), NOW(), 'Dato Eliminado', OLD.idTemporada) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `temporadas_series`
--

DROP TABLE IF EXISTS `temporadas_series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temporadas_series` (
  `idTemporada` int(11) NOT NULL AUTO_INCREMENT,
  `idSerie` int(11) DEFAULT NULL,
  `Nombre` varchar(60) DEFAULT NULL,
  `Capitulos` int(11) DEFAULT NULL,
  `Duracion` time DEFAULT NULL,
  `Calificacion` double DEFAULT NULL,
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  PRIMARY KEY (`idTemporada`),
  KEY `idSerie` (`idSerie`),
  CONSTRAINT `temporadas_series_ibfk_1` FOREIGN KEY (`idSerie`) REFERENCES `series` (`idSerie`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temporadas_series`
--

LOCK TABLES `temporadas_series` WRITE;
/*!40000 ALTER TABLE `temporadas_series` DISABLE KEYS */;
/*!40000 ALTER TABLE `temporadas_series` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Agregar_Auditoria_Temporadas_Series
AFTER INSERT ON Temporadas_Series
FOR EACH ROW
INSERT INTO Auditoria_Temporadas_Series(
    Nombre, idSerie, Capitulos, Duracion,
    Calificacion, FechaInicio, FechaFin,
    usuario, modificado, proceso, idTemporada)
VALUES(
    NEW.Nombre, NEW.idSerie, NEW.Capitulos, NEW.Duracion,
    NEW.Calificacion, NEW.FechaInicio, NEW.FechaFin,
    USER(), NOW(), 'Dato Insertado', NEW.idTemporada) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Actualiza_Auditoria_Temporadas_Series
AFTER UPDATE ON Temporadas_Series
FOR EACH ROW
INSERT INTO Auditoria_Temporadas_Series(
    Nombre, idSerie, Capitulos, Duracion,
    Calificacion, FechaInicio, FechaFin,
    usuario, modificado, proceso, idTemporada)
VALUES(
    NEW.Nombre, NEW.idSerie, NEW.Capitulos, NEW.Duracion,
    NEW.Calificacion, NEW.FechaInicio, NEW.FechaFin,
    USER(), NOW(), 'Dato Actualizado', NEW.idTemporada) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Elimina_Auditoria_Temporadas_Series
AFTER DELETE ON Temporadas_Series
FOR EACH ROW
INSERT INTO Auditoria_Temporadas_Series(
    Nombre, idSerie, Capitulos, Duracion,
    Calificacion, FechaInicio, FechaFin,
    usuario, modificado, proceso, idTemporada)
VALUES(
    OLD.Nombre, OLD.idSerie, OLD.Capitulos, OLD.Duracion,
    OLD.Calificacion, OLD.FechaInicio, OLD.FechaFin,
    USER(), NOW(), 'Dato Eliminado', OLD.idTemporada) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `IdUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Paterno` varchar(45) DEFAULT NULL,
  `Materno` varchar(45) DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `Celular` bigint(20) DEFAULT NULL,
  `Sexo` char(1) DEFAULT NULL,
  `Correo` varchar(45) DEFAULT NULL,
  `Username` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Raul Gabriel','Geronimo','Herrera','2000-09-07',5528973869,'H','raul090700@gmail.com','Raul','c90d6d172779ddee6dae9af3aa21d7bc');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Agregar_Auditoria_Usuario
AFTER INSERT ON Usuario
FOR EACH ROW
INSERT INTO Auditoria_Usuario(
    Nombre, Paterno, Materno, FechaNacimiento,
    Celular, Sexo, Correo, Username, Password,
    usuario, modificado, proceso, idUsuario)
VALUES(
    NEW.Nombre, NEW.Paterno, NEW.Materno, NEW.FechaNacimiento,
    NEW.Celular, NEW.Sexo, NEW.Correo, NEW.Username, NEW.Password,
    USER(), NOW(), 'Dato Insertado', NEW.idUsuario) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Actualiza_Auditoria_Usuario
AFTER UPDATE ON Usuario
FOR EACH ROW
INSERT INTO Auditoria_Usuario(
    Nombre, Paterno, Materno, FechaNacimiento,
    Celular, Sexo, Correo, Username, Password,
    usuario, modificado, proceso, idUsuario)
VALUES(
    NEW.Nombre, NEW.Paterno, NEW.Materno, NEW.FechaNacimiento,
    NEW.Celular, NEW.Sexo, NEW.Correo, NEW.Username, NEW.Password,
    USER(), NOW(), 'Dato Actualizado', NEW.idUsuario) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Elimina_Auditoria_Usuario
AFTER DELETE ON Usuario
FOR EACH ROW
INSERT INTO Auditoria_Usuario(
    Nombre, Paterno, Materno, FechaNacimiento,
    Celular, Sexo, Correo, Username, Password,
    usuario, modificado, proceso, idUsuario)
VALUES(
    OLD.Nombre, OLD.Paterno, OLD.Materno, OLD.FechaNacimiento,
    OLD.Celular, OLD.Sexo, OLD.Correo, OLD.Username, OLD.Password,
    USER(), NOW(), 'Dato Eliminado', OLD.idUsuario) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `vista_animes`
--

DROP TABLE IF EXISTS `vista_animes`;
/*!50001 DROP VIEW IF EXISTS `vista_animes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_animes` AS SELECT
 1 AS `idAnime`,
  1 AS `Nombre`,
  1 AS `OtrosNombres`,
  1 AS `Genero`,
  1 AS `Portada`,
  1 AS `Temporadas`,
  1 AS `Capitulos`,
  1 AS `FechaInicio`,
  1 AS `Inicio`,
  1 AS `Fin`,
  1 AS `FechaFin`,
  1 AS `Estado`,
  1 AS `Promedio` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_cambios_anime`
--

DROP TABLE IF EXISTS `vista_cambios_anime`;
/*!50001 DROP VIEW IF EXISTS `vista_cambios_anime`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_cambios_anime` AS SELECT
 1 AS `id`,
  1 AS `Nombre`,
  1 AS `OtrosNombres`,
  1 AS `Genero`,
  1 AS `Usuario`,
  1 AS `Modificado`,
  1 AS `Proceso`,
  1 AS `idAnime` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_cambios_caricatura`
--

DROP TABLE IF EXISTS `vista_cambios_caricatura`;
/*!50001 DROP VIEW IF EXISTS `vista_cambios_caricatura`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_cambios_caricatura` AS SELECT
 1 AS `id`,
  1 AS `Nombre`,
  1 AS `NombreSecundario`,
  1 AS `Genero`,
  1 AS `Productora`,
  1 AS `Distribuidora`,
  1 AS `Director`,
  1 AS `Portada`,
  1 AS `Usuario`,
  1 AS `Modificado`,
  1 AS `Proceso`,
  1 AS `idCaricatura` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_cambios_director`
--

DROP TABLE IF EXISTS `vista_cambios_director`;
/*!50001 DROP VIEW IF EXISTS `vista_cambios_director`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_cambios_director` AS SELECT
 1 AS `id`,
  1 AS `Nombre`,
  1 AS `Apellidos`,
  1 AS `NombreArtistico`,
  1 AS `FechaNacimiento`,
  1 AS `FechaDefuncion`,
  1 AS `Sexo`,
  1 AS `Estatura`,
  1 AS `Pais`,
  1 AS `Usuario`,
  1 AS `Modificado`,
  1 AS `Proceso`,
  1 AS `idDirector` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_cambios_pelicula`
--

DROP TABLE IF EXISTS `vista_cambios_pelicula`;
/*!50001 DROP VIEW IF EXISTS `vista_cambios_pelicula`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_cambios_pelicula` AS SELECT
 1 AS `id`,
  1 AS `Nombre`,
  1 AS `NombreSecundario`,
  1 AS `Productora`,
  1 AS `Distribuidora`,
  1 AS `Duracion`,
  1 AS `Genero`,
  1 AS `Tipo`,
  1 AS `Clasificacion`,
  1 AS `Estreno`,
  1 AS `EstrenoMexico`,
  1 AS `Calificacion`,
  1 AS `Director`,
  1 AS `Portada`,
  1 AS `Usuario`,
  1 AS `Modificado`,
  1 AS `Proceso`,
  1 AS `idPelicula` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_cambios_serie`
--

DROP TABLE IF EXISTS `vista_cambios_serie`;
/*!50001 DROP VIEW IF EXISTS `vista_cambios_serie`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_cambios_serie` AS SELECT
 1 AS `id`,
  1 AS `Nombre`,
  1 AS `OtrosNombres`,
  1 AS `Genero`,
  1 AS `Productora`,
  1 AS `Distribuidora`,
  1 AS `Director`,
  1 AS `Portada`,
  1 AS `Usuario`,
  1 AS `Modificado`,
  1 AS `Proceso`,
  1 AS `idSerie` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_cambios_temporadas_anime`
--

DROP TABLE IF EXISTS `vista_cambios_temporadas_anime`;
/*!50001 DROP VIEW IF EXISTS `vista_cambios_temporadas_anime`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_cambios_temporadas_anime` AS SELECT
 1 AS `id`,
  1 AS `Anime`,
  1 AS `Nombre`,
  1 AS `OtrosNombres`,
  1 AS `Capitulos`,
  1 AS `Duracion`,
  1 AS `Idioma`,
  1 AS `Emision`,
  1 AS `FechaInicio`,
  1 AS `FechaFin`,
  1 AS `Estudio`,
  1 AS `Calificacion`,
  1 AS `Portada`,
  1 AS `Usuario`,
  1 AS `Modificado`,
  1 AS `Proceso`,
  1 AS `idTemporada` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_cambios_temporadas_caricatura`
--

DROP TABLE IF EXISTS `vista_cambios_temporadas_caricatura`;
/*!50001 DROP VIEW IF EXISTS `vista_cambios_temporadas_caricatura`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_cambios_temporadas_caricatura` AS SELECT
 1 AS `id`,
  1 AS `Caricatura`,
  1 AS `Nombre`,
  1 AS `Capitulos`,
  1 AS `Duracion`,
  1 AS `Calificacion`,
  1 AS `FechaInicio`,
  1 AS `FechaFin`,
  1 AS `Usuario`,
  1 AS `Modificado`,
  1 AS `Proceso`,
  1 AS `idTemporada` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_cambios_temporadas_emision`
--

DROP TABLE IF EXISTS `vista_cambios_temporadas_emision`;
/*!50001 DROP VIEW IF EXISTS `vista_cambios_temporadas_emision`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_cambios_temporadas_emision` AS SELECT
 1 AS `id`,
  1 AS `Nombre`,
  1 AS `FechaInicio`,
  1 AS `FechaFin`,
  1 AS `Usuario`,
  1 AS `Modificado`,
  1 AS `Proceso`,
  1 AS `idTemporada` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_cambios_temporadas_serie`
--

DROP TABLE IF EXISTS `vista_cambios_temporadas_serie`;
/*!50001 DROP VIEW IF EXISTS `vista_cambios_temporadas_serie`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_cambios_temporadas_serie` AS SELECT
 1 AS `id`,
  1 AS `Serie`,
  1 AS `Nombre`,
  1 AS `Capitulos`,
  1 AS `Duracion`,
  1 AS `Calificacion`,
  1 AS `FechaInicio`,
  1 AS `FechaFin`,
  1 AS `Usuario`,
  1 AS `Modificado`,
  1 AS `Proceso`,
  1 AS `idTemporada` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_cambios_usuario`
--

DROP TABLE IF EXISTS `vista_cambios_usuario`;
/*!50001 DROP VIEW IF EXISTS `vista_cambios_usuario`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_cambios_usuario` AS SELECT
 1 AS `id`,
  1 AS `Nombre`,
  1 AS `Paterno`,
  1 AS `Materno`,
  1 AS `FechaNacimiento`,
  1 AS `Celular`,
  1 AS `Sexo`,
  1 AS `Correo`,
  1 AS `Username`,
  1 AS `Password`,
  1 AS `Modificado`,
  1 AS `Proceso`,
  1 AS `Usuario`,
  1 AS `idUsuario` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_caricaturas`
--

DROP TABLE IF EXISTS `vista_caricaturas`;
/*!50001 DROP VIEW IF EXISTS `vista_caricaturas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_caricaturas` AS SELECT
 1 AS `idCaricatura`,
  1 AS `Nombre`,
  1 AS `NombreSecundario`,
  1 AS `Temporadas`,
  1 AS `Capitulos`,
  1 AS `FechaInicio`,
  1 AS `FechaFin`,
  1 AS `Promedio`,
  1 AS `Genero`,
  1 AS `Productora`,
  1 AS `Distribuidora`,
  1 AS `Director`,
  1 AS `Portada` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_directores`
--

DROP TABLE IF EXISTS `vista_directores`;
/*!50001 DROP VIEW IF EXISTS `vista_directores`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_directores` AS SELECT
 1 AS `idDirector`,
  1 AS `NombreArtistico`,
  1 AS `Nombre`,
  1 AS `Apellidos`,
  1 AS `FechaNacimiento`,
  1 AS `FechaDefuncion`,
  1 AS `Sexo`,
  1 AS `Edad`,
  1 AS `Estatura`,
  1 AS `Estado`,
  1 AS `Pais` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_estudio`
--

DROP TABLE IF EXISTS `vista_estudio`;
/*!50001 DROP VIEW IF EXISTS `vista_estudio`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_estudio` AS SELECT
 1 AS `idEstudio`,
  1 AS `Nombre`,
  1 AS `Animes`,
  1 AS `Fundacion`,
  1 AS `Imagen` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_peliculas`
--

DROP TABLE IF EXISTS `vista_peliculas`;
/*!50001 DROP VIEW IF EXISTS `vista_peliculas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_peliculas` AS SELECT
 1 AS `idPelicula`,
  1 AS `Nombre`,
  1 AS `NombreSecundario`,
  1 AS `Productora`,
  1 AS `Distribuidora`,
  1 AS `Duracion`,
  1 AS `Genero`,
  1 AS `Tipo`,
  1 AS `Clasificacion`,
  1 AS `Estreno`,
  1 AS `EstrenoMexico`,
  1 AS `Calificacion`,
  1 AS `Anios`,
  1 AS `Director`,
  1 AS `Portada` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_series`
--

DROP TABLE IF EXISTS `vista_series`;
/*!50001 DROP VIEW IF EXISTS `vista_series`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_series` AS SELECT
 1 AS `idSerie`,
  1 AS `Nombre`,
  1 AS `OtrosNombres`,
  1 AS `Temporadas`,
  1 AS `Capitulos`,
  1 AS `FechaInicio`,
  1 AS `FechaFin`,
  1 AS `Promedio`,
  1 AS `Genero`,
  1 AS `Productora`,
  1 AS `Distribuidora`,
  1 AS `Director`,
  1 AS `Portada` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_temporadasanime`
--

DROP TABLE IF EXISTS `vista_temporadasanime`;
/*!50001 DROP VIEW IF EXISTS `vista_temporadasanime`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_temporadasanime` AS SELECT
 1 AS `idTemporada`,
  1 AS `idAnime`,
  1 AS `idEstudio`,
  1 AS `idTemporadaEmision`,
  1 AS `Anime`,
  1 AS `Nombre`,
  1 AS `OtrosNombres`,
  1 AS `Capitulos`,
  1 AS `Duration`,
  1 AS `Duracion`,
  1 AS `Idioma`,
  1 AS `Emision`,
  1 AS `DiaEmision`,
  1 AS `FechaInicio`,
  1 AS `Inicio`,
  1 AS `FechaFin`,
  1 AS `Fin`,
  1 AS `Semanas`,
  1 AS `Años`,
  1 AS `Estudio`,
  1 AS `Calificacion`,
  1 AS `Portada` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_temporadascaricatura`
--

DROP TABLE IF EXISTS `vista_temporadascaricatura`;
/*!50001 DROP VIEW IF EXISTS `vista_temporadascaricatura`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_temporadascaricatura` AS SELECT
 1 AS `idTemporada`,
  1 AS `idCaricatura`,
  1 AS `Inicio`,
  1 AS `Caricatura`,
  1 AS `Nombre`,
  1 AS `Capitulos`,
  1 AS `Calificacion`,
  1 AS `Duracion`,
  1 AS `FechaInicio`,
  1 AS `FechaFin` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_temporadasemision`
--

DROP TABLE IF EXISTS `vista_temporadasemision`;
/*!50001 DROP VIEW IF EXISTS `vista_temporadasemision`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_temporadasemision` AS SELECT
 1 AS `idTemporada`,
  1 AS `Nombre`,
  1 AS `FechaInicio`,
  1 AS `FechaFin`,
  1 AS `Animes`,
  1 AS `Promedio` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_temporadasserie`
--

DROP TABLE IF EXISTS `vista_temporadasserie`;
/*!50001 DROP VIEW IF EXISTS `vista_temporadasserie`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_temporadasserie` AS SELECT
 1 AS `idTemporada`,
  1 AS `idSerie`,
  1 AS `Inicio`,
  1 AS `Serie`,
  1 AS `Nombre`,
  1 AS `Capitulos`,
  1 AS `Duracion`,
  1 AS `Calificacion`,
  1 AS `FechaInicio`,
  1 AS `FechaFin` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_usuarios`
--

DROP TABLE IF EXISTS `vista_usuarios`;
/*!50001 DROP VIEW IF EXISTS `vista_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_usuarios` AS SELECT
 1 AS `idUsuario`,
  1 AS `Nombre`,
  1 AS `Paterno`,
  1 AS `Materno`,
  1 AS `FechaNacimiento`,
  1 AS `Edad`,
  1 AS `Celular`,
  1 AS `Sexo`,
  1 AS `Correo`,
  1 AS `Username`,
  1 AS `Cumple` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_animes`
--

/*!50001 DROP VIEW IF EXISTS `vista_animes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_animes` AS select `anime`.`idAnime` AS `idAnime`,trim(`anime`.`Nombre`) AS `Nombre`,trim(`anime`.`OtrosNombres`) AS `OtrosNombres`,`anime`.`Genero` AS `Genero`,`temporadas_anime`.`Portada` AS `Portada`,count(`temporadas_anime`.`idTemporada`) AS `Temporadas`,sum(`temporadas_anime`.`Capitulos`) AS `Capitulos`,date_format(min(`temporadas_anime`.`FechaInicio`),'%d / %M / %Y') AS `FechaInicio`,min(`temporadas_anime`.`FechaInicio`) AS `Inicio`,if(`temporadas_anime`.`FechaFin` is null and `temporadas_anime`.`FechaInicio` is null,' ',if(max(`temporadas_anime`.`FechaInicio` > current_timestamp()),max(`temporadas_anime`.`FechaFin`),if(min(`temporadas_anime`.`FechaFin` is not null),max(`temporadas_anime`.`FechaFin`),if(curdate() < `temporadas_anime`.`FechaInicio`,' ',curdate())))) AS `Fin`,if(`temporadas_anime`.`FechaFin` is null and `temporadas_anime`.`FechaInicio` is null,' ',if(max(`temporadas_anime`.`FechaInicio` > current_timestamp()),date_format(max(`temporadas_anime`.`FechaFin`),'%d / %M / %Y'),if(min(`temporadas_anime`.`FechaFin` is not null),date_format(max(`temporadas_anime`.`FechaFin`),'%d / %M / %Y'),if(current_timestamp() < `temporadas_anime`.`FechaInicio`,' ',date_format(current_timestamp(),'%d / %M / %Y'))))) AS `FechaFin`,if(`temporadas_anime`.`FechaFin` is null and `temporadas_anime`.`FechaInicio` is null,' ',if(max(`temporadas_anime`.`FechaInicio` > current_timestamp()),'Estreno',if(min(`temporadas_anime`.`FechaFin` is not null),'Finalizado','Emision'))) AS `Estado`,ifnull(if(avg(`temporadas_anime`.`Calificacion`) = 10,format(avg(`temporadas_anime`.`Calificacion`),0),format(avg(`temporadas_anime`.`Calificacion`),2)),' ') AS `Promedio` from (`anime` left join `temporadas_anime` on(`temporadas_anime`.`idAnime` = `anime`.`idAnime` and `temporadas_anime`.`Duracion` <= '00:59:00')) group by `anime`.`idAnime` order by `anime`.`Nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_cambios_anime`
--

/*!50001 DROP VIEW IF EXISTS `vista_cambios_anime`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_cambios_anime` AS select `auditoria_anime`.`id` AS `id`,`auditoria_anime`.`Nombre` AS `Nombre`,`auditoria_anime`.`OtrosNombres` AS `OtrosNombres`,`auditoria_anime`.`Genero` AS `Genero`,`auditoria_anime`.`usuario` AS `Usuario`,date_format(`auditoria_anime`.`modificado`,'%d / %M / %Y') AS `Modificado`,`auditoria_anime`.`proceso` AS `Proceso`,`auditoria_anime`.`idAnime` AS `idAnime` from `auditoria_anime` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_cambios_caricatura`
--

/*!50001 DROP VIEW IF EXISTS `vista_cambios_caricatura`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_cambios_caricatura` AS select `auditoria_caricatura`.`id` AS `id`,`auditoria_caricatura`.`Nombre` AS `Nombre`,`auditoria_caricatura`.`OtrosNombres` AS `NombreSecundario`,`genero`.`Nombre` AS `Genero`,`productora`.`Nombre` AS `Productora`,`distribuidora`.`Nombre` AS `Distribuidora`,`director`.`NombreArtistico` AS `Director`,`auditoria_caricatura`.`Portada` AS `Portada`,`auditoria_caricatura`.`usuario` AS `Usuario`,date_format(`auditoria_caricatura`.`modificado`,'%d / %M / %Y') AS `Modificado`,`auditoria_caricatura`.`proceso` AS `Proceso`,`auditoria_caricatura`.`idCaricatura` AS `idCaricatura` from ((((`auditoria_caricatura` join `genero` on(`auditoria_caricatura`.`Genero` = `genero`.`idGenero`)) join `productora` on(`auditoria_caricatura`.`idProductora` = `productora`.`idProductora`)) join `productora` `distribuidora` on(`auditoria_caricatura`.`idDistribuidora` = `distribuidora`.`idProductora`)) join `director` on(`auditoria_caricatura`.`idDirector` = `director`.`idDirector`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_cambios_director`
--

/*!50001 DROP VIEW IF EXISTS `vista_cambios_director`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_cambios_director` AS select `auditoria_director`.`id` AS `id`,`auditoria_director`.`Nombre` AS `Nombre`,`auditoria_director`.`Apellidos` AS `Apellidos`,`auditoria_director`.`NombreArtistico` AS `NombreArtistico`,date_format(`auditoria_director`.`FechaNacimiento`,'%d / %M / %Y') AS `FechaNacimiento`,date_format(`auditoria_director`.`FechaDefuncion`,'%d / %M / %Y') AS `FechaDefuncion`,if(`auditoria_director`.`Sexo` = 'H','Hombre','Mujer') AS `Sexo`,format(`auditoria_director`.`Estatura`,2) AS `Estatura`,`pais`.`Nombre` AS `Pais`,`auditoria_director`.`Usuario` AS `Usuario`,date_format(`auditoria_director`.`Modificado`,'%d / %M / %Y') AS `Modificado`,`auditoria_director`.`Proceso` AS `Proceso`,`auditoria_director`.`idDirector` AS `idDirector` from (`auditoria_director` join `pais` on(`auditoria_director`.`Nacionalidad` = `pais`.`idPais`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_cambios_pelicula`
--

/*!50001 DROP VIEW IF EXISTS `vista_cambios_pelicula`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_cambios_pelicula` AS select `auditoria_peliculas`.`id` AS `id`,`auditoria_peliculas`.`Nombre` AS `Nombre`,replace(`auditoria_peliculas`.`OtrosNombres`,'Ã±','ñ') AS `NombreSecundario`,`productora`.`Nombre` AS `Productora`,`distribuidora`.`Nombre` AS `Distribuidora`,date_format(`auditoria_peliculas`.`Duracion`,'%Hh %im') AS `Duracion`,`genero`.`Nombre` AS `Genero`,`auditoria_peliculas`.`Tipo` AS `Tipo`,`clasificacion`.`Nombre` AS `Clasificacion`,date_format(`auditoria_peliculas`.`Estreno`,'%d / %M / %Y') AS `Estreno`,date_format(`auditoria_peliculas`.`EstrenoMexico`,'%d / %M / %Y') AS `EstrenoMexico`,if(`auditoria_peliculas`.`Calificacion` = 10,format(`auditoria_peliculas`.`Calificacion`,0),format(`auditoria_peliculas`.`Calificacion`,1)) AS `Calificacion`,`director`.`NombreArtistico` AS `Director`,`auditoria_peliculas`.`Portada` AS `Portada`,`auditoria_peliculas`.`usuario` AS `Usuario`,date_format(`auditoria_peliculas`.`modificado`,'%d / %M / %Y') AS `Modificado`,`auditoria_peliculas`.`proceso` AS `Proceso`,`auditoria_peliculas`.`idPelicula` AS `idPelicula` from (((((`auditoria_peliculas` join `productora` on(`productora`.`idProductora` = `auditoria_peliculas`.`idProductora`)) join `distribuidora` on(`distribuidora`.`idDistribuidora` = `auditoria_peliculas`.`idDistribuidora`)) join `genero` on(`genero`.`idGenero` = `auditoria_peliculas`.`Genero`)) join `clasificacion` on(`clasificacion`.`idClasificacion` = `auditoria_peliculas`.`Clasificacion`)) join `director` on(`auditoria_peliculas`.`idDirector` = `director`.`idDirector`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_cambios_serie`
--

/*!50001 DROP VIEW IF EXISTS `vista_cambios_serie`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_cambios_serie` AS select `auditoria_series`.`id` AS `id`,`auditoria_series`.`Nombre` AS `Nombre`,`auditoria_series`.`OtrosNombres` AS `OtrosNombres`,`genero`.`Nombre` AS `Genero`,`productora`.`Nombre` AS `Productora`,`distribuidora`.`Nombre` AS `Distribuidora`,`director`.`NombreArtistico` AS `Director`,`auditoria_series`.`Portada` AS `Portada`,`auditoria_series`.`usuario` AS `Usuario`,date_format(`auditoria_series`.`modificado`,'%d / %M / %Y') AS `Modificado`,`auditoria_series`.`proceso` AS `Proceso`,`auditoria_series`.`idSerie` AS `idSerie` from ((((`auditoria_series` join `genero` on(`genero`.`idGenero` = `auditoria_series`.`Genero`)) join `productora` on(`auditoria_series`.`idProductora` = `productora`.`idProductora`)) join `productora` `distribuidora` on(`auditoria_series`.`idDistribuidora` = `distribuidora`.`idProductora`)) join `director` on(`auditoria_series`.`idDirector` = `director`.`idDirector`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_cambios_temporadas_anime`
--

/*!50001 DROP VIEW IF EXISTS `vista_cambios_temporadas_anime`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_cambios_temporadas_anime` AS select `auditoria_temporadas_anime`.`id` AS `id`,`anime`.`Nombre` AS `Anime`,`auditoria_temporadas_anime`.`Nombre` AS `Nombre`,`auditoria_temporadas_anime`.`OtrosNombres` AS `OtrosNombres`,`auditoria_temporadas_anime`.`Capitulos` AS `Capitulos`,if(date_format(`auditoria_temporadas_anime`.`Duracion`,'%H') = '00',date_format(`auditoria_temporadas_anime`.`Duracion`,'%i min'),date_format(`auditoria_temporadas_anime`.`Duracion`,'%Hh %im')) AS `Duracion`,`auditoria_temporadas_anime`.`Idioma` AS `Idioma`,`temporadas_emision`.`Nombre` AS `Emision`,date_format(`auditoria_temporadas_anime`.`FechaInicio`,'%d / %M / %Y') AS `FechaInicio`,date_format(`auditoria_temporadas_anime`.`FechaFin`,'%d / %M / %Y') AS `FechaFin`,`estudioanimacion`.`Nombre` AS `Estudio`,if(`auditoria_temporadas_anime`.`Calificacion` = 10,format(`auditoria_temporadas_anime`.`Calificacion`,0),format(`auditoria_temporadas_anime`.`Calificacion`,2)) AS `Calificacion`,`auditoria_temporadas_anime`.`Portada` AS `Portada`,`auditoria_temporadas_anime`.`usuario` AS `Usuario`,date_format(`auditoria_temporadas_anime`.`modificado`,'%d / %M / %Y') AS `Modificado`,`auditoria_temporadas_anime`.`proceso` AS `Proceso`,`auditoria_temporadas_anime`.`idTemporada` AS `idTemporada` from (((`auditoria_temporadas_anime` join `anime` on(`auditoria_temporadas_anime`.`idAnime` = `anime`.`idAnime`)) join `temporadas_emision` on(`auditoria_temporadas_anime`.`idTemporadaEmision` = `temporadas_emision`.`idTemporada`)) join `estudioanimacion` on(`auditoria_temporadas_anime`.`idEstudio` = `estudioanimacion`.`idEstudio`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_cambios_temporadas_caricatura`
--

/*!50001 DROP VIEW IF EXISTS `vista_cambios_temporadas_caricatura`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_cambios_temporadas_caricatura` AS select `auditoria_temporadas_caricatura`.`id` AS `id`,`caricatura`.`Nombre` AS `Caricatura`,`auditoria_temporadas_caricatura`.`Nombre` AS `Nombre`,`auditoria_temporadas_caricatura`.`Capitulos` AS `Capitulos`,if(date_format(`auditoria_temporadas_caricatura`.`Duracion`,'%H') = '00',date_format(`auditoria_temporadas_caricatura`.`Duracion`,'%i min'),date_format(`auditoria_temporadas_caricatura`.`Duracion`,'%Hh %im')) AS `Duracion`,if(`auditoria_temporadas_caricatura`.`Calificacion` = 10,format(`auditoria_temporadas_caricatura`.`Calificacion`,0),format(`auditoria_temporadas_caricatura`.`Calificacion`,2)) AS `Calificacion`,date_format(`auditoria_temporadas_caricatura`.`FechaInicio`,'%d / %M / %Y') AS `FechaInicio`,date_format(`auditoria_temporadas_caricatura`.`FechaFin`,'%d / %M / %Y') AS `FechaFin`,`auditoria_temporadas_caricatura`.`usuario` AS `Usuario`,date_format(`auditoria_temporadas_caricatura`.`modificado`,'%d / %M / %Y') AS `Modificado`,`auditoria_temporadas_caricatura`.`proceso` AS `Proceso`,`auditoria_temporadas_caricatura`.`idTemporada` AS `idTemporada` from (`auditoria_temporadas_caricatura` join `caricatura` on(`auditoria_temporadas_caricatura`.`idCaricatura` = `caricatura`.`idCaricatura`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_cambios_temporadas_emision`
--

/*!50001 DROP VIEW IF EXISTS `vista_cambios_temporadas_emision`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_cambios_temporadas_emision` AS select `auditoria_temporadas_emision`.`id` AS `id`,`auditoria_temporadas_emision`.`Nombre` AS `Nombre`,date_format(`auditoria_temporadas_emision`.`FechaInicio`,'%d / %M / %Y') AS `FechaInicio`,date_format(`auditoria_temporadas_emision`.`FechaFin`,'%d / %M / %Y') AS `FechaFin`,`auditoria_temporadas_emision`.`usuario` AS `Usuario`,date_format(`auditoria_temporadas_emision`.`modificado`,'%d / %M / %Y') AS `Modificado`,`auditoria_temporadas_emision`.`proceso` AS `Proceso`,`auditoria_temporadas_emision`.`idTemporada` AS `idTemporada` from `auditoria_temporadas_emision` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_cambios_temporadas_serie`
--

/*!50001 DROP VIEW IF EXISTS `vista_cambios_temporadas_serie`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_cambios_temporadas_serie` AS select `auditoria_temporadas_series`.`id` AS `id`,`series`.`Nombre` AS `Serie`,`auditoria_temporadas_series`.`Nombre` AS `Nombre`,`auditoria_temporadas_series`.`Capitulos` AS `Capitulos`,time_format(`auditoria_temporadas_series`.`Duracion`,'%i min') AS `Duracion`,if(`auditoria_temporadas_series`.`Calificacion` = 10,format(`auditoria_temporadas_series`.`Calificacion`,0),format(`auditoria_temporadas_series`.`Calificacion`,2)) AS `Calificacion`,date_format(`auditoria_temporadas_series`.`FechaInicio`,'%d / %M / %Y') AS `FechaInicio`,date_format(`auditoria_temporadas_series`.`FechaFin`,'%d / %M / %Y') AS `FechaFin`,`auditoria_temporadas_series`.`usuario` AS `Usuario`,date_format(`auditoria_temporadas_series`.`modificado`,'%d / %M / %Y') AS `Modificado`,`auditoria_temporadas_series`.`proceso` AS `Proceso`,`auditoria_temporadas_series`.`idTemporada` AS `idTemporada` from (`auditoria_temporadas_series` join `series` on(`auditoria_temporadas_series`.`idSerie` = `series`.`idSerie`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_cambios_usuario`
--

/*!50001 DROP VIEW IF EXISTS `vista_cambios_usuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_cambios_usuario` AS select `auditoria_usuario`.`id` AS `id`,`auditoria_usuario`.`Nombre` AS `Nombre`,`auditoria_usuario`.`Paterno` AS `Paterno`,`auditoria_usuario`.`Materno` AS `Materno`,date_format(`auditoria_usuario`.`FechaNacimiento`,'%d / %M / %Y') AS `FechaNacimiento`,`auditoria_usuario`.`Celular` AS `Celular`,if(`auditoria_usuario`.`Sexo` = 'H','Hombre','Mujer') AS `Sexo`,`auditoria_usuario`.`Correo` AS `Correo`,`auditoria_usuario`.`Username` AS `Username`,`auditoria_usuario`.`Password` AS `Password`,date_format(`auditoria_usuario`.`modificado`,'%d / %M / %Y') AS `Modificado`,`auditoria_usuario`.`proceso` AS `Proceso`,`auditoria_usuario`.`usuario` AS `Usuario`,`auditoria_usuario`.`idUsuario` AS `idUsuario` from `auditoria_usuario` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_caricaturas`
--

/*!50001 DROP VIEW IF EXISTS `vista_caricaturas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_caricaturas` AS select `caricatura`.`idCaricatura` AS `idCaricatura`,`caricatura`.`Nombre` AS `Nombre`,replace(`caricatura`.`OtrosNombres`,'AraÃ±a','Araña') AS `NombreSecundario`,count(`temporadas_caricatura`.`idTemporada`) AS `Temporadas`,sum(`temporadas_caricatura`.`Capitulos`) AS `Capitulos`,date_format(min(`temporadas_caricatura`.`FechaInicio`),'%d / %M / %Y') AS `FechaInicio`,if(`temporadas_caricatura`.`FechaFin` is null and `temporadas_caricatura`.`FechaInicio` is null,' ',if(max(`temporadas_caricatura`.`FechaInicio` > current_timestamp()),date_format(max(`temporadas_caricatura`.`FechaFin`),'%d / %M / %Y'),if(min(`temporadas_caricatura`.`FechaFin` is not null),date_format(max(`temporadas_caricatura`.`FechaFin`),'%d / %M / %Y'),if(current_timestamp() < `temporadas_caricatura`.`FechaInicio`,' ',date_format(current_timestamp(),'%d / %M / %Y'))))) AS `FechaFin`,if(avg(`temporadas_caricatura`.`Calificacion`) = 10,format(avg(`temporadas_caricatura`.`Calificacion`),0),format(avg(`temporadas_caricatura`.`Calificacion`),2)) AS `Promedio`,`genero`.`Nombre` AS `Genero`,`productora`.`Nombre` AS `Productora`,`distribuidora`.`Nombre` AS `Distribuidora`,`director`.`NombreArtistico` AS `Director`,`caricatura`.`Portada` AS `Portada` from (((((`caricatura` left join `genero` on(`caricatura`.`Genero` = `genero`.`idGenero`)) left join `productora` on(`caricatura`.`idProductora` = `productora`.`idProductora`)) left join `productora` `distribuidora` on(`caricatura`.`idDistribuidora` = `distribuidora`.`idProductora`)) left join `director` on(`caricatura`.`idDirector` = `director`.`idDirector`)) left join `temporadas_caricatura` on(`temporadas_caricatura`.`idCaricatura` = `caricatura`.`idCaricatura`)) group by `caricatura`.`idCaricatura` order by `caricatura`.`Nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_directores`
--

/*!50001 DROP VIEW IF EXISTS `vista_directores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_directores` AS select `director`.`idDirector` AS `idDirector`,`director`.`NombreArtistico` AS `NombreArtistico`,`director`.`Nombre` AS `Nombre`,`director`.`Apellidos` AS `Apellidos`,date_format(`director`.`FechaNacimiento`,'%d / %M / %Y') AS `FechaNacimiento`,date_format(`director`.`FechaDefuncion`,'%d / %M / %Y') AS `FechaDefuncion`,if(`director`.`Sexo` = 'H','Hombre','Mujer') AS `Sexo`,if(`director`.`FechaNacimiento` >= `director`.`FechaDefuncion`,'Fecha Invalida',timestampdiff(YEAR,`director`.`FechaNacimiento`,ifnull(`director`.`FechaDefuncion`,current_timestamp()))) AS `Edad`,format(`director`.`Estatura`,2) AS `Estatura`,if(ifnull(`director`.`FechaDefuncion`,'ACTIVO') = 'ACTIVO','Activo','Inactivo') AS `Estado`,concat_ws(' - ',`pais`.`Nombre`,`pais`.`Nacionalidad`) AS `Pais` from (`director` join `pais` on(`director`.`Nacionalidad` = `pais`.`idPais`)) order by `director`.`NombreArtistico` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_estudio`
--

/*!50001 DROP VIEW IF EXISTS `vista_estudio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_estudio` AS select `estudioanimacion`.`idEstudio` AS `idEstudio`,trim(`estudioanimacion`.`Nombre`) AS `Nombre`,count(`temporadas_anime`.`idTemporada`) AS `Animes`,date_format(`estudioanimacion`.`Fundacion`,'%M / %Y') AS `Fundacion`,`estudioanimacion`.`Imagen` AS `Imagen` from (`estudioanimacion` left join `temporadas_anime` on(`temporadas_anime`.`idEstudio` = `estudioanimacion`.`idEstudio`)) group by `estudioanimacion`.`idEstudio` order by `estudioanimacion`.`Nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_peliculas`
--

/*!50001 DROP VIEW IF EXISTS `vista_peliculas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_peliculas` AS select `peliculas`.`idPelicula` AS `idPelicula`,`peliculas`.`Nombre` AS `Nombre`,replace(`peliculas`.`OtrosNombres`,'Ã±','ñ') AS `NombreSecundario`,`productora`.`Nombre` AS `Productora`,`distribuidora`.`Nombre` AS `Distribuidora`,date_format(`peliculas`.`Duracion`,'%Hh %im') AS `Duracion`,`genero`.`Nombre` AS `Genero`,`peliculas`.`Tipo` AS `Tipo`,`clasificacion`.`Nombre` AS `Clasificacion`,date_format(`peliculas`.`Estreno`,'%d / %M / %Y') AS `Estreno`,date_format(`peliculas`.`EstrenoMexico`,'%d / %M / %Y') AS `EstrenoMexico`,if(`peliculas`.`Calificacion` = 10,format(`peliculas`.`Calificacion`,0),format(`peliculas`.`Calificacion`,1)) AS `Calificacion`,if(`peliculas`.`Estreno` is null,'Próximamente',timestampdiff(YEAR,`peliculas`.`Estreno`,current_timestamp())) AS `Anios`,`director`.`NombreArtistico` AS `Director`,`peliculas`.`Portada` AS `Portada` from (((((`peliculas` join `productora` on(`productora`.`idProductora` = `peliculas`.`idProductora`)) join `distribuidora` on(`distribuidora`.`idDistribuidora` = `peliculas`.`idDistribuidora`)) join `genero` on(`genero`.`idGenero` = `peliculas`.`Genero`)) join `clasificacion` on(`clasificacion`.`idClasificacion` = `peliculas`.`Clasificacion`)) join `director` on(`peliculas`.`idDirector` = `director`.`idDirector`)) order by `peliculas`.`Nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_series`
--

/*!50001 DROP VIEW IF EXISTS `vista_series`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_series` AS select `series`.`idSerie` AS `idSerie`,`series`.`Nombre` AS `Nombre`,`series`.`OtrosNombres` AS `OtrosNombres`,count(`temporadas_series`.`idTemporada`) AS `Temporadas`,sum(`temporadas_series`.`Capitulos`) AS `Capitulos`,date_format(min(`temporadas_series`.`FechaInicio`),'%d / %M / %Y') AS `FechaInicio`,if(`temporadas_series`.`FechaFin` is null and `temporadas_series`.`FechaInicio` is null,' ',if(max(`temporadas_series`.`FechaInicio` > current_timestamp()),date_format(max(`temporadas_series`.`FechaFin`),'%d / %M / %Y'),if(min(`temporadas_series`.`FechaFin` is not null),date_format(max(`temporadas_series`.`FechaFin`),'%d / %M / %Y'),if(current_timestamp() < `temporadas_series`.`FechaInicio`,' ',date_format(current_timestamp(),'%d / %M / %Y'))))) AS `FechaFin`,if(avg(`temporadas_series`.`Calificacion`) = 10,format(avg(`temporadas_series`.`Calificacion`),0),format(avg(`temporadas_series`.`Calificacion`),2)) AS `Promedio`,`genero`.`Nombre` AS `Genero`,`productora`.`Nombre` AS `Productora`,`distribuidora`.`Nombre` AS `Distribuidora`,`director`.`NombreArtistico` AS `Director`,`series`.`Portada` AS `Portada` from (((((`series` left join `genero` on(`genero`.`idGenero` = `series`.`Genero`)) left join `productora` on(`series`.`idProductora` = `productora`.`idProductora`)) left join `distribuidora` on(`series`.`idDistribuidora` = `distribuidora`.`idDistribuidora`)) left join `director` on(`series`.`idDirector` = `director`.`idDirector`)) left join `temporadas_series` on(`temporadas_series`.`idSerie` = `series`.`idSerie`)) group by `series`.`idSerie` order by `series`.`Nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_temporadasanime`
--

/*!50001 DROP VIEW IF EXISTS `vista_temporadasanime`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_temporadasanime` AS select `temporadas_anime`.`idTemporada` AS `idTemporada`,`anime`.`idAnime` AS `idAnime`,`estudioanimacion`.`idEstudio` AS `idEstudio`,`temporadas_emision`.`idTemporada` AS `idTemporadaEmision`,trim(`anime`.`Nombre`) AS `Anime`,trim(`temporadas_anime`.`Nombre`) AS `Nombre`,trim(`temporadas_anime`.`OtrosNombres`) AS `OtrosNombres`,`temporadas_anime`.`Capitulos` AS `Capitulos`,`temporadas_anime`.`Duracion` AS `Duration`,if(date_format(`temporadas_anime`.`Duracion`,'%H') = '00',date_format(`temporadas_anime`.`Duracion`,'%i min'),date_format(`temporadas_anime`.`Duracion`,'%Hh %im')) AS `Duracion`,`temporadas_anime`.`Idioma` AS `Idioma`,replace(`temporadas_emision`.`Nombre`,'Otonio','Otoño') AS `Emision`,dayname(`temporadas_anime`.`FechaInicio`) AS `DiaEmision`,date_format(`temporadas_anime`.`FechaInicio`,'%d / %M / %Y') AS `FechaInicio`,`temporadas_anime`.`FechaInicio` AS `Inicio`,ifnull(date_format(`temporadas_anime`.`FechaFin`,'%d / %M / %Y'),date_format(current_timestamp(),'%d / %M / %Y')) AS `FechaFin`,ifnull(`temporadas_anime`.`FechaFin`,curdate()) AS `Fin`,ifnull(timestampdiff(WEEK,`temporadas_anime`.`FechaInicio`,`temporadas_anime`.`FechaFin`),timestampdiff(WEEK,`temporadas_anime`.`FechaInicio`,current_timestamp())) AS `Semanas`,timestampdiff(YEAR,`temporadas_anime`.`FechaInicio`,current_timestamp()) AS `Años`,`estudioanimacion`.`Nombre` AS `Estudio`,if(`temporadas_anime`.`Calificacion` = 10,format(`temporadas_anime`.`Calificacion`,0),format(`temporadas_anime`.`Calificacion`,2)) AS `Calificacion`,`temporadas_anime`.`Portada` AS `Portada` from (((`temporadas_anime` join `anime` on(`temporadas_anime`.`idAnime` = `anime`.`idAnime`)) join `temporadas_emision` on(`temporadas_anime`.`idTemporadaEmision` = `temporadas_emision`.`idTemporada`)) join `estudioanimacion` on(`temporadas_anime`.`idEstudio` = `estudioanimacion`.`idEstudio`)) order by `anime`.`Nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_temporadascaricatura`
--

/*!50001 DROP VIEW IF EXISTS `vista_temporadascaricatura`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_temporadascaricatura` AS select `temporadas_caricatura`.`idTemporada` AS `idTemporada`,`caricatura`.`idCaricatura` AS `idCaricatura`,`temporadas_caricatura`.`FechaInicio` AS `Inicio`,`caricatura`.`Nombre` AS `Caricatura`,`temporadas_caricatura`.`Nombre` AS `Nombre`,`temporadas_caricatura`.`Capitulos` AS `Capitulos`,if(`temporadas_caricatura`.`Calificacion` = 10,format(`temporadas_caricatura`.`Calificacion`,0),format(`temporadas_caricatura`.`Calificacion`,2)) AS `Calificacion`,if(date_format(`temporadas_caricatura`.`Duracion`,'%H') = '00',date_format(`temporadas_caricatura`.`Duracion`,'%i min'),date_format(`temporadas_caricatura`.`Duracion`,'%Hh %im')) AS `Duracion`,date_format(`temporadas_caricatura`.`FechaInicio`,'%d / %M / %Y') AS `FechaInicio`,ifnull(date_format(`temporadas_caricatura`.`FechaFin`,'%d / %M / %Y'),date_format(current_timestamp(),'%d / %M / %Y')) AS `FechaFin` from (`temporadas_caricatura` join `caricatura` on(`temporadas_caricatura`.`idCaricatura` = `caricatura`.`idCaricatura`)) order by `caricatura`.`Nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_temporadasemision`
--

/*!50001 DROP VIEW IF EXISTS `vista_temporadasemision`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_temporadasemision` AS select `temporadas_emision`.`idTemporada` AS `idTemporada`,replace(`temporadas_emision`.`Nombre`,'Otonio','Otoño') AS `Nombre`,date_format(`temporadas_emision`.`FechaInicio`,'%d / %M / %Y') AS `FechaInicio`,date_format(`temporadas_emision`.`FechaFin`,'%d / %M / %Y') AS `FechaFin`,count(`temporadas_anime`.`idTemporadaEmision`) AS `Animes`,ifnull(if(avg(`temporadas_anime`.`Calificacion`) = 10,format(avg(`temporadas_anime`.`Calificacion`),0),format(avg(`temporadas_anime`.`Calificacion`),2)),' ') AS `Promedio` from (`temporadas_emision` left join `temporadas_anime` on(`temporadas_anime`.`idTemporadaEmision` = `temporadas_emision`.`idTemporada`)) group by `temporadas_emision`.`idTemporada` order by `temporadas_emision`.`Nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_temporadasserie`
--

/*!50001 DROP VIEW IF EXISTS `vista_temporadasserie`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_temporadasserie` AS select `temporadas_series`.`idTemporada` AS `idTemporada`,`series`.`idSerie` AS `idSerie`,`temporadas_series`.`FechaInicio` AS `Inicio`,`series`.`Nombre` AS `Serie`,`temporadas_series`.`Nombre` AS `Nombre`,`temporadas_series`.`Capitulos` AS `Capitulos`,if(date_format(`temporadas_series`.`Duracion`,'%H') = '00',date_format(`temporadas_series`.`Duracion`,'%i min'),date_format(`temporadas_series`.`Duracion`,'%Hh %im')) AS `Duracion`,if(`temporadas_series`.`Calificacion` = 10,format(`temporadas_series`.`Calificacion`,0),format(`temporadas_series`.`Calificacion`,2)) AS `Calificacion`,date_format(`temporadas_series`.`FechaInicio`,'%d / %M / %Y') AS `FechaInicio`,ifnull(date_format(`temporadas_series`.`FechaFin`,'%d / %M / %Y'),date_format(current_timestamp(),'%d / %M / %Y')) AS `FechaFin` from (`temporadas_series` join `series` on(`temporadas_series`.`idSerie` = `series`.`idSerie`)) order by `series`.`Nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_usuarios`
--

/*!50001 DROP VIEW IF EXISTS `vista_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_usuarios` AS select `usuario`.`IdUsuario` AS `idUsuario`,`usuario`.`Nombre` AS `Nombre`,`usuario`.`Paterno` AS `Paterno`,`usuario`.`Materno` AS `Materno`,date_format(`usuario`.`FechaNacimiento`,'%d / %M / %Y') AS `FechaNacimiento`,timestampdiff(YEAR,`usuario`.`FechaNacimiento`,current_timestamp()) AS `Edad`,concat('+ (',left(`usuario`.`Celular`,3),') ',substr(`usuario`.`Celular`,4,3),'-',substr(`usuario`.`Celular`,7,4)) AS `Celular`,if(`usuario`.`Sexo` = 'H','Hombre','Mujer') AS `Sexo`,`usuario`.`Correo` AS `Correo`,`usuario`.`Username` AS `Username`,if(concat_ws('-',year(current_timestamp()),month(`usuario`.`FechaNacimiento`),dayofmonth(`usuario`.`FechaNacimiento`)) > current_timestamp(),to_days(cast(concat_ws('-',year(current_timestamp()),month(`usuario`.`FechaNacimiento`),dayofmonth(`usuario`.`FechaNacimiento`)) as date)) - to_days(current_timestamp()),to_days(cast(concat_ws('-',year(curdate() + interval 1 year),month(`usuario`.`FechaNacimiento`),dayofmonth(`usuario`.`FechaNacimiento`)) as date)) - to_days(current_timestamp())) AS `Cumple` from `usuario` order by `usuario`.`Nombre` */;
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

-- Dump completed on 2023-02-08 19:12:12
