// Coding Train
// Coding Challenge 51.2 - A* Pathfinding Algorithm - Part 2
// https://www.youtube.com/watch?v=EaZxUCWAjb0&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=66

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
      if (neighbor.wall){ continue; }
      
      int tempG = current.g + 1;
      boolean newPath = false;
      if (openSet.contains(neighbor)){
        if (tempG < neighbor.g){ 
          neighbor.g = tempG;
          newPath = true;
        }
      } else {
        neighbor.g = tempG;
        newPath = true;
        openSet.add(neighbor);
      }

      if (newPath){ 
        neighbor.h = heuristic(neighbor, end);
        neighbor.f = neighbor.g + neighbor.h;
        neighbor.previous = current; 
      }
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
  return floor(dist(sample.col, sample.row, destination.col, destination.row));
  //return abs(destination.col - sample.col) + abs(destination.row - sample.row);
}

void mouseClicked(){
  float cellWidth = width/cols;
  float cellHeight = height/rows;
  int cellX = floor(mouseX / cellWidth);
  int cellY = floor(mouseY / cellHeight);
  println("cell: " + cellX + ", " + cellY);
  println(grid[cellX][cellY]);
}