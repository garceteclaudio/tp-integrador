class Personaje implements IVisualizable, IMoveable {
    private Collider colision;
    private Transform objetoTransform;
    private float speed = 300;  // Velocidad de movimiento del personaje
    private ImageComponent imageComponent;
    private int cantVidas = 140;
    private int puntaje = 0;

    public Personaje(PVector posicion, String imagePath) {
        this.objetoTransform = new Transform(posicion.x, posicion.y);
        this.colision = new Collider(Dimension.ANCHO, Dimension.ALTO, posicion);
        this.imageComponent = new ImageComponent(imagePath);
    }

    @Override
    void display() {
        imageComponent.displayImage(objetoTransform.getPosition(), Dimension.ANCHO, Dimension.ALTO);
    }

    @Override
    void mover(float dx, float dy) {
        PVector nuevaPosicion = this.objetoTransform.getPosition();
        nuevaPosicion.add(dx, dy);
        this.objetoTransform.setPosition(nuevaPosicion);
        this.colision.setPos(objetoTransform.getPosition());
    }
    

    /*
        Operacion utilizada para detectar colisiones.
    */
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

    public void disminuirVidas(){
        this.cantVidas--;
    }

    
    public int getPuntaje() {
        return this.puntaje;
    }

    public void sumarPuntaje(){
        this.puntaje = this.puntaje + 10;
    }

    public void sumarPuntajeMoneda(){
        this.puntaje = this.puntaje + 25;
    }

    public int getAncho() {
        return Dimension.ANCHO;
    }
    public int getAltura() {
        return Dimension.ALTO;
    }
    /*
        Operacion utilizada para el control del personaje mediante teclas.
    */
    void moverConTeclado(float deltaTime) {
        if (keyPressed) {
            if (keyCode == UP || key == 'W' || key == 'w') {
                mover(0, -speed*deltaTime);  // Mover hacia arriba
            } else if (keyCode == DOWN || key == 'S' || key == 's') {
                mover(0, speed*deltaTime);   // Mover hacia abajo
            } else if (keyCode == LEFT || key == 'A' || key == 'a') {
                mover(-speed*deltaTime, 0);  // Mover hacia la izquierda
            } else if (keyCode == RIGHT || key == 'D' || key == 'd') {
                mover(speed*deltaTime, 0);   // Mover hacia la derecha
            }
        }

        // Limitar posición del jugador dentro de la pantalla
        this.getPosicion().x = constrain(this.getPosicion().x, 0, 900 - this.getAncho());
        this.getPosicion().y = constrain(this.getPosicion().y, 0, 700 - this.getAltura());
    }
}
