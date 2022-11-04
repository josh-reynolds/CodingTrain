class Branch {
  public PVector begin;
  public PVector end;
  public Boolean finished;
  
  Branch(PVector begin, PVector end){
    this.begin = begin;
    this.end = end;
    this.finished = false;
  }
  
  void show(){
    stroke(255);
    line(this.begin.x,
         this.begin.y,
         this.end.x,
         this.end.y);
  }
  
  void jitter(){
    this.end.x += random(-1, 1);
    this.end.y += random(-1, 1);
  }
  
  Branch growRight(){
      PVector dir = PVector.sub(this.end, this.begin);
      dir.rotate(PI/5);
      dir.mult(0.67);
      PVector newEnd = PVector.add(this.end, dir);
      Branch right = new Branch(this.end, newEnd);
      return right;
  }

  Branch growLeft(){
    PVector dir = PVector.sub(this.end, this.begin);
    dir.rotate(-PI/5);
    dir.mult(0.67);
    PVector newEnd = PVector.add(this.end, dir);
    Branch left = new Branch(this.end, newEnd);
    return left;
  }
}