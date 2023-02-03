// Coding Train
// Coding Challenge 76 - 10PRINT
// https://www.youtube.com/watch?v=bEyTZ5ZZxZs&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=111

// JavaScript conversion

int spacing = 10;
float radius = spacing / 2;

int x = 0;
int y = 0;

void setup() {
  size(400, 400);
  background(0);
}

void draw(){
  stroke(255);
  noFill();
  ellipseMode(CORNER);
  
  if (random(1) < 0.5){
    //line(x, y, x + spacing, y + spacing);
    arc(x - radius, y - radius, 
        radius * 2, radius * 2, 
        0, HALF_PI, OPEN);
    arc(x + spacing - radius, y + spacing - radius, 
        radius * 2, radius * 2, 
        PI, PI + HALF_PI, OPEN);
  } else {
    //line(x + spacing, y, x, y + spacing);
    arc(x + spacing - radius, y - radius, 
        radius * 2, radius * 2, 
        HALF_PI, PI, OPEN);
    arc(x - radius, y + spacing - radius, 
        radius * 2, radius * 2, 
        PI + HALF_PI, TWO_PI, OPEN);
  }

  x += spacing;
  if (x > width){
    y += spacing;
    x = 0;
  }
}