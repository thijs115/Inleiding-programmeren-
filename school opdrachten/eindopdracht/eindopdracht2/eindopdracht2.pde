float x = 300;
float y = 200;
float speed = 7;

// Lijn 1 eigenschappen (Boven naar Beneden)
float lineY1 = 0;
float lineSnelheid1 = 3;
float gatX1;

// Lijn 2 eigenschappen (Boven naar Beneden)
float lineY2 = -250;
float lineSnelheid2 = 3;
float gatX2;

// Lijn 3 eigenschappen (Links naar Rechts)
float lineX3 = 0;
float lineSnelheid3 = 4.0; // Verhoogd van 2.5 naar 4.0
float gatY3;

// Lijn 4 eigenschappen (Rechts naar Links)
float lineX4 = 800; 
float lineSnelheid4 = -4.0; // Verhoogd van -2.5 naar -4.0
float gatY4;

float gatBrebreedte = 100;
boolean gameOver = false;

// ONZICHTBARE HULPMIDDELEN VOOR DE BALANS
float minAfstand = 180;      
float maxGatVerschil = 150;  

// 0 = Menu, 1 = Alleen boven/beneden, 2 = Alleen links/rechts
int speelModus = 0; 

// SCORE EN HIGHSCORE VARIABELEN
int startTijd;    
int score = 0;    
int highscoreModus1 = 0; 
int highscoreModus2 = 0; 

void setup(){
  size(600, 400);
  gatX1 = random(50, width - 50 - gatBrebreedte);
  gatX2 = genereerNieuwGat(gatX1, width);
  gatY3 = random(50, height - 50 - gatBrebreedte);
  gatY4 = genereerNieuwGat(gatY3, height);
}

