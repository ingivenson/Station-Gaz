/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Ing Ivenson
 */
import Models.Station;
import java.io.*;
import java.nio.file.Files;
import java.time.LocalDate;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Christina SARILUS
 */
public class Vente {
    
    private int Id;
    private String nomStation;
    private float qteDiesel;
    private float qteGazolin;
    private LocalDate dateVente;
    private double total;

    
      // Constructeur
    public Vente(int id, String station, float qteDiesel, float qteGazolin){
        this.Id = id;
        this.nomStation = station;
        this.qteDiesel = qteDiesel;
        this.qteGazolin = qteGazolin;
        this.dateVente = LocalDate.now();
        this.total = qteDiesel*620 + qteGazolin*560;
    }

    //ensemble de Getter des attributs
    public int getId() {
        return Id;
    }

    public String getNomStation() {
        return nomStation;
    }

    public float getQteDiesel() {
        return qteDiesel;
    }

    public float getQteGazolin() {
        return qteGazolin;
    }

    public LocalDate getDateVente() {
        return dateVente;
    }

    public double getTotal() {
        return total;
    }

    //ensemble de Setter des attributs
    public void setId(int Id) {
        this.Id = Id;
    }

    public void setNomStation(String nomStation) {
        this.nomStation = nomStation;
    }

    public void setQteDiesel(float qteDiesel) {
        this.qteDiesel = qteDiesel;
    }

    public void setQteGazolin(float qteGazolin) {
        this.qteGazolin = qteGazolin;
    }

    public void setDateVente(LocalDate dateVente) {
        this.dateVente = dateVente;
    }

    public void getTotal(double total) {
        this.total = total;
    }
    
    //methode permettant de passer une vente dans le fichier
    public void enregistrerVente() throws IOException {
       File filevente = new File("ventes.txt");
       FileWriter fw = new FileWriter(filevente, true);
       fw.write(this.Id + ":" + this.nomStation + ":" + this.dateVente + ":" + this.qteDiesel + ":" + this.qteGazolin + ":" + this.total+"\n");
       fw.close();
    }

    //methode permettant d'afficher une vente
    public static List<String> afficherVentes() {
        File file = new File("ventes.txt");
        if(file.exists()){
            List<String> liste2 = new ArrayList<>();
            try {
                List<String> liste = Files.readAllLines(file.toPath());
                if(!liste.isEmpty()){
                String ligne[] = null;
                for(String chaine : liste){
                    ligne = chaine.split(":");
                   
                    liste2.add(ligne[0]+":"+ligne[1]+":"+ligne[2]+":"+ligne[3]+":"+ligne[4]+":"+ligne[5]);
                    }
                    return liste2;
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        return new ArrayList<>();
    }
    }

