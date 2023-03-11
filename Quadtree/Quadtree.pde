// Coding Train
// Coding Challenge 98.1 - Quadtree - Part 1
// https://www.youtube.com/watch?v=OJxEcs0w_kE&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=140

// JavaScript conversion

// he's intentionally avoiding P5 framework, so avoiding PVector etc.
// let's roll with it...

Tree qt;

void setup(){
  size(400, 400);
  background(125);
  
  Rectangle boundary = new Rectangle(width/2, height/2, width/2, height/2);
  qt = new Tree(boundary, 4);
}

void draw(){  
  qt.show();
}

void mouseClicked(){
  Point p = new Point(mouseX, mouseY);
  qt.insert(p);
}