class Hud{
    private Personaje jugador;

    public Hud(Personaje jugador){
        this.jugador = jugador;
    }

    public void visualizarInformacionDeJuego(int remainingTime){
        fill(200);
        textSize(35);
        text("Puntaje: " + this.jugador.getPuntaje(), 90, 35);    

        //fill(200);
        //textAlign(CENTER);
        //textSize(45);
        //text("Energia vital: " + jugador.getVidas(), width / 2, 75) ;

        fill(200);
        textSize(35);
        text("Tiempo: " + remainingTime / 1000, 80, 70);  


    }


    void mostrarPosicionPersonaje() {
        fill(200);
        textSize(24);
        text("x: " + this.jugador.getPosicion().x, 800, 20);
        text("y: " + this.jugador.getPosicion().y, 800, 50);
    }
}
