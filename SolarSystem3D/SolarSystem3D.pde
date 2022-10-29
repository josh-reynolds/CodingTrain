import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
//import peasy.test.*;

// The Coding Train
// Coding Challenge 8 - Solar System, Part II (3D)
// https://www.youtube.com/watch?v=dncudkelNxw&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=8

// lot of orbital mechanics issues here of course
// planetary spacing, orbital direction + velocity, etc.

Planet sun;
PeasyCam cam;

void setup(){
  size(600, 600, P3D);
  sun = new Planet(50, 0, 0);
  sun.spawnSatellites(4, 1);
  cam = new PeasyCam(this, 500);
  
  //background(0);
}

void draw(){
  background(0);    // if you disable background redraw, the orbital paths
                    // make a nice pattern, esp. epicycles...
                    // could play with colors/alpha to get different effects
                    // break out into separate project
  lights();
  //translate(width/2, height/2);
  sun.show();
  sun.orbit();
}