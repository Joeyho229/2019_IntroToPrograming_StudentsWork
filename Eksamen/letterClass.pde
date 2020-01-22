class Letter {

  // Variables
  float noteX, noteY;
  int noteSize;
  String letterNote;
  color letterColour;

  // Class constructor
  Letter(String temp_letterNote, float temp_noteX, float temp_noteY, int temp_noteSize, color temp_letterColour) {    // Custom constructor

    letterNote = temp_letterNote;
    noteX = temp_noteX;
    noteY = temp_noteY;
    noteSize = temp_noteSize;
    letterColour = temp_letterColour;
  }

  // Custom function to be used in the program
  void display() {                                                                                            
    textSize(noteSize);
    fill(letterColour);
    text(letterNote, noteX, noteY);
  }
}
