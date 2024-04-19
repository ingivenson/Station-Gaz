<%-- 
    Document   : enregistrerVente
    Created on : Apr 8, 2024, 6:31:55 PM
    Author     : Christina SARILUS
--%>

<%@page import= "java.util.Date" %>
<%@page import= "Models.Vente" %>
<%@page import= "Models.Station" %>
<%@page import= "java.io.File" %>
<%@page import= "java.nio.file.Files" %>
<%@page import= "java.io.FileWriter" %>
<%@page import= "java.util.List" %>
<%@page import= "java.util.ArrayList" %>
<%@page import= "java.io.IOException" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Save Vente</title>
         <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            padding: 20px;
        }
        h2 {
            text-align: center;
        }
        form {
            max-width: 500px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        input[type="number"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: navy;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: blue;
        }
        button {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: navy;
            color: white;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            cursor: pointer;
        }
        button a {
            text-decoration: none;
            color: white;
        }
    </style>
    </head>
    <body>
        <h2>Formulaire de vente</h2>
        <%
            if (request.getMethod().equals("POST")) {
        // Récupération des valeurs du formulaire
            String station = request.getParameter("station");
            float qteDiesel = Float.parseFloat(request.getParameter("quantiteDiesel"));
            float qteGazolin = Float.parseFloat(request.getParameter("quantiteGazoline"));

            //id vente
            List<String> idListe = Vente.afficherVentes();
            int idvt = 0, test = 0;
            if(!idListe.isEmpty()){
                String temponId = "";
                String tab[] = null;
                for(String ligne:idListe){
                    tab = ligne.split(":");
                    temponId = tab[0];
                }
                idvt = Integer.parseInt(temponId) + 1;
            }
            else{
                idvt = 1;
            }
            //--
            
            // Création d'une nouvelle instance de Vente
            Vente vente = new Vente(idvt, station, qteDiesel, qteGazolin);
            //Mise a jour des stocks des station 
            List<String> liste = Station.donneeStation();
            List<String> liste2 = new ArrayList<>();
            if(!liste.isEmpty()){
                String ligne[] = null;
                for(String chaine : liste){
                    ligne = chaine.split(":");
                    if(vente.getNomStation().equalsIgnoreCase(ligne[0])){
                        float gazoline = Float.parseFloat(ligne[6]);
                        float diesel = Float.parseFloat(ligne[5]);
                        
                        float gazolineAnc =  gazoline;
                        float dieselAnc = diesel;
                        
                        gazoline=gazoline-vente.getQteGazolin();//nouveau qte disponible
                        diesel=diesel-vente.getQteDiesel();//nouveau qte disponible
                        
                        String pourcentGazoline = "" + (((Float.parseFloat(ligne[1]) - Float.parseFloat(ligne[6])) * 100)/Float.parseFloat(ligne[1]));
                        String pourcentDiesel = "" + (((Float.parseFloat(ligne[3]) - Float.parseFloat(ligne[5])) * 100)/Float.parseFloat(ligne[3]));
                        
                        liste2.add(vente.getNomStation()+":"+ligne[1]+":"+pourcentGazoline+":"+ligne[3]+":"+pourcentDiesel+":"+diesel+":"+gazoline);
                        if((gazolineAnc >= vente.getQteGazolin()) && (dieselAnc >= vente.getQteDiesel())){
                            //Entree des donnees dans le fichier vente
                            vente.enregistrerVente();
                            test = 1;
                        }
                    }
                    else{
                        System.out.println("Erreur! Cette station n'existe pas.");
                    }
                }
            if(test == 1){
                File file = new File("stations.txt");
                FileWriter fw = null;
                fw = new FileWriter(file);
                fw.close();
                
                String word[] = null;
                String word2[] = null;
                for(String ligne1:liste){
                    word = ligne1.split(":");
                    for(String each:liste2){
                        word2 = each.split(":");
                        if(word[0].equalsIgnoreCase(word2[0])){
                            fw = new FileWriter(file, true);
                            fw.write(each + "\n");
                            fw.close();
                        }else{
                            fw = new FileWriter(file, true);
                            fw.write(ligne1 + "\n");
                            fw.close();
                        }
                    }
                }
            }

            }
            else{
                System.out.println("Erreur! Ce station ne se trouve pas dans nos cataloque");
            }//Fin de la mise a jour
            
            // Créez une liste pour stocker les données de la dernière vente
            List<String> derniereVenteData = new ArrayList<>();

            // Ajoutez les données de votre dernière vente à cette liste
            if(test == 1){
                derniereVenteData.add("ID : " + vente.getId());
                derniereVenteData.add("Station : " + vente.getNomStation());
                derniereVenteData.add("Quantité Diesel : " + vente.getQteDiesel() );
                derniereVenteData.add("Quantité Gazoline : " + vente.getQteGazolin());
                derniereVenteData.add("Date : " + vente.getDateVente());
                derniereVenteData.add("Prix total : " + vente.getTotal());
                // Passez cette liste en tant qu'attribut de requête
                request.setAttribute("derniereVenteData", derniereVenteData);
                request.getRequestDispatcher("validVente.jsp").forward(request, response);
            }else{
                out.println("Qte disponible insuffisant!");
            }

            
    }%>
        <form method="post">
            <label>Choisissez la station :</label><br>
            <input type="radio" id="stationA" name="station" value="fortLiberte" required>
            <label for="stationA">Station Fort-Liberté</label><br>

            <input type="radio" id="stationB" name="station" value="Caracol">
            <label for="stationB">Station Caracol</label><br>

            <input type="radio" id="stationC" name="station" value="Cap-Haitien">
            <label for="stationC">Station Cap-Haitien</label><br>
            
            <input type="radio" id="stationD" name="station" value="Limonade">
            <label for="stationD">Station Limonade</label><br><br>

            <label for="quantiteDiesel">Quantité Diesel :</label>
            <input type="number" id="quantiteDiesel" name="quantiteDiesel" min="0" required><br><br>

            <label for="quantiteGazoline">Quantité Gazoline :</label>
            <input type="number" id="quantiteGazoline" name="quantiteGazoline" min="0" required><br><br>

            <input type="submit" value="Enregistrer la vente"><br><br>
        </form>
        
        <button id="menuV" ><a href="../index.jsp">Retour a l'acceuil</a></button>

        <%
            
        %>
        
    </body>
</html>
