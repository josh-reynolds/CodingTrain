

class Cell {
 
  public int i;
  public int j;
  
  private boolean top;
  private boolean right;
  private boolean bottom;
  private boolean left;
  
  public boolean visited = false;
  
  Cell(int i_, int j_){
    i = i_;
    j = j_;
    
    top = true;
    right = true;
    bottom = true;
    left = true;
  }
  
  // using globals, ugly...
  public void show(){
    float x = i*w;
    float y = j*w;
    stroke(255);
    
    // TOP
    if (top){
      line(x,y,x+w,y);
    }
    
    // RIGHT
    if (right){
      line(x+w,y,x+w,y+w);
    }
    
    // BOTTOM
    if (bottom){
      line(x+w,y+w,x,y+w);
    }
    
    // LEFT
    if (left){
      line(x,y+w,x,y);
    }

    if (visited){
      noStroke();
      fill(255,0,255,100);
      rect(x,y,w,w);
    }
  }
  
  public Cell checkNeighbors(){
    ArrayList<Cell> neighbors = new ArrayList<Cell>();
    
    // TOP
    if (j > 0){
      Cell top = grid[i][j-1];
      if (!top.visited){ neighbors.add(top); }
    }
    
    // RIGHT
    if (i < cols - 1){
      Cell right = grid[i+1][j];
      if (!right.visited){ neighbors.add(right); }
    }
 
    // BOTTOM
    if (j < rows - 1){
      Cell bottom = grid[i][j+1];
      if (!bottom.visited){ neighbors.add(bottom); }
    }
    
    //LEFT
    if (i > 0){
      Cell left = grid[i-1][j];
      if (!left.visited){ neighbors.add(left); }
    }
    
    if (neighbors.size() > 0){ 
      return neighbors.get(floor(random(neighbors.size()))); 
    } else {
      return null;
    }
  }
  
  
}