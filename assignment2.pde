void setup()
{
  size(600, 600);
  
  i=0;
  j=0;
  BlockSize = 20;
  SnakeX = ((width/BlockSize)/2)*BlockSize;
  SnakeY = ((height/BlockSize)/2)*BlockSize;
  inc = BlockSize;
  Direction = "";
}

int i, j;
int BlockSize, SnakeX, SnakeY, inc;
String Direction;

void draw()
{
  if(frameCount % 15 == 0)
  {
    background(0);
    drawGrid();
    drawSnake();
  }
}

void keyPressed() 
{
  if (key == CODED) 
  {
    if (keyCode == UP) 
    {
      Direction = "up";
    }
    else if (keyCode == DOWN) 
    {
      Direction = "down";
    }
    else if (keyCode == LEFT) 
    {
      Direction = "left";
    }
    else if (keyCode == RIGHT) 
    {
      Direction = "right";
    }
  }
}