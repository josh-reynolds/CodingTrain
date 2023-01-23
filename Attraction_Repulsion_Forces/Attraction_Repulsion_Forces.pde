// Coding Train
// Coding Challenge 56 - Attraction and Repulsion Forces
// https://www.youtube.com/watch?v=OAcXnzRNiCY&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=73

// JavaScript conversion

ArrayList<Attractor> attractors;
ArrayList<Particle> particles;

void setup(){
  size(400, 400);
  background(255);
  
  attractors = new ArrayList<Attractor>();
  
  particles = new ArrayList<Particle>();
  for (int i = 0; i < 500; i++){
    particles.add(new Particle(random(width), random(height)));
  }
  
  println("Right mouse click to add an attractor.");
  println("Left mouse click to add a repulsor.");
}

void draw(){
  background(51);
  for (Attractor a : attractors){
    a.show();
  }
  
  for (Particle p : particles){
    for (Attractor a : attractors){
      p.attracted(a);
    }
    p.update();
    p.show();
  }
}

void mouseClicked(){
  if (mouseButton == LEFT){
    attractors.add(new Attractor(mouseX, mouseY, 1));
  }
  if (mouseButton == RIGHT){
    attractors.add(new Attractor(mouseX, mouseY, -1));
  }
}