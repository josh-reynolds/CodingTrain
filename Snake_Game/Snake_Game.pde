// The Coding Train
// Coding Challenge 3 - The Snake Game
// https://www.youtube.com/watch?v=AaGK-fj-BAM&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=3

// expand this into a full game - some ideas:
//  move food to a separate class
//  more than one food at a time
//  food decays over time
//  food respawns after being eaten or decaying
//  different shape or color for snake head
//  [DONE] gradient colors along snake's length
//  different shape or color for snake tail
//  splash screen w/ control explanation
//  ability to pause (ESC key?)
//  [DONE] score tracking and reporting on death
//  [DONE] high score tracking
//  make high score persistent across games
//  sound effects
//  demo mode
//  multiple players?
//  difficulty levels - speed? obstacles?
//  general refactoring and cleanup
//
//  bugs:
//  [FIXED] food is drawn over snake
//  [FIXED] gradient mapping returns NaN for snake length 1
//  snake can backtrack causing instant death

Snake s;
int scl = 20;
PVector food;
int high_score = 0;

void setup(){
  size(600,600);
  s = new Snake();
  frameRate(10);
  food = pickLocation();
}

PVector pickLocation(){
  int col = (int)random(0, width/scl);
  int row = (int)random(0, height/scl);
  return new PVector(col*scl, row*scl);
}

void draw(){
  background(51);

  fill(255,0,100);
  rect(food.x, food.y, scl, scl);
  
  s.update();
  s.show();
  
  if(s.eat(food)){
    food = pickLocation(); 
  }

  // draw a grid
  //int cols = width/scl;
  //int rows = height/scl;
  //for (int i = 0; i < cols; i++){
  //  for (int j= 0; j < rows; j++){
  //    stroke(125);
  //    line(0,j*scl,width,j*scl);
  //  }
  //  line(i*scl,0,i*scl,height);
  //}
}

void keyPressed(){
  switch(keyCode){
    case UP:
      s.dir(0, -1);
      break;
    case DOWN:
      s.dir(0, 1);
      break;    
    case LEFT:
      s.dir(-1, 0);
      break;    
    case RIGHT:
      s.dir(1, 0);
      break;    
  }
}