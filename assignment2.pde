/***************************************
 * Name: Yit Chee Chin                 *
 * Student No.: C15390501              *
 * Year: DT228/2                       *
 * OOP Assignment 2                    *
 ***************************************/
import java.io.FileWriter;
import java.io.BufferedWriter;

void setup()
{
  size(600, 600);
  
  //highscores = new FileWriter("highscores.txt", true);
  fontSize = 32;
  gameState = 0;
  score = 0;
  i=0;
  j=0;
  frames = 3;
  BlockSize = 25;
  inc = BlockSize;
  SnakeX = ((width/BlockSize)/2)*BlockSize;
  SnakeY = ((height/BlockSize)/2)*BlockSize;
  println(SnakeX, SnakeY);
  FoodX = (int)(random(0,width/BlockSize))*inc;
  FoodY = (int)(random(0,height/BlockSize))*inc;
  snakeHead = new Snake(SnakeX, SnakeY);
  foods = new Food(FoodX, FoodY);
  Direction = "";
  mainButtonW = 150;
  mainButtonH = 75;
  playButton = new Button(width/2, height/2, mainButtonW, mainButtonH, "Play");
  optionButton = new Button(width/2, height/1.5, mainButtonW*1.1, mainButtonH, "Options");
  //Loading in a font file
  blockFont = createFont("FFFFORWA.TTF", fontSize);
  textFont(blockFont);
  textAlign(CENTER, CENTER);
}

FileWriter highscores = null;
int gameState, mainButtonW, mainButtonH, fontSize;
int i, j, score, frames, tempX, tempY;
int BlockSize, SnakeX, SnakeY, inc, FoodX, FoodY;
String Direction;
Snake snakeHead;
Button playButton, optionButton;
ArrayList<SnakeTail> snakeBody = new ArrayList<SnakeTail>();
Food foods;
PFont blockFont;

void draw()
{
  switch (gameState)
  {
    case 0:
      //Main menu
      gameState = menu();
      break;
    case 1:
      //In-game
      if(frameCount % frames == 0)
      {
        //moves snake and checks if its within limits
        drawGrid();
        fill(255);
        moveSnake();
        checkBorder();
        checkCollision();
      }
      //adds to snake if food is eaten and creates new food
      eatFood();
      foods.createFood();
      break;
    case 2:
      //game over screen
      gameOver();
      break;
    case 3:
      //options screen
      optionMenu();
      break;
    default:
      //If something doesn't work, white background
      background(255);
      break;
  }
}

void keyPressed()
{
  if (key == CODED && gameState == 1) 
  {
    if (keyCode == UP) 
    {
      if(Direction != "down")
      {
        Direction = "up";
      }
    }
    else if (keyCode == DOWN) 
    {
      if(Direction != "up")
      {
        Direction = "down";
      }
    }
    else if (keyCode == LEFT) 
    {
      if(Direction != "right")
      {
        Direction = "left";
      }
    }
    else if (keyCode == RIGHT)
    {
      if(Direction != "left")
      {
        Direction = "right";
      }
    }
  }
}

void mouseClicked()
{
  if (playButton.checkPress() == true)
  {
    if (gameState == 0 || gameState == 2)
    {
      gameState = 1;
    }
  }
  else if (optionButton.checkPress() == true)
  {
    if (gameState == 0)
    {
      gameState = 3;
    }
  }
}