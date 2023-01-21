class Hankin {
  PVector start;
  PVector direction;
  PVector b;
  PVector end;
  float prevD;
  
  Hankin(PVector _start, PVector _direction){
    start = _start;
    direction = _direction;
    b = PVector.add(start, direction);
  }
  
  void show(){
    stroke(255, 0, 255);
    line(start.x, start.y, end.x, end.y);
    //line(start.x, start.y, b.x, b.y);
    //fill(255, 0, 255);
    //ellipse(b.x, b.y, 8, 8);
    //if (this.end != null){
    //  fill(255, 255, 0);
    //  ellipse(end.x, end.y, 8, 8);
    //}
  }
  
  // line-line intersection from
  // http://paulbourke.net/geometry/pointlineplane
  void findEnd(Hankin h){
    float den = (h.direction.y * direction.x) - (h.direction.x * direction.y);
    float numA = (h.direction.x * (start.y - h.start.y)) - (h.direction.y * (start.x - h.start.x)); 
    float numB = (direction.x * (start.y - h.start.y)) - (direction.y * (start.x - h.start.x));
    
    float ua = numA / den;
    float ub = numB / den;
    
    float x = start.x + (ua * direction.x);
    float y = start.y + (ua * direction.y);
    
    if (ua > 0 && ub > 0){
      PVector candidate = new PVector(x, y);
      float d1 = PVector.dist(candidate, start); 
      float d2 = PVector.dist(candidate, h.start);
      float totalDistance = d1 + d2;
      float diff = abs(d1 - d2);
      
      if (diff < 0.001){
        if (end == null){
          end = candidate;
          this.prevD = totalDistance;
        } else if (totalDistance < prevD){
          end = candidate;
          this.prevD = totalDistance;
        }
      }
    }
  }
}