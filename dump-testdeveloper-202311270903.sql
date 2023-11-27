-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: testdeveloper
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

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

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Nombre1','Apellido1','Direccion 1',NULL,NULL,NULL),(2,'Nombre2','Apellido2','Direccion 2',NULL,NULL,NULL),(3,'Nombre3','Apellido3','Direccion 3',NULL,NULL,NULL),(4,'Nombre4','Apellido4','Direccion 4',NULL,NULL,NULL);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_ordenes`
--

DROP TABLE IF EXISTS `detalle_ordenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_ordenes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_orden` bigint(20) unsigned NOT NULL,
  `id_producto` bigint(20) unsigned NOT NULL,
  `cantidad` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `detalle_ordenes_id_orden_foreign` (`id_orden`),
  KEY `detalle_ordenes_id_producto_foreign` (`id_producto`),
  CONSTRAINT `detalle_ordenes_id_orden_foreign` FOREIGN KEY (`id_orden`) REFERENCES `ordenes_compra` (`id`),
  CONSTRAINT `detalle_ordenes_id_producto_foreign` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_ordenes`
--

LOCK TABLES `detalle_ordenes` WRITE;
/*!40000 ALTER TABLE `detalle_ordenes` DISABLE KEYS */;
INSERT INTO `detalle_ordenes` VALUES (5,12,3,2,'2023-11-27 11:53:59','2023-11-27 11:53:59'),(6,12,7,4,'2023-11-27 11:53:59','2023-11-27 11:53:59'),(11,12,3,1,NULL,NULL),(12,15,7,5,'2023-11-27 13:33:48','2023-11-27 13:33:48'),(13,15,10,10,'2023-11-27 13:33:48','2023-11-27 13:33:48'),(14,16,1,10,'2023-11-27 13:54:14','2023-11-27 13:54:14'),(15,16,3,12,'2023-11-27 13:54:14','2023-11-27 13:54:14'),(16,17,1,10,NULL,NULL),(17,17,3,12,NULL,NULL),(18,18,1,10,NULL,NULL),(19,18,3,12,NULL,NULL),(20,19,1,10,NULL,NULL),(21,19,3,12,NULL,NULL),(22,20,1,10,NULL,NULL),(23,20,3,12,NULL,NULL),(24,21,1,10,NULL,NULL),(25,21,3,12,NULL,NULL),(26,23,1,10,NULL,NULL),(27,23,3,12,NULL,NULL),(28,23,6,1,NULL,NULL),(29,24,3,2,'2023-11-27 14:32:26','2023-11-27 14:32:26');
/*!40000 ALTER TABLE `detalle_ordenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2014_10_12_200000_add_two_factor_columns_to_users_table',1),(4,'2019_08_19_000000_create_failed_jobs_table',1),(5,'2019_12_14_000001_create_personal_access_tokens_table',1),(6,'2023_11_25_133531_create_unidades_table',1),(7,'2023_11_26_125232_create_productos_table',1),(8,'2023_11_26_125513_create_clientes_table',1),(9,'2023_11_26_125520_create_ordenes_compra_table',1),(10,'2023_11_26_125527_create_detalle_ordenes_table',1),(11,'2023_11_26_130736_create_sessions_table',1),(12,'2023_11_27_053836_add_fecha_to_ordenes_compra_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenes_compra`
--

DROP TABLE IF EXISTS `ordenes_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenes_compra` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_cliente` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ordenes_compra_id_cliente_foreign` (`id_cliente`),
  CONSTRAINT `ordenes_compra_id_cliente_foreign` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes_compra`
--

