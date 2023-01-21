// Coding Train
// Coding Challenge 54.1 - Islamic Star Patterns
// https://www.youtube.com/watch?v=sJ6pMLp_IaI&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=70

// JavaScript conversion

// https://cs.uwaterloo.ca/~csk/publications/Papers/kaplan_2005.pdf
// http://paulbourke.net/geometry/pointlineplane

ArrayList<Polygon> polys;

float angle = 60;    // in degrees
float delta = 10;
int inc = 40;

void setup(){
  size(400, 400);
  background(51);  

  polys = new ArrayList<Polygon>();

  for (int x = 0; x < width; x += inc){
    for (int y = 0; y < height; y += inc){
      Polygon p = new Polygon();
      p.addVertex(x,       y);
      p.addVertex(x + inc, y);
      p.addVertex(x + inc, y + inc);
      p.addVertex(x,       y + inc);
      p.close();
      polys.add(p);
    }
  }
  
  println("Mouse buttons to adjust delta.");
  println("Up/down arrows to adjust angle.");
}

void draw(){
  background(0);
  
  for (Polygon p : polys){
    p.hankin();
    p.show();
  }
}

void mouseClicked(){
  if (mouseButton == LEFT){
    if (delta <= inc/2){
      delta += 5;
    }
  }
  if (mouseButton == RIGHT){
    if (delta >= 5){
      delta -= 5;
    }
  }
  println("Delta is " + delta);
}

void keyPressed(){
  if (keyCode == UP){
    if (angle <= 85){
      angle += 5;
    }
  }
  if (keyCode == DOWN){
    if (angle >= 10){
      angle -= 5;
    }
  }
  println("Angle is " + angle);
}