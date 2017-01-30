class SnakeTail extends Snake
{
  SnakeTail()
  {
    super();
  }
  SnakeTail(int x, int y)
  {
    super(x, y);
  }
  void drawTail()
  {
    rect(posX, posY, BlockSize, BlockSize);
  }
}