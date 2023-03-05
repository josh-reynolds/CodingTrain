// Coding Train
// Coding Challenge 135 - Making a GIF Loop in Processing
// https://www.youtube.com/watch?v=nBKwCCtWlUg&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=193

// https://ezgif.com/maker

int totalFrames = 120;
int counter = 0;
boolean record = true;

void setup(){
  size(400, 400);
}

void draw(){
  float percent = 0;

  if (record){
    percent = float(counter) / totalFrames;
  } else {
    percent = float(frameCount % totalFrames) / totalFrames;
  }
  
  render(percent);

  if (record){
    saveFrame("output/gif-" + nf(counter, 3) + ".png");
    counter++;
    if (counter == totalFrames){
      exit();
    }
  }
}

void render(float percent){
  background(0);

  //fill(255);
  //ellipse(percent * width, height/2, 20, 20);

  float angle = percent * TWO_PI;
  pushMatrix();
    translate(width/2, height/2);
    rotate(angle);
    rectMode(CENTER);
    noFill();
    strokeWeight(2);
    stroke(255);
    rect(0, 0, 100, 100);
  popMatrix();
}