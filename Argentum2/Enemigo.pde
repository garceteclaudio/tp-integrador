

class Enemigo implements IVisualizable, IMoveable {
    private Collider colision;
    private Transform objetoTransform;
    private PVector velocidad;
    private int clickCount; // Contador de clicks
    private long lastClickTime; // Tiempo del último click registrado
    private static final long CLICK_COOLDOWN = 100; // Cooldown de 150 milisegundos
    private ImageComponent imageComponent;

    public Enemigo(PVector posicion, String imagePath) {
        objetoTransform = new Transform(posicion.x, posicion.y);
        this.colision = new Collider(Dimension.ANCHO, Dimension.ALTO, posicion);
        this.velocidad = PVector.random2D().mult(2); // Velocidad aleatoria inicial
        this.clickCount = 0; // Inicializar el contador de clicks
        this.lastClickTime = 0; // Inicializar el tiempo del último click
        this.imageComponent = new ImageComponent(imagePath);
    }

    @Override
    void display() {
        // Mostrar la imagen del enemigo en lugar del rectángulo
        imageComponent.displayImage(objetoTransform.getPosition(), Dimension.ANCHO, Dimension.ALTO);
    }

    @Override
    void mover(float dx, float dy) {
        PVector nuevaPosicion = objetoTransform.getPosition().copy();
        nuevaPosicion.add(dx, dy);
        objetoTransform.setPosition(nuevaPosicion);
        this.colision.setPos(objetoTransform.getPosition());
    }

    /*
        Operacion utilizada para generar el movimiento del enemigo.
    */
    public void actualizar() {
        objetoTransform.getPosition().add(velocidad);

        if (objetoTransform.getPosition().x < 0 || objetoTransform.getPosition().x > width - Dimension.ANCHO) {
            velocidad.x *= -1;
        }
        if (objetoTransform.getPosition().y < 0 || objetoTransform.getPosition().y > height - Dimension.ALTO) {
            velocidad.y *= -1;
        }

        this.colision.setPos(objetoTransform.getPosition());
    }

    /*
        Operacion utilizada para detectar colisiones.
    */
    public boolean colisionaCon(Collider otroCollider) {
        return this.colision.validarColision(otroCollider);
    }

    public void setPosicion(PVector posicion) {
        objetoTransform.setPosition(posicion);
        this.colision.setPos(posicion);
    }

    public PVector getPosicion() {
        return objetoTransform.getPosition();
    }

    public Collider getColision() {
        return this.colision;
    }

    public void aumentarClickCount() {
        clickCount++;
    }

    public int getClickCount() {
        return clickCount;
    }

    public boolean puedeRegistrarClick() {
        long now = millis();
        return (now - lastClickTime) >= CLICK_COOLDOWN;
    }

    public void registrarClick() {
        lastClickTime = millis();
    }
}
