# Structure de la base de données - SAÉ 3.02

**Auteur principal :** Aisya

---

## Tables de la BDD
**Contenu du quiz :**
- `theme`
- `sujet`
- `question`
- `reponse`
- `source`

**Progression des joueurs (sans compte) :**
- `joueur`
- `quizValide`
- `resultatExamen`
- `badgeJoueur`

---

## 1. Table `theme`
Un thème correspond à un monde de l'interface (7 mondes).

| Nom de champ | Type de champ | Description |
|--------------|---------------|-------------|
| `idTheme`| `INT` AUTO_INCREMENT clé primaire | Identifiant unique du thème (monde) |
| `ordre` | `TINYINT` NOT NULL, UNIQUE | Position du monde dans l’aventure (1 à 7) |
| `nomTheme` | `VARCHAR(100)` NOT NULL, UNIQUE | Nom du thème |


## 2. Table `sujet`
Chaque monde contient 5 sujets, à faire dans l'ordre.

| Nom de champ | Type de champ | Description |
|--------------|---------------|-------------|
| `idSujet`| `INT` AUTO_INCREMENT clé primaire | Identifiant unique du sujet |
| `themeId` | `INT` NOT NULL, clé étrangère vers `theme.idTheme` | Monde auquel appartient le sujet |
| `ordre` | `TINYINT` NOT NULL | Position du sujet dans le monde (1 à 5) |
| `nomSujet` | `VARCHAR(100)` NOT NULL | Nom du sujet |


## 3. Table `question`
Les questions du quiz, les nôtres et celles importées.

