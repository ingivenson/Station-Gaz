<%-- 
    Document   : afficherVente
    Created on : Apr 8, 2024, 6:32:30 PM
    Author     : Christina SARILUS
--%>

<%@ page import="java.util.Date" %>
<%@ page import="Models.Vente" %>
<%@page import= "java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            h1 {
                text-align: center;
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                border: 1px solid black;
                padding: 8px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            button {
                background-color: navy; /* Green */
                border: none;
                color: white;
                padding: 15px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
            }
            button a {
                color: white;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <h1>Liste des ventes :</h1>
        <%
            List <String> affVente = Vente.afficherVentes();
            if(!affVente.isEmpty()){
                %>
            <table>
                <thead>
                    <th>ID vente</th>
                    <th>Station</th>
                    <th>Date vente</th>
                    <th>Qte diesel</th>
                    <th>Prix diesel</th>
                    <th>Qte gasoline</th>
                    <th>Prix gasoline</th>
                    <th>Total</th>
                </thead>
                <%
                String ligne[] = null;
                for(String chaine: affVente){
                    ligne = chaine.split(":");
                    
                    %>
                <tbody>
                    <tr>
                        <td> <%=ligne[0]%> </td>
                        <td> <%=ligne[1]%> </td>
                        <td> <%=ligne[2]%> </td>
                        <td> <%=ligne[3]%> </td>
                        <td> 620 G </td>
                        <td> <%=ligne[4]%> </td>
                        <td> 560 G </td>
                        <td> <%=ligne[5]%>G </td>
                    </tr>
                    <%
                }
                %>
                    </tbody>
                </table>                
                <%
            }else{
                %>
                <p>Aucune vente n'a ete effectue...</p>
                <%
            }
            
        %>
        <br><br>
        <button id="retour" ><a href="enregistrerVente.jsp">Enregistrer une autre vente</a></button>
        <button id="menuV" ><a href="../index.jsp">Retour</a></button>
    </body>
</html>
