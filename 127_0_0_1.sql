-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-10-2021 a las 22:17:15
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `centromedico`
--
CREATE DATABASE IF NOT EXISTS `centromedico` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `centromedico`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `idCita` int(11) NOT NULL,
  `citFecha` date NOT NULL,
  `citHora` time NOT NULL,
  `citPaciente` int(11) NOT NULL,
  `citMedico` int(11) NOT NULL,
  `citConsultorio` int(11) NOT NULL,
  `citEstado` enum('Asignado','Atendido') COLLATE utf8_spanish_ci NOT NULL DEFAULT 'Asignado',
  `citObservaciones` text COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`idCita`, `citFecha`, `citHora`, `citPaciente`, `citMedico`, `citConsultorio`, `citEstado`, `citObservaciones`) VALUES
(1, '2013-10-11', '22:00:00', 2, 2, 2, 'Atendido', 'Se hace revisiÃ³n de articulaciones y se envÃ­a exÃ¡menes de laboratorio'),
(2, '2013-10-25', '16:08:00', 3, 2, 4, 'Asignado', ''),
(3, '2014-02-28', '10:30:00', 9, 3, 4, 'Asignado', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultorios`
--

CREATE TABLE `consultorios` (
  `idConsultorio` int(11) NOT NULL,
  `conNombre` char(15) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `consultorios`
--

INSERT INTO `consultorios` (`idConsultorio`, `conNombre`) VALUES
(1, 'CON-101'),
(2, 'CON-102'),
(3, 'CON-201'),
(4, 'CON-202');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE `medicos` (
  `idMedico` int(11) NOT NULL,
  `medIdentificacion` char(15) COLLATE utf8_spanish_ci NOT NULL,
  `medNombres` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `medApellidos` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `medEspecialidad` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `medTelefono` char(15) COLLATE utf8_spanish_ci NOT NULL,
  `medCorreo` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `medicos`
--

INSERT INTO `medicos` (`idMedico`, `medIdentificacion`, `medNombres`, `medApellidos`, `medEspecialidad`, `medTelefono`, `medCorreo`) VALUES
(1, '21', 'Elkin', 'Patarroyos', 'Ginecologo', '55555556', 'elkin@gmail.com'),
(2, '22', 'Amparo', 'Grisales', 'Fisioterapeuta', '66666', 'amparo@gmail.com'),
(3, '23', 'Francisco', 'Maturana', 'Odontologo', '8888888', 'fmaturana@gmail.com'),
(4, '24', 'Sofia', 'Vergara', 'Cirujano Plastico', '343434', 'sofivergara@gmail.com'),
(5, '202020202', 'Jose Aurelio', 'Camacho Rodriguez', 'Cardiologo', '392002930', 'jose@correo.com'),
(7, '30903030', 'otro medico', 'con otro apellido', 'Medicina General', '2323', 'jose@correo.com'),
(8, '30302020', 'Carlos Arturo', 'Guerrero Pulido', 'Odontologo', '6547839201', 'carlos@correo.com'),
(9, '29380200', 'Orlando', 'Guerrero Pulido', 'Ginecologo', '65478392', 'orlando@correo.com'),
(10, '759398493', 'Luis Felipe', 'Guerrero Pulido', 'Medicina General', '02183928', 'felipe@correo.com'),
(14, '65748398', 'Jose Rafael', 'Castro Godoy', 'Cardiologo', '987654', 'jose@correo.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `idPaciente` int(11) NOT NULL,
  `pacIdentificacion` char(15) COLLATE utf8_spanish_ci NOT NULL,
  `pacNombres` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `pacApellidos` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `pacFechaNacimiento` date NOT NULL,
  `pacSexo` enum('Femenino','Masculino') COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`idPaciente`, `pacIdentificacion`, `pacNombres`, `pacApellidos`, `pacFechaNacimiento`, `pacSexo`) VALUES
(2, '12', 'Faustino', 'Asptrilla', '1972-05-21', 'Masculino'),
(3, '13', 'Carlos', 'Valderrama', '1965-11-10', 'Masculino'),
(6, '14', 'Rene', 'Higuita', '1975-09-23', 'Masculino'),
(7, '15', 'Mariana', 'Pajon', '1993-01-12', 'Femenino'),
(8, '16', 'Falcao', 'Garcia', '1987-12-12', 'Masculino'),
(9, '34324', 'maria', 'madrugada', '1980-12-12', 'Femenino'),
(10, '55', 'Pablo', 'Marmol', '1950-04-23', 'Masculino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `idRol` int(11) NOT NULL,
  `rolNombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`idRol`, `rolNombre`) VALUES
(1, 'administrador'),
(2, 'medico'),
(3, 'empleado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `usuLogin` char(15) COLLATE utf8_spanish_ci NOT NULL,
  `usuPassword` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `usuEstado` enum('Activo','Inactivo') COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `usuLogin`, `usuPassword`, `usuEstado`) VALUES
(1, 'Medico', 'c93b85830345deff3a39fa0578250420', 'Activo'),
(2, 'Asistente', '21a8277249d348a68f1ef4a5630184f8', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariosroles`
--

CREATE TABLE `usuariosroles` (
  `idusuariosRoles` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idRol` int(11) NOT NULL,
  `usuariosRolesEstado` enum('Activo','Inactivo') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`idCita`),
  ADD KEY `fk_paciente` (`citPaciente`),
  ADD KEY `fk_medico` (`citMedico`),
  ADD KEY `fk_consultorio` (`citConsultorio`);

