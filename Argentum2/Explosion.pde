class Explosion {
  private PImage sprite;
  private int widthFrame;    //ancho del Frame
  private int heightFrame;   //alto del Frame
  private int xFrame;        //posición x del Frame
  private int yFrame;      //posición y del Frame
  private int cantFrames;    //la cantidad de veces que se mostrarán frames
  private int contFrames;    //contador de frames visualizados
  private int posicionX;
  private int posicionY;

  public Explosion(int posicionX, int posicionY) {
    sprite = requestImage("/resources/images/explosion.png");
    widthFrame = 64;
    heightFrame = 64;
    xFrame=0;
    yFrame=0;
    cantFrames = 25;
    contFrames = 1;
    this.posicionX = posicionX;
    this.posicionY = posicionY;
  }

  public void display() {
    imageMode(CENTER);
    if (contFrames <= cantFrames) {
      
      image(sprite.get(xFrame, yFrame, widthFrame, heightFrame), posicionX, posicionY);
      
      xFrame = xFrame + widthFrame;
      contFrames++;
      if (xFrame >= sprite.width) {
        xFrame=0;
        yFrame = yFrame+heightFrame;
      }
    }
  }
}
