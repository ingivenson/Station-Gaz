<%-- 
    Document   : traitement_commande
    Created on : 7 avr. 2024, 10:45:58
    Author     : Perfectus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.io.File" %>
<%@page import = "java.io.IOException" %>
<%@page import = "java.nio.file.Files" %>
<%@page import= "java.io.FileWriter" %>
<%@page import = "java.util.ArrayList" %>
<%@page import = "java.util.List" %>
<%@page import = "java.util.logging.Level" %>
<%@page import = "java.util.logging.Logger" %>
<%@page import = "Models.Station" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%! 
            File file2=new File("donnees.txt");
            FileWriter fw=null;
        %>

        
        <%  
            List<String> liste = Station.testStock();
            fw=new FileWriter(file2);
            fw.close();
            if(!liste.isEmpty()){
                for(String ligne : liste){
                    fw=new FileWriter(file2,true);
                    fw.write(ligne+"\n");
                    fw.close();
                    
                }
                response.sendRedirect("../views/commande.jsp");
            }else{
                out.println("<p>Erreur: Le fichier station.txt n'existe pas.</p>");
            } 
        %>
        
    </body>
</html>
