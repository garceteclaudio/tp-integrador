class PantallaInicio extends Pantalla{

    public PantallaInicio(int estado){
      super(estado);

    }

    public void visualizar(){
        background(58, 116, 46);
        textSize(32);
        fill(0);
        textAlign(CENTER);
        text("Menú Principal", width / 2, 100);

        textSize(24);
        text("Empezar juego", width / 2, 200);
        text("Record de puntajes", width / 2, 250);
        text("Salir", width / 2, 300);
    }

}
