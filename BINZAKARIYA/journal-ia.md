# Journal d'utilisation de l'IA – Aiman Iskandar Zulqarnain BIN ZAKARIYA

## 2026-10-14 - Guidage du fichier Markdown

- **LLM utilisé :**  DeepSeek
- **Objectif :** Un guide du fichier Markdown
- **Prompt :**
  > Donne-moi un guide pour fichier markdown.
- **Réponse du LLM :** cf. GuidageMarkdown.txt
- **Ce que j'en ai fait :** Créer un fichier markdown

## 2026-11-18 - Choix entre JavaFX et Web

Donc, c’est le siteweb qui est globale?

Non, JavaFX est avant tout une technologie d'application locale (bureau), et non un site web. Mon explication précédente portait sur la portée des variables dans le code (variables locales à une fonction vs globales à une classe), et non sur l'hébergement réseau.
Si votre question porte sur où s'exécute le programme (en local sur l'ordinateur de l'utilisateur ou sur un serveur web), voici la distinction claire.

1. JavaFX = Application Locale (Desktop)

JavaFX sert à créer des logiciels qui s'installent et tournent directement sur l'ordinateur de l'utilisateur (Windows, macOS, Linux).
• Exécution locale : Tout le code graphique s'exécute sur le PC du client, utilisant sa propre mémoire et sa carte graphique.
• Connexion facultative : Une application JavaFX peut fonctionner 100 % hors ligne, comme une calculatrice ou un éditeur de texte.

2. Le Site Web = Application Distante ("Globale")

Un site web est hébergé sur un serveur distant et s'affiche dans un navigateur (Chrome, Firefox, Safari).
• Technologies différentes : On n'utilise pas JavaFX pour faire un site web classique, mais du HTML, CSS et JavaScript (ou des frameworks comme React, Angular, etc.).
• JavaFX sur le web (Cas rare) : Bien qu'il existe des outils tiers (comme JPro) permettant d'afficher une application JavaFX dans un navigateur web, ce n'est pas son usage naturel ni recommandé pour débuter.

3. Comment les deux communiquent ?

Si vous voulez que votre application JavaFX (locale) partage des données avec le monde entier ("globale"), vous devez les relier.
• L'application JavaFX (Client) : Elle reste installée en local sur chaque ordinateur.
• Le Serveur / Base de données (Global) : Il est hébergé en ligne. L'application JavaFX lui envoie et lui demande des informations via Internet (souvent avec des requêtes HTTP / API REST).
Pour que je puisse vous orienter vers la bonne technologie, quel est votre objectif précis ?
• Créer un logiciel à installer sur un ordinateur ?
• Créer un site internet accessible depuis un navigateur ?
• Faire communiquer une application JavaFX avec une base de données en ligne ?
