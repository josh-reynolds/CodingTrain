

class Ship {
  float x;
  float y;
  int shipW = 20;
  int shipH = 60;

  Ship(){
    x = width/2;
    y = height - shipH;
  }

  void move(float amount){
    x += amount;
    if (x < 0){ x = 0; }
    if (x > width - shipW){ x = width - shipW; }
  }
  
  void show(){
    fill(255);
    rect(x, y, shipW, shipH); 
  }
}