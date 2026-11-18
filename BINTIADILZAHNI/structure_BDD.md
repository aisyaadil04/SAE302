# Structure de la base de données - SAÉ 3.02

**Auteur principal :** Aisya

---

## Tables de la BDD
- `theme`
- `question`
- `reponse`
- `source`

---

## 1. Table `theme`

| Nom de champ | Type de champ | Description |
|--------------|---------------|-------------|
| `idTheme`| `INT` AUTO_INCREMENT clé primaire | Identifiant unique du thème, attribué automatiquement |
| `ordre` | `TINYINT` NOT NULL, UNIQUE | Position du monde dans l’aventure (1 à 7) |
| `nomTheme` | `VARCHAR(100)` NOT NULL, UNIQUE | Nom du thème (ex : « Mots de passe ») |


## 2. Table `question`

| Nom de champ | Type de champ | Description |
|--------------|---------------|-------------|
| `idQuestion` | `INT` AUTO_INCREMENT, clé primaire | Identifiant unique de la question |
| `typeQuestion` | `VARCHAR(50)` NOT NULL	| Type de question (QCM, choix multiples, vrai/faux, mise en situation, Cyber Detective) |
| `enonce` | `VARCHAR(500)` NOT NULL, UNIQUE | Texte de la question |
| `themeId` | `INT` NULL, clé étrangère vers `theme.idTheme` | Thème (monde) auquel appartient la question. Vide pour une question importée sans thème |
| `niveau` | `TINYINT` NULL (valeurs 1 à 3) | Niveau de difficulté : 1 débutant, 2 intermédiaire, 3 avancé |
| `explication` | `TEXT` NULL	| Explication pédagogique affichée après la réponse |
| `sourceId` | `INT` NULL, clé étrangère vers `source.idSource`	| Source de la question importée. Vide pour question créer par notre groupe |


## 3. Table `reponse`

| Nom de champ | Type de champ | Description |
|--------------|---------------|-------------|
| `idReponse` | `INT` AUTO_INCREMENT, clé primaire	| Identifiant unique de la réponse |
| `questionId` | `INT` NOT NULL, clé étrangère vers `question.idQuestion` |	Question à laquelle appartient la réponse. Si la question est supprimée, ses réponses le sont aussi |
| `typeReponse` |	`VARCHAR(50)` NOT NULL | Type de la réponse (texte, vrai/faux, etc.) |
| `contenu` | `TEXT` NOT NULL	| Texte de la réponse |
| `valide` | `BOOLEAN` NOT NULL, défaut FALSE | Vrai si la réponse est correcte |


## 4. Table `source`

| Nom de champ | Type de champ | Description |
|--------------|---------------|-------------|
| `idSource` | `INT` AUTO_INCREMENT, clé primaire	| Identifiant unique de la source |
| `nomSource` | `VARCHAR(100)` NOT NULL |	Nom de la source |
| `url` |	`VARCHAR (255)` NOT NULL, UNIQUE | Adresse du JSON à importer |

---

## Relations entre les tables
- Un **thème** contient plusieurs questions (`question.themeId` → `theme.idTheme`)
- Une **question** possède plusieurs réponses (`reponse.questionId` → `question.idQuestion`)
- Une **source** fournit plusieurs questions importées (`question.sourceId` → `source.idSource`)
