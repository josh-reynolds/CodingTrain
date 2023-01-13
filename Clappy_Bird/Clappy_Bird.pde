// Coding Train
// Coding Challenge 41 - Clappy Bird
// https://www.youtube.com/watch?v=aKiyCeIuwn4&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=51

// another JavaScript conversion

import processing.sound.*;

Bird b;
ArrayList<Pipe> pipes;
int score;
int highScore;

Amplitude amp;
AudioIn mic;
float volume = 0;

float thresholdTop    = 0.1;
float thresholdBottom = 0.2;
boolean clapping;

void setup(){
  size(400, 600);
  b = new Bird();
  pipes = new ArrayList<Pipe>();
  pipes.add(new Pipe());
  score = 0;
  highScore = 0;
  
  amp = new Amplitude(this);
  mic = new AudioIn(this, 0);
  
  mic.start();
  amp.input(mic);
  
  clapping = false;
}

void draw(){
  background(0);

  //float volume = mic.getLevel(); // has the library changed since he recorded?
                                   // he uses AudioIn.getLevel() but doesn't seem to
                                   // exist. Reading documentation for alternatives.
  volume = amp.analyze();
  if (volume > thresholdTop && !clapping){
      b.up();
      clapping = true;    
  }
  if (volume < thresholdBottom){
    clapping = false;
  }

  if (keyPressed){
    if (key == ' '){
      b.up();
    }    
  }
  
  if (frameCount % 100 == 0){
    pipes.add(new Pipe());    
  }
  
  for (int i = pipes.size()-1; i >= 0; i--){
    Pipe p = pipes.get(i);
    p.update();    
    p.show();
    
    if (p.hit(b)){
      if (score > highScore){
        highScore = score; 
      }
      score = 0;

      println("You hit the pipe! High score = " + highScore);
    }
    
    if (p.isOffscreen()){
      pipes.remove(i);
      score++;
    }
  }

  b.update();
  b.show();
  
  textSize(32);
  fill(50, 50, 255);
  text(score, width-75, 50);
  
  float barY = map(volume, 0, 1, height, 0);
  fill(0, 255, 0);
  rect(width - 50, barY, 20, barY);
  
  strokeWeight(4);
  
  float maxY = map(thresholdTop, 0, 1, height, 0);
  stroke(255, 0, 0);
  line(width - 50, maxY, width - 30, maxY);
  
  float minY = map(thresholdBottom, 0, 1, height, 0);
  stroke(0, 0, 255);
  line(width - 50, minY, width - 30, minY);
} 