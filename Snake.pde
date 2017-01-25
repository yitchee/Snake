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
        rect(posX, posY, BlockSize, BlockSize);
        break;
    }
  }
}