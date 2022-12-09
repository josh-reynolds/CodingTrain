// Coding Train
// Coding Challenge 32.1 - Agar.io Part 1 (Basic Game Mechanic)
// https://www.youtube.com/watch?v=JXuxYMGe4KI

// Another JavaScript video, needs conversion on the fly

Blob blob;
ArrayList<Blob> blobs;
float zoom = 1;

void setup(){
  size(600, 600);
  blobs = new ArrayList<Blob>();
  blob = new Blob(0, 0, 64);
  for (int i = 0; i < 200; i++){
    float x = random(-width, width);
    float y = random(-height, height);
    blobs.add(new Blob(x, y, 16));
  }
}

void draw(){
  background(0);
  
  translate(width/2, height/2);
  float newzoom = 64 / blob.r;
  zoom = lerp(zoom, newzoom, 0.1);
  scale(zoom);
  translate(-blob.pos.x, -blob.pos.y);
  
  blob.show();
  blob.update();
  
  for (int i = blobs.size() - 1; i >= 0; i--){
    Blob b = blobs.get(i);
    if (blob.eats(b)){
      blobs.remove(b);
      
      PVector offset = PVector.random2D();
      offset.setMag(blob.r * random(2,5));
      blobs.add(new Blob(blob.pos.x + offset.x, 
                         blob.pos.y + offset.y,
                         16));
    }
    b.show();
  }
}