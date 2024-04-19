<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Models.Station" %>
<%@ page import="Controllers.StationCon" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>Admin Dashboard</title>

   
    <!-- Montserrat Font -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
     <link rel="stylesheet" href="../css/stylesDash.css">
    <!-- Material Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
  <style>
        .sidebar-list-item > a {
  text-decoration: none;
   color: white;
    </style>
    </head>
  <body>
    <div class="grid-container">

      <!-- Header -->
      <header class="header">
        
        <div class="header-left">
          <span class="material-icons-outlined">search</span>
        </div>
        <div class="header-right">
          
      </header>
      <!-- End Header -->

      
      <!-- Sidebar -->
<aside id="sidebar" style="background-color: #03426d;color: white;">
  <div class="sidebar-title">
    <div class="sidebar-brand">
      <span class="material-icons-outlined">store</span> Station Service
    </div>
      
  </div>

  <ul class="sidebar-list">
    <li class="sidebar-list-item">
      <a href="../views/EnregistrerStation.jsp">
        <span class="material-icons-outlined">add_location</span> Enregistrer Station
      </a>
    </li>
    <li class="sidebar-list-item">
      <a href="../views/Afficher_station.jsp">
        <span class="material-icons-outlined">inventory_2</span> Afficher Station
      </a>
    </li>
    <li class="sidebar-list-item">
      <a href="../views/commande.jsp">
        <span class="material-icons-outlined">add_box</span> Enregistrer Commande
      </a>
    </li>
    <li class="sidebar-list-item">
      <a href="../views/afficherCommande.jsp">
        <span class="material-icons-outlined">receipt</span> Afficher Commande
      </a>
    </li>
     
    <li class="sidebar-list-item">
      <a href="../views/afficherVente.jsp" >
        <span class="material-icons-outlined">bar_chart</span> Afficher les Ventes
      </a>
    </li>
     <li class="sidebar-list-item">
      <a href="../index.jsp">
          <span class="material-icons-outlined">shopping_cart</span> retour  <br> a la paged acceuil
      </a>
    </li>
  </ul>
</aside>
     <%
        // Obtention du chemin absolu du fichier stations.txt dans l'application
        String filePath ="stations.txt";
        
        // Création d'une instance de la classe StationCon avec le chemin de fichier
        StationCon stationCon = new StationCon(filePath);

        // Récupération de toutes les stations
        List<Station> stations = stationCon.getAllStations();

        if (!stations.isEmpty()) {
    %>
      <!-- End Sidebar -->

      <!-- Main -->
      <main class="main-container">
        <div class="main-title">
          <p class="font-weight-bold">DASHBOARD</p>
          <!-- Bouton avec icône et lien -->
<!-- Bouton avec icône et lien -->
<button id="id" >
    <a href="../views/administrateur.jsp" style=" text-decoration: none;">
      <i class="material-icons-outlined">message</i>message commande  
   </a>
</button>


        </div>
<div class="main-cards" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(100px, 1fr)); gap: 5px; ">
    <% for (Station station : stations) { %>
        <div class="card">
            <div class="card-inner" style="display: grid; grid-template-columns: 1fr;">
                <p class="text-primary" style="font-weight: bold; margin-bottom: 10px;font-size: 24px;"><%= station.getNom() %></p>
                <div style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 10px;">
                    <div style="display: grid; grid-template-columns: 1fr;">
                        <p style="color: black; font-size: 12px; margin-bottom: -9px;">Capacité(D/G):<p style="padding-left:9px"> <%= station.getCapaciteDiesel() %> | <%= station.getCapaciteGazoline() %></p>
                        
                            <p style="color: black; font-size: 12px; margin-bottom: -9px;">Quantité(D/G):<p style="padding-left:20px">
                             <%= station.getQuantiteDieselDispo() %> | <%= station.getQuantiteGazolineDispo() %></p>
                    

                        </div>
                    <div style="display: grid; grid-template-columns: 1fr;">
                        <p style="color: black; font-size: 16px; margin-bottom: -25px;">Pourcentage(D/G):<p style="padding-left:15px"><%= station.getPourcentageDiesel()%>% | <%= station.getPourcentageGazoline() %>%</p></p>
                    </div>
                </div>
            </div>
        </div>
    <% } } %>
</div>
 
           
        
<div class="charts">
    <div class="charts-card">
        <p class="chart-title">GASOLINE</p>
        <div id="bar-chart"></div>
        <div style="display: flex; align-items: center; justify-content: center; margin-top: 10px;">
            <img src="../images/icon1.png" alt="Gasoline" style="width: 106px; height: 106px; margin-right: 5px;">
            <p style="font-size: 18px; color: black;">Prix unitaire 560 Gourdes gallons</p>
        </div>
    </div>

    <div class="charts-card">
        <p class="chart-title">DIESEL</p>
        <div id="area-chart"></div>
        <div style="display: flex; align-items: center; justify-content: center; margin-top: 10px;">
            <img src="../images/icon2.png" alt="Diesel" style="width: 106px; height: 106px; margin-right: 5px;">
            <p style="font-size: 18px; color: black;">Prix unitaire  620 Gourdes gallons</p>
        </div>
    </div>
</div>

      </main>
      <!-- End Main -->

    </div>

    
    
  </body>
</html>
<script>let sidebarOpen = false;
const sidebar = document.getElementById('sidebar');

function openSidebar() {
  if (!sidebarOpen) {
    sidebar.classList.add('sidebar-responsive');
    sidebarOpen = true;
  }
}

function closeSidebar() {
  if (sidebarOpen) {
    sidebar.classList.remove('sidebar-responsive');
    sidebarOpen = false;
  }
}
</script>