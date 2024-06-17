class Pantalla {
  private Personaje p;
  private ArrayList<Enemigo> enemigos;
  private int estado;

  void setEstado(int estado) {
    this.estado = estado;
  }

  int getEstado() {
    return this.estado;
  }
  
  Pantalla() {
    this.estado = StateMachinePantallas.INTRO_JUEGO;
    p = new Personaje(new PVector(100, 100), "mago.png");
    enemigos = new ArrayList<Enemigo>();

    // Crear 15 enemigos en posiciones aleatorias
    for (int i = 0; i < 5; i++) {
      enemigos.add(new Enemigo(new PVector(random(width), random(height)), "zombie.png"));
    }
  } // fin constructor



  void display() {
    switch (this.estado) {
      case StateMachinePantallas.INTRO_JUEGO: // 0
        background(58, 116, 46);
        textSize(32);
        fill(0);
        textAlign(CENTER);
        text("Menú Principal", width / 2, 100);

        textSize(24);
        text("Empezar juego", width / 2, 200);
        text("Record de puntajes", width / 2, 250);
        text("Salir", width / 2, 300);
        break;

      case StateMachinePantallas.JUGANDO: // 1
        background(0);
        fill(200);
        textSize(24);
        text("Se encuentra jugando", width / 2, 20);
        text("Presione 3 para derrota", width / 2, 40);
        text("Presione 4 para victoria", width / 2, 60);

        // Mover el personaje con las teclas de flecha
        p.moverConTeclado();

        // Dibujar personaje
        p.dibujar();

        // Dibujar y actualizar enemigos
        for (Enemigo enemigo : enemigos) {
          enemigo.dibujar();
          enemigo.actualizar();
          if (p.colisionaCon(enemigo.getColision())) {
            fill(255, 0, 0);
            text("Colisión ok", width / 2, 200);
          }
        }
        
        // Verificar clicks
        if (mousePressed) {
          for (Enemigo enemigo : enemigos) {
            if (enemigo.getColision().validarColision(new Collider(1, 1, new PVector(mouseX, mouseY)))) {
              if (enemigo.puedeRegistrarClick()) {
                enemigo.registrarClick();
                enemigo.aumentarClickCount();
                print("Click numero" + enemigo.getClickCount()+ "\n");
                if (enemigo.getClickCount() >= 5) {
                  enemigos.remove(enemigo);
                  break; // Salir del bucle una vez que se elimina el enemigo
                }
              }
            }
          }
        }

        // Mostrar posición del personaje
        mostrarPosicionPersonaje();
        break;

      case StateMachinePantallas.VICTORIA: // 2
        background(205, 211, 43);
        fill(0);
        textSize(24);
        text("VICTORIA TOTAL !!", width / 2, 150);
        text("Presione 1 para intro juego", width / 2, 190);
        break;

      case StateMachinePantallas.DERROTA: // 3
        background(240, 46, 143);
        fill(200);
        textSize(24);
        text("Derrota", width / 2, 150);
        text("Presione 1 para intro juego", width / 2, 190);
        break;
    }
  }
  
  void mostrarPosicionPersonaje(){
        // Mostrar posición del personaje
        fill(200);
        textSize(24);
        text("x: " + p.getPosicion().x, 650, 20);
        text("y: " + p.getPosicion().y, 650, 50);  
  }
  
  
  
}// FIN CLASE PANTALLA
