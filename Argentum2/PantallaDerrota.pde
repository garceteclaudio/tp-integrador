class PantallaDerrota extends Pantalla {
    private ArrayList<String> puntajes;
    private PImage fondo;

    public PantallaDerrota(int estado) {
        super(estado);
        fondo = loadImage("/resources/images/pantalla-derrota.jpg");
    }

    public void visualizar(float deltaTime) {
        background(fondo);
        fill(255);
        textSize(45);
        textAlign(CENTER);
        text("Derrota.", width / 2, 150);
        text("Presione 1 para intro juego", width / 2, 200);
    }
}
