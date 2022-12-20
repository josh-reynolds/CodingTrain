class Ship {
  PVector pos;
  PVector vel;
  float heading;
  float radius;
  float rotation;
  boolean boosting;
  
  Ship(){
    pos = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    radius = 20;
    heading = 0;
    rotation = 0;
    boosting = false;
  }
  
  void turn(){
    heading += rotation;
  }
  
  void update(){
    turn();
    boost();
    pos.add(vel);
    vel.mult(0.99);
    edges();
  }
  
  void boost(){
    if (boosting){
      PVector force = PVector.fromAngle(heading);
      force.mult(0.5);
      vel.add(force);
    }
  }
  
  void edges(){
    if (pos.x > width ){ pos.x = 0; }
    if (pos.x < 0     ){ pos.x = width; }
    if (pos.y > height){ pos.y = 0; }
    if (pos.y < 0     ){ pos.y = height; }
  }
  
  void setRotation(float angle){
    rotation = angle;
  }
  
  void show(){
    stroke(255);
    noFill();
    pushMatrix();
      translate(pos.x, pos.y);
      rotate(heading + PI/2);
      triangle(-radius/2, radius/2, radius/2, radius/2, 0, -radius);
    popMatrix();
  }
  
}