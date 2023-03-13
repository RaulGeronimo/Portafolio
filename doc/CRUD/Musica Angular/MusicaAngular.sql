-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: Repertorio
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
  `Lanzamiento` date DEFAULT NULL,
  `Grabacion` varchar(200) DEFAULT NULL,
  `Genero` varchar(100) DEFAULT NULL,
  `Portada` text DEFAULT NULL,
  PRIMARY KEY (`idAlbum`),
  KEY `idGrupo` (`idGrupo`),
  KEY `idDisquera` (`idDisquera`),
  CONSTRAINT `album_ibfk_1` FOREIGN KEY (`idGrupo`) REFERENCES `grupo` (`idGrupo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `album_ibfk_2` FOREIGN KEY (`idDisquera`) REFERENCES `disquera` (`idDisquera`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
  `FechaNacimiento` date DEFAULT NULL,
  `FechaFinado` varchar(50) DEFAULT NULL,
  `Estatura` double DEFAULT NULL,
  `idNacionalidad` int(11) DEFAULT NULL,
  `Instrumentos` varchar(100) DEFAULT NULL,
  `TipoVoz` varchar(50) DEFAULT NULL,
  `Foto` text DEFAULT NULL,
  PRIMARY KEY (`idArtista`),
  KEY `idNacionalidad` (`idNacionalidad`),
  CONSTRAINT `artista_ibfk_1` FOREIGN KEY (`idNacionalidad`) REFERENCES `pais` (`idPais`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` varchar(50) DEFAULT NULL,
  `idInstrumento` int(11) DEFAULT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `idArtista` (`idArtista`),
  KEY `idGrupo` (`idGrupo`),
  KEY `idInstrumento` (`idInstrumento`),
  CONSTRAINT `artista_grupo_ibfk_1` FOREIGN KEY (`idArtista`) REFERENCES `artista` (`idArtista`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `artista_grupo_ibfk_2` FOREIGN KEY (`idGrupo`) REFERENCES `grupo` (`idGrupo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `artista_grupo_ibfk_3` FOREIGN KEY (`idInstrumento`) REFERENCES `instrumento` (`idInstrumento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
  `Publicacion` date DEFAULT NULL,
  `Genero` varchar(100) DEFAULT NULL,
  `Interpretacion` varchar(50) DEFAULT NULL,
  `idGrupo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCancion`),
  KEY `idGrupo` (`idGrupo`),
  CONSTRAINT `canciones_ibfk_1` FOREIGN KEY (`idGrupo`) REFERENCES `grupo` (`idGrupo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
  `Fundacion` date DEFAULT NULL,
  `Fundador` varchar(100) DEFAULT NULL,
  `Generos` varchar(100) DEFAULT NULL,
  `idPais` int(11) DEFAULT NULL,
  `Logo` text DEFAULT NULL,
  PRIMARY KEY (`idDisquera`),
  KEY `idPais` (`idPais`),
  CONSTRAINT `disquera_ibfk_1` FOREIGN KEY (`idPais`) REFERENCES `pais` (`idPais`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
  `Inicio` date DEFAULT NULL,
  `Fin` varchar(50) DEFAULT NULL,
  `Sellos` varchar(150) DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL,
  `SitioWeb` varchar(50) DEFAULT NULL,
  `Idioma` varchar(50) DEFAULT NULL,
  `Logo` text DEFAULT NULL,
  PRIMARY KEY (`idGrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
  1 AS `idDisquera`,
  1 AS `Grupo`,
  1 AS `Disquera`,
  1 AS `Nombre`,
  1 AS `Album`,
  1 AS `Canciones`,
  1 AS `DuracionF`,
  1 AS `Duracion`,
  1 AS `Lanzamiento`,
  1 AS `FechaLanzamiento`,
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
  1 AS `Cancion`,
  1 AS `Genero`,
  1 AS `Interpretacion`,
  1 AS `Grupo` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_cancionesalbum`
--

DROP TABLE IF EXISTS `vista_cancionesalbum`;
/*!50001 DROP VIEW IF EXISTS `vista_cancionesalbum`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_cancionesalbum` AS SELECT
 1 AS `Codigo`,
  1 AS `idCancion`,
  1 AS `idAlbum`,
  1 AS `Album`,
  1 AS `Numero`,
  1 AS `Nombre`,
  1 AS `Duracion`,
  1 AS `Publicacion`,
  1 AS `Genero` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_cancionesgrupo`
--

DROP TABLE IF EXISTS `vista_cancionesgrupo`;
/*!50001 DROP VIEW IF EXISTS `vista_cancionesgrupo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_cancionesgrupo` AS SELECT
 1 AS `idCancion`,
  1 AS `idGrupo`,
  1 AS `Grupo`,
  1 AS `Nombre`,
  1 AS `Albums`,
  1 AS `Duracion`,
  1 AS `Publicacion`,
  1 AS `Genero`,
  1 AS `Interpretacion` */;
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
  1 AS `Albumes`,
  1 AS `Cancion`,
  1 AS `Origen`,
  1 AS `Genero`,
  1 AS `FechaInicio`,
  1 AS `FechaFin`,
  1 AS `Inicio`,
  1 AS `Fin`,
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
 1 AS `Codigo`,
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
/*!50001 VIEW `vista_album` AS select `album`.`idAlbum` AS `idAlbum`,`album`.`idGrupo` AS `idGrupo`,`album`.`idDisquera` AS `idDisquera`,`grupo`.`Nombre` AS `Grupo`,`disquera`.`Nombre` AS `Disquera`,`album`.`Nombre` AS `Nombre`,concat_ws(' - ',`album`.`Nombre`,`grupo`.`Nombre`) AS `Album`,count(`canciones_album`.`idCancion`) AS `Canciones`,if(date_format(`album`.`Duracion`,'%H') = '00',date_format(`album`.`Duracion`,'%i:%s'),date_format(`album`.`Duracion`,'%H:%i:%s')) AS `DuracionF`,`album`.`Duracion` AS `Duracion`,date_format(`album`.`Lanzamiento`,'%Y-%m-%d') AS `Lanzamiento`,date_format(`album`.`Lanzamiento`,'%d / %M / %Y') AS `FechaLanzamiento`,`album`.`Grabacion` AS `Grabacion`,`album`.`Genero` AS `Genero`,`album`.`Portada` AS `Portada` from (((`album` join `grupo` on(`album`.`idGrupo` = `grupo`.`idGrupo`)) join `disquera` on(`album`.`idDisquera` = `disquera`.`idDisquera`)) left join `canciones_album` on(`album`.`idAlbum` = `canciones_album`.`idAlbum`)) group by `album`.`idAlbum` order by `album`.`Nombre` */;
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
/*!50001 VIEW `vista_artista` AS select `artista`.`idArtista` AS `idArtista`,`artista`.`Nombre` AS `Nombre`,`artista`.`NombreArtistico` AS `NombreArtistico`,if(`artista`.`Genero` = 'H','Hombre','Mujer') AS `Genero`,date_format(`artista`.`FechaNacimiento`,'%d / %M / %Y') AS `FechaNacimiento`,date_format(`artista`.`FechaFinado`,'%d / %M / %Y') AS `FechaFinado`,case when `artista`.`FechaFinado` is null or `artista`.`FechaFinado` <= 0 then concat_ws(' ',timestampdiff(YEAR,`artista`.`FechaNacimiento`,current_timestamp()),'años') when `artista`.`FechaFinado` <= 0 then 'Fecha Invalida' when `artista`.`FechaNacimiento` <= `artista`.`FechaFinado` then concat_ws(' ',timestampdiff(YEAR,`artista`.`FechaNacimiento`,`artista`.`FechaFinado`),'años') else 'Fecha Invalida' end AS `Edad`,format(`artista`.`Estatura`,2) AS `Estatura`,concat_ws(' - ',`pais`.`Nombre`,`pais`.`Nacionalidad`) AS `Pais`,`artista`.`Instrumentos` AS `Instrumentos`,`artista`.`TipoVoz` AS `TipoVoz`,`artista`.`Foto` AS `Foto` from (`artista` join `pais` on(`artista`.`idNacionalidad` = `pais`.`idPais`)) order by `artista`.`Nombre` */;
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
/*!50001 VIEW `vista_canciones` AS select `canciones`.`idCancion` AS `idCancion`,case when `canciones`.`Interpretacion` <> 'Original' then concat(`canciones`.`Nombre`,' ( ',`canciones`.`Interpretacion`,' ) ') else `canciones`.`Nombre` end AS `Nombre`,date_format(`canciones`.`Duracion`,'%i:%s') AS `Duracion`,date_format(`canciones`.`Publicacion`,'%d / %M / %Y') AS `Publicacion`,case when `canciones`.`Interpretacion` <> 'Original' then concat(`canciones`.`Nombre`,' - ',`grupo`.`Nombre`,' ( ',`canciones`.`Interpretacion`,' ) ') else concat_ws(' - ',`canciones`.`Nombre`,`grupo`.`Nombre`) end AS `Cancion`,`canciones`.`Genero` AS `Genero`,`canciones`.`Interpretacion` AS `Interpretacion`,`grupo`.`Nombre` AS `Grupo` from (`canciones` left join `grupo` on(`grupo`.`idGrupo` = `canciones`.`idGrupo`)) order by case when `canciones`.`Interpretacion` <> 'Original' then concat(`canciones`.`Nombre`,' ( ',`canciones`.`Interpretacion`,' ) ') else `canciones`.`Nombre` end */;
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
/*!50001 VIEW `vista_cancionesalbum` AS select `canciones_album`.`Codigo` AS `Codigo`,`canciones`.`idCancion` AS `idCancion`,`album`.`idAlbum` AS `idAlbum`,`album`.`Nombre` AS `Album`,`canciones_album`.`Numero` AS `Numero`,case when `canciones`.`Interpretacion` <> 'Original' then concat(`canciones`.`Nombre`,' ( ',`canciones`.`Interpretacion`,' ) ') else `canciones`.`Nombre` end AS `Nombre`,date_format(`canciones`.`Duracion`,'%i:%s') AS `Duracion`,date_format(`canciones`.`Publicacion`,'%d / %M / %Y') AS `Publicacion`,`canciones`.`Genero` AS `Genero` from ((`canciones` join `canciones_album` on(`canciones`.`idCancion` = `canciones_album`.`idCancion`)) join `album` on(`album`.`idAlbum` = `canciones_album`.`idAlbum`)) order by case when `canciones`.`Interpretacion` <> 'Original' then concat(`canciones`.`Nombre`,' ( ',`canciones`.`Interpretacion`,' ) ') else `canciones`.`Nombre` end */;
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
/*!50001 VIEW `vista_cancionesgrupo` AS select `canciones`.`idCancion` AS `idCancion`,`grupo`.`idGrupo` AS `idGrupo`,`grupo`.`Nombre` AS `Grupo`,case when `canciones`.`Interpretacion` <> 'Original' then concat(`canciones`.`Nombre`,' ( ',`canciones`.`Interpretacion`,' ) ') else `canciones`.`Nombre` end AS `Nombre`,group_concat(`album`.`Nombre` separator ', ') AS `Albums`,date_format(`canciones`.`Duracion`,'%i:%s') AS `Duracion`,date_format(`canciones`.`Publicacion`,'%Y') AS `Publicacion`,`canciones`.`Genero` AS `Genero`,`canciones`.`Interpretacion` AS `Interpretacion` from (((`canciones` left join `grupo` on(`grupo`.`idGrupo` = `canciones`.`idGrupo`)) left join `canciones_album` on(`canciones`.`idCancion` = `canciones_album`.`idCancion`)) left join `album` on(`album`.`idAlbum` = `canciones_album`.`idAlbum`)) group by `canciones`.`idCancion` order by case when `canciones`.`Interpretacion` <> 'Original' then concat(`canciones`.`Nombre`,' ( ',`canciones`.`Interpretacion`,' ) ') else `canciones`.`Nombre` end,`album`.`Nombre` */;
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
/*!50001 VIEW `vista_disquera` AS select `disquera`.`idDisquera` AS `idDisquera`,`disquera`.`Nombre` AS `Nombre`,date_format(`disquera`.`Fundacion`,'%M / %Y') AS `Fundacion`,`disquera`.`Fundador` AS `Fundador`,`disquera`.`Generos` AS `Generos`,`pais`.`Nombre` AS `Pais`,`disquera`.`Logo` AS `Logo` from (`disquera` join `pais` on(`disquera`.`idPais` = `pais`.`idPais`)) order by `disquera`.`Nombre` */;
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
/*!50001 VIEW `vista_grupo` AS select `g`.`idGrupo` AS `idGrupo`,`g`.`Nombre` AS `Nombre`,sum(`g`.`Albumes`) AS `Albumes`,sum(`g`.`Cancion`) AS `Cancion`,`g`.`Origen` AS `Origen`,`g`.`Genero` AS `Genero`,date_format(`g`.`Inicio`,'%Y') AS `FechaInicio`,date_format(`g`.`Fin`,'%Y') AS `FechaFin`,date_format(`g`.`Inicio`,'%Y-%m-%d') AS `Inicio`,`g`.`Fin` AS `Fin`,`g`.`Sellos` AS `Sellos`,`g`.`Estado` AS `Estado`,`g`.`SitioWeb` AS `SitioWeb`,`g`.`Idioma` AS `Idioma`,`g`.`Logo` AS `Logo` from (select `a`.`idGrupo` AS `idGrupo`,`a`.`Nombre` AS `Nombre`,count(`c2`.`idAlbum`) AS `Albumes`,0 AS `Cancion`,`a`.`Origen` AS `Origen`,`a`.`Genero` AS `Genero`,date_format(`a`.`Inicio`,'%Y') AS `FechaInicio`,date_format(`a`.`Fin`,'%Y') AS `FechaFin`,date_format(`a`.`Inicio`,'%Y-%m-%d') AS `Inicio`,`a`.`Fin` AS `Fin`,`a`.`Sellos` AS `Sellos`,`a`.`Estado` AS `Estado`,`a`.`SitioWeb` AS `SitioWeb`,`a`.`Idioma` AS `Idioma`,`a`.`Logo` AS `Logo` from (`grupo` `a` left join `album` `c2` on(`a`.`idGrupo` = `c2`.`idGrupo`)) group by `a`.`idGrupo` union all select `b`.`idGrupo` AS `idGrupo`,`b`.`Nombre` AS `Nombre`,0 AS `Albumes`,count(`c1`.`idCancion`) AS `Cancion`,`b`.`Origen` AS `Origen`,`b`.`Genero` AS `Genero`,date_format(`b`.`Inicio`,'%Y') AS `FechaInicio`,date_format(`b`.`Fin`,'%Y') AS `FechaFin`,date_format(`b`.`Inicio`,'%Y-%m-%d') AS `Inicio`,`b`.`Fin` AS `Fin`,`b`.`Sellos` AS `Sellos`,`b`.`Estado` AS `Estado`,`b`.`SitioWeb` AS `SitioWeb`,`b`.`Idioma` AS `Idioma`,`b`.`Logo` AS `Logo` from (`grupo` `b` left join `canciones` `c1` on(`b`.`idGrupo` = `c1`.`idGrupo`)) group by `b`.`idGrupo`) `g` group by `g`.`idGrupo` order by `g`.`Nombre` */;
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
/*!50001 VIEW `vista_grupointegrantes` AS select `artista_grupo`.`Codigo` AS `Codigo`,`artista`.`idArtista` AS `idArtista`,`artista`.`Nombre` AS `Nombre`,`artista`.`NombreArtistico` AS `NombreArtistico`,if(`artista`.`Genero` = 'H','Hombre','Mujer') AS `Genero`,date_format(`artista`.`FechaNacimiento`,'%d / %M / %Y') AS `FechaNacimiento`,date_format(`artista`.`FechaFinado`,'%d / %M / %Y') AS `FechaFinado`,case when `artista`.`FechaFinado` is null or `artista`.`FechaFinado` <= 0 then concat_ws(' ',timestampdiff(YEAR,`artista`.`FechaNacimiento`,current_timestamp()),'años') when `artista`.`FechaFinado` <= 0 then 'Fecha Invalida' when `artista`.`FechaNacimiento` <= `artista`.`FechaFinado` then concat_ws(' ',timestampdiff(YEAR,`artista`.`FechaNacimiento`,`artista`.`FechaFinado`),'años') else 'Fecha Invalida' end AS `Edad`,format(`artista`.`Estatura`,2) AS `Estatura`,concat_ws(' - ',`pais`.`Nombre`,`pais`.`Nacionalidad`) AS `Pais`,`instrumento`.`Nombre` AS `Instrumento`,`artista`.`TipoVoz` AS `TipoVoz`,`artista`.`Foto` AS `Foto`,date_format(`artista_grupo`.`FechaInicio`,'%Y') AS `FechaInicio`,date_format(`artista_grupo`.`FechaFin`,'%Y') AS `FechaFin`,case when `artista_grupo`.`FechaFin` is null or `artista_grupo`.`FechaFin` <= 0 then concat_ws(' - ',year(`artista_grupo`.`FechaInicio`),'Actualidad') else concat_ws(' - ',year(`artista_grupo`.`FechaInicio`),year(`artista_grupo`.`FechaFin`)) end AS `Periodo`,`grupo`.`idGrupo` AS `idGrupo`,`grupo`.`Nombre` AS `Grupo` from ((((`artista` join `pais` on(`artista`.`idNacionalidad` = `pais`.`idPais`)) left join `artista_grupo` on(`artista`.`idArtista` = `artista_grupo`.`idArtista`)) left join `grupo` on(`grupo`.`idGrupo` = `artista_grupo`.`idGrupo`)) join `instrumento` on(`artista_grupo`.`idInstrumento` = `instrumento`.`idInstrumento`)) order by `artista`.`Nombre`,date_format(`artista_grupo`.`FechaInicio`,'%Y') desc */;
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

-- Dump completed on 2023-03-12 22:43:41

/* ----------------------------------------------------------------------------- PROCEDIMIENTOS ALMACENADOS ----------------------------------------------------------------------------- */
/* ------------------------------------------------------------------ ARTISTA GRUPO ------------------------------------------------------------------ */
DELIMITER $$
CREATE PROCEDURE `obtener_integrantes`(IN idGrupoB INT)
BEGIN
SELECT * FROM Vista_GrupoIntegrantes WHERE idGrupo = idGrupoB;
END$$

DELIMITER ;

/* ------------------------------------------------------------------- ALBUM GRUPO ------------------------------------------------------------------- */
DELIMITER $$
CREATE PROCEDURE `obtener_album`(IN idGrupoB INT)
BEGIN
SELECT * FROM Vista_Album WHERE idGrupo = idGrupoB ORDER BY Lanzamiento;
END$$

DELIMITER ;

/* ----------------------------------------------------------------- CANCIONES ALBUM ----------------------------------------------------------------- */
DELIMITER $$
CREATE PROCEDURE `obtener_cancionesAlbum`(IN idAlbumA INT)
BEGIN
    SELECT 
        Codigo, 
        idCancion, 
        idAlbum, 
        Album, 
        Numero, 
        GROUP_CONCAT(Nombre separator ' / ') AS Nombre,
        DATE_FORMAT(sec_to_time(SUM(time_to_sec(Duracion))), "%H:%i")  AS Duracion,
        Publicacion,
        Genero
    FROM Vista_CancionesAlbum WHERE idAlbum = idAlbumA GROUP BY Numero ORDER BY Numero;
END$$

DELIMITER ;

/* ----------------------------------------------------------------- CANCIONES GRUPO ----------------------------------------------------------------- */
DELIMITER $$
CREATE PROCEDURE `obtener_canciones`(IN idGrupoB INT)
BEGIN
SELECT * FROM Vista_CancionesGrupo WHERE idGrupo = idGrupoB;
END$$

DELIMITER ;