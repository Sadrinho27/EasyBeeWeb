<?php include 'views/layouts/nav.php'; ?>
<h2>Détail de la formation</h2>
<link rel="stylesheet" href="style.css">

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
    <a href="index.php?action=inscrire&id=<?= $formation['id'] ?>">M'inscrire à cette formation</a>
<?php else: ?>
    <a href="index.php?action=auth">Connectez-vous pour vous inscrire</a>
<?php endif; ?>

