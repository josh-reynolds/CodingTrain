// Coding Train
// Coding Challenge 63.1 - Texturing Cloth Simulation Part 1
// https://www.youtube.com/watch?v=JunJzIe0hEo&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=83

String file = "plague_doctor.jpg";
PImage img;

//float x = 200;
//float y = 200;

void setup(){
  size(600, 400, P2D);
  img = loadImage(file);
}

void draw(){
  background(51);

  stroke(255);
  strokeWeight(2);
  noFill();
  textureMode(NORMAL);
  beginShape(TRIANGLE_STRIP);
    texture(img);
    for (float x = 100; x < 500; x+= 50){
      float u = map(x, 100, 500, 0, 1);
      vertex(x, 100, u, 0);
      vertex(x, 300, u, 1);
    }
  endShape();
  
  //beginShape();
  //  texture(img);
  //  vertex(x, y, 0, 0);
  //  vertex(300, 200, 600, 0);
  //  vertex(300, 300, 600, 600);
  //  vertex(200, 300, 0, 600);
  //endShape(CLOSE);
  
  //x += random(-5, 5);
  //y += random(-5, 5);
}