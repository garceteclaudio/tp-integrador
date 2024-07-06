class PantallaDerrota extends Pantalla{

    public PantallaDerrota(int estado){
      super(estado);
    }

    public void visualizar(){
        background(240, 46, 143);
        fill(200);
        textSize(24);
        text("Derrota", width / 2, 150);
        text("Presione 1 para intro juego", width / 2, 190);
    }

}
