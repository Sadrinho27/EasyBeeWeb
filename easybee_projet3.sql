-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 03 mai 2025 à 13:07
-- Version du serveur : 9.1.0
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `easybee_projet3`
--
CREATE DATABASE IF NOT EXISTS `easybee_projet3` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `easybee_projet3`;

-- --------------------------------------------------------

--
-- Structure de la table `associer`
--

DROP TABLE IF EXISTS `associer`;
CREATE TABLE IF NOT EXISTS `associer` (
  `idForm` int NOT NULL,
  `idTheme` int NOT NULL,
  PRIMARY KEY (`idForm`,`idTheme`),
  KEY `fk_associer_theme` (`idTheme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `attribuer`
--

DROP TABLE IF EXISTS `attribuer`;
CREATE TABLE IF NOT EXISTS `attribuer` (
  `idForm` int NOT NULL,
  `idFormateur` int NOT NULL,
  PRIMARY KEY (`idForm`,`idFormateur`),
  KEY `fk_attribuer_formateur` (`idFormateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nomClient` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `prenomClient` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `emailClient` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mdpClient` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_email` (`emailClient`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id`, `nomClient`, `prenomClient`, `emailClient`, `mdpClient`) VALUES
(6, 'Demeillez Tabere', 'Titouan', 'titouan.tabere@gmail.com', '$2y$10$nj8ZNbW.dMEI1fX3CJ9rru2QKabxCS4ZFc7EnNnPN3tjTFD1.V4X.');

-- --------------------------------------------------------

--
-- Structure de la table `correspond`
--

DROP TABLE IF EXISTS `correspond`;
CREATE TABLE IF NOT EXISTS `correspond` (
  `idForm` int NOT NULL,
  `idNiv` int NOT NULL,
  PRIMARY KEY (`idForm`,`idNiv`),
  KEY `fk_correspond_niv` (`idNiv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `equipement_form`
--

DROP TABLE IF EXISTS `equipement_form`;
CREATE TABLE IF NOT EXISTS `equipement_form` (
  `id` int NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `formateurs`
--

DROP TABLE IF EXISTS `formateurs`;
CREATE TABLE IF NOT EXISTS `formateurs` (
  `id` int NOT NULL,
  `nomFormateur` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `prenomFormateur` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mailFormateur` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `telFormateur` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `formations`
--

DROP TABLE IF EXISTS `formations`;
CREATE TABLE IF NOT EXISTS `formations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titreFormation` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `descriptionFormation` text COLLATE utf8mb4_general_ci,
  `prixFormation` decimal(10,2) DEFAULT NULL,
  `dateDebutForm` date DEFAULT NULL,
  `dtFinForm` date DEFAULT NULL,
  `placeMaxForm` int DEFAULT NULL,
  `idModalité` int DEFAULT NULL,
  `idLieu` int DEFAULT NULL,
  `idNiv` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_modalite` (`idModalité`),
  KEY `fk_lieu` (`idLieu`),
  KEY `fk_niveau` (`idNiv`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `formations`
--

INSERT INTO `formations` (`id`, `titreFormation`, `descriptionFormation`, `prixFormation`, `dateDebutForm`, `dtFinForm`, `placeMaxForm`, `idModalité`, `idLieu`, `idNiv`) VALUES
(1, 'Capture d\'abeilles\n', 'Capturer les abeilles', 20.00, '2025-03-02', '2025-03-08', 20, 1, 1, 1),
(2, 'Tuer Abeille', 'Tuer les abeilles', 60.00, '2025-03-02', '2025-03-08', 10, 1, 4, 2),
(6, 'Initiation à l’Apiculture', 'Formation pour débutants souhaitant apprendre les bases de l’élevage des abeilles et la gestion d’une ruche.', 150.00, '2025-04-10', '2025-04-12', 15, 1, 1, 1),
(7, 'Perfectionnement en Apiculture', 'Approfondissement des connaissances en élevage apicole, gestion des maladies et optimisation de la production de miel.', 300.00, '2025-05-20', '2025-05-25', 12, 1, 2, 2),
(8, 'Production et Commercialisation du Miel', 'Formation pour apprendre les techniques avancées de production du miel et les stratégies de vente.', 500.00, '2025-06-15', '2025-06-20', 10, 3, 3, 2),
(9, 'test', 'test de formations', 60.00, '2025-03-02', '2025-03-08', 10, 3, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `inscrire`
--

DROP TABLE IF EXISTS `inscrire`;
CREATE TABLE IF NOT EXISTS `inscrire` (
  `idUtilisateur` int NOT NULL,
  `idForm` int NOT NULL,
  `etatInscription` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dateInscription` date DEFAULT NULL,
  `montantRegle` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idUtilisateur`,`idForm`),
  KEY `fk_inscrire_form` (`idForm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `inscrire`
--

INSERT INTO `inscrire` (`idUtilisateur`, `idForm`, `etatInscription`, `dateInscription`, `montantRegle`) VALUES
(6, 1, 'En attente', '2025-05-03', 20.00),
(6, 6, 'En attente', '2025-05-03', 150.00),
(6, 8, 'En attente', '2025-05-03', 500.00);

-- --------------------------------------------------------

--
-- Structure de la table `lieu_form`
--

DROP TABLE IF EXISTS `lieu_form`;
CREATE TABLE IF NOT EXISTS `lieu_form` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `lieu_form`
--

INSERT INTO `lieu_form` (`id`, `libelle`) VALUES
(1, 'Paris'),
(2, 'Lyon'),
(3, 'Marseille'),
(4, 'Bordeaux'),
(5, 'Toulouse');

-- --------------------------------------------------------

--
-- Structure de la table `modalite_form`
--

DROP TABLE IF EXISTS `modalite_form`;
CREATE TABLE IF NOT EXISTS `modalite_form` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `modalite_form`
--

INSERT INTO `modalite_form` (`id`, `libelle`) VALUES
(1, 'Présentiel'),
(2, 'Distanciel'),
(3, 'Hybride');

-- --------------------------------------------------------

--
-- Structure de la table `necessaire`
--

DROP TABLE IF EXISTS `necessaire`;
CREATE TABLE IF NOT EXISTS `necessaire` (
  `idForm` int NOT NULL,
  `idEquipement` int NOT NULL,
  PRIMARY KEY (`idForm`,`idEquipement`),
  KEY `fk_necessaire_equipement` (`idEquipement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `niveau_form`
--

DROP TABLE IF EXISTS `niveau_form`;
CREATE TABLE IF NOT EXISTS `niveau_form` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `niveau_form`
--

INSERT INTO `niveau_form` (`id`, `libelle`) VALUES
(1, 'débutant'),
(2, 'pro');

-- --------------------------------------------------------

--
-- Structure de la table `prerequis`
--

DROP TABLE IF EXISTS `prerequis`;
CREATE TABLE IF NOT EXISTS `prerequis` (
  `idForm` int NOT NULL,
  `idFormReq` int NOT NULL,
  PRIMARY KEY (`idForm`,`idFormReq`),
  KEY `fk_prerequis_formreq` (`idFormReq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `situer`
--

DROP TABLE IF EXISTS `situer`;
CREATE TABLE IF NOT EXISTS `situer` (
  `idForm` int NOT NULL,
  `idLieu` int NOT NULL,
  PRIMARY KEY (`idForm`,`idLieu`),
  KEY `fk_situer_lieu` (`idLieu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `theme`
--

DROP TABLE IF EXISTS `theme`;
CREATE TABLE IF NOT EXISTS `theme` (
  `id` int NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `associer`
--
ALTER TABLE `associer`
  ADD CONSTRAINT `fk_associer_form` FOREIGN KEY (`idForm`) REFERENCES `formations` (`id`),
  ADD CONSTRAINT `fk_associer_theme` FOREIGN KEY (`idTheme`) REFERENCES `theme` (`id`);

--
-- Contraintes pour la table `attribuer`
--
ALTER TABLE `attribuer`
  ADD CONSTRAINT `fk_attribuer_form` FOREIGN KEY (`idForm`) REFERENCES `formations` (`id`),
  ADD CONSTRAINT `fk_attribuer_formateur` FOREIGN KEY (`idFormateur`) REFERENCES `formateurs` (`id`);

--
-- Contraintes pour la table `correspond`
--
ALTER TABLE `correspond`
  ADD CONSTRAINT `fk_correspond_form` FOREIGN KEY (`idForm`) REFERENCES `formations` (`id`),
  ADD CONSTRAINT `fk_correspond_niv` FOREIGN KEY (`idNiv`) REFERENCES `niveau_form` (`id`);

--
-- Contraintes pour la table `formations`
--
ALTER TABLE `formations`
  ADD CONSTRAINT `fk_lieu` FOREIGN KEY (`idLieu`) REFERENCES `lieu_form` (`id`),
  ADD CONSTRAINT `fk_modalite` FOREIGN KEY (`idModalité`) REFERENCES `modalite_form` (`id`),
  ADD CONSTRAINT `fk_niveau` FOREIGN KEY (`idNiv`) REFERENCES `niveau_form` (`id`);

--
-- Contraintes pour la table `inscrire`
--
ALTER TABLE `inscrire`
  ADD CONSTRAINT `fk_inscrire_form` FOREIGN KEY (`idForm`) REFERENCES `formations` (`id`),
  ADD CONSTRAINT `fk_inscrire_utilisateur` FOREIGN KEY (`idUtilisateur`) REFERENCES `clients` (`id`);

--
-- Contraintes pour la table `necessaire`
--
ALTER TABLE `necessaire`
  ADD CONSTRAINT `fk_necessaire_equipement` FOREIGN KEY (`idEquipement`) REFERENCES `equipement_form` (`id`),
  ADD CONSTRAINT `fk_necessaire_form` FOREIGN KEY (`idForm`) REFERENCES `formations` (`id`);

--
-- Contraintes pour la table `prerequis`
--
ALTER TABLE `prerequis`
  ADD CONSTRAINT `fk_prerequis_form` FOREIGN KEY (`idForm`) REFERENCES `formations` (`id`),
  ADD CONSTRAINT `fk_prerequis_formreq` FOREIGN KEY (`idFormReq`) REFERENCES `formations` (`id`);

--
-- Contraintes pour la table `situer`
--
ALTER TABLE `situer`
  ADD CONSTRAINT `fk_situer_form` FOREIGN KEY (`idForm`) REFERENCES `formations` (`id`),
  ADD CONSTRAINT `fk_situer_lieu` FOREIGN KEY (`idLieu`) REFERENCES `lieu_form` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
