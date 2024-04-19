package Controllers;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import Models.Station;

public class StationCon {
    private List<Station> stations;
    private final String FILENAME = "stations.txt";

    public StationCon(String filePath) {
        stations = new ArrayList<>();
        loadStationsFromFile(filePath);
    }

    private void loadStationsFromFile(String filePath) {
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (!line.isEmpty()) {
                    String[] parts = line.split(":");
                    if (parts.length == 7) {
                        String nom = parts[0];
                        int capaciteGazoline = Integer.parseInt(parts[1]);
                       float pourcentageGazoline = Float.parseFloat(parts[2]);
                        int capaciteDiesel = Integer.parseInt(parts[3]);
                       float pourcentageDiesel = Float.parseFloat(parts[4]);
                       float quantiteDieselDispo = Float.parseFloat(parts[5]);
                        float quantiteGazolineDispo = Float.parseFloat(parts[6]);
                        Station station = new Station(nom, capaciteGazoline, pourcentageGazoline,
                                                      capaciteDiesel, pourcentageDiesel,
                                                      quantiteDieselDispo, quantiteGazolineDispo);
                        stations.add(station);
                    } else {
                        System.err.println("Erreur : ligne incorrecte dans le fichier stations.txt");
                    }
                }
            }
        } catch (IOException | NumberFormatException e) {
            e.printStackTrace();
        }
    }

    public boolean addStation(String nom, int capaciteDiesel,int capaciteGazoline) {
        if (!isStationExist(nom)) {
            // Création d'une nouvelle station avec des valeurs par défaut
            Station station = new Station(nom, capaciteGazoline, 100,capaciteDiesel, 100, 0.00f, 0.00f); // Capacité et quantité par défaut
            stations.add(station); // Ajoute la nouvelle station à la liste
            saveStationsToFile(FILENAME); // Enregistre les stations dans le fichier
            return true; // Ajout réussi
        }
        return false; // La station existe déjà
    }
    // methode pour modifier 
    public boolean modifierFichier(String nom, int capaciteGazoline,float pourcentageGazoline,int capaciteDiesel,float pourcentageDiesel,   
                  float quantiteDieselDispo, float quantiteGazolineDispo){
         for(Station station : stations){
             if(station.getNom().equals(nom)){
                 station.setCapaciteGazoline(capaciteGazoline);
                 station.setPourcentageGazoline(pourcentageGazoline);
                 station.setCapaciteDiesel(capaciteDiesel);
                 station.setPourcentageDiesel(pourcentageDiesel);
                 station.setQuantiteDieselDispo(quantiteDieselDispo);
                 station.setQuantiteGazolineDispo(pourcentageGazoline);
                 saveStationsToFile(FILENAME);
                 return true;
                 }
             
         }
        return true;
    }
    public List<Station> getAllStations() {
        return stations;
    }

    private boolean isStationExist(String nom) {
        for (Station station : stations) {
            if (station.getNom().equals(nom)) {
                return true; // La station existe déjà
            }
        }
        return false; // La station n'existe pas
    }

    public void saveStationsToFile(String filePath) {
        try (PrintWriter writer = new PrintWriter(new FileWriter(filePath))) {
            for (Station station : stations) {
                String formattedLine = String.format("%s:%d:%f:%d:%f:%f:%f",
                        station.getNom(),
                        station.getCapaciteGazoline(),
                        station.getPourcentageGazoline(),
                        station.getCapaciteDiesel(),
                        station.getPourcentageDiesel(),
                        station.getQuantiteDieselDispo(),
                        station.getQuantiteGazolineDispo());
                writer.println(formattedLine);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
}
