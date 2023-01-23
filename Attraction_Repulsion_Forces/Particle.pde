class Particle {
  PVector pos;
  PVector prev;
  PVector vel;
  PVector acc;
  
  color col;
  int alpha = 200;
  
  Particle(float x, float y){
    pos = new PVector(x, y);
    prev = new PVector(x, y);
    vel = new PVector();
    acc = new PVector();
    col = color(random(255), random(255), random(255), alpha);
  }
  
  void attracted(Attractor target){
    PVector force = PVector.sub(target.pos, pos);

    float dSquared = force.magSq();
    dSquared = constrain(dSquared, 25, 500);
    float G = 50;
    float strength = G / dSquared * target.direction;
    //float strength = G / dSquared;
    
    //float d = force.mag();
    //d = constrain(d, 5, 25);
    //float G = 5;
    //float strength = G / (d * d);
    //float strength = G / (d * d * target.direction);

    force.setMag(strength);
    
    //if (d < 20){
    //  force.mult(-5);
    //}

    acc.add(force);
  }
  
  void update(){
    prev.x = pos.x;
    prev.y = pos.y;
    pos.add(vel);
    vel.add(acc);
    acc.setMag(0);    
    vel.limit(10);
  }
  
  void show(){   
    stroke(col);
    strokeWeight(2);
    line(pos.x, pos.y, prev.x, prev.y);
  }
}