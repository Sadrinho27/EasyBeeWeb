<?php

require_once 'model/Formations.php';

class FormationController {
    private $db;

    public function __construct($db) {
        $this->db = $db;
    }

    public function liste() {
        $formations = new Formations($this->db);
    
        // Récupère les filtres depuis $_GET
        $lieu = isset($_GET['lieu']) ? $_GET['lieu'] : '';
        $niveau = isset($_GET['niveau']) ? $_GET['niveau'] : '';
        $prix = isset($_GET['prix']) ? $_GET['prix'] : '';
        $tri = isset($_GET['tri']) ? $_GET['tri'] : 'titreFormation';
        $ordre = isset($_GET['ordre']) && in_array($_GET['ordre'], ['ASC', 'DESC']) ? $_GET['ordre'] : 'ASC';

    
        // Appel au modèle avec filtres
        $stmt = $formations->readFiltered($lieu, $niveau, $prix, $tri, $ordre);
        $formationsList = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
        // Pour les <select>
        $lieux = $formations->getLieux();    // Déplacé dans le modèle (voir plus bas)
        $niveaux = $formations->getNiveaux(); // idem
    
        require_once 'views/v_listeFormation.php';
    }
    public function detail($id) {
        $formations = new Formations($this->db);
        $formation = $formations->getById($id);
        require 'views/v_detailFormation.php';
    }

    public function inscrire($idFormation, $idClient) {
        $formations = new Formations($this->db);
        $result = $formations->inscrire($idFormation, $idClient);
    
        if ($result) {
            echo "Inscription réussie !";
            // Tu peux rediriger vers une page de confirmation si tu veux
        } else {
            echo "Erreur lors de l'inscription (peut-être déjà inscrit ?)";
        }
    }
    

    public function create() {
        if ($_SERVER["REQUEST_METHOD"] === "POST") {
            $formations = new Formations($this->db);
            $formations->titreFormation = $_POST['titreFormation'];
            $formations->descriptionFormation = $_POST['descriptionFormation'];
            $formations->prixFormation = $_POST['prixFormation'];
            $formations->dateDebutForm = $_POST['dateDebutForm'];
            $formations->dtFinForm = $_POST['dtFinForm'];
            $formations->placeMaxForm = $_POST['placeMaxForm'];
            $formations->idModalite = $_POST['idModalite'];
            $formations->idLieu = $_POST['idLieu'];
            $formations->idNiv = $_POST['idNiv'];

            if ($formations->create()) {
                header("Location: index.php?action=liste");
                exit;
            }
        }
        require_once 'views/v_createFormation.php';
    }
    public function getLieux() {
        $query = "SELECT * FROM lieu_form";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    
    public function getNiveaux() {
        $query = "SELECT * FROM niveau_form";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}