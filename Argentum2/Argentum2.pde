private Pantalla pantalla;
private MaquinaDeEstadosPantallas maquinaDeEstados;


void setup() {
    size(900, 700);
    maquinaDeEstados = new MaquinaDeEstadosPantallas();
    pantalla = maquinaDeEstados.cambiarEstado(MaquinaDeEstadosPantallas.INICIO, pantalla);
    frameRate(60);
}

void draw() {
    // metodo polimorfico
    pantalla.visualizar();
}

void mousePressed() {
    if (pantalla.estado == MaquinaDeEstadosPantallas.INICIO) { 
        if (mouseY > 180 && mouseY < 220 && mouseX > width / 2 - 100 && mouseX < width / 2 + 100) {
            pantalla = maquinaDeEstados.cambiarEstado(MaquinaDeEstadosPantallas.TUTORIAL, pantalla);
        } else if (mouseY > 230 && mouseY < 270 && mouseX > width / 2 - 100 && mouseX < width / 2 + 100) {
            pantalla = maquinaDeEstados.cambiarEstado(MaquinaDeEstadosPantallas.PUNTAJES, pantalla);
        } else if (mouseY > 280 && mouseY < 320 && mouseX > width / 2 - 100 && mouseX < width / 2 + 100) {
            exit();
        }
    }

}

void keyReleased() {
    if (pantalla.estado == MaquinaDeEstadosPantallas.TUTORIAL) { 
      if (key == ' ') {
          pantalla = maquinaDeEstados.cambiarEstado(MaquinaDeEstadosPantallas.JUGANDO, pantalla);
      }
    }
    
    if (key == '3') {
        pantalla = maquinaDeEstados.cambiarEstado(MaquinaDeEstadosPantallas.DERROTA, pantalla);
    }
    if (key == '4') {
        pantalla = maquinaDeEstados.cambiarEstado(MaquinaDeEstadosPantallas.VICTORIA, pantalla);
    }
    if (key == '1') {
        pantalla = maquinaDeEstados.cambiarEstado(MaquinaDeEstadosPantallas.INICIO, pantalla);
    }
   
}
