# EasyBeeWeb

**EasyBeeWeb** est une entreprise spécialisé qui propose des fomations dans le domaine de l'apiculture. Avant de procéder à son déploiement, assurez-vous que votre environnement serveur répond aux prérequis suivants.

## ✅ Prérequis

* Serveur Web Apache
* PHP version 7.4 ou supérieure
* Serveur MySQL ou MariaDB

---

## 🚀 Installation

### 1. Cloner le dépôt

Connectez-vous à votre serveur et placez-vous dans le répertoire racine de votre serveur web (par exemple : `www` ou `htdocs`), puis exécutez la commande suivante :

```bash
git clone https://github.com/Sadrino27/EasyBeeWeb.git
```

> 💡 Vous pouvez également télécharger le projet au format ZIP depuis GitHub, puis le décompresser dans le répertoire du serveur.

---

### 2. Configuration de la base de données

1. Importez le fichier `easybee_projet3.sql` dans votre base de données via **phpMyAdmin** ou un autre outil de gestion SQL.
2. Ouvrez le fichier `database.php` (situé dans le projet) et modifiez les informations de connexion :

```php
$host = 'localhost';
$dbname = 'nom_de_votre_base';
$user = 'votre_utilisateur';
$password = 'votre_mot_de_passe';
```

---

### 3. Accéder à l'application

Ouvrez votre navigateur et accédez à l'URL suivante :

```
http://votre-serveur/EasyBeeWeb/MVC
```

> Assurez-vous que le dossier `EasyBeeWeb` est bien placé dans le répertoire accessible par votre serveur web.
