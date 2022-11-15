// Coding Train
// Coding Challenge 22 - Julia Set
// https://www.youtube.com/watch?v=fAsaSkmbF5s&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=25

float angle = 0;

void setup(){
  size(640, 320);
  colorMode(HSB,1); 
}

void draw(){
  
  //float ca = -0.8;
  //float cb = 0.156;
  
  //float ca = map(mouseX, 0, width, -1, 1);
  //float cb = map(mouseY, 0, height, -1, 1);
  
  float ca = cos(angle*3.213);
  float cb = sin(angle);
  
  angle += 0.02;

  background(1);

  //float w = 5;
  float w = abs(sin(angle))*5;
  float h = (w * height) / width;

  float xmin = -w/2;
  float ymin = -h/2;

  loadPixels();

  int maxiterations = 100;
  
  float xmax = xmin + w;
  float ymax = ymin + h;

  float dx = (xmax - xmin) / (width);
  float dy = (ymax - ymin) / (height);
  
  float y = ymin;
  for (int j = 0; j < height; j++){
    float x = xmin;
    for (int i = 0; i < width; i++){    
      float a = x;
      float b = y;
      int n = 0;
      while (n < maxiterations){
        float aa = a * a;
        float bb = b * b;

        if (aa + bb > 4.0){
          break;
        }

        float twoab = 2.0 * a * b;      
        a = aa - bb + ca;
        b = twoab + cb;     
        n++;
      }
    
      int pix = (i + j * width);
      if (n == maxiterations){
        pixels[pix] = color(0);
      } else {
        float hue = sqrt(float(n)/maxiterations);
        pixels[pix] = color(hue, 255, 150);
      }
      x += dx;
    }
    y += dy;
  }
  updatePixels();
  println(frameRate);
}