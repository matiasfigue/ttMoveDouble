import processing.serial.*;
import cc.arduino.*;
Arduino arduino;

int moveCount, moveActive, moveLastState, moveCountB, moveActiveB, moveLastStateB = 0; //establish all of the ints as 0

void setup() {
  size(600, 300);
  textSize(25);
  noStroke();
  smooth();
  background(255, 255, 255);
  fill(#FF8664);
  text("0", 30, 270);
  text("0", 330, 270);

  //arduino setup
  arduino = new Arduino(this, Arduino.list()[4], 57600);
  for (int i = 0; i <= 13; i++) 
    arduino.pinMode(i, Arduino.INPUT);
}

void draw() {
  int moveActive = arduino.digitalRead(3);
  int moveActiveB = arduino.digitalRead(4); 

  noStroke();

  if ((moveActive != moveLastState) && (moveActive == 1)) {
    moveCount++;

    updateCounterDrawing(moveCount, 0, 150, 30);
  }

  if ((moveActiveB != moveLastStateB) && (moveActiveB == 1)) {
    moveCountB++;

    updateCounterDrawing(moveCountB, 300, 450, 330);
  }

  moveLastState = moveActive;
  moveLastStateB = moveActiveB;
}

void updateCounterDrawing(int countTotal, int rectX, int circleX, int textX) {
  fill(255, 255, 255); 
  rect(rectX, 0, 300, 300);
  fill(#FF8664);
  ellipse(circleX, 150, (countTotal*5), (countTotal*5)); 
  text(countTotal, textX, 270);
}

