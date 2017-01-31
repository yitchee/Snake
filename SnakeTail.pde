class SnakeTail extends Snake
{
  color sqColor;
  SnakeTail()
  {
    super();
    sqColor = color(random(255),random(255),random(255));
    
  }
  SnakeTail(int x, int y)
  {
    super(x, y);
    sqColor = color(random(255),random(255),random(255));
  }
  void drawTail()
  {
    fill(sqColor);
    rect(posX, posY, BlockSize, BlockSize);
  }
}