// Coding Train
// Coding Challenge 63.1 - Texturing Cloth Simulation Part 1
// Coding Challenge 63.2 - Texturing Cloth Simulation Part 2
// https://www.youtube.com/watch?v=JunJzIe0hEo&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=83
// https://www.youtube.com/watch?v=FeXnJSCFj-Q&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=84

import toxi.geom.*;
import toxi.physics3d.*;
import toxi.physics3d.behaviors.*;
import toxi.physics3d.constraints.*;

int resolution = 2;
int cols = 40 / resolution;
int rows = 40 / resolution;

Particle[][] particles = new Particle[cols][rows];
ArrayList<Spring> springs;

float w = 10 * resolution;
float zoff = 0;

float a = 0;

VerletPhysics3D physics;

String file = "plague_doctor.jpg";
PImage img;

void setup(){
  size(800, 600, P3D);

  img = loadImage(file);

  springs = new ArrayList<Spring>();

  physics = new VerletPhysics3D();
  Vec3D gravity = new Vec3D(0, 0.5, 0);
  GravityBehavior3D gb = new GravityBehavior3D(gravity);
  physics.addBehavior(gb);
  
  float x = -cols * w/2 - 100;
  for (int i = 0; i < cols; i++){
    float y = -rows * w/2;
    for (int j = 0; j < rows; j++){
      Particle p = new Particle(x, y, 0);
      particles[i][j] = p;
      physics.addParticle(p);
      y = y + w;
    }  
    x = x + w;
  }
  
  for (int i = 0; i < cols; i++){
    for (int j = 0; j < rows; j++){
      Particle a1 = particles[i][j];
      
      if (i != cols-1){
        Particle b1 = particles[i+1][j];
        Spring s1 = new Spring(a1, b1);
        springs.add(s1);
        physics.addSpring(s1);
      }
      
      if (j != rows-1){
        Particle b2 = particles[i][j+1];
        Spring s2 = new Spring(a1, b2);
        springs.add(s2);
        physics.addSpring(s2);
      }
    }
  }
    
  particles[0][0].lock();
  particles[0][rows/3].lock();
  particles[0][2 * rows/3].lock();
  particles[0][rows-1].lock();
}

void draw(){
  background(51);

  translate(width/2, height/2);

  //rotateY(a);
  //a += 0.01;
  
  physics.update();
   
  float xoff = 0;
  for (int i = 0; i < cols; i++){
    float yoff = 0;
    for (int j = 0; j < rows; j++){
      float n = noise(xoff, yoff);
      float windx = map(noise(xoff, yoff, zoff), 0, 1, 0, 3);
      float windz = map(noise(xoff + 3000, yoff + 3000, zoff), 0, 1, -1, 1);
      Vec3D wind = new Vec3D(windx, 0, windz);
      particles[i][j].addForce(wind);
      yoff += 0.1;
    }
    xoff += 0.1;
  }
  zoff += 0.1;

  noFill();
  noStroke();
  textureMode(NORMAL);
  for (int j = 0; j < rows-1; j++){
  beginShape(TRIANGLE_STRIP);
    texture(img);
    for (int i = 0; i < cols; i++){
      float x1 = particles[i][j].x;
      float y1 = particles[i][j].y;
      float z1 = particles[i][j].z;
      float u = map(i, 0, cols-1, 0, 1);
      float v1 = map(j, 0, rows-1, 0, 1);
      vertex(x1, y1, z1, u, v1);
        
      float x2 = particles[i][j+1].x;
      float y2 = particles[i][j+1].y;
      float z2 = particles[i][j+1].z;
      float v2 = map(j+1, 0, rows, 0, 1);
      vertex(x2, y2, z2, u, v2);
    }
  endShape();
  }
  
  stroke(255);
  strokeWeight(4);
  line(-cols * w/2 - 100, -rows * w/2, -cols * w/2 - 100, height); 
}