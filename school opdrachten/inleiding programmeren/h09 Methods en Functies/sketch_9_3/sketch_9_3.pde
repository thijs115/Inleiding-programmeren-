int totaalCijfers;

void setup(){
  totaalCijfers = mijnCijfers(6, 6);
  println(totaalCijfers);
}

void draw(){
  
}

int mijnCijfers(int getal, int getalTwee){
  int gemiddeld = getal + getalTwee %2;
  return gemiddeld;
}
