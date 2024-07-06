class Transform {
  private PVector position;

  public Transform(float x, float y) {
    this.position = new PVector(x, y);
  }

  public void mover(float dx, float dy) {
    this.position.add(dx, dy);
  }

  public PVector getPosition() {
    return this.position;
  }

  public void setPosition(PVector position) {
    this.position = position;
  }

  public float getX() {
    return this.position.x;
  }

  public float getY() {
    return this.position.y;
  }

  public void setX(float x) {
    this.position.x = x;
  }

  public void setY(float y) {
    this.position.y = y;
  }
}
