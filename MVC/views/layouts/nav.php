<style>
nav {
    background-color: #3498db;
    padding: 10px;
    text-align: center;
}
nav a {
    color: white;
    margin: 0 15px;
    text-decoration: none;
    font-weight: bold;
}
nav a:hover {
    text-decoration: underline;
}
</style>

<nav>   
<a href="index.php?action=liste">Liste des formations</a> |
    <?php if (isset($_SESSION['client_id'])): ?>
        <a href="index.php?action=mesinscriptions">Mes inscriptions</a> |
        <a href="index.php?action=compte">Mon compte</a> |
        <a href="index.php?action=logout">Déconnexion</a>
    <?php else: ?>
        <a href="index.php?action=auth">Connexion/Inscription</a>
    <?php endif; ?>
    
</nav>
