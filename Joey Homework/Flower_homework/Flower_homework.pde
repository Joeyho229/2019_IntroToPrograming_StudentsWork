// Credit to Lukas Harkamp for helping me understand the dot. ^_^ //<>//

Flower[] Flowers = new Flower[4];    // Array for Flower class
Sun[] Suns = new Sun[2];    // Array for Sun class

int [] FlowerRadius = new int[4];    // Array for FlowerRadius 
{    // Bestemmer hvilke bestemte værdier hver FlowerRadius skal være, hvis ikke oplyst, vil defeault være 0.
  FlowerRadius [0] = 60;
  FlowerRadius [1] = 20;
  FlowerRadius [2] = 40;
  FlowerRadius [3] = 50;
}

int [] SunRadius = new int[2];    // Array for SunRadius
{    // Bestemmer hvilke bestemte værdier hver SunRadius skal være, hvis ikke oplyst, vil defeault være 0.
  SunRadius[0] = 100;
  SunRadius[1] = 75;
}

int [] Petals = new int[3];    // Array for petals
{    // Bestemmer hvilke bestemte værdier hver Petals skal være, hvis ikke oplyst, vil defeault være 0.
  Petals[0] = 8;
  Petals[1] = 5;
  Petals[2] = 10;
}

int [] Rays = new int[4];    // Array for rays
{    // Bestemmer hvilke bestemte værdier hver Rays skal være, hvis ikke oplyst, vil defeault være 0.
  Rays[0] = 9;
  Rays[1] = 7;
  Rays[2] = 8;
}

float [] colour = new float[4];    // Array for colour
{    // Bestemmer hvilke værdier hver colour skal være
  colour[0] = random(0, 255);
  colour[1] = random(0, 255);
  colour[2] = random(0, 255);
  colour[3] = random(0, 255);
}

void setup() {
  size(1500, 1500);    // Canvas size

  // Lokale Float variabler
  float [] xPosition = new float[6];
  {
    xPosition[0] = random(100, width - 100);
    xPosition[1] = random(100, width - 100);
    xPosition[2] = random(100, width - 100);
    xPosition[3] = random(100, width - 100);
    xPosition[4] = random(100, width - 100);
    xPosition[5] = random(100, width - 100);
  }

  float [] yPosition = new float[6];
  {
    yPosition[0] = random(100, height - 100);
    yPosition[1] = random(100, height - 100);
    yPosition[2] = random(100, height - 100);
    yPosition[3] = random(100, height - 100);
    yPosition[4] = random(100, height - 100);
    yPosition[5] = random(100, height - 100);
  }

  // Lokale Integer variabler
  int pc = #FF9500;
  int sc = #F5DD00;
  int rc = #F5DD00;

  // Fremkaldning af Flowers[1]- 2 og 3. Hvorved der gives nye variabler
  Flowers[0] = new Flower(FlowerRadius[0], Petals[0], xPosition[0], yPosition[0], pc);
  Flowers[1] = new Flower(FlowerRadius[1], Petals[1], xPosition[1], yPosition[1], pc);
  Flowers[2] = new Flower(FlowerRadius[2], Petals[2], xPosition[2], yPosition[2], pc);
  Flowers[3] = new Flower(FlowerRadius[3], Petals[1], xPosition[3], yPosition[3], pc);

  // Frmekaldning af mySun
  Suns[0] = new Sun(xPosition[4], yPosition[4], SunRadius[0], sc, rc, Rays[0]);
  Suns[1] = new Sun(xPosition[5], yPosition[5], SunRadius[1], sc, rc, Rays[1]);

  // Fremkaldning af SunTrail
  SunTrail = new Sun[50];    // Siger at SunTrail er lig med 50x Sun objekter

  for (int i = 0; i < num; i++) {    // Fortæller at i begynder som 0, men er mindre end [num], og hver gang er i = i + 1
    SunTrail[i] = new Sun(xPosition[4], yPosition[4], SunRadius[0], sc, rc, Rays[0]);    // Fortæller at hver eneste SunTrail[i] har disse bestemte værdier
  }
}

