class Pantalla implements IVisualizable{
  private int estado;
  private PantallaEscenario escenario;
  private PantallaInicio inicioPantalla;
  private PantallaDerrota pantallaDerrota;
  private PantallaVictoria pantallaVictoria;

  Pantalla() {
    this.estado = StateMachinePantallas.INTRO_JUEGO;
    escenario = new PantallaEscenario();
    inicioPantalla = new PantallaInicio();
    pantallaDerrota = new PantallaDerrota();
    pantallaVictoria = new PantallaVictoria();
  } // fin constructor
  

  void display() {
    switch (this.estado) {
      case StateMachinePantallas.INTRO_JUEGO: // 0
        inicioPantalla.display();
        break;

      case StateMachinePantallas.JUGANDO: // 1
        escenario.display();
        break;

      case StateMachinePantallas.VICTORIA: // 2
        pantallaVictoria.display();
        break;

      case StateMachinePantallas.DERROTA: // 3
        pantallaDerrota.display();
        break;
    }
  }//fin dibujar

  void setEstado(int estado) {
    this.estado = estado;
  }

  int getEstado() {
    return this.estado;
  }

  void keyReleased() {
    escenario.keyReleased();
  }
  
}// FIN CLASE PANTALLA
