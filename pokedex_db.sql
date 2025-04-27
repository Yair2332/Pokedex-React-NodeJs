-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-04-2025 a las 02:54:23
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
-- Base de datos: `pokedex_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pokemones`
--

CREATE TABLE `pokemones` (
  `id` int(11) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  `numero_pokedex` varchar(10) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `tipo1` int(11) NOT NULL,
  `tipo2` int(11) DEFAULT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `altura` decimal(3,2) DEFAULT NULL,
  `poder` int(11) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `habilidad` varchar(50) DEFAULT NULL,
  `genero` varchar(20) DEFAULT NULL,
  `hp` int(11) DEFAULT NULL,
  `ataque` int(11) DEFAULT NULL,
  `defensa` int(11) DEFAULT NULL,
  `ataque_especial` int(11) DEFAULT NULL,
  `defensa_especial` int(11) DEFAULT NULL,
  `velocidad` int(11) DEFAULT NULL,
  `num_evo1` varchar(10) DEFAULT NULL,
  `num_evo2` varchar(10) DEFAULT NULL,
  `favorito` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pokemones`
--

INSERT INTO `pokemones` (`id`, `img`, `nombre`, `numero_pokedex`, `descripcion`, `tipo1`, `tipo2`, `peso`, `altura`, `poder`, `categoria`, `habilidad`, `genero`, `hp`, `ataque`, `defensa`, `ataque_especial`, `defensa_especial`, `velocidad`, `num_evo1`, `num_evo2`, `favorito`) VALUES
(5, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png', 'Bulbasaur', '001', 'Una semilla en su espalda crece al absorber nutrientes.', 5, 8, 6.90, 0.70, 318, 'Semilla', 'Espesura', '2', 45, 49, 49, 65, 65, 45, '002', '003', 1),
(6, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png', 'Ivysaur', '002', 'La semilla crece en su lomo con el sol.', 5, 8, 13.00, 1.00, 405, 'Semilla', 'Espesura', '2', 60, 62, 63, 80, 80, 60, '001', '003', 1),
(7, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png', 'Venusaur', '003', 'La flor de su lomo florece con energía solar.', 5, 8, 100.00, 2.00, 525, 'Semilla', 'Espesura', '2', 80, 82, 83, 100, 100, 80, '001', '002', 0),
(8, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png', 'Charmander', '004', 'La llama en su cola indica su estado de salud.', 2, NULL, 8.50, 0.60, 309, 'Lagartija', 'Mar llamas', '2', 39, 52, 43, 60, 50, 65, '005', '006', 0),
(9, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/5.png', 'Charmeleon', '005', 'Agita su cola ardiente para intimidar.', 2, NULL, 19.00, 1.10, 405, 'Llama', 'Mar llamas', '2', 58, 64, 58, 80, 65, 80, '004', '006', 0),
(10, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/6.png', 'Charizard', '006', 'Escupe fuego que funde cualquier cosa.', 2, 10, 90.50, 1.70, 534, 'Llama', 'Mar llamas', '2', 78, 84, 78, 109, 85, 100, '004', '005', 0),
(11, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/7.png', 'Squirtle', '007', 'Repele ataques escondido en su caparazón.', 3, NULL, 9.00, 0.50, 314, 'Tortuguita', 'Torrente', '2', 44, 48, 65, 50, 64, 43, '008', '009', 1),
(12, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/8.png', 'Wartortle', '008', 'Su cola peluda lo ayuda a nadar.', 3, NULL, 22.50, 1.00, 405, 'Tortuga', 'Torrente', '2', 59, 63, 80, 65, 80, 58, '007', '009', 0),
(13, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/9.png', 'Blastoise', '009', 'Lanza agua por los cañones en su espalda.', 3, NULL, 85.50, 1.60, 530, 'Caparazón', 'Torrente', '2', 79, 83, 100, 85, 105, 78, '007', '008', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos`
--

CREATE TABLE `tipos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `color` varchar(7) DEFAULT '#777777'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipos`
--

INSERT INTO `tipos` (`id`, `nombre`, `color`) VALUES
(1, 'Normal', '#A8A878'),
(2, 'Fuego', '#F08030'),
(3, 'Agua', '#6890F0'),
(4, 'Eléctrico', '#F8D030'),
(5, 'Planta', '#78C850'),
(6, 'Hielo', '#98D8D8'),
(7, 'Lucha', '#C03028'),
(8, 'Veneno', '#A040A0'),
(9, 'Tierra', '#E0C068'),
(10, 'Volador', '#A890F0'),
(11, 'Psíquico', '#F85888'),
(12, 'Bicho', '#A8B820'),
(13, 'Roca', '#B8A038'),
(14, 'Fantasma', '#705898'),
(15, 'Dragón', '#7038F8'),
(16, 'Siniestro', '#705848'),
(17, 'Acero', '#B8B8D0'),
(18, 'Hada', '#EE99AC'),
(19, 'Ninguno', '#777777');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pokemones`
--
ALTER TABLE `pokemones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero_pokedex` (`numero_pokedex`),
  ADD KEY `tipo1` (`tipo1`),
  ADD KEY `tipo2` (`tipo2`),
  ADD KEY `num_evo1` (`num_evo1`),
  ADD KEY `num_evo2` (`num_evo2`);

--
-- Indices de la tabla `tipos`
--
ALTER TABLE `tipos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pokemones`
--
ALTER TABLE `pokemones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `tipos`
--
ALTER TABLE `tipos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pokemones`
--
ALTER TABLE `pokemones`
  ADD CONSTRAINT `pokemones_ibfk_1` FOREIGN KEY (`tipo1`) REFERENCES `tipos` (`id`),
  ADD CONSTRAINT `pokemones_ibfk_2` FOREIGN KEY (`tipo2`) REFERENCES `tipos` (`id`),
  ADD CONSTRAINT `pokemones_ibfk_3` FOREIGN KEY (`num_evo1`) REFERENCES `pokemones` (`numero_pokedex`),
  ADD CONSTRAINT `pokemones_ibfk_4` FOREIGN KEY (`num_evo2`) REFERENCES `pokemones` (`numero_pokedex`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
