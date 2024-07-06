private Pantalla pantalla;
private MaquinaDeEstadosPantallas maquinaDeEStados;

void setup() {
  size(900, 700);
  maquinaDeEStados = new MaquinaDeEstadosPantallas();
  pantalla = maquinaDeEStados.cambiarEstado(MaquinaDeEstadosPantallas.INICIO, pantalla);
  frameRate(60);
}

void draw() {
  // metodo polimorfico
  pantalla.visualizar();
}

void mousePressed() {
  if (pantalla.estado == MaquinaDeEstadosPantallas.INICIO) { 
    if (mouseY > 180 && mouseY < 220 && mouseX > width / 2 - 100 && mouseX < width / 2 + 100) {
      pantalla = maquinaDeEStados.cambiarEstado(MaquinaDeEstadosPantallas.JUGANDO, pantalla);
    } else if (mouseY > 230 && mouseY < 270 && mouseX > width / 2 - 100 && mouseX < width / 2 + 100) {
      pantalla = maquinaDeEStados.cambiarEstado(MaquinaDeEstadosPantallas.VICTORIA, pantalla);
    } else if (mouseY > 280 && mouseY < 320 && mouseX > width / 2 - 100 && mouseX < width / 2 + 100) {
      exit();
    }
  }
}

void keyReleased() {
  if (key=='3'){
    pantalla = maquinaDeEStados.cambiarEstado(MaquinaDeEstadosPantallas.DERROTA, pantalla);
  }
  if (key=='4'){
    pantalla = maquinaDeEStados.cambiarEstado(MaquinaDeEstadosPantallas.VICTORIA, pantalla);
  }
  if (key=='1'){
    pantalla = maquinaDeEStados.cambiarEstado(MaquinaDeEstadosPantallas.INICIO, pantalla);
  }
}
