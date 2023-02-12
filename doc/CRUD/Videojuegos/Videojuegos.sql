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

/* PROCEDIMIENTOS ALMACENADOS */
/* ------------------------------------------ PAIS ------------------------------------------ */
/* -------- MOSTRAR -------- */
DELIMITER $$
CREATE PROCEDURE `mostrar_pais`()
BEGIN
SELECT idPais, Nombre, Continente, Nacionalidad, Bandera FROM Pais ORDER BY Nombre;
END$$

DELIMITER ;

/* -------- INSERTAR -------- */
DELIMITER $$
CREATE PROCEDURE `inserta_pais`(
    IN NombreI VARCHAR(50),
    IN ContinenteI VARCHAR(50),
    IN NacionalidadI VARCHAR(70),
    IN BanderaI TEXT
)
BEGIN
INSERT INTO Pais(
    Nombre,
    Continente,
    Nacionalidad,
    Bandera
)VALUES(
    NombreI,
    ContinenteI,
    NacionalidadI,
    BanderaI
);
END$$

DELIMITER ;

/* -------- ACTUALIZAR -------- */
DELIMITER $$
CREATE PROCEDURE `actualiza_pais`(
    IN NombreU VARCHAR(50),
    IN ContinenteU VARCHAR(50),
    IN NacionalidadU VARCHAR(70),
    IN BanderaU TEXT,
    IN idPaisU INT
)
BEGIN
UPDATE Pais SET
    Nombre = NombreU,
    Continente = ContinenteU,
    Nacionalidad = NacionalidadU,
    Bandera = BanderaU
WHERE idPais = idPaisU;
END$$

DELIMITER ;

/* -------- ELIMINAR -------- */
DELIMITER $$
CREATE PROCEDURE `elimina_pais`(IN idPaisE INT)
BEGIN
DELETE FROM Pais WHERE idPais = idPaisE;
END$$

DELIMITER ;

/* -------- BUSCAR -------- */
DELIMITER $$
CREATE PROCEDURE `obtener_pais`(IN idPaisI INT)
BEGIN
SELECT * FROM Pais WHERE idPais = idPaisI;
END$$

DELIMITER ;

/* ----------------------------------------- DIRECTOR ----------------------------------------- */
/* -------- MOSTRAR -------- */
DELIMITER $$
CREATE PROCEDURE `mostrar_director`()
BEGIN
SELECT idDirector, Nombre, Alias, FechaNacimiento, Nacionalidad, Edad FROM Vista_Director;
END$$

DELIMITER ;

/* -------- INSERTAR -------- */
DELIMITER $$
CREATE PROCEDURE `inserta_director`(
    IN NombreI VARCHAR(70),
    IN AliasI VARCHAR(50),
    IN FechaNacimientoI DATE,
    IN idNacionalidadI INT
)
BEGIN
INSERT INTO Director(
    Nombre,
    Alias,
    FechaNacimiento,
    idNacionalidad
)
VALUES
    (
        NombreI,
        AliasI,
        FechaNacimientoI,
        idNacionalidadI
    );
END$$

DELIMITER ;

/* -------- ACTUALIZAR -------- */
DELIMITER $$
CREATE PROCEDURE `actualiza_director`(
    IN NombreU VARCHAR(70),
    IN AliasU VARCHAR(50),
    IN FechaNacimientoU DATE,
    IN idNacionalidadU INT,
    IN idDirectorU INT
)
BEGIN
UPDATE Director SET
Nombre = NombreU,
    Alias = AliasU,
    FechaNacimiento = FechaNacimientoU,
    idNacionalidad = idNacionalidadU
WHERE idDirector = idDirectorU;
END$$

DELIMITER ;
/* -------- ELIMINAR -------- */
DELIMITER $$
CREATE PROCEDURE `elimina_director` (IN idDirectorE INT)
BEGIN
DELETE FROM Director WHERE idDirector = idDirectorE;
END$$

DELIMITER ;

/* -------- BUSCAR -------- */
DELIMITER $$
CREATE PROCEDURE `obtener_director` (IN idDirectorE INT)
BEGIN
SELECT * FROM Director WHERE idDirector = idDirectorE;
END$$

DELIMITER ;

/* ----------------------------------------- DISTRIBUIDOR ----------------------------------------- */
/* -------- MOSTRAR -------- */
DELIMITER $$
CREATE PROCEDURE `mostrar_distribuidor` ()
BEGIN
SELECT idDistribuidor, Nombre, Fundador, Fundacion, Sitio FROM Vista_Distribuidor;
END$$

DELIMITER ;

/* -------- INSERTAR -------- */
DELIMITER $$
CREATE PROCEDURE `inserta_distribuidor` (
	IN NombreI VARCHAR(50),
    IN idFundadorI INT,
    IN FundacionI DATE,
    IN SitioI text
    )
BEGIN
INSERT INTO Distribuidor(
    Nombre,
    idFundador,
    Fundacion,
    Sitio
)VALUES(
    NombreI,
    idFundadorI,
    FundacionI,
    SitioI
);
END$$

DELIMITER ;

/* -------- ACTUALIZAR -------- */
DELIMITER $$
CREATE PROCEDURE `actualiza_distribuidor` (
	IN NombreU VARCHAR(50),
    IN idFundadorU INT,
    IN FundacionU DATE,
    IN SitioU text,
    IN idDistribuidorU INT
    )
BEGIN
UPDATE Distribuidor SET
    Nombre=NombreU,
    idFundador=idFundadorU,
    Fundacion=FundacionU,
    Sitio=SitioU
WHERE idDistribuidor = idDistribuidorU;
END$$

DELIMITER ;

