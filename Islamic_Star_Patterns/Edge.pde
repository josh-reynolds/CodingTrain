class Edge {
  PVector a;
  PVector b; 
  PVector mid;
  
  Hankin h1;
  Hankin h2;
  
  Edge(PVector _a, PVector _b){
    a = _a;
    b = _b;
  }
  
  void show(){
    //stroke(255);
    //line(a.x, a.y, b.x, b.y);
    //fill(255, 0, 255);
    //ellipse(mid.x, mid.y, 8, 8);
    h1.show();
    h2.show();
  }
  
  void hankin(){
    mid = PVector.add(a, b);
    mid.mult(0.5);
    
    PVector v1 = PVector.sub(a, mid);
    PVector v2 = PVector.sub(b, mid);

    PVector offset1 = mid;
    PVector offset2 = mid;

    if (delta > 0){
      v1.setMag(delta);
      v2.setMag(delta);
      
      offset1 = PVector.add(mid, v2);
      offset2 = PVector.add(mid, v1);
    }

    v1.rotate(radians(-angle));
    v2.rotate(radians(angle));
    
    h1 = new Hankin(offset1, v1);
    h2 = new Hankin(offset2, v2);
  }
  
  void findEnds(Edge e){
    h1.findEnd(e.h1);
    h1.findEnd(e.h2);
    h2.findEnd(e.h1);
    h2.findEnd(e.h2);
  }
}