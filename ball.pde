class Ball {

  //variables
  float ballX;
  float ballY;
  float ballSize;

  float speed = 0;
  float gravity = 0.3;
  float jump = -8;


  Ball (float temp_ballX, float temp_ballY, float temp_ballSize) {
    ballX = temp_ballX;
    ballY = temp_ballY;
    ballSize = temp_ballSize;
  }

  void display() {
    noStroke();
    fill(#f9f9f9);
    ellipse(ballX, ballY, ballSize, ballSize);
  }

  void gravity() {

    ballY += speed;
    speed += gravity;

    if (ballY > height) {
      ballY = height;
    }

    if (ballY < 0) {
      ballY = 0;
    }
  }

  void jump() {
    speed += jump;
  }
}
