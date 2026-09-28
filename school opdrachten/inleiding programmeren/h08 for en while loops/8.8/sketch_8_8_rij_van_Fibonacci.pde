int aantal = 15;

int Nummer1 = 0;
int Nummer2 = 1;

println("De eerste " + aantal + " getallen van de rij van fibonacci:");

for(int i = 1; i<= aantal; i++) {
  print(Nummer1 + " ");
  
  int volgendeNummer = Nummer1 + Nummer2;
  
  Nummer1 = Nummer2;
  Nummer2 = volgendeNummer;
}
