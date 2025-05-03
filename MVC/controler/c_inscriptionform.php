<?php

class InscriptionController {
    private $db;

    public function __construct($db) {
        $this->db = $db;
    }

    // Inscrire un client connecté à une formation
    public function inscrire($idClient, $idFormation) {
        // Vérifier si l'utilisateur est déjà inscrit à cette formation
        $checkQuery = "SELECT * FROM inscrire WHERE idUtilisateur = :idUtilisateur AND idForm = :idForm";
        $checkStmt = $this->db->prepare($checkQuery);
        $checkStmt->bindParam(":idUtilisateur", $idClient);
        $checkStmt->bindParam(":idForm", $idFormation);
        $checkStmt->execute();
        
        // Si l'utilisateur est déjà inscrit, afficher un message et ne pas insérer
        if ($checkStmt->rowCount() > 0) {
            // Rediriger avec un message indiquant que l'utilisateur est déjà inscrit
            header("Location: index.php?action=detail&id=$idFormation&already_registered=1");
            exit();
        }
    
        // Sinon, procéder à l'inscription
        $query = "INSERT INTO inscrire (idUtilisateur, idForm, etatInscription, dateInscription, montantRegle)
                  VALUES (:idUtilisateur, :idForm, 'En attente', NOW(),
                  (SELECT prixFormation FROM formations WHERE id = :idForm))";
    
        $stmt = $this->db->prepare($query);
        $stmt->bindParam(":idUtilisateur", $idClient);
        $stmt->bindParam(":idForm", $idFormation);
    
        if ($stmt->execute()) {
            // Rediriger avec un message de succès
            header("Location: index.php?action=detail&id=$idFormation&success=1");
            exit();
        } else {
            echo "❌ Erreur pendant l'inscription.";
        }
    }

    // Affiche les formations auxquelles le client est inscrit
    public function mesInscriptions($idClient) {
        $query = "SELECT f.*, i.etatInscription, i.dateInscription, i.montantRegle
                  FROM inscrire i
                  JOIN formations f ON i.idForm = f.id
                  WHERE i.idUtilisateur = :idUtilisateur";

        $stmt = $this->db->prepare($query);
        $stmt->bindParam(":idUtilisateur", $idClient);
        $stmt->execute();
        $inscriptions = $stmt->fetchAll(PDO::FETCH_ASSOC);

        require 'views/v_mesInscriptions.php';
    }
}
