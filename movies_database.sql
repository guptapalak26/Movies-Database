-- phpMyAdmin SQL Dump
-- version 5.2.1-1.el7.remi
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 19, 2024 at 11:59 PM
-- Server version: 8.0.40
-- PHP Version: 8.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gupt8243`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`gupt8243`@`%` PROCEDURE `markClassics` ()   UPDATE Movies
    SET Description = 'Classic'
    WHERE YEAR(CURDATE()) - YEAR(ReleaseDate) > 50$$

--
-- Functions
--
CREATE DEFINER=`gupt8243`@`%` FUNCTION `getTotalMovies` () RETURNS INT DETERMINISTIC RETURN(SELECT COUNT(*) FROM Movies)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Actors`
--

CREATE TABLE `Actors` (
  `actorId` int NOT NULL,
  `firstName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lastName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `birthDate` date DEFAULT NULL,
  `country` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'NA'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Actors`
--

INSERT INTO `Actors` (`actorId`, `firstName`, `lastName`, `birthDate`, `country`) VALUES
(1, 'Tim', 'Robbins', NULL, 'UK'),
(2, 'Marlon', 'Brando', NULL, 'USA'),
(3, 'Christian', 'Bale', '1988-04-27', 'UK'),
(4, 'John', 'Travolta', '1997-03-21', 'USA'),
(5, 'Elijah', 'Wood', '2002-11-06', 'USA');

-- --------------------------------------------------------

--
-- Table structure for table `Directors`
--

CREATE TABLE `Directors` (
  `directorId` int NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `birthDate` date DEFAULT NULL,
  `country` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'NA'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Directors`
--

INSERT INTO `Directors` (`directorId`, `firstName`, `lastName`, `birthDate`, `country`) VALUES
(1, 'Frank', 'Darabont', NULL, 'UK'),
(2, 'Francis', 'Coppola', '1987-06-09', 'USA'),
(3, 'Christopher', 'Nolan', NULL, 'USA'),
(4, 'Quentin', 'Tarantino', '1967-07-24', 'USA'),
(5, 'Peter', 'Jackson', NULL, 'UK');

-- --------------------------------------------------------

--
-- Table structure for table `Genres`
--

CREATE TABLE `Genres` (
  `genreID` int NOT NULL,
  `genreName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Genres`
--

INSERT INTO `Genres` (`genreID`, `genreName`) VALUES
(3, 'Action'),
(4, 'Comedy'),
(2, 'Crime'),
(1, 'Drama'),
(5, 'Fantasy'),
(6, 'Uncategorized');

-- --------------------------------------------------------

--
-- Table structure for table `MovieActors`
--

CREATE TABLE `MovieActors` (
  `movieId` int NOT NULL,
  `actorId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `MovieActors`
--

INSERT INTO `MovieActors` (`movieId`, `actorId`) VALUES
(3, 1),
(5, 1),
(6, 1),
(9, 1),
(12, 1),
(13, 1),
(1, 2),
(8, 2),
(9, 2),
(13, 2),
(14, 2),
(15, 2),
(1, 3),
(2, 3),
(5, 3),
(7, 3),
(10, 3),
(11, 3),
(15, 3),
(4, 4),
(8, 4),
(3, 5),
(5, 5),
(11, 5),
(14, 5);

-- --------------------------------------------------------

--
-- Table structure for table `MovieDirectors`
--

CREATE TABLE `MovieDirectors` (
  `movieID` int NOT NULL,
  `directorId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `MovieDirectors`
--

INSERT INTO `MovieDirectors` (`movieID`, `directorId`) VALUES
(1, 1),
(11, 1),
(12, 1),
(2, 2),
(6, 2),
(9, 2),
(3, 3),
(7, 3),
(14, 3),
(4, 4),
(10, 4),
(13, 4),
(5, 5),
(8, 5),
(15, 5);

-- --------------------------------------------------------

--
-- Table structure for table `Movies`
--

CREATE TABLE `Movies` (
  `movieId` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `releaseDate` date NOT NULL,
  `genreID` int NOT NULL,
  `rating` decimal(3,1) NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Movies`
--

INSERT INTO `Movies` (`movieId`, `title`, `releaseDate`, `genreID`, `rating`, `description`, `createdAt`) VALUES
(1, 'The Shawshank Redemption', '1994-09-22', 1, 9.3, 'Two imprisoned men bond over a number of years, finding solace and eventual redemption.', '2024-11-26 18:14:06'),
(2, 'The Godfather', '1972-03-24', 2, 9.2, 'The aging patriarch of an organized crime dynasty transfers control of his empire to his son.', '2024-11-26 18:14:06'),
(3, 'The Dark Knight	', '2008-07-18', 3, 9.8, 'When The Joker emerges, he wreaks havoc on the people of Gotham.', '2024-11-26 18:14:06'),
(4, 'Pulp Fiction', '1994-10-14', 4, 8.9, NULL, '2024-11-26 18:14:06'),
(5, 'The Lord of the Rings: The Return of the King	', '2003-12-17', 5, 8.9, 'Gandalf and Aragorn lead the World of Men against Sauron’s army.', '2024-11-26 18:14:06'),
(6, 'The Matrix', '1999-03-31', 6, 8.7, 'A hacker learns the true nature of his reality and his role in the war against its controllers.', '2024-11-26 18:14:06'),
(7, 'Forrest Gump', '1994-07-06', 1, 8.8, 'The presidencies of Kennedy and Johnson, the Vietnam War, and other events unfold from Gump\'s life.', '2024-11-26 18:14:06'),
(8, 'Inception', '2010-07-16', 3, 8.8, 'A thief who steals secrets through dream-sharing technology is given the task of planting an idea.	', '2024-11-26 18:14:06'),
(9, 'Star Wars: A New Hope	', '1977-05-25', 1, 8.6, 'Luke Skywalker joins forces with others to rescue Princess Leia from the evil Empire.	', '2024-11-26 18:14:06'),
(10, 'The Silence of the Lambs	', '1991-02-14', 2, 7.0, 'A young FBI cadet seeks the help of a cannibal to catch another serial killer.	', '2024-11-26 18:14:06'),
(11, 'Schindler\'s List', '1993-12-15', 2, 8.5, 'Oskar Schindler saves Jewish lives during the Holocaust.	', '2024-11-26 18:14:06'),
(12, 'Fight Club', '1999-10-15', 4, 8.8, 'An insomniac office worker forms an underground fight club.', '2024-11-26 18:14:06'),
(13, 'The Lion King', '1994-06-24', 5, 9.5, 'Lion prince Simba and his father are targeted by his uncle, who wants to take the throne.', '2024-11-26 18:14:06'),
(14, 'Gladiator', '2000-05-05', 3, 8.7, 'A former general seeks revenge against the emperor who betrayed him.	', '2024-11-26 18:14:06'),
(15, 'The Prestige', '2006-10-20', 3, 8.5, 'Two magicians engage in a bitter rivalry, trying to best each other with ingenious illusions.', '2024-11-26 18:14:06');

--
-- Triggers `Movies`
--
DELIMITER $$
CREATE TRIGGER `checkMovieRating` BEFORE INSERT ON `Movies` FOR EACH ROW BEGIN
    IF NEW.Rating < 0.0 OR NEW.Rating > 10.0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Rating must be between 0.0 and 10.0';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `vMoviesActors`
-- (See below for the actual view)
--
CREATE TABLE `vMoviesActors` (
`movieId` int
,`title` varchar(255)
,`releaseDate` date
,`actorId` int
,`firstName` varchar(255)
,`lastName` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vMoviesDirectorsGenres`
-- (See below for the actual view)
--
CREATE TABLE `vMoviesDirectorsGenres` (
`movieId` int
,`title` varchar(255)
,`releaseDate` date
,`rating` decimal(3,1)
,`genreName` varchar(100)
,`firstName` varchar(255)
,`lastName` varchar(255)
);

-- --------------------------------------------------------

--
-- Structure for view `vMoviesActors`
--
DROP TABLE IF EXISTS `vMoviesActors`;

CREATE ALGORITHM=UNDEFINED DEFINER=`gupt8243`@`%` SQL SECURITY DEFINER VIEW `vMoviesActors` (`movieId`, `title`, `releaseDate`, `actorId`, `firstName`, `lastName`) AS   select `m`.`movieId` AS `movieId`,`m`.`title` AS `title`,`m`.`releaseDate` AS `releaseDate`,`a`.`actorId` AS `actorId`,`a`.`firstName` AS `firstName`,`a`.`lastName` AS `lastName` from ((`Movies` `m` join `MovieActors` `ma` on((`m`.`movieId` = `ma`.`movieId`))) join `Actors` `a` on((`ma`.`actorId` = `a`.`actorId`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `vMoviesDirectorsGenres`
--
DROP TABLE IF EXISTS `vMoviesDirectorsGenres`;

CREATE ALGORITHM=UNDEFINED DEFINER=`gupt8243`@`%` SQL SECURITY DEFINER VIEW `vMoviesDirectorsGenres` (`movieId`, `title`, `releaseDate`, `rating`, `genreName`, `firstName`, `lastName`) AS   select `m`.`movieId` AS `movieId`,`m`.`title` AS `MovieTitle`,`m`.`releaseDate` AS `releaseDate`,`m`.`rating` AS `rating`,`g`.`genreName` AS `genreName`,`d`.`firstName` AS `firstName`,`d`.`lastName` AS `lastName` from (((`Movies` `m` join `Genres` `g` on((`m`.`genreID` = `g`.`genreID`))) join `MovieDirectors` `md` on((`m`.`movieId` = `md`.`movieID`))) join `Directors` `d` on((`md`.`directorId` = `d`.`directorId`)))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Actors`
--
ALTER TABLE `Actors`
  ADD PRIMARY KEY (`actorId`),
  ADD UNIQUE KEY `firstName` (`firstName`,`lastName`);

--
-- Indexes for table `Directors`
--
ALTER TABLE `Directors`
  ADD PRIMARY KEY (`directorId`),
  ADD UNIQUE KEY `firstName` (`firstName`,`lastName`);

--
-- Indexes for table `Genres`
--
ALTER TABLE `Genres`
  ADD PRIMARY KEY (`genreID`),
  ADD UNIQUE KEY `genreName` (`genreName`);

--
-- Indexes for table `MovieActors`
--
ALTER TABLE `MovieActors`
  ADD PRIMARY KEY (`movieId`,`actorId`),
  ADD KEY `actorId_fk` (`actorId`);

--
-- Indexes for table `MovieDirectors`
--
ALTER TABLE `MovieDirectors`
  ADD PRIMARY KEY (`movieID`,`directorId`),
  ADD KEY `directorId_fk` (`directorId`);

--
-- Indexes for table `Movies`
--
ALTER TABLE `Movies`
  ADD PRIMARY KEY (`movieId`),
  ADD KEY `genreId_fk` (`genreID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Actors`
--
ALTER TABLE `Actors`
  MODIFY `actorId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Directors`
--
ALTER TABLE `Directors`
  MODIFY `directorId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Genres`
--
ALTER TABLE `Genres`
  MODIFY `genreID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Movies`
--
ALTER TABLE `Movies`
  MODIFY `movieId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `MovieActors`
--
ALTER TABLE `MovieActors`
  ADD CONSTRAINT `actorId_fk` FOREIGN KEY (`actorId`) REFERENCES `Actors` (`actorId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `movieId_fk` FOREIGN KEY (`movieId`) REFERENCES `Movies` (`movieId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `MovieDirectors`
--
ALTER TABLE `MovieDirectors`
  ADD CONSTRAINT `directorId_fk` FOREIGN KEY (`directorId`) REFERENCES `Directors` (`directorId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `movieIdDirector_fk` FOREIGN KEY (`movieID`) REFERENCES `Movies` (`movieId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Movies`
--
ALTER TABLE `Movies`
  ADD CONSTRAINT `genreId_fk` FOREIGN KEY (`genreID`) REFERENCES `Genres` (`genreID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`gupt8243`@`%` EVENT `deleteOldMovies` ON SCHEDULE AT '2025-01-01 17:17:32' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    DELETE FROM Movies
    WHERE releaseDate < CURDATE() - INTERVAL 50 YEAR;
END$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
