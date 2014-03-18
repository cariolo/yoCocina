-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-03-2014 a las 11:13:00
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `yococina`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `food`
--

CREATE TABLE IF NOT EXISTS `food` (
  `id_Food` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(10) NOT NULL,
  `Kind` varchar(10) NOT NULL,
  `Kcal` int(11) NOT NULL,
  PRIMARY KEY (`id_Food`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recipe`
--

CREATE TABLE IF NOT EXISTS `recipe` (
  `id_Recipe` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `Image` varchar(20) NOT NULL,
  `time_needed` int(11) NOT NULL,
  `description` text NOT NULL,
  `value` int(11) NOT NULL,
  `difficulty` int(11) NOT NULL,
  PRIMARY KEY (`id_Recipe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `r_freezer`
--

CREATE TABLE IF NOT EXISTS `r_freezer` (
  `id_User` int(11) NOT NULL,
  `id_Tupper` int(11) NOT NULL,
  `Fr_date` date NOT NULL,
  PRIMARY KEY (`id_User`,`id_Tupper`),
  KEY `foreign_key_tupper` (`id_Tupper`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `r_larder`
--

CREATE TABLE IF NOT EXISTS `r_larder` (
  `id_User` int(11) NOT NULL,
  `id_Food` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  `Useby_date` date NOT NULL,
  PRIMARY KEY (`id_User`,`id_Food`),
  KEY `foreign_key_food_larder` (`id_Food`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `r_list`
--

CREATE TABLE IF NOT EXISTS `r_list` (
  `id_User` int(11) NOT NULL,
  `id_Food` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  PRIMARY KEY (`id_User`,`id_Food`),
  KEY `foreign_key_food` (`id_Food`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tuppers`
--

CREATE TABLE IF NOT EXISTS `tuppers` (
  `id_Tupper` int(11) NOT NULL AUTO_INCREMENT,
  `Meal` varchar(20) NOT NULL,
  PRIMARY KEY (`id_Tupper`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id_User` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(50) NOT NULL,
  `Password` int(11) NOT NULL,
  PRIMARY KEY (`id_User`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `r_freezer`
--
ALTER TABLE `r_freezer`
  ADD CONSTRAINT `foreign_key_usr_fr` FOREIGN KEY (`id_User`) REFERENCES `user` (`id_User`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreign_key_tupper` FOREIGN KEY (`id_Tupper`) REFERENCES `tuppers` (`id_Tupper`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `r_larder`
--
ALTER TABLE `r_larder`
  ADD CONSTRAINT `foreign_key_food_larder` FOREIGN KEY (`id_Food`) REFERENCES `food` (`id_Food`),
  ADD CONSTRAINT `foreign_key_usr_larder` FOREIGN KEY (`id_User`) REFERENCES `user` (`id_User`);

--
-- Filtros para la tabla `r_list`
--
ALTER TABLE `r_list`
  ADD CONSTRAINT `foreign_key_food` FOREIGN KEY (`id_Food`) REFERENCES `food` (`id_Food`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreign_key_user` FOREIGN KEY (`id_User`) REFERENCES `user` (`id_User`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
