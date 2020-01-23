PImage galaxy;

int white = 255;
int black = 0;
int maxHz = 60;
int ballSize = 50;
int score = 0;
int rainbow = 255;

float ballX, ballY, playerX, rectSurface, rectLeftX, rectRightX, endTextX, resetTextY;
float rectWSize = 200;
float rectHSize = 30;
float ballSpeedY;
float ballSpeedX;
float playerY = 1450;

void setup() {    // Ting som der bliver sat som standard
  size(1500, 1500);    // Størrelsen på canvas
  frameRate(maxHz);    // Hvor mange billeder i sekundet
  galaxy = loadImage("background.jpg");

  ballX = width/2;    // Boldens X variabel
  ballY = height/2;    // Boldens Y variabel

  ballSpeedX = random(-5, 5);    // Boldens X hastighed
  ballSpeedY = random(-5, 5);    // Boldens Y hastighed
}

void reset() {    // Hvilke ting der skal ske når der bliver resettet
  ballX = width/2;    // Position X af bolden bliver reset
  ballY = height/2;    // Position Y af bolden bliver reset
  ballSpeedX = random(-1, 10);    // Hastigheden på boldens X variabel
  ballSpeedY = random(-1, 10);    // Hastigheden på boldens Y variabel
  score = 0;
}

void draw() {    // Alt det herunder bliver konstant looped
  image(galaxy, 0,0);    // Backgrunds billede, med X,Y koordinat udregnet fra venstre oppe hjørne

  // Bolden
  fill(white);  // Farven på bolden
  ellipseMode(CENTER);    // X,Y Bliver sat ud fra centrum
  ellipse(ballX, ballY, ballSize, ballSize);    // Boldens X,Y og størrelse

  // Boldens X indstillinger
  ballX = ballX + ballSpeedX;    // X-akse + variabel gør at bolden bevæger sig horisontalt
  if (ballX > width || ballX <0) {    // Afgrænsninger for hvad der sker når bolden rammer siderne på X-aksen
    ballSpeedX = ballSpeedX * -1.05;    // Bolden bliver forøget med 5% hastighed hvergang den rammer en af de horisiontale sider
  }

  // Boldens Y indstillinger
  ballY = ballY + ballSpeedY;    // Y-aksen + variabel gør at bolden bevæger sig vertikalt
  if (ballY < 0) {    // Afgrænsninger for hvad der sker når bolden rammer øverste Y-akse
    ballSpeedY *= -1;    // Bolden forbliver samme hastighed når den rammer Y-aksen
  } else if (ballY > height) { // Hver der sker når boldens Y koordinat bliver større end height
    ballSpeedX = 0;    // Boldens X hastighed bliver = 0
    ballSpeedY = 0;    // Boldens Y hastighed bliver = 0
  }

  // Player indstillinger
  playerX = mouseX;    // Spillerens X koordinat skal følge musens x-koordinat

  // Spillerens rektangel
  fill(white);    // Farverne på rektanglet
  rectMode(CENTER);    // Rektanglets X,Y skal være ud fra centrum
  rect(playerX, playerY, rectWSize, rectHSize);    // Rektanglets X,Y og størrelse

  rectSurface = playerY - rectHSize;    // Rektangelts overflade
  rectRightX = playerX + rectWSize/2;    // Rektanglets højre side
  rectLeftX = playerX - rectWSize/2;    // Rektanglets venstre side

  if (ballY > rectSurface && ballX > rectLeftX && ballX < rectRightX) {    // Afgrænsning til hvor bolden skal bounce væk når den rammer spilleren
    ballSpeedY *=  -1.10;    // Hastigheden forøges med 10% når den rammer spilleren
    score++; // scoren bliver + 1 hver gang den rammer spilleren
  }

  endTextX = width/2;    // Slut skærmens tekst X koordinat
  resetTextY = height/2;    // Slut skærmens tekst Y koordinat

  // Point system
  textAlign(CENTER);    // Tekstens position i forhold til given X,Y variabel
  textSize(30);    // Tekstens størrelse
  fill(white);    // Tekstens farve
  text(score, width/27, height/30);    // Selve point variablen der skal vises og dens bredde og højde
  text("Points", width/12, height/30);    // Teksten der skal vises og dens bredde og højde

  // Taber skærm
  if (ballY > height) {    // Hvad der sker hvis boldens Y-akse bliver større end height
    textAlign(RIGHT);    // Tekst position i forhold til given X,Y variabel
    textSize(45);    // Tekst størrelse
    fill(white);    // Tekst farve
    text("You...", endTextX, height/4);    // Selve teksten der vises og koordinaterne på det, i dette tilfælde er det til venstre side
    textAlign(LEFT);    // Tekst position i forhold til given X,Y variabel
    text("LOSE!", endTextX, height/3.4);    // Selve teksten der vises og koordinaterne på det, i dette tilfælde er det til højre side
    textAlign(CENTER);    // Tekst position i forhold til given X,Y variabel
    fill(random(rainbow), random(rainbow), random(rainbow));
    text("Press mouse to try again", endTextX, resetTextY);    // Selve teksten der vises og koordinaterne på det, i dette tilfælde er det i midten
  } 

  // Vinder skærm
  else if (score == 15) {    // Hvad der sker når score variablen er = 15
    textAlign(CENTER);    // Tekst position i forhold til X,Y
    textSize(60);    // Tekst størrelse
    text("YOU!", endTextX, height/4);    // Selve teksten der vises på position X,Y
    text("WIN", endTextX, height/3.4);    // Selve teksten der vises på position X,Y
    fill(random(rainbow), random(rainbow), random(rainbow));    // Tekstens farve
    text("Press mouse to try again", endTextX, resetTextY);    // Selve teksten der vises på position X,Y
    ballSpeedX = 0;    // Boldens X hastighed bliver = 0
    ballSpeedY = 0;    // Boldens Y hastighed bliver = 0
    ballX = width/2;    // Boldens X værdi bliver sat til midten
    ballY = height/2;    // Boldens Y værdi bliver sat til midten
  }
}

void mousePressed() {    // Hvad der skal ske når man klikker på musen
  reset();    // reset kommandoen bliver kaldt
}
