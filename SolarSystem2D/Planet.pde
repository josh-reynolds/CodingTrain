

class Planet{
  float radius;
  float distance;
  float angle;
  Planet[] satellites;
  float orbitSpeed;
  
  Planet(float r_, float d_, float o_){
    //println("Calling ctor");
    radius = r_;
    distance = d_;
    angle = random(TWO_PI);
    //println("Angle: " + angle);
    orbitSpeed = o_;
  }
  
  void orbit(){
    angle = angle + orbitSpeed;
    if (satellites != null){
      //println("satellites.length = " + satellites.length);
      for (int i = 0; i < satellites.length; i++){
        satellites[i].orbit(); 
      }
    }
  }
  
  void spawnSatellites(int total, int level){
    //println("Calling spawn");
    satellites = new Planet[total];
    for (int i = 0; i < satellites.length; i++){
      float r = radius/(level*1.2);
      float d = random(50, 150);
      float o = random(-0.1, 0.1);
      satellites[i] = new Planet(r, d/level, o);
      if (level < 2){
        int num = int(random(0,4));
        satellites[i].spawnSatellites(num, level+1);
      }
    }
  }
  
  void show(){
    //println("Calling show");  
    
    // (failed) attempt to draw orbits, come back to this...
    //stroke(255);
    //noFill();
    //ellipse(0, 0, distance, distance);
    

    pushMatrix();
      fill(255,125);
      rotate(angle);
      translate(distance, 0);
      ellipse(0, 0, radius*2, radius*2); 
    
      if (satellites != null){
        //println("satellites.length = " + satellites.length);
        for (int i = 0; i < satellites.length; i++){
          satellites[i].show(); 
        }
      }
    popMatrix();
  }
}