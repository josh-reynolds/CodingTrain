// Coding Train
// Coding Challenge 46.1 - Asteroids - Part 1
// https://www.youtube.com/watch?v=hacZU523FyM&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=58

// JavaScript conversion

Ship ship;
ArrayList<Asteroid> asteroids;

void setup(){
  size(800, 800);
  ship = new Ship();
  asteroids = new ArrayList<Asteroid>();
  
  for (int i = 0; i < 10; i++){
    asteroids.add(new Asteroid());
  }
}

void draw(){
  background(0);

  ship.update();
  ship.show();
  
  for (Asteroid a : asteroids){
    a.update();
    a.show();
  }
}

void keyPressed(){
  if (key == 'a' || keyCode == LEFT){
    ship.setRotation(-0.05);
  }
  if (key == 'd' || keyCode == RIGHT){
    ship.setRotation(0.05);
  }
  if (key == 'w' || keyCode == UP){
    ship.boosting = true;
  }
}

void keyReleased(){
  if (key == 'a' || keyCode == LEFT || key == 'd' || keyCode == RIGHT){
    ship.setRotation(0);
  }
  if (key == 'w' || keyCode == UP){
    ship.boosting = false;
  }
}