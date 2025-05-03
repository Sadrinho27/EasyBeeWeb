<link rel="stylesheet" href="style.css">

<h2>Liste des formations</h2>

<div class="container-formations">
    <!-- Formulaire de filtre -->
    <form class="filter-form" method="GET" action="">
        <label for="lieu">Lieu :</label>
        <select name="lieu">
            <option value="">Tous</option>
            <?php foreach ($lieux as $lieu) { ?>
                <option value="<?= $lieu['id'] ?>" <?= isset($_GET['lieu']) && $_GET['lieu'] == $lieu['id'] ? 'selected' : '' ?>>
                    <?= htmlspecialchars($lieu['nomLieu']) ?>
                </option>
            <?php } ?>
        </select>

        <label for="niveau">Niveau :</label>
        <select name="niveau">
            <option value="">Tous</option>
            <?php foreach ($niveaux as $niveau) { ?>
                <option value="<?= $niveau['id'] ?>" <?= isset($_GET['niveau']) && $_GET['niveau'] == $niveau['id'] ? 'selected' : '' ?>>
                    <?= htmlspecialchars($niveau['nomNiveau']) ?>
                </option>
            <?php } ?>
        </select>

        <label for="prix">Prix max :</label>
        <input type="number" name="prix" value="<?= isset($_GET['prix']) ? $_GET['prix'] : '' ?>">

        <label for="tri">Trier par :</label>
        <select name="tri">
            <option value="titreFormation" <?= isset($_GET['tri']) && $_GET['tri'] == 'titreFormation' ? 'selected' : '' ?>>Titre</option>
            <option value="prixFormation" <?= isset($_GET['tri']) && $_GET['tri'] == 'prixFormation' ? 'selected' : '' ?>>Prix</option>
            <option value="dateDebutForm" <?= isset($_GET['tri']) && $_GET['tri'] == 'dateDebutForm' ? 'selected' : '' ?>>Date de début</option>
        </select>
        <label for="ordre">Ordre :</label>
        <select name="ordre">
            <option value="ASC" <?= (isset($_GET['ordre']) && $_GET['ordre'] == 'ASC') ? 'selected' : '' ?>>Croissant</option>
            <option value="DESC" <?= (isset($_GET['ordre']) && $_GET['ordre'] == 'DESC') ? 'selected' : '' ?>>Décroissant</option>
        </select>
        <button type="submit">Filtrer</button>
    </form>

    <!-- Tableau des formations -->
    <div class="table-formations">
        <table>
            <thead>
                <tr>
                    <th>Titre</th>
                    <th>Description</th>
                    <th>Prix</th>
                    <th class="nowrap">Date de début</th>
                    <th class="nowrap">Date de fin</th>
                    <th>Places max</th>
                    <th>Modalité</th>
                    <th>Lieu</th>
                    <th>Niveau</th>
                    <th>Details</th>
                </tr>
            </thead>
            <tbody>
                <?php if (isset($_SESSION['confirmation'])): ?>
                    <div class="confirmation">
                        <?= $_SESSION['confirmation'] ?>
                    </div>
                    <?php unset($_SESSION['confirmation']); ?>
                <?php endif; ?>
                <?php foreach ($formationsList as $formation) { ?>
                    <tr>
                        <td><?php echo htmlspecialchars($formation['titreFormation']); ?></td>
                        <td><?php echo htmlspecialchars($formation['descriptionFormation']); ?></td>
                        <td><?php echo htmlspecialchars($formation['prixFormation']); ?></td>
                        <td><?php echo htmlspecialchars($formation['dateDebutForm']); ?></td>
                        <td><?php echo htmlspecialchars($formation['dtFinForm']); ?></td>
                        <td><?php echo htmlspecialchars($formation['placeMaxForm']); ?></td>
                        <td><?php echo htmlspecialchars($formation['mNom']); ?></td>
                        <td><?php echo htmlspecialchars($formation['lNom']); ?></td>
                        <td><?php echo htmlspecialchars($formation['nNom']); ?></td>
                        <td><a href="index.php?action=detail&id=<?= $formation['id'] ?>">Voir détail</a></td>
                    </tr>
                <?php } ?>
            </tbody>
        </table>
    </div>
</div>