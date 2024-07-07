class PantallaTutorial extends Pantalla{
    private PImage fondo;

    public PantallaTutorial(int estado){
      super(estado);
      fondo = loadImage("/resources/images/pantallatutorial.png");
    }

    public void visualizar(float deltaTime){
        background(fondo);
    }

}
