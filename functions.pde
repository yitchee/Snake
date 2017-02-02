int menu()
{
  background(0);
  playButton.drawButton();
  playButton.checkPress();
  if (playButton.clicked == true)
  {
    playButton.clicked = false;
    return 1;
  }
  optionButton.drawButton();
  optionButton.checkPress();
  if (optionButton.clicked == true)
  {
    optionButton.clicked = false;
    return 3;
  }
  textSize(64);
  text("Snake", width/2, height/4);
  return 0;
}

void optionMenu()
{
  background(0);
  Button easyButton = new Button(width/2, height/1.5, mainButtonW*1.1, mainButtonH, "Easy");
  Button medButton = new Button(width/2, height/2, mainButtonW*1.2, mainButtonH, "Medium");
  Button hardButton = new Button(width/2, height/3, mainButtonW*1.1, mainButtonH, "Hard");
  easyButton.drawButton();
  medButton.drawButton();
  hardButton.drawButton();
  /*if(easyButton.checkPress().clicked == true)
  {
    return 3;
  }
  else if(medButton.checkPress())
  {
    return 10;
  }
  else if(hardButton.checkPress())
  {
    return 20;
  }*/
  //return 0;
}

void drawGrid()
{
  rectMode(CORNER);
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
  //checks if within limits and resets if not
  if(snakeHead.posX < 0 || snakeHead.posX > width-1)
  {
    resetSnake();
  }
  else if(snakeHead.posY < 0 || snakeHead.posY > height-1)
  {
    resetSnake();
  }
}

void checkCollision()
{
  //check if the snake collides with its body
  for (int i=0; i<snakeBody.size()-1; i++)
  {
    if((snakeHead.posX == snakeBody.get(i).posX) && (snakeHead.posY == snakeBody.get(i).posY))
    {
      resetSnake();
      break;
    }
  }
}

void eatFood()
{
  //adds to snake and creates new food
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
  //creates a new block at the end of the snake
  if(score != 1)
  {
    x = snakeBody.get(snakeBody.size()-1).posX;
    y = snakeBody.get(snakeBody.size()-1).posY;
    x = tempX;
    y = tempY;
  }
  else
  {
    x = snakeHead.posX;
    y = snakeHead.posY;
  }
  snakeBody.add(new SnakeTail(x, y));
}

void moveSnake()
{
  int x, y;
  SnakeTail trail;
  
  //sets new position for each block to the one before it, from the end to the top
  for(int i=snakeBody.size()-1; i > 0; i--)
  {
    x = snakeBody.get(i-1).posX;
    y = snakeBody.get(i-1).posY;
    trail = new SnakeTail(x, y);
    snakeBody.set(i, trail);
  }
  //sets the 2nd block to the head's position
  x = snakeHead.posX;
  y = snakeHead.posY;
  trail = new SnakeTail(x, y);
  
  if(snakeBody.size() != 0)
  {
    snakeBody.set(0, trail);
  }
  //draws the whole snake
  snakeHead.drawSnake();
  for(int i=0; i < snakeBody.size(); i++)
  {
    snakeBody.get(i).drawTail();
  }
}

void resetSnake()
{
  gameState = 2;
  SnakeX = ((width/BlockSize)/2)*BlockSize;
  SnakeY = ((height/BlockSize)/2)*BlockSize;
  snakeHead = new Snake(SnakeX, SnakeY);
  //highscores.println(score + "\n");
  //highscores.flush();
  //highscores.close();
  for (int i=(snakeBody.size())-1; i>=0; i--);
  {
    snakeBody.clear();
  }
  score = 0;
  Direction = "";
}

void gameOver()
{
  //When player loses
  background(0);
  playButton = new Button(width/2, height/2, mainButtonW*1.75, mainButtonH, "Play Again");
  playButton.drawButton();
  playButton.checkPress();
  if (playButton.clicked == true)
  {
    playButton.clicked = false;
    gameState = 1;
  }
}