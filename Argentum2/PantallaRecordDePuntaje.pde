import java.io.*;
import java.util.*;

class PantallaRecordDePuntaje extends Pantalla {
    private ArrayList<String> puntajes;

    public PantallaRecordDePuntaje(int estado) {
        super(estado);
        // Leer puntajes desde el archivo
        puntajes = readArrayListFromFile("data/miarchivo.txt");
    }

    public void visualizar() {
        background(240, 46, 143);
        fill(200);
        textSize(24);
        textAlign(CENTER);
        text("Puntajes: ", width / 2, 150);
        text("Presione 1 para volver a la pantalla principal.", width / 2, 190);

        // Mostrar todos los puntajes
        textSize(18);
        float y = 230;
        for (String puntaje : puntajes) {
            text(puntaje, width / 2, y);
            y += 30; // Incrementar la posición Y para el siguiente puntaje
        }
    }

    ArrayList<String> readArrayListFromFile(String fileName) {
        ArrayList<String> arrayList = new ArrayList<String>();
        BufferedReader reader = createReader(fileName);
        String linea;
        try {
            while ((linea = reader.readLine()) != null) {
                arrayList.add(linea);
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return arrayList;
    }
}
