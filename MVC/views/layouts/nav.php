<link rel="stylesheet" href="style.css">
<nav>
    <!-- Logo et titre -->
    <div class="nav-left">
        <img src="logoEasybee.png" alt="Logo Easybee" class="logo">
        <span class="site-title">Easybee Formations</span>
    </div>
    
    <!-- Liens de navigation à droite -->
    <div class="nav-right">
        <a href="index.php?action=liste">Liste des formations</a> |
        <?php if (isset($_SESSION['client_id'])): ?>
            <a href="index.php?action=mesinscriptions">Mes inscriptions</a> |
            <a href="index.php?action=compte">Mon compte</a> |
            <a href="index.php?action=logout">Déconnexion</a>
        <?php else: ?>
            <a href="index.php?action=auth">Connexion/Inscription</a>
        <?php endif; ?>
    </div>
</nav>
