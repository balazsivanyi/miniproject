class Button {

  // variables
  float buttonX;
  float buttonY;
  float buttonW = 170;
  float buttonH = 30;
  float paddingLeft = 20;
  float paddingTop = 20;
  String s1 = "TRY AGAIN";
  boolean buttonHit;

  Button (float temp_buttonX, float temp_buttonY) {
    buttonX = temp_buttonX;
    buttonY = temp_buttonY;
  }
  // displaying the button
  void display() {
    noStroke();
    fill(#ffffff);
    rect(buttonX, buttonY, buttonW, buttonH);
    textSize(24);
    fill(#ff0000);
    text(s1, (buttonX + paddingLeft), (buttonY + paddingTop));
  }
  // makes the button clickable
  void hitdetection() {
    if (mousePressed) {
      if ((mouseX > buttonX) && (mouseX < (buttonX + buttonW)) && (mouseY > buttonY) && (mouseY < (buttonY + buttonH))) {
        buttonHit = true;
      }
    }
  }
}
