class Button
{
  float x;   //top left
  float y;   //top left
  float sizeW;
  float sizeH;
  String buttonText;
  
  //parameterised constructor
  Button(float x, float y, float sizeW, float sizeH, String buttonText)
  {
    this.x = x;
    this.y = y;
    this.sizeW = sizeW;
    this.sizeH = sizeH;
    this.buttonText = buttonText;
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
  
  boolean checkPress()
  {
    if (mouseX<=(x+sizeW/2) && mouseX>=(x-(sizeW/2)) &&  mouseY<=(y+sizeH/2) && mouseY>=y-(sizeH/2))
    {
      return true;
    }
    return false;
  }
}