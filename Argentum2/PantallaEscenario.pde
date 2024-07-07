class PantallaEscenario extends Pantalla {
    private PImage fondo;
    private ArrayList<Moneda> monedas;
    private Personaje jugador;
    private ArrayList<Enemigo> enemigos;
    private ArrayList<Explosion> explosiones;
    private int startTime;
    private MaquinaDeEstadosPantallas maquinaDeEstados;
    private Hud hud;
    private PVector camaraPos;

    public PantallaEscenario(int estado, MaquinaDeEstadosPantallas maquinaDeEstados) {
        super(estado);
        this.maquinaDeEstados = maquinaDeEstados;
        startTime = millis(); // Tiempo de inicio en milisegundos
        fondo = loadImage("/resources/images/fondo2.jpg");

        // Almacena la posición de la cámara.
        camaraPos = new PVector(0, 0);

        jugador = new Personaje(new PVector(100, 100), "/resources/images/mago.png");

        hud = new Hud(jugador);

        monedas = new ArrayList<Moneda>();
        for (int i = 0; i < 7; i++) {
            monedas.add(new Moneda(new PVector(random(1800), random(1800)), "/resources/images/oro.png"));
        }

        enemigos = new ArrayList<Enemigo>();
        for (int i = 0; i < 3; i++) {
            enemigos.add(new Enemigo(new PVector(random(1800), random(1800)), "/resources/images/zombie3.png"));
        }
        for (int i = 0; i < 3; i++) {
            enemigos.add(new Enemigo(new PVector(random(1800), random(1800)), "/resources/images/zombie2.png"));
        }
        for (int i = 0; i < 3; i++) {
            enemigos.add(new Enemigo(new PVector(random(1800), random(1800)), "/resources/images/zombie.png"));
        }

        explosiones = new ArrayList<>();
    }

    void dibujarExplosiones() {
        for (int i = explosiones.size() - 1; i >= 0; i--) {
            Explosion e = explosiones.get(i);
            e.display();
            if (e.isTerminada()) {
                explosiones.remove(i);
            }
        }
    }

    public void visualizar() {
        background(fondo);
        int elapsedTime = millis() - startTime; // Tiempo transcurrido en milisegundos
        int remainingTime = 35000 - elapsedTime; // 35 segundos menos el tiempo transcurrido
        if (remainingTime <= 0) {
            pantalla = maquinaDeEstados.cambiarEstado(MaquinaDeEstadosPantallas.DERROTA, pantalla);
            return; // No ejecutar más código si el tiempo se ha agotado
        }

        // Actualizar la posición de la cámara para que siga al personaje
        camaraPos.x = constrain(jugador.getPosicion().x - width/2, 0, 1800 - width);
        camaraPos.y = constrain(jugador.getPosicion().y - height/2, 0, 1800 - height);

        // Dibujar el mapa con la transformación de cámara
        pushMatrix();
        translate(-camaraPos.x, -camaraPos.y);

        jugador.moverConTeclado();
        jugador.display();
        fill(200);
        textSize(25);
        text("hp: " + (jugador.getVidas()), jugador.getPosicion().x, jugador.getPosicion().y - 30);

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
                    return; // Detener la ejecución si el jugador ha perdido todas las vidas
                }
            }
            // Mostrar cantidad de clics restantes sobre el enemigo
            fill(200);
            textSize(16);
            textAlign(CENTER);
            // Transformar la posición del enemigo con respecto a la cámara
            float enemigoX = enemigo.getPosicion().x - camaraPos.x;
            float enemigoY = enemigo.getPosicion().y - camaraPos.y;
            text("Vidas: " + (5 - enemigo.getClickCount()), enemigoX, enemigoY - 30);
        }

        // Verificar clics sobre enemigos
        if (mousePressed) {
            for (int i = enemigos.size() - 1; i >= 0; i--) {
                Enemigo enemigo = enemigos.get(i);
                // Transformar la posición del enemigo con respecto a la cámara
                float enemigoX = enemigo.getPosicion().x - camaraPos.x;
                float enemigoY = enemigo.getPosicion().y - camaraPos.y;
                // Validar la colisión respecto a la cámara
                if (enemigo.getColision().validarColision(new Collider(1, 1, new PVector(mouseX + camaraPos.x, mouseY + camaraPos.y)))) {
                    if (enemigo.puedeRegistrarClick()) {
                        enemigo.registrarClick();
                        enemigo.aumentarClickCount();
                        print("Click numero" + enemigo.getClickCount() + "\n");
                        // Crear una nueva explosión en la posición del enemigo clicado
                        explosiones.add(new Explosion(enemigoX, enemigoY));
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
            // Transformar la posición de la moneda con respecto a la cámara
            float monedaX = moneda.getPosicion().x - camaraPos.x;
            float monedaY = moneda.getPosicion().y - camaraPos.y;
            if (jugador.colisionaCon(moneda.getColision())) {
                monedas.remove(i);
                jugador.sumarPuntajeMoneda();
            }
        }

        popMatrix();
        hud.visualizarInformacionDeJuego(remainingTime);
        hud.mostrarPosicionPersonaje();
        dibujarExplosiones();
    }

    // Si se libera la tecla espacio, se lanza el proyectil
    void keyReleased() {
        if (key == ' ') {
            print("Se pulso espacio");
        }
    }
}
