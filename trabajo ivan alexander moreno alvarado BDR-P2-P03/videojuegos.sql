-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-04-2026 a las 17:19:16
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `videojuegos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `id_genero` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id_genero`, `nombre`, `descripcion`) VALUES
(1, 'aventura', 'trata de pasar niveles ya que es un modo historia '),
(2, 'shotter', 'trata de disparos y sobrevivir'),
(3, 'terror', 'trata de sustos y suspenso'),
(5, 'RPG', 'es un juego de rol donde asumes el papel de un personaje'),
(6, 'accion', 'trata de ataques , poderes, peleas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plataforma`
--

CREATE TABLE `plataforma` (
  `id_plataforma` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `fabricante` varchar(80) NOT NULL,
  `año_lanzamiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `plataforma`
--

INSERT INTO `plataforma` (`id_plataforma`, `nombre`, `fabricante`, `año_lanzamiento`) VALUES
(1, 'Ps5', 'Sony', '2013-01-01'),
(2, 'PC', 'asus', '2023-03-23'),
(3, 'Xbox one', 'Microsoft', '2018-06-15'),
(4, 'psp', 'sony', '2015-01-14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videojuego`
--

CREATE TABLE `videojuego` (
  `id_juego` int(11) NOT NULL,
  `titulo` varchar(120) NOT NULL,
  `desarrolladora` varchar(100) NOT NULL,
  `año_lanzamiento` year(4) NOT NULL,
  `precio` decimal(6,0) NOT NULL,
  `id_genero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `videojuego`
--

INSERT INTO `videojuego` (`id_juego`, `titulo`, `desarrolladora`, `año_lanzamiento`, `precio`, `id_genero`) VALUES
(2, 'resident evil 4', 'Capcom', '2018', 150, 3),
(3, 'fortnite', 'epic games', '2022', 70, 2),
(4, 'minecraft', 'mojang', '2021', 25, 1),
(5, 'fifa', 'ea sports', '2026', 95, 2),
(6, 'valorant', 'riot games', '2022', 60, 2),
(7, 'spiderman ', 'imsoniac', '2020', 600, 1),
(8, 'halo', 'bungie studios', '2021', 45, 5),
(9, 'batman arkham', 'rocksteady studios', '2016', 20, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videojuego_plataforma`
--

CREATE TABLE `videojuego_plataforma` (
  `id_juego` int(11) NOT NULL,
  `id_plataforma` int(11) NOT NULL,
  `fecha_disponible` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id_genero`);

--
-- Indices de la tabla `plataforma`
--
ALTER TABLE `plataforma`
  ADD PRIMARY KEY (`id_plataforma`);

--
-- Indices de la tabla `videojuego`
--
ALTER TABLE `videojuego`
  ADD PRIMARY KEY (`id_juego`),
  ADD KEY `id_genero` (`id_genero`);

--
-- Indices de la tabla `videojuego_plataforma`
--
ALTER TABLE `videojuego_plataforma`
  ADD KEY `id_plataforma` (`id_plataforma`),
  ADD KEY `id_juego` (`id_juego`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `id_genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `plataforma`
--
ALTER TABLE `plataforma`
  MODIFY `id_plataforma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `videojuego`
--
ALTER TABLE `videojuego`
  MODIFY `id_juego` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `videojuego`
--
ALTER TABLE `videojuego`
  ADD CONSTRAINT `videojuego_ibfk_1` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id_genero`);

--
-- Filtros para la tabla `videojuego_plataforma`
--
ALTER TABLE `videojuego_plataforma`
  ADD CONSTRAINT `videojuego_plataforma_ibfk_1` FOREIGN KEY (`id_juego`) REFERENCES `videojuego` (`id_juego`),
  ADD CONSTRAINT `videojuego_plataforma_ibfk_2` FOREIGN KEY (`id_plataforma`) REFERENCES `plataforma` (`id_plataforma`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
