-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Авг 28 2016 г., 19:46
-- Версия сервера: 5.6.22-log
-- Версия PHP: 5.4.35

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `vin_cut`
--

-- --------------------------------------------------------

--
-- Структура таблицы `vin_country`
--

CREATE TABLE IF NOT EXISTS `vin_country` (
  `id_vin_country` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Country name',
  PRIMARY KEY (`id_vin_country`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Страна' AUTO_INCREMENT=43 ;

--
-- Дамп данных таблицы `vin_country`
--

INSERT INTO `vin_country` (`id_vin_country`, `name`) VALUES
(1, 'United States (USA)'),
(2, 'United Kingdom (UK)'),
(3, 'Germany'),
(4, 'Japan'),
(5, 'Argentina'),
(6, 'Mexico'),
(7, 'Norway'),
(8, 'Canada'),
(10, 'Australia'),
(11, 'South Korea'),
(12, 'South Africa'),
(13, 'China'),
(14, 'Thailand'),
(15, 'Italy'),
(16, 'Taiwan'),
(17, 'Spain'),
(18, 'Brazil'),
(19, 'England'),
(20, 'Hungary'),
(21, 'Sweden'),
(22, 'France'),
(23, 'Israel'),
(24, 'Saudi Arabia'),
(25, 'Vietnam'),
(26, 'Estonia'),
(27, 'Switzerland'),
(28, 'Finland'),
(29, 'Denmark'),
(30, 'Netherlands'),
(31, 'Russia'),
(32, 'India'),
(33, 'Belgium'),
(34, 'Poland'),
(35, 'Turkey'),
(36, 'Slovenia'),
(37, 'Ireland'),
(38, 'Puerto Rico'),
(39, 'Uruguay'),
(40, 'Singapore'),
(41, 'Czech Republic'),
(42, 'United Arab Emirates');

-- --------------------------------------------------------

--
-- Структура таблицы `vin_manufacturer`
--

CREATE TABLE IF NOT EXISTS `vin_manufacturer` (
  `id_vin_manufacturer` int(8) NOT NULL AUTO_INCREMENT,
  `mfr_name` varchar(255) NOT NULL COMMENT 'Mfr_Name',
  `mfr_common_name` varchar(255) DEFAULT NULL COMMENT 'Mfr_CommonName',
  `id_vin_country` int(8) DEFAULT NULL COMMENT 'Country',
  PRIMARY KEY (`id_vin_manufacturer`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Manufacturers' AUTO_INCREMENT=14002 ;

--
-- Дамп данных таблицы `vin_manufacturer`
--

INSERT INTO `vin_manufacturer` (`id_vin_manufacturer`, `mfr_name`, `mfr_common_name`, `id_vin_country`) VALUES
(14, 'BMW M GMBH', 'BMW', 3),
(71, 'Mazda Motor Corporation', 'Mazda', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `vin_manufacturer_vehicle_type_link`
--

CREATE TABLE IF NOT EXISTS `vin_manufacturer_vehicle_type_link` (
  `id_vin_manufacturer_vehicle_type_link` int(8) NOT NULL AUTO_INCREMENT,
  `id_vin_manufacturer` int(8) NOT NULL COMMENT 'Manufacturer',
  `id_vin_vehicle_type` int(8) NOT NULL COMMENT 'VehicleType',
  `is_primary` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'IsPrimary',
  PRIMARY KEY (`id_vin_manufacturer_vehicle_type_link`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='ManufacturerVehicleType' AUTO_INCREMENT=5042 ;

--
-- Дамп данных таблицы `vin_manufacturer_vehicle_type_link`
--

INSERT INTO `vin_manufacturer_vehicle_type_link` (`id_vin_manufacturer_vehicle_type_link`, `id_vin_manufacturer`, `id_vin_vehicle_type`, `is_primary`) VALUES
(6, 14, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `vin_vehicle_type`
--

CREATE TABLE IF NOT EXISTS `vin_vehicle_type` (
  `id_vin_vehicle_type` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Name',
  PRIMARY KEY (`id_vin_vehicle_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='VehicleTypes' AUTO_INCREMENT=10 ;

--
-- Дамп данных таблицы `vin_vehicle_type`
--

INSERT INTO `vin_vehicle_type` (`id_vin_vehicle_type`, `name`) VALUES
(1, 'Passenger Car'),
(2, 'Truck '),
(3, 'Trailer'),
(4, 'Multipurpose Passenger Vehicle (MPV)'),
(5, 'Bus'),
(6, 'Motorcycle'),
(7, 'Low Speed Vehicle (LSV)'),
(8, 'Incomplete Vehicle'),
(9, 'Off Road Vehicle');

-- --------------------------------------------------------

--
-- Структура таблицы `vin_wmi`
--

CREATE TABLE IF NOT EXISTS `vin_wmi` (
  `id_vin_wmi` int(8) NOT NULL AUTO_INCREMENT,
  `wmi_code` varchar(255) NOT NULL COMMENT 'WMICode',
  `id_vin_manufacturer` int(8) NOT NULL COMMENT 'Manufacturer',
  `id_vin_vehicle_type` int(8) DEFAULT NULL COMMENT 'VehicleType',
  `id_vin_country` int(8) DEFAULT NULL COMMENT 'Country',
  PRIMARY KEY (`id_vin_wmi`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='WMI' AUTO_INCREMENT=4967 ;

--
-- Дамп данных таблицы `vin_wmi`
--

INSERT INTO `vin_wmi` (`id_vin_wmi`, `wmi_code`, `id_vin_manufacturer`, `id_vin_vehicle_type`, `id_vin_country`) VALUES
(30, 'WBY', 14, 1, 3),
(31, 'WBS', 14, 1, 3),
(351, 'JM1', 71, 1, 4),
(352, 'JM2', 71, 2, 4),
(353, 'JM3', 71, 4, 4),
(354, 'JC1', 71, 1, 4);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
