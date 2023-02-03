// Coding Train
// Coding Challenge 77 - Recursion
// https://www.youtube.com/watch?v=jPsZwrV9ld0&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=112

// JavaScript conversion


void setup() {
  size(600, 600);
}

void draw(){
  background(0);
  
  stroke(255);
  noFill();
  drawCircle(width/2, height/2, 300);
  noLoop();
}

void drawCircle(float x, float y, float d){
  ellipse(x, y, d, d);
  if (d > 2){
    //float newD = d * random(0.2, 0.85);  
    //drawCircle(x + newD * 0.5, y, newD * 0.5);
    //drawCircle(x - newD * 0.5, y, newD * 0.5);
    
    drawCircle(x + d * 0.5, y, d * 0.5);
    drawCircle(x - d * 0.5, y, d * 0.5);
    drawCircle(x, y + d * 0.5, d * 0.5);
    //drawCircle(x, y - d * 0.5, d * 0.5);
  }
}