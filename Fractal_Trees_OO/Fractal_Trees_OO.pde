// Coding Train
// Coding Challenge 15 - Object Oriented Fractal Trees
// https://www.youtube.com/watch?v=fcdNSZ9IzJM&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=18

// Again javascript, recoding in Java

ArrayList<Branch> tree;
ArrayList<PVector> leaves;
int count = 0;

void setup(){
  size(400,400);

  PVector a = new PVector(width/2, height);
  PVector b = new PVector(width/2, height - 100);
  Branch root = new Branch(a, b);
  
  tree = new ArrayList<Branch>();
  tree.add(root);
  
  leaves = new ArrayList<PVector>();
}

void draw(){
  background(51);
  
  for (Branch b : tree){
    b.show();
    //b.jitter();
  }
  
  for (PVector l : leaves){
     fill(255, 0, 100, 100);
     noStroke();
     ellipse(l.x, l.y, 8, 8);
  }
}

void mousePressed(){
  for (int i = tree.size() - 1; i >= 0; i--){
    if (!tree.get(i).finished){
      tree.add(tree.get(i).growRight());
      tree.add(tree.get(i).growLeft());
      tree.get(i).finished = true;
    }
  }
  count++;
  
  if (count % 5 == 0){
    for (Branch b : tree){
      if (!b.finished){
        PVector leaf = b.end.copy();
        leaves.add(leaf);
      }
    }
  }
}