

class Cell {
 
  public float i;
  public float j;
  
  private boolean top;
  private boolean right;
  private boolean bottom;
  private boolean left;
  
  Cell(float i, float j){
    this.i = i;
    this.j = j;
    
    top = true;
    right = true;
    bottom = true;
    left = true;
  }
  
  // using globals, ugly...
  public void show(){
    float x = this.i*w;
    float y = this.j*w;
    stroke(255);
    //noFill();
    //rect(x,y,w,w);
    
    // TOP
    if (top){
      line(x,y,x+w,y);
    }
    
    // RIGHT
    if (right){
      line(x+w,y,x+w,y+w);
    }
    
    // BOTTOM
    if (bottom){
      line(x+w,y+w,x,y+w);
    }
    
    // LEFT
    if (left){
      line(x,y+w,x,y);
    }
  }
}