# Squelette du programme Java - SAÉ 3.02

**Auteur principal :** Aiman

**Projet :** Application de quiz sur l'hygiène informatique et la cybersécurité




---

## 1. Classe `Reponse`

### Attributs

| Attribut | Type | Description |
|----------|------|-------------|
| `type` | `String` | Type de la réponse |
| `contenu` | `String` | Texte de la réponse |
| `id`      | `Integer` | identifiant unique de la question ou reponse | 
| `valide` | `boolean` | Vrai si la réponse est correcte |

### Constructeur

| Signature | Description |
|-----------|-------------|
| `public Reponse(String type, String contenu, boolean valide)` | Crée une réponse |

### Méthodes

| Méthode | Type retour | Description |
|---------|-------------|-------------|
| `getType()` | `String` | Retourne le type |
| `getContenu()` | `String` | Retourne le contenu |
| `isValide()` | `boolean` | Retourne si valide |
| `setType(String type)` | `void` | Modifie le type |
| `setContenu(String contenu)` | `void` | Modifie le contenu |
| `setValide(boolean valide)` | `void` | Modifie la validité |
| `toJson()` | `String` | Convertit en JSON |

---

## 2. Classe `Question`

### Attributs

| Attribut | Type | Description |
|----------|------|-------------|
| `type` | `String` | Type de la question |
| `enonce` | `String` | Texte de la question |
| `id`      | `Integer` | identifiant unique de la question ou reponse | 
| `reponses` | `ArrayList<Reponse>` | Liste des réponses possibles |

### Constructeur

| Signature | Description |
|-----------|-------------|
| `public Question(String type, String enonce)` | Crée une question |

### Méthodes

| Méthode | Type retour | Description |
|---------|-------------|-------------|
| `ajouterReponse(Reponse r)` | `void` | Ajoute une réponse |
| `supprimerReponse(Reponse r)` | `void` | Supprime une réponse |
| `afficher()` | `void` | Affiche la question |
| `toJson()` | `String` | Convertit en JSON |
| `getType()` | `String` | Retourne le type |
| `getEnonce()` | `String` | Retourne l'énoncé |
| `getReponses()` | `ArrayList<Reponse>` | Retourne les réponses |
| `setType(String type)` | `void` | Modifie le type |
| `setEnonce(String enonce)` | `void` | Modifie l'énoncé |

---

## 3. Classe `Quiz`

### Attributs

| Attribut | Type | Description |
|----------|------|-------------|
| `titre` | `String` | Titre du quiz |
| `questions` | `ArrayList<Question>` | Liste des questions |

### Constructeur

| Signature | Description |
|-----------|-------------|
| `public Quiz(String titre)` | Crée un quiz |

### Méthodes

| Méthode | Type retour | Description |
|---------|-------------|-------------|
| `ajouterQ(Question q)` | `void` | Ajoute une question |
| `supprimerQ(Question q)` | `void` | Supprime une question |
| `afficher()` | `void` | Affiche le quiz |
| `lancer()` | `void` | Lance le quiz |
| `importQR(String url)` | `void` | Importe depuis un site externe |
| `toJson()` | `String` | Convertit en JSON |
| `getTitre()` | `String` | Retourne le titre |
| `getQuestions()` | `ArrayList<Question>` | Retourne les questions |
| `setTitre(String titre)` | `void` | Modifie le titre |

---

## 4. Classe `BDD`

### Attributs

| Attribut | Type | Description |
|----------|------|-------------|
| conn | `Connection` | Initiation connection |
| `id`      | `Integer` | identifiant unique de la question ou reponse | 

### Méthodes

| Méthode | Type retour | Description |
|---------|-------------|-------------|
| `setId(int id)`   | `void`  | Recupération de l'identifiant de BDD |
| `getConnection()` | `Connection` | Initier connexion à la BDD |
| `ajouterQ(Question q)` | `void` | Ajouter la question à la BDD |
| `supprimerQ(Question q)` | `void` | Supprimer la question à la BDD |
| `setTypeQ(int id, String type)` | `void` | Modifier le type de question à la BDD |
| `setEnonceQ(int id,String enonce)` | `void` | Modifier l'enonce de question à la BDD |
| `ajouterR(Reponse r)` | `void` | Ajouter la réponse à la BDD |
| `supprimerR(Reponse r)` | `void` | Supprimer la réponse à la BDD |
| `setTypeR(int id,String type)` | `void` | Modifier le type de réponse à la BDD |
| `setEnonceR(int id,String enonce)` | `void` | Modifier l'énoncé de réponse à la BDD |

---

## 5. Classe `Main`

### Méthode

| Méthode | Type retour | Description |
|---------|-------------|-------------|
| `main(String[] args)` | `static void` | Point d'entrée du programme |

---




