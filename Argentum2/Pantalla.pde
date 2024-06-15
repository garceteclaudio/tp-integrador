class Pantalla{
  int estado;
  
  public Pantalla(){
    this.estado = StateMachinePantallas.INTRO_JUEGO;
  }
  
  public void setEstado(int estado){
    this.estado = estado;
  }
  
  public int getEstado(){
    return this.estado;
  }
  
  public void display(){
    switch(this.estado){
      case StateMachinePantallas.INTRO_JUEGO:{ // 0 
        background(58,116,46);
        fill(200);
        textSize(24);
        text("Presione 2 para JUGANDO",250,150);
        text("Presione X para salir del juego",250,190);
        break;
      }
      case StateMachinePantallas.JUGANDO:{ // 1
        background(0,0,255);
        fill(200);
        textSize(24);
        text("Se encuentra jugando",250,150);
        text("Presione 3 para derrota",250,190);
        text("Presione 4 para victoria",250,230);
        break;
      }
      
      case StateMachinePantallas.VICTORIA:{ // 2
        background(205,211,43);
        fill(0);
        textSize(24);
        text("VICTORIA TOTAL !!",250,150);
        text("Presione 1 para intro juego",250,190);
        break;
      }
      case StateMachinePantallas.DERROTA:{ // 3
        background(240,46,143);
        fill(200);
        textSize(24);
        text("Derrota",250,150);
        text("Presione 1 para intro juego",250,190);
        break;
      }
    }
  } // fin display
  
}
