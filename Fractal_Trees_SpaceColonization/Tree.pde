class Tree{
  public ArrayList<Leaf> leaves;
  public ArrayList<Branch> branches;
  
  Tree(){
    leaves = new ArrayList<Leaf>();
    
    for (int i = 0; i < 1000; i++){
      leaves.add(new Leaf());
    }

    Branch root = new Branch(null,
                             new PVector(width/2,height), 
                             new PVector(0, -1));
    branches = new ArrayList<Branch>();
    branches.add(root);
    
    
    Branch current = root;
    Boolean found = false;
    while (!found){
      for (Leaf l : leaves){
        float d = PVector.dist(current.pos, l.pos);
        if (d < max_dist){
          found = true;
        }
      }
      if (!found){
        Branch b = current.next();
        current = b;
        branches.add(current);
      }
    }
  }

  public void grow(){
    for (Leaf l : leaves){
      Branch closestBranch = null;
      float record = 100000;
      for (Branch b : branches){
         float dist = PVector.dist(l.pos, b.pos);
         if (dist < min_dist){
           l.reached = true;
           closestBranch = null;
           break;
         } else if (dist > max_dist){
           // do nothing
         } else if (closestBranch == null || dist < record){
           closestBranch = b;
           record = dist;
         }
      }
      
      if (closestBranch != null){
        PVector newDir = PVector.sub(l.pos, closestBranch.pos);
        newDir.normalize();
        closestBranch.dir.add(newDir);
        closestBranch.count++;                                      
      }
    }
    
    for (int i = leaves.size()-1; i >= 0; i--){
      Leaf l = leaves.get(i);
      if (l.reached){ leaves.remove(l); }
    }
    
    for (int i = branches.size()-1; i >= 0; i--){
      Branch b = branches.get(i);
      if (b.count > 0){
        b.dir.div(b.count+1);
        branches.add(b.next());                                      
      } 
      b.reset();  // I initially implemented an else/remove clause
                  // which worked - using the solution from the
                  // video on a side git branch for comparison
    }
  }

  public void show(){
    for (Leaf l : leaves){
      l.show();
    }
    for (Branch b : branches){
      b.show(); 
    }
  }
}