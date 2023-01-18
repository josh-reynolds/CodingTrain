// Coding Train
// Coding Challenge 47 - Pixel Sorting in Processing
// https://www.youtube.com/watch?v=JUDYkxU6J0o&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=60

// He starts out with a very slow selection sort - would be a good
// opportunity to replace with a faster algorithm

// To maintain progress, he resized his 400x400 image to 200x200
// (mine is worse - 600x600) Let's give that a try, then come back for
// algorithmic improvements

PImage img;
PImage sorted;
int index;

void setup(){
  size(1200, 600);
  img = loadImage("Halloween.jpg");
  //img = loadImage("Halloween_small.jpg");

  sorted = createImage(img.width, img.height, RGB);
  sorted = img.get();
}

void swap(color[] a, int first, int second){
  color temp = a[first];
  a[first] = a[second];
  a[second] = temp;
}

void draw(){
  // selection sort - very slow: O(N^2)
  float totalPixels = sorted.width * sorted.height;
  sorted.loadPixels();
  for (int n = 0; n < 10; n++){     // adjust this up or down based on image size to maintain framerate
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
    }
    sorted.updatePixels();
    index++;
  }
  background(0);
  image(img, 0, 0);
  image(sorted,img.width,0);
}