void draw() {
  background(#FFE9FF);    // Canvas farve

  // Float variabler for overlappelse af andre objekter
  float d0 = dist(Suns[0].x, Suns[0].y, Flowers[0].x, Flowers[0].y);
  float d1 = dist(Suns[0].x, Suns[0].y, Flowers[1].x, Flowers[1].y);
  float d2 = dist(Suns[0].x, Suns[0].y, Flowers[2].x, Flowers[2].y);
  float d3 = dist(Suns[0].x, Suns[0].y, Flowers[3].x, Flowers[3].y);

  // Float variabler for hitbox mellem Suns[0] og Flowers[0], 1, 2, 3
  float SF0 = Suns[0].r + Flowers[0].r;
  float SF1 = Suns[0].r + Flowers[1].r;
  float SF2 = Suns[0].r + Flowers[2].r;
  float SF3 = Suns[0].r + Flowers[3].r;

  // If funktion for hvad der skal ske når Suns[0] overlapper med diverse Flowers[0], 1, 2, 3
  if ( d0 <= SF0) {    // If funktion for hvad der skal ske når Suns[0] overlapper med diverse Flowers[0]
    background(colour[0]);
  } else if (d1 <= SF1) {    // If else funktion for hvad der sker når Suns[0] overlapper med Flowers[1]
    background(colour[1]);
  } else if (d2 <= SF2) {    // If else funktion for hvad der sker når Suns[0] overlapper med Flowers[2]
    background(colour[2]);
  } else if (d3 <= SF3) {    // If else funktion for hvad der sker når Suns[0] overlapper med Flowers[3]
    background(colour[3]);
  }

  // Sammensætning af SunTrail 
  for (int i = num - 1; i > 0; i--) {
    SunTrail[i].x = SunTrail[i-1].x;
    SunTrail[i].y = SunTrail[i-1].y;
  }

  SunTrail[0].x = mouseX;
  SunTrail[0].y = mouseY;
  
  for (int i = 0; i < num; i++) {
    SunTrail[i].display();
  }

  // Sammensætning af Suns[0]
  Suns[0].position();
  Suns[0].display();
  Suns[0].Fname();

  // Overlap funktioner for Suns[0]
  Suns[0].overlap(Suns[1]);

  // Sammensætning af Suns[1]
  Suns[1].display();
  Suns[1].Fname();
  Suns[1].bounce();
  Suns[1].move();

  // sammenkobler Suns[1] med funktionen overlap i forhold til Suns[0]
  Suns[1].overlap(Suns[0]); 

  // Sammensætning af classes med Flowers[0]
  Flowers[0].display();
  Flowers[0].move();
  Flowers[0].bounce();
  Flowers[0].ColorChange();
  Flowers[0].Fname();

  // Sammenkobler Flowers[0] med funktionen overlaps i forhold til Flowers[1], [2], [3]
  Flowers[0].overlaps(Flowers[1]);    
  Flowers[0].overlaps(Flowers[2]);  
  Flowers[0].overlaps(Flowers[3]);  

  // Sammensætning af classes med Flowers[1]
  Flowers[1].display();
  Flowers[1].move();
  Flowers[1].bounce();
  Flowers[1].ColorChange();
  Flowers[1].Fname();

  // Sammenkobler Flowers[1] med funktionen overlaps i forhold til Flowers[0], [2], [3]
  Flowers[1].overlaps(Flowers[0]);    
  Flowers[1].overlaps(Flowers[2]);    
  Flowers[1].overlaps(Flowers[3]);    

  // Sammensætning af classes med Flowers[2]
  Flowers[2].display();  
  Flowers[2].move();
  Flowers[2].bounce();
  Flowers[2].ColorChange();
  Flowers[2].Fname();

  // Sammenkobler Flowers[2] med funktionen overlaps i forhold til Flowers[0], [1], [3]
  Flowers[2].overlaps(Flowers[0]);    
  Flowers[2].overlaps(Flowers[1]);
  Flowers[2].overlaps(Flowers[3]);

  // Sammensætning af classes med myflowe3
  Flowers[3].display();  
  Flowers[3].move();
  Flowers[3].bounce();
  Flowers[3].ColorChange();
  Flowers[3].Fname();

  // Sammenkobler Flowers[3] med funktionen overlaps i forhold til Flowers[0], [1], [2]
  Flowers[3].overlaps(Flowers[0]);    
  Flowers[3].overlaps(Flowers[1]);    
  Flowers[3].overlaps(Flowers[2]);
}

// Hvad der skal ske når funktionen bliver aktiveret
void mousePressed() {    // Hvad der sker når musen bliver pressed
  // Hvilke classes der bliver sat sammen med .reset()
  Flowers[0].reset();  
  Flowers[1].reset();  
  Flowers[2].reset();  
  Flowers[3].reset();  
  Suns[1].reset();
}
