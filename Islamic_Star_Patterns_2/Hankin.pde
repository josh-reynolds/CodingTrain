class Hankin {
  PVector start;
  PVector direction;
  PVector end;
  
  Hankin(PVector _start, PVector _direction){
    start = _start;
    direction = _direction;
    end = PVector.add(start, direction);
  }
  
  void show(){
    stroke(255, 0, 255);
    line(start.x, start.y, end.x, end.y);
  }
}