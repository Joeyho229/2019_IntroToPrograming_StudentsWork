// Credit to Lukas Harkamp for helping me understand the dot. ^_^

Flower myFlower0;    // Den første flower class
Flower myFlower1;    // Den anden flower class
Flower myFlower2;    // Den tredje flower class
Flower myFlower3;    // Den fjerde flower class

Sun mySun0;    // Den første sun class
Sun mySun1;    // Den anden sun class

void setup() {
  size(1500, 1500);    // Canvas size

  // Integer variabler
  int r0 = 60;
  int r1 = 20;
  int r2 = 40;
  int r3 = 50;
  int petals = 8;
  int pc = #FF9500;

  int sc = #F5DD00;
  int rc = #F5DD00;
  int rays = 9;
  int s1 = 100;
  int s2 = 75;

  // Float variabler
  float x = random(100, 1400);
  float y = random(100, 1400);

  // Fremkaldning af myFlower1- 2 og 3. Hvorved der gives nye variabler
  myFlower0 = new Flower(r0, petals, x, y, pc);
  myFlower1 = new Flower(r1, petals, x +random(-100, 100), y, pc);
  myFlower2 = new Flower(r2, petals, x + 50, y, pc);
  myFlower3 = new Flower(r3, petals, x - 100, y, pc);

  // Frmekaldning af mySun
  mySun0 = new Sun(width/2, height/2, s1, sc, rc, rays);
  mySun1 = new Sun(width/2, height/2, s2, sc, rc, rays);
}

void draw() {
  background(#FFE9FF);    // Canvas farve
  // Sammensætning af mySun0
  mySun0.display();
  mySun0.Fname();
  mySun0.position();

  // Overlap funktioner for mySun0
  mySun0.overlap(mySun1);

  // Float variabler for overlappelse af andre objekter
  float d0 = dist(mySun0.x, mySun0.y, myFlower0.x, myFlower0.y);
  float d1 = dist(mySun0.x, mySun0.y, myFlower1.x, myFlower1.y);
  float d2 = dist(mySun0.x, mySun0.y, myFlower2.x, myFlower2.y);
  float d3 = dist(mySun0.x, mySun0.y, myFlower3.x, myFlower3.y);

  // Float variabler for hitbox mellem mySun0 og myFlower0, 1, 2, 3
  float SF0 = mySun0.r + myFlower0.r;
  float SF1 = mySun0.r + myFlower1.r;
  float SF2 = mySun0.r + myFlower2.r;
  float SF3 = mySun0.r + myFlower3.r;

  // If funktion for hvad der skal ske når mySun0 overlapper med diverse myFlower0, 1, 2, 3
  if ( d0 <= SF0) {    // If funktion for hvad der skal ske når mySun0 overlapper med diverse myFlower0
    background(#0039FF);    // Baggrunden bliver lavet til blå
  } else if (d1 <= SF1) {    // If else funktion for hvad der sker når mySun0 overlapper med myFlower1
    background(#00FF0A);    // Baggrunden bliver lavet til grøn
  } else if (d2 <= SF2) {    // If else funktion for hvad der sker når mySun0 overlapper med myFlower2
    background(#FA00FF);    // Baggrunden bliver lavet til lilla
  } else if (d3 <= SF3) {    // If else funktion for hvad der sker når mySun0 overlapper med myFlower3
    background(#9D8787);    // Baggrunden bliver lavet til rød
  }

  // Sammensætning af mySun1
  mySun1.display();
  mySun1.Fname();
  mySun1.bounce();
  mySun1.move();

  mySun1.overlap(mySun0);    // sammenkobler mySun1 med funktionen overlap i forhold til mySun0

  // Sammensætning af classes med myFlower0
  myFlower0.display();
  myFlower0.move();
  myFlower0.bounce();
  myFlower0.ColorChange();
  myFlower0.Fname();

  myFlower0.overlaps(myFlower1);    // Sammenkobler myFlower0 med funktionen overlaps i forhold til myFlower1
  myFlower0.overlaps(myFlower2);    // Sammenkobler myFlower0 med funktionen overlaps i forhold til myFlower2
  myFlower0.overlaps(myFlower3);    // Sammenkobler myFlower0 med funktionen overlaps i forhold til myFlower3

  // Sammensætning af classes med myFlower1
  myFlower1.display();
  myFlower1.move();
  myFlower1.bounce();
  myFlower1.ColorChange();
  myFlower1.Fname();

  myFlower1.overlaps(myFlower0);    // Sammenkobler myFlower1 med funktionen overlaps i forhold til myFlower0
  myFlower1.overlaps(myFlower2);    // Sammenkobler myFlower1 med funktionen overlaps i forhold til myFlower2
  myFlower1.overlaps(myFlower3);    // Sammenkobler myFlower1 med funktionen overlaps i forhold til myFlower3

  // Sammensætning af classes med myFlower2
  myFlower2.display();  
  myFlower2.move();
  myFlower2.bounce();
  myFlower2.ColorChange();
  myFlower2.Fname();

  myFlower2.overlaps(myFlower0);    // Sammenkobler myFlower2 med funktionen overlaps i forhold til myFlower0
  myFlower2.overlaps(myFlower1);    // Sammenkobler myFlower2 med funktionen overlaps i forhold til myFlower1
  myFlower2.overlaps(myFlower3);    // Sammenkobler myFlower2 med funktionen overlaps i forhold til myFlower3

  // Sammensætning af classes med myflowe3
  myFlower3.display();  
  myFlower3.move();
  myFlower3.bounce();
  myFlower3.ColorChange();
  myFlower3.Fname();

  myFlower3.overlaps(myFlower0);    // Sammenkobler myFlower3 med funktionen overlaps i forhold til myFlower0
  myFlower3.overlaps(myFlower1);    // Sammenkobler myFlower3 med funktionen overlaps i forhold til myFlower1
  myFlower3.overlaps(myFlower2);    // Sammenkobler myFlower3 med funktionen overlaps i forhold til myFlower2
}

// Hvad der skal ske når funktionen bliver aktiveret
void mousePressed() {    // Hvad der sker når musen bliver pressed
  myFlower0.reset();    // myFlower0 bliver sat sammen med funktionen reset
  myFlower1.reset();    // myFlower1 bliver sat sammen med funktionen reset
  myFlower2.reset();    // myFlower2 bliver sat sammen med funktionen reset
  myFlower3.reset();    // myFlower3 bliver sat sammen med funktionen reset
  mySun1.reset();    // mySun1 bliver sat sammen med funktionen reset
}
