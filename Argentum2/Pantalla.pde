class Pantalla implements IDisplayable{
  private int estado;
  private PantallaEscenario escenario;
  private InicioPantalla inicioPantalla;
  private PantallaDerrota pantallaDerrota;
  private PantallaVictoria pantallaVictoria;

  Pantalla() {
    this.estado = StateMachinePantallas.INTRO_JUEGO;
    escenario = new PantallaEscenario();
    inicioPantalla = new InicioPantalla();
    pantallaDerrota = new PantallaDerrota();
    pantallaVictoria = new PantallaVictoria();
  } // fin constructor
  

  void dibujar() {
    switch (this.estado) {
      case StateMachinePantallas.INTRO_JUEGO: // 0
        inicioPantalla.dibujar();
        break;

      case StateMachinePantallas.JUGANDO: // 1
        escenario.dibujar();
        break;

      case StateMachinePantallas.VICTORIA: // 2
        pantallaVictoria.dibujar();
        break;

      case StateMachinePantallas.DERROTA: // 3
        pantallaDerrota.dibujar();
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
