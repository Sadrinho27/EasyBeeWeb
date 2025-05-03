<?php
session_start();

require_once 'model/database.php';
require_once 'controler/c_formation.php';
require_once 'controler/c_connexion.php';
require_once 'controler/c_inscriptionform.php';

include 'views/layouts/nav.php';

$database = new Database();
$db = $database->getBdd();

$action = $_GET['action'] ?? 'liste';

$FormationController = new FormationController($db);
$ConnexionController = new ConnexionController($db);
$InscriptionController = new InscriptionController($db); // <- Instancié une seule fois ici

switch ($action) {
    case 'liste':
        $lieu = $_GET['lieu'] ?? '';
        $niveau = $_GET['niveau'] ?? '';
        $prix = $_GET['prix'] ?? '';
        $tri = $_GET['tri'] ?? 'titreFormation';

        $FormationController->liste($lieu, $niveau, $prix, $tri);
        break;

    case 'detail':
        if (isset($_GET['id'])) {
            $FormationController->detail($_GET['id']);
        }
        break;

    case 'auth':
        require_once 'views/v_connexion.php';
        break;

    case 'login':
        $ConnexionController->login($_POST['email'], $_POST['mdp']);
        break;

    case 'register':
        $ConnexionController->register($_POST);
        break;

    case 'logout':
        $ConnexionController->logout();
        break;

    case 'inscrire':
        if (isset($_SESSION['client_id']) && isset($_GET['id'])) {
            $InscriptionController->inscrire($_SESSION['client_id'], $_GET['id']);
        } else {
            header("Location: index.php?action=auth");
        }
        break;

    case 'mesinscriptions':
        if (isset($_SESSION['client_id'])) {
            $InscriptionController->mesInscriptions($_SESSION['client_id']);
        } else {
            header("Location: index.php?action=auth");
        }
        break;
    case 'compte':
        if (isset($_SESSION['client_id'])) {
            $ConnexionController->monCompte($_SESSION['client_id']);
        } else {
            header("Location: index.php?action=auth");
        }
        break;
     
    case 'updateCompte':
        if (isset($_SESSION['client_id'])) {
            $ConnexionController->updateCompte($_SESSION['client_id'], $_POST);
        }
    break;

    default:
        echo "Action non définie.";
        break;
}
