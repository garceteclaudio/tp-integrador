class PantallaTutorial extends Pantalla{
    private PImage fondo;

    public PantallaTutorial(int estado){
      super(estado);
      fondo = loadImage("/resources/images/tutorial.png");
    }

    public void visualizar(){
        background(fondo);
    }

}
