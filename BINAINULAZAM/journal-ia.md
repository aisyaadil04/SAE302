# Journal d'utilisation de l'IA – Ilman Sufy BIN AINUL AZAM

## 2026-10-15 – TP_1_Conception_initial_du_siteweb

- **LLM utilisé :** Claude (Anthropic), modèle Claude Sonnet 5.5, via l'application Claude. 
- **Objectif :** Obtenir, pour la première présentation de la SAÉ 3.02, des organigrammes fonctionnels décrivant le site web CyberQuest.
- **Prompt :**

  > Our group is developing CyberQuest, an interactive, gamified cybersecurity learning platform inspired by Duolingo. My responsibility is the website (Site Web). I need you to create a complete, professional, easy-to-understand functional flowchart (organigramme fonctionnel) explaining how the entire website will work. The flowchart must explain the intended functionalities and user experience without showing any code or implementation.
  
  > PART 1 — WEBSITE CONCEPT Name: CyberQuest. CyberQuest is a fun, interactive cybersecurity learning website inspired by Duolingo. Its purpose is to help users improve their knowledge of cybersecurity and good computer security practices through quizzes, progressive challenges, educational explanations, and rewards. The website must be intuitive, engaging, responsive, and accessible without requiring an account. Its main concept is: Apprendre → S'entraîner → Relever des défis → Gagner des récompenses → Progresser
  > PART 2 — WEBSITE ENTRY POINT The flowchart must begin with: ACCÈS AU SITE CYBERQUEST ↓ PAGE D'ACCUEIL The homepage introduces CyberQuest and gives users four main options. Option 1 — Aventure CyberQuest Access the main progressive learning experience. Users complete cybersecurity worlds and unlock new challenges. Option 2 — Entraînement libre Practise any cybersecurity topic without progression restrictions. Users can choose a theme and difficulty level. Option 3 — Défi rapide Answer five randomly selected cybersecurity questions. This mode is designed for users who want a short learning session. Option 4 — Ma progression View personal learning progress. Display:
