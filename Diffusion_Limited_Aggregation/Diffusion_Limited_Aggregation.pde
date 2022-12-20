// Coding Train
// Coding Challenge 34 - Diffusion-Limited Aggregation
// https://www.youtube.com/watch?v=Cl_Gjj80gPE&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=38

// JavaScript conversion

PVector center;
ArrayList<Walker> tree;
ArrayList<Walker> walkers;

void setup(){
  size(400, 400);
  colorMode(HSB);

  center = new PVector(width/2, height/2);
  
  tree = new ArrayList<Walker>();
  tree.add(new Walker(center.x, center.y, true));

  walkers = new ArrayList<Walker>();
}

void draw(){
  background(0);

  if (walkers.size() < 1000){
    walkers.add(new Walker());
  }
  
  for (int i = walkers.size() - 1; i >= 0; i--){
    Walker w = walkers.get(i);
    if (!w.isStuck()){
      w.walk();
      w.show();
    } else {
      tree.add(w);
      walkers.remove(w);
    }
  }
  
  for (Walker w : tree){
    w.show();
  }
}