// Coding Train
// Coding Challenge 62.1 - Plinko with Matter.js Part 1
// https://www.youtube.com/watch?v=KakpnfDv_f0&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=79

// JavaScript conversion

// The physics library conversion may be the most interesting/challenging piece here
//  since he is using a JavaScript lib - giving Fisica a try (which is a wrapper around JBox2D)

// First issue - dropping a ball onto a peg straight on, and it balances rather than
//  rolling off to one side. Tried playing with friction and other settings, no luck so far.
//  Three options:
//    * Offset the peg by a pixel, but that means the ball will always roll to the same side
//    * Add a "bounce force" using contact events
//    * Reducing ball size greatly reduces (if not eliminates) the issue - going with that

// No, not solved, unfortunately. The random initial location was hiding the issue. If a 
//  ball - even a very small one - is lined up exactly with a peg, it balances rather than rolls off.
//  The physics are deterministic, too. If we set a timer to create a ball in the same position
//  repeatedly, they all follow the same path, and land in the same bucket.

// Adding the "bounce force" workaround back in to address the issue

import fisica.*;

FWorld world;

void setup(){
  size(600, 800);
  
  Fisica.init(this);
  
  makeWorld();
  makeBalls(1);
  makePegs();
  makeBuckets();
}

void draw(){
  background(51);
  world.step();
  world.draw();
  
  if (frameCount % 60 == 0){
    makeBalls(1);
  }
}

void makeWorld(){
  world = new FWorld();
  world.setEdges();
  world.setGravity(0, 500);
}

void makeBalls(int count){
  for (int i = 0; i < count; i++){
    FCircle ball = new FCircle(10);
    //ball.setPosition(random(width), 0);
    ball.setPosition(width/2, 0);
    ball.setFillColor(color(255,125,0));
    ball.setRestitution(0.55);
    ball.setName("ball");
    world.add(ball);
  }  
}

void makePegs(){
  int pegSize = 20;
  int pegSpacing = pegSize * 3;
  for (int i = 0; i < width / pegSpacing; i++){
    for (int j = 0; j < height / pegSpacing - 2; j++){
      FCircle peg = new FCircle(pegSize);
      int xOffset = (j % 2) * pegSpacing/2;
      peg.setPosition(pegSpacing * i + pegSpacing/2 + xOffset, 
                      pegSpacing * j + pegSpacing*2);
      peg.setStatic(true);
      peg.setName("peg");
      world.add(peg);
    }
  }
}

void makeBuckets(){
  float boxSpacing = width/10;
  int boxHeight = 50;
  for (int i = 0; i < 10; i++){
    FBox box = new FBox(10, boxHeight);
    box.setPosition(i * boxSpacing + boxSpacing/2, height-boxHeight/2);
    box.setFillColor(color(0, 125, 255));
    box.setStatic(true);
    world.add(box);
  }
}

//// workaround for "balancing ball" issue
void contactStarted(FContact contact){
  FBody f1 = contact.getBody1();
  FBody f2 = contact.getBody2();
  
  if (f1.getName() != null && f2.getName() != null){
    if (f1.getName().equals("peg") || f2.getName().equals("peg")){
      FBody target = f1;
      if (f2.getName().equals("ball")){ target = f2; }
      if (random(1) < 0.5){
        target.addImpulse(25, 0, 0, 0);
      } else {
        target.addImpulse(-25, 0, 0, 0);    
      }      
    }
  }
}