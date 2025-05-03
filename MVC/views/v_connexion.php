<link rel="stylesheet" href="style.css">

<h2>Bienvenue</h2>

<div class="form-container">

    <!-- Connexion -->
    <form method="POST" action="index.php?action=login">
        <h3>Se connecter</h3>
        <label>Email :</label><br>
        <input type="email" name="email" required><br>

        <label>Mot de passe :</label><br>
        <input type="password" name="mdp" required><br><br>

        <button type="submit">Connexion</button>
    </form>

    <!-- Inscription -->
    <form method="POST" action="index.php?action=register">
        <h3>Créer un compte</h3>
        <label>Nom :</label><br>
        <input type="text" name="nom" required><br>

        <label>Prénom :</label><br>
        <input type="text" name="prenom" required><br>

        <label>Email :</label><br>
        <input type="email" name="email" required><br>

        <label>Mot de passe :</label><br>
        <input type="password" name="mdp" required><br><br>

        <button type="submit">Inscription</button>
    </form>

</div>
