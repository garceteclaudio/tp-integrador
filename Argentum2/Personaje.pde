class Personaje extends GameObject implements IDisplayable, IMoveable {
    private Collider colision;
    private Transform objetoTransform;
    private float speed = 10;  // Velocidad de movimiento del personaje
    private ImageComponent imageComponent;
    private int cantVidas = 5;

    public Personaje(PVector posicion, String imagePath) {
        this.objetoTransform = new Transform(posicion.x, posicion.y);
        this.colision = new Collider(Dimension.ANCHO, Dimension.ALTO, posicion);
        this.imageComponent = new ImageComponent(imagePath, 50, 100, 32);
    }

    @Override
    void dibujar() {
        if (imageComponent != null) {
            imageComponent.displayImage(objetoTransform.getPosition(), Dimension.ANCHO, Dimension.ALTO);
        }
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

    void moverConTeclado() {
        if (keyPressed) {
            if (keyCode == UP || key == 'W' || key == 'w') {
                imageComponent.setFrameRow(1); // Segunda fila
                mover(0, -speed);  // Mover hacia arriba
            } else if (keyCode == DOWN || key == 'S' || key == 's') {
                imageComponent.setFrameRow(0); // Primera fila
                mover(0, speed);   // Mover hacia abajo
            } else if (keyCode == LEFT || key == 'A' || key == 'a') {
                imageComponent.setFrameRow(2); // Tercera fila
                mover(-speed, 0);  // Mover hacia la izquierda
            } else if (keyCode == RIGHT || key == 'D' || key == 'd') {
                imageComponent.setFrameRow(3); // Cuarta fila
                mover(speed, 0);   // Mover hacia la derecha
            }
        }
    }
}
