// Coding Train
// Coding Challenge 1 - Starfield
// https://www.youtube.com/watch?v=17WoOqgXsRM&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=1


Star[] stars = new Star[800];

float speed;

void setup(){
  size(800, 800);
  for (int i = 0; i < stars.length; i++){
    stars[i] = new Star();
  }
}

void draw(){
  speed = map(mouseX, 0, width, 0, 50);
  background(0);
  translate(width/2, height/2);
  for (int i = 0; i < stars.length; i++){
    stars[i].update();
    stars[i].show();
  }
}