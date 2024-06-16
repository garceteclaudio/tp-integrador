class Personaje extends GameObject implements IDisplayable, IMoveable {
  private Collider colision;
  Transform objetoTransform;
  float speed = 5;  // Velocidad de movimiento del personaje

  public Personaje(PVector posicion) {
    objetoTransform = new Transform();
    objetoTransform.posicion = posicion;
    this.colision = new Collider(30, 30, posicion);
  }

  @Override
  void dibujar() {
    fill(22, 111, 222);
    rect(objetoTransform.posicion.x, objetoTransform.posicion.y, 30, 30);
  }

  @Override
  void mover(float dx, float dy) {
    objetoTransform.posicion.add(dx, dy);
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

  // Método para manejar el movimiento del personaje con las teclas de flecha
  void moverConTeclado() {
    if (keyPressed) {
      if (keyCode == UP) {
        mover(0, -speed);  // Mover hacia arriba
      } else if (keyCode == DOWN) {
        mover(0, speed);   // Mover hacia abajo
      } else if (keyCode == LEFT) {
        mover(-speed, 0);  // Mover hacia la izquierda
      } else if (keyCode == RIGHT) {
        mover(speed, 0);   // Mover hacia la derecha
      }
    }
  }
}
