<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Models.Station" %>
<%@ page import="Controllers.StationCon" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Enregistrement des stations</title>
    <style>
form {
    display: flex;
    justify-content: center;
    flex-direction: column;
    align-content: center;
    background-color: white;
    margin-top: 15%;
    margin-inline:65%;
    width: 30vw;
    margin-bottom: 20px;
    border: 1px solid #ddd;  
    padding-inline: 10%;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    height: 70vh;
}

label {
    display: block;
    margin-bottom: 5px;
}

input[type="text"],
input[type="number"] {
    width: 100%;
    padding: 8px;
    margin-bottom: 10px;
    box-sizing: border-box;
}

input[type="submit"] {
    background-color: #007bff;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #0056b3;}
    </style>
</head>
<body>
   <%@include file="menu.jsp" %>
   
<form action="EnregistrerStation.jsp" method="post">
    <p>Veuillez choisir une station à enregistrer :</p>
    <div>
    <input type="radio" name="nomStation" value="fortLiberte"> Fort-Liberté<br>
    <input type="radio" name="nomStation" value="Caracol"> Caracol<br>
    <input type="radio" name="nomStation" value="Cap-Haitien"> Cap-Haitien<br>
    <input type="radio" name="nomStation" value="Limonade"> Limonade<br>
    <br>
    </div>
    <label for="capaciteDiesel">Capacité Diesel (gallons) :</label>
    <input type="number" id="capaciteDiesel" name="capaciteDiesel" min="500" required><br>
    <label for="capaciteGazoline">Capacité Gazoline (gallons) :</label>
    <input type="number" id="capaciteGazoline" name="capaciteGazoline" min="500" required><br>
    <br>
    <input type="hidden" name="action" value="ajouter">
    <input type="submit" value="Enregistrer">
</form>

<%
    // Obtention du chemin absolu du fichier stations.txt dans l'application
    String filePath ="stations.txt";
    
    // Création d'une instance de la classe StationCon avec le chemin de fichier
    StationCon stationCon = new StationCon(filePath);

    // Vérification si une action d'ajout de station est en cours
    String action = request.getParameter("action");
    
    if (action != null && action.equals("ajouter")) {
        String nomStation = request.getParameter("nomStation");
        String capaciteDieselParam = request.getParameter("capaciteDiesel");
        String capaciteGazolineParam = request.getParameter("capaciteGazoline");

        // Vérification que les paramètres de capacité ne sont pas vides
        if (capaciteDieselParam != null && !capaciteDieselParam.isEmpty() &&
            capaciteGazolineParam != null && !capaciteGazolineParam.isEmpty()) {

            // Conversion des paramètres de capacité en entiers
            int capaciteDiesel = Integer.parseInt(capaciteDieselParam);
            int capaciteGazoline = Integer.parseInt(capaciteGazolineParam);
            
            // Ajout de la nouvelle station avec les capacités spécifiées
            boolean ajoutReussi = stationCon.addStation(nomStation, capaciteDiesel, capaciteGazoline);
            stationCon.saveStationsToFile(filePath); // Enregistrement des stations dans le fichier
            
            if (ajoutReussi) {
                out.println("<h2>Station ajoutée avec succès !</h2>");
            } else {
                out.println("<h2>La station existe déjà !</h2>");
                 
            }
        } else {
            out.println("<p>Veuillez saisir les capacités de diesel et de gazoline.</p>");
        }
    }
    
    
%>
 
</body>
</html>
