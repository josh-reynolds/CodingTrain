// Coding Train
// Coding Challenge 10.3
// Maze Generator Part III
// https://www.youtube.com/watch?v=8Ju_uxJ9v44

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
  current.highlight();
  
  // STEP 1
  Cell next = current.checkNeighbors();
  if (next != null){
    next.visited = true;
    
    // STEP 2
    
    // STEP 3
    removeWalls(current,next);
    
    // STEP 4
    current = next;
  }
}

void removeWalls(Cell a, Cell b){
   int x = a.i - b.i;
   int y = a.j - b.j;
   
   if (x == 1) {
     a.left = false;
     b.right = false;
   }
   if (x == -1){
     a.right = false;
     b.left = false;   
   }
   if (y == 1) {
     a.top = false;
     b.bottom = false;
   }
   if (y == -1){
     a.bottom = false;
     b.top = false;   
   }
}