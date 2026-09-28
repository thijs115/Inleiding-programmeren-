size(200,200);
background(255,255,255);

int sizeA=100;

for(int i = 0; i < 5; i++){
  ellipse(100 - sizeA/-2, 100 - sizeA/-2, sizeA,sizeA);
  sizeA = sizeA - 10;
}
int sizeB=100;
for(int i = 0; i < 5; i++){
  ellipse(100 - sizeB/2, 100 - sizeB/2, sizeB,sizeB);
  sizeB = sizeB - 10;
}
