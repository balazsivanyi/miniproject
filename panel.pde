class Panel {

  // variables
  float panelX;
  float panelY;
  float panelW;
  float panelH;
  String s1 = "GAME OVER";
  String s2 = "Your score:";
  String s3 = "TRY AGAIN";
  float textX = 450;
  float textY = 300;
  float textPaddingX = 200;
  float textPaddingY = 300;


  Panel (float temp_panelX, float temp_panelY, float temp_panelW, float temp_panelH) {
    panelX = temp_panelX;
    panelY = temp_panelY;
    panelW = temp_panelW;
    panelH = temp_panelH;
  }

  //displaying the 'game-over panel'which contains all te texts
  void display() {
    fill(#ff0000);
    rect(panelX, panelY, panelW, panelH);

    fill(#ffffff);
    textSize(64);
    text(s1, textX, textY);

    fill(#ffffff);
    textSize(48);
    text(s2, textX, textY + textPaddingX);
  }
}
