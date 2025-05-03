<?php

class Formations {
    private $conn;
    private $table_name = "formations";

    public $id;
    public $titreFormation;
    public $descriptionFormation;
    public $prixFormation;
    public $dateDebutForm;
    public $dtFinForm;
    public $placeMaxForm;
    public $idModalite;
    public $idLieu;
    public $idNiv;

    public function __construct($db) {
        $this->conn = $db;
    }

    public function readAll() {
        $query = "SELECT f.*, l.libelle AS lNom, m.libelle AS mNom, n.libelle AS nNom
        FROM formations f
        JOIN lieu_form l ON f.idLieu = l.id
        JOIN modalite_form m ON f.idModalité = m.id
        JOIN niveau_form n ON f.idNiv = n.id";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    public function readFiltered($lieu, $niveau, $prix, $tri, $ordre) {
        $query = "SELECT f.*, l.libelle AS lNom, m.libelle AS mNom, n.libelle AS nNom
                  FROM formations f
                  JOIN lieu_form l ON f.idLieu = l.id
                  JOIN modalite_form m ON f.idModalité = m.id
                  JOIN niveau_form n ON f.idNiv = n.id
                  WHERE 1=1";
    
        $params = [];
    
        if (!empty($lieu)) {
            $query .= " AND f.idLieu = ?";
            $params[] = $lieu;
        }
    
        if (!empty($niveau)) {
            $query .= " AND f.idNiv = ?";
            $params[] = $niveau;
        }
    
        if (!empty($prix)) {
            $query .= " AND f.prixFormation <= ?";
            $params[] = $prix;
        }
    
        // Sécurité pour tri : liste blanche
        $validTri = ['titreFormation', 'prixFormation', 'dateDebutForm'];
        $validOrdre = ['ASC', 'DESC'];

        if (in_array($tri, $validTri) && in_array($ordre, $validOrdre)) {
            $query .= " ORDER BY f." . $tri . " " . $ordre;
        } else {
            $query .= " ORDER BY f.titreFormation ASC";
        }   
    
        $stmt = $this->conn->prepare($query);
        $stmt->execute($params);
        return $stmt;
    }
    public function getLieux() {
        $stmt = $this->conn->prepare("SELECT id, libelle AS nomLieu FROM lieu_form");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    public function getNiveaux() {
        $stmt = $this->conn->prepare("SELECT id, libelle AS nomNiveau FROM niveau_form");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    
    public function inscrire($idFormation, $idClient) {
        // Empêche la double inscription
        $checkQuery = "SELECT * FROM inscriptions WHERE idClient = :idClient AND idFormation = :idFormation";
        $checkStmt = $this->conn->prepare($checkQuery);
        $checkStmt->bindParam(":idClient", $idClient);
        $checkStmt->bindParam(":idFormation", $idFormation);
        $checkStmt->execute();
    
        if ($checkStmt->rowCount() > 0) {
            return false;
        }
    
        $query = "INSERT INTO inscriptions (idClient, idFormation) VALUES (:idClient, :idFormation)";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(":idClient", $idClient);
        $stmt->bindParam(":idFormation", $idFormation);
        return $stmt->execute();
    }    
    
    public function getById($id) {
        $query = "SELECT f.*, l.libelle AS lNom, m.libelle AS mNom, n.libelle AS nNom
                  FROM formations f
                  JOIN lieu_form l ON f.idLieu = l.id
                  JOIN modalite_form m ON f.idModalité = m.id
                  JOIN niveau_form n ON f.idNiv = n.id
                  WHERE f.id = :id";
                  
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(":id", $id, PDO::PARAM_INT);
        $stmt->execute();
    
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
    
    public function create() {
        $query = "INSERT INTO " . $this->table_name . " 
        (titreFormation, descriptionFormation, prixFormation, dateDebutForm, dtFinForm, placeMaxForm, idModalite, idLieu, idNiv) 
        VALUES (:titreFormation, :descriptionFormation, :prixFormation, :dateDebutForm, :dtFinForm, :placeMaxForm, :idModalite, :idLieu, :idNiv)";
        
        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(":titreFormation", $this->titreFormation);
        $stmt->bindParam(":descriptionFormation", $this->descriptionFormation);
        $stmt->bindParam(":prixFormation", $this->prixFormation);
        $stmt->bindParam(":dateDebutForm", $this->dateDebutForm);
        $stmt->bindParam(":dtFinForm", $this->dtFinForm);
        $stmt->bindParam(":placeMaxForm", $this->placeMaxForm);
        $stmt->bindParam(":idModalite", $this->idModalite);
        $stmt->bindParam(":idLieu", $this->idLieu);
        $stmt->bindParam(":idNiv", $this->idNiv);

        return $stmt->execute();
    }
}