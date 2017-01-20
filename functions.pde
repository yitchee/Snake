void drawGrid()
{
  for (i=0; i<width/BlockSize; i++)
  {
    stroke(50);
    noFill();
    for (j=0; j<height/BlockSize; j++)
    {
      rect(i*BlockSize,j*BlockSize, BlockSize, BlockSize);
    }
  }
}

void drawSnake()
{
  fill(255);
  switch (Direction)
  {
    case "up":
      rect(SnakeX, SnakeY-=inc, BlockSize, BlockSize);
      break;
    case "down":
      rect(SnakeX, SnakeY+=inc, BlockSize, BlockSize);
      break;
    case "left":
      rect(SnakeX-=inc, SnakeY, BlockSize, BlockSize);
      break;
    case "right":
      rect(SnakeX+=inc, SnakeY, BlockSize, BlockSize);
      break;
    default:
      rect(SnakeX, SnakeY, BlockSize, BlockSize);
      break;
  }
}