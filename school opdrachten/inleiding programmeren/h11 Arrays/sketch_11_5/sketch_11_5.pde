boolean gevonden;
String[] namen = {"Piet", "Jan", "Lisa", "Anna", "Kees"};

void setup(){
  gevonden = false;
  
  for(int i = 0; i < namen.length; i++){
    if(namen[i].equals("Jan")){
      gevonden = true;
    }
  }
  
  println(gevonden);
}
