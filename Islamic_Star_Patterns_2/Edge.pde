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
    
    // Law of sines
    float interior = (sides - 2) * PI / sides;
    float alpha = interior / 2;
    //float beta = PI - angle - alpha;
    float elen = v1.mag() + delta;
    float hlen = (elen * sin(alpha)) / sin(angle);
    
    v1.setMag(hlen);
    v2.setMag(hlen);
    
    h1 = new Hankin(offset1, v1);
    h2 = new Hankin(offset2, v2);
  }
}