/* -------- ELIMINAR -------- */
DELIMITER $$
CREATE PROCEDURE `elimina_distribuidor` (IN idDistribuidorE INT)
BEGIN
DELETE FROM Distribuidor WHERE idDistribuidor = idDistribuidorE;
END$$

DELIMITER ;

/* -------- BUSCAR -------- */
DELIMITER $$
CREATE PROCEDURE `obtener_distribuidor` (IN idDistribuidorI INT)
BEGIN
SELECT * FROM Distribuidor WHERE idDistribuidor = idDistribuidorI;
END$$

DELIMITER ;

/* ----------------------------------------- DESARROLLADOR ----------------------------------------- */
/* -------- MOSTRAR -------- */
DELIMITER $$
CREATE PROCEDURE `mostrar_desarrollador` ()
BEGIN
SELECT idDesarrollador, Nombre, Genero, Fundador, Origen, Fundacion, Sitio FROM Vista_Desarrollador;
END$$

DELIMITER ;

/* -------- INSERTAR -------- */
DELIMITER $$
CREATE PROCEDURE `inserta_desarrollador` (
	IN NombreI VARCHAR(45),
    IN GeneroI VARCHAR(100),
    IN idFundadorI INT,
    IN OrigenI VARCHAR(100),
    IN FundacionI DATE,
    IN SitioI TEXT
)
BEGIN
INSERT INTO Desarrollador(
	Nombre,
	Genero,
	idFundador,
	Origen,
	Fundacion,
	Sitio
) VALUES (
	NombreI,
	GeneroI,
	idFundadorI,
	OrigenI,
	FundacionI,
	SitioI
);
END$$

DELIMITER ;

/* -------- ACTUALIZAR -------- */
DELIMITER $$
CREATE PROCEDURE `actualiza_desarrollador` (
	IN NombreU VARCHAR(45),
    IN GeneroU VARCHAR(100),
    IN idFundadorU INT,
    IN OrigenU VARCHAR(100),
    IN FundacionU DATE,
    IN SitioU TEXT,
    IN idDesarrolladorU INT
    )
BEGIN
UPDATE Desarrollador SET
	Nombre=NombreU,
	Genero=GeneroU,
	idFundador=idFundadorU,
	Origen=OrigenU,
	Fundacion=FundacionU,
	Sitio=SitioU
WHERE idDesarrollador = idDesarrolladorU;
END$$

DELIMITER ;

/* -------- ELIMINAR -------- */
DELIMITER $$
CREATE PROCEDURE `elimina_desarrollador` (IN idDesarrolladorE INT)
BEGIN
DELETE FROM Desarrollador WHERE idDesarrollador = idDesarrolladorE;
END$$

DELIMITER ;

/* -------- BUSCAR -------- */
DELIMITER $$
CREATE PROCEDURE `obtener_desarrollador` (IN idDesarrolladorI INT)
BEGIN
SELECT * FROM Desarrollador WHERE idDesarrollador = idDesarrolladorI;
END$$

DELIMITER ;

/* ----------------------------------------- JUEGOS ----------------------------------------- */
/* -------- MOSTRAR -------- */
DELIMITER $$
CREATE PROCEDURE `mostrar_juego` ()
BEGIN
SELECT idJuego, Nombre, Genero, Modalidad, Plataforma, Lanzamiento, Desarrollador, Distribuidor, Director FROM Vista_Juegos;
END$$

DELIMITER ;

/* -------- INSERTAR -------- */
DELIMITER $$
CREATE PROCEDURE `inserta_juego` (
	IN NombreI VARCHAR(60),
    IN GeneroI VARCHAR(100),
    IN ModalidadI VARCHAR(50),
    IN PlataformaI VARCHAR(60),
    IN LanzamientoI DATE,
    IN idDesarrolladorI INT,
    IN idDistribuidorI INT,
    IN idDirectorI INT
)
BEGIN
INSERT INTO Juegos (
	Nombre,
	Genero,
	Modalidad,
	Plataforma,
	Lanzamiento,
	idDesarrollador,
	idDistribuidor,
	idDirector
)VALUES(
	NombreI,
	GeneroI,
	ModalidadI,
	PlataformaI,
	LanzamientoI,
	idDesarrolladorI,
	idDistribuidorI,
	idDirectorI
);
END$$

DELIMITER ;

/* -------- ACTUALIZAR -------- */
DELIMITER $$
CREATE PROCEDURE `actualiza_juego` (
	IN NombreI VARCHAR(60),
    IN GeneroU VARCHAR(100),
    IN ModalidadU VARCHAR(50),
    IN PlataformaU VARCHAR(60),
    IN LanzamientoU DATE,
    IN idDesarrolladorU INT,
    IN idDistribuidorU INT,
    IN idDirectorU INT,
    IN idJuegoU INT)
BEGIN
UPDATE Juegos SET
	Nombre=NombreI,
	Genero=GeneroU,
	Modalidad=ModalidadU,
	Plataforma=PlataformaU,
	Lanzamiento=LanzamientoU,
	idDesarrollador=idDesarrolladorU,
	idDistribuidor=idDistribuidorU,
	idDirector=idDirectorU
    WHERE idJuego = idJuegoU;
END$$

DELIMITER ;

/* -------- ELIMINAR -------- */
DELIMITER $$
CREATE PROCEDURE `elimina_juego` (IN idJuegoE INT)
BEGIN
DELETE FROM Juegos WHERE idJuego = idJuegoE;
END$$

DELIMITER ;

/* -------- BUSCAR -------- */
DELIMITER $$
CREATE PROCEDURE `obtener_juego` (IN idJuegoI INT)
BEGIN
SELECT * FROM Juegos WHERE idJuego = idJuegoI;
END$$

DELIMITER ;