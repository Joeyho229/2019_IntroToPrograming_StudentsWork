// Array for classes
Flower[] Flowers = new Flower[10];    // Laver et Flowers array som indeholder Flower-classen
Sun[] Suns = new Sun[10];    // Laver et Suns array som indeholder Sun-classen
square[] Squares = new square[10];


// Array for diverse integer variabler. Der bliver oplyst inde i selve {} hvilke værdier de første variabler skal foretage sig.
int[] FlowerRadius = { 60, 20, 40, 50 };
int[] SunRadius = {100, 75};  
int[] Petals = {8, 5, 10};   
int[] Rays = {9, 7, 8};
int[] Transparency = {255, 255};

float[] squareSize = {300, 300};

// Array for diverse float variabler. Der bliver oplyst inde i selve {} hvilke værdier de første variabler skal foretage sig.
float[] Colour = {random(0, 255), random(0, 255)};
float scale = 0.995;

int num = 20;
Sun[] SunTrail;    // Laver et array SunTrail som indeholder classen Sun, der er dog ikke blevet specificeret hvor mange.

float rotateVal = 0.0;

void setup() {    // Her bliver tingene kun "tegnet" 1 gang.
  size (1200, 900);    // Størrelsen på lærred / vinduet der bliver lavet.

  // Lokale float arrays
  float[] xPosition = {random(100, width - 100), random(200, width - 100), random(100, width - 100), random(100, width - 100)};
  float[] yPosition = {random(100, width - 100), random(200, width - 100), random(100, width - 100), random(100, width - 100)};

  // Lokale float variabler
  int pc = #FF9500;
  int sc = #F5DD00;
  int rc = #F5DD00;

  // Specificere hvilke værdier og variabler diverse Flower i Flowers-array skal have. Hvis ikke oplyst er default 0.
  Flowers[0] = new Flower(FlowerRadius[0], Petals[0], xPosition[0], yPosition[0], pc);
  Flowers[1] = new Flower(FlowerRadius[1], Petals[1], xPosition[1], yPosition[1], pc);

  // Specificere hvilke værdier og variabler diverse Sun i Suns-array skal have. Hvis ikke værdi givet, er den defeault værdi 0.
  Suns[0] = new Sun(xPosition[2], yPosition[2], SunRadius[0], sc, rc, Rays[0], Transparency[0]);
  Suns[1] = new Sun(xPosition[3], yPosition[3], SunRadius[1], sc, rc, Rays[1], Transparency[1]);

  Squares[0] = new square(float(height/2), float(width/2), squareSize[0]);

  SunTrail = new Sun[50];    // Her giver jeg SunTrail arrayet et specifik nummer af Sun-class den skal lave.

  // Den Sun class som SunTrail indeholder, får alle en specific værdi.
  for (int i = 0; i < num; i++) {    // Et for loop hvor "i" får nogle værdier, den er lig 0 men også mindre end variablen num og den addere med sig selv hver gang "i++"
    SunTrail[i] = new Sun(xPosition[2], yPosition[2], SunRadius[0], sc, rc, Rays[0], Transparency[0]);    // Fortæller at hver eneste gang SunTrail[i] bliver fremkaldt, så har de disse oplyste værdier.
  }
}

void draw() {
  background(#FFE9FF);    // Canvas farve

  // Float variabler for distancen for (x, y) mellem classen i Suns-arrayet og classen i Flowers-arrayet.
  float DistanceBetweenClass0 = dist(Suns[0].x, Suns[0].y, Flowers[0].x, Flowers[0].y);
  float DistanceBetweenClass0And1 = dist(Suns[0].x, Suns[0].y, Flowers[1].x, Flowers[1].y);

  // Float variabler for hitbox mellem Suns[0] og diverse Flower classes i Flowers-arrayet. Dette gøres ved udregnelse af deres radius.
  float Suns0AndFlower0 = Suns[0].r + Flowers[0].r;
  float Suns0AndFlower1 = Suns[0].r + Flowers[1].r;

  // If funktion for hvad der skal ske når Suns[0] overlapper med diverse classes i Flowers-arrayet
  if ( DistanceBetweenClass0 <= Suns0AndFlower0) {    // Hvis distancen mellem Suns[0].x og y + Flowers[0].x og y, er mindre eller lig med Suns[0] + Flowers[0] radius, så skal der ske noget
    background(Colour[0]);
  } else if ( DistanceBetweenClass0And1 <= Suns0AndFlower1 ) {    // Hvis distancen mellem Suns[0].x og y + Flowers[1].x og y, er mindre eller lig med Suns[0] + Flowers[1] radius, så skal der ske noget
    background(Colour[1]);
  }

  for (int i = num - 1; i > 0; i--) {    // Et for loop som siger at i = variablen num - 1, mens i er større end 0 og at i hver gang bliver 1 mindre "i--"
    SunTrail[i].x = SunTrail[i - 1].x;    // Denne linje fortæller at hver eneste SunTrail[i].x position, er lig med SunTrail[i - 1].x position. 
    SunTrail[i].y = SunTrail[i - 1].y;    // Denne linje fortæller at hver eneste SunTrail[i].y position, er lig med SunTrail[i - 1].y position.
    SunTrail[i].r = SunTrail[i - 1].r*pow(scale, i);
  }    // Eksempelvis at når SunTrail[42] bliver lavet, så har den en (x, y). Dens (x, y)-værdi bliver 1 mindre: SunTrail[42] = (92, 100) så vil SunTrail[41] = (91, 99) osv.

  SunTrail[0].x = mouseX;    // Giver den første class i SunTrail-arrayet dens x-værdi
  SunTrail[0].y = mouseY;    // Giver den første class i SunTrail-arrayet dens y-værdi

  for (int i = 0; i < num; i++) {    // Et for loop hvor "i" får nogle værdier, den er lig 0 men også mindre end variablen num og den addere med sig selv hver gang "i++"
    SunTrail[i].display();    // Hver eneste class i SunTrail-arrayet bliver koblet sammen med funktionen display.
  }


  // Sammensætning af diverse classes, dette giver dem de forskellige funktioner som de er koblet sammen med.
  Suns[0].MousePosition();
  Suns[0].display();
  Suns[0].overlap(Suns[1]);

  Suns[1].display();
  Suns[1].bounce();
  Suns[1].move();
  Suns[1].overlap(Suns[0]);

  Flowers[0].display();
  Flowers[0].move();
  Flowers[0].bounce();
  Flowers[0].ColorChange();
  Flowers[0].overlaps(Flowers[1]);

  Flowers[1].display();
  Flowers[1].move();
  Flowers[1].bounce();
  Flowers[1].ColorChange();
  Flowers[1].overlaps(Flowers[0]);

  Squares[0].display();
  Squares[0].move();
  Squares[0].bounce();
}

void mouseClicked() {    // Funktion for hvad der skal ske når man klikker på musen
  Flowers[0].reset();  // reset funktionen bliver aktiv
  Flowers[1].reset();  // reset funktionen bliver aktiv
  Suns[1].reset();  // reset funktionen bliver aktiv
}
