int menu()
{
  background(0);
  playButton.drawButton();
  return 0;
}

void drawGrid()
{
  background(0);
  for (i=0; i<width/BlockSize; i++)
  {
    stroke(50, 50);
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
    gameState = 0;
    SnakeX = ((width/BlockSize)/2)*BlockSize;
    SnakeY = ((height/BlockSize)/2)*BlockSize;
    snakeHead = new Snake(SnakeX, SnakeY);
  }
  if(snakeHead.posY < 0 || snakeHead.posY > height-1)
  {
    gameState = 0;
    SnakeX = ((width/BlockSize)/2)*BlockSize;
    SnakeY = ((height/BlockSize)/2)*BlockSize;
    snakeHead = new Snake(SnakeX, SnakeY);
  }
}

void eatFood()
{
  if((foods.posX == snakeHead.posX) && (foods.posY == snakeHead.posY))
  {
    score++;
    tempX = foods.posX;
    tempY = foods.posY;
    foods.posX = (int)(random(0,width/BlockSize))*inc;
    foods.posY = (int)(random(0,height/BlockSize))*inc;
    
    addSnake();
  }
}

void addSnake()
{
  int x, y;

  if(score == 1)
  {
    x = snakeHead.posX;
    y = snakeHead.posY;
    println("addSnake: "+x, y);
  }
  else
  {
    x = snakeBody.get(snakeBody.size()-1).posX;
    y = snakeBody.get(snakeBody.size()-1).posY;
    x = tempX;
    y = tempY;
    println("addSnake: "+x, y);
  }
  snakeBody.add(new SnakeTail(x, y));
  println("arraylist:  ");
  //println(snakeBody.size());
}

void moveSnake()
{
  int x, y;
  SnakeTail trail;
  
  for(int i=snakeBody.size()-1; i > 0; i--)
  {
    x = snakeBody.get(i-1).posX;
    y = snakeBody.get(i-1).posY;
    trail = new SnakeTail(x, y);
    snakeBody.set(i, trail);
  }
  x = snakeHead.posX;
  y = snakeHead.posY;
  trail = new SnakeTail(x, y);
  
  if(snakeBody.size() != 0)
  {
    snakeBody.set(0, trail);
  }
  
  snakeHead.drawSnake();
  for(int i=0; i < snakeBody.size(); i++)
  {
    snakeBody.get(i).drawTail();
  }
  //if()
  {
    println("for:  ");
    for(int i=0; i < snakeBody.size(); i++)
    {
      println(i+":",snakeBody.get(i).posX,snakeBody.get(i).posY);
    }
  }
}