import processing.serial.*; //imports the processing serial library

import cc.arduino.*; //imports the arduino library

Arduino arduino; //identifies Arduino

int moveCount = 0;
int moveActive = 0;
int moveLastState = 0;

int moveCountB = 0;
int moveActiveB = 0;
int moveLastStateB = 0;

int sKey = 0;
int cKey = 0;

void setup() {
  size(600, 300);
  textSize(25);
  noStroke(); 
  smooth();


  //  arduino = new Arduino(this, Arduino.list()[4], 57600); 
  //  
  //  for (int i = 0; i <= 13; i++) 
  //    arduino.pinMode(i, Arduino.INPUT);
  //  background(255, 255, 255);
  //  text("0", 30, 270);
  //  text("0", 330, 270);
}

void draw() {
  int moveActive = sKey; 
  int moveActiveB = cKey; 

  noStroke();

  if ((moveActive != moveLastState) && (moveActive == 1)) {
    moveCount++; //increase this integer by 1
    fill(255, 255, 255);
    rect(0, 0, 300, 300);
    fill(#FF8664);

    ellipse(150, 150, (moveCount * 5), (moveCount * 5));
    text(moveCount, 30, 270);
  }

  if ((moveActiveB != moveLastStateB) && (moveActiveB == 1)) {
    moveCountB++; //increase this integer by 1
    fill(255, 255, 255);
    rect(300, 0, 300, 300);
    fill(#FF8664); //the color of the circle
    ellipse(450, 150, (moveCountB * 5), (moveCountB * 5)); //draws a circle in the center of the canvas with the size of the count of activations (times 5)
    text(moveCountB, 330, 270); //displays the number of times the sensor has been active
  }

  moveLastState = moveActive; //pin two last state is the current state (1 or 0)
  moveLastStateB = moveActiveB; //pin two last state is the current state (1 or 0)
}

void keyPressed() {
  if (key == 's') sKey = 1;
  if (key == 'c') cKey = 1;
}

void keyReleased() {
  if (key == 's') sKey = 0;
  if (key == 'c') cKey = 0;
}

