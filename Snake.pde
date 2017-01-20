class Snake
{
  int posX;
  int posY;
  
  Snake()
  {
    posX = ((width/BlockSize)/2)*BlockSize;
    posY = ((height/BlockSize)/2)*BlockSize;
  }
  
  Snake(int x, int y)
  {
    posX = x;
    posY = y;
  }
  
  void drawSnake2()
  {
    fill(255);
    switch (Direction)
    {
      case "up":
        rect(SnakeX, SnakeY-=inc, BlockSize, BlockSize);
        break;
      case "down":
        rect(SnakeX, SnakeY+=inc, BlockSize, BlockSize);
        break;
      case "left":
        rect(SnakeX-=inc, SnakeY, BlockSize, BlockSize);
        break;
      case "right":
        rect(SnakeX+=inc, SnakeY, BlockSize, BlockSize);
        break;
      default:
        rect(SnakeX, SnakeY, BlockSize, BlockSize);
        break;
    }
  }
}