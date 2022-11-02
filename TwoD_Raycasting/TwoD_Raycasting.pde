// The Coding Train
// Coding Challenge 145 - 2D Raycasting
// https://www.youtube.com/watch?v=TOEi6T2mtHo&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=213

// NOTE: Processing doesn't like sketch names that start with
//  numbers, hence the odd name for this one.

ArrayList<Boundary> walls;
Particle particle;
float xoff = 0;
float yoff = 1000;

void setup(){
  size(1000,1000);
  walls = new ArrayList<Boundary>();
  for (int i = 0; i < 5; i++){
    float x1 = random(width);
    float y1 = random(height);
    float x2 = random(width);
    float y2 = random(height);
    walls.add(new Boundary(x1, y1, x2, y2)); 
  }
  //add screen boundaries
  walls.add(new Boundary(0, 0, width, 0));
  walls.add(new Boundary(width, 0, width, height));
  walls.add(new Boundary(width, height, 0, height));
  walls.add(new Boundary(0, height, 0, 0));
  
  particle = new Particle();
}

void draw(){
  background(0);
  for (Boundary w : walls){
    w.show(); 
  }

  particle.update(noise(xoff)*width, noise(yoff)*height);
  particle.look(walls);
  //particle.show();   // different effects possible by playing with show
                       // moving before update means it lags a bit behind, 
                       // almost like a lens flare
  
  xoff += 0.01;
  yoff += 0.01;
}