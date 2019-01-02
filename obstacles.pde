class Obstacle {
  
  //variables
  float obstacleX;
  float obstacleY;
  float obstacleW = 60;
  float obstacleH = height/2 - 50;
  float difference = random(-250, 350);
  float gap = 200;
  float speedX = -3;
  boolean obstacleHit;
  int score;
  float scoreX = 50;
  float scoreY = 50;
  
  Obstacle (float temp_obstacleX, float temp_obstacleY) {
    obstacleX = temp_obstacleX;
    obstacleY = temp_obstacleY;
  }

void display() {
  fill(#f9f9f9);
  rect(obstacleX, obstacleY, obstacleW, (obstacleH - difference));
  rect (obstacleX, obstacleH - difference + gap, obstacleW, height);
 }
 
void movement() {
  obstacleX += speedX;
 }

void hitdetection() {
  if (((myBall.ballX + myBall.ballSize) >= obstacleX) && ((myBall.ballX + myBall.ballSize) <= (obstacleX + obstacleW)) && (myBall.ballY <= (obstacleY + (obstacleH - difference)) || ((myBall.ballY + myBall.ballSize) >= (obstacleH - difference + gap)))) {
    obstacleHit = true;
  } else {
    obstacleHit = false;
    score += 1;
  }  
 }
 
void score() {
  textSize(24);
  fill(#ff0000);
  text(score, scoreX, scoreY);
  
  }
}
