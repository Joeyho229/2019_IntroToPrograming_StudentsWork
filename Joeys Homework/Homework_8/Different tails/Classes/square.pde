// With help and guidance from kresten! Thank you
class square {    // Class

// Variables
  int indexPosition = 0;
  float[] positionX = new float[num];
  float[] positionY = new float[num];
  
  float SpeedX = random(-5, 5);
  float SpeedY = random(-5, 5);

  float y;
  float x;
  float squareSize;


  square(float temp_x, float temp_y, float temp_squareSize) {    // Constructor

    x = temp_x;    
    y = temp_y;
    squareSize = temp_squareSize;
  }

  void display() {    // Custom display function
    positionX[indexPosition] = x;
    positionY[indexPosition] = y;
    indexPosition = (indexPosition + 1) % num;
    for (int i = 0; i < num; i++) {
     int pos = (num + i) % num;
     float squareSize = (num - i) / 1.2;
     
     rect(positionX[pos], positionY[pos], squareSize, squareSize);
    }
    
  }


  void move () {    // Custom move function
    x += SpeedX;
    y += SpeedY;
  }
  
  void bounce() {    // Custom bounce function
   if (x >= width || x <= 0) {    // So it bounces off the x-axies
    SpeedX *= -1; 
   }
   if (y >= height || y <= 0) {    // So it bounces off the y-axies
   SpeedY *= -1;
   }
  }
  
}
