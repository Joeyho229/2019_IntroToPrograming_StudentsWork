class Flower {

  // Float variabler
  float r;
  float x; 
  float y;
  float SpeedX = random(-5, 10);
  float SpeedY = random(-5, 10);
  Flower lastCollision;

  // Integer variabler
  int n_petals;
  int petalColor;

  Flower(float temp_r, int temp_n_petals, float temp_x, float temp_y, int temp_petalColor) {    // Template for flower klassen
    r = temp_r;
    n_petals = temp_n_petals;
    x = temp_x;
    y = temp_y;
    petalColor = temp_petalColor;
  }

  void display () {    // Fortæller hvad der skal vises når display funktionen bliver kaldt

    // Lokale float variabler
    float CenterX;
    float CenterY;  

    stroke(0);
    strokeWeight(1);
    fill(petalColor);    // Farven for bladende
    for (float i=0; i<PI * 2; i += 2 * PI / n_petals) {    // Array for bladende
      CenterX = x + r*cos(i);
      CenterY = y + r*sin(i);

      ellipse(CenterX, CenterY, r, r);
    }

    fill(200, 255, 50);
    ellipse(x, y, r * 1.2, r * 1.2);
  }

  // Der laves en move class.
  void move() {    // Class for at give bevægelse til x og y koordinatet
    x += SpeedX;
    y += SpeedY;
  }

  float bounce() {    // Bounce funktion som afgrænser hvad der skal ske når x og y koordinaterne når siderne
    if (x >= width - 1.5 * r || x <= 0 + 1.5 * r) {    // If funktion for hvad der sker når X-koordinaterne rammer siderne
      SpeedX *= -1;    // Hastigheden på SpeedX når funktionen er opfyldt
    }
    if (y >= height - 1.5 * r || y <= 0 + 1.5 * r) {    // If funktion for hvad der sker når Y-koordinaterne rammer siderne
      SpeedY *= -1;    // Hastigheden på SpeedY når funktionen er opfyldt
    }
    return SpeedX;
  }

  void ColorChange() {    // Class for at blomsterne skifter farver når de rammer en af siderne
    if (x >= width - 1.5 * r || x <= 0 + 1.5 * r) {
      petalColor = int(random(#000000, #FFFFFF));    // Hver gang den rammer siderne, ændres farverne
    }
    if (y >= height - 1.5 * r || y <= 0 + 1.5 * r) {
      petalColor = int(random(#000000, #FFFFFF));    // Hver gang den rammer siderne, ændres farverne
    }
  }

  void Fname() {    // Void til at give navne
    textSize(24);    // Tekst størrelsen som skal vises
    fill(#000000);    // Farven som teksten skal vises i
    text("Flower", this.x - this.r, this.y - this.r*2);    // Teksten som der skal vises
  }

  boolean overlaps(Flower other) {    // Overlap boolean, som skal beskrive hvad der sker når diverse classes overlapper hinanden
    float d = dist(x, y, other.x, other.y);    // Giver distance sin egen varaibel
    if ( d <= this.r + this.r/2 + other.r + other.r/2 ) {    // Overlapning bliver beregnet ud fra centrum, hvis den tegnede radius + den anden tegnede radius distance fra hinanden er mindre end d, så skal de skubbes væk.
      petalColor = int(random(#000000, #FFFFFF));    // Farven skiftes på bladende når en blomst kollidere med en anden blomst
      SpeedX *= -1;    // Hastigheden på blomsten bliver omvendt og giver illusionen at objektet kollidere med hinanden
      SpeedY *= -1;    // Hastigheden på blomsten bliver omvendt og giver illusionen at objektet kollidere med hinanden
    }
    return true;
  }

  void reset() {    // Funktionen beskriver hvad der skal ske når reset bliver kaldt
    x = random(100, width - 100);    // Blomsternes X-værdi bliver til random imellem 100 til 1400
    y = random(100, width - 100);    // BLomsternes Y-værdi bliver til random imellem 100 til 1400
    SpeedX = random(-5, 10);    // Hastigheden på SpeedX bliver random imellem -5 til 10
    SpeedY = random(-5, 10);    // Hastigheden på SpeedY bliver random imellem -5 til 10
    petalColor = #FF9500;    // Farven på petalColor
  }
}
