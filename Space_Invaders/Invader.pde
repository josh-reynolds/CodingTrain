

class Invader{
  float x;
  float y;
  float size = 25;
  float speed;
  int direction;
  
  Invader(float x_, float y_){
    x = x_;
    y = y_;
    speed = 1;
    direction = 1;
  }
  
  void update(){
    x += speed * direction;
  }
  
  void shiftDown(){
    y += size;
    direction *= -1;    
  }
  
  void show(){
    fill(255, 0, 200);
    ellipse(x, y, size, size); 
  }
}