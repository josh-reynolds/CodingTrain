// Coding Train
// Coding Challenge 19 - Superellipse
// https://www.youtube.com/watch?v=z86cx2A4_3E&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=22
// http://paubourke.net/geometry/supershape/

// another Javascript example, convert on the fly...

void setup(){
  size(400,400);
}

void draw(){
  background(51);
  
  translate(width/2, height/2);
  
  //float r = 100;
  float a = 100;
  float b = 100;
  //float n = 4;
  frameRate(1);
  float n = (frameCount) % 50;
  
  stroke(255);
  noFill();
  
  beginShape();
  for (float angle = 0; angle < TWO_PI; angle += 0.1){
    //float x = r * cos(angle);
    //float y = r * sin(angle);
    
    float na = 2 / n;
    float x = pow(abs(cos(angle)), na) * a * sgn(cos(angle));
    float y = pow(abs(sin(angle)), na) * b * sgn(sin(angle));

    vertex(x,y);
  }
  endShape(CLOSE);
}

float sgn(float t){
  float result = 0;
  if (t < 0){ result = -1.0; }
  if (t > 0){ result = 1.0; }
  return result;
}