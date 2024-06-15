class Pantalla {
  int estado;

  Pantalla() {
    this.estado = StateMachinePantallas.INTRO_JUEGO;
  }

  void setEstado(int estado) {
    this.estado = estado;
  }

  int getEstado() {
    return this.estado;
  }

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
        background(0, 0, 255);
        fill(200);
        textSize(24);
        text("Se encuentra jugando", width / 2, 150);
        text("Presione 3 para derrota", width / 2, 190);
        text("Presione 4 para victoria", width / 2, 230);
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
}
