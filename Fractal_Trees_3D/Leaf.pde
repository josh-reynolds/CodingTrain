class Leaf{
  PVector pos;
  Boolean reached = false;
  
  Leaf(){
    pos = PVector.random3D();
    pos.mult(random(width/2));
    pos.y -= height/4;
  }
  
  void reached(){
    reached = true;
  }
  
  public void show(){
    fill(255);
    noStroke();
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    ellipse(0, 0, 4, 4);
    //sphere(4);     // very expensive to render, and not necessary
                     // since leaves are temporary while algorithm runs
    popMatrix();
  }
}