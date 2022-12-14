// Coding Train
// Coding Challenge 33 - Poisson-disc Sampling
// https://www.youtube.com/watch?v=flQgnCUxHlw&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=37

// JavaScript conversion

float r = 10;
float k = 30;
float w = r / sqrt(2);
int cols;
int rows;
  
ArrayList grid;
ArrayList<PVector> active;

void setup(){
  size(400, 400);
  cols = floor(width / w);
  rows = floor(height / w);
  active = new ArrayList<PVector>();
  
  // STEP 0
  grid = new ArrayList();
  for (int i = 0; i < cols * rows; i++){
    grid.add(-1);
  }
  
  // STEP 1
  float x = width/2;//random(width);
  float y = height/2;//random(height);
  PVector pos = new PVector(x, y);
  
  grid.set(coordsToIndex(pos.x, pos.y), pos);
  active.add(pos);
  
  //println("STARTING POINT");
  //println("columns: " + cols);
  //println("rows: " + rows);
  //println("w: " + w);
  //println("pos: " + pos);
  //println("i: " + i);
  //println("j: " + j);
  //println("bucket: " + (i + j * cols));
  //println("grid size: " + grid.size());
}

void draw(){
  background(0);

  // STEP 2
  if (!active.isEmpty()){
    int randIndex = floor(random(active.size()));
    PVector pos = active.get(randIndex);
    
    boolean found = false;
    for (int n = 0; n < k; n++){
      PVector sample = PVector.random2D();           
      float mag = random(r, 2 * r);     
      sample.setMag(mag);
      sample.add(pos);

      int col = floor(sample.x / w);
      int row = floor(sample.y / w);
      
      if (grid.get(coordsToIndex(sample.x, sample.y)).getClass() == PVector.class){
        break;
      }
      
      boolean ok = true;
      for (int i = -1; i <= 1; i++){
        for (int j = -1; j <= 1; j++){
          int index = (col + i) + (row + j) * cols;
          if (index < 0 || index > grid.size()){ continue; }    // deal with bounds
          if (grid.get(index).getClass() == PVector.class){     
            PVector neighbor = (PVector)grid.get(index);
            float d = pos.dist(neighbor);
            if (d < r){
              ok = false;
            }
          }
        }
      }

      try{
        if (ok && sample.x < width && sample.y < height){
          grid.set(col + row * cols, sample);
          active.add(sample);
          found = true;
          //break;
        }
      } catch(Exception e) {
        println("active list size: " + active.size());
        //println("EXCEPTION: " + e.toString());
        //println("x: " + sample.x);
        //println("y: " + sample.y);
        //println("col: " + col);
        //println("row: " + row);
        //println("index: " + (col + row * cols));
      }
    }
    
    if (!found){
      active.remove(randIndex);
    }
  }

  drawGrid();

  for (int i = 0; i < grid.size(); i++){
    if (grid.get(i).getClass() == PVector.class){
      PVector p = (PVector)grid.get(i);
      stroke(255);
      strokeWeight(4);
      point(p.x, p.y);
    }
  }
  
  for (PVector p : active){
    stroke(255, 0, 255);
    strokeWeight(1);
    point(p.x, p.y);
  }
}

void drawGrid(){
  for (int i = 1; i <= cols; i++){
    stroke(150);
    line(i * w, 0, i * w, height);
  }

  for (int j = 1; j <= rows; j++){
    stroke(60);
    line(0, j * w, width, j * w);
  }  
}

int coordsToIndex(float _x, float _y){
  int i = floor(_x / w);
  int j = floor(_y / w);
  return i + j * cols;
}