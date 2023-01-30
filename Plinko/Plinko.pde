// Coding Train
// Coding Challenge 62.1 - Plinko with Matter.js Part 1
// https://www.youtube.com/watch?v=KakpnfDv_f0&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=79

// JavaScript conversion

// The physics library conversion may be the most interesting/challenging piece here
//  since he is using a JavaScript lib - giving Fisica a try (which is a wrapper around JBox2D)

// First issue - dropping a ball onto a peg straight on, and it balances rather than
//  rolling off to one side. Tried playing with friction and other settings, no luck so far.
//  Two options:
//    * Offset the peg by a pixel, but that means the ball will always roll to the same side
//    * Add a "bounce force" using contact events
//    * Reducing ball size greatly reduces (if not eliminates) the issue - going with that

import fisica.*;

FWorld world;

int plinkoSize = 20;
int plinkoSpacing = plinkoSize * 3;

void setup(){
  size(600, 400);
  
  Fisica.init(this);
  
  world = new FWorld();
  world.setEdges();
  world.setGravity(0, 500);

  for (int i = 0; i < 100; i++){
    FCircle ball;
    ball = new FCircle(10);
    world.add(ball);
    ball.setPosition(random(width), 0);
    ball.setFillColor(color(255,125,0));
    ball.setRestitution(0.55);
    ball.setName("ball");
  }

  for (int i = 0; i < width / plinkoSpacing; i++){
    for (int j = 0; j < height / plinkoSpacing - 2; j++){
      FCircle p = new FCircle(plinkoSize);
      int xOffset = (j % 2) * plinkoSpacing/2;
      p.setPosition(plinkoSpacing * i + plinkoSpacing/2 + xOffset, 
                    plinkoSpacing * j + plinkoSpacing*2);
      p.setStatic(true);
      p.setName("plinko");
      world.add(p);
    }
  }
  
  float boxSpacing = width/10;
  int boxHeight = 50;
  for (int i = 0; i < 10; i++){
    FBox box = new FBox(10, boxHeight);
    box.setFillColor(color(0, 125, 255));
    box.setStatic(true);
    box.setPosition(i * boxSpacing + boxSpacing/2, height-boxHeight/2);
    world.add(box);
  }
}

void draw(){
  background(51);
  
  world.step();
  world.draw();
}


//// workaround for "balancing ball" issue
//void contactStarted(FContact contact){
//  FBody f1 = contact.getBody1();
//  FBody f2 = contact.getBody2();
  
//  if (f1.getName() != null && f2.getName() != null){
//    if (f1.getName().equals("plinko") || f2.getName().equals("plinko")){
//      if (random(1) < 0.5){
//        f1.addImpulse(50, 0, 0, 0);
//      } else {
//        f1.addImpulse(-50, 0, 0, 0);      
//      }
//    }
//  }
//}