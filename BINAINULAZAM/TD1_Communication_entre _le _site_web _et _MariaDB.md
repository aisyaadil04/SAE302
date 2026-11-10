
## TD1 — Mise en place de la communication Web ↔ SGBD

## 1. Objectif du travail

L'objectif de mon travail était de mettre en place une communication entre le serveur web et MariaDB, créée par Aisya.

## 2. Environnement technique

| Élément | Technologie utilisée |
|---|---|
| Serveur web | Apache 2.4.68 |
| Langage côté serveur | PHP |
| SGBD | MariaDB |
| Interface de connexion BDD | PDO avec `pdo_mysql` |
| Base de données | `quiz` |
| Utilisateur MariaDB | `quiz_user` |
| Répertoire web | `/var/www/html/cyberquest` |
| Répertoire privé | `/var/www/cyberquest-config` |


---

## 3. Vérification de l'environnement

### 3.1. Vérification d'Apache


```bash
apache2 -v
```

```bash
systemctl is-active apache2
```

### 3.2. Vérification de PHP


```bash
php -v
```

Puis la disponibilité des extensions de communication avec les bases de données :

```bash
php -m | grep -Ei 'PDO|mysql'
```


## 4. Vérification des droits MariaDB


```sql
SHOW GRANTS FOR 'quiz_user'@'localhost';
```

Cet utilisateur disposait des droits suivants sur la base `quiz` :

- `SELECT`
- `INSERT`
- `UPDATE`
- `DELETE`


---

## 5. Préparation des fichiers du site web

### 5.1. Identification du DocumentRoot

Pour identifier l'emplacement des fichiers web, j'ai exécuté :

```bash
grep -R "DocumentRoot" /etc/apache2/sites-enabled/
```

Résultat :

```text
DocumentRoot /var/www/html
```

J'ai utilisé le répertoire suivant pour les fichiers publics du projet :

```text
/var/www/html/cyberquest
```

### 5.2. Création d'un répertoire privé

Afin de protéger les identifiants de connexion à MariaDB, j'ai choisi de placer le fichier `db.php` en dehors du répertoire public d'Apache.

J'ai créé le dossier :

```bash
sudo mkdir -p /var/www/cyberquest-config
```

Puis j'ai configuré ses permissions :

```bash
sudo chown rt:www-data /var/www/cyberquest-config
sudo chmod 750 /var/www/cyberquest-config
```

Ce dossier est destiné à contenir les paramètres privés du site.

---

## 6. Création de la connexion PDO

### 6.1. Objectif

Pour communiquer avec MariaDB depuis PHP, j'ai utilisé PDO (*PHP Data Objects*).


J'ai créé le fichier :

`/var/www/cyberquest-config/db.php`

### 6.2. Code du fichier `db.php`


```php

<?php

$host = 'localhost';        
$dbname = 'quiz';            
$username = 'quiz_user';     // MariaDB user created to access the database
$password = '#mot_de_passe_de_user_quiz'; // User password

// Try to establish a connection to the database
try {
    // Create a connection between PHP and MariaDB using PDO
    $pdo = new PDO(
        "mysql:host=$host;dbname=$dbname;charset=utf8mb4",
        // mysql: driver used to communicate with MariaDB
        $username,
        $password
    );

    // Configure PDO to throw exceptions when an error occurs
    $pdo->setAttribute(
        PDO::ATTR_ERRMODE,
        PDO::ERRMODE_EXCEPTION
    );

} catch (PDOException $e) {
    // If the connection fails, PDOException contains the error details

    // Record the error in the server logs for debugging
    error_log($e->getMessage());

    // Return HTTP status code 500 (Internal Server Error)
    http_response_code(500);

    // Stop executing the PHP script
    exit("Erreur de connexion à la base de données.");
}

```


---

## 7. Premier test PDO — Affichage des thèmes

### 7.1. Objectif

Le premier test consistait à afficher dans le navigateur les sept thèmes stockés dans MariaDB.

Pour cela, j'ai créé :

`/var/www/html/cyberquest/test_bdd.php`

### 7.2. Code du fichier `test_bdd.php`

