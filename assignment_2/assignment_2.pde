import javax.swing.*;  
Avatar av;
Log oneg;
Log twog;
Log threeg;
Log fourg;
Log fiveg;
Log sixg;
Log seveng;
Name nm;
boolean start = true; // boolean to start all animations
boolean count; // creates boolean for counting the total score
int score = 0; // sets a score integer to 0
int scoreArray[];  // creates an array for the all the score values
int counter = 0; // creates a counter for each game attempt
int sum; // creates a variable for the sum of all attempts
int highScore; // creates a variable for the highscore
int speed = -1; // creates a variable for the speed
void setup() {
  size(1600, 900); // creates a window with size 1600,900
  //below calls all the classes
  av = new Avatar(750, 800); 
  nm = new Name();
  oneg = new Log(1600, 105, 118, 65, 0);
  twog = new Log(1600, 205, 118, 65, 0);
  threeg = new Log(0, 305, 118, 65, 0);  
  fourg = new Log(1600, 405, 118, 65, 0);
  fiveg = new Log(1600, 505, 118, 65, 0);
  sixg = new Log(0, 605, 118, 65, 0);
  seveng = new Log(0, 705, 118, 65, 0);
  scoreArray = new int [nm.getMaxNumberOfGames()]; // creates an array with a max number of games
}
void draw() {
  //updates highscore if score exceeds highscore 
  if (score>=highScore) { 
    highScore=score;
  }
  background(0, 104, 211); //changes the background color to water
  //allows for the game to be restarted when start == false
  if (keyPressed) {
    if ((key == ' ')&&!start&&!(counter==nm.getMaxNumberOfGames())) {
      start = true;
      sum = 0;
      score=0;
      key = 0;
    }
  }

  if (start) {
    drawLand(); // draws the land at the top and bottom and the current score
    oneg.display(); // calls the display function for each row of logs
    oneg.setXPos(oneg.getXPos()-(2+speed)); // changes the xPos of the log to make it appear moving
    if (oneg.getXPos()<=0) {
      oneg.setXPos(1600);
    } // resets the xPos of the log back to the start to make the logs appear moving without continuously drawing them
    twog.display();
    twog.setXPos(twog.getXPos()-(3+speed));
    if (twog.getXPos()<=0) {
      twog.setXPos(1600);
    }
    threeg.display();
    threeg.setXPos(threeg.getXPos()+(3+speed));
    if (threeg.getXPos()>=1600) {
      threeg.setXPos(0);
    }
    fourg.display();
    fourg.setXPos(fourg.getXPos()-(3+speed));
    if (fourg.getXPos()<=0) {
      fourg.setXPos(1600);
    }
    fiveg.display();
    fiveg.setXPos(fiveg.getXPos()-(2+speed));
    if (fiveg.getXPos()<=0) {
      fiveg.setXPos(1600);
    }
    sixg.display();
    sixg.setXPos(sixg.getXPos()+(5+speed));
    if (sixg.getXPos()>=1600) {
      sixg.setXPos(0);
    }
    seveng.display();
    seveng.setXPos(seveng.getXPos()+(3+speed));
    if (seveng.getXPos()>=1600) {
      seveng.setXPos(0);
    }

    detectMoving(); // detects if avatar is on the logs and av.getXCoord()s it in the same direction as logs
    moveAvatar(); // av.getXCoord()s the character based on the arrow keys
    av.display(); // draws the avatar
    nm.display(score, 675, 50); // draws the name and score at the top
  } else if (!start) {
    drawMenu(); // calls drawmenu function if start is false
  }

  // calls a hit detection function for each row of logs
  detectLogCollision(oneg.getXPos(), oneg.getYPos()-5);
  detectLogCollision(twog.getXPos(), twog.getYPos()-5);
  detectLogCollision(threeg.getXPos(), threeg.getYPos()-5); 
  detectLogCollision(fourg.getXPos(), fourg.getYPos()-5); 
  detectLogCollision(fiveg.getXPos(), fiveg.getYPos()-5);
  detectLogCollision(sixg.getXPos(), sixg.getYPos()-5);
  detectLogCollision(seveng.getXPos(), seveng.getYPos()-5);
}

