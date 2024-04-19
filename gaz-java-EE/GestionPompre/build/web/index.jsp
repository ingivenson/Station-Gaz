<%-- 
    Document   : index
    Created on : Apr 9, 2024, 9:26:48 PM
    Author     : Ing Ivenson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/Style.css" />
    <title>Go Trip</title>
    </head>
   <body>

     

        <!--===========Nav Bar=================-->
        <section class="nav-bar">
            <div class="logo">Go Trip</div>
            <ul class="menu">
                <li><a href="index.jsp">home</a></li>
                 <li><a href="./views/enregistrerVente.jsp">Faire une vente</a></li>
                 
                 
                <li><a href="./views/login.jsp" style="background-color:black;padding:3% 15%;color:white;border-radius: 15px;">Admin</a></li>
            </ul>
            

        </section>
        
        <!--===============Banner================-->
        <section class="banner">
            <div class="banner-text-item">
                <div class="banner-heading">
                    <h1 style="color: white; font-family: arial;">Découvrez nos services pour vous accompagner quotidien!</h1>
                </div>
                <form class="form">
                    <input type="text" list="mylist" placeholder="Nos Stations">
                    <datalist id="mylist">
                        <option>Fort-Liberte</option>
                        <option> Limonade</option>
                        <option>Caracol</option>
                        <option>Cap-Haitien</option>
                        
                </form>
            </div>
        </section>

    
        <!--==============Places===================-->
        <section class="places">
            <div class="places-text">
                
                
            </div>

            <div class="cards">
                <div class="card">
                    <div class="zoom-img">
                        <div class="img-card">
                            <img
                                src="./images/catex.jpg">
                        </div>
                    </div>

                    <div class="text">
                        
                        <h2>Station de Caracol</h2>
                        <p class="cost">Diesel / Gasoline</p>
                        <div class="card-box">
                            <p class="time">🕓 3 Days</p>
                            <p class="location">✈ Rue Christophe  </p>
                        </div>
                    </div>

                </div>
                <div class="card">
                    <div class="zoom-img">
                        <div class="img-card">
                           
                        </div>
                    </div>

                   

                </div>
                <div class="card">
                    <div class="zoom-img">
                        <div class="img-card">
                            <img src="./images/pexels-gonzalo-carlos-novillo-lapeyra-19286387.jpg">
                        </div>
                    </div>

                    <div class="text">
                         
                        <h2>Station Cap-haitien</h2>
                        <p class="cost">Diesel / Gasoline</p>
                        <div class="card-box">
                            <p class="time">🕓 3 jours</p>
                            <p class="location">✈ Rue 18 B </p>
                        </div>
                    </div>

                </div>
                <div class="card">
                    <div class="zoom-img">
                        <div class="img-card">
                            <img
                                src="./images/pexels-gustavo-fring-4173096.jpg">
                        </div>
                    </div>

                    <div class="text">
                         
                        <h2>Limonade</h2>
                        <p class="cost">Diesel / Gasoline</p>
                        <div class="card-box">
                            <p class="time">🕓 5 Days</p>
                            <p class="location"> Rue Capois </p>
                        </div>
                    </div>

                </div>
                <div class="card">
                    <div class="zoom-img">
                        <div class="img-card">
                             </div>
                    </div>

                     
<a href=""></a>
                </div>
                <div class="card">
                    <div class="zoom-img">
                        <div class="img-card">
                            <img
                                src="./images/pexels-kamshotthat-14969819 (1).jpg">
                        </div>
                    </div>

                    <div class="text">
                      
                        <h2> Fort-Liberte</h2>
                        <p class="cost">Diesel/Gasoline</p>
                        <div class="card-box">
                            <p class="time">🕓 7 Days</p>
                            <p class="location"> Rue jean-Batiste, H</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--===========About Us===============-->
        <section class="about">
            <div class="about-img">
                <img src="./images/eg.jpg">
            </div>
            <div class="about-text">
                <small>À PROPOS DE NOTRE STATION-SERVICE</small>
                <h2>Bienvenue chez Go Fuel</h2>
                <p>Chez Go Fuel, nous sommes dévoués à offrir une expérience de ravitaillement en carburant exceptionnelle.
                Nous vous proposons non seulement du carburant de qualité supérieure, mais également un service clientèle attentif et chaleureux.</p>
            
                <label><input type="checkbox" checked>Carburant de qualité premium</label>
                <label><input type="checkbox" checked>Service clientèle exceptionnel</label>
                <label><input type="checkbox" checked>Installations modernes et propres</label>
                <label><input type="checkbox" checked>Confort et commodité pour nos clients</label>
                <a href="#">EN SAVOIR PLUS</a>
            </div>
            
        </section>

        <footer>
            <div class="footer-content">
                <div class="footer-section about">
                    <h1 style="color: rgb(218, 138, 41);">Go Fuel</h1>
                    <p>Nous sommes dédiés à vous fournir les meilleurs services de ravitaillement <p style="margin-top: -16%; margin-left: -18%;">  en carburant.</p></p>
                     
                    
                </div>
                <div class="footer-section links">
                    <h2>Reseau Sociaux</h2>
                    <ul>
                        <li><a href="#"> <img src="./images/téléchargement (1).jpg" alt=""></a></li>
                        <li><a href="#"> <img src="./images/téléchargement.jpg" alt=""></a></li>
                        <li><a href="#">  <img src="./images/téléchargement.png" alt=""></a></li>
                        
                    </ul>
                </div>
                <div class="footer-section contact-form">
                    <h2>Contactez-nous</h2>
                    <div class="contact">
                        <span><i class="fa fa-phone"></i> (123) 456-7890</span>
                        <span><i class="fa fa-envelope"></i> info@gofuel.com</span>
                    </div>
                     
                </div>
            </div>
            
        </footer>
    </body>
</html>
