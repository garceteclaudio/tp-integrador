class PantallaDerrota extends Pantalla {
    private PImage fondo;

    public PantallaDerrota(int estado) {
        super(estado);
        fondo = loadImage("/resources/images/pantalla-derrota2.jpg");
    }

    public void visualizar(float deltaTime) {
        background(fondo);
        fill(255);
        textSize(45);
        textAlign(CENTER);
        text("Has sido derrotado.", width / 2, 100);
        text("Presione 1 para intro juego", width / 2, 150);
    }
}
