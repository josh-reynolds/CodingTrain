class Particle {
  PVector pos;
  PVector vel; 
  PVector acc;
  Boolean firework;
  int lifespan;
  float hue;
  
  Particle(float x, float y, float z, float _hue, Boolean isFirework){
    pos = new PVector(x, y, z);
    firework = isFirework;
    lifespan = 255;
    hue = _hue;
    
    if (firework){
      vel = new PVector(0, random(-25, -10));
    } else {
      vel = PVector.random3D();
      vel.mult(random(1,6));
    }
    acc = new PVector(0, 0);
  }
  
  void update(){
    if (!firework){
      vel.mult(0.9);
      lifespan -= 2.5; //int(random(1,10));
    }
    vel.add(acc); 
    pos.add(vel);
    acc.mult(0);
  }
  
  void applyForce(PVector force){
    acc.add(force);
  }
  
  void show(){
    if (!firework){
      strokeWeight(3);
      stroke(hue, 255, 255, lifespan);
    } else {
      strokeWeight(6);
      stroke(hue,255, 255);
    }
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    point(0,0);
    popMatrix();
  }
  
  Boolean done(){
    if (lifespan < 0){
      return true;
    } else {
      return false; 
    }
  }
}