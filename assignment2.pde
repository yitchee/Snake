/***************************************
 * Name: Yit Chee Chin                 *
 * Student No.: C15390501              *
 * Year: DT228/2                       *
 * OOP Assignment 2                    *
 ***************************************/
void setup()
{
  size(600, 600);
  
  fontSize = 32;
  gameState = 0;
  score = 0;
  i=0;
  j=0;
  frames = 7;
  BlockSize = 25;
  inc = BlockSize;
  SnakeX = ((width/BlockSize)/2)*BlockSize;
  SnakeY = ((height/BlockSize)/2)*BlockSize;
  FoodX = (int)(random(0,width/BlockSize))*inc;
  FoodY = (int)(random(0,height/BlockSize))*inc;
  snakeHead = new Snake(SnakeX, SnakeY);
  foods = new Food(FoodX, FoodY);
  Direction = "";
  mainButtonW = 150;
  mainButtonH = 75;
  playButton = new Button(width/2, height/2, mainButtonW, mainButtonH, "Play", 40);
  
  //Loading in a font file
  blockFont = createFont("FFFFORWA.TTF", fontSize);
  textFont(blockFont);
  textAlign(CENTER, CENTER);
}

int gameState, mainButtonW, mainButtonH, fontSize;
int i, j, score, frames, tempX, tempY;
int BlockSize, SnakeX, SnakeY, inc, FoodX, FoodY;
String Direction;
Snake snakeHead;
Button playButton;
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
        background(0);
        drawGrid();
        fill(255);
        moveSnake();
        checkBorder();
      }
      eatFood();
      foods.createFood();
      break;
    default:
      //If something doesn't work, white background
      background(255);
      break;
  }
}

void keyPressed()
{
  if (key == CODED) 
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