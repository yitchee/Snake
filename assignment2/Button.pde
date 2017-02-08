class Button
{
  float x;   //top left
  float y;   //top left
  float sizeW;
  float sizeH;
  boolean clicked;
  String buttonText;
  
  //parameterised constructor
  Button(float x, float y, float sizeW, float sizeH, String buttonText)
  {
    this.x = x;
    this.y = y;
    this.sizeW = sizeW;
    this.sizeH = sizeH;
    this.buttonText = buttonText;
    this.clicked = false;
  }
  
  void drawButton()
  {
    rectMode(CENTER);
    stroke(255);
    noFill();
    rect(x, y, sizeW, sizeH);
    fill(255);
    textSize(fontSize);
    text(buttonText, x, y);
  }
  
  void checkPress()
  {
    if (mouseX<=(x+sizeW/2) && mouseX>=(x-(sizeW/2)) &&  mouseY<=(y+sizeH/2) && mouseY>=y-(sizeH/2) && mousePressed && pressFlag == 0)
    {
      soundButton.play();
      clicked = true;
      pressFlag = 1;
    }
    else
    {
      clicked = false;
    }
  }
}