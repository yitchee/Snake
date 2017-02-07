import processing.sound.*;

int gameState, mainButtonW, mainButtonH, fontSize;
int i, j, score, frames, tempX, tempY, currentScore;
int directionFlag, pressFlag, playedFlag, scoreFlag;
int BlockSize, SnakeX, SnakeY, inc, FoodX, FoodY, alpha;
String direction, currentDiff;
Snake snakeHead;
Button playButton, optionButton, scoreButton;
ArrayList<SnakeTail> snakeBody = new ArrayList<SnakeTail>();
Food foods;
PFont blockFont;
boolean save, soundFlag;
SoundFile soundEatFood, soundLose, soundButton;