/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Ing Ivenson
 */

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Perfectus
 */
public class Commandes {
    
    //Attributs classe Commandes
    private int ID_commande;
    private float qteGallonDiesel;
    private float qteGallonGazoline;
    private LocalDate dateCommande;
    private char etat;
    
    
    public Commandes(int ID_commande, float qteGallonDiesel, float qteGallonGazoline) {
        this.ID_commande = ID_commande;
        this.qteGallonDiesel = qteGallonDiesel;
        this.qteGallonGazoline = qteGallonGazoline;
        this.dateCommande = LocalDate.now();
        this.etat = 'N';
    }
    
    /*public void enregistrer(){
        
    }*/
    
    //Ensemble de getters et de setters des différents attributs
    public int getID_commande() {
        return ID_commande;
    }

    public void setID_commande(int ID_commande) {
        this.ID_commande = ID_commande;
    }

    public float getQteGallonDiesel() {
        return qteGallonDiesel;
    }

    public void setQteGallonDiesel(float qteGallonDiesel) {
        this.qteGallonDiesel = qteGallonDiesel;
    }

    public float getQteGallonGazoline() {
        return qteGallonGazoline;
    }

    public void setQteGallonGazoline(float qteGallonGazoline) {
        this.qteGallonGazoline = qteGallonGazoline;
    }

    public LocalDate getDateCommande() {
        return dateCommande;
    }

    public void setDateCommande(LocalDate dateCommande) {
        this.dateCommande = dateCommande;
    }

    public char getEtat() {
        return etat;
    }

    public void setEtat(char etat) {       
        this.etat = etat;
    }

    public static List<String> fichierCommande(){
        File file = new File("commande.txt");
        if(file.exists()){
            List<String> liste2 = new ArrayList<>();
            try {
                List<String> liste = Files.readAllLines(file.toPath());
                if(!liste.isEmpty()){
                String ligne[] = null;
                for(String chaine : liste){
                    ligne = chaine.split(",");
                    liste2.add(ligne[0]+","+ligne[1]+","+ligne[2]+","+ligne[3]+","+ligne[4]);
                    }
                    return liste2;
                }
            } catch (IOException ex) {
                System.out.println("Erreur !!!");
            }
        }
        return new ArrayList<>();
    }
    
    public static List<String> nombreCommande(){
        File file = new File("donnees.txt");
        if(file.exists()){
            List<String> liste2 = new ArrayList<>();
            try {
                List<String> liste = Files.readAllLines(file.toPath());
                if(!liste.isEmpty()){
                String ligne[] = null;
                for(String chaine : liste){
                    ligne = chaine.split("~");
                    liste2.add(ligne[0]+"~"+ligne[1]+"~"+ligne[2]);
                    }
                    return liste2;
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        return new ArrayList<>();
    }
    
    public String ecrire() {
        return  ID_commande + "," + qteGallonDiesel + "," + qteGallonGazoline + "," + dateCommande + "," + etat + "\n";
    }
    

}

