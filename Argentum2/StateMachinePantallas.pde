static class StateMachinePantallas{
  public static final int INTRO_JUEGO=1;
  public static final int JUGANDO=2;
  public static final int DERROTA=3;
  public static final int VICTORIA=4;
  
  public static void changeState(Pantalla p, int cantVidas){
    switch(p.getEstado()){
      case StateMachinePantallas.INTRO_JUEGO:{
        if(cantVidas == 0){
          p.setEstado(StateMachinePantallas.JUGANDO);
        }
        break;
      }
      
      case StateMachinePantallas.JUGANDO:{
        if(cantVidas > 100){
           p.setEstado(StateMachinePantallas.VICTORIA);
        }
        if(cantVidas < 0){
           p.setEstado(StateMachinePantallas.DERROTA);
        }
        break;
      }
      
      case StateMachinePantallas.VICTORIA:{
        
        break;
      }
      case StateMachinePantallas.DERROTA:{

        break;
      }
    }// fin switch
  }// FIN CHANGESTATE
  
  
  /*
  
  public static final int INTRO_JUEGO=1;
  public static final int JUGANDO=2;
  public static final int DERROTA=3;
  public static final int VICTORIA=4;
    
  
  */
  
    public static void changeStateOpcion(Pantalla p, int opcion){
    switch(p.getEstado()){
      case StateMachinePantallas.INTRO_JUEGO:{
          if(opcion==2){
           p.setEstado(StateMachinePantallas.JUGANDO);
          }
        break;
      }
      
      case StateMachinePantallas.JUGANDO:{
          if(opcion==3){
           p.setEstado(StateMachinePantallas.DERROTA);
          } 
          
          if(opcion==4){
           p.setEstado(StateMachinePantallas.VICTORIA);
          }

        break;
      }
      
      case StateMachinePantallas.DERROTA:{
          if(opcion==1){
           p.setEstado(StateMachinePantallas.INTRO_JUEGO);
          }
        break;
      }
      
      case StateMachinePantallas.VICTORIA:{
          if(opcion==1){
           p.setEstado(StateMachinePantallas.INTRO_JUEGO);
          }
        break;
      }

    }// fin switch
  }// FIN CHANGESTATE
}
