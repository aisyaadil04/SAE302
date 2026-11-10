## Guide de connexion SSH à la machine virtuelle

**Prérequis :**
- Un ordinateur avec un terminal (macOS ou Linux).
- Un accès au VPN de l'université si l'on se connecte depuis l'extérieur.
- Le service SSH actif sur la VM.

**Important :** Chaque membre du groupe doit créer sa propre paire de clés SSH. Il ne faut jamais partager sa clé privée.


### 1. Vérifier les clés SSH existantes

**Sur son ordinateur personnel**, ouvrir un terminal et exécuter :

```bash
ls -la ~/.ssh
```

Cette commande affiche les fichiers du dossier `.ssh`.

On peut notamment y trouver :

- `id_ed25519` : clé privée.
- `id_ed25519.pub` : clé publique.
- `known_hosts` : liste des serveurs SSH déjà rencontrés.

Si une clé existe déjà, il est possible de la réutiliser. Pour notre projet, nous créerons une clé spécifique afin d'éviter d'écraser une clé existante.

---

### 2. Générer une paire de clés SSH

**Sur son ordinateur personnel (Mac ou Linux) :**

```bash
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519_cyberquest -C "cyberquest-vm"
```

Le terminal demande ensuite :

```text
Enter passphrase (empty for no passphrase):
```

Il est recommandé de définir une phrase secrète (*passphrase*) pour protéger la clé privée.

Confirmer ensuite cette phrase secrète.

Deux fichiers sont créés :

```text
~/.ssh/id_ed25519_cyberquest
~/.ssh/id_ed25519_cyberquest.pub
```

- Le premier est la **clé privée** : elle doit rester sur l'ordinateur personnel.
- Le second est la **clé publique** : elle sera ajoutée sur la VM.


---

### 3. Récupérer la clé publique

**Sur son ordinateur personnel :**

```bash
cat ~/.ssh/id_ed25519_cyberquest.pub
```

Le terminal affiche une ligne commençant par :

```text
ssh-ed25519 AAAA... cyberquest-vm
```

Copier cette ligne complète.


---

### 4. Verification de la VM avec Remote Viewer

Pour vérifier l'adresse IP de la VM :

```bash
hostname -I
```

Pour vérifier que le serveur SSH fonctionne :

```bash
systemctl is-active ssh
```



---

### 5. Ajouter la clé publique sur la VM


Créer le dossier SSH si nécessaire :

```bash
mkdir -p ~/.ssh
```

Définir ses permissions :

```bash
chmod 700 ~/.ssh
```

Ouvrir le fichier contenant les clés publiques autorisées :

```bash
nano ~/.ssh/authorized_keys
```

Coller la clé publique copiée à l'étape 3.

**Important :**
- Mettre une clé publique complète par ligne.
- Ne pas supprimer les clés publiques déjà présentes.
- Chaque membre doit ajouter sa propre clé sur une nouvelle ligne.
- Ne jamais ajouter de clé privée dans ce fichier.


Configurer les permissions :

```bash
chmod 600 ~/.ssh/authorized_keys
```



---

### 6. Se connecter à la VM depuis son ordinateur

Une fois la clé publique enregistrée sur la VM, revenir au **terminal de son ordinateur personnel**.

Exécuter :

```bash
ssh -i ~/.ssh/id_ed25519_cyberquest rt@10.3.122.20
```


---

### 7. Fermer la connexion SSH

Pour quitter proprement la VM :

```bash
exit
```

Ou utiliser :

`Ctrl + D`

Le terminal revient alors sur l'ordinateur personnel.

**Remarque :** Fermer la session SSH n'arrête pas la VM. Les services Apache et MariaDB continuent de fonctionner.
---

