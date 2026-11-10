
# Communication Java - SGBD (MariaDB) - SAÉ 3.02

**Auteur principal :** Danial

**Projet :** Application de quiz sur l'hygiène informatique et la cybersécurité

---

## 1. Objectif

Établir une connexion entre un programme Java et une base de données MariaDB à l'aide du connecteur JDBC (*Java Database Connectivity*).

Le test consiste à récupérer et afficher les thèmes enregistrés dans la base de données `quiz`.

---

## 2. Environnement utilisé

| Outil | Description |
|---|---|
| Machine virtuelle Linux | Environnement d'exécution |
| Java JDK | Compilation et exécution du programme |
| MariaDB | Système de gestion de base de données |
| JDBC | Connecteur entre Java et MariaDB |
| `TestBDD.java` | Programme de test |
| `quiz` | Base de données du projet |

---

## 3. Installation du connecteur JDBC

Téléchargement du connecteur MariaDB à l'aide de `wget` :

```bash
wget https://repo.maven.apache.org/maven2/org/mariadb/jdbc/mariadb-java-client/3.5.7/mariadb-java-client-3.5.7.jar
```

Le connecteur permet au programme Java de communiquer avec MariaDB et d'exécuter des requêtes SQL.

---

## 4. Programme Java

Création d'un fichier `TestBDD.java` pour tester la connexion à la base de données.

### Paramètres de connexion

| Paramètre | Valeur | Description |
|---|---|---|
| URL | `jdbc:mariadb://localhost:3306/quiz` | Adresse du serveur MariaDB |
| Utilisateur | `quiz_user` | Compte MariaDB |
| Mot de passe | `bddmelayu` | Mot de passe du compte |
| Table | `theme` | Table utilisée pour le test |

### Code Java

```java
import java.sql.*;

public class TestBDD {
    public static void main(String[] args) {

        String url = "jdbc:mariadb://localhost:3306/quiz";
        String user = "quiz_user";
        String password = "bddmelayu";

        try (Connection conn =
                DriverManager.getConnection(url, user, password)) {

            System.out.println("Connexion réussie !");

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(
                "SELECT idTheme, nomTheme FROM theme ORDER BY ordre"
            );

            while (rs.next()) {
                System.out.println(
                    rs.getInt("idTheme") + " - " +
                    rs.getString("nomTheme")
                );
            }

            rs.close();
            stmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
```

---

## 5. Compilation et exécution

### Compilation

```bash
javac -cp mariadb-java-client-3.5.7.jar TestBDD.java
```

### Exécution

```bash
java -cp .:mariadb-java-client-3.5.7.jar TestBDD
```

L'option `-cp` permet de préciser le *classpath* contenant le connecteur JDBC.

---

## 6. Résultat du test

### Résultat attendu

```text
Connexion réussie !
1 - Architecture d'Internet
2 - Cyberattaques
3 - Mots de passe
4 - Sécurité du matériel
5 - Sécurité en ligne
6 - Sécurité des données
7 - Courrier électronique
```

**Résultat obtenu :** 
```text
Connexion réussie !
1 - Architecture d'Internet
2 - Cyberattaques
3 - Mots de passe
4 - Sécurité du matériel
5 - Sécurité en ligne
6 - Sécurité des données
7 - Courrier électronique
```


---

## 7. Conclusion

Ce test permet de vérifier la communication entre Java et le SGBD MariaDB à travers JDBC.

La connexion pourra ensuite être intégrée à la classe `BDD` du programme Java afin de gérer les questions et les réponses du quiz.
