-- Ces commandes ont été utilisées dans HeidiSQL sur un ordinateur personnel avant d'accéder à MariaDB sur une machine virtuelle.

USE quiz;

DROP TABLE IF EXISTS reponse;
DROP TABLE IF EXISTS question;
DROP TABLE IF EXISTS theme;

CREATE TABLE theme (
  idTheme INT AUTO_INCREMENT PRIMARY KEY,
  ordre TINYINT NOT NULL UNIQUE,
  nomTheme VARCHAR(100) NOT NULL UNIQUE
) DEFAULT CHARSET=utf8mb4;

CREATE TABLE question (
  idQuestion INT AUTO_INCREMENT PRIMARY KEY,
  typeQuestion VARCHAR(50) NOT NULL,
  enonce TEXT NOT NULL,
  themeId INT NULL,
  niveau TINYINT NULL CHECK (niveau BETWEEN 1 AND 3),
  explication TEXT NULL,
  FOREIGN KEY (themeId) REFERENCES theme(idTheme) ON DELETE SET NULL
) DEFAULT CHARSET=utf8mb4;

CREATE TABLE reponse (
  idReponse INT AUTO_INCREMENT PRIMARY KEY,
  questionId INT NOT NULL,
  typeReponse VARCHAR(50) NOT NULL,
  contenu TEXT NOT NULL,
  valide BOOLEAN NOT NULL DEFAULT FALSE,
  FOREIGN KEY (questionId) REFERENCES question(idQuestion) ON DELETE CASCADE
) DEFAULT CHARSET=utf8mb4;

INSERT INTO theme (ordre, nomTheme) VALUES
(1, 'Architecture d''Internet'),
(2, 'Cyberattaques'),
(3, 'Mots de passe'),
(4, 'Sécurité du matériel'),
(5, 'Sécurité en ligne'),
(6, 'Sécurité des données'),
(7, 'Courrier électronique');
