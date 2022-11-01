// Coding Train
// Coding Challenge 10.4
// Maze Generator Part IV
// https://www.youtube.com/watch?v=_p5IH0L63wo

int cols, rows;
int w = 40;

Cell[][] grid;

Cell current;

ArrayList<Cell> stack;

void setup(){
  size(1200,1200);
  cols = floor(width / w);
  rows = floor(height / w);
  //frameRate(8);
  
  grid = new Cell[cols][rows];
  stack = new ArrayList<Cell>();
  
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
  
  // STEP 1.1
  Cell next = current.checkNeighbors();
  if (next != null){
    next.visited = true;
    
    // STEP 1.2
    stack.add(current);
    
    // STEP 1.3
    removeWalls(current,next);
    
    // STEP 1.4
    current = next;
  } else if (stack.size() > 0){
    // STEP 2.1 + 2.2
    current = stack.get(stack.size()-1);
    stack.remove(stack.size()-1);
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