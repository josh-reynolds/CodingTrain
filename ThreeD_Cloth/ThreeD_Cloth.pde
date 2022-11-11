import toxi.processing.*;

import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.geom.mesh.subdiv.*;
import toxi.geom.mesh2d.*;
import toxi.geom.nurbs.*;
import toxi.math.*;
import toxi.math.conversion.*;
import toxi.math.noise.*;
import toxi.math.waves.*;
import toxi.util.*;
import toxi.util.datatypes.*;
import toxi.util.events.*;

import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.constraints.*;
import toxi.physics3d.*;
import toxi.physics3d.behaviors.*;
import toxi.physics3d.constraints.*;

// Coding Train
// Coding Challenge 20 - 3D Cloth with toxiclibs
// https://www.youtube.com/watch?v=jrk_lOg_pVA&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=23

// Links for toxiclibs only go to the js version, having trouble finding the original Java version
// Processing download manager says: "Could not find a library in the downloaded file."

// The BitBucket links in the video are outdated: readme file redirects to:
// https://github.com/postspectacular/toxiclibs

// Having to adapt to other minor changes as we go (like GravityBehavior renamed to GravityBehavior2D)...

int cols = 40;
int rows = 40;

Particle[][] particles = new Particle[cols][rows];
ArrayList<Spring> springs;

float w = 10;

VerletPhysics3D physics;

void setup(){
  size(600, 600, P3D);
  springs = new ArrayList<Spring>();

  physics = new VerletPhysics3D();
  Vec3D gravity = new Vec3D(0, 1, 0);
  GravityBehavior3D gb = new GravityBehavior3D(gravity);
  physics.addBehavior(gb);
  
  float x = -200;
  for (int i = 0; i < cols; i++){
    float z = -200;
    for (int j = 0; j < rows; j++){
      Particle p = new Particle(x, -100, z);
      particles[i][j] = p;
      physics.addParticle(p);
      z = z + w;
    }  
    x = x + w;
  }
  
  for (int i = 0; i < cols-1; i++){
    for (int j = 0; j < rows-1; j++){
      Particle a1 = particles[i][j];
      Particle b1 = particles[i+1][j];
      Particle b2 = particles[i][j+1];
      Particle b3 = particles[i+1][j+1];
      
      Spring s1 = new Spring(a1, b1);
      springs.add(s1);
      physics.addSpring(s1);
      
      Spring s2 = new Spring(a1, b2);
      springs.add(s2);
      physics.addSpring(s2);
      
      Spring s3 = new Spring(a1, b3);
      springs.add(s3);
      physics.addSpring(s3);
    }
  }
    
  particles[0][0].lock();
  particles[cols-1][0].lock();
  particles[cols-1][rows-1].lock();
  particles[0][rows-1].lock();
}

float a = 0;
void draw(){
  background(51);
  translate(width/2, height/2);
  rotateX(a);
  a += 0.01;
  
  physics.update();
  
  for (int i = 0; i < cols; i++){
    for (int j = 0; j < rows; j++){
      particles[i][j].display();
    }
  }
  
  for (Spring s : springs){
    s.display();
  }
}