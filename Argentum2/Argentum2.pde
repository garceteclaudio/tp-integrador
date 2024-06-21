private Pantalla pantalla;
private StateMachinePantallas stateMachine;


void setup() {
  size(800, 600);
  pantalla = new Pantalla();
  stateMachine = new StateMachinePantallas(pantalla);

  frameRate(60);
}

void draw() {
  pantalla.dibujar();
}

// Metodo que controla las distintas opciones del menu principal
void mousePressed() {
  if (pantalla.getEstado() == StateMachinePantallas.INTRO_JUEGO) {
    if (mouseY > 180 && mouseY < 220 && mouseX > width / 2 - 100 && mouseX < width / 2 + 100) {
      stateMachine.changeStateOpcion(StateMachinePantallas.JUGANDO);
    } else if (mouseY > 230 && mouseY < 270 && mouseX > width / 2 - 100 && mouseX < width / 2 + 100) {
      stateMachine.changeStateOpcion(StateMachinePantallas.VICTORIA);
    } else if (mouseY > 280 && mouseY < 320 && mouseX > width / 2 - 100 && mouseX < width / 2 + 100) {
      exit();
    }
  }
}

// metodo de prueba de tarnsiciones de pantalla
void keyPressed() {
  if (pantalla.getEstado() == StateMachinePantallas.JUGANDO) {
    if (key == '3') {
      stateMachine.changeStateOpcion(StateMachinePantallas.DERROTA);
    } else if (key == '4') {
      stateMachine.changeStateOpcion(StateMachinePantallas.VICTORIA);
    }
  } else if (pantalla.getEstado() == StateMachinePantallas.VICTORIA || pantalla.getEstado() == StateMachinePantallas.DERROTA) {
    if (key == '1') {
      stateMachine.changeStateOpcion(StateMachinePantallas.INTRO_JUEGO);
    }
  }
}

void keyReleased() {
  pantalla.keyReleased();
}
