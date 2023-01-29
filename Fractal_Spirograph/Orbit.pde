int k = -4;

class Orbit {
  PVector pos;
  float r;
  Orbit parent;
  Orbit child;
  float speed;
  float angle;
  int level;
  
  Orbit(PVector _pos, float _r){
    this(_pos, _r, null, 0);
  }
  
  Orbit(PVector _pos, float _r, Orbit _p, int _l){
    pos = _pos;
    r = _r;
    parent = _p;
    child = null;
    angle = -PI/2;
    level = _l;
    
    speed = radians(pow(k, level-1)) / resolution;
  }
  
  Orbit addChild(){
    float newR = r / 3;
    float newX = pos.x + r + newR;
    float newY = pos.y;
    child = new Orbit(new PVector(newX, newY), newR, this, level + 1);
    return child;
  }
  
  void update(){
    if (level > 0){
      float rsum = r + parent.r;
      float newX = rsum * cos(angle);
      float newY = rsum * sin(angle);
      pos = new PVector(parent.pos.x + newX, 
                        parent.pos.y + newY);
      angle += speed;
    }
    
    if (child != null){
      child.update();
    }
  }
  
  void show(){
    stroke(255,100);
    strokeWeight(1);
    noFill();
    ellipse(pos.x, pos.y, r * 2, r * 2);
    
    if (child != null){
      child.show();
    }
  }
}