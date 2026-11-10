Communication Java - SGBD (MariaDB) - SAÉ 3.02

Auteur principal : Danial

Projet : Application de quiz sur l'hygiène informatique et la cybersécurité

---

1. Objectif

Établir une connexion entre un programme Java et la base de données MariaDB à l'aide du connecteur JDBC (Java Database Connectivity).

Le test consiste à récupérer et afficher les thèmes enregistrés dans la base de données "quiz".

---

2. Environnement utilisé

Outil| Description
Machine virtuelle Linux| Environnement d'exécution
Java JDK| Compilation et exécution du programme
MariaDB| Système de gestion de base de données
JDBC| Connecteur entre Java et MariaDB
"TestBDD.java"| Programme de test
"quiz"| Base de données du projet

---

3. Installation du connecteur JDBC

Téléchargement du connecteur MariaDB à l'aide de "wget" :

wget https://repo.maven.apache.org/maven2/org/mariadb/jdbc/mariadb-java-client/3.5.7/mariadb-java-client-3.5.7.jar

Le connecteur permet au programme Java d'envoyer des requêtes SQL au serveur MariaDB.

---

4. Programme Java

Création du fichier "TestBDD.java" pour vérifier la connexion à la base de données.

Paramètres de connexion

Paramètre| Valeur| Description
URL| "jdbc:mariadb://localhost:3306/quiz"| Adresse du serveur MariaDB
Utilisateur| "quiz_app" (exemple)| Compte MariaDB autorisé
Mot de passe| Non publié| Mot de passe du compte
Table| "theme"| Table utilisée pour le test

Requête SQL utilisée

SELECT idTheme, nomTheme FROM theme ORDER BY ordre;

Cette requête permet de récupérer les identifiants et les noms des thèmes enregistrés dans la base de données.

---

5. Compilation et exécution

Compilation

javac -cp mariadb-java-client-3.5.7.jar TestBDD.java

Exécution

java -cp .:mariadb-java-client-3.5.7.jar TestBDD

L'option "-cp" permet d'indiquer le chemin du connecteur JDBC nécessaire à l'exécution du programme.

---

6. Résultat du test

Résultat attendu

Connexion réussie !
1 - Architecture d'Internet
2 - Cyberattaques
3 - Mots de passe
4 - Sécurité du matériel
5 - Sécurité en ligne
6 - Sécurité des données
7 - Courrier électronique

Résultat obtenu : À confirmer avec la sortie réelle du programme.

---

7. Conclusion

Ce test permet de vérifier la communication entre Java et MariaDB à l'aide de JDBC.

La connexion pourra ensuite être intégrée dans la classe "BDD" du programme Java afin de permettre l'ajout, la modification et la suppression des questions et réponses du quiz.