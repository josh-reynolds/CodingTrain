
class Particle{
  public PVector pos;
  public PVector vel;
  public PVector acc;
  private int maxspeed;
  private PVector prevPos;
  
  Particle(){
    this.pos = new PVector(random(width), random(height));
    this.vel = new PVector(0,0);
    //this.vel = new PVector(random(2), random(2));
    this.acc = new PVector(0,0);
    this.maxspeed = 4;
    this.prevPos = this.pos.copy();
  }

  public void update(){
    this.vel.add(this.acc);
    this.vel.limit(this.maxspeed);
    this.prevPos = this.pos.copy();
    this.pos.add(this.vel);
    this.acc.mult(0); 
  }
  
  public void applyForce(PVector force){
    this.acc.add(force);
  }
  
  public void show(){
     //stroke(random(255),random(255),random(255),220);
     stroke(0,5);
     strokeWeight(1);
     //point(this.pos.x, this.pos.y);
     line(this.pos.x, this.pos.y, this.prevPos.x, this.prevPos.y);
  }
  
  public void edges(){
    if (this.pos.x > width){ 
      this.pos.x = 0;
      this.prevPos.x = this.pos.x;
    }
    if (this.pos.x < 0){ 
      this.pos.x = width;
      this.prevPos.x = this.pos.x;
    }
    if (this.pos.y > height){ 
      this.pos.y = 0; 
      this.prevPos.y = this.pos.y;
    }
    if (this.pos.y < 0){ 
      this.pos.y = height; 
      this.prevPos.y = this.pos.y;
    }
  }

  // uses global values, not good
  //
  // also - hitting array out of bounds due to
  // fencepost error in how index is calculated
  // (see Excel sheet for analysis)
  //
  // applying hack fix for now...
  public void follow(PVector[] forces){
    int x = floor(this.pos.x / scl);
    //hack
    if (this.pos.x == width){ x = floor((this.pos.x - 1) / scl); }
    
    int y = floor(this.pos.y / scl);
    //hack
    if (this.pos.y == height){ y = floor((this.pos.y - 1) / scl); }
    
    int index = x + y * cols;
    
    //println(this.pos.x + " == " + x);
    //println(this.pos.y + " == " + y);
    //println(index);
    //println("------");
       
    PVector force = forces[index];
    this.applyForce(force);
  }
}