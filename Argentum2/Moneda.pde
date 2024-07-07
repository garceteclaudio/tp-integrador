class Moneda implements IVisualizable {

    private Transform objetoTransform;
    private Collider colision;
    private ImageComponent imageComponent;

    public Moneda(PVector posicion, String imagePath){
        this.objetoTransform = new Transform(posicion.x, posicion.y);
        this.colision = new Collider(40, 40, posicion);
        this.imageComponent = new ImageComponent(imagePath);
    }

    public boolean colisionaCon(Collider otroCollider) {
        return this.colision.validarColision(otroCollider);
    }

    @Override
    void display() {
        imageComponent.displayImage(objetoTransform.getPosition(), 40, 40);
    }
    
    public Collider getColision() {
        return this.colision;
    }
}