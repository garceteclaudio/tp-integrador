class PantallaEscenario extends GameObject implements IVisualizable{
  
  private Personaje jugador;
  private ArrayList<Enemigo> enemigos;
  ArrayList<Explosion> explosiones;
  Bala b;
  Enemigo enemigoDragon;
  
  public PantallaEscenario(){
    jugador = new Personaje(new PVector(100, 100), "/images/mago.png");
    enemigos = new ArrayList<Enemigo>();
    for (int i = 0; i < 5; i++) {
      enemigos.add(new Enemigo(new PVector(random(width), random(height)), "/images/zombie.png"));
    }
    
    explosiones = new ArrayList();
     for (int i = 0; i < 100; i++) {
          explosiones.add(new Explosion(100,200));
     }
     
     enemigoDragon = new Enemigo(new PVector(random(width), random(height)), "/images/dragon.png");
  }

  void dibujarExplosiones(){
    for(int i=0;i<explosiones.size();i++){
          Explosion e = explosiones.get(i);
          e.display();
    }
  }

  public void display(){
        background(0);
        fill(200);
        textSize(24);
        text("Se encuentra jugando", width / 2, 20);
        text("Presione 3 para derrota", width / 2, 40);
        text("Presione 4 para victoria", width / 2, 60);

        dibujarExplosiones();
        //float deltaTime = Time.getDeltaTime(frameRate);

        jugador.moverConTeclado();
        jugador.display();
        
        enemigoDragon.display();
        enemigoDragon.actualizar();
        if (jugador.colisionaCon(enemigoDragon.getColision())) {
            fill(255, 0, 0);
            text("Colisión con dragon ok", width / 2, 200);
         }
         

        // Verificar clicks sobre enemigo dragon
        if (mousePressed) {
            if (enemigoDragon.getColision().validarColision(new Collider(1, 1, new PVector(mouseX, mouseY)))) {
              if (enemigoDragon.puedeRegistrarClick()) {
                enemigoDragon.registrarClick();
                enemigoDragon.aumentarClickCount();
                print("Click numero" + enemigoDragon.getClickCount()+ "\n");

              }
            }
        }// fin mousePressed
        

         
        // Dibujar y actualizar enemigos
        for (Enemigo enemigo : enemigos) {
          enemigo.display();
          enemigo.actualizar();
          if (jugador.colisionaCon(enemigo.getColision())) {
            fill(255, 0, 0);
            text("Colisión ok", width / 2, 200);
          }
        }

        
        // Verificar clicks
        if (mousePressed) {
          for (Enemigo enemigo : enemigos) {
            if (enemigo.getColision().validarColision(new Collider(1, 1, new PVector(mouseX, mouseY)))) {
              if (enemigo.puedeRegistrarClick()) {
                enemigo.registrarClick();
                enemigo.aumentarClickCount();
                print("Click numero" + enemigo.getClickCount()+ "\n");
                if (enemigo.getClickCount() >= 5) {
                  enemigos.remove(enemigo);
                  break; // Salir del bucle una vez que se elimina el enemigo
                }
              }
            }
          }
        }// fin mousePressed

        // Mostrar posición del personaje
        mostrarPosicionPersonaje();
        
        if(b!=null){
          b.display();
          b.mover();
        }
        // falta ver colision con enemigoDragon
        /*
        if (b.colisionaCon(enemigoDragon.getColision())) {
            fill(255, 0, 0);
            text("Colisión bala con dragon", width / 2, 200);
         
         }*/    
  }

  void mostrarPosicionPersonaje(){
        fill(200);
        textSize(24);
        text("x: " + jugador.getPosicion().x, 650, 20);
        text("y: " + jugador.getPosicion().y, 650, 50);  
  }
  
 void keyReleased(){
   if(key=='a'){
     print("Se presiono a !!!! \n");
     b = new Bala();
     PVector direccion = PVector.sub(enemigoDragon.getPosicion(),jugador.getPosicion());
     direccion.normalize();   
     b.setDireccion((new PVector(direccion.x,direccion.y)));
     b.setPosicion((new PVector(jugador.getPosicion().x,jugador.getPosicion().y)));
  
   }
 }
} // fin clase escenario
