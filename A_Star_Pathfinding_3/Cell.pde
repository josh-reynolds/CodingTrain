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
    
    if (random(1) < 0.4){ wall = true; }
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
    ellipse(col * cellWidth, row * cellHeight, cellWidth, cellHeight);
    
    if (previous != null){
      stroke(255);
      line(col * cellWidth + cellWidth/2, 
           row * cellHeight + cellHeight/2,
           previous.col * cellWidth + cellWidth/2,
           previous.row * cellHeight + cellHeight/2);
    }
    
    if (wall){
      for (Cell n : neighbors){
        if (n.wall){
          if (col == n.col){
            int direction = n.row - row;
            float yOffset = row * cellHeight + cellHeight/4 + (direction * cellHeight/4);
            rect(col * cellWidth, yOffset, cellWidth, cellHeight/2);
          }
          if (row == n.row){
            int direction = n.col - col;
            float xOffset = col * cellWidth + cellWidth/4 + (direction * cellWidth/4);
            rect(xOffset, row * cellHeight, cellWidth/2, cellHeight);
          }
        }
      }
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