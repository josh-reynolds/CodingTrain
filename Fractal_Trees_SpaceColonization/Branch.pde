class Branch {
  public Branch parent;
  public PVector pos;
  public PVector dir;
  public int count;
  
  Branch(Branch _parent, PVector _pos, PVector _dir){
    pos = _pos;
    dir = _dir;
    parent = _parent;
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