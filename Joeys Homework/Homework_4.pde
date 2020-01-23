// Global integers
int rectXsize = 40;
int rectYsize = 40;
int spacing = 40;

void setup() {
  int black = 0;    // Local integer
  size(1500, 1400);    // The size of the canvas
  background(black);    // Defining background for the canvas

  for (int rectX = 0; rectX < width; rectX += rectXsize) {    
    // For loop, with the local integer rectX = 0, when condition met rectX < width it exits, otherwise execute command inside loop and increment rectX += rectXsize

    for (int rectY = 0; rectY < height; rectY += rectYsize) {
      // For loop inside another for loop, local integer rectY = 0, when condition met rectY < height it exits, otherwise execute command inside loop and increment rectY += rectYsize

      fill(random(255));    // Colour of the rectangels
      rect(rectX, rectY, rectXsize, rectYsize);    // X, Y and size for the drawn rect using the local integers
    }
  }
}

void draw() {
  int light = 2;    // Local integer
  int white = 255;    // Local integer
  strokeWeight(light);    // The hardness/softness of each line
  stroke(white);    // The colour of each line

  int lineX = 40;    // Integer for the variabel lineX
  while (lineX < width) {    // This is the condition for the while loop
    line(lineX, 0, lineX, height);    // This is the code that is to be executed while the condition is met
    lineX += spacing;    // This increments the loop variable, until the condition is not met anymore and the loop stops
  }

  for (int lineY = 40; lineY < height; lineY += spacing) {    // For loop is just the same as while, difference is that it combines it all into one code
    line(0, lineY, width, lineY);    // This is the code that is to be executed while the codition is met
  }
}

void mouseClicked() {    // What is to happen when the mouse is clicked
  fill(random(200, 255), 0, 0);    // The colour is to be red within the boundary 200 - 255
  
  int X = (mouseX/rectXsize)*rectXsize;    // Defining the local integer X.
  int Y = (mouseY/rectYsize)*rectYsize;    // Defining the local integer Y. 

  rect(X, Y, rectXsize, rectYsize);    // Rect X,Y and size, with use of local integers
}