```php

<?php

// Include the database connection file (db.php)
require_once '/var/www/cyberquest-config/db.php';


$sql = "SELECT idTheme, ordre, nomTheme
        FROM theme
        ORDER BY ordre";

// Execute the SQL query using the PDO connection
$stmt = $pdo->query($sql);

// Fetch all rows returned by the query
// FETCH_ASSOC: stores each row as an associative array
$themes = $stmt->fetchAll(PDO::FETCH_ASSOC);

?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>CyberQuest - Test BDD</title>
</head>
<body>

    <h1>CyberQuest - Test de communication BDD</h1>

    <h2>Thèmes disponibles :</h2>

    <ul>

        <!-- Loop through all themes retrieved from MariaDB -->
        <?php foreach ($themes as $theme): ?>

            <li>
                <!-- Display the theme name -->
                <!-- htmlspecialchars() prevents HTML injection -->
            </li>

        <?php endforeach; ?>

    </ul>

</body>
</html>

```

**Capture** : 
---

## 8. Deuxième test PDO — Récupération d'une question et de ses réponses

### 8.1. Objectif

Après avoir réussi à récupérer les thèmes, j'ai voulu vérifier que le site pouvait également récupérer une question et ses réponses associées.


### 8.2. Vérification SQL de la relation

Dans MariaDB, j'ai exécuté la requête suivante :

```sql
SELECT
    q.idQuestion,
    q.enonce,
    r.idReponse,
    r.contenu,
    r.valide
FROM question AS q
JOIN reponse AS r
    ON r.questionId = q.idQuestion
WHERE q.idQuestion = 1;
```

J'ai utilise une jointure `JOIN` entre les tables `question` et `reponse`.

La relation est établie entre :

`question.idQuestion` et `reponse.questionId`


### 8.3. Création du fichier `test_question.php`

J'ai ensuite créé :

`/var/www/html/cyberquest/test_question.php`

Ce fichier utilise deux requêtes SQL pour récupérer séparément la question et ses réponses.

### 8.4. Code PDO pour récupérer la question

```php

<?php

require_once '/var/www/cyberquest-config/db.php';

// SQL query to retrieve question number 1 from MariaDB
$sql = "SELECT idQuestion, enonce, typeQuestion
        FROM question
        WHERE idQuestion = 1";

// Execute the SQL query using PDO
$stmt = $pdo->query($sql);

// Retrieve the first row returned by the database
$question = $stmt->fetch(PDO::FETCH_ASSOC);

```

J'ai utilise `fetch()` pour récupérer une seule question.

### 8.5. Code PDO pour récupérer les réponses

```php

// SQL query to retrieve all answers linked to question number 1
$sql = "SELECT idReponse, contenu
        FROM reponse
        WHERE questionId = 1";

// Execute the SQL query using the PDO connection
$stmt = $pdo->query($sql);

// Retrieve all answers returned by MariaDB
$reponses = $stmt->fetchAll(PDO::FETCH_ASSOC);

```

Ici j'ai utilise `fetchAll()` pour récupérer toutes les propositions associées à la question.

Je n'ai pas sélectionné la colonne `valide` lors de l'affichage initial, afin que la bonne réponse ne soit pas transmise au navigateur avant la validation.

### 8.6. Affichage de la question en HTML

Les données sont ensuite affichées avec :

```php
<?php if ($question): ?>

    <h2><?= htmlspecialchars($question['enonce']) ?></h2>

    <?php foreach ($reponses as $reponse): ?>
        <p>
            <label>
                <input type="radio"
                       name="reponse"
                       value="<?= (int)$reponse['idReponse'] ?>"
                       required>

                <?= htmlspecialchars($reponse['contenu']) ?>
            </label>
        </p>
    <?php endforeach; ?>

<?php else: ?>
    <p>Aucune question trouvée.</p>
<?php endif; ?>
```



### 8.8. Résultat obtenu


Le navigateur a affiché :



---

## 9. Ajout d'un formulaire de réponse

### 9.1. Objectif

Pour préparer l'interaction avec l'utilisateur, j'ai ajouté un formulaire HTML permettant de sélectionner une réponse et de la transmettre au serveur PHP.

### 9.2. Code du formulaire

