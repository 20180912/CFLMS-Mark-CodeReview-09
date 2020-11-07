-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 07. Nov 2020 um 13:33
-- Server-Version: 10.4.14-MariaDB
-- PHP-Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_mark_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_mark_delivery` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr09_mark_delivery`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `address`
--

CREATE TABLE `address` (
  `AddressID` int(11) NOT NULL,
  `Street` varchar(30) NOT NULL,
  `Number` int(11) NOT NULL,
  `ZipCode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `address`
--

INSERT INTO `address` (`AddressID`, `Street`, `Number`, `ZipCode`) VALUES
(1, 'Eslarngasse', 18, 1030),
(2, 'Rabensteig', 1, 1010),
(3, 'Getreidegasse', 9, 5020),
(4, 'Innrain', 52, 6020);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `NameID` int(11) NOT NULL,
  `AddressID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`CustomerID`, `NameID`, `AddressID`) VALUES
(1, 1, 1),
(2, 2, 3),
(3, 3, 2),
(4, 4, 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `name`
--

CREATE TABLE `name` (
  `NameID` int(11) NOT NULL,
  `FirstName` varchar(30) NOT NULL,
  `LastName` varchar(30) NOT NULL,
  `Title` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `name`
--

INSERT INTO `name` (`NameID`, `FirstName`, `LastName`, `Title`) VALUES
(1, 'Mark', 'Etzel', 'DI'),
(2, 'Wolfgang Amadeus', 'Mozart', NULL),
(3, 'Max', 'Mustermann', NULL),
(4, 'Erika', 'Mustermann', 'Univ Prof');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `package`
--

CREATE TABLE `package` (
  `PackageID` int(11) NOT NULL,
  `SenderID` int(11) NOT NULL,
  `RecipientID` int(11) NOT NULL,
  `TypeID` int(11) NOT NULL,
  `Location` varchar(30) NOT NULL,
  `DateOfShipping` date NOT NULL,
  `DateOfDelivery` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `package`
--

INSERT INTO `package` (`PackageID`, `SenderID`, `RecipientID`, `TypeID`, `Location`, `DateOfShipping`, `DateOfDelivery`) VALUES
(1, 2, 1, 4, '16873354', '1776-07-04', NULL),
(2, 3, 4, 2, '97256948', '2020-11-06', '2020-11-07'),
(3, 3, 1, 1, '56712459', '2020-09-30', '2020-09-30');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `type`
--

CREATE TABLE `type` (
  `TypeID` int(11) NOT NULL,
  `Size` varchar(10) DEFAULT NULL,
  `Weight` int(11) DEFAULT NULL,
  `Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `type`
--

INSERT INTO `type` (`TypeID`, `Size`, `Weight`, `Price`) VALUES
(1, 'S', 1, 1),
(2, 'S', 2, 2),
(3, 'M', 2, 3),
(4, 'L', 3, 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zip_code`
--

CREATE TABLE `zip_code` (
  `ZipCode` int(11) NOT NULL,
  `City` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `zip_code`
--

INSERT INTO `zip_code` (`ZipCode`, `City`) VALUES
(1010, 'Vienna'),
(1030, 'Vienna'),
(5020, 'Salzburg'),
(6020, 'Innsbruck');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`AddressID`),
  ADD KEY `ZipCode` (`ZipCode`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`),
  ADD KEY `NameID` (`NameID`),
  ADD KEY `AddressID` (`AddressID`);

--
-- Indizes für die Tabelle `name`
--
ALTER TABLE `name`
  ADD PRIMARY KEY (`NameID`);

--
-- Indizes für die Tabelle `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`PackageID`),
  ADD KEY `SenderID` (`SenderID`),
  ADD KEY `RecipientID` (`RecipientID`),
  ADD KEY `TypeID` (`TypeID`);

--
-- Indizes für die Tabelle `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`TypeID`);

--
-- Indizes für die Tabelle `zip_code`
--
ALTER TABLE `zip_code`
  ADD PRIMARY KEY (`ZipCode`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `address`
--
ALTER TABLE `address`
  MODIFY `AddressID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `name`
--
ALTER TABLE `name`
  MODIFY `NameID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `package`
--
ALTER TABLE `package`
  MODIFY `PackageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `type`
--
ALTER TABLE `type`
  MODIFY `TypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`ZipCode`) REFERENCES `zip_code` (`ZipCode`);

--
-- Constraints der Tabelle `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`NameID`) REFERENCES `name` (`NameID`),
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`AddressID`) REFERENCES `address` (`AddressID`);

--
-- Constraints der Tabelle `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `package_ibfk_1` FOREIGN KEY (`SenderID`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `package_ibfk_2` FOREIGN KEY (`RecipientID`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `package_ibfk_3` FOREIGN KEY (`TypeID`) REFERENCES `type` (`TypeID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
