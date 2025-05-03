<?php

class InscriptionController {
    private $db;

    public function __construct($db) {
        $this->db = $db;
    }

    // Inscrire un client connecté à une formation
    public function inscrire($idClient, $idFormation) {
        $query = "INSERT INTO inscrire (idUtilisateur, idForm, etatInscription, dateInscription, montantRegle)
                  VALUES (:idUtilisateur, :idForm, 'En attente', NOW(),
                  (SELECT prixFormation FROM formations WHERE id = :idForm))";

        $stmt = $this->db->prepare($query);
        $stmt->bindParam(":idUtilisateur", $idClient);
        $stmt->bindParam(":idForm", $idFormation);

        if ($stmt->execute()) {
            echo "✅ Inscription réussie !";
            echo '<br><a href="index.php?action=liste">← Retour aux formations</a>';
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
