import fisica.*;
int c= 0; //contador 1
int salen=200; //tiempo que tardan en salir las notas
int c2= 0; //contador 2
int c3=0;//contador 3
int a=150;
int opo=3; //oportunidades

boolean notasSecaen =false;

FWorld mundo;
Parlante p;
//creamos una caja
//FBox caja;
FMouseJoint golpea;
FCircle circulo;
FBox caja; //este es el parlante
FBox meta; //este es la pareja
//PImage nota1, nota2, nota3;

void setup() {
  size(1800, 600);
  // circulo=new FCircle(10);
  Fisica.init(this);
  mundo = new FWorld();
  caja=new FBox(40, 10);
  meta=new FBox(150, 200);

  meta.setStatic(true);
  meta.setName("meta");
  caja.setPosition(width/2, height/2);
  caja.setNoStroke();
  //golpea= new FMouseJoint(caja, width/2, height/2); //Le hago un joint al rectangulo para conectarlo al mouse
  p = new Parlante (70, 70);
  //circulo.setName("nota");
  //para agregarle bordes al mundo y los elementos no se escapen
  // mundo.setEdges();
  mundo.add(meta);
  mundo.add(caja);
  mundo.add(golpea);
  caja.setRotatable(false); //para que no se gire el rectangulo cuando golpea las notas
}

void draw() {
  meta.setPosition(1200, a);
  p.oportunidades();
  c++;
  c2++;
  background(255);
  textSize(15);
  text("contador:"+ c, 60, 30);
  textSize(20);
  fill(#000000);
  text("oportunidades:"+ opo,60,490);
  //golpea.setTarget(mouseX, mouseY); //Con esto el rectangulo sigue al mouse
  //para que hagan todos los calculos matematicos entre los cuerpos que interactuan ¿¿
  mundo.step();
  //dibuja el mundo de fisica
  mundo.draw();

  if (c>=salen) {
    p.notas(mundo);
    c=0;
  }
  //Si c2 es mayor a 2000 las notas van a salir mas rapido, empieza a contar c3
  if (c2>2000) {
    salen=25;
    c3++;
    mundo.setGravity(-200, 0);
  }
  // cuando c3 llega a 800 vuelven a salir con normalidad
  if (c3>=800) {
    c2=0;
    c3=0;
    salen=50;
    mundo.setGravity(100, 100);
  }
  
  /*if(p.notas > 600){
    notasSecaen = true;
}
  
  if(notasSecaen){
    p.notas(mundo) ;
  }*/
  


  /*if (mousePressed==true) {
    mundo.setGravity(-1000, 0);
  } else {
    mundo.setGravity(100, 100);
  }*/
  p.dibujar();

  println(c, c2, c3, salen, a);
}
void contactStarted(FContact contacto) {
  FBody body1=contacto.getBody1();
  FBody body2=contacto.getBody2();


  if ( body1.getName() != null && body2.getName() !=null) {
    a=400;
    mundo.remove(body2);
    println(body1.getName(), "colisiono");
  } else a=200;
}
