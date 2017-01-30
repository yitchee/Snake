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
    addSnake();
  }
}

void addSnake()
{
  int posX, posY, listSize;
  listSize = snakeBody.size();

  if(score == 1)
  {
    posX = snakeHead.posX;
    posY = snakeHead.posY;
    snakeBody.add(new SnakeTail(posX, posY));
  }
  else
  {
    posX = snakeBody.get(listSize-1).posX;
    posY = snakeBody.get(listSize-1).posY;
    snakeBody.add(new SnakeTail(posX, posY));
  }
}

void moveSnake()
{
  int posX, posY, listSize;
  listSize = snakeBody.size();
  println(listSize);
  posX = snakeHead.posX;
  posY = snakeHead.posY;
  SnakeTail trail = new SnakeTail(posX, posY);
  
  if(listSize != 0)
  {
    snakeBody.set(0, trail);
  }
  for(int i=listSize-1; i > 0; i--)
  {
    trail.posX = snakeBody.get(i).posX;
    trail.posY = snakeBody.get(i).posY;
    snakeBody.set(i-1, trail);
  }
  snakeHead.drawSnake();
  for(int i=0; i < snakeBody.size(); i++)
  {
    snakeBody.get(i).drawTail();
  }
}