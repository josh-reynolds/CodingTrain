import peasy.*;

// Coding Train
// Coding Challenge 18 - 3D Fractal Trees
// https://www.youtube.com/watch?v=JcopTKXt8L8&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=21

Tree t;
PeasyCam cam;

float min_dist = 5;
float max_dist = 200;

void setup(){
  size(600, 900, P3D);
  //frameRate(5);
  cam = new PeasyCam(this, 500);
  t = new Tree();
}

void draw(){
  background(51);
  t.show();
  t.grow();
}