--
-- Indices de la tabla `consultorios`
--
ALTER TABLE `consultorios`
  ADD PRIMARY KEY (`idConsultorio`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`idMedico`),
  ADD UNIQUE KEY `medIdentificacion` (`medIdentificacion`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`idPaciente`),
  ADD UNIQUE KEY `pacIdentificacion` (`pacIdentificacion`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `login` (`usuLogin`);

--
-- Indices de la tabla `usuariosroles`
--
ALTER TABLE `usuariosroles`
  ADD PRIMARY KEY (`idusuariosRoles`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idRol` (`idRol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `idCita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `consultorios`
--
ALTER TABLE `consultorios`
  MODIFY `idConsultorio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `medicos`
--
ALTER TABLE `medicos`
  MODIFY `idMedico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `idPaciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuariosroles`
--
ALTER TABLE `usuariosroles`
  MODIFY `idusuariosRoles` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `fk_consultorios_idConsultorio` FOREIGN KEY (`citConsultorio`) REFERENCES `consultorios` (`idConsultorio`),
  ADD CONSTRAINT `fk_medicos_idMedico` FOREIGN KEY (`citMedico`) REFERENCES `medicos` (`idMedico`),
  ADD CONSTRAINT `fk_pacientes_idPaciente` FOREIGN KEY (`citPaciente`) REFERENCES `pacientes` (`idPaciente`);
--
-- Base de datos: `crud`
--
CREATE DATABASE IF NOT EXISTS `crud` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `crud`;
--
-- Base de datos: `ditg`
--
CREATE DATABASE IF NOT EXISTS `ditg` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;
USE `ditg`;
--
-- Base de datos: `ditgv`
--
CREATE DATABASE IF NOT EXISTS `ditgv` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ditgv`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `idEvento` int(11) NOT NULL,
  `NombreEvento` varchar(45) DEFAULT NULL,
  `FechaEvento` date DEFAULT NULL,
  `HoraEvento` varchar(45) DEFAULT NULL,
  `DirecciónEvento` varchar(45) DEFAULT NULL,
  `DescripciónEvento` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`idEvento`, `NombreEvento`, `FechaEvento`, `HoraEvento`, `DirecciónEvento`, `DescripciónEvento`) VALUES
(1, NULL, NULL, NULL, NULL, NULL),
(2, NULL, NULL, NULL, NULL, NULL),
(3, NULL, NULL, NULL, NULL, NULL),
(4, NULL, NULL, NULL, NULL, NULL),
(5, NULL, NULL, NULL, NULL, NULL),
(6, NULL, NULL, NULL, NULL, NULL),
(7, NULL, NULL, NULL, NULL, NULL),
(8, NULL, NULL, NULL, NULL, NULL),
(9, NULL, NULL, NULL, NULL, NULL),
(10, 'Descuento', '0000-00-00', '11:00 am', 'cll8a #2-50', 'Descuentos desde el 80% a toda la tienda'),
(11, 'Promoción', '0000-00-00', '11:00 am', 'cll8a #2-50', '2x1 en cualquier producto'),
(12, 'jugues', '0000-00-00', 'nya', 'uwu', 'juguetes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotos`
--

CREATE TABLE `fotos` (
  `idFotosEvento` int(11) NOT NULL,
  `UrlFotos` varchar(45) DEFAULT NULL,
  `TipoFotos` enum('Evento','Lugar') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lugar`
--

CREATE TABLE `lugar` (
  `idLugar` int(11) NOT NULL,
  `NombreLugar` varchar(45) DEFAULT NULL,
  `DirecciónLugar` varchar(45) DEFAULT NULL,
  `ContactoLugar` varchar(45) DEFAULT NULL,
  `DescripciónLugar` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `lugar`
--

INSERT INTO `lugar` (`idLugar`, `NombreLugar`, `DirecciónLugar`, `ContactoLugar`, `DescripciónLugar`) VALUES
(1, 'cafeteria', 'cll8a #2-50', 'www.sebastian10@hotmail.com', 'si muy bonito todo'),
(2, 'Olimpica', 'el centro', '8888888', 'Un super mercado'),
(4, 'Heladeria', 'Parque', '3216374182', 'Ven a disfrutar los helados más sabrosos de l'),
(5, 'd', 's', 'a', 'si muy bonito todo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idRol` int(11) NOT NULL,
  `TipoRol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rolesusuario`
--

CREATE TABLE `rolesusuario` (
  `idRolesUsuario` int(11) NOT NULL,
  `Rol_idRol` int(11) NOT NULL,
  `Rol_idRol1` int(11) NOT NULL,
  `Usuario_idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `NombreUsuario` varchar(45) DEFAULT NULL,
  `ApellidoUsuario` varchar(45) DEFAULT NULL,
  `CorreoUsuario` varchar(45) DEFAULT NULL,
  `ContraseñaUsuario` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`idEvento`);

--
-- Indices de la tabla `fotos`
--
ALTER TABLE `fotos`
  ADD PRIMARY KEY (`idFotosEvento`);

--
-- Indices de la tabla `lugar`
--
ALTER TABLE `lugar`
  ADD PRIMARY KEY (`idLugar`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `rolesusuario`
--
ALTER TABLE `rolesusuario`
  ADD PRIMARY KEY (`idRolesUsuario`,`Rol_idRol`),
  ADD KEY `fk_RolesUsuario_Rol1_idx` (`Rol_idRol1`),
  ADD KEY `fk_RolesUsuario_Usuario1_idx` (`Usuario_idUsuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `idEvento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `lugar`
--
ALTER TABLE `lugar`
  MODIFY `idLugar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `rolesusuario`
--
ALTER TABLE `rolesusuario`
  ADD CONSTRAINT `fk_RolesUsuario_Rol1` FOREIGN KEY (`Rol_idRol1`) REFERENCES `rol` (`idRol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_RolesUsuario_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--
-- Base de datos: `oracle_test`
--
CREATE DATABASE IF NOT EXISTS `oracle_test` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `oracle_test`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `countries`
--

CREATE TABLE `countries` (
  `COUNTRY_ID` char(2) NOT NULL,
  `COUNTRY_NAME` varchar(40) DEFAULT NULL,
  `REGION_ID` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `countries`
--

INSERT INTO `countries` (`COUNTRY_ID`, `COUNTRY_NAME`, `REGION_ID`) VALUES
('CA', 'Canada', 2),
('DE', 'Germany', 1),
('UK', 'United Kingdom', 1),
('US', 'United States of America', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departments`
--

CREATE TABLE `departments` (
  `DEPARTMENT_ID` smallint(6) NOT NULL,
  `DEPARTMENT_NAME` varchar(30) NOT NULL,
  `MANAGER_ID` int(11) DEFAULT NULL,
  `LOCATION_ID` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `departments`
--

INSERT INTO `departments` (`DEPARTMENT_ID`, `DEPARTMENT_NAME`, `MANAGER_ID`, `LOCATION_ID`) VALUES
(10, 'Administration', 200, 1700),
(20, 'Marketing', 201, 1800),
(50, 'Shipping', 124, 1500),
(60, 'IT', 103, 1400),
(80, 'Sales', 149, 2500),
(90, 'Executive', 100, 1700),
(110, 'Accounting', 205, 1700),
(190, 'Contracting', NULL, 1700);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `d_cds`
--

CREATE TABLE `d_cds` (
  `CD_NUMBER` int(11) NOT NULL,
  `TITLE` varchar(50) NOT NULL,
  `PRODUCER` varchar(50) NOT NULL,
  `YEAR` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `d_cds`
--

INSERT INTO `d_cds` (`CD_NUMBER`, `TITLE`, `PRODUCER`, `YEAR`) VALUES
(90, 'The Celebrants Live in Concert', 'Old Town Records', '1997'),
(91, 'Party Music for All Occasions', 'The Music Man', '2000'),
(92, 'Back to the Shire', 'Middle Earth Records', '2002'),
(93, 'Songs from My Childhood', 'Old Town Records', '1999'),
(94, 'Carpe Diem', 'R & B Inc.', '2000'),
(95, 'Here Comes the Bride', 'The Music Man', '2001'),
(96, 'Graduation Songbook', 'Tunes Are Us', '1998'),
(98, 'Whirled Peas', 'Old Town Records', '2004');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `d_clients`
--

CREATE TABLE `d_clients` (
  `CLIENT_NUMBER` int(11) NOT NULL,
  `FIRST_NAME` varchar(25) NOT NULL,
  `LAST_NAME` varchar(30) NOT NULL,
  `PHONE` bigint(20) NOT NULL,
  `EMAIL` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `d_clients`
--

INSERT INTO `d_clients` (`CLIENT_NUMBER`, `FIRST_NAME`, `LAST_NAME`, `PHONE`, `EMAIL`) VALUES
(5857, 'Serena', 'Jones', 7035335900, 'serena.jones@jones.com'),
(5922, 'Hiram', 'Peters', 3715832249, 'hpeters@yahoo.com'),
(6133, 'Lauren', 'Vigil', 4072220090, 'lbv@lbv.net');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `d_events`
--

CREATE TABLE `d_events` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `EVENT_DATE` datetime NOT NULL,
  `DESCRIPTION` varchar(50) DEFAULT NULL,
  `COST` decimal(8,2) NOT NULL,
  `VENUE_ID` int(11) NOT NULL,
  `PACKAGE_CODE` bigint(20) NOT NULL,
  `THEME_CODE` bigint(20) NOT NULL,
  `CLIENT_NUMBER` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `d_events`
--

INSERT INTO `d_events` (`ID`, `NAME`, `EVENT_DATE`, `DESCRIPTION`, `COST`, `VENUE_ID`, `PACKAGE_CODE`, `THEME_CODE`, `CLIENT_NUMBER`) VALUES
(100, 'Peters Graduation', '2004-05-14 00:00:00', 'Party for 200, red, white, blue motif', '8000.00', 100, 112, 200, 5922),
(105, 'Vigil wedding', '2004-04-28 00:00:00', 'Black tie at Four Season hotel', '10000.00', 220, 200, 200, 6133);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `d_job_assignments`
--

CREATE TABLE `d_job_assignments` (
  `PARTNER_ID` int(11) NOT NULL,
  `EVENT_ID` int(11) NOT NULL,
  `JOB_DATE` datetime NOT NULL,
  `STATUS` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `d_job_assignments`
--

INSERT INTO `d_job_assignments` (`PARTNER_ID`, `EVENT_ID`, `JOB_DATE`, `STATUS`) VALUES
(11, 105, '2004-02-02 00:00:00', 'Visited');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `d_packages`
--

CREATE TABLE `d_packages` (
  `CODE` bigint(20) NOT NULL,
  `LOW_RANGE` int(11) NOT NULL,
  `HIGH_RANGE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `d_packages`
--

INSERT INTO `d_packages` (`CODE`, `LOW_RANGE`, `HIGH_RANGE`) VALUES
(79, 500, 2500),
(87, 2501, 5000),
(112, 5001, 10000),
(200, 10001, 15000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `d_partners`
--

CREATE TABLE `d_partners` (
  `ID` int(11) NOT NULL,
  `FIRST_NAME` varchar(25) NOT NULL,
  `LAST_NAME` varchar(30) NOT NULL,
  `EXPERTISE` varchar(25) DEFAULT NULL,
  `SPECIALTY` varchar(25) DEFAULT NULL,
  `AUTH_EXPENSE_AMT` decimal(8,2) DEFAULT NULL,
  `MANAGER_ID` int(11) DEFAULT NULL,
  `PARTNER_TYPE` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `d_partners`
--

INSERT INTO `d_partners` (`ID`, `FIRST_NAME`, `LAST_NAME`, `EXPERTISE`, `SPECIALTY`, `AUTH_EXPENSE_AMT`, `MANAGER_ID`, `PARTNER_TYPE`) VALUES
(11, 'Jennifer', 'cho', 'Weddings', 'All Types', NULL, 33, 'Wedding Coordinator'),
(22, 'Jason', 'Tsang', NULL, 'Hip Hop', NULL, 33, 'Disk Jockey'),
(33, 'Allison', 'Plumb', 'Event Planning', NULL, '300000.00', 33, 'Manager');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `d_play_list_items`
--

CREATE TABLE `d_play_list_items` (
  `EVENT_ID` int(11) NOT NULL,
  `SONG_ID` int(11) NOT NULL,
  `COMMENTS` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `d_play_list_items`
--

INSERT INTO `d_play_list_items` (`EVENT_ID`, `SONG_ID`, `COMMENTS`) VALUES
(100, 45, 'Play late'),
(100, 46, NULL),
(100, 47, 'Play early'),
(105, 47, 'Play for the father'),
(105, 48, 'Play after cake cutting'),
(105, 49, 'Play first');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `d_songs`
--

CREATE TABLE `d_songs` (
  `ID` int(11) NOT NULL,
  `TITLE` varchar(50) NOT NULL,
  `DURATION` varchar(20) DEFAULT NULL,
  `ARTIST` varchar(20) DEFAULT NULL,
  `TYPE_CODE` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `d_songs`
--

INSERT INTO `d_songs` (`ID`, `TITLE`, `DURATION`, `ARTIST`, `TYPE_CODE`) VALUES
(45, 'Its Finally Over', '5 min', 'The Hobbits', 12),
(46, 'Im Going to Miss My Teacher', '2 min', 'Jane Pop', 12),
(47, 'Hurrah for Today', '3 min', 'The Jubilant Trio', 77),
(48, 'Meet Me At the Altar', '6 min', 'Bobby West', 1),
(49, 'Lets Celebrate', '8 min', 'The Celebrants', 77),
(50, 'All These Years', '10 min', 'Diana Crooner', 88);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `d_themes`
--

CREATE TABLE `d_themes` (
  `CODE` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `d_themes`
--

INSERT INTO `d_themes` (`CODE`, `DESCRIPTION`) VALUES
(110, 'Classic'),
(198, 'Mardi Gras'),
(200, 'Tropical'),
(220, 'Carnival'),
(240, 'Sixties'),
(340, 'Football'),
(454, 'Eighties'),
(502, 'Fairy Tale');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `d_track_listings`
--

CREATE TABLE `d_track_listings` (
  `SONG_ID` int(11) NOT NULL,
  `CD_NUMBER` int(11) NOT NULL,
  `TRACK` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `d_track_listings`
--

INSERT INTO `d_track_listings` (`SONG_ID`, `CD_NUMBER`, `TRACK`) VALUES
(45, 92, 1),
(46, 93, 1),
(47, 91, 2),
(48, 95, 5),
(49, 91, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `d_types`
--

CREATE TABLE `d_types` (
  `CODE` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `d_types`
--

INSERT INTO `d_types` (`CODE`, `DESCRIPTION`) VALUES
(1, 'Jazz'),
(12, 'Pop'),
(40, 'Reggae'),
(77, 'New Age'),
(88, 'Country');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `d_venues`
--

CREATE TABLE `d_venues` (
  `ID` int(11) NOT NULL,
  `LOC_TYPE` varchar(30) NOT NULL,
  `ADDRESS` varchar(100) NOT NULL,
  `RENTAL_FEE` varchar(50) NOT NULL,
  `COMMENTS` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `d_venues`
--

INSERT INTO `d_venues` (`ID`, `LOC_TYPE`, `ADDRESS`, `RENTAL_FEE`, `COMMENTS`) VALUES
(95, 'School Hall', '4 Mahogany Drive, Boston, MA 10010', '75/hour', 'School closes at 10pm'),
(99, 'National Park', '87 Park Avenue, San Diego, CA 28978', '400/flat fee', 'Bring generators'),
(100, 'Private Home', '52 West End Drive, Los Angeles, CA 90210', '0', 'Large kitchen, spacious lawn'),
(101, 'Private Home', '4 Primrose Lane, Chevy Chase, MD 22127', '0', 'Gazebo, multi-level deck'),
(105, 'Private Home', '123 Magnolia Road, Hudson, N.Y. 11220', '0', '3 level townhouse, speakers on all floors'),
(220, 'Hotel', '200 Pennsylvania Ave, Washington D.C. 09002', '300/per person', 'Classy affair, tight security, private entrance for vendors');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employees`
--

CREATE TABLE `employees` (
  `EMPLOYEE_ID` int(11) NOT NULL,
  `FIRST_NAME` varchar(20) DEFAULT NULL,
  `LAST_NAME` varchar(25) NOT NULL,
  `EMAIL` varchar(25) NOT NULL,
  `PHONE_NUMBER` varchar(20) DEFAULT NULL,
  `HIRE_DATE` datetime NOT NULL,
  `JOB_ID` varchar(10) NOT NULL,
  `SALARY` decimal(8,2) DEFAULT NULL,
  `COMMISSION_PCT` decimal(2,2) DEFAULT NULL,
  `MANAGER_ID` int(11) DEFAULT NULL,
  `DEPARTMENT_ID` smallint(6) DEFAULT NULL,
  `BONUS` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `employees`
--

INSERT INTO `employees` (`EMPLOYEE_ID`, `FIRST_NAME`, `LAST_NAME`, `EMAIL`, `PHONE_NUMBER`, `HIRE_DATE`, `JOB_ID`, `SALARY`, `COMMISSION_PCT`, `MANAGER_ID`, `DEPARTMENT_ID`, `BONUS`) VALUES
(100, 'Steven', 'King', 'SKING', '515.123.4567', '1987-06-17 00:00:00', 'AD_PRES', '24000.00', NULL, NULL, 90, NULL),
(101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', '1989-09-21 00:00:00', 'AD_VP', '17000.00', NULL, 100, 90, NULL),
(102, 'Lex', 'De Haan', 'LDEHAAN', '515.123.4569', '1993-01-13 00:00:00', 'AD_VP', '17000.00', NULL, 100, 90, NULL),
(103, 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', '1990-01-03 00:00:00', 'IT_PROG', '9000.00', NULL, 102, 60, NULL),
(104, 'Bruce', 'Ernst', 'BERNST', '590.423.4568', '1991-05-21 00:00:00', 'IT_PROG', '6000.00', NULL, 103, 60, NULL),
(107, 'Diana', 'Lorentz', 'DLORENTZ', '590.423.5567', '1999-02-07 00:00:00', 'IT_PROG', '4200.00', NULL, 103, 60, NULL),
(124, 'Kevin', 'Mourgos', 'KMOURGOS', '650.123.5234', '1999-11-16 00:00:00', 'ST_MAN', '5800.00', NULL, 100, 50, NULL),
(141, 'Trenna', 'Rajs', 'TRAJS', '650.121.8009', '1995-10-17 00:00:00', 'ST_CLERK', '3500.00', NULL, 124, 50, NULL),
(142, 'Curtis', 'Davies', 'CDAVIES', '650.121.2994', '1997-01-29 00:00:00', 'ST_CLERK', '3100.00', NULL, 124, 50, NULL),
(143, 'Randall', 'Matos', 'RMATOS', '650.121.2874', '1998-03-15 00:00:00', 'ST_CLERK', '2600.00', NULL, 124, 50, NULL),
(144, 'Peter', 'Vargas', 'PVARGAS', '650.121.2004', '1998-07-09 00:00:00', 'ST_CLERK', '2500.00', NULL, 124, 50, NULL),
(149, 'Eleni', 'Zlotkey', 'EZLOTKEY', '011.44.1344.429018', '2000-01-29 00:00:00', 'SA_MAN', '10500.00', '0.20', 100, 80, '1500'),
(174, 'Ellen', 'Abel', 'EABEL', '011.44.1644.429267', '1996-05-11 00:00:00', 'SA_REP', '11000.00', '0.30', 149, 80, '1700'),
(176, 'Jonathon', 'Taylor', 'JTAYLOR', '011.44.1644.429265', '1998-03-24 00:00:00', 'SA_REP', '8600.00', '0.20', 149, 80, '1250'),
(178, 'Kimberely', 'Grant', 'KGRANT', '011.44.1644.429263', '1999-05-24 00:00:00', 'SA_REP', '7000.00', '0.15', 149, NULL, NULL),
(200, 'Jennifer', 'Whalen', 'JWHALEN', '515.123.4444', '1987-09-17 00:00:00', 'AD_ASST', '4400.00', NULL, 101, 10, NULL),
(201, 'Michael', 'Hartstein', 'MHARTSTE', '515.123.5555', '1996-02-17 00:00:00', 'MK_MAN', '13000.00', NULL, 100, 20, NULL),
(202, 'Pat', 'Fay', 'PFAY', '603.123.6666', '1997-08-17 00:00:00', 'MK_REP', '6000.00', NULL, 201, 20, NULL),
(205, 'Shelley', 'Higgins', 'SHIGGINS', '515.123.8080', '1994-06-07 00:00:00', 'AC_MGR', '12000.00', NULL, 101, 110, NULL),
(206, 'William', 'Gietz', 'WGIETZ', '515.123.8181', '1994-06-07 00:00:00', 'AC_ACCOUNT', '8300.00', NULL, 205, 110, NULL);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `emp_details_view`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `emp_details_view` (
`EMPLOYEE_ID` int(11)
,`JOB_ID` varchar(10)
,`MANAGER_ID` int(11)
,`DEPARTMENT_ID` smallint(6)
,`LOCATION_ID` smallint(6)
,`COUNTRY_ID` char(2)
,`FIRST_NAME` varchar(20)
,`LAST_NAME` varchar(25)
,`SALARY` decimal(8,2)
,`COMMISSION_PCT` decimal(2,2)
,`DEPARTMENT_NAME` varchar(30)
,`JOB_TITLE` varchar(35)
,`CITY` varchar(30)
,`STATE_PROVINCE` varchar(25)
,`COUNTRY_NAME` varchar(40)
,`REGION_NAME` varchar(25)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `f_customers`
--

CREATE TABLE `f_customers` (
  `ID` int(11) NOT NULL,
  `FIRST_NAME` varchar(25) NOT NULL,
  `LAST_NAME` varchar(35) NOT NULL,
  `ADDRESS` varchar(50) NOT NULL,
  `CITY` varchar(30) NOT NULL,
  `STATE` varchar(20) NOT NULL,
  `ZIP` bigint(20) NOT NULL,
  `PHONE_NUMBER` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `f_customers`
--

INSERT INTO `f_customers` (`ID`, `FIRST_NAME`, `LAST_NAME`, `ADDRESS`, `CITY`, `STATE`, `ZIP`, `PHONE_NUMBER`) VALUES
(123, 'Cole', 'Bee', '123 Main Street', 'Orlando', 'FL', 32838, '4075558234'),
(456, 'Zoe', 'Twee', '1009 Oliver Avenue', 'Boston', 'MA', 12889, '7098675309');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `f_food_items`
--

CREATE TABLE `f_food_items` (
  `FOOD_ITEM_NUMBER` int(11) NOT NULL,
  `DESCRIPTION` varchar(100) NOT NULL,
  `PRICE` decimal(8,2) NOT NULL,
  `REGULAR_CODE` varchar(3) DEFAULT NULL,
  `PROMO_CODE` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `f_food_items`
--

INSERT INTO `f_food_items` (`FOOD_ITEM_NUMBER`, `DESCRIPTION`, `PRICE`, `REGULAR_CODE`, `PROMO_CODE`) VALUES
(90, 'Fries', '1.09', '20', NULL),
(93, 'Strawberry Shake', '3.59', NULL, '110');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `f_orders`
--

CREATE TABLE `f_orders` (
  `ORDER_NUMBER` int(11) NOT NULL,
  `ORDER_DATE` datetime NOT NULL,
  `ORDER_TOTAL` decimal(8,2) DEFAULT NULL,
  `CUST_ID` int(11) NOT NULL,
  `STAFF_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `f_orders`
--

INSERT INTO `f_orders` (`ORDER_NUMBER`, `ORDER_DATE`, `ORDER_TOTAL`, `CUST_ID`, `STAFF_ID`) VALUES
(5678, '2002-12-10 00:00:00', '103.02', 123, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `f_order_lines`
--

CREATE TABLE `f_order_lines` (
  `ORDER_NUMBER` int(11) NOT NULL,
  `FOOD_ITEM_NUMBER` int(11) NOT NULL,
  `QUANTITY` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `f_order_lines`
--

INSERT INTO `f_order_lines` (`ORDER_NUMBER`, `FOOD_ITEM_NUMBER`, `QUANTITY`) VALUES
(5678, 90, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `f_promotional_menus`
--

CREATE TABLE `f_promotional_menus` (
  `CODE` varchar(3) NOT NULL,
  `NAME` varchar(30) NOT NULL,
  `START_DATE` datetime NOT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `GIVE_AWAY` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `f_promotional_menus`
--

INSERT INTO `f_promotional_menus` (`CODE`, `NAME`, `START_DATE`, `END_DATE`, `GIVE_AWAY`) VALUES
('100', 'Back to School', '2004-09-01 00:00:00', '2004-09-30 00:00:00', 'ballpen and highlighter'),
('110', 'Valentines Special', '2004-02-10 00:00:00', '2004-02-15 00:00:00', 'small box of chocolates');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `f_regular_menus`
--

CREATE TABLE `f_regular_menus` (
  `CODE` varchar(3) NOT NULL,
  `TYPE` varchar(30) NOT NULL,
  `HOURS_SERVED` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `f_regular_menus`
--

INSERT INTO `f_regular_menus` (`CODE`, `TYPE`, `HOURS_SERVED`) VALUES
('10', 'Breakfast', '6-11am'),
('20', 'Lunch/Dinner', '11-9pm');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `f_shifts`
--

CREATE TABLE `f_shifts` (
  `CODE` int(11) NOT NULL,
  `DESCRIPTION` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `f_shifts`
--

INSERT INTO `f_shifts` (`CODE`, `DESCRIPTION`) VALUES
(1, '8am to 12pm'),
(2, '6pm to 10pm');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `f_shift_assignments`
--

CREATE TABLE `f_shift_assignments` (
  `CODE` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  `SHIFT_ASSIGN_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `f_shift_assignments`
--

INSERT INTO `f_shift_assignments` (`CODE`, `ID`, `SHIFT_ASSIGN_DATE`) VALUES
(1, 12, '2004-05-06 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `f_staffs`
--

CREATE TABLE `f_staffs` (
  `ID` int(11) NOT NULL,
  `FIRST_NAME` varchar(25) NOT NULL,
  `LAST_NAME` varchar(35) NOT NULL,
  `BIRTHDATE` datetime NOT NULL,
  `SALARY` decimal(8,2) NOT NULL,
  `OVERTIME_RATE` decimal(5,2) DEFAULT NULL,
  `TRAINING` varchar(50) DEFAULT NULL,
  `STAFF_TYPE` varchar(20) NOT NULL,
  `MANAGER_ID` int(11) DEFAULT NULL,
  `MANAGER_BUDGET` decimal(8,2) DEFAULT NULL,
  `MANAGER_TARGET` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `f_staffs`
--

INSERT INTO `f_staffs` (`ID`, `FIRST_NAME`, `LAST_NAME`, `BIRTHDATE`, `SALARY`, `OVERTIME_RATE`, `TRAINING`, `STAFF_TYPE`, `MANAGER_ID`, `MANAGER_BUDGET`, `MANAGER_TARGET`) VALUES
(9, 'Bob', 'Miller', '1979-03-19 00:00:00', '10.00', NULL, 'Grill', 'Cook', 19, NULL, NULL),
(12, 'Sue', 'Doe', '1980-07-01 00:00:00', '6.75', '10.25', NULL, 'Order Taker', 19, NULL, NULL),
(19, 'Monique', 'Tuttle', '1969-03-30 00:00:00', '60.00', NULL, NULL, 'Manager', NULL, '50000.00', '70000.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `JOB_ID` varchar(10) NOT NULL,
  `JOB_TITLE` varchar(35) NOT NULL,
  `MIN_SALARY` int(11) DEFAULT NULL,
  `MAX_SALARY` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `jobs`
--

INSERT INTO `jobs` (`JOB_ID`, `JOB_TITLE`, `MIN_SALARY`, `MAX_SALARY`) VALUES
('AC_ACCOUNT', 'Public Accountant', 4200, 9000),
('AC_MGR', 'Accounting Manager', 8200, 16000),
('AD_ASST', 'Administration Assistant', 3000, 6000),
('AD_PRES', 'President', 20000, 40000),
('AD_VP', 'Administration Vice President', 15000, 30000),
('IT_PROG', 'Programmer', 4000, 10000),
('MK_MAN', 'Marketing Manager', 9000, 15000),
('MK_REP', 'Marketing Representative', 4000, 9000),
('SA_MAN', 'Sales Manager', 10000, 20000),
('SA_REP', 'Sales Representative', 6000, 12000),
('ST_CLERK', 'Stock Clerk', 2000, 5000),
('ST_MAN', 'Stock Manager', 5500, 8500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_grades`
--

CREATE TABLE `job_grades` (
  `GRADE_LEVEL` varchar(3) DEFAULT NULL,
  `LOWEST_SAL` double DEFAULT NULL,
  `HIGHEST_SAL` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `job_grades`
--

INSERT INTO `job_grades` (`GRADE_LEVEL`, `LOWEST_SAL`, `HIGHEST_SAL`) VALUES
('A', 1000, 2999),
('B', 3000, 5999),
('C', 6000, 9999),
('D', 10000, 14999),
('E', 15000, 24999),
('F', 25000, 40000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_history`
--

CREATE TABLE `job_history` (
  `EMPLOYEE_ID` int(11) NOT NULL,
  `START_DATE` datetime NOT NULL,
  `END_DATE` datetime NOT NULL,
  `JOB_ID` varchar(10) NOT NULL,
  `DEPARTMENT_ID` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `job_history`
--

INSERT INTO `job_history` (`EMPLOYEE_ID`, `START_DATE`, `END_DATE`, `JOB_ID`, `DEPARTMENT_ID`) VALUES
(101, '1989-09-21 00:00:00', '1993-10-27 00:00:00', 'AC_ACCOUNT', 110),
(101, '1993-10-28 00:00:00', '1997-03-15 00:00:00', 'AC_MGR', 110),
(102, '1993-01-13 00:00:00', '1998-07-24 00:00:00', 'IT_PROG', 60),
(114, '1998-03-24 00:00:00', '1999-12-31 00:00:00', 'ST_CLERK', 50),
(122, '1999-01-01 00:00:00', '1999-12-31 00:00:00', 'ST_CLERK', 50),
(176, '1998-03-24 00:00:00', '1998-12-31 00:00:00', 'SA_REP', 80),
(176, '1999-01-01 00:00:00', '1999-12-31 00:00:00', 'SA_MAN', 80),
(200, '1987-09-17 00:00:00', '1993-06-17 00:00:00', 'AD_ASST', 90),
(200, '1994-07-01 00:00:00', '1998-12-31 00:00:00', 'AC_ACCOUNT', 90),
(201, '1996-02-17 00:00:00', '1999-12-19 00:00:00', 'MK_REP', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `locations`
--

CREATE TABLE `locations` (
  `LOCATION_ID` smallint(6) NOT NULL,
  `STREET_ADDRESS` varchar(40) DEFAULT NULL,
  `POSTAL_CODE` varchar(12) DEFAULT NULL,
  `CITY` varchar(30) NOT NULL,
  `STATE_PROVINCE` varchar(25) DEFAULT NULL,
  `COUNTRY_ID` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `locations`
--

INSERT INTO `locations` (`LOCATION_ID`, `STREET_ADDRESS`, `POSTAL_CODE`, `CITY`, `STATE_PROVINCE`, `COUNTRY_ID`) VALUES
(1400, '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US'),
(1500, '2011 Interiors Blvd', '99236', 'South San Francisco', 'California', 'US'),
(1700, '2004 Charade Rd', '98199', 'Seattle', 'Washington', 'US'),
(1800, '460 Bloor St. W.', 'ON M5S 1X8', 'Toronto', 'Ontario', 'CA'),
(2500, 'Magdalen Centre, The Oxford Science Park', 'OX9 9ZB', 'Oxford', 'Oxford', 'UK');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regions`
--

CREATE TABLE `regions` (
  `REGION_ID` double NOT NULL,
  `REGION_NAME` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `regions`
--

INSERT INTO `regions` (`REGION_ID`, `REGION_NAME`) VALUES
(1, 'Europe'),
(2, 'Americas'),
(3, 'Asia'),
(4, 'Middle East and Africa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wf_countries`
--

CREATE TABLE `wf_countries` (
  `COUNTRY_ID` smallint(6) NOT NULL,
  `REGION_ID` smallint(6) NOT NULL,
  `COUNTRY_NAME` varchar(70) NOT NULL,
  `COUNTRY_TRANSLATED_NAME` varchar(40) DEFAULT NULL,
  `LOCATION` varchar(90) DEFAULT NULL,
  `CAPITOL` varchar(50) DEFAULT NULL,
  `AREA` bigint(20) DEFAULT NULL,
  `COASTLINE` int(11) DEFAULT NULL,
  `LOWEST_ELEVATION` int(11) DEFAULT NULL,
  `LOWEST_ELEV_NAME` varchar(70) DEFAULT NULL,
  `HIGHEST_ELEVATION` int(11) DEFAULT NULL,
  `HIGHEST_ELEV_NAME` varchar(50) DEFAULT NULL,
  `DATE_OF_INDEPENDENCE` varchar(30) DEFAULT NULL,
  `NATIONAL_HOLIDAY_NAME` varchar(200) DEFAULT NULL,
  `NATIONAL_HOLIDAY_DATE` varchar(30) DEFAULT NULL,
  `POPULATION` bigint(20) DEFAULT NULL,
  `POPULATION_GROWTH_RATE` varchar(10) DEFAULT NULL,
  `LIFE_EXPECT_AT_BIRTH` decimal(6,2) DEFAULT NULL,
  `MEDIAN_AGE` decimal(6,2) DEFAULT NULL,
  `AIRPORTS` int(11) DEFAULT NULL,
  `CLIMATE` varchar(1000) DEFAULT NULL,
  `FIPS_ID` char(2) DEFAULT NULL,
  `INTERNET_EXTENSION` varchar(3) DEFAULT NULL,
  `FLAG` longblob DEFAULT NULL,
  `CURRENCY_CODE` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `wf_countries`
--

INSERT INTO `wf_countries` (`COUNTRY_ID`, `REGION_ID`, `COUNTRY_NAME`, `COUNTRY_TRANSLATED_NAME`, `LOCATION`, `CAPITOL`, `AREA`, `COASTLINE`, `LOWEST_ELEVATION`, `LOWEST_ELEV_NAME`, `HIGHEST_ELEVATION`, `HIGHEST_ELEV_NAME`, `DATE_OF_INDEPENDENCE`, `NATIONAL_HOLIDAY_NAME`, `NATIONAL_HOLIDAY_DATE`, `POPULATION`, `POPULATION_GROWTH_RATE`, `LIFE_EXPECT_AT_BIRTH`, `MEDIAN_AGE`, `AIRPORTS`, `CLIMATE`, `FIPS_ID`, `INTERNET_EXTENSION`, `FLAG`, `CURRENCY_CODE`) VALUES
(1, 21, 'United States of America', 'United States', 'North America', 'Washington, DC', 9631420, 19924, -86, 'Death Valley', 6194, 'Mount McKinley', '4-Jul-1776', 'Independence Day', '4-Jul', 298444215, '0.91', '77.85', '36.50', 14893, 'mostly temperate, but tropical in Hawaii and Florida, arctic in Alaska, semiarid in the great plains west of the Mississippi River, and arid in the Great Basin of the southwest; low winter temperatures in the northwest are ameliorated occasionally in January and February by warm chinook winds from the eastern slopes of the Rocky Mountains', 'US', '.us', NULL, 'USD'),
(2, 21, 'Canada', '', 'Northern North America', 'Ottawa', 9984670, 202080, 0, 'Atlantic Ocean', 5959, 'Mount Logan', '1-Jul-1867', 'Canada Day', '1-Jul', 33098932, '0.88', '80.22', '38.90', 1331, 'varies from temperate in south to subarctic and arctic in north', 'CA', '.ca', NULL, 'CAD'),
(3, 143, 'Republic of Kazakhstan', 'Kazakhstan', 'Central Asia', 'Astana', 2717300, 0, -132, 'Vpadina Kaundy', 6995, 'Khan Tangiri Shyngy', '16-Dec-1991', 'Independence Day', '16-Dec', 15233244, '0.33', '66.89', '28.80', 160, 'continental, cold winters and hot summers, arid and semiarid', 'KZ', '.kz', NULL, 'KZT'),
(7, 151, 'Russian Federation', 'Russia', 'Northern Asia', 'Moscow', 17075200, 37653, -28, 'Caspian Sea', 5633, 'Gora El brus', '24-Aug-1991', 'Russia Day', '12-Jun', 142893540, '-0.37', '67.08', '38.40', 1730, 'ranges from steppes in the south through humid continental in much of European Russia; subarctic in Siberia to tundra climate in the polar north; winters vary from cool along Black Sea coast to frigid in Siberia; summers vary from warm in the steppes to cool along Arctic coast', 'RS', '.ru', NULL, 'RUR'),
(12, 9, 'Coral Sea Islands Territory', 'Coral Sea Islands', 'Oceania', NULL, 3, 3095, 0, 'Pacific Ocean', 6, 'unnamed location on Cato Island', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tropical', 'CR', '', NULL, 'NONE'),
(13, 9, 'Cook Islands', '', 'Oceania', 'Avarua', 240, 120, 0, 'Pacific Ocean', 652, 'Te Manga', '', 'Constitution Day', 'first Monday in August', 21388, NULL, NULL, NULL, 9, 'tropical; moderated by trade winds', 'CW', '.ck', NULL, 'NZD'),
(15, 18, 'Europa Island', '', 'Southern Africa', '', 28, 22, 0, 'Indian Ocean', 24, 'unnamed location', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'tropical', 'EU', NULL, NULL, 'NONE'),
(20, 15, 'Arab Republic of Egypt', 'Egypt', 'Northern Africa', 'Cairo', 1001450, 2450, -133, 'Qattara Depression', 2629, 'Mount Catherine', '28-Feb-1922', 'Revolution Day', '23-Jul', 78887007, '1.75', '71.29', '24.00', 87, 'desert; hot, dry summers with moderate winters', 'EG', '.eg', NULL, 'EGP'),
(22, 155, 'Bailiwick of Guernsey', 'Guernsey', 'Western Europe', 'Saint Peter Port', 78, 50, 0, 'Atlantic Ocean', 114, 'unnamed location', '', 'Liberation Day', '9-May', 65409, '0.26', '80.42', '41.30', 2, 'temperate with mild winters and cool summers; about 50% of days are overcast', 'GK', '.gg', NULL, 'GBP'),
(27, 18, 'Republic of South Africa', 'South Africa', 'Southern Africa', 'Pretoria', 1219912, 2798, 0, 'Atlantic Ocean', 3408, 'Njesuthi', '31-May-1910', 'Freedom Day', '27-Apr', 44187637, '-0.4', '42.73', '24.10', 728, 'mostly semiarid; subtropical along east coast; sunny days, cool nights', 'SF', '.za', NULL, 'ZAR'),
(30, 39, 'Hellenic Republic', 'Greece', 'Southern Europe', 'Athens', 131940, 13676, 0, 'Mediterranean Sea', 2917, 'Mount Olympus', '2-Jan-1905', 'Independence Day', '25-Mar', 10688058, '0.18', '79.24', '40.80', 82, 'temperate; mild, wet winters; hot, dry summers', 'GR', '.gr', NULL, 'EUR'),
(31, 155, 'Kingdom of the Netherlands', 'Netherlands', 'Western Europe', 'Amsterdam', 41526, 451, -7, 'Zuidplaspolder', 322, 'Vaalserberg', '23-Jan-1579', 'Queens Day', '30-Apr', 16491461, '0.49', '78.96', '39.40', 27, 'temperate; marine; cool summers and mild winters', 'NL', '.nl', NULL, 'EUR'),
(32, 155, 'Kingdom of Belgium', 'Belgium', 'Western Europe', 'Brussels', 30528, 67, 0, 'North Sea', 694, 'Signal de Botrange', '4-Oct-1830', '', '21-Jul', 10379067, '0.13', '78.77', '40.90', 43, 'temperate; mild winters, cool summers; rainy, humid, cloudy', 'BE', '.be', NULL, 'EUR'),
(33, 155, 'French Republic', 'France', 'Western Europe', 'Paris', 547030, 3427, -2, 'Rhone River delta', 4807, 'Mont Blanc', '', 'Bastille Day', '14-Jul', 60876136, '0.35', '79.73', '39.10', 479, 'generally cool winters and mild summers, but mild winters and hot summers along the Mediterranean; occasional strong, cold, dry, north-to-northwesterly wind known as mistral', 'FR', '.fr', NULL, 'EUR'),
(34, 39, 'Kingdom of Spain', 'Spain', 'Southwestern Europe', 'Madrid', 504782, 4964, 0, 'Atlantic Ocean', 3718, 'Pico de Teide', '', 'National Day', '12-Oct', 40397842, '0.13', '79.65', '39.90', 157, 'temperate; clear, hot summers in interior, more moderate and cloudy along coast; cloudy, cold winters in interior, partly cloudy and cool along coast', 'SP', '.es', NULL, 'EUR'),
(36, 151, 'Republic of Hungary', 'Hungary', 'Central Europe', 'Budapest', 93030, 0, 78, 'Tisza River', 1014, 'Kekes', '27-Sep-1902', 'Saint Stephens Day', '20-Aug', 9981334, '-0.25', '72.66', '38.70', 44, 'temperate; cold, cloudy, humid winters; warm summers', 'HU', '.hu', NULL, 'HUF'),
(38, 39, 'The Holy See (State of the Vatican City)', 'Holy See (Vatican City)', 'Southern Europe', 'Vatican City', 0, 0, 19, 'unnamed location', 75, 'unnamed location', '11-Feb-1929', 'Coronation Day of Pope BENEDICT XVI', '24-Apr', 932, '0.01', '0.00', '0.00', 0, 'temperate; mild, rainy winters (September to May) with hot, dry summers (May to September)', 'VT', '.va', NULL, 'EUR'),
(39, 39, 'Italian Republic', 'Italy', 'Southern Europe', 'Rome', 301230, 7600, 0, 'Mediterranean Sea', 4748, 'Mont Blanc', '17-Mar-1861', 'Republic Day', '2-Jun', 58133509, '0.04', '79.81', '42.20', 135, 'predominantly Mediterranean; Alpine in far north; hot, dry in south', 'IT', '.it', NULL, 'EUR'),
(40, 151, 'Romania', '', 'Southeastern Europe', 'Bucharest', 237500, 225, 0, 'Black Sea', 2544, 'Moldoveanu', '30-Dec-1947', 'Unification Day', '1-Dec', 22303552, '-0.12', '71.63', '36.60', 61, 'temperate; cold, cloudy winters with frequent snow and fog; sunny summers with frequent showers and thunderstorms', 'RO', '.ro', NULL, 'RON'),
(41, 155, 'Swiss Confederation', 'Switzerland', 'Central Europe', 'Bern', 41290, 0, 195, 'Lake Maggiore', 4634, 'Dufourspitze', '1-Aug-1291', 'Founding of the Swiss Confederation', '1-Aug', 7523934, '0.43', '80.51', '40.10', 65, 'temperate, but varies with altitude; cold, cloudy, rainy/snowy winters; cool to warm, cloudy, humid summers with occasional showers', 'SZ', '.ch', NULL, 'CHF'),
(43, 155, 'Republic of Austria', 'Austria', 'Central Europe', 'Vienna', 83870, 0, 115, 'Neusiedler See', 3798, 'Grossglockner', '17-Sep-1156', 'National Day', '26-Oct', 8192880, '0.09', '79.07', '40.90', 55, 'temperate; continental, cloudy; cold winters with frequent rain and some snow in lowlands and snow in mountains; moderate summers with occasional showers', 'AU', '.at', NULL, 'EUR'),
(44, 155, 'United Kingdom of Great Britain and Northern Ireland', 'United Kingdom', 'Western Europe', 'London', 244820, 12429, -4, 'The Fens', 1343, 'Ben Nevis', '10th century', NULL, NULL, 60609153, '0.28', '78.54', '39.30', 471, 'temperate; moderated by prevailing southwest winds over the North Atlantic Current; more than one-half of the days are overcast', 'UK', '.uk', NULL, 'GBP'),
(45, 154, 'Kingdom of Denmark', 'Denmark', 'Northern Europe', 'Copenhagen', 43094, 7314, -7, 'Lammefjord', 173, 'Yding Skovhoej', '', 'Constitution Day', '5-Jun', 5450661, '0.33', '77.79', '39.80', 97, 'temperate; humid and overcast; mild, windy winters and cool summers', 'DA', '.dk', NULL, 'DKK'),
(46, 154, 'Kingdom of Sweden', 'Sweden', 'Northern Europe', 'Stockholm', 449964, 3218, -2, 'reclaimed bay of Lake Hammarsjon', 2111, 'Kebnekaise', '6-Jun-1523', 'Flag Day', '6-Jun', 9016596, '0.16', '80.51', '40.90', 255, 'temperate in south with cold, cloudy winters and cool, partly cloudy summers; subarctic in north', 'SW', '.se', NULL, 'SEK'),
(47, 154, 'Kingdom of Norway', 'Norway', 'Northern Europe', 'Oslo', 324220, 25148, 0, 'Norwegian Sea', 2469, 'Galdhopiggen', '7-Jun-1905', 'Constitution Day', '17-May', 4610820, '0.38', '79.54', '38.40', 100, 'temperate along coast, modified by North Atlantic Current; colder interior with increased precipitation and colder summers; rainy year-round on west coast', 'NO', '.no', NULL, 'NOK'),
(48, 151, 'Republic of Poland', 'Poland', 'Central Europe', 'Warsaw', 312685, 491, -2, 'near Raczki Elblaskie', 2499, 'Rysy', '11-Nov-1918', 'Constitution Day', '3-May', 38536869, '-0.05', '74.97', '37.00', 123, 'temperate with cold, cloudy, moderately severe winters with frequent precipitation; mild summers with frequent showers and thundershowers', 'PL', '.pl', NULL, 'PLN'),
(49, 155, 'Federal Republic of Germany', 'Germany', 'Central Europe', 'Berlin', 357021, 2389, -4, 'Neuendorf bei Wilster', 2963, 'Zugspitze', '15-Mar-1991', 'Unity Day', '3-Oct', 82422299, '-0.02', '78.80', '42.60', 552, 'temperate and marine; cool, cloudy, wet winters and summers; occasional warm mountain (foehn) wind', 'GM', '.de', NULL, 'EUR'),
(51, 5, 'Republic of Peru', 'Peru', 'Western South America', 'Lima', 1285220, 2414, 0, 'Pacific Ocean', 6768, 'Nevado Huascaran', '28-Jul-1821', 'Independence Day', '28-Jul', 28302603, '1.32', '69.84', '25.30', 246, 'varies from tropical in east to dry desert in west; temperate to frigid in Andes', 'PE', '.pe', NULL, 'PEN'),
(52, 13, 'United Mexican States', 'Mexico', 'Middle America', 'Mexico', 1972550, 9330, -10, 'Laguna Salada', 5700, 'Volcan Pico de Orizaba', '16-Sep-1810', 'Independence Day', '16-Sep', 107449525, '1.16', '75.41', '25.30', 1832, 'varies from tropical to desert', 'MX', '.mx', NULL, 'MXN'),
(53, 29, 'Republic of Cuba', 'Cuba', 'Caribbean', 'Havana', 110860, 3735, 0, 'Caribbean Sea', 2005, 'Pico Turquino', '20-May-1902', 'Independence Day', '20-May', 11382820, '0.31', '77.41', '35.90', 170, 'tropical; moderated by trade winds; dry season (November to April); rainy season (May to October)', 'CU', '.cu', NULL, 'CUP'),
(54, 5, 'Argentine Republic', 'Argentina', 'Southern South America', 'Buenos Aires', 2766890, 4989, -105, 'Laguna del Carbon', 6960, 'Cerro Aconcagua', '9-Jul-1816', 'Revolution Day', '25-May', 39921833, '0.96', '76.12', '29.70', 1333, 'mostly temperate; arid in southeast; subantarctic in southwest', 'AR', '.ar', NULL, 'ARS'),
(55, 5, 'Federative Republic of Brazil', 'Brazil', 'Eastern South America', 'Brasilia', 8511965, 7491, 0, 'Atlantic Ocean', 3014, 'Pico da Neblina', '7-Sep-1822', 'Independence Day', '7-Sep', 188078227, '1.04', '71.97', '28.20', 4223, 'mostly tropical, but temperate in south', 'BR', '.br', NULL, 'BRL'),
(56, 5, 'Republic of Chile', 'Chile', 'Southern South America', 'Santiago', 756950, 6435, 0, 'Pacific Ocean', 6880, 'Nevado Ojos del Salado', '18-Sep-1810', 'Independence Day', '18-Sep', 16134219, '0.94', '76.77', '30.40', 363, 'temperate; desert in north; Mediterranean in central region; cool and damp in south', 'CI', '.cl', NULL, 'CLP'),
(57, 5, 'Republic of Colombia', 'Colombia', 'Northern South America', 'Bogota', 1138910, 3208, 0, 'Pacific Ocean', 5775, 'Pico Cristobal Colon', '20-Jul-1810', 'Independence Day', '20-Jul', 43593035, '1.46', '71.99', '26.30', 981, 'tropical along coast and eastern plains; cooler in highlands', 'CO', '.co', NULL, 'COP'),
(58, 5, 'Bolivarian Republic of Venezuela', 'Venezuela', 'Northern South America', 'Caracas', 912050, 2800, 0, 'Caribbean Sea', 5007, 'Pico Bolivar', '5-Jul-1811', 'Independence Day', '5-Jul', 25730435, '1.38', '74.54', '26.00', 370, 'tropical; hot, humid; more moderate in highlands', 'VE', '.ve', NULL, 'VEB'),
(60, 35, 'Malaysia', '', 'Southeastern Asia', 'Kuala Lumpur', 329750, 4675, 0, 'Indian Ocean', 4100, 'Gunung Kinabalu', '31-Aug-1957', 'Independence Day', '31-Aug', 24385858, '1.78', '72.50', '24.10', 117, 'tropical; annual southwest (April to October) and northeast (October to February) monsoons', 'MY', '.my', NULL, 'MYR'),
(61, 9, 'Commonwealth of Australia', 'Australia', 'Oceania', 'Canberra', 7686850, 25760, -15, 'Lake Eyre', 2229, 'Mount Kosciuszko', '1-Jan-1901', 'Australia Day', '26-Jan', 20264082, '0.85', '80.50', '36.90', 450, 'generally arid to semiarid; temperate in south and east; tropical in north', 'AS', '.au', NULL, 'AUD'),
(62, 35, 'Republic of Indonesia', 'Indonesia', 'Southeastern Asia', 'Jakarta', 1919440, 54716, 0, 'Indian Ocean', 5030, 'Puncak Jaya', '17-Aug-1945', 'Independence Day', '17-Aug', 245452739, '1.41', '69.87', '26.80', 668, 'tropical; hot, humid; more moderate in highlands', 'ID', '.id', NULL, 'IDR'),
(63, 35, 'Republic of the Philippines', 'Philippines', 'Southeastern Asia', 'Manila', 300000, 36289, 0, 'Philippine Sea', 2954, 'Mount Apo', '12-Jun-1898', 'Independence Day', '4-Jul', 89468677, '1.8', '70.21', '22.50', 256, 'tropical marine; northeast monsoon (November to April); southwest monsoon (May to October)', 'RP', '.ph', NULL, 'PHP'),
(64, 9, 'New Zealand', '', 'Oceania', 'Wellington', 268680, 15134, 0, 'Pacific Ocean', 3754, 'Aoraki-Mount Cook', '26-Sep-1907', 'Waitangi Day', '6-Feb', 4076140, '0.99', '78.81', '33.90', 117, 'temperate with sharp regional contrasts', 'NZ', '.nz', NULL, 'NZD'),
(65, 35, 'Republic of Singapore', 'Singapore', 'Southeastern Asia', 'Singapore', 693, 193, 0, 'Singapore Strait', 166, 'Bukit Timah', '9-Aug-1965', 'National Day', '9-Aug', 4492150, '1.42', '81.71', '37.30', 9, 'tropical; hot, humid, rainy; two distinct monsoon seasons - Northeastern monsoon (December to March) and Southwestern monsoon (June to September); inter-monsoon - frequent afternoon and early evening thunderstorms', 'SN', '.sg', NULL, 'SGD'),
(66, 35, 'Kingdom of Thailand', 'Thailand', 'Southeastern Asia', 'Bangkok', 514000, 3219, 0, 'Gulf of Thailand', 2576, 'Doi Inthanon', '22-May-1903', 'Birthday of King PHUMIPHON', '5-Dec', 64631595, '0.68', '72.25', '31.90', 108, 'tropical; rainy, warm, cloudy southwest monsoon (mid-May to September); dry, cool northeast monsoon (November to mid-March); southern isthmus always hot and humid', 'TH', '.th', NULL, 'THB'),
(67, 35, 'Territory of Cocos (Keeling) Islands', 'Cocos (Keeling) Islands', 'Southeastern Asia', 'West Island', 14, 26, 0, 'Indian Ocean', 5, 'unnamed location', '', 'Australia Day', '26-Jan', 574, '0', NULL, NULL, 1, 'tropical with high humidity, moderated by the southeast trade winds for about nine months of the year', 'CK', '.cc', NULL, 'AUD'),
(81, 30, 'Japan', '', 'Eastern Asia', 'Tokyo', 377835, 29751, -4, 'Hachiro-gata', 3776, 'Mount Fuji', '660 B.C.', 'Birthday of Emperor AKIHITO', '23-Dec', 127463611, '0.02', '81.25', '42.90', 173, 'varies from tropical in south to cool temperate in north', 'JA', '.jp', NULL, 'JPY'),
(82, 30, 'Republic of Korea', 'South Korea', 'Eastern Asia', 'Seoul', 98480, 2413, 0, 'Sea of Japan', 1950, 'Halla-san', '15-Aug-1945', 'Liberation Day', '15-Aug', 48846823, '0.42', '77.04', '35.20', 108, 'temperate, with rainfall heavier in summer than winter', 'KS', '.kr', NULL, 'KRW'),
(84, 35, 'Socialist Republic of Vietnam', 'Vietnam', 'Southeastern Asia', 'Hanoi', 329560, 3444, 0, 'South China Sea', 3144, 'Fan Si Pan', '2-Sep-1945', 'Independence Day', '2-Sep', 84402966, '1.02', '70.85', '25.90', 28, 'tropical in south; monsoonal in north with hot, rainy season (May to September) and warm, dry season (October to March)', 'VM', '.vn', NULL, 'VND'),
(86, 30, 'Peoples Republic of China', 'China', 'Eastern Asia', 'Beijing', 9596960, 14500, -154, 'Turpan Pendi', 8850, 'Mount Everest', '1-Oct-1949', 'Anniversary of the Founding of the Peoples Republic of China', '1-Oct', 1313973713, '0.59', '72.58', '32.70', 489, 'extremely diverse; tropical in south to subarctic in north', 'CH', '.cn', NULL, 'CNY'),
(90, 151, 'Republic of Turkey', 'Turkey', 'Southeastern Europe', 'Ankara', 780580, 7200, 0, 'Mediterranean Sea', 5166, 'Mount Ararat', '29-Oct-1923', 'Republic Day', '29-Oct', 70413958, '1.06', '72.62', '28.10', 120, 'temperate; hot, dry summers with mild, wet winters; harsher in interior', 'TU', '.tr', NULL, 'YTL'),
(91, 34, 'Republic of India', 'India', 'Southern Asia', 'New Delhi', 3287590, 7000, 0, 'Indian Ocean', 8598, 'Kanchenjunga', '15-Aug-1947', 'Republic Day', '26-Jan', 1095351995, '1.38', '64.71', '24.90', 334, 'varies from tropical monsoon in south to temperate in north', 'IN', '.in', NULL, 'INR'),
(92, 34, 'Islamic Republic of Pakistan', 'Pakistan', 'Southern Asia', 'Islamabad', 803940, 1046, 0, 'Indian Ocean', 8611, 'K2', '14-Aug-1947', 'Republic Day', '23-Mar', 165803560, '2.09', '63.39', '19.80', 134, 'mostly hot, dry desert; temperate in northwest; arctic in north', 'PK', '.pk', NULL, 'PKR'),
(93, 34, 'Islamic Republic of Afghanistan', 'Afghanistan', 'Southern Asia', 'Kabul', 647500, 0, 258, 'Amu Darya', 7485, 'Nowshak', '19-Aug-1919', 'Independence Day', '19-Aug', 31056997, '2.67', '43.34', '17.60', 46, 'arid to semiarid; cold winters and hot summers', 'AF', '.af', NULL, 'AFA'),
(94, 34, 'Democratic Socialist Republic of Sri Lanka', 'Sri Lanka', 'Southern Asia', 'Colombo', 65610, 1340, 0, 'Indian Ocean', 2524, 'Pidurutalagala', '4-Feb-1948', 'Independence Day', '4-Feb', 20222240, '0.78', '73.41', '29.80', 16, 'tropical monsoon; northeast monsoon (December to March); southwest monsoon (June to October)', 'CE', '.lk', NULL, 'LKR'),
(98, 34, 'Islamic Republic of Iran', 'Iran', 'Middle East', 'Tehran', 2, 2440, -28, 'Caspian Sea', 5671, 'Kuh-e Damavand', '1-Apr-1979', 'Republic Day', '1-Apr', 68688433, '1.1', '70.26', '24.80', 310, 'mostly arid or semiarid, subtropical along Caspian coast', 'IR', '.ir', NULL, 'IRR'),
(202, 155, 'Isle of Man', '', 'Western Europe', 'Douglas', 572, 160, 0, 'Irish Sea', 621, 'Snaefell', '', 'Tynwald Day', '5-Jul', 75441, '0.52', '78.49', '39.60', 1, 'temperate; cool summers and mild winters; overcast about one-third of the time', 'IM', '.im', NULL, 'GBP'),
(203, 155, 'Bailiwick of Jersey', 'Jersey', 'Western Europe', 'Saint Helier', 116, 70, 0, 'Atlantic Ocean', 143, 'unnamed location', '', 'Liberation Day', '9-May', 91084, '0.28', '79.38', '41.40', 1, 'temperate; mild winters and cool summers', 'JE', '.je', NULL, 'GBP'),
(204, 154, 'Jan Mayen', '', 'Northern Europe', NULL, 373, 124, 0, 'Norwegian Sea', 2277, 'Haakon VII Toppen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'arctic maritime with frequent storms and persistent fog', 'JN', '', NULL, 'NONE'),
(205, 18, 'Juan de Nova Island', '', 'Southern Africa', NULL, 4, 24, 0, 'Indian Ocean', 10, 'unnamed location', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'tropical', 'JU', NULL, NULL, 'NONE'),
(206, 9, 'Pitcairn, Henderson, Ducie, and Oeno Islands', 'Pitcairn Islands', 'Oceania', 'Adamstown', 47, 51, 0, 'Pacific Ocean', 347, 'Pawala Valley Ridge', '', 'Birthday of Queen ELIZABETH II', 'second Saturday in June', 45, '-0.01', NULL, NULL, 0, 'tropical; hot and humid; modified by southeast trade winds; rainy season (November to March)', 'PC', '.pn', NULL, 'NZD'),
(207, 35, 'Paracel Islands', '', 'Southeastern Asia', NULL, NULL, 518, 0, 'South China Sea', 14, 'unnamed location', NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 'tropical', 'PF', '', NULL, 'NONE'),
(208, 35, 'Spratly Islands', '', 'Southeastern Asia', NULL, 5, 926, 0, 'South China Sea', 4, 'unnamed location on Southwest Cay', NULL, NULL, NULL, 0, NULL, NULL, NULL, 3, 'tropical', 'PG', '', NULL, 'NONE'),
(209, 154, 'Svalbard', '', 'Northern Europe', 'Longyearbyen', 62049, 3587, 0, 'Arctic Ocean', 1717, 'Newtontoppen', NULL, NULL, NULL, 2701, '-0.02', NULL, NULL, 4, 'arctic, tempered by warm North Atlantic Current; cool summers, cold winters; North Atlantic Current flows along west and north coasts of Spitsbergen, keeping water open and navigable most of the year', 'SV', '.sj', NULL, 'NOK'),
(212, 15, 'Kingdom of Morocco', 'Morocco', 'Northern Africa', 'Rabat', 446550, 1835, -55, 'Sebkha Tah', 4165, 'Jebel Toubkal', '2-Mar-1956', 'Throne Day', '30-Jul', 33241259, '1.55', '70.94', '23.90', 60, 'Mediterranean, becoming more extreme in the interior', 'MO', '.ma', NULL, 'MAD'),
(213, 15, 'Peoples Democratic Republic of Algeria', 'Algeria', 'Northern Africa', 'Algiers', 2381740, 998, -40, 'Chott Melrhir', 3003, 'Tahat', '5-Jul-1962', 'Revolution Day', '1-Nov', 32930091, '1.22', '73.26', '24.90', 137, 'arid to semiarid', 'AG', '.dz', NULL, 'DZD'),
(216, 15, 'Tunisian Republic', 'Tunisia', 'Northern Africa', 'Tunis', 163610, 1148, -17, 'Shatt al Gharsah', 1544, 'Jebel ech Chambi', '20-Mar-1956', 'Independence Day', '20-Mar', 10175014, '0.99', '75.12', '27.80', 30, 'temperate in north with mild, rainy winters and hot, dry summers; desert in south', 'TS', '.tn', NULL, 'TND'),
(218, 15, 'Great Socialist Peoples Libyan Arab Jamahiriya', 'Libya', 'Northern Africa', 'Tripoli', 1759540, 1770, -47, 'Sabkhat Ghuzayyil', 2267, 'Bikku Bitti', '24-Dec-1951', 'Revolution Day', '1-Sep', 5900754, '2.3', '76.69', '23.00', 139, 'Mediterranean along coast; dry, extreme desert interior', 'LY', '.ly', NULL, 'LYD'),
(220, 11, 'Republic of The Gambia', 'The Gambia', 'Western Africa', 'Banjul', 11300, 80, 0, 'Atlantic Ocean', 53, 'unnamed location', '18-Feb-1965', 'Independence Day', '18-Feb', 1641564, '2.84', '54.14', '17.70', 1, 'tropical; hot, rainy season (June to November); cooler, dry season (November to May)', 'GA', '.gm', NULL, 'GMD'),
(221, 11, 'Republic of Senegal', 'Senegal', 'Western Africa', 'Dakar', 196190, 531, 0, 'Atlantic Ocean', 581, 'unnamed feature near Nepen Diakha', '4-Apr-1960', 'Independence Day', '4-Apr', 11987121, '2.34', '59.25', '19.10', 20, 'tropical; hot, humid; rainy season (May to November) has strong southeast winds; dry season (December to April) dominated by hot, dry, harmattan wind', 'SG', '.sn', NULL, 'XOF'),
(222, 15, 'Islamic Republic of Mauritania', 'Mauritania', 'Northern Africa', 'Nouakchott', 1030700, 754, -5, 'Sebkhet Te-n-Dghamcha', 915, 'Kediet Ijill', '28-Nov-1960', 'Independence Day', '28-Nov', 3177388, '2.88', '53.12', '17.00', 24, 'desert; constantly hot, dry, dusty', 'MR', '.mr', NULL, 'MRO'),
(223, 11, 'Republic of Mali', 'Mali', 'Western Africa', 'Bamako', 1240000000, 0, 23, 'Senegal River', 1155, 'Hombori Tondo', '22-Sep-2001', 'Independence Day', '22-Sep', 11716829, '2.63', '49.00', '15.80', 28, 'subtropical to arid; hot and dry (February to June); rainy, humid, and mild (June to November); cool and dry (November to February)', 'ML', '.ml', NULL, 'XOF'),
(224, 11, 'Republic of Guinea', 'Guinea', 'Western Africa', 'Conakry', 245857, 320, 0, 'Atlantic Ocean', 1752, 'Mont Nimba', '2-Oct-1958', 'Independence Day', '2-Oct', 9690222, '2.63', '49.50', '17.70', 16, 'generally hot and humid; monsoonal-type rainy season (June to November) with southwesterly winds; dry season (December to May) with northeasterly harmattan winds', 'GV', '.gn', NULL, 'GNF'),
(225, 11, 'Republic of Cote d Ivoire', 'Cote d Ivoire', 'Western Africa', 'Yamoussoukro', 322460, 515, 0, 'Gulf of Guinea', 1752, 'Mont Nimba', '7-Aug-1960', 'Independence Day', '7-Aug', 17654843, '2.03', '48.82', '19.20', 35, 'tropical along coast, semiarid in far north; three seasons - warm and dry (November to March), hot and dry (March to May), hot and wet (June to October)', 'IV', '.ci', NULL, 'XOF'),
(226, 11, 'Burkina Faso', '', 'Western Africa', 'Ouagadougou', 274200, 0, 200, 'Mouhoun River', 749, 'Tena Kourou', '5-Aug-1960', 'Republic Day', '11-Dec', 13902972, '3', '48.85', '16.50', 33, 'tropical; warm, dry winters; hot, wet summers', 'UV', '.bf', NULL, 'XOF'),
(227, 11, 'Republic of Niger', 'Niger', 'Western Africa', 'Niamey', 1267000000, 0, 200, 'Niger River', 2022, 'Mont Bagzane', '3-Aug-1960', 'Republic Day', '18-Dec', 12525094, '2.92', '43.76', '16.50', 27, 'desert; mostly hot, dry, dusty; tropical in extreme south', 'NG', '.ne', NULL, 'XOF'),
(228, 11, 'Togolese Republic', 'Togo', 'Western Africa', 'Lome', 56785, 56, 0, 'Atlantic Ocean', 986, 'Mont Agou', '27-Apr-1960', 'Independence Day', '27-Apr', 5548702, '2.72', '57.42', '18.30', 9, 'tropical; hot, humid in south; semiarid in north', 'TO', '.tg', NULL, 'XOF'),
(229, 11, 'Republic of Benin', 'Benin', 'Western Africa', 'Porto-Novo', 112620, 121, 0, 'Atlantic Ocean', 658, 'Mont Sokbaro', '1-Aug-1960', 'National Day', '1-Aug', 7862944, '2.73', '53.04', '17.60', 5, 'tropical; hot, humid in south; semiarid in north', 'BN', '.bj', NULL, 'XOF'),
(230, 18, 'Republic of Mauritius', 'Mauritius', 'Southern Africa', 'Port Louis', 2040, 177, 0, 'Indian Ocean', 828, 'Mont Piton', '12-Mar-1968', 'Independence Day', '12-Mar', 1240827, '0.82', '72.63', '30.80', 6, 'tropical, modified by southeast trade winds; warm, dry winter (May to November); hot, wet, humid summer (November to May)', 'MP', '.mu', NULL, 'MUR'),
(231, 11, 'Republic of Liberia', 'Liberia', 'Western Africa', 'Monrovia', 111370, 579, 0, 'Atlantic Ocean', 1380, 'Mount Wuteve', '26-Jul-1847', 'Independence Day', '26-Jul', 3042004, '4.91', '39.65', '18.10', 53, 'tropical; hot, humid; dry winters with hot days and cool to cold nights; wet, cloudy summers with frequent heavy showers', 'LI', '.lr', NULL, 'LRD'),
(232, 11, 'Republic of Sierra Leone', 'Sierra Leone', 'Western Africa', 'Freetown', 71740, 402, 0, 'Atlantic Ocean', 1948, 'Loma Mansa', '27-Apr-1961', 'Independence Day', '27-Apr', 6005250, '2.3', '40.22', '17.40', 10, 'tropical; hot, humid; summer rainy season (May to December); winter dry season (December to April)', 'SL', '.sl', NULL, 'SLL'),
(233, 11, 'Republic of Ghana', 'Ghana', 'Western Africa', 'Accra', 239460, 539, 0, 'Atlantic Ocean', 880, 'Mount Afadjato', '6-Mar-1957', 'Independence Day', '6-Mar', 22409572, '2.07', '58.87', '19.90', 12, 'tropical; warm and comparatively dry along southeast coast; hot and humid in southwest; hot and dry in north', 'GH', '', NULL, 'GHC'),
(234, 11, 'Federal Republic of Nigeria', 'Nigeria', 'Western Africa', 'Abuja', 923768, 853, 0, 'Atlantic Ocean', 2419, 'Chappal Waddi', '1-Oct-1960', 'Independence Day', '1-Oct', 131859731, '2.38', '47.08', '18.70', 70, 'varies; equatorial in south, tropical in center, arid in north', 'NI', '.ng', NULL, 'NGN'),
(235, 17, 'Republic of Chad', 'Chad', 'Central Africa', 'N Djamena', 1284000000, 0, 160, 'Djourab Depression', 3415, 'Emi Koussi', '11-Aug-1960', 'Independence Day', '11-Aug', 9944201, '2.93', '47.52', '16.00', 51, 'tropical in south, desert in north', 'CD', '.td', NULL, 'XAF'),
(236, 17, 'Central African Republic', '', 'Central Africa', 'Bangui', 622984, 0, 335, 'Oubangui River', 1420, 'Mont Ngaoui', '13-Aug-1960', 'Republic Day', '1-Dec', 4303356, '1.53', '43.54', '18.40', 50, 'tropical; hot, dry winters; mild to hot, wet summers', 'CT', '.cf', NULL, 'XAF'),
(237, 11, 'Republic of Cameroon', 'Cameroon', 'Western Africa', 'Yaounde', 475440, 402, 0, 'Atlantic Ocean', 4095, 'Fako', '1-Jan-1960', 'Republic Day', '20-May', 17340702, '2.04', '51.16', '18.90', 47, 'varies with terrain, from tropical along coast to semiarid and hot in north', 'CM', '.cm', NULL, 'XAF'),
(238, 11, 'Republic of Cape Verde', 'Cape Verde', 'Western Africa', 'Praia', 4033, 965, 0, 'Atlantic Ocean', 2829, 'Mt. Fogo', '5-Jul-1975', 'Independence Day', '5-Jul', 420979, '0.64', '70.73', '19.80', 7, 'temperate; warm, dry summer; precipitation meager and very erratic', 'CV', '.cv', NULL, 'CVE'),
(239, 11, 'Democratic Republic of Sao Tome and Principe', 'Sao Tome and Principe', 'Western Africa', 'Sao Tome', 1001, 209, 0, 'Atlantic Ocean', 2024, 'Pico de Sao Tome', '12-Jul-1975', 'Independence Day', '12-Jul', 193413, '3.15', '67.31', '16.20', 2, 'tropical; hot, humid; one rainy season (October to May)', 'TP', '.st', NULL, 'STD'),
(240, 11, 'Republic of Equatorial Guinea', 'Equatorial Guinea', 'Western Africa', 'Malabo', 28051, 296, 0, 'Atlantic Ocean', 3008, 'Pico Basile', '12-Oct-1968', 'Independence Day', '12-Oct', 540109, '2.05', '49.54', '18.80', 4, 'tropical; always hot, humid', 'EK', '.gq', NULL, 'XAF'),
(241, 11, 'Gabonese Republic', 'Gabon', 'Western Africa', 'Libreville', 267667, 885, 0, 'Atlantic Ocean', 1575, 'Mont Iboundji', '17-Aug-1960', 'Founding of the Gabonese Democratic Party', '12-Mar', 1424906, '2.13', '54.49', '18.60', 56, 'tropical; always hot, humid', 'GB', '.ga', NULL, 'XAF'),
(242, 11, 'Republic of the Congo', 'Congo', 'Western Africa', 'Brazzaville', 342000, 169, 0, 'Atlantic Ocean', 903, 'Mount Berongou', '15-Aug-1960', 'Independence Day', '15-Aug', 3702314, '2.6', '52.80', '16.60', 32, 'tropical; rainy season (March to June); dry season (June to October); persistent high temperatures and humidity; particularly enervating climate astride the Equator', 'CF', '.cg', NULL, 'XAF'),
(243, 17, 'Democratic Republic of the Congo', '', 'Central Africa', 'Kinshasa', 2345410, 37, 0, 'Atlantic Ocean', 5110, 'Pic Marguerite on Mont Ngaliema', '30-Jun-1960', 'Independence Day', '30-Jun', 62660551, '3.07', '51.46', '16.20', 232, 'tropical; hot and humid in equatorial river basin; cooler and drier in southern highlands', 'CG', '.cd', NULL, 'CDF'),
(244, 18, 'Republic of Angola', 'Angola', 'Southern Africa', 'Luanda', 1246700, 1600, 0, 'Atlantic Ocean', 2620, 'Morro de Moco', '11-Nov-1975', 'Independence Day', '11-Nov', 12127071, '2.45', '38.62', '18.00', 243, 'semiarid in south and along coast to Luanda; north has cool, dry season (May to October) and hot, rainy season (November to April)', 'AO', '.ao', NULL, 'AOA'),
(245, 11, 'Republic of Guinea-Bissau', 'Guinea-Bissau', 'Western Africa', 'Bissau', 36120, 350, 0, 'Atlantic Ocean', 300, 'unnamed location', '24-Sep-1973', 'Independence Day', '24-Sep', 1442029, '2.07', '46.87', '19.00', 28, 'tropical; generally hot and humid; monsoonal-type rainy season (June to November) with southwesterly winds; dry season (December to May) with northeasterly harmattan winds', 'PU', '.gw', NULL, 'XOF'),
(248, 9, 'Republic of Seychelles', 'Seychelles', 'Oceania', 'Victoria', 455, 491, 0, 'Indian Ocean', 905, 'Morne Seychellois', '29-Jun-1976', 'Constitution Day', '18-Jun', 81541, '0.43', '72.08', '28.10', 15, 'tropical marine; humid; cooler season during southeast monsoon (late May to September); warmer season during northwest monsoon (March to May)', 'SE', '.sc', NULL, 'SCR'),
(249, 15, 'Republic of the Sudan', 'Sudan', 'Northern Africa', 'Khartoum', 2505810, 853, 0, 'Red Sea', 3187, 'Kinyeti', '1-Jan-1956', 'Independence Day', '1-Jan', 41236378, '2.55', '58.92', '18.30', 86, 'tropical in south; arid desert in north; rainy season varies by region (April to November)', 'SU', '.sd', NULL, 'SDD'),
(250, 17, 'Republic of Rwanda', 'Rwanda', 'Central Africa', 'Kigali', 26338, 0, 950, 'Rusizi River', 4519, 'Volcan Karisimbi', '1-Jul-1962', 'Independence Day', '1-Jul', 8648248, '2.43', '47.30', '18.60', 9, 'temperate; two rainy seasons (February to April, November to January); mild in mountains with frost and snow possible', 'RW', '.rw', NULL, 'RWF'),
(251, 14, 'Federal Democratic Republic of Ethiopia', 'Ethiopia', 'Eastern Africa', 'Addis Ababa', 1127127, 0, -125, 'Denakil Depression', 4620, 'Ras Dejen', '', 'National Day', '28-May', 74777981, '2.31', '49.03', '17.80', 82, 'tropical monsoon with wide topographic-induced variation', 'ET', '.et', NULL, 'ETB'),
(252, 14, 'Somalia', '', 'Eastern Africa', 'Mogadishu', 637657, 3025, 0, 'Indian Ocean', 2416, 'Shimbiris', '1-Jul-1960', 'Foundation of the Somali Republic', '1-Jul', 8863338, '2.85', '48.47', '17.60', 64, 'principally desert; northeast monsoon (December to February), moderate temperatures in north and very hot in south; southwest monsoon (May to October), torrid in the north and hot in the south, irregular rainfall, hot and humid periods (tangambili) between monsoons', 'SO', '.so', NULL, 'SOS'),
(253, 14, 'Republic of Djibouti', 'Djibouti', 'Eastern Africa', 'Djibouti', 23000, 314, -155, 'Lac Assal', 2028, 'Moussa Ali', '27-Jun-1977', 'Independence Day', '27-Jun', 486530, '2.02', '43.17', '18.20', 13, 'desert; torrid, dry', 'DJ', '.dj', NULL, 'DJF'),
(254, 14, 'Republic of Kenya', 'Kenya', 'Eastern Africa', 'Nairobi', 582650, 536, 0, 'Indian Ocean', 5199, 'Mount Kenya', '12-Dec-1963', 'Independence Day', '12-Dec', 34707817, '2.57', '48.93', '18.20', 224, 'varies from tropical along coast to arid in interior', 'KE', '.ke', NULL, 'KES'),
(255, 14, 'United Republic of Tanzania', 'Tanzania', 'Eastern Africa', 'Dar es Salaam', 945087, 1424, 0, 'Indian Ocean', 5895, 'Kilimanjaro', '26-Apr-1964', 'Union Day', '26-Apr', 37445392, '1.83', '45.64', '17.70', 123, 'varies from tropical along coast to temperate in highlands', 'TZ', '.tz', NULL, 'TZS'),
(256, 14, 'Republic of Uganda', 'Uganda', 'Eastern Africa', 'Kampala', 236040, 0, 621, 'Lake Albert', 5110, 'Margherita Peak on Mount Stanley', '9-Oct-1962', 'Independence Day', '9-Oct', 28195754, '3.37', '52.67', '15.00', 28, 'tropical; generally rainy with two dry seasons (December to February, June to August); semiarid in northeast', 'UG', '.ug', NULL, 'UGX'),
(257, 17, 'Republic of Burundi', 'Burundi', 'Central Africa', 'Bujumbura', 27830, 0, 772, 'Lake Tanganyika', 2670, 'Heha', '1-Jul-1962', 'Independence Day', '1-Jul', 8090068, '3.7', '50.81', '16.60', 8, 'equatorial; high plateau with considerable altitude variation', 'BY', '.bi', NULL, 'BIF'),
(258, 18, 'Republic of Mozambique', 'Mozambique', 'Southeastern Africa', 'Maputo', 801590, 2470, 0, 'Indian Ocean', 2436, 'Monte Binga', '25-Jun-1975', 'Independence Day', '25-Jun', 19686505, '1.38', '39.82', '18.30', 158, 'tropical to subtropical', 'MZ', '.mz', NULL, 'MZM'),
(260, 18, 'Republic of Zambia', 'Zambia', 'Southern Africa', 'Lusaka', 752614, 0, 329, 'Zambezi river', 2301, 'unnamed location in Mafinga Hills', '24-Oct-1964', 'Independence Day', '24-Oct', 11502010, '2.11', '40.03', '16.50', 109, 'tropical; modified by altitude; rainy season (October to April)', 'ZA', '.zm', NULL, 'ZMK'),
(261, 18, 'Republic of Madagascar', 'Madagascar', 'Southern Africa', 'Antananarivo', 587040, 4828, 0, 'Indian Ocean', 2876, 'Maromokotro', '26-Jun-1960', 'Independence Day', '26-Jun', 18595469, '3.03', '57.34', '17.50', 116, 'tropical along coast, temperate inland, arid in south', 'MA', '.mg', NULL, 'MGA'),
(262, 18, 'Department of Reunion', 'Reunion', 'Southern Africa', 'Saint-Denis', 2517, 207, 0, 'Indian Ocean', 3069, 'Piton des Neiges', '', 'Bastille Day', '14-Jul', 787584, '1.34', '74.18', '26.90', 2, 'tropical, but temperature moderates with elevation; cool and dry (May to November), hot and rainy (November to April)', 'RE', '.re', NULL, 'EUR'),
(263, 18, 'Republic of Zimbabwe', 'Zimbabwe', 'Southern Africa', 'Harare', 390580, 0, 162, 'junction of the Runde and Save rivers', 2592, 'Inyangani', '18-Apr-1980', 'Independence Day', '18-Apr', 12236805, '0.62', '39.29', '19.90', 404, 'tropical; moderated by altitude; rainy season (November to March)', 'ZI', '.zw', NULL, 'ZWD'),
(264, 18, 'Republic of Namibia', 'Namibia', 'Southern Africa', 'Windhoek', 825418, 1572, 0, 'Atlantic Ocean', 2606, 'Konigstein', '21-Mar-1990', 'Independence Day', '21-Mar', 2044147, '0.59', '43.39', '20.00', 136, 'desert; hot, dry; rainfall sparse and erratic', 'WA', '.na', NULL, 'NAD'),
(265, 18, 'Republic of Malawi', 'Malawi', 'Southern Africa', 'Lilongwe', 118480, 0, 37, 'junction of the Shire River and international boundary with Mozambique', 3002, 'Sapitwa', '6-Jul-1964', 'Independence Day', '6-Jul', 13013926, '2.38', '41.70', '16.50', 42, 'sub-tropical; rainy season (November to May); dry season (May to November)', 'MI', '.mw', NULL, 'MWK'),
(266, 18, 'Kingdom of Lesotho', 'Lesotho', 'Southern Africa', 'Maseru', 30355, 0, 1400, 'junction of the Orange and Makhaleng Rivers', 3482, 'Thabana Ntlenyana', '4-Oct-1966', 'Independence Day', '4-Oct', 2022331, '-0.46', '34.40', '20.30', 28, 'temperate; cool to cold, dry winters; hot, wet summers', 'LT', '.ls', NULL, 'LSL'),
(267, 18, 'Republic of Botswana', 'Botswana', 'Southern Africa', 'Gaborone', 600370, 0, 513, 'junction of the Limpopo and Shashe Rivers', 1489, 'Tsodilo Hills', '30-Sep-1966', 'Independence Day', '30-Sep', 1639833, '-0.04', '33.74', '19.40', 85, 'semiarid; warm winters and hot summers', 'BC', '.bw', NULL, 'BWP'),
(268, 18, 'Kingdom of Swaziland', 'Swaziland', 'Southern Africa', 'Mbabane', 17363, 0, 21, 'Great Usutu River', 1862, 'Emlembe', '6-Sep-1968', 'Independence Day', '6-Sep', 1136334, '-0.23', '32.62', '18.50', 18, 'varies from tropical to near temperate', 'WZ', '.sz', NULL, 'SZL'),
(269, 18, 'Union of the Comoros', 'Comoros', 'Southern Africa', 'Moroni', 2170, 340, 0, 'Indian Ocean', 2360, 'Le Kartala', '6-Jul-1975', 'Independence Day', '6-Jul', 690948, '2.87', '62.33', '18.60', 4, 'tropical marine; rainy season (November to May)', 'CN', '.km', NULL, 'KMF'),
(270, 18, 'Territorial Collectivity of Mayotte', 'Mayotte', 'Southern Africa', 'Mamoutzou', 374, 185, 0, 'Indian Ocean', 660, 'Benara', '', 'Bastille Day', '14-Jul', 201234, '3.77', '61.76', '17.00', 1, 'tropical; marine; hot, humid, rainy season during northeastern monsoon (November to May); dry season is cooler (May to November)', 'MF', '.yt', NULL, 'EUR'),
(280, 5, 'South Georgia and the South Sandwich Islands', '', 'Southern South America', NULL, 3903, NULL, 0, 'Atlantic Ocean', 2934, 'Mount Paget', NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 'variable, with mostly westerly winds throughout the year interspersed with periods of calm; nearly all precipitation falls as snow', 'SX', '.gs', NULL, 'NONE'),
(283, 15, 'Western Sahara', '', 'Northern Africa', '', 266000, 1110, -55, 'Sebjet Tah', 463, 'unnamed location', NULL, NULL, NULL, 273008, NULL, NULL, NULL, 11, 'hot, dry desert; rain is rare; cold offshore air currents produce fog and heavy dew', 'WI', '.eh', NULL, 'MAD'),
(290, 11, 'Saint Helena', '', 'islands in the South Atlantic Ocean', 'Jamestown', 413, 60, 0, 'Atlantic Ocean', 818, 'Mount Actaeon', '', 'Birthday of Queen ELIZABETH II', 'second Saturday in June', 7502, '0.56', '77.93', '36.00', 1, 'tropical marine; mild, tempered by trade winds', 'SH', '.sh', NULL, 'SHP'),
(291, 14, 'State of Eritrea', 'Eritrea', 'Eastern Africa', 'Asmara', 121320, 2234, -75, 'near Kulul within the Denakil depression', 3018, 'Soira', '24-May-1993', 'Independence Day', '24-May', 4786994, '2.47', '59.03', '17.80', 17, 'hot, dry desert strip along Red Sea coast; cooler and wetter in the central highlands (up to 61 cm of rainfall annually, heaviest June to September); semiarid in western hills and lowlands', 'ER', '.er', NULL, 'ERN'),
(297, 29, 'Aruba', '', 'Caribbean', 'Oranjestad', 193, 69, 0, 'Caribbean Sea', 188, 'Mount Jamanota', NULL, 'Flag Day', '18-Mar', 71891, '0.44', '79.28', '38.50', 1, 'tropical marine', 'AA', '.aw', NULL, 'AWG'),
(298, 154, 'Faroe Islands', '', 'Northern Europe', 'Torshavn', 1399, 1117, 0, 'Atlantic Ocean', 882, 'Slaettaratindur', '', 'Olaifest', '29-Jul', 47246, '0.58', '79.35', '35.00', 1, 'mild winters, cool summers; usually overcast; foggy, windy', 'FO', '.fo', NULL, 'DKK'),
(299, 21, 'Greenland', '', 'Northern North America', 'Nuuk', 2166086, 44087, 0, 'Atlantic Ocean', 3700, 'Gunnbjorn', '', 'Longest Day', '21-Jun', 56361, '-0.03', '69.94', '34.00', 14, 'arctic to subarctic; cool summers, cold winters', 'GL', '.gl', NULL, 'DKK'),
(300, 29, 'Navassa Island', '', 'Caribbean', NULL, 5, 8, 0, 'Caribbean Sea', 77, 'unnamed location on southwest side', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 'marine, tropical', 'BQ', '', NULL, 'NONE'),
(350, 39, 'Gibraltar', '', 'Southwestern Europe', 'Gibraltar', 7, 12, 0, 'Mediterranean Sea', 426, 'Rock of Gibraltar', '', 'National Day', '10-Sep', 27928, '0.14', '79.80', '39.80', 1, 'Mediterranean with mild winters and warm summers', 'GI', '.gi', NULL, 'GIP'),
(351, 39, 'Portuguese Republic', 'Portugal', 'Southwestern Europe', 'Lisbon', 92391, 1793, 0, 'Atlantic Ocean', 2351, 'Ponta do Pico', '5-Oct-1910', 'Portugal Day', '10-Jun', 10605870, '0.36', '77.70', '38.50', 66, 'maritime temperate; cool and rainy in north, warmer and drier in south', 'PO', '.pt', NULL, 'EUR'),
(352, 155, 'Grand Duchy of Luxembourg', 'Luxembourg', 'Western Europe', 'Luxembourg', 2586, 0, 133, 'Moselle River', 559, 'Buurgplaatz', '12-Jan-1905', 'National Day', '23-Jun', 474413, '1.23', '78.89', '38.70', 2, 'modified continental with mild winters, cool summers', 'LU', '.lu', NULL, 'EUR'),
(353, 155, 'Republic of Ireland', 'Ireland', 'Western Europe', 'Dublin', 70280, 1448, 0, 'Atlantic Ocean', 1041, 'Carrauntoohil', '6-Dec-1921', 'Saint Patricks Day', '17-Mar', 4062235, '1.15', '77.73', '34.00', 36, 'temperate maritime; modified by North Atlantic Current; mild winters, cool summers; consistently humid; overcast about half the time', 'EI', '.ie', NULL, 'EUR'),
(354, 154, 'Republic of Iceland', 'Iceland', 'Northern Europe', 'Reykjavik', 103000, 4970, 0, 'Atlantic Ocean', 2110, 'Hvannadalshnukur', '1-Dec-1918', 'Independence Day', '17-Jun', 299388, '0.87', '80.31', '34.20', 97, 'temperate; moderated by North Atlantic Current; mild, windy winters; damp, cool summers', 'IC', '.is', NULL, 'ISK'),
(355, 39, 'Republic of Albania', 'Albania', 'Southeastern Europe', 'Tirana', 28748, 362, 0, 'Adriatic Sea', 2764, 'Maja e Korabit (Golem Korab)', '28-Nov-1912', 'Independence Day', '28-Nov', 3581655, '0.52', '77.43', '28.90', 11, 'mild temperate; cool, cloudy, wet winters; hot, clear, dry summers; interior is cooler and wetter', 'AL', '.al', NULL, 'ALL'),
(356, 39, 'Republic of Malta', 'Malta', 'Southern Europe', 'Valletta', 316, 197, 0, 'Mediterranean Sea', 253, 'Ta Dmejrek', '21-Sep-1964', 'Independence Day', '21-Sep', 400214, '0.42', '79.01', '38.70', 1, 'Mediterranean; mild, rainy winters; hot, dry summers', 'MT', '.mt', NULL, 'MTL'),
(357, 145, 'Republic of Cyprus', 'Cyprus', 'Middle East', 'Nicosia', 9250, 648, 0, 'Mediterranean Sea', 1951, 'Mount Olympus', '16-Aug-1960', 'Independence Day', '1-Oct', 784301, '0.53', '77.82', '34.90', 16, 'temperate; Mediterranean with hot, dry summers and cool winters', 'CY', '.cy', NULL, 'CYP'),
(358, 154, 'Republic of Finland', 'Finland', 'Northern Europe', 'Helsinki', 338145, 1250, 0, 'Baltic Sea', 1328, 'Haltiatunturi', '6-Dec-1917', 'Independence Day', '6-Dec', 5231372, '0.14', '78.50', '41.30', 148, 'cold temperate; potentially subarctic but comparatively mild because of moderating influence of the North Atlantic Current, Baltic Sea, and more than 60,000 lakes', 'FI', '.fi', NULL, 'EUR'),
(359, 39, 'Republic of Bulgaria', 'Bulgaria', 'Southeastern Europe', 'Sofia', 110910, 354, 0, 'Black Sea', 2925, 'Musala', '3-Mar-1878', 'Liberation Day', '3-Mar', 7385367, '-0.86', '72.30', '40.80', 213, 'temperate; cold, damp winters; hot, dry summers', 'BU', '.bg', NULL, 'BGL'),
(370, 151, 'Republic of Lithuania', 'Lithuania', 'Eastern Europe', 'Vilnius', 65200, 90, 0, 'Baltic Sea', 294, 'Juozapines Kalnas', '6-Sep-1991', 'Independence Day', '11-Mar', 3585906, '-0.3', '74.20', '38.20', 95, 'transitional, between maritime and continental; wet, moderate winters and summers', 'LH', '.lt', NULL, 'LTL'),
(371, 151, 'Republic of Latvia', 'Latvia', 'Eastern Europe', 'Riga', 64589, 531, 0, 'Baltic Sea', 312, 'Gaizinkalns', '21-Aug-1991', 'Independence Day', '18-Nov', 2274735, '-0.67', '71.33', '39.40', 47, 'maritime; wet, moderate winters', 'LG', '.lv', NULL, 'LVL'),
(372, 151, 'Republic of Estonia', 'Estonia', 'Eastern Europe', 'Tallinn', 45226, 3794, 0, 'Baltic Sea', 318, 'Suur Munamagi', '20-Aug-1991', 'Independence Day', '20-Aug', 1324333, '-0.64', '72.04', '39.30', 26, 'maritime, wet, moderate winters, cool summers', 'EN', '.ee', NULL, 'EEK'),
(373, 151, 'Republic of Moldova', 'Moldova', 'Eastern Europe', 'Chisinau', 33843, 0, 2, 'Dniester River', 430, 'Dealul Balanesti', '27-Aug-1991', 'Independence Day', '27-Aug', 4466706, '0.28', '65.65', '32.30', 15, 'moderate winters, warm summers', 'MD', '.md', NULL, 'MDL'),
(374, 145, 'Republic of Armenia', 'Armenia', 'Southwestern Asia', 'Yerevan', 29800, 0, 400, 'Debed River', 4090, 'Aragats Lerrnagagat', '21-Sep-1991', 'Independence Day', '21-Sep', 2976372, '-0.19', '71.84', '30.40', 16, 'highland continental, hot summers, cold winters', 'AM', '.am', NULL, 'AMD'),
(375, 151, 'Republic of Belarus', 'Belarus', 'Eastern Europe', 'Minsk', 207600, 0, 90, 'Nyoman River', 346, 'Dzyarzhynskaya Hara', '25-Aug-1991', 'Independence Day', '3-Jul', 10293011, '-0.06', '69.08', '37.20', 101, 'cold winters, cool and moist summers; transitional between continental and maritime', 'BO', '.by', NULL, 'BYB'),
(376, 39, 'Principality of Andorra', 'Andorra', 'Southwestern Europe', 'Andorra la Vella', 468, 0, 840, 'Riu Runer', 2946, 'Coma Pedrosa', '1-Jul-1903', 'Our Lady of Meritxell Day', '8-Sep', 71201, '0.89', '83.51', '40.90', 0, 'temperate; snowy, cold winters and warm, dry summers', 'AN', '.ad', NULL, 'EUR'),
(377, 155, 'Principality of Monaco', 'Monaco', 'Western Europe', 'Monaco', 2, 4, 0, 'Mediterranean Sea', 140, 'Mont Agel', '19-Nov-1903', 'National Day', '19-Nov', 32543, '0.4', '79.69', '45.40', 0, 'Mediterranean with mild, wet winters and hot, dry summers', 'MN', '.mc', NULL, 'EUR'),
(378, 39, 'Republic of San Marino', 'San Marino', 'Southern Europe', 'San Marino', 61, 0, 55, 'Torrente Ausa', 755, 'Monte Titano', '3 September A.D. 301', 'Founding of the Republic', '3-Sep', 29251, '1.26', '81.71', '40.60', 0, 'Mediterranean; mild to cool winters; warm, sunny summers', 'SM', '.sm', NULL, 'EUR'),
(380, 151, 'Ukraine', '', 'Eastern Europe', 'Kiev', 603700, 2782, 0, 'Black Sea', 2061, 'Hora Hoverla', '24-Aug-1991', 'Independence Day', '24-Aug', 46710816, '-0.6', '69.98', '39.20', 537, 'temperate continental; Mediterranean only on the southern Crimean coast; precipitation disproportionately distributed, highest in west and north, lesser in east and southeast; winters vary from cool along the Black Sea to cold farther inland; summers are warm across the greater part of the country, hot in the south', 'UP', '.ua', NULL, 'UAH'),
(381, 39, 'Republic of Montenegro', 'Montenegro', 'Southeastern Europe', 'Cetinje', 14026, 294, 0, 'Adriatic Sea', 2522, 'Bobotov Kuk', '3-Jun-2006', 'National Day', '13-Jul', 630548, '3.5', NULL, NULL, 5, 'Mediterranean climate, hot dry summers and autumns and relatively cold winters with heavy snowfalls inland', 'MJ', '', NULL, 'EUR'),
(385, 39, 'Republic of Croatia', 'Croatia', 'Southeastern Europe', 'Zagreb', 56542, 5835, 0, 'Adriatic Sea', 1830, 'Dinara', '25-Jun-1991', 'Independence Day', '8-Oct', 4494749, '-0.03', '74.68', '40.30', 68, 'Mediterranean and continental; continental climate predominant with hot summers and cold winters; mild winters, dry summers along coast', 'HR', '.hr', NULL, 'HRK'),
(386, 39, 'Republic of Slovenia', 'Slovenia', 'Central Europe', 'Ljubljana', 20273, 47, 0, 'Adriatic Sea', 2864, 'Triglav', '25-Jun-1991', 'Independence Day', '25-Jun', 2010347, '-0.05', '76.33', '40.60', 14, 'Mediterranean climate on the coast, continental climate with mild to hot summers and cold winters in the plateaus and valleys to the east', 'SI', '.si', NULL, 'SIT'),
(387, 39, 'Bosnia and Herzegovina', '', 'Southeastern Europe', 'Sarajevo', 51129, 20, 0, 'Adriatic Sea', 2386, 'Maglic', '1-Mar-1992', 'National Day', '25-Nov', 4498976, '1.35', '78.00', '38.40', 27, 'hot summers and cold winters; areas of high elevation have short, cool summers and long, severe winters; mild, rainy winters along coast', 'BK', '.ba', NULL, 'BAM'),
(389, 39, 'Republic of Macedonia', 'Macedonia', 'Southeastern Europe', 'Skopje', 25333, 0, 50, 'Vardar River', 2764, 'Golem Korab', '8-Sep-1991', 'Uprising Day', '2-Aug', 2050554, '0.26', '73.97', '34.10', 17, 'warm, dry summers and autumns; relatively cold winters with heavy snowfall', 'MK', '.mk', NULL, 'MKD'),
(420, 151, 'Czech Republic', 'Czech Republic', 'Central Europe', 'Prague', 78866, 0, 115, 'Elbe River', 1602, 'Snezka', '1-Jan-1993', 'Czech Founding Day', '28-Oct', 10235455, '-0.06', '76.22', '39.30', 121, 'temperate; cool summers; cold, cloudy, humid winters', 'EZ', '.cz', NULL, 'CZK'),
(421, 151, 'Slovak Republic', 'Slovakia', 'Central Europe', 'Bratislava', 48845, 0, 94, 'Bodrok River', 2655, 'Gerlachovsky Stit', '1-Jan-1993', 'Constitution Day', '1-Sep', 5439448, '0.15', '74.73', '35.80', 34, 'temperate; cool summers; cold, cloudy, humid winters', 'LO', '.sk', NULL, 'SKK'),
(423, 155, 'Principality of Liechtenstein', 'Liechtenstein', 'Central Europe', 'Vaduz', 160, 0, 430, 'Ruggeller Riet', 2599, 'Vorder-Grauspitz', '12-Jul-1806', 'Assumption Day', '15-Aug', 33987, '0.78', '79.68', '39.60', 0, 'continental; cold, cloudy winters with frequent snow or rain; cool to moderately warm, cloudy, humid summers', 'LS', '.li', NULL, 'CHF'),
(500, 5, 'Falkland Islands', '', 'Falkland Islands', 'Stanley', 12173, 1288, 0, 'Atlantic Ocean', 705, 'Mount Usborne', '', 'Liberation Day', '14-Jun', 2967, '2.44', NULL, NULL, 5, 'cold marine; strong westerly winds, cloudy, humid; rain occurs on more than half of days in year; average annual rainfall is 24 inches in Stanley; occasional snow all year, except in January and February, but does not accumulate', 'FK', '.fk', NULL, 'FKP'),
(501, 13, 'Belize', '', 'Central America', 'Belmopan', 22966, 386, 0, 'Caribbean Sea', 1160, 'Victoria Peak', '21-Sep-1981', 'Independence Day', '21-Sep', 287730, '2.31', '68.30', '19.60', 43, 'tropical; very hot and humid; rainy season (May to November); dry season (February to May)', 'BH', '.bz', NULL, 'BZD'),
(502, 13, 'Republic of Guatemala', 'Guatemala', 'Central America', 'Guatemala', 108890, 400, 0, 'Pacific Ocean', 4211, 'Volcan Tajumulco', '15-Sep-1821', 'Independence Day', '15-Sep', 12293545, '2.27', '69.38', '18.90', 449, 'tropical; hot, humid in lowlands; cooler in highlands', 'GT', '.gt', NULL, 'GTQ');
INSERT INTO `wf_countries` (`COUNTRY_ID`, `REGION_ID`, `COUNTRY_NAME`, `COUNTRY_TRANSLATED_NAME`, `LOCATION`, `CAPITOL`, `AREA`, `COASTLINE`, `LOWEST_ELEVATION`, `LOWEST_ELEV_NAME`, `HIGHEST_ELEVATION`, `HIGHEST_ELEV_NAME`, `DATE_OF_INDEPENDENCE`, `NATIONAL_HOLIDAY_NAME`, `NATIONAL_HOLIDAY_DATE`, `POPULATION`, `POPULATION_GROWTH_RATE`, `LIFE_EXPECT_AT_BIRTH`, `MEDIAN_AGE`, `AIRPORTS`, `CLIMATE`, `FIPS_ID`, `INTERNET_EXTENSION`, `FLAG`, `CURRENCY_CODE`) VALUES
(503, 13, 'Republic of El Salvador', 'El Salvador', 'Central America', 'San Salvador', 21040, 307, 0, 'Pacific Ocean', 2730, 'Cerro El Pital', '15-Sep-1821', 'Independence Day', '15-Sep', 6822378, '1.72', '71.49', '21.80', 76, 'tropical; rainy season (May to October); dry season (November to April); tropical on coast; temperate in uplands', 'ES', '.sv', NULL, 'USD'),
(504, 13, 'Republic of Honduras', 'Honduras', 'Central America', 'Tegucigalpa', 112090, 820, 0, 'Caribbean Sea', 2870, 'Cerro Las Minas', '15-Sep-1821', 'Independence Day', '15-Sep', 7326496, '2.16', '69.33', '19.50', 116, 'subtropical in lowlands, temperate in mountains', 'HO', '.hn', NULL, 'HNL'),
(505, 13, 'Republic of Nicaragua', 'Nicaragua', 'Central America', 'Managua', 129494, 910, 0, 'Pacific Ocean', 2438, 'Mogoton', '15-Sep-1821', 'Independence Day', '15-Sep', 5570129, '1.89', '70.63', '20.90', 176, 'tropical in lowlands, cooler in highlands', 'NU', '.ni', NULL, 'NIO'),
(506, 13, 'Republic of Costa Rica', 'Costa Rica', 'Central America', 'San Jose', 51100, 1290, 0, 'Pacific Ocean', 3810, 'Cerro Chirripo', '15-Sep-1821', 'Independence Day', '15-Sep', 4075261, '1.45', '77.02', '26.40', 156, 'tropical and subtropical; dry season (December to April); rainy season (May to November); cooler in highlands', 'CS', '.cr', NULL, 'CRC'),
(507, 13, 'Republic of Panama', 'Panama', 'Central America', 'Panama', 78200, 2490, 0, 'Pacific Ocean', 3475, 'Volcan de Chiriqui', '3-Nov-1903', 'Independence Day', '3-Nov', 3191319, '1.6', '75.22', '26.10', 109, 'tropical maritime; hot, humid, cloudy; prolonged rainy season (May to January), short dry season (January to May)', 'PM', '.pa', NULL, 'PAB'),
(508, 21, 'Territorial Collectivity of Saint Pierre and Miquelon', 'Saint Pierre and Miquelon', 'Northern North America', 'Saint-Pierre', 242, 120, 0, 'Atlantic Ocean', 240, 'Morne de la Grande Montagne', '', 'Bastille Day', '14-Jul', 7026, '0.17', '78.61', '34.10', 2, 'cold and wet, with much mist and fog; spring and autumn are windy', 'SB', '.pm', NULL, 'EUR'),
(509, 29, 'Republic of Haiti', 'Haiti', 'Caribbean', 'Port-au-Prince', 27750, 1771, 0, 'Caribbean Sea', 2680, 'Chaine de la Selle', '1-Jan-1804', 'Independence Day', '1-Jan', 8308504, '2.3', '53.23', '18.20', 12, 'tropical; semiarid where mountains in east cut off trade winds', 'HA', '.ht', NULL, 'HTG'),
(590, 29, 'Department of Guadeloupe', 'Guadeloupe', 'Caribbean', 'Basse-Terre', 1780, 306, 0, 'Caribbean Sea', 1484, 'Soufriere', '', 'Bastille Day', '14-Jul', 452776, '0.88', '78.06', '32.20', 9, 'subtropical tempered by trade winds; moderately high humidity', 'GP', '.gp', NULL, 'EUR'),
(591, 5, 'Republic of Bolivia', 'Bolivia', 'South America', 'La Paz', 1098580, 0, 90, 'Rio Paraguay', 6542, 'Nevado Sajama', '6-Aug-1825', 'Independence Day', '6-Aug', 8989046, '1.45', '65.84', '21.80', 1067, 'varies with altitude; humid and tropical to cold and semiarid', 'BL', '.bo', NULL, 'BOB'),
(592, 5, 'Co-operative Republic of Guyana', 'Guyana', 'Northern South America', 'Georgetown', 214970, 459, 0, 'Atlantic Ocean', 2835, 'Mount Roraima', '26-May-1966', 'Republic Day', '23-Feb', 767245, '0.25', '65.86', '27.40', 69, 'tropical; hot, humid, moderated by northeast trade winds; two rainy seasons (May to August, November to January)', 'GY', '.gy', NULL, 'GYD'),
(593, 5, 'Republic of Ecuador', 'Ecuador', 'Western South America', 'Quito', 283560, 2237, 0, 'Pacific Ocean', 6267, 'Chimborazo', '24 May 1822', 'Independence Day', '10-Aug', 13547510, '1.5', '76.42', '23.60', 285, 'tropical along coast, becoming cooler inland at higher elevations; tropical in Amazonian jungle lowlands', 'EC', '.ec', NULL, 'USD'),
(594, 5, 'Department of Guiana', 'French Guiana', 'Northern South America', 'Cayenne', 91000, 378, 0, 'Atlantic Ocean', 851, 'Bellevue de lInini', '', 'Bastille Day', '14-Jul', 199509, '1.96', '77.27', '28.60', 11, 'tropical; hot, humid; little seasonal temperature variation', 'FG', '.gf', NULL, 'EUR'),
(595, 5, 'Republic of Paraguay', 'Paraguay', 'Central South America', 'Asuncion', 406750, 0, 46, 'junction of Rio Paraguay and Rio Parana', 842, 'Cerro Pero', '14-May-1811', 'Independence Day', '15-May', 6506464, '2.45', '75.10', '21.30', 880, 'subtropical to temperate; substantial rainfall in the eastern portions, becoming semiarid in the far west', 'PA', '.py', NULL, 'PYG'),
(596, 29, 'Department of Martinique', 'Martinique', 'Caribbean', 'Fort-de-France', 1100, 350, 0, 'Caribbean Sea', 1397, 'Montagne Pelee', '', 'Bastille Day', '14-Jul', 436131, '0.72', '79.18', '34.10', 2, 'tropical; moderated by trade winds; rainy season (June to October); vulnerable to devastating cyclones (hurricanes) every eight years on average; average temperature 17.3 degrees C; humid', 'MB', '.mq', NULL, 'EUR'),
(597, 5, 'Republic of Suriname', 'Suriname', 'South America', 'Paramaribo', 163270, 386, -2, 'unnamed location', 1230, 'Juliana Top', '25-Nov-1975', 'Independence Day', '25-Nov', 439117, '0.2', '69.01', '26.50', 47, 'tropical; moderated by trade winds', 'NS', '.sr', NULL, 'SRD'),
(598, 5, 'Oriental Republic of Uruguay', 'Uruguay', 'Southern South America', 'Montevideo', 176220, 660, 0, 'Atlantic Ocean', 514, 'Cerro Catedral', '25-Aug-1825', 'Independence Day', '25-Aug', 3431932, '0.46', '76.33', '32.70', 64, 'warm temperate; freezing temperatures almost unknown', 'UY', '.uy', NULL, 'UYU'),
(599, 29, 'Netherlands Antilles', '', 'Caribbean', 'Willemstad', 960, 364, 0, 'Caribbean Sea', 862, 'Mount Scenery', '', 'Queens Day', '30-Apr', 221736, '0.79', '76.03', '32.80', 5, 'tropical; ameliorated by northeast trade winds', 'NT', '.an', NULL, 'ANG'),
(618, 35, 'Territory of Christmas Island', 'Christmas Island', 'Southeastern Asia', 'The Settlement', 135, 139, 0, 'Indian Ocean', 361, 'Murray Hill', NULL, 'Australia Day', '26-Jan', 1493, '0', NULL, NULL, 1, 'tropical with a wet and dry season; heat and humidity moderated by trade winds; wet season (December to April)', 'KT', '.cx', NULL, 'AUD'),
(670, 35, 'Democratic Republic of Timor-Leste', 'East Timor', 'Southeastern Asia', 'Dili', 15007, 706, 0, 'Timor Sea', 2963, 'Foho Tatamailau', '28-Nov-1975', 'Independence Day', '28-Nov', 1062777, '2.08', '66.26', '20.80', 8, 'tropical; hot, humid; distinct rainy and dry seasons', 'TT', '.tl', NULL, 'USD'),
(671, 9, 'Territory of Norfolk Island', 'Norfolk Island', 'Oceania', 'Kingston', 35, 32, 0, 'Pacific Ocean', 319, 'Mount Bates', '', 'Bounty Day', '8-Jun', 1828, '-0.01', NULL, NULL, 1, 'subtropical; mild, little seasonal temperature variation', 'NF', '.nf', NULL, 'AUD'),
(672, 9, 'Antarctica', '', 'continent mostly south of the Antarctic Circle', NULL, 14000000000, 17968, -2555, 'Bentley Subglacial Trench', 4897, 'Vinson Massif', NULL, NULL, NULL, 0, NULL, NULL, NULL, 28, 'severe low temperatures vary with latitude, elevation, and distance from the ocean; East Antarctica is colder than West Antarctica because of its higher elevation; Antarctic Peninsula has the most moderate climate; higher temperatures occur in January along the coast and average slightly below freezing', 'AY', '.aq', NULL, 'NONE'),
(673, 35, 'Negara Brunei Darussalam', 'Brunei', 'Southeastern Asia, bordering the South China Sea and Malaysia', 'Bandar Seri Begawan', 5770, 161, 0, 'South China Sea', 1850, 'Bukit Pagon', '1-Jan-1984', 'National Day', '23-Feb', 379444, '1.87', '75.01', '27.40', 2, 'tropical; hot, humid, rainy', 'BX', '.bn', NULL, 'BND'),
(674, 9, 'Republic of Nauru', 'Nauru', 'Oceania', 'no official capital', 21, 30, 0, 'Pacific Ocean', 61, 'unnamed location', '31-Jan-1968', 'Independence Day', '31-Jan', 13287, '1.81', '63.08', '20.60', 1, 'tropical with a monsoonal pattern; rainy season (November to February)', 'NR', '.nr', NULL, 'AUD'),
(675, 9, 'Independent State of Papua New Guinea', 'Papua New Guinea', 'Oceania', 'Port Moresby', 462840, 5152, 0, 'Pacific Ocean', 4509, 'Mount Wilhelm', '16-Sep-1975', 'Independence Day', '16-Sep', 5670544, '2.21', '65.28', '21.20', 572, 'tropical; northwest monsoon (December to March), southeast monsoon (May to October); slight seasonal temperature variation', 'PP', '.pg', NULL, 'PGK'),
(676, 9, 'Kingdom of Tonga', 'Tonga', 'Oceania', 'Nuku alofa', 748, 419, 0, 'Pacific Ocean', 1033, 'unnamed location on Kao Island', '4-Jun-1970', 'Emancipation Day', '4-Jun', 114689, '2.01', '69.82', '20.70', 6, 'tropical; modified by trade winds; warm season (December to May), cool season (May to December)', 'TN', '.to', NULL, 'TOP'),
(677, 9, 'Solomon Islands', '', 'Oceania', 'Honiara', 28450, 5313, 0, 'Pacific Ocean', 2447, 'Mount Makarakomburu', '7-Jul-1978', 'Independence Day', '7-Jul', 552438, '2.61', '72.91', '18.90', 34, 'tropical monsoon; few extremes of temperature and weather', 'BP', '.sb', NULL, 'SBD'),
(678, 9, 'Republic of Vanuatu', 'Vanuatu', 'Oceania', 'Port-Vila', 12200, 2528, 0, 'Pacific Ocean', 1877, 'Tabwemasana', '30-Jul-1980', 'Independence Day', '30-Jul', 208869, '1.49', '62.85', '23.00', 31, 'tropical; moderated by southeast trade winds from May to October; moderate rainfall from November to April; may be affected by cyclones from December to April', 'NH', '.vu', NULL, 'VUV'),
(679, 9, 'Republic of the Fiji Islands', 'Fiji', 'Oceania', 'Suva', 18270, 1129, 0, 'Pacific Ocean', 1324, 'Tomanivi', '10-Oct-1970', 'Independence Day', 'second Monday of October', 905949, '1.4', '69.82', '24.60', 28, 'tropical marine; only slight seasonal temperature variation', 'FJ', '.fj', NULL, 'FJD'),
(680, 9, 'Republic of Palau', 'Palau', 'Oceania', 'Koror', 458, 1519, 0, 'Pacific Ocean', 242, 'Mount Ngerchelchuus', '1-Oct-1994', 'Constitution Day', '9-Jul', 20579, '1.31', '70.42', '31.70', 3, 'tropical; hot and humid; wet season May to November', 'PS', '.pw', NULL, 'USD'),
(681, 9, 'Territory of the Wallis and Futuna Islands', 'Wallis and Futuna', 'Oceania', 'Mata-Utu', 274, 129, 0, 'Pacific Ocean', 765, 'Mont Singavi', '', 'Bastille Day', '14-Jul', 16025, NULL, NULL, NULL, 2, 'tropical; hot, rainy season (November to April); cool, dry season (May to October); rains 2,500-3,000 mm per year (80% humidity); average temperature 26.6 degrees C', 'WF', '.wf', NULL, 'XPF'),
(683, 9, 'Niue', '', 'Oceania', 'Alofi', 260, 64, 0, 'Pacific Ocean', 68, 'unnamed location', '19-Oct-1974', 'Waitangi Day', '6-Feb', 2166, '0.01', NULL, NULL, 1, 'tropical; modified by southeast trade winds', 'NE', '.nu', NULL, 'NZD'),
(684, 9, 'Territory of American Samoa', 'American Samoa', 'Oceania', 'Pago Pago', 199, 116, 0, 'Pacific Ocean', 964, 'Lata Mountain', '', 'Flag Day', '17-Apr', 57794, '-0.19', '76.05', '23.20', 3, 'tropical marine, moderated by southeast trade winds; annual rainfall averages about 3 m; rainy season (November to April), dry season (May to October); little seasonal temperature variation', 'AQ', '.as', NULL, 'USD'),
(685, 9, 'Independent State of Samoa', 'Samoa', 'Oceania', 'Apia', 2944, 403, 0, 'Pacific Ocean', 1857, 'Mauga Silisili', '1-Jan-1962', 'Independence Day Celebration', '1-Jun', 176908, '-0.2', '71.00', '25.20', 4, 'tropical; rainy season (November to April), dry season (May to October)', 'WS', '.ws', NULL, 'SAT'),
(686, 9, 'Republic of Kiribati', 'Kiribati', 'Oceania', 'Tarawa', 811, 1143, 0, 'Pacific Ocean', 81, 'unnamed location', '12-Jul-1979', 'Independence Day', '12-Jul', 105432, '2.24', '62.08', '20.20', 19, 'tropical; marine, hot and humid, moderated by trade winds', 'KR', '.ki', NULL, 'AUD'),
(687, 9, 'Territory of New Caledonia and Dependencies', 'New Caledonia', 'Oceania', 'Noumea', 19060, 2254, 0, 'Pacific Ocean', 1628, 'Mont Panie', '', 'Bastille Day', '14-Jul', 219246, '1.24', '74.27', '27.80', 25, 'tropical; modified by southeast trade winds; hot, humid', 'NC', '.nc', NULL, 'XPF'),
(688, 9, 'Tuvalu', '', 'Oceania', 'Funafuti', 26, 24, 0, 'Pacific Ocean', 5, 'unnamed location', '1-Oct-1978', 'Independence Day', '1-Oct', 11810, '1.51', '68.32', '24.60', 1, 'tropical; moderated by easterly trade winds (March to November); westerly gales and heavy rain (November to March)', 'TV', '.tv', NULL, 'AUD'),
(689, 9, 'Overseas Lands of French Polynesia', 'French Polynesia', 'Oceania', 'Papeete', 4167, 2525, 0, 'Pacific Ocean', 2241, 'Mont Orohena', '', 'Bastille Day', '14-Jul', 274578, '1.48', '76.10', '27.90', 50, 'tropical, but moderate', 'FP', '.pf', NULL, 'XPF'),
(690, 9, 'Tokelau', '', 'Oceania', '', 10, 101, 0, 'Pacific Ocean', 5, 'unnamed location', '', 'Waitangi Day', '6-Feb', 1392, '-0.01', NULL, NULL, 0, 'tropical; moderated by trade winds (April to November)', 'TL', '.tk', NULL, 'NZD'),
(691, 9, 'Federated States of Micronesia', '', 'Oceania', 'Palikir', 702, 6112, 0, 'Pacific Ocean', 791, 'Dolohmwar', '3-Nov-1986', 'Constitution Day', '10-May', 108004, '-0.11', '70.05', '20.90', 6, 'tropical; heavy year-round rainfall, especially in the eastern islands; located on southern edge of the typhoon belt with occasionally severe damage', 'FM', '.fm', NULL, 'USD'),
(692, 9, 'Republic of the Marshall Islands', 'Marshall Islands', 'Oceania', 'Majuro', 11854, 370, 0, 'Pacific Ocean', 10, 'unnamed location', '1-Oct-1986', 'Constitution Day', '1-May', 60422, '2.25', '70.31', '20.30', 15, 'tropical; hot and humid; wet season May to November; islands border typhoon belt', 'RM', '.mh', NULL, 'USD'),
(850, 30, 'Democratic Peoples Republic of Korea', 'North Korea', 'Eastern Asia', 'Pyongyang', 120540, 2495, 0, 'Sea of Japan', 2744, 'Paektu-san', '15-Aug-1945', 'Founding of the Democratic Peoples Republic of Korea', '9-Sep', 23113019, '0.84', '71.65', '32.00', 79, 'temperate with rainfall concentrated in summer', 'KN', '.kp', NULL, 'KPW'),
(852, 30, 'Hong Kong Special Administrative Region', 'Hong Kong', 'Eastern Asia', '', 1092, 733, 0, 'South China Sea', 958, 'Tai Mo Shan', '', 'National Day', '1-Oct', 6940432, '0.59', '81.59', '40.70', 3, 'subtropical monsoon; cool and humid in winter, hot and rainy from spring through summer, warm and sunny in fall', 'HK', '.hk', NULL, 'HKD'),
(853, 30, 'Macau Special Administrative Region', 'Macau', 'Eastern Asia', '', 28, 41, 0, 'South China Sea', 172, 'Coloane Alto', '', 'National Day', '1-Oct', 453125, '0.86', '82.19', '36.10', 1, 'subtropical; marine with cool winters, warm summers', 'MC', '.mo', NULL, 'MOP'),
(855, 35, 'Kingdom of Cambodia', 'Cambodia', 'Southeastern Asia', 'Phnom Penh', 181040, 443, 0, 'Gulf of Thailand', 1810, 'Phnum Aoral', '9-Nov-1953', 'Independence Day', '9-Nov', 13881427, '1.78', '59.29', '20.60', 20, 'tropical; rainy, monsoon season (May to November); dry season (December to April); little seasonal temperature variation', 'CB', '.kh', NULL, 'KHR'),
(856, 35, 'Lao Peoples Democratic Republic', 'Laos', 'Southeastern Asia', 'Vientiane', 236800, 0, 70, 'Mekong River', 2817, 'Phou Bia', '19-Jul-1949', 'Republic Day', '2-Dec', 6368481, '2.39', '55.49', '18.90', 44, 'tropical monsoon; rainy season (May to November); dry season (December to April)', 'LA', '.la', NULL, 'LAK'),
(880, 34, 'Peoples Republic of Bangladesh', 'Bangladesh', 'Southern Asia', 'Dhaka', 144000, 580, 0, 'Indian Ocean', 1230, 'Keokradong', '16-Dec-1971', 'Independence Day', '26-Mar', 147365352, '2.09', '62.46', '22.20', 16, 'tropical; mild winter (October to March); hot, humid summer (March to June); humid, warm rainy monsoon (June to October)', 'BG', '.bd', NULL, 'BDT'),
(886, 30, 'Taiwan', '', 'Eastern Asia', 'Taipei', 35980, 1566, 0, 'South China Sea', 3952, 'Yu Shan', '', 'Republic Day', '10-Oct', 23036087, '0.61', '77.43', '34.60', 42, 'tropical; marine; rainy season during southwest monsoon (June to August); cloudiness is persistent and extensive all year', 'TW', '.tw', NULL, 'TWD'),
(960, 34, 'Republic of Maldives', 'Maldives', 'Southern Asia', 'Male', 300, 644, 0, 'Indian Ocean', 2, 'unnamed location', '26-Jul-1965', 'Independence Day', '26-Jul', 359008, '2.78', '64.41', '17.90', 5, 'tropical; hot, humid; dry, northeast monsoon (November to March); rainy, southwest monsoon (June to August)', 'MV', '.mv', NULL, 'MVR'),
(961, 145, 'Lebanese Republic', 'Lebanon', 'Middle East', 'Beirut', 10400, 225, 0, 'Mediterranean Sea', 3088, 'Qurnat as Sawda', '22-Nov-1943', 'Independence Day', '22-Nov', 3874050, '1.23', '72.88', '27.80', 7, 'Mediterranean; mild to cool, wet winters with hot, dry summers; Lebanon mountains experience heavy winter snows', 'LE', '.lb', NULL, 'LBP'),
(962, 145, 'Hashemite Kingdom of Jordan', 'Jordan', 'Middle East', 'Amman', 92300, 26, -408, 'Dead Sea', 1734, 'Jabal Ram', '25-May-1946', 'Independence Day', '25-May', 5906760, '2.49', '78.40', '23.00', 17, 'mostly arid desert; rainy season in west (November to April)', 'JO', '.jo', NULL, 'JOD'),
(963, 145, 'Syrian Arab Republic', 'Syria', 'Middle East', 'Damascus', 185180, 193, -200, 'unnamed location near Lake Tiberias', 2814, 'Mount Hermon', '17-Apr-1946', 'Independence Day', '17-Apr', 18881361, '2.3', '70.32', '20.70', 92, 'mostly desert; hot, dry, sunny summers (June to August) and mild, rainy winters (December to February) along coast; cold weather with snow or sleet periodically in Damascus', 'SY', '.sy', NULL, 'SYP'),
(964, 145, 'Republic of Iraq', 'Iraq', 'Middle East', 'Baghdad', 437072, 58, 0, 'Persian Gulf', 3611, 'unnamed peak', '28-Jun-2004', NULL, NULL, 26783383, '2.66', '69.01', '19.70', 111, 'mostly desert; mild to cool winters with dry, hot, cloudless summers; northern mountainous regions along Iranian and Turkish borders experience cold winters with occasionally heavy snows that melt in early spring, sometimes causing extensive flooding in central and southern Iraq', 'IZ', '.iq', NULL, 'NID'),
(965, 145, 'State of Kuwait', 'Kuwait', 'Middle East', 'Kuwait', 17820, 499, 0, 'Persian Gulf', 306, 'unnamed location', '19-Jun-1961', 'National Day', '25-Feb', 2418393, '3.52', '77.20', '25.90', 7, 'dry desert; intensely hot summers; short, cool winters', 'KU', '.kw', NULL, 'KD'),
(966, 145, 'Kingdom of Saudi Arabia', 'Saudi Arabia', 'Middle East', 'Riyadh', 1960582, 2640, 0, 'Persian Gulf', 3133, 'Jabal Sawda', '23-Sep-1932', 'Unification of the Kingdom', '23-Sep', 27019731, '2.18', '75.67', '21.40', 202, 'harsh, dry desert with great temperature extremes', 'SA', '.sa', NULL, 'SAR'),
(967, 145, 'Republic of Yemen', 'Yemen', 'Middle East', 'Sanaa', 527970, 1906, 0, 'Arabian Sea', 3760, 'Jabal an Nabi Shu ayb', '22-May-1990', 'Unification Day', '22-May', 21456188, '3.46', '62.12', '16.60', 45, 'mostly desert; hot and humid along west coast; temperate in western mountains affected by seasonal monsoon; extraordinarily hot, dry, harsh desert in east', 'YM', '.ye', NULL, 'YER'),
(968, 145, 'Sultanate of Oman', 'Oman', 'Middle East', 'Muscat', 212460, 2092, 0, 'Arabian Sea', 2980, 'Jabal Shams', '7-Jul-1904', 'Birthday of Sultan QABOOS', '18-Nov', 3102229, '3.28', '73.37', '19.00', 137, 'dry desert; hot, humid along coast; hot, dry interior; strong southwest summer monsoon (May to September) in far south', 'MU', '.om', NULL, 'OMR'),
(971, 145, 'United Arab Emirates', 'Al Imarat al Arabiyah al Muttahidah', 'Middle East', 'Abu Dhabi', 82880, 1318, 0, 'Persian Gulf', 1527, 'Jabal Yibir', '2-Dec-1971', 'Independence Day', '2-Dec', 2602713, '1.52', '75.44', '28.10', 35, 'desert', 'AE', '.ae', NULL, 'AED'),
(972, 145, 'State of Israel', 'Israel', 'Middle East', 'Jerusalem', 20770, 273, -408, 'Dead Sea', 1208, 'Har Meron', '14-May-1948', 'Independence Day', '14-May', 6352117, '1.18', '79.46', '29.60', 51, 'temperate; hot and dry in southern and eastern desert areas', 'IS', '.il', NULL, 'ILS'),
(973, 145, 'Kingdom of Bahrain', 'Bahrain', 'Middle East', 'Manama', 665, 161, 0, 'Persian Gulf', 122, 'Jabal ad Dukhan', '15-Aug-1971', 'National Day', '16-Dec', 698585, '1.45', '74.45', '29.40', 3, 'arid; mild, pleasant winters; very hot, humid summers', 'BA', '.bh', NULL, 'BHD'),
(974, 145, 'State of Qatar', 'Qatar', 'Middle East', 'Doha', 11437, 563, 0, 'Persian Gulf', 103, 'Qurayn Abu al Bawl', '3-Sep-1971', 'Independence Day', '3-Sep', 885359, '2.5', '73.90', '31.70', 5, 'arid; mild, pleasant winters; very hot, humid summers', 'QA', '.qa', NULL, 'QAR'),
(975, 34, 'Kingdom of Bhutan', 'Bhutan', 'Southern Asia', 'Thimphu', 47000, 0, 97, 'Drangme Chhu', 7553, 'Kula Kangri', '8-Aug-1949', 'National Day', '17-Dec', 2279723, '2.1', '54.78', '20.40', 2, 'varies; tropical in southern plains; cool winters and hot summers in central valleys; severe winters and cool summers in Himalayas', 'BT', '.bt', NULL, 'BTN'),
(976, 30, 'Mongolia', '', 'Northern Asia', 'Ulaanbaatar', 1564116, 0, 518, 'Hoh Nuur', 4374, 'Nayramadlin Orgil', '11-Jul-1921', 'Independence Day', '11-Jul', 2832224, '1.46', '64.89', '24.60', 48, 'desert; continental (large daily and seasonal temperature ranges)', 'MG', '.mn', NULL, 'MNT'),
(977, 34, 'Kingdom of Nepal', 'Nepal', 'Southern Asia', 'Kathmandu', 147181, 0, 70, 'Kanchan Kalan', 8850, 'Mount Everest', '2-Nov-1904', 'Birthday of King GYANENDRA', '7-Jul', 28287147, '2.17', '60.18', '20.30', 48, 'varies from cool summers and severe winters in north to subtropical summers and mild winters in south', 'NP', '.np', NULL, 'NPR'),
(992, 143, 'Republic of Tajikistan', 'Tajikistan', 'Central Asia', 'Dushanbe', 143100, 0, 300, 'Syr Darya', 7495, 'Qullai Ismoili Somoni', '9-Sep-1991', 'Independence Day', '9-Sep', 7320815, '2.19', '64.94', '20.00', 45, 'midlatitude continental, hot summers, mild winters; semiarid to polar in Pamir Mountains', 'TI', '.tj', NULL, 'TJS'),
(993, 143, 'Turkmenistan', '', 'Central Asia', 'Ashgabat', 488100, 0, -81, 'Vpadina Akchanaya', 3139, 'Gora Ayribaba', '27-Oct-1991', 'Independence Day', '27-Oct', 5042920, '1.83', '61.83', '21.80', 39, 'subtropical desert', 'TX', '.tm', NULL, 'TMM'),
(994, 145, 'Republic of Azerbaijan', 'Azerbaijan', 'Southwestern Asia', 'Baku', 86600, 0, -28, 'Caspian Sea', 4485, 'Bazarduzu Dagi', '30-Aug-1991', 'Founding of the Democratic Republic of Azerbaijan', '28-May', 7961619, '0.66', '63.85', '27.70', 45, 'dry, semiarid steppe', 'AJ', '.az', NULL, 'AZM'),
(995, 145, 'Georgia', '', 'Southwestern Asia', 'Tbilisi', 69700, 310, 0, 'Black Sea', 5201, 'Mt a Shkhara', '9-Apr-1991', 'Independence Day', '9-Apr', 4661473, '-0.34', '76.09', '37.70', 25, 'warm and pleasant; Mediterranean-like on Black Sea coast', 'GG', '.ge', NULL, 'GEL'),
(996, 143, 'Kyrgyz Republic', 'Kyrgyzstan', 'Central Asia', 'Bishkek', 198500, 0, 132, 'Kara-Daryya', 7439, 'Jengish Chokusu', '31-Aug-1991', 'Independence Day', '31-Aug', 5213898, '1.32', '68.49', '23.60', 37, 'dry continental to polar in high Tien Shan; subtropical in southwest (Fergana Valley); temperate in northern foothill zone', 'KG', '.kg', NULL, 'NONE'),
(998, 143, 'Republic of Uzbekistan', 'Uzbekistan', 'Central Asia', 'Tashkent', 447400, 0, -12, 'Sariqarnish Kuli', 4301, 'Adelunga Toghi', '1-Sep-1991', 'Independence Day', '1-Sep', 27307134, '1.7', '64.58', '22.70', 79, 'mostly midlatitude desert, long, hot summers, mild winters; semiarid grassland in east', 'UZ', '.uz', NULL, 'UZS'),
(1242, 29, 'Commonwealth of The Bahamas', 'The Bahamas', 'Caribbean', 'Nassau', 13940, 3542, 0, 'Atlantic Ocean', 63, 'Mount Alvernia, on Cat Island', '10-Jul-1973', 'Independence Day', '10-Jul', 303770, '0.64', '65.60', '27.80', 64, 'tropical marine; moderated by warm waters of Gulf Stream', 'BF', '.bs', NULL, 'BSD'),
(1246, 29, 'Barbados', '', 'Caribbean', 'Bridgetown', 431, 97, 0, 'Atlantic Ocean', 336, 'Mount Hillaby', '30-Nov-1966', 'Independence Day', '30-Nov', 279912, '0.37', '72.79', '34.60', 1, 'tropical; rainy season (June to October)', 'BB', '.bb', NULL, 'BBD'),
(1264, 29, 'Anguilla', '', 'Caribbean', 'The Valley', 102, 61, 0, 'Caribbean Sea', 65, 'Crocus Hill', '', 'Anguilla Day', '30-May', 13477, '1.57', '77.28', '31.20', 3, 'tropical; moderated by northeast trade winds', 'AV', '.ai', NULL, 'XCD'),
(1268, 29, 'Antigua and Barbuda', '', 'Caribbean', 'Saint Johns', 443, 153, 0, 'Caribbean Sea', 402, 'Boggy Peak', '1-Nov-1981', 'Independence Day (National Day)', '1-Nov', 69108, '0.55', '72.16', '30.00', 3, 'tropical maritime', 'AC', '.ag', NULL, 'XCD'),
(1284, 29, 'British Virgin Islands', '', 'Caribbean', 'Road Town', 153, 80, 0, 'Caribbean Sea', 521, 'Mount Sage', '', 'Territory Day', '1-Jul', 23098, '1.97', '76.68', '31.40', 3, 'subtropical; humid; temperatures moderated by trade winds', 'VI', '.vg', NULL, 'USD'),
(1340, 29, 'United States Virgin Islands', 'Virgin Islands', 'Caribbean', 'Charlotte Amalie', 1910, 188, 0, 'Caribbean Sea', 475, 'Crown Mountain', '', 'Transfer Day', '27-Mar', 108605, '-0.12', '79.05', '37.10', 2, 'subtropical, tempered by easterly trade winds, relatively low humidity, little seasonal temperature variation; rainy season September to November', 'VQ', '.vi', NULL, 'USD'),
(1345, 29, 'Cayman Islands', '', 'Caribbean', 'George Town', 262, 160, 0, 'Caribbean Sea', 43, 'The Bluff', '', 'Constitution Day', 'first Monday in July', 45436, '2.56', '80.07', '37.20', 3, 'tropical marine; warm, rainy summers (May to October) and cool, relatively dry winters (November to April)', 'CJ', '.ky', NULL, 'KYD'),
(1441, 21, 'Bermuda', '', 'North America', 'Hamilton', 53, 103, 0, 'Atlantic Ocean', 76, 'Town Hill', NULL, 'Bermuda Day', '24-May', 65773, '0.61', '77.96', '40.20', 1, 'subtropical; mild, humid; gales, strong winds common in winter', 'BD', '.bm', NULL, 'BMD'),
(1473, 29, 'Grenada', '', 'Caribbean', 'Saint Georges', 344, 121, 0, 'Caribbean Sea', 840, 'Mount Saint Catherine', '7-Feb-1974', 'Independence Day', '7-Feb', 89703, '0.26', '64.87', '21.70', 3, 'tropical; tempered by northeast trade winds', 'GJ', '.gd', NULL, 'XCD'),
(1649, 29, 'Turks and Caicos Islands', '', 'Caribbean', 'Grand Turk', 430, 389, 0, 'Caribbean Sea', 49, 'Blue Hills', '', 'Constitution Day', '30-Aug', 21152, '2.82', '74.73', '27.50', 8, 'tropical; marine; moderated by trade winds; sunny and relatively dry', 'TK', '.tc', NULL, 'USD'),
(1664, 29, 'Montserrat', '', 'Caribbean', 'Plymouth', 102, 40, 0, 'Caribbean Sea', 930, 'lava dome in Englishs Crater', '', 'Birthday of Queen ELIZABETH II', 'second Saturday in June', 9439, '1.05', '78.85', '28.90', 1, 'tropical; little daily or seasonal temperature variation', 'MH', '.ms', NULL, 'XCD'),
(1670, 9, 'Commonwealth of the Northern Mariana Islands', 'Northern Mariana Islands', 'Oceania', 'Saipan', 477, 1482, 0, 'Pacific Ocean', 965, 'unnamed location on Agrihan', '', 'Commonwealth Day', '8-Jan', 82459, '2.54', '76.09', '29.50', 5, 'tropical marine; moderated by northeast trade winds, little seasonal temperature variation; dry season December to June, rainy season July to October', 'CQ', '.mp', NULL, 'USD'),
(1671, 9, 'Territory of Guam', 'Guam', 'Oceania', 'Hagatna', 541, 126, 0, 'Pacific Ocean', 406, 'Mount Lamlam', '', 'Discovery Day', 'first Monday in March', 171019, '1.43', '78.58', '28.60', 5, 'tropical marine; generally warm and humid, moderated by northeast trade winds; dry season (January to June), rainy season (July to December); little seasonal temperature variation', 'GQ', '.gu', NULL, 'USD'),
(1758, 29, 'Saint Lucia', '', 'Caribbean', 'Castries', 616, 158, 0, 'Caribbean Sea', 950, 'Mount Gimie', '22-Feb-1979', 'Independence Day', '22-Feb', 168458, '1.29', '73.84', '25.20', 2, 'tropical, moderated by northeast trade winds; dry season January to April, rainy season May to August', 'ST', '.lc', NULL, 'XCD'),
(1767, 29, 'Commonwealth of Dominica', 'Dominica', 'Caribbean', 'Roseau', 754, 148, 0, 'Caribbean Sea', 1447, 'Morne Diablatins', '3-Nov-1978', 'Independence Day', '3-Nov', 68910, '-0.08', '74.87', '30.10', 2, 'tropical; moderated by northeast trade winds; heavy rainfall', 'DO', '.dm', NULL, 'XCD'),
(1784, 29, 'Saint Vincent and the Grenadines', '', 'Caribbean', 'Kingstown', 389, 84, 0, 'Caribbean Sea', 1234, 'La Soufriere', '27-Oct-1979', 'Independence Day', '27-Oct', 117848, '0.26', '73.85', '26.90', 6, 'tropical; little seasonal temperature variation; rainy season (May to November)', 'VC', '.vc', NULL, 'XCD'),
(1787, 29, 'Commonwealth of Puerto Rico', 'Puerto Rico', 'Caribbean', 'San Juan', 13790, 501, 0, 'Caribbean Sea', 1339, 'Cerro de Punta', '', 'US Independence Day', '4-Jul', 3927188, '0.4', '78.40', '34.70', 30, 'tropical marine, mild; little seasonal temperature variation', 'RQ', '.pr', NULL, 'USD'),
(1809, 29, 'Dominican Republic', 'The Dominican', 'Caribbean', 'Santo Domingo', 48730, 1288, -46, 'Lago Enriquillo', 3175, 'Pico Duarte', '27-Feb-1844', 'Independence Day', '27-Feb', 9183984, '1.47', '71.73', '24.10', 32, 'tropical maritime; little seasonal temperature variation; seasonal variation in rainfall', 'DR', '.do', NULL, 'DOP'),
(1868, 29, 'Republic of Trinidad and Tobago', 'Trinidad and Tobago', 'Caribbean', 'Port-of-Spain', 5128, 362, 0, 'Caribbean Sea', 940, 'El Cerro del Aripo', '31-Aug-1962', 'Independence Day', '31-Aug', 1065842, '-0.87', '66.76', '31.20', 6, 'tropical; rainy season (June to December)', 'TD', '.tt', NULL, 'TTD'),
(1869, 29, 'Federation of Saint Kitts and Nevis', 'Saint Kitts and Nevis', 'Caribbean', 'Basseterre', 261, 135, 0, 'Caribbean Sea', 1156, 'Mount Liamuiga', '19-Sep-1983', 'Independence Day', '19-Sep', 39129, '0.5', '72.40', '27.80', 2, 'tropical, tempered by constant sea breezes; little seasonal temperature variation; rainy season (May to November)', 'SC', '.kn', NULL, 'XCD'),
(1876, 29, 'Jamaica', '', 'Caribbean', 'Kingston', 10991, 1022, 0, 'Caribbean Sea', 2256, 'Blue Mountain Peak', '6-Aug-1962', 'Independence Day', '6-Aug', 2758124, '0.8', '73.24', '23.00', 35, 'tropical; hot, humid; temperate interior', 'JM', '.jm', NULL, 'JMD'),
(2000, 35, 'Territory of Ashmore and Cartier Islands', 'Ashmore and Cartier Islands', 'Southeastern Asia', NULL, 5, 74, 0, 'Indian Ocean', 3, 'unnamed location', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 'tropical', 'AT', '', NULL, 'NONE'),
(2001, 35, 'Union of Burma', 'Burma', 'Southeastern Asia', 'Rangoon', 678500, 1930, 0, 'Andaman Sea', 5881, 'Hkakabo Razi', '4-Jan-1948', 'Independence Day', '4-Jan', 47382633, '0.81', '60.97', '27.00', 84, 'tropical monsoon; cloudy, rainy, hot, humid summers (southwest monsoon, June to September; less cloudy, scant rainfall, mild temperatures, lower humidity during winter (northeast monsoon, December to April)', '', '.mm', NULL, 'MMK');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wf_currencies`
--

CREATE TABLE `wf_currencies` (
  `CURRENCY_CODE` varchar(7) NOT NULL,
  `CURRENCY_NAME` varchar(40) NOT NULL,
  `COMMENTS` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `wf_currencies`
--

INSERT INTO `wf_currencies` (`CURRENCY_CODE`, `CURRENCY_NAME`, `COMMENTS`) VALUES
('AED', 'Emirati dirham', ''),
('AFA', 'Afghani', ''),
('ALL', 'Lek', ''),
('AMD', 'Dram', ''),
('ANG', 'Netherlands Antillean guilder', ''),
('AOA', 'Kwanza', ''),
('ARS', 'Argentine peso', ''),
('AUD', 'Australian dollar', ''),
('AWG', 'Aruban guilder', ''),
('AZM', 'Azerbaijani Manat', ''),
('BAM', 'Marka', ''),
('BBD', 'Barbadian dollar', ''),
('BDT', 'Taka', ''),
('BGL', 'Lev', ''),
('BHD', 'Bahraini Dinar', ''),
('BIF', 'Burundi franc', ''),
('BMD', 'Bermudian dollar', ''),
('BND', 'Bruneian dollar', ''),
('BOB', 'Boliviano', ''),
('BRL', 'Real', ''),
('BSD', 'Bahamian dollar', ''),
('BTN', 'Ngultrum', ''),
('BWP', 'Pula', ''),
('BYB', 'Belarusian ruble', ''),
('BZD', 'Belizean dollar', ''),
('CAD', 'Canadian dollar', ''),
('CDF', 'Congolese franc', ''),
('CHF', 'Swiss franc', ''),
('CLP', 'Chilean peso', ''),
('CNY', 'yuan', ''),
('COP', 'Colombian peso', ''),
('CRC', 'Costa Rican colon', ''),
('CUC', 'Convertible peso', ''),
('CUP', 'Cuban peso', ''),
('CVE', 'Cape Verdean escudo', ''),
('CYP', 'Cypriot pound', ''),
('CZK', 'Czech koruna', ''),
('DJF', 'Djiboutian franc', ''),
('DKK', 'Danish krone', ''),
('DOP', 'Dominican peso', ''),
('DZD', 'Algerian dinar', ''),
('EEK', 'Estonian kroon', ''),
('EGP', 'Egyptian pound', ''),
('ERN', 'nakfa', ''),
('ETB', 'birr', ''),
('EUR', 'Euro', ''),
('FJD', 'Fijian dollar', ''),
('FKP', 'Falkland pound', ''),
('GBP', 'British pound', ''),
('GEL', 'lari', ''),
('GHC', 'cedi', ''),
('GIP', 'Gibraltar pound', ''),
('GMD', 'dalasi', ''),
('GNF', 'Guinean franc', ''),
('GTQ', 'quetzal', ''),
('GYD', 'Guyanese dollar', ''),
('HKD', 'Hong Kong dollar', ''),
('HNL', 'lempira', ''),
('HRK', 'kuna', ''),
('HTG', 'gourde', ''),
('HUF', 'forint', ''),
('IDR', 'Indonesian rupiah', ''),
('ILS', 'new Israeli shekel', ''),
('INR', 'Indian rupee', ''),
('IRR', 'Iranian rial', ''),
('ISK', 'Icelandic krona', ''),
('JMD', 'Jamaican dollar', ''),
('JOD', 'Jordanian dollar', ''),
('JPY', 'yen', ''),
('KD', 'Kuwaiti dinar', ''),
('KES', 'Kenyan shilling', ''),
('KHR', 'riel', ''),
('KMF', 'Comoran franc', ''),
('KPW', 'North Korean won', ''),
('KRW', 'South Korean won', ''),
('KYD', 'Caymanian dollar', ''),
('KZT', 'tenge', ''),
('LAK', 'kip', ''),
('LBP', 'Lebanese pound', ''),
('LKR', 'Sri Lankan rupee', ''),
('LRD', 'Liberian dollar', ''),
('LSL', 'loti', ''),
('LTL', 'litas', ''),
('LVL', 'Latvian lat', ''),
('LYD', 'Libyan dinar', ''),
('MAD', 'Moroccan dirham', ''),
('MDL', 'Moldovan leu', ''),
('MGA', 'Madagascar ariary', ''),
('MKD', 'Macedonian denar', ''),
('MMK', 'Kyat', ''),
('MNT', 'togrog/tugrik', ''),
('MOP', 'pataca', ''),
('MRO', 'ouguiya', ''),
('MTL', 'Maltese lira', ''),
('MUR', 'Mauritian rupee', ''),
('MVR', 'rufiyaa', ''),
('MWK', 'Malawian kwacha', ''),
('MXN', 'Mexican peso', ''),
('MYR', 'ringgit', ''),
('MZM', 'metical', ''),
('NAD', 'Namibian dollar', ''),
('NGN', 'naira', ''),
('NID', 'New Iraqi dinar', ''),
('NIO', 'gold cordoba', ''),
('NOK', 'Norwegian krone', ''),
('NONE', 'No currency used', ''),
('NPR', 'Nepalese rupee', ''),
('NZD', 'New Zealand dollar', ''),
('OMR', 'Omani rial', ''),
('PAB', 'balboa', ''),
('PEN', 'nuevo sol', ''),
('PGK', 'kina', ''),
('PHP', 'Philippine peso', ''),
('PKR', 'Pakistani rupee', ''),
('PLN', 'zloty', ''),
('PYG', 'guarani', ''),
('QAR', 'Qatari rial', ''),
('RMB', 'Renminbi', ''),
('RON', 'leu', ''),
('RUR', 'Russian ruble', ''),
('RWF', 'Rwandan franc', ''),
('SAR', 'Saudi riyal', ''),
('SAT', 'tala', ''),
('SBD', 'Solomon Islands dollar', ''),
('SCR', 'Seychelles rupee', ''),
('SDD', 'Sudanese dinar', ''),
('SEK', 'Swedish krona', ''),
('SGD', 'Singapore dollar', ''),
('SHP', 'Saint Helenian pound', ''),
('SIT', 'tolar', ''),
('SKK', 'Slovak koruna', ''),
('SLL', 'leone', ''),
('SOS', 'Somali shilling', ''),
('SRD', 'Surinam dollar', ''),
('STD', 'dobra', ''),
('SYP', 'Syrian pound', ''),
('SZL', 'lilangeni', ''),
('THB', 'baht', ''),
('TJS', 'Tajikistani somoni', ''),
('TMM', 'Turkmen manat', ''),
('TND', 'Tunisian dinar', ''),
('TOP', 'paanga', ''),
('TTD', 'Trinidad and Tobago dollar', ''),
('TWD', 'new Taiwan dollar', ''),
('TZS', 'Tanzanian shilling', ''),
('UAH', 'hryvnia', ''),
('UGX', 'Ugandan shilling', ''),
('USD', 'US Dollar', ''),
('UYU', 'Uruguayan peso', ''),
('UZS', 'Uzbekistani soum', ''),
('VEB', 'bolivar', ''),
('VND', 'dong', ''),
('VUV', 'vatu', ''),
('XAF', 'Communaute Financiere Africaine franc', ''),
('XCD', 'East Caribbean dollar', ''),
('XOF', 'Communaute Financiere Africaine franc', ''),
('XPF', 'Comptoirs Francais du Pacifique franc', ''),
('YER', 'Yemeni rial', ''),
('YTL', 'Turkish lira', ''),
('ZAR', 'South African rand', ''),
('ZMK', 'Zambian kwacha', ''),
('ZWD', 'Zimbabwean dollar', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wf_languages`
--

CREATE TABLE `wf_languages` (
  `LANGUAGE_ID` smallint(6) NOT NULL,
  `LANGUAGE_NAME` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `wf_languages`
--

INSERT INTO `wf_languages` (`LANGUAGE_ID`, `LANGUAGE_NAME`) VALUES
(1, 'N/A'),
(20, 'Afar'),
(30, 'Afrikaans'),
(40, 'Albanian'),
(50, 'Amerindian'),
(60, 'Amharic'),
(70, 'Angaur'),
(80, 'Arabic'),
(90, 'Armenian'),
(100, 'Assyrian'),
(101, 'Aymara'),
(102, 'Azen'),
(103, 'Azerbaijani'),
(104, 'Bahasa Indonesia'),
(105, 'Bahasa Melayu'),
(106, 'Balochi'),
(107, 'Bambara'),
(108, 'Bandjabi'),
(109, 'Bangla'),
(110, 'Bantu'),
(120, 'Bapounou'),
(130, 'Belarusian'),
(140, 'Bhojpuri'),
(150, 'Bislama'),
(160, 'Bokmal Norwegian'),
(170, 'Bosnian'),
(180, 'Bulgarian'),
(190, 'Burmese'),
(200, 'Cantonese'),
(210, 'Castilian'),
(220, 'Castilian Spanish'),
(230, 'Catalan'),
(240, 'Chamorro'),
(250, 'Chichwea'),
(260, 'Chilomwe'),
(270, 'Chinese'),
(280, 'Chinyanja'),
(290, 'Chisena'),
(300, 'Chitonga'),
(310, 'Chitumbuka'),
(320, 'Chiyao'),
(330, 'Cisena'),
(340, 'Creole'),
(350, 'Crioulo'),
(360, 'Croatian'),
(370, 'Czech'),
(380, 'Dagomba'),
(390, 'Danish'),
(400, 'Djerma'),
(410, 'Dutch'),
(420, 'Dzongkha'),
(430, 'Echuwabo'),
(440, 'Elomwe'),
(450, 'Emakhuwa'),
(460, 'English'),
(470, 'Estonian'),
(480, 'Ewe'),
(490, 'Fang'),
(500, 'Faroese'),
(510, 'Farsi'),
(520, 'Fijian'),
(530, 'Filipino'),
(540, 'Finnish'),
(550, 'Fon and Yoruba'),
(560, 'French'),
(570, 'Frisian'),
(580, 'Fula'),
(590, 'Futunian'),
(600, 'Fuzhou'),
(610, 'Gagauz'),
(620, 'Galician'),
(630, 'Gan'),
(640, 'Garifuna'),
(650, 'Georgian'),
(660, 'German'),
(670, 'Greek'),
(680, 'Greenlandic'),
(690, 'Guaragigna'),
(700, 'Guavani'),
(710, 'Hassaniya'),
(720, 'Hausa'),
(730, 'Hebrew'),
(740, 'Hindi'),
(750, 'Hindustani'),
(760, 'Hokkien'),
(770, 'Hungarian'),
(780, 'Icelandic'),
(790, 'Igbo'),
(800, 'I-Kiribati'),
(810, 'Indonesian'),
(820, 'Irish'),
(830, 'IsiXhosa'),
(840, 'IsiZulu'),
(850, 'Italian'),
(860, 'Japanese'),
(870, 'Jola'),
(880, 'Kabye'),
(890, 'Kalanga'),
(900, 'Kazakh'),
(910, 'Khalkha Mongol'),
(920, 'Khmer'),
(930, 'Kikongo'),
(940, 'kingwana'),
(950, 'Kinyarwanda'),
(960, 'Kirundi'),
(970, 'Kiswahili'),
(980, 'Korean'),
(990, 'Kunama'),
(1000, 'Kurdish'),
(1100, 'Kyrgyz'),
(1110, 'Lao'),
(1120, 'Latin'),
(1130, 'Latvian'),
(1140, 'Lingala'),
(1150, 'Lithuanian'),
(1160, 'Luri'),
(1170, 'Luxembourgish'),
(1180, 'Macedonian'),
(1190, 'Magar'),
(1200, 'Mahorian'),
(1210, 'Maithali'),
(1220, 'Malagasy'),
(1230, 'Malay'),
(1240, 'Malayalam'),
(1250, 'Maldivian'),
(1260, 'Maltese'),
(1270, 'Mandarin'),
(1280, 'Mandarin Chinese'),
(1290, 'Mandinka'),
(1300, 'Manx Gaelic'),
(1310, 'Maori'),
(1320, 'Marshallese'),
(1330, 'Mayan'),
(1340, 'Melanesian'),
(1350, 'Mina'),
(1360, 'Minnan'),
(1370, 'Mirandese'),
(1380, 'Moldovan'),
(1390, 'Monegasque'),
(1400, 'Motu'),
(1410, 'Myene'),
(1420, 'Nahua'),
(1430, 'Nauruan'),
(1440, 'Nepali'),
(1450, 'Newar'),
(1460, 'Niuean'),
(1470, 'Nubian'),
(1480, 'Nynorsk Norwegian'),
(1490, 'Nzebi'),
(1500, 'Oromigna'),
(1510, 'Palauian'),
(1520, 'Panjabi'),
(1530, 'Papiamento'),
(1540, 'Pashtu'),
(1550, 'Persian'),
(1560, 'Polish'),
(1570, 'Polynesian'),
(1580, 'Portuguese'),
(1590, 'Pulaar'),
(1600, 'Punjabi'),
(1610, 'Quechua'),
(1620, 'Roma'),
(1630, 'Romani'),
(1640, 'Romanian'),
(1650, 'Russian'),
(1660, 'Samoan'),
(1670, 'Sangho'),
(1680, 'Sara'),
(1690, 'Sekgalagadi'),
(1700, 'Sepedi'),
(1710, 'Serbian'),
(1720, 'Sesotho'),
(1730, 'Setswana'),
(1740, 'Shanghaiese'),
(1750, 'Shikomoro'),
(1760, 'Sindhi'),
(1770, 'Sinhala'),
(1780, 'Siswati'),
(1790, 'Slavic'),
(1800, 'Slovak'),
(1810, 'Slovene'),
(1820, 'Slovenian'),
(1830, 'Somali'),
(1840, 'Soninke'),
(1850, 'Spanish'),
(1860, 'Swahili'),
(1870, 'Swedish'),
(1880, 'Taiwanese'),
(1890, 'Tajik'),
(1900, 'Tamang'),
(1910, 'Tamil'),
(1920, 'Telugu'),
(1930, 'Teochew'),
(1940, 'Tetum'),
(1950, 'Thai'),
(1960, 'Tharu'),
(1970, 'Tigre'),
(1980, 'Tigrinya'),
(1990, 'Tobi'),
(2000, 'Tokelauan'),
(2100, 'Tongan'),
(2150, 'Tshiluba'),
(2200, 'Turkic'),
(2250, 'Turkish'),
(2300, 'Turkmen'),
(2350, 'Ukrainian'),
(2400, 'Urdu'),
(2450, 'Uzbek'),
(2500, 'Vietnamese'),
(2550, 'Wallisian'),
(2600, 'Welsh'),
(2650, 'Wolof'),
(2700, 'Xhosa'),
(2750, 'Xiang'),
(2800, 'Xichangana'),
(2850, 'Yezidi'),
(2900, 'Yoruba'),
(3000, 'Zulu');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wf_spoken_languages`
--

CREATE TABLE `wf_spoken_languages` (
  `COUNTRY_ID` smallint(6) NOT NULL,
  `LANGUAGE_ID` smallint(6) NOT NULL,
  `OFFICIAL` varchar(2) DEFAULT NULL,
  `COMMENTS` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `wf_spoken_languages`
--

INSERT INTO `wf_spoken_languages` (`COUNTRY_ID`, `LANGUAGE_ID`, `OFFICIAL`, `COMMENTS`) VALUES
(1, 460, 'Y', NULL),
(1, 1850, 'N', NULL),
(2, 460, 'Y', NULL),
(2, 560, 'Y', NULL),
(3, 900, 'QY', 'Qazaq, state language'),
(3, 1650, 'Y', NULL),
(7, 1650, 'Y', NULL),
(12, 460, 'N', NULL),
(13, 460, 'Y', NULL),
(13, 1310, 'N', NULL),
(15, 80, 'N', NULL),
(20, 80, 'Y', NULL),
(20, 460, 'N', 'English and French widely understood by educated classes'),
(20, 560, 'N', 'English and French widely understood by educated classes'),
(22, 460, 'N', NULL),
(22, 560, 'N', NULL),
(27, 30, 'N', NULL),
(27, 460, 'N', NULL),
(27, 830, 'N', NULL),
(27, 840, 'N', NULL),
(27, 1700, 'N', NULL),
(27, 1720, 'N', NULL),
(27, 1730, 'N', NULL),
(30, 460, 'N', NULL),
(30, 560, 'N', NULL),
(30, 670, 'Y', NULL),
(31, 410, 'Y', NULL),
(31, 570, 'Y', NULL),
(32, 410, 'Y', NULL),
(32, 560, 'Y', NULL),
(32, 660, 'Y', NULL),
(33, 560, 'Y', NULL),
(34, 220, 'Y', NULL),
(34, 230, 'QY', 'Castilian is the official language nationwide; the other languages are official regionally'),
(34, 620, 'QY', 'Castilian is the official language nationwide; the other languages are official regionally'),
(36, 770, 'Y', NULL),
(38, 560, 'N', NULL),
(38, 850, 'N', NULL),
(38, 1120, 'N', NULL),
(39, 560, 'N', 'small French-speaking minority in Valle d Aosta region'),
(39, 660, 'N', 'parts of Trentino-Alto Adige region are predominantly German speaking'),
(39, 850, 'Y', NULL),
(39, 1810, 'N', 'Slovene-speaking minority in the Trieste-Gorizia area'),
(40, 660, 'N', NULL),
(40, 770, 'N', NULL),
(40, 1640, 'Y', NULL),
(41, 40, 'N', NULL),
(41, 460, 'N', NULL),
(41, 560, 'Y', NULL),
(41, 660, 'Y', NULL),
(41, 850, 'Y', NULL),
(41, 1580, 'N', NULL),
(43, 360, 'QY', 'official in Burgenland'),
(43, 660, 'Y', NULL),
(43, 770, 'QY', 'official in Burgenland'),
(43, 1810, 'QY', 'official in Carinthia'),
(44, 460, 'N', NULL),
(44, 2600, 'N', NULL),
(45, 390, 'N', 'note: English is the predominant second language'),
(45, 500, 'N', NULL),
(45, 660, 'N', NULL),
(45, 680, 'N', NULL),
(46, 1870, 'N', NULL),
(47, 160, 'Y', NULL),
(47, 1480, 'Y', NULL),
(48, 1560, 'Y', NULL),
(49, 660, 'Y', NULL),
(51, 101, 'N', NULL),
(51, 1610, 'Y', NULL),
(51, 1850, 'Y', NULL),
(52, 1850, 'N', NULL),
(53, 1850, 'Y', NULL),
(54, 460, 'N', NULL),
(54, 560, 'N', NULL),
(54, 660, 'N', NULL),
(54, 850, 'N', NULL),
(54, 1850, 'Y', NULL),
(55, 460, 'N', NULL),
(55, 560, 'N', NULL),
(55, 1580, 'Y', NULL),
(55, 1850, 'N', NULL),
(56, 1850, 'Y', NULL),
(57, 1850, 'Y', NULL),
(58, 1850, 'Y', NULL),
(60, 105, 'Y', NULL),
(60, 270, 'N', NULL),
(60, 460, 'N', NULL),
(60, 1250, 'N', NULL),
(60, 1520, 'N', NULL),
(60, 1910, 'N', NULL),
(60, 1920, 'N', NULL),
(60, 1950, 'N', NULL),
(61, 270, 'N', NULL),
(61, 460, 'Y', NULL),
(61, 850, 'N', NULL),
(62, 104, 'N', NULL),
(62, 410, 'N', NULL),
(62, 460, 'N', NULL),
(63, 460, 'Y', NULL),
(63, 530, 'Y', NULL),
(64, 460, 'Y', NULL),
(64, 1310, 'Y', NULL),
(65, 200, 'N', NULL),
(65, 460, 'N', NULL),
(65, 760, 'N', NULL),
(65, 1230, 'N', NULL),
(65, 1270, 'N', NULL),
(65, 1910, 'N', NULL),
(65, 1930, 'N', NULL),
(66, 460, 'N', NULL),
(66, 1950, 'N', NULL),
(67, 460, 'N', NULL),
(67, 1230, 'N', NULL),
(81, 860, 'Y', NULL),
(82, 460, 'N', 'English widely taught in junior high and high school'),
(82, 980, 'Y', NULL),
(84, 270, 'N', NULL),
(84, 460, 'N', NULL),
(84, 560, 'N', NULL),
(84, 920, 'N', NULL),
(84, 2500, 'Y', NULL),
(86, 200, 'N', NULL),
(86, 270, 'N', NULL),
(86, 630, 'N', NULL),
(86, 1270, 'N', NULL),
(86, 1360, 'N', NULL),
(86, 1740, 'N', NULL),
(86, 2750, 'N', NULL),
(90, 1000, 'N', NULL),
(90, 2250, 'Y', NULL),
(91, 460, 'N', 'English enjoys associate status but is the most important language for national, political, and commercial communication'),
(91, 740, 'Y', 'Hindi is the national language and primary tongue of 30% of the people'),
(92, 106, 'N', NULL),
(92, 460, 'Y', 'official and lingua franca of Pakistani elite and most government ministries'),
(92, 1540, 'N', NULL),
(92, 1600, 'N', NULL),
(92, 1760, 'N', NULL),
(92, 2400, 'Y', NULL),
(93, 1540, 'Y', NULL),
(93, 1550, 'Y', NULL),
(93, 2300, 'N', NULL),
(93, 2450, 'N', NULL),
(94, 460, 'N', NULL),
(94, 1770, 'Y', 'note: English is commonly used in government and is spoken competently by about 10% of the population'),
(94, 1910, 'N', NULL),
(98, 80, 'N', NULL),
(98, 106, 'N', NULL),
(98, 1000, 'N', NULL),
(98, 1160, 'N', NULL),
(98, 1550, 'N', NULL),
(98, 2200, 'N', NULL),
(98, 2250, 'N', NULL),
(202, 460, 'N', NULL),
(202, 1300, 'N', NULL),
(203, 460, 'Y', NULL),
(203, 1580, 'N', NULL),
(204, 80, 'N', NULL),
(205, 460, 'N', NULL),
(206, 460, 'Y', NULL),
(207, 460, 'N', NULL),
(208, 80, 'N', NULL),
(209, 1480, 'N', NULL),
(209, 1650, 'N', NULL),
(212, 80, 'Y', NULL),
(212, 560, 'QY', 'French often the language of business, government, and diplomacy'),
(213, 80, 'Y', NULL),
(213, 560, 'N', NULL),
(216, 80, 'Y', NULL),
(216, 560, 'QY', 'commerce'),
(218, 80, 'N', NULL),
(218, 460, 'N', NULL),
(218, 850, 'N', NULL),
(220, 460, 'Y', NULL),
(220, 580, 'N', NULL),
(220, 1290, 'N', NULL),
(220, 2650, 'N', NULL),
(221, 560, 'Y', NULL),
(221, 870, 'N', NULL),
(221, 1290, 'N', NULL),
(221, 1590, 'N', NULL),
(221, 2650, 'N', NULL),
(222, 80, 'Y', NULL),
(222, 560, 'N', NULL),
(222, 710, 'N', NULL),
(222, 1590, 'N', NULL),
(222, 1840, 'N', NULL),
(222, 2650, 'N', NULL),
(223, 107, 'N', NULL),
(223, 560, 'Y', NULL),
(224, 560, 'Y', 'note - each ethnic group has its own language'),
(225, 560, 'Y', NULL),
(226, 560, 'Y', NULL),
(227, 400, 'N', NULL),
(227, 560, 'Y', NULL),
(227, 720, 'N', NULL),
(228, 380, 'QY', 'major African languages in the north'),
(228, 480, 'QY', 'the two major African languages in the south'),
(228, 880, 'QY', 'major African languages in the north'),
(228, 1350, 'QY', 'the two major African languages in the south'),
(229, 550, 'N', 'most common vernaculars in south'),
(229, 560, 'Y', NULL),
(230, 140, 'N', NULL),
(230, 340, 'N', NULL),
(230, 460, 'Y', 'official; spoken by less than 1% of the population'),
(230, 560, 'N', NULL),
(231, 460, 'Y', NULL),
(232, 460, 'Y', NULL),
(233, 460, 'Y', NULL),
(233, 480, 'N', NULL),
(234, 460, 'Y', NULL),
(234, 720, 'N', NULL),
(234, 790, 'N', NULL),
(234, 2900, 'N', NULL),
(235, 80, 'Y', NULL),
(235, 560, 'Y', NULL),
(235, 1680, 'N', 'in south'),
(236, 560, 'Y', NULL),
(236, 1670, 'N', NULL),
(237, 460, 'Y', NULL),
(237, 560, 'Y', NULL),
(238, 350, 'N', '(a blend of Portuguese and West African words)'),
(238, 1580, 'N', NULL),
(239, 1580, 'Y', NULL),
(240, 460, 'Y', NULL),
(240, 490, 'N', NULL),
(240, 560, 'Y', NULL),
(240, 1850, 'Y', NULL),
(241, 108, 'N', NULL),
(241, 120, 'N', NULL),
(241, 490, 'N', NULL),
(241, 560, 'Y', NULL),
(241, 1410, 'N', NULL),
(241, 1490, 'N', NULL),
(242, 560, 'Y', NULL),
(242, 930, 'N', NULL),
(242, 1140, 'N', NULL),
(243, 560, 'Y', NULL),
(243, 930, 'N', NULL),
(243, 940, 'N', NULL),
(243, 1140, 'N', NULL),
(243, 2150, 'N', NULL),
(244, 110, 'N', NULL),
(244, 1580, 'Y', NULL),
(245, 350, 'N', NULL),
(245, 1580, 'Y', NULL),
(248, 340, 'N', NULL),
(248, 460, 'Y', NULL),
(249, 80, 'Y', NULL),
(249, 460, 'N', NULL),
(249, 1470, 'N', NULL),
(250, 460, 'Y', NULL),
(250, 560, 'Y', NULL),
(250, 950, 'Y', NULL),
(250, 970, 'N', NULL),
(251, 60, 'N', NULL),
(251, 80, 'N', NULL),
(251, 460, 'N', '(major foreign language taught in schools)'),
(251, 690, 'N', NULL),
(251, 1500, 'N', NULL),
(251, 1830, 'N', NULL),
(251, 1980, 'N', NULL),
(252, 80, 'N', NULL),
(252, 460, 'N', NULL),
(252, 850, 'N', NULL),
(252, 1830, 'Y', NULL),
(253, 20, 'N', NULL),
(253, 80, 'Y', NULL),
(253, 560, 'Y', NULL),
(253, 1830, 'N', NULL),
(254, 460, 'Y', NULL),
(254, 970, 'Y', NULL),
(255, 80, 'N', NULL),
(255, 460, 'QY', 'primary language of commerce, administration, and higher education'),
(255, 970, 'Y', NULL),
(255, 1860, 'N', NULL),
(256, 460, 'Y', NULL),
(256, 1860, 'N', NULL),
(257, 560, 'Y', NULL),
(257, 960, 'Y', NULL),
(257, 1860, 'N', '(along Lake Tanganyika and in the Bujumbura area)'),
(258, 290, 'N', NULL),
(258, 430, 'N', NULL),
(258, 440, 'N', NULL),
(258, 450, 'N', NULL),
(258, 1580, 'Y', NULL),
(258, 2800, 'N', NULL),
(260, 460, 'Y', NULL),
(261, 560, 'Y', NULL),
(261, 1220, 'Y', NULL),
(262, 340, 'QY', 'Creole widely used'),
(262, 560, 'Y', NULL),
(263, 460, 'Y', NULL),
(264, 30, 'N', NULL),
(264, 460, 'Y', NULL),
(264, 660, 'N', NULL),
(265, 250, 'Y', NULL),
(265, 260, 'N', NULL),
(265, 280, 'N', NULL),
(265, 290, 'N', NULL),
(265, 300, 'N', NULL),
(265, 310, 'N', NULL),
(265, 320, 'N', NULL),
(266, 460, 'Y', NULL),
(266, 1720, 'N', NULL),
(266, 2700, 'N', NULL),
(266, 3000, 'N', NULL),
(267, 460, 'N', NULL),
(267, 890, 'N', NULL),
(267, 1690, 'N', NULL),
(267, 1730, 'Y', NULL),
(268, 460, 'Y', NULL),
(268, 1780, 'Y', NULL),
(269, 80, 'Y', NULL),
(269, 560, 'Y', NULL),
(269, 1750, 'N', '(a blend of Swahili and Arabic)'),
(270, 560, 'Y', NULL),
(270, 1200, 'N', NULL),
(280, 80, 'N', NULL),
(283, 80, 'N', NULL),
(283, 710, 'N', NULL),
(290, 460, 'N', NULL),
(291, 20, 'N', NULL),
(291, 80, 'N', NULL),
(291, 990, 'N', NULL),
(291, 1970, 'N', NULL),
(291, 1980, 'N', NULL),
(297, 410, 'Y', NULL),
(297, 460, 'N', NULL),
(297, 1530, 'N', '(a Spanish, Portuguese, Dutch, English dialect)'),
(297, 1850, 'N', NULL),
(298, 390, 'N', NULL),
(298, 500, 'N', NULL),
(299, 390, 'N', NULL),
(299, 460, 'N', NULL),
(299, 680, 'N', NULL),
(300, 80, 'N', NULL),
(350, 460, 'N', 'used in schools and for official purposes'),
(350, 850, 'N', NULL),
(350, 1580, 'N', NULL),
(350, 1850, 'N', NULL),
(351, 1370, 'Y', NULL),
(351, 1580, 'Y', NULL),
(352, 560, 'QY', 'administrative language'),
(352, 660, 'QY', 'administrative language'),
(352, 1170, 'Y', NULL),
(353, 460, 'Y', NULL),
(353, 820, 'Y', NULL),
(354, 460, 'N', NULL),
(354, 660, 'N', NULL),
(354, 780, 'N', NULL),
(355, 40, 'Y', NULL),
(355, 670, 'N', NULL),
(355, 1630, 'N', NULL),
(355, 1790, 'N', NULL),
(356, 460, 'Y', NULL),
(356, 1260, 'Y', NULL),
(357, 460, 'N', NULL),
(357, 670, 'N', NULL),
(357, 2250, 'N', NULL),
(358, 540, 'Y', NULL),
(358, 1870, 'Y', NULL),
(359, 180, 'N', NULL),
(359, 1620, 'N', NULL),
(359, 2250, 'N', NULL),
(370, 1150, 'Y', NULL),
(370, 1560, 'N', NULL),
(370, 1650, 'N', NULL),
(371, 1130, 'Y', NULL),
(371, 1150, 'N', NULL),
(371, 1650, 'N', NULL),
(372, 470, 'Y', NULL),
(372, 1650, 'N', NULL),
(373, 610, 'N', NULL),
(373, 1380, 'Y', 'virtually the same as the Romanian language'),
(373, 1650, 'N', NULL),
(374, 90, 'Y', NULL),
(374, 1650, 'N', NULL),
(374, 2850, 'N', NULL),
(375, 130, 'N', NULL),
(375, 1650, 'N', NULL),
(376, 210, 'N', NULL),
(376, 230, 'Y', NULL),
(376, 560, 'N', NULL),
(376, 1580, 'N', NULL),
(377, 460, 'N', NULL),
(377, 560, 'Y', NULL),
(377, 850, 'N', NULL),
(377, 1390, 'N', NULL),
(378, 850, 'N', NULL),
(380, 1650, 'N', NULL),
(380, 2350, 'Y', NULL),
(381, 1710, 'Y', NULL),
(385, 360, 'N', NULL),
(385, 370, 'N', NULL),
(385, 660, 'N', NULL),
(385, 770, 'N', NULL),
(385, 850, 'N', NULL),
(385, 1710, 'N', NULL),
(385, 1800, 'N', NULL),
(386, 1820, 'N', NULL),
(387, 170, 'N', NULL),
(387, 360, 'N', NULL),
(387, 1710, 'N', NULL),
(389, 40, 'N', NULL),
(389, 1180, 'N', NULL),
(389, 1620, 'N', NULL),
(389, 1710, 'Y', NULL),
(389, 2250, 'N', NULL),
(420, 370, 'Y', NULL),
(421, 770, 'N', NULL),
(421, 1620, 'N', NULL),
(421, 1800, 'Y', NULL),
(421, 2350, 'N', NULL),
(423, 660, 'Y', NULL),
(500, 460, 'Y', NULL),
(501, 340, 'N', NULL),
(501, 460, 'Y', NULL),
(501, 640, 'N', NULL),
(501, 1330, 'N', NULL),
(501, 1850, 'N', NULL),
(502, 50, 'N', '(23 officially recognized Amerindian languages, including Quiche, Cakchiquel, Kekchi, Mam, Garifuna, and Xinca)'),
(502, 1850, 'N', NULL),
(503, 1420, 'N', NULL),
(503, 1850, 'N', NULL),
(504, 50, 'N', NULL),
(504, 1850, 'N', NULL),
(505, 1850, 'Y', NULL),
(506, 460, 'N', NULL),
(506, 1850, 'Y', NULL),
(507, 460, 'N', NULL),
(507, 1850, 'Y', NULL),
(508, 560, 'Y', NULL),
(509, 340, 'Y', NULL),
(509, 560, 'Y', NULL),
(590, 340, 'N', NULL),
(590, 560, 'Y', NULL),
(591, 101, 'Y', NULL),
(591, 1610, 'Y', NULL),
(591, 1850, 'Y', NULL),
(592, 50, 'N', NULL),
(592, 340, 'N', NULL),
(592, 460, 'N', NULL),
(592, 740, 'N', NULL),
(592, 2400, 'N', NULL),
(593, 50, 'N', NULL),
(593, 1610, 'N', NULL),
(593, 1850, 'Y', NULL),
(594, 560, 'Y', NULL),
(595, 700, 'Y', NULL),
(595, 1850, 'Y', NULL),
(596, 340, 'N', NULL),
(596, 560, 'N', NULL),
(597, 410, 'Y', NULL),
(597, 460, 'QY', NULL),
(598, 990, 'N', NULL),
(598, 1850, 'N', NULL),
(599, 340, 'N', NULL),
(599, 410, 'Y', NULL),
(599, 460, 'N', NULL),
(599, 1530, 'N', NULL),
(599, 1850, 'N', NULL),
(618, 270, 'N', NULL),
(618, 460, 'Y', NULL),
(618, 1230, 'N', NULL),
(670, 460, 'N', NULL),
(670, 810, 'N', NULL),
(670, 1580, 'Y', NULL),
(670, 1940, 'Y', NULL),
(671, 460, 'Y', NULL),
(672, 80, 'N', NULL),
(673, 270, 'N', NULL),
(673, 460, 'N', NULL),
(673, 1230, 'Y', NULL),
(674, 460, 'QY', 'English widely understood, spoken, and used for most government and commercial purposes'),
(674, 1430, 'Y', NULL),
(675, 460, 'N', NULL),
(675, 1340, 'N', NULL),
(676, 460, 'N', NULL),
(676, 2100, 'N', NULL),
(677, 460, 'Y', 'English is official but spoken by only 1%-2% of the population  Note: 120 indigenous languages'),
(677, 1340, 'N', NULL),
(678, 460, 'N', 'local languages (more than 100)'),
(678, 560, 'N', NULL),
(679, 460, 'Y', NULL),
(679, 520, 'N', NULL),
(679, 750, 'N', NULL),
(680, 270, 'N', NULL),
(680, 460, 'N', NULL),
(680, 530, 'N', NULL),
(680, 860, 'N', NULL),
(680, 1510, 'QY', 'Palauan 64.7 percent official in all islands except Sonsoral - Sonsoralese and English are official, Tobi - Tobi and English are official, and Angaur- Angaur, Japanese, and English are official'),
(681, 560, 'N', NULL),
(681, 590, 'N', NULL),
(681, 2550, 'N', NULL),
(683, 460, 'N', NULL),
(683, 1460, 'Y', 'a Polynesian language closely related to Tongan and Samoan'),
(684, 460, 'Y', NULL),
(684, 1660, 'Y', '(closely related to Hawaiian and other Polynesian languages) note: most people are bilingual'),
(684, 2100, 'N', NULL),
(685, 460, 'N', NULL),
(685, 1660, 'N', NULL),
(686, 460, 'Y', NULL),
(686, 800, 'N', NULL),
(687, 560, 'Y', NULL),
(688, 460, 'N', NULL),
(688, 1660, 'N', NULL),
(689, 560, 'Y', NULL),
(689, 1570, 'Y', NULL),
(690, 460, 'N', NULL),
(690, 2000, 'N', NULL),
(691, 460, 'Y', NULL),
(692, 460, 'Y', NULL),
(692, 1320, 'Y', NULL),
(850, 980, 'Y', NULL),
(852, 270, 'Y', NULL),
(852, 460, 'Y', NULL),
(853, 200, 'N', NULL),
(853, 760, 'N', NULL),
(853, 1270, 'N', NULL),
(855, 460, 'N', NULL),
(855, 560, 'N', NULL),
(855, 920, 'Y', NULL),
(856, 460, 'N', NULL),
(856, 560, 'N', NULL),
(856, 1110, 'Y', NULL),
(880, 109, 'Y', NULL),
(880, 460, 'N', NULL),
(886, 1280, 'Y', NULL),
(886, 1880, 'N', NULL),
(960, 460, 'QY', 'English spoken by most government officials'),
(960, 1250, 'Y', NULL),
(961, 80, 'Y', NULL),
(961, 90, 'N', NULL),
(961, 460, 'N', NULL),
(961, 560, 'N', NULL),
(962, 80, 'Y', NULL),
(962, 460, 'N', 'English widely understood among upper and middle classes'),
(963, 80, 'Y', NULL),
(963, 90, 'N', NULL),
(963, 460, 'N', NULL),
(963, 560, 'N', NULL),
(963, 1000, 'N', NULL),
(964, 80, 'N', NULL),
(964, 90, 'N', NULL),
(964, 100, 'N', NULL),
(964, 1000, 'QY', 'official in Kurdish regions'),
(965, 80, 'Y', NULL),
(965, 460, 'N', NULL),
(966, 80, 'Y', NULL),
(967, 80, 'N', NULL),
(968, 80, 'Y', NULL),
(968, 106, 'N', NULL),
(968, 460, 'N', NULL),
(968, 2400, 'N', NULL),
(971, 80, 'Y', NULL),
(971, 460, 'N', NULL),
(971, 740, 'N', NULL),
(971, 1550, 'N', NULL),
(971, 2400, 'N', NULL),
(972, 80, 'QY', 'Arabic used officially for Arab minority'),
(972, 460, 'N', NULL),
(972, 730, 'Y', NULL),
(973, 80, 'Y', NULL),
(973, 460, 'N', NULL),
(973, 510, 'N', NULL),
(973, 2400, 'N', NULL),
(974, 80, 'Y', NULL),
(974, 460, 'QY', 'English commonly used as a second language'),
(975, 420, 'Y', NULL),
(976, 220, 'N', NULL),
(976, 910, 'N', NULL),
(976, 1650, 'N', NULL),
(977, 140, 'N', NULL),
(977, 460, 'N', 'note: many in government and business also speak English'),
(977, 1190, 'N', NULL),
(977, 1210, 'N', NULL),
(977, 1440, 'N', NULL),
(977, 1450, 'N', NULL),
(977, 1900, 'N', NULL),
(977, 1960, 'N', NULL),
(992, 1650, 'N', NULL),
(992, 1890, 'N', NULL),
(993, 1650, 'N', NULL),
(993, 2300, 'N', NULL),
(993, 2450, 'N', NULL),
(994, 90, 'N', NULL),
(994, 103, 'Y', NULL),
(994, 1650, 'N', NULL),
(995, 90, 'N', NULL),
(995, 650, 'Y', NULL),
(995, 1650, 'N', NULL),
(996, 1100, 'Y', NULL),
(996, 1650, 'Y', NULL),
(998, 1650, 'N', NULL),
(998, 1890, 'N', NULL),
(998, 2450, 'N', NULL),
(1242, 340, 'QY', 'among Haitian immigrants'),
(1242, 460, 'Y', NULL),
(1246, 460, 'Y', NULL),
(1264, 460, 'Y', NULL),
(1268, 460, 'Y', NULL),
(1284, 460, 'Y', NULL),
(1340, 460, 'N', NULL),
(1340, 560, 'N', NULL),
(1340, 1850, 'N', NULL),
(1345, 460, 'Y', NULL),
(1441, 460, 'Y', NULL),
(1441, 1580, 'N', NULL),
(1473, 460, 'Y', NULL),
(1473, 560, 'N', NULL),
(1649, 460, 'Y', NULL),
(1664, 460, 'Y', NULL),
(1670, 240, 'N', NULL),
(1670, 270, 'N', NULL),
(1670, 460, 'N', NULL),
(1670, 530, 'N', NULL),
(1671, 240, 'N', NULL),
(1671, 460, 'N', NULL),
(1671, 530, 'N', NULL),
(1758, 460, 'Y', NULL),
(1758, 560, 'N', NULL),
(1767, 460, 'N', NULL),
(1767, 560, 'N', NULL),
(1784, 460, 'N', NULL),
(1784, 560, 'N', NULL),
(1787, 460, 'N', NULL),
(1787, 1850, 'N', NULL),
(1809, 1850, 'Y', NULL),
(1868, 270, 'N', NULL),
(1868, 460, 'Y', NULL),
(1868, 560, 'N', NULL),
(1868, 740, 'N', NULL),
(1868, 1850, 'N', NULL),
(1869, 460, 'N', NULL),
(1876, 460, 'Y', NULL),
(2000, 460, 'N', NULL),
(2001, 190, 'N', 'minority ethnic groups have their own languages');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wf_world_regions`
--

CREATE TABLE `wf_world_regions` (
  `REGION_ID` smallint(6) NOT NULL,
  `REGION_NAME` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `wf_world_regions`
--

INSERT INTO `wf_world_regions` (`REGION_ID`, `REGION_NAME`) VALUES
(5, 'South America'),
(9, 'Oceania'),
(11, 'Western Africa'),
(13, 'Central America'),
(14, 'Eastern Africa'),
(15, 'Northern Africa'),
(17, 'Middle Africa'),
(18, 'Southern Africa'),
(21, 'Northern America'),
(29, 'Caribbean'),
(30, 'Eastern Asia'),
(34, 'Southern Asia'),
(35, 'South-Eastern Asia'),
(39, 'Southern Europe'),
(143, 'Central Asia'),
(145, 'Western Asia'),
(151, 'Eastern Europe'),
(154, 'Northern Europe'),
(155, 'Western Europe');

-- --------------------------------------------------------

--
-- Estructura para la vista `emp_details_view`
--
DROP TABLE IF EXISTS `emp_details_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `emp_details_view`  AS  select `e`.`EMPLOYEE_ID` AS `EMPLOYEE_ID`,`e`.`JOB_ID` AS `JOB_ID`,`e`.`MANAGER_ID` AS `MANAGER_ID`,`e`.`DEPARTMENT_ID` AS `DEPARTMENT_ID`,`d`.`LOCATION_ID` AS `LOCATION_ID`,`l`.`COUNTRY_ID` AS `COUNTRY_ID`,`e`.`FIRST_NAME` AS `FIRST_NAME`,`e`.`LAST_NAME` AS `LAST_NAME`,`e`.`SALARY` AS `SALARY`,`e`.`COMMISSION_PCT` AS `COMMISSION_PCT`,`d`.`DEPARTMENT_NAME` AS `DEPARTMENT_NAME`,`j`.`JOB_TITLE` AS `JOB_TITLE`,`l`.`CITY` AS `CITY`,`l`.`STATE_PROVINCE` AS `STATE_PROVINCE`,`c`.`COUNTRY_NAME` AS `COUNTRY_NAME`,`r`.`REGION_NAME` AS `REGION_NAME` from (((((`employees` `e` join `departments` `d`) join `jobs` `j`) join `locations` `l`) join `countries` `c`) join `regions` `r`) where `e`.`DEPARTMENT_ID` = `d`.`DEPARTMENT_ID` and `d`.`LOCATION_ID` = `l`.`LOCATION_ID` and `l`.`COUNTRY_ID` = `c`.`COUNTRY_ID` and `c`.`REGION_ID` = `r`.`REGION_ID` and `j`.`JOB_ID` = `e`.`JOB_ID` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`COUNTRY_ID`),
  ADD KEY `COUNTR_REG_FK` (`REGION_ID`);

--
-- Indices de la tabla `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`DEPARTMENT_ID`),
  ADD KEY `DEPT_LOCATION_IX` (`LOCATION_ID`),
  ADD KEY `DEPT_MGR_FK` (`MANAGER_ID`);

--
-- Indices de la tabla `d_cds`
--
ALTER TABLE `d_cds`
  ADD PRIMARY KEY (`CD_NUMBER`),
  ADD KEY `D_CDS_IDX` (`TITLE`);

--
-- Indices de la tabla `d_clients`
--
ALTER TABLE `d_clients`
  ADD PRIMARY KEY (`CLIENT_NUMBER`);

--
-- Indices de la tabla `d_events`
--
ALTER TABLE `d_events`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CLIENT_NUMBER` (`CLIENT_NUMBER`),
  ADD KEY `PACKAGE_CODE` (`PACKAGE_CODE`),
  ADD KEY `THEME_CODE` (`THEME_CODE`),
  ADD KEY `VENUE_ID` (`VENUE_ID`);

--
-- Indices de la tabla `d_job_assignments`
--
ALTER TABLE `d_job_assignments`
  ADD PRIMARY KEY (`PARTNER_ID`,`EVENT_ID`),
  ADD KEY `EVENT_ID` (`EVENT_ID`);

--
-- Indices de la tabla `d_packages`
--
ALTER TABLE `d_packages`
  ADD PRIMARY KEY (`CODE`);

--
-- Indices de la tabla `d_partners`
--
ALTER TABLE `d_partners`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `d_play_list_items`
--
ALTER TABLE `d_play_list_items`
  ADD PRIMARY KEY (`EVENT_ID`,`SONG_ID`),
  ADD KEY `SONG_ID` (`SONG_ID`);

--
-- Indices de la tabla `d_songs`
--
ALTER TABLE `d_songs`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `TYPE_CODE` (`TYPE_CODE`);

--
-- Indices de la tabla `d_themes`
--
ALTER TABLE `d_themes`
  ADD PRIMARY KEY (`CODE`);

--
-- Indices de la tabla `d_track_listings`
--
ALTER TABLE `d_track_listings`
  ADD PRIMARY KEY (`SONG_ID`,`CD_NUMBER`),
  ADD KEY `CD_NUMBER` (`CD_NUMBER`),
  ADD KEY `SONG_ID_IDX` (`SONG_ID`);

--
-- Indices de la tabla `d_types`
--
ALTER TABLE `d_types`
  ADD PRIMARY KEY (`CODE`);

--
-- Indices de la tabla `d_venues`
--
ALTER TABLE `d_venues`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`EMPLOYEE_ID`),
  ADD UNIQUE KEY `EMP_EMAIL_UK` (`EMAIL`),
  ADD KEY `EMP_DEPARTMENT_IX` (`DEPARTMENT_ID`),
  ADD KEY `EMP_JOB_IX` (`JOB_ID`),
  ADD KEY `EMP_MANAGER_IX` (`MANAGER_ID`),
  ADD KEY `EMP_NAME_IX` (`LAST_NAME`,`FIRST_NAME`);

--
-- Indices de la tabla `f_customers`
--
ALTER TABLE `f_customers`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `f_food_items`
--
ALTER TABLE `f_food_items`
  ADD PRIMARY KEY (`FOOD_ITEM_NUMBER`),
  ADD KEY `PROMO_CODE` (`PROMO_CODE`),
  ADD KEY `REGULAR_CODE` (`REGULAR_CODE`);

--
-- Indices de la tabla `f_orders`
--
ALTER TABLE `f_orders`
  ADD PRIMARY KEY (`ORDER_NUMBER`),
  ADD KEY `CUST_ID` (`CUST_ID`),
  ADD KEY `STAFF_ID` (`STAFF_ID`);

--
-- Indices de la tabla `f_order_lines`
--
ALTER TABLE `f_order_lines`
  ADD PRIMARY KEY (`ORDER_NUMBER`,`FOOD_ITEM_NUMBER`),
  ADD KEY `FOOD_ITEM_NUMBER` (`FOOD_ITEM_NUMBER`);

--
-- Indices de la tabla `f_promotional_menus`
--
ALTER TABLE `f_promotional_menus`
  ADD PRIMARY KEY (`CODE`);

--
-- Indices de la tabla `f_regular_menus`
--
ALTER TABLE `f_regular_menus`
  ADD PRIMARY KEY (`CODE`);

--
-- Indices de la tabla `f_shifts`
--
ALTER TABLE `f_shifts`
  ADD PRIMARY KEY (`CODE`);

--
-- Indices de la tabla `f_shift_assignments`
--
ALTER TABLE `f_shift_assignments`
  ADD PRIMARY KEY (`CODE`,`ID`),
  ADD KEY `ID` (`ID`);

--
-- Indices de la tabla `f_staffs`
--
ALTER TABLE `f_staffs`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`JOB_ID`);

--
-- Indices de la tabla `job_history`
--
ALTER TABLE `job_history`
  ADD PRIMARY KEY (`EMPLOYEE_ID`,`START_DATE`),
  ADD KEY `JHIST_DEPARTMENT_IX` (`DEPARTMENT_ID`),
  ADD KEY `JHIST_EMPLOYEE_IX` (`EMPLOYEE_ID`),
  ADD KEY `JHIST_JOB_IX` (`JOB_ID`);

--
-- Indices de la tabla `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`LOCATION_ID`),
  ADD KEY `LOC_CITY_IX` (`CITY`),
  ADD KEY `LOC_COUNTRY_IX` (`COUNTRY_ID`),
  ADD KEY `LOC_STATE_PROVINCE_IX` (`STATE_PROVINCE`);

--
-- Indices de la tabla `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`REGION_ID`);

--
-- Indices de la tabla `wf_countries`
--
ALTER TABLE `wf_countries`
  ADD PRIMARY KEY (`COUNTRY_ID`),
  ADD KEY `WF_CTRY_REG_IDX` (`REGION_ID`),
  ADD KEY `WF_CTRY_CURR_IDX` (`CURRENCY_CODE`);

--
-- Indices de la tabla `wf_currencies`
--
ALTER TABLE `wf_currencies`
  ADD PRIMARY KEY (`CURRENCY_CODE`);

--
-- Indices de la tabla `wf_languages`
--
ALTER TABLE `wf_languages`
  ADD PRIMARY KEY (`LANGUAGE_ID`);

--
-- Indices de la tabla `wf_spoken_languages`
--
ALTER TABLE `wf_spoken_languages`
  ADD PRIMARY KEY (`COUNTRY_ID`,`LANGUAGE_ID`),
  ADD KEY `LANGUAGE_ID` (`LANGUAGE_ID`);

--
-- Indices de la tabla `wf_world_regions`
--
ALTER TABLE `wf_world_regions`
  ADD PRIMARY KEY (`REGION_ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `wf_countries`
--
ALTER TABLE `wf_countries`
  MODIFY `COUNTRY_ID` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2002;

--
-- AUTO_INCREMENT de la tabla `wf_languages`
--
ALTER TABLE `wf_languages`
  MODIFY `LANGUAGE_ID` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3001;

--
-- AUTO_INCREMENT de la tabla `wf_world_regions`
--
ALTER TABLE `wf_world_regions`
  MODIFY `REGION_ID` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `countries`
--
ALTER TABLE `countries`
  ADD CONSTRAINT `COUNTR_REG_FK` FOREIGN KEY (`REGION_ID`) REFERENCES `regions` (`REGION_ID`);

--
-- Filtros para la tabla `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `DEPT_LOC_FK` FOREIGN KEY (`LOCATION_ID`) REFERENCES `locations` (`LOCATION_ID`),
  ADD CONSTRAINT `DEPT_MGR_FK` FOREIGN KEY (`MANAGER_ID`) REFERENCES `employees` (`EMPLOYEE_ID`);

--
-- Filtros para la tabla `d_events`
--
ALTER TABLE `d_events`
  ADD CONSTRAINT `d_events_ibfk_1` FOREIGN KEY (`CLIENT_NUMBER`) REFERENCES `d_clients` (`CLIENT_NUMBER`),
  ADD CONSTRAINT `d_events_ibfk_2` FOREIGN KEY (`PACKAGE_CODE`) REFERENCES `d_packages` (`CODE`),
  ADD CONSTRAINT `d_events_ibfk_3` FOREIGN KEY (`THEME_CODE`) REFERENCES `d_themes` (`CODE`),
  ADD CONSTRAINT `d_events_ibfk_4` FOREIGN KEY (`VENUE_ID`) REFERENCES `d_venues` (`ID`);

--
-- Filtros para la tabla `d_job_assignments`
--
ALTER TABLE `d_job_assignments`
  ADD CONSTRAINT `d_job_assignments_ibfk_1` FOREIGN KEY (`EVENT_ID`) REFERENCES `d_events` (`ID`),
  ADD CONSTRAINT `d_job_assignments_ibfk_2` FOREIGN KEY (`PARTNER_ID`) REFERENCES `d_partners` (`ID`);

--
-- Filtros para la tabla `d_play_list_items`
--
ALTER TABLE `d_play_list_items`
  ADD CONSTRAINT `d_play_list_items_ibfk_1` FOREIGN KEY (`EVENT_ID`) REFERENCES `d_events` (`ID`),
  ADD CONSTRAINT `d_play_list_items_ibfk_2` FOREIGN KEY (`SONG_ID`) REFERENCES `d_songs` (`ID`);

--
-- Filtros para la tabla `d_songs`
--
ALTER TABLE `d_songs`
  ADD CONSTRAINT `d_songs_ibfk_1` FOREIGN KEY (`TYPE_CODE`) REFERENCES `d_types` (`CODE`);

--
-- Filtros para la tabla `d_track_listings`
--
ALTER TABLE `d_track_listings`
  ADD CONSTRAINT `d_track_listings_ibfk_1` FOREIGN KEY (`CD_NUMBER`) REFERENCES `d_cds` (`CD_NUMBER`),
  ADD CONSTRAINT `d_track_listings_ibfk_2` FOREIGN KEY (`SONG_ID`) REFERENCES `d_songs` (`ID`);

--
-- Filtros para la tabla `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `EMP_DEPT_FK` FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES `departments` (`DEPARTMENT_ID`),
  ADD CONSTRAINT `EMP_JOB_FK` FOREIGN KEY (`JOB_ID`) REFERENCES `jobs` (`JOB_ID`),
  ADD CONSTRAINT `EMP_MANAGER_FK` FOREIGN KEY (`MANAGER_ID`) REFERENCES `employees` (`EMPLOYEE_ID`);

--
-- Filtros para la tabla `f_food_items`
--
ALTER TABLE `f_food_items`
  ADD CONSTRAINT `f_food_items_ibfk_1` FOREIGN KEY (`PROMO_CODE`) REFERENCES `f_promotional_menus` (`CODE`),
  ADD CONSTRAINT `f_food_items_ibfk_2` FOREIGN KEY (`REGULAR_CODE`) REFERENCES `f_regular_menus` (`CODE`);

--
-- Filtros para la tabla `f_orders`
--
ALTER TABLE `f_orders`
  ADD CONSTRAINT `f_orders_ibfk_1` FOREIGN KEY (`CUST_ID`) REFERENCES `f_customers` (`ID`),
  ADD CONSTRAINT `f_orders_ibfk_2` FOREIGN KEY (`STAFF_ID`) REFERENCES `f_staffs` (`ID`);

--
-- Filtros para la tabla `f_order_lines`
--
ALTER TABLE `f_order_lines`
  ADD CONSTRAINT `f_order_lines_ibfk_1` FOREIGN KEY (`FOOD_ITEM_NUMBER`) REFERENCES `f_food_items` (`FOOD_ITEM_NUMBER`),
  ADD CONSTRAINT `f_order_lines_ibfk_2` FOREIGN KEY (`ORDER_NUMBER`) REFERENCES `f_orders` (`ORDER_NUMBER`);

--
-- Filtros para la tabla `f_shift_assignments`
--
ALTER TABLE `f_shift_assignments`
  ADD CONSTRAINT `f_shift_assignments_ibfk_1` FOREIGN KEY (`CODE`) REFERENCES `f_shifts` (`CODE`),
  ADD CONSTRAINT `f_shift_assignments_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `f_staffs` (`ID`);

--
-- Filtros para la tabla `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `LOC_C_ID_FK` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `countries` (`COUNTRY_ID`);
--
-- Base de datos: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"pruebaphp\",\"table\":\"lenguajeprogramacion\"},{\"db\":\"pruebaphp\",\"table\":\"vehiculos\"},{\"db\":\"ditg\",\"table\":\"comerciante\"},{\"db\":\"ditg\",\"table\":\"adminitrador_subscripci\\u00f3n\"},{\"db\":\"ditg\",\"table\":\"adminitrador\"},{\"db\":\"centromedico\",\"table\":\"usuarios\"},{\"db\":\"centromedico\",\"table\":\"pacientes\"},{\"db\":\"centromedico\",\"table\":\"medicos\"},{\"db\":\"centromedico\",\"table\":\"consultorios\"},{\"db\":\"centromedico\",\"table\":\"citas\"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Volcado de datos para la tabla `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'centromedico', 'medicos', '{\"sorted_col\":\"`medicos`.`medIdentificacion` ASC\"}', '2021-01-12 22:28:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2021-05-28 19:08:16', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"es\",\"NavigationWidth\":247}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `proyecto`
--
CREATE DATABASE IF NOT EXISTS `proyecto` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `proyecto`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `establecimiento`
--

CREATE TABLE `establecimiento` (
  `idEst` int(11) NOT NULL,
  `nombreEst` varchar(60) NOT NULL,
  `desEst` text NOT NULL,
  `dirEst` varchar(60) NOT NULL,
  `catEst` enum('Ferreteria','Restaurante','Cafeteria','jugueteria','supermercado') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `establecimiento`
--
ALTER TABLE `establecimiento`
  ADD PRIMARY KEY (`idEst`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `establecimiento`
--
ALTER TABLE `establecimiento`
  MODIFY `idEst` int(11) NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `proyecto2`
--
CREATE DATABASE IF NOT EXISTS `proyecto2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `proyecto2`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `usuNombre` varchar(40) NOT NULL,
  `usuEmail` varchar(50) NOT NULL,
  `usuPassword` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `pruebaphp`
--
CREATE DATABASE IF NOT EXISTS `pruebaphp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pruebaphp`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lenguajeprogramacion`
--

CREATE TABLE `lenguajeprogramacion` (
  `lengueaje` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `Nombres` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
-- Base de datos: `rolesusuarios`
--
CREATE DATABASE IF NOT EXISTS `rolesusuarios` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `rolesusuarios`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

CREATE TABLE `menus` (
  `idMenu` int(11) NOT NULL,
  `menuNombre` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `menuEstado` enum('true','false') COLLATE utf8mb4_spanish2_ci NOT NULL DEFAULT 'true'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `menus`
--

INSERT INTO `menus` (`idMenu`, `menuNombre`, `menuEstado`) VALUES
(1, 'Personas', 'true'),
(2, 'Usuarios', 'true'),
(3, 'Perfiles', 'true'),
(4, 'Menu', 'true');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opcionesmenu`
--

CREATE TABLE `opcionesmenu` (
  `idOpcionMenu` int(11) NOT NULL,
  `opcionMenuNombre` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `opcionMenuEnlace` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `opcionMenuEstado` enum('true','false') COLLATE utf8mb4_spanish2_ci NOT NULL DEFAULT 'true',
  `idMenu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `idPersona` int(11) NOT NULL,
  `personaNombres` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `personaApellidos` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `personaGenero` enum('Femenino','Masculino') COLLATE utf8mb4_spanish2_ci NOT NULL,
  `personaDocumento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`idPersona`, `personaNombres`, `personaApellidos`, `personaGenero`, `personaDocumento`) VALUES
(1, 'Maria Antonieta d', 'De las Nieves ', 'Masculino', 123),
(2, 'Ubaldo Matildo', 'Fillol Rodriguez', 'Masculino', 12345),
(4, 'Maxilimiliano', 'Cortes Glindo', 'Masculino', 51351511),
(6, 'sadsa', 'sadsad', 'Femenino', 100636135),
(7, 'sfddddddddddd', '|dssssssss', 'Femenino', 2147483647);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `idRol` int(11) NOT NULL,
  `rolNombre` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`idRol`, `rolNombre`) VALUES
(5, 'Administrador 1'),
(8, 'Aprendiz'),
(6, 'Cliente'),
(7, 'Instructor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rolesmenu`
--

CREATE TABLE `rolesmenu` (
  `idRolMenu` int(11) NOT NULL,
  `rolMenuEstado` enum('activo','Inactivo') COLLATE utf8mb4_spanish2_ci NOT NULL,
  `idMenu` int(11) NOT NULL,
  `idRol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `usuarioLogin` char(15) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `usuarioPassword` varchar(60) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `usuarioEstado` enum('Activo','Inactivo') COLLATE utf8mb4_spanish2_ci NOT NULL,
  `idPersonas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `usuarioLogin`, `usuarioPassword`, `usuarioEstado`, `idPersonas`) VALUES
(1, 'Maria sdssd', 'Maria123', 'Inactivo', 1),
(2, 'Ubaldo', 'Ubaldo123', 'Activo', 2),
(3, 'maxi', 'Maxi123', 'Activo', 4),
(6, 'Maria', '11323232', 'Activo', 1),
(12, 'Maxi123', 'Maxi123', 'Activo', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariosroles`
--

CREATE TABLE `usuariosroles` (
  `idUsuarioRol` int(11) NOT NULL,
  `usuarioRolEstado` enum('true','false') COLLATE utf8mb4_spanish2_ci NOT NULL DEFAULT 'true',
  `idUsuario` int(11) NOT NULL,
  `idRol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `usuariosroles`
--

INSERT INTO `usuariosroles` (`idUsuarioRol`, `usuarioRolEstado`, `idUsuario`, `idRol`) VALUES
(13, 'true', 2, 5),
(14, 'true', 2, 7),
(15, 'true', 3, 5),
(16, 'true', 3, 7),
(17, 'true', 12, 5),
(18, 'true', 12, 7),
(27, 'true', 6, 8),
(28, 'true', 6, 6),
(29, 'true', 6, 5),
(30, 'true', 2, 8),
(31, 'true', 2, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariosxpersonas`
--

CREATE TABLE `usuariosxpersonas` (
  `idusuariosxPersonas` int(11) NOT NULL,
  `usuariosxPersonasEstado` enum('true','false') COLLATE utf8mb4_spanish2_ci NOT NULL DEFAULT 'true',
  `idPersona` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `view_usuariosroles`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `view_usuariosroles` (
`idUsuarioRol` int(11)
,`usuarioRolEstado` enum('true','false')
,`idUsuario` int(11)
,`idRol` int(11)
,`usuarioLogin` char(15)
,`usuarioEstado` enum('Activo','Inactivo')
,`rolNombre` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `view_usuariosroles`
--
DROP TABLE IF EXISTS `view_usuariosroles`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_usuariosroles`  AS  select `ur`.`idUsuarioRol` AS `idUsuarioRol`,`ur`.`usuarioRolEstado` AS `usuarioRolEstado`,`ur`.`idUsuario` AS `idUsuario`,`ur`.`idRol` AS `idRol`,`us`.`usuarioLogin` AS `usuarioLogin`,`us`.`usuarioEstado` AS `usuarioEstado`,`ro`.`rolNombre` AS `rolNombre` from ((`usuariosroles` `ur` join `usuarios` `us`) join `roles` `ro`) where `ur`.`idUsuario` = `us`.`idUsuario` and `ur`.`idRol` = `ro`.`idRol` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`idMenu`);

--
-- Indices de la tabla `opcionesmenu`
--
ALTER TABLE `opcionesmenu`
  ADD PRIMARY KEY (`idOpcionMenu`),
  ADD KEY `FK-idMenu-opcionesmenu_idx` (`idMenu`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`idPersona`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idRol`),
  ADD UNIQUE KEY `rolNombre` (`rolNombre`);

--
-- Indices de la tabla `rolesmenu`
--
ALTER TABLE `rolesmenu`
  ADD PRIMARY KEY (`idRolMenu`),
  ADD KEY `fk_rolesxmenu_roles1_idx` (`idRol`),
  ADD KEY `fk-idMenu-RolesMenu_idx` (`idMenu`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `login` (`usuarioLogin`),
  ADD UNIQUE KEY `usuarioLogin_2` (`usuarioLogin`),
  ADD KEY `idPersonas` (`idPersonas`),
  ADD KEY `usuarioLogin` (`usuarioLogin`);

--
-- Indices de la tabla `usuariosroles`
--
ALTER TABLE `usuariosroles`
  ADD PRIMARY KEY (`idUsuarioRol`),
  ADD UNIQUE KEY `indx-unico-idrol-idusuario-usuarioroles` (`idUsuario`,`idRol`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idRol` (`idRol`);

--
-- Indices de la tabla `usuariosxpersonas`
--
ALTER TABLE `usuariosxpersonas`
  ADD PRIMARY KEY (`idusuariosxPersonas`),
  ADD KEY `fk_usuariosxpersonas_personas1_idx` (`idPersona`),
  ADD KEY `fk_usuariosxpersonas_usuarios1_idx` (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `menus`
--
ALTER TABLE `menus`
  MODIFY `idMenu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `opcionesmenu`
--
ALTER TABLE `opcionesmenu`
  MODIFY `idOpcionMenu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `idPersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `usuariosroles`
--
ALTER TABLE `usuariosroles`
  MODIFY `idUsuarioRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `usuariosxpersonas`
--
ALTER TABLE `usuariosxpersonas`
  MODIFY `idusuariosxPersonas` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `opcionesmenu`
--
ALTER TABLE `opcionesmenu`
  ADD CONSTRAINT `FK-idMenu-opcionesmenu` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`);

--
-- Filtros para la tabla `rolesmenu`
--
ALTER TABLE `rolesmenu`
  ADD CONSTRAINT `fk-idMenu-RolesMenu` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`),
  ADD CONSTRAINT `fk-idRol-RolesMenu` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk-idPersona-usuarios` FOREIGN KEY (`idPersonas`) REFERENCES `personas` (`idPersona`);

--
-- Filtros para la tabla `usuariosroles`
--
ALTER TABLE `usuariosroles`
  ADD CONSTRAINT `usuariosroles_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`),
  ADD CONSTRAINT `usuariosroles_ibfk_2` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`);

--
-- Filtros para la tabla `usuariosxpersonas`
--
ALTER TABLE `usuariosxpersonas`
  ADD CONSTRAINT `fk_usuariosxpersonas_personas1` FOREIGN KEY (`idPersona`) REFERENCES `personas` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuariosxpersonas_usuarios1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
