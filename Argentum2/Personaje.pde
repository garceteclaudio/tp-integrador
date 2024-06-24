class Personaje extends GameObject implements IVisualizable, IMoveable {
    private Collider colision;
    private Transform objetoTransform;
    private float speed = 10;  // Velocidad de movimiento del personaje
    private ImageComponent imageComponent;
    private int cantVidas = 5;

    public Personaje(PVector posicion, String imagePath) {
        this.objetoTransform = new Transform(posicion.x, posicion.y);
        this.colision = new Collider(Dimension.ANCHO, Dimension.ALTO, posicion);
        this.imageComponent = new ImageComponent(imagePath);
    }

    @Override
    void display() {
        // Mostrar la imagen del personaje en lugar del rectángulo
        imageComponent.displayImage(objetoTransform.getPosition(), Dimension.ANCHO, Dimension.ALTO);
    }

    @Override
    void mover(float dx, float dy) {
        PVector nuevaPosicion = this.objetoTransform.getPosition();
        nuevaPosicion.add(dx, dy);
        this.objetoTransform.setPosition(nuevaPosicion);
        this.colision.setPos(objetoTransform.getPosition());
    }
    


    public boolean colisionaCon(Collider otroCollider) {
        return this.colision.validarColision(otroCollider);
    }

    public void setPosicion(PVector posicion) {
        this.objetoTransform.setPosition(posicion);
        this.colision.setPos(posicion);
    }

    public PVector getPosicion() {
        return objetoTransform.getPosition();
    }
    public void setVidas(int vidas) {
        this.cantVidas = vidas;
    }

    public int getVidas() {
        return this.cantVidas;
    }
    // Método para manejar el movimiento del personaje con las teclas de flecha
    void moverConTeclado() {
        if (keyPressed) {
            if (keyCode == UP || key == 'W' || key == 'w') {
                mover(0, -speed);  // Mover hacia arriba
            } else if (keyCode == DOWN || key == 'S' || key == 's') {
                mover(0, speed);   // Mover hacia abajo
            } else if (keyCode == LEFT || key == 'A' || key == 'a') {
                mover(-speed, 0);  // Mover hacia la izquierda
            } else if (keyCode == RIGHT || key == 'D' || key == 'd') {
                mover(speed, 0);   // Mover hacia la derecha
            }
        }
    }
}
