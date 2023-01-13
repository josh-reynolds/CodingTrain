class Pipe {
  float top; 
  float bottom;
  float x;
  float w;
  float speed;
  Boolean highlight;

  Pipe(){
    float spacing =  random(80, height/2);    
    top = random(10, height - spacing + 10); 
    bottom = height - top - spacing + 10;
    
    x = width;
    w = 50;
    speed = 2;  
    highlight = false;
  }
  
  void update(){
    x -= speed;
  }
  
  Boolean isOffscreen(){
    return (x < -w);
  }
  
  void show(){
    fill(255);
    noStroke();
    if (highlight){
      fill(255, 0, 0);
    }
    rect(x, 0, w, top);
    rect(x, height - bottom, w, bottom);
  }
  
  Boolean hit(Bird b){
    if (b.x > x && b.x < x + w && (b.y < top || b.y > height - bottom)){
      highlight = true;
      return true;
    } else {
      highlight = false;
      return false;
    }
  }
}