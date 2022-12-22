// Coding Train
// Coding Challenge 46.2 - Asteroids - Part 2
// https://www.youtube.com/watch?v=xTTuih7P0c0&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=59

// JavaScript conversion

Ship ship;
ArrayList<Laser> lasers;
ArrayList<Asteroid> asteroids;

void setup(){
  size(800, 800);
  ship = new Ship();

  lasers = new ArrayList<Laser>();

  asteroids = new ArrayList<Asteroid>();
  for (int i = 0; i < 10; i++){
    asteroids.add(new Asteroid());
  }
}

void draw(){
  background(0);
  
  for (int i = lasers.size()-1; i >= 0; i--){
    Laser l = lasers.get(i);
    if (l.lifespan > 100){
      lasers.remove(l);
    } else {
      l.update();
      l.show();
    }
    
    for (int j = asteroids.size()-1; j >= 0; j--){
      Asteroid a = asteroids.get(j);
      if (l.hits(a)){
        ArrayList<Asteroid> fragments = a.breakup();
        asteroids.addAll(fragments);
        asteroids.remove(a);
        lasers.remove(l);
      }
    }
  }

  ship.update();
  ship.show();
  
  for (Asteroid a : asteroids){
    if (ship.hits(a)){
      println("YOU DIED! (" + a + ")");
    }
    
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
  if (key == ' '){
    lasers.add(new Laser(ship.pos, ship.heading));
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