class Cell {
  int f;
  int g;
  int h;
  
  int col;
  int row;
  int cellWidth;
  int cellHeight;
  
  ArrayList<Cell> neighbors;
  Cell previous;
  
  boolean wall = false;
  
  Cell(int _col, int _row){
    f = 0;
    g = 0;
    h = 0;
    
    col = _col;
    row = _row;
    
    cellWidth = width/cols;
    cellHeight = height/rows;
    
    neighbors = new ArrayList<Cell>();
    
    if (random(1) < 0.15){ wall = true; }
  }
  
  void linkNeighbors(){
    if (col > 0)     { neighbors.add(grid[col-1][row]); }
    if (col < cols-1){ neighbors.add(grid[col+1][row]); }
    if (row > 0)     { neighbors.add(grid[col][row-1]); }
    if (row < rows-1){ neighbors.add(grid[col][row+1]); }
    
    if (col > 0 && row > 0)          { neighbors.add(grid[col-1][row-1]); }
    if (col < cols-1 && row > 0)     { neighbors.add(grid[col+1][row-1]); }
    if (col < cols-1 && row < rows-1){ neighbors.add(grid[col+1][row+1]); }
    if (col > 0 && row < rows-1)     { neighbors.add(grid[col-1][row+1]); }
  }
  
  void show(color c){
    if (wall){
      fill(0);
    } else {
      fill(c);
    }
    
    stroke(0);
    strokeWeight(1);
    //rect(col * cellWidth, row * cellHeight, cellWidth-1, cellHeight-1);
    
    noStroke();
    ellipseMode(CORNER);
    ellipse(col * cellWidth, row * cellHeight, cellWidth-1, cellHeight-1);
    
    if (previous != null){
      stroke(255);
      line(col * cellWidth + cellWidth/2, 
           row * cellHeight + cellHeight/2,
           previous.col * cellWidth + cellWidth/2,
           previous.row * cellHeight + cellHeight/2);
    }
  }
  
  String toString(){
    return "Cell(" + col + "," + row + ") : {f=" + f + "}{g=" + g + "}{h=" + h + "}";
  }
  
  void printNeighbors(){
    print(this.toString() + " :: ");
    print(neighbors.size() + " :: ");
    for (Cell c : neighbors){
      print(c.toString() + " ");
    }
    println("-----------");
  }
}