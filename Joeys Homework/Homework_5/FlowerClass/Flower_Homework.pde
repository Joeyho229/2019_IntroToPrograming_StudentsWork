Flower myFlower1;    // Den første flower class
Flower myFlower2;    // Den anden flower class
Flower myFlower3;    // Den tredje flower class

void setup() {
  size(1500, 1500);    // Canvas size

  // Integer variabler
  int r = 60;
  int petals = 7;
  int pc = #FF9500;
  
  // Float variabler
  float x = width/2;
  float y = height/2;
  
  // Fremkaldning af myFlower1- 2 og 3. Hvorved der gives nye variabler
  myFlower1 = new Flower(r, petals, x, y, pc);
  myFlower2 = new Flower(r, petals, x+random(-100, 100), y, pc);
  myFlower3 = new Flower(r, petals, x+50, y, pc);
}

void draw() {
  background(#FFE9FF);    // Canvas farve

  // Sammensætning af classes med myFlower1
  myFlower1.display();
  myFlower1.move();
  myFlower1.boundaries();
  myFlower1.ColorChange();

  // Sammensætning af classes med myFlower2
  myFlower2.display();
  myFlower2.move2();
  myFlower2.boundaries();
  myFlower2.ColorChange();

  // Sammensætning af classes med myFlower3
  myFlower3.display();  
  myFlower3.move3();
  myFlower3.boundaries();
  myFlower3.ColorChange();
}
