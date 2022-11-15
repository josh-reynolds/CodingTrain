// Coding Train
// Coding Challenge 21 - Mandelbrot Set
// https://www.youtube.com/watch?v=6z7GQewK-Ks&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=24

// Another JavaScript video, needs conversion on the fly

// TO_DO: add some interactivity - zoom, navigate, rotate or remap color scales, screenshot

size(1000, 1000);
pixelDensity(1);
colorMode(HSB);

// subtler shading with higher values
int maxiterations = 200; 

// zoomed out full set is between ~ -2.5 : 2.5
float minval = -2.5;
float maxval = 2.0;

// he fiddles with jscript sliders, leaving that out

loadPixels();
for (int x = 0; x < width; x++){
  for (int y = 0; y < height; y++){
    
    float a = map(x, 0, width, minval, maxval);
    float b = map(y, 0, height, minval, maxval);
    
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