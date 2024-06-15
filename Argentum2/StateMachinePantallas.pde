class StateMachinePantallas {
  public static final int INTRO_JUEGO = 0;
  public static final int JUGANDO = 1;
  public static final int VICTORIA = 2;
  public static final int DERROTA = 3;
  private Pantalla pantalla;

  StateMachinePantallas(Pantalla p) {
    this.pantalla = p;
  }

  void changeStateOpcion(int newState) {
    pantalla.setEstado(newState);
  }
}
