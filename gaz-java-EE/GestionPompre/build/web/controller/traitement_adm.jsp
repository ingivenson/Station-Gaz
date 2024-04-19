<%-- 
    Document   : traitement_adm
    Created on : 8 avr. 2024, 14:17:39
    Author     : Perfectus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.io.File" %>
<%@page import = "java.io.IOException" %>
<%@page import = "java.nio.file.Files" %>
<%@page import= "java.io.FileWriter" %>
<%@page import = "java.util.List" %>
<%@page import = "java.util.ArrayList" %>
<%@page import = "Models.Commandes" %>
<%@page import = "Models.Station" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String submit = request.getParameter("submitAdm");
        if(submit != null){
            if(submit.equals("Autoriser")){
                List<String> liste0 = Station.donneeStation();
                List<String> liste1 = Station.testStock();
                List<String> liste2 = Commandes.nombreCommande();                
                List<String> liste3 = Commandes.fichierCommande();                
                List<String> listeModifSta = new ArrayList<>();
                List<String> listeModifCom = new ArrayList<>();

                if(!liste0.isEmpty()){
                    String table[] = null;
                    String table1[] = null;
                    String table2[] = null;

                    float qteGazDispo = 0;
                    float qteDieDispo = 0;

                    float qteGazCommande = 0;
                    float qteDieCommande = 0;
                    for(String chaine : liste0){
                        table = chaine.split(":");
                        for(String chaine1 : liste1){
                            table1 = chaine1.split("~");
                            for(String chaine2 : liste2){
                                table2 = chaine2.split("~");

                                if((table[0].equalsIgnoreCase(table1[0])) && (table[0].equalsIgnoreCase(table2[0]))){
                                    table[5] = "" + (Float.parseFloat(table[5]) + Float.parseFloat(table2[2]));
                                    table[6] = "" + (Float.parseFloat(table[6]) + Float.parseFloat(table2[1]));

                                    table[2] = "" + ((Float.parseFloat(table[2])) - ((Float.parseFloat(table2[1]) * 100) / Float.parseFloat(table[1])));
                                    table[4] = "" + ((Float.parseFloat(table[4])) - ((((Float.parseFloat(table2[2])) * 100) / Float.parseFloat(table[3]))));

                                    listeModifSta.add(table[0]+":"+table[1]+":"+table[2]+":"+table[3]+":"+table[4]+":"+table[5]+":"+table[6]);

                                    qteGazCommande += Float.parseFloat(table2[1]);
                                    qteDieCommande += Float.parseFloat(table2[2]);
                                }    
                            }
                        }
                    }
                    File file = new File("stations.txt");
                    File file2 = new File("donnees.txt");
                    File file3 = new File("commande.txt");

                    FileWriter fw=null;

                    //ecrasement des donnees du fichier donnees.txt
                    fw = new FileWriter(file2);
                    fw.close();

                    fw = new FileWriter(file);
                    fw.close();

                    for(String chaine : listeModifSta){
                        fw = new FileWriter(file, true);
                        fw.write(chaine + "\n");
                        fw.close();                        
                    }

                    if(!liste3.isEmpty()){
                        String id = "";
                        String tab[] = null;
                        for(String chaine : liste3){
                            tab = chaine.split(",");
                            id = tab[0];
                            tab[4] = "P";
                            listeModifCom.add(tab[0]+","+tab[1]+","+tab[2]+","+tab[3]+","+tab[4]);
                        }

                        fw = new FileWriter(file3);
                        fw.close();

                        for(String chaine : listeModifCom){
                            fw = new FileWriter(file3, true);
                            fw.write(chaine + "\n");
                            fw.close();
                        }

                        int code = Integer.parseInt(id);
                        code += 1;
                        Commandes commande = new Commandes(code, ((float)(qteGazCommande * 1.25)), ((float)(qteDieCommande * 1.10)));
                        fw = new FileWriter(file3, true);
                        fw.write(commande.ecrire());
                        fw.close();
                    }
                    else{
                        Commandes commande = new Commandes(1, ((float)(qteGazCommande * 1.25)), ((float)(qteDieCommande * 1.10)));
                        fw = new FileWriter(file3, true);
                        fw.write(commande.ecrire());
                        fw.close();
                    }
                }
            }
            else if(submit.equals("Refuser")){
                File file2=new File("donnees.txt");
                FileWriter fw=null;
                fw = new FileWriter(file2);
                fw.close();
            }
            response.sendRedirect("../views/Dashbord.jsp");
        }
        
        %>
    </body>
</html>
