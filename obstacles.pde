class Obstacle {

  // variables
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
  boolean counting = true;

  float x = 0.0;
  float y = 0.0;
  float z = 0.0;
  float r;
  float g;
  float b;

  Obstacle (float temp_obstacleX, float temp_obstacleY) {
    obstacleX = temp_obstacleX;
    obstacleY = temp_obstacleY;
  }

  void display() {
    // colour of the obstacles with Perlin noise
    x += .01;
    y += .01;
    z += .01;
    r = noise(x) * 255;
    g = noise(x, y) * 255;
    b = noise(x, y, z) * 255;
    fill(r, g, b);
    // measures of the obstacles with setting up the gap between them being the same size all the time
    rect(obstacleX, obstacleY, obstacleW, (obstacleH - difference));
    rect (obstacleX, obstacleH - difference + gap, obstacleW, height);
  }
  // makes the obstacles move horizontally
  void movement() {
    obstacleX += speedX;
  }
  // checks whether the ball hits the obstacles
  void hitdetection() {
    if (((myBall.ballX + myBall.ballSize) >= obstacleX) && ((myBall.ballX + myBall.ballSize) <= (obstacleX + obstacleW)) && (myBall.ballY <= (obstacleY + (obstacleH - difference)) || ((myBall.ballY + myBall.ballSize) >= (obstacleH - difference + gap)))) {
      obstacleHit = true;
    } else {
      obstacleHit = false;
    }
  }
  // score-counting
  void score() {
    textSize(24);
    fill(#ff0000);
    text(score, scoreX, scoreY);
    if (counting) {
      score += 1;
    }
  }
  // as soon as the obstacles go off the screen they get deleted
  void erase() {
    if ((obstacleX + obstacleW) < 0) {
      obstacleX = 0;
      obstacleY = 0;
      obstacleW = 0;
      obstacleH = 0;
    }
  }
}
