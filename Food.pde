class Food extends Entity
{
  Food(int x, int y)
  {
    super(x, y);
  }
  
  void createFood()
  {
    noStroke();
    fill(255, 0, 0);
    rect(posX, posY, BlockSize, BlockSize);
  }
}