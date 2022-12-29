// Coding Train
// Coding Challenge 53 - Random Walker with Vectors and Lévy Flight
// https://www.youtube.com/watch?v=bqF9w9TTfeo&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=69

// JavaScript conversion

PVector dot;
color col;

void setup(){
  background(255);
  size(400, 400);
  dot = new PVector(width/2, height/2);
  col = color(random(255), random(255), random(255), 50);
}

void draw(){
  PVector oldPosition = dot.copy();
  PVector walk = PVector.random2D();

  int redDelta = floor(random(-5, 5)); 
  int greenDelta = floor(random(-5, 5));
  int blueDelta = floor(random(-5, 5));

  if (random(1) < 0.01){ 
    float scale = random(15, 35);
    walk.mult(scale);
    redDelta *= scale;
    greenDelta *= scale;
    blueDelta *= scale;
  }
  
  redDelta = redDelta % 255;
  greenDelta = greenDelta % 255;
  blueDelta = blueDelta % 255; 

  col = color(red(col) + redDelta,
              green(col) + greenDelta,
              blue(col) + blueDelta,
              50);

  dot.add(walk);
  if (dot.x < 0)     { 
    dot.x = width + dot.x;
    oldPosition.x = width;
  }
  if (dot.x > width) { 
    dot.x = dot.x - width;
    oldPosition.x = 0;
  }
  if (dot.y < 0)     { 
    dot.y = height + dot.y;
    oldPosition.y = height;
  }
  if (dot.y > height){ 
    dot.y = dot.y - height;
    oldPosition.y = 0;
  }

  noStroke();
  fill(col);
  ellipse(dot.x, dot.y, 10, 10);

  stroke(0);
  line(dot.x, dot.y, oldPosition.x, oldPosition.y);
}