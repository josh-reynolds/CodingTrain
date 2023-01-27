class Vehicle {
  PVector pos;
  PVector vel;
  PVector acc;
  
  int size = 10;
  
  PVector target;
  int maxspeed = 10;
  float maxforce = 1;
  float threshold = 100;
  
  Vehicle(float x, float y){
    pos = new PVector(random(width), random(height));
    vel = new PVector();
    acc = new PVector();
    target = new PVector(x, y);
  }
  
  void behaviors(){
    //PVector seek = seek(target);
    PVector arrive = arrive(target);    
    PVector flee = flee(new PVector(mouseX, mouseY));
    
    arrive.mult(1);
    flee.mult(5);
    
    //applyForce(seek);    
    applyForce(arrive);
    applyForce(flee);
  }
  
  void applyForce(PVector force){
    acc.add(force);
  }
  
  PVector seek(PVector t){
    PVector desired = PVector.sub(t, pos);
    desired.setMag(this.maxspeed);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(this.maxforce);
    return steer;
  }

  PVector flee(PVector t){
    PVector desired = PVector.sub(t, pos);
    float distance = desired.mag();
    if (distance < threshold){
      desired.setMag(this.maxspeed);
      desired.mult(-1);
      PVector steer = PVector.sub(desired, vel);
      steer.limit(this.maxforce);
      return steer;
    } else {
      return new PVector();
    }
  }

  PVector arrive(PVector t){
    PVector desired = PVector.sub(t, pos);
    float distance = desired.mag();
    float speed = maxspeed;
    if (distance < threshold){
      speed = map(distance, 0, threshold, 0, maxspeed);
    }
    desired.setMag(speed);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxforce);
    return steer;
  }
  
  void update(){
    vel.add(acc);
    pos.add(vel);
    acc.setMag(0);
  }
  
  void show(){
    fill(255);
    noStroke();
    ellipse(pos.x, pos.y, size, size);
  }
}