class PantallaVictoria extends Pantalla{

    private PImage fondo;
    
    public PantallaVictoria(int estado){
      super(estado);
      fondo = loadImage("/resources/images/pantalla-victoria.jpg");
    }

    public void visualizar(float deltaTime){
        background(fondo);
        fill(255);
        textSize(45);
        text("¡Has sobrevivido!", width / 2, 150);
        text("Presione 1 para intro juego", width / 2, 200);
    }

}
