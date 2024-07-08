class GeneradorEnemigos{

    private ArrayList<Enemigo> enemigos;
    private ArrayList<Explosion> explosiones;
    private GuardarInformacion guardarInfor;

    public GeneradorEnemigos(){
        guardarInfor = new GuardarInformacion();

        enemigos = new ArrayList<Enemigo>();
        for (int i = 0; i < 3; i++) {
            enemigos.add(new Enemigo(new PVector(random(width), random(height)), "/resources/images/zombie3.png"));
        }
        for (int i = 0; i < 4; i++) {
            enemigos.add(new Enemigo(new PVector(random(width), random(height)), "/resources/images/zombie2.png"));
        }
        for (int i = 0; i < 5; i++) {
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

    public ArrayList<String> dibujarYActualizarEnemigos(Personaje jugador, float deltaTime,ArrayList<String> lineas){
        for (int i = enemigos.size() - 1; i >= 0; i--) {
            Enemigo enemigo = enemigos.get(i);
            enemigo.display();
            enemigo.actualizar(deltaTime*80);
            if (jugador.colisionaCon(enemigo.getColision())) {
                jugador.disminuirVidas();
                fill(255, 0, 0);
                if (jugador.getVidas() <= 0) {
                    pantalla = maquinaDeEstados.cambiarEstado(MaquinaDeEstadosPantallas.DERROTA, pantalla);
                    lineas.add("Puntaje: " + jugador.getPuntaje());
                    guardarInfor.saveArrayListToFile(lineas, "data/miarchivo.txt");
                    return lineas;
                }
            }
            fill(200);
            textSize(16);
            textAlign(CENTER);
            text("Vidas: " + (5 - enemigo.getClickCount()), enemigo.getPosicion().x, enemigo.getPosicion().y - 30);
        }

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

        dibujarExplosiones();
        return lineas;
    }// fin metodo


}
