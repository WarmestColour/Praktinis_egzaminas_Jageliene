-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2021 at 01:46 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kursai_info`
--

-- --------------------------------------------------------

--
-- Table structure for table `autoriai`
--

CREATE TABLE `autoriai` (
  `Vardas` varchar(255) COLLATE utf16_lithuanian_ci NOT NULL,
  `Pavardė` varchar(255) COLLATE utf16_lithuanian_ci NOT NULL,
  `Autoriaus_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_lithuanian_ci;

--
-- Dumping data for table `autoriai`
--

INSERT INTO `autoriai` (`Vardas`, `Pavardė`, `Autoriaus_ID`) VALUES
('Tomas', 'Raudonis', 1),
('Giedrius', 'Brazauskas', 2);

-- --------------------------------------------------------

--
-- Table structure for table `komentarai`
--

CREATE TABLE `komentarai` (
  `Komentaro_ID` int(11) NOT NULL,
  `Kurso_ID` int(11) NOT NULL,
  `Tekstas` varchar(255) COLLATE utf16_lithuanian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kursai`
--

CREATE TABLE `kursai` (
  `Kurso_ID` int(11) NOT NULL,
  `Pavadinimas` varchar(255) COLLATE utf16_lithuanian_ci NOT NULL,
  `Autoriaus_ID` int(11) NOT NULL,
  `Aprasas` varchar(255) COLLATE utf16_lithuanian_ci NOT NULL,
  `Turinys` text COLLATE utf16_lithuanian_ci NOT NULL,
  `Kaina` int(255) NOT NULL,
  `Ikelimo_data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reitingai`
--

CREATE TABLE `reitingai` (
  `Kurso_ID` int(11) NOT NULL,
  `Reitingas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_lithuanian_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `autoriai`
--
ALTER TABLE `autoriai`
  ADD PRIMARY KEY (`Autoriaus_ID`);

--
-- Indexes for table `komentarai`
--
ALTER TABLE `komentarai`
  ADD KEY `Komentarai_fk0` (`Kurso_ID`);

--
-- Indexes for table `kursai`
--
ALTER TABLE `kursai`
  ADD PRIMARY KEY (`Kurso_ID`),
  ADD KEY `Kursai_fk0` (`Autoriaus_ID`);

--
-- Indexes for table `reitingai`
--
ALTER TABLE `reitingai`
  ADD KEY `Reitingai_fk0` (`Kurso_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kursai`
--
ALTER TABLE `kursai`
  MODIFY `Kurso_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `komentarai`
--
ALTER TABLE `komentarai`
  ADD CONSTRAINT `Komentarai_fk0` FOREIGN KEY (`Kurso_ID`) REFERENCES `kursai` (`Kurso_ID`);

--
-- Constraints for table `kursai`
--
ALTER TABLE `kursai`
  ADD CONSTRAINT `Kursai_fk0` FOREIGN KEY (`Autoriaus_ID`) REFERENCES `autoriai` (`Autoriaus_ID`);

--
-- Constraints for table `reitingai`
--
ALTER TABLE `reitingai`
  ADD CONSTRAINT `Reitingai_fk0` FOREIGN KEY (`Kurso_ID`) REFERENCES `kursai` (`Kurso_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
