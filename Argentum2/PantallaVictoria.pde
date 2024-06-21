class PantallaVictoria extends GameObject implements IDisplayable{

    public PantallaVictoria(){

    }

    public void dibujar(){
        background(205, 211, 43);
        fill(0);
        textSize(24);
        text("VICTORIA TOTAL !!", width / 2, 150);
        text("Presione 1 para intro juego", width / 2, 190);
    }

}