// Coding Train
// Coding Challenge 51.3 - A* Pathfinding Algorithm - Part 3
// https://www.youtube.com/watch?v=jwRT4PCT6RU&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=67

// JavaScript conversion

int cols = 25;
int rows = 25;
Cell[][] grid = new Cell[cols][rows];

Cell start;
Cell end;

ArrayList<Cell> openSet = new ArrayList<Cell>();
ArrayList<Cell> closedSet = new ArrayList<Cell>();
ArrayList<Cell> path = new ArrayList<Cell>();

boolean debug = false; // can produce a lot of output - best to reduce grid size when using

void setup(){
  size(400, 400);
  
  for (int i = 0; i < cols; i++){
    for (int j = 0; j < rows; j++){
      grid[i][j] = new Cell(i,j);
    }
  }
  for (int i = 0; i < cols; i++){
    for (int j = 0; j < rows; j++){
      grid[i][j].linkNeighbors();
    }
  }
  
  start = grid[0][0];
  start.wall = false;
  openSet.add(start);
  
  end = grid[cols-1][rows-1];
  end.wall = false;
}

void draw(){
  background(255);
  
  if (!openSet.isEmpty()){
    Cell current = openSet.get(0);
    if (debug){ println("*********************************");   }
    if (debug){ println("Starting with " + current.toString()); }
    for (Cell c : openSet){
      if (c.f < current.f){
        if (debug){ println("Evaluating " + c.toString()); }
        current = c;
      }
    }
    if (debug){ println("Choosing " + current.toString()); }
    
    if (current == end){
      println("DONE!");
      noLoop();
    }
    
    openSet.remove(current);
    closedSet.add(current);

    for (Cell neighbor : current.neighbors){
      if (debug){ println(""); }
      if (debug){ println("Evaluating neighbor " + neighbor.toString()); }
      
      if (closedSet.contains(neighbor)){ 
        if (debug){ println("Neighbor in closed set " + neighbor); }
        continue; 
      }
      if (neighbor.wall){ 
        if (debug){ println("Neighbor is a wall " + neighbor); }
        continue; 
      }
      
      int tempG = current.g + 1;
      if (debug){ println("g-scores: {current " + current.g + "}{temp " + tempG + "}"); }
      boolean newPath = false;
      if (openSet.contains(neighbor)){
        if (debug){ println("Neighbor already in open set " + neighbor.toString()); }
        if (tempG < neighbor.g){ 
          neighbor.g = tempG;
          newPath = true;
          if (debug){ println("Neighbor already in open set, updating g-score " + neighbor.toString()); }
        }
      } else {
        neighbor.g = tempG;
        newPath = true;
        openSet.add(neighbor);
        if (debug){ println("Adding neighbor to open set, updating g-score " + neighbor.toString()); }
      }

      if (newPath){ 
        neighbor.h = heuristic(neighbor, end);
        neighbor.f = neighbor.g + neighbor.h;
        neighbor.previous = current;
        if (debug){ println("Updating neighbor " + neighbor.toString()); }
      }
    }    

    Cell temp = current;
    path.clear();
    path.add(temp);
    while (temp.previous != null){
      path.add(temp.previous);
      temp = temp.previous;
    }
  } else {
    println("NO SOLUTION!");
    noLoop();
  }
  
  for (int i = 0; i < cols; i++){
    for (int j = 0; j < rows; j++){
      grid[i][j].show(color(255));
    }
  }
  
  //for (Cell c : closedSet){
  //  c.show(color(255,0,0));
  //}
  
  //for (Cell c : openSet){
  //  c.show(color(0,255,0));
  //}
  
  //for (Cell c : path){
  //  c.show(color(0,0,255));
  //}    
    
  noFill();
  strokeWeight(4);
  stroke(255,0,255);
  beginShape();
    for (Cell c : path){
      vertex(c.col*c.cellWidth + c.cellWidth/2, 
             c.row*c.cellHeight + c.cellHeight/2);
    }    
  endShape();
}

int heuristic(Cell sample, Cell destination){
  return floor(dist(sample.col, sample.row, destination.col, destination.row));
  //return abs(destination.col - sample.col) + abs(destination.row - sample.row);
}

void mouseClicked(){
  float cellWidth = width/cols;
  float cellHeight = height/rows;
  int cellX = floor(mouseX / cellWidth);
  int cellY = floor(mouseY / cellHeight);
  println(grid[cellX][cellY]);
}