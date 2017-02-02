class SnakeTail extends Entity
{
  color sqColor;

  SnakeTail(int x, int y)
  {
    super(x, y);
    //sqColor = color(random(255),random(255),random(255));
  }
  void drawTail()
  {
    //fill(sqColor);
    rect(posX, posY, BlockSize, BlockSize);
  }
}