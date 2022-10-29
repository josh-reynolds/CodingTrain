

class Cell {
  PVector pos;
  float r;
  PVector vel;
  color c;
  boolean remove;
  
  Cell(PVector p_, float r_, color c_){
    pos = p_.copy();
    r = r_;
    c = c_;
    remove = false;
  }
  
  void move(){
    vel = PVector.random2D();
    pos.add(vel);
  }
  
  void show(){
    fill(c);
    ellipse(pos.x, pos.y, r*2, r*2); 
  }
  
  void grow(){
    r += 0.05; 
  }
  
  boolean clicked(float mX, float mY){
    return (dist(mX, mY, pos.x, pos.y) < r);
  }
  
  Cell mitosis(){
    //PVector offset = new PVector(random(-10,10), random(-10,10));
    PVector offset = new PVector(random(-1*r,r), random(-1*r,r));
    return new Cell(pos.add(offset), r * .8, c);
  }
}