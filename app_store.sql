-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 22-11-2021 a las 06:42:21
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `app_store`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `config`
--

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `mensage` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `eslogan` varchar(120) COLLATE utf8_spanish_ci NOT NULL,
  `inlogin` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `outlogin` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `eslogan_nav` varchar(80) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `config`
--

INSERT INTO `config` (`mensage`, `eslogan`, `inlogin`, `outlogin`, `eslogan_nav`) VALUES
('Bienvenidoz', 'Gracias por Venir', 'Ingresar', 'Salir', 'EL FENIS GLOTON');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enterprise`
--

DROP TABLE IF EXISTS `enterprise`;
CREATE TABLE IF NOT EXISTS `enterprise` (
  `id_enterprise` int(12) NOT NULL AUTO_INCREMENT,
  `name_enterprise` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_enterprise`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `enterprise`
--

INSERT INTO `enterprise` (`id_enterprise`, `name_enterprise`, `create_at`) VALUES
(1, 'lostreseditores', '2021-09-14 13:19:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

DROP TABLE IF EXISTS `factura`;
CREATE TABLE IF NOT EXISTS `factura` (
  `id_factura` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `valor` int(11) NOT NULL,
  `id_metodo` int(15) DEFAULT NULL,
  `estado_valor` int(11) DEFAULT '1',
  `estado_factura` int(11) DEFAULT '4',
  `user_update` int(11) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `observacion` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` int(11) DEFAULT '0',
  PRIMARY KEY (`id_factura`),
  UNIQUE KEY `id_factura` (`id_factura`),
  KEY `id_user` (`id_user`),
  KEY `id_pedido` (`id_pedido`),
  KEY `estado_factura` (`estado_factura`),
  KEY `user_update` (`user_update`),
  KEY `estado_valor` (`estado_valor`),
  KEY `id_metodo` (`id_metodo`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id_factura`, `id_user`, `id_pedido`, `valor`, `id_metodo`, `estado_valor`, `estado_factura`, `user_update`, `create_at`, `update_at`, `observacion`, `estado`) VALUES
(141, 87, 183, 3000, 2, 2, 3, 87, '2021-11-22 04:26:37', '2021-11-22 04:26:37', NULL, 1),
(142, 87, 182, 10000, 3, 1, 3, 87, '2021-11-22 04:26:48', '2021-11-22 04:26:48', NULL, 1),
(143, 87, 184, 3000, 1, 2, 3, 87, '2021-11-22 04:38:51', '2021-11-22 04:38:52', NULL, 1),
(144, 87, 185, 15000, 3, 2, 3, 87, '2021-11-22 04:40:04', '2021-11-22 04:40:04', NULL, 1),
(145, 87, 186, 3000, NULL, 1, 3, 87, '2021-11-22 04:40:40', '2021-11-22 04:40:40', NULL, 1),
(146, 87, 188, 10000, 2, 1, 3, 87, '2021-11-22 04:42:12', '2021-11-22 04:42:12', NULL, 1),
(147, 87, 189, 10000, NULL, 1, 3, 87, '2021-11-22 04:44:45', '2021-11-22 04:44:45', NULL, 1),
(148, 87, 183, 30000, NULL, 2, 5, 87, '2021-11-22 05:05:42', '2021-11-22 05:18:27', NULL, 1),
(149, 87, 183, 30000, NULL, 2, 5, 87, '2021-11-22 05:07:56', '2021-11-22 05:18:27', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `game`
--

DROP TABLE IF EXISTS `game`;
CREATE TABLE IF NOT EXISTS `game` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(180) COLLATE utf8_spanish_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `image` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `game`
--

INSERT INTO `game` (`id`, `title`, `description`, `image`, `created_at`) VALUES
(1, 'free fire', 'xiaomi', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', '2021-04-01 20:43:44'),
(7, 'gtaV', 'epic games', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHuGDCu0cJnETp5DRU2Us9cFE5SxXzDcFxoA&usqp=CAU', '2021-04-03 21:12:51'),
(8, 'gohan', 'ojito', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_I1LupNsIrn70VIFeURf0QrjTImwUcglNKg&usqp=CAU', '2021-04-03 20:46:45'),
(5, 'gohan', 'ojito', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_I1LupNsIrn70VIFeURf0QrjTImwUcglNKg&usqp=CAU', '2021-04-03 20:46:45'),
(9, 'gohan', 'ojito', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_I1LupNsIrn70VIFeURf0QrjTImwUcglNKg&usqp=CAU', '2021-04-03 20:46:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_pago`
--

DROP TABLE IF EXISTS `metodo_pago`;
CREATE TABLE IF NOT EXISTS `metodo_pago` (
  `id_metodo` int(11) NOT NULL AUTO_INCREMENT,
  `metodo_name` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `image` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_metodo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `metodo_pago`
--

INSERT INTO `metodo_pago` (`id_metodo`, `metodo_name`, `create_at`, `image`) VALUES
(1, 'efectivo', '2021-11-20 20:36:18', 'https://image.freepik.com/vector-gratis/icono-dinero-efectivo-aislado_24877-13371.jpg'),
(2, 'datafono', '2021-11-20 20:36:18', 'https://st3.depositphotos.com/1007566/34620/v/600/depositphotos_346204568-stock-illustration-dataphone-device-technology-isolated-icon.jpg'),
(3, 'codigo_qr', '2021-11-20 20:36:18', 'https://images.vexels.com/media/users/3/158236/isolated/lists/cd6afb16dc02a575783626a4b9970366-icono-de-codigo-qr-de-smartphone.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE IF NOT EXISTS `pedido` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `valor` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `value_pedido` tinyint(1) DEFAULT '1',
  `servicio` tinyint(1) DEFAULT '0',
  `estado_valor` int(11) DEFAULT '1',
  `metodo_pago` int(11) DEFAULT NULL,
  `pedido_estado` int(11) DEFAULT '1',
  `user_update` int(11) DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pedido`),
  KEY `id_user` (`id_user`),
  KEY `estado_valor` (`estado_valor`),
  KEY `pedido_estado` (`pedido_estado`),
  KEY `user_update` (`user_update`),
  KEY `metodo_pago` (`metodo_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `id_user`, `valor`, `created_at`, `value_pedido`, `servicio`, `estado_valor`, `metodo_pago`, `pedido_estado`, `user_update`, `update_at`) VALUES
(181, 87, 7000, '2021-11-22 01:51:02', 0, 1, 2, 1, 3, 87, '2021-11-22 01:51:02'),
(182, 89, 10000, '2021-11-22 01:51:54', 0, 0, 2, 3, 3, 87, '2021-11-22 04:26:48'),
(183, 88, 3000, '2021-11-22 01:52:11', 0, 1, 2, 2, 3, 87, '2021-11-22 04:26:37'),
(184, 88, 3000, '2021-11-22 04:38:23', 0, 1, 2, 1, 3, 87, '2021-11-22 04:38:51'),
(185, 89, 15000, '2021-11-22 04:39:59', 0, 1, 2, 3, 3, 87, '2021-11-22 04:40:04'),
(186, 88, 3000, '2021-11-22 04:40:36', 0, 0, 1, NULL, 3, 87, '2021-11-22 04:40:40'),
(187, 88, 10000, '2021-11-22 04:41:39', 0, 0, 1, NULL, 6, 88, '2021-11-22 04:41:48'),
(188, 88, 10000, '2021-11-22 04:41:56', 0, 0, 2, 2, 3, 87, '2021-11-22 04:42:12'),
(189, 88, 10000, '2021-11-22 04:44:40', 0, 0, 1, NULL, 3, 87, '2021-11-22 04:44:45'),
(190, 88, 10000, '2021-11-22 05:47:54', 0, 0, 1, NULL, 1, 87, '2021-11-22 05:47:55'),
(191, 87, 10000, '2021-11-22 06:08:30', 0, 0, 1, NULL, 1, 87, '2021-11-22 06:08:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_estado`
--

DROP TABLE IF EXISTS `pedido_estado`;
CREATE TABLE IF NOT EXISTS `pedido_estado` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `name_estado` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `pedido_estado`
--

INSERT INTO `pedido_estado` (`id_estado`, `name_estado`, `create_at`) VALUES
(1, 'Creada', '2021-10-18 15:27:05'),
(2, 'Proceso', '2021-10-18 15:27:05'),
(3, 'Facturada', '2021-10-18 15:27:05'),
(4, 'Finalizada', '2021-10-18 15:27:05'),
(5, 'Contabilizada', '2021-10-18 15:27:05'),
(6, 'Anulada', '2021-10-31 16:37:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_est_valor`
--

DROP TABLE IF EXISTS `pedido_est_valor`;
CREATE TABLE IF NOT EXISTS `pedido_est_valor` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `name_estado` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `pedido_est_valor`
--

INSERT INTO `pedido_est_valor` (`id_estado`, `name_estado`, `create_at`) VALUES
(1, 'Credito', '2021-10-18 15:09:04'),
(2, 'Debito', '2021-10-18 15:09:04'),
(3, 'Bono', '2021-10-18 15:09:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8_spanish_ci NOT NULL,
  `valor` int(12) NOT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `image` varchar(220) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(220) COLLATE utf8_spanish_ci DEFAULT NULL,
  `producto_tipo` int(11) NOT NULL,
  `menu` tinyint(1) DEFAULT '1',
  `active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `producto_tipo` (`producto_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `name`, `valor`, `create_at`, `image`, `descripcion`, `producto_tipo`, `menu`, `active`) VALUES
(9, 'Frijolada', 5000, '2021-09-26 18:59:19', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Deliciosa frijolada con chorizo ', 1, 1, 1),
(10, 'Pollo asado', 5000, '2021-09-26 18:59:51', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Deliciosa plato con patacon ', 1, 0, 1),
(11, 'Arroz Mixto', 5000, '2021-09-26 19:00:44', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso arroz mixto con sopa', 1, 0, 1),
(12, 'Arepa con huevo', 5000, '2021-09-26 19:02:09', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso arepa con huevo', 2, 0, 1),
(13, 'calentado', 5000, '2021-09-26 19:02:33', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso calentado de frijoles', 2, 0, 1),
(14, 'empanada', 1000, '2021-09-26 19:03:41', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso empanada de carne', 2, 1, 1),
(15, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 2, 0, 1),
(16, 'cono de nucita', 1000, '2021-09-26 19:04:53', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso cono de nucita', 5, 0, 1),
(17, 'paleta tentacion', 1000, '2021-09-26 19:05:23', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso paleta tentacion', 5, 1, 1),
(18, 'paleta de agua', 1000, '2021-09-26 19:05:56', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso paleta agua', 5, 1, 1),
(19, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 3, 0, 1),
(20, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 3, 0, 1),
(21, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 3, 0, 1),
(22, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 3, 0, 1),
(23, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 3, 0, 1),
(24, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 3, 0, 1),
(25, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 4, 0, 1),
(26, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 4, 0, 1),
(27, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 4, 0, 1),
(28, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 4, 0, 1),
(29, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 4, 0, 1),
(30, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 5, 0, 1),
(31, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 5, 0, 1),
(32, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 5, 0, 1),
(33, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 2, 0, 1),
(34, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 2, 0, 1),
(35, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 2, 0, 1),
(36, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 2, 0, 1),
(37, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 2, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id_role` int(12) NOT NULL AUTO_INCREMENT,
  `role_user` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_role`, `role_user`, `create_at`) VALUES
(1, 'role_super_admin', '2021-09-14 13:26:33'),
(2, 'role_admin', '2021-09-14 13:26:33'),
(3, 'role_user', '2021-09-14 13:26:33'),
(4, 'role_enterprise', '2021-09-14 13:26:33'),
(5, 'role_caja', '2021-09-14 13:26:33'),
(6, 'role_servicio', '2021-09-14 13:26:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket`
--

DROP TABLE IF EXISTS `ticket`;
CREATE TABLE IF NOT EXISTS `ticket` (
  `id_ticket` int(11) NOT NULL AUTO_INCREMENT,
  `user_ticket` int(11) NOT NULL,
  `producto` int(11) NOT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_pedido` int(11) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_ticket`),
  KEY `producto` (`producto`),
  KEY `user_ticket` (`user_ticket`),
  KEY `id_pedido` (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=319 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ticket`
--

INSERT INTO `ticket` (`id_ticket`, `user_ticket`, `producto`, `create_at`, `id_pedido`, `estado`) VALUES
(292, 87, 13, '2021-11-22 01:51:02', 181, 1),
(293, 87, 14, '2021-11-22 01:51:02', 181, 1),
(294, 87, 14, '2021-11-22 01:51:02', 181, 1),
(295, 89, 9, '2021-11-22 01:51:55', 182, 1),
(296, 89, 9, '2021-11-22 01:51:55', 182, 1),
(297, 88, 19, '2021-11-22 01:52:11', 183, 1),
(298, 88, 20, '2021-11-22 01:52:11', 183, 1),
(299, 88, 20, '2021-11-22 01:52:11', 183, 1),
(300, 88, 20, '2021-11-22 04:38:23', 184, 1),
(301, 88, 17, '2021-11-22 04:38:23', 184, 1),
(302, 88, 16, '2021-11-22 04:38:23', 184, 1),
(303, 89, 12, '2021-11-22 04:39:59', 185, 1),
(304, 89, 12, '2021-11-22 04:39:59', 185, 1),
(305, 89, 13, '2021-11-22 04:39:59', 185, 1),
(306, 88, 25, '2021-11-22 04:40:36', 186, 1),
(307, 88, 25, '2021-11-22 04:40:36', 186, 1),
(308, 88, 25, '2021-11-22 04:40:36', 186, 1),
(309, 88, 10, '2021-11-22 04:41:40', 187, 0),
(310, 88, 10, '2021-11-22 04:41:40', 187, 0),
(311, 88, 12, '2021-11-22 04:41:56', 188, 1),
(312, 88, 12, '2021-11-22 04:41:56', 188, 1),
(313, 88, 9, '2021-11-22 04:44:40', 189, 1),
(314, 88, 9, '2021-11-22 04:44:40', 189, 1),
(315, 88, 9, '2021-11-22 05:47:55', 190, 1),
(316, 88, 9, '2021-11-22 05:47:55', 190, 1),
(317, 87, 9, '2021-11-22 06:08:30', 191, 1),
(318, 87, 9, '2021-11-22 06:08:30', 191, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_producto`
--

DROP TABLE IF EXISTS `tipo_producto`;
CREATE TABLE IF NOT EXISTS `tipo_producto` (
  `id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `name_tipo` varchar(120) COLLATE utf8_spanish_ci NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipo_producto`
--

INSERT INTO `tipo_producto` (`id_tipo`, `name_tipo`, `create_at`) VALUES
(1, 'Almuerzo', '2021-09-26 18:57:35'),
(2, 'Desayuno', '2021-09-26 18:57:35'),
(3, 'Bebidas', '2021-09-26 18:57:51'),
(4, 'Despensas', '2021-09-26 18:57:51'),
(5, 'Heladeria', '2021-09-26 18:57:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `sub` varchar(220) COLLATE utf8_spanish_ci NOT NULL,
  `name` varchar(220) COLLATE utf8_spanish_ci DEFAULT NULL,
  `picture` varchar(220) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` varchar(120) COLLATE utf8_spanish_ci DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `given_name` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `family_name` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nickname` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `locale` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `updated_at` varchar(120) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email_verified` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `role` int(11) DEFAULT '3',
  `id_empresa` int(11) DEFAULT '1',
  `contacto` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `sub` (`sub`),
  KEY `id_empresa` (`id_empresa`),
  KEY `role` (`role`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id_user`, `sub`, `name`, `picture`, `email`, `create_at`, `given_name`, `family_name`, `nickname`, `locale`, `updated_at`, `email_verified`, `role`, `id_empresa`, `contacto`) VALUES
(87, 'google-oauth2|112703936879554720334', 'Julian Guerrero', 'https://lh3.googleusercontent.com/a-/AOh14GhvDUEyiG-04sVHxOvp4dqZPiwHmokd7K40NaDAAA=s96-c', 'julgueover.05@gmail.com', '2021-10-31 22:54:36', 'Julian', 'Guerrero', 'julgueover.05', 'es', '2021-11-15T19:38:20.915Z', '1', 3, 1, NULL),
(88, 'google-oauth2|115554611911654128336', 'Andrew Cast', 'https://lh3.googleusercontent.com/a-/AOh14GjHX6L2gWJzcIUeB7-GQIxiCMs9xgHMBMUze5S3=s96-c', 'andrewcast.0707@gmail.com', '2021-11-01 00:29:28', 'Andrew', 'Cast', 'andrewcast.0707', 'es', '2021-11-21T21:40:14.827Z', '1', 3, 1, NULL),
(89, 'google-oauth2|11555554611911654128336', 'Cristiano', 'https://lh3.googleusercontent.com/a-/AOh14GjHX6L2gWJzcIUeB7-GQIxiCMs9xgHMBMUze5S3=s96-c', 'andrewcast.0707@gmail.com', '2021-11-01 00:29:28', 'Cristiano', 'Ronaldo', 'andrewcast.0707', 'es', '2021-11-07T02:18:46.484Z', '1', 3, 1, NULL);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  ADD CONSTRAINT `factura_ibfk_3` FOREIGN KEY (`estado_valor`) REFERENCES `pedido_est_valor` (`id_estado`),
  ADD CONSTRAINT `factura_ibfk_4` FOREIGN KEY (`estado_factura`) REFERENCES `pedido_estado` (`id_estado`),
  ADD CONSTRAINT `factura_ibfk_5` FOREIGN KEY (`user_update`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `factura_ibfk_6` FOREIGN KEY (`id_metodo`) REFERENCES `metodo_pago` (`id_metodo`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`estado_valor`) REFERENCES `pedido_est_valor` (`id_estado`),
  ADD CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`pedido_estado`) REFERENCES `pedido_estado` (`id_estado`),
  ADD CONSTRAINT `pedido_ibfk_4` FOREIGN KEY (`user_update`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `pedido_ibfk_5` FOREIGN KEY (`metodo_pago`) REFERENCES `metodo_pago` (`id_metodo`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`producto_tipo`) REFERENCES `tipo_producto` (`id_tipo`);

--
-- Filtros para la tabla `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`user_ticket`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`producto`) REFERENCES `producto` (`id`),
  ADD CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`);

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_3` FOREIGN KEY (`role`) REFERENCES `roles` (`id_role`),
  ADD CONSTRAINT `user_ibfk_4` FOREIGN KEY (`id_empresa`) REFERENCES `enterprise` (`id_enterprise`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
