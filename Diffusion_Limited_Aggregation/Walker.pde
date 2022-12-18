class Walker {
  PVector pos;
  boolean stuck;
  
  Walker(){
    pos = new PVector(random(width), random(height));
    stuck = false;
  }
  
  Walker(float _x, float _y, boolean _s){
    pos = new PVector(_x, _y);
    stuck = _s;
  }
  
  void walk(){
    //if (!stuck){
      PVector vel = PVector.random2D();
      pos.add(vel);
      pos.x = constrain(pos.x, 0, width);
      pos.y = constrain(pos.y, 0, height);
      println("walking... (" + pos.x + ", " + pos.y + ")");
    //}
  }
  
  boolean stuck(){
    for (int i = 0; i < tree.size(); i++){
      Walker w = tree.get(i);
      if (w.pos.dist(pos) < r * 2){
        stuck = true;
        println("STUCK!");
        break;     
      }
    }
    return stuck;
  }
  
  void show(){
    if (stuck){
      stroke(255, 100);
      strokeWeight(r * 2);
    } else {
      stroke(255,0,0);
      strokeWeight(2);
    }
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
    }
    return new PVector(x, y);
  }
}