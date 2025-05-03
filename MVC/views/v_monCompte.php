<link rel="stylesheet" href="style.css">

<h2>Mon compte</h2>

<form method="POST" action="index.php?action=updateCompte" class="compte-form">
    <label>Nom :</label><br>
    <input type="text" name="nom" value="<?= htmlspecialchars($client['nomClient']) ?>" required><br><br>

    <label>Prénom :</label><br>
    <input type="text" name="prenom" value="<?= htmlspecialchars($client['prenomClient']) ?>" required><br><br>

    <label>Email :</label><br>
    <input type="email" name="email" value="<?= htmlspecialchars($client['emailClient']) ?>" required><br><br>

    <button type="submit">Mettre à jour</button>
</form>
