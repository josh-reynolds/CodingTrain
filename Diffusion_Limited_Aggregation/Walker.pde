class Walker {
  PVector pos;
  boolean stuck;
  float r;
  color c;
  
  Walker(){
    pos = startLocation();
    stuck = false;
    r = 2;
    c = color(100, 255, 255, 255);
  }
  
  Walker(float _x, float _y, boolean _s){
    pos = new PVector(_x, _y);
    stuck = _s;
    r = calculateSize();
    c = calculateColor();
  }
  
  void walk(){
      PVector toCenter = PVector.sub(new PVector(width/2, height/2), pos);
      toCenter.normalize().div(5);
      pos.add(toCenter);
      
      PVector vel = PVector.random2D();
      pos.add(vel);
          
      pos.x = constrain(pos.x, 0, width);
      pos.y = constrain(pos.y, 0, height);
  }
  
  boolean isStuck(){
    for (int i = 0; i < tree.size(); i++){
      Walker w = tree.get(i);
      if (w.pos.dist(pos) < (w.r + r)){
        stuck = true;
        r = calculateSize();
        c = calculateColor();
        break;     
      }
    }
    return stuck;
  }
  
  color calculateColor(){
    float hue = map(distanceFromCenter(), 0, maxDistanceFromCenter(), 255, 0);
    return color(hue, 255, 255, 100);
  }
  
  float calculateSize(){
    return map(distanceFromCenter(), 0, maxDistanceFromCenter(), 12, 1);
  }
  
  float distanceFromCenter(){
    return pos.dist(center);
  }

  float maxDistanceFromCenter(){
    return sqrt(center.x * center.x + center.y * center.y);
  }
  
  void show(){
    strokeWeight(r);
    stroke(c);
    point(pos.x, pos.y);
  }

  PVector startLocation(){
    int edge = floor(random(4));
    float x;
    float y;
    
    if (edge == 0){
      x = random(0, width);
      y = 0;
    } else if (edge == 1){
      x = width;
      y = random(0, height);
    } else if (edge == 2){
      x = random(0, width);
      y = height;
    } else if (edge == 3){
      x = 0;
      y = random(0, height);
    } else {
      x = width/2;
      y = height/2;
    }
    return new PVector(x, y);
  }
}