```php

<!-- Create a form that sends the selected answer to PHP using POST -->
<form method="POST">

    <?php foreach ($reponses as $reponse): ?>
        <p>
            <label>
                <!-- Create a radio button for each answer -->
                <input type="radio"
                       name="reponse"
                       value="<?= (int)$reponse['idReponse'] ?>"
                       required>

              
                <?= htmlspecialchars($reponse['contenu']) ?>
            </label>
        </p>
    <?php endforeach; ?>


    
    <button type="submit">Valider ma réponse</button>

</form>

```




---

## 10. Préparation de la vérification des réponses avec PDO

### 10.1. Objectif

L'étape suivante consiste à comparer la réponse sélectionnée par l'utilisateur avec les informations présentes dans MariaDB.

Cette vérification doit se faire côté serveur afin de ne pas révéler directement les bonnes réponses au navigateur.

### 10.2. Code PHP de vérification

J'ai préparé le traitement suivant pour le fichier `test_question.php` :

```php

// Initialize the result as null (no answer checked yet)
$resultat = null;

// Check if the user submitted the form using POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    // Get the selected answer ID from the form
    // FILTER_VALIDATE_INT ensures the submitted value is an integer
    $idReponse = filter_input(
        INPUT_POST,
        'reponse',
        FILTER_VALIDATE_INT
    );

    if ($idReponse !== false && $idReponse !== null) {

        // To check if the selected answer is correct
        $sql = "SELECT valide
                FROM reponse
                WHERE idReponse = :idReponse
                AND questionId = :idQuestion";

        // Prepare the SQL query to safely handle the submitted values
        $stmt = $pdo->prepare($sql);

        // Execute the query with the selected answer ID and current question ID
        $stmt->execute([
            'idReponse' => $idReponse,
            'idQuestion' => $question['idQuestion']
        ]);

        // Retrieve the answer's validity from MariaDB
        $reponse = $stmt->fetch(PDO::FETCH_ASSOC);

        // Check if the selected answer exists in the database
        if ($reponse) {

            // Convert the 'valide' value (0 or 1) into a boolean
            $resultat = (bool) $reponse['valide'];
        }
    }
}

```


### 10.3. Affichage du résultat

Le code d'affichage prévu est :

```php
<?php if ($resultat !== null): ?>

    <?php if ($resultat): ?>
        <p style="color: green;">
            Bonne réponse !
        </p>
    <?php else: ?>
        <p style="color: red;">
            Mauvaise réponse !
        </p>
    <?php endif; ?>

<?php endif; ?>
```


---

## 12. Problèmes rencontrés et solutions

### 12.1. Problème de permissions sur `db.php`

Lors de mon premier test, la page `test_bdd.php` affichait une page blanche.

J'ai consulté le journal des erreurs Apache :

```bash
sudo tail -n 20 /var/log/apache2/error.log
```

Le message indiquait :

```text
Failed opening required
'/var/www/cyberquest-config/db.php'
Permission denied
```

J'ai ensuite vérifié les permissions du fichier :

```bash
ls -ld /var/www/cyberquest-config
ls -l /var/www/cyberquest-config/db.php
```

Le fichier appartenait à l'utilisateur `rt` et au groupe `rt`, alors qu'Apache devait pouvoir le lire via le groupe `www-data`.

J'ai confirmé le problème avec :

```bash
sudo -u www-data test -r /var/www/cyberquest-config/db.php \
  && echo "ACCESS OK" || echo "ACCESS DENIED"
```

Résultat :

```text
ACCESS DENIED
```

J'ai corrigé le groupe du fichier :

```bash
sudo chown rt:www-data /var/www/cyberquest-config/db.php
```

Le fichier conservait les permissions `640`, permettant sa lecture par le groupe `www-data` sans l'ouvrir aux autres utilisateurs.

Après correction, Apache pouvait accéder à `db.php`.

### 12.2. Erreur d'authentification MariaDB

Après la correction des permissions, le navigateur affichait :

```text
Erreur de connexion à la base de données.
```

J'ai de nouveau consulté le journal Apache.

Le message indiquait :

```text
SQLSTATE[HY000] [1045]
Access denied for user 'quiz_user'@'localhost'
```

Pour vérifier les identifiants, j'ai effectué une connexion directe depuis le terminal :

