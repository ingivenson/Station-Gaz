<%-- 
    Document   : commande
    Created on : 7 avr. 2024, 07:57:06
    Author     : Perfectus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.io.File" %>
<%@page import = "java.util.List" %>
<%@page import = "Models.Commandes" %>
<%@page import= "java.io.FileWriter" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Commande</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f0f0f0; /* Couleur de fond */
        }
        
        .container {
            text-align: center;
            padding: 20px;
            border: 1px solid #ccc;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        form {
            margin-top: 20px;
        }

        button {
            margin-top: 20px;
            background-color:buttonface;
            
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        button a {
           color: white;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <%!
            File file2=new File("donnees.txt");
        %>
        <%
            FileWriter fw = null;
            fw = new FileWriter(file2, true);
            fw.close();
            List<String> liste = Commandes.nombreCommande();
            if(!liste.isEmpty()) {
        %>
            <div>
                <p>Une commande est en cours.</p>
                <p>Veuillez attendre la décision de l'administrateur !</p>
            </div>
        <% } else { %>    
            <form action="../controller/traitement_commande.jsp" method="post">
                <label>Placez une commande :</label>
                <br>
                <input type="submit" value="Approvisionner">
            </form>
        <% } %>
        <button id="id">
            <a href="../index.jsp" style="text-decoration: none; color: blue;">Retour à la page d'accueil</a>
        </button>
    </div>
</body>
</html>
