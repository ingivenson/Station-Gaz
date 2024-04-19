<%-- 
    Document   : validVente
    Created on : Apr 10, 2024, 10:53:41 AM
    Author     : Christina SARILUS
--%>

<%@page import= "java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            padding: 20px;
        }
        h2 {
            text-align: center;
        }
        p {
            margin: 0;
            padding: 10px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        button {
            margin: 10px;
            padding: 10px 20px;
            background-color: navy;
            color: white;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            cursor: pointer;
        }
        button:hover {
            background-color: blue;
        }
        button a {
            text-decoration: none;
            color: white;
        }
    </style>
    </head>
    <body>
        <%
            // Récupérez la liste de données de la dernière vente à partir de l'attribut de requête
            List<String> derniereVenteData = (List<String>) request.getAttribute("derniereVenteData");
        %>

        <h2>Détails de la vente effectuée :</h2>
        <%
            // Parcourez la liste et affichez les données
            if (derniereVenteData != null) {
                for (String data : derniereVenteData) {
                    out.println("<p>" + data + "</p>");
                }
            } else {
                out.println("<p>Aucune donnée de vente disponible.</p>");
            }
        %>
        <button id="retour" ><a href="enregistrerVente.jsp">Retour</a></button>
    </body>
</html>
