<?php

class ConnexionController {
    private $db;

    public function __construct($db) {
        $this->db = $db;
    }

    public function login($email, $mdp) {
        $query = "SELECT * FROM clients WHERE emailClient = :email";
        $stmt = $this->db->prepare($query);
        $stmt->bindParam(":email", $email);
        $stmt->execute();
        $client = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($client && password_verify($mdp, $client['mdpClient'])) {
            $_SESSION['client_id'] = $client['id'];
            $_SESSION['client_nom'] = $client['nomClient'];
            header("Location: index.php?action=liste");  
        } else {
            echo "Email ou mot de passe incorrect.";
        }
    }

    public function register($data) {
        $mdpHash = password_hash($data['mdp'], PASSWORD_DEFAULT);
        $query = "INSERT INTO clients (nomClient, prenomClient, emailClient, mdpClient)
                  VALUES (:nom, :prenom, :email, :mdp)";
        $stmt = $this->db->prepare($query);
        $stmt->bindParam(":nom", $data['nom']);
        $stmt->bindParam(":prenom", $data['prenom']);
        $stmt->bindParam(":email", $data['email']);
        $stmt->bindParam(":mdp", $mdpHash);

        if ($stmt->execute()) {
            $client_id = $this->db->lastInsertId();
        
            $_SESSION['client_id'] = $client_id;
            $_SESSION['client_nom'] = $data['nom'];
            $_SESSION['confirmation'] = "Bienvenue " . htmlspecialchars($data['prenom']) . ", votre compte a bien été créé !";
        
            header("Location: index.php?action=liste");
            exit;
        }
        
    }

    // Afficher infos du compte
    public function monCompte($idClient) {
        $query = "SELECT * FROM clients WHERE id = :id";
        $stmt = $this->db->prepare($query);
        $stmt->bindParam(":id", $idClient);
        $stmt->execute();
        $client = $stmt->fetch(PDO::FETCH_ASSOC);

        require 'views/v_monCompte.php';
    }

    // Modifier infos du compte
    public function updateCompte($idClient, $data) {
        $query = "UPDATE clients 
                SET nomClient = :nom, prenomClient = :prenom, emailClient = :email
                WHERE id = :id";
        $stmt = $this->db->prepare($query);
        $stmt->bindParam(":nom", $data['nom']);
        $stmt->bindParam(":prenom", $data['prenom']);
        $stmt->bindParam(":email", $data['email']);
        $stmt->bindParam(":id", $idClient);

        if ($stmt->execute()) {
            echo "✅ Informations mises à jour avec succès !";
            echo '<br><a href="index.php?action=liste">← Retour</a>';
        } else {
            echo "❌ Erreur lors de la mise à jour.";
        }
    }


    public function logout() {
        session_destroy();
        header("Location: index.php?action=auth");
    }
}
