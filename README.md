Projet3Web

Avant de déployer cette application, assurez-vous que les éléments suivants sont disponibles sur le
serveur :
- Serveur Web (Apache ou Nginx)
- PHP 7.4 ou sup'rieur
- Serveur MySQL/MariaDB
- Acc's FTP ou SSH
- Navigateur web moderne
Installation

1. Cloner le dépôt
Connectez-vous ' votre serveur, placez-vous dans le r'pertoire www ou htdocs de votre serveur web,
puis ex'cutez :
 git clone https://github.com/LeoC76/Projet3Web.git
ou téléchargez le ZIP via GitHub, puis décompressez-le sur le serveur.

2. Configuration de la base de données
- Créez une base de données MySQL sur votre serveur.
- Importez le fichier formation.sql dans votre base de données via phpMyAdmin ou la ligne de
commande :
 mysql -u utilisateur -p nom_base < chemin/vers/formation.sql
- Ouvrez le fichier de configuration (ex. config.php, bdd.php ou similaire) et modifiez les paramètres
de connexion à la base :
 $host = 'localhost';
 $dbname = 'nom_base';
 $user = 'utilisateur';
 $password = 'motdepasse';

3. Configurer les droits
 chmod -R 755 Projet3Web/

4. Accéder à l'application
Ouvrez un navigateur web et accédez à l'URL :
http://votre-serveur/Projet3Web/

