-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 18-01-2022 a las 06:17:51
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
  `estado_factura` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id_factura`, `id_user`, `id_pedido`, `valor`, `id_metodo`, `estado_valor`, `estado_factura`, `user_update`, `create_at`, `update_at`, `observacion`, `estado`) VALUES
(201, 87, 277, 10000, NULL, 1, 4, 87, '2022-01-18 03:24:38', '2022-01-18 05:10:26', NULL, 1),
(202, 87, 278, 10000, NULL, 1, 4, 87, '2022-01-18 03:24:39', '2022-01-18 05:10:26', NULL, 1),
(203, 87, 282, 4500, 3, 2, 4, 87, '2022-01-18 03:24:47', '2022-01-18 05:10:26', NULL, 1),
(204, 87, 279, 10000, 2, 2, 4, 87, '2022-01-18 03:24:49', '2022-01-18 05:10:26', NULL, 1),
(205, 87, 283, 10000, 1, 2, 4, 87, '2022-01-18 05:00:05', '2022-01-18 05:10:26', NULL, 1),
(206, 87, 284, 4500, 1, 2, 4, 87, '2022-01-18 06:11:13', '2022-01-18 06:11:26', NULL, 1),
(207, 87, 285, 13000, 1, 2, 4, 87, '2022-01-18 06:14:53', '2022-01-18 06:15:10', NULL, 1),
(208, 87, 286, 3600, 1, 2, 4, 87, '2022-01-18 06:16:31', '2022-01-18 06:16:42', NULL, 1);

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
-- Estructura de tabla para la tabla `inventario`
--

DROP TABLE IF EXISTS `inventario`;
CREATE TABLE IF NOT EXISTS `inventario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(15) NOT NULL,
  `detalle` varchar(120) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cantidad` int(15) DEFAULT NULL,
  `valor_unit` int(15) DEFAULT NULL,
  `valor_total` int(15) DEFAULT NULL,
  `user_update` int(15) NOT NULL,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_producto` (`id_producto`,`user_update`),
  KEY `user_update` (`user_update`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id`, `id_producto`, `detalle`, `cantidad`, `valor_unit`, `valor_total`, `user_update`, `update_date`) VALUES
(13, 39, 'VENTA CAJA', 4, 5000, 20000, 87, '2022-01-18 05:10:26'),
(14, 40, 'VENTA CAJA', 2, 5000, 10000, 87, '2022-01-18 05:10:26'),
(15, 42, 'VENTA CAJA', 1, 5000, 5000, 87, '2022-01-18 05:10:26'),
(16, 43, 'VENTA CAJA', 2, 5000, 10000, 87, '2022-01-18 05:10:26'),
(17, 49, 'VENTA CAJA', 3, 1500, 4500, 87, '2022-01-18 05:10:26'),
(18, 51, 'VENTA CAJA', 1, 1500, 1500, 87, '2022-01-18 05:10:26'),
(19, 50, 'VENTA CAJA', 1, 1000, 1000, 87, '2022-01-18 05:10:26'),
(20, 56, 'VENTA CAJA', 1, 1000, 1000, 87, '2022-01-18 05:10:26'),
(21, 57, 'VENTA CAJA', 1, 1000, 1000, 87, '2022-01-18 05:10:27'),
(22, 49, 'SALDO INICIAL', 20, 1500, 30000, 87, '2022-01-18 05:10:26'),
(37, 39, 'VENTA CAJA', 4, NULL, NULL, 87, '2022-01-18 06:11:26'),
(38, 42, 'VENTA CAJA', 1, NULL, NULL, 87, '2022-01-18 06:11:26'),
(39, 40, 'VENTA CAJA', 2, NULL, NULL, 87, '2022-01-18 06:11:26'),
(40, 43, 'VENTA CAJA', 2, NULL, NULL, 87, '2022-01-18 06:11:26'),
(41, 51, 'VENTA CAJA', 1, NULL, NULL, 87, '2022-01-18 06:11:26'),
(42, 56, 'VENTA CAJA', 1, NULL, NULL, 87, '2022-01-18 06:11:26'),
(43, 57, 'VENTA CAJA', 1, NULL, NULL, 87, '2022-01-18 06:11:26'),
(44, 50, 'VENTA CAJA', 1, NULL, NULL, 87, '2022-01-18 06:11:26'),
(45, 49, 'VENTA CAJA', 6, NULL, NULL, 87, '2022-01-18 06:11:26'),
(46, 39, 'VENTA CAJA', 6, 5000, 30000, 87, '2022-01-18 06:15:10'),
(47, 42, 'VENTA CAJA', 1, 5000, 5000, 87, '2022-01-18 06:15:10'),
(48, 43, 'VENTA CAJA', 2, 5000, 10000, 87, '2022-01-18 06:15:10'),
(49, 40, 'VENTA CAJA', 2, 5000, 10000, 87, '2022-01-18 06:15:10'),
(50, 49, 'VENTA CAJA', 8, 1500, 12000, 87, '2022-01-18 06:15:10'),
(51, 51, 'VENTA CAJA', 1, 1500, 1500, 87, '2022-01-18 06:15:10'),
(52, 50, 'VENTA CAJA', 1, 1000, 1000, 87, '2022-01-18 06:15:10'),
(53, 56, 'VENTA CAJA', 1, 1000, 1000, 87, '2022-01-18 06:15:10'),
(54, 57, 'VENTA CAJA', 1, 1000, 1000, 87, '2022-01-18 06:15:10'),
(55, 39, 'VENTA CAJA', 6, 5000, 30000, 87, '2022-01-18 06:16:42'),
(56, 40, 'VENTA CAJA', 2, 5000, 10000, 87, '2022-01-18 06:16:42'),
(57, 42, 'VENTA CAJA', 1, 5000, 5000, 87, '2022-01-18 06:16:42'),
(58, 43, 'VENTA CAJA', 2, 5000, 10000, 87, '2022-01-18 06:16:42'),
(59, 49, 'VENTA CAJA', 8, 1500, 12000, 87, '2022-01-18 06:16:42'),
(60, 50, 'VENTA CAJA', 1, 1000, 1000, 87, '2022-01-18 06:16:42'),
(61, 51, 'VENTA CAJA', 1, 1500, 1500, 87, '2022-01-18 06:16:42'),
(62, 52, 'VENTA CAJA', 3, 1200, 3600, 87, '2022-01-18 06:16:42'),
(63, 56, 'VENTA CAJA', 1, 1000, 1000, 87, '2022-01-18 06:16:42'),
(64, 57, 'VENTA CAJA', 1, 1000, 1000, 87, '2022-01-18 06:16:42');

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
) ENGINE=InnoDB AUTO_INCREMENT=287 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `id_user`, `valor`, `created_at`, `value_pedido`, `servicio`, `estado_valor`, `metodo_pago`, `pedido_estado`, `user_update`, `update_at`) VALUES
(277, 87, 10000, '2022-01-18 02:21:44', 0, 0, 1, 2, 6, 87, '2022-01-18 05:10:26'),
(278, 88, 10000, '2022-01-18 02:41:26', 0, 0, 1, NULL, 6, 87, '2022-01-18 05:10:26'),
(279, 88, 10000, '2022-01-18 02:41:30', 0, 1, 2, 2, 6, 87, '2022-01-18 05:10:26'),
(280, 89, 4500, '2022-01-18 02:41:37', 0, 0, 2, 1, 6, 87, '2022-01-18 05:10:26'),
(281, 89, 15000, '2022-01-18 02:41:43', 0, 0, 2, 1, 6, 87, '2022-01-18 05:10:26'),
(282, 89, 4500, '2022-01-18 02:41:48', 0, 0, 2, 3, 6, 87, '2022-01-18 05:10:26'),
(283, 87, 10000, '2022-01-18 05:00:05', 0, 0, 2, 1, 6, 87, '2022-01-18 05:06:26'),
(284, 87, 4500, '2022-01-18 06:11:13', 0, 0, 2, 1, 4, 87, '2022-01-18 06:11:26'),
(285, 87, 13000, '2022-01-18 06:14:53', 0, 0, 2, 1, 4, 87, '2022-01-18 06:15:10'),
(286, 87, 3600, '2022-01-18 06:16:31', 0, 0, 2, 1, 4, 87, '2022-01-18 06:16:42');

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
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `name`, `valor`, `create_at`, `image`, `descripcion`, `producto_tipo`, `menu`, `active`) VALUES
(38, 'Pescado', 5000, '2021-09-26 19:00:44', 'https://pescado.site/wp-content/uploads/2021/06/filete-de-pescado-frito-con-arroz-y-ensalada.jpg', 'Delicioso bocachico con sopa', 1, 0, 1),
(39, 'Frijolada', 5000, '2021-09-26 18:59:19', 'https://caldoparao.com/wp-content/uploads/2020/06/MG_1162.frijolada-jpg.jpg', 'Deliciosa frijolada con chorizo ', 1, 1, 1),
(40, 'Pollo asado', 5000, '2021-09-26 18:59:51', 'https://thumbs.dreamstime.com/b/almuerzo-con-el-pollo-asado-la-parrilla-filete-60175333.jpg', 'Deliciosa pollo asado', 1, 0, 1),
(41, 'Arroz Mixto', 5000, '2021-09-26 19:00:44', 'https://i2.wp.com/decoriente.co/wp-content/uploads/2017/12/ARROZ-MIXTO.jpg?resize=600%2C600', 'Delicioso arroz mixto con sopa', 1, 0, 1),
(42, 'Arepa con huevo', 5000, '2021-09-26 19:02:09', 'https://arepas.top/wp-content/uploads/2018/11/arepa-de-huevo.jpg', 'Delicioso arepa con huevo', 2, 0, 1),
(43, 'calentado', 5000, '2021-09-26 19:02:33', 'http://farm8.staticflickr.com/7336/9763700186_33927c3934_c.jpg', 'Delicioso calentado de frijoles', 2, 0, 1),
(44, 'empanada', 1000, '2021-09-26 19:03:41', 'https://4.bp.blogspot.com/-C-PxcAwhHXo/WlWDzAmHB7I/AAAAAAAAG8k/hblgAA_HrIIYW_VPzVNuXb7ZjFnxKpduwCLcBGAs/s1600/como-hacer-empanadas-venezolanas.jpg', 'Delicioso empanada de carne', 2, 1, 1),
(45, 'bunuelos', 1000, '2021-09-26 19:03:57', 'https://www.gourmet.com.co/wp-content/uploads/2021/02/bun%CC%83uelos.jpg', 'Delicioso bunuelo', 2, 0, 1),
(46, 'cono de nucita', 1000, '2021-09-26 19:04:53', 'https://www.valesupermercado.com/wp-content/uploads/2020/04/003_min.jpg', 'Delicioso cono de nucita', 5, 0, 1),
(47, 'paleta tentacion', 1000, '2021-09-26 19:05:23', 'https://www.valesupermercado.com/wp-content/uploads/2020/04/002_min.jpg', 'Delicioso paleta tentacion', 5, 1, 1),
(48, 'paleta de agua', 1000, '2021-09-26 19:05:56', 'https://www.deliciosi.com/images/2700/2715/paletas-de-helados.jpg', 'Delicioso paleta agua', 5, 1, 1),
(49, 'gaseosa', 1500, '2021-09-26 19:03:57', 'https://cdni.rt.com/actualidad/public_images/2016.02/article/r/1104/90/jpeg/56afe82bc46188be6a8b4606.jpg', 'Refrescante bebida', 3, 0, 1),
(50, 'vive 100', 1000, '2021-09-26 19:03:57', 'https://jumbocolombiafood.vteximg.com.br/arquivos/ids/155810-1000-1000/7702354929503-1.jpg?v=636066426090630000', 'Refrescante bebida', 3, 0, 1),
(51, 'pony malta', 1500, '2021-09-26 19:03:57', 'https://www.merkofacil.com/wp-content/uploads/2020/07/Pony-malta-x330.jpg', 'Refrescante bebida', 3, 0, 1),
(52, 'speed max', 1200, '2021-09-26 19:03:57', 'https://jumbocolombiafood.vteximg.com.br/arquivos/ids/171638-1000-1000/7702090039214-20-281-29.jpg?v=636111275378930000', 'Refrescante bebida', 3, 0, 1),
(53, 'heinneken', 1800, '2021-09-26 19:03:57', 'https://puntacamaron.com.co/165/cerveza-heineken.jpg', 'Refrescante bebida', 3, 0, 1),
(54, 'agua en botella', 1000, '2021-09-26 19:03:57', 'https://minesur.com.ar/wp-content/uploads/2019/04/producto-botella-1.5litros.jpg', 'Refrescante bebida', 3, 0, 1),
(55, 'Cheese Tris', 1200, '2021-09-26 19:03:57', 'https://larebajavirtual.com/images/productos/sii/F/300x300/cheese_tris-61369-1627486874.png', 'Delicioso Cheese Tris', 4, 0, 1),
(56, 'Jumbo Mix', 1000, '2021-09-26 19:03:57', 'https://cdn.shopify.com/s/files/1/0492/2458/1274/products/supermercados_la_vaquita_supervaquita_chocolatina_jumbo_mix_60g_dulceria_700x700.jpg?v=1626786355', 'Delicioso chocolatina', 4, 0, 1),
(57, 'Boliqueso', 1000, '2021-09-26 19:03:57', 'https://jumbocolombiafood.vteximg.com.br/arquivos/ids/3706942-1000-1000/7702189045577.jpg?v=637517720947330000', 'Delicioso Boliqueso', 4, 0, 1),
(58, 'Bom bom bum', 400, '2021-09-26 19:03:57', 'https://static.wixstatic.com/media/9ae4c7_d08328dfd3624e74bca981bfbfaeec9a~mv2.jpeg/v1/fill/w_980,h_332,al_c,q_85,usm_0.66_1.00_0.01/9ae4c7_d08328dfd3624e74bca981bfbfaeec9a~mv2.jpeg', 'Delicioso Bom bom bum', 4, 0, 1),
(59, 'Detodito', 2000, '2021-09-26 19:03:57', 'https://www.eurosupermercados.com.co/media/catalog/product/cache/5db2c2cd17d64c361c13f6f6460f1cf1/7/7/7702189055040.jpg', 'Delicioso Detodito', 4, 0, 1),
(60, 'vasito vainilla', 1000, '2021-09-26 19:03:57', 'https://www.heladoslafresita.com.co/wp-content/uploads/2018/04/vasito-vainilla-800x560_c.jpg', 'Delicioso vasito vainilla', 5, 0, 1),
(61, 'fruly mora', 1000, '2021-09-26 19:03:57', 'https://www.valesupermercado.com/wp-content/uploads/2020/04/85.jpg', 'Delicioso fruly mora', 5, 0, 1),
(62, 'cono tres leches', 1000, '2021-09-26 19:03:57', 'https://www.valesupermercado.com/wp-content/uploads/2020/04/013_min.jpg', 'cono tres leches', 5, 0, 1),
(63, 'pan queso', 1000, '2021-09-26 19:03:57', 'https://d1kxxrc2vqy8oa.cloudfront.net/wp-content/uploads/2019/02/24212941/RFB-1502-5-pandequeso.jpg', 'Delicioso pan queso', 2, 0, 1),
(64, 'papa aborrajada', 1000, '2021-09-26 19:03:57', 'https://guiagastronomica.co/wp-content/uploads/Papa-aborrajada.jpg', 'Delicioso bunuelo', 2, 0, 1),
(65, 'Pescado', 5000, '2021-09-26 19:00:44', 'https://pescado.site/wp-content/uploads/2021/06/filete-de-pescado-frito-con-arroz-y-ensalada.jpg', 'Delicioso bocachico con sopa', 1, 0, 1);

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
  `producto_tipo` int(11) NOT NULL,
  `estado` tinyint(1) DEFAULT '1',
  `inventario` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_ticket`),
  KEY `producto` (`producto`),
  KEY `user_ticket` (`user_ticket`),
  KEY `id_pedido` (`id_pedido`),
  KEY `producto_tipo` (`producto_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=536 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ticket`
--

INSERT INTO `ticket` (`id_ticket`, `user_ticket`, `producto`, `create_at`, `id_pedido`, `producto_tipo`, `estado`, `inventario`) VALUES
(508, 87, 39, '2022-01-18 02:21:44', 277, 1, 1, 0),
(509, 87, 39, '2022-01-18 02:21:44', 277, 1, 1, 0),
(510, 87, 39, '2022-01-18 02:41:26', 278, 1, 1, 0),
(511, 87, 39, '2022-01-18 02:41:26', 278, 1, 1, 0),
(512, 87, 40, '2022-01-18 02:41:30', 279, 1, 1, 0),
(513, 87, 40, '2022-01-18 02:41:30', 279, 1, 1, 0),
(514, 87, 57, '2022-01-18 02:41:37', 280, 4, 1, 0),
(515, 87, 50, '2022-01-18 02:41:37', 280, 3, 1, 0),
(516, 87, 51, '2022-01-18 02:41:37', 280, 3, 1, 0),
(517, 87, 56, '2022-01-18 02:41:37', 280, 4, 1, 0),
(518, 87, 43, '2022-01-18 02:41:43', 281, 2, 1, 0),
(519, 87, 42, '2022-01-18 02:41:43', 281, 2, 1, 0),
(520, 87, 43, '2022-01-18 02:41:43', 281, 2, 1, 0),
(521, 87, 49, '2022-01-18 02:41:48', 282, 3, 1, 0),
(522, 87, 49, '2022-01-18 02:41:48', 282, 3, 1, 0),
(523, 87, 49, '2022-01-18 02:41:48', 282, 3, 1, 0),
(524, 87, 38, '2022-01-18 05:00:05', 283, 1, 0, 0),
(525, 87, 38, '2022-01-18 05:00:05', 283, 1, 0, 0),
(526, 87, 49, '2022-01-18 06:11:13', 284, 3, 1, 0),
(527, 87, 49, '2022-01-18 06:11:13', 284, 3, 1, 0),
(528, 87, 49, '2022-01-18 06:11:13', 284, 3, 1, 0),
(529, 87, 39, '2022-01-18 06:14:53', 285, 1, 1, 0),
(530, 87, 39, '2022-01-18 06:14:53', 285, 1, 1, 0),
(531, 87, 49, '2022-01-18 06:14:53', 285, 3, 1, 0),
(532, 87, 49, '2022-01-18 06:14:53', 285, 3, 1, 0),
(533, 87, 52, '2022-01-18 06:16:31', 286, 3, 1, 0),
(534, 87, 52, '2022-01-18 06:16:31', 286, 3, 1, 0),
(535, 87, 52, '2022-01-18 06:16:31', 286, 3, 1, 0);

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
(4, 'Mecato', '2021-09-26 18:57:51'),
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
(87, 'google-oauth2|112703936879554720334', 'Julian Guerrero', 'https://lh3.googleusercontent.com/a-/AOh14GhvDUEyiG-04sVHxOvp4dqZPiwHmokd7K40NaDAAA=s96-c', 'julgueover.05@gmail.com', '2021-10-31 22:54:36', 'Julian', 'Guerrero', 'julgueover.05', 'es', '2022-01-14T19:11:18.595Z', '1', 5, 1, NULL),
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
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`user_update`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `inventario_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`);

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
  ADD CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  ADD CONSTRAINT `ticket_ibfk_4` FOREIGN KEY (`producto_tipo`) REFERENCES `tipo_producto` (`id_tipo`);

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
