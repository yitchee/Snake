void drawGrid()
{
  for (i=0; i<width/BlockSize; i++)
  {
    stroke(50);
    noFill();
    for (j=0; j<height/BlockSize; j++)
    {
      rect(i*BlockSize,j*BlockSize, BlockSize, BlockSize);
    }
  }
}

void checkBorder()
{
  if(snakeHead.posX < 0 || snakeHead.posX > width-1)
  {
    background(255);
  }
  if(snakeHead.posY < 0 || snakeHead.posY > height-1)
  {
    background(255);
  }
}

void eatFood()
{
  if((foods.posX == snakeHead.posX) && (foods.posY == snakeHead.posY))
  {
    score++;
    foods.posX = (int)(random(0,width/BlockSize))*inc;
    foods.posY = (int)(random(0,height/BlockSize))*inc;
    snakeBody.add(new Snake());
  }
}