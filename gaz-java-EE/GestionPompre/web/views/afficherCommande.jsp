<%-- 
    Document   : afficherCommande
    Created on : Apr 10, 2024, 2:35:53 PM
    Author     : Ing Ivenson
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.util.List" %>
<%@page import = "Models.Commandes" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Afficher commande</title>
        <style>
            table {
                    margin-inline: 5%;
                    width: 155vh;
                    border-collapse: collapse;
                    
                    margin-top: 70px;

                  }
                  th, td {

                    padding: 8px;
                    text-align: center;
                    font-size: 14px;
                  }

                  th {
                    font-size: 14px;
                    background-color: #f2f2f2;
                    color:black;
                  }

                  /* Styles pour les lignes impaires */
                  tr:nth-child(odd) {
                    background-color: #f9f9f9;
                  }

                  /* Styles pour les lignes paires */
                  tr:nth-child(even) {
                    background-color: #e6e6e6;
                  }
                  td:nth-child(1), th:nth-child(1) {
                    width: 12%; /* Première colonne */
                  }
                  td:nth-child(2), th:nth-child(2) {
                    width: 15%; /* Deuxième colonne */
                  }

                  td:nth-child(3), th:nth-child(3) {
                    width: 13%; /* Troisième colonne */
                  }
                  td:nth-child(4), th:nth-child(4) {
                    width: 13%; /* Deuxième colonne */
                  }

                  td:nth-child(5), th:nth-child(5) {
                    width: 13%; /* Troisième colonne */

                  }
                  td:nth-child(6), th:nth-child(6) {
                    width: 16%; /* Deuxième colonne */
                  }

                  td:nth-child(7), th:nth-child(7) {
                    width: 16%; /* Troisième colonne */
                  }
                  tr:nth-child(odd) {
                    background-color: #f9f9f9;
                  }

                  /* Styles pour les lignes paires */
                  tr:nth-child(even) {
                    background-color: #e6e6e6;
                  }

                  /* Style pour les lignes au survol */
                  tr:hover {
                    background-color: #ddd;
                    cursor: pointer;
                  }

        </style>
    </head>
    <body>
         <%@include file="menu.jsp" %>
         <div>
        <%
            List<String> liste = Commandes.fichierCommande();
            String ligne[] = null;
            if(!liste.isEmpty()){
                for(String chaine : liste){
                    ligne = chaine.split(",");
                    %>
                    <h2>Tableau de commande</h2>
                    <table>
                        <thead>
                            <th>Code</th>
                            <th>Qte gazoline</th>
                            <th>Qte diesel</th>
                            <th>Date</th>
                            <th>Etat</th>
                        </thead>
                        <tbody>
                            <td><%= ligne[0] %></td>
                            <td><%= ligne[1] %></td>
                            <td><%= ligne[2] %></td>
                            <td><%= ligne[3] %></td>
                            <td><%= ligne[4] %></td>
                        </tbody>
                    </table>
                    <%
                }
            }
            else{
                out.println("<p>Aucune commande n'a ete place</p><p>Vide...</p>");
            }
        %>
         </div>
    </body>
</html>

