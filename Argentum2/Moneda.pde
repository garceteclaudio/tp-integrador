class Moneda implements IVisualizable {

    private Transform objetoTransform;
    private Collider colision;
    private ImageComponent imageComponent;

    public Moneda(PVector posicion, String imagePath){
        this.objetoTransform = new Transform(posicion.x, posicion.y);
        this.colision = new Collider(Dimension.ANCHO, Dimension.ALTO, posicion);
        this.imageComponent = new ImageComponent(imagePath);
    }

    public boolean colisionaCon(Collider otroCollider) {
        return this.colision.validarColision(otroCollider);
    }

    @Override
    void display() {
        imageComponent.displayImage(objetoTransform.getPosition(), Dimension.ANCHO, Dimension.ALTO);
    }
    
    public Collider getColision() {
        return this.colision;
    }
}