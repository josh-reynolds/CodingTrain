// Coding Train
// Coding Challenge 172 - Horizontal Directional Drilling
// https://www.youtube.com/watch?v=FfCBNL6lWK0&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=231

// JavaScript conversion

PVector pos;
PVector dir;
int bias = 1;
ArrayList<PVector> path;

void setup(){
  size(600, 400);
  pos = new PVector(10, 100);
  dir = PVector.fromAngle(PI/6);
  path = new ArrayList<PVector>();
}

void mousePressed(){
  bias *= -1;
}

void drill(){
  float angle = 0.01;
  dir.rotate(angle * bias);
  path.add(pos.copy());
  pos.add(dir);
}

void draw(){
  drill();

  background(51);
  noStroke();
  rectMode(CORNER);
  
  fill(139, 69, 19);
  rect(0, 100, width, height - 100);
  
  fill(30, 144, 255);
  arc(width / 2, 100, 400, 200, 0, PI);
  
  beginShape();
    noFill();
    stroke(0);
    strokeWeight(2);
    for (PVector p : path){
      vertex(p.x, p.y);
    }
  endShape();
  
  stroke(255, 0, 0);
  strokeWeight(4);
  pushMatrix();
    translate(pos.x, pos.y);
    rotate(dir.heading() + PI/6 * bias);
    line(0, 0, 10, 0);
  popMatrix();
}