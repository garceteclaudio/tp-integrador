class Enemigo extends GameObject implements IDisplayable, IMoveable {
  private Collider colision;
  private Transform objetoTransform;
  private PVector velocidad;
  private int clickCount; // Contador de clicks
  private long lastClickTime; // Tiempo del último click registrado
  private static final long CLICK_COOLDOWN = 300; // Cooldown de 500 milisegundos

  public Enemigo(PVector posicion) {
    objetoTransform = new Transform();
    objetoTransform.posicion = posicion;
    this.colision = new Collider(Dimension.ANCHO, Dimension.ALTO, posicion);
    this.velocidad = PVector.random2D().mult(2); // Velocidad aleatoria inicial
    this.clickCount = 0; // Inicializar el contador de clicks
    this.lastClickTime = 0; // Inicializar el tiempo del último click
  }

  @Override
  void dibujar() {
    fill(111, 22, 11);
    rect(objetoTransform.posicion.x, objetoTransform.posicion.y,Dimension.ANCHO, Dimension.ALTO);
  }

  @Override
  void mover(float dx, float dy) {
    objetoTransform.posicion.add(dx, dy);
    this.colision.setPos(objetoTransform.posicion);
  }

  public void actualizar() {
    objetoTransform.posicion.add(velocidad);

    // Verificar bordes de la pantalla y cambiar dirección si es necesario
    if (objetoTransform.posicion.x < 0 || objetoTransform.posicion.x > width - 30) {
      velocidad.x *= -1;
    }
    if (objetoTransform.posicion.y < 0 || objetoTransform.posicion.y > height - 30) {
      velocidad.y *= -1;
    }
    
    this.colision.setPos(objetoTransform.posicion);
  }

  public boolean colisionaCon(Collider otroCollider) {
    return this.colision.validarColision(otroCollider);
  }

  public void setPosicion(PVector posicion) {
    objetoTransform.posicion = posicion;
    this.colision.setPos(posicion);
  }

  public PVector getPosicion() {
    return objetoTransform.posicion;
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
