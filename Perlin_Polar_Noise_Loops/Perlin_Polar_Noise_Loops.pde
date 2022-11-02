// https://www.youtube.com/watch?v=ZI1dmHv3MeM

float noisemax = 1;
float phase = 0;
float zoff = 0;

void setup(){
  size(600,600);
}

void draw(){
  //noiseSeed(99);
  background(0);
  translate(width/2,height/2);
  stroke(255);
  noFill();
  noisemax = map(mouseX,0,width,0,10);
  beginShape();
  for (float a = 0; a < TWO_PI; a += 0.1){
    float xoff = map(cos(a),-1,1,0,noisemax);
    float yoff = map(sin(a),-1,1,0,noisemax);
    float r = map(noise(xoff, yoff, zoff), 0, 1, 100, 200);
    float x = r * cos(a);
    float y = r * sin(a);
    vertex(x,y);
  }
  //endShape();
  endShape(CLOSE);
  //noLoop();
  //phase += 0.01;  
  zoff += 0.01;
}