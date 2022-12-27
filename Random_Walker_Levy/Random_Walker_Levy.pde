// Coding Train
// Coding Challenge 53 - Random Walker with Vectors and Lévy Flight
// https://www.youtube.com/watch?v=bqF9w9TTfeo&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=69

// JavaScript conversion

PVector dot;

void setup(){
  background(51);
  size(400, 400);
  dot = new PVector(width/2, height/2);
}

void draw(){
  PVector oldPosition = dot.copy();
  PVector walk = PVector.random2D();

  if (random(1) < 0.01){ 
    walk.mult(random(15,35));
  }
  dot.add(walk);

  noStroke();
  fill(255,50);
  ellipse(dot.x, dot.y, 10, 10);

  stroke(255);
  line(dot.x, dot.y, oldPosition.x, oldPosition.y);
}