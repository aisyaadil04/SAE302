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
