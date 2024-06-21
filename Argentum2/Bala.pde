class Bala implements IDisplayable{
  public PVector posicion;
  public float velocidad;
  public PVector direccion;
  private Collider colision;
      
  public Bala(){
    velocidad = 5;
    //this.colision = new Collider(Dimension.ANCHO, Dimension.ALTO, posicion);
  }
  
  public void dibujar(){
    fill(0,0,255);
    rect(this.posicion.x,this.posicion.y,60,60);
  }
  
  
  public void mover(){
    this.posicion.x+=(direccion.x *velocidad);
    this.posicion.y+=(direccion.y * velocidad);
    
  }
  
  public PVector getPosicion(){
    return this.posicion;
  }
  
  public PVector getDireccion(){
    return this.direccion;
  }
  
  public void setPosicion(PVector posicion) {
    this.posicion = posicion;
  }
  
    public void setDireccion(PVector direccion) {
    this.direccion = direccion;
  }
  
  
    public boolean colisionaCon(Collider otroCollider) {
        return this.colision.validarColision(otroCollider);
    }
}
