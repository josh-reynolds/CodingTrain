// Coding Train
// Coding Challenge 125 - Fourier Series
// https://www.youtube.com/watch?v=Mm2eYfj0SgA&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=180

// JavaScript conversion

float time = 0;
ArrayList<Float> wave;

int value = 5;

void setup(){
  size(600, 400);
  
  wave = new ArrayList<Float>();
  
  println("Right click to increase value; left click to decrease.");
  println("Range is 1 to 10.");
  
  //frameRate(10);
}

void draw(){
  background(0);
  textSize(36);
  textAlign(LEFT, TOP);
  text(value, 10, 10);
  translate(175, 200);

  float x = 0;
  float y = 0;
  float radius = 0;
  
  for (int i = 0; i < value; i++){
    float prevX = x;
    float prevY = y;
    
    int n = i * 2 + 1;
    radius = 75 * (4 / (n * PI));
    x += radius * cos(n * time);
    y += radius * sin(n * time);

    stroke(255, 100);
    noFill();
    ellipse(prevX, prevY, radius * 2, radius * 2);
  
    fill(255);
    stroke(255);
    line(prevX, prevY, x, y);    
  }
  
  wave.add(0, y);
  translate(200, 0);
  line(x - 200, y, 0, y);  

  beginShape();
    noFill();
    stroke(255, 0, 255);
    for (int i = 0; i < wave.size(); i++){
      vertex(i, wave.get(i));
    }
  endShape();
  
  time += 0.05;
  
  if (wave.size() > 250){
    wave.remove(wave.size() - 1);
  }
}

void mouseClicked(){
  if (mouseButton == LEFT && value > 1){
    value--;
  }
  if (mouseButton == RIGHT && value < 10){
    value++;
  }
}