void draw(){
  background(220, 220, 220);
  
  if (speelModus == 0) {
    // HOOFDMENU
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(32);
    text("Kies je Moeilijkheidsgraad", width/2, height/2 - 80);
    
    textSize(18);
    fill(50);
    // Modus 1 tekst + highscore
    text("Druk op '1' voor Modus 1 (Alleen Boven & Beneden)", width/2, height/2 - 20);
    fill(100);
    text("Highscore Modus 1: " + formatteerTijd(highscoreModus1), width/2, height/2);
    
    // Modus 2 tekst + highscore
    fill(50);
    text("Druk op '2' voor Modus 2 (Alleen Links & Rechts)", width/2, height/2 + 40);
    fill(100);
    text("Highscore Modus 2: " + formatteerTijd(highscoreModus2), width/2, height/2 + 60);
    
    if (keyPressed) {
      if (key == '1') { speelModus = 1; herstartSpel(); }
      else if (key == '2') { speelModus = 2; herstartSpel(); }
    }
  } 
  else if (!gameOver) {
    score = (millis() - startTijd) / 1000;

    // 1. BESTURING VAN DE CIRKEL
    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == UP) y = y - speed;
        else if (keyCode == DOWN) y = y + speed;
        else if (keyCode == LEFT) x = x - speed;
        else if (keyCode == RIGHT) x = x + speed;
      }
    }

    // Randen van het scherm controleren
    if (x < 20) x = 20; else if (x > width - 20) x = width - 20;
    if (y < 20) y = 20; else if (y > height - 20) y = height - 20;

    stroke(0);
    strokeWeight(6);

    // 2. LIJNEN BEWEGEN, TEKENEN & BOTSINGEN

    // --- ALLEEN ACTIEF IN MODUS 1 (Horizontale lijnen) ---
    if (speelModus == 1) {
      lineY1 = lineY1 + lineSnelheid1;
      lineY2 = lineY2 + lineSnelheid2;

      if (lineY1 > height) {
        lineY1 = min(lineY2 - minAfstand, -50); 
        lineSnelheid1 = random(2.5, 4.0); 
        gatX1 = genereerNieuwGat(gatX2, width);
      }
      if (lineY2 > height) {
        lineY2 = min(lineY1 - minAfstand, -50); 
        lineSnelheid2 = random(2.5, 4.0);
        gatX2 = genereerNieuwGat(gatX1, width);
      }

      // Horizontale lijnen tekenen
      line(0, lineY1, gatX1, lineY1); line(gatX1 + gatBrebreedte, lineY1, width, lineY1);
      line(0, lineY2, gatX2, lineY2); line(gatX2 + gatBrebreedte, lineY2, width, lineY2);

      // Botsing checken
      if (abs(y - lineY1) < 20 && (x < gatX1 || x > (gatX1 + gatBrebreedte))) geefGameOver();
      if (abs(y - lineY2) < 20 && (x < gatX2 || x > (gatX2 + gatBrebreedte))) geefGameOver();
    }

    // --- ALLEEN ACTIEF IN MODUS 2 (Verticale lijnen) ---
    if (speelModus == 2) {
      lineX3 = lineX3 + lineSnelheid3;
      lineX4 = lineX4 + lineSnelheid4;

      if (lineX3 > width) {
        lineX3 = -50; 
        lineSnelheid3 = random(4.0, 5.5); // Verhoogd van (2.5, 4.0) naar (4.0, 5.5)
        gatY3 = genereerNieuwGat(gatY4, height);
      }
      if (lineX4 < -50) {
        lineX4 = max(lineX3 + width + minAfstand, width + 50);
        lineSnelheid4 = random(-5.5, -4.0); // Verhoogd van (-4.0, -2.5) naar (-5.5, -4.0)
        gatY4 = genereerNieuwGat(gatY3, height);
      }

      // Verticale lijnen tekenen
      line(lineX3, 0, lineX3, gatY3); line(lineX3, gatY3 + gatBrebreedte, lineX3, height);
      line(lineX4, 0, lineX4, gatY4); line(lineX4, gatY4 + gatBrebreedte, lineX4, height);

      // Botsing checken
      if (abs(x - lineX3) < 20 && (y < gatY3 || y > (gatY3 + gatBrebreedte))) geefGameOver();
      if (abs(x - lineX4) < 20 && (y < gatY4 || y > (gatY4 + gatBrebreedte))) geefGameOver();
    }

    // Teken de speler
    noStroke(); fill(204, 0, 0); ellipse(x, y, 40, 40);

    // Live score
    fill(50); textSize(20); textAlign(LEFT, TOP);
    text("Tijd: " + formatteerTijd(score), 20, 20);
  } 
  else {
    // GAME OVER SCHERM
    fill(0); textSize(32); textAlign(CENTER, CENTER);
    text("Game Over!", width/2, height/2 - 60);
    
    textSize(22); fill(204, 0, 0);
    text("Je hebt het " + formatteerTijd(score) + " volgehouden!", width/2, height/2 - 15);
    
    textSize(16); fill(0);
    text("Druk op 'R' om dezelfde modus opnieuw te starten", width/2, height/2 + 35);
    text("Druk op 'M' om terug te gaan naar het menu", width/2, height/2 + 65);
    
    if (keyPressed) {
      if (key == 'r' || key == 'R') herstartSpel();
      else if (key == 'm' || key == 'M') speelModus = 0;
    }
  }
}

String formatteerTijd(int totaleSeconden) {
  int minuten = totaleSeconden / 60;
  int seconden = totaleSeconden % 60;
  return minuten + ":" + nf(seconden, 2);
}

void geefGameOver() {
  gameOver = true;
  if (speelModus == 1 && score > highscoreModus1) {
    highscoreModus1 = score;
  } else if (speelModus == 2 && score > highscoreModus2) {
    highscoreModus2 = score;
  }
}

float genereerNieuwGat(float vorigGat, float maxSchermGrootte) {
  float nieuwGat = random(vorigGat - maxGatVerschil, vorigGat + maxGatVerschil);
  return constrain(nieuwGat, 50, maxSchermGrootte - 50 - gatBrebreedte);
}

void herstartSpel() {
  x = 300;
  y = 200;
  
  lineY1 = -50;
  lineY2 = lineY1 - minAfstand; 
  lineX3 = -50;
  lineX4 = width + 50 + minAfstand; 
  
  lineSnelheid1 = 3.0;
  lineSnelheid2 = 3.0;
  lineSnelheid3 = 4.0; // Verhoogde startsnelheid bij herstart
  lineSnelheid4 = -4.0; // Verhoogde startsnelheid bij herstart

  gatX1 = random(50, width - 50 - gatBrebreedte);
  gatX2 = genereerNieuwGat(gatX1, width);
  gatY3 = random(50, height - 50 - gatBrebreedte);
  gatY4 = genereerNieuwGat(gatY3, height);
  
  startTijd = millis();
  score = 0;
  gameOver = false;
}
