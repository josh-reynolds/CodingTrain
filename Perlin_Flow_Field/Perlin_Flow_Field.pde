// https://www.youtube.com/watch?v=BjoM9oKOAKY

float increment = 0.1;
int scl = 20;
int cols, rows;

float zoff = 0;
float zinc = 0.003;

int num_particles = 500;
Particle[] particles= new Particle[num_particles];  

// probably should make this a class...
PVector[] flowField;

void setup(){
  size(600, 600);
  cols = width/scl;
  rows = height/scl;
  
  flowField = new PVector[cols*rows];
  
  for (int i = 0; i < num_particles; i++){
    particles[i] = new Particle();
  }
  
  //frameRate(20);
  background(255,150);
}

void draw(){
  //background(255);
  
  float yoff = 0.0;
  for (int y = 0; y < rows; y++){
    yoff += increment;
    float xoff = 0.0;
    for (int x =0; x < cols; x++){
      xoff += increment;
      
      int index = x + y * cols;
      
      float angle = noise(xoff,yoff,zoff)*TWO_PI*4;
      PVector v = PVector.fromAngle(angle);
      v.setMag(1);
      flowField[index] = v;
                
      //stroke(0,50);
      //strokeWeight(1);
      //pushMatrix();
      //  translate(x * scl, y * scl);
      //  rotate(v.heading());
      //  line(0, 0, scl, 0);
      //popMatrix();
    }
  }
  zoff += zinc;

  for (int i = 0; i < num_particles; i++){
    particles[i].follow(flowField);
    particles[i].update();
    particles[i].show();
    particles[i].edges();
  }
}