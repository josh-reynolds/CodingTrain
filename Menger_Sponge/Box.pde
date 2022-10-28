


class Box {
  PVector pos;
  float r;
  
  Box(float x_, float y_, float z_, float r_){
    pos = new PVector(x_, y_, z_);
    r = r_;
  }
  
  ArrayList<Box> generate(){
    ArrayList<Box> boxes = new ArrayList<Box>();
    for (int x = -1; x < 2; x++){
      for (int y = -1; y < 2; y++){
        for (int z = -1; z < 2; z++){
          int sum = abs(x) + abs(y) + abs(z);
          float newR = r/3;
          
          if (sum > 1){
            Box b = new Box(pos.x + x*newR,
                            pos.y + y*newR,
                            pos.z + z*newR,
                            newR);
          boxes.add(b);
          }
        }
      }
    }
    return boxes;
  }
  
  void show(){
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    fill(225,225,0);
    box(r);
    popMatrix();
  }
}