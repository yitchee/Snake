String line;
int gameState, mainButtonW, mainButtonH, fontSize;
int i, j, score, frames, tempX, tempY;
int directionFlag, pressFlag;
int BlockSize, SnakeX, SnakeY, inc, FoodX, FoodY;
String direction;
Snake snakeHead;
Button playButton, optionButton, scoreButton;
ArrayList<SnakeTail> snakeBody = new ArrayList<SnakeTail>();
Food foods;
PFont blockFont;