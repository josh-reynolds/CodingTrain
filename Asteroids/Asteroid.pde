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
    total = floor(random(7, 15));      
    offsets = new float[total];
    for (int i = 0; i < total; i++){
      offsets[i] = random(-10, 10) + radius;  
    }
  }
  
  void update(){
    pos.add(vel);
    edges();
  }
  
  void edges(){
    if (pos.x > width ){ pos.x = 0; }
    if (pos.x < 0     ){ pos.x = width; }
    if (pos.y > height){ pos.y = 0; }
    if (pos.y < 0     ){ pos.y = height; }
  }
  
  void show(){
    stroke(255);
    noFill();
    pushMatrix();
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