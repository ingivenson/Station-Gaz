package Models;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

public class Station {
    private String nom;
    private int capaciteGazoline;
    private float pourcentageGazoline;
    private int capaciteDiesel;
    private float pourcentageDiesel;
    private float quantiteDieselDispo;
    private float quantiteGazolineDispo;

    public Station(String nom, int capaciteGazoline, float pourcentageGazoline, int capaciteDiesel, float pourcentageDiesel,
                   float quantiteDieselDispo, float quantiteGazolineDispo) {
        this.nom = nom;
        this.capaciteGazoline = capaciteGazoline;
        this.pourcentageGazoline = pourcentageGazoline;
        this.capaciteDiesel = capaciteDiesel;
        this.pourcentageDiesel = pourcentageDiesel;
        this.quantiteDieselDispo = quantiteDieselDispo;
        this.quantiteGazolineDispo = quantiteGazolineDispo;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public int getCapaciteGazoline() {
        return capaciteGazoline;
    }

    public void setCapaciteGazoline(int capaciteGazoline) {
        this.capaciteGazoline = capaciteGazoline;
    }

    public float getPourcentageGazoline() {
        return pourcentageGazoline;
    }

    public void setPourcentageGazoline(float pourcentageGazoline) {
        this.pourcentageGazoline = pourcentageGazoline;
    }

    public int getCapaciteDiesel() {
        return capaciteDiesel;
    }

    public void setCapaciteDiesel(int capaciteDiesel) {
        this.capaciteDiesel = capaciteDiesel;
    }

    public float getPourcentageDiesel() {
        return pourcentageDiesel;
    }

    public void setPourcentageDiesel(float pourcentageDiesel) {
        this.pourcentageDiesel = pourcentageDiesel;
    }

    public float getQuantiteDieselDispo() {
        return quantiteDieselDispo;
    }

    public void setQuantiteDieselDispo(float quantiteDieselDispo) {
        this.quantiteDieselDispo = quantiteDieselDispo;
    }

    public float getQuantiteGazolineDispo() {
        return quantiteGazolineDispo;
    }

    public void setQuantiteGazolineDispo(float quantiteGazolineDispo) {
        this.quantiteGazolineDispo = quantiteGazolineDispo;
    }
      
    public static List<String> donneeStation(){
        File file = new File("stations.txt");
        if(file.exists()){
            List<String> liste2 = new ArrayList<>();
            try {
                List<String> liste = Files.readAllLines(file.toPath());
                if(!liste.isEmpty()){
                String ligne[] = null;
                for(String chaine : liste){
                    ligne = chaine.split(":");
                   
                    liste2.add(ligne[0]+":"+ligne[1]+":"+ligne[2]+":"+ligne[3]+":"+ligne[4]+":"+ligne[5]+":"+ligne[6]);
                    }
                    return liste2;
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        return new ArrayList<>();
    }
    
    public static List<String> testStock(){
        File file = new File("stations.txt");
        if(file.exists()){
            List<String> liste2 = new ArrayList<>();
            List<String> liste = donneeStation();
            if(!liste.isEmpty()){
                String ligne[] = null;
                for(String chaine : liste){
                    ligne = chaine.split(":");
                    String nom = ligne[0];
                    
                    String qteGazolineManquant = "" + (Float.parseFloat(ligne[1]) - Float.parseFloat(ligne[6]));
                    String qteDieselManquant = "" + (Float.parseFloat(ligne[3]) - Float.parseFloat(ligne[5]));
                    
                    liste2.add(nom+"~"+qteGazolineManquant+"~"+qteDieselManquant);
                }
                return liste2;
            }
        }
        return new ArrayList<>();
    }
}
