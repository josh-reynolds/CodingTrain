// Coding Train
// Coding Challenge 51.1 - A* Pathfinding Algorithm - Part 1
// https://www.youtube.com/watch?v=aKYlikFAV4k&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=65

// JavaScript conversion

int cols = 25;
int rows = 25;
Cell[][] grid = new Cell[cols][rows];

Cell start;
Cell end;

ArrayList<Cell> openSet = new ArrayList<Cell>();
ArrayList<Cell> closedSet = new ArrayList<Cell>();
ArrayList<Cell> path = new ArrayList<Cell>();

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
      //grid[i][j].printNeighbors();
    }
  }
  
  start = grid[0][0];
  end = grid[cols-1][rows-1];
  
  openSet.add(start);
}

void draw(){
  background(255);
  
  if (!openSet.isEmpty()){
    Cell current = openSet.get(0);
    for (Cell c : openSet){
      if (c.f < current.f){
        current = c;
      }
    }

    if (current == end){
      Cell temp = current;
      path.add(temp);
      while (temp.previous != null){
        path.add(temp.previous);
        temp = temp.previous;
      }

      println("DONE!");
      noLoop();
    }
    
    openSet.remove(current);
    closedSet.add(current);

    for (Cell neighbor : current.neighbors){
      if (closedSet.contains(neighbor)){ continue; }
      
      int tempG = current.g++;
      if (openSet.contains(neighbor)){
        if (tempG < neighbor.g){ neighbor.g = tempG; }
      } else {
        neighbor.g = tempG;
        openSet.add(neighbor);
      }
      
      neighbor.h = heuristic(neighbor, end);
      neighbor.f = neighbor.g + neighbor.h;
      neighbor.previous = current;
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
  
  for (Cell c : closedSet){
    c.show(color(255,0,0));
  }
  
  for (Cell c : openSet){
    c.show(color(0,255,0));
  }

  for (Cell c : path){
    c.show(color(0,0,255));
  }
}

int heuristic(Cell sample, Cell destination){
  //return floor(dist(sample.col, sample.row, destination.col, destination.row));
  return abs(destination.col - sample.col) + abs(destination.row - sample.row);
}