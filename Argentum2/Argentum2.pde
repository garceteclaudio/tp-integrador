private Pantalla pantalla;
private StateMachinePantallas stateMachine;
private PantallaEscenario escenario;

void setup() {
  size(900, 700);
  pantalla = new Pantalla();
  stateMachine = new StateMachinePantallas(pantalla);
  escenario = new PantallaEscenario();
  frameRate(60);
}

void draw() {
  pantalla.display();
}


/*
  Operacion utilizada para seleccionar las opciones del menu inicial.
*/
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

/*
  Operacion de prueba de las distintas pantallas del juego.
*/
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
