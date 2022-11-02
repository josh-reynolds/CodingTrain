// https://www.youtube.com/watch?v=Lv9gyZZJPE0&list=PLRqwX-V7Uu6bgPNQAdxQZpJuJCjeOr7VD&index=13

float increment = 0.01;
float zoff = 0.0;
float zincrement = 0.01;

OpenSimplexNoise noise;

void setup(){
  size(640, 360);
  noise = new OpenSimplexNoise();
}

void draw(){
  loadPixels();
  
  float xoff = 0.0;
  
  for (int x = 0; x < width; x++){
    xoff += increment;
    float yoff = 0.0;
    for (int y =0; y < height; y++){
      yoff += increment;
      
      // pure random noise - - - - - 
      //float bright = random(0,255);
      
      // classic Perlin noise - - - - - 
      //float bright = noise(xoff,yoff,zoff)*255;
      
      // cow spot / Rorschach pattern (via OpenSimplex) - - - - - 
      //float n = (float)noise.eval(xoff,yoff,zoff)*255;
      //float bright = map(n,-1,1,0,255);
      
      // OpenSimplex noise - - - - 
      float n = (float)noise.eval(xoff,yoff,zoff);
      float bright = map(n,-1,1,0,255);
      
      pixels[x+y*width] = color(bright,bright,bright);
    }
  }
  updatePixels();
  zoff += zincrement;
}