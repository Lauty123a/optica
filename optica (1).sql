-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-07-2025 a las 11:30:12
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
-- Base de datos: `optica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `armazon`
--

CREATE TABLE `armazon` (
  `id_armazon` int(11) NOT NULL,
  `material` text NOT NULL,
  `color` text NOT NULL,
  `tipo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombre_cliente` text NOT NULL,
  `apellido_cliente` text NOT NULL,
  `fecnac_cliente` date NOT NULL,
  `dni_cliente` int(11) NOT NULL,
  `telefono_cliente` bigint(20) NOT NULL,
  `email_cliente` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre_cliente`, `apellido_cliente`, `fecnac_cliente`, `dni_cliente`, `telefono_cliente`, `email_cliente`) VALUES
(1, 'franco', 'acosta', '2006-07-31', 46653723, 3516783467, 'franquitocrack@gmail.com'),
(2, 'fac', 'zapata', '2025-07-03', 12312321, 3513902433, 'asd@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallepedido`
--

CREATE TABLE `detallepedido` (
  `id_detalle` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `ojo` text NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `dni` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `nombre`, `apellido`, `dni`, `email`, `telefono`) VALUES
(1, 'lautaro', 'maquera', 47664576, 'maqueralautaro@gmail.com', 3513902499),
(2, 'luka', 'ohoyola', 45776123, 'luka@gmail.com', 3513902488),
(4, 'lukas', 'ohoyolas', 45776127, 'luka2@gmail.com', 3513902487),
(7, 'lukas', 'ohoyolas', 45776154, 'luka42@gmail.com', 3513902487),
(9, 'amadeo', 'pep', 45776543, 'pepe42@gmail.com', 3513902485),
(10, 'santi', 'santos', 32114321, 'santi@gmail.com', 31312),
(11, 'a', 's', 23132132, 'mend2oza123@gmail.com', 1321312312),
(12, 'roma', 's', 12312312, 'mend223oza123@gmail.com', 3513902484),
(14, 'romas', 'sa', 12312314, 'mend223o3za123@gmail.com', 3513902487);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id_marca` int(11) NOT NULL,
  `nombre_marca` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id_marca`, `nombre_marca`) VALUES
(1, 'nike'),
(2, 'adidas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `fecha_pedido` date NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `estado_pedido` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `fecha_pedido`, `id_cliente`, `estado_pedido`) VALUES
(1, '2025-07-01', 1, 'preparando');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `tipo_lente` text NOT NULL,
  `material_base` text NOT NULL,
  `id_marca` int(11) NOT NULL,
  `id_tratamiento` int(11) NOT NULL,
  `color` text NOT NULL,
  `imagen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `tipo_lente`, `material_base`, `id_marca`, `id_tratamiento`, `color`, `imagen`) VALUES
(1, 'medianos como plato de cocina', 'papel', 1, 1, 'azul vida', 'imagenes/prod_68809278401ee9.82901184.jpg'),
(2, 'grandes como botella de 3L', 'plastico', 2, 2, 'rojo facherito', 'uploads/prod_688096e0d23f87.86593502.jpg'),
(3, 'pequeños como anillo', 'carton', 1, 1, 'marron caca', 'imagenes/prod_688096a7d16068.81196977.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta`
--

CREATE TABLE `receta` (
  `id_receta` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `fecha_pedido` date NOT NULL,
  `od_esfera` decimal(5,0) NOT NULL,
  `od_eje` int(10) NOT NULL,
  `od_cilindro` decimal(5,0) NOT NULL,
  `oi_esfera` decimal(5,0) NOT NULL,
  `oi_eje` int(10) NOT NULL,
  `oi_cilindro` decimal(5,0) NOT NULL,
  `od_adicion` decimal(5,0) NOT NULL,
  `oi_adicion` decimal(5,0) NOT NULL,
  `od_prisma` int(11) NOT NULL,
  `oi_prisma` int(11) NOT NULL,
  `distancia_pupilar_binocular` varchar(50) NOT NULL,
  `distancia_pupilar_monocular` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `receta`
--

INSERT INTO `receta` (`id_receta`, `pedido_id`, `id_cliente`, `fecha_pedido`, `od_esfera`, `od_eje`, `od_cilindro`, `oi_esfera`, `oi_eje`, `oi_cilindro`, `od_adicion`, `oi_adicion`, `od_prisma`, `oi_prisma`, `distancia_pupilar_binocular`, `distancia_pupilar_monocular`) VALUES
(1, 1, 1, '2025-07-01', 3, 3, 2, 1, 1, 3, 2, 2, 2, 2, '2', '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamiento`
--

CREATE TABLE `tratamiento` (
  `id_tratamiento` int(11) NOT NULL,
  `nombre_tratamiento` text NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tratamiento`
--

INSERT INTO `tratamiento` (`id_tratamiento`, `nombre_tratamiento`, `descripcion`) VALUES
(1, 'ciega como dora', 'miope q no ve nada'),
(2, 'veo borroso', 'terromotos oculares');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `fecha_registro` datetime NOT NULL,
  `id_empleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `usuario`, `password`, `id_cliente`, `fecha_registro`, `id_empleado`) VALUES
(1, 'lauty123', '123', 0, '2025-05-27 16:45:56', NULL),
(2, 'fac', '123', 2, '2025-07-21 02:40:29', NULL),
(3, '37', '32', NULL, '2025-07-23 08:43:17', 14);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `armazon`
--
ALTER TABLE `armazon`
  ADD PRIMARY KEY (`id_armazon`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `dni_cliente` (`dni_cliente`);

--
-- Indices de la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id_marca`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_marca` (`id_marca`),
  ADD KEY `id_tratamiento` (`id_tratamiento`);

--
-- Indices de la tabla `receta`
--
ALTER TABLE `receta`
  ADD PRIMARY KEY (`id_receta`),
  ADD KEY `pedido_id` (`pedido_id`),
  ADD KEY `nombre_cliente` (`id_cliente`);

--
-- Indices de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  ADD PRIMARY KEY (`id_tratamiento`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `fk_usuario_empleado` (`id_empleado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `armazon`
--
ALTER TABLE `armazon`
  MODIFY `id_armazon` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `receta`
--
ALTER TABLE `receta`
  MODIFY `id_receta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  MODIFY `id_tratamiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD CONSTRAINT `detallepedido_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  ADD CONSTRAINT `detallepedido_ibfk_2` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`),
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`id_tratamiento`) REFERENCES `tratamiento` (`id_tratamiento`);

--
-- Filtros para la tabla `receta`
--
ALTER TABLE `receta`
  ADD CONSTRAINT `receta_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id_pedido`),
  ADD CONSTRAINT `receta_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
