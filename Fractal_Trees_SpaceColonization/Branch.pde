class Branch {
  public Branch parent;
  public PVector pos;
  public PVector dir;
  public int count;
  private PVector originalDir;
  
  Branch(Branch _parent, PVector _pos, PVector _dir){
    parent = _parent;
    pos = _pos;
    dir = _dir;
    originalDir = dir.copy();
    count = 0;
  }
  
  public void reset(){
    dir = originalDir.copy();
    count = 0;
  }
  
  public Branch next(){
    Branch nextBranch = new Branch(this,
                                   PVector.add(pos, dir),
                                   dir.copy());
    return nextBranch;
  }

  public void show(){
    stroke(255);
    if (parent != null){
      line(pos.x, pos.y, parent.pos.x, parent.pos.y);
    }
  }
}