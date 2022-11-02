// The Coding Train
// Coding Challenge 146 - Rendering Raycasting
// https://www.youtube.com/watch?v=vYgIKn7iDH8

// [FIXED] BUG: 1P viewport is not rendering slices all the way across
//      was due to float/int division : sceneW 400 / FOV 60 leaves a gap
//      adjusting some values to float fixes the issue, should review across
// BUG: striping occurring in wall render after previous fix
//       probably accumulated float errors leading to small gaps

ArrayList<Boundary> walls;
Particle particle;
float xoff = 0;
float yoff = 1000;

// viewport for the overhead representation
float sceneW;
int sceneH;

// number of slices/rays
int FOV = 120;
float sliceWidth;

// distance values for rays
// confusing nomenwclature - above 'scene'
// is the overhead viewport, but here it
// is going to be used for the 1P viewport
float[] scene;

void setup(){
  // could also move this to settings() to 
  // allow variable params in size() - see Reference
  size(800, 400);
  //fullScreen();
  sceneW = width / 2;
  sceneH = height;
  
  scene = new float[FOV];
  sliceWidth = sceneW / FOV; 
  
  walls = new ArrayList<Boundary>();
  for (int i = 0; i < 5; i++){
    float x1 = random(sceneW);
    float y1 = random(sceneH);
    float x2 = random(sceneW);
    float y2 = random(sceneH);
    walls.add(new Boundary(x1, y1, x2, y2)); 
  }
  //add scene boundaries
  walls.add(new Boundary(0, 0, sceneW, 0));
  walls.add(new Boundary(sceneW, 0, sceneW, sceneH));
  walls.add(new Boundary(sceneW, sceneH, 0, sceneH));
  walls.add(new Boundary(0, sceneH, 0, 0));
  
  particle = new Particle(FOV);
}

void keyPressed(){
  if (key == 'a'){
    particle.rotate(-0.05); 
  }
  if (key == 'd'){
    particle.rotate(0.05);
  }
  if (key == 'w'){
    particle.move(1); 
  }
  if (key == 's'){
    particle.move(-1); 
  }
}

void draw(){
  background(0);
  for (Boundary w : walls){
    w.show(); 
  }

  //particle.update(noise(xoff)*sceneW, noise(yoff)*sceneH);
  //xoff += 0.01;
  //yoff += 0.01;
  //particle.update(mouseX, mouseY);
  //particle.show();   // different effects possible by playing with show
                       // moving before update means it lags a bit behind, 
                       // almost like a lens flare

  scene = particle.look(walls);

  // render floor & ceiling
  fill(90, 149, 242);
  rect(sceneW, 0, width/2, height/2);
  fill(107, 172, 84);
  rect(sceneW, height/2, width/2, height/2); 

  for (int i = 0; i < FOV ; i++){
    // inverse-square for brightness
    float iSq = scene[i] * scene[i];
    float wSq = sceneW * sceneW;
    //float brightness = map(scene[i], 0, sceneW, 255, 0);
    float brightness = map(iSq, 0, wSq, 255, 0);
    
    fill(brightness);
    //stroke(0);
    noStroke();
    float xoff = sceneW;
    // Shiffman translates to (sceneW,0) and uses 
    // rectMode(CENTER) to simplify some of these calculations
    //float sliceH = (sceneH / scene[i]) * 10;
    float sliceH = map(scene[i], 0, sceneW, sceneH, 0);
    rect(sliceWidth * i + xoff, sceneH/2 - sliceH/2, sliceWidth, sliceH);
  }
}