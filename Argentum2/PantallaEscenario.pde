class PantallaEscenario extends Pantalla {
    private PImage fondo;
    private ArrayList<Moneda> monedas;
    private Personaje jugador;
    private ArrayList<Enemigo> enemigos;
    private ArrayList<Explosion> explosiones;
    private int startTime;
    private MaquinaDeEstadosPantallas maquinaDeEstados;
    private Hud hud;

    public PantallaEscenario(int estado, MaquinaDeEstadosPantallas maquinaDeEstados) {
        super(estado);
        this.maquinaDeEstados = maquinaDeEstados;
        startTime = millis(); // Tiempo de inicio en milisegundos
        fondo = loadImage("/resources/images/fondo2.jpg");

        jugador = new Personaje(new PVector(100, 100), "/resources/images/mago.png");
        
        hud = new Hud(jugador);
        
        monedas = new ArrayList<Moneda>();
        for (int i = 0; i < 7; i++) {
            monedas.add(new Moneda(new PVector(random(width), random(height)), "/resources/images/oro.png"));
        }
        
        enemigos = new ArrayList<Enemigo>();
        for (int i = 0; i < 3; i++) {
            enemigos.add(new Enemigo(new PVector(random(width), random(height)), "/resources/images/zombie3.png"));
        }
        for (int i = 0; i < 3; i++) {
            enemigos.add(new Enemigo(new PVector(random(width), random(height)), "/resources/images/zombie2.png"));
        }
        for (int i = 0; i < 3; i++) {
            enemigos.add(new Enemigo(new PVector(random(width), random(height)), "/resources/images/zombie.png"));
        }

        explosiones = new ArrayList<>();
    }

    void dibujarExplosiones() {
        for (int i = 0; i < explosiones.size(); i++) {
            Explosion e = explosiones.get(i);
            e.display();
        }
    }

    public void visualizar() {
        int elapsedTime = millis() - startTime; // Tiempo transcurrido en milisegundos
        int remainingTime = 35000 - elapsedTime; // 45 segundos menos el tiempo transcurrido
        if (remainingTime <= 0) {
            pantalla = maquinaDeEstados.cambiarEstado(MaquinaDeEstadosPantallas.DERROTA, pantalla);
            return; // No ejecutar más código si el tiempo se ha agotado
        }

        background(fondo);

        hud.visualizarInformacionDeJuego(remainingTime);
        hud.mostrarPosicionPersonaje();

        
        jugador.display();
        jugador.moverConTeclado();

        // Dibujar y actualizar enemigos
        for (int i = enemigos.size() - 1; i >= 0; i--) {
            Enemigo enemigo = enemigos.get(i);
            enemigo.display();
            enemigo.actualizar();
            if (jugador.colisionaCon(enemigo.getColision())) {
                jugador.disminuirVidas();
                fill(255, 0, 0);
                if (jugador.getVidas() <= 0) {
                    pantalla = maquinaDeEstados.cambiarEstado(MaquinaDeEstadosPantallas.DERROTA, pantalla);
                    return;
                }
            }
            fill(200);
            textSize(16);
            textAlign(CENTER);
            text("Vidas: " + (5 - enemigo.getClickCount()), enemigo.getPosicion().x, enemigo.getPosicion().y - 30);
        }

        // Verificar clicks sobre enemigos
        if (mousePressed) {
            for (int i = enemigos.size() - 1; i >= 0; i--) {
                Enemigo enemigo = enemigos.get(i);
                if (enemigo.getColision().validarColision(new Collider(1, 1, new PVector(mouseX, mouseY)))) {
                    if (enemigo.puedeRegistrarClick()) {
                        enemigo.registrarClick();
                        enemigo.aumentarClickCount();
                        explosiones.add(new Explosion(enemigo.getPosicion().x, enemigo.getPosicion().y));
                        if (enemigo.getClickCount() >= 5) {
                            enemigos.remove(i);
                            jugador.sumarPuntaje();
                        }
                    }
                }
            }
        }

        // Dibujar y actualizar MONEDAS
        for (int i = monedas.size() - 1; i >= 0; i--) {
            Moneda moneda = monedas.get(i);
            moneda.display();
            if (jugador.colisionaCon(moneda.getColision())) {
                monedas.remove(i);
                jugador.sumarPuntajeMoneda();
            }
        }
        
        dibujarExplosiones();
    }

    void keyReleased() {
        if (key == ' ') {
            print("Se pulso espacio");
        }
    }
}
