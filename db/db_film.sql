


CREATE TABLE `actor` (
  `id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `birthday_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Dati della tabella actor


INSERT INTO `actor` (`id`, `name`, `last_name`, `birthday_date`) VALUES
(1, 'Matthew ', 'McConaughey', '1969-11-04'),
(2, 'Jessica ', 'Chastain', '1977-03-24'),
(3, 'Anne ', 'Hathaway', '1982-11-12'),
(4, 'Timothée ', 'Chalamet', '1995-12-27'),
(5, 'Mackenzie ', 'Foy', '2000-12-10'),
(6, 'Matt ', 'Damon', '1970-10-08'),
(7, 'Michael ', 'Caine', '1933-03-14'),
(8, 'Casey ', 'Affleck', '1975-08-12'),
(9, 'Scarlett ', 'Johansson', '1984-11-22'),
(10, 'Jeremy', 'Renner', '1971-01-07'),
(11, 'Chris', 'Evans', '1981-06-13'),
(12, 'Mark', 'Ruffalo', '1967-11-22'),
(13, 'Cobie ', 'Smulders', '1982-04-03'),
(14, 'Robert', 'Downey Jr.', '1965-04-04'),
(15, 'Chris', 'Hemsworth', '1983-08-11'),
(17, 'Tom', 'Hiddleston', '1981-02-09'),
(18, 'Samuel', 'L. Jackson', '1948-12-21'),
(19, 'Clark', 'Gregg', '1962-04-02'),
(20, 'Paul', 'Rudd', '1969-04-06'),


--
-- Struttura tabella director
--

CREATE TABLE `director` (
  `id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `birthday_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Dati della tabella director


INSERT INTO `director` (`id`, `name`, `last_name`, `birthday_date`) VALUES
(1, 'Christopher ', 'Nolan', '1970-07-30'),
(2, 'Joss', 'Whedon', '1964-06-23'),
(3, 'George ', 'Lucas', '1944-05-14');



-- Struttura della tabella genre


CREATE TABLE `genre` (
  `id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Dump dei dati per la tabella `genre`


INSERT INTO `genre` (`id`, `name`, `slug`) VALUES
(1, 'Adventure', NULL),
(2, 'Sci-fi', NULL),
(3, 'Action', NULL),
(4, 'Fantastic Cinema', NULL),
(5, 'Family', NULL);


-- Struttura della tabella `movie`


CREATE TABLE `movie` (
  `id` int NOT NULL,
  `synopsis` text COLLATE utf8mb4_general_ci,
  `title` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `duration` int NOT NULL,
  `released_year` year NOT NULL,
  `poster` varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Dump dei dati per la tabella movie


INSERT INTO `movie` (`id`, `synopsis`, `title`, `duration`, `released_year`, `poster`) VALUES
(1, 'Un gruppo di scienziati appartenenti un tempo alla NASA, sfruttando un "wormhole" per superare le limitazioni fisiche del viaggio spaziale e coprire le immense distanze del viaggio interstellare, organizza una serie di missioni spaziali alla ricerca di un pianeta abitabile.', 'Interstellar', 169, '2014', 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTKNvN1d8BSJPWenCvCOx2oOTDYqBSzjLkuDplC6Iw89KZONqnk'),
(2, 'La comparsa di un pericoloso nemico minaccia la tranquillità e la sicurezza del mondo. Nick Fury, direttore dell agenzia internazionale per il mantenimento della pace (lo S.H.I.E.L.D.) inizia così un audace lavoro di reclutamento per creare una squadra speciale che salvi il pianeta dall orlo del disastro.', 'The Avengers', 143, '2012', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfj-Xxr1DlcuFjU4Nj0ZHm2rmEn0e7BBU0xQZzQedaWODnFw7Q'),
(3, 'La trama segue il maestro Jedi Qui-Gon Jinn e il suo apprendista Obi-Wan Kenobi mentre scortano e proteggono la regina Amidala, in viaggio dal pianeta Naboo al pianeta Coruscant ', 'Star Wars: Episode I - The Phantom Menace', 133, '1999', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiVeIJ--V37E_33dFxQ0ZvxghN2yJKDQcAZRDtEw4gz7oajGCa');



-- Struttura della tabella `movie_actor`


CREATE TABLE `movie_actor` (
  `movie_id` int NOT NULL,
  `actor_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Dump dei dati per la tabella movie_actor


INSERT INTO `movie_actor` (`movie_id`, `actor_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 15),
(2, 17),
(2, 18),
(2, 19),
(2, 20),




-- Struttura della tabella movie_director


CREATE TABLE `movie_director` (
  `movie_id` int NOT NULL,
  `director_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Dump dei dati per la tabella movie_director


INSERT INTO `movie_director` (`movie_id`, `director_id`) VALUES
(1, 1),
(2, 2),
(3, 3);


-- Struttura della tabella `movie_genre


CREATE TABLE `movie_genre` (
  `movie_id` int NOT NULL,
  `genre_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Dump dei dati per la tabella movie_genre


INSERT INTO `movie_genre` (`movie_id`, `genre_id`) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 2),
(3, 5);

-- Indici per le tabelle scaricate



-- Indici per le tabelle acto

ALTER TABLE `actor`
  ADD PRIMARY KEY (`id`);


-- Indici per le tabelle director

ALTER TABLE `director`
  ADD PRIMARY KEY (`id`);


-- Indici per le tabelle genre

ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);


-- Indici per le tabelle movie

ALTER TABLE `movie`
  ADD PRIMARY KEY (`id`);


-- Indici per le tabellemovie_actor

ALTER TABLE `movie_actor`
  ADD PRIMARY KEY (`movie_id`,`actor_id`),
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `actor_id` (`actor_id`);


-- Indici per le tabelle movie_director

ALTER TABLE `movie_director`
  ADD PRIMARY KEY (`movie_id`,`director_id`),
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `director_id` (`director_id`);


-- Indici per le tabelle movie_genre

ALTER TABLE `movie_genre`
  ADD PRIMARY KEY (`movie_id`,`genre_id`),
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `genre_id` (`genre_id`);


-- AUTO INCREMENT per le tabelle scaricate



ALTER TABLE `actor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;


ALTER TABLE `director`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;


ALTER TABLE `genre`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;


ALTER TABLE `movie`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `movie_actor`
  ADD CONSTRAINT `movie_actor_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
  ADD CONSTRAINT `movie_actor_ibfk_2` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`id`);


ALTER TABLE `movie_director`
  ADD CONSTRAINT `movie_director_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
  ADD CONSTRAINT `movie_director_ibfk_2` FOREIGN KEY (`director_id`) REFERENCES `director` (`id`);


ALTER TABLE `movie_genre`
  ADD CONSTRAINT `movie_genre_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
  ADD CONSTRAINT `movie_genre_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`);
COMMIT;

