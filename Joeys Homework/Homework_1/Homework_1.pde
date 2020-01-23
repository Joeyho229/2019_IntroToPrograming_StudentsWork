size(630,600);
stroke(#288136);
fill(#288136);
rect(0,572,630,28);

//Tail
noFill();
strokeWeight(1.5);
stroke(0);
curve(500,210,90,210,240,450,1130,450);

//Foot
line(240,450,240,570);

line(240,570,330,570);
line(330,570,330,540);
line(330,540,270,540);
line(300,540,300,450);


//Belly
fill(#FCF0F0);
curve(0,450,300,450,420,300,300,300);
curve(340,450,300,450,420,300,900,100);

//Hands
line(420,300,450,300);
ellipseMode(CENTER);
fill(0);
ellipse(450,300,30,30);

//Neck
line(420,300,450,210);

//Nose
line(450,210,540,210);
noFill();
curve(420,240,540,210,540,150,420,150);
line(540,150,450,150);

//Mouth
noFill();
strokeJoin(ROUND);
beginShape();
vertex(543,205);
vertex(480,180);
vertex(550,165);
endShape();

//Teeth
fill(255);
triangle(550,166.5,535,169,544,184);
triangle(530,170,515,173,525,185);
triangle(510,174,495,177,505,186);

//Head
noFill();
curve(540,390,450,150,330,150,540,390);

//Eye
ellipseMode(CENTER);
fill(255);
ellipse(415,153,30,30);
fill(#0D0707);
ellipse(420,150,15,15);

//Back
line(330,150,330,210);
line(330,210,210,330);
//line(210,330,120,330);
//line(120,330,90,210);
noFill();
curve(100,210,90,210,210,330,1130,450);

//Spikes
fill(#0D0707);
triangle(90,210,93,220,100,200);
triangle(93,215,90,230,110,210);
triangle(91,230,89,240,110,220);
triangle(89,240,90,255,110,230);
