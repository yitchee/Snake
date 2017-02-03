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
  size(800, 600);
  
  //highscores = new FileWriter("highscores.txt", true);
  directionFlag = 0;
  pressFlag = 0;
  fontSize = 32;
  gameState = 0;
  score = 0;
  i=0;
  j=0;
  frames = 4;
  BlockSize = 25;
  inc = BlockSize;
  SnakeX = ((width/BlockSize)/2)*BlockSize;
  SnakeY = ((height/BlockSize)/2)*BlockSize;
  FoodX = (int)(random(0,width/BlockSize))*inc;
  FoodY = (int)(random(0,height/BlockSize))*inc;
  snakeHead = new Snake(SnakeX, SnakeY);
  foods = new Food(FoodX, FoodY);
  direction = "";
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
int i, j, score, frames, tempX, tempY, directionFlag, pressFlag;
int BlockSize, SnakeX, SnakeY, inc, FoodX, FoodY;
String direction;
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
        directionFlag = 0;
        drawGrid();
        fill(255);
        moveSnake();
        checkBorder();
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
  //checks if its in game and if input was already given
  if (key == CODED && gameState == 1 && directionFlag == 0) 
  {
    if (keyCode == UP) 
    {
      if(direction != "down")
      {
        direction = "up";
      }
    }
    else if (keyCode == DOWN) 
    {
      if(direction != "up")
      {
        direction = "down";
      }
    }
    else if (keyCode == LEFT) 
    {
      if(direction != "right")
      {
        direction = "left";
      }
    }
    else if (keyCode == RIGHT)
    {
      if(direction != "left")
      {
        direction = "right";
      }
    }
    directionFlag = 1;
  }
}

void mouseReleased()
{
  pressFlag = 0;
}