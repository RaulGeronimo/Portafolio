-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: Videojuegos
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
-- Table structure for table `desarrollador`
--

DROP TABLE IF EXISTS `desarrollador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `desarrollador` (
  `idDesarrollador` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Genero` varchar(100) DEFAULT NULL,
  `idFundador` int(11) DEFAULT NULL,
  `Origen` varchar(100) DEFAULT NULL,
  `Fundacion` date DEFAULT NULL,
  `Sitio` text DEFAULT NULL,
  PRIMARY KEY (`idDesarrollador`),
  KEY `idFundador` (`idFundador`),
  CONSTRAINT `desarrollador_ibfk_1` FOREIGN KEY (`idFundador`) REFERENCES `director` (`idDirector`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desarrollador`
--

LOCK TABLES `desarrollador` WRITE;
/*!40000 ALTER TABLE `desarrollador` DISABLE KEYS */;
/*!40000 ALTER TABLE `desarrollador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `director` (
  `idDirector` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(70) DEFAULT NULL,
  `Alias` varchar(50) DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `idNacionalidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDirector`),
  KEY `idNacionalidad` (`idNacionalidad`),
  CONSTRAINT `director_ibfk_1` FOREIGN KEY (`idNacionalidad`) REFERENCES `pais` (`idPais`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distribuidor`
--

DROP TABLE IF EXISTS `distribuidor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distribuidor` (
  `idDistribuidor` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  `idFundador` int(11) DEFAULT NULL,
  `Fundacion` date DEFAULT NULL,
  `Sitio` text DEFAULT NULL,
  PRIMARY KEY (`idDistribuidor`),
  KEY `idFundador` (`idFundador`),
  CONSTRAINT `distribuidor_ibfk_1` FOREIGN KEY (`idFundador`) REFERENCES `director` (`idDirector`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distribuidor`
--

LOCK TABLES `distribuidor` WRITE;
/*!40000 ALTER TABLE `distribuidor` DISABLE KEYS */;
/*!40000 ALTER TABLE `distribuidor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juegos`
--

DROP TABLE IF EXISTS `juegos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `juegos` (
  `idJuego` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(60) DEFAULT NULL,
  `Genero` varchar(100) DEFAULT NULL,
  `Modalidad` varchar(50) DEFAULT NULL,
  `Plataforma` varchar(60) DEFAULT NULL,
  `Lanzamiento` date DEFAULT NULL,
  `idDesarrollador` int(11) DEFAULT NULL,
  `idDistribuidor` int(11) DEFAULT NULL,
  `idDirector` int(11) DEFAULT NULL,
  PRIMARY KEY (`idJuego`),
  KEY `idDesarrollador` (`idDesarrollador`),
  KEY `idDistribuidor` (`idDistribuidor`),
  KEY `idDirector` (`idDirector`),
  CONSTRAINT `juegos_ibfk_1` FOREIGN KEY (`idDesarrollador`) REFERENCES `desarrollador` (`idDesarrollador`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `juegos_ibfk_2` FOREIGN KEY (`idDistribuidor`) REFERENCES `distribuidor` (`idDistribuidor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `juegos_ibfk_3` FOREIGN KEY (`idDirector`) REFERENCES `director` (`idDirector`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juegos`
--

LOCK TABLES `juegos` WRITE;
/*!40000 ALTER TABLE `juegos` DISABLE KEYS */;
/*!40000 ALTER TABLE `juegos` ENABLE KEYS */;
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
  `Continente` varchar(50) DEFAULT NULL,
  `Nacionalidad` varchar(70) DEFAULT NULL,
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
-- Temporary table structure for view `vista_desarrollador`
--

DROP TABLE IF EXISTS `vista_desarrollador`;
/*!50001 DROP VIEW IF EXISTS `vista_desarrollador`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_desarrollador` AS SELECT
 1 AS `idDesarrollador`,
  1 AS `Nombre`,
  1 AS `Genero`,
  1 AS `idFundador`,
  1 AS `Fundador`,
  1 AS `Origen`,
  1 AS `Fundacion`,
  1 AS `Sitio` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_director`
--

DROP TABLE IF EXISTS `vista_director`;
/*!50001 DROP VIEW IF EXISTS `vista_director`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_director` AS SELECT
 1 AS `idDirector`,
  1 AS `Nombre`,
  1 AS `Alias`,
  1 AS `FechaNacimiento`,
  1 AS `Edad`,
  1 AS `idNacionalidad`,
  1 AS `Nacionalidad` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_distribuidor`
--

DROP TABLE IF EXISTS `vista_distribuidor`;
/*!50001 DROP VIEW IF EXISTS `vista_distribuidor`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_distribuidor` AS SELECT
 1 AS `idDistribuidor`,
  1 AS `Nombre`,
  1 AS `idFundador`,
  1 AS `Fundador`,
  1 AS `Fundacion`,
  1 AS `Sitio` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_juegos`
--

DROP TABLE IF EXISTS `vista_juegos`;
/*!50001 DROP VIEW IF EXISTS `vista_juegos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_juegos` AS SELECT
 1 AS `idJuego`,
  1 AS `Nombre`,
  1 AS `Genero`,
  1 AS `Modalidad`,
  1 AS `Plataforma`,
  1 AS `Lanzamiento`,
  1 AS `Desarrollador`,
  1 AS `idDesarrollador`,
  1 AS `Distribuidor`,
  1 AS `idDistribuidor`,
  1 AS `Director`,
  1 AS `idDirector` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_desarrollador`
--

/*!50001 DROP VIEW IF EXISTS `vista_desarrollador`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_desarrollador` AS select `desarrollador`.`idDesarrollador` AS `idDesarrollador`,`desarrollador`.`Nombre` AS `Nombre`,`desarrollador`.`Genero` AS `Genero`,`desarrollador`.`idFundador` AS `idFundador`,`director`.`Nombre` AS `Fundador`,`desarrollador`.`Origen` AS `Origen`,replace(date_format(`desarrollador`.`Fundacion`,'%d / %M / %Y'),substr(date_format(`desarrollador`.`Fundacion`,'%d / %M / %Y'),6,1),ucase(substr(date_format(`desarrollador`.`Fundacion`,'%d / %M / %Y'),6,1))) AS `Fundacion`,`desarrollador`.`Sitio` AS `Sitio` from (`desarrollador` join `director` on(`desarrollador`.`idFundador` = `director`.`idDirector`)) order by `desarrollador`.`Nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_director`
--

/*!50001 DROP VIEW IF EXISTS `vista_director`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_director` AS select `director`.`idDirector` AS `idDirector`,`director`.`Nombre` AS `Nombre`,`director`.`Alias` AS `Alias`,replace(date_format(`director`.`FechaNacimiento`,'%d / %M / %Y'),substr(date_format(`director`.`FechaNacimiento`,'%d / %M / %Y'),6,1),ucase(substr(date_format(`director`.`FechaNacimiento`,'%d / %M / %Y'),6,1))) AS `FechaNacimiento`,timestampdiff(YEAR,`director`.`FechaNacimiento`,current_timestamp()) AS `Edad`,`director`.`idNacionalidad` AS `idNacionalidad`,concat_ws(' - ',`pais`.`Nombre`,`pais`.`Nacionalidad`) AS `Nacionalidad` from (`director` join `pais` on(`director`.`idNacionalidad` = `pais`.`idPais`)) order by `director`.`Nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_distribuidor`
--

/*!50001 DROP VIEW IF EXISTS `vista_distribuidor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_distribuidor` AS select `distribuidor`.`idDistribuidor` AS `idDistribuidor`,`distribuidor`.`Nombre` AS `Nombre`,`distribuidor`.`idFundador` AS `idFundador`,`director`.`Nombre` AS `Fundador`,replace(date_format(`distribuidor`.`Fundacion`,'%d / %M / %Y'),substr(date_format(`distribuidor`.`Fundacion`,'%d / %M / %Y'),6,1),ucase(substr(date_format(`distribuidor`.`Fundacion`,'%d / %M / %Y'),6,1))) AS `Fundacion`,`distribuidor`.`Sitio` AS `Sitio` from (`distribuidor` join `director` on(`distribuidor`.`idFundador` = `director`.`idDirector`)) order by `distribuidor`.`Nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_juegos`
--

/*!50001 DROP VIEW IF EXISTS `vista_juegos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_juegos` AS select `juegos`.`idJuego` AS `idJuego`,`juegos`.`Nombre` AS `Nombre`,`juegos`.`Genero` AS `Genero`,`juegos`.`Modalidad` AS `Modalidad`,`juegos`.`Plataforma` AS `Plataforma`,replace(date_format(`juegos`.`Lanzamiento`,'%d / %M / %Y'),substr(date_format(`juegos`.`Lanzamiento`,'%d / %M / %Y'),6,1),ucase(substr(date_format(`juegos`.`Lanzamiento`,'%d / %M / %Y'),6,1))) AS `Lanzamiento`,`desarrollador`.`Nombre` AS `Desarrollador`,`juegos`.`idDesarrollador` AS `idDesarrollador`,`distribuidor`.`Nombre` AS `Distribuidor`,`juegos`.`idDistribuidor` AS `idDistribuidor`,`director`.`Nombre` AS `Director`,`juegos`.`idDirector` AS `idDirector` from (((`juegos` join `desarrollador` on(`juegos`.`idDesarrollador` = `desarrollador`.`idDesarrollador`)) join `distribuidor` on(`juegos`.`idDistribuidor` = `distribuidor`.`idDistribuidor`)) join `director` on(`juegos`.`idDirector` = `director`.`idDirector`)) order by `juegos`.`Nombre` */;
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

-- Dump completed on 2023-02-06 21:33:51
