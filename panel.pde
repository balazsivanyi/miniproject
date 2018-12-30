class Panel {

//variables
float panelX;
float panelY;
float panelW;
float panelH;
String s1 = "GAME OVER";
String s2 = "Your score:";
String s3 = "TRY AGAIN";


Panel (float temp_panelX, float temp_panelY, float temp_panelW, float temp_panelH) {
  panelX = temp_panelX;
  panelY = temp_panelY;
  panelW = temp_panelW;
  panelH = temp_panelH;
}


void display() {
  fill(#ff0000);
  rect(panelX, panelY, panelW, panelH);
  
  fill(#ffffff);
  textSize(64);
  text(s1, 450, 300);
  
  fill(#ffffff);
  textSize(48);
  text(s2, 470, 400);
  
  fill(#ffffff);
  textSize(48);
  text(score, 470, 400);
  
  

}


}
