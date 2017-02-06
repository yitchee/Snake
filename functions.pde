int menu()
{
  background(0);
  
  if (checkButtonPress(playButton) == true)
  {
    return 1;
  }
  if (checkButtonPress(optionButton) == true)
  {
    return 3;
  }
  if (checkButtonPress(scoreButton) == true)
  {
    return 4;
  }
  textSize(64);
  text("Snake", width/2, height/4);
  return 0;
}

void optionMenu()
{
  background(0);
  Button easyButton = new Button(width/2, height/1.25, mainButtonW*1.1, mainButtonH, "Easy");
  Button medButton = new Button(width/2, height/1.6, mainButtonW*1.4, mainButtonH, "Medium");
  Button hardButton = new Button(width/2, height/2.25, mainButtonW*1.1, mainButtonH, "Hard");

  textSize(50);
  text("Diffifulty", width/2, height/5);
  
  if(checkButtonPress(easyButton) == true)
  {
    frames = 15;
    gameState = 0;
  }
  else if(checkButtonPress(medButton) == true)
  {
    frames = 8;
    gameState = 0;
  }
  else if(checkButtonPress(hardButton) == true)
  {
    frames = 4;
    gameState = 0;
  }
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
    }
  }
  if (snakeBody.size() > 3)
  {
    if((snakeHead.posX == snakeBody.get(snakeBody.size()-1).posX) && (snakeHead.posY == snakeBody.get(snakeBody.size()-1).posY))
    {
      resetSnake();
    }
  }
}

void eatFood()
{
  boolean posFlag = false;
  //adds to snake and creates new food
  if((foods.posX == snakeHead.posX) && (foods.posY == snakeHead.posY))
  {
    score++;
    tempX = foods.posX;
    tempY = foods.posY;
    
    do
    {
      posFlag = false;
      foods.posX = (int)(random(0,width/BlockSize))*inc;
      foods.posY = (int)(random(0,height/BlockSize))*inc;
      //Checks if the food is created at the snake's head
      if((foods.posX == snakeHead.posX) && (foods.posY == snakeHead.posY))
      {
        posFlag = true;
      }
      //checks if the food is created at any point on the snake's body
      for (int i=0; i<snakeBody.size()-1; i++)
      {
        if((foods.posX == snakeBody.get(i).posX) && (foods.posY == snakeBody.get(i).posY))
        {
          posFlag = true;
          println("changed:"+ i);
          break;
        }
      }
    }while(posFlag == true);
    
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
  checkCollision();
  fill(0, 255, 0);

  for(SnakeTail s: snakeBody)
  {
    s.drawTail();
  }
}

void resetSnake()
{
  gameState = 2;
  SnakeX = ((width/BlockSize)/2)*BlockSize;
  SnakeY = ((height/BlockSize)/2)*BlockSize;
  snakeHead = new Snake(SnakeX, SnakeY);
  
  for (int i=(snakeBody.size())-1; i>=0; i--);
  {
    snakeBody.clear();
  }
  direction = "";
}

void gameOver()
{
  //When player loses
  background(0);
  text("Score: "+score, width/2, height/3);
  if(save == true)
  {
    saveScore(score);
  }
  Button againButton = new Button(width/2, height/2, mainButtonW*1.9, mainButtonH, "Play Again");
  
  if (checkButtonPress(againButton) == true)
  {
    gameState = 1;
    score = 0;
    save = true;
  }
  Button mainButton = new Button(width/2, height/1.5, mainButtonW*2, mainButtonH, "Main Menu");
  if (checkButtonPress(mainButton) == true)
  {
    gameState = 0;
    score = 0;
    save = true;
  }
}

boolean checkButtonPress(Button b)
{
  b.drawButton();
  b.checkPress();
  if (b.clicked == true)
  {
    b.clicked = false;
    return true;
  }
  return false;
}

void loadScores()
{
  background(0);
  textSize(fontSize);
  text("Highscores", width/2, height*.1);
  
  int x, i;
  Button mainButton = new Button(width/1.25, height/1.1, mainButtonW*1.9, mainButtonH, "Main Menu");
  if (checkButtonPress(mainButton) == true)
  {
    gameState = 0;
    score = 0;
  }
  
  textSize(20);
  Table t = loadTable("highscores.csv");
  for (int row=1; row < t.getRowCount(); row++)
  {
    i = t.getInt(row, 0);
    x = t.getInt(row, 1);
    text(i + ")", width/3, (i*40)+height*.15);
    text(x, width/2, (i*40)+height*.15);
  }
}

void saveScore(int newScore)
{
  Table t= loadTable("highscores.csv", "header");
  int[] numbers = new int[11];
  int temp=0;
  
  for (int row=0; row < t.getRowCount(); row++)
  {
    numbers[row] = t.getInt(row, "score");
  }
  numbers[10] = newScore;
  for (int i=0; i<numbers.length; i++)
  {
    for (int j=1; j<(numbers.length)-i; j++)
    {
      if (numbers[j-1] < numbers[j])
      {
        temp = numbers[j-1];
        numbers[j-1] = numbers[j];
        numbers[j] = temp;
      }
    }
  }

  t.clearRows();
  
  for(int i=0; i<10; i++)
  {
    TableRow newRow = t.addRow();
    newRow.setInt("pos", i+1);
    newRow.setInt("score", numbers[i]);
  }
  saveTable(t, "data/highscores.csv");
  save = false;
}