// Coding Train
// Coding Challenge 14 - Fractal Trees - Recursive
// https://www.youtube.com/watch?v=0jjeOYMjmDU&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=17

// Another javascript video, let's do it in Java
// leaving out the angle slider bit, need to build one from scratch w/o the P5J library

float angle = PI/6;

void setup(){
  size(400,400);
}

void draw(){
  background(51);
  
  stroke(255);
  translate(200, height);
  branch(100);
}

void branch(float len){
  line(0, 0, 0, -len);
  translate(0, -len);

  if (len > 4){
    pushMatrix();
    rotate(angle);
    branch(len * 0.67);
    popMatrix();
    
    pushMatrix();
    rotate(-angle);
    branch(len * 0.67);
    popMatrix();
  }
}