class Rocket {
  PVector pos;
  PVector vel;
  PVector acc;
  DNA dna;
  float fitness;
  Boolean completed;
  Boolean crashed;
  
  Rocket(){
    pos = new PVector(width/2, height);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    dna = new DNA();
    fitness = 0;
    completed = false;
    crashed = false;
  }
  
  // need to review Java constructor overloads,
  // too much duplication here
  Rocket(DNA _dna){
    pos = new PVector(width/2, height);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    dna = _dna;
    fitness = 0;
    completed = false;
    crashed = false;
  }
  
  void applyForce(PVector force){
    acc.add(force); 
  }
  
  void update(){
    float d = dist(pos.x, pos.y, target.x, target.y);
    if (d < 10){
      completed = true;
      pos = target.copy();
    }

    if (pos.x > rx && pos.x < rx + rw && pos.y > ry && pos.y < ry + rh){
      crashed = true;
    }
    if (pos.x < 0 || pos.x > width || pos.y < 0 || pos.y > height){
      crashed = true;
    }

    applyForce(dna.genes[count]);
    if (!completed && !crashed){
      vel.add(acc);
      pos.add(vel);
      acc.mult(0);
      vel.limit(4);
    }
  }
  
  void show(){
    pushMatrix();
    noStroke();
    fill(255, 150);
    translate(pos.x, pos.y);
    rotate(vel.heading());
    rectMode(CENTER);
    rect(0, 0, 25, 5);
    popMatrix();
  }
  
  void calcFitness(){
    float d = dist(pos.x, pos.y, target.x, target.y);

    fitness = map(d, 0, width, width, 0);   
    
    if (completed){
      fitness *= 3;
    }
    if (crashed){
      fitness /= 10;
    }
  }
}