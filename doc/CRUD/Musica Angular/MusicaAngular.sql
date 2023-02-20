-- MariaDB dump 10.19  Distrib 10.10.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: MusicaAngular
-- ------------------------------------------------------
-- Server version	10.10.2-MariaDB

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
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album` (
  `idAlbum` int(11) NOT NULL AUTO_INCREMENT,
  `idGrupo` int(11) DEFAULT NULL,
  `idDisquera` int(11) DEFAULT NULL,
  `Nombre` varchar(60) DEFAULT NULL,
  `Duracion` time DEFAULT NULL,
  `Lanzamiento` varchar(50) DEFAULT NULL,
  `Grabacion` varchar(200) DEFAULT NULL,
  `Genero` varchar(100) DEFAULT NULL,
  `Portada` text DEFAULT NULL,
  PRIMARY KEY (`idAlbum`),
  KEY `idGrupo` (`idGrupo`),
  KEY `idDisquera` (`idDisquera`),
  CONSTRAINT `album_ibfk_1` FOREIGN KEY (`idGrupo`) REFERENCES `grupo` (`idGrupo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `album_ibfk_2` FOREIGN KEY (`idDisquera`) REFERENCES `disquera` (`idDisquera`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artista`
--

DROP TABLE IF EXISTS `artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artista` (
  `idArtista` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(70) DEFAULT NULL,
  `NombreArtistico` varchar(50) DEFAULT NULL,
  `Genero` char(1) DEFAULT NULL,
  `FechaNacimiento` varchar(50) DEFAULT NULL, 
  `FechaFinado` varchar(50) DEFAULT NULL, 
  `Estatura` double DEFAULT NULL,
  `idNacionalidad` int(11) DEFAULT NULL,
  `Instrumentos` varchar(100) DEFAULT NULL,
  `TipoVoz` varchar(50) DEFAULT NULL,
  `Foto` text DEFAULT NULL,
  PRIMARY KEY (`idArtista`),
  KEY `idNacionalidad` (`idNacionalidad`),
  CONSTRAINT `artista_ibfk_1` FOREIGN KEY (`idNacionalidad`) REFERENCES `pais` (`idPais`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista`
--

LOCK TABLES `artista` WRITE;
/*!40000 ALTER TABLE `artista` DISABLE KEYS */;
/*!40000 ALTER TABLE `artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artista_grupo`
--

DROP TABLE IF EXISTS `artista_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artista_grupo` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `idArtista` int(11) DEFAULT NULL,
  `idGrupo` int(11) DEFAULT NULL,
  `FechaInicio` varchar(50) DEFAULT NULL,
  `FechaFin` varchar(50) DEFAULT NULL,
  `idInstrumento` int(11) DEFAULT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `idArtista` (`idArtista`),
  KEY `idGrupo` (`idGrupo`),
  KEY `idInstrumento` (`idInstrumento`),
  CONSTRAINT `artista_grupo_ibfk_1` FOREIGN KEY (`idArtista`) REFERENCES `artista` (`idArtista`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `artista_grupo_ibfk_2` FOREIGN KEY (`idGrupo`) REFERENCES `grupo` (`idGrupo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `artista_grupo_ibfk_3` FOREIGN KEY (`idInstrumento`) REFERENCES `instrumento` (`idInstrumento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista_grupo`
--

LOCK TABLES `artista_grupo` WRITE;
/*!40000 ALTER TABLE `artista_grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `artista_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canciones`
--

DROP TABLE IF EXISTS `canciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canciones` (
  `idCancion` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(70) DEFAULT NULL,
  `Duracion` time DEFAULT NULL,
  `Publicacion` varchar(50) DEFAULT NULL,
  `Genero` varchar(100) DEFAULT NULL,
  `Idioma` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idCancion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canciones`
--

LOCK TABLES `canciones` WRITE;
/*!40000 ALTER TABLE `canciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `canciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canciones_album`
--

DROP TABLE IF EXISTS `canciones_album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canciones_album` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `idAlbum` int(11) DEFAULT NULL,
  `idCancion` int(11) DEFAULT NULL,
  `Numero` int(11) DEFAULT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `idAlbum` (`idAlbum`),
  KEY `idCancion` (`idCancion`),
  CONSTRAINT `canciones_album_ibfk_1` FOREIGN KEY (`idAlbum`) REFERENCES `album` (`idAlbum`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `canciones_album_ibfk_2` FOREIGN KEY (`idCancion`) REFERENCES `canciones` (`idCancion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canciones_album`
--

LOCK TABLES `canciones_album` WRITE;
/*!40000 ALTER TABLE `canciones_album` DISABLE KEYS */;
/*!40000 ALTER TABLE `canciones_album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disquera`
--

DROP TABLE IF EXISTS `disquera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disquera` (
  `idDisquera` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(60) DEFAULT NULL,
  `Fundacion` varchar(50) DEFAULT NULL,
  `Fundador` varchar(100) DEFAULT NULL,
  `Generos` varchar(100) DEFAULT NULL,
  `idPais` int(11) DEFAULT NULL,
  `Logo` text DEFAULT NULL,
  PRIMARY KEY (`idDisquera`),
  KEY `idPais` (`idPais`),
  CONSTRAINT `disquera_ibfk_1` FOREIGN KEY (`idPais`) REFERENCES `pais` (`idPais`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disquera`
--

LOCK TABLES `disquera` WRITE;
/*!40000 ALTER TABLE `disquera` DISABLE KEYS */;
/*!40000 ALTER TABLE `disquera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo` (
  `idGrupo` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  `Origen` varchar(200) DEFAULT NULL,
  `Genero` varchar(200) DEFAULT NULL,
  `Inicio` varchar(50) DEFAULT NULL,
  `Fin` varchar(50) DEFAULT NULL,
  `Sellos` varchar(150) DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL,
  `SitioWeb` varchar(50) DEFAULT NULL,
  `Idioma` varchar(50) DEFAULT NULL,
  `Logo` text DEFAULT NULL,
  PRIMARY KEY (`idGrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instrumento`
--

DROP TABLE IF EXISTS `instrumento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instrumento` (
  `idInstrumento` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(70) DEFAULT NULL,
  `Descripcion` text DEFAULT NULL,
  `Foto` text DEFAULT NULL,
  PRIMARY KEY (`idInstrumento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instrumento`
--

LOCK TABLES `instrumento` WRITE;
/*!40000 ALTER TABLE `instrumento` DISABLE KEYS */;
/*!40000 ALTER TABLE `instrumento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `idPais` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  `Nacionalidad` varchar(70) DEFAULT NULL,
  `Continente` varchar(50) DEFAULT NULL,
  `Bandera` text DEFAULT NULL,
  PRIMARY KEY (`idPais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vista_album`
--

DROP TABLE IF EXISTS `vista_album`;
/*!50001 DROP VIEW IF EXISTS `vista_album`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_album` AS SELECT
 1 AS `idAlbum`,
  1 AS `idGrupo`,
  1 AS `Grupo`,
  1 AS `Disquera`,
  1 AS `Nombre`,
  1 AS `Canciones`,
  1 AS `Duracion`,
  1 AS `Lanzamiento`,
  1 AS `Grabacion`,
  1 AS `Genero`,
  1 AS `Portada` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_artista`
--

DROP TABLE IF EXISTS `vista_artista`;
/*!50001 DROP VIEW IF EXISTS `vista_artista`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_artista` AS SELECT
 1 AS `idArtista`,
  1 AS `Nombre`,
  1 AS `NombreArtistico`,
  1 AS `Genero`,
  1 AS `FechaNacimiento`,
  1 AS `FechaFinado`,
  1 AS `Edad`,
  1 AS `Estatura`,
  1 AS `Pais`,
  1 AS `Instrumentos`,
  1 AS `TipoVoz`,
  1 AS `Foto` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_canciones`
--

DROP TABLE IF EXISTS `vista_canciones`;
/*!50001 DROP VIEW IF EXISTS `vista_canciones`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_canciones` AS SELECT
 1 AS `idCancion`,
  1 AS `Nombre`,
  1 AS `Duracion`,
  1 AS `Publicacion`,
  1 AS `Genero`,
  1 AS `Idioma` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_cancionesalbum`
--

DROP TABLE IF EXISTS `vista_cancionesalbum`;
/*!50001 DROP VIEW IF EXISTS `vista_cancionesalbum`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_cancionesalbum` AS SELECT
 1 AS `idCancion`,
  1 AS `idAlbum`,
  1 AS `Album`,
  1 AS `Numero`,
  1 AS `Nombre`,
  1 AS `Duracion`,
  1 AS `Publicacion`,
  1 AS `Genero`,
  1 AS `Idioma` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_cancionesgrupo`
--

DROP TABLE IF EXISTS `vista_cancionesgrupo`;
/*!50001 DROP VIEW IF EXISTS `vista_cancionesgrupo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_cancionesgrupo` AS SELECT
 1 AS `idGrupo`,
  1 AS `idCancion`,
  1 AS `Nombre`,
  1 AS `Duracion`,
  1 AS `Publicacion`,
  1 AS `Genero`,
  1 AS `Idioma`,
  1 AS `Album`,
  1 AS `Grupo` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_disquera`
--

DROP TABLE IF EXISTS `vista_disquera`;
/*!50001 DROP VIEW IF EXISTS `vista_disquera`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_disquera` AS SELECT
 1 AS `idDisquera`,
  1 AS `Nombre`,
  1 AS `Fundacion`,
  1 AS `Fundador`,
  1 AS `Generos`,
  1 AS `Pais`,
  1 AS `Logo` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_grupo`
--

DROP TABLE IF EXISTS `vista_grupo`;
/*!50001 DROP VIEW IF EXISTS `vista_grupo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_grupo` AS SELECT
 1 AS `idGrupo`,
  1 AS `Nombre`,
  1 AS `Origen`,
  1 AS `Genero`,
  1 AS `Inicio`,
  1 AS `Fin`,
  1 AS `Albumes`,
  1 AS `Sellos`,
  1 AS `Estado`,
  1 AS `SitioWeb`,
  1 AS `Idioma`,
  1 AS `Logo` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_grupointegrantes`
--

DROP TABLE IF EXISTS `vista_grupointegrantes`;
/*!50001 DROP VIEW IF EXISTS `vista_grupointegrantes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_grupointegrantes` AS SELECT
 1 AS `idArtista`,
  1 AS `Nombre`,
  1 AS `NombreArtistico`,
  1 AS `Genero`,
  1 AS `FechaNacimiento`,
  1 AS `FechaFinado`,
  1 AS `Edad`,
  1 AS `Estatura`,
  1 AS `Pais`,
  1 AS `Instrumento`,
  1 AS `TipoVoz`,
  1 AS `Foto`,
  1 AS `FechaInicio`,
  1 AS `FechaFin`,
  1 AS `Periodo`,
  1 AS `idGrupo`,
  1 AS `Grupo` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_album`
--

/*!50001 DROP VIEW IF EXISTS `vista_album`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_album` AS select `album`.`idAlbum` AS `idAlbum`,`album`.`idGrupo` AS `idGrupo`,`grupo`.`Nombre` AS `Grupo`,`disquera`.`Nombre` AS `Disquera`,`album`.`Nombre` AS `Nombre`,count(`canciones_album`.`idCancion`) AS `Canciones`,if(date_format(`album`.`Duracion`,'%H') = '00',date_format(`album`.`Duracion`,'%i:%s'),date_format(`album`.`Duracion`,'%H:%i:%s')) AS `Duracion`,date_format(`album`.`Lanzamiento`,'%d / %M / %Y') AS `Lanzamiento`,`album`.`Grabacion` AS `Grabacion`,`album`.`Genero` AS `Genero`,`album`.`Portada` AS `Portada` from (((`album` join `grupo` on(`album`.`idGrupo` = `grupo`.`idGrupo`)) join `disquera` on(`album`.`idDisquera` = `disquera`.`idDisquera`)) left join `canciones_album` on(`album`.`idAlbum` = `canciones_album`.`idAlbum`)) group by `album`.`idAlbum` order by `album`.`Lanzamiento` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_artista`
--

/*!50001 DROP VIEW IF EXISTS `vista_artista`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_artista` AS select `artista`.`idArtista` AS `idArtista`,`artista`.`Nombre` AS `Nombre`,`artista`.`NombreArtistico` AS `NombreArtistico`,if(`artista`.`Genero` = 'H','Hombre','Mujer') AS `Genero`,date_format(`artista`.`FechaNacimiento`,'%d / %M / %Y') AS `FechaNacimiento`,date_format(`artista`.`FechaFinado`,'%d / %M / %Y') AS `FechaFinado`,if(`artista`.`FechaNacimiento` >= `artista`.`FechaFinado`,'Fecha Invalida',timestampdiff(YEAR,`artista`.`FechaNacimiento`,ifnull(`artista`.`FechaFinado`,current_timestamp()))) AS `Edad`,format(`artista`.`Estatura`,2) AS `Estatura`,concat_ws(' - ',`pais`.`Nombre`,`pais`.`Nacionalidad`) AS `Pais`,`artista`.`Instrumentos` AS `Instrumentos`,`artista`.`TipoVoz` AS `TipoVoz`,`artista`.`Foto` AS `Foto` from (`artista` join `pais` on(`artista`.`idNacionalidad` = `pais`.`idPais`)) order by `artista`.`Nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_canciones`
--

/*!50001 DROP VIEW IF EXISTS `vista_canciones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_canciones` AS select `canciones`.`idCancion` AS `idCancion`,`canciones`.`Nombre` AS `Nombre`,date_format(`canciones`.`Duracion`,'%i:%s') AS `Duracion`,date_format(`canciones`.`Publicacion`,'%d / %M / %Y') AS `Publicacion`,`canciones`.`Genero` AS `Genero`,`canciones`.`Idioma` AS `Idioma` from `canciones` order by `canciones`.`Nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_cancionesalbum`
--

/*!50001 DROP VIEW IF EXISTS `vista_cancionesalbum`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_cancionesalbum` AS select `canciones`.`idCancion` AS `idCancion`,`album`.`idAlbum` AS `idAlbum`,`album`.`Nombre` AS `Album`,`canciones_album`.`Numero` AS `Numero`,`canciones`.`Nombre` AS `Nombre`,date_format(`canciones`.`Duracion`,'%i:%s') AS `Duracion`,date_format(`canciones`.`Publicacion`,'%d / %M / %Y') AS `Publicacion`,`canciones`.`Genero` AS `Genero`,`canciones`.`Idioma` AS `Idioma` from ((`canciones` join `canciones_album` on(`canciones`.`idCancion` = `canciones_album`.`idCancion`)) join `album` on(`album`.`idAlbum` = `canciones_album`.`idAlbum`)) order by `canciones_album`.`Numero` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_cancionesgrupo`
--

/*!50001 DROP VIEW IF EXISTS `vista_cancionesgrupo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_cancionesgrupo` AS select `grupo`.`idGrupo` AS `idGrupo`,`canciones`.`idCancion` AS `idCancion`,`canciones`.`Nombre` AS `Nombre`,date_format(`canciones`.`Duracion`,'%i:%s') AS `Duracion`,date_format(`canciones`.`Publicacion`,'%d / %M / %Y') AS `Publicacion`,`canciones`.`Genero` AS `Genero`,`canciones`.`Idioma` AS `Idioma`,`album`.`Nombre` AS `Album`,`grupo`.`Nombre` AS `Grupo` from (((`canciones` join `canciones_album` on(`canciones`.`idCancion` = `canciones_album`.`idCancion`)) join `album` on(`album`.`idAlbum` = `canciones_album`.`idAlbum`)) join `grupo` on(`album`.`idGrupo` = `grupo`.`idGrupo`)) order by `canciones`.`Nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_disquera`
--

/*!50001 DROP VIEW IF EXISTS `vista_disquera`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_disquera` AS select `disquera`.`idDisquera` AS `idDisquera`,`disquera`.`Nombre` AS `Nombre`,date_format(`disquera`.`Fundacion`,'%d / %M / %Y') AS `Fundacion`,`disquera`.`Fundador` AS `Fundador`,`disquera`.`Generos` AS `Generos`,`pais`.`Nombre` AS `Pais`,`disquera`.`Logo` AS `Logo` from (`disquera` join `pais` on(`disquera`.`idPais` = `pais`.`idPais`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_grupo`
--

/*!50001 DROP VIEW IF EXISTS `vista_grupo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_grupo` AS select `grupo`.`idGrupo` AS `idGrupo`,`grupo`.`Nombre` AS `Nombre`,`grupo`.`Origen` AS `Origen`,`grupo`.`Genero` AS `Genero`,date_format(`grupo`.`Inicio`,'%d / %M / %Y') AS `Inicio`,date_format(`grupo`.`Fin`,'%d / %M / %Y') AS `Fin`,count(`album`.`idAlbum`) AS `Albumes`,`grupo`.`Sellos` AS `Sellos`,`grupo`.`Estado` AS `Estado`,`grupo`.`SitioWeb` AS `SitioWeb`,`grupo`.`Idioma` AS `Idioma`,`grupo`.`Logo` AS `Logo` from (`grupo` left join `album` on(`album`.`idGrupo` = `grupo`.`idGrupo`)) group by `grupo`.`idGrupo` order by `grupo`.`Nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_grupointegrantes`
--

/*!50001 DROP VIEW IF EXISTS `vista_grupointegrantes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_grupointegrantes` AS select `artista`.`idArtista` AS `idArtista`,`artista`.`Nombre` AS `Nombre`,`artista`.`NombreArtistico` AS `NombreArtistico`,if(`artista`.`Genero` = 'H','Hombre','Mujer') AS `Genero`,date_format(`artista`.`FechaNacimiento`,'%d / %M / %Y') AS `FechaNacimiento`,date_format(`artista`.`FechaFinado`,'%d / %M / %Y') AS `FechaFinado`,if(`artista`.`FechaNacimiento` >= `artista`.`FechaFinado`,'Fecha Invalida',timestampdiff(YEAR,`artista`.`FechaNacimiento`,ifnull(`artista`.`FechaFinado`,current_timestamp()))) AS `Edad`,format(`artista`.`Estatura`,2) AS `Estatura`,concat_ws(' - ',`pais`.`Nombre`,`pais`.`Nacionalidad`) AS `Pais`,`instrumento`.`Nombre` AS `Instrumento`,`artista`.`TipoVoz` AS `TipoVoz`,`artista`.`Foto` AS `Foto`,date_format(`artista_grupo`.`FechaInicio`,'%d / %M / %Y') AS `FechaInicio`,date_format(`artista_grupo`.`FechaFin`,'%d / %M / %Y') AS `FechaFin`,concat_ws(' - ',year(`artista_grupo`.`FechaInicio`),if(`artista_grupo`.`FechaFin` is null,'Actualidad',year(`artista_grupo`.`FechaFin`))) AS `Periodo`,`grupo`.`idGrupo` AS `idGrupo`,`grupo`.`Nombre` AS `Grupo` from ((((`artista` join `pais` on(`artista`.`idNacionalidad` = `pais`.`idPais`)) left join `artista_grupo` on(`artista`.`idArtista` = `artista_grupo`.`idArtista`)) left join `grupo` on(`grupo`.`idGrupo` = `artista_grupo`.`idGrupo`)) join `instrumento` on(`artista_grupo`.`idInstrumento` = `instrumento`.`idInstrumento`)) order by `artista`.`Nombre`,date_format(`artista_grupo`.`FechaInicio`,'%d / %M / %Y') desc */;
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

-- Dump completed on 2023-02-15 18:53:13

/* PROCEDIMIENTOS */
/* ------------------------------------ ALBUM POR GRUPO ------------------------------------------ */
/* DELIMITER $$
CREATE PROCEDURE `obtener_album`(IN idGrupoB INT)
BEGIN
SELECT * FROM Vista_Album WHERE idGrupo = idGrupoB;
END$$

DELIMITER ; */

/* ------------------ CANCIONES POR ALBUM --------------- */
/* DELIMITER $$
CREATE PROCEDURE `obtener_cancionesAlbum`(IN idAlbumA INT)
BEGIN
SELECT * FROM Vista_CancionesAlbum WHERE idAlbum = idAlbumA;
END$$

DELIMITER ; */

/* ------------------------------------------------ CANCIONES POR GRUPO ----------------------------------------- */
/* DELIMITER $$
CREATE PROCEDURE `obtener_canciones`(IN idGrupoB INT)
BEGIN
SELECT * FROM Vista_CancionesGrupo WHERE idGrupo = idGrupoB;
END$$

DELIMITER ; */

/* ------------------------------------------------ ARTISTA POR GRUPO -------------------------------------------------*/
/* DELIMITER $$
CREATE PROCEDURE `obtener_integrantes`(IN idGrupoB INT)
BEGIN
SELECT * FROM Vista_GrupoIntegrantes WHERE idGrupo = idGrupoB;
END$$

DELIMITER ; */

/* DATOS */
INSERT INTO Pais VALUES 
(1,'Alemania','Aleman, Alemana','Europa','https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Flag_of_Germany.svg/640px-Flag_of_Germany.svg.png'),
(2,'Mexico','Mexicano, Mexicana','America','https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Flag_of_Mexico.svg/1280px-Flag_of_Mexico.svg.png'),
(3,'Australia','Australiano, Australiana','Oceania','https://upload.wikimedia.org/wikipedia/commons/8/88/Flag_of_Australia_%28converted%29.svg'),
(4,'Inglaterra','Ingles, Inglesa','Europa','https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Flag_of_England.svg/1920px-Flag_of_England.svg.png'),
(5,'Estados Unidos','Americano, Americana','America','https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/1200px-Flag_of_the_United_States.svg.png'),
(6,'Francia','Frances, Francesa','Europa','https://m.media-amazon.com/images/I/41Dka5ibTAL.jpg'),
(7,'China','Chino, China','Asia','https://genexus.blog/wp-content/uploads/2021/09/Bandera-China.jpeg'),
(8,'Suecia','Sueco, Sueca','Europa','https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Flag_of_Sweden.svg/1200px-Flag_of_Sweden.svg.png'),
(9,'Rusia','Ruso, Rusa','Europa','https://mf.b37mrtl.ru/rbthmedia/images/2021.06/article/60c0e15285600a1fb24d33f7.jpg'),
(10,'Canada','Canadiense','America','https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Flag_of_Canada_%28Pantone%29.svg/800px-Flag_of_Canada_%28Pantone%29.svg.png'),
(11,'Argentina','Argentino','America','https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Flag_of_Argentina.svg/1200px-Flag_of_Argentina.svg.png'),
(12,'Japon','Japones, Japonesa','Asia','https://setopen.sportdata.org/wkfranking/images/flags/JPN.gif'),
(13,'Austria','Austriaco, Austriaca','Europa','https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Flag_of_Austria.svg/640px-Flag_of_Austria.svg.png'),
(14,'Belgica','Belga','Europa','https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Flag_of_Belgium_%28civil%29.svg/1200px-Flag_of_Belgium_%28civil%29.svg.png'),
(15,'Irlanda del Norte','Norirlandes, Norirlandesa','Europa','https://upload.wikimedia.org/wikipedia/commons/thumb/4/43/Flag_of_Northern_Ireland_%281953%E2%80%931972%29.svg/1920px-Flag_of_Northern_Ireland_%281953%E2%80%931972%29.svg.png'),
(16,'Nueva Zelanda','Neozelandes, Neozelandesa','Oceania','https://upload.wikimedia.org/wikipedia/commons/3/3e/Flag_of_New_Zealand.svg');

INSERT INTO Instrumento VALUES
(NULL, 'Guitarra Acústica', 'La guitarra es un instrumento musical de la familia de los cordófonos, es decir los instrumentos que producen su sonido al hacer vibrar las cuerdas.', 'https://www.pngplay.com/wp-content/uploads/6/Real-Black-Acoustic-Guitar-PNG.png'),
(NULL, 'Guitarra Eléctrica', 'La guitarra eléctrica es un tipo de guitarra en la que, a diferencia de la guitarra española y la guitarra sajona, su caja no hace resonancia, por lo que el sonido se produce indirectamente por inducción eléctrica y a través de un amplificador o también a través de un pedal de efectos.', 'https://www.pngall.com/wp-content/uploads/12/Electric-Guitar-Instrument-No-Background.png'),
(NULL, 'Batería', 'La batería es un conjunto de instrumentos musicales de percusión usado por muchas agrupaciones musicales.', 'https://assets.stickpng.com/images/585699304f6ae202fedf274b.png'),
(NULL, 'Bajo Eléctrico', 'El bajo, bajo eléctrico o simplemente bajo, es el miembro más grave de la familia de las guitarras. Es un instrumento de cuerda pulsada similar en apariencia y construcción a una guitarra eléctrica o acústica, pero con un mástil y una escala más largos, y típicamente de cuatro a seis cuerdas o cursos.', 'https://i.pinimg.com/originals/96/d8/20/96d820eec771a2e48c3a55cf1f70e7e3.png'),
(NULL, 'Ninguno / Vocalista', 'El micrófono es un transductor acústico eléctrico, es decir, transforma la señal acústica de nuestra voz en la señal eléctrica que reproduce el equipo al que se encuentra conectado. Los que utilizan el micrófono son los vocalistas de un grupo de Música, ya que no tocan algún instrumento musical.', 'https://www.pngplay.com/wp-content/uploads/9/Microphone-No-Background.png');

INSERT INTO Artista VALUES
(NULL, 'Kurt Donald Cobain', 'Kurt Cobain', 'H', '1967-02-20', '1994-04-05', 1.75, 5, 'Voz, Guitarra', 'Barítono ligero', 'https://www.teahub.io/photos/full/59-596752_kurt-cobain-grunge-aesthetic.jpg'),
(NULL, 'David Eric Grohl', 'Dave Grohl', 'H', '1969-01-14', NULL, 1.83, 5, 'Voz, Batería, Guitarra, Bajo eléctrico, Piano, Sintetizador', 'Tenor ligero', 'https://pbs.twimg.com/media/DWkk6uFUMAEMO98.jpg'),
(NULL, 'Billie Joe Armstrong', 'Billie Joe Armstrong', 'H', '1972-02-17', NULL, 1.7, 5, 'Voz, guitarra, bajo, piano, mandolina, batería, armónica','Tenor', 'https://e0.pxfuel.com/wallpapers/175/867/desktop-wallpaper-billie-joe-armstrong-thumbnail.jpg'),
(NULL, 'Chester Charles Bennington', 'Chester Bennington', 'H', '1973-03-20', '2017-07-20', 1.78, 5, 'Voz, guitarra, instrumento de percusión y piano', 'Tenor ligero, Gutural', 'https://i.pinimg.com/originals/5f/2a/27/5f2a2705a92355210a0c959ef44baed5.jpg');

INSERT INTO Grupo VALUES
(NULL, 'Nirvana', 'Aberdeen, Washington, Estados Unidos', 'Grunge, rock alternativo', '1987-10-03', '1994-04-05', 'Sub Pop, Tupelo Records, DGC Records, Geffen Records', 'Disuelto', 'http://nirvana.com/', 'Ingles', 'https://cdn.freebiesupply.com/logos/large/2x/nirvana-logo-png-transparent.png'),
(NULL, 'Foo Fighters', 'Seattle, Washington, Estados Unidos', 'Hard rock, Post-grunge, Rock alternativo', '1994-07-16', NULL, 'RCA Records, Capitol Records, Roswell Records', 'Activo', 'http://foofighters.com/', 'Ingles', 'https://seeklogo.com/images/F/Foo_Fighters-logo-A7966CB57F-seeklogo.com.png'),
(NULL, 'Green Day', 'Berkeley, California, Estados Unidos', 'Pop punk, Punk rock, Rock alternativo', '1986-10-12', NULL, 'Lookout Records, Reprise Records, Warner Bros Records', 'Activo', 'http://www.greenday.com/', 'Ingles', 'https://www.pngkey.com/png/full/230-2301807_green-day-png-vector-royalty-free-library-green.png'),
(NULL, 'Linkin Park', 'Agoura Hills, California, Estados Unidos', '	Nu metal, rock alternativo, rap metal, metal alternativo, heavy metal, rock electrónico, pop', '1996-08-07', '2017-07-20', 'Warner Music Group, Warner Records, Machine Shop Recordings', 'En hiato', 'http://www.linkinpark.com/', 'Ingles', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/LPLogo-black.svg/1200px-LPLogo-black.svg.png');

INSERT INTO Artista_Grupo VALUES
(NULL, 1, 1, '1987-10-3', '1994-04-05', 2),
(NULL, 2, 1, '1990-7-17', '1994-04-05', 3),
(NULL, 2, 2, '1994-07-16', NULL, 2),
(NULL, 3, 3, '1986-10-12', NULL, 2),
(NULL, 4, 4, '1996-8-7', '2017-07-20', 5);

INSERT INTO Disquera VALUES
(NULL, 'DGC Records', '1990-03-20', 'David Geffen', 'Rock alternativo', 5, 'https://upload.wikimedia.org/wikipedia/en/f/fa/DGC_Records_logo%2C_1990.png'),
(NULL, 'Sub Pop', '1986-7-16', 'Bruce Pavitt, Jonathan Poneman', 'Hip-hop, Indie pop, Punk rock, Heavy metal, Rock alternativo, Música de comedia', 5, 'https://cdn.freebiesupply.com/logos/large/2x/sub-pop-logo-png-transparent.png'),
(NULL, 'RCA Records', '1990-01-09', 'Emile Berliner, Eldridge R. Johnson', 'Varios géneros', 5, 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/RCA_Records_%28logo%29.svg/1280px-RCA_Records_%28logo%29.svg.png'),
(NULL, 'Warner Records', '1958-03-19', 'James Conkling', 'Varios', 5, 'https://variety.com/wp-content/uploads/2016/02/warner-records.jpg');

INSERT INTO Album VALUES
(NULL, 1, 2, 'Bleach', '00:42:14', '1989-06-15', '1988-1989', 'Grunge', 'https://m.media-amazon.com/images/I/71ThvtmT-FL._AC_SL1417_.jpg'),
(NULL, 1, 1, 'Nevermind', '00:42:38', '1991-09-24', 'Mayo-junio de 1991', 'Grunge, rock alternativo', 'https://m.media-amazon.com/images/I/71DQrKpImPL._AC_SL1400_.jpg'),

(NULL, 2, 3, 'Wasting Light', '00:47:56', '2011-04-12', '6 de septiembre de 2010 - 11 de diciembre de 2010', 'Post-grunge, hard rock y rock alternativo', 'https://m.media-amazon.com/images/I/81bcusKozsL._AC_SL1500_.jpg'),

(NULL, 3, 4, 'American Idiot', '00:57:12', '2004-09-21', '18 de abril de 2003-26 de marzo de 2004 en Studio 880, Oakland, California; Ocean Way Recording, Hollywood', 'Pop punk, Punk rock, Rock alternativo, Ópera rock', 'https://m.media-amazon.com/images/I/71Z0rLIvpuL._AC_SL1448_.jpg'),
(NULL, 3, 4, 'Revolution Radio', '00:44:29', '2016-11-11', 'noviembre de 2015 - junio de 2016 OTIS, Oakland', 'Pop punk, rock alternativo, punk rock', 'https://m.media-amazon.com/images/I/81+vo6G38sL._AC_SL1500_.jpg'),

(NULL, 4, 4, 'Minutes to Midnight', '00:43:23', '2007-05-14', 'Enero de 2006 — marzo de 2007', 'Rock alternativo, metal alternativo', 'https://m.media-amazon.com/images/I/91esTaFkpPL._AC_SL1500_.jpg'),
(NULL, 4, 4, 'Hybrid Theory', '00:37:48', '2000-10-24', 'Marzo-junio de 2000', 'Nu metal, rap metal, metal alternativo, rap rock', 'https://m.media-amazon.com/images/I/81iC+O0ec2L._AC_SL1448_.jpg'),
(NULL, 4, 4, 'One More Light', '00:35:19', '2017-05-19', 'Noviembre de 2015-febrero de 2017', 'Pop, pop rock, electropop , Rock electrónico', 'https://ocdn.eu/images/pulscms/YzY7MDA_/85d9ab2d8707de5ea7705a70e4bb8727.jpeg');

INSERT INTO Canciones VALUES
(NULL, 'Come As You Are', '00:03:38', '1992-03-03', 'Grunge, rock alternativo', 'Inglés'),
(NULL, 'Smells Like Teen Spirit', '00:05:01', '1991-09-10', 'Grunge, rock alternativo, hard rock', 'Inglés'),
(NULL, 'About a Girl', '00:02:49', '1989-10-24', 'Rock alternativo', 'Inglés'),

(NULL, 'Walk ', '00:04:19', '2011-06-06', '	Rock alternativo, post-grunge y hard rock', 'Inglés'),

(NULL, 'American Idiot', '00:02:54', '2004-08-31', 'Pop punk', 'Inglés'),
(NULL, 'Whatsername', '00:04:12', '2004-09-20', 'Rock alternativo', 'Inglés'),

(NULL, 'Given up', '00:03:09', '2008-03-03', 'Metal alternativo, punk rock, hardcore punk, Post-Hardcore', 'Inglés'),
(NULL, 'What I''ve Done', '00:03:27', '2007-04-02', 'Rock alternativo, Hard rock', 'Inglés'),
(NULL, 'In the End', '00:03:37', '2001-10-09', 'Nu metal, rap rock, rock alternativo', 'Inglés'),
(NULL, 'One More Light', '00:04:15', '2017-10-03', 'Rock electrónico, balada', 'Inglés');

INSERT INTO Canciones_Album VALUES
(NULL, 2, 1,3),
(NULL, 2, 2,1),
(NULL, 1, 3,3),

(NULL, 3, 4,11),

(NULL, 4, 5,1),
(NULL, 4, 6,9),

(NULL, 6, 7,2),
(NULL, 6, 8,6),
(NULL, 7, 9,8),
(NULL, 8, 10,9);

/* INSERT INTO Artista SET `idArtista` = 0, `Nombre` = 'Matthew James Bellamy', `NombreArtistico` = 'Matt Bellamy', `Genero` = 'H', `FechaNacimiento` = '1978-06-09', `FechaFinado` = null, `Estatura` = 1.7, `idNacionalidad` = '5', `Instrumentos` = 'Voz, guitarra, piano, teclados, bajo', `TipoVoz` = 'Tenor dramático', `Foto` = 'https://i.pinimg.com/originals/cf/d4/45/cfd445baa399eb6238f07c58b0e3000b.png' */
