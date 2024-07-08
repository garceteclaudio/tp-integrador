import java.io.*;

class PantallaEscenario extends Pantalla {
    ArrayList<String> lineas = new ArrayList<String>();
    private PImage fondo;
    private GeneradorMonedas generadorMonedas;
    private GeneradorEnemigos generadorEnemigos;
    private Personaje jugador;
    private ArrayList<Enemigo> enemigos;
    private int startTime;
    private MaquinaDeEstadosPantallas maquinaDeEstados;
    private Hud hud;

    public PantallaEscenario(int estado, MaquinaDeEstadosPantallas maquinaDeEstados) {
        super(estado);
        this.maquinaDeEstados = maquinaDeEstados;
        startTime = millis(); // Tiempo de inicio en milisegundos
        fondo = loadImage("/resources/images/fondo2.jpg");

        jugador = new Personaje(new PVector(100, 100), "/resources/images/mago.png");

        generadorMonedas = new GeneradorMonedas();
        generadorEnemigos = new GeneradorEnemigos();
        
        hud = new Hud(jugador);
        lineas = readArrayListFromFile("data/miarchivo.txt");
    }



    public void visualizar(float deltaTime) {
        int elapsedTime = millis() - startTime; // Tiempo transcurrido en milisegundos
        int remainingTime = 35000 - elapsedTime; // 35 segundos menos el tiempo transcurrido

        if (remainingTime <= 0) {
            pantalla = maquinaDeEstados.cambiarEstado(MaquinaDeEstadosPantallas.VICTORIA, pantalla);
            lineas.add("Puntaje: " + jugador.getPuntaje());
            saveArrayListToFile(lineas, "data/miarchivo.txt");
            return; // No ejecutar más código si el tiempo se ha agotado
        }

        background(fondo);

        hud.visualizarInformacionDeJuego(remainingTime);
        hud.mostrarPosicionPersonaje();

        jugador.display();
        jugador.moverConTeclado(deltaTime);

        // Dibujar y actualizar enemigos
        // Verificar clicks sobre enemigos
        saveArrayListToFile(generadorEnemigos.dibujarYActualizarEnemigos(jugador, deltaTime,lineas), "data/miarchivo.txt");

        // Dibujar y actualizar MONEDAS
        generadorMonedas.dibujarYActualizarMonedas(jugador);
    }

    void saveArrayListToFile(ArrayList<String> arrayList, String fileName) {
        PrintWriter output = createWriter(fileName);
        for (String linea : arrayList) {
            output.println(linea);
        }
        output.flush();
        output.close();
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

    void keyReleased() {
        if (key == ' ') {
            print("Se pulso espacio");
        }
    }
}
