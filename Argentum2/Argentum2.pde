private Pantalla pantalla;
private MaquinaDeEstadosPantallas maquinaDeEstados;


void setup() {
    size(900, 700);
    maquinaDeEstados = new MaquinaDeEstadosPantallas();
    pantalla = maquinaDeEstados.cambiarEstado(MaquinaDeEstadosPantallas.INICIO, pantalla);
    
}

void draw() {
    float deltaTime = Time.getDeltaTime(frameRate);
    // metodo polimorfico
    pantalla.visualizar(deltaTime);
    //println("Posición del mouse - X: " + mouseX + ", Y: " + mouseY);
    frameRate(40);
}

void mousePressed() {
    if (pantalla.estado == MaquinaDeEstadosPantallas.INICIO) { 
        if (mouseY > 211 && mouseY < 245 && mouseX > 360 && mouseX < 560) {
            pantalla = maquinaDeEstados.cambiarEstado(MaquinaDeEstadosPantallas.TUTORIAL, pantalla);
        } else if (mouseY > 274 && mouseY < 305 && mouseX > 262 && mouseX < 652) {
            pantalla = maquinaDeEstados.cambiarEstado(MaquinaDeEstadosPantallas.PUNTAJES, pantalla);
        } else if (mouseY > 336 && mouseY < 363 && mouseX > 379 && mouseX < 538) {
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
