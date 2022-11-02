

// class should probably be renamed, this is now
// the first-person camera...
class Particle{
  PVector pos;
  ArrayList<Ray> rays;
  int FOV;
  float heading;
  
  Particle(int FOV_){
    pos = new PVector(sceneW/2, height/2);
    rays = new ArrayList<Ray>();
    FOV = FOV_;
    heading = 0;
    
    for (int a = -FOV/2; a < FOV/2; a += 1){
       rays.add(new Ray(pos, radians(a)));
    }
  }
  
  void rotate(float angle){
    heading += angle;
    for (Ray r : rays){
       r.rotate(angle);
    }
  }
  
  void move(float amount){
     PVector velocity = PVector.fromAngle(heading);
     velocity.setMag(amount);
     pos.add(velocity);
  }
  
  void show(){
    fill(255, 0, 0);
    ellipse(pos.x, pos.y, 4, 4);
    for (Ray r : rays){
      r.show();
    }
  }
  
  float[] look(ArrayList<Boundary> walls){
    float[] scene = new float[FOV];
    int i = 0;
    for (Ray r : rays){
      float record = Float.POSITIVE_INFINITY;
      PVector closest = null;
      for (Boundary w : walls){
        PVector p = r.cast(w);
        if (p != null){
          float d = dist(pos.x, pos.y, p.x, p.y);
          float a = r.dir.heading() - heading;
          if (!mousePressed){
            d *= cos(a);
          }
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
      scene[i] = record;
      i++;
    }
    return scene;
  }
  
  void update(float x, float y){
    pos.x = x;
    pos.y = y;
  }
}