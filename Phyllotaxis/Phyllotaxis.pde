// Coding Train
// Coding Challenge 30 - Phyllotaxis
// https://www.youtube.com/watch?v=KWoJgHFYWxY&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=33

// another JavaScript conversion

// phi = n * 137.5 degrees
// r = c * sqrt(n)

// got this working from his description of the formulae
// let's see what his implementation is...
// ------------------------------------
//size(400, 400);

//int limit = 200;
//int c = 10;

//translate(width/2, height/2);
//for (int n = 0; n < limit; n++){
//  float phi = n * 137.5;
//  float r = c * sqrt(n);
  
//  float x = r * cos(phi);
//  float y = r * sin(phi);
  
//  ellipse(x, y, c, c);
//}
// ------------------------------------
//
// his animates over time, but otherwise the same
// and I missed the degrees-radians conversion

int n = 0;
int c = 4;

void setup(){
  size(400, 400);
  colorMode(HSB);
  background(0);
}

void draw(){
  float a = n * radians(137.5);
  float r = c * sqrt(n);

  float x = r * cos(a) + width/2;
  float y = r * sin(a) + height/2;
  
  fill((a - r) % 255, 255, 255);
  noStroke();
  ellipse(x, y, 4, 4);

  n++;
}