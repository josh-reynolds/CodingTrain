// Coding Train
// Coding Challenge 34 - Diffusion-Limited Aggregation
// https://www.youtube.com/watch?v=Cl_Gjj80gPE&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=38

// JavaScript conversion

ArrayList<Walker> tree;
ArrayList<Walker> walkers;
float r = 4;

void setup(){
  size(400, 400);
  
  tree = new ArrayList<Walker>();
  tree.add(new Walker(width/2, height/2, true));

  walkers = new ArrayList<Walker>();
}

void draw(){
  background(0);


  if (walkers.size() < 10){
    walkers.add(new Walker());
  }
  
  for (int i = walkers.size() - 1; i >= 0; i--){
    Walker w = walkers.get(i);
    if (!w.stuck()){
      w.walk();
      w.show();
    } else {
      tree.add(w);
      walkers.remove(w);
    }
  }
  
  for (Walker w : tree){
    stroke(255, 100);
    strokeWeight(r * 2);
    point(w.pos.x, w.pos.y);
  }
  
  println("Walkers: " + walkers.size());
}