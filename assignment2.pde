/***************************************
 * Name: Yit Chee Chin                 *
 * Student No.: C15390501              *
 * Year: DT228/2                       *
 * OOP Assignment 2                    *
 ***************************************/
void setup()
{
  size(600, 600);
  
  score = 0;
  i=0;
  j=0;
  frames = 15;
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

int i, j, score, frames;
int BlockSize, SnakeX, SnakeY, inc, FoodX, FoodY;
String Direction;
Snake snakeHead;
ArrayList<SnakeTail> snakeBody = new ArrayList<SnakeTail>();
Food foods;

void draw()
{
  if(frameCount % frames == 0)
  {
    background(0);
    drawGrid();
    fill(255);
    moveSnake();
    fill(120);
    checkBorder();
    //println(foods.posX, foods.posY);
    //println(snakeHead.posX, snakeHead.posY);
    //println("Score:  "+score);
    //println("Size:  "+snakeBody.size());
  }
  eatFood();
  foods.createFood();
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