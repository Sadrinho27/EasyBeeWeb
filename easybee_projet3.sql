-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 27 avr. 2025 à 12:44
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `formation`
--

-- --------------------------------------------------------

--
-- Structure de la table `associer`
--

CREATE TABLE `associer` (
  `idForm` int(11) NOT NULL,
  `idTheme` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `attribuer`
--

CREATE TABLE `attribuer` (
  `idForm` int(11) NOT NULL,
  `idFormateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `nomClient` varchar(255) DEFAULT NULL,
  `prenomClient` varchar(255) DEFAULT NULL,
  `emailClient` varchar(255) DEFAULT NULL,
  `mdpClient` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id`, `nomClient`, `prenomClient`, `emailClient`, `mdpClient`) VALUES
(1, 'Sarkozy', 'titouan', 'titouansarkozy@gmail.com', '$2y$10$S8.sp5DhqM4d7XetvuoQQupeFhwYxQZc4v8AqxDFTfGsKF8MwOd/K'),
(2, 'babouin', 'enzo', 'babouinenzo@gmail.com', '$2y$10$bP2PdiFju6gk2Sa07s0IEu8AtQd.CiLceZ0BLjAURatz/XUDZadtO'),
(3, 'etheh', 'egehe', 'erhrsh@gmail.com', '$2y$10$KO85A0emsfMQNAPf82QJXOzVKmsAG1v7XIFn8ZApmfveRY/UCkZ7m');

-- --------------------------------------------------------

--
-- Structure de la table `correspond`
--

CREATE TABLE `correspond` (
  `idForm` int(11) NOT NULL,
  `idNiv` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `equipement_form`
--

CREATE TABLE `equipement_form` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `formateurs`
--

CREATE TABLE `formateurs` (
  `id` int(11) NOT NULL,
  `nomFormateur` varchar(255) DEFAULT NULL,
  `prenomFormateur` varchar(255) DEFAULT NULL,
  `mailFormateur` varchar(255) DEFAULT NULL,
  `telFormateur` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `formations`
--

CREATE TABLE `formations` (
  `id` int(11) NOT NULL,
  `titreFormation` varchar(255) DEFAULT NULL,
  `descriptionFormation` text DEFAULT NULL,
  `prixFormation` decimal(10,2) DEFAULT NULL,
  `dateDebutForm` date DEFAULT NULL,
  `dtFinForm` date DEFAULT NULL,
  `placeMaxForm` int(11) DEFAULT NULL,
  `idModalité` int(11) DEFAULT NULL,
  `idLieu` int(11) DEFAULT NULL,
  `idNiv` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

CREATE TABLE `inscrire` (
  `idUtilisateur` int(11) NOT NULL,
  `idForm` int(11) NOT NULL,
  `etatInscription` varchar(50) DEFAULT NULL,
  `dateInscription` date DEFAULT NULL,
  `montantRegle` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `inscrire`
--

INSERT INTO `inscrire` (`idUtilisateur`, `idForm`, `etatInscription`, `dateInscription`, `montantRegle`) VALUES
(1, 1, 'En attente', '2025-04-27', 20.00);

-- --------------------------------------------------------

--
-- Structure de la table `lieu_form`
--

CREATE TABLE `lieu_form` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

CREATE TABLE `modalite_form` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

CREATE TABLE `necessaire` (
  `idForm` int(11) NOT NULL,
  `idEquipement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `niveau_form`
--

CREATE TABLE `niveau_form` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

CREATE TABLE `prerequis` (
  `idForm` int(11) NOT NULL,
  `idFormReq` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `situer`
--

CREATE TABLE `situer` (
  `idForm` int(11) NOT NULL,
  `idLieu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `theme`
--

CREATE TABLE `theme` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `associer`
--
ALTER TABLE `associer`
  ADD PRIMARY KEY (`idForm`,`idTheme`),
  ADD KEY `fk_associer_theme` (`idTheme`);

--
-- Index pour la table `attribuer`
--
ALTER TABLE `attribuer`
  ADD PRIMARY KEY (`idForm`,`idFormateur`),
  ADD KEY `fk_attribuer_formateur` (`idFormateur`);

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_email` (`emailClient`);

--
-- Index pour la table `correspond`
--
ALTER TABLE `correspond`
  ADD PRIMARY KEY (`idForm`,`idNiv`),
  ADD KEY `fk_correspond_niv` (`idNiv`);

--
-- Index pour la table `equipement_form`
--
ALTER TABLE `equipement_form`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `formateurs`
--
ALTER TABLE `formateurs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `formations`
--
ALTER TABLE `formations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_modalite` (`idModalité`),
  ADD KEY `fk_lieu` (`idLieu`),
  ADD KEY `fk_niveau` (`idNiv`);

--
-- Index pour la table `inscrire`
--
ALTER TABLE `inscrire`
  ADD PRIMARY KEY (`idUtilisateur`,`idForm`),
  ADD KEY `fk_inscrire_form` (`idForm`);

--
-- Index pour la table `lieu_form`
--
ALTER TABLE `lieu_form`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `modalite_form`
--
ALTER TABLE `modalite_form`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `necessaire`
--
ALTER TABLE `necessaire`
  ADD PRIMARY KEY (`idForm`,`idEquipement`),
  ADD KEY `fk_necessaire_equipement` (`idEquipement`);

--
-- Index pour la table `niveau_form`
--
ALTER TABLE `niveau_form`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `prerequis`
--
ALTER TABLE `prerequis`
  ADD PRIMARY KEY (`idForm`,`idFormReq`),
  ADD KEY `fk_prerequis_formreq` (`idFormReq`);

--
-- Index pour la table `situer`
--
ALTER TABLE `situer`
  ADD PRIMARY KEY (`idForm`,`idLieu`),
  ADD KEY `fk_situer_lieu` (`idLieu`);

--
-- Index pour la table `theme`
--
ALTER TABLE `theme`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `formations`
--
ALTER TABLE `formations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `lieu_form`
--
ALTER TABLE `lieu_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `modalite_form`
--
ALTER TABLE `modalite_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `niveau_form`
--
ALTER TABLE `niveau_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
