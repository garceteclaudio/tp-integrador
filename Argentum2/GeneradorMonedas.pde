class GeneradorMonedas{
    private ArrayList<Moneda> monedas;

    public GeneradorMonedas(){
        monedas = new ArrayList<Moneda>();
        for (int i = 0; i < 10; i++) {
            monedas.add(new Moneda(new PVector(random(width), random(height)), "/resources/images/oro.png"));
        }

    }

    public void dibujarYActualizarMonedas(Personaje jugador){
        for (int i = monedas.size() - 1; i >= 0; i--) {
            Moneda moneda = this.monedas.get(i);
            moneda.display();
            if (jugador.colisionaCon(moneda.getColision())) {
                this.monedas.remove(i);
                jugador.sumarPuntajeMoneda();
            }
        }
    }
}