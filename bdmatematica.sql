-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 02-04-2022 a las 05:32:31
-- Versión del servidor: 5.7.33
-- Versión de PHP: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdmatematica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tavisos`
--

CREATE TABLE `tavisos` (
  `id_aviso` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `titulo` varchar(80) NOT NULL,
  `descripcion` varchar(120) NOT NULL,
  `imagen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tavisos`
--

INSERT INTO `tavisos` (`id_aviso`, `id_usuario`, `titulo`, `descripcion`, `imagen`) VALUES
(1, 2, 'fdhdhdghthyjy', 'jfyjjgjfyjfjhjhjj', '274609861_713643233347130_382233907971314861_n.jpg'),
(2, 2, 'dcccccc', 'sssssssssssssssssssssdc', 'descarga (1).jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcomentarios`
--

CREATE TABLE `tcomentarios` (
  `id_comentario` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `comentario` text NOT NULL,
  `pregunta` varchar(2) NOT NULL,
  `estado` varchar(30) NOT NULL,
  `fecha_comentario` datetime NOT NULL,
  `respuesta` text,
  `fecha_respuesta` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tcomentarios`
--

INSERT INTO `tcomentarios` (`id_comentario`, `id_usuario`, `comentario`, `pregunta`, `estado`, `fecha_comentario`, `respuesta`, `fecha_respuesta`) VALUES
(1, 3, 'dfdf dg dgg fgghght rgr grfgserth h thbtb th gt hthttht r  r t tr r r tt rrttgh t5 t gr g rgrt', 'si', 'Eliminado', '2022-03-27 21:31:21', 'chido tu comentario pero igual te dejo en visto jajaja xD', '2022-03-28 22:51:38'),
(2, 3, 'Kelly hace el reporte y inbestiga la base de datos', 'si', 'No Respondido', '2022-03-28 22:55:51', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tjuegos`
--

CREATE TABLE `tjuegos` (
  `id_juego` int(11) NOT NULL,
  `nombre_juego` varchar(60) NOT NULL,
  `num_descargas` int(11) NOT NULL,
  `ultima_descarga` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmateria`
--

CREATE TABLE `tmateria` (
  `id_materia` int(11) NOT NULL,
  `nombre_materia` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tmateria`
--

INSERT INTO `tmateria` (`id_materia`, `nombre_materia`) VALUES
(1, 'Algebra Lineal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `troles`
--

CREATE TABLE `troles` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `troles`
--

INSERT INTO `troles` (`id_rol`, `nombre_rol`) VALUES
(1, 'administrador'),
(2, 'usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tusuarios`
--

CREATE TABLE `tusuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  `inicio_sesion` int(11) NOT NULL,
  `ultimo_acceso` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tusuarios`
--

INSERT INTO `tusuarios` (`id_usuario`, `nombre`, `email`, `password`, `id_rol`, `fecha_registro`, `inicio_sesion`, `ultimo_acceso`) VALUES
(1, 'antonio', 'antonio@gmail.com', '123456789', 1, '2022-02-08 17:50:03', 0, '2022-02-01 17:50:03'),
(2, 'antonio', 'antonio2@gmail.com', '$2y$10$HO8JYztQvp9FQmsPCbuKYuN2tMvRqu4iYQ1qdVEfrSbv1uLXhkfSa', 1, '2022-02-13 17:53:56', 1, '2022-02-13 17:54:07'),
(3, 'Osvaldogrosomodo', 'osvaldomaste@gmail.com', '$2y$10$RObyxpWEuzyvPxxsAOpzguR9NTSshqJs3UmQGMgUCw/1Bs4bE733a', 2, '2022-03-26 01:11:47', 18, '2022-04-01 12:42:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tvideos`
--

CREATE TABLE `tvideos` (
  `id_video` int(11) NOT NULL,
  `id_materia` int(11) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `video` varchar(255) NOT NULL,
  `fecha_carga` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tvideos`
--

INSERT INTO `tvideos` (`id_video`, `id_materia`, `id_usuario`, `titulo`, `descripcion`, `tipo`, `video`, `fecha_carga`) VALUES
(3, 1, 2, 'El video alfa', 'Video videaso videosos prueba video videito dogecheems', 'archivo', 'dioe.mp4', '2022-03-31 00:20:30'),
(4, 7, 2, 'elfers', 'kllllllllllllllllllllllllllllllllllllllllllllllññññññññññññññññññññññññññññññññññññññññññññññññññññññññññññ', 'archivo', 'dioe.mp4', '2022-03-31 15:50:37'),
(5, 1, 2, 'ljhgfxsxghm', 'ñjhffjjcxcbn,', 'archivo', 'dioe.mp4', '2022-03-31 21:33:35');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tavisos`
--
ALTER TABLE `tavisos`
  ADD PRIMARY KEY (`id_aviso`);

--
-- Indices de la tabla `tcomentarios`
--
ALTER TABLE `tcomentarios`
  ADD PRIMARY KEY (`id_comentario`);

--
-- Indices de la tabla `tjuegos`
--
ALTER TABLE `tjuegos`
  ADD PRIMARY KEY (`id_juego`);

--
-- Indices de la tabla `tmateria`
--
ALTER TABLE `tmateria`
  ADD PRIMARY KEY (`id_materia`);

--
-- Indices de la tabla `troles`
--
ALTER TABLE `troles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `tusuarios`
--
ALTER TABLE `tusuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `tvideos`
--
ALTER TABLE `tvideos`
  ADD PRIMARY KEY (`id_video`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tavisos`
--
ALTER TABLE `tavisos`
  MODIFY `id_aviso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tcomentarios`
--
ALTER TABLE `tcomentarios`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tjuegos`
--
ALTER TABLE `tjuegos`
  MODIFY `id_juego` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tmateria`
--
ALTER TABLE `tmateria`
  MODIFY `id_materia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tusuarios`
--
ALTER TABLE `tusuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tvideos`
--
ALTER TABLE `tvideos`
  MODIFY `id_video` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
