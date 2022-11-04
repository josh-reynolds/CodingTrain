// Coding Train
// Coding Challenge 13 - Reaction Diffusion Algorithm in p4.js
// https://www.youtube.com/watch?v=BV9ny785UNc&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=16

// He's doing it in p5.js, but I'll stick with classic Java Processing

Cell[][] grid;
Cell[][] next;

// Algorithm values from Karl Sims (http://karlsims.com)

// Diffusion A = 1.0
// Diffusion B = 0.5
// feed = 0.055
// kill = 0.062

float dA = 1.0;
float dB = 0.5;
float feed = 0.055;
float kill = 0.062;

// center weight = -1.0
// edge weight = 0.05
// corner weight = 0.2

void setup(){
  size(200, 200);
  pixelDensity(1);
  
  grid = new Cell[width][height];
  next = new Cell[width][height];
  
  for (int x = 0; x < width; x++){
    for (int y = 0; y < height; y++){
      grid[x][y] = new Cell(1,0); 
      next[x][y] = new Cell(1,0);
    }
  }

  // SEED LOCATIONS ------------------------
  
  for (int i = 0; i < 10; i++){
    for (int j = 0; j < 10; j++){
      grid[95 + i][95 + j].b = 1;
    }
  }

  for (int i = 0; i < 10; i++){
    for (int j = 0; j < 10; j++){
      grid[83 + i][141 + j].b = 1;
    }
  }

  for (int i = 0; i < 10; i++){
    for (int j = 0; j < 10; j++){
      grid[172 + i][18 + j].b = 1;
    }
  }
}

void draw(){
  background(51);

  for (int x = 1; x < width - 1 ; x++){
    for (int y = 1; y < height - 1 ; y++){
      float a = grid[x][y].a;
      float b = grid[x][y].b;
      
      next[x][y].a = a + 
                     (dA * laplaceA(x, y)) - 
                     (a * b * b) +
                     (feed * (1 - a));

      next[x][y].b = b + 
                     (dB * laplaceB(x, y)) + 
                     (a * b * b) -
                     ((kill + feed) * b);
      
      next[x][y].a = constrain(next[x][y].a, 0, 1);
      next[x][y].b = constrain(next[x][y].b, 0, 1);
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

float laplaceA(int x, int y){
  float sumA = 0;

  sumA += grid[x][y].a * -1;
  
  sumA += grid[x-1][y].a * 0.2;
  sumA += grid[x+1][y].a * 0.2;
  sumA += grid[x][y-1].a * 0.2;
  sumA += grid[x][y+1].a * 0.2;
  
  sumA += grid[x-1][y-1].a * 0.05;
  sumA += grid[x-1][y+1].a * 0.05;
  sumA += grid[x+1][y-1].a * 0.05;
  sumA += grid[x+1][y+1].a * 0.05;
  
  return sumA;
}

float laplaceB(int x, int y){
  float sumB = 0;
  
  sumB += grid[x][y].b * -1;
  
  sumB += grid[x-1][y].b * 0.2;
  sumB += grid[x+1][y].b * 0.2;
  sumB += grid[x][y-1].b * 0.2;
  sumB += grid[x][y+1].b * 0.2;
  
  sumB += grid[x-1][y-1].b * 0.05;
  sumB += grid[x-1][y+1].b * 0.05;
  sumB += grid[x+1][y-1].b * 0.05;
  sumB += grid[x+1][y+1].b * 0.05;  
  
  return sumB;
}