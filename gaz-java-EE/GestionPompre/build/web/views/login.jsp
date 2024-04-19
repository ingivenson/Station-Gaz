<%-- 
    Document   : login
    Created on : Apr 9, 2024, 9:29:46 PM
    Author     : Ing Ivenson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>Page de Connexion</title>
    <script>
        function authenticate() {
            var username = document.getElementById('username').value;
            var password = document.getElementById('password').value;

            // Vérifier si les champs ne sont pas vides
            if (username === '' || password === '') {
                alert('Veuillez saisir un nom d\'utilisateur et un mot de passe.');
                return;
            }

            // Vérifier les informations d'authentification côté client (simulation)
            if (username === 'admin' && password === 'admin') {
                 
                window.location.href = '../views/Dashbord.jsp'; // Redirection vers la page d'accueil
            } else {
                alert('Identifiants incorrects. Veuillez réessayer.');
            }
        }
    </script>
    <link rel="stylesheet" href="../css/login.css">
    </head>
    <body>
  
 
    <div class="container">
        
        <div class="image-container">
            <img src="../images/pexels-gustavo-fring-4173096.jpg" alt="Image avec flou">
        </div>
        <form>
            
            <h2 style="margin-left: 25%;">Connexion</h2>
            <label for="username">Nom d'utilisateur:</label>
            <input type="text" id="username" name="username" required>
            <label for="password">Mot de passe:</label>
            <input type="password" id="password" name="password" required>
            <button type="button" onclick="authenticate()">Se connecter</button>
            <p></p>
            <a href="../index.jsp" style="text-decoration: none; ">
              <p style="text-align: center;">Retour à la <span style="font-weight: bold;">page d'accueil</span></p>
           </a>
        </form>
    </div>
</body>
</html>
