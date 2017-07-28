-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-07-2017 a las 00:01:21
-- Versión del servidor: 10.1.25-MariaDB
-- Versión de PHP: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `audit`
--

CREATE TABLE `audit` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `page` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip` varchar(255) NOT NULL,
  `viewed` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `audit`
--

INSERT INTO `audit` (`id`, `user`, `page`, `timestamp`, `ip`, `viewed`) VALUES
(1, 1, '42', '2017-02-20 17:31:13', '::1', 0),
(2, 0, '12', '2017-07-18 14:29:45', '::1', 0),
(3, 0, '12', '2017-07-18 14:29:49', '::1', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones`
--

CREATE TABLE `calificaciones` (
  `id_calificacion` int(11) NOT NULL,
  `id_duenio` int(11) NOT NULL,
  `id_colaborador` int(11) NOT NULL,
  `calificacion` varchar(50) NOT NULL,
  `mensaje` varchar(255) DEFAULT NULL,
  `respuesta` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `calificaciones`
--

INSERT INTO `calificaciones` (`id_calificacion`, `id_duenio`, `id_colaborador`, `calificacion`, `mensaje`, `respuesta`) VALUES
(1, 4, 5, 'neutral', 'sss', NULL),
(2, 4, 5, 'positivo', '', NULL),
(3, 4, 5, 'positivo', '', NULL),
(4, 4, 5, 'positivo', 'Muy bueno', NULL),
(5, 4, 5, 'positivo', 'Muy bueno', NULL),
(6, 4, 5, 'positivo', 'Muy bueno', NULL),
(7, 4, 5, 'positivo', 'asd', NULL),
(8, 5, 1, 'positivo', '', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre`) VALUES
(8, 'Entretenimientos'),
(3, 'Familiar'),
(7, 'Gastronomicos'),
(1, 'Servicios Domesticos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id_comentario` int(6) NOT NULL,
  `fecha` datetime NOT NULL,
  `id_gauchada` int(6) NOT NULL,
  `id_user` int(6) NOT NULL,
  `cuerpo` varchar(255) NOT NULL,
  `cuerpo_respuesta` varchar(255) NOT NULL,
  `fecha_respuesta` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id_comentario`, `fecha`, `id_gauchada`, `id_user`, `cuerpo`, `cuerpo_respuesta`, `fecha_respuesta`) VALUES
(1, '2017-06-29 19:28:17', 14, 1, 'Cuando es el partido?', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `email`
--

CREATE TABLE `email` (
  `id` int(11) NOT NULL,
  `website_name` varchar(100) NOT NULL,
  `smtp_server` varchar(100) NOT NULL,
  `smtp_port` int(10) NOT NULL,
  `email_login` varchar(150) NOT NULL,
  `email_pass` varchar(100) NOT NULL,
  `from_name` varchar(100) NOT NULL,
  `from_email` varchar(150) NOT NULL,
  `transport` varchar(255) NOT NULL,
  `verify_url` varchar(255) NOT NULL,
  `email_act` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `email`
--

INSERT INTO `email` (`id`, `website_name`, `smtp_server`, `smtp_port`, `email_login`, `email_pass`, `from_name`, `from_email`, `transport`, `verify_url`, `email_act`) VALUES
(1, 'unaGauchada', '1and1.com', 587, 'unaGauchadaMailService@gmail.com', 'unaGauchada123456', 'unaGauchada', 'unaGauchadaMailService@gmail.com', 'tls', 'http://localhost/u2/', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gauchada`
--

CREATE TABLE `gauchada` (
  `id_gauchada` int(6) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `fecha_desde` date DEFAULT NULL,
  `fecha_hasta` date DEFAULT NULL,
  `fecha_exacta` date DEFAULT NULL,
  `id_usuario` int(6) NOT NULL,
  `provincia` varchar(80) NOT NULL,
  `localidad` varchar(80) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `imagen` varchar(200) DEFAULT NULL,
  `id_elegido` int(11) DEFAULT NULL,
  `completada` tinyint(127) NOT NULL DEFAULT '0',
  `estado` varchar(20) NOT NULL DEFAULT 'activa'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `gauchada`
--

INSERT INTO `gauchada` (`id_gauchada`, `titulo`, `descripcion`, `fecha_desde`, `fecha_hasta`, `fecha_exacta`, `id_usuario`, `provincia`, `localidad`, `categoria`, `imagen`, `id_elegido`, `completada`, `estado`) VALUES
(14, 'Un delantero para un futbol 5', 'Necesito de alguien que quiera jugar un fÃºtbol 5 y que juegue de delantero, porque el actual delantero estÃ¡ por jubilarse. \r\nNecesariamente que haya jugado varios partidos y que sepa atajar (Por si el arquero se aburre).\r\nSaludos.', '2017-06-29', '2017-08-28', '0000-00-00', 5, 'Buenos Aires', '3 de febrero', 'Entretenimiento', '470039.jpg', 4, 1, 'activa'),
(15, 'Obrero para mi casa  ', '  Se necesita un obrero que trabaje gratis en mi casa. Necesito terminar el paredÃ³n de afuera, pintar el techo y revocar la pared del sÃ³tano. Debe cumplir el horario perfectamente y no tolero faltas.  ', '2017-06-29', '2017-08-28', '0000-00-00', 5, 'Buenos Aires  ', 'A. Alsina', 'Familiar  ', 'obrero.jpg', 4, 1, 'activa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `stripe_ts` varchar(255) NOT NULL,
  `stripe_tp` varchar(255) NOT NULL,
  `stripe_ls` varchar(255) NOT NULL,
  `stripe_lp` varchar(255) NOT NULL,
  `recap_pub` varchar(100) NOT NULL,
  `recap_pri` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidades`
--

CREATE TABLE `localidades` (
  `id_localidad` int(11) NOT NULL,
  `id_provincia` int(11) NOT NULL,
  `localidad` varchar(255) NOT NULL,
  `provincia` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `localidades`
--

INSERT INTO `localidades` (`id_localidad`, `id_provincia`, `localidad`, `provincia`) VALUES
(1, 1, '25 de Mayo', 'Buenos Aires'),
(2, 1, '3 de febrero', 'Buenos Aires'),
(3, 1, 'A. Alsina', 'Buenos Aires'),
(4, 1, 'A. Gonzáles Cháves', 'Buenos Aires'),
(5, 1, 'Aguas Verdes', 'Buenos Aires'),
(6, 1, 'Alberti', 'Buenos Aires'),
(7, 1, 'Arrecifes', 'Buenos Aires'),
(8, 1, 'Ayacucho', 'Buenos Aires'),
(9, 1, 'Azul', 'Buenos Aires'),
(10, 1, 'Bahía Blanca', 'Buenos Aires'),
(11, 1, 'Balcarce', 'Buenos Aires'),
(12, 1, 'Baradero', 'Buenos Aires'),
(13, 1, 'Benito Juárez', 'Buenos Aires'),
(14, 1, 'Berisso', 'Buenos Aires'),
(15, 1, 'Bolívar', 'Buenos Aires'),
(16, 1, 'Bragado', 'Buenos Aires'),
(17, 1, 'Brandsen', 'Buenos Aires'),
(18, 1, 'Campana', 'Buenos Aires'),
(19, 1, 'Cañuelas', 'Buenos Aires'),
(20, 1, 'Capilla del Señor', 'Buenos Aires'),
(21, 1, 'Capitán Sarmiento', 'Buenos Aires'),
(22, 1, 'Carapachay', 'Buenos Aires'),
(23, 1, 'Carhue', 'Buenos Aires'),
(24, 1, 'Cariló', 'Buenos Aires'),
(25, 1, 'Carlos Casares', 'Buenos Aires'),
(26, 1, 'Carlos Tejedor', 'Buenos Aires'),
(27, 1, 'Carmen de Areco', 'Buenos Aires'),
(28, 1, 'Carmen de Patagones', 'Buenos Aires'),
(29, 1, 'Castelli', 'Buenos Aires'),
(30, 1, 'Chacabuco', 'Buenos Aires'),
(31, 1, 'Chascomús', 'Buenos Aires'),
(32, 1, 'Chivilcoy', 'Buenos Aires'),
(33, 1, 'Colón', 'Buenos Aires'),
(34, 1, 'Coronel Dorrego', 'Buenos Aires'),
(35, 1, 'Coronel Pringles', 'Buenos Aires'),
(36, 1, 'Coronel Rosales', 'Buenos Aires'),
(37, 1, 'Coronel Suarez', 'Buenos Aires'),
(38, 1, 'Costa Azul', 'Buenos Aires'),
(39, 1, 'Costa Chica', 'Buenos Aires'),
(40, 1, 'Costa del Este', 'Buenos Aires'),
(41, 1, 'Costa Esmeralda', 'Buenos Aires'),
(42, 1, 'Daireaux', 'Buenos Aires'),
(43, 1, 'Darregueira', 'Buenos Aires'),
(44, 1, 'Del Viso', 'Buenos Aires'),
(45, 1, 'Dolores', 'Buenos Aires'),
(46, 1, 'Don Torcuato', 'Buenos Aires'),
(47, 1, 'Ensenada', 'Buenos Aires'),
(48, 1, 'Escobar', 'Buenos Aires'),
(49, 1, 'Exaltación de la Cruz', 'Buenos Aires'),
(50, 1, 'Florentino Ameghino', 'Buenos Aires'),
(51, 1, 'Garín', 'Buenos Aires'),
(52, 1, 'Gral. Alvarado', 'Buenos Aires'),
(53, 1, 'Gral. Alvear', 'Buenos Aires'),
(54, 1, 'Gral. Arenales', 'Buenos Aires'),
(55, 1, 'Gral. Belgrano', 'Buenos Aires'),
(56, 1, 'Gral. Guido', 'Buenos Aires'),
(57, 1, 'Gral. Lamadrid', 'Buenos Aires'),
(58, 1, 'Gral. Las Heras', 'Buenos Aires'),
(59, 1, 'Gral. Lavalle', 'Buenos Aires'),
(60, 1, 'Gral. Madariaga', 'Buenos Aires'),
(61, 1, 'Gral. Pacheco', 'Buenos Aires'),
(62, 1, 'Gral. Paz', 'Buenos Aires'),
(63, 1, 'Gral. Pinto', 'Buenos Aires'),
(64, 1, 'Gral. Pueyrredón', 'Buenos Aires'),
(65, 1, 'Gral. Rodríguez', 'Buenos Aires'),
(66, 1, 'Gral. Viamonte', 'Buenos Aires'),
(67, 1, 'Gral. Villegas', 'Buenos Aires'),
(68, 1, 'Guaminí', 'Buenos Aires'),
(69, 1, 'Guernica', 'Buenos Aires'),
(70, 1, 'Hipólito Yrigoyen', 'Buenos Aires'),
(71, 1, 'Ing. Maschwitz', 'Buenos Aires'),
(72, 1, 'Junín', 'Buenos Aires'),
(73, 1, 'La Plata', 'Buenos Aires'),
(74, 1, 'Laprida', 'Buenos Aires'),
(75, 1, 'Las Flores', 'Buenos Aires'),
(76, 1, 'Las Toninas', 'Buenos Aires'),
(77, 1, 'Leandro N. Alem', 'Buenos Aires'),
(78, 1, 'Lincoln', 'Buenos Aires'),
(79, 1, 'Loberia', 'Buenos Aires'),
(80, 1, 'Lobos', 'Buenos Aires'),
(81, 1, 'Los Cardales', 'Buenos Aires'),
(82, 1, 'Los Toldos', 'Buenos Aires'),
(83, 1, 'Lucila del Mar', 'Buenos Aires'),
(84, 1, 'Luján', 'Buenos Aires'),
(85, 1, 'Magdalena', 'Buenos Aires'),
(86, 1, 'Maipú', 'Buenos Aires'),
(87, 1, 'Mar Chiquita', 'Buenos Aires'),
(88, 1, 'Mar de Ajó', 'Buenos Aires'),
(89, 1, 'Mar de las Pampas', 'Buenos Aires'),
(90, 1, 'Mar del Plata', 'Buenos Aires'),
(91, 1, 'Mar del Tuyú', 'Buenos Aires'),
(92, 1, 'Marcos Paz', 'Buenos Aires'),
(93, 1, 'Mercedes', 'Buenos Aires'),
(94, 1, 'Miramar', 'Buenos Aires'),
(95, 1, 'Monte', 'Buenos Aires'),
(96, 1, 'Monte Hermoso', 'Buenos Aires'),
(97, 1, 'Munro', 'Buenos Aires'),
(98, 1, 'Navarro', 'Buenos Aires'),
(99, 1, 'Necochea', 'Buenos Aires'),
(100, 1, 'Olavarría', 'Buenos Aires'),
(101, 1, 'Partido de la Costa', 'Buenos Aires'),
(102, 1, 'Pehuajó', 'Buenos Aires'),
(103, 1, 'Pellegrini', 'Buenos Aires'),
(104, 1, 'Pergamino', 'Buenos Aires'),
(105, 1, 'Pigüé', 'Buenos Aires'),
(106, 1, 'Pila', 'Buenos Aires'),
(107, 1, 'Pilar', 'Buenos Aires'),
(108, 1, 'Pinamar', 'Buenos Aires'),
(109, 1, 'Pinar del Sol', 'Buenos Aires'),
(110, 1, 'Polvorines', 'Buenos Aires'),
(111, 1, 'Pte. Perón', 'Buenos Aires'),
(112, 1, 'Puán', 'Buenos Aires'),
(113, 1, 'Punta Indio', 'Buenos Aires'),
(114, 1, 'Ramallo', 'Buenos Aires'),
(115, 1, 'Rauch', 'Buenos Aires'),
(116, 1, 'Rivadavia', 'Buenos Aires'),
(117, 1, 'Rojas', 'Buenos Aires'),
(118, 1, 'Roque Pérez', 'Buenos Aires'),
(119, 1, 'Saavedra', 'Buenos Aires'),
(120, 1, 'Saladillo', 'Buenos Aires'),
(121, 1, 'Salliqueló', 'Buenos Aires'),
(122, 1, 'Salto', 'Buenos Aires'),
(123, 1, 'San Andrés de Giles', 'Buenos Aires'),
(124, 1, 'San Antonio de Areco', 'Buenos Aires'),
(125, 1, 'San Antonio de Padua', 'Buenos Aires'),
(126, 1, 'San Bernardo', 'Buenos Aires'),
(127, 1, 'San Cayetano', 'Buenos Aires'),
(128, 1, 'San Clemente del Tuyú', 'Buenos Aires'),
(129, 1, 'San Nicolás', 'Buenos Aires'),
(130, 1, 'San Pedro', 'Buenos Aires'),
(131, 1, 'San Vicente', 'Buenos Aires'),
(132, 1, 'Santa Teresita', 'Buenos Aires'),
(133, 1, 'Suipacha', 'Buenos Aires'),
(134, 1, 'Tandil', 'Buenos Aires'),
(135, 1, 'Tapalqué', 'Buenos Aires'),
(136, 1, 'Tordillo', 'Buenos Aires'),
(137, 1, 'Tornquist', 'Buenos Aires'),
(138, 1, 'Trenque Lauquen', 'Buenos Aires'),
(139, 1, 'Tres Lomas', 'Buenos Aires'),
(140, 1, 'Villa Gesell', 'Buenos Aires'),
(141, 1, 'Villarino', 'Buenos Aires'),
(142, 1, 'Zárate', 'Buenos Aires'),
(143, 2, '11 de Septiembre', 'Buenos Aires-GBA'),
(144, 2, '20 de Junio', 'Buenos Aires-GBA'),
(145, 2, '25 de Mayo', 'Buenos Aires-GBA'),
(146, 2, 'Acassuso', 'Buenos Aires-GBA'),
(147, 2, 'Adrogué', 'Buenos Aires-GBA'),
(148, 2, 'Aldo Bonzi', 'Buenos Aires-GBA'),
(149, 2, 'Área Reserva Cinturón Ecológico', 'Buenos Aires-GBA'),
(150, 2, 'Avellaneda', 'Buenos Aires-GBA'),
(151, 2, 'Banfield', 'Buenos Aires-GBA'),
(152, 2, 'Barrio Parque', 'Buenos Aires-GBA'),
(153, 2, 'Barrio Santa Teresita', 'Buenos Aires-GBA'),
(154, 2, 'Beccar', 'Buenos Aires-GBA'),
(155, 2, 'Bella Vista', 'Buenos Aires-GBA'),
(156, 2, 'Berazategui', 'Buenos Aires-GBA'),
(157, 2, 'Bernal Este', 'Buenos Aires-GBA'),
(158, 2, 'Bernal Oeste', 'Buenos Aires-GBA'),
(159, 2, 'Billinghurst', 'Buenos Aires-GBA'),
(160, 2, 'Boulogne', 'Buenos Aires-GBA'),
(161, 2, 'Burzaco', 'Buenos Aires-GBA'),
(162, 2, 'Carapachay', 'Buenos Aires-GBA'),
(163, 2, 'Caseros', 'Buenos Aires-GBA'),
(164, 2, 'Castelar', 'Buenos Aires-GBA'),
(165, 2, 'Churruca', 'Buenos Aires-GBA'),
(166, 2, 'Ciudad Evita', 'Buenos Aires-GBA'),
(167, 2, 'Ciudad Madero', 'Buenos Aires-GBA'),
(168, 2, 'Ciudadela', 'Buenos Aires-GBA'),
(169, 2, 'Claypole', 'Buenos Aires-GBA'),
(170, 2, 'Crucecita', 'Buenos Aires-GBA'),
(171, 2, 'Dock Sud', 'Buenos Aires-GBA'),
(172, 2, 'Don Bosco', 'Buenos Aires-GBA'),
(173, 2, 'Don Orione', 'Buenos Aires-GBA'),
(174, 2, 'El Jagüel', 'Buenos Aires-GBA'),
(175, 2, 'El Libertador', 'Buenos Aires-GBA'),
(176, 2, 'El Palomar', 'Buenos Aires-GBA'),
(177, 2, 'El Tala', 'Buenos Aires-GBA'),
(178, 2, 'El Trébol', 'Buenos Aires-GBA'),
(179, 2, 'Ezeiza', 'Buenos Aires-GBA'),
(180, 2, 'Ezpeleta', 'Buenos Aires-GBA'),
(181, 2, 'Florencio Varela', 'Buenos Aires-GBA'),
(182, 2, 'Florida', 'Buenos Aires-GBA'),
(183, 2, 'Francisco Álvarez', 'Buenos Aires-GBA'),
(184, 2, 'Gerli', 'Buenos Aires-GBA'),
(185, 2, 'Glew', 'Buenos Aires-GBA'),
(186, 2, 'González Catán', 'Buenos Aires-GBA'),
(187, 2, 'Gral. Lamadrid', 'Buenos Aires-GBA'),
(188, 2, 'Grand Bourg', 'Buenos Aires-GBA'),
(189, 2, 'Gregorio de Laferrere', 'Buenos Aires-GBA'),
(190, 2, 'Guillermo Enrique Hudson', 'Buenos Aires-GBA'),
(191, 2, 'Haedo', 'Buenos Aires-GBA'),
(192, 2, 'Hurlingham', 'Buenos Aires-GBA'),
(193, 2, 'Ing. Sourdeaux', 'Buenos Aires-GBA'),
(194, 2, 'Isidro Casanova', 'Buenos Aires-GBA'),
(195, 2, 'Ituzaingó', 'Buenos Aires-GBA'),
(196, 2, 'José C. Paz', 'Buenos Aires-GBA'),
(197, 2, 'José Ingenieros', 'Buenos Aires-GBA'),
(198, 2, 'José Marmol', 'Buenos Aires-GBA'),
(199, 2, 'La Lucila', 'Buenos Aires-GBA'),
(200, 2, 'La Reja', 'Buenos Aires-GBA'),
(201, 2, 'La Tablada', 'Buenos Aires-GBA'),
(202, 2, 'Lanús', 'Buenos Aires-GBA'),
(203, 2, 'Llavallol', 'Buenos Aires-GBA'),
(204, 2, 'Loma Hermosa', 'Buenos Aires-GBA'),
(205, 2, 'Lomas de Zamora', 'Buenos Aires-GBA'),
(206, 2, 'Lomas del Millón', 'Buenos Aires-GBA'),
(207, 2, 'Lomas del Mirador', 'Buenos Aires-GBA'),
(208, 2, 'Longchamps', 'Buenos Aires-GBA'),
(209, 2, 'Los Polvorines', 'Buenos Aires-GBA'),
(210, 2, 'Luis Guillón', 'Buenos Aires-GBA'),
(211, 2, 'Malvinas Argentinas', 'Buenos Aires-GBA'),
(212, 2, 'Martín Coronado', 'Buenos Aires-GBA'),
(213, 2, 'Martínez', 'Buenos Aires-GBA'),
(214, 2, 'Merlo', 'Buenos Aires-GBA'),
(215, 2, 'Ministro Rivadavia', 'Buenos Aires-GBA'),
(216, 2, 'Monte Chingolo', 'Buenos Aires-GBA'),
(217, 2, 'Monte Grande', 'Buenos Aires-GBA'),
(218, 2, 'Moreno', 'Buenos Aires-GBA'),
(219, 2, 'Morón', 'Buenos Aires-GBA'),
(220, 2, 'Muñiz', 'Buenos Aires-GBA'),
(221, 2, 'Olivos', 'Buenos Aires-GBA'),
(222, 2, 'Pablo Nogués', 'Buenos Aires-GBA'),
(223, 2, 'Pablo Podestá', 'Buenos Aires-GBA'),
(224, 2, 'Paso del Rey', 'Buenos Aires-GBA'),
(225, 2, 'Pereyra', 'Buenos Aires-GBA'),
(226, 2, 'Piñeiro', 'Buenos Aires-GBA'),
(227, 2, 'Plátanos', 'Buenos Aires-GBA'),
(228, 2, 'Pontevedra', 'Buenos Aires-GBA'),
(229, 2, 'Quilmes', 'Buenos Aires-GBA'),
(230, 2, 'Rafael Calzada', 'Buenos Aires-GBA'),
(231, 2, 'Rafael Castillo', 'Buenos Aires-GBA'),
(232, 2, 'Ramos Mejía', 'Buenos Aires-GBA'),
(233, 2, 'Ranelagh', 'Buenos Aires-GBA'),
(234, 2, 'Remedios de Escalada', 'Buenos Aires-GBA'),
(235, 2, 'Sáenz Peña', 'Buenos Aires-GBA'),
(236, 2, 'San Antonio de Padua', 'Buenos Aires-GBA'),
(237, 2, 'San Fernando', 'Buenos Aires-GBA'),
(238, 2, 'San Francisco Solano', 'Buenos Aires-GBA'),
(239, 2, 'San Isidro', 'Buenos Aires-GBA'),
(240, 2, 'San José', 'Buenos Aires-GBA'),
(241, 2, 'San Justo', 'Buenos Aires-GBA'),
(242, 2, 'San Martín', 'Buenos Aires-GBA'),
(243, 2, 'San Miguel', 'Buenos Aires-GBA'),
(244, 2, 'Santos Lugares', 'Buenos Aires-GBA'),
(245, 2, 'Sarandí', 'Buenos Aires-GBA'),
(246, 2, 'Sourigues', 'Buenos Aires-GBA'),
(247, 2, 'Tapiales', 'Buenos Aires-GBA'),
(248, 2, 'Temperley', 'Buenos Aires-GBA'),
(249, 2, 'Tigre', 'Buenos Aires-GBA'),
(250, 2, 'Tortuguitas', 'Buenos Aires-GBA'),
(251, 2, 'Tristán Suárez', 'Buenos Aires-GBA'),
(252, 2, 'Trujui', 'Buenos Aires-GBA'),
(253, 2, 'Turdera', 'Buenos Aires-GBA'),
(254, 2, 'Valentín Alsina', 'Buenos Aires-GBA'),
(255, 2, 'Vicente López', 'Buenos Aires-GBA'),
(256, 2, 'Villa Adelina', 'Buenos Aires-GBA'),
(257, 2, 'Villa Ballester', 'Buenos Aires-GBA'),
(258, 2, 'Villa Bosch', 'Buenos Aires-GBA'),
(259, 2, 'Villa Caraza', 'Buenos Aires-GBA'),
(260, 2, 'Villa Celina', 'Buenos Aires-GBA'),
(261, 2, 'Villa Centenario', 'Buenos Aires-GBA'),
(262, 2, 'Villa de Mayo', 'Buenos Aires-GBA'),
(263, 2, 'Villa Diamante', 'Buenos Aires-GBA'),
(264, 2, 'Villa Domínico', 'Buenos Aires-GBA'),
(265, 2, 'Villa España', 'Buenos Aires-GBA'),
(266, 2, 'Villa Fiorito', 'Buenos Aires-GBA'),
(267, 2, 'Villa Guillermina', 'Buenos Aires-GBA'),
(268, 2, 'Villa Insuperable', 'Buenos Aires-GBA'),
(269, 2, 'Villa José León Suárez', 'Buenos Aires-GBA'),
(270, 2, 'Villa La Florida', 'Buenos Aires-GBA'),
(271, 2, 'Villa Luzuriaga', 'Buenos Aires-GBA'),
(272, 2, 'Villa Martelli', 'Buenos Aires-GBA'),
(273, 2, 'Villa Obrera', 'Buenos Aires-GBA'),
(274, 2, 'Villa Progreso', 'Buenos Aires-GBA'),
(275, 2, 'Villa Raffo', 'Buenos Aires-GBA'),
(276, 2, 'Villa Sarmiento', 'Buenos Aires-GBA'),
(277, 2, 'Villa Tesei', 'Buenos Aires-GBA'),
(278, 2, 'Villa Udaondo', 'Buenos Aires-GBA'),
(279, 2, 'Virrey del Pino', 'Buenos Aires-GBA'),
(280, 2, 'Wilde', 'Buenos Aires-GBA'),
(281, 2, 'William Morris', 'Buenos Aires-GBA'),
(282, 3, 'Agronomía', 'Capital Federal'),
(283, 3, 'Almagro', 'Capital Federal'),
(284, 3, 'Balvanera', 'Capital Federal'),
(285, 3, 'Barracas', 'Capital Federal'),
(286, 3, 'Belgrano', 'Capital Federal'),
(287, 3, 'Boca', 'Capital Federal'),
(288, 3, 'Boedo', 'Capital Federal'),
(289, 3, 'Caballito', 'Capital Federal'),
(290, 3, 'Chacarita', 'Capital Federal'),
(291, 3, 'Coghlan', 'Capital Federal'),
(292, 3, 'Colegiales', 'Capital Federal'),
(293, 3, 'Constitución', 'Capital Federal'),
(294, 3, 'Flores', 'Capital Federal'),
(295, 3, 'Floresta', 'Capital Federal'),
(296, 3, 'La Paternal', 'Capital Federal'),
(297, 3, 'Liniers', 'Capital Federal'),
(298, 3, 'Mataderos', 'Capital Federal'),
(299, 3, 'Monserrat', 'Capital Federal'),
(300, 3, 'Monte Castro', 'Capital Federal'),
(301, 3, 'Nueva Pompeya', 'Capital Federal'),
(302, 3, 'Núñez', 'Capital Federal'),
(303, 3, 'Palermo', 'Capital Federal'),
(304, 3, 'Parque Avellaneda', 'Capital Federal'),
(305, 3, 'Parque Chacabuco', 'Capital Federal'),
(306, 3, 'Parque Chas', 'Capital Federal'),
(307, 3, 'Parque Patricios', 'Capital Federal'),
(308, 3, 'Puerto Madero', 'Capital Federal'),
(309, 3, 'Recoleta', 'Capital Federal'),
(310, 3, 'Retiro', 'Capital Federal'),
(311, 3, 'Saavedra', 'Capital Federal'),
(312, 3, 'San Cristóbal', 'Capital Federal'),
(313, 3, 'San Nicolás', 'Capital Federal'),
(314, 3, 'San Telmo', 'Capital Federal'),
(315, 3, 'Vélez Sársfield', 'Capital Federal'),
(316, 3, 'Versalles', 'Capital Federal'),
(317, 3, 'Villa Crespo', 'Capital Federal'),
(318, 3, 'Villa del Parque', 'Capital Federal'),
(319, 3, 'Villa Devoto', 'Capital Federal'),
(320, 3, 'Villa Gral. Mitre', 'Capital Federal'),
(321, 3, 'Villa Lugano', 'Capital Federal'),
(322, 3, 'Villa Luro', 'Capital Federal'),
(323, 3, 'Villa Ortúzar', 'Capital Federal'),
(324, 3, 'Villa Pueyrredón', 'Capital Federal'),
(325, 3, 'Villa Real', 'Capital Federal'),
(326, 3, 'Villa Riachuelo', 'Capital Federal'),
(327, 3, 'Villa Santa Rita', 'Capital Federal'),
(328, 3, 'Villa Soldati', 'Capital Federal'),
(329, 3, 'Villa Urquiza', 'Capital Federal'),
(330, 4, 'Aconquija', 'Catamarca'),
(331, 4, 'Ancasti', 'Catamarca'),
(332, 4, 'Andalgalá', 'Catamarca'),
(333, 4, 'Antofagasta', 'Catamarca'),
(334, 4, 'Belén', 'Catamarca'),
(335, 4, 'Capayán', 'Catamarca'),
(336, 4, 'Capital', 'Catamarca'),
(337, 4, '4', 'Catamarca'),
(338, 4, 'Corral Quemado', 'Catamarca'),
(339, 4, 'El Alto', 'Catamarca'),
(340, 4, 'El Rodeo', 'Catamarca'),
(341, 4, 'F.Mamerto Esquiú', 'Catamarca'),
(342, 4, 'Fiambalá', 'Catamarca'),
(343, 4, 'Hualfín', 'Catamarca'),
(344, 4, 'Huillapima', 'Catamarca'),
(345, 4, 'Icaño', 'Catamarca'),
(346, 4, 'La Puerta', 'Catamarca'),
(347, 4, 'Las Juntas', 'Catamarca'),
(348, 4, 'Londres', 'Catamarca'),
(349, 4, 'Los Altos', 'Catamarca'),
(350, 4, 'Los Varela', 'Catamarca'),
(351, 4, 'Mutquín', 'Catamarca'),
(352, 4, 'Paclín', 'Catamarca'),
(353, 4, 'Poman', 'Catamarca'),
(354, 4, 'Pozo de La Piedra', 'Catamarca'),
(355, 4, 'Puerta de Corral', 'Catamarca'),
(356, 4, 'Puerta San José', 'Catamarca'),
(357, 4, 'Recreo', 'Catamarca'),
(358, 4, 'S.F.V de 4', 'Catamarca'),
(359, 4, 'San Fernando', 'Catamarca'),
(360, 4, 'San Fernando del Valle', 'Catamarca'),
(361, 4, 'San José', 'Catamarca'),
(362, 4, 'Santa María', 'Catamarca'),
(363, 4, 'Santa Rosa', 'Catamarca'),
(364, 4, 'Saujil', 'Catamarca'),
(365, 4, 'Tapso', 'Catamarca'),
(366, 4, 'Tinogasta', 'Catamarca'),
(367, 4, 'Valle Viejo', 'Catamarca'),
(368, 4, 'Villa Vil', 'Catamarca'),
(369, 5, 'Aviá Teraí', 'Chaco'),
(370, 5, 'Barranqueras', 'Chaco'),
(371, 5, 'Basail', 'Chaco'),
(372, 5, 'Campo Largo', 'Chaco'),
(373, 5, 'Capital', 'Chaco'),
(374, 5, 'Capitán Solari', 'Chaco'),
(375, 5, 'Charadai', 'Chaco'),
(376, 5, 'Charata', 'Chaco'),
(377, 5, 'Chorotis', 'Chaco'),
(378, 5, 'Ciervo Petiso', 'Chaco'),
(379, 5, 'Cnel. Du Graty', 'Chaco'),
(380, 5, 'Col. Benítez', 'Chaco'),
(381, 5, 'Col. Elisa', 'Chaco'),
(382, 5, 'Col. Popular', 'Chaco'),
(383, 5, 'Colonias Unidas', 'Chaco'),
(384, 5, 'Concepción', 'Chaco'),
(385, 5, 'Corzuela', 'Chaco'),
(386, 5, 'Cote Lai', 'Chaco'),
(387, 5, 'El Sauzalito', 'Chaco'),
(388, 5, 'Enrique Urien', 'Chaco'),
(389, 5, 'Fontana', 'Chaco'),
(390, 5, 'Fte. Esperanza', 'Chaco'),
(391, 5, 'Gancedo', 'Chaco'),
(392, 5, 'Gral. Capdevila', 'Chaco'),
(393, 5, 'Gral. Pinero', 'Chaco'),
(394, 5, 'Gral. San Martín', 'Chaco'),
(395, 5, 'Gral. Vedia', 'Chaco'),
(396, 5, 'Hermoso Campo', 'Chaco'),
(397, 5, 'I. del Cerrito', 'Chaco'),
(398, 5, 'J.J. Castelli', 'Chaco'),
(399, 5, 'La Clotilde', 'Chaco'),
(400, 5, 'La Eduvigis', 'Chaco'),
(401, 5, 'La Escondida', 'Chaco'),
(402, 5, 'La Leonesa', 'Chaco'),
(403, 5, 'La Tigra', 'Chaco'),
(404, 5, 'La Verde', 'Chaco'),
(405, 5, 'Laguna Blanca', 'Chaco'),
(406, 5, 'Laguna Limpia', 'Chaco'),
(407, 5, 'Lapachito', 'Chaco'),
(408, 5, 'Las Breñas', 'Chaco'),
(409, 5, 'Las Garcitas', 'Chaco'),
(410, 5, 'Las Palmas', 'Chaco'),
(411, 5, 'Los Frentones', 'Chaco'),
(412, 5, 'Machagai', 'Chaco'),
(413, 5, 'Makallé', 'Chaco'),
(414, 5, 'Margarita Belén', 'Chaco'),
(415, 5, 'Miraflores', 'Chaco'),
(416, 5, 'Misión N. Pompeya', 'Chaco'),
(417, 5, 'Napenay', 'Chaco'),
(418, 5, 'Pampa Almirón', 'Chaco'),
(419, 5, 'Pampa del Indio', 'Chaco'),
(420, 5, 'Pampa del Infierno', 'Chaco'),
(421, 5, 'Pdcia. de La Plaza', 'Chaco'),
(422, 5, 'Pdcia. Roca', 'Chaco'),
(423, 5, 'Pdcia. Roque Sáenz Peña', 'Chaco'),
(424, 5, 'Pto. Bermejo', 'Chaco'),
(425, 5, 'Pto. Eva Perón', 'Chaco'),
(426, 5, 'Puero Tirol', 'Chaco'),
(427, 5, 'Puerto Vilelas', 'Chaco'),
(428, 5, 'Quitilipi', 'Chaco'),
(429, 5, 'Resistencia', 'Chaco'),
(430, 5, 'Sáenz Peña', 'Chaco'),
(431, 5, 'Samuhú', 'Chaco'),
(432, 5, 'San Bernardo', 'Chaco'),
(433, 5, 'Santa Sylvina', 'Chaco'),
(434, 5, 'Taco Pozo', 'Chaco'),
(435, 5, 'Tres Isletas', 'Chaco'),
(436, 5, 'Villa Ángela', 'Chaco'),
(437, 5, 'Villa Berthet', 'Chaco'),
(438, 5, 'Villa R. Bermejito', 'Chaco'),
(439, 6, 'Aldea Apeleg', 'Chubut'),
(440, 6, 'Aldea Beleiro', 'Chubut'),
(441, 6, 'Aldea Epulef', 'Chubut'),
(442, 6, 'Alto Río Sengerr', 'Chubut'),
(443, 6, 'Buen Pasto', 'Chubut'),
(444, 6, 'Camarones', 'Chubut'),
(445, 6, 'Carrenleufú', 'Chubut'),
(446, 6, 'Cholila', 'Chubut'),
(447, 6, 'Co. Centinela', 'Chubut'),
(448, 6, 'Colan Conhué', 'Chubut'),
(449, 6, 'Comodoro Rivadavia', 'Chubut'),
(450, 6, 'Corcovado', 'Chubut'),
(451, 6, 'Cushamen', 'Chubut'),
(452, 6, 'Dique F. Ameghino', 'Chubut'),
(453, 6, 'Dolavón', 'Chubut'),
(454, 6, 'Dr. R. Rojas', 'Chubut'),
(455, 6, 'El Hoyo', 'Chubut'),
(456, 6, 'El Maitén', 'Chubut'),
(457, 6, 'Epuyén', 'Chubut'),
(458, 6, 'Esquel', 'Chubut'),
(459, 6, 'Facundo', 'Chubut'),
(460, 6, 'Gaimán', 'Chubut'),
(461, 6, 'Gan Gan', 'Chubut'),
(462, 6, 'Gastre', 'Chubut'),
(463, 6, 'Gdor. Costa', 'Chubut'),
(464, 6, 'Gualjaina', 'Chubut'),
(465, 6, 'J. de San Martín', 'Chubut'),
(466, 6, 'Lago Blanco', 'Chubut'),
(467, 6, 'Lago Puelo', 'Chubut'),
(468, 6, 'Lagunita Salada', 'Chubut'),
(469, 6, 'Las Plumas', 'Chubut'),
(470, 6, 'Los Altares', 'Chubut'),
(471, 6, 'Paso de los Indios', 'Chubut'),
(472, 6, 'Paso del Sapo', 'Chubut'),
(473, 6, 'Pto. Madryn', 'Chubut'),
(474, 6, 'Pto. Pirámides', 'Chubut'),
(475, 6, 'Rada Tilly', 'Chubut'),
(476, 6, 'Rawson', 'Chubut'),
(477, 6, 'Río Mayo', 'Chubut'),
(478, 6, 'Río Pico', 'Chubut'),
(479, 6, 'Sarmiento', 'Chubut'),
(480, 6, 'Tecka', 'Chubut'),
(481, 6, 'Telsen', 'Chubut'),
(482, 6, 'Trelew', 'Chubut'),
(483, 6, 'Trevelin', 'Chubut'),
(484, 6, 'Veintiocho de Julio', 'Chubut'),
(485, 7, 'Achiras', 'Cordoba'),
(486, 7, 'Adelia Maria', 'Cordoba'),
(487, 7, 'Agua de Oro', 'Cordoba'),
(488, 7, 'Alcira Gigena', 'Cordoba'),
(489, 7, 'Aldea Santa Maria', 'Cordoba'),
(490, 7, 'Alejandro Roca', 'Cordoba'),
(491, 7, 'Alejo Ledesma', 'Cordoba'),
(492, 7, 'Alicia', 'Cordoba'),
(493, 7, 'Almafuerte', 'Cordoba'),
(494, 7, 'Alpa Corral', 'Cordoba'),
(495, 7, 'Alta Gracia', 'Cordoba'),
(496, 7, 'Alto Alegre', 'Cordoba'),
(497, 7, 'Alto de Los Quebrachos', 'Cordoba'),
(498, 7, 'Altos de Chipion', 'Cordoba'),
(499, 7, 'Amboy', 'Cordoba'),
(500, 7, 'Ambul', 'Cordoba'),
(501, 7, 'Ana Zumaran', 'Cordoba'),
(502, 7, 'Anisacate', 'Cordoba'),
(503, 7, 'Arguello', 'Cordoba'),
(504, 7, 'Arias', 'Cordoba'),
(505, 7, 'Arroyito', 'Cordoba'),
(506, 7, 'Arroyo Algodon', 'Cordoba'),
(507, 7, 'Arroyo Cabral', 'Cordoba'),
(508, 7, 'Arroyo Los Patos', 'Cordoba'),
(509, 7, 'Assunta', 'Cordoba'),
(510, 7, 'Atahona', 'Cordoba'),
(511, 7, 'Ausonia', 'Cordoba'),
(512, 7, 'Avellaneda', 'Cordoba'),
(513, 7, 'Ballesteros', 'Cordoba'),
(514, 7, 'Ballesteros Sud', 'Cordoba'),
(515, 7, 'Balnearia', 'Cordoba'),
(516, 7, 'Bañado de Soto', 'Cordoba'),
(517, 7, 'Bell Ville', 'Cordoba'),
(518, 7, 'Bengolea', 'Cordoba'),
(519, 7, 'Benjamin Gould', 'Cordoba'),
(520, 7, 'Berrotaran', 'Cordoba'),
(521, 7, 'Bialet Masse', 'Cordoba'),
(522, 7, 'Bouwer', 'Cordoba'),
(523, 7, 'Brinkmann', 'Cordoba'),
(524, 7, 'Buchardo', 'Cordoba'),
(525, 7, 'Bulnes', 'Cordoba'),
(526, 7, 'Cabalango', 'Cordoba'),
(527, 7, 'Calamuchita', 'Cordoba'),
(528, 7, 'Calchin', 'Cordoba'),
(529, 7, 'Calchin Oeste', 'Cordoba'),
(530, 7, 'Calmayo', 'Cordoba'),
(531, 7, 'Camilo Aldao', 'Cordoba'),
(532, 7, 'Caminiaga', 'Cordoba'),
(533, 7, 'Cañada de Luque', 'Cordoba'),
(534, 7, 'Cañada de Machado', 'Cordoba'),
(535, 7, 'Cañada de Rio Pinto', 'Cordoba'),
(536, 7, 'Cañada del Sauce', 'Cordoba'),
(537, 7, 'Canals', 'Cordoba'),
(538, 7, 'Candelaria Sud', 'Cordoba'),
(539, 7, 'Capilla de Remedios', 'Cordoba'),
(540, 7, 'Capilla de Siton', 'Cordoba'),
(541, 7, 'Capilla del Carmen', 'Cordoba'),
(542, 7, 'Capilla del Monte', 'Cordoba'),
(543, 7, 'Capital', 'Cordoba'),
(544, 7, 'Capitan Gral B. O´Higgins', 'Cordoba'),
(545, 7, 'Carnerillo', 'Cordoba'),
(546, 7, 'Carrilobo', 'Cordoba'),
(547, 7, 'Casa Grande', 'Cordoba'),
(548, 7, 'Cavanagh', 'Cordoba'),
(549, 7, 'Cerro Colorado', 'Cordoba'),
(550, 7, 'Chaján', 'Cordoba'),
(551, 7, 'Chalacea', 'Cordoba'),
(552, 7, 'Chañar Viejo', 'Cordoba'),
(553, 7, 'Chancaní', 'Cordoba'),
(554, 7, 'Charbonier', 'Cordoba'),
(555, 7, 'Charras', 'Cordoba'),
(556, 7, 'Chazón', 'Cordoba'),
(557, 7, 'Chilibroste', 'Cordoba'),
(558, 7, 'Chucul', 'Cordoba'),
(559, 7, 'Chuña', 'Cordoba'),
(560, 7, 'Chuña Huasi', 'Cordoba'),
(561, 7, 'Churqui Cañada', 'Cordoba'),
(562, 7, 'Cienaga Del Coro', 'Cordoba'),
(563, 7, 'Cintra', 'Cordoba'),
(564, 7, 'Col. Almada', 'Cordoba'),
(565, 7, 'Col. Anita', 'Cordoba'),
(566, 7, 'Col. Barge', 'Cordoba'),
(567, 7, 'Col. Bismark', 'Cordoba'),
(568, 7, 'Col. Bremen', 'Cordoba'),
(569, 7, 'Col. Caroya', 'Cordoba'),
(570, 7, 'Col. Italiana', 'Cordoba'),
(571, 7, 'Col. Iturraspe', 'Cordoba'),
(572, 7, 'Col. Las Cuatro Esquinas', 'Cordoba'),
(573, 7, 'Col. Las Pichanas', 'Cordoba'),
(574, 7, 'Col. Marina', 'Cordoba'),
(575, 7, 'Col. Prosperidad', 'Cordoba'),
(576, 7, 'Col. San Bartolome', 'Cordoba'),
(577, 7, 'Col. San Pedro', 'Cordoba'),
(578, 7, 'Col. Tirolesa', 'Cordoba'),
(579, 7, 'Col. Vicente Aguero', 'Cordoba'),
(580, 7, 'Col. Videla', 'Cordoba'),
(581, 7, 'Col. Vignaud', 'Cordoba'),
(582, 7, 'Col. Waltelina', 'Cordoba'),
(583, 7, 'Colazo', 'Cordoba'),
(584, 7, 'Comechingones', 'Cordoba'),
(585, 7, 'Conlara', 'Cordoba'),
(586, 7, 'Copacabana', 'Cordoba'),
(587, 7, '7', 'Cordoba'),
(588, 7, 'Coronel Baigorria', 'Cordoba'),
(589, 7, 'Coronel Moldes', 'Cordoba'),
(590, 7, 'Corral de Bustos', 'Cordoba'),
(591, 7, 'Corralito', 'Cordoba'),
(592, 7, 'Cosquín', 'Cordoba'),
(593, 7, 'Costa Sacate', 'Cordoba'),
(594, 7, 'Cruz Alta', 'Cordoba'),
(595, 7, 'Cruz de Caña', 'Cordoba'),
(596, 7, 'Cruz del Eje', 'Cordoba'),
(597, 7, 'Cuesta Blanca', 'Cordoba'),
(598, 7, 'Dean Funes', 'Cordoba'),
(599, 7, 'Del Campillo', 'Cordoba'),
(600, 7, 'Despeñaderos', 'Cordoba'),
(601, 7, 'Devoto', 'Cordoba'),
(602, 7, 'Diego de Rojas', 'Cordoba'),
(603, 7, 'Dique Chico', 'Cordoba'),
(604, 7, 'El Arañado', 'Cordoba'),
(605, 7, 'El Brete', 'Cordoba'),
(606, 7, 'El Chacho', 'Cordoba'),
(607, 7, 'El Crispín', 'Cordoba'),
(608, 7, 'El Fortín', 'Cordoba'),
(609, 7, 'El Manzano', 'Cordoba'),
(610, 7, 'El Rastreador', 'Cordoba'),
(611, 7, 'El Rodeo', 'Cordoba'),
(612, 7, 'El Tío', 'Cordoba'),
(613, 7, 'Elena', 'Cordoba'),
(614, 7, 'Embalse', 'Cordoba'),
(615, 7, 'Esquina', 'Cordoba'),
(616, 7, 'Estación Gral. Paz', 'Cordoba'),
(617, 7, 'Estación Juárez Celman', 'Cordoba'),
(618, 7, 'Estancia de Guadalupe', 'Cordoba'),
(619, 7, 'Estancia Vieja', 'Cordoba'),
(620, 7, 'Etruria', 'Cordoba'),
(621, 7, 'Eufrasio Loza', 'Cordoba'),
(622, 7, 'Falda del Carmen', 'Cordoba'),
(623, 7, 'Freyre', 'Cordoba'),
(624, 7, 'Gral. Baldissera', 'Cordoba'),
(625, 7, 'Gral. Cabrera', 'Cordoba'),
(626, 7, 'Gral. Deheza', 'Cordoba'),
(627, 7, 'Gral. Fotheringham', 'Cordoba'),
(628, 7, 'Gral. Levalle', 'Cordoba'),
(629, 7, 'Gral. Roca', 'Cordoba'),
(630, 7, 'Guanaco Muerto', 'Cordoba'),
(631, 7, 'Guasapampa', 'Cordoba'),
(632, 7, 'Guatimozin', 'Cordoba'),
(633, 7, 'Gutenberg', 'Cordoba'),
(634, 7, 'Hernando', 'Cordoba'),
(635, 7, 'Huanchillas', 'Cordoba'),
(636, 7, 'Huerta Grande', 'Cordoba'),
(637, 7, 'Huinca Renanco', 'Cordoba'),
(638, 7, 'Idiazabal', 'Cordoba'),
(639, 7, 'Impira', 'Cordoba'),
(640, 7, 'Inriville', 'Cordoba'),
(641, 7, 'Isla Verde', 'Cordoba'),
(642, 7, 'Italó', 'Cordoba'),
(643, 7, 'James Craik', 'Cordoba'),
(644, 7, 'Jesús María', 'Cordoba'),
(645, 7, 'Jovita', 'Cordoba'),
(646, 7, 'Justiniano Posse', 'Cordoba'),
(647, 7, 'Km 658', 'Cordoba'),
(648, 7, 'L. V. Mansilla', 'Cordoba'),
(649, 7, 'La Batea', 'Cordoba'),
(650, 7, 'La Calera', 'Cordoba'),
(651, 7, 'La Carlota', 'Cordoba'),
(652, 7, 'La Carolina', 'Cordoba'),
(653, 7, 'La Cautiva', 'Cordoba'),
(654, 7, 'La Cesira', 'Cordoba'),
(655, 7, 'La Cruz', 'Cordoba'),
(656, 7, 'La Cumbre', 'Cordoba'),
(657, 7, 'La Cumbrecita', 'Cordoba'),
(658, 7, 'La Falda', 'Cordoba'),
(659, 7, 'La Francia', 'Cordoba'),
(660, 7, 'La Granja', 'Cordoba'),
(661, 7, 'La Higuera', 'Cordoba'),
(662, 7, 'La Laguna', 'Cordoba'),
(663, 7, 'La Paisanita', 'Cordoba'),
(664, 7, 'La Palestina', 'Cordoba'),
(665, 7, '12', 'Cordoba'),
(666, 7, 'La Paquita', 'Cordoba'),
(667, 7, 'La Para', 'Cordoba'),
(668, 7, 'La Paz', 'Cordoba'),
(669, 7, 'La Playa', 'Cordoba'),
(670, 7, 'La Playosa', 'Cordoba'),
(671, 7, 'La Población', 'Cordoba'),
(672, 7, 'La Posta', 'Cordoba'),
(673, 7, 'La Puerta', 'Cordoba'),
(674, 7, 'La Quinta', 'Cordoba'),
(675, 7, 'La Rancherita', 'Cordoba'),
(676, 7, 'La Rinconada', 'Cordoba'),
(677, 7, 'La Serranita', 'Cordoba'),
(678, 7, 'La Tordilla', 'Cordoba'),
(679, 7, 'Laborde', 'Cordoba'),
(680, 7, 'Laboulaye', 'Cordoba'),
(681, 7, 'Laguna Larga', 'Cordoba'),
(682, 7, 'Las Acequias', 'Cordoba'),
(683, 7, 'Las Albahacas', 'Cordoba'),
(684, 7, 'Las Arrias', 'Cordoba'),
(685, 7, 'Las Bajadas', 'Cordoba'),
(686, 7, 'Las Caleras', 'Cordoba'),
(687, 7, 'Las Calles', 'Cordoba'),
(688, 7, 'Las Cañadas', 'Cordoba'),
(689, 7, 'Las Gramillas', 'Cordoba'),
(690, 7, 'Las Higueras', 'Cordoba'),
(691, 7, 'Las Isletillas', 'Cordoba'),
(692, 7, 'Las Junturas', 'Cordoba'),
(693, 7, 'Las Palmas', 'Cordoba'),
(694, 7, 'Las Peñas', 'Cordoba'),
(695, 7, 'Las Peñas Sud', 'Cordoba'),
(696, 7, 'Las Perdices', 'Cordoba'),
(697, 7, 'Las Playas', 'Cordoba'),
(698, 7, 'Las Rabonas', 'Cordoba'),
(699, 7, 'Las Saladas', 'Cordoba'),
(700, 7, 'Las Tapias', 'Cordoba'),
(701, 7, 'Las Varas', 'Cordoba'),
(702, 7, 'Las Varillas', 'Cordoba'),
(703, 7, 'Las Vertientes', 'Cordoba'),
(704, 7, 'Leguizamón', 'Cordoba'),
(705, 7, 'Leones', 'Cordoba'),
(706, 7, 'Los Cedros', 'Cordoba'),
(707, 7, 'Los Cerrillos', 'Cordoba'),
(708, 7, 'Los Chañaritos (C.E)', 'Cordoba'),
(709, 7, 'Los Chanaritos (R.S)', 'Cordoba'),
(710, 7, 'Los Cisnes', 'Cordoba'),
(711, 7, 'Los Cocos', 'Cordoba'),
(712, 7, 'Los Cóndores', 'Cordoba'),
(713, 7, 'Los Hornillos', 'Cordoba'),
(714, 7, 'Los Hoyos', 'Cordoba'),
(715, 7, 'Los Mistoles', 'Cordoba'),
(716, 7, 'Los Molinos', 'Cordoba'),
(717, 7, 'Los Pozos', 'Cordoba'),
(718, 7, 'Los Reartes', 'Cordoba'),
(719, 7, 'Los Surgentes', 'Cordoba'),
(720, 7, 'Los Talares', 'Cordoba'),
(721, 7, 'Los Zorros', 'Cordoba'),
(722, 7, 'Lozada', 'Cordoba'),
(723, 7, 'Luca', 'Cordoba'),
(724, 7, 'Luque', 'Cordoba'),
(725, 7, 'Luyaba', 'Cordoba'),
(726, 7, 'Malagueño', 'Cordoba'),
(727, 7, 'Malena', 'Cordoba'),
(728, 7, 'Malvinas Argentinas', 'Cordoba'),
(729, 7, 'Manfredi', 'Cordoba'),
(730, 7, 'Maquinista Gallini', 'Cordoba'),
(731, 7, 'Marcos Juárez', 'Cordoba'),
(732, 7, 'Marull', 'Cordoba'),
(733, 7, 'Matorrales', 'Cordoba'),
(734, 7, 'Mattaldi', 'Cordoba'),
(735, 7, 'Mayu Sumaj', 'Cordoba'),
(736, 7, 'Media Naranja', 'Cordoba'),
(737, 7, 'Melo', 'Cordoba'),
(738, 7, 'Mendiolaza', 'Cordoba'),
(739, 7, 'Mi Granja', 'Cordoba'),
(740, 7, 'Mina Clavero', 'Cordoba'),
(741, 7, 'Miramar', 'Cordoba'),
(742, 7, 'Morrison', 'Cordoba'),
(743, 7, 'Morteros', 'Cordoba'),
(744, 7, 'Mte. Buey', 'Cordoba'),
(745, 7, 'Mte. Cristo', 'Cordoba'),
(746, 7, 'Mte. De Los Gauchos', 'Cordoba'),
(747, 7, 'Mte. Leña', 'Cordoba'),
(748, 7, 'Mte. Maíz', 'Cordoba'),
(749, 7, 'Mte. Ralo', 'Cordoba'),
(750, 7, 'Nicolás Bruzone', 'Cordoba'),
(751, 7, 'Noetinger', 'Cordoba'),
(752, 7, 'Nono', 'Cordoba'),
(753, 7, 'Nueva 7', 'Cordoba'),
(754, 7, 'Obispo Trejo', 'Cordoba'),
(755, 7, 'Olaeta', 'Cordoba'),
(756, 7, 'Oliva', 'Cordoba'),
(757, 7, 'Olivares San Nicolás', 'Cordoba'),
(758, 7, 'Onagolty', 'Cordoba'),
(759, 7, 'Oncativo', 'Cordoba'),
(760, 7, 'Ordoñez', 'Cordoba'),
(761, 7, 'Pacheco De Melo', 'Cordoba'),
(762, 7, 'Pampayasta N.', 'Cordoba'),
(763, 7, 'Pampayasta S.', 'Cordoba'),
(764, 7, 'Panaholma', 'Cordoba'),
(765, 7, 'Pascanas', 'Cordoba'),
(766, 7, 'Pasco', 'Cordoba'),
(767, 7, 'Paso del Durazno', 'Cordoba'),
(768, 7, 'Paso Viejo', 'Cordoba'),
(769, 7, 'Pilar', 'Cordoba'),
(770, 7, 'Pincén', 'Cordoba'),
(771, 7, 'Piquillín', 'Cordoba'),
(772, 7, 'Plaza de Mercedes', 'Cordoba'),
(773, 7, 'Plaza Luxardo', 'Cordoba'),
(774, 7, 'Porteña', 'Cordoba'),
(775, 7, 'Potrero de Garay', 'Cordoba'),
(776, 7, 'Pozo del Molle', 'Cordoba'),
(777, 7, 'Pozo Nuevo', 'Cordoba'),
(778, 7, 'Pueblo Italiano', 'Cordoba'),
(779, 7, 'Puesto de Castro', 'Cordoba'),
(780, 7, 'Punta del Agua', 'Cordoba'),
(781, 7, 'Quebracho Herrado', 'Cordoba'),
(782, 7, 'Quilino', 'Cordoba'),
(783, 7, 'Rafael García', 'Cordoba'),
(784, 7, 'Ranqueles', 'Cordoba'),
(785, 7, 'Rayo Cortado', 'Cordoba'),
(786, 7, 'Reducción', 'Cordoba'),
(787, 7, 'Rincón', 'Cordoba'),
(788, 7, 'Río Bamba', 'Cordoba'),
(789, 7, 'Río Ceballos', 'Cordoba'),
(790, 7, 'Río Cuarto', 'Cordoba'),
(791, 7, 'Río de Los Sauces', 'Cordoba'),
(792, 7, 'Río Primero', 'Cordoba'),
(793, 7, 'Río Segundo', 'Cordoba'),
(794, 7, 'Río Tercero', 'Cordoba'),
(795, 7, 'Rosales', 'Cordoba'),
(796, 7, 'Rosario del Saladillo', 'Cordoba'),
(797, 7, 'Sacanta', 'Cordoba'),
(798, 7, 'Sagrada Familia', 'Cordoba'),
(799, 7, 'Saira', 'Cordoba'),
(800, 7, 'Saladillo', 'Cordoba'),
(801, 7, 'Saldán', 'Cordoba'),
(802, 7, 'Salsacate', 'Cordoba'),
(803, 7, 'Salsipuedes', 'Cordoba'),
(804, 7, 'Sampacho', 'Cordoba'),
(805, 7, 'San Agustín', 'Cordoba'),
(806, 7, 'San Antonio de Arredondo', 'Cordoba'),
(807, 7, 'San Antonio de Litín', 'Cordoba'),
(808, 7, 'San Basilio', 'Cordoba'),
(809, 7, 'San Carlos Minas', 'Cordoba'),
(810, 7, 'San Clemente', 'Cordoba'),
(811, 7, 'San Esteban', 'Cordoba'),
(812, 7, 'San Francisco', 'Cordoba'),
(813, 7, 'San Ignacio', 'Cordoba'),
(814, 7, 'San Javier', 'Cordoba'),
(815, 7, 'San Jerónimo', 'Cordoba'),
(816, 7, 'San Joaquín', 'Cordoba'),
(817, 7, 'San José de La Dormida', 'Cordoba'),
(818, 7, 'San José de Las Salinas', 'Cordoba'),
(819, 7, 'San Lorenzo', 'Cordoba'),
(820, 7, 'San Marcos Sierras', 'Cordoba'),
(821, 7, 'San Marcos Sud', 'Cordoba'),
(822, 7, 'San Pedro', 'Cordoba'),
(823, 7, 'San Pedro N.', 'Cordoba'),
(824, 7, 'San Roque', 'Cordoba'),
(825, 7, 'San Vicente', 'Cordoba'),
(826, 7, 'Santa Catalina', 'Cordoba'),
(827, 7, 'Santa Elena', 'Cordoba'),
(828, 7, 'Santa Eufemia', 'Cordoba'),
(829, 7, 'Santa Maria', 'Cordoba'),
(830, 7, 'Sarmiento', 'Cordoba'),
(831, 7, 'Saturnino M.Laspiur', 'Cordoba'),
(832, 7, 'Sauce Arriba', 'Cordoba'),
(833, 7, 'Sebastián Elcano', 'Cordoba'),
(834, 7, 'Seeber', 'Cordoba'),
(835, 7, 'Segunda Usina', 'Cordoba'),
(836, 7, 'Serrano', 'Cordoba'),
(837, 7, 'Serrezuela', 'Cordoba'),
(838, 7, 'Sgo. Temple', 'Cordoba'),
(839, 7, 'Silvio Pellico', 'Cordoba'),
(840, 7, 'Simbolar', 'Cordoba'),
(841, 7, 'Sinsacate', 'Cordoba'),
(842, 7, 'Sta. Rosa de Calamuchita', 'Cordoba'),
(843, 7, 'Sta. Rosa de Río Primero', 'Cordoba'),
(844, 7, 'Suco', 'Cordoba'),
(845, 7, 'Tala Cañada', 'Cordoba'),
(846, 7, 'Tala Huasi', 'Cordoba'),
(847, 7, 'Talaini', 'Cordoba'),
(848, 7, 'Tancacha', 'Cordoba'),
(849, 7, 'Tanti', 'Cordoba'),
(850, 7, 'Ticino', 'Cordoba'),
(851, 7, 'Tinoco', 'Cordoba'),
(852, 7, 'Tío Pujio', 'Cordoba'),
(853, 7, 'Toledo', 'Cordoba'),
(854, 7, 'Toro Pujio', 'Cordoba'),
(855, 7, 'Tosno', 'Cordoba'),
(856, 7, 'Tosquita', 'Cordoba'),
(857, 7, 'Tránsito', 'Cordoba'),
(858, 7, 'Tuclame', 'Cordoba'),
(859, 7, 'Tutti', 'Cordoba'),
(860, 7, 'Ucacha', 'Cordoba'),
(861, 7, 'Unquillo', 'Cordoba'),
(862, 7, 'Valle de Anisacate', 'Cordoba'),
(863, 7, 'Valle Hermoso', 'Cordoba'),
(864, 7, 'Vélez Sarfield', 'Cordoba'),
(865, 7, 'Viamonte', 'Cordoba'),
(866, 7, 'Vicuña Mackenna', 'Cordoba'),
(867, 7, 'Villa Allende', 'Cordoba'),
(868, 7, 'Villa Amancay', 'Cordoba'),
(869, 7, 'Villa Ascasubi', 'Cordoba'),
(870, 7, 'Villa Candelaria N.', 'Cordoba'),
(871, 7, 'Villa Carlos Paz', 'Cordoba'),
(872, 7, 'Villa Cerro Azul', 'Cordoba'),
(873, 7, 'Villa Ciudad de América', 'Cordoba'),
(874, 7, 'Villa Ciudad Pque Los Reartes', 'Cordoba'),
(875, 7, 'Villa Concepción del Tío', 'Cordoba'),
(876, 7, 'Villa Cura Brochero', 'Cordoba'),
(877, 7, 'Villa de Las Rosas', 'Cordoba'),
(878, 7, 'Villa de María', 'Cordoba'),
(879, 7, 'Villa de Pocho', 'Cordoba'),
(880, 7, 'Villa de Soto', 'Cordoba'),
(881, 7, 'Villa del Dique', 'Cordoba'),
(882, 7, 'Villa del Prado', 'Cordoba'),
(883, 7, 'Villa del Rosario', 'Cordoba'),
(884, 7, 'Villa del Totoral', 'Cordoba'),
(885, 7, 'Villa Dolores', 'Cordoba'),
(886, 7, 'Villa El Chancay', 'Cordoba'),
(887, 7, 'Villa Elisa', 'Cordoba'),
(888, 7, 'Villa Flor Serrana', 'Cordoba'),
(889, 7, 'Villa Fontana', 'Cordoba'),
(890, 7, 'Villa Giardino', 'Cordoba'),
(891, 7, 'Villa Gral. Belgrano', 'Cordoba'),
(892, 7, 'Villa Gutierrez', 'Cordoba'),
(893, 7, 'Villa Huidobro', 'Cordoba'),
(894, 7, 'Villa La Bolsa', 'Cordoba'),
(895, 7, 'Villa Los Aromos', 'Cordoba'),
(896, 7, 'Villa Los Patos', 'Cordoba'),
(897, 7, 'Villa María', 'Cordoba'),
(898, 7, 'Villa Nueva', 'Cordoba'),
(899, 7, 'Villa Pque. Santa Ana', 'Cordoba'),
(900, 7, 'Villa Pque. Siquiman', 'Cordoba'),
(901, 7, 'Villa Quillinzo', 'Cordoba'),
(902, 7, 'Villa Rossi', 'Cordoba'),
(903, 7, 'Villa Rumipal', 'Cordoba'),
(904, 7, 'Villa San Esteban', 'Cordoba'),
(905, 7, 'Villa San Isidro', 'Cordoba'),
(906, 7, 'Villa 21', 'Cordoba'),
(907, 7, 'Villa Sarmiento (G.R)', 'Cordoba'),
(908, 7, 'Villa Sarmiento (S.A)', 'Cordoba'),
(909, 7, 'Villa Tulumba', 'Cordoba'),
(910, 7, 'Villa Valeria', 'Cordoba'),
(911, 7, 'Villa Yacanto', 'Cordoba'),
(912, 7, 'Washington', 'Cordoba'),
(913, 7, 'Wenceslao Escalante', 'Cordoba'),
(914, 7, 'Ycho Cruz Sierras', 'Cordoba'),
(915, 8, 'Alvear', 'Corrientes'),
(916, 8, 'Bella Vista', 'Corrientes'),
(917, 8, 'Berón de Astrada', 'Corrientes'),
(918, 8, 'Bonpland', 'Corrientes'),
(919, 8, 'Caá Cati', 'Corrientes'),
(920, 8, 'Capital', 'Corrientes'),
(921, 8, 'Chavarría', 'Corrientes'),
(922, 8, 'Col. C. Pellegrini', 'Corrientes'),
(923, 8, 'Col. Libertad', 'Corrientes'),
(924, 8, 'Col. Liebig', 'Corrientes'),
(925, 8, 'Col. Sta Rosa', 'Corrientes'),
(926, 8, 'Concepción', 'Corrientes'),
(927, 8, 'Cruz de Los Milagros', 'Corrientes'),
(928, 8, 'Curuzú-Cuatiá', 'Corrientes'),
(929, 8, 'Empedrado', 'Corrientes'),
(930, 8, 'Esquina', 'Corrientes'),
(931, 8, 'Estación Torrent', 'Corrientes'),
(932, 8, 'Felipe Yofré', 'Corrientes'),
(933, 8, 'Garruchos', 'Corrientes'),
(934, 8, 'Gdor. Agrónomo', 'Corrientes'),
(935, 8, 'Gdor. Martínez', 'Corrientes'),
(936, 8, 'Goya', 'Corrientes'),
(937, 8, 'Guaviravi', 'Corrientes'),
(938, 8, 'Herlitzka', 'Corrientes'),
(939, 8, 'Ita-Ibate', 'Corrientes'),
(940, 8, 'Itatí', 'Corrientes'),
(941, 8, 'Ituzaingó', 'Corrientes'),
(942, 8, 'José Rafael Gómez', 'Corrientes'),
(943, 8, 'Juan Pujol', 'Corrientes'),
(944, 8, 'La Cruz', 'Corrientes'),
(945, 8, 'Lavalle', 'Corrientes'),
(946, 8, 'Lomas de Vallejos', 'Corrientes'),
(947, 8, 'Loreto', 'Corrientes'),
(948, 8, 'Mariano I. Loza', 'Corrientes'),
(949, 8, 'Mburucuyá', 'Corrientes'),
(950, 8, 'Mercedes', 'Corrientes'),
(951, 8, 'Mocoretá', 'Corrientes'),
(952, 8, 'Mte. Caseros', 'Corrientes'),
(953, 8, 'Nueve de Julio', 'Corrientes'),
(954, 8, 'Palmar Grande', 'Corrientes'),
(955, 8, 'Parada Pucheta', 'Corrientes'),
(956, 8, 'Paso de La Patria', 'Corrientes'),
(957, 8, 'Paso de Los Libres', 'Corrientes'),
(958, 8, 'Pedro R. Fernandez', 'Corrientes'),
(959, 8, 'Perugorría', 'Corrientes'),
(960, 8, 'Pueblo Libertador', 'Corrientes'),
(961, 8, 'Ramada Paso', 'Corrientes'),
(962, 8, 'Riachuelo', 'Corrientes'),
(963, 8, 'Saladas', 'Corrientes'),
(964, 8, 'San Antonio', 'Corrientes'),
(965, 8, 'San Carlos', 'Corrientes'),
(966, 8, 'San Cosme', 'Corrientes'),
(967, 8, 'San Lorenzo', 'Corrientes'),
(968, 8, '20 del Palmar', 'Corrientes'),
(969, 8, 'San Miguel', 'Corrientes'),
(970, 8, 'San Roque', 'Corrientes'),
(971, 8, 'Santa Ana', 'Corrientes'),
(972, 8, 'Santa Lucía', 'Corrientes'),
(973, 8, 'Santo Tomé', 'Corrientes'),
(974, 8, 'Sauce', 'Corrientes'),
(975, 8, 'Tabay', 'Corrientes'),
(976, 8, 'Tapebicuá', 'Corrientes'),
(977, 8, 'Tatacua', 'Corrientes'),
(978, 8, 'Virasoro', 'Corrientes'),
(979, 8, 'Yapeyú', 'Corrientes'),
(980, 8, 'Yataití Calle', 'Corrientes'),
(981, 9, 'Alarcón', 'Entre Rios'),
(982, 9, 'Alcaraz', 'Entre Rios'),
(983, 9, 'Alcaraz N.', 'Entre Rios'),
(984, 9, 'Alcaraz S.', 'Entre Rios'),
(985, 9, 'Aldea Asunción', 'Entre Rios'),
(986, 9, 'Aldea Brasilera', 'Entre Rios'),
(987, 9, 'Aldea Elgenfeld', 'Entre Rios'),
(988, 9, 'Aldea Grapschental', 'Entre Rios'),
(989, 9, 'Aldea Ma. Luisa', 'Entre Rios'),
(990, 9, 'Aldea Protestante', 'Entre Rios'),
(991, 9, 'Aldea Salto', 'Entre Rios'),
(992, 9, 'Aldea San Antonio (G)', 'Entre Rios'),
(993, 9, 'Aldea San Antonio (P)', 'Entre Rios'),
(994, 9, 'Aldea 19', 'Entre Rios'),
(995, 9, 'Aldea San Miguel', 'Entre Rios'),
(996, 9, 'Aldea San Rafael', 'Entre Rios'),
(997, 9, 'Aldea Spatzenkutter', 'Entre Rios'),
(998, 9, 'Aldea Sta. María', 'Entre Rios'),
(999, 9, 'Aldea Sta. Rosa', 'Entre Rios'),
(1000, 9, 'Aldea Valle María', 'Entre Rios'),
(1001, 9, 'Altamirano Sur', 'Entre Rios'),
(1002, 9, 'Antelo', 'Entre Rios'),
(1003, 9, 'Antonio Tomás', 'Entre Rios'),
(1004, 9, 'Aranguren', 'Entre Rios'),
(1005, 9, 'Arroyo Barú', 'Entre Rios'),
(1006, 9, 'Arroyo Burgos', 'Entre Rios'),
(1007, 9, 'Arroyo Clé', 'Entre Rios'),
(1008, 9, 'Arroyo Corralito', 'Entre Rios'),
(1009, 9, 'Arroyo del Medio', 'Entre Rios'),
(1010, 9, 'Arroyo Maturrango', 'Entre Rios'),
(1011, 9, 'Arroyo Palo Seco', 'Entre Rios'),
(1012, 9, 'Banderas', 'Entre Rios'),
(1013, 9, 'Basavilbaso', 'Entre Rios'),
(1014, 9, 'Betbeder', 'Entre Rios'),
(1015, 9, 'Bovril', 'Entre Rios'),
(1016, 9, 'Caseros', 'Entre Rios'),
(1017, 9, 'Ceibas', 'Entre Rios'),
(1018, 9, 'Cerrito', 'Entre Rios'),
(1019, 9, 'Chajarí', 'Entre Rios'),
(1020, 9, 'Chilcas', 'Entre Rios'),
(1021, 9, 'Clodomiro Ledesma', 'Entre Rios'),
(1022, 9, 'Col. Alemana', 'Entre Rios'),
(1023, 9, 'Col. Avellaneda', 'Entre Rios'),
(1024, 9, 'Col. Avigdor', 'Entre Rios'),
(1025, 9, 'Col. Ayuí', 'Entre Rios'),
(1026, 9, 'Col. Baylina', 'Entre Rios'),
(1027, 9, 'Col. Carrasco', 'Entre Rios'),
(1028, 9, 'Col. Celina', 'Entre Rios'),
(1029, 9, 'Col. Cerrito', 'Entre Rios'),
(1030, 9, 'Col. Crespo', 'Entre Rios'),
(1031, 9, 'Col. Elia', 'Entre Rios'),
(1032, 9, 'Col. Ensayo', 'Entre Rios'),
(1033, 9, 'Col. Gral. Roca', 'Entre Rios'),
(1034, 9, 'Col. La Argentina', 'Entre Rios'),
(1035, 9, 'Col. Merou', 'Entre Rios'),
(1036, 9, 'Col. Oficial Nª3', 'Entre Rios'),
(1037, 9, 'Col. Oficial Nº13', 'Entre Rios'),
(1038, 9, 'Col. Oficial Nº14', 'Entre Rios'),
(1039, 9, 'Col. Oficial Nº5', 'Entre Rios'),
(1040, 9, 'Col. Reffino', 'Entre Rios'),
(1041, 9, 'Col. Tunas', 'Entre Rios'),
(1042, 9, 'Col. Viraró', 'Entre Rios'),
(1043, 9, 'Colón', 'Entre Rios'),
(1044, 9, 'Concepción del Uruguay', 'Entre Rios'),
(1045, 9, 'Concordia', 'Entre Rios'),
(1046, 9, 'Conscripto Bernardi', 'Entre Rios'),
(1047, 9, 'Costa Grande', 'Entre Rios'),
(1048, 9, 'Costa San Antonio', 'Entre Rios'),
(1049, 9, 'Costa Uruguay N.', 'Entre Rios'),
(1050, 9, 'Costa Uruguay S.', 'Entre Rios'),
(1051, 9, 'Crespo', 'Entre Rios'),
(1052, 9, 'Crucecitas 3ª', 'Entre Rios'),
(1053, 9, 'Crucecitas 7ª', 'Entre Rios'),
(1054, 9, 'Crucecitas 8ª', 'Entre Rios'),
(1055, 9, 'Cuchilla Redonda', 'Entre Rios'),
(1056, 9, 'Curtiembre', 'Entre Rios'),
(1057, 9, 'Diamante', 'Entre Rios'),
(1058, 9, 'Distrito 6º', 'Entre Rios'),
(1059, 9, 'Distrito Chañar', 'Entre Rios'),
(1060, 9, 'Distrito Chiqueros', 'Entre Rios'),
(1061, 9, 'Distrito Cuarto', 'Entre Rios'),
(1062, 9, 'Distrito Diego López', 'Entre Rios'),
(1063, 9, 'Distrito Pajonal', 'Entre Rios'),
(1064, 9, 'Distrito Sauce', 'Entre Rios'),
(1065, 9, 'Distrito Tala', 'Entre Rios'),
(1066, 9, 'Distrito Talitas', 'Entre Rios'),
(1067, 9, 'Don Cristóbal 1ª Sección', 'Entre Rios'),
(1068, 9, 'Don Cristóbal 2ª Sección', 'Entre Rios'),
(1069, 9, 'Durazno', 'Entre Rios'),
(1070, 9, 'El Cimarrón', 'Entre Rios'),
(1071, 9, 'El Gramillal', 'Entre Rios'),
(1072, 9, 'El Palenque', 'Entre Rios'),
(1073, 9, 'El Pingo', 'Entre Rios'),
(1074, 9, 'El Quebracho', 'Entre Rios'),
(1075, 9, 'El Redomón', 'Entre Rios'),
(1076, 9, 'El Solar', 'Entre Rios'),
(1077, 9, 'Enrique Carbo', 'Entre Rios'),
(1078, 9, '9', 'Entre Rios'),
(1079, 9, 'Espinillo N.', 'Entre Rios'),
(1080, 9, 'Estación Campos', 'Entre Rios'),
(1081, 9, 'Estación Escriña', 'Entre Rios'),
(1082, 9, 'Estación Lazo', 'Entre Rios'),
(1083, 9, 'Estación Raíces', 'Entre Rios'),
(1084, 9, 'Estación Yerúa', 'Entre Rios'),
(1085, 9, 'Estancia Grande', 'Entre Rios'),
(1086, 9, 'Estancia Líbaros', 'Entre Rios'),
(1087, 9, 'Estancia Racedo', 'Entre Rios'),
(1088, 9, 'Estancia Solá', 'Entre Rios'),
(1089, 9, 'Estancia Yuquerí', 'Entre Rios'),
(1090, 9, 'Estaquitas', 'Entre Rios'),
(1091, 9, 'Faustino M. Parera', 'Entre Rios'),
(1092, 9, 'Febre', 'Entre Rios'),
(1093, 9, 'Federación', 'Entre Rios'),
(1094, 9, 'Federal', 'Entre Rios'),
(1095, 9, 'Gdor. Echagüe', 'Entre Rios'),
(1096, 9, 'Gdor. Mansilla', 'Entre Rios'),
(1097, 9, 'Gilbert', 'Entre Rios'),
(1098, 9, 'González Calderón', 'Entre Rios'),
(1099, 9, 'Gral. Almada', 'Entre Rios'),
(1100, 9, 'Gral. Alvear', 'Entre Rios'),
(1101, 9, 'Gral. Campos', 'Entre Rios'),
(1102, 9, 'Gral. Galarza', 'Entre Rios'),
(1103, 9, 'Gral. Ramírez', 'Entre Rios'),
(1104, 9, 'Gualeguay', 'Entre Rios'),
(1105, 9, 'Gualeguaychú', 'Entre Rios'),
(1106, 9, 'Gualeguaycito', 'Entre Rios'),
(1107, 9, 'Guardamonte', 'Entre Rios'),
(1108, 9, 'Hambis', 'Entre Rios'),
(1109, 9, 'Hasenkamp', 'Entre Rios'),
(1110, 9, 'Hernandarias', 'Entre Rios'),
(1111, 9, 'Hernández', 'Entre Rios'),
(1112, 9, 'Herrera', 'Entre Rios'),
(1113, 9, 'Hinojal', 'Entre Rios'),
(1114, 9, 'Hocker', 'Entre Rios'),
(1115, 9, 'Ing. Sajaroff', 'Entre Rios'),
(1116, 9, 'Irazusta', 'Entre Rios'),
(1117, 9, 'Isletas', 'Entre Rios'),
(1118, 9, 'J.J De Urquiza', 'Entre Rios'),
(1119, 9, 'Jubileo', 'Entre Rios'),
(1120, 9, 'La Clarita', 'Entre Rios'),
(1121, 9, 'La Criolla', 'Entre Rios'),
(1122, 9, 'La Esmeralda', 'Entre Rios'),
(1123, 9, 'La Florida', 'Entre Rios'),
(1124, 9, 'La Fraternidad', 'Entre Rios'),
(1125, 9, 'La Hierra', 'Entre Rios'),
(1126, 9, 'La Ollita', 'Entre Rios'),
(1127, 9, 'La Paz', 'Entre Rios'),
(1128, 9, 'La Picada', 'Entre Rios'),
(1129, 9, 'La Providencia', 'Entre Rios'),
(1130, 9, 'La Verbena', 'Entre Rios'),
(1131, 9, 'Laguna Benítez', 'Entre Rios'),
(1132, 9, 'Larroque', 'Entre Rios'),
(1133, 9, 'Las Cuevas', 'Entre Rios'),
(1134, 9, 'Las Garzas', 'Entre Rios'),
(1135, 9, 'Las Guachas', 'Entre Rios'),
(1136, 9, 'Las Mercedes', 'Entre Rios'),
(1137, 9, 'Las Moscas', 'Entre Rios'),
(1138, 9, 'Las Mulitas', 'Entre Rios'),
(1139, 9, 'Las Toscas', 'Entre Rios'),
(1140, 9, 'Laurencena', 'Entre Rios'),
(1141, 9, 'Libertador San Martín', 'Entre Rios'),
(1142, 9, 'Loma Limpia', 'Entre Rios'),
(1143, 9, 'Los Ceibos', 'Entre Rios'),
(1144, 9, 'Los Charruas', 'Entre Rios'),
(1145, 9, 'Los Conquistadores', 'Entre Rios'),
(1146, 9, 'Lucas González', 'Entre Rios'),
(1147, 9, 'Lucas N.', 'Entre Rios'),
(1148, 9, 'Lucas S. 1ª', 'Entre Rios'),
(1149, 9, 'Lucas S. 2ª', 'Entre Rios'),
(1150, 9, 'Maciá', 'Entre Rios'),
(1151, 9, 'María Grande', 'Entre Rios'),
(1152, 9, 'María Grande 2ª', 'Entre Rios'),
(1153, 9, 'Médanos', 'Entre Rios'),
(1154, 9, 'Mojones N.', 'Entre Rios'),
(1155, 9, 'Mojones S.', 'Entre Rios'),
(1156, 9, 'Molino Doll', 'Entre Rios'),
(1157, 9, 'Monte Redondo', 'Entre Rios'),
(1158, 9, 'Montoya', 'Entre Rios'),
(1159, 9, 'Mulas Grandes', 'Entre Rios'),
(1160, 9, 'Ñancay', 'Entre Rios'),
(1161, 9, 'Nogoyá', 'Entre Rios'),
(1162, 9, 'Nueva Escocia', 'Entre Rios'),
(1163, 9, 'Nueva Vizcaya', 'Entre Rios'),
(1164, 9, 'Ombú', 'Entre Rios'),
(1165, 9, 'Oro Verde', 'Entre Rios'),
(1166, 9, 'Paraná', 'Entre Rios'),
(1167, 9, 'Pasaje Guayaquil', 'Entre Rios'),
(1168, 9, 'Pasaje Las Tunas', 'Entre Rios'),
(1169, 9, 'Paso de La Arena', 'Entre Rios'),
(1170, 9, 'Paso de La Laguna', 'Entre Rios'),
(1171, 9, 'Paso de Las Piedras', 'Entre Rios'),
(1172, 9, 'Paso Duarte', 'Entre Rios'),
(1173, 9, 'Pastor Britos', 'Entre Rios'),
(1174, 9, 'Pedernal', 'Entre Rios'),
(1175, 9, 'Perdices', 'Entre Rios'),
(1176, 9, 'Picada Berón', 'Entre Rios'),
(1177, 9, 'Piedras Blancas', 'Entre Rios'),
(1178, 9, 'Primer Distrito Cuchilla', 'Entre Rios'),
(1179, 9, 'Primero de Mayo', 'Entre Rios'),
(1180, 9, 'Pronunciamiento', 'Entre Rios'),
(1181, 9, 'Pto. Algarrobo', 'Entre Rios'),
(1182, 9, 'Pto. Ibicuy', 'Entre Rios'),
(1183, 9, 'Pueblo Brugo', 'Entre Rios'),
(1184, 9, 'Pueblo Cazes', 'Entre Rios'),
(1185, 9, 'Pueblo Gral. Belgrano', 'Entre Rios'),
(1186, 9, 'Pueblo Liebig', 'Entre Rios'),
(1187, 9, 'Puerto Yeruá', 'Entre Rios'),
(1188, 9, 'Punta del Monte', 'Entre Rios'),
(1189, 9, 'Quebracho', 'Entre Rios'),
(1190, 9, 'Quinto Distrito', 'Entre Rios'),
(1191, 9, 'Raices Oeste', 'Entre Rios'),
(1192, 9, 'Rincón de Nogoyá', 'Entre Rios'),
(1193, 9, 'Rincón del Cinto', 'Entre Rios'),
(1194, 9, 'Rincón del Doll', 'Entre Rios'),
(1195, 9, 'Rincón del Gato', 'Entre Rios'),
(1196, 9, 'Rocamora', 'Entre Rios'),
(1197, 9, 'Rosario del Tala', 'Entre Rios'),
(1198, 9, 'San Benito', 'Entre Rios'),
(1199, 9, 'San Cipriano', 'Entre Rios'),
(1200, 9, 'San Ernesto', 'Entre Rios'),
(1201, 9, 'San Gustavo', 'Entre Rios'),
(1202, 9, 'San Jaime', 'Entre Rios'),
(1203, 9, 'San José', 'Entre Rios'),
(1204, 9, 'San José de Feliciano', 'Entre Rios'),
(1205, 9, 'San Justo', 'Entre Rios'),
(1206, 9, 'San Marcial', 'Entre Rios'),
(1207, 9, 'San Pedro', 'Entre Rios'),
(1208, 9, 'San Ramírez', 'Entre Rios'),
(1209, 9, 'San Ramón', 'Entre Rios'),
(1210, 9, 'San Roque', 'Entre Rios'),
(1211, 9, 'San Salvador', 'Entre Rios'),
(1212, 9, 'San Víctor', 'Entre Rios'),
(1213, 9, 'Santa Ana', 'Entre Rios'),
(1214, 9, 'Santa Anita', 'Entre Rios'),
(1215, 9, 'Santa Elena', 'Entre Rios'),
(1216, 9, 'Santa Lucía', 'Entre Rios'),
(1217, 9, 'Santa Luisa', 'Entre Rios'),
(1218, 9, 'Sauce de Luna', 'Entre Rios'),
(1219, 9, 'Sauce Montrull', 'Entre Rios'),
(1220, 9, 'Sauce Pinto', 'Entre Rios'),
(1221, 9, 'Sauce Sur', 'Entre Rios'),
(1222, 9, 'Seguí', 'Entre Rios'),
(1223, 9, 'Sir Leonard', 'Entre Rios'),
(1224, 9, 'Sosa', 'Entre Rios'),
(1225, 9, 'Tabossi', 'Entre Rios'),
(1226, 9, 'Tezanos Pinto', 'Entre Rios'),
(1227, 9, 'Ubajay', 'Entre Rios'),
(1228, 9, 'Urdinarrain', 'Entre Rios'),
(1229, 9, 'Veinte de Septiembre', 'Entre Rios'),
(1230, 9, 'Viale', 'Entre Rios'),
(1231, 9, 'Victoria', 'Entre Rios'),
(1232, 9, 'Villa Clara', 'Entre Rios'),
(1233, 9, 'Villa del Rosario', 'Entre Rios'),
(1234, 9, 'Villa Domínguez', 'Entre Rios'),
(1235, 9, 'Villa Elisa', 'Entre Rios'),
(1236, 9, 'Villa Fontana', 'Entre Rios'),
(1237, 9, 'Villa Gdor. Etchevehere', 'Entre Rios'),
(1238, 9, 'Villa Mantero', 'Entre Rios'),
(1239, 9, 'Villa Paranacito', 'Entre Rios'),
(1240, 9, 'Villa Urquiza', 'Entre Rios'),
(1241, 9, 'Villaguay', 'Entre Rios'),
(1242, 9, 'Walter Moss', 'Entre Rios'),
(1243, 9, 'Yacaré', 'Entre Rios'),
(1244, 9, 'Yeso Oeste', 'Entre Rios'),
(1245, 10, 'Buena Vista', 'Formosa'),
(1246, 10, 'Clorinda', 'Formosa'),
(1247, 10, 'Col. Pastoril', 'Formosa'),
(1248, 10, 'Cte. Fontana', 'Formosa'),
(1249, 10, 'El Colorado', 'Formosa'),
(1250, 10, 'El Espinillo', 'Formosa'),
(1251, 10, 'Estanislao Del Campo', 'Formosa'),
(1252, 10, '10', 'Formosa'),
(1253, 10, 'Fortín Lugones', 'Formosa'),
(1254, 10, 'Gral. Lucio V. Mansilla', 'Formosa'),
(1255, 10, 'Gral. Manuel Belgrano', 'Formosa'),
(1256, 10, 'Gral. Mosconi', 'Formosa'),
(1257, 10, 'Gran Guardia', 'Formosa'),
(1258, 10, 'Herradura', 'Formosa'),
(1259, 10, 'Ibarreta', 'Formosa'),
(1260, 10, 'Ing. Juárez', 'Formosa'),
(1261, 10, 'Laguna Blanca', 'Formosa'),
(1262, 10, 'Laguna Naick Neck', 'Formosa'),
(1263, 10, 'Laguna Yema', 'Formosa'),
(1264, 10, 'Las Lomitas', 'Formosa'),
(1265, 10, 'Los Chiriguanos', 'Formosa'),
(1266, 10, 'Mayor V. Villafañe', 'Formosa'),
(1267, 10, 'Misión San Fco.', 'Formosa'),
(1268, 10, 'Palo Santo', 'Formosa'),
(1269, 10, 'Pirané', 'Formosa'),
(1270, 10, 'Pozo del Maza', 'Formosa'),
(1271, 10, 'Riacho He-He', 'Formosa'),
(1272, 10, 'San Hilario', 'Formosa'),
(1273, 10, 'San Martín II', 'Formosa'),
(1274, 10, 'Siete Palmas', 'Formosa'),
(1275, 10, 'Subteniente Perín', 'Formosa'),
(1276, 10, 'Tres Lagunas', 'Formosa'),
(1277, 10, 'Villa Dos Trece', 'Formosa'),
(1278, 10, 'Villa Escolar', 'Formosa'),
(1279, 10, 'Villa Gral. Güemes', 'Formosa'),
(1280, 11, 'Abdon Castro Tolay', 'Jujuy'),
(1281, 11, 'Abra Pampa', 'Jujuy'),
(1282, 11, 'Abralaite', 'Jujuy'),
(1283, 11, 'Aguas Calientes', 'Jujuy'),
(1284, 11, 'Arrayanal', 'Jujuy'),
(1285, 11, 'Barrios', 'Jujuy'),
(1286, 11, 'Caimancito', 'Jujuy'),
(1287, 11, 'Calilegua', 'Jujuy'),
(1288, 11, 'Cangrejillos', 'Jujuy'),
(1289, 11, 'Caspala', 'Jujuy'),
(1290, 11, 'Catuá', 'Jujuy'),
(1291, 11, 'Cieneguillas', 'Jujuy'),
(1292, 11, 'Coranzulli', 'Jujuy'),
(1293, 11, 'Cusi-Cusi', 'Jujuy'),
(1294, 11, 'El Aguilar', 'Jujuy'),
(1295, 11, 'El Carmen', 'Jujuy'),
(1296, 11, 'El Cóndor', 'Jujuy'),
(1297, 11, 'El Fuerte', 'Jujuy'),
(1298, 11, 'El Piquete', 'Jujuy'),
(1299, 11, 'El Talar', 'Jujuy'),
(1300, 11, 'Fraile Pintado', 'Jujuy'),
(1301, 11, 'Hipólito Yrigoyen', 'Jujuy'),
(1302, 11, 'Huacalera', 'Jujuy'),
(1303, 11, 'Humahuaca', 'Jujuy'),
(1304, 11, 'La Esperanza', 'Jujuy'),
(1305, 11, 'La Mendieta', 'Jujuy'),
(1306, 11, 'La Quiaca', 'Jujuy'),
(1307, 11, 'Ledesma', 'Jujuy'),
(1308, 11, 'Libertador Gral. San Martin', 'Jujuy'),
(1309, 11, 'Maimara', 'Jujuy'),
(1310, 11, 'Mina Pirquitas', 'Jujuy'),
(1311, 11, 'Monterrico', 'Jujuy'),
(1312, 11, 'Palma Sola', 'Jujuy'),
(1313, 11, 'Palpalá', 'Jujuy'),
(1314, 11, 'Pampa Blanca', 'Jujuy'),
(1315, 11, 'Pampichuela', 'Jujuy'),
(1316, 11, 'Perico', 'Jujuy'),
(1317, 11, 'Puesto del Marqués', 'Jujuy'),
(1318, 11, 'Puesto Viejo', 'Jujuy'),
(1319, 11, 'Pumahuasi', 'Jujuy'),
(1320, 11, 'Purmamarca', 'Jujuy'),
(1321, 11, 'Rinconada', 'Jujuy'),
(1322, 11, 'Rodeitos', 'Jujuy'),
(1323, 11, 'Rosario de Río Grande', 'Jujuy'),
(1324, 11, 'San Antonio', 'Jujuy'),
(1325, 11, 'San Francisco', 'Jujuy'),
(1326, 11, 'San Pedro', 'Jujuy'),
(1327, 11, 'San Rafael', 'Jujuy'),
(1328, 11, 'San Salvador', 'Jujuy'),
(1329, 11, 'Santa Ana', 'Jujuy'),
(1330, 11, 'Santa Catalina', 'Jujuy'),
(1331, 11, 'Santa Clara', 'Jujuy'),
(1332, 11, 'Susques', 'Jujuy'),
(1333, 11, 'Tilcara', 'Jujuy'),
(1334, 11, 'Tres Cruces', 'Jujuy'),
(1335, 11, 'Tumbaya', 'Jujuy'),
(1336, 11, 'Valle Grande', 'Jujuy'),
(1337, 11, 'Vinalito', 'Jujuy'),
(1338, 11, 'Volcán', 'Jujuy'),
(1339, 11, 'Yala', 'Jujuy'),
(1340, 11, 'Yaví', 'Jujuy'),
(1341, 11, 'Yuto', 'Jujuy'),
(1342, 12, 'Abramo', 'La Pampa'),
(1343, 12, 'Adolfo Van Praet', 'La Pampa'),
(1344, 12, 'Agustoni', 'La Pampa'),
(1345, 12, 'Algarrobo del Aguila', 'La Pampa'),
(1346, 12, 'Alpachiri', 'La Pampa'),
(1347, 12, 'Alta Italia', 'La Pampa'),
(1348, 12, 'Anguil', 'La Pampa'),
(1349, 12, 'Arata', 'La Pampa'),
(1350, 12, 'Ataliva Roca', 'La Pampa'),
(1351, 12, 'Bernardo Larroude', 'La Pampa'),
(1352, 12, 'Bernasconi', 'La Pampa'),
(1353, 12, 'Caleufú', 'La Pampa');
INSERT INTO `localidades` (`id_localidad`, `id_provincia`, `localidad`, `provincia`) VALUES
(1354, 12, 'Carro Quemado', 'La Pampa'),
(1355, 12, 'Catriló', 'La Pampa'),
(1356, 12, 'Ceballos', 'La Pampa'),
(1357, 12, 'Chacharramendi', 'La Pampa'),
(1358, 12, 'Col. Barón', 'La Pampa'),
(1359, 12, 'Col. Santa María', 'La Pampa'),
(1360, 12, 'Conhelo', 'La Pampa'),
(1361, 12, 'Coronel Hilario Lagos', 'La Pampa'),
(1362, 12, 'Cuchillo-Có', 'La Pampa'),
(1363, 12, 'Doblas', 'La Pampa'),
(1364, 12, 'Dorila', 'La Pampa'),
(1365, 12, 'Eduardo Castex', 'La Pampa'),
(1366, 12, 'Embajador Martini', 'La Pampa'),
(1367, 12, 'Falucho', 'La Pampa'),
(1368, 12, 'Gral. Acha', 'La Pampa'),
(1369, 12, 'Gral. Manuel Campos', 'La Pampa'),
(1370, 12, 'Gral. Pico', 'La Pampa'),
(1371, 12, 'Guatraché', 'La Pampa'),
(1372, 12, 'Ing. Luiggi', 'La Pampa'),
(1373, 12, 'Intendente Alvear', 'La Pampa'),
(1374, 12, 'Jacinto Arauz', 'La Pampa'),
(1375, 12, 'La Adela', 'La Pampa'),
(1376, 12, 'La Humada', 'La Pampa'),
(1377, 12, 'La Maruja', 'La Pampa'),
(1378, 12, '12', 'La Pampa'),
(1379, 12, 'La Reforma', 'La Pampa'),
(1380, 12, 'Limay Mahuida', 'La Pampa'),
(1381, 12, 'Lonquimay', 'La Pampa'),
(1382, 12, 'Loventuel', 'La Pampa'),
(1383, 12, 'Luan Toro', 'La Pampa'),
(1384, 12, 'Macachín', 'La Pampa'),
(1385, 12, 'Maisonnave', 'La Pampa'),
(1386, 12, 'Mauricio Mayer', 'La Pampa'),
(1387, 12, 'Metileo', 'La Pampa'),
(1388, 12, 'Miguel Cané', 'La Pampa'),
(1389, 12, 'Miguel Riglos', 'La Pampa'),
(1390, 12, 'Monte Nievas', 'La Pampa'),
(1391, 12, 'Parera', 'La Pampa'),
(1392, 12, 'Perú', 'La Pampa'),
(1393, 12, 'Pichi-Huinca', 'La Pampa'),
(1394, 12, 'Puelches', 'La Pampa'),
(1395, 12, 'Puelén', 'La Pampa'),
(1396, 12, 'Quehue', 'La Pampa'),
(1397, 12, 'Quemú Quemú', 'La Pampa'),
(1398, 12, 'Quetrequén', 'La Pampa'),
(1399, 12, 'Rancul', 'La Pampa'),
(1400, 12, 'Realicó', 'La Pampa'),
(1401, 12, 'Relmo', 'La Pampa'),
(1402, 12, 'Rolón', 'La Pampa'),
(1403, 12, 'Rucanelo', 'La Pampa'),
(1404, 12, 'Sarah', 'La Pampa'),
(1405, 12, 'Speluzzi', 'La Pampa'),
(1406, 12, 'Sta. Isabel', 'La Pampa'),
(1407, 12, 'Sta. Rosa', 'La Pampa'),
(1408, 12, 'Sta. Teresa', 'La Pampa'),
(1409, 12, 'Telén', 'La Pampa'),
(1410, 12, 'Toay', 'La Pampa'),
(1411, 12, 'Tomas M. de Anchorena', 'La Pampa'),
(1412, 12, 'Trenel', 'La Pampa'),
(1413, 12, 'Unanue', 'La Pampa'),
(1414, 12, 'Uriburu', 'La Pampa'),
(1415, 12, 'Veinticinco de Mayo', 'La Pampa'),
(1416, 12, 'Vertiz', 'La Pampa'),
(1417, 12, 'Victorica', 'La Pampa'),
(1418, 12, 'Villa Mirasol', 'La Pampa'),
(1419, 12, 'Winifreda', 'La Pampa'),
(1420, 13, 'Arauco', 'La Rioja'),
(1421, 13, 'Capital', 'La Rioja'),
(1422, 13, 'Castro Barros', 'La Rioja'),
(1423, 13, 'Chamical', 'La Rioja'),
(1424, 13, 'Chilecito', 'La Rioja'),
(1425, 13, 'Coronel F. Varela', 'La Rioja'),
(1426, 13, 'Famatina', 'La Rioja'),
(1427, 13, 'Gral. A.V.Peñaloza', 'La Rioja'),
(1428, 13, 'Gral. Belgrano', 'La Rioja'),
(1429, 13, 'Gral. J.F. Quiroga', 'La Rioja'),
(1430, 13, 'Gral. Lamadrid', 'La Rioja'),
(1431, 13, 'Gral. Ocampo', 'La Rioja'),
(1432, 13, 'Gral. San Martín', 'La Rioja'),
(1433, 13, 'Independencia', 'La Rioja'),
(1434, 13, 'Rosario Penaloza', 'La Rioja'),
(1435, 13, 'San Blas de Los Sauces', 'La Rioja'),
(1436, 13, 'Sanagasta', 'La Rioja'),
(1437, 13, 'Vinchina', 'La Rioja'),
(1438, 14, 'Capital', 'Mendoza'),
(1439, 14, 'Chacras de Coria', 'Mendoza'),
(1440, 14, 'Dorrego', 'Mendoza'),
(1441, 14, 'Gllen', 'Mendoza'),
(1442, 14, 'Godoy Cruz', 'Mendoza'),
(1443, 14, 'Gral. Alvear', 'Mendoza'),
(1444, 14, 'Guaymallén', 'Mendoza'),
(1445, 14, 'Junín', 'Mendoza'),
(1446, 14, 'La Paz', 'Mendoza'),
(1447, 14, 'Las Heras', 'Mendoza'),
(1448, 14, 'Lavalle', 'Mendoza'),
(1449, 14, 'Luján', 'Mendoza'),
(1450, 14, 'Luján De Cuyo', 'Mendoza'),
(1451, 14, 'Maipú', 'Mendoza'),
(1452, 14, 'Malargüe', 'Mendoza'),
(1453, 14, 'Rivadavia', 'Mendoza'),
(1454, 14, 'San Carlos', 'Mendoza'),
(1455, 14, 'San Martín', 'Mendoza'),
(1456, 14, 'San Rafael', 'Mendoza'),
(1457, 14, 'Sta. Rosa', 'Mendoza'),
(1458, 14, 'Tunuyán', 'Mendoza'),
(1459, 14, 'Tupungato', 'Mendoza'),
(1460, 14, 'Villa Nueva', 'Mendoza'),
(1461, 15, 'Alba Posse', 'Misiones'),
(1462, 15, 'Almafuerte', 'Misiones'),
(1463, 15, 'Apóstoles', 'Misiones'),
(1464, 15, 'Aristóbulo Del Valle', 'Misiones'),
(1465, 15, 'Arroyo Del Medio', 'Misiones'),
(1466, 15, 'Azara', 'Misiones'),
(1467, 15, 'Bdo. De Irigoyen', 'Misiones'),
(1468, 15, 'Bonpland', 'Misiones'),
(1469, 15, 'Caá Yari', 'Misiones'),
(1470, 15, 'Campo Grande', 'Misiones'),
(1471, 15, 'Campo Ramón', 'Misiones'),
(1472, 15, 'Campo Viera', 'Misiones'),
(1473, 15, 'Candelaria', 'Misiones'),
(1474, 15, 'Capioví', 'Misiones'),
(1475, 15, 'Caraguatay', 'Misiones'),
(1476, 15, 'Cdte. Guacurarí', 'Misiones'),
(1477, 15, 'Cerro Azul', 'Misiones'),
(1478, 15, 'Cerro Corá', 'Misiones'),
(1479, 15, 'Col. Alberdi', 'Misiones'),
(1480, 15, 'Col. Aurora', 'Misiones'),
(1481, 15, 'Col. Delicia', 'Misiones'),
(1482, 15, 'Col. Polana', 'Misiones'),
(1483, 15, 'Col. Victoria', 'Misiones'),
(1484, 15, 'Col. Wanda', 'Misiones'),
(1485, 15, 'Concepción De La Sierra', 'Misiones'),
(1486, 15, 'Corpus', 'Misiones'),
(1487, 15, 'Dos Arroyos', 'Misiones'),
(1488, 15, 'Dos de Mayo', 'Misiones'),
(1489, 15, 'El Alcázar', 'Misiones'),
(1490, 15, 'El Dorado', 'Misiones'),
(1491, 15, 'El Soberbio', 'Misiones'),
(1492, 15, 'Esperanza', 'Misiones'),
(1493, 15, 'F. Ameghino', 'Misiones'),
(1494, 15, 'Fachinal', 'Misiones'),
(1495, 15, 'Garuhapé', 'Misiones'),
(1496, 15, 'Garupá', 'Misiones'),
(1497, 15, 'Gdor. López', 'Misiones'),
(1498, 15, 'Gdor. Roca', 'Misiones'),
(1499, 15, 'Gral. Alvear', 'Misiones'),
(1500, 15, 'Gral. Urquiza', 'Misiones'),
(1501, 15, 'Guaraní', 'Misiones'),
(1502, 15, 'H. Yrigoyen', 'Misiones'),
(1503, 15, 'Iguazú', 'Misiones'),
(1504, 15, 'Itacaruaré', 'Misiones'),
(1505, 15, 'Jardín América', 'Misiones'),
(1506, 15, 'Leandro N. Alem', 'Misiones'),
(1507, 15, 'Libertad', 'Misiones'),
(1508, 15, 'Loreto', 'Misiones'),
(1509, 15, 'Los Helechos', 'Misiones'),
(1510, 15, 'Mártires', 'Misiones'),
(1511, 15, '15', 'Misiones'),
(1512, 15, 'Mojón Grande', 'Misiones'),
(1513, 15, 'Montecarlo', 'Misiones'),
(1514, 15, 'Nueve de Julio', 'Misiones'),
(1515, 15, 'Oberá', 'Misiones'),
(1516, 15, 'Olegario V. Andrade', 'Misiones'),
(1517, 15, 'Panambí', 'Misiones'),
(1518, 15, 'Posadas', 'Misiones'),
(1519, 15, 'Profundidad', 'Misiones'),
(1520, 15, 'Pto. Iguazú', 'Misiones'),
(1521, 15, 'Pto. Leoni', 'Misiones'),
(1522, 15, 'Pto. Piray', 'Misiones'),
(1523, 15, 'Pto. Rico', 'Misiones'),
(1524, 15, 'Ruiz de Montoya', 'Misiones'),
(1525, 15, 'San Antonio', 'Misiones'),
(1526, 15, 'San Ignacio', 'Misiones'),
(1527, 15, 'San Javier', 'Misiones'),
(1528, 15, 'San José', 'Misiones'),
(1529, 15, 'San Martín', 'Misiones'),
(1530, 15, 'San Pedro', 'Misiones'),
(1531, 15, 'San Vicente', 'Misiones'),
(1532, 15, 'Santiago De Liniers', 'Misiones'),
(1533, 15, 'Santo Pipo', 'Misiones'),
(1534, 15, 'Sta. Ana', 'Misiones'),
(1535, 15, 'Sta. María', 'Misiones'),
(1536, 15, 'Tres Capones', 'Misiones'),
(1537, 15, 'Veinticinco de Mayo', 'Misiones'),
(1538, 15, 'Wanda', 'Misiones'),
(1539, 16, 'Aguada San Roque', 'Neuquen'),
(1540, 16, 'Aluminé', 'Neuquen'),
(1541, 16, 'Andacollo', 'Neuquen'),
(1542, 16, 'Añelo', 'Neuquen'),
(1543, 16, 'Bajada del Agrio', 'Neuquen'),
(1544, 16, 'Barrancas', 'Neuquen'),
(1545, 16, 'Buta Ranquil', 'Neuquen'),
(1546, 16, 'Capital', 'Neuquen'),
(1547, 16, 'Caviahué', 'Neuquen'),
(1548, 16, 'Centenario', 'Neuquen'),
(1549, 16, 'Chorriaca', 'Neuquen'),
(1550, 16, 'Chos Malal', 'Neuquen'),
(1551, 16, 'Cipolletti', 'Neuquen'),
(1552, 16, 'Covunco Abajo', 'Neuquen'),
(1553, 16, 'Coyuco Cochico', 'Neuquen'),
(1554, 16, 'Cutral Có', 'Neuquen'),
(1555, 16, 'El Cholar', 'Neuquen'),
(1556, 16, 'El Huecú', 'Neuquen'),
(1557, 16, 'El Sauce', 'Neuquen'),
(1558, 16, 'Guañacos', 'Neuquen'),
(1559, 16, 'Huinganco', 'Neuquen'),
(1560, 16, 'Las Coloradas', 'Neuquen'),
(1561, 16, 'Las Lajas', 'Neuquen'),
(1562, 16, 'Las Ovejas', 'Neuquen'),
(1563, 16, 'Loncopué', 'Neuquen'),
(1564, 16, 'Los Catutos', 'Neuquen'),
(1565, 16, 'Los Chihuidos', 'Neuquen'),
(1566, 16, 'Los Miches', 'Neuquen'),
(1567, 16, 'Manzano Amargo', 'Neuquen'),
(1568, 16, '16', 'Neuquen'),
(1569, 16, 'Octavio Pico', 'Neuquen'),
(1570, 16, 'Paso Aguerre', 'Neuquen'),
(1571, 16, 'Picún Leufú', 'Neuquen'),
(1572, 16, 'Piedra del Aguila', 'Neuquen'),
(1573, 16, 'Pilo Lil', 'Neuquen'),
(1574, 16, 'Plaza Huincul', 'Neuquen'),
(1575, 16, 'Plottier', 'Neuquen'),
(1576, 16, 'Quili Malal', 'Neuquen'),
(1577, 16, 'Ramón Castro', 'Neuquen'),
(1578, 16, 'Rincón de Los Sauces', 'Neuquen'),
(1579, 16, 'San Martín de Los Andes', 'Neuquen'),
(1580, 16, 'San Patricio del Chañar', 'Neuquen'),
(1581, 16, 'Santo Tomás', 'Neuquen'),
(1582, 16, 'Sauzal Bonito', 'Neuquen'),
(1583, 16, 'Senillosa', 'Neuquen'),
(1584, 16, 'Taquimilán', 'Neuquen'),
(1585, 16, 'Tricao Malal', 'Neuquen'),
(1586, 16, 'Varvarco', 'Neuquen'),
(1587, 16, 'Villa Curí Leuvu', 'Neuquen'),
(1588, 16, 'Villa del Nahueve', 'Neuquen'),
(1589, 16, 'Villa del Puente Picún Leuvú', 'Neuquen'),
(1590, 16, 'Villa El Chocón', 'Neuquen'),
(1591, 16, 'Villa La Angostura', 'Neuquen'),
(1592, 16, 'Villa Pehuenia', 'Neuquen'),
(1593, 16, 'Villa Traful', 'Neuquen'),
(1594, 16, 'Vista Alegre', 'Neuquen'),
(1595, 16, 'Zapala', 'Neuquen'),
(1596, 17, 'Aguada Cecilio', 'Rio Negro'),
(1597, 17, 'Aguada de Guerra', 'Rio Negro'),
(1598, 17, 'Allén', 'Rio Negro'),
(1599, 17, 'Arroyo de La Ventana', 'Rio Negro'),
(1600, 17, 'Arroyo Los Berros', 'Rio Negro'),
(1601, 17, 'Bariloche', 'Rio Negro'),
(1602, 17, 'Calte. Cordero', 'Rio Negro'),
(1603, 17, 'Campo Grande', 'Rio Negro'),
(1604, 17, 'Catriel', 'Rio Negro'),
(1605, 17, 'Cerro Policía', 'Rio Negro'),
(1606, 17, 'Cervantes', 'Rio Negro'),
(1607, 17, 'Chelforo', 'Rio Negro'),
(1608, 17, 'Chimpay', 'Rio Negro'),
(1609, 17, 'Chinchinales', 'Rio Negro'),
(1610, 17, 'Chipauquil', 'Rio Negro'),
(1611, 17, 'Choele Choel', 'Rio Negro'),
(1612, 17, 'Cinco Saltos', 'Rio Negro'),
(1613, 17, 'Cipolletti', 'Rio Negro'),
(1614, 17, 'Clemente Onelli', 'Rio Negro'),
(1615, 17, 'Colán Conhue', 'Rio Negro'),
(1616, 17, 'Comallo', 'Rio Negro'),
(1617, 17, 'Comicó', 'Rio Negro'),
(1618, 17, 'Cona Niyeu', 'Rio Negro'),
(1619, 17, 'Coronel Belisle', 'Rio Negro'),
(1620, 17, 'Cubanea', 'Rio Negro'),
(1621, 17, 'Darwin', 'Rio Negro'),
(1622, 17, 'Dina Huapi', 'Rio Negro'),
(1623, 17, 'El Bolsón', 'Rio Negro'),
(1624, 17, 'El Caín', 'Rio Negro'),
(1625, 17, 'El Manso', 'Rio Negro'),
(1626, 17, 'Gral. Conesa', 'Rio Negro'),
(1627, 17, 'Gral. Enrique Godoy', 'Rio Negro'),
(1628, 17, 'Gral. Fernandez Oro', 'Rio Negro'),
(1629, 17, 'Gral. Roca', 'Rio Negro'),
(1630, 17, 'Guardia Mitre', 'Rio Negro'),
(1631, 17, 'Ing. Huergo', 'Rio Negro'),
(1632, 17, 'Ing. Jacobacci', 'Rio Negro'),
(1633, 17, 'Laguna Blanca', 'Rio Negro'),
(1634, 17, 'Lamarque', 'Rio Negro'),
(1635, 17, 'Las Grutas', 'Rio Negro'),
(1636, 17, 'Los Menucos', 'Rio Negro'),
(1637, 17, 'Luis Beltrán', 'Rio Negro'),
(1638, 17, 'Mainqué', 'Rio Negro'),
(1639, 17, 'Mamuel Choique', 'Rio Negro'),
(1640, 17, 'Maquinchao', 'Rio Negro'),
(1641, 17, 'Mencué', 'Rio Negro'),
(1642, 17, 'Mtro. Ramos Mexia', 'Rio Negro'),
(1643, 17, 'Nahuel Niyeu', 'Rio Negro'),
(1644, 17, 'Naupa Huen', 'Rio Negro'),
(1645, 17, 'Ñorquinco', 'Rio Negro'),
(1646, 17, 'Ojos de Agua', 'Rio Negro'),
(1647, 17, 'Paso de Agua', 'Rio Negro'),
(1648, 17, 'Paso Flores', 'Rio Negro'),
(1649, 17, 'Peñas Blancas', 'Rio Negro'),
(1650, 17, 'Pichi Mahuida', 'Rio Negro'),
(1651, 17, 'Pilcaniyeu', 'Rio Negro'),
(1652, 17, 'Pomona', 'Rio Negro'),
(1653, 17, 'Prahuaniyeu', 'Rio Negro'),
(1654, 17, 'Rincón Treneta', 'Rio Negro'),
(1655, 17, 'Río Chico', 'Rio Negro'),
(1656, 17, 'Río Colorado', 'Rio Negro'),
(1657, 17, 'Roca', 'Rio Negro'),
(1658, 17, 'San Antonio Oeste', 'Rio Negro'),
(1659, 17, 'San Javier', 'Rio Negro'),
(1660, 17, 'Sierra Colorada', 'Rio Negro'),
(1661, 17, 'Sierra Grande', 'Rio Negro'),
(1662, 17, 'Sierra Pailemán', 'Rio Negro'),
(1663, 17, 'Valcheta', 'Rio Negro'),
(1664, 17, 'Valle Azul', 'Rio Negro'),
(1665, 17, 'Viedma', 'Rio Negro'),
(1666, 17, 'Villa Llanquín', 'Rio Negro'),
(1667, 17, 'Villa Mascardi', 'Rio Negro'),
(1668, 17, 'Villa Regina', 'Rio Negro'),
(1669, 17, 'Yaminué', 'Rio Negro'),
(1670, 18, 'A. Saravia', 'Salta'),
(1671, 18, 'Aguaray', 'Salta'),
(1672, 18, 'Angastaco', 'Salta'),
(1673, 18, 'Animaná', 'Salta'),
(1674, 18, 'Cachi', 'Salta'),
(1675, 18, 'Cafayate', 'Salta'),
(1676, 18, 'Campo Quijano', 'Salta'),
(1677, 18, 'Campo Santo', 'Salta'),
(1678, 18, 'Capital', 'Salta'),
(1679, 18, 'Cerrillos', 'Salta'),
(1680, 18, 'Chicoana', 'Salta'),
(1681, 18, 'Col. Sta. Rosa', 'Salta'),
(1682, 18, 'Coronel Moldes', 'Salta'),
(1683, 18, 'El Bordo', 'Salta'),
(1684, 18, 'El Carril', 'Salta'),
(1685, 18, 'El Galpón', 'Salta'),
(1686, 18, 'El Jardín', 'Salta'),
(1687, 18, 'El Potrero', 'Salta'),
(1688, 18, 'El Quebrachal', 'Salta'),
(1689, 18, 'El Tala', 'Salta'),
(1690, 18, 'Embarcación', 'Salta'),
(1691, 18, 'Gral. Ballivian', 'Salta'),
(1692, 18, 'Gral. Güemes', 'Salta'),
(1693, 18, 'Gral. Mosconi', 'Salta'),
(1694, 18, 'Gral. Pizarro', 'Salta'),
(1695, 18, 'Guachipas', 'Salta'),
(1696, 18, 'Hipólito Yrigoyen', 'Salta'),
(1697, 18, 'Iruyá', 'Salta'),
(1698, 18, 'Isla De Cañas', 'Salta'),
(1699, 18, 'J. V. Gonzalez', 'Salta'),
(1700, 18, 'La Caldera', 'Salta'),
(1701, 18, 'La Candelaria', 'Salta'),
(1702, 18, 'La Merced', 'Salta'),
(1703, 18, 'La Poma', 'Salta'),
(1704, 18, 'La Viña', 'Salta'),
(1705, 18, 'Las Lajitas', 'Salta'),
(1706, 18, 'Los Toldos', 'Salta'),
(1707, 18, 'Metán', 'Salta'),
(1708, 18, 'Molinos', 'Salta'),
(1709, 18, 'Nazareno', 'Salta'),
(1710, 18, 'Orán', 'Salta'),
(1711, 18, 'Payogasta', 'Salta'),
(1712, 18, 'Pichanal', 'Salta'),
(1713, 18, 'Prof. S. Mazza', 'Salta'),
(1714, 18, 'Río Piedras', 'Salta'),
(1715, 18, 'Rivadavia Banda Norte', 'Salta'),
(1716, 18, 'Rivadavia Banda Sur', 'Salta'),
(1717, 18, 'Rosario de La Frontera', 'Salta'),
(1718, 18, 'Rosario de Lerma', 'Salta'),
(1719, 18, 'Saclantás', 'Salta'),
(1720, 18, '18', 'Salta'),
(1721, 18, 'San Antonio', 'Salta'),
(1722, 18, 'San Carlos', 'Salta'),
(1723, 18, 'San José De Metán', 'Salta'),
(1724, 18, 'San Ramón', 'Salta'),
(1725, 18, 'Santa Victoria E.', 'Salta'),
(1726, 18, 'Santa Victoria O.', 'Salta'),
(1727, 18, 'Tartagal', 'Salta'),
(1728, 18, 'Tolar Grande', 'Salta'),
(1729, 18, 'Urundel', 'Salta'),
(1730, 18, 'Vaqueros', 'Salta'),
(1731, 18, 'Villa San Lorenzo', 'Salta'),
(1732, 19, 'Albardón', 'San Juan'),
(1733, 19, 'Angaco', 'San Juan'),
(1734, 19, 'Calingasta', 'San Juan'),
(1735, 19, 'Capital', 'San Juan'),
(1736, 19, 'Caucete', 'San Juan'),
(1737, 19, 'Chimbas', 'San Juan'),
(1738, 19, 'Iglesia', 'San Juan'),
(1739, 19, 'Jachal', 'San Juan'),
(1740, 19, 'Nueve de Julio', 'San Juan'),
(1741, 19, 'Pocito', 'San Juan'),
(1742, 19, 'Rawson', 'San Juan'),
(1743, 19, 'Rivadavia', 'San Juan'),
(1744, 19, '19', 'San Juan'),
(1745, 19, 'San Martín', 'San Juan'),
(1746, 19, 'Santa Lucía', 'San Juan'),
(1747, 19, 'Sarmiento', 'San Juan'),
(1748, 19, 'Ullum', 'San Juan'),
(1749, 19, 'Valle Fértil', 'San Juan'),
(1750, 19, 'Veinticinco de Mayo', 'San Juan'),
(1751, 19, 'Zonda', 'San Juan'),
(1752, 20, 'Alto Pelado', 'San Luis'),
(1753, 20, 'Alto Pencoso', 'San Luis'),
(1754, 20, 'Anchorena', 'San Luis'),
(1755, 20, 'Arizona', 'San Luis'),
(1756, 20, 'Bagual', 'San Luis'),
(1757, 20, 'Balde', 'San Luis'),
(1758, 20, 'Batavia', 'San Luis'),
(1759, 20, 'Beazley', 'San Luis'),
(1760, 20, 'Buena Esperanza', 'San Luis'),
(1761, 20, 'Candelaria', 'San Luis'),
(1762, 20, 'Capital', 'San Luis'),
(1763, 20, 'Carolina', 'San Luis'),
(1764, 20, 'Carpintería', 'San Luis'),
(1765, 20, 'Concarán', 'San Luis'),
(1766, 20, 'Cortaderas', 'San Luis'),
(1767, 20, 'El Morro', 'San Luis'),
(1768, 20, 'El Trapiche', 'San Luis'),
(1769, 20, 'El Volcán', 'San Luis'),
(1770, 20, 'Fortín El Patria', 'San Luis'),
(1771, 20, 'Fortuna', 'San Luis'),
(1772, 20, 'Fraga', 'San Luis'),
(1773, 20, 'Juan Jorba', 'San Luis'),
(1774, 20, 'Juan Llerena', 'San Luis'),
(1775, 20, 'Juana Koslay', 'San Luis'),
(1776, 20, 'Justo Daract', 'San Luis'),
(1777, 20, 'La Calera', 'San Luis'),
(1778, 20, 'La Florida', 'San Luis'),
(1779, 20, 'La Punilla', 'San Luis'),
(1780, 20, 'La Toma', 'San Luis'),
(1781, 20, 'Lafinur', 'San Luis'),
(1782, 20, 'Las Aguadas', 'San Luis'),
(1783, 20, 'Las Chacras', 'San Luis'),
(1784, 20, 'Las Lagunas', 'San Luis'),
(1785, 20, 'Las Vertientes', 'San Luis'),
(1786, 20, 'Lavaisse', 'San Luis'),
(1787, 20, 'Leandro N. Alem', 'San Luis'),
(1788, 20, 'Los Molles', 'San Luis'),
(1789, 20, 'Luján', 'San Luis'),
(1790, 20, 'Mercedes', 'San Luis'),
(1791, 20, 'Merlo', 'San Luis'),
(1792, 20, 'Naschel', 'San Luis'),
(1793, 20, 'Navia', 'San Luis'),
(1794, 20, 'Nogolí', 'San Luis'),
(1795, 20, 'Nueva Galia', 'San Luis'),
(1796, 20, 'Papagayos', 'San Luis'),
(1797, 20, 'Paso Grande', 'San Luis'),
(1798, 20, 'Potrero de Los Funes', 'San Luis'),
(1799, 20, 'Quines', 'San Luis'),
(1800, 20, 'Renca', 'San Luis'),
(1801, 20, 'Saladillo', 'San Luis'),
(1802, 20, 'San Francisco', 'San Luis'),
(1803, 20, 'San Gerónimo', 'San Luis'),
(1804, 20, 'San Martín', 'San Luis'),
(1805, 20, 'San Pablo', 'San Luis'),
(1806, 20, 'Santa Rosa de Conlara', 'San Luis'),
(1807, 20, 'Talita', 'San Luis'),
(1808, 20, 'Tilisarao', 'San Luis'),
(1809, 20, 'Unión', 'San Luis'),
(1810, 20, 'Villa de La Quebrada', 'San Luis'),
(1811, 20, 'Villa de Praga', 'San Luis'),
(1812, 20, 'Villa del Carmen', 'San Luis'),
(1813, 20, 'Villa Gral. Roca', 'San Luis'),
(1814, 20, 'Villa Larca', 'San Luis'),
(1815, 20, 'Villa Mercedes', 'San Luis'),
(1816, 20, 'Zanjitas', 'San Luis'),
(1817, 21, 'Calafate', 'Santa Cruz'),
(1818, 21, 'Caleta Olivia', 'Santa Cruz'),
(1819, 21, 'Cañadón Seco', 'Santa Cruz'),
(1820, 21, 'Comandante Piedrabuena', 'Santa Cruz'),
(1821, 21, 'El Calafate', 'Santa Cruz'),
(1822, 21, 'El Chaltén', 'Santa Cruz'),
(1823, 21, 'Gdor. Gregores', 'Santa Cruz'),
(1824, 21, 'Hipólito Yrigoyen', 'Santa Cruz'),
(1825, 21, 'Jaramillo', 'Santa Cruz'),
(1826, 21, 'Koluel Kaike', 'Santa Cruz'),
(1827, 21, 'Las Heras', 'Santa Cruz'),
(1828, 21, 'Los Antiguos', 'Santa Cruz'),
(1829, 21, 'Perito Moreno', 'Santa Cruz'),
(1830, 21, 'Pico Truncado', 'Santa Cruz'),
(1831, 21, 'Pto. Deseado', 'Santa Cruz'),
(1832, 21, 'Pto. San Julián', 'Santa Cruz'),
(1833, 21, 'Pto. 21', 'Santa Cruz'),
(1834, 21, 'Río Cuarto', 'Santa Cruz'),
(1835, 21, 'Río Gallegos', 'Santa Cruz'),
(1836, 21, 'Río Turbio', 'Santa Cruz'),
(1837, 21, 'Tres Lagos', 'Santa Cruz'),
(1838, 21, 'Veintiocho De Noviembre', 'Santa Cruz'),
(1839, 22, 'Aarón Castellanos', 'Santa Fe'),
(1840, 22, 'Acebal', 'Santa Fe'),
(1841, 22, 'Aguará Grande', 'Santa Fe'),
(1842, 22, 'Albarellos', 'Santa Fe'),
(1843, 22, 'Alcorta', 'Santa Fe'),
(1844, 22, 'Aldao', 'Santa Fe'),
(1845, 22, 'Alejandra', 'Santa Fe'),
(1846, 22, 'Álvarez', 'Santa Fe'),
(1847, 22, 'Ambrosetti', 'Santa Fe'),
(1848, 22, 'Amenábar', 'Santa Fe'),
(1849, 22, 'Angélica', 'Santa Fe'),
(1850, 22, 'Angeloni', 'Santa Fe'),
(1851, 22, 'Arequito', 'Santa Fe'),
(1852, 22, 'Arminda', 'Santa Fe'),
(1853, 22, 'Armstrong', 'Santa Fe'),
(1854, 22, 'Arocena', 'Santa Fe'),
(1855, 22, 'Arroyo Aguiar', 'Santa Fe'),
(1856, 22, 'Arroyo Ceibal', 'Santa Fe'),
(1857, 22, 'Arroyo Leyes', 'Santa Fe'),
(1858, 22, 'Arroyo Seco', 'Santa Fe'),
(1859, 22, 'Arrufó', 'Santa Fe'),
(1860, 22, 'Arteaga', 'Santa Fe'),
(1861, 22, 'Ataliva', 'Santa Fe'),
(1862, 22, 'Aurelia', 'Santa Fe'),
(1863, 22, 'Avellaneda', 'Santa Fe'),
(1864, 22, 'Barrancas', 'Santa Fe'),
(1865, 22, 'Bauer Y Sigel', 'Santa Fe'),
(1866, 22, 'Bella Italia', 'Santa Fe'),
(1867, 22, 'Berabevú', 'Santa Fe'),
(1868, 22, 'Berna', 'Santa Fe'),
(1869, 22, 'Bernardo de Irigoyen', 'Santa Fe'),
(1870, 22, 'Bigand', 'Santa Fe'),
(1871, 22, 'Bombal', 'Santa Fe'),
(1872, 22, 'Bouquet', 'Santa Fe'),
(1873, 22, 'Bustinza', 'Santa Fe'),
(1874, 22, 'Cabal', 'Santa Fe'),
(1875, 22, 'Cacique Ariacaiquin', 'Santa Fe'),
(1876, 22, 'Cafferata', 'Santa Fe'),
(1877, 22, 'Calchaquí', 'Santa Fe'),
(1878, 22, 'Campo Andino', 'Santa Fe'),
(1879, 22, 'Campo Piaggio', 'Santa Fe'),
(1880, 22, 'Cañada de Gómez', 'Santa Fe'),
(1881, 22, 'Cañada del Ucle', 'Santa Fe'),
(1882, 22, 'Cañada Rica', 'Santa Fe'),
(1883, 22, 'Cañada Rosquín', 'Santa Fe'),
(1884, 22, 'Candioti', 'Santa Fe'),
(1885, 22, 'Capital', 'Santa Fe'),
(1886, 22, 'Capitán Bermúdez', 'Santa Fe'),
(1887, 22, 'Capivara', 'Santa Fe'),
(1888, 22, 'Carcarañá', 'Santa Fe'),
(1889, 22, 'Carlos Pellegrini', 'Santa Fe'),
(1890, 22, 'Carmen', 'Santa Fe'),
(1891, 22, 'Carmen Del Sauce', 'Santa Fe'),
(1892, 22, 'Carreras', 'Santa Fe'),
(1893, 22, 'Carrizales', 'Santa Fe'),
(1894, 22, 'Casalegno', 'Santa Fe'),
(1895, 22, 'Casas', 'Santa Fe'),
(1896, 22, 'Casilda', 'Santa Fe'),
(1897, 22, 'Castelar', 'Santa Fe'),
(1898, 22, 'Castellanos', 'Santa Fe'),
(1899, 22, 'Cayastá', 'Santa Fe'),
(1900, 22, 'Cayastacito', 'Santa Fe'),
(1901, 22, 'Centeno', 'Santa Fe'),
(1902, 22, 'Cepeda', 'Santa Fe'),
(1903, 22, 'Ceres', 'Santa Fe'),
(1904, 22, 'Chabás', 'Santa Fe'),
(1905, 22, 'Chañar Ladeado', 'Santa Fe'),
(1906, 22, 'Chapuy', 'Santa Fe'),
(1907, 22, 'Chovet', 'Santa Fe'),
(1908, 22, 'Christophersen', 'Santa Fe'),
(1909, 22, 'Classon', 'Santa Fe'),
(1910, 22, 'Cnel. Arnold', 'Santa Fe'),
(1911, 22, 'Cnel. Bogado', 'Santa Fe'),
(1912, 22, 'Cnel. Dominguez', 'Santa Fe'),
(1913, 22, 'Cnel. Fraga', 'Santa Fe'),
(1914, 22, 'Col. Aldao', 'Santa Fe'),
(1915, 22, 'Col. Ana', 'Santa Fe'),
(1916, 22, 'Col. Belgrano', 'Santa Fe'),
(1917, 22, 'Col. Bicha', 'Santa Fe'),
(1918, 22, 'Col. Bigand', 'Santa Fe'),
(1919, 22, 'Col. Bossi', 'Santa Fe'),
(1920, 22, 'Col. Cavour', 'Santa Fe'),
(1921, 22, 'Col. Cello', 'Santa Fe'),
(1922, 22, 'Col. Dolores', 'Santa Fe'),
(1923, 22, 'Col. Dos Rosas', 'Santa Fe'),
(1924, 22, 'Col. Durán', 'Santa Fe'),
(1925, 22, 'Col. Iturraspe', 'Santa Fe'),
(1926, 22, 'Col. Margarita', 'Santa Fe'),
(1927, 22, 'Col. Mascias', 'Santa Fe'),
(1928, 22, 'Col. Raquel', 'Santa Fe'),
(1929, 22, 'Col. Rosa', 'Santa Fe'),
(1930, 22, 'Col. San José', 'Santa Fe'),
(1931, 22, 'Constanza', 'Santa Fe'),
(1932, 22, 'Coronda', 'Santa Fe'),
(1933, 22, 'Correa', 'Santa Fe'),
(1934, 22, 'Crispi', 'Santa Fe'),
(1935, 22, 'Cululú', 'Santa Fe'),
(1936, 22, 'Curupayti', 'Santa Fe'),
(1937, 22, 'Desvio Arijón', 'Santa Fe'),
(1938, 22, 'Diaz', 'Santa Fe'),
(1939, 22, 'Diego de Alvear', 'Santa Fe'),
(1940, 22, 'Egusquiza', 'Santa Fe'),
(1941, 22, 'El Arazá', 'Santa Fe'),
(1942, 22, 'El Rabón', 'Santa Fe'),
(1943, 22, 'El Sombrerito', 'Santa Fe'),
(1944, 22, 'El Trébol', 'Santa Fe'),
(1945, 22, 'Elisa', 'Santa Fe'),
(1946, 22, 'Elortondo', 'Santa Fe'),
(1947, 22, 'Emilia', 'Santa Fe'),
(1948, 22, 'Empalme San Carlos', 'Santa Fe'),
(1949, 22, 'Empalme Villa Constitucion', 'Santa Fe'),
(1950, 22, 'Esmeralda', 'Santa Fe'),
(1951, 22, 'Esperanza', 'Santa Fe'),
(1952, 22, 'Estación Alvear', 'Santa Fe'),
(1953, 22, 'Estacion Clucellas', 'Santa Fe'),
(1954, 22, 'Esteban Rams', 'Santa Fe'),
(1955, 22, 'Esther', 'Santa Fe'),
(1956, 22, 'Esustolia', 'Santa Fe'),
(1957, 22, 'Eusebia', 'Santa Fe'),
(1958, 22, 'Felicia', 'Santa Fe'),
(1959, 22, 'Fidela', 'Santa Fe'),
(1960, 22, 'Fighiera', 'Santa Fe'),
(1961, 22, 'Firmat', 'Santa Fe'),
(1962, 22, 'Florencia', 'Santa Fe'),
(1963, 22, 'Fortín Olmos', 'Santa Fe'),
(1964, 22, 'Franck', 'Santa Fe'),
(1965, 22, 'Fray Luis Beltrán', 'Santa Fe'),
(1966, 22, 'Frontera', 'Santa Fe'),
(1967, 22, 'Fuentes', 'Santa Fe'),
(1968, 22, 'Funes', 'Santa Fe'),
(1969, 22, 'Gaboto', 'Santa Fe'),
(1970, 22, 'Galisteo', 'Santa Fe'),
(1971, 22, 'Gálvez', 'Santa Fe'),
(1972, 22, 'Garabalto', 'Santa Fe'),
(1973, 22, 'Garibaldi', 'Santa Fe'),
(1974, 22, 'Gato Colorado', 'Santa Fe'),
(1975, 22, 'Gdor. Crespo', 'Santa Fe'),
(1976, 22, 'Gessler', 'Santa Fe'),
(1977, 22, 'Godoy', 'Santa Fe'),
(1978, 22, 'Golondrina', 'Santa Fe'),
(1979, 22, 'Gral. Gelly', 'Santa Fe'),
(1980, 22, 'Gral. Lagos', 'Santa Fe'),
(1981, 22, 'Granadero Baigorria', 'Santa Fe'),
(1982, 22, 'Gregoria Perez De Denis', 'Santa Fe'),
(1983, 22, 'Grutly', 'Santa Fe'),
(1984, 22, 'Guadalupe N.', 'Santa Fe'),
(1985, 22, 'Gödeken', 'Santa Fe'),
(1986, 22, 'Helvecia', 'Santa Fe'),
(1987, 22, 'Hersilia', 'Santa Fe'),
(1988, 22, 'Hipatía', 'Santa Fe'),
(1989, 22, 'Huanqueros', 'Santa Fe'),
(1990, 22, 'Hugentobler', 'Santa Fe'),
(1991, 22, 'Hughes', 'Santa Fe'),
(1992, 22, 'Humberto 1º', 'Santa Fe'),
(1993, 22, 'Humboldt', 'Santa Fe'),
(1994, 22, 'Ibarlucea', 'Santa Fe'),
(1995, 22, 'Ing. Chanourdie', 'Santa Fe'),
(1996, 22, 'Intiyaco', 'Santa Fe'),
(1997, 22, 'Ituzaingó', 'Santa Fe'),
(1998, 22, 'Jacinto L. Aráuz', 'Santa Fe'),
(1999, 22, 'Josefina', 'Santa Fe'),
(2000, 22, 'Juan B. Molina', 'Santa Fe'),
(2001, 22, 'Juan de Garay', 'Santa Fe'),
(2002, 22, 'Juncal', 'Santa Fe'),
(2003, 22, 'La Brava', 'Santa Fe'),
(2004, 22, 'La Cabral', 'Santa Fe'),
(2005, 22, 'La Camila', 'Santa Fe'),
(2006, 22, 'La Chispa', 'Santa Fe'),
(2007, 22, 'La Clara', 'Santa Fe'),
(2008, 22, 'La Criolla', 'Santa Fe'),
(2009, 22, 'La Gallareta', 'Santa Fe'),
(2010, 22, 'La Lucila', 'Santa Fe'),
(2011, 22, 'La Pelada', 'Santa Fe'),
(2012, 22, 'La Penca', 'Santa Fe'),
(2013, 22, 'La Rubia', 'Santa Fe'),
(2014, 22, 'La Sarita', 'Santa Fe'),
(2015, 22, 'La Vanguardia', 'Santa Fe'),
(2016, 22, 'Labordeboy', 'Santa Fe'),
(2017, 22, 'Laguna Paiva', 'Santa Fe'),
(2018, 22, 'Landeta', 'Santa Fe'),
(2019, 22, 'Lanteri', 'Santa Fe'),
(2020, 22, 'Larrechea', 'Santa Fe'),
(2021, 22, 'Las Avispas', 'Santa Fe'),
(2022, 22, 'Las Bandurrias', 'Santa Fe'),
(2023, 22, 'Las Garzas', 'Santa Fe'),
(2024, 22, 'Las Palmeras', 'Santa Fe'),
(2025, 22, 'Las Parejas', 'Santa Fe'),
(2026, 22, 'Las Petacas', 'Santa Fe'),
(2027, 22, 'Las Rosas', 'Santa Fe'),
(2028, 22, 'Las Toscas', 'Santa Fe'),
(2029, 22, 'Las Tunas', 'Santa Fe'),
(2030, 22, 'Lazzarino', 'Santa Fe'),
(2031, 22, 'Lehmann', 'Santa Fe'),
(2032, 22, 'Llambi Campbell', 'Santa Fe'),
(2033, 22, 'Logroño', 'Santa Fe'),
(2034, 22, 'Loma Alta', 'Santa Fe'),
(2035, 22, 'López', 'Santa Fe'),
(2036, 22, 'Los Amores', 'Santa Fe'),
(2037, 22, 'Los Cardos', 'Santa Fe'),
(2038, 22, 'Los Laureles', 'Santa Fe'),
(2039, 22, 'Los Molinos', 'Santa Fe'),
(2040, 22, 'Los Quirquinchos', 'Santa Fe'),
(2041, 22, 'Lucio V. Lopez', 'Santa Fe'),
(2042, 22, 'Luis Palacios', 'Santa Fe'),
(2043, 22, 'Ma. Juana', 'Santa Fe'),
(2044, 22, 'Ma. Luisa', 'Santa Fe'),
(2045, 22, 'Ma. Susana', 'Santa Fe'),
(2046, 22, 'Ma. Teresa', 'Santa Fe'),
(2047, 22, 'Maciel', 'Santa Fe'),
(2048, 22, 'Maggiolo', 'Santa Fe'),
(2049, 22, 'Malabrigo', 'Santa Fe'),
(2050, 22, 'Marcelino Escalada', 'Santa Fe'),
(2051, 22, 'Margarita', 'Santa Fe'),
(2052, 22, 'Matilde', 'Santa Fe'),
(2053, 22, 'Mauá', 'Santa Fe'),
(2054, 22, 'Máximo Paz', 'Santa Fe'),
(2055, 22, 'Melincué', 'Santa Fe'),
(2056, 22, 'Miguel Torres', 'Santa Fe'),
(2057, 22, 'Moisés Ville', 'Santa Fe'),
(2058, 22, 'Monigotes', 'Santa Fe'),
(2059, 22, 'Monje', 'Santa Fe'),
(2060, 22, 'Monte Obscuridad', 'Santa Fe'),
(2061, 22, 'Monte Vera', 'Santa Fe'),
(2062, 22, 'Montefiore', 'Santa Fe'),
(2063, 22, 'Montes de Oca', 'Santa Fe'),
(2064, 22, 'Murphy', 'Santa Fe'),
(2065, 22, 'Ñanducita', 'Santa Fe'),
(2066, 22, 'Naré', 'Santa Fe'),
(2067, 22, 'Nelson', 'Santa Fe'),
(2068, 22, 'Nicanor E. Molinas', 'Santa Fe'),
(2069, 22, 'Nuevo Torino', 'Santa Fe'),
(2070, 22, 'Oliveros', 'Santa Fe'),
(2071, 22, 'Palacios', 'Santa Fe'),
(2072, 22, 'Pavón', 'Santa Fe'),
(2073, 22, 'Pavón Arriba', 'Santa Fe'),
(2199, 23, 'Añatuya', 'Santiago del Estero'),
(2200, 23, 'Árraga', 'Santiago del Estero'),
(2201, 23, 'Bandera', 'Santiago del Estero'),
(2202, 23, 'Bandera Bajada', 'Santiago del Estero'),
(2203, 23, 'Beltrán', 'Santiago del Estero'),
(2204, 23, 'Brea Pozo', 'Santiago del Estero'),
(2205, 23, 'Campo Gallo', 'Santiago del Estero'),
(2206, 23, 'Capital', 'Santiago del Estero'),
(2207, 23, 'Chilca Juliana', 'Santiago del Estero'),
(2208, 23, 'Choya', 'Santiago del Estero'),
(2209, 23, 'Clodomira', 'Santiago del Estero'),
(2210, 23, 'Col. Alpina', 'Santiago del Estero'),
(2211, 23, 'Col. Dora', 'Santiago del Estero'),
(2212, 23, 'Col. El Simbolar Robles', 'Santiago del Estero'),
(2213, 23, 'El Bobadal', 'Santiago del Estero'),
(2214, 23, 'El Charco', 'Santiago del Estero'),
(2215, 23, 'El Mojón', 'Santiago del Estero'),
(2216, 23, 'Estación Atamisqui', 'Santiago del Estero'),
(2217, 23, 'Estación Simbolar', 'Santiago del Estero'),
(2218, 23, 'Fernández', 'Santiago del Estero'),
(2219, 23, 'Fortín Inca', 'Santiago del Estero'),
(2220, 23, 'Frías', 'Santiago del Estero'),
(2221, 23, 'Garza', 'Santiago del Estero'),
(2222, 23, 'Gramilla', 'Santiago del Estero'),
(2223, 23, 'Guardia Escolta', 'Santiago del Estero'),
(2224, 23, 'Herrera', 'Santiago del Estero'),
(2225, 23, 'Icaño', 'Santiago del Estero'),
(2226, 23, 'Ing. Forres', 'Santiago del Estero'),
(2227, 23, 'La Banda', 'Santiago del Estero'),
(2228, 23, 'La Cañada', 'Santiago del Estero'),
(2229, 23, 'Laprida', 'Santiago del Estero'),
(2230, 23, 'Lavalle', 'Santiago del Estero'),
(2231, 23, 'Loreto', 'Santiago del Estero'),
(2232, 23, 'Los Juríes', 'Santiago del Estero'),
(2233, 23, 'Los Núñez', 'Santiago del Estero'),
(2234, 23, 'Los Pirpintos', 'Santiago del Estero'),
(2235, 23, 'Los Quiroga', 'Santiago del Estero'),
(2236, 23, 'Los Telares', 'Santiago del Estero'),
(2237, 23, 'Lugones', 'Santiago del Estero'),
(2238, 23, 'Malbrán', 'Santiago del Estero'),
(2239, 23, 'Matara', 'Santiago del Estero'),
(2240, 23, 'Medellín', 'Santiago del Estero'),
(2241, 23, 'Monte Quemado', 'Santiago del Estero'),
(2242, 23, 'Nueva Esperanza', 'Santiago del Estero'),
(2243, 23, 'Nueva Francia', 'Santiago del Estero'),
(2244, 23, 'Palo Negro', 'Santiago del Estero'),
(2245, 23, 'Pampa de Los Guanacos', 'Santiago del Estero'),
(2246, 23, 'Pinto', 'Santiago del Estero'),
(2247, 23, 'Pozo Hondo', 'Santiago del Estero'),
(2248, 23, 'Quimilí', 'Santiago del Estero'),
(2249, 23, 'Real Sayana', 'Santiago del Estero'),
(2250, 23, 'Sachayoj', 'Santiago del Estero'),
(2251, 23, 'San Pedro de Guasayán', 'Santiago del Estero'),
(2252, 23, 'Selva', 'Santiago del Estero'),
(2253, 23, 'Sol de Julio', 'Santiago del Estero'),
(2254, 23, 'Sumampa', 'Santiago del Estero'),
(2255, 23, 'Suncho Corral', 'Santiago del Estero'),
(2256, 23, 'Taboada', 'Santiago del Estero'),
(2257, 23, 'Tapso', 'Santiago del Estero'),
(2258, 23, 'Termas de Rio Hondo', 'Santiago del Estero'),
(2259, 23, 'Tintina', 'Santiago del Estero'),
(2260, 23, 'Tomas Young', 'Santiago del Estero'),
(2261, 23, 'Vilelas', 'Santiago del Estero'),
(2262, 23, 'Villa Atamisqui', 'Santiago del Estero'),
(2263, 23, 'Villa La Punta', 'Santiago del Estero'),
(2264, 23, 'Villa Ojo de Agua', 'Santiago del Estero'),
(2265, 23, 'Villa Río Hondo', 'Santiago del Estero'),
(2266, 23, 'Villa Salavina', 'Santiago del Estero'),
(2267, 23, 'Villa Unión', 'Santiago del Estero'),
(2268, 23, 'Vilmer', 'Santiago del Estero'),
(2269, 23, 'Weisburd', 'Santiago del Estero'),
(2270, 24, 'Río Grande', 'Tierra del Fuego'),
(2271, 24, 'Tolhuin', 'Tierra del Fuego'),
(2272, 24, 'Ushuaia', 'Tierra del Fuego'),
(2273, 25, 'Acheral', 'Tucuman'),
(2274, 25, 'Agua Dulce', 'Tucuman'),
(2275, 25, 'Aguilares', 'Tucuman'),
(2276, 25, 'Alderetes', 'Tucuman'),
(2277, 25, 'Alpachiri', 'Tucuman'),
(2278, 25, 'Alto Verde', 'Tucuman'),
(2279, 25, 'Amaicha del Valle', 'Tucuman'),
(2280, 25, 'Amberes', 'Tucuman'),
(2281, 25, 'Ancajuli', 'Tucuman'),
(2282, 25, 'Arcadia', 'Tucuman'),
(2283, 25, 'Atahona', 'Tucuman'),
(2284, 25, 'Banda del Río Sali', 'Tucuman'),
(2285, 25, 'Bella Vista', 'Tucuman'),
(2286, 25, 'Buena Vista', 'Tucuman'),
(2287, 25, 'Burruyacú', 'Tucuman'),
(2288, 25, 'Capitán Cáceres', 'Tucuman'),
(2289, 25, 'Cevil Redondo', 'Tucuman'),
(2290, 25, 'Choromoro', 'Tucuman'),
(2291, 25, 'Ciudacita', 'Tucuman'),
(2292, 25, 'Colalao del Valle', 'Tucuman'),
(2293, 25, 'Colombres', 'Tucuman'),
(2294, 25, 'Concepción', 'Tucuman'),
(2295, 25, 'Delfín Gallo', 'Tucuman'),
(2296, 25, 'El Bracho', 'Tucuman'),
(2297, 25, 'El Cadillal', 'Tucuman'),
(2298, 25, 'El Cercado', 'Tucuman'),
(2299, 25, 'El Chañar', 'Tucuman'),
(2300, 25, 'El Manantial', 'Tucuman'),
(2301, 25, 'El Mojón', 'Tucuman'),
(2302, 25, 'El Mollar', 'Tucuman'),
(2303, 25, 'El Naranjito', 'Tucuman'),
(2304, 25, 'El Naranjo', 'Tucuman'),
(2305, 25, 'El Polear', 'Tucuman'),
(2306, 25, 'El Puestito', 'Tucuman'),
(2307, 25, 'El Sacrificio', 'Tucuman'),
(2308, 25, 'El Timbó', 'Tucuman'),
(2309, 25, 'Escaba', 'Tucuman'),
(2310, 25, 'Esquina', 'Tucuman'),
(2311, 25, 'Estación Aráoz', 'Tucuman'),
(2312, 25, 'Famaillá', 'Tucuman'),
(2313, 25, 'Gastone', 'Tucuman'),
(2314, 25, 'Gdor. Garmendia', 'Tucuman'),
(2315, 25, 'Gdor. Piedrabuena', 'Tucuman'),
(2316, 25, 'Graneros', 'Tucuman'),
(2317, 25, 'Huasa Pampa', 'Tucuman'),
(2318, 25, 'J. B. Alberdi', 'Tucuman'),
(2319, 25, 'La Cocha', 'Tucuman'),
(2320, 25, 'La Esperanza', 'Tucuman'),
(2321, 25, 'La Florida', 'Tucuman'),
(2322, 25, 'La Ramada', 'Tucuman'),
(2323, 25, 'La Trinidad', 'Tucuman'),
(2324, 25, 'Lamadrid', 'Tucuman'),
(2325, 25, 'Las Cejas', 'Tucuman'),
(2326, 25, 'Las Talas', 'Tucuman'),
(2327, 25, 'Las Talitas', 'Tucuman'),
(2328, 25, 'Los Bulacio', 'Tucuman'),
(2329, 25, 'Los Gómez', 'Tucuman'),
(2330, 25, 'Los Nogales', 'Tucuman'),
(2331, 25, 'Los Pereyra', 'Tucuman'),
(2332, 25, 'Los Pérez', 'Tucuman'),
(2333, 25, 'Los Puestos', 'Tucuman'),
(2334, 25, 'Los Ralos', 'Tucuman'),
(2335, 25, 'Los Sarmientos', 'Tucuman'),
(2336, 25, 'Los Sosa', 'Tucuman'),
(2337, 25, 'Lules', 'Tucuman'),
(2338, 25, 'M. García Fernández', 'Tucuman'),
(2339, 25, 'Manuela Pedraza', 'Tucuman'),
(2340, 25, 'Medinas', 'Tucuman'),
(2341, 25, 'Monte Bello', 'Tucuman'),
(2342, 25, 'Monteagudo', 'Tucuman'),
(2343, 25, 'Monteros', 'Tucuman'),
(2344, 25, 'Padre Monti', 'Tucuman'),
(2345, 25, 'Pampa Mayo', 'Tucuman'),
(2346, 25, 'Quilmes', 'Tucuman'),
(2347, 25, 'Raco', 'Tucuman'),
(2348, 25, 'Ranchillos', 'Tucuman'),
(2349, 25, 'Río Chico', 'Tucuman'),
(2350, 25, 'Río Colorado', 'Tucuman'),
(2351, 25, 'Río Seco', 'Tucuman'),
(2352, 25, 'Rumi Punco', 'Tucuman'),
(2353, 25, 'San Andrés', 'Tucuman'),
(2354, 25, 'San Felipe', 'Tucuman'),
(2355, 25, 'San Ignacio', 'Tucuman'),
(2356, 25, 'San Javier', 'Tucuman'),
(2357, 25, 'San José', 'Tucuman'),
(2358, 25, 'San Miguel de 25', 'Tucuman'),
(2359, 25, 'San Pedro', 'Tucuman'),
(2360, 25, 'San Pedro de Colalao', 'Tucuman'),
(2361, 25, 'Santa Rosa de Leales', 'Tucuman'),
(2362, 25, 'Sgto. Moya', 'Tucuman'),
(2363, 25, 'Siete de Abril', 'Tucuman'),
(2364, 25, 'Simoca', 'Tucuman'),
(2365, 25, 'Soldado Maldonado', 'Tucuman'),
(2366, 25, 'Sta. Ana', 'Tucuman'),
(2367, 25, 'Sta. Cruz', 'Tucuman'),
(2368, 25, 'Sta. Lucía', 'Tucuman'),
(2369, 25, 'Taco Ralo', 'Tucuman'),
(2370, 25, 'Tafí del Valle', 'Tucuman'),
(2371, 25, 'Tafí Viejo', 'Tucuman'),
(2372, 25, 'Tapia', 'Tucuman'),
(2373, 25, 'Teniente Berdina', 'Tucuman'),
(2374, 25, 'Trancas', 'Tucuman'),
(2375, 25, 'Villa Belgrano', 'Tucuman'),
(2376, 25, 'Villa Benjamín Araoz', 'Tucuman'),
(2377, 25, 'Villa Chiligasta', 'Tucuman'),
(2378, 25, 'Villa de Leales', 'Tucuman'),
(2379, 25, 'Villa Quinteros', 'Tucuman'),
(2380, 25, 'Yánima', 'Tucuman'),
(2381, 25, 'Yerba Buena', 'Tucuman'),
(2382, 25, 'Yerba Buena (S)', 'Tucuman');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `msg_from` int(11) NOT NULL,
  `msg_to` int(11) NOT NULL,
  `msg_body` text NOT NULL,
  `msg_read` int(1) NOT NULL,
  `msg_thread` int(11) NOT NULL,
  `deleted` int(1) NOT NULL,
  `sent_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `message_threads`
--

CREATE TABLE `message_threads` (
  `id` int(11) NOT NULL,
  `msg_to` int(11) NOT NULL,
  `msg_from` int(11) NOT NULL,
  `msg_subject` varchar(255) NOT NULL,
  `last_update` datetime NOT NULL,
  `last_update_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id_notificacion` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `cuerpo` varchar(255) NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'No leida',
  `link` varchar(255) NOT NULL,
  `tipo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `notificaciones`
--

INSERT INTO `notificaciones` (`id_notificacion`, `id_usuario`, `cuerpo`, `fecha`, `estado`, `link`, `tipo`) VALUES
(1, 5, 'El usuario greatCharles se ha postulado a tu gauchada Un delantero para un futbol 5', '2017-07-28 14:53:48', 'Leida', 'single_view.php?id=14#seccion-postu', 'positivo'),
(2, 5, 'El usuario admin se ha postulado a tu gauchada Un delantero para un futbol 5', '2017-07-28 14:54:25', 'No leida', 'single_view.php?id=14#seccion-postu', 'positivo'),
(3, 4, 'Has sido seleccionado como colaborador para realizar la gauchada: Un delantero para un futbol 5', '2017-07-28 14:54:51', 'Leida', 'single_view.php?id=14', 'positivo'),
(4, 1, 'Lo sentimos, has sido rechazado como colaborador para la gauchada: Un delantero para un futbol 5', '2017-07-28 14:54:51', 'Leida', 'single_view.php?id=14', 'negativo'),
(5, 5, 'El usuario greatCharles se ha postulado a tu gauchada Gauchada 5', '2017-07-28 17:39:54', 'No leida', 'single_view.php?id=21#seccion-postu', 'positivo'),
(6, 4, 'Has sido seleccionado como colaborador para realizar la gauchada: Gauchada 5', '2017-07-28 17:40:17', 'No leida', 'single_view.php?id=21', 'positivo'),
(7, 5, 'El usuario admin se ha postulado a tu gauchada Gauchada 4', '2017-07-28 18:11:15', 'No leida', 'single_view.php?id=20#seccion-postu', 'positivo'),
(8, 1, 'Has sido seleccionado como colaborador para realizar la gauchada: Gauchada 4', '2017-07-28 18:11:38', 'No leida', 'single_view.php?id=20', 'positivo'),
(9, 5, 'El usuario greatCharles se ha postulado a tu gauchada Gauchada 3', '2017-07-28 18:15:46', 'No leida', 'single_view.php?id=17#seccion-postu', 'positivo'),
(10, 4, 'Has sido seleccionado como colaborador para realizar la gauchada: Gauchada 3', '2017-07-28 18:16:07', 'No leida', 'single_view.php?id=17', 'positivo'),
(11, 1, 'Lo sentimos, has sido rechazado como colaborador para la gauchada: Gauchada 3', '2017-07-28 18:16:07', 'Leida', 'single_view.php?id=17', 'negativo'),
(12, 4, 'El usuario Matias se ha postulado a tu gauchada sadas', '2017-07-28 18:20:35', 'No leida', 'single_view.php?id=24#seccion-postu', 'positivo'),
(13, 5, 'Has sido seleccionado como colaborador para realizar la gauchada: sadas', '2017-07-28 18:21:03', 'No leida', 'single_view.php?id=24', 'positivo'),
(14, 4, 'El usuario Matias se ha postulado a tu gauchada sadas', '2017-07-28 18:22:44', 'No leida', 'single_view.php?id=25#seccion-postu', 'positivo'),
(15, 5, 'Has sido seleccionado como colaborador para realizar la gauchada: sadas', '2017-07-28 18:23:03', 'No leida', 'single_view.php?id=25', 'positivo'),
(16, 4, 'El usuario Matias se ha postulado a tu gauchada Tiene que andar', '2017-07-28 18:25:23', 'No leida', 'single_view.php?id=26#seccion-postu', 'positivo'),
(17, 5, 'Has sido seleccionado como colaborador para realizar la gauchada: Tiene que andar', '2017-07-28 18:25:38', 'No leida', 'single_view.php?id=26', 'positivo'),
(18, 4, 'El usuario Matias se ha postulado a tu gauchada asasd', '2017-07-28 18:29:10', 'No leida', 'single_view.php?id=27#seccion-postu', 'positivo'),
(19, 5, 'Has sido seleccionado como colaborador para realizar la gauchada: asasd', '2017-07-28 18:29:27', 'No leida', 'single_view.php?id=27', 'positivo'),
(20, 4, 'El usuario Matias se ha postulado a tu gauchada ASSDJDS', '2017-07-28 18:31:25', 'No leida', 'single_view.php?id=28#seccion-postu', 'positivo'),
(21, 5, 'Has sido seleccionado como colaborador para realizar la gauchada: ASSDJDS', '2017-07-28 18:31:38', 'No leida', 'single_view.php?id=28', 'positivo'),
(22, 4, 'El usuario Matias se ha postulado a tu gauchada asdfd', '2017-07-28 18:44:02', 'No leida', 'single_view.php?id=29#seccion-postu', 'positivo'),
(23, 5, 'Has sido seleccionado como colaborador para realizar la gauchada: asdfd', '2017-07-28 18:44:26', 'No leida', 'single_view.php?id=29', 'positivo'),
(25, 4, 'El usuario 4 te ha calificado por la gauchada asdfd', '2017-07-28 18:45:51', 'No leida', 'calificacion.php?id=29', 'positivo'),
(26, 4, 'El usuario Matias se ha postulado a tu gauchada Otra mas', '2017-07-28 18:47:24', 'No leida', 'single_view.php?id=30#seccion-postu', 'positivo'),
(27, 5, 'Has sido seleccionado como colaborador para realizar la gauchada: Otra mas', '2017-07-28 18:47:40', 'No leida', 'single_view.php?id=30', 'positivo'),
(28, 4, 'El usuario 4 te ha calificado por la gauchada Otra mas', '2017-07-28 18:47:48', 'No leida', 'calificacion.php?id=30', 'positivo'),
(29, 5, 'El usuario admin se ha postulado a tu gauchada Ultima', '2017-07-28 18:51:13', 'No leida', 'single_view.php?id=31#seccion-postu', 'positivo'),
(30, 1, 'Has sido seleccionado como colaborador para realizar la gauchada: Ultima', '2017-07-28 18:51:30', 'No leida', 'single_view.php?id=31', 'positivo'),
(31, 5, 'El usuario 5 te ha calificado por la gauchada Ultima', '2017-07-28 18:51:39', 'No leida', 'calificacion.php?id=31', 'positivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `page` varchar(100) NOT NULL,
  `private` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pages`
--

INSERT INTO `pages` (`id`, `page`, `private`) VALUES
(1, 'index.php', 0),
(2, 'z_us_root.php', 0),
(3, 'users/account.php', 1),
(4, 'users/admin.php', 1),
(5, 'users/admin_page.php', 1),
(6, 'users/admin_pages.php', 1),
(7, 'users/admin_permission.php', 1),
(8, 'users/admin_permissions.php', 1),
(9, 'users/admin_user.php', 1),
(10, 'users/admin_users.php', 1),
(11, 'users/edit_profile.php', 1),
(12, 'users/email_settings.php', 1),
(13, 'users/email_test.php', 1),
(14, 'users/forgot_password.php', 0),
(15, 'users/forgot_password_reset.php', 0),
(16, 'users/index.php', 0),
(17, 'users/init.php', 0),
(18, 'users/join.php', 0),
(19, 'users/joinThankYou.php', 0),
(20, 'users/login.php', 0),
(21, 'users/logout.php', 0),
(22, 'users/profile.php', 1),
(23, 'users/times.php', 0),
(24, 'users/user_settings.php', 1),
(25, 'users/verify.php', 0),
(26, 'users/verify_resend.php', 0),
(27, 'users/view_all_users.php', 1),
(28, 'usersc/empty.php', 0),
(31, 'users/oauth_success.php', 0),
(33, 'users/fb-callback.php', 0),
(37, 'users/check_updates.php', 1),
(38, 'users/google_helpers.php', 0),
(39, 'users/tomfoolery.php', 1),
(40, 'users/create_message.php', 1),
(41, 'users/messages.php', 1),
(42, 'users/message.php', 1),
(43, 'users/publicar_gauchada.php', 0),
(45, 'prueba.php', 0),
(47, 'users/publicacion_exitosa.php', 0),
(53, 'paginacion.php', 0),
(54, 'users/single_view.php', 0),
(55, 'users/baja_publicacion.php', 0),
(56, 'users/compra_exitosa.php', 0),
(57, 'users/compra_fallida.php', 0),
(58, 'users/comprar_creditos.php', 0),
(59, 'users/modificar_gauchada.php', 0),
(61, 'users/admin_reputaciones.php', 0),
(62, 'users/administrador.php', 0),
(63, 'users/baja_postulacion.php', 0),
(64, 'users/borrar_cuenta.php', 0),
(65, 'users/buscar.php', 0),
(66, 'users/calificacion_exitosa.php', 0),
(67, 'users/comentario_enviado.php', 0),
(68, 'users/dejar_reputacion.php', 0),
(69, 'users/modificacion_exitosa.php', 0),
(70, 'users/perfil_usuario.php', 0),
(71, 'users/postulacion_exitosa.php', 0),
(72, 'users/postulante_elegido.php', 0),
(73, 'users/reputacion_creada.php', 0),
(74, 'users/respuesta_enviada.php', 0),
(75, 'users/eliminar_reputacion.php', 0),
(76, 'users/modificar_reputacion.php', 0),
(77, 'users/reputacion_mod_exitosa.php', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`) VALUES
(1, 'User'),
(2, 'Administrator');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission_page_matches`
--

CREATE TABLE `permission_page_matches` (
  `id` int(11) NOT NULL,
  `permission_id` int(15) NOT NULL,
  `page_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `permission_page_matches`
--

INSERT INTO `permission_page_matches` (`id`, `permission_id`, `page_id`) VALUES
(2, 2, 27),
(3, 1, 24),
(4, 1, 22),
(5, 2, 13),
(6, 2, 12),
(7, 1, 11),
(8, 2, 10),
(9, 2, 9),
(10, 2, 8),
(11, 2, 7),
(12, 2, 6),
(13, 2, 5),
(14, 2, 4),
(15, 1, 3),
(16, 2, 37),
(17, 2, 39),
(19, 2, 40),
(21, 2, 41),
(23, 2, 42),
(27, 1, 42),
(28, 1, 27),
(29, 1, 41),
(30, 1, 40),
(31, 1, 43),
(32, 2, 43),
(35, 1, 46),
(36, 2, 46),
(37, 1, 47),
(38, 2, 47),
(39, 1, 48),
(40, 2, 48),
(41, 1, 59),
(42, 2, 59);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `postulacion`
--

CREATE TABLE `postulacion` (
  `id_postulacion` int(10) UNSIGNED NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_gauchada` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `comentario` varchar(500) NOT NULL,
  `estado` varchar(30) NOT NULL DEFAULT 'En espera'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `postulacion`
--

INSERT INTO `postulacion` (`id_postulacion`, `id_user`, `id_gauchada`, `fecha`, `comentario`, `estado`) VALUES
(5, 1, 15, '2017-07-28 14:38:15', 'Hola que tal', 'Rechazado'),
(6, 4, 15, '2017-07-28 14:38:37', 'Buenas', 'Elegido'),
(7, 4, 14, '2017-07-28 14:53:48', 'Holis', 'Elegido'),
(8, 1, 14, '2017-07-28 14:54:25', 'Hola', 'Rechazado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profiles`
--

CREATE TABLE `profiles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bio` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `bio`) VALUES
(1, 1, '<h1>This is the Admin\'s bio.</h1>'),
(2, 2, 'This is your bio'),
(3, 3, 'This is your bio'),
(4, 4, 'This is your bio'),
(5, 5, 'This is your bio'),
(6, 6, 'This is your bio'),
(7, 7, 'This is your bio'),
(8, 8, 'This is your bio'),
(9, 7, 'This is your bio'),
(10, 8, 'This is your bio'),
(11, 9, 'This is your bio'),
(12, 10, 'This is your bio'),
(13, 11, 'This is your bio'),
(14, 12, 'This is your bio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

CREATE TABLE `provincias` (
  `id_provincia` int(10) NOT NULL,
  `provincia` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `provincias`
--

INSERT INTO `provincias` (`id_provincia`, `provincia`) VALUES
(1, 'Buenos Aires'),
(2, 'Buenos Aires-GBA'),
(3, 'Capital Federal'),
(4, 'Catamarca'),
(5, 'Chaco'),
(6, 'Chubut'),
(7, 'Cordoba'),
(8, 'Corrientes'),
(9, 'Entre Rios'),
(10, 'Formosa'),
(11, 'Jujuy'),
(12, 'La Pampa'),
(13, 'La Rioja'),
(14, 'Mendoza'),
(15, 'Misiones'),
(16, 'Neuquen'),
(17, 'Rio Negro'),
(18, 'Salta'),
(19, 'San Juan'),
(20, 'San Luis'),
(21, 'Santa Cruz'),
(22, 'Santa Fe'),
(23, 'Santiago del Estero'),
(24, 'Tierra del Fuego'),
(25, 'Tucuman');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reputaciones`
--

CREATE TABLE `reputaciones` (
  `id_reputacion` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `minimo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `reputaciones`
--

INSERT INTO `reputaciones` (`id_reputacion`, `nombre`, `minimo`) VALUES
(10, 'Buen tipo', 50),
(13, 'Neutral', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

CREATE TABLE `settings` (
  `id` int(50) NOT NULL,
  `recaptcha` int(1) NOT NULL DEFAULT '0',
  `force_ssl` int(1) NOT NULL,
  `login_type` varchar(20) NOT NULL,
  `css_sample` int(1) NOT NULL,
  `us_css1` varchar(255) NOT NULL,
  `us_css2` varchar(255) NOT NULL,
  `us_css3` varchar(255) NOT NULL,
  `css1` varchar(255) NOT NULL,
  `css2` varchar(255) NOT NULL,
  `css3` varchar(255) NOT NULL,
  `site_name` varchar(100) NOT NULL,
  `language` varchar(255) NOT NULL,
  `track_guest` int(1) NOT NULL,
  `site_offline` int(1) NOT NULL,
  `force_pr` int(1) NOT NULL,
  `reserved1` varchar(100) NOT NULL,
  `reserverd2` varchar(100) NOT NULL,
  `custom1` varchar(100) NOT NULL,
  `custom2` varchar(100) NOT NULL,
  `custom3` varchar(100) NOT NULL,
  `glogin` int(1) NOT NULL DEFAULT '0',
  `fblogin` int(1) NOT NULL,
  `gid` varchar(255) NOT NULL,
  `gsecret` varchar(255) NOT NULL,
  `gredirect` varchar(255) NOT NULL,
  `ghome` varchar(255) NOT NULL,
  `fbid` varchar(255) NOT NULL,
  `fbsecret` varchar(255) NOT NULL,
  `fbcallback` varchar(255) NOT NULL,
  `graph_ver` varchar(255) NOT NULL,
  `finalredir` varchar(255) NOT NULL,
  `req_cap` int(1) NOT NULL,
  `req_num` int(1) NOT NULL,
  `min_pw` int(2) NOT NULL,
  `max_pw` int(3) NOT NULL,
  `min_un` int(2) NOT NULL,
  `max_un` int(3) NOT NULL,
  `messaging` int(1) NOT NULL,
  `snooping` int(1) NOT NULL,
  `echouser` int(11) NOT NULL,
  `wys` int(1) NOT NULL,
  `change_un` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`id`, `recaptcha`, `force_ssl`, `login_type`, `css_sample`, `us_css1`, `us_css2`, `us_css3`, `css1`, `css2`, `css3`, `site_name`, `language`, `track_guest`, `site_offline`, `force_pr`, `reserved1`, `reserverd2`, `custom1`, `custom2`, `custom3`, `glogin`, `fblogin`, `gid`, `gsecret`, `gredirect`, `ghome`, `fbid`, `fbsecret`, `fbcallback`, `graph_ver`, `finalredir`, `req_cap`, `req_num`, `min_pw`, `max_pw`, `min_un`, `max_un`, `messaging`, `snooping`, `echouser`, `wys`, `change_un`) VALUES
(1, 0, 0, '', 1, '../users/css/color_schemes/flat.css', '../usersc/css/custom.css', '../users/css/custom.css', '', '', '', 'unaGauchada', 'en', 1, 0, 0, '', '', '', '', '', 0, 0, 'Google ID Here', 'Google Secret Here', 'http://localhost/userspice/users/oauth_success.php', 'http://localhost/userspice/', 'FB ID Here', 'FB Secret Here', 'http://localhost/userspice/users/fb-callback.php', 'v2.2', 'account.php', 1, 1, 6, 20, 2, 40, 0, 1, 0, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `test`
--

CREATE TABLE `test` (
  `titulo` varchar(255) DEFAULT NULL,
  `descripcion` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `test`
--

INSERT INTO `test` (`titulo`, `descripcion`) VALUES
('John', ''),
('titulaso', ''),
('test', 'cya');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transacciones`
--

CREATE TABLE `transacciones` (
  `id_transaccion` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `monto` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `transacciones`
--

INSERT INTO `transacciones` (`id_transaccion`, `fecha`, `monto`) VALUES
(1, '2017-07-28', 20),
(2, '2017-07-05', 200);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(155) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `permissions` int(11) NOT NULL,
  `logins` int(100) NOT NULL,
  `account_owner` tinyint(4) NOT NULL DEFAULT '0',
  `account_id` int(11) NOT NULL DEFAULT '0',
  `company` varchar(255) NOT NULL,
  `stripe_cust_id` varchar(255) NOT NULL,
  `billing_phone` varchar(20) NOT NULL,
  `billing_srt1` varchar(255) NOT NULL,
  `billing_srt2` varchar(255) NOT NULL,
  `billing_city` varchar(255) NOT NULL,
  `billing_state` varchar(255) NOT NULL,
  `billing_zip_code` varchar(255) NOT NULL,
  `join_date` datetime NOT NULL,
  `last_login` datetime NOT NULL,
  `email_verified` tinyint(4) NOT NULL DEFAULT '0',
  `vericode` varchar(15) NOT NULL,
  `title` varchar(100) NOT NULL,
  `active` int(1) NOT NULL,
  `custom1` varchar(255) NOT NULL,
  `custom2` varchar(255) NOT NULL,
  `custom3` varchar(255) NOT NULL,
  `custom4` varchar(255) NOT NULL,
  `custom5` varchar(255) NOT NULL,
  `oauth_provider` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `oauth_uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gpluslink` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `fb_uid` varchar(255) NOT NULL,
  `un_changed` int(1) NOT NULL,
  `creditos` int(11) NOT NULL DEFAULT '1',
  `puntos` int(11) NOT NULL DEFAULT '0',
  `telefono` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password`, `fname`, `lname`, `permissions`, `logins`, `account_owner`, `account_id`, `company`, `stripe_cust_id`, `billing_phone`, `billing_srt1`, `billing_srt2`, `billing_city`, `billing_state`, `billing_zip_code`, `join_date`, `last_login`, `email_verified`, `vericode`, `title`, `active`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `oauth_provider`, `oauth_uid`, `gender`, `locale`, `gpluslink`, `picture`, `created`, `modified`, `fb_uid`, `un_changed`, `creditos`, `puntos`, `telefono`) VALUES
(1, 'sreguren@gmail.com', 'admin', '$2y$12$1v06jm2KMOXuuo3qP7erTuTIJFOnzhpds1Moa8BadnUUeX0RV3ex.', 'Sebasti&aacute;n', 'Eguren', 1, 130, 1, 0, 'UserSpice', '', '', '', '', '', '', '', '2016-01-01 00:00:00', '2017-07-28 21:52:13', 1, '322418', '', 0, '', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '1899-11-30 00:00:00', '', 0, 4, -9, '2214351234'),
(2, 'noreply@userspice.com', 'user', '$2y$12$HZa0/d7evKvuHO8I3U8Ff.pOjJqsGTZqlX8qURratzP./EvWetbkK', 'Sample', 'User', 1, 5, 1, 0, 'none', '', '', '', '', '', '', '', '2016-01-02 00:00:00', '2017-02-20 12:14:10', 1, '970748', '', 1, '', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, 0, NULL),
(3, 'poroto.acosta@gmail.com', 'Poroto', '$2y$12$sJST.wocDtg1/c9.G.RNmOOiZDDt9KZnMreRCbbCsxfQiHrKXKLl2', 'Alejoo', 'Acostaaa', 1, 11, 1, 0, '', '', '', '', '', '', '', '', '2017-05-23 21:38:58', '2017-07-08 17:20:32', 1, '984480', '', 1, '', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, 0, NULL),
(4, 'menendez_carlos@yahoo.com.ar', 'greatCharles', '$2y$12$EDpNT/NH1PRpfSS1JnDbkukXujFQdZy.XifXfCScGfrWM5rKqWNju', 'Carlos', 'Men&eacute;ndez', 1, 55, 1, 0, '', '', '', '', '', '', '', '', '2017-05-28 23:29:39', '2017-07-28 21:47:32', 1, '460960', '', 1, '', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 106, 4, '2216439654'),
(5, 'maatias.p.97@gmail.com', 'Matias', '$2y$12$elb/nHsth6p11gCdZ3LL4uGSyfDjS1JBqSFHvwtOk23PFYX.jsYxe', 'Mat&iacute;as', 'Pompilio', 1, 35, 1, 0, '', '', '', '', '', '', '', '', '2017-06-01 23:50:26', '2017-07-28 21:51:22', 1, '764755', '', 1, '', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 1, 21, NULL),
(6, 'asdsdfd@gmail.com', 'Hola', '$2y$12$VKR7x7Z.vU.FlGBXCcsoee3pn8RDF7IWE5hN9D9TuOZGU88iMz.zW', 'Hola', 'Pompilio', 1, 0, 1, 0, '', '', '', '', '', '', '', '', '2017-06-11 19:32:28', '0000-00-00 00:00:00', 1, '661703', '', 1, '', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, 0, NULL),
(9, 'pepito@gmail.com', 'pepitoGonzales', '$2y$12$QQBG8gd/Qg98iDsDgmleUuEeH8VUPkQ1Jeeg0b/MRHBCSxmsR9iKG', 'Pepe', 'Gonzales', 1, 0, 1, 0, '', '', '', '', '', '', '', '', '2017-07-16 16:14:43', '0000-00-00 00:00:00', 1, '416448', '', 1, '', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 1, 0, '2215467898'),
(12, 'marce@gmail.com', 'marceMartinez', '$2y$12$vf73p7Z4h9Mq1x0ZxPcMgOxBFL8Aj350Cv.0vVV.y//BkawN8zGkm', 'Marcelo', 'Martinez', 1, 0, 1, 0, '', '', '', '', '', '', '', '', '2017-07-18 14:44:14', '0000-00-00 00:00:00', 1, '591519', '', 1, '', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_online`
--

CREATE TABLE `users_online` (
  `id` int(10) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `timestamp` varchar(15) NOT NULL,
  `user_id` int(10) NOT NULL,
  `session` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users_online`
--

INSERT INTO `users_online` (`id`, `ip`, `timestamp`, `user_id`, `session`) VALUES
(1, '::1', '1501278733', 1, ''),
(9, '::1', '1501278468', 4, ''),
(10, '::1', '1501278699', 5, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_session`
--

CREATE TABLE `users_session` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `uagent` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_permission_matches`
--

CREATE TABLE `user_permission_matches` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `user_permission_matches`
--

INSERT INTO `user_permission_matches` (`id`, `user_id`, `permission_id`) VALUES
(100, 1, 1),
(101, 1, 2),
(102, 2, 1),
(103, 3, 1),
(104, 4, 1),
(105, 5, 1),
(106, 6, 1),
(107, 7, 1),
(108, 8, 1),
(109, 7, 1),
(110, 8, 1),
(111, 9, 1),
(112, 10, 1),
(113, 11, 1),
(114, 12, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `audit`
--
ALTER TABLE `audit`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD PRIMARY KEY (`id_calificacion`),
  ADD KEY `id_dueño` (`id_duenio`),
  ADD KEY `id_colaborador` (`id_colaborador`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `id_gauchada` (`id_gauchada`,`id_user`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `gauchada`
--
ALTER TABLE `gauchada`
  ADD PRIMARY KEY (`id_gauchada`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `localidades`
--
ALTER TABLE `localidades`
  ADD PRIMARY KEY (`id_localidad`);

--
-- Indices de la tabla `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `message_threads`
--
ALTER TABLE `message_threads`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`id_notificacion`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permission_page_matches`
--
ALTER TABLE `permission_page_matches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `postulacion`
--
ALTER TABLE `postulacion`
  ADD PRIMARY KEY (`id_postulacion`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_gauchada` (`id_gauchada`);

--
-- Indices de la tabla `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`id_provincia`);

--
-- Indices de la tabla `reputaciones`
--
ALTER TABLE `reputaciones`
  ADD PRIMARY KEY (`id_reputacion`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD UNIQUE KEY `minimo` (`minimo`);

--
-- Indices de la tabla `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  ADD PRIMARY KEY (`id_transaccion`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `EMAIL` (`email`) USING BTREE;

--
-- Indices de la tabla `users_online`
--
ALTER TABLE `users_online`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users_session`
--
ALTER TABLE `users_session`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user_permission_matches`
--
ALTER TABLE `user_permission_matches`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `audit`
--
ALTER TABLE `audit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  MODIFY `id_calificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id_comentario` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `email`
--
ALTER TABLE `email`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `gauchada`
--
ALTER TABLE `gauchada`
  MODIFY `id_gauchada` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT de la tabla `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `localidades`
--
ALTER TABLE `localidades`
  MODIFY `id_localidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2383;
--
-- AUTO_INCREMENT de la tabla `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `message_threads`
--
ALTER TABLE `message_threads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `id_notificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT de la tabla `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `permission_page_matches`
--
ALTER TABLE `permission_page_matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT de la tabla `postulacion`
--
ALTER TABLE `postulacion`
  MODIFY `id_postulacion` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT de la tabla `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `provincias`
--
ALTER TABLE `provincias`
  MODIFY `id_provincia` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT de la tabla `reputaciones`
--
ALTER TABLE `reputaciones`
  MODIFY `id_reputacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  MODIFY `id_transaccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `users_online`
--
ALTER TABLE `users_online`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `users_session`
--
ALTER TABLE `users_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `user_permission_matches`
--
ALTER TABLE `user_permission_matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`id_gauchada`) REFERENCES `gauchada` (`id_gauchada`),
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `gauchada`
--
ALTER TABLE `gauchada`
  ADD CONSTRAINT `gauchada_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `postulacion`
--
ALTER TABLE `postulacion`
  ADD CONSTRAINT `postulacion_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `postulacion_ibfk_3` FOREIGN KEY (`id_gauchada`) REFERENCES `gauchada` (`id_gauchada`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
