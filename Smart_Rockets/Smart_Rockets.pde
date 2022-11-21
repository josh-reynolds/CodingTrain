// Coding Train
// Coding Challenge 29 - Smart Rockets in p5.js
// https://www.youtube.com/watch?v=bGz7mv2vD6g&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=32

// another JavaScript conversion

Population p;
int lifespan;
int count;
PVector target;
int generation;
float maxforce = 0.2;

// obstacle
int rx = 100;
int ry = 150;
int rw = 200;
int rh = 10;

void setup(){
  size(400, 300);

  count = 0;
  lifespan = 400;
  generation = 1;
  println("Generation: " + generation);
  
  p = new Population();
  target = new PVector(width/2, 50); 
}

void draw(){
  background(0);

  p.run();

  count++;
  if (count == lifespan){
    p.evaluate();
    p.selection();
    count = 0;
    generation++;
    println("Generation: " + generation);
  }
  
  fill(255);
  rectMode(CORNER);
  rect(rx, ry, rw, rh);
  
  ellipse(target.x, target.y, 16, 16);
}