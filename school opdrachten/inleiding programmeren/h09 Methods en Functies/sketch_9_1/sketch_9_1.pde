int getal= 5;
int getaltwee= 8;

void setup(){
  mijnCijfers();
}

void mijnCijfers(){
  int gemiddelde = (getal + getaltwee) % 2;
  println("Je gemiddelde cijfer is " + gemiddelde);
}
