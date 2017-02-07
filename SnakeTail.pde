class SnakeTail extends Entity
{
  SnakeTail(int x, int y)
  {
    super(x, y);
  }
  
  void drawTail()
  {
    fill(255, alpha);
    rect(posX, posY, BlockSize, BlockSize);
  }
}