// The Coding Train
// Coding Challenge 50.1 - Animated Circle Packing
// https://www.youtube.com/watch?v=QHEQuoIKgNE&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=63

ArrayList<Circle> circles;
ArrayList<PVector> spots;
PImage img;

void setup() {
  size(900,401);
  img = loadImage("2022.png");
  img.loadPixels();
  
  spots = new ArrayList<PVector>();
  for (int x = 0; x < img.width; x++){
    for (int y = 0; y < img.height; y++){
      int index = x + y * img.width;
      color c = img.pixels[index];
      float b = brightness(c);
      if (b > 1){
        spots.add(new PVector(x,y));
      }
    }
  }
  //println(spots.size());
  circles = new ArrayList<Circle>();
}

void draw() {
  //background(img);
  //frameRate(5);  
  background(0);
  
  int total = 10;
  int count = 0;
  int attempts = 0;
  while (count < total){
    Circle newC = newCircle();    
    if (newC != null){ 
      circles.add(newC);
      count++;
    }
    attempts++;
    if (attempts > 1000){
      noLoop(); 
      println("FINISHED");
      break;
    }
  }
  
  for (Circle c : circles){ 
    if (c.growing){
      if (c.edges()){ 
        c.growing = false; 
      } else {
        for (Circle other : circles){
          if (c != other){ 
            float d = dist(c.x, c.y, other.x, other.y);
            if (d - 2 < c.r + other.r){ 
              c.growing = false;
              //other.growing = false;
              break;
            }
          }
        }
      }
    }
    c.show();
    c.grow();
  }
}

Circle newCircle(){
  int r = int(random(0, spots.size()));
  PVector spot = spots.get(r);
  
  float x = spot.x;
  float y = spot.y;
  boolean valid = true;

  for (Circle c : circles){
    float d = dist(x,y,c.x,c.y);
    if (d < c.r + 2){
      valid = false;
      break;
    }
  }
  
  if (valid){
    return new Circle(x, y);
  } else {
    return null; 
  }
}