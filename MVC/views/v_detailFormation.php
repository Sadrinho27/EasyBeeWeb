<link rel="stylesheet" href="style.css">

<h2>Détail de la formation</h2>

<div class="formation-detail">
    <p><strong>Titre :</strong> <?= htmlspecialchars($formation['titreFormation']) ?></p>
    <p><strong>Description :</strong> <?= htmlspecialchars($formation['descriptionFormation']) ?></p>
    <p><strong>Prix :</strong> <?= htmlspecialchars($formation['prixFormation']) ?> €</p>
    <p><strong>Date de début :</strong> <?= htmlspecialchars($formation['dateDebutForm']) ?></p>
    <p><strong>Date de fin :</strong> <?= htmlspecialchars($formation['dtFinForm']) ?></p>
    <p><strong>Places max :</strong> <?= htmlspecialchars($formation['placeMaxForm']) ?></p>
    <p><strong>Lieu :</strong> <?= htmlspecialchars($formation['lNom']) ?></p>
    <p><strong>Niveau :</strong> <?= htmlspecialchars($formation['nNom']) ?></p>
    <p><strong>Modalité :</strong> <?= htmlspecialchars($formation['mNom']) ?></p>

    <?php if (isset($_SESSION['client_id'])): ?>
    <!-- Message d'inscription réussie -->
    <?php if (isset($_GET['success']) && $_GET['success'] == '1'): ?>
        <div class="success-message">
            ✅ Inscription réussie ! Vous êtes maintenant inscrit à cette formation.
        </div>
    <?php endif; ?>

    <!-- Message si l'utilisateur est déjà inscrit -->
    <?php if (isset($_GET['already_registered']) && $_GET['already_registered'] == '1'): ?>
        <div class="error-message">
            ❌ Vous êtes déjà inscrit à cette formation.
        </div>
    <?php endif; ?>

        <!-- Lien pour s'inscrire -->
        <a href="index.php?action=inscrire&id=<?= $formation['id'] ?>" class="cta-button">M'inscrire à cette formation</a>
    <?php else: ?>
        <a href="index.php?action=auth" class="cta-button">Connectez-vous pour vous inscrire</a>
    <?php endif; ?>
</div>
