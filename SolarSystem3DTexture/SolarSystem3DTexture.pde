import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
//import peasy.test.*;

// The Coding Train
// Coding Challenge 9 - Solar System, Part III (3D Textures)
// https://www.youtube.com/watch?v=FGAwi7wpU8c

// Texture resource: http://planetpixelemporium.com/index.php

// lot of orbital mechanics issues here of course
// planetary spacing, orbital direction + velocity, etc.

Planet sun;
PeasyCam cam;

PImage sunTexture;
PImage[] textures = new PImage[3];

void setup(){
  size(600, 600, P3D);
  sunTexture = loadImage("sun.jpg");
  textures[0] = loadImage("mars.jpg");
  textures[1] = loadImage("mercury.jpg");
  textures[2] = loadImage("earth.jpg");
  sun = new Planet(50, 0, 0, sunTexture);
  sun.spawnSatellites(4, 1);
  cam = new PeasyCam(this, 500);
  
  //background(0);
}

void draw(){
  background(0);    // if you disable background redraw, the orbital paths
                    // make a nice pattern, esp. epicycles...
                    // could play with colors/alpha to get different effects
                    // break out into separate project
  //lights();
  ambientLight(64,64,64);
  pointLight(255,255,255,0,0,0);
  //translate(width/2, height/2);
  sun.show();
  sun.orbit();
}