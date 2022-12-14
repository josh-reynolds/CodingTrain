class Tree{
  ArrayList<Leaf> leaves = new ArrayList<Leaf>();
  ArrayList<Branch> branches = new ArrayList<Branch>();
  
  Tree(){
    for (int i = 0; i < 2000; i++){
      leaves.add(new Leaf());
    }

    Branch root = new Branch(null,
                             //new PVector(width/2,height/2), 
                             //new PVector(0, 0),
                             new PVector(0,height/2),
                             new PVector(0, -1));
    branches.add(root);
    Branch current = new Branch(root);
                                          
    while (!closeEnough(current)){
      Branch trunk = new Branch(current);
      branches.add(trunk);
      current = trunk;
    }
  }

  Boolean closeEnough(Branch b){
    for (Leaf l : leaves){
      float d = PVector.dist(b.pos, l.pos);
      if (d < max_dist){
        return true;
      }
    }
    return false;
  }

  public void grow(){
    for (Leaf l : leaves){
      Branch closest = null;
      PVector closestDir = null;
      float record = -1;
      
      for (Branch b : branches){
         PVector dir = PVector.sub(l.pos, b.pos);
         float d = dir.mag();
         if (d < min_dist){
           l.reached();
           closest = null;
           break;
         } else if (d > max_dist){
           // do nothing
         } else if (closest == null || d < record){
           closest = b;
           closestDir = dir;
           record = d;
         }
      }
      
      if (closest != null){
        closestDir.normalize();
        closest.dir.add(closestDir);
        closest.count++;                                      
      }
    }
    
    for (int i = leaves.size()-1; i >= 0; i--){     
      if (leaves.get(i).reached){ leaves.remove(i); }
    }
    
    for (int i = branches.size()-1; i >= 0; i--){
      Branch b = branches.get(i);
      if (b.count > 0){
        b.dir.div(b.count);
        PVector rand = PVector.random2D();
        rand.setMag(0.3); // without this, the lines become very wiggly/hairy
                            // looks like electricity - try commenting out
        b.dir.add(rand);
        b.dir.normalize();
        Branch newB = new Branch(b);
        branches.add(newB);
        b.reset();
      } 
    }
  }

  public void show(){
    for (Leaf l : leaves){
      l.show();
    }
    //for (Branch b : branches){
    for (int i = 0; i < branches.size(); i++){
      Branch b = branches.get(i);
      if (b.parent != null){
        float sw = map(i, 0, branches.size(), 6, 0.5); 
        strokeWeight(sw);
        stroke(255);
        line(b.pos.x, b.pos.y, b.pos.z, b.parent.pos.x, b.parent.pos.y, b.parent.pos.z);
      }
    }
  }
}