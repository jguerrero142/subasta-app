-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 22-05-2022 a las 23:33:04
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
-- Base de datos: `vote_bd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidatos`
--

DROP TABLE IF EXISTS `candidatos`;
CREATE TABLE IF NOT EXISTS `candidatos` (
  `id_candidato` int(11) NOT NULL AUTO_INCREMENT,
  `id_partido` int(11) NOT NULL,
  `name_candidato` varchar(55) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_candidato`),
  KEY `id_partido` (`id_partido`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `candidatos`
--

INSERT INTO `candidatos` (`id_candidato`, `id_partido`, `name_candidato`, `fecha_update`) VALUES
(1, 1, 'Batman', '2022-05-20 02:10:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partido_table`
--

DROP TABLE IF EXISTS `partido_table`;
CREATE TABLE IF NOT EXISTS `partido_table` (
  `id_partido` int(11) NOT NULL AUTO_INCREMENT,
  `name_partido` varchar(55) COLLATE utf8_spanish_ci NOT NULL,
  `tendencia` varchar(55) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_partido`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `partido_table`
--

INSERT INTO `partido_table` (`id_partido`, `name_partido`, `tendencia`, `fecha_update`) VALUES
(1, 'DC', 'Comics', '2022-05-20 02:09:01'),
(2, 'MARVEL', 'Movies', '2022-05-20 02:09:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id_role` int(11) NOT NULL AUTO_INCREMENT,
  `role` char(11) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_role`, `role`, `fecha_update`) VALUES
(1, 'user', '2022-05-20 02:04:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `table_vote`
--

DROP TABLE IF EXISTS `table_vote`;
CREATE TABLE IF NOT EXISTS `table_vote` (
  `id_table` int(11) NOT NULL AUTO_INCREMENT,
  `ubicacion_table` varchar(55) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_table`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `name_user` varchar(55) COLLATE utf8_spanish_ci NOT NULL,
  `id_role` int(11) NOT NULL,
  `fecha_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(55) COLLATE utf8_spanish_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  KEY `id_role` (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_user`, `name_user`, `id_role`, `fecha_update`, `email`, `password`) VALUES
(7, 'julian', 1, '2022-05-22 01:27:41', 'julian@lte.com', '123456'),
(8, 'julian', 1, '2022-05-22 01:34:23', 'juli@lte.com', '123456'),
(9, 'julian', 1, '2022-05-22 01:38:35', 'julisn@lte.com', '123456'),
(10, 'julian', 1, '2022-05-22 01:38:45', 'julis@lte.com', '123456'),
(11, 'julian', 1, '2022-05-22 01:55:04', 'huli@lte.com', '123456'),
(12, 'julian', 1, '2022-05-22 01:58:35', 'hui@lte.com', '123456'),
(13, 'gg', 1, '2022-05-22 01:59:49', 'gg@lte.com', '12345');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `voto`
--

DROP TABLE IF EXISTS `voto`;
CREATE TABLE IF NOT EXISTS `voto` (
  `id_voto` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `id_sufragante` int(11) NOT NULL,
  `id_candidato` int(11) NOT NULL,
  `id_mesa` int(11) NOT NULL,
  `fecha_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_voto`),
  KEY `id_sufragante` (`id_sufragante`,`id_candidato`),
  KEY `id_candidato` (`id_candidato`),
  KEY `id_mesa` (`id_mesa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `candidatos`
--
ALTER TABLE `candidatos`
  ADD CONSTRAINT `candidatos_ibfk_1` FOREIGN KEY (`id_partido`) REFERENCES `partido_table` (`id_partido`);

--
-- Filtros para la tabla `table_vote`
--
ALTER TABLE `table_vote`
  ADD CONSTRAINT `table_vote_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `usuarios` (`id_user`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id_role`);

--
-- Filtros para la tabla `voto`
--
ALTER TABLE `voto`
  ADD CONSTRAINT `voto_ibfk_1` FOREIGN KEY (`id_candidato`) REFERENCES `candidatos` (`id_candidato`),
  ADD CONSTRAINT `voto_ibfk_2` FOREIGN KEY (`id_sufragante`) REFERENCES `usuarios` (`id_user`),
  ADD CONSTRAINT `voto_ibfk_3` FOREIGN KEY (`id_mesa`) REFERENCES `table_vote` (`id_table`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
