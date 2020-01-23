class Sun {

  // Globale Float variabler for sun
  float r;
  float x; 
  float y;
  float SpeedX = random(-5, 5);
  float SpeedY = random(-5, 5);

  // Gkibale Integer variabler for sun
  int rayColour;
  int sc;
  int n_rays;
  int transparency;

  Sun(float temp_x, float temp_y, float temp_size, int temp_colour, int temp_rayColour, int temp_n_rays, int temp_transparency) {    // Skabelon for sun class
    x = temp_x;
    y = temp_y;
    r = temp_size;
    sc = temp_colour;
    rayColour = temp_rayColour;
    n_rays = temp_n_rays;
    transparency = temp_transparency;
  }

  void display() {    // Hvilke ting display funktionen skal indeholde

    // Lokale variabler
    float CenterX;
    float CenterY;

    stroke(rayColour);    // Farve på strålerne
    strokeWeight(r/14);    // Tykkelsen på linjerne
    strokeCap(ROUND);    // Formen på endelsen af linjen
    for (float i=0; i<PI*2; i+=2*PI/n_rays) {    // Array for strålerne
      CenterX = x + r*cos(i);
      CenterY = y + r*sin(i);

      line(CenterX, CenterY, this.x, this.y);    // Line kommandoen for at tegne linjerne
    }
    fill(sc);    // Farven for sc = sun colour
    ellipse(x, y, this.r, this.r);    // Objektets form
  }

  void MousePosition() {    // Void til at give den mulige sammensatte class en position som følger musens x, y
    x = mouseX;
    y = mouseY;
  }

  boolean overlap(Sun other) {    // Overlap boolean, som skal beskrive hvad der sker når diverse classes overlapper hinanden
    float d = dist(x, y, other.x, other.y);    // Float som beskriver distancen mellem x, y og det andet objekts x, y
    if ( d <= r + other.r) {    // If funktion som siger at hvis distancen d er mindre end radius + radius af andet objekt, så skal der ske noget
      sc = #FF1500;    // SC som er farven for sunColour bliver lavet om til rød når classes overlapper
      return true;
    } else {
      sc = #F5DD00;    // SC som er farven for sunColour bliver lave tom til rød når classes overlapper 
      return false;
    }
  }

  void move() {    // Hvilke ting der skal gælde når move funktionen bliver læst
    x += SpeedX;
    y += SpeedY;
  }

  void bounce() {    // Hvilke ting der skal gælde når bounce funktionen bliver læst
    if ( x >= width - r/2 || x <= 0 + r/2) {    // Hvad der skal ske når x rammer en af siderne
      SpeedX *= -1;
    }
    if ( y >= height - r/2 || y <= 0 + r/2 ) {    // Hvad der skal ske når y rammer en af siderne
      SpeedY *= -1;
    }
  }

  void reset() {    // Hvilke ting der skal gælde når funktionen reset bliver kaldt
    x = random (100, width - 100);    // X koordinat
    y = random (100, height - 100);    // Y koordinat
    SpeedX = random(-5, 5);    // Hastigheden på SpeedX
    SpeedY = random(-5, 5);    // Hastigheden på SpeedY
    rayColour = #F5DD00;    // Farven på rayColour
    sc = #F5DD00;    // Farven på sc
  }
}
