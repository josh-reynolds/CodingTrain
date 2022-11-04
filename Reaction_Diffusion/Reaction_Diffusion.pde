// Coding Train
// Coding Challenge 13 - Reaction Diffusion Algorithm in p4.js
// https://www.youtube.com/watch?v=BV9ny785UNc&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=16

// He's doing it in p5.js, but I'll stick with classic Java Processing

Cell[][] grid;
Cell[][] next;

// Diffusion A = 1.0
// Diffusion B = 0.5
// feed = 0.055
// kill = 0.062

float dA = 1.0;
float dB = 0.5;
float feed = 0.055;
float kill = 0.062;

void setup(){
  size(200, 200);
  pixelDensity(1);
  
  grid = new Cell[width][height];
  next = new Cell[width][height];
  
  for (int x = 0; x < width; x++){
    for (int y = 0; y < height; y++){
      grid[x][y] = new Cell(random(1),random(1)); 
      next[x][y] = new Cell(0,0);
    }
  }
}

void draw(){
  background(51);

  for (int x = 0; x < width; x++){
    for (int y = 0; y < height; y++){
      float a = grid[x][y].a;
      float b = grid[x][y].b;
      
      next[x][y].a = a + 
                     (dA * laplaceA() * a) - 
                     (a * b * b) +
                     (feed * (1 - a));

      next[x][y].b = b + 
                     (dB * laplaceB() * b) + 
                     (a * b * b) -
                     ((kill +feed) * b);

    }
  }
   
  loadPixels(); 
  for (int x = 0; x < width; x++){
    for (int y = 0; y < height; y++){
      int pix = x + y * width;
      
      color c = color(next[x][y].a * 255,
                      0,
                      next[x][y].b * 255,
                      255);
            
      pixels[pix] = c;
    }
  }
  updatePixels();

  swap();
}

void swap(){
  Cell[][] temp = grid;
  grid = next;
  next = temp;
}