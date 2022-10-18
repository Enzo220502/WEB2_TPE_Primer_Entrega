-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-10-2022 a las 04:43:46
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `catalogo_de_vehiculos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `types_of_vehicles`
--

CREATE TABLE `types_of_vehicles` (
  `ID` int(11) NOT NULL,
  `type` varchar(45) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `types_of_vehicles`
--

INSERT INTO `types_of_vehicles` (`ID`, `type`) VALUES
(1, 'Sport'),
(2, 'Sedan'),
(3, 'SUV'),
(4, 'Electric');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `rol` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`ID`, `username`, `password`, `rol`) VALUES
(1, 'admin', '$2y$10$w1bZ6sZ6L8y/iLAOR/5Mo.G2JU8.w5F7nELlOt', 'ADMINISTRADOR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehicles`
--

CREATE TABLE `vehicles` (
  `ID` int(11) NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 NOT NULL,
  `type_engine` varchar(45) CHARACTER SET utf8 NOT NULL,
  `id_type_vehicle` int(11) NOT NULL,
  `price` int(20) NOT NULL,
  `color` varchar(45) CHARACTER SET utf8 NOT NULL,
  `especifications` varchar(350) CHARACTER SET utf8 NOT NULL,
  `image_car` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `vehicles`
--

INSERT INTO `vehicles` (`ID`, `name`, `type_engine`, `id_type_vehicle`, `price`, `color`, `especifications`, `image_car`) VALUES
(45, 'Nissan Sentra', '2.0', 2, 3750000, 'Blue', 'El Sentra ofrece una mayor sensación de lujo que sus competidores: su motor de 2.0 litros y cuatro cilindros logra una aceleración más rápida que otros vehículos de su clase y, además, ofrece \"un viaje cómodo y una conducción ágil\", así como una cabina de pasajeros que está \"bien equipada para un vehículo de este precio\". La visibilidad es buena; l', 0x6e697373616e5f73656e7472612e6a7067),
(46, 'Subaru Forester', '2.5', 3, 4600000, 'Black', 'El Forester, que aparece por novena vez consecutiva en la lista de autos recomendados, recibió una \"leve actualización\" para el 2022 y en su diseño exterior se incorporaron detalles de color negro que, según Subaru, no solo son \"atractivos\", sino que cumplen una función \"protectora\". Según Consumer Reports: \"La clave del éxito del Forester ha sido ', 0x7375626172755f666f7265737465722e6a7067),
(47, 'Toyota Prius', '1.2 Hybrid', 4, 6000000, 'Black', 'El Prius, con su diseño aerodinámico, sigue estableciendo el estándar en cuanto a la eficiencia de combustible: \"En las pruebas [de Consumer Reports] recorrió 52 millas por galón, una cifra fenomenal\", y \"se destaca por sus niveles constantes de confiabilidad y satisfacción de sus propietarios\". El Prius Prime, un híbrido enchufable, puede recorrer', 0x546f796f74615f50726975732e6a7067),
(48, 'Chevrollet Camaro', 'Nafta 2.0', 1, 3200000, 'Grey', 'El Camaro SS en su versión manual emplea igualmente un V8 de 6162 cm³ (6,2 L; 376 plg³), pero se trata de un LS3 derivado del Corvette con 426 HP (432 CV; 318 kW) y un par máximo de 420 lb·pie (569 N·m), acoplado a una transmisión de seis cambios provista por Tremec. El L99 es una mecánica de menor compresión y revoluciones que el LS3.', 0x63686576726f6c65745f63616d61726f2e6a7067),
(49, 'Tesla Model S', 'Hybrid', 4, 6000000, 'Red', 'El Tesla Model S es un automóvil eléctrico tipo Sedán fabricado por Tesla Motors, que inició sus entregas en el mercado estadounidense el 22 de junio de 2012.1​ Es un sedán liftback para 5 plazas. En 2020 el Tesla Model S Long Range Plus tenía una autonomía EPA de 647 km, que era la mayor para un coche eléctrico de serie. En 2012 el modelo base (ba', 0x5465736c615f4d6f64656c5f532e6a7067);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `types_of_vehicles`
--
ALTER TABLE `types_of_vehicles`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `id_type_vehicle` (`id_type_vehicle`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `types_of_vehicles`
--
ALTER TABLE `types_of_vehicles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `vehicles`
--
ALTER TABLE `vehicles`
  ADD CONSTRAINT `vehicles_ibfk_1` FOREIGN KEY (`id_type_vehicle`) REFERENCES `types_of_vehicles` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
