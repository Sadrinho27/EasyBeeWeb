<?php include 'views/layouts/nav.php'; ?>
<link rel="stylesheet" href="style.css">

<h1>Ajouter un Client</h1>
<form action="index.php?action=create" method="POST">
    <label for="nom">Nom:</label>
    <input type="text" id="nom" name="nom" required>

    <label for="prenom">Prénom:</label>
    <input type="text" id="prenom" name="prenom" required>

    
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required>
    
    <button type="submit">Ajouter</button>
</form>