```bash
mariadb -u quiz_user -p quiz
```

La connexion à MariaDB a fonctionné avec le mot de passe de l'utilisateur `quiz_user`.

Le problème venait donc du mot de passe renseigné dans le fichier PHP.

J'ai corrigé les informations de connexion dans `db.php`, puis actualisé la page.

Cette fois, les sept thèmes ont été affichés correctement.

### 12.3. Bilan du dépannage

Ces deux erreurs m'ont permis de distinguer :

- Une erreur de permissions Linux empêchant Apache de lire un fichier.
- Une erreur d'authentification entre PHP et MariaDB.

J'ai également appris à utiliser les journaux Apache pour identifier la cause d'une erreur plutôt que de modifier la configuration sans diagnostic.

---

## 13. Tests réalisés et résultats

| N° | Test | Résultat |
|---|---|---|
| 1 | Vérification d'Apache | Réussi |
| 2 | Vérification de PHP | Réussi |
| 3 | Vérification de PDO et `pdo_mysql` | Réussi |
| 4 | Vérification du service MariaDB | Réussi |
| 5 | Vérification des tables `theme`, `question`, `reponse` | Réussi |
| 6 | Vérification des permissions MariaDB | Réussi |
| 7 | Connexion PHP → MariaDB avec PDO | Réussi |
| 8 | Récupération des sept thèmes | Réussi |
| 9 | Affichage des thèmes dans le navigateur | Réussi |
| 10 | Jointure SQL entre questions et réponses | Réussi |
| 11 | Récupération d'une question avec PDO | Réussi |
| 12 | Récupération de ses réponses avec PDO | Réussi |
| 13 | Affichage de la question dans le navigateur | Réussi |
| 14 | Ajout d'un formulaire et d'un bouton de validation | Réussi |
| 15 | Vérification complète des réponses soumises | À confirmer |
| 16 | Export JSON `/export` | Non réalisé à cette étape |

---

## 14. Travail restant

Pour poursuivre le développement du site web, les prochaines étapes prévues sont :

1. Finaliser et tester la vérification des réponses.
2. Permettre la sélection des questions selon les thèmes et niveaux.
3. Afficher plusieurs questions dans un même quiz.
4. Intégrer les différents types de questions.
5. Développer la maquette puis l'interface finale CyberQuest.
6. Ajouter les modes entraînement et défi.
7. Implémenter le système de scores et de progression.
8. Développer l'export JSON accessible à l'adresse `/export`, conformément aux exigences de la SAÉ.

Le travail actuel est volontairement limité à une première validation technique de la communication Web ↔ SGBD.

---

## 15. Conclusion

Ce TD m'a permis de mettre en place et de tester une communication fonctionnelle entre Apache, PHP et la base MariaDB de notre projet CyberQuest.

Grâce à PDO, j'ai pu exécuter des requêtes SQL depuis PHP, récupérer les sept thèmes de cybersécurité et afficher une question avec ses réponses directement depuis la base de données.

Les problèmes rencontrés m'ont également permis de mieux comprendre les permissions Linux, la gestion des utilisateurs MariaDB et le diagnostic des erreurs à partir des journaux Apache.

Cette première étape constitue la base technique nécessaire au développement du site web CyberQuest. Elle permettra par la suite d'intégrer les fonctionnalités de quiz, de progression et d'échange de données avec l'application Java.

---

## 16. Captures d'écran à joindre

Pour documenter le travail réalisé, les captures suivantes peuvent être ajoutées au dépôt GitHub :

**Capture 1 — Vérification de la BDD**

Résultat des commandes `DESCRIBE` sur les trois tables.

**Capture 2 — Jointure SQL**

Résultat de la requête `JOIN` montrant la question et ses deux réponses.

**Capture 3 — Affichage des thèmes**

Page `test_bdd.php` affichant les sept thèmes récupérés depuis MariaDB.

**Capture 4 — Affichage de la question**

Page `test_question.php` affichant une question et ses réponses.

**Capture 5 — Vérification des réponses**

À ajouter après avoir confirmé le fonctionnement des messages « Bonne réponse » et « Mauvaise réponse ».

Les captures ne doivent pas contenir les mots de passe ou les autres informations sensibles de la VM.