| Nom de champ | Type de champ | Description |
|--------------|---------------|-------------|
| `idQuestion` | `INT` AUTO_INCREMENT, clé primaire | Identifiant unique de la question |
| `typeQuestion` | `VARCHAR(50)` NOT NULL	| Type de question (QCM, choix multiples, vrai/faux, mise en situation, Cyber Detective) |
| `enonce` | `VARCHAR(500)` NOT NULL, UNIQUE | Texte de la question |
| `sujetId` | `INT` NULL, clé étrangère vers `sujet.idSujet` | Sujet de la question (le monde s'en deduit par `sujet.themeId` |
| `niveau` | `TINYINT` NULL (valeurs 1 à 4) | Niveau du quiz : 1 facile, 2 moyen, 3 difficile, 4 expert |
| `explication` | `TEXT` NULL	| Explication pédagogique affichée après la réponse |
| `sourceId` | `INT` NULL, clé étrangère vers `source.idSource`	| Source de la question importée. Vide pour question créer par notre groupe |


## 4. Table `reponse`
Les réponses possibles pour chaque question. 

| Nom de champ | Type de champ | Description |
|--------------|---------------|-------------|
| `idReponse` | `INT` AUTO_INCREMENT, clé primaire	| Identifiant unique de la réponse |
| `questionId` | `INT` NOT NULL, clé étrangère vers `question.idQuestion` |	Question à laquelle appartient la réponse. Si la question est supprimée, ses réponses le sont aussi |
| `typeReponse` |	`VARCHAR(50)` NOT NULL | Type de la réponse (texte, vrai/faux, etc.) |
| `contenu` | `TEXT` NOT NULL	| Texte de la réponse |
| `valide` | `BOOLEAN` NOT NULL, défaut FALSE | Vrai si la réponse est correcte |


## 5. Table `source`
Les sites des autres groupes depuis lesquels on importe des questions.

| Nom de champ | Type de champ | Description |
|--------------|---------------|-------------|
| `idSource` | `INT` AUTO_INCREMENT, clé primaire	| Identifiant unique de la source |
| `nomSource` | `VARCHAR(100)` NOT NULL |	Nom de la source |
| `url` |	`VARCHAR (255)` NOT NULL, UNIQUE | Adresse du JSON à importer |


## 6. Table `joueur`
Un joueur anonynome, sans compte ni adresse e-mail.

| Nom de champ | Type de champ | Description |
|--------------|---------------|-------------|
| `idJoueur` | `INT` AUTO_INCREMENT, clé primaire	| Identifiant unique du joueur |
| `identifiant` | `CHAR(32)` NOT NULL, UNIQUE |	Identifiant aléatoire gardé dans le cookie du navigateur. Il n'a aucun lien avec une personne |
| `codeReprise` |	`VARCHAR (12)` NULL, UNIQUE | Code de reprise facultatif pour retrouver sa progression sur un autre appareil  |
| `xpTotal` |	`INT` NOT NULL, défaut 0 | Total des points d'expérience |
| `dateDerniereVisite` |	`DATETIME` NOT NULL, défaut date du jour | Date de la dernière visite |


## 7. Table `quizValide`
La progression du joueur dans chaque quiz (un quiz = un sujet + un niveau).

| Nom de champ | Type de champ | Description |
|--------------|---------------|-------------|
| `joueurId` | `INT` NOT NULL, clé étrangère vers `joueur.idJoueur`	| Joueur concerné |
| `sujetId` | `INT` NOT NULL, clé étrangère vers `sujet.idSujet` |	Sujet du quiz |
| `niveau` |	`TINYINT` NOT NULL (valeurs 1 à 4) | Niveau du quiz : 1 facile, 2 moyen, 3 difficile, 4 expert |
| `valide` |	`BOOLEAN` NOT NULL, défaut FALSE | Vrai si le quiz est validé (score d'au moins 50%) |
| `meilleurScore` |	`TINYINT UNSIGNED` NOT NULL, défaut 0 | Meilleur score en pourcentage (0 à 100) |
Clé primaire : (`joueurId`, `sujetId`, `niveau`)


## 8. Table `resultatExamen`
Les examens d'un joueur dans chaque monde.

| Nom de champ | Type de champ | Description |
|--------------|---------------|-------------|
| `joueurId` | `INT` NOT NULL, clé étrangère vers `joueur.idJoueur`	| Joueur concerné |
| `themeId` | `INT` NOT NULL, clé étrangère vers `theme.idTheme`	| Monde de l'examen |
| `examenBlancFait` | `BOOLEAN` NOT NULL, défaut FALSE	| Vrai si l'examen blanc a été passé |
| `meilleurScore` | `TINYINT UNSIGNED` NOT NULL, défaut 0	| Meilleur score du vrai examen en pourcentage (1 à 100). Monde terminé à partir de 70  |
| `etoiles` | `TINYINT` NOT NULL, défaut 0 (valeurs 0 à 3)	| Étoiles du vrai examen : 1 de 70 à 79%, 2 à 80 à 89 %, 3 de 90% à 100% |
Clé primaire : (`joueurId`, `themeId`)


## 9. Table `badgeJoueur`
Les badges obtenus par un joueur.

| Nom de champ | Type de champ | Description |
|--------------|---------------|-------------|
| `joueurId` | `INT` NOT NULL, clé étrangère vers `joueur.idJoueur`	| Joueur concerné |
| `badge` | `VARCHAR(50)` NOT NULL	| Code du badge : `PREMIER_PAS`, `EXPLORATEUR_WEB`, `DETECTEUR_MENACES`, `MAITRE_MOT_DE_PASSE`, `PROTECTEUR_MATERIEL`, `NAVIGATEUR_PRUDENT`, `GARDIEN_DONNEES`, `CAHSSEUR_PHISHING`, `CYBER_GUARDIAN` |
Clé primaire : (`joueurId`, `badge`)

---

## Relations entre les tables
- Un **thème** (monde) contient 5 sujets (`sujet.themeId` → `theme.idTheme`)
- Un **sujet** contient plusieurs questions (`question.sujetId` → `sujet.idSujet`)
- Une **question** possède plusieurs réponses (`reponse.questionId` → `question.idQuestion`)
- Une **source** fournit plusieurs questions importées (`question.sourceId` → `source.idSource`)
- Un **joueur** a une progression par quiz, par examen et par badge (`quizValide`, `resultatExamen`, `badgeJoueur`)
