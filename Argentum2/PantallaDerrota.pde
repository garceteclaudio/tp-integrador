class PantallaDerrota extends GameObject implements IDisplayable{

    public PantallaDerrota(){

    }

    public void dibujar(){
        background(240, 46, 143);
        fill(200);
        textSize(24);
        text("Derrota", width / 2, 150);
        text("Presione 1 para intro juego", width / 2, 190);
    }

}