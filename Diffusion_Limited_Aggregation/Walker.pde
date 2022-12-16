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
    stroke(255,0,0);
    strokeWeight(2);
    point(pos.x, pos.y);
  }
}