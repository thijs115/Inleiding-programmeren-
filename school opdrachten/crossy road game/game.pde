int x=0;
void setup() {
  size(500, 500);
}
void draw() {
  background(100, 100, 100);
  for (int i=1; i<=6; i=i+1) {
    line(0, i*80, width, 80*i);
  }
  int blokjeBreedte=90;
  int startPositie = -10;
  int hoogteWeg = 80;
  int ruimte=10;
  x = x + 5;
  if (x >= 500) {
    x=startPositie - blokjeBreedte;
  }
  //blokjeBreedte=60+35;
  for (int i = 0; i<6; i++) {
    rect(x, hoogteWeg*i+ruimte, blokjeBreedte, 60, 15);
  }
  //rect(x,hoogteWeg*1+ruimte,blokjeBreedte,60);
  //rect(x,hoogteWeg*2+ruimte,blokjeBreedte,60);
  //rect(x,hoogteWeg*3+ruimte,blokjeBreedte,60);
  //rect(x,hoogteWeg*4+ruimte,blokjeBreedte,60);
  //rect(x,hoogteWeg*5+ruimte,blokjeBreedte,60);
}
