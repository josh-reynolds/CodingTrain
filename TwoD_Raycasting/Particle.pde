


class Particle{
  PVector pos;
  ArrayList<Ray> rays;
  
  Particle(){
    pos = new PVector(width/2, height/2);
    rays = new ArrayList<Ray>();
    for (int a = 0; a < 360; a += 1){
       rays.add(new Ray(pos, radians(a)));
    }
  }
  
  void show(){
    fill(255, 0, 0);
    ellipse(pos.x, pos.y, 4, 4);
    for (Ray r : rays){
      r.show();
    }

  }
  
  void look(ArrayList<Boundary> walls){
    for (Ray r : rays){
      float record = Float.POSITIVE_INFINITY;
      PVector closest = null;
      for (Boundary w : walls){
        PVector p = r.cast(w);
        if (p != null){
          float d = dist(pos.x, pos.y, p.x, p.y);
          if (d < record){ 
            record = d;
            closest = p;
          }
        }
      }
      if (closest != null){
        stroke(255, 100);
        line(pos.x, pos.y, closest.x, closest.y);        
      }
    }
  }
  
  void update(float x, float y){
    pos.x = x;
    pos.y = y;
  }
}