class Button
{
  float x;   //top left
  float y;   //top left
  float sizeW;
  float sizeH;
  String buttonText;
  float fontSize;
  
  //parameterised constructor
  Button(float x, float y, float sizeW, float sizeH, String buttonText, float fontSize)
  {
    this.x = x;
    this.y = y;
    this.sizeW = sizeW;
    this.sizeH = sizeH;
    this.buttonText = buttonText;
    this.fontSize = fontSize;
  }
  
  void drawButton()
  {
    stroke(255);
    noFill();
    rect(x, y, sizeW, sizeH);
  }
}