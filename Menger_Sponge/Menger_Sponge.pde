// Coding Train
// Coding Challenge 2 - Menger Sponge Fractal
// https://www.youtube.com/watch?v=LG8ZK-rRkXo&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=2


float a = 0;

ArrayList<Box> sponge;

void setup(){
  size(400, 400, P3D);
  sponge = new ArrayList<Box>();
  Box b = new Box(0,0,0,200);
  sponge.add(b);
}

void mousePressed(){
  ArrayList<Box> next = new ArrayList<Box>();
  for (Box b : sponge){
    ArrayList<Box> newBoxes = b.generate();
    next.addAll(newBoxes);
  }
  
  sponge = next;
}

void draw(){
  background(51);
  //stroke(0);
  noStroke();
  noFill();
  lights();
  
  translate(width/2, height/2);
  rotateX(a);
  rotateY(a*0.4);
  rotateZ(a*0.1);
  for (Box b : sponge){
    b.show();
  }
  
  a += 0.01;
}