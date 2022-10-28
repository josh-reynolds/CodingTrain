

class Shot{
  float x;
  float y;
  float size = 10;
  int direction;
  
  Shot(float x_, float y_){
    x = x_;
    y = y_;
    direction = -5;    
  } 
  
  void update(){
    y += direction;
  }
  
  void show(){
    fill(244, 239, 36);
    rect(x, y, size/2, size); 
  }
  
  boolean hits(Invader inv){
    return (dist(x, y, inv.x, inv.y) < (size/2 + inv.size/2)); 
  }
}