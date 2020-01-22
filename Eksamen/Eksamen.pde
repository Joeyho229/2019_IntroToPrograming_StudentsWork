// Programmering eksamen 

// Classes
Tangent[] Tangents = new Tangent[20];                                                                                                            // Tangent class array
Hitbox[] Hitboxes = new Hitbox[20];                                                                                                              // Hitbox class array
Letter[] Letters = new Letter[30];                                                                                                               // Letter class array
Chord[] Chords = new Chord[20];                                                                                                                  // Chord class array

import processing.sound.*;                                                                                                                       // Loading the imported sound library
SoundFile noteA, noteB, noteC, noteD, noteE, noteF, noteG;                                                                                       // Declaring datatypes for variables without giving them a value, to be determined later on
SoundFile halfNoteA, halfNoteC, halfNoteD, halfNoteF, halfNoteG;                                                                            

SoundFile[] note = {noteC, noteD, noteE, noteF, noteG, noteA, noteB};                                                                            // Making a SoundFile array with the variable note and giving the different slots a specific value to be loaded later
SoundFile[] halfNote = {halfNoteC, halfNoteD, halfNoteF, halfNoteG, halfNoteA};                                                            

// Global variables for different datatypes
PImage curtain, chordC, chordCSharp, chordD, chordDSharp, chordE, chordF, chordFSharp, chordG, chordGSharp, chordA, chordASharp, chordB;         // Declaring datatypes for variables

int score = 0;                                                                                                                                   // Declaring the score variable to be of datatype integer and giving it a value
String scoreText = "Amount of notes played:";                                                                                              
int scoreX = 25;                                                                                                                           
int scoreY = 50;                                                                                                                                
int scoreSize = 32;                                                                                                                         

// Variables for white tangent hitbox
int[] tangentHitBoxX = {0, 275, 550, 825, 1100, 1375, 1650};                                                                                     // Making an integer array with the variable tangentHitBoxX and giving the different slots a specific value to be loaded later
int[] tangentHitBoxY = {360, 360, 360, 360, 360, 360, 360};                                                                                
int[] tangentHitBoxWidth = {275, 275, 275, 275, 275, 275, 275};                                                                           
int[] tangentHitBoxHeight = {1080, 1080, 1080, 1080, 1080, 1080, 1080};                                                           
int[] tangentTransparency = {0, 0, 0, 0, 0, 0, 0};                                                                                      
int[] tangentHitBoxStroke = {0, 0, 0, 0, 0, 0, 0};                                                                                        

