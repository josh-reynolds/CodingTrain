class Firework {
  Particle firework;
  ArrayList<Particle> sparks;
  int size = int(random(50,100));
  float hue = random(255);
  Boolean exploded = false;

  Firework(){
    firework = new Particle(random(-width/2,width/2), height/2, random(-800,800), hue, true);
    sparks = new ArrayList<Particle>();
  }
 
  void update(){
    if (!exploded){
      firework.applyForce(gravity);
      firework.update();

      if (firework.vel.y >= 0){
        explode();
      }
    } else {
      for (int i = sparks.size()-1; i >= 0; i--){
        Particle p = sparks.get(i);
        p.applyForce(gravity);
        p.update();

        if (p.done()){
          sparks.remove(i);
        }  
      }
    }
  }
 
  void show(){
    if (!exploded){
      firework.show();   
    } else {
      for (Particle p : sparks){
        p.show(); 
      }
    }
  }
  
  void explode(){
    exploded = true;

    for (int i = 0; i < size; i++){
      Particle p = new Particle(firework.pos.x, firework.pos.y, firework.pos.z, hue, false);
      sparks.add(p);
    }    
  }

  Boolean done(){
     if (exploded && sparks.size() == 0){
       return true;
     } else {
       return false;
     }
  }
}