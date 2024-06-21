class Collider {
  private PVector pos; // Posición de la esquina superior izquierda
  private float ancho;
  private float alto;

  public Collider(float ancho, float alto, PVector pos) {
    this.ancho = ancho;
    this.alto = alto;
    this.pos = pos;
  }


  public boolean validarColision(Collider otroCollider) {
    boolean isCollide = false;

    if (this.pos.x < otroCollider.getPos().x + otroCollider.getAncho() &&
        this.pos.x + this.ancho > otroCollider.getPos().x &&
        this.pos.y < otroCollider.getPos().y + otroCollider.getAlto() &&
        this.pos.y + this.alto > otroCollider.getPos().y) 
        {
          isCollide = true;
        }

    return isCollide;
  }

  public PVector getPos() {
    return this.pos;
  }

  public float getAncho() {
    return this.ancho;
  }

  public float getAlto() {
    return this.alto;
  }

  public void setPos(PVector pos) {
    this.pos = pos;
  }
}
