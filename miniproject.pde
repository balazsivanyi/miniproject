int num = 50;
Ball myBall;
Obstacle[]obstacles = new Obstacle [num];
Panel myPanel;
Button myButton;

import processing.sound.*;
SoundFile jumpEffect;

void setup () {
  size(1200,900);
  background(#262626);
  jumpEffect = new SoundFile(this, "jump.wav");
  restart();
}

void restart() {
  background(#262626);
  
  float _ballX = 100;
  float _ballY = height/2;
  float _ballSize = 40;
  myBall = new Ball(_ballX, _ballY, _ballSize);
  
  float _obstacleX = 600;
  float _obstacleY = 0;
  for (int i = 0; i < obstacles.length; i++) {
    obstacles[i] = new Obstacle (_obstacleX, _obstacleY);
    obstacles[i].obstacleX += 300*i;
  }  
  
  float _panelX = 100;
  float _panelY = 100;
  float _panelW = 1000;
  float _panelH = 700;
  myPanel = new Panel (_panelX, _panelY, _panelW, _panelH);
  
  float _buttonX = 450;
  float _buttonY = 700;
  myButton = new Button (_buttonX, _buttonY);

}

void draw () {
  background(#262626);
   
  game();
  
  
}
  
void keyPressed() {
    if (key == CODED) {
      if (keyCode == UP) {
        myBall.jump();
        jumpEffect.play();
      }
    }
  }
  
void game() {
  
  myBall.display();
  myBall.gravity();  
  
  for (int i = 0; i < obstacles.length; i++) {  
      obstacles[i].display();
      obstacles[i].movement();
      obstacles[i].hitdetection();
      obstacles[i].score();
  }

  for (int i = 0; i < obstacles.length; i++) {    
      if (obstacles[i].obstacleHit == true) {
        myPanel.display();
        text(obstacles[i].score, 750, 500);
        myButton.display();
        myButton.hitdetection();
        //noLoop();
        if (myButton.buttonHit == true) {
          restart();
        }
      }
    }
}
