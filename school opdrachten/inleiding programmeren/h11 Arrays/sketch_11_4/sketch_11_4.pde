int[] mijnGetallen = new int[10];

void setup(){
  for(int i = 0; i < mijnGetallen.length; i++){
    mijnGetallen[i] = 12+i*12;
  }
  
  for(int i = 0; i < mijnGetallen.length; i++){
    println(mijnGetallen[i]);
  }
  
}
