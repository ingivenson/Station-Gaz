<%-- 
    Document   : administrateur
    Created on : 7 avr. 2024, 19:53:31
    Author     : Perfectus
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.io.File" %>
<%@page import = "java.io.IOException" %>
<%@page import = "java.nio.file.Files" %>
<%@page import= "java.io.FileWriter" %>
<%@page import = "java.util.ArrayList" %>
<%@page import = "java.util.List" %>
<%@page import = "Models.Commandes" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Message adm</title>
        <link rel="stylesheet" href="../css/afficher.css">
        <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            padding: 20px;
        }
        h2,h3 {
            text-align: center;
        }
        p {
            margin-left: 35px;
            padding: 10px;
            background-color: transparent;
            border-radius: 5px;
        }
        input {
            margin: 10px;
            padding: 10px 20px;
            background-color: navy;
            color: white;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            cursor: pointer;
        }
        input:hover {
            background-color: blue;
        }
        button a {
            text-decoration: none;
            color: white;
        }
        .inp{
            display: flex;
            margin: 0 auto;
            justify-content: center;
            align-items: center;
        }
        .sinon{
            margin: 0 auto;
            height:100vh; 
            width: 100%; 
            display: flex;
            justify-content: center;
            align-items: center;
        }
    </style>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <%!
            File file2=new File("donnees.txt");
        %>
        <%
                List<String> liste = Commandes.nombreCommande();
                if(!liste.isEmpty()){
                float totalGazoline = 0, totalDiesel = 0, totalLigneStation = 0;
        %>
        <form action="../controller/traitement_adm.jsp" method="post">
            <div>
                <div class="parag">
                    <h2>Message du module des gestions de stock</h2>
                    <p>
                        Une nouvelle commande d'approvisionnement pour nos stations 
                        a été demandée. Votre autorisation est requise pour procéder.
                    </p>
                    <p>
                        Veuillez consulter le tableau
                    </p>
                </div>
                <div>
                    <table>
                        <h3>Commande</h3>
                        <thead>
                            <th>Station</th>
                            <th>Gazoline</th>
                            <th>Diesel</th>
                            <th>Total par station</th>
                        </thead>
                        <tbody>
                    <%
                        String ligne[];
                        for(String chaine : liste){
                            ligne = chaine.split("~");

                            totalGazoline += Float.parseFloat(ligne[1]);
                            totalDiesel += Float.parseFloat(ligne[2]);
                            totalLigneStation = Float.parseFloat(ligne[1]) + Float.parseFloat(ligne[2]);
                    %>
                            <tr>
                                <td><%=ligne[0]%></td>
                                <td><%=ligne[1]%></td>
                                <td><%=ligne[2]%></td>
                                <td><%=totalLigneStation%></td>
                            </tr>

                            <%
                        }
                        totalGazoline *= 1.25;
                        totalDiesel *= 1.10;
                        %>
                        <tr>
                            <td>Total</td>
                            <td><%=totalGazoline%></td>
                            <td><%=totalDiesel%></td>
                            <td><%=totalDiesel + totalGazoline%></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div>

                </div>
            </div>
            <div class="inp">
                <div>
                    <input type="submit" name="submitAdm" value="Autoriser">
                </div>
                <div>
                    <input type="submit" name="submitAdm" value="Refuser">
                </div>
            </div>
        </form><% 
                }
                else{
                    %>
                        <div class="sinon"> Vide...</div>
                    <%
                }
            %>
    </body>
</html>
