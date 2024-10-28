CREATE DATABASE  IF NOT EXISTS `bdalumnos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bdalumnos`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: bdalumnos
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno` (
  `idalumno` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `registro` int DEFAULT NULL,
  `carrera_idcarrera` int NOT NULL,
  PRIMARY KEY (`idalumno`),
  UNIQUE KEY `idalumno_UNIQUE` (`idalumno`),
  KEY `fk_alumno_carrera1_idx` (`carrera_idcarrera`),
  CONSTRAINT `fk_alumno_carrera1` FOREIGN KEY (`carrera_idcarrera`) REFERENCES `carrera` (`idcarrera`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES (1,'Juan Pérez',20230001,1),(2,'María Gómez',20230002,2),(3,'Carlos Fernández',20230003,2),(4,'Ana Rodríguez',20230004,3),(5,'Lucía Martínez',20230005,1),(6,'José López',20230006,3);
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumno_has_materia`
--

DROP TABLE IF EXISTS `alumno_has_materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno_has_materia` (
  `alumno_idalumno` int NOT NULL,
  `materia_idmateria` int NOT NULL,
  `fecha` timestamp(3) NOT NULL,
  `nota` int DEFAULT NULL,
  PRIMARY KEY (`alumno_idalumno`,`materia_idmateria`,`fecha`),
  KEY `fk_alumno_has_materia_materia1_idx` (`materia_idmateria`),
  KEY `fk_alumno_has_materia_alumno1_idx` (`alumno_idalumno`),
  CONSTRAINT `fk_alumno_has_materia_alumno1` FOREIGN KEY (`alumno_idalumno`) REFERENCES `alumno` (`idalumno`),
  CONSTRAINT `fk_alumno_has_materia_materia1` FOREIGN KEY (`materia_idmateria`) REFERENCES `materia` (`idmateria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno_has_materia`
--

LOCK TABLES `alumno_has_materia` WRITE;
/*!40000 ALTER TABLE `alumno_has_materia` DISABLE KEYS */;
INSERT INTO `alumno_has_materia` VALUES (1,1,'2024-01-15 13:00:00.000',9),(1,2,'2024-01-20 12:30:00.000',7),(2,1,'2024-02-05 17:00:00.000',9),(2,3,'2024-02-10 14:00:00.000',7),(3,1,'2024-03-18 15:00:00.000',8),(3,2,'2024-03-12 11:45:00.000',8),(4,3,'2024-04-10 16:00:00.000',8),(4,4,'2024-04-01 13:15:00.000',7),(5,5,'2024-05-05 12:00:00.000',9),(6,6,'2024-05-12 18:30:00.000',9);
/*!40000 ALTER TABLE `alumno_has_materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrera` (
  `idcarrera` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `facultad_idfacultad` int NOT NULL,
  PRIMARY KEY (`idcarrera`),
  UNIQUE KEY `idcarrera_UNIQUE` (`idcarrera`),
  KEY `fk_carrera_facultad_idx` (`facultad_idfacultad`),
  CONSTRAINT `fk_carrera_facultad` FOREIGN KEY (`facultad_idfacultad`) REFERENCES `facultad` (`idfacultad`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES (1,'Lic. Ciencias de la Computación',1),(2,'Lic. en Astronomía',1),(3,'Lic. Biología',1),(4,'Ingenieria Quimica',2),(5,'Licenciatura en Filosofía',3),(6,'Lic. Artes Visuales',3);
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente`
--

DROP TABLE IF EXISTS `docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docente` (
  `iddocente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `usuario_idusuario` int NOT NULL,
  PRIMARY KEY (`iddocente`),
  UNIQUE KEY `iddocente_UNIQUE` (`iddocente`),
  KEY `fk_docente_usuario1_idx` (`usuario_idusuario`),
  CONSTRAINT `fk_docente_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente`
--

LOCK TABLES `docente` WRITE;
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
INSERT INTO `docente` VALUES (1,'Lorena Parra',1),(2,'Hugo Orellano',2),(3,'Susana Chavez',3),(4,'Nestor',4);
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente_has_materia`
--

DROP TABLE IF EXISTS `docente_has_materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docente_has_materia` (
  `docente_iddocente` int NOT NULL,
  `materia_idmateria` int NOT NULL,
  PRIMARY KEY (`docente_iddocente`,`materia_idmateria`),
  KEY `fk_docente_has_materia_materia1_idx` (`materia_idmateria`),
  KEY `fk_docente_has_materia_docente1_idx` (`docente_iddocente`),
  CONSTRAINT `fk_docente_has_materia_docente1` FOREIGN KEY (`docente_iddocente`) REFERENCES `docente` (`iddocente`),
  CONSTRAINT `fk_docente_has_materia_materia1` FOREIGN KEY (`materia_idmateria`) REFERENCES `materia` (`idmateria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente_has_materia`
--

LOCK TABLES `docente_has_materia` WRITE;
/*!40000 ALTER TABLE `docente_has_materia` DISABLE KEYS */;
INSERT INTO `docente_has_materia` VALUES (1,1),(1,2),(2,4),(2,5),(3,5),(4,5),(3,10);
/*!40000 ALTER TABLE `docente_has_materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facultad`
--

DROP TABLE IF EXISTS `facultad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facultad` (
  `idfacultad` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idfacultad`),
  UNIQUE KEY `idfacultad_UNIQUE` (`idfacultad`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facultad`
--

LOCK TABLES `facultad` WRITE;
/*!40000 ALTER TABLE `facultad` DISABLE KEYS */;
INSERT INTO `facultad` VALUES (1,'Exactas'),(2,'Ingenieria'),(3,'Filosofía');
/*!40000 ALTER TABLE `facultad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia` (
  `idmateria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idmateria`),
  UNIQUE KEY `idmateria_UNIQUE` (`idmateria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` VALUES (1,'Matemáticas'),(2,'Física'),(3,'Química'),(4,'Programación'),(5,'Base de Datos'),(6,'Historia'),(7,'Literatura'),(8,'Arte'),(9,'Biología'),(10,'Inglés');
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `clave` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `idusuario_UNIQUE` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Lorena',NULL),(2,'Hugo',NULL),(3,'Susana',NULL),(4,'Nestor',NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bdalumnos'
--

--
-- Dumping routines for database 'bdalumnos'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-28  9:29:43
