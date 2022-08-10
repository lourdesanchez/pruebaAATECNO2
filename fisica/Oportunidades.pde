void oportunidades(){
  ArrayList <FBody> cuerpos = mundo.getBodies();
  
  for (FBody este: cuerpos){
    String nombre = este.getName();
    if(nombre != null){
      if ( nombre.equals("notas")){
        if(este.getY()*height > height+100){
          opo = -1;
        }
      }
    }
    
  }
}
