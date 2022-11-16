// Coding Train
// Coding Challenge 23 - 2D Supershapes
// https://www.youtube.com/watch?v=ksRoh-10lak&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=26

// Another JavaScript video, needs conversion on the fly

float n1 = .3;
float n2 = .3;
float n3 = .3;
float m = 5;
float a = 1;
float b = 1;

void setup(){
  size(400,400);
  frameRate(10);
}

void draw(){
  float pulse = sin(frameCount) * 5;
  m += pulse;
  
  background(51); 
  translate(width/2, height/2);
    
  stroke(255);
  noFill();
  
  int radius = 200;
  int total = 1000;
  float increment = TWO_PI / total;
  beginShape();
  for (float angle = 0; angle < TWO_PI; angle += increment){    
    float r = supershape(angle);
    float x = radius * r * cos(angle);
    float y = radius * r * sin(angle);
    vertex(x,y);
  }
  endShape(CLOSE);
}

float supershape(float theta){ 
  float part1 = pow(abs((1/a) * cos(theta * m/4)), n2);
  float part2 = pow(abs((1/b) * sin(theta * m/4)), n3);
  float part3 = pow((part1 + part2), 1/n1);
  
  if (part3 != 0){
    return (1/part3);
  } else {
    return 0;
  }
}