// Coding Train
// Coding Challenge 76 - 10PRINT
// https://www.youtube.com/watch?v=bEyTZ5ZZxZs&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=111

// JavaScript conversion

int spacing = 15;
int x = 0;
int y = 0;

void setup() {
  size(400, 400);
  background(0);
}

void draw(){
  stroke(255);

  if (random(1) < 0.5){
    line(x, y, x + spacing, y + spacing);
  } else {
    line(x + spacing, y, x, y + spacing);
  }

  x += spacing;
  if (x > width){
    y += spacing;
    x = 0;
  }
}