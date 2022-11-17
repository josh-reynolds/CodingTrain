import peasy.*;

// Coding Train
// Coding Challenge 25 - Spherical Geometry
// https://www.youtube.com/watch?v=RkuBWEkBrZA&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=28

PeasyCam cam;
PVector[][] globe;
int total = 200;

void setup(){
  size(600, 600, P3D);
  cam = new PeasyCam(this, 500);
  colorMode(HSB);
  noStroke();
  
  globe = new PVector[total+1][total+1];

  float radius = 200;
  for (int i = 0; i < total+1; i++){
    float lat = map(i, 0, total, 0, PI);
    for (int j = 0; j < total+1; j++){
      float lon = map(j, 0, total, 0, TWO_PI);  
      
      float x = radius * sin(lat) * cos(lon);
      float y = radius * sin(lat) * sin(lon);
      float z = radius * cos(lat);
      
      globe[i][j] = new PVector(x, y, z);

      // add "wrinkles"
      PVector v = PVector.random3D();
      v.mult(5);
      globe[i][j].add(v);
    }
  }
}

void draw(){
  background(0);
  lights();

  for (int i = 0; i < total; i++){
    float hue = map(i, 0, total, 0, 255*6);
    fill(hue % 255, 255, 255);

    beginShape(TRIANGLE_STRIP);
    for (int j = 0; j < total+1; j++){       
      PVector v1 = globe[i][j];
      vertex(v1.x, v1.y, v1.z);
      
      PVector v2 = globe[i+1][j];
      vertex(v2.x, v2.y, v2.z);
    }
    endShape();
  }
}