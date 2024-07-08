abstract class Pantalla{
  public int estado;
  public abstract void visualizar(float deltaTime);

  Pantalla(int estado) {
    this.estado = estado;
  }

}
