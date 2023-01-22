// Coding Train
// Coding Challenge 55 - Mathematical Rose Patterns
// https://www.youtube.com/watch?v=f5QBExMNB1I&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=72

// JavaScript conversion

// r = cos(k * theta)
// x = cos(k * theta) * cos(theta)
// y = cos(k * theta) * sin(theta)

float num = 5;
float den = 8;
float k;

void setup(){
  size(400, 400);
  showValues();
}

void draw(){
  background(51);  
  translate(width/2, height/2);
  drawShape();
}

void drawShape(){
  stroke(0, 125, 255);
  noFill();
  strokeWeight(1);
  
  k = num / den;
  float r, x, y;
  
  beginShape();
    for (float a = 0; a < TWO_PI * den; a += 0.02){
      r = 200 * cos(k * a);
      x = r * cos(a);
      y = r * sin(a);
      vertex(x, y);
    }
  endShape();
}

void showValues(){
  println("Num = " + num + ", Den = " + den);
}

void mouseClicked(){
  if (mouseButton == LEFT){
    den += 1; 
    showValues();
  }
  if (mouseButton == RIGHT){
    if (den > 1){
      den -= 1;
    }
    showValues();
  }
}

void keyPressed(){
  if (keyCode == UP){
    num += 1; 
    showValues();
  }
  if (keyCode == DOWN){
    if (num > 1){
      num -= 1; 
    }
    showValues();
  }
}