import processing.serial.*; //imports the processing serial library

import cc.arduino.*; //imports the arduino library

Arduino arduino; //identifies Arduino

int moveCount = 0; //establishes the integer for the count times the sensor has been activated
int moveActive = 0; //shows if the sensor (plugged in to pin two) is active (1 if active, 0 if inactive)
int moveLastState = 0; //establishes the last read state of pin two

int moveCountB = 0; //establishes the integer for the count times the sensor has been activated
int moveActiveB = 0; //shows if the sensor (plugged in to pin two) is active (1 if active, 0 if inactive)
int moveLastStateB = 0; //establishes the last read state of pin two

void setup() {
  size(600, 300); //size of canvas
  textSize(25);
  noStroke(); //no stroke for the circle
  smooth(); //makes the curves smoother


  arduino = new Arduino(this, Arduino.list()[4], 57600); //establishes the serial port (usb port) that the Arduino is plugged in to

  for (int i = 0; i <= 13; i++) //establishes the arduino pins that the sketch is looking at (all pins under 13)
    arduino.pinMode(i, Arduino.INPUT); //establishes that the sketch is using the pins as an input
  background(255, 255, 255); //background color
  text("0", 30, 270); //displays the number of times the sensor has been active
  text("0", 330, 270); //displays the number of times the sensor has been active
}

void draw() {
  int moveActive = arduino.digitalRead(3); //establishes the name of pin two, and is in the draw loop so it runs continuously 
  int moveActiveB = arduino.digitalRead(4); //establishes the name of pin two, and is in the draw loop so it runs continuously 

  noStroke();

  if ((moveActive != moveLastState) && (moveActive == 1)) {
    moveCount++; //increase this integer by 1
    fill(255, 255, 255);
    rect(0, 0, 300, 300); //re-draw background, so the previous drawing (numbers) is erased
    fill(#FF8664); //the color of the circle

    ellipse(150, 150, (moveCount * 5), (moveCount * 5)); //draws a circle in the center of the canvas with the size of the count of activations (times 5)
    text(moveCount, 30, 270); //displays the number of times the sensor has been active
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