// Variables for letters on the white tangents
String[] letterNote = {"C", "D", "E", "F", "G", "A", "B"};                                                                                       // Making a String array with the variable letterNote and giving the different slots a specific value to be loaded later
float[] letterNoteX = {120, 395, 670, 945, 1220, 1495, 1770};                                                                           
float[] letterNoteY = {940, 940, 940, 940, 940, 940, 940};                                                                             
int[] letterNoteSize = {60, 60, 60, 60, 60, 60, 60};                                                                                        
color[] letterNoteColour = {#000000, #000000, #000000, #000000, #000000, #000000, #000000};                                                

String[] keyGuide = {"Q", "W", "E", "R", "T", "Y", "U", "2", "3", "5", "6", "7"};                                                                // Making a String array with the variable letterNote and giving the different slots a specific value to be loaded later
int[] keyGuideOffSetX = {10};                                                                                                                    
int[] keyGuideX = {450};                                                                                                                 
int[] keyGuideSize = {25};                                                                                                             
color[] keyGuideColour = {#BFBFBF};                                                                                                             


// Variables for half note hitbox
float[] halfNoteHitBoxX = {210.98, 485.98, 1035.98, 1310.98, 1585.98};                                                                           // Making a float array with the variable halfNoteHitBoxX and giving the different slots a specific value to be loaded later
int[] halfNoteHitBoxY = {360, 360, 360, 360, 360};                                                                                        
int[] halfNoteHitBoxWidth = {125, 125, 125, 125, 125};                                                                                      
int[] halfNoteHitBoxHeight = {400, 400, 400, 400, 400};                                                                                         
int[] halfNoteTransparency = {0, 0, 0, 0, 0};                                                                                             
int[] halfNoteHitBoxStroke = {0, 0, 0, 0, 0};                                                                                                   

// Variables for letters on half notes 
String[] letterHalfNote = {"C#", "D#", "F#", "G#", "A#"};                                                                                                                                                     // A string array with given values
float[] letterHalfNoteX = {tangentHitBoxWidth[0] - 20, tangentHitBoxWidth[1] * 2 - 20, tangentHitBoxWidth[2] * 4 - 20, tangentHitBoxWidth[3] * 5 - 20, tangentHitBoxWidth[4] * 6 - 20};                    
float[] letterHalfNoteY = {halfNoteHitBoxY[0] + 240, halfNoteHitBoxY[1] + 240, halfNoteHitBoxY[2] + 240, halfNoteHitBoxY[3] + 240, halfNoteHitBoxY[4] + 240};                                             
int[] letterHalfNoteSize = {42, 42, 42, 42, 42};                                                                                                                                                      
color[] letterHalfNoteColour = {#FFFFFF, #FFFFFF, #FFFFFF, #FFFFFF, #FFFFFF};                                                                                                                      


// Variables for visual feedback notes
float[] chordX = {137.5, 412.5, 687.5, 962.5, 1237.5, 1512.5, 1787.5, tangentHitBoxWidth[0], tangentHitBoxWidth[1] * 2, tangentHitBoxWidth[2] * 4, tangentHitBoxWidth[3] * 5, tangentHitBoxWidth[4] * 6};    
float[] chordY = {180, 180, 180, 180, 180, 180, 180, 180, 180, 180, 180, 180};                                                                                                                    
int[] imageMode = {CENTER};                                                                                                                                                                      


void setup() {                                                                                                                                   // A void function to return no value. This function only draws the following code 1 time at the start of the program
  size(1920, 1080);                                                                                                                              // Defining the size of the canvas, defined by pixels, thus only loading integers
  curtain = loadImage("curtains.jpg");                                                                                                           // Giving the earlier mentioned PImage variable a specific file to load in the data folder

  chordC = loadImage("chordC.png");                                                                                                  
  chordD = loadImage("chordD.png");                                                                                                
  chordE = loadImage("chordE.png");                                                                                                    
  chordF = loadImage("chordF.png");                                                                                                     
  chordG = loadImage("chordG.png");                                                                                                         
  chordA = loadImage("chordA.png");                                                                                               
  chordB = loadImage("chordB.png");                                                                                                          

  chordCSharp = loadImage("chordCSharp.png");                                                                                            
  chordDSharp = loadImage("chordDSharp.png");                                                                                                   
  chordFSharp = loadImage("chordFSharp.png");                                                                                                
  chordGSharp = loadImage("chordGSharp.png");                                                                                             
  chordASharp = loadImage("chordASharp.png");                                                                                                 

  // Local arrays with different datatypes
  float[] rectX = {0, (width/7)/1.3, (width/7)/1.3};                                                                                             // A local float array with given values
  float[] rectY = {height/3, height/3, height/3};                                                                                              
  int[] rectSizeX = {275, 125, 125};                                                                                                          
  int[] rectSizeY = {height, 400, 400};                                                                                                      
  int[] spacing = {275, 275, 275};                                                                                                              
  float[] weight = {1, 0, 0};                                                                                                                    
  float[] loopLimit = {1920, 500, 1700};                                                                                                        
  float[] XValue = {0, (width/7)/1.3, (width/7)/1.3 + 275 * 3};                                                                                 
  color[] colour = {#FFFFFF, #000000, #000000};                                                                                                  

  // Assigning sound files to each number in the note array
  note[0] = new SoundFile(this, "noteC.mp3");                                                                                                    // Assigning the earlier mentioned SoundFile note array with specific .mp3 files in the datafolder 
  note[1] = new SoundFile(this, "noteD.mp3");
  note[2] = new SoundFile(this, "noteE.mp3");
  note[3] = new SoundFile(this, "noteF.mp3");
  note[4] = new SoundFile(this, "noteG.mp3");
  note[5] = new SoundFile(this, "noteA.mp3");
  note[6] = new SoundFile(this, "noteB.mp3");


  halfNote[0] = new SoundFile(this, "halfNoteC.mp3");
  halfNote[1] = new SoundFile(this, "halfNoteD.mp3");
  halfNote[2] = new SoundFile(this, "halfNoteF.mp3");
  halfNote[3] = new SoundFile(this, "halfNoteG.mp3");
  halfNote[4] = new SoundFile(this, "halfNoteA.mp3");


  // Defining variables to the class constructor  
  for (int i = 0; i < 3; i++) {                                                                                                                  // Loop for giving tangent class variables.
    Tangents[i] = new Tangent(rectX[i], rectY[i], rectSizeX[i], rectSizeY[i], spacing[i], weight[i], loopLimit[i], XValue[i], colour[i]);        // A for loop has a condition, it then executes the code if its true. If false the loop is exited
  }                                                                                                                                              // A while loop has a initialization loop variable, it then has a condition, if condition true -
                                                                                                                                                 // - it will execute code and then a incrementation of the loop variable will happen. If false it will exit
                                                                                                                                                 
  for (int i = 0; i < 7; i++) {                                                                                                                  // Loop for Hitboxes class giving it variables.
    Hitboxes[i] = new Hitbox(tangentHitBoxX[i], tangentHitBoxY[i], tangentHitBoxWidth[i], tangentHitBoxHeight[i], tangentTransparency[i], tangentHitBoxStroke[i]);
  }

  for (int i = 0; i < 5; i++) {                                                                                                                  // Loop for Hitboxes class for half notes giving it variables.
    Hitboxes[i+7] = new Hitbox(halfNoteHitBoxX[i], halfNoteHitBoxY[i], halfNoteHitBoxWidth[i], halfNoteHitBoxHeight[i], halfNoteTransparency[i], halfNoteHitBoxStroke[i]);
  }

  for (int i = 0; i < 7; i++) {                                                                                                                  // Loop for Letters class for white tangents. 
    Letters[i] = new Letter(letterNote[i], letterNoteX[i], letterNoteY[i], letterNoteSize[i], letterNoteColour[i]);
  }

  for (int i = 0; i < 5; i++) {                                                                                                                  // Loop for the correct music notes to be displayed on the black half notes
    Letters[i+7] = new Letter(letterHalfNote[i], letterHalfNoteX[i], letterHalfNoteY[i], letterHalfNoteSize[i], letterHalfNoteColour[i]);
  }

  for (int i = 0; i < 7; i ++) {                                                                                                                 // Loop for the key guidance on white tangents
    Letters[i+12] = new Letter (keyGuide[i], letterNoteX[i], keyGuideX[0], keyGuideSize[0], keyGuideColour[0]);
  }

  for (int i = 0; i < 5; i++) {                                                                                                                  // Loop for the key guidance on the black half notes
    Letters[i+19] = new Letter (keyGuide[i+7], letterHalfNoteX[i] + keyGuideOffSetX[0], keyGuideX[0], keyGuideSize[0], keyGuideColour[0]);
  }

  Chords[0] = new Chord(chordC, chordX[0], chordY[0], imageMode[0]);                                                                             // Giving different values to the class "chord" stored in the class array
  Chords[1] = new Chord(chordD, chordX[1], chordY[1], imageMode[0]);
  Chords[2] = new Chord(chordE, chordX[2], chordY[2], imageMode[0]);
  Chords[3] = new Chord(chordF, chordX[3], chordY[3], imageMode[0]);
  Chords[4] = new Chord(chordG, chordX[4], chordY[4], imageMode[0]);
  Chords[5] = new Chord(chordA, chordX[5], chordY[5], imageMode[0]);
  Chords[6] = new Chord(chordB, chordX[6], chordY[6], imageMode[0]);

  Chords[7] = new Chord(chordCSharp, chordX[7], chordY[7], imageMode[0]);
  Chords[8] = new Chord(chordDSharp, chordX[8], chordY[8], imageMode[0]);
  Chords[9] = new Chord(chordFSharp, chordX[9], chordY[9], imageMode[0]);
  Chords[10] = new Chord(chordGSharp, chordX[10], chordY[10], imageMode[0]);
  Chords[11] = new Chord(chordASharp, chordX[11], chordY[11], imageMode[0]);
}


void draw() {                                                                                                                                    // Another function to return no value. This one keeps drawing the included code at a defeault refreshrate of 60
  background(curtain);                                                                                                                           // The background for the canvas, in this situation it is of the image variable curtain loaded earlier in void draw

  textSize(scoreSize);                                                                                                                           // Declaring the size of text to be of the integer varaible scoreSize
  text(scoreText + score, scoreX, scoreY);                                                                                                       // Declaring the text() function to use different variables as its parameters. String, integer, integer.

  // Combining classes with custom functions
  for (int i = 0; i < 3; i++) {                                                                                                                  // Loop for Tangent class combined with custom display function. 
    Tangents[i].display();                                                                                                                       // A for loop has a condition, it then executes the code if its true. If false the loop is exited
  }                                                                                                                                              // A while loop has a initialization loop variable, it then has a condition, if condition true -
                                                                                                                                                 // - it will execute code and then a incrementation of the loop variable will happen. If false it will exit
  for (int i = 0; i < 12; i++) {                                                                                                             
    Hitboxes[i].display();
  }

  for (int i = 0; i < 7; i++) {                                                                                                             
    Letters[i].display();
  }

  for (int i = 0; i < 5; i++) {
    Letters[i+7].display();
  }

  for (int i = 0; i < 7; i++) {
    Letters[i+12].display();
  }

  for (int i = 0; i < 5; i++) {
    Letters[i+19].display();
  }
}
void keyReleased() {                                                                                                                             // Another function with no return value. This one executes when a key is released.
  score ++;                                                                                                                                      // Everytime a key is released, the integer "score" gets incremented by 1
  println(score);
  if (key == 'q') {                                                                                                                              // If condition for when a specific key is pressed and what is to happen if that is true.
    note[0].play();                                                                                                                              // The note[0] values gets loaded and combined with the custom function .display in the specific class
    Chords[0].display();                                                                                                                         // The Chords[0] values gets loaded and combined with the custom function .display in the specific class
  } else if (key == 'w') {
    note[1].play();
    Chords[1].display();
  } else if (key == 'e') {
    note[2].play();
    Chords[2].display();
  } else if (key == 'r') {
    note[3].play();
    Chords[3].display();
  } else if (key == 't') {
    note[4].play();
    Chords[4].display();
  } else if (key == 'y') {
    note[5].play();
    Chords[5].display();
  } else if (key == 'u') {
    note[6].play();
    Chords[6].display();
  }

  if (key == '2') {                                                                                                                              // If condition for when a specific key is pressed and what is to happen if that is true.
    halfNote[0].play();                                                                                                                          // The halfNote[0] values gets loaded and combined with the custom function .display in the specific class
    Chords[7].display();                                                                                                                         // The Chords[7] values gets loaded and combined with the custom function .display in the specific class
    println("halfNoteC");
  } else if (key == '3') {
    halfNote[1].play();
    Chords[8].display();
    println("halfNoteD");
  } else if (key == '5') {
    halfNote[2].play();
    Chords[9].display();
    println("halfNoteF");
  } else if (key == '6') {
    halfNote[3].play();
    Chords[10].display();
    println("halfNoteG");
  } else if (key == '7') {
    halfNote[4].play();
    Chords[11].display();
    println("halfNoteA");
  }
}


void mouseClicked() {                                                                                                                            // A void function to return no value. This is used for when the mouse is clicked.
  for (int i = 0; i < 5; i++) {                                                                                                                  // Loop for half note hit boxes, stating the value of i, stating an exit value for the loop and last making an incrementation
    if (mouseX > halfNoteHitBoxX[i] && mouseX < halfNoteHitBoxX[i] + halfNoteHitBoxWidth[i] && mouseY > halfNoteHitBoxY[i] && mouseY < halfNoteHitBoxY[i] + halfNoteHitBoxHeight[i]) {    // Condition for half note hitbox
      score ++;
      println(score);
      if (i == 0) {
        halfNote[i].play();
        Chords[i+7].display();
        println("halfNoteC");
      } else if (i == 1) {
        halfNote[i].play();
        Chords[i+7].display();
        println("halfNoteD");
      } else if (i == 2) {
        halfNote[i].play();
        Chords[i+7].display();
        println("halfNoteF");
      } else if (i == 3) {
        halfNote[i].play();
        Chords[i+7].display();
        println("halfNoteG");
      } else if (i == 4) {
        halfNote[i].play();
        Chords[i+7].display();
        println("halfNoteA");
      }
      println("Half note: " + i);
      return;                                                                                                                                   // If the mentioned if condition is met, this will be loaded at the end of the code and stop the code from further reading.
    }                                                                                                                                           // This is done to seperate the hitboxes of the black and white tangents
  }


  for (int i = 0; i < 7; i++) {                                                                                                                 // Loop for tangent hit boxes, stating the value of i, stating an exit value for the loop and last making an incrementation
    if (mouseX > tangentHitBoxX[i] && mouseX < tangentHitBoxX[i] + tangentHitBoxWidth[i] && mouseY > tangentHitBoxY[i]) {                       // Condition for tangent hitbox
      score ++;
      println(score);
      if (i == 0) {
        note[i].play();
        Chords[i].display();
        println("NoteC");
      } else if (i == 1) {
        note[i].play();
        Chords[i].display();
        println("NoteD");
      } else if (i == 2) {
        note[i].play();
        Chords[i].display();
        println("NoteE");
      } else if (i == 3) {
        note[i].play();
        Chords[i].display();
        println("NoteF");
      } else if (i == 4) {
        note[i].play();
        Chords[i].display();
        println("NoteG");
      } else if (i == 5) {
        note[i].play();
        Chords[i].display();
        println("NoteA");
      } else if (i == 6) {
        note[i].play();
        Chords[i].display();
        println("NoteB");
      } 
      println("Tangent: " + i);
    }
  }
}