LOCK TABLES `ordenes_compra` WRITE;
/*!40000 ALTER TABLE `ordenes_compra` DISABLE KEYS */;
INSERT INTO `ordenes_compra` VALUES (12,1,'2023-11-27 11:53:59','2023-11-27 11:53:59','2023-11-08'),(15,2,'2023-11-27 13:33:48','2023-11-27 13:33:48','2023-11-28'),(16,1,'2023-11-27 13:54:14','2023-11-27 13:54:14','2023-11-27'),(17,1,NULL,NULL,'2023-11-27'),(18,1,NULL,NULL,'2023-11-27'),(19,1,NULL,NULL,'2023-11-27'),(20,1,NULL,NULL,'2023-11-27'),(21,1,NULL,NULL,'2023-11-27'),(22,1,NULL,NULL,'2023-11-27'),(23,2,NULL,NULL,'2023-11-28'),(24,1,'2023-11-27 14:32:26','2023-11-27 14:32:26','2023-11-22');
/*!40000 ALTER TABLE `ordenes_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `id_unidad` bigint(20) unsigned NOT NULL,
  `descripcion` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productos_id_unidad_foreign` (`id_unidad`),
  CONSTRAINT `productos_id_unidad_foreign` FOREIGN KEY (`id_unidad`) REFERENCES `unidades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Producto 1',25.50,4,'Este es el producto 1',NULL,NULL,NULL),(2,'Producto 2',10.75,1,'Descripción del producto 2',NULL,NULL,NULL),(3,'Producto 3',50.00,2,'Detalle del producto 3',NULL,NULL,NULL),(4,'Producto 4',17.99,3,'Descripción del producto 4',NULL,NULL,NULL),(5,'Producto 5',8.25,1,'Detalle del producto 5',NULL,NULL,NULL),(6,'Producto 6',30.75,4,'Descripción del producto 6',NULL,NULL,NULL),(7,'Producto 7',42.00,2,'Detalle del producto 7',NULL,NULL,NULL),(8,'Producto 8',12.99,3,'Descripción del producto 8',NULL,NULL,NULL),(9,'Producto 9',19.95,1,'Detalle del producto 9',NULL,NULL,NULL),(10,'Producto 10',55.00,4,'Descripción del producto 10',NULL,NULL,NULL);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('6lZ6z0naQBwOILjFQq8Z5t03ytH6JY08Kfty2FH8',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiWU1OUUVkcU5UOFV2d0lHYTBQOUZmOEtmUnJ1dU1UcWtMbW85V3RQdiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9vcmRlbmVzLWNvbXByYSI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTIkdXVwcktuQ2dzaTBLQ0tKZlM3eVhSZUJYcFBsdU84bi54U2JrbFZUdGZPTDgvNzRtZnh4Sy4iO30=',1701073951);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidades`
--

DROP TABLE IF EXISTS `unidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidades` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `abreviatura` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidades`
--

LOCK TABLES `unidades` WRITE;
/*!40000 ALTER TABLE `unidades` DISABLE KEYS */;
INSERT INTO `unidades` VALUES (1,'Metro','m',NULL,NULL,NULL),(2,'Centímetro','cm',NULL,NULL,NULL),(3,'Pulgada','in',NULL,NULL,NULL),(4,'Pie','ft',NULL,NULL,NULL),(5,'Kilogramo','kg',NULL,NULL,NULL);
/*!40000 ALTER TABLE `unidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) unsigned DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Dennis Orellana','orellanadennis12@gmail.com',NULL,'$2y$12$uuprKnCgsi0KCKJfS7yXReBXpPluO8n.xSbklVTtfOL8/74mfxxK.',NULL,NULL,NULL,NULL,NULL,NULL,'2023-11-26 21:12:41','2023-11-26 21:12:41');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'testdeveloper'
--
/*!50003 DROP PROCEDURE IF EXISTS `InsertarOrdenCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `InsertarOrdenCompra`(

    IN datos JSON

)
BEGIN

    DECLARE fechaCompra DATE;

    DECLARE clienteID INT;

    DECLARE productoID INT;

    DECLARE cantidadProducto INT;

    DECLARE vItems INT;

    DECLARE vIndex BIGINT UNSIGNED DEFAULT 0;

   	DECLARE vJsonEsValido INT;

	

   SET vJsonEsValido = JSON_VALID(datos);

   

	IF vJsonEsValido = 0 THEN 

		SELECT "JSON suministrado no es válido";	

	else

	 	SET vJsonEsValido = JSON_LENGTH(datos);

	 

		IF vJsonEsValido = 0 THEN

            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El array de productos está vacío';

        ELSE

            SET fechaCompra = JSON_UNQUOTE(JSON_EXTRACT(datos, '$.fecha'));

		    SET clienteID = JSON_UNQUOTE(JSON_EXTRACT(datos, '$.cliente'));

		

		    INSERT INTO ordenes_compra (fecha, id_cliente) VALUES (fechaCompra, clienteID);

		    SET @ordenID = LAST_INSERT_ID();

		

		    -- Insertar el detalle de la orden de compra

		    SET @detalleArray = JSON_EXTRACT(datos, '$.productos');

		 	SET vItems = JSON_LENGTH(JSON_EXTRACT(datos, '$.productos'));

  

		    WHILE vIndex < vItems DO 

		        SET productoID = JSON_UNQUOTE(JSON_EXTRACT(@detalleArray, '$[0].id'));

		        SET cantidadProducto = JSON_UNQUOTE(JSON_EXTRACT(@detalleArray, '$[0].cantidad'));

		

		        INSERT INTO detalle_ordenes (id_orden, id_producto, cantidad) VALUES (@ordenID, productoID, cantidadProducto);

		

		        SET @detalleArray = JSON_REMOVE(@detalleArray, '$[0]');

		       SET vIndex = vIndex + 1;

		    END WHILE;

        END IF;

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-27  9:03:59
