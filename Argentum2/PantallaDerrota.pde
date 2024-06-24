class PantallaDerrota extends GameObject implements IVisualizable{

    public PantallaDerrota(){

    }

    public void display(){
        background(240, 46, 143);
        fill(200);
        textSize(24);
        text("Derrota", width / 2, 150);
        text("Presione 1 para intro juego", width / 2, 190);
    }

}
