class Laser {
  PVector pos;
  PVector vel;
  int lifespan;
  
  Laser(PVector shipPos, float shipHeading){
    pos = shipPos.copy();
    vel = PVector.fromAngle(shipHeading);
    vel.mult(10);
    lifespan = 0;
  }
  
  void update(){
    pos.add(vel);
    lifespan++;
  }
  
  boolean hits(Asteroid a){
    float distance = pos.dist(a.pos);
    return distance < a.radius;   
  }
    
  void show(){
    pushMatrix();
      stroke(255);
      strokeWeight(6);
      noFill();
      translate(pos.x, pos.y);
      point(0, 0);
    popMatrix();
  }
}