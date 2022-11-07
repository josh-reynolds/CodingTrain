class Leaf{
  public PVector pos;
  public Boolean reached;
  
  Leaf(){
    pos = new PVector(random(width), random(height-100));
    reached = false;
  }
  
  public void show(){
    fill(255);
    noStroke();
    ellipse(pos.x, pos.y, 4, 4);
  }
}