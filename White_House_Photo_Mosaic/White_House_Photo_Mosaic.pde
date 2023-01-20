// Coding Train
// Coding Challenge 49 - Photo Mosaic with White House Social Media Images
// https://www.youtube.com/watch?v=nnlAH1zDBDE&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=62

// He's using images from a downloadable archive (mentions it is large - 4.4GB)
// As with last project, let's check it out and see if there's anything more recent
// But also, given the size, may want to use an alternate source - though the technique 
// probably needs a LOT of images
// (And should avoid adding these to GitHub too)

// Download link on this page: https://obamawhitehouse.archives.gov/blog/2017/01/05/new-lenses-first-social-media-presidency

// Using my iCloud Photos instead, but some challenges:
//  for some reason Processing is drawing the first template image upside-down, not so in other image programs...
//    just an annoying quirk to figure out later
//  the images are much larger (~ 3000 x 2300 px)
//    bigger problem here - can resize the template, but later he loads all
//    images into memory, which isn't feasible with these sizes

// I wrote a quick sketch to resize my iCloud images - using the output for this project
//  of course that means this is no longer a "White House" photo mosaic

import java.io.FilenameFilter;

// use the original full-size file (1200 x 1800) as template
String templateName = "C:\\Users\\Josh\\Pictures\\iCloud Photos\\Downloads\\IMG_0794.JPG";   
PImage template;

// directory containing resized image set
File srcDir = new File("C:\\Users\\Josh\\Pictures\\iCloud Photos\\Downloads\\Smaller");
PImage[] allImages;
float[] brightness;
PImage[] brightImages;

int scl = 16;
int w;
int h;  
  
void setup(){
  size (1200, 1800);

  template = loadImage(templateName);   
  w = template.width / scl;
  h = template.height / scl;  
  template.resize(w, h);
  
  File[] allFiles = getJPGFiles();
  allImages = new PImage[allFiles.length];
  brightness = new float[allFiles.length];
  for (int i = 0; i < allFiles.length; i++){
    PImage tmp = loadImage(allFiles[i].toString());    
    allImages[i] = createImage(scl, scl, RGB);
    allImages[i].copy(tmp, 0, 0, tmp.width, tmp.height, 0, 0, scl, scl);

    allImages[i].loadPixels();
    float avg = 0;
    for (int j = 0; j < allImages[i].pixels.length; j++){
      float b = brightness(allImages[i].pixels[j]);
      avg += b;
    }
    avg = avg / allImages[i].pixels.length;
    brightness[i] = avg;
  }
  println("Done loading images");
  
  brightImages = new PImage[256];
  for (int i = 0; i < brightImages.length; i++){
    float record = 256;
    for (int j = 0; j < brightness.length; j++){ 
      float diff = abs(i - brightness[j]);
      if (diff < record){
        record = diff;
        brightImages[i] = allImages[j];
      }
    }
  }
}

void draw(){
  template.loadPixels();
  for (int x = 0; x < w; x++){
    for (int y = 0; y < h; y++){
      int index = x + y * w;
      //color c = template.pixels[index];
      //fill(brightness(c));
      //noStroke();
      //rect(x * scl, y * scl, scl, scl);
      
      int b = int(brightness(template.pixels[index]));
      image(brightImages[b],x * scl, y * scl, scl, scl);
    }
  } 
  noLoop();
}

File[] getJPGFiles(){
  FilenameFilter filter = new FilenameFilter(){
    public boolean accept(File f, String name){
      if (name.endsWith("jpg") || name.endsWith("JPG")){
        return true;
      } else {
        return false;
      }
    }
  };
  return srcDir.listFiles(filter);
}