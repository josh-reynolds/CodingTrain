// The Coding Train
// Coding Challenge 7 - Solar System, Part I (2D)
// https://www.youtube.com/watch?v=l8SiJ-RmeHU

// lot of orbital mechanics issues here of course
// planetary spacing, orbital direction + velocity, etc.

Planet sun;

void setup(){
  size(600, 600);
  sun = new Planet(50, 0, 0);
  sun.spawnSatellites(4, 1);
}

void draw(){
  background(0);    // if you disable background redraw, the orbital paths
                    // make a nice pattern, esp. epicycles...
                    // could play with colors/alpha to get different effects
                    // break out into separate project
  translate(width/2, height/2);
  sun.show();
  sun.orbit();
}