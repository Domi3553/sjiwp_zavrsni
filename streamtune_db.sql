-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 02, 2026 at 11:49 AM
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
(1, 'Meow Back', 2024, 1),
(2, '1989', 2014, 2),
(3, 'Vrucina', 2020, 4),
(4, 'Budenje', 1994, 4),
(5, 'Afrika', 1995, 5),
(6, 'After Hours', 2020, 6),
(7, 'AM', 2013, 7),
(8, 'Future Nostalgia', 2020, 8),
(9, 'Appetite', 1987, 9),
(10, 'Unca Fibre', 2006, 10),
(11, 'Dvi tri rici', 2000, 11),
(12, 'Meteora', 2003, 12),
(13, 'Hit Me Hard', 2024, 13),
(14, 'Crno bijeli svijet', 1980, 14),
(15, 'Fine Line', 2019, 15),
(16, 'Knjiga zalbi', 2007, 16),
(17, 'Divide', 2017, 17),
(18, 'Duk u klubu', 2012, 18),
(19, 'Night at Opera', 1975, 19),
(20, 'Utopia', 2025, 20);

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
(1, 'Baby Lasagna', 'Eurovision 2024 star'),
(2, 'Taylor Swift', 'Pop icon'),
(4, 'Parni Valjak', 'Rock legends'),
(5, 'Dino Dvornik', 'Funk King'),
(6, 'The Weeknd', 'R&B Star'),
(7, 'Arctic Monkeys', 'Indie Rock'),
(8, 'Dua Lipa', 'Pop Star'),
(9, 'Guns N Roses', 'Rock Giants'),
(10, 'Gibonni', 'Singer-songwriter'),
(11, 'Oliver Dragojevic', 'Dalmatian Legend'),
(12, 'Linkin Park', 'Nu-metal kings'),
(13, 'Billie Eilish', 'Alt-pop star'),
(14, 'Prljavo Kazaliste', 'Rock legends'),
(15, 'Harry Styles', 'Pop star'),
(16, 'Hladno Pivo', 'Punk Rock'),
(17, 'Ed Sheeran', 'Singer-songwriter'),
(18, 'Severina', 'Regional pop star'),
(19, 'Queen', 'Rock icons'),
(20, 'Travis Scott', 'Trap star');

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
(1, 'Rim Tim Tagi Dim', '00:00:00', 1, 1),
(2, 'Shake It Off', '00:02:19', 2, 1),
(3, 'Ne moze', '00:02:05', 3, 3),
(4, 'Zastave', '00:03:00', 4, 2),
(5, 'Hipnotiziran', '00:02:25', 5, 4),
(6, 'Blinding Lights', '00:02:00', 6, 4),
(7, 'Do I Wanna Know', '00:00:00', 7, 2),
(8, 'Levitating', '00:02:03', 8, 1),
(9, 'Welcome Jungle', '00:00:00', 9, 8),
(10, 'Oprosti', '00:00:00', 10, 1),
(11, 'Cesarica', '00:00:00', 11, 1),
(12, 'Numb', '00:00:00', 12, 8),
(13, 'Birds of Feather', '00:02:10', 13, 1);

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
(3, 'Trap'),
(4, 'Electronic'),
(5, 'Classic'),
(6, 'Jazz'),
(7, 'Hip Hop'),
(8, 'Metal'),
(9, 'Soul'),
(10, 'Funk');

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
  MODIFY `id_albuma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `izvodjac`
--
ALTER TABLE `izvodjac`
  MODIFY `id_izvodjaca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `id_korisnika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pjesma`
--
ALTER TABLE `pjesma`
  MODIFY `id_pjesme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  MODIFY `id_zanra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
