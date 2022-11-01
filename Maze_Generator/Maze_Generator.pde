// Coding Train
// Coding Challenge 10.1
// Maze Generator Part I
// https://www.youtube.com/watch?v=HyK_Q5rrcr4&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=10

int cols, rows;
int w = 40;

Cell[][] grid;

void setup(){
  size(400,400);
  cols = floor(width / w);
  rows = floor(height / w);
  
  grid = new Cell[cols][rows];
  
  for (int i = 0; i < cols; i++){
    for (int j = 0; j < rows; j++){
      Cell cell = new Cell(i,j);
      grid[i][j] = cell;
    }
  }
}

void draw(){
  background(51);
  
  for (int i = 0; i < cols; i++){
    for (int j = 0; j < rows; j++){
      grid[i][j].show();
    }
  }
}