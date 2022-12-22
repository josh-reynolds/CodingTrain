class Asteroid{
  PVector pos;
  PVector vel;
  float radius;
  int total;
  float[] offsets;
  
  Asteroid(){
    pos = new PVector(random(width), random(height));
    vel = PVector.random2D();
    
    radius = random(15, 40);
    createOffsets();
  }
  
  Asteroid(PVector _pos, float _radius){
    pos = _pos;
    vel = PVector.random2D();
    radius = _radius;
    createOffsets();
  }
  
  void createOffsets(){
    float range = radius/5;
    total = floor(random(7, 15));      
    offsets = new float[total];
    for (int i = 0; i < total; i++){
      offsets[i] = random(-range, range) + radius;  
    }
  }
  
  void update(){
    pos.add(vel);
    edges();
  }
  
  ArrayList<Asteroid> breakup(){
    ArrayList<Asteroid> fragments = new ArrayList<Asteroid>();
    if (radius/2 > 6){
      for (int i = 0; i < 2; i++){
        fragments.add(new Asteroid(pos.copy(), radius/2));
      }
    }
    return fragments;
  }
   
  void edges(){
    if (pos.x > width ){ pos.x = 0; }
    if (pos.x < 0     ){ pos.x = width; }
    if (pos.y > height){ pos.y = 0; }
    if (pos.y < 0     ){ pos.y = height; }
  }
  
  void show(){
    pushMatrix();
      stroke(255);
      strokeWeight(1);
      noFill();
      translate(pos.x, pos.y);
      beginShape();
        for (int i = 0; i < total; i++){
          float angle = map(i, 0, total-1, 0, TWO_PI);
          float x = offsets[i] * cos(angle);
          float y = offsets[i] * sin(angle);
          vertex(x, y);
        }
      endShape(CLOSE);
    popMatrix();
  }
}