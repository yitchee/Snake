class SnakeTail extends Entity
{
  color sqColor;

  SnakeTail(int x, int y)
  {
    super(x, y);
  }
  
  void drawTail()
  {
    rect(posX, posY, BlockSize, BlockSize);
  }
}