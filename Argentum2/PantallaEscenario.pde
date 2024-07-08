import java.io.*;

class PantallaEscenario extends Pantalla {
    ArrayList<String> lineas =  new ArrayList<String>();
    private GuardarInformacion guardarInfor;
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
   
        guardarInfor = new GuardarInformacion();
        this.maquinaDeEstados = maquinaDeEstados;
        startTime = millis(); // Tiempo de inicio en milisegundos
        fondo = loadImage("/resources/images/fondo2.jpg");

        jugador = new Personaje(new PVector(100, 100), "/resources/images/mago.png");

        generadorMonedas = new GeneradorMonedas();
        generadorEnemigos = new GeneradorEnemigos();
        
        hud = new Hud(jugador);
  
    }

    public void visualizar(float deltaTime) {
        int elapsedTime = millis() - startTime; // Tiempo transcurrido en milisegundos
        int remainingTime = 11000 - elapsedTime; // 45 segundos menos el tiempo transcurrido

        if (remainingTime <= 0) {
            pantalla = maquinaDeEstados.cambiarEstado(MaquinaDeEstadosPantallas.VICTORIA, pantalla);
            lineas.add("Puntaje: " + jugador.getPuntaje());
            guardarInfor.saveArrayListToFile(lineas, "data/miarchivo.txt");
            return; // No ejecutar más código si el tiempo se ha agotado
        }

        background(fondo);

        hud.visualizarInformacionDeJuego(remainingTime);
        hud.mostrarPosicionPersonaje();

        jugador.display();
        jugador.moverConTeclado(deltaTime);

        // Dibujar y actualizar enemigos
        // Verificar clicks sobre enemigos
        lineas = generadorEnemigos.dibujarYActualizarEnemigos(jugador, deltaTime,lineas);
        guardarInfor.saveArrayListToFile(lineas, "data/miarchivo.txt");

        // Dibujar y actualizar MONEDAS
        generadorMonedas.dibujarYActualizarMonedas(jugador);
    }

    void keyReleased() {
        if (key == ' ') {
            print("Se pulso espacio");
        }
    }
}
