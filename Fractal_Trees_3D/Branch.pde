class Branch {
  Branch parent;
  PVector pos;
  PVector dir;
  int count;
  private PVector originalDir;
  
  Branch(Branch _parent, PVector _pos, PVector _dir){
    parent = _parent;
    pos = _pos;
    dir = _dir;
    originalDir = dir.copy();
    count = 0;
  }
  
  Branch(Branch _parent){
    parent = _parent;
    pos = PVector.add(_parent.pos, _parent.dir);
    dir = _parent.dir.copy();
    originalDir = dir.copy();
    count = 0;
  }
  
  public void reset(){
    dir = originalDir.copy();
    count = 0;
  }
}