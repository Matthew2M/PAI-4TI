-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 01 Gru 2020, 14:47
-- Wersja serwera: 10.4.11-MariaDB
-- Wersja PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `wypozyczalniadvd`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `filmy`
--

CREATE TABLE `filmy` (
  `idplyty` int(11) NOT NULL,
  `tytul` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `rezyser` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `rok` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `gatunek` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `cena` decimal(9,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `filmy`
--

INSERT INTO `filmy` (`idplyty`, `tytul`, `rezyser`, `rok`, `gatunek`, `cena`) VALUES
(2, 'Pulp Fiction', 'Quentin Tarantino', '1994', 'Kryminał/Dramat', '23.99'),
(3, 'Nie słuchaj ich', 'Ángel Gómez Hernández', '2020', 'Horror', '50.99');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klient`
--

CREATE TABLE `klient` (
  `idklient` int(11) NOT NULL,
  `imie` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `nazwisko` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `nrtel` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `klient`
--

INSERT INTO `klient` (`idklient`, `imie`, `nazwisko`, `nrtel`) VALUES
(1, 'eryk', 'taki', '664234231'),
(2, 'Mateusz', 'Głowa', '564234231');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `idpracownik` int(11) NOT NULL,
  `imie` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `nazwisko` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `nrtel` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `stanowisko` varchar(50) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `pracownicy`
--

INSERT INTO `pracownicy` (`idpracownik`, `imie`, `nazwisko`, `nrtel`, `stanowisko`) VALUES
(1, 'Jakub', 'Mądry', '543231234', 'Kierownik'),
(2, 'Mariusz', 'Prędki', '231234342', 'Kasjer');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wypozyczenia`
--

CREATE TABLE `wypozyczenia` (
  `nr_zamowienia` int(11) NOT NULL,
  `idklient` int(11) DEFAULT NULL,
  `iddvd` int(11) DEFAULT NULL,
  `idpracownik` int(11) NOT NULL,
  `data_wypozyczenia` date DEFAULT NULL,
  `data_oddania` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `wypozyczenia`
--

INSERT INTO `wypozyczenia` (`nr_zamowienia`, `idklient`, `iddvd`, `idpracownik`, `data_wypozyczenia`, `data_oddania`) VALUES
(1, 1, 2, 1, '2020-12-16', '2020-12-23'),
(2, 1, 3, 2, '2021-01-13', '2021-02-17'),
(3, 2, 3, 1, '2021-03-10', '2021-03-24');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `filmy`
--
ALTER TABLE `filmy`
  ADD PRIMARY KEY (`idplyty`);

--
-- Indeksy dla tabeli `klient`
--
ALTER TABLE `klient`
  ADD PRIMARY KEY (`idklient`);

--
-- Indeksy dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`idpracownik`);

--
-- Indeksy dla tabeli `wypozyczenia`
--
ALTER TABLE `wypozyczenia`
  ADD PRIMARY KEY (`nr_zamowienia`),
  ADD KEY `idklient` (`idklient`),
  ADD KEY `iddvd` (`iddvd`),
  ADD KEY `idpracownik` (`idpracownik`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `filmy`
--
ALTER TABLE `filmy`
  MODIFY `idplyty` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `klient`
--
ALTER TABLE `klient`
  MODIFY `idklient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  MODIFY `idpracownik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `wypozyczenia`
--
ALTER TABLE `wypozyczenia`
  MODIFY `nr_zamowienia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `wypozyczenia`
--
ALTER TABLE `wypozyczenia`
  ADD CONSTRAINT `wypozyczenia_ibfk_1` FOREIGN KEY (`idklient`) REFERENCES `klient` (`idklient`),
  ADD CONSTRAINT `wypozyczenia_ibfk_2` FOREIGN KEY (`iddvd`) REFERENCES `filmy` (`idplyty`),
  ADD CONSTRAINT `wypozyczenia_ibfk_3` FOREIGN KEY (`idpracownik`) REFERENCES `pracownicy` (`idpracownik`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
