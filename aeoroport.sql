-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  Dim 11 déc. 2022 à 12:28
-- Version du serveur :  5.7.17
-- Version de PHP :  5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `aeoroport`
--

-- --------------------------------------------------------

--
-- Structure de la table `avion`
--

CREATE TABLE `avion` (
  `num_immatricule` int(200) NOT NULL,
  `Date_achat` date DEFAULT NULL,
  `nom_type` varchar(500) NOT NULL,
  `id_propr` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `avion`
--

INSERT INTO `avion` (`num_immatricule`, `Date_achat`, `nom_type`, `id_propr`) VALUES
(1253, '2020-12-13', 'civile', 1),
(1425, '2018-12-01', 'drone', 2);

-- --------------------------------------------------------

--
-- Structure de la table `habiliation`
--

CREATE TABLE `habiliation` (
  `nom_type` varchar(500) COLLATE utf8_romanian_ci NOT NULL,
  `id_mec` mediumint(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_romanian_ci;

--
-- Déchargement des données de la table `habiliation`
--

INSERT INTO `habiliation` (`nom_type`, `id_mec`) VALUES
('civil', 1),
('drone', 1),
('drone', 4);

-- --------------------------------------------------------

--
-- Structure de la table `habilite`
--

CREATE TABLE `habilite` (
  `num_type` varchar(500) COLLATE utf8_romanian_ci NOT NULL,
  `id_pilote` mediumint(9) NOT NULL,
  `nbre_total_heures_vol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_romanian_ci;

--
-- Déchargement des données de la table `habilite`
--

INSERT INTO `habilite` (`num_type`, `id_pilote`, `nbre_total_heures_vol`) VALUES
('civil', 1, 6),
('civil', 8, 7),
('drone', 1, 6),
('drone', 2, 10),
('drone', 5, 2);

-- --------------------------------------------------------

--
-- Structure de la table `intervention_reparation`
--

CREATE TABLE `intervention_reparation` (
  `num_immatricule` int(200) NOT NULL,
  `id_mec` mediumint(100) NOT NULL,
  `objet` varchar(20) COLLATE utf8_romanian_ci NOT NULL,
  `date` date NOT NULL,
  `duree` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_romanian_ci;

--
-- Déchargement des données de la table `intervention_reparation`
--

INSERT INTO `intervention_reparation` (`num_immatricule`, `id_mec`, `objet`, `date`, `duree`) VALUES
(1253, 1, 'rep_fuite', '2022-01-19', 5),
(1425, 1, 'rep_panne', '2022-01-16', 6),
(1425, 4, 'rep_panne', '2021-04-05', 4),
(1425, 9, 'rep_fuite', '2022-01-23', 4);

-- --------------------------------------------------------

--
-- Structure de la table `intervention_verification`
--

CREATE TABLE `intervention_verification` (
  `num_immatricule` int(200) NOT NULL,
  `id_mec` mediumint(100) NOT NULL,
  `objet` varchar(20) COLLATE utf8_romanian_ci NOT NULL,
  `date` date NOT NULL,
  `duree` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_romanian_ci;

--
-- Déchargement des données de la table `intervention_verification`
--

INSERT INTO `intervention_verification` (`num_immatricule`, `id_mec`, `objet`, `date`, `duree`) VALUES
(1425, 1, 'verif_moteur', '2022-01-05', 2),
(1425, 1, 'verif_carburant', '2022-01-19', 8);

-- --------------------------------------------------------

--
-- Structure de la table `mecanicien`
--

CREATE TABLE `mecanicien` (
  `id_mec` mediumint(100) NOT NULL,
  `nom_mec` varchar(50) COLLATE utf8_romanian_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8_romanian_ci NOT NULL,
  `num_tel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_romanian_ci;

--
-- Déchargement des données de la table `mecanicien`
--

INSERT INTO `mecanicien` (`id_mec`, `nom_mec`, `adresse`, `num_tel`) VALUES
(1, 'ali', 'libya', 25416325),
(2, 'malek', 'mahdia', 14253695),
(3, 'said', 'jandouba', 55612586),
(4, 'firas', 'kef', 25413654),
(5, 'salah', 'tunis', 25523698),
(6, 'fedi', 'monastir', 50002314),
(7, 'mohamed', 'nabeul', 25147582),
(8, 'salem', 'tataouin', 58693254),
(9, 'chaima', 'hammamet', 45692365);

-- --------------------------------------------------------

--
-- Structure de la table `pilote`
--

CREATE TABLE `pilote` (
  `id_pilote` mediumint(9) NOT NULL,
  `nom_pilote` varchar(50) COLLATE utf8_romanian_ci NOT NULL,
  `n_brevet` varchar(255) COLLATE utf8_romanian_ci NOT NULL,
  `num_tel` int(11) NOT NULL,
  `adresse` varchar(100) COLLATE utf8_romanian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_romanian_ci;

--
-- Déchargement des données de la table `pilote`
--

INSERT INTO `pilote` (`id_pilote`, `nom_pilote`, `n_brevet`, `num_tel`, `adresse`) VALUES
(1, 'amin', 'ejjdcc', 21253647, 'susse'),
(2, 'arwa', 'jhkej', 20000000, 'jammel'),
(5, 'ahmed', 'jhjv', 22142586, 'berlin'),
(8, 'asma', 'kjknh', 52142036, 'france');

-- --------------------------------------------------------

--
-- Structure de la table `proprietaire`
--

CREATE TABLE `proprietaire` (
  `id_prop` int(11) NOT NULL,
  `nom_prop` varchar(500) NOT NULL,
  `num_tel` int(11) NOT NULL,
  `adresse` varchar(500) NOT NULL,
  `type` enum('particulier','societe') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `proprietaire`
--

INSERT INTO `proprietaire` (`id_prop`, `nom_prop`, `num_tel`, `adresse`, `type`) VALUES
(1, 'nouvelair', 25125364, 'sahloul', 'societe'),
(2, 'rashid al sheikh', 25361425, 'qatar', 'particulier');

-- --------------------------------------------------------

--
-- Structure de la table `type_av`
--

CREATE TABLE `type_av` (
  `nbre_de_places` tinyint(4) NOT NULL,
  `nom_type` varchar(500) COLLATE utf8_romanian_ci NOT NULL,
  `nom_constructeur` varchar(255) COLLATE utf8_romanian_ci NOT NULL,
  `puiss_moteur` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_romanian_ci;

--
-- Déchargement des données de la table `type_av`
--

INSERT INTO `type_av` (`nbre_de_places`, `nom_type`, `nom_constructeur`, `puiss_moteur`) VALUES
(50, 'civil', 'boeing', 150),
(5, 'drone', 'boeing', 300);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `avion`
--
ALTER TABLE `avion`
  ADD PRIMARY KEY (`num_immatricule`),
  ADD UNIQUE KEY `num_immatricule` (`num_immatricule`),
  ADD KEY `gvhv` (`id_propr`);

--
-- Index pour la table `habiliation`
--
ALTER TABLE `habiliation`
  ADD PRIMARY KEY (`nom_type`,`id_mec`),
  ADD KEY `ngh` (`id_mec`);

--
-- Index pour la table `habilite`
--
ALTER TABLE `habilite`
  ADD PRIMARY KEY (`num_type`,`id_pilote`),
  ADD KEY `pil` (`id_pilote`);

--
-- Index pour la table `intervention_reparation`
--
ALTER TABLE `intervention_reparation`
  ADD PRIMARY KEY (`num_immatricule`,`id_mec`,`date`),
  ADD KEY `mec` (`id_mec`);

--
-- Index pour la table `intervention_verification`
--
ALTER TABLE `intervention_verification`
  ADD PRIMARY KEY (`num_immatricule`,`id_mec`,`date`),
  ADD KEY `id` (`id_mec`);

--
-- Index pour la table `mecanicien`
--
ALTER TABLE `mecanicien`
  ADD PRIMARY KEY (`id_mec`),
  ADD UNIQUE KEY `id_mec` (`id_mec`),
  ADD UNIQUE KEY `num_tel` (`num_tel`);

--
-- Index pour la table `pilote`
--
ALTER TABLE `pilote`
  ADD PRIMARY KEY (`id_pilote`),
  ADD UNIQUE KEY `id_pilote_2` (`id_pilote`),
  ADD UNIQUE KEY `num_tel` (`num_tel`),
  ADD UNIQUE KEY `n_brevet` (`n_brevet`),
  ADD KEY `id_pilote` (`id_pilote`);

--
-- Index pour la table `proprietaire`
--
ALTER TABLE `proprietaire`
  ADD PRIMARY KEY (`id_prop`),
  ADD UNIQUE KEY `id_prop` (`id_prop`),
  ADD UNIQUE KEY `num_tel` (`num_tel`);

--
-- Index pour la table `type_av`
--
ALTER TABLE `type_av`
  ADD PRIMARY KEY (`nom_type`),
  ADD KEY `id_prop` (`nbre_de_places`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `avion`
--
ALTER TABLE `avion`
  ADD CONSTRAINT `gvhv` FOREIGN KEY (`id_propr`) REFERENCES `proprietaire` (`id_prop`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `habiliation`
--
ALTER TABLE `habiliation`
  ADD CONSTRAINT `ngh` FOREIGN KEY (`id_mec`) REFERENCES `mecanicien` (`id_mec`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nghjj` FOREIGN KEY (`nom_type`) REFERENCES `type_av` (`nom_type`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `habilite`
--
ALTER TABLE `habilite`
  ADD CONSTRAINT `num` FOREIGN KEY (`num_type`) REFERENCES `type_av` (`nom_type`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pil` FOREIGN KEY (`id_pilote`) REFERENCES `pilote` (`id_pilote`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `intervention_reparation`
--
ALTER TABLE `intervention_reparation`
  ADD CONSTRAINT `hjj` FOREIGN KEY (`num_immatricule`) REFERENCES `avion` (`num_immatricule`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mec` FOREIGN KEY (`id_mec`) REFERENCES `mecanicien` (`id_mec`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `intervention_verification`
--
ALTER TABLE `intervention_verification`
  ADD CONSTRAINT `id` FOREIGN KEY (`id_mec`) REFERENCES `mecanicien` (`id_mec`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jhnl` FOREIGN KEY (`num_immatricule`) REFERENCES `avion` (`num_immatricule`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
