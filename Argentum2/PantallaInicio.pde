class PantallaInicio extends Pantalla{
    private PImage fondo;
 
    
    public PantallaInicio(int estado){
      super(estado);
      fondo = loadImage("/resources/images/inicio.png");

    }

  public void visualizar(){
      background(fondo);
      

      
      fill(255); // Color blanco para el texto
      textAlign(CENTER);
      textSize(44);
      text("Iniciar juego", width / 2, 200);
      text("Ver puntajes mas altos", width / 2, 250);
      text("Salir", width / 2, 300);
  }

}
