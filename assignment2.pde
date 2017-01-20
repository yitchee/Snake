void setup()
{
  size(600, 600);
  
  i=0;
  j=0;
  BlockSize = 20;
}

int i, j;
int BlockSize;

void draw()
{
  background(0);
  drawGrid();
  drawSnake();
}