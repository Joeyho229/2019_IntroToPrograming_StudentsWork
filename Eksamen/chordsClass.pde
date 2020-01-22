class Chord {
  
  // Variables
  float chordsX, chordsY;
  int imageMode;
  PImage chords;
  
  // Class constructor
  Chord(PImage temp_chords, float temp_chordsX, float temp_chordsY, int temp_imageMode) {    // Custom constructor
    
    chords = temp_chords;
    chordsX = temp_chordsX;
    chordsY = temp_chordsY;
    imageMode = temp_imageMode;
  }
  
  // Custom function to be used in the program
  void display() {                                                                          
    imageMode(imageMode);
    image(chords, chordsX, chordsY);
  }
}
