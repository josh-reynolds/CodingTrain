// Coding Train
// Coding Challenge 89 - Langton's Ant
// https://www.youtube.com/watch?v=G1EgjgMo48U&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=125

int[][] grid;
final int WHITE = 0;
final int BLACK = 1;

int speed = 10000;

int x;
int y;
int dir;
final int ANTUP    = 0;
final int ANTRIGHT = 1;
final int ANTDOWN  = 2;
final int ANTLEFT  = 3;

PImage ant;

void setup(){
  size(400, 400);
  //fullScreen();
  grid = new int[width][height];

  ant = createImage(width, height, RGB);
  ant.loadPixels();
    for (int i = 0; i < ant.pixels.length; i++){
      ant.pixels[i] = color(255);
    }
  ant.updatePixels();
  
  x = width/2;
  y = height/2;
  grid[x][y] = WHITE;
  dir = ANTUP;
}

void draw(){
  background(255);
  
  int state;
  color c = color(255);
  ant.loadPixels();
  for (int i = 0; i < speed; i++){
    state = grid[x][y];
    if (state == WHITE){
      turnRight();
      grid[x][y] = BLACK;
      c = color(0);
    } else if (state == BLACK){
      turnLeft();
      grid[x][y] = WHITE;
      c = color(255);
    }
    int pix = x + y * ant.width;
    ant.pixels[pix] = c;
    moveForward();
  }
  ant.updatePixels();
  image(ant, 0, 0);
  
  stroke(255, 0, 0);
  strokeWeight(8);
  point(x, y);
  
  println(frameCount * speed);
}

void moveForward(){
  if (dir == ANTUP){
    y--;
    if (y < 0){ y = height - 1; }
  } else if (dir == ANTRIGHT){
    x++;
    if (x >= width){ x = 0; }
  } else if (dir == ANTDOWN){
    y++;
    if (y >= height){ y = 0; }
  } else if (dir == ANTLEFT){
    x--;
    if (x < 0){ x = width - 1; }
  }
}

void turnRight(){
  dir++;
  dir = dir % 4;
}

void turnLeft(){
  dir--;
  if (dir < 0){ dir = dir + 4; }
}