void setup(){
  size(250,250);
  background(255,255,255);
  stroke(0,0,0);
  strokeWeight(2);
  
  tekenVierkant(50,50,100,100);
 
}
void draw(){
}
void tekenVierkant(float x, float y, float breedte, float hoogte){
  line(x, y, x + breedte, y);
  
  line(x + breedte, y, x + breedte, y + hoogte);
  
  line(x + breedte, y + hoogte, x, y + hoogte);
 
  line(x, y + hoogte, x, y); 
}
