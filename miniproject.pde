int num = 50; // number of obstacles
Ball myBall; // class of ball
Obstacle[] obstacles = new Obstacle [num]; // array for obstacles
Panel myPanel; // class of restart panel
Button myButton; // class of button
boolean stopMovement = true; // a boolean used for stopping the horizontal (obstacles) and vertical (ball) movements of the game

import processing.sound.*; 
SoundFile jumpEffect; 

void setup () {
  size(1200, 900);
  background(#262626);
  jumpEffect = new SoundFile(this, "jump.wav"); // imported sound effect when jumping w/ ball
  restart(); // one restart function for setup, which sets the values of the variables to default when the game has to restart
}

void restart() {
  background(#262626);

  // setting up the ball class
  float _ballX = 100; 
  float _ballY = height/2;
  float _ballSize = 40;
  myBall = new Ball(_ballX, _ballY, _ballSize); 

  // setting up the obstacle array with a forloop
  float _obstacleX = 600; 
  float _obstacleY = 0;
  for (int i = obstacles.length-1; i >= 0; i--) {
    obstacles[i] = new Obstacle (_obstacleX, _obstacleY);
    obstacles[i].obstacleX += 300*i; // gap between obstacles
  }  
  // setting up the panel class
  float _panelX = 0; 
  float _panelY = 0;
  float _panelW = 1200;
  float _panelH = 900;
  myPanel = new Panel (_panelX, _panelY, _panelW, _panelH);

  // setting up the button class
  float _buttonX = 450; 
  float _buttonY = 700;
  myButton = new Button (_buttonX, _buttonY);
}

void draw () {
  background(#262626);

  game(); // one game function which involves everything in it, because it is easier for organising
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      myBall.jump();
      jumpEffect.play();
    }
  }
} // the movement of the ball (myBall.jump()) is happening when the user presses the 'up' key, also the sound effect is giving a feedback for the user 

void game() {
  // displaying all the elements and actions of the game
  myBall.display();
  if (stopMovement) myBall.gravity();  

  for (int i = obstacles.length-1; i >= 0; i--) {  
    obstacles[i].display();
    if (stopMovement) obstacles[i].movement();
    obstacles[i].hitdetection();
    obstacles[i].score();
    obstacles[i].erase();
  }
  // all the actions which happen if the ball hits the obstacles
  for (int i = obstacles.length-1; i >= 0; i--) {    
    if (obstacles[i].obstacleHit == true) {
      stopMovement = false;
      obstacles[i].counting = false;
      obstacles[i].hitdetection();

      myPanel.display();
      text(obstacles[i].score, myPanel.textX + myPanel.textPaddingY, myPanel.textY + myPanel.textPaddingX);

      myButton.display();
      myButton.hitdetection();


      if (myButton.buttonHit == true) {         
        restart(); 
        stopMovement = true;
      }
    }
  }
}
