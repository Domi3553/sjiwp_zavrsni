-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 02, 2026 at 08:44 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `streamtune_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE `album` (
  `id_albuma` int(11) NOT NULL,
  `naslov` varchar(150) NOT NULL,
  `godina_izdanja` int(11) DEFAULT NULL,
  `id_izvodjaca` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`id_albuma`, `naslov`, `godina_izdanja`, `id_izvodjaca`) VALUES
(1, 'Afrika', 1995, 1),
(2, 'Judi, zviri i beštimje', 1999, 2),
(3, 'Vojko', 2018, 3),
(4, 'Dnevnik jedne ljubavi', 1973, 4);

-- --------------------------------------------------------

--
-- Table structure for table `izvodjac`
--

CREATE TABLE `izvodjac` (
  `id_izvodjaca` int(11) NOT NULL,
  `ime` varchar(100) NOT NULL,
  `biografija` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `izvodjac`
--

INSERT INTO `izvodjac` (`id_izvodjaca`, `ime`, `biografija`) VALUES
(1, 'Dino Dvornik', 'Kralj funka'),
(2, 'Gibonni', 'Kantautor iz Splita'),
(3, 'Vojko V', 'Reper iz Klisa'),
(4, 'Josipa Lisac', 'Glazbena diva');

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `id_korisnika` int(11) NOT NULL,
  `ime` varchar(50) NOT NULL,
  `prezime` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `id_pretplate` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`id_korisnika`, `ime`, `prezime`, `email`, `id_pretplate`) VALUES
(1, 'Marko', 'Marić', 'marko@email.com', 2),
(2, 'Ana', 'Anić', 'ana@email.com', 1),
(3, 'Ivan', 'Ivić', 'ivan@email.com', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pjesma`
--

CREATE TABLE `pjesma` (
  `id_pjesme` int(11) NOT NULL,
  `naslov` varchar(150) NOT NULL,
  `trajanje` time DEFAULT NULL,
  `id_albuma` int(11) DEFAULT NULL,
  `id_zanra` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pjesma`
--

INSERT INTO `pjesma` (`id_pjesme`, `naslov`, `trajanje`, `id_albuma`, `id_zanra`) VALUES
(1, 'Udri jače manijače', '00:03:55', 1, 1),
(2, 'Činim pravu stvar', '00:04:20', 2, 2),
(3, 'Ne može', '00:03:30', 3, 3),
(4, 'O jednoj mladosti', '00:04:00', 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `playlista`
--

CREATE TABLE `playlista` (
  `id_playliste` int(11) NOT NULL,
  `naziv` varchar(100) NOT NULL,
  `id_korisnika` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `playlista`
--

INSERT INTO `playlista` (`id_playliste`, `naziv`, `id_korisnika`) VALUES
(1, 'Ljetni hitovi', 1),
(2, 'Opustencija', 2);

-- --------------------------------------------------------

--
-- Table structure for table `playlist_pjesma`
--

CREATE TABLE `playlist_pjesma` (
  `id_playliste` int(11) NOT NULL,
  `id_pjesme` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `playlist_pjesma`
--

INSERT INTO `playlist_pjesma` (`id_playliste`, `id_pjesme`) VALUES
(1, 1),
(1, 3),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `povijest_slusanja`
--

CREATE TABLE `povijest_slusanja` (
  `id_zapisa` int(11) NOT NULL,
  `datum_vrijeme` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_korisnika` int(11) DEFAULT NULL,
  `id_pjesme` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `povijest_slusanja`
--

INSERT INTO `povijest_slusanja` (`id_zapisa`, `datum_vrijeme`, `id_korisnika`, `id_pjesme`) VALUES
(0, '2026-06-02 06:40:49', 1, 1),
(0, '2026-06-02 06:40:49', 1, 3),
(0, '2026-06-02 06:40:49', 2, 2),
(0, '2026-06-02 06:40:49', 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `pretplata`
--

CREATE TABLE `pretplata` (
  `id_pretplate` int(11) NOT NULL,
  `naziv` varchar(50) NOT NULL,
  `cijena` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pretplata`
--

INSERT INTO `pretplata` (`id_pretplate`, `naziv`, `cijena`) VALUES
(1, 'Besplatna', 0.00),
(2, 'Premium', 9.99);

-- --------------------------------------------------------

--
-- Table structure for table `zanr`
--

CREATE TABLE `zanr` (
  `id_zanra` int(11) NOT NULL,
  `naziv` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `zanr`
--

INSERT INTO `zanr` (`id_zanra`, `naziv`) VALUES
(1, 'Pop'),
(2, 'Rock'),
(3, 'Hip-Hop'),
(4, 'Jazz');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id_albuma`),
  ADD KEY `id_izvodjaca` (`id_izvodjaca`);

--
-- Indexes for table `izvodjac`
--
ALTER TABLE `izvodjac`
  ADD PRIMARY KEY (`id_izvodjaca`);

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`id_korisnika`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_pretplate` (`id_pretplate`);

--
-- Indexes for table `pjesma`
--
ALTER TABLE `pjesma`
  ADD PRIMARY KEY (`id_pjesme`),
  ADD KEY `id_albuma` (`id_albuma`),
  ADD KEY `id_zanra` (`id_zanra`);

--
-- Indexes for table `playlista`
--
ALTER TABLE `playlista`
  ADD PRIMARY KEY (`id_playliste`),
  ADD KEY `id_korisnika` (`id_korisnika`);

--
-- Indexes for table `pretplata`
--
ALTER TABLE `pretplata`
  ADD PRIMARY KEY (`id_pretplate`);

--
-- Indexes for table `zanr`
--
ALTER TABLE `zanr`
  ADD PRIMARY KEY (`id_zanra`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `album`
--
ALTER TABLE `album`
  MODIFY `id_albuma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `izvodjac`
--
ALTER TABLE `izvodjac`
  MODIFY `id_izvodjaca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `id_korisnika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pjesma`
--
ALTER TABLE `pjesma`
  MODIFY `id_pjesme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `playlista`
--
ALTER TABLE `playlista`
  MODIFY `id_playliste` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pretplata`
--
ALTER TABLE `pretplata`
  MODIFY `id_pretplate` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `zanr`
--
ALTER TABLE `zanr`
  MODIFY `id_zanra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`id_izvodjaca`) REFERENCES `izvodjac` (`id_izvodjaca`) ON DELETE SET NULL;

--
-- Constraints for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD CONSTRAINT `korisnik_ibfk_1` FOREIGN KEY (`id_pretplate`) REFERENCES `pretplata` (`id_pretplate`) ON DELETE SET NULL;

--
-- Constraints for table `pjesma`
--
ALTER TABLE `pjesma`
  ADD CONSTRAINT `pjesma_ibfk_1` FOREIGN KEY (`id_albuma`) REFERENCES `album` (`id_albuma`) ON DELETE CASCADE,
  ADD CONSTRAINT `pjesma_ibfk_2` FOREIGN KEY (`id_zanra`) REFERENCES `zanr` (`id_zanra`) ON DELETE SET NULL;

--
-- Constraints for table `playlista`
--
ALTER TABLE `playlista`
  ADD CONSTRAINT `playlista_ibfk_1` FOREIGN KEY (`id_korisnika`) REFERENCES `korisnik` (`id_korisnika`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
