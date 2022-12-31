// Coding Train
// Coding Challenge 21 - Mandelbrot Set
// https://www.youtube.com/watch?v=6z7GQewK-Ks&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=24

// Another JavaScript video, needs conversion on the fly

// TO_DO: add some interactivity - zoom, navigate, rotate or remap color scales, screenshot

int maxiterations = 200; // subtler shading with higher values

// zoomed out full set is between ~ -2.25 : 2.25
float minvalX = -2.25;
float maxvalX = 2.25;
float minvalY = -2.25;
float maxvalY = 2.25;

void setup(){
  size(1000, 1000);
  pixelDensity(1);
  colorMode(HSB);
  frameRate(1);

  println("LEFT mouse click to zoom in.");
  println("RIGHT mouse click to zoom out.");
  println("CENTER mouse click to recenter (no zoom).");
  println("SPACEBAR to save a screenshot (mandelbrot.png in script folder).");
  println();
  
  drawMandelbrot();
}

void drawMandelbrot(){
  loadPixels();
    for (int x = 0; x < width; x++){
      for (int y = 0; y < height; y++){
        
        float a = map(x, 0, width, minvalX, maxvalX);
        float b = map(y, 0, height, minvalY, maxvalY);
        
        float ca = a;
        float cb = b;
        
        int n = 0;
        
        while (n < maxiterations){
          float aa = a * a - b * b;
          float bb = 2 * a * b;
          
          a = aa + ca;         // interesting variant if we don't snap original
          b = bb + cb;         // coordinate - i.e. a = aa + a instead of ca
                               // (this was a bug during the video)
                               // not Mandelbrot shaped. Is it a Julia set?
          
          if (abs(a + b) > 16){
            break;
          }  
          n++;
        }
        
        float hue = map(n, 0, maxiterations, 0, 1);
        hue = map(sqrt(hue), 0, 1, 0, 50);
        // mapping between 150 - 255 gives a magenta to blue scale
        //                   0 - 125 is reds and yellows up to light yellow-green
        //                   0 - 50  is just R + Y
        // can reverse these mappings too
        
        float bright = 255;
        if (n == maxiterations){
          bright = 0;
        }
        
        int pix = (x + y * width);
        pixels[pix] = color(hue, 255, bright, 255);  // jscript version needs to separate channel values
                                                     // Java pixels array uses color values instead
      }
    }
  updatePixels();
  println("Coordinates: " + minvalX + ", " + minvalY + " to " + maxvalX + ", " + maxvalY); 
}

void draw(){
  // need a draw routine to respond to mouse events 
}

void mouseClicked(){ 
  float a = map(mouseX, 0, width, minvalX, maxvalX);
  float b = map(mouseY, 0, height, minvalY, maxvalY);

  float centerX = (maxvalX - minvalX)/2 + minvalX;
  float centerY = (maxvalY - minvalY)/2 + minvalY;
  
  float xZoom = (centerX - minvalX);
  float yZoom = (centerY - minvalY);

  if (mouseButton == LEFT){
    xZoom /= 2;
    yZoom /= 2;
  }
  if (mouseButton == RIGHT){
    xZoom *= -1;
    yZoom *= -1;
  }
  if (mouseButton == CENTER){
    xZoom *= 0;
    yZoom *= 0;
  }
  
  minvalX = minvalX + a - centerX + xZoom;
  maxvalX = maxvalX + a - centerX - xZoom;
  minvalY = minvalY + b - centerY + yZoom;
  maxvalY = maxvalY + b - centerY - yZoom;
  
  drawMandelbrot();  
}

void keyPressed(){
  if (key == ' '){
    save("mandelbrot.png");
    println("Saving image to mandelbrot.png");    
  }
}