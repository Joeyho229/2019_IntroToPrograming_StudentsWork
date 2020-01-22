class Hitbox {
  
  // Variables
  float hitBoxX, hitBoxY;
  int hitBoxWidth, hitBoxHeight, hitBoxTransparency, hitBoxStroke;
  
  // Class constructor
  Hitbox(float temp_hitBoxX, float temp_hitBoxY, int temp_hitBoxWidth, int temp_hitBoxHeight, int temp_hitBoxTransparency, int temp_hitBoxStroke) {    // Custom constructor
    
    hitBoxX = temp_hitBoxX;
    hitBoxY = temp_hitBoxY;
    hitBoxWidth = temp_hitBoxWidth;
    hitBoxHeight = temp_hitBoxHeight;
    hitBoxTransparency = temp_hitBoxTransparency;
    hitBoxStroke = temp_hitBoxStroke;
  }
  
  // Custom function to be used in the program
  void display() {                                                                                                                               
    fill(0, 0, 0, hitBoxTransparency);
    strokeWeight(hitBoxStroke);
    rect(hitBoxX, hitBoxY, hitBoxWidth, hitBoxHeight);
  }
}
