// Coding Train
// Coding Challenge 10.2
// Maze Generator Part II
// https://www.youtube.com/watch?v=D8UgRyRnvXU

int cols, rows;
int w = 40;

Cell[][] grid;

Cell current;

void setup(){
  size(400,400);
  cols = floor(width / w);
  rows = floor(height / w);
  frameRate(3);
  
  grid = new Cell[cols][rows];
  
  for (int i = 0; i < cols; i++){
    for (int j = 0; j < rows; j++){
      Cell cell = new Cell(i,j);
      grid[i][j] = cell;
    }
  }
  
  current = grid[0][0];
}

void draw(){
  background(51);
  
  for (int i = 0; i < cols; i++){
    for (int j = 0; j < rows; j++){
      grid[i][j].show();
    }
  }

  current.visited = true;
  Cell next = current.checkNeighbors();
  
  if (next != null){
    next.visited = true;
    current = next;
  }
}