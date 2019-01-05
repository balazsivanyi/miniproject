class Ball {

  // variables
  float ballX;
  float ballY;
  float ballSize;

  float speed = 0;
  float gravity = 0.3;
  float jump = -8;

  float x = 0.0;
  float y = 0.0;
  float z = 0.0;

  float r;
  float g;
  float b;


  Ball (float temp_ballX, float temp_ballY, float temp_ballSize) {
    ballX = temp_ballX;
    ballY = temp_ballY;
    ballSize = temp_ballSize;
  }

  void display() {
    // colour of the ball with Perlin noise
    x += .01;
    y += .01;
    z += .01;
    r = noise(x) * 255;
    g = noise(x, y) * 255;
    b = noise(x, y, z) * 255;
    // basic displaying
    noStroke();
    fill(r, g, b);
    ellipse(ballX, ballY, ballSize, ballSize);
  }
  //  setting up the gravity of the ball, which is a vertical movement
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
  // that's how the jump is happening 
  void jump() { 
    speed += jump;
  }
}
