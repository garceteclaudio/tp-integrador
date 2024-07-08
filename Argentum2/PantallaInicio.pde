

class PantallaInicio extends Pantalla{
    private PImage fondo;
 


    public PantallaInicio(int estado){
      super(estado);
      fondo = loadImage("/resources/images/pantalladeinicio.png");
    }

  public void visualizar(float deltaTime){
      background(fondo);
      player.play();
      
      fill(255); // Color blanco para el texto
      textAlign(CENTER);
      textSize(44);

      //text("Iniciar juego", width / 2, 200);
      //text("Ver puntajes mas altos", width / 2, 250);
      //text("Salir", width / 2, 300);
  }

  void stop() {
    // Detiene el sonido y libera recursos
    player.close();
    minim.stop();

  }

}
