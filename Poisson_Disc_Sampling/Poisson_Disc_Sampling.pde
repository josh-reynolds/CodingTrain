// Coding Train
// Coding Challenge 33 - Poisson-disc Sampling
// https://www.youtube.com/watch?v=flQgnCUxHlw&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=37

// JavaScript conversion

import java.util.Map;

float r = 10;
float k = 30;
float w = r / sqrt(2);
int cols;
int rows;

boolean looping = true;
  
ArrayList<PVector> active;
HashMap<PVector,PVector> grid;

void setup(){
  size(400, 400);
  cols = floor(width / w);
  rows = floor(height / w);
  
  // STEP 0
  active = new ArrayList<PVector>();
  grid = new HashMap<PVector,PVector>();
  
  // STEP 1
  float x = random(width);
  float y = random(height);
  PVector pos = new PVector(x, y);
  
  grid.put(pixelToGrid(pos), pos);
  active.add(pos);
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
      
      if (grid.get(new PVector(col, row)) != null ){
        break;
      }
      
      if (sample.x < 0 || sample.x > width || sample.y < 0 || sample.y > height){
        break;
      }
      
      boolean ok = true;
      for (int i = col-1; i <= col+1; i++){
        for (int j = row-1; j <= row+1; j++){   
          if (grid.get(new PVector(i, j)) != null ){
            PVector neighbor = (PVector)grid.get(new PVector(i, j));
            float d = pos.dist(neighbor);
            if (d < r){
              ok = false;
            }
          }
        }
      }

      if (ok){
        grid.put(new PVector(col, row), sample);
        active.add(sample);
        found = true;
        break;
      }

      println("active list size: " + active.size());
    }
    
    if (!found){
      active.remove(randIndex);
    }
  }

  drawGrid();

  for (Map.Entry me : grid.entrySet()){
    PVector p = (PVector)me.getValue();
    stroke(255);
    strokeWeight(4);
    point(p.x, p.y);
  }
  
  for (PVector p : active){
    stroke(255, 0, 255);
    strokeWeight(3);
    point(p.x, p.y);
  }
}

void mousePressed(){
  if (looping){
    noLoop();
    looping = false;
  } else {
    loop();
    looping = true;
  }
}

void drawGrid(){
  stroke(60);
  strokeWeight(1);
  
  for (int i = 1; i <= cols; i++){
    line(i * w, 0, i * w, height);
  }

  for (int j = 1; j <= rows; j++){
    line(0, j * w, width, j * w);
  }  
}

PVector pixelToGrid(PVector _point){
  int col = floor(_point.x / w);
  int row = floor(_point.y / w);
  return new PVector(col, row);
}