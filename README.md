# 🐝 EasyBee – Gestion des formations apicoles

![Logo](logoEasybee.png)

## 🌍 Contexte

**EasyBee** est une entreprise fictive spécialisée dans la vente de matériel apicole (ruches, combinaisons, pots, etc.) et la formation en apiculture.
Pour optimiser la gestion de ses formations, une application web a été développée.

L'application est destinée :

* aux **clients**, qui peuvent consulter les formations disponibles et s'y inscrire,
* aux **administrateurs**, qui peuvent gérer les inscriptions et trier les participants selon divers critères.

---

## ⚙️ Fonctionnalités

### Pour les clients :

* Consultation des formations proposées (dates, contenu, prix, etc.)
* Inscription à une formation en ligne

> D'autres fonctionnalités (gestion admin, tri, etc.) sont également disponibles pour les administrateurs.

---

## 📋 Prérequis

Avant d'installer le projet, assurez-vous de disposer des éléments suivants :

* PHP **8.2** ou supérieur
* IDE compatible (VS Code, IntelliJ, etc.)
* Serveur Web (WAMP, XAMPP, etc.)
* MySQL ou un autre système de base de données relationnelle

---

## 🚀 Installation

### 🗃️ Étape 1 : Base de données

1. Importez le fichier `easybee_projet3.sql` dans votre serveur MySQL. *(Ce fichier contient la structure de la base et des données de test.)*

### 💻 Étape 2 : Application

1. Clonez ou téléchargez ce dépôt dans le répertoire **www** ou **htdocs** de votre serveur :

```bash
git clone https://github.com/Sadrinho27/EasyBeeWeb.git
```

2. Ouvrez le projet dans votre IDE :

   * Lancez votre IDE (ex. Visual Studio Code)
   * Cliquez sur **Fichier > Ouvrir le dossier** et sélectionnez le projet

3. Configurez les informations de connexion à la base de données dans le fichier `database.php` :

```php
$host = 'localhost';
$dbname = 'nom_de_votre_base';
$user = 'votre_utilisateur';
$password = 'votre_mot_de_passe';
```

---

### ▶️ Étape 3 : Lancement de l'application

1. Démarrez votre serveur local (Apache + MySQL)
2. Accédez à l'application via votre navigateur :

```
http://localhost/EasyBeeWeb/MVC
```

---

## 📝 Informations complémentaires

* Des identifiants de test sont fournis dans le fichier SQL.
* Le dossier `MVC` contient l'ensemble de l'application.

---

## 🖼️ Aperçu

![ListeFormations](media/lsitFormations.png)
![DetailFormation](media/detailFormation.png)

---

## 👤 Auteur

Développé par [@Sadrinho27](https://github.com/Sadrinho27)
