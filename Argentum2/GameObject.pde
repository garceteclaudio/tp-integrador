// Recomendacion, eliminar clase game object

abstract class GameObject{
  protected Transform transform;
  protected float ancho,alto;
  
  public float getAncho(){
    return this.ancho;
  }
  public float getAlto(){
    return this.alto;
  }
}
