

class Planet{
  float radius;
  float distance;
  float angle;
  Planet[] satellites;
  float orbitSpeed;
  PVector v;

  PShape globe;
  
  Planet(float r_, float d_, float o_, PImage img_){
    //println("Calling ctor");
    radius = r_;
    distance = d_;
    angle = random(TWO_PI);
    //println("Angle: " + angle);
    orbitSpeed = o_;
    v = PVector.random3D();
    v.mult(distance);
    
    noStroke();
    noFill();
    globe = createShape(SPHERE, radius);
    globe.setTexture(img_);
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
      float r = radius/(level*2);
      float d = random((radius + r), (radius + r)*2);
      float o = random(-0.1, 0.1);
      //float o = random(1, 1);
      PImage img = textures[int(random(textures.length))];
      satellites[i] = new Planet(r, d, o, img);
      if (level < 2){
        int num = int(random(0,2));
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
      PVector v2 = new PVector(1, 0, 1);
      PVector p = v.cross(v2);

      rotate(angle, p.x, p.y, p.z);
      
      // draw the rotation vectors
      //stroke(255);
      //line(0,0,0,v.x,v.y,v.z);
      //line(0,0,0,p.x,p.y,p.z);
      
      translate(v.x, v.y, v.z);
      noStroke();
      fill(255);
      //sphere(radius);
      shape(globe);
    
      if (satellites != null){
        //println("satellites.length = " + satellites.length);
        for (int i = 0; i < satellites.length; i++){
          satellites[i].show(); 
        }
      }
    popMatrix();
  }
}