


class Snake {
  PVector direction;
  int total;
  
  // head is located at list.size()-1
  // tail is located at 0
  ArrayList<PVector> segments;
  
  Snake(){
    direction = new PVector(1, 0);
    total = 1;
    
    segments = new ArrayList<PVector>();
    segments.add(new PVector(width/2,height/2));
  }
  
  void update(){
    // generate a new head in the current direction and add to list
    // also constrain to screen boundaries
    PVector head = head();
    PVector next = new PVector(head.x + direction.x * scl, head.y + direction.y * scl);
    next.x = constrain(next.x, 0, width-scl);
    next.y = constrain(next.y, 0, height-scl);
    segments.add(next);
    
    // if list length is greater than total, trim the last segment (0)
    if (segments.size() > total){ segments.remove(0); }
    
    // check for collision with self
    death();
  }

  void show(){ 
    //for (PVector p : segments){
    for (int i = 0; i <= segments.size()-1; i++){
      float c;
      if (segments.size() == 1){
        c = 255;
      } else {
        c = map(i, 0, segments.size()-1, 125, 255);
      }
      fill(c);
      PVector p = segments.get(i);
      rect(p.x, p.y, scl, scl);  
    }
  }
  
  void death(){
    // check all segments except the head against the head  
    for (int i = 0; i < segments.size()-1; i++){
      PVector current = segments.get(i); 
      //if (current == head()){
      if (dist(current.x, current.y, head().x, head().y) < 1){
        
        println("You died!");
        println("Score : " + total);
        if (total > high_score){ 
          println("A new record!");
          high_score = total; 
        }
        println("High score : " + high_score);
        println("-----------------------");
        
        // reset to a new single-segment snake
        total = 1;
        segments = new ArrayList<PVector>();
        segments.add(current);
      }
    }
  }
  
  void dir(int dx, int dy){
    direction.x = dx;
    direction.y = dy;
  }
  
  boolean eat(PVector f_){
    PVector position = head();
    boolean d = (dist(position.x, position.y, f_.x, f_.y) < 1);
    if (d) { 
      total++;
    }
    return d;
  }
  
  PVector head(){
    return segments.get(segments.size()-1); 
  }
}