// The Coding Train
// Coding Challenge 5 - Space Invaders
// https://www.youtube.com/watch?v=biN3v3ef-Y0&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=5

// TO_DO:
//  victory announcement
//  next level
//  invader collision w/ ship
//  invader shots
//  invader shot collision w/ ship
//  splash screen w/ controls
//  demo mode
//  [DONE] improved movement (as groups)
//  multiple rows of invaders
//  [DONE] increasing invader speed
//  destructible barries
//  score
//  high score
//  high score persistence
//  invader sprites w/ animation
//  ship sprite
//  sound effects
//  general refactoring + cleanup
//  move configuration data to file
//  background stars
//  tune difficulty


Ship ship;
ArrayList<Invader> invaders;
int invaderCount = 10;
ArrayList<Shot> shots;
float invaderSpeed = 1;

//int frameCounter = 0;

void setup(){
  size(600, 400);
  
  ship = new Ship();
  
  invaders = new ArrayList<Invader>();
  int spots = invaderCount + 2;
  float spotW = width/spots;
  for (int i = 0; i < invaderCount; i++){
    float location = ((i + 1) * spotW) + spotW/2;
    invaders.add(new Invader(location, 60));
  }
  
  shots = new ArrayList<Shot>();
}

void draw(){
  background(51); 

  // need to iterate in reverse order to
  // allow removal of shots that go offscreen
  // see Reference for ArrayList
  for (int i = shots.size()-1; i >= 0; i--){
    Shot s = shots.get(i);
    s.update();
    s.show();
    
    for (int j = 0; j < invaders.size(); j++){
      if (s.hits(invaders.get(j))){
        invaders.remove(j);
        shots.remove(i);
        invaderSpeed += 0.5;
      }
    }   
    
    if (s.y < 0){
      shots.remove(i); 
    }
  }
  
  boolean hitEdge = false;
  for (int i = invaders.size()-1; i >= 0 ; i--){
    Invader inv = invaders.get(i); 
    inv.update();
    inv.show();
    
    if (inv.x < 0 || inv.x > width - inv.size){ hitEdge = true; }
    
    if (inv.y > height){
      invaders.remove(i); 
    }
  }

  if (hitEdge){
    for (Invader inv : invaders){
      inv.shiftDown(); 
    }
  }

  for (Invader inv : invaders){
    inv.speed = invaderSpeed; 
  }

  ship.show();
  
  // debug trace for leaking objects...
  //frameCounter++;
  //if (frameCounter % 100 == 0){
  //  println("shots : " + shots.size()); 
  //  println("invaders : " + invaders.size());
  //  println("speed : " + invaderSpeed);
  //}
}

void keyPressed(){
  if (keyCode == RIGHT){
    ship.move(10);
  }
  if (keyCode == LEFT){
    ship.move(-10);
  }
  if (key == ' '){
    shots.add(new Shot(ship.x + ship.shipW/2, ship.y-20));
  }
}