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
  rect(((width/BlockSize)/2)*BlockSize, ((height/BlockSize)/2)*BlockSize, BlockSize, BlockSize);
}