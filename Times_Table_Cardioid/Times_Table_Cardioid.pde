// Coding Train
// Coding Challenge 133 - Times Tables Cardioid Visualization
// https://www.youtube.com/watch?v=bl3nc_a1nvs&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=190

int total = 200;
int radius;
float factor = 0;

void setup(){
  size(640, 640);
  radius = width/2 - 16;
}

void draw(){
  background(0);
  translate(width/2, height/2);
  
  factor += 0.01;
  
  stroke(255);
  noFill();
  ellipse(0, 0, radius*2, radius*2);
  
  for (int i = 0; i < total; i++){
    PVector p = getVector(i);
    fill(255);
    ellipse(p.x, p.y, 8, 8);
  }
  
  for (int i = 0; i < total; i++){
    PVector a = getVector(i);
    PVector b = getVector(i * factor);
    line(a.x, a.y, b.x, b.y);
  } 
}

PVector getVector(float index){
  float angle = map(index, 0, total, 0, TWO_PI);
  PVector p = PVector.fromAngle(angle + PI);
  p.mult(radius);
  return p;
}