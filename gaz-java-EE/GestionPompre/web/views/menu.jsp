<%-- 
    Document   : menu
    Created on : Apr 3, 2024, 12:10:12 AM
    Author     : Ing Ivenson
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
     <link rel="stylesheet" href="../css/menu.css">
    <!-- Material Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
    <style>
        .sidebar-list-item > a {
  text-decoration: none;
   color: white;
    </style>
    </head>
    <body>
          <!-- Sidebar -->
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
      <aside id="sidebar" style=" background-color: #03426d;color: white;">
  <div class="sidebar-title">
    <div class="sidebar-brand">
      <span class="material-icons-outlined">store</span> Station Service
      
    </div>
      
  </div>

  <ul class="sidebar-list">
    <li class="sidebar-list-item">
      <a href="../views/Dashbord.jsp">
        <span class="material-icons-outlined">manage_accounts</span> Profil Administrateur

      </a>
    </li>
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
      <a href="../views/afficherVente.jsp">
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

          
    </body>
</html>

