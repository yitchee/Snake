void setup()
{
  size(600, 600);
  
  score = 0;
  i=0;
  j=0;
  BlockSize = 25;
  inc = BlockSize;
  SnakeX = ((width/BlockSize)/2)*BlockSize;
  SnakeY = ((height/BlockSize)/2)*BlockSize;
  FoodX = (int)(random(0,width/BlockSize))*inc;
  FoodY = (int)(random(0,height/BlockSize))*inc;
  snakeHead = new Snake(SnakeX, SnakeY);
  foods = new Food(FoodX, FoodY);
  Direction = "";
}

int i, j, score;
int BlockSize, SnakeX, SnakeY, inc, FoodX, FoodY;
String Direction;
Snake snakeHead;
Food foods;

void draw()
{
  if(frameCount % 15 == 0)
  {
    background(0);
    drawGrid();
    eatFood();
    foods.createFood();
    snakeHead.drawSnake2();
    checkBorder();
    println(foods.posX, foods.posY);println(snakeHead.posX, snakeHead.posY);
    println(score);
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