Total XP earned.
Completed worlds.
Unlocked levels.
Best quiz scores.
Achievement badges.
Previously completed challenges. The website should remember user progress without requiring a login. PART 3 — PROGRESSIVE LEARNING SYSTEM When users select: AVENTURE CYBERQUEST They enter a progression map containing seven cybersecurity worlds. Seven cybersecurity worlds Monde 1 — Architecture d'Internet
Understanding the internet.
Basic networking concepts.
How information travels between devices. Monde 2 — Les cyberattaques
Different types of cyberattacks.
Recognizing cybersecurity threats.
Understanding common attack methods. Monde 3 — Gestion des mots de passe
Creating secure passwords.
Password managers.
Multifactor authentication. Monde 4 — Sécurité du matériel
Protecting computers and devices.
Updates and antivirus software.
Physical security. Monde 5 — Sécurité en ligne
Safe browsing.
Suspicious websites.
Online scams. Monde 6 — Sécurité des données
Data protection.
Backups.
Encryption and confidentiality. Monde 7 — Courrier électronique
Phishing.
Suspicious emails.
Email security practices. World unlocking system Initially:
World 1 is unlocked.
Worlds 2–7 are locked. Users must complete all three difficulty levels of the current world to unlock the next world. Each world contains: Niveau 1 — Débutant ↓ Niveau 2 — Intermédiaire ↓ Niveau 3 — Avancé ↓ Monde terminé ↓ Déblocage du monde suivant The flowchart must clearly show this progression. PART 4 — QUIZ MODE SELECTION After selecting an available world and level, users choose between two modes. MODE A — MODE ENTRAÎNEMENT Purpose: Learn and practise without pressure. The user starts a quiz. ↓ The website displays a question. ↓ The user selects an answer. ↓ DECISION: Is the answer correct? If YES on the first attempt:
Display a congratulatory message.
Award +10 XP.
Display an educational explanation.
Continue to the next question. If NO on the first attempt:
Display an encouraging message.
Do not immediately reveal the correct answer.
Allow the user to try again. ↓ SECOND ATTEMPT ↓ DECISION: Is the second answer correct? If YES:
Display a congratulatory message.
Award +5 XP.
Explain the correct answer.
Continue to the next question. If NO:
Reveal the correct answer.
Award 0 XP.
Display an educational explanation.
Continue to the next question. At the end of the training quiz:
Display a summary.
Show the number of correct answers.
Show XP earned.
Allow the user to review explanations.
Allow the user to retry incorrect questions.
Allow the user to return to the world selection. IMPORTANT: Training mode does not unlock new levels or worlds. Only challenge mode can unlock progression. MODE B — MODE DÉFI Purpose: Test the user's knowledge and unlock new levels. The user starts a challenge. ↓ The website displays a question. ↓ The user selects an answer. ↓ The website records the answer without revealing whether it is correct. ↓ The user continues to the next question. ↓ The process repeats until all questions are completed. ↓ QUIZ TERMINÉ ↓ The website calculates the final score. ↓ DECISION: Is the score at least 50%? If NO — Score below 50%:
Display "Mission échouée".
Display the score.
Show incorrect answers and explanations.
Suggest additional training.
Allow the user to retry the challenge.
The next level remains locked. If YES — Score of at least 50%:
Display "Mission réussie".
Display the score.
Award stars and XP.
Display corrections and explanations.
Unlock the next level. Star rewards
0–49%: No stars.
50–69%: One star.
70–89%: Two stars.
90–100%: Three stars. If the user completes the advanced level of the current world: MONDE TERMINÉ ↓ BADGE DÉBLOQUÉ ↓ MONDE SUIVANT DÉBLOQUÉ Users may replay completed levels to improve their scores. PART 5 — DIFFERENT QUESTION TYPES The website will support several question formats. Type 1 — QCM A multiple-choice question with one correct answer. Type 2 — Choix multiples A question with several correct answers. Type 3 — Vrai ou Faux A statement that users identify as true or false. Type 4 — Mise en situation A realistic cybersecurity scenario requiring users to choose the safest action. Example: A user receives a suspicious email asking them to reveal their password. The user must identify the appropriate security response. Special challenge — Cyber Detective A special quiz category involving realistic cybersecurity situations. Users act as cybersecurity detectives. They identify suspicious emails, unsafe websites, attempted scams, and security mistakes. The flowchart should show that these question formats can appear in both training mode and challenge mode. PART 6 — QUIZ INTERFACE FUNCTIONALITIES During a quiz, the website provides:
Progress indicator Displays how many questions have been answered. Example: Question 3/10.
Navigation Allows users to move through the quiz according to the selected mode.
Random questions Questions may be selected randomly from the chosen cybersecurity theme.
Randomized answer order The order of the proposed answers can change between attempts.
Optional timer Challenge mode may include a timer to increase difficulty.
Encouraging messages Displays friendly messages throughout the learning experience. Examples:
"Excellent travail !"
"Continue comme ça !"
"Presque ! Essaie encore."
"Bravo, mission accomplie !" PART 7 — REWARDS AND GAMIFICATION CyberQuest includes a reward system to motivate users. XP — Experience points Users earn XP by answering questions and completing quizzes. Examples:
Correct answer on first attempt in training: +10 XP.
Correct answer on second attempt in training: +5 XP.
Completing a challenge: Bonus XP.
Achieving an excellent score: Additional XP. Stars Users receive between one and three stars according to their challenge score. Achievement badges Users unlock special badges when they complete certain objectives. Examples: Chasseur de phishing Complete the email security world. Maître des mots de passe Complete the password security world. Cyber Guardian Complete all seven cybersecurity worlds. The flowchart must represent how users receive these rewards after completing challenges. PART 8 — RESULTS AND PERSONALIZED FEEDBACK After completing a quiz, users access: PAGE DE RÉSULTATS This page displays:
Final score.
Number of correct answers.
XP earned.
Stars received.
Newly unlocked achievements.
Progress toward the next level. Personalized feedback The website identifies the user's strengths and weaknesses according to their answers. For example: "Tu maîtrises bien la gestion des mots de passe, mais tu devrais t'entraîner davantage sur les attaques de phishing." The website recommends suitable cybersecurity topics for additional practice. Available actions After viewing the results, users can:
Review corrections.
Retry incorrect questions.
Replay the quiz.
Return to the progression map.
Continue to the next unlocked level. The flowchart must illustrate these possible navigation paths. PART 9 — FREE PRACTICE MODE The website includes: ENTRAÎNEMENT LIBRE Unlike the main adventure mode, users do not need to unlock worlds. All cybersecurity topics are accessible immediately. The user:
Selects a cybersecurity theme.
Selects a difficulty level.
Starts a training quiz.
Answers questions.
Receives feedback and explanations.
Views results.
Chooses whether to practise again. Free practice does not modify world unlocking. PART 10 — QUICK CHALLENGE The website includes: DÉFI RAPIDE This is a short quiz designed for quick learning sessions. The user:
Selects "Défi rapide".
Receives five randomly selected questions from different cybersecurity topics.
Answers each question.
Receives a final score.
Can review corrections.
Can restart another quick challenge. This mode does not unlock adventure worlds or levels. PART 11 — PROGRESSION TRACKING Users can access: MA PROGRESSION The website displays:
Total accumulated XP.
Worlds completed.
Current unlocked world.
Completed difficulty levels.
Best scores.
Stars earned.
Achievement badges. The website remembers the user's progress when they return using the same browser. No mandatory account registration is required. PART 12 — COMMUNICATION WITH DATABASE AND JAVA APPLICATION This section is particularly important because the project is called: SAÉ 3.02 — Développer des applications communicantes The website must communicate with a database shared with the Java application. Explain the following functional interactions. Website and database The website retrieves:
Cybersecurity questions.
Possible answers.
Correct answers.
Question types.
Quiz categories and associated information. When users start a quiz, the website retrieves the appropriate questions from the database. Java application and database The Java application allows the group to:
Add questions.
Modify existing questions.
Delete questions. Changes made through the Java application are reflected in the questions available on the website. JSON export The website must publish its questions and answers in JSON format. The export must be accessible at: http://x.y.z.t/export This allows Java applications developed by other groups to retrieve and import questions. The exported information must comply with the minimum format specified by the professor. The flowchart must clearly distinguish: PARCOURS UTILISATEUR from: COMMUNICATION ENTRE LES APPLICATIONS Do not include database tables, queries, class definitions, JSON syntax, or programming code. Explain only how information moves between the website, database, and Java application. PART 13 — DESIGN AND USER EXPERIENCE The website should have a fun, engaging identity inspired by Duolingo. Desired characteristics:
Colorful and modern.
Friendly and intuitive.
Gamified learning experience.
Encouraging messages.
Visible learning progression.
Accessible to beginners.
Responsive across computers and smartphones. A friendly cybersecurity mascot may guide users throughout their journey. However, the flowchart itself must remain professional and academically appropriate. Do not create a website mockup. PART 14 — EXPECTED OUTPUT Create the following deliverables. OUTPUT 1 — Complete functional flowchart Title: CYBERQUEST — ORGANIGRAMME FONCTIONNEL DU SITE WEB Show the entire user journey from opening the website to completing quizzes and receiving rewards. Include all major navigation paths and decision points. Use short French phrases inside the boxes. OUTPUT 2 — Detailed training-mode flowchart Title: MODE ENTRAÎNEMENT — DÉROULEMENT D'UN QUIZ Show: Start → Question → First attempt → Correct/Incorrect → Second attempt if needed → Explanation → Next question → Results. Include the XP system. OUTPUT 3 — Detailed challenge-mode flowchart Title: MODE DÉFI — PROGRESSION ET DÉBLOCAGE Show: Start → Questions → Results → Score ≥ 50%? → Success/Failure → Rewards → Unlock next level/world. OUTPUT 4 — Application communication flowchart Title: CYBERQUEST — COMMUNICATION ENTRE LES APPLICATIONS Show the relationship between:
Application Java.
Database.
Website.
Users.
JSON export.
Other groups' Java applications. OUTPUT 5 — Short oral explanation Write a simple, natural French explanation that I can use during my university presentation. It should explain:
The purpose of the website.
How users navigate through CyberQuest.
The progressive learning system.
The two quiz modes.
The rewards and results system.
How the website communicates with the database and the Java application. Keep this explanation concise, clear and easy to present orally. FINAL INSTRUCTIONS The flowcharts must be:
Complete: Include all the functionalities described above.
Logical: Every decision must lead to an understandable next step.
Readable: Avoid overcrowded diagrams.
Professional: Suitable for a BUT Réseaux & Télécommunications project presentation.
Educational: Someone unfamiliar with CyberQuest should immediately understand how the website works.
Nontechnical: No programming code, pseudocode, database queries or implementation details.
In French: Use the terminology expected in a French university. Very important: If including every functionality makes the main flowchart too complicated, create a simplified main flowchart and separate detailed flowcharts for individual functionalities. Do not omit any functionality. Instead, organize the information into clear sections. The final goal is to explain what we intend to develop, not how we will program it.
- **Réponse du LLM (résumé) :** Une page avec 4 organigrammes (vue d'ensemble avec les sept mondes, mode entraînement, mode défi, communication entre le site, la base de données, l'application Java et les autres groupes) et un texte d'oral d'environ 2 minutes.
- **Ce que j'en ai fait :** Utilisé après modifications. J'ai demandé de corriger les textes qui étaient collés ou mal alignés dans les schémas (deux prompts de suite : « il y a encore ce problème » avec captures d'écran), puis d'exporter le tout en PDF en séparant l'explication orale. Le contenu des schémas a été gardé tel quel.
