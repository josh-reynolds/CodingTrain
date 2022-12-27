// Coding Train
// Coding Challenge 52 - Random Walker
// https://www.youtube.com/watch?v=l__fEY1xanY&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=68

// JavaScript conversion

PVector dot;

void setup(){
  background(51);
  size(400, 400);
  dot = new PVector(width/2, height/2);
}

void draw(){
  int choice = floor(random(0,4));
  switch (choice){
    case 0:
      dot.x++;
      break;
    case 1:
      dot.x--;
      break;
    case 2:
      dot.y++;
      break;
    case 3:
      dot.y--;
      break;
  }

  //noStroke();
  stroke(50,50);
  strokeWeight(0.1);
  fill(255,50);
  ellipse(dot.x, dot.y, 20, 20);
}