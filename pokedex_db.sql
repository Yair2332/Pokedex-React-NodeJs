-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-04-2025 a las 07:39:45
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
(13, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/9.png', 'Blastoise', '009', 'Lanza agua por los cañones en su espalda.', 3, NULL, 85.50, 1.60, 530, 'Caparazón', 'Torrente', '2', 79, 83, 100, 85, 105, 78, '007', '008', 1),
(14, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10.png', 'Caterpie', '010', 'Es un gusano que se alimenta de hojas.', 12, NULL, 2.90, 0.30, 195, 'Gusano', 'Polvo Escudo', '2', 45, 30, 35, 20, 20, 45, '011', '012', 0),
(15, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/11.png', 'Metapod', '011', 'Es un capullo endurecido que protege su cuerpo.', 12, NULL, 9.90, 0.70, 205, 'Capullo', 'Mudar', '2', 50, 20, 55, 25, 25, 30, '010', '012', 0),
(16, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/12.png', 'Butterfree', '012', 'Vuela por campos y bosques en busca de néctar.', 12, 10, 32.00, 1.10, 395, 'Mariposa', 'Ojo Compuesto', '2', 60, 45, 50, 90, 80, 70, '010', '011', 0),
(17, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/13.png', 'Weedle', '013', 'Tiene un aguijón venenoso en su cabeza.', 12, 8, 3.20, 0.30, 195, 'Oruga', 'Escudo Polvo', '2', 40, 35, 30, 20, 20, 50, '014', '015', 0),
(18, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/14.png', 'Kakuna', '014', 'Está casi inmóvil mientras se prepara para evolucionar.', 12, 8, 10.00, 0.60, 205, 'Capullo', 'Mudar', '2', 45, 25, 50, 25, 25, 35, '013', '015', 0),
(19, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/15.png', 'Beedrill', '015', 'Ataca en grupo con sus aguijones venenosos.', 12, 8, 29.50, 1.00, 395, 'Abeja Veneno', 'Enjambre', '2', 65, 90, 40, 45, 80, 75, '013', '014', 0),
(20, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/16.png', 'Pidgey', '016', 'Un pequeño pájaro que vuela cerca del suelo.', 1, 10, 1.80, 0.30, 251, 'Pajarito', 'Vista Lince', '2', 40, 45, 40, 35, 35, 56, '017', '018', 0),
(21, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/17.png', 'Pidgeotto', '017', 'Domina el cielo de su territorio.', 1, 10, 30.00, 1.10, 349, 'Avestruces', 'Vista Lince', '2', 63, 60, 55, 50, 50, 71, '016', '018', 0),
(22, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/18.png', 'Pidgeot', '018', 'Su plumaje brillante es un símbolo de su fuerza.', 1, 10, 39.50, 1.50, 479, 'Ave', 'Vista Lince', '2', 83, 80, 75, 70, 70, 101, '016', '018', 0),
(23, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/19.png', 'Rattata', '019', 'Sus grandes dientes nunca dejan de crecer.', 1, NULL, 3.50, 0.30, 253, 'Ratón', 'Fuga', '2', 30, 56, 35, 25, 35, 72, '020', NULL, 0),
(24, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/20.png', 'Raticate', '020', 'Sus potentes colmillos pueden romper cualquier cosa.', 1, NULL, 18.50, 0.70, 413, 'Ratón', 'Fuga', '2', 55, 81, 60, 50, 70, 97, '019', NULL, 0),
(25, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/21.png', 'Spearow', '021', 'Es territorial y muy ruidoso.', 1, 10, 2.00, 0.30, 262, 'Pájaro', 'Vista Lince', '2', 40, 60, 30, 31, 31, 70, '022', NULL, 0),
(26, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/22.png', 'Fearow', '022', 'Vuela distancias de más de 300 km.', 1, 10, 38.00, 1.20, 442, 'Pájaro', 'Vista Lince', '2', 65, 90, 65, 61, 61, 100, '021', NULL, 0),
(27, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/23.png', 'Ekans', '023', 'Envuelve a su presa para inmovilizarla.', 8, NULL, 6.90, 2.00, 288, 'Serpiente', 'Muda', '2', 35, 60, 44, 40, 54, 55, '024', NULL, 0),
(28, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/24.png', 'Arbok', '024', 'Puede aplastar objetos con su poderoso cuerpo.', 8, NULL, 65.00, 3.50, 448, 'Serpiente Cobra', 'Muda', '2', 60, 95, 69, 65, 79, 80, '023', NULL, 0),
(29, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png', 'Pikachu', '025', 'Almacena electricidad en sus mejillas.', 4, NULL, 6.00, 0.40, 320, 'Ratón Eléctrico', 'Electricidad Estática', '2', 35, 55, 40, 50, 50, 90, '026', NULL, 0),
(30, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/26.png', 'Raichu', '026', 'Descarga electricidad más potente que Pikachu.', 4, NULL, 30.00, 0.80, 485, 'Ratón Eléctrico', 'Electricidad Estática', '2', 60, 90, 55, 90, 80, 110, '025', NULL, 0),
(31, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/27.png', 'Sandshrew', '027', 'Se enrosca para protegerse de sus enemigos.', 9, NULL, 12.00, 0.60, 300, 'Ratón', 'Velo Arena', '2', 50, 75, 85, 20, 30, 40, '028', NULL, 0),
(32, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/28.png', 'Sandslash', '028', 'Su cuerpo cubierto de púas lo protege.', 9, NULL, 29.50, 1.00, 450, 'Ratón', 'Velo Arena', '2', 75, 100, 110, 45, 55, 65, '027', NULL, 0),
(33, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/29.png', 'Nidoran♀', '029', 'Sus pequeñas púas contienen veneno.', 8, NULL, 7.00, 0.40, 275, 'Veneno Pincho', 'Punto Tóxico', '2', 55, 47, 52, 40, 40, 41, '030', '031', 0),
(34, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/30.png', 'Nidorina', '030', 'Más cuidadosa que Nidoran♀.', 8, NULL, 20.00, 0.80, 365, 'Veneno Pincho', 'Punto Tóxico', '2', 70, 62, 67, 55, 55, 56, '029', '031', 0),
(35, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/31.png', 'Nidoqueen', '031', 'Su cuerpo robusto repele ataques.', 8, 9, 60.00, 1.30, 505, 'Taladro', 'Punto Tóxico', '2', 90, 92, 87, 75, 85, 76, '029', '030', 0),
(36, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/32.png', 'Nidoran♂', '032', 'Ataca con su cuerno venenoso.', 8, NULL, 9.00, 0.50, 273, 'Veneno Pincho', 'Punto Tóxico', '2', 46, 57, 40, 40, 40, 50, '033', '034', 0),
(37, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/33.png', 'Nidorino', '033', 'Su cuerno crece afilado al evolucionar.', 8, NULL, 19.50, 0.90, 365, 'Veneno Pincho', 'Punto Tóxico', '2', 61, 72, 57, 55, 55, 65, '032', '034', 0),
(38, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/34.png', 'Nidoking', '034', 'Usa su cola para arrasar enemigos.', 8, 9, 62.00, 1.40, 505, 'Taladro', 'Punto Tóxico', '2', 81, 102, 77, 85, 75, 85, '032', '033', 0),
(39, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/35.png', 'Clefairy', '035', 'De noche baila bajo la luz lunar.', 18, NULL, 7.50, 0.60, 323, 'Hada', 'Gran Encanto', '2', 70, 45, 48, 60, 65, 35, '036', NULL, 0),
(40, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/36.png', 'Clefable', '036', 'Salta tan alto como una montaña.', 18, NULL, 40.00, 1.30, 483, 'Hada', 'Gran Encanto', '2', 95, 70, 73, 95, 90, 60, '035', NULL, 0),
(41, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/37.png', 'Vulpix', '037', 'Cuando hace frío, su cola se esponja.', 2, NULL, 9.90, 0.60, 299, 'Zorro', 'Absorbe Fuego', '2', 38, 41, 40, 50, 65, 65, '038', NULL, 0),
(42, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/38.png', 'Ninetales', '038', 'Cada cola contiene poderes místicos.', 2, NULL, 19.90, 1.10, 505, 'Zorro', 'Absorbe Fuego', '2', 73, 76, 75, 81, 100, 100, '037', NULL, 0),
(43, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/39.png', 'Jigglypuff', '039', 'Canta melodías que adormecen.', 18, 1, 5.50, 0.50, 270, 'Globo', 'Gran Encanto', '2', 115, 45, 20, 45, 25, 20, '040', NULL, 0),
(44, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/40.png', 'Wigglytuff', '040', 'Su cuerpo es elástico y suave.', 18, 1, 12.00, 1.00, 435, 'Globo', 'Gran Encanto', '2', 140, 70, 45, 85, 50, 45, '039', NULL, 0),
(45, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/41.png', 'Zubat', '041', 'Navega con ultrasonido en la oscuridad.', 8, 10, 7.50, 0.80, 245, 'Murciélago', 'Foco Interno', '2', 40, 45, 35, 30, 40, 55, '042', NULL, 0),
(46, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/42.png', 'Golbat', '042', 'Chupa la sangre de sus presas.', 8, 10, 55.00, 1.60, 455, 'Murciélago', 'Foco Interno', '2', 75, 80, 70, 65, 75, 90, '041', NULL, 0),
(47, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/43.png', 'Oddish', '043', 'Se entierra durante el día.', 5, 8, 5.40, 0.50, 320, 'Hierba', 'Clorofila', '2', 45, 50, 55, 75, 65, 30, '044', '045', 0),
(48, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/44.png', 'Gloom', '044', 'Su aroma fuerte aturde enemigos.', 5, 8, 8.60, 0.80, 395, 'Hierba', 'Clorofila', '2', 60, 65, 70, 85, 75, 40, '043', '045', 0),
(49, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/45.png', 'Vileplume', '045', 'Esparce polen tóxico con sus pétalos.', 5, 8, 18.60, 1.20, 490, 'Hierba', 'Clorofila', '2', 75, 80, 85, 110, 90, 50, '043', '044', 0),
(50, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/46.png', 'Paras', '046', 'Vive con hongos parásitos.', 12, 5, 5.40, 0.30, 285, 'Hongo', 'Efecto Espora', '2', 35, 70, 55, 45, 55, 25, '047', NULL, 0),
(51, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/47.png', 'Parasect', '047', 'Controlado por un hongo.', 12, 5, 29.50, 1.00, 405, 'Hongo', 'Efecto Espora', '2', 60, 95, 80, 60, 80, 30, '046', NULL, 0),
(52, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/48.png', 'Venonat', '048', 'Ve con sus ojos compuestos.', 12, 8, 30.00, 1.00, 305, 'Insecto', 'Ojo Compuesto', '2', 60, 55, 50, 40, 55, 45, '049', NULL, 0),
(53, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/49.png', 'Venomoth', '049', 'Se camufla perfectamente en la noche.', 12, 8, 12.50, 1.50, 450, 'Insecto', 'Polvo Escudo', '2', 70, 65, 60, 90, 75, 90, '048', NULL, 0),
(54, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/50.png', 'Diglett', '050', 'Vive bajo tierra.', 9, NULL, 0.80, 0.20, 265, 'Topo', 'Velo Arena', '2', 10, 55, 25, 35, 45, 95, '051', NULL, 0),
(55, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/51.png', 'Dugtrio', '051', 'Tres Diglett coordinados.', 9, NULL, 33.30, 0.70, 425, 'Topo', 'Velo Arena', '2', 35, 80, 50, 50, 70, 120, '050', NULL, 0),
(56, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/52.png', 'Meowth', '052', 'Adora las cosas brillantes.', 1, NULL, 4.20, 0.40, 290, 'Gato', 'Recogida', '2', 40, 45, 35, 40, 40, 90, '053', NULL, 0),
(57, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/53.png', 'Persian', '053', 'Su elegancia cautiva.', 1, NULL, 32.00, 1.00, 440, 'Gato', 'Fuga', '2', 65, 70, 60, 65, 65, 115, '052', NULL, 0),
(58, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/54.png', 'Psyduck', '054', 'Sufre de dolores de cabeza crónicos.', 3, NULL, 19.60, 0.80, 320, 'Pato', 'Nado Rápido', '2', 50, 52, 48, 65, 50, 55, '055', NULL, 0),
(59, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/55.png', 'Golduck', '055', 'Nada con gran velocidad.', 3, NULL, 76.60, 1.70, 500, 'Pato', 'Nado Rápido', '2', 80, 82, 78, 95, 80, 85, '054', NULL, 0),
(60, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/56.png', 'Mankey', '056', 'Se irrita fácilmente.', 7, NULL, 28.00, 0.50, 305, 'Cerdo', 'Espíritu Vital', '2', 40, 80, 35, 35, 45, 70, '057', NULL, 0),
(61, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/57.png', 'Primeape', '057', 'Su furia nunca disminuye.', 7, NULL, 32.00, 1.00, 455, 'Cerdo', 'Espíritu Vital', '2', 65, 105, 60, 60, 70, 95, '056', NULL, 0),
(62, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/58.png', 'Growlithe', '058', 'Siempre protegerá a su entrenador.', 2, NULL, 19.00, 0.70, 350, 'Cachorro', 'Absorbe Fuego', '2', 55, 70, 45, 70, 50, 60, '059', NULL, 0),
(63, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/59.png', 'Arcanine', '059', 'Corre más rápido que un coche.', 2, NULL, 155.00, 1.90, 555, 'Legendario', 'Absorbe Fuego', '2', 90, 110, 80, 100, 80, 95, '058', NULL, 0),
(130, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/63.png', 'Abra', '063', 'Puede usar sus poderes psíquicos mientras duerme.', 11, NULL, 19.50, 0.90, 310, 'Psi', 'Sincronía', '2', 25, 20, 15, 105, 55, 90, '064', '065', 0),
(131, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/64.png', 'Kadabra', '064', 'Emite ondas alfa especiales que causan dolores de cabeza.', 11, NULL, 56.50, 1.30, 400, 'Psi', 'Sincronía', '2', 40, 35, 30, 120, 70, 105, '064', '065', 0),
(132, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/65.png', 'Alakazam', '065', 'Su cerebro superdesarrollado puede superar a una supercomputadora.', 11, NULL, 48.00, 1.50, 500, 'Psi', 'Sincronía', '2', 55, 50, 45, 135, 95, 120, '063', '064', 0),
(133, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/66.png', 'Machop', '066', 'Adora ejercitarse. Se entrena levantando Graveler como pesas.', 7, NULL, 19.50, 0.80, 305, 'Superpoder', 'Agallas', '2', 70, 80, 50, 35, 35, 35, '067', '068', 1),
(134, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/67.png', 'Machoke', '067', 'Su musculoso cuerpo es tan fuerte que usa un cinturón de potencia para contener su energía.', 7, NULL, 70.50, 1.50, 405, 'Superpoder', 'Agallas', '2', 80, 100, 70, 50, 60, 45, '066', '068', 0),
(135, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/68.png', 'Machamp', '068', 'Puede lanzar mil puñetazos en solo dos segundos.', 7, NULL, 130.00, 1.60, 505, 'Superpoder', 'Agallas', '2', 90, 130, 80, 65, 85, 55, '066', '067', 0),
(136, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/69.png', 'Bellsprout', '069', 'Prefiere lugares cálidos y húmedos. Atrapa pequeños insectos con sus lianas.', 5, 8, 4.00, 0.70, 300, 'Flor', 'Clorofila', '2', 50, 75, 35, 70, 30, 40, '070', '071', 0),
(137, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/70.png', 'Weepinbell', '070', 'Escupe veneno para derribar a su presa y luego la devora.', 5, 8, 6.40, 1.00, 390, 'Flor', 'Clorofila', '2', 65, 90, 50, 85, 45, 55, '069', '071', 0),
(138, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/71.png', 'Victreebel', '071', 'Atrae a su presa con un dulce aroma de miel. Una vez dentro de su boca, la digiere en un día.', 5, 8, 15.50, 1.70, 490, 'Flor', 'Clorofila', '2', 80, 105, 65, 100, 70, 70, '069', '070', 0),
(139, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/72.png', 'Tentacool', '072', 'Flota en aguas poco profundas. Los pescadores pueden ser picados por sus tentáculos venenosos.', 3, 8, 45.50, 0.90, 335, 'Medusa', 'Cuerpo puro', '2', 40, 40, 35, 50, 100, 70, '073', NULL, 0),
(140, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/73.png', 'Tentacruel', '073', 'Los tentáculos que tiene normalmente retraídos pueden extenderse libremente.', 3, 8, 55.00, 1.60, 515, 'Medusa', 'Cuerpo puro', '2', 80, 70, 65, 80, 120, 100, '072', NULL, 0),
(141, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/74.png', 'Geodude', '074', 'Se encuentra en campos y montañas. Se confunde con las rocas normales.', 13, 9, 20.00, 0.40, 300, 'Roca', 'Cabeza roca', '2', 40, 80, 100, 30, 30, 20, '075', '076', 0),
(142, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/75.png', 'Graveler', '075', 'Rueda montaña abajo aplastando todo a su paso. Se detiene solo cuando choca.', 13, 9, 105.00, 1.00, 390, 'Roca', 'Cabeza roca', '2', 55, 95, 115, 45, 45, 35, '074', '076', 0),
(143, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/76.png', 'Golem', '076', 'Su cuerpo duro como la roca es resistente incluso a explosivos de dinamita.', 13, 9, 300.00, 1.40, 495, 'Megatón', 'Cabeza roca', '2', 80, 120, 130, 55, 65, 45, '074', '075', 0),
(144, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/77.png', 'Ponyta', '077', 'Sus cascos son 10 veces más duros que el diamante. Puede pisotear cualquier cosa en segundos.', 2, NULL, 30.00, 1.00, 410, 'Caballo fuego', 'Fuga', '2', 50, 85, 55, 65, 65, 90, '078', NULL, 0),
(145, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/78.png', 'Rapidash', '078', 'Muy competitivo, perseguirá cualquier cosa que se mueva rápido con la esperanza de ganar una carrera.', 2, NULL, 95.00, 1.70, 500, 'Caballo fuego', 'Fuga', '2', 65, 100, 70, 80, 80, 105, '077', NULL, 0),
(146, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/79.png', 'Slowpoke', '079', 'Increíblemente lento y perezoso. Tarda 5 segundos en sentir dolor cuando es atacado.', 3, 11, 36.00, 1.20, 315, 'Atontado', 'Despiste', '2', 90, 65, 65, 40, 40, 15, '080', NULL, 0),
(147, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/80.png', 'Slowbro', '080', 'El Shellder en su cola se alimenta de sus restos. Si el Shellder se suelta, vuelve a ser Slowpoke.', 3, 11, 78.50, 1.60, 490, 'Hermitaño', 'Despiste', '2', 95, 75, 110, 100, 80, 30, '079', NULL, 0),
(148, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/81.png', 'Magnemite', '081', 'Se mueve flotando con energía electromagnética. Apaga toda la energía eléctrica en su vecindad.', 4, 17, 6.00, 0.30, 325, 'Imán', 'Imán', '3', 25, 35, 70, 95, 55, 45, '082', NULL, 0),
(149, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/82.png', 'Magneton', '082', 'Formado por varios Magnemite unidos. Aparece frecuentemente durante las tormentas solares.', 4, 17, 60.00, 1.00, 465, 'Imán', 'Imán', '3', 50, 60, 95, 120, 70, 70, '081', NULL, 0),
(150, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/83.png', 'Farfetch\'d', '083', 'Vive donde crecen los puerros. Raramente se ve sin el puerro que usa como arma.', 1, 10, 15.00, 0.80, 352, 'Pato salvaje', 'Vista lince', '2', 52, 65, 55, 58, 62, 60, NULL, NULL, 0),
(151, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/84.png', 'Doduo', '084', 'Un pájaro que corre a 60 mph. Sus dos cabezas representan la alegría y la tristeza.', 1, 10, 39.20, 1.40, 310, 'Pájaro gemelo', 'Fuga', '2', 35, 85, 45, 35, 35, 75, '085', NULL, 0),
(152, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/85.png', 'Dodrio', '085', 'Usa sus tres cerebros para ejecutar planes complejos. Mientras dos cabezas duermen, una vigila.', 1, 10, 85.20, 1.80, 460, 'Pájaro triple', 'Fuga', '2', 60, 110, 70, 60, 60, 100, '084', NULL, 0),
(153, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/86.png', 'Seel', '086', 'El cuerno protuberante en su cabeza es muy duro. Se usa para romper el hielo.', 3, NULL, 90.00, 1.10, 325, 'León marino', 'Sebo', '2', 65, 45, 55, 45, 70, 45, '087', NULL, 0),
(154, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/87.png', 'Dewgong', '087', 'Almacena energía térmica en su cuerpo. Nada a 8 nudos incluso en aguas gélidas.', 3, 6, 120.00, 1.70, 475, 'León marino', 'Sebo', '2', 90, 70, 80, 70, 95, 70, '086', NULL, 0),
(155, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/88.png', 'Grimer', '088', 'Hecho de lodo tóxico endurecido. Aparece en zonas industriales contaminadas.', 8, NULL, 30.00, 0.90, 325, 'Lodo', 'Hedor', '2', 80, 80, 50, 40, 50, 25, '089', NULL, 0),
(156, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/89.png', 'Muk', '089', 'Deja un rastro de lodo tóxico donde pasa. Es tan tóxico que incluso la hierba no crece allí.', 8, NULL, 30.00, 1.20, 500, 'Lodo', 'Hedor', '2', 105, 105, 75, 65, 100, 50, '088', NULL, 0),
(157, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/90.png', 'Shellder', '090', 'Está protegido por una concha muy dura. Solo se abre cuando ataca.', 3, NULL, 4.00, 0.30, 305, 'Bivalvo', 'Caparazón', '2', 30, 65, 100, 45, 25, 40, '091', NULL, 0),
(158, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/91.png', 'Cloyster', '091', 'Cuando es atacado, dispara sus cuernos como misiles. La parte interior de su concha es muy suave.', 3, 6, 132.50, 1.50, 525, 'Bivalvo', 'Caparazón', '2', 50, 95, 180, 85, 45, 70, '090', NULL, 0),
(159, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/92.png', 'Gastly', '092', 'Casi invisible, este Pokémon gaseoso envuelve a sus enemigos para dormirlos sin que se den cuenta.', 8, 14, 0.10, 1.30, 310, 'Gas', 'Levitación', '2', 30, 35, 30, 100, 35, 80, '093', '094', 0),
(160, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/93.png', 'Haunter', '093', 'Por su risa espeluznante, se dice que si lo escuchas en la oscuridad, te llevará al más allá.', 8, 14, 0.10, 1.60, 405, 'Gas', 'Levitación', '2', 45, 50, 45, 115, 55, 95, '092', '094', 0),
(161, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/94.png', 'Gengar', '094', 'En las noches de luna llena, a Gengar le gusta imitar las sombras de la gente y burlarse de sus miedos.', 8, 14, 40.50, 1.50, 500, 'Sombra', 'Levitación', '2', 60, 65, 60, 130, 75, 110, '092', '093', 0),
(162, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/95.png', 'Onix', '095', 'A medida que excava en el suelo, absorbe muchas sustancias duras que hacen que su cuerpo sea sólido como el diamante.', 13, 9, 210.00, 8.80, 385, 'Serpiente roca', 'Cabeza roca', '2', 35, 45, 160, 30, 45, 70, NULL, NULL, 0),
(163, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/96.png', 'Drowzee', '096', 'Se alimenta de los sueños de la gente. Si duerme cerca, puede comerse tus pesadillas.', 11, NULL, 32.40, 1.00, 328, 'Hipnosis', 'Insomnio', '2', 60, 48, 45, 43, 90, 42, '097', NULL, 0),
(164, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/97.png', 'Hypno', '097', 'Lleva un péndulo en la mano. El movimiento de balanceo puede hipnotizar a cualquiera que lo mire.', 11, NULL, 75.60, 1.60, 483, 'Hipnosis', 'Insomnio', '2', 85, 73, 70, 73, 115, 67, '096', NULL, 0),
(165, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/98.png', 'Krabby', '098', 'Sus pinzas son excelentes armas. A veces se desprenden, pero vuelven a crecer rápidamente.', 3, NULL, 6.50, 0.40, 325, 'Cangrejo', 'Corte fuerte', '2', 30, 105, 90, 25, 25, 50, '099', NULL, 0),
(166, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/99.png', 'Kingler', '099', 'La pinza grande tiene 10,000 caballos de fuerza, pero es demasiado pesada para moverse con facilidad.', 3, NULL, 60.00, 1.30, 475, 'Tenaza', 'Corte fuerte', '2', 55, 130, 115, 50, 50, 75, '098', NULL, 0),
(167, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/100.png', 'Voltorb', '100', 'Se asemeja a una Poké Ball. Es peligroso porque puede autodestruirse con la más mínima provocación.', 4, NULL, 10.40, 0.50, 330, 'Bola', 'Absorbe electricidad', '3', 40, 30, 50, 55, 55, 100, '101', NULL, 0),
(168, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/101.png', 'Electrode', '101', 'Almacena una gran cantidad de energía eléctrica bajo presión. Explota con el más mínimo impacto.', 4, NULL, 66.60, 1.20, 480, 'Bola', 'Absorbe electricidad', '3', 60, 50, 70, 80, 80, 140, '100', NULL, 0),
(169, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/102.png', 'Exeggcute', '102', 'A menudo se confunde con huevos. Cuando se separan, se comunican telepáticamente.', 5, 11, 2.50, 0.40, 325, 'Huevo', 'Clorofila', '2', 60, 40, 80, 60, 45, 40, '103', NULL, 0),
(170, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/103.png', 'Exeggutor', '103', 'Conocido como \"la jungla en un Pokémon\". Cada una de sus cabezas tiene su propia voluntad.', 5, 11, 120.00, 2.00, 520, 'Coco', 'Clorofila', '2', 95, 95, 85, 125, 65, 55, '102', NULL, 0),
(171, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/104.png', 'Cubone', '104', 'Lleva el cráneo de su madre fallecida. Su llanto solitario hace eco en su cráneo hueco.', 9, NULL, 6.50, 0.40, 320, 'Solitario', 'Cabeza roca', '2', 50, 50, 95, 40, 50, 35, '105', NULL, 0),
(172, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/105.png', 'Marowak', '105', 'El hueso que usa como arma es en realidad el de su madre. Lo gira hábilmente para golpear.', 9, NULL, 45.00, 1.00, 425, 'Protector', 'Cabeza roca', '2', 60, 80, 110, 50, 80, 45, '104', NULL, 0),
(173, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/106.png', 'Hitmonlee', '106', 'Sus patas se estiran elásticamente en combate. Puede patear desde cualquier ángulo.', 7, NULL, 49.80, 1.50, 455, 'Patada', 'Flexibilidad', '0', 50, 120, 53, 35, 110, 87, NULL, NULL, 0),
(174, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/107.png', 'Hitmonchan', '107', 'Sus puñetazos cortan el aire. Son tan rápidos que la menor distracción puede hacer que pierdas de vista uno.', 7, NULL, 50.20, 1.40, 455, 'Puñetazo', 'Vista lince', '0', 50, 105, 79, 35, 110, 76, NULL, NULL, 0),
(175, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/108.png', 'Lickitung', '108', 'Su lengua tiene más de 2 metros. Al lamer, causa parálisis y deja un extraño sabor salado.', 1, NULL, 65.50, 1.20, 385, 'Lengua', 'Despiste', '2', 90, 55, 75, 60, 75, 30, NULL, NULL, 0),
(176, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/109.png', 'Koffing', '109', 'Debido a su naturaleza tóxica, algunas personas lo usan para fabricar gas venenoso como arma.', 8, NULL, 1.00, 0.60, 340, 'Gas venenoso', 'Levitación', '2', 40, 65, 95, 60, 45, 35, '110', NULL, 0),
(177, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/110.png', 'Weezing', '110', 'Donde dos tipos de gases venenosos se encuentran, dos Koffing pueden fusionarse en un Weezing.', 8, NULL, 9.50, 1.20, 490, 'Gas venenoso', 'Levitación', '2', 65, 90, 120, 85, 70, 60, '109', NULL, 0),
(178, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/111.png', 'Rhyhorn', '111', 'Su cerebro diminuto lo hace muy simple. No recuerda mucho más que destruir todo lo que ve.', 9, 13, 115.00, 1.00, 345, 'Punta', 'Cabeza roca', '2', 80, 85, 95, 30, 30, 25, '112', NULL, 0),
(179, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/112.png', 'Rhydon', '112', 'Protegido por una armadura como de acero, puede vivir en lava a 3,600 grados.', 9, 13, 120.00, 1.90, 485, 'Taladro', 'Cabeza roca', '2', 105, 130, 120, 45, 45, 40, '111', NULL, 0),
(180, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/113.png', 'Chansey', '113', 'Un Pokémon raro y difícil de atrapar que trae felicidad a quien lo posea.', 1, NULL, 34.60, 1.10, 450, 'Huevo', 'Cura natural', '8', 250, 5, 5, 35, 105, 50, NULL, NULL, 0),
(181, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/114.png', 'Tangela', '114', 'Su cuerpo está cubierto de enredaderas similares a algas. Se mueven como si estuvieran vivas.', 5, NULL, 35.00, 1.00, 435, 'Enredadera', 'Clorofila', '2', 65, 55, 115, 100, 40, 60, NULL, NULL, 0),
(182, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/115.png', 'Kangaskhan', '115', 'El bebé rara vez sale de la bolsa protectora de la madre hasta que tiene 3 años.', 1, NULL, 80.00, 2.20, 490, 'Madre', 'Madriguera', '8', 105, 95, 80, 40, 80, 90, NULL, NULL, 0),
(183, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/116.png', 'Horsea', '116', 'Conoce el movimiento de su oponente con las vibraciones del agua antes de que ocurra.', 3, NULL, 8.00, 0.40, 295, 'Dragón', 'Nado rápido', '2', 30, 40, 70, 70, 25, 60, '117', NULL, 0),
(184, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/117.png', 'Seadra', '117', 'Las espinas que tiene en el cuerpo son venenosas. Golpea a los enemigos con sus aletas.', 3, NULL, 25.00, 1.20, 440, 'Dragón', 'Punto tóxico', '2', 55, 65, 95, 95, 45, 85, '116', NULL, 0),
(185, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/118.png', 'Goldeen', '118', 'Su aleta caudal ondea elegantemente en el agua. Por eso se le llama el Bailarín del Agua.', 3, NULL, 15.00, 0.60, 320, 'Pez cola', 'Nado rápido', '2', 45, 67, 60, 35, 50, 63, '119', NULL, 0),
(186, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/119.png', 'Seaking', '119', 'En otoño, los machos pueden verse bailando en los ríos para atraer a las hembras.', 3, NULL, 39.00, 1.30, 450, 'Pez cola', 'Nado rápido', '2', 80, 92, 65, 65, 80, 68, '118', NULL, 0),
(187, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/120.png', 'Staryu', '120', 'Incluso si su cuerpo es cortado, puede regenerarse siempre que la parte central permanezca intacta.', 3, NULL, 34.50, 0.80, 340, 'Estrella', 'Cura natural', '3', 30, 45, 55, 70, 55, 85, '121', NULL, 0),
(188, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/121.png', 'Starmie', '121', 'Su núcleo central brilla con los siete colores del arcoíris. Algunas personas lo valoran como una gema.', 3, 11, 80.00, 1.10, 520, 'Misterioso', 'Iluminación', '3', 60, 75, 85, 100, 85, 115, '120', NULL, 0),
(189, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/122.png', 'Mr. Mime', '122', 'Es un maestro de la pantomima. Sus gestos hacen que las cosas parezcan reales.', 11, 18, 54.50, 1.30, 460, 'Barrera', 'Insonorizar', '2', 40, 45, 65, 100, 120, 90, NULL, NULL, 0),
(190, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/123.png', 'Scyther', '123', 'Con sus afiladas garras, es un maestro de los ataques de corte. Se mueve tan rápido que apenas se ve.', 12, 10, 56.00, 1.50, 500, 'Mantis', 'Enjambre', '2', 70, 110, 80, 55, 80, 105, NULL, NULL, 0),
(191, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/124.png', 'Jynx', '124', 'Habla en un lenguaje que parece humano. Se cree que está intentando comunicarse.', 6, 11, 40.60, 1.40, 455, 'Humanoide', 'Despiste', '8', 65, 50, 35, 115, 95, 95, NULL, NULL, 0),
(192, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/125.png', 'Electabuzz', '125', 'Normalmente se encuentra cerca de centrales eléctricas. Puede causar apagones al drenar energía.', 4, NULL, 30.00, 1.10, 490, 'Eléctrico', 'Electricidad estática', '2', 65, 83, 57, 95, 85, 105, NULL, NULL, 0),
(193, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/126.png', 'Magmar', '126', 'Nace en volcanes activos. Su cuerpo está envuelto en llamas que brillan como el sol.', 2, NULL, 44.50, 1.30, 495, 'Escupir fuego', 'Cuerpo llama', '2', 65, 95, 57, 100, 85, 93, NULL, NULL, 0),
(194, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/127.png', 'Pinsir', '127', 'Agarra a su presa con sus poderosas pinzas y la parte por la mitad. No puede soportar el frío.', 12, NULL, 55.00, 1.50, 500, 'Escarabajo', 'Corte fuerte', '2', 65, 125, 100, 55, 70, 85, NULL, NULL, 0),
(195, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/128.png', 'Tauros', '128', 'Cuando se enfurece, golpea el suelo con sus pezuñas y embiste con sus cuernos afilados.', 1, NULL, 88.40, 1.40, 490, 'Toro salvaje', 'Intimidación', '0', 75, 100, 95, 40, 70, 110, NULL, NULL, 0),
(196, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/129.png', 'Magikarp', '129', 'Un Pokémon patético y débil que apenas puede saltar. Aparece en aguas de todo el mundo.', 3, NULL, 10.00, 0.90, 200, 'Pez', 'Nado rápido', '2', 20, 10, 55, 15, 20, 80, '130', NULL, 0),
(197, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/130.png', 'Gyarados', '130', 'Raramente aparece. Cuando lo hace, arrasa ciudades enteras y las deja en ruinas.', 3, 10, 235.00, 6.50, 540, 'Atrocidad', 'Intimidación', '2', 95, 125, 79, 60, 100, 81, '129', NULL, 0),
(198, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/131.png', 'Lapras', '131', 'Un Pokémon que ha sido cazado casi hasta la extinción. Puede transportar personas a través del agua.', 3, 6, 220.00, 2.50, 535, 'Transporte', 'Absorbe agua', '2', 130, 85, 80, 85, 95, 60, NULL, NULL, 0),
(199, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/132.png', 'Ditto', '132', 'Capaz de copiar el código genético de un oponente para transformarse en una réplica perfecta.', 1, NULL, 4.00, 0.30, 288, 'Transformación', 'Flexibilidad', '3', 48, 48, 48, 48, 48, 48, NULL, NULL, 0),
(200, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/133.png', 'Eevee', '133', 'Su código genético irregular le permite evolucionar en múltiples formas dependiendo de su entorno.', 1, NULL, 6.50, 0.30, 325, 'Evolución', 'Fuga', '2', 55, 55, 50, 45, 65, 55, NULL, NULL, 0),
(201, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/134.png', 'Vaporeon', '134', 'Su estructura celular es similar a las moléculas de agua. Se funde invisiblemente con el agua.', 3, NULL, 29.00, 1.00, 525, 'Burbuja', 'Absorbe agua', '2', 130, 65, 60, 110, 95, 65, '133', NULL, 0),
(202, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/135.png', 'Jolteon', '135', 'Acumula electricidad estática en su pelaje para lanzar descargas de 10,000 voltios.', 4, NULL, 24.50, 0.80, 525, 'Relámpago', 'Absorbe electricidad', '2', 65, 65, 60, 110, 95, 130, '133', NULL, 0),
(203, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/136.png', 'Flareon', '136', 'Almacena aire en su cuerpo para calentarlo hasta 1,700 grados Fahrenheit antes de exhalarlo.', 2, NULL, 25.00, 0.90, 525, 'Llama', 'Absorbe fuego', '2', 65, 130, 60, 95, 110, 65, '133', NULL, 0),
(204, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/137.png', 'Porygon', '137', 'El primer Pokémon creado artificialmente, puede moverse libremente en el espacio digital.', 1, NULL, 36.50, 0.80, 395, 'Virtual', 'Rastro', '3', 65, 60, 70, 85, 75, 40, NULL, NULL, 0),
(205, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/138.png', 'Omanyte', '138', 'Un Pokémon prehistórico que se regeneró a partir de un fósil. Vive en una concha espiral.', 13, 3, 7.50, 0.40, 355, 'Espiral', 'Nado rápido', '2', 35, 40, 100, 90, 55, 35, '139', NULL, 0),
(206, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/139.png', 'Omastar', '139', 'Su afilado pico era su arma principal. Se extinguió cuando su concha se volvió demasiado grande.', 13, 3, 35.00, 1.00, 495, 'Espiral', 'Nado rápido', '2', 70, 60, 125, 115, 70, 55, '138', NULL, 0),
(207, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/140.png', 'Kabuto', '140', 'Un Pokémon fósil que se regeneró. Se cree que vivía en playas hace 300 millones de años.', 13, 3, 11.50, 0.50, 355, 'Crustáceo', 'Nado rápido', '2', 30, 80, 90, 55, 45, 55, '141', NULL, 0),
(208, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/141.png', 'Kabutops', '141', 'Su forma aerodinámica le permitía nadar rápidamente. Cortaba a sus presas con sus afiladas garras.', 13, 3, 40.50, 1.30, 495, 'Crustáceo', 'Nado rápido', '2', 60, 115, 105, 65, 70, 80, '140', NULL, 0),
(209, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/142.png', 'Aerodactyl', '142', 'Un Pokémon feroz de la prehistoria que atacaba con sus afilados colmillos como cuchillas.', 13, 10, 59.00, 1.80, 515, 'Fósil', 'Cabeza roca', '2', 80, 105, 65, 60, 75, 130, NULL, NULL, 0),
(210, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/143.png', 'Snorlax', '143', 'No se despierta ni para comer. Solo se despierta cuando tiene hambre.', 1, NULL, 460.00, 2.10, 540, 'Dormir', 'Sebo', '2', 160, 110, 65, 65, 110, 30, NULL, NULL, 0),
(211, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/144.png', 'Articuno', '144', 'Un Pokémon pájaro legendario que puede controlar el hielo. Vuela con alas que brillan como cristal.', 6, 10, 55.40, 1.70, 580, 'Congelar', 'Presión', '3', 90, 85, 100, 95, 125, 85, NULL, NULL, 0),
(212, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/145.png', 'Zapdos', '145', 'Un Pokémon pájaro legendario que puede controlar la electricidad. Causa tormentas eléctricas al batir sus alas.', 4, 10, 52.60, 1.60, 580, 'Electricidad', 'Presión', '3', 90, 90, 85, 125, 90, 100, NULL, NULL, 0),
(213, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/146.png', 'Moltres', '146', 'Un Pokémon pájaro legendario que puede controlar el fuego. Se dice que su cuerpo arde con llamas brillantes.', 2, 10, 60.00, 2.00, 580, 'Llama', 'Presión', '3', 90, 100, 90, 125, 85, 90, NULL, NULL, 0),
(214, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/147.png', 'Dratini', '147', 'Larga considerado una criatura mítica. Puede crecer hasta alcanzar tamaños inmensos.', 15, NULL, 3.30, 1.80, 300, 'Dragón', 'Mudar', '2', 41, 64, 45, 50, 50, 50, '148', '149', 0),
(215, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/148.png', 'Dragonair', '148', 'Un Pokémon místico que exuda un aura serena. Puede controlar el clima cambiando su cuerpo.', 15, NULL, 16.50, 4.00, 420, 'Dragón', 'Mudar', '2', 61, 84, 65, 70, 70, 70, '149', '147', 0),
(216, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/149.png', 'Dragonite', '149', 'Un Pokémon muy inteligiente y poderoso. Puede volar más rápido que el sonido.', 15, 10, 210.00, 2.20, 600, 'Dragón', 'Foco interno', '2', 91, 134, 95, 100, 100, 80, '147', '148', 0),
(217, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/150.png', 'Mewtwo', '150', 'Fue creado por manipulación genética. Sin embargo, a pesar de su poder científico, no puede sentir compasión.', 11, NULL, 122.00, 2.00, 680, 'Genético', 'Presión', '3', 106, 110, 90, 154, 90, 130, NULL, NULL, 0),
(218, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/151.png', 'Mew', '151', 'Se dice que posee el código genético de todos los Pokémon. Puede aprender cualquier movimiento.', 11, NULL, 4.00, 0.40, 600, 'Nueva especie', 'Sincronía', '3', 100, 100, 100, 100, 100, 100, NULL, NULL, 1);

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `user` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` varchar(100) NOT NULL,
  `favoritos` varchar(200) NOT NULL,
  `equipo` varchar(50) NOT NULL,
  `skin` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `user`, `correo`, `contraseña`, `favoritos`, `equipo`, `skin`) VALUES
(1, 'AshKetchum', 'ash@pokemon.com', 'pikachu123', '001,004,007,025,150,006', '003,006,005,002,001,009', 1),
(2, 'MistyWaterflower', 'misty@pokemon.com', 'togepi456', '054,118,183,007,130', '143,003,103,006,094,001', 2),
(3, 'BrockRock', 'brock@pokemon.com', 'onix789', '149,065,112,059,131,068', '149,065,112,059,131,068', 7),
(4, 'GaryOak', 'gary@pokemon.com', 'eevee321', '009,065,076,130,094,151', '009,065,076,130,094,151', 3),
(5, 'MayHaruka', 'may@pokemon.com', 'torchic654', '003,130,068,134,101,094\n\n', '130,003,068,094,134,150', 4),
(12, 'Celeste', 'zoe@gmai.com', '123456', '001,005,007,004,003,010,011,150', '078,144,068,105,104,009', 6);

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
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pokemones`
--
ALTER TABLE `pokemones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=219;

--
-- AUTO_INCREMENT de la tabla `tipos`
--
ALTER TABLE `tipos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
