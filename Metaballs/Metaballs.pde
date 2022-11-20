// Coding Train
// Coding Challenge 28 - Metaballs
// https://www.youtube.com/watch?v=ccYLb7cLB1I&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=31

// at 15:34 he combines with a different blob tracking project
// not doing that for now, needs a camera hooked up

ArrayList<Blob> blobs;

void setup(){
  size(640, 360);
  colorMode(HSB);
  
  blobs = new ArrayList<Blob>();
  for (int i = 0; i < 10; i++){
    blobs.add(new Blob(random(width),random(height)));
  }
}

void draw(){
  background(51);
  
  loadPixels();
  for (int x = 0; x < width; x++){
    for (int y = 0; y < height; y++){
      int index = x + y * width;

      float sum = 0;
      for (Blob b : blobs){
        float d = dist(x, y, b.pos.x, b.pos.y);
        sum += 100 * b.r / d;
      }

      pixels[index] = color(sum, 255, 255);
    }
  } 
  updatePixels();
  
  for (Blob b : blobs){
    b.update();
    //b.show();
  }
}