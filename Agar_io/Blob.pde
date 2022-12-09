class Blob {
  PVector pos;
  PVector vel;
  float r;
  color c;
  
  Blob(float x, float y, float radius){
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    r = radius;
    c = color(random(255), random(255), random(255));
  }
  
  void show(){
    fill(c);
    ellipse(pos.x, pos.y, r * 2,  r * 2);
  }
  
  void update(){
    PVector new_velocity = new PVector(mouseX - width/2, mouseY - height/2);
    new_velocity.setMag(3);
    vel.lerp(new_velocity, 0.1);
    pos.add(vel);
  }
  
  boolean eats(Blob b){
    float distance = PVector.dist(pos, b.pos);
    if (distance < r + b.r){
      float sum_area = (PI * r * r) + (PI * b.r * b.r);       
      blob.r = sqrt(sum_area / PI);

      c = lerpColor(c, b.c, 0.1);
      
      return true;
    } else {
      return false;
    }
  }
}