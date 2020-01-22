class Tangent {

  // Variables
  float rectX, rectY, weight, loopLimit, XValue;
  int rectSizeX, rectSizeY, spacing;
  color colour;

  // Class constructor
  Tangent(float temp_rectX, float temp_rectY, int temp_rectSizeX, int temp_rectSizeY, int temp_spacing, float temp_weight, float temp_loopLimit, float temp_XValue, color temp_colour) {    // Custom constructor

    rectX = temp_rectX;
    rectY = temp_rectY;
    rectSizeX = temp_rectSizeX;
    rectSizeY = temp_rectSizeY;
    spacing = temp_spacing;
    weight = temp_weight;
    loopLimit = temp_loopLimit;
    XValue = temp_XValue;
    colour = temp_colour;
  }
  
  // Custom function to be used in the program
  void display() {                    
    strokeWeight(weight);                                              // Weight of the outliner
    fill(colour);                                                      // Colour for the rect
    for (rectX = XValue; rectX < loopLimit; rectX += spacing) {        // For loop for rect
      rect(rectX, rectY, rectSizeX, rectSizeY);                        // Rect sizes and dimension
    }
  }
}
