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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (2,'Alemania','Europa','Aleman, Alemana','https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Flag_of_Germany.svg/640px-Flag_of_Germany.svg.png'),(3,'México','America','Mexicano, Mexicana','https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Flag_of_Mexico.svg/1280px-Flag_of_Mexico.svg.png'),(4,'Argentina','America','Argentino, Argentina','https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Flag_of_Argentina.svg/1200px-Flag_of_Argentina.svg.png'),(5,'Australia','Oceania','Australiano, Australiana','https://upload.wikimedia.org/wikipedia/commons/8/88/Flag_of_Australia_%28converted%29.svg'),(6,'Austria','Europa','Austriaco, Austriaca','https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Flag_of_Austria.svg/640px-Flag_of_Austria.svg.png'),(7,'Bélgica','Europa','Belga','https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Flag_of_Belgium_%28civil%29.svg/1200px-Flag_of_Belgium_%28civil%29.svg.png'),(8,'Canadá','America','Canadiense','https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Flag_of_Canada_%28Pantone%29.svg/800px-Flag_of_Canada_%28Pantone%29.svg.png'),(9,'China','Asia','Chino, China','https://genexus.blog/wp-content/uploads/2021/09/Bandera-China.jpeg'),(10,'Estados Unidos','America','Americano, Americana','https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/1200px-Flag_of_the_United_States.svg.png'),(11,'Francia','Europa','Frances, Francesa','https://m.media-amazon.com/images/I/41Dka5ibTAL.jpg'),(12,'Inglaterra','Europa','Inglés, Inglesa','https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Flag_of_England.svg/1920px-Flag_of_England.svg.png'),(13,'Irlanda del Norte','Europa','Norirlandés, Norirlandesa','https://upload.wikimedia.org/wikipedia/commons/thumb/4/43/Flag_of_Northern_Ireland_%281953%E2%80%931972%29.svg/1920px-Flag_of_Northern_Ireland_%281953%E2%80%931972%29.svg.png'),(14,'Japón','Asia','Japones, Japonesa','https://banderasdelmundo.org/wp-content/uploads/2021/02/bandera-de-japon-actual-1.jpg'),(15,'Rusia','Europa','Ruso, Rusa','https://mf.b37mrtl.ru/rbthmedia/images/2021.06/article/60c0e15285600a1fb24d33f7.jpg'),(16,'Nueva Zelanda','Oceania','Neozelandés, Neozelandesa','https://upload.wikimedia.org/wikipedia/commons/3/3e/Flag_of_New_Zealand.svg'),(17,'Suecia','Europa','Sueco, Sueca','https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Flag_of_Sweden.svg/1200px-Flag_of_Sweden.svg.png');
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
  1 AS `idNacionalidad` */;
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
  1 AS `idDesarrollador`,
  1 AS `idDistribuidor`,
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
/*!50001 VIEW `vista_desarrollador` AS select `desarrollador`.`idDesarrollador` AS `idDesarrollador`,`desarrollador`.`Nombre` AS `Nombre`,`desarrollador`.`Genero` AS `Genero`,`desarrollador`.`idFundador` AS `idFundador`,`desarrollador`.`Origen` AS `Origen`,`desarrollador`.`Fundacion` AS `Fundacion`,`desarrollador`.`Sitio` AS `Sitio` from `desarrollador` */;
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
/*!50001 VIEW `vista_director` AS select `director`.`idDirector` AS `idDirector`,`director`.`Nombre` AS `Nombre`,`director`.`Alias` AS `Alias`,`director`.`FechaNacimiento` AS `FechaNacimiento`,`director`.`idNacionalidad` AS `idNacionalidad` from `director` */;
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
/*!50001 VIEW `vista_distribuidor` AS select `distribuidor`.`idDistribuidor` AS `idDistribuidor`,`distribuidor`.`Nombre` AS `Nombre`,`distribuidor`.`idFundador` AS `idFundador`,`distribuidor`.`Fundacion` AS `Fundacion`,`distribuidor`.`Sitio` AS `Sitio` from `distribuidor` */;
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
/*!50001 VIEW `vista_juegos` AS select `juegos`.`idJuego` AS `idJuego`,`juegos`.`Nombre` AS `Nombre`,`juegos`.`Genero` AS `Genero`,`juegos`.`Modalidad` AS `Modalidad`,`juegos`.`Plataforma` AS `Plataforma`,`juegos`.`Lanzamiento` AS `Lanzamiento`,`juegos`.`idDesarrollador` AS `idDesarrollador`,`juegos`.`idDistribuidor` AS `idDistribuidor`,`juegos`.`idDirector` AS `idDirector` from `juegos` */;
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

-- Dump completed on 2023-02-05 18:34:43
