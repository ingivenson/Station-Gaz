<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Models.Station" %>
<%@ page import="Controllers.StationCon" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Affichage des Stations</title>
    <link rel="stylesheet" href="../css/afficher.css">
       
</head>
<body>
    <%@include file="menu.jsp" %>
    <div>
    <h2>Liste des Stations</h2>
    <%
        // Obtention du chemin absolu du fichier stations.txt dans l'application
        String filePath ="stations.txt";
        
        // Création d'une instance de la classe StationCon avec le chemin de fichier
        StationCon stationCon = new StationCon(filePath);

        // Récupération de toutes les stations
        List<Station> stations = stationCon.getAllStations();

        if (!stations.isEmpty()) {
    %>
            <table>
                <tr >
                    <th>Nom</th>
                    <th>Capacité Gazoline (gallons)</th>
                    <th>Pourcentage Gazoline (%)</th>
                    <th>Capacité Diesel (gallons)</th>
                    <th>Pourcentage Diesel (%)</th>
                    <th>Quantité Diesel Disponible (gallons)</th>
                    <th>Quantité Gazoline Disponible (gallons)</th>
                </tr>
                <%
                    for (Station station : stations) {
                %>
                        <tr>
                            <td><%= station.getNom() %></td>
                            <td><%= station.getCapaciteGazoline() %></td>
                            <td><%= station.getPourcentageGazoline() %></td>
                            <td><%= station.getCapaciteDiesel() %></td>
                            <td><%= station.getPourcentageDiesel() %></td>
                            <td><%= station.getQuantiteDieselDispo() %></td>
                            <td><%= station.getQuantiteGazolineDispo() %></td>
                        </tr>
                <%
                    }
                %>
            </table>
    <%
        } else {
    %>
            <p>Aucune station enregistrée.</p>
    <%
        }
    %>
    </div>
</body>
</html>