void drawMenu() {
  // draws a screen for each time the player fails and hits the water
  if (counter<nm.getMaxNumberOfGames()) {
    background(124, 177, 255);
    textSize(100);
    text("Fail", 700, 100);
    textSize(60);
    text("Press space to (re)start!", 500, 200);
    for (int i=0; i<scoreArray.length; i++) {
      textSize(40);
      text("Attempt "+(i+1)+":"+scoreArray[i], 500, 400+(i*50));
      text("Average of past "+counter+" attempt(s):"+(sum/counter), 900, 500);
      text("High score:"+highScore, 900, 450);
      text("Total score:"+sum, 900, 400);
    }
  } else {
    //draws the end screen after max number of games has been completed
    textSize(100);
    text("Finished!", 600, 100); 
    textSize(60);
    text("Press space to exit", 500, 200);
    for (int i=0; i<scoreArray.length; i++) {
      textSize(40);
      text("Attempt "+(i+1)+":"+scoreArray[i], 500, 400+(i*50));
      text("Average of past "+counter+" attempt(s):"+(sum/counter), 900, 500);
      text("High score:"+highScore, 900, 450);
      text("Total score:"+sum, 900, 400);
    }
    if (key==' ') {
      exit();
    }
  }
}

void detectMoving() {
  // detects if avatar is on log and moves it depending on speed of the log
  if ((av.getYCoord() >= 100) && (av.getYCoord() <= 700)) {
    if ((av.getYCoord() == 300) || (av.getYCoord() == 700)&&(av.getXCoord()<=1500)) {
      av.setXCoord( av.getXCoord() + (3+speed));
    } else if ((av.getYCoord() == 600)&&(av.getXCoord() <= 1500)) {
      av.setXCoord(  av.getXCoord() + (5+speed));
    } else if (((av.getYCoord() == 400) || (av.getYCoord() == 200))&&(av.getXCoord() >= 0)) {
      av.setXCoord( av.getXCoord() - (3+speed));
    } else if (!(av.getXCoord() < 5)) {
      av.setXCoord( av.getXCoord() - (2+speed));
    }
  }
}

void detectLogCollision(float xPos, float yPos) {
  //detects if the avatar is in the water and triggers a fail
  if (!(((av.getXCoord()>xPos-50)&&(av.getXCoord()<xPos+300))||
    ((av.getXCoord()>xPos-850)&&(av.getXCoord()<xPos-550))||((av.getXCoord()>xPos+750)&&(av.getXCoord()<xPos+1050))||
    (av.getXCoord()>xPos-1650)&&(av.getXCoord()<xPos-1350))&&(av.getYCoord() == yPos)) {
    start = false; // changes start back to false
    scoreArray[counter] = score; // adds your current score to the array
    counter += 1; //updates the counter for the next life
    av.setYCoord(800); //resets the avatar back to the bottom
    for (int i=0; i<scoreArray.length; i++) {
      sum += scoreArray[i]; //adds up all the scores in the array into the sum variable
    }
    speed=-1; // resets the speed back to -1
  }
}
void drawLand() {
  //draws land at the top and bottom
  noStroke();
  fill(0, 214, 58);
  rect(0, 0, width, 100);
  rect(0, height-100, width, 100);
}
void moveAvatar() {
  // moves the avatar based on the arrow keys
  if (keyPressed) {
    if (key == CODED) {
      if ((keyCode == LEFT) && !(av.getXCoord() < 5)) {
        av.setXCoord(av.getXCoord()-100);
        keyCode = 0;
      } else if ((keyCode == RIGHT) && !(av.getXCoord() > 1500)) {
        av.setXCoord(av.getXCoord()+100); 
        keyCode = 0;
      } else if (keyCode == UP) {
        av.setYCoord(av.getYCoord() -100); 
        keyCode = 0;
      } else if ((keyCode == DOWN)&&!(av.getYCoord()==800)) {
        av.setYCoord(av.getYCoord() +100);
        keyCode = 0;
      }
    }
  }
}
