class MaquinaDeEstadosPantallas {
  public static final int INICIO = 1;
  public static final int JUGANDO = 2;
  public static final int VICTORIA = 3;
  public static final int DERROTA = 4;


// Metodo utilizado para cambiar las distintas pantallas
  public Pantalla cambiarEstado(int estado, Pantalla p) {
    switch (estado){
     
      case 1: {
        p = new PantallaInicio(estado);
        p.estado = INICIO;
        break;
      }
      case 2: {
        p = new PantallaEscenario(estado);
        p.estado = JUGANDO;
        break;
      }
      case 3: {
        p = new PantallaVictoria(estado);
        p.estado = VICTORIA;
        break;
      }
      case 4: {
        p = new PantallaDerrota(estado);
        p.estado = DERROTA;
        break;
      }
    }
    return p;
  }// fin funciona cambiarEstado
}
