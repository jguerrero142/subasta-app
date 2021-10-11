-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 11-10-2021 a las 02:03:34
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
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `name_enterprise` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `enterprise`
--

INSERT INTO `enterprise` (`id`, `name_enterprise`, `create_at`) VALUES
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
  `estado` tinyint(1) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `observacion` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_factura`),
  UNIQUE KEY `id_factura` (`id_factura`),
  KEY `id_user` (`id_user`),
  KEY `id_pedido` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
-- Estructura de tabla para la tabla `pedido`
--

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE IF NOT EXISTS `pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `valor` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado_ped` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id`, `id_user`, `valor`, `created_at`, `estado_ped`) VALUES
(1, 67, 10000, '2021-10-11 00:27:07', 0),
(2, 68, 10000, '2021-10-11 00:27:59', 0),
(3, 68, 10000, '2021-10-11 00:33:19', 0),
(4, 68, 10000, '2021-10-11 00:34:26', 0),
(5, 67, 10000, '2021-10-11 00:34:59', 0),
(6, 67, 15000, '2021-10-11 00:35:06', 0),
(7, 67, 7000, '2021-10-11 00:35:18', 0),
(8, 67, 23000, '2021-10-11 00:35:37', 0),
(9, 67, 20000, '2021-10-11 01:16:09', 0),
(10, 67, 10000, '2021-10-11 01:24:49', 0),
(11, 67, 15000, '2021-10-11 01:25:21', 0),
(12, 67, 10000, '2021-10-11 01:27:01', 0),
(13, 67, 10000, '2021-10-11 01:39:48', 0),
(14, 67, 15000, '2021-10-11 01:42:16', 0),
(15, 67, 10000, '2021-10-11 01:47:49', 0);

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
(18, 'paleta de agua', 1000, '2021-09-26 19:05:56', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso paleta agua', 5, 0, 1),
(19, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 2, 0, 1),
(20, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 2, 0, 1),
(21, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 2, 0, 1),
(22, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 2, 0, 1),
(23, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 2, 0, 1),
(24, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 2, 0, 1),
(25, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 2, 0, 1),
(26, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 2, 0, 1),
(27, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 2, 0, 1),
(28, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 2, 0, 1),
(29, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 2, 0, 1),
(30, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 2, 0, 1),
(31, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 2, 0, 1),
(32, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 2, 0, 1),
(33, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 2, 0, 1),
(34, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 2, 0, 1),
(35, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 2, 0, 1),
(36, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 2, 0, 1),
(37, 'bunuelo', 1000, '2021-09-26 19:03:57', 'https://depor.com/resizer/D6DbtUwCx7Pw7ZfvzO0YZGDBUhM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KI72CKUOHBF4RLJO7EBCR75SKA.jpg', 'Delicioso bunuelo', 2, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_user`
--

DROP TABLE IF EXISTS `role_user`;
CREATE TABLE IF NOT EXISTS `role_user` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `name_role` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `role_user`
--

INSERT INTO `role_user` (`id`, `name_role`, `create_at`) VALUES
(1, 'super_admin', '2021-09-14 13:26:33'),
(2, 'admin', '2021-09-14 13:26:33'),
(3, 'user', '2021-09-14 13:26:33'),
(4, 'enterprise', '2021-09-14 13:26:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket`
--

DROP TABLE IF EXISTS `ticket`;
CREATE TABLE IF NOT EXISTS `ticket` (
  `id_ticket` int(11) NOT NULL AUTO_INCREMENT,
  `user_ticket` int(11) NOT NULL,
  `producto` int(11) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_pedido` int(11) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_ticket`),
  KEY `producto` (`producto`),
  KEY `user_ticket` (`user_ticket`),
  KEY `id_pedido` (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ticket`
--

INSERT INTO `ticket` (`id_ticket`, `user_ticket`, `producto`, `create_at`, `id_pedido`, `estado`) VALUES
(215, 67, 11, '2021-10-11 00:14:55', 5, 0),
(216, 67, 10, '2021-10-11 00:14:56', 5, 0),
(217, 67, 9, '2021-10-11 00:35:03', 6, 0),
(218, 67, 10, '2021-10-11 00:35:03', 6, 0),
(219, 67, 11, '2021-10-11 00:35:04', 6, 0),
(220, 67, 9, '2021-10-11 00:35:13', 7, 0),
(221, 67, 15, '2021-10-11 00:35:16', 7, 0),
(222, 67, 14, '2021-10-11 00:35:16', 7, 0),
(223, 67, 13, '2021-10-11 00:35:24', 8, 0),
(224, 67, 20, '2021-10-11 00:35:29', 8, 0),
(225, 67, 22, '2021-10-11 00:35:31', 8, 0),
(226, 67, 24, '2021-10-11 00:35:31', 8, 0),
(227, 67, 24, '2021-10-11 00:35:32', 8, 0),
(228, 67, 24, '2021-10-11 00:35:32', 8, 0),
(229, 67, 24, '2021-10-11 00:35:32', 8, 0),
(230, 67, 24, '2021-10-11 00:35:32', 8, 0),
(231, 67, 24, '2021-10-11 00:35:32', 8, 0),
(232, 67, 24, '2021-10-11 00:35:33', 8, 0),
(233, 67, 24, '2021-10-11 00:35:33', 8, 0),
(234, 67, 24, '2021-10-11 00:35:33', 8, 0),
(235, 67, 24, '2021-10-11 00:35:33', 8, 0),
(236, 67, 24, '2021-10-11 00:35:34', 8, 0),
(237, 67, 24, '2021-10-11 00:35:34', 8, 0),
(238, 67, 22, '2021-10-11 00:35:35', 8, 0),
(239, 67, 22, '2021-10-11 00:35:35', 8, 0),
(240, 67, 22, '2021-10-11 00:35:36', 8, 0),
(241, 67, 22, '2021-10-11 00:35:36', 8, 0),
(242, 67, 10, '2021-10-11 01:16:06', 9, 0),
(243, 67, 11, '2021-10-11 01:16:07', 9, 0),
(244, 67, 10, '2021-10-11 01:16:07', 9, 0),
(245, 67, 9, '2021-10-11 01:16:08', 9, 0),
(249, 67, 9, '2021-10-11 01:24:17', 10, 0),
(250, 67, 10, '2021-10-11 01:24:18', 10, 0),
(251, 67, 11, '2021-10-11 01:25:15', 11, 0),
(252, 67, 10, '2021-10-11 01:25:17', 11, 0),
(253, 67, 10, '2021-10-11 01:25:18', 11, 0),
(255, 67, 10, '2021-10-11 01:25:22', 12, 0),
(256, 67, 9, '2021-10-11 01:25:22', 12, 0),
(265, 67, 10, '2021-10-11 01:39:45', 13, 0),
(266, 67, 9, '2021-10-11 01:39:46', 13, 0),
(270, 67, 10, '2021-10-11 01:42:12', 14, 0),
(271, 67, 9, '2021-10-11 01:42:13', 14, 0),
(272, 67, 10, '2021-10-11 01:42:14', 14, 0),
(273, 67, 10, '2021-10-11 01:47:39', 15, 0),
(274, 67, 11, '2021-10-11 01:47:40', 15, 0);

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
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `sub` (`sub`),
  KEY `id_empresa` (`id_empresa`),
  KEY `role` (`role`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id_user`, `sub`, `name`, `picture`, `email`, `create_at`, `given_name`, `family_name`, `nickname`, `locale`, `updated_at`, `email_verified`, `role`, `id_empresa`) VALUES
(67, 'google-oauth2|112703936879554720334', 'Julian Guerrero', 'https://lh3.googleusercontent.com/a-/AOh14GhvDUEyiG-04sVHxOvp4dqZPiwHmokd7K40NaDAAA=s96-c', 'julgueover.05@gmail.com', '2021-09-23 00:22:35', 'Julian', 'Guerrero', 'julgueover.05', 'es', '2021-10-10T22:18:06.880Z', '1', 3, 1),
(68, 'google-oauth2|115554611911654128336', 'Andrew Cast', 'https://lh3.googleusercontent.com/a-/AOh14GjHX6L2gWJzcIUeB7-GQIxiCMs9xgHMBMUze5S3=s96-c', 'andrewcast.0707@gmail.com', '2021-10-06 01:27:29', 'Andrew', 'Cast', 'andrewcast.0707', 'es', '2021-10-06T01:27:54.099Z', '1', 3, 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

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
  ADD CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`);

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_3` FOREIGN KEY (`role`) REFERENCES `role_user` (`id`),
  ADD CONSTRAINT `user_ibfk_4` FOREIGN KEY (`id_empresa`) REFERENCES `enterprise` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
