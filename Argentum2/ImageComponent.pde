/*class ImageComponent{
  private PImage imagen;
  
  public ImageComponent(String path){
    imagen = loadImage(path);
  }
  
  public void displayImage(PVector posicion){
    image(imagen, posicion.x,posicion.y);
  }
  
  public void displayImage(PVector posicion, int ancho, int alto){
    image(imagen, posicion.x,posicion.y, ancho,alto);
  }
  
}
*/
class ImageComponent {
    PImage spriteSheet;
    int frameWidth;
    int frameHeight;
    int currentFrame;
    int totalFrames;
    int frameCountX;
    int frameRow;
    private PImage imagen;
    
    public ImageComponent(String path){
      imagen = loadImage(path);
    }
    
    public void displayImage(PVector posicion){
      image(imagen, posicion.x,posicion.y);
    }
    
    ImageComponent(String imagePath, int frameWidth, int frameHeight, int totalFrames) {
        this.spriteSheet = loadImage(imagePath);
        
        if (this.spriteSheet == null) {
            println("Error: la imagen no se pudo cargar.");
            return;
        }

        this.frameWidth = frameWidth;
        this.frameHeight = frameHeight;
        this.currentFrame = 0;
        this.totalFrames = totalFrames;
        this.frameRow = 0; // Añadimos esta línea

        if (this.spriteSheet.width == 0 || frameWidth == 0) {
            println("Error: ancho del spriteSheet o frameWidth no pueden ser cero.");
            return;
        }

        this.frameCountX = this.spriteSheet.width / this.frameWidth;
    }

    void displayImage(PVector position, int width, int height) {
        if (spriteSheet == null) {
            return;
        }

        int xFrame = (currentFrame % frameCountX) * frameWidth;
        int yFrame = frameRow * frameHeight;

        image(spriteSheet.get(xFrame, yFrame, frameWidth, frameHeight), position.x, position.y, width, height);
        currentFrame = (currentFrame + 1) % (totalFrames / 4); // Cambiamos a dividir por 4
    }

    void setFrameRow(int row) {
        this.frameRow = row;
    }
}
