void setup()
{
  size(600, 600);
  
  i=0;
  j=0;
  BlockSize = 25;
  inc = BlockSize;
  SnakeX = ((width/BlockSize)/2)*BlockSize;
  SnakeY = ((height/BlockSize)/2)*BlockSize;
  snakeHead = new Snake(SnakeX, SnakeY);
  foods = new Food((int)(random(0,width/BlockSize))*inc, (int)(random(0,height/BlockSize))*inc);
  Direction = "";
}

int i, j;
int BlockSize, SnakeX, SnakeY, inc;
String Direction;
Snake snakeHead;
Food foods;

void draw()
{
  if(frameCount % 15 == 0)
  {
    background(0);
    drawGrid();
    //drawSnake();
    snakeHead.drawSnake2();
    foods.createFood();
    checkBorder();
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