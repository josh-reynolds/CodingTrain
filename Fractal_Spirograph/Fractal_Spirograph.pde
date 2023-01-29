// Coding Train
// Coding Challenge 61 - Fractal Spirograph
// https://www.youtube.com/watch?v=0dwJ-bkJwDI&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=78

// http://benice-equation.blogspot.co.uk/2012/01/fractal-spirograph.html

// Variations:
//   set r to -r in Orbit.addChild() and Orbit.update() to nest inside
//   modify k in Orbit to tweak resolution even further
//   (LOD + resolution knobs added as globals below)

// Would be good to calculate when we've done a complete revolution and stop drawing

Orbit sun;
Orbit end;
ArrayList<PVector> path;

int LOD = 20;
int resolution = 100;

void setup(){
  size(600, 600);
  
  path = new ArrayList<PVector>();

  sun = new Orbit(new PVector(width/2, height/2), 150);
  
  Orbit next = sun;
  for (int i = 0; i < LOD; i++){
    next = next.addChild();
  }
  end = next;
}

void draw(){
  background(51);
  
  for (int i = 0; i < resolution; i++){
    sun.update();
    path.add(end.pos);
  }
  sun.show();
    
  stroke(255, 125, 0);
  strokeWeight(1);
  noFill();
  beginShape();
    for (PVector pos : path){
      vertex(pos.x, pos.y);
    }
  endShape();
}