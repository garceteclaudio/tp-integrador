class PantallaEscenario extends GameObject implements IVisualizable {
  private PImage fondo;
  private Personaje jugador;
  private ArrayList<Enemigo> enemigos;
  ArrayList<Explosion> explosiones;
  Enemigo enemigoDragon;

  public PantallaEscenario() {
    fondo = loadImage("/images/fondo2.jpg");

    jugador = new Personaje(new PVector(100, 100), "/images/mago.png");
    enemigos = new ArrayList<Enemigo>();
    for (int i = 0; i < 3; i++) {
      enemigos.add(new Enemigo(new PVector(random(width), random(height)), "/images/zombie3.png"));
    }
    for (int i = 0; i < 3; i++) {
      enemigos.add(new Enemigo(new PVector(random(width), random(height)), "/images/zombie2.png"));
    }

    for (int i = 0; i < 3; i++) {
      enemigos.add(new Enemigo(new PVector(random(width), random(height)), "/images/zombie.png"));
    }
    explosiones = new ArrayList<>();
     
    enemigoDragon = new Enemigo(new PVector(random(width), random(height)), "/images/dragon.png");
  }

  void dibujarExplosiones() {
    for (int i = 0; i < explosiones.size(); i++) {
      Explosion e = explosiones.get(i);
      e.display();
    }
  }

  public void display() {
    background(fondo);
    fill(200);
    textSize(24);
    text("Se encuentra jugando", width / 2, 20);
    text("Presione 3 para derrota", width / 2, 40);
    text("Presione 4 para victoria", width / 2, 60);

    jugador.moverConTeclado();
    jugador.display();

    enemigoDragon.display();
    enemigoDragon.actualizar();
    if (jugador.colisionaCon(enemigoDragon.getColision())) {
      fill(255, 0, 0);
      text("Colisión con dragon ok", width / 2, 200);
    }

    // Verificar clicks sobre enemigo dragon
    if (mousePressed) {
      if (enemigoDragon.getColision().validarColision(new Collider(1, 1, new PVector(mouseX, mouseY)))) {
        if (enemigoDragon.puedeRegistrarClick()) {
          enemigoDragon.registrarClick();
          enemigoDragon.aumentarClickCount();
          print("Click numero" + enemigoDragon.getClickCount() + "\n");
        }
      }
    }

    // Dibujar y actualizar enemigos
    for (int i = enemigos.size() - 1; i >= 0; i--) {
      Enemigo enemigo = enemigos.get(i);
      enemigo.display();
      enemigo.actualizar();
      if (jugador.colisionaCon(enemigo.getColision())) {
        fill(255, 0, 0);
        text("Colisión ok", width / 2, 200);
      }

      // Mostrar cantidad de clics restantes sobre el enemigo
      fill(200);
      textSize(19);
      textAlign(CENTER);
      text("Vidas: " + (5 - enemigo.getClickCount()), enemigo.getPosicion().x, enemigo.getPosicion().y - 30);
    }

    // Verificar clics sobre enemigos
    if (mousePressed) {
      for (int i = enemigos.size() - 1; i >= 0; i--) {
        Enemigo enemigo = enemigos.get(i);
        if (enemigo.getColision().validarColision(new Collider(1, 1, new PVector(mouseX, mouseY)))) {
          if (enemigo.puedeRegistrarClick()) {
            enemigo.registrarClick();
            enemigo.aumentarClickCount();
            print("Click numero" + enemigo.getClickCount() + "\n");

            // Crear una nueva explosión en la posición del enemigo clicado
            explosiones.add(new Explosion(enemigo.getPosicion().x, enemigo.getPosicion().y));

            if (enemigo.getClickCount() >= 5) {
              enemigos.remove(i);
            }
          }
        }
      }
    }

    // Dibujar explosiones
    dibujarExplosiones();

    // Mostrar posición del personaje
    mostrarPosicionPersonaje();


  }

  void mostrarPosicionPersonaje() {
    fill(200);
    textSize(24);
    text("x: " + jugador.getPosicion().x, 650, 20);
    text("y: " + jugador.getPosicion().y, 650, 50);
  }

  // Si presiono la tecla espacio se lanza el proyectil
  void keyReleased() {
    if (key == ' ') {
      print("Se pulso espacio");
    }
  }
}
