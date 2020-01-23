int a = 50;
int b = 100;
int white = 255;
int d = 10;
int e = 2;
int f = 0;

float textY = 34;
float text1X = 3.4;
float text2X = 4.2;
float size = 40;

float UFO;
float speed = 10;

void setup() {
  size(1500,1500); // Canvas size
  background(white); // Background Colour
  frameRate(a+d); // Refresh rate of screen 
  UFO = f;
}

void draw() {
  background(white);
  strokeWeight(d/e);
  fill(f);
  rect(f,f,width,a);
  ellipseMode(CENTER);
  fill(f);
  ellipse(UFO,height/e,a,a);
  fill(#AA9D3A);
  ellipse(UFO,height/e,b,d*e);
  
  UFO = UFO + speed; /*
  if(UFO > width) {
    speed = random(-b);
  }
  if(UFO < f) {
    speed = random(b);
  }*/
  
  if(UFO > width) { // Boolean for the UFO "speed" value
    speed = random(-d);
  } else if(UFO < f) {
    speed = random(d);
  }

  if (mouseY > a) { // Text above line, to move the mouse above line
    fill(255);
    text("Please move the mouse inside here",width/text1X,height/textY);
  } else {
    text("Move the mouse away to stop the madness!",width/text2X,height/textY);
    textSize(size);
  }
  
  if (mouseY < a) { // If mouseY coordination is less than 50, action happens
    fill(random(white),random(white),random(white));
    ellipse(random(width),random(width),a,a);
  }
  
  if (keyPressed == true)   { // Key pressed action
    background(f);
  }
  
  if (mousePressed == true) { // Mouse pressed action
    background(white);
  }
}
