// Coding Train
// Coding Challenge 17 - Fractal Trees - Space Colonization
// https://www.youtube.com/watch?v=kKT0v3qhIQY&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=20

// Again javascript, recoding in Java

Tree t;
int max_dist = 100;
int min_dist = 10;

void setup(){
  size(400,400);

  t = new Tree();
}

void draw(){
  background(51);

  t.show();
  t.grow();
}