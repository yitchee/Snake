class Snake
{
  int posX;
  int posY;
  
  Snake()
  {
    posX = 0;
    posY = 0;
  }
  
  Snake(int x, int y)
  {
    posX = x;
    posY = y;
  }
  
  void drawSnake()
  {
    //fill(255);
    switch (Direction)
    {
      case "up":
        rect(posX, posY-=inc, BlockSize, BlockSize);
        break;
      case "down":
        rect(posX, posY+=inc, BlockSize, BlockSize);
        break;
      case "left":
        rect(posX-=inc, posY, BlockSize, BlockSize);
        break;
      case "right":
        rect(posX+=inc, posY, BlockSize, BlockSize);
        break;
      default:
        rect(SnakeX, SnakeY, BlockSize, BlockSize);
        break;
    }
  }
}