// Coding Train
// Coding Challenge 47 - Pixel Sorting in Processing
// https://www.youtube.com/watch?v=JUDYkxU6J0o&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=60

// He starts out with a very slow selection sort - would be a good
// opportunity to replace with a faster algorithm

// To maintain progress, he resized his 400x400 image to 200x200
// (mine is worse - 600x600) Let's give that a try, then come back for
// algorithmic improvements

// Not exact measurements, since we are animating through the draw loop, but
// with Selection Sort (and suggested framerate values below):
//   0M 17S  200x200
//  18M 36S  600x600

import java.time.Instant;
import java.time.Duration;   // Running on Java 8, so most of the formatting 
                             // methods are not available, rolling my own

PImage img;
PImage sorted;
int index;

boolean done;

Instant startTime;
Instant endTime;

int loopsPerFrame = 100;   // adjust this up or down based on image size to maintain framerate
                           // trying 100 for 200x200 image, 10 for 600x600

void setup(){
  size(400, 200);                           // need to reset to match image dimensions
  //img = loadImage("Halloween.jpg");          // 600x600
  img = loadImage("Halloween_small.jpg");    // 200x200

  sorted = createImage(img.width, img.height, RGB);
  sorted = img.get();
  done = false;
  startTime = Instant.now();
}

void draw(){
  if (done){
    Duration d = Duration.between(startTime, endTime); 
    println("DONE!");
    println("START:   " + startTime);
    println("END:     " + endTime);
    println("Elapsed: " + parseDuration(d));   
    noLoop();
  } else {
    selectionSort();
  }
  
  background(0);
  image(img, 0, 0);
  image(sorted,img.width,0);
}

void selectionSort(){
  // selection sort - very slow: O(N^2)
  float totalPixels = sorted.width * sorted.height;
  sorted.loadPixels();
  for (int n = 0; n < loopsPerFrame; n++){
    if (index < sorted.pixels.length - 1){
      println(nf(index/totalPixels * 100, 0, 2) + "% " + frameRate + " FPS");
      float record = -1;
      int selectedPixel = index;
      for (int j = index; j < sorted.pixels.length; j++){
        color pix = sorted.pixels[j];
        //float b = brightness(pix);
        float b = hue(pix);
        
        if (b > record){
          selectedPixel = j;
          record = b;
        }
      }
      swap(sorted.pixels, index, selectedPixel);
    } else {
      endTime = Instant.now();
      done = true;
    }
    sorted.updatePixels();
    index++;
  } 
}

void swap(color[] a, int first, int second){
  color temp = a[first];
  a[first] = a[second];
  a[second] = temp;
}

String parseDuration(Duration d){
  long asSeconds = d.toMillis() / 1000;
  int minutes = int(asSeconds) / 60;
  int seconds = int(asSeconds) % 60;
  return minutes + " m " + seconds + " s";
}