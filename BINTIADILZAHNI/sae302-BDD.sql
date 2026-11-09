-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           13.0.2-MariaDB - MariaDB Server
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.20.0.7320
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour quiz
CREATE DATABASE IF NOT EXISTS `quiz` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `quiz`;

-- Listage de la structure de table quiz. question
DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `idQuestion` int(11) NOT NULL AUTO_INCREMENT,
  `typeQuestion` varchar(50) NOT NULL,
  `enonce` text NOT NULL,
  `themeId` int(11) DEFAULT NULL,
  `niveau` tinyint(4) DEFAULT NULL CHECK (`niveau` between 1 and 3),
  `explication` text DEFAULT NULL,
  PRIMARY KEY (`idQuestion`),
  KEY `themeId` (`themeId`),
  CONSTRAINT `1` FOREIGN KEY (`themeId`) REFERENCES `theme` (`idTheme`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table quiz.question : ~0 rows (environ)

-- Listage de la structure de table quiz. reponse
DROP TABLE IF EXISTS `reponse`;
CREATE TABLE IF NOT EXISTS `reponse` (
  `idReponse` int(11) NOT NULL AUTO_INCREMENT,
  `questionId` int(11) NOT NULL,
  `typeReponse` varchar(50) NOT NULL,
  `contenu` text NOT NULL,
  `valide` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idReponse`),
  KEY `questionId` (`questionId`),
  CONSTRAINT `1` FOREIGN KEY (`questionId`) REFERENCES `question` (`idQuestion`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table quiz.reponse : ~0 rows (environ)

-- Listage de la structure de table quiz. theme
DROP TABLE IF EXISTS `theme`;
CREATE TABLE IF NOT EXISTS `theme` (
  `idTheme` int(11) NOT NULL AUTO_INCREMENT,
  `ordre` tinyint(4) NOT NULL,
  `nomTheme` varchar(100) NOT NULL,
  PRIMARY KEY (`idTheme`),
  UNIQUE KEY `ordre` (`ordre`),
  UNIQUE KEY `nomTheme` (`nomTheme`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table quiz.theme : ~7 rows (environ)
INSERT INTO `theme` (`idTheme`, `ordre`, `nomTheme`) VALUES
	(1, 1, 'Architecture d\'Internet'),
	(2, 2, 'Cyberattaques'),
	(3, 3, 'Mots de passe'),
	(4, 4, 'Sécurité du matériel'),
	(5, 5, 'Sécurité en ligne'),
	(6, 6, 'Sécurité des données'),
	(7, 7, 'Courrier électronique');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
