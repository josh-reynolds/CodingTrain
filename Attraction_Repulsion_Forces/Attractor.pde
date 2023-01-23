// can be either attractor or repulsor, so not the best class name...

class Attractor {
  PVector pos;
  int direction = 1;
  
  Attractor(float x, float y, int dir){
    pos = new PVector(x, y);
    direction = dir;
  }

  void show(){
    noStroke();

    if (direction == 1){
      fill(0, 255, 0);
    } else if (direction == -1){
      fill(255, 0, 0);
    }
    
    ellipse(pos.x, pos.y, 10, 10);
  }
}