# Journal d'utilisation de l'IA – Aisya BINTI ADIL ZAHNI

## 2026-11-09 - Vérifier la relation entre la base de données et la conception du site web

- **LLM utilisé :**  Gemini
- **Objectif :** Pour vérifier si la base de données contient tous les éléments présents dans la conception web initiale
- **Prompt :**
  > Go through all 3 of these files. Can u tell me if my work for bdd is correct and following the conception du siteweb.
- **Réponse du LLM :** 
  > Your database design in `sae302-BDD.sql` and `structure_initial_BDD.md` is structured well and aligns nicely with the specifications in the project documents (`TP1_Conception_initial_du_siteweb.pdf`).
  > Here is a review of how well your work matches the requirements, along with a few minor things to look out for:
  > 1. Alignment with the Website Design & Specifications
  > - The 7 Worlds (`theme` table):** The schema correctly sets up the 7 themes matching the ordered list from Schema 1 in the project docs (*1. Architecture d'Internet, 2. Cyberattaques, 3. Mots de passe, 4. Sécurité du matériel, 5. Sécurité en ligne, 6. Sécurité des données, 7. Courrier électronique*). The `ordre` and `nomTheme` fields have `UNIQUE` constraints, which is correct.
  > - Levels (`question` table):** The `niveau` field uses `TINYINT` with a check constraint (`niveau between 1 and 3`), which matches the three adventure levels described in Schema 1 (*Niveau 1 Débutant, Niveau 2 Intermédiaire, Niveau 3 Avancé*).
  > - Question Types & Explanations:** The `typeQuestion` field (`VARCHAR(50)`) and `explication` field (`TEXT NULL`) in the `question` table correctly accommodate the features listed in the Complements document (such as QCM, Vrai/Faux, and pedagogical explanations shown after answers).
  > - Answers & Validation (`reponse` table):** The `reponse` table properly links back to questions via a foreign key with cascade deletion (`ON DELETE CASCADE`). The `valide` field (`TINYINT(1)` / Boolean) correctly identifies whether a specific choice is a correct answer.

  > 2. Minor Technical Notes & Suggestions
  > - Scope of the Database:** Notice that the database schema focuses purely on storing the content (`theme`, `question`, `reponse`) and supports the JSON export/import mechanism described in Schema 4. User progression (XP, stars, badges, and unlocked worlds) is handled entirely client-side via browser storage (as specified under *Sauvegarde sans compte*: "Le site retrouve la progression quand l'utilisateur revient avec le même navigateur. Aucune inscription n'est demandée"). Therefore, **not** having user profile or score tables in this specific database is completely correct and follows the design.
- **Ce que j'en ai fait :** Structure et schéma de base de données téléversés sur GitHub


## 2026-11-18 - Vérifier la cohérence entre la base de données et l'interface web

- **LLM utilisé :**  Gemini
- **Objectif :** Pour vérifier si la base de données eh cohérente avec l'interface du site web
- **Prompt :**
  > can you verify if my database structure is coherent with the website concept 
- **Réponse du LLM :**
  > Oui, votre structure de base de données est très cohérente avec le concept du site CyberQuest présenté dans le document. Elle traduit fidèlement les règles de progression, la structure en mondes et sujets, ainsi que le système de sauvegarde anonyme. Voici une analyse détaillée de sa cohérence et quelques petits points d'attention ou suggestions d'amélioration :

  > Ce qui est parfaitement aligné avec le concept :
  > 1. La structure pédagogique (Mondes -> Sujets -> Quiz -> Niveaux) :
  >    * Les tables `theme`, `sujet` et `question` (liée à un `sujetId`) retranscrivent parfaitement la hiérarchie des 7 mondes et des 5 sujets par monde.
  >    * La table `quizValide` intègre la notion de `niveau` (1 à 4 pour facile, moyen, difficile, expert) et de `meilleurScore`, ce qui correspond exactement au fonctionnement décrit dans le Schéma 3 et le Schéma 4.
  > 2. La gestion des examens :
  >    * La table `resultatExamen` permet de stocker l'état de l'examen blanc (`examenBlancFait`) ainsi que les performances du vrai examen (`meilleurScore` et `etoiles`), ce qui correspond aux règles du Schéma 2 et du tableau comparatif.
  > 3. Le système de badges :
  >    * La table `badgeJoueur` liste précisément les codes de badges mentionnés dans le document (`PREMIER_PAS`, `EXPLORATEUR_WEB`, etc.), permettant d'attribuer un badge par monde terminé ainsi que le badge final *Cyber Guardian*.
  > 4. La sauvegarde sans compte :
  >    * La table `joueur` avec son `identifiant` unique (pour le cookie) et son `codeReprise` optionnel correspond point par point au mécanisme du Schéma 5.
  
  >    Points de vigilance et suggestions d'ajustement :
  > 1. L'ordre des sujets dans un monde :
  >    * Dans la table `sujet`, vous avez bien prévu un champ `ordre` (`TINYINT`), ce qui est parfait pour s'assurer que les sujets s'enchaînent de 1 à 5 comme indiqué dans le Schéma 2.
  > 2. La liaison entre les questions et les sujets :
  >    * Dans la table `question`, le champ `sujetId` est défini comme `INT NULL`. Puisque chaque question d'un quiz appartient obligatoirement à un sujet (et par déduction à un thème, comme vous le precisez), il pourrait être préférable de rendre ce champ `NOT NULL` pour éviter des questions orphelines, sauf si vous prévoyez des questions d'examen global piochées indifféremment (cependant, le texte précise bien que les examens tirent leurs questions des 5 sujets du monde).
  > 3. La table `reponse` et la suppression en cascade :
  >    * La description de la table `reponse` indique une suppression en cascade (`ON DELETE CASCADE` implicite via votre description) si la question est supprimée, ce qui est une excellente pratique pour garder une base propre.
  > 4. Le suivi de l'examen blanc :
  >    * Dans `resultatExamen`, vous stockez `examenBlancFait` (booléen). Le Schéma 2 indique que l'examen blanc est facultatif et ne donne pas de badge ni de blocage. Avez-vous besoin de stocker un score pour l'examen blanc ou juste de savoir s'il a été fait ? Votre choix (`examenBlancFait`) correspond exactement à ce qui est demandé, mais si vous souhaitez stocker son score, il faudrait peut-être l'ajouter. Tel quel, c'est suffisant puisque l'examen blanc sert juste d'entraînement avant le vrai examen.
  
  > En résumé, votre modélisation relationnelle est solide, propre et prête à être implémentée pour votre projet !
- **Ce que j'en ai fait :** Modifier le type du champ `sujetId` de `INT NULL` à `INT NOT NULL`
