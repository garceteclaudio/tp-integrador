
private Pantalla p;

public void setup(){
  size(600, 600);
  p = new Pantalla();
}

void draw(){
  p.display();

}

public void keyReleased(){
  if(key=='2'){
    StateMachinePantallas.changeStateOpcion(p,2);
  }
  if(key=='3'){
     // derrota
    StateMachinePantallas.changeStateOpcion(p,3);
  }
  if(key=='4'){
   // victoria 
    StateMachinePantallas.changeStateOpcion(p,4);
  }
  
    if(key=='1'){
    StateMachinePantallas.changeStateOpcion(p,1);
  }
  println("Tecla liberada: " + key);
}
