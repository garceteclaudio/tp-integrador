class MaquinaDeEstadosPantallas {
    static final int INICIO = 0;
    static final int JUGANDO = 1;
    static final int VICTORIA = 2;
    static final int DERROTA = 3;

    public Pantalla cambiarEstado(int nuevoEstado, Pantalla pantallaActual) {
        switch (nuevoEstado) {
            case 0:
                return new PantallaInicio(INICIO);
            case 1:
                return new PantallaEscenario(JUGANDO, this);
            case 2:
                return new PantallaVictoria(VICTORIA);
            case 3:
                return new PantallaDerrota(DERROTA);
        }
        return pantallaActual;
    }
}
