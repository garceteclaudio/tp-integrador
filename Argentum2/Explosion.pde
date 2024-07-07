class Explosion implements IVisualizable {
    private PImage sprite;
    private int widthFrame;    // Ancho del frame
    private int heightFrame;   // Alto del frame
    private int xFrame;        // Posición x del frame actual
    private int yFrame;        // Posición y del frame actual
    private int cantFrames;    // Cantidad total de frames de la explosión
    private int contFrames;    // Contador de frames mostrados
    private float posicionX;
    private float posicionY;
    private boolean terminada;

    public Explosion(float posicionX, float posicionY) {
        sprite = requestImage("/resources/images/explosion.png");
        widthFrame = 64;
        heightFrame = 64;
        xFrame = 0;
        yFrame = 0;
        cantFrames = 25;
        contFrames = 0;
        this.posicionX = posicionX;
        this.posicionY = posicionY;
        terminada = false;
    }

    @Override
    public void display() {
        imageMode(CENTER);
        if (contFrames < cantFrames) {
            image(sprite.get(xFrame, yFrame, widthFrame, heightFrame), posicionX, posicionY);

            xFrame = (xFrame + widthFrame) % sprite.width;
            if (xFrame == 0) {
                yFrame = (yFrame + heightFrame) % sprite.height;
            }

            contFrames++;
        } else {
            terminada = true;
        }
    }

    public boolean isTerminada() {
        return terminada;
    }
}
