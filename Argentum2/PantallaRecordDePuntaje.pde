import java.io.*;
import java.util.*;

class PantallaRecordDePuntaje extends Pantalla {
    private ArrayList<Puntaje> puntajes;

    public PantallaRecordDePuntaje(int estado) {
        super(estado);
        // Leer puntajes desde el archivo y ordenarlos
        puntajes = readAndSortPuntajes("data/miarchivo.txt");
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
        for (Puntaje puntaje : puntajes) {
            text(puntaje.texto, width / 2, y);
            y += 30; // Incrementar la posición Y para el siguiente puntaje
        }
    }

    ArrayList<Puntaje> readAndSortPuntajes(String fileName) {
        ArrayList<Puntaje> arrayList = new ArrayList<Puntaje>();
        BufferedReader reader = createReader(fileName);
        String linea;
        try {
            while ((linea = reader.readLine()) != null) {
                String[] parts = linea.split(": ");
                if (parts.length == 2) {
                    try {
                        int valor = Integer.parseInt(parts[1].trim());
                        arrayList.add(new Puntaje(linea, valor));
                    } catch (NumberFormatException e) {
                        // Ignorar líneas que no tengan un formato válido
                    }
                }
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        // Ordenar los puntajes de mayor a menor
        Collections.sort(arrayList, (p1, p2) -> Integer.compare(p2.valor, p1.valor));
        return arrayList;
    }

    class Puntaje {
        String texto;
        int valor;

        Puntaje(String texto, int valor) {
            this.texto = texto;
            this.valor = valor;
        }
    }
}
