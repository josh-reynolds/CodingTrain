import peasy.*;

// Coding Train
// Coding Challenge 27 - Fireworks!
// https://www.youtube.com/watch?v=CKeyIbT3vXI&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=30

// javascript again... converting

PVector gravity;
ArrayList<Firework> fireworks;
PeasyCam cam;

void setup(){
  size(800, 600, P3D);
  colorMode(HSB);
  background(0);

  gravity = new PVector(0, 0.2); 
  fireworks = new ArrayList<Firework>();
  cam = new PeasyCam(this, 500);
}

void draw(){
  //background(0, 0, 0, 25);  // not getting trails, need to investigate
                              // at 26:35 he says "I wonder if this is a bug..."
                              // I was seeing this even prior to adding HSB mode
                              // reference points to PGraphics - wonder if this changed
                              // since earlier versions
                              // later he switches to Processing Java script (27:59)
                              // and the code has a hack to get trails - 
                              // just draw a transparent rect explicitly
                              // yoinking, and stripping out colorMode swap hack
                              
                              // PeasyCam screws this up...

  //fill(0,25);
  //noStroke();
  //rect(0, 0, width, height);
  background(0);                               
                               
  if (random(1) < 0.5){
    fireworks.add(new Firework());
  }
  
  for (int i = fireworks.size()-1; i >= 0; i--){
    Firework f = fireworks.get(i);
    f.update();
    f.show();
    
    if (f.done()){
      fireworks.remove(i); 
    } 
  }
}