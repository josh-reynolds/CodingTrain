import peasy.*;

// Coding Train
// Coding Challenge 26 - 3D Supershapes
// https://www.youtube.com/watch?v=akM4wMZIBWg&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=29

PeasyCam cam;
PVector[][] globe;
int total = 75;

float offset = 0;

// ------------------------
//float r1m = 8.0;
//float r1n1 = 60.0;
//float r1n2 = 100.0;
//float r1n3 = 30.0;

//float r2m = 2.0;
//float r2n1 = 10.0;
//float r2n2 = 10.0;
//float r2n3 = 10.0;
// ------------------------

// ------------------------
float r1m = 7.0;
float r1n1 = 0.2;
float r1n2 = 1.7;
float r1n3 = 1.7;

float r2m = 7.0;
float r2n1 = 0.2;
float r2n2 = 1.7;
float r2n3 = 1.7;
// ------------------------

float a = 1.0;
float b = 1.0;

float mchange = 0;

void setup(){
  size(600, 600, P3D);
  cam = new PeasyCam(this, 500);
  colorMode(HSB);  
  globe = new PVector[total+1][total+1];
}

void draw(){
  background(0);
  //lights();

  //r1m = map(mouseX, 0, width, 0, 7);
  r1m = map(sin(mchange), -1, 1, 0, 7);
  r2m = r1m;

  mchange += 0.01;

  createGlobe();
  displayGlobe();
}

void createGlobe(){
  float radius = 200;
  for (int i = 0; i < total+1; i++){
    float lat = map(i, 0, total, -HALF_PI, HALF_PI);
    float r2 = supershape(lat, r2m, r2n1, r2n2, r2n3);

    for (int j = 0; j < total+1; j++){
      float lon = map(j, 0, total, -PI, PI);  
      float r1 = supershape(lon, r1m, r1n1, r1n2, r1n3);
      
      float x = radius * r1 * cos(lon) * r2 * cos(lat);
      float y = radius * r1 * sin(lon) * r2 * cos(lat);
      float z = radius * r2 * sin(lat);
      
      globe[i][j] = new PVector(x, y, z);
    }
  }  
}

float supershape(float angle, float _m, float _n1, float _n2, float _n3){
  float r = 1;
 
  float t1 = pow(abs((1/a) * cos(_m * angle / 4)), _n2);
  float t2 = pow(abs((1/b) * sin(_m * angle / 4)), _n3);
  r = pow(t1 + t2, (-1/_n1));
  
  return r;
}

void displayGlobe(){
  //noStroke();
  stroke(0);
  noFill();
  //fill(255);
  offset++;
  
  for (int i = 0; i < total; i++){
    float hue = map(i, 0, total, 0, 255*6);
    fill((hue + offset) % 255, 255, 255);

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