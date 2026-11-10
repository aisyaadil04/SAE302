# Installation et fonctionnement de la base de données

**Auteur principal :** Aisya

Ce document décrit comment installer et utiliser la base de données du projet sur une machine Debian vierge (la VM du projet), dans l'ordre.
Aucun mot de passe réel n'est écrit dans ce fichier. Il faut remplacer `MDP`par le mot de passe choisi par le groupe.

---

## 1. Environnement
| Élément | Valeur |
|---------|--------|
|Système de la VM | Debian 13 |
| Adresse IP de la VM | 10.3.122.20 |
| Compte de connexion | rt |
| Base de données | MariaDB |
| Nom de la base | quiz |
| Utilisateur applicatif | `quiz_user` |

## 2. Installer MariaDB
```bash
sudo apt update
sudo apt install -y mariadb-server
systemctl status mariadb
```

Le service doit être `active (running)`.

## 3. Créer la base de données 
```bash
sudo mariadb -e "CREATE DATABASE quiz DEFAULT CHARACTER SET utf8mb4;"
```

Le jeu de caractères `utf8mb4` permet de stocker les accents et les caractères spéciaux des questions.

## 4. Importer le schéma
Le script `BINTIADILZAHNI/sae02-BDD.sql` crée les trois (`theme`, `question`, `reponse`) et insère les 7 thèmes. Il est copié depuis GitHub directement sur la VM :
1. Ouvrir FireFox sur la VM et aller sur le dépôt GitHub du projet
2. Ouvrir le fichier `BINTIADILZAHNI/sae02-BDD.sql` et cliquer sur Raw.
3. Sélectionner tout puis copier.
4. Dans le terminal, ourvir le client MariaDB : 
```bash
sudo mariadb
```
5. Coller le contenu. Les instructions du script s'exécutent les unes après les autres.
6. Quitter le client :
```bash
exit
```

## 5. Créer l'utilisateur applicatif
Le PHP et le programme Java ,'utilisent jamais le compte root. Ils utilisent `quiz_user`, qui n'a de droits que sur la base `quiz`.
```bash
sudo mariadb
```
```bash
CREATE USER 'quiz_user'@'localhost' IDENTIFIED BY 'MDP';
GRANT SELECT, INSERT, UPDATE, DELETE ON quiz.* TO 'quiz_user'@'localhost';
```
Remplacer `MDP` par un mot de passe long et unique. Ce mot de passe n'est jamais enregistré dans GitHub. Il est communiqué en privé aux membres qui en ont besoin.

## 6. Insérer des données de test
```bash
sudo mariadb quiz
```
```bash
INSERT INTO question (typeQuestion, enonce, themeId, niveau, explication) VALUES ('QCM', 'Quel mot de passe est le plus sûr?', 3, 1, 'Un mot de passe long et unique est plus difficile à deviner.');
SET @qid = LAST_INSERT_ID();
INSERT INTO reponse (questionId, typeReponse, contenu, valide) VALUES (@qid, 'texte', '123456', FALSE), (@qid, 'texte', 'Une phrase de passe longue et unique', TRUE);
```

## 7. Vérifier l'installation
Les 7 thèmes doivent apparaître :
```bash
sudo mariadb -e "SELECT * FROM quiz.theme;"
```

Les clés étrangères doivent être présentes :
```bash
sudo mariadb -e "SHOW CREATE TABLE quiz.reponse\G"
```

L'utilisateur applicatif doit pouvoir se connecter :
```bash
mariadb -u quizz_user -p quiz -e "SELECT * FROM theme;"
```





