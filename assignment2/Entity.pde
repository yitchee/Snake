abstract class Entity
{
  int posX;
  int posY;
  
  Entity (int x, int y)
  {
    posX = x;
    posY = y;
  }
  
  void drawEntity()
  {
    rect(posX, posY, BlockSize, BlockSize);
  }
}