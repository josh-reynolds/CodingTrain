// Coding Train
// Coding Challenge 60 - Butterfly Generator
// https://www.youtube.com/watch?v=O_0fRV4MTZo&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=77

// JavaScript conversion

float da = PI / 100;
float dx = 0.1;
float dy = 0.1;
float min = 100;
float max = 180;

float yoff = 0;

void setup(){
  size(400, 400);
  background(51);
}

void draw(){
  background(51);
  
  translate(width/2, height/2);
  rotate(PI/2);
  stroke(255);
  strokeWeight(1);
  fill(255, 50);
  
  float r;  
  float xoff = 0;
  
  beginShape();
    for (float a = -PI/2; a <= PI/2; a += da){
      float n = noise(xoff, yoff);
      //r = map(n, 0, 1, 50, 125);
      r = sin(2 * a) * map(n, 0, 1, min, max);
      float x = r * cos(a);
      float y = r * sin(a) * sin(yoff);
      xoff += dx;
      vertex(x, y);
    }

    for (float a = PI/2; a <= 3 * PI/2; a += da){
      float n = noise(xoff, yoff);
      //r = map(n, 0, 1, 50, 125);
      r = sin(2 * a) * map(n, 0, 1, min, max);
      float x = r * cos(a);
      float y = r * sin(a) * sin(yoff);
      xoff -= dx;
      vertex(x, y);
    }
  endShape();
  
  yoff += dy;
}