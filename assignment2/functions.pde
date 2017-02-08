int menu()
{
  background(0);
  
  //checks for any clicks on the 3 buttons
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
  
  //checks for button press and changes the speed of snake movement
  if(checkButtonPress(easyButton) == true)
  {
    frames = 10;
    gameState = 0;
  }
  else if(checkButtonPress(medButton) == true)
  {
    frames = 6;
    gameState = 0;
  }
  else if(checkButtonPress(hardButton) == true)
  {
    frames = 3;
    gameState = 0;
  }
}

void drawGrid()
{
  rectMode(CORNER);
  background(0);
  for (i=0; i<width/BlockSize; i++)
  {
    stroke(25, 45);
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
  //Stops the snake from going through the last block of the body
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
      //generates position for the food (could result in infinite loop)
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
  soundEatFood.play();

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

  for(SnakeTail s: snakeBody)
  {
    s.drawTail();
  }
}

void resetSnake()
{
  //goes to gameover screen
  gameState = 2;
  SnakeX = ((width/BlockSize)/2)*BlockSize;
  SnakeY = ((height/BlockSize)/2)*BlockSize;
  snakeHead = new Snake(SnakeX, SnakeY);
  
  //deletes array list
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
  if (soundFlag == false)
  {
    soundLose.play();
    soundFlag = true;
  }
  currentDiff = saveDifficulty();
  text("Score: "+score, width/2, height/5);
  textSize(26);
  text("Difficulty: "+ currentDiff, width/2, height/3);
  if(save == true && score > 0)
  {
    //checks if score is in top 10
    currentScore = score;
    saveScore(score);
  }
  
  Button againButton = new Button(width/2, height/2, mainButtonW*1.9, mainButtonH, "Play Again");
  if (checkButtonPress(againButton) == true)
  {
    gameState = 1;
    score = 0;
    save = true;
    soundFlag = false;
  }
  
  Button mainButton = new Button(width/2, height/1.5, mainButtonW*2, mainButtonH, "Main Menu");
  if (checkButtonPress(mainButton) == true)
  {
    gameState = 0;
    score = 0;
    save = true;
    soundFlag = false;
  }
}

boolean checkButtonPress(Button b)
{
  //draws buttons and checks for presses
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
  //reads from .csv file
  background(0);
  textSize(fontSize);
  Table t = loadTable("highscores.csv", "header");
  fill(255);
  text("Highscores", width/2, height*.1);
  int x, i;
  String difficulty;
  
  Button mainButton = new Button(width/1.2, height/1.075, mainButtonW*1.9, mainButtonH, "Main Menu");
  if (checkButtonPress(mainButton) == true)
  {
    gameState = 0;
  }
  
  textSize(20);
  //reads the data and prints onto screen
  for (int row=0; row < t.getRowCount(); row++)
  {
    i = t.getInt(row, 0);
    x = t.getInt(row, 1);
    difficulty = t.getString(row, 2);
    
    fill(255);
    text(i + ")", width/3, (i*40)+height*.15);
    text(x, width/2, (i*40)+height*.15);
    text(difficulty, width/1.5, (i*40)+height*.15);
    
    if(currentScore == x && playedFlag > 0)
    {
      if(currentDiff.equals(difficulty) && scoreFlag == 0)
      {
        fill(0, 255, 0);
        text(i + ")", width/3, (i*40)+height*.15);
        text(x, width/2, (i*40)+height*.15);
        text(difficulty, width/1.5, (i*40)+height*.15);
      }
    }
  }
}

void saveScore(int newScore)
{
  Table t= loadTable("highscores.csv", "header");
  int[] numbers = new int[11];
  String[] difficulties = new String[11];
  int temp=0;
  String sTemp = "";
  
  //stores data from file into array
  for (int row=0; row < t.getRowCount(); row++)
  {
    numbers[row] = t.getInt(row, "score");
    difficulties[row] = t.getString(row, "difficulty");
  }
  
  //adds new score and difficulty into last position of array
  numbers[10] = newScore;
  difficulties[10] = saveDifficulty();
  
  //sorts the scores
  for (int i=0; i<numbers.length; i++)
  {
    for (int j=1; j<(numbers.length)-i; j++)
    {
      if (numbers[j-1] < numbers[j])
      {
        temp = numbers[j-1];
        sTemp = difficulties[j-1];
        numbers[j-1] = numbers[j];
        difficulties[j-1] = difficulties[j];
        numbers[j] = temp;
        difficulties[j] = sTemp;
      }
    }
  }
  
  //deletes data and inserts again
  t.clearRows();
  for(int i=0; i<10; i++)
  {
    TableRow newRow = t.addRow();
    newRow.setInt("pos", i+1);
    newRow.setInt("score", numbers[i]);
    newRow.setString("difficulty", difficulties[i]);
  }
  saveTable(t, "data/highscores.csv");
  save = false;
}

String saveDifficulty()
{
  //returns difficulty to be shown and saved
  if(frames == 3)
  {
    return "HARD";
  }
  else if(frames == 6)
  {
    return "MED";
  }
  else if(frames == 10)
  {
    return "EASY";
  }
  else
  {
    return "N/A";
  }
}