<link rel="stylesheet" href="style.css">

<h2>Mes Inscriptions</h2>

<?php if (empty($inscriptions)) : ?>
    <p class="no-inscription-message">Vous n'êtes inscrit à aucune formation.</p>
<?php else : ?>
    <table class="inscription-table">
        <thead>
            <tr>
                <th>Titre</th>
                <th>Etat</th>
                <th>Date d'inscription</th>
                <th>Montant</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($inscriptions as $inscription) : ?>
                <tr>
                    <td><?= htmlspecialchars($inscription['titreFormation']) ?></td>
                    <td><?= htmlspecialchars($inscription['etatInscription']) ?></td>
                    <td><?= htmlspecialchars($inscription['dateInscription']) ?></td>
                    <td><?= htmlspecialchars($inscription['montantRegle']) ?> €</td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
<?php endif; ?>
