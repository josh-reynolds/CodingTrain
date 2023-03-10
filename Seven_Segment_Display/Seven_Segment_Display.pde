// Coding Train
// Coding Challenge 117 - Seven-Segment Display
// https://www.youtube.com/watch?v=MlRlgbrAVOs&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=168

// JavaScript conversion

// https://en.wikipedia.org/wiki/Seven-segment_display
//   page has changed since he recorded this - no longer has the explicit encoding table
//   copying values below from the video version

int nums[] = {0x7E, 0x30, 0x6D, 0x79, 0x33, 0x5B, 0x5F, 0x70, 0x7F, 0x7B};
 
void setup(){
  size(400, 400);
  frameRate(2);
}

void draw(){
  background(50);
  
  int counter = frameCount % nums.length;
  sevenSegments(nums[counter]);  
}

color getColor(int _value, int _shift){
  float alpha = 255 * ((_value >> _shift) & 1);
  return color(255, 0, 0, alpha);
}

void sevenSegments(int _value){
  //println("0x" + hex(_value, 2));
  //println(binary(_value, 8));
  
  int segL = 125;
  int segW = 25;
  
  int top = 40;
  int left = 80;
  
  int x1 = left + segW / 2;
  int x2 = left + segW + segL / 2;
  int x3 = left + segW + segL + segW / 2;
  
  int y1 = top + segW / 2;
  int y2 = top + segW + segL / 2;
  int y3 = top + segW + segL + segW / 2;
  int y4 = top + segW + segL + segW + segL / 2;
  int y5 = top + segW + segL + segW + segL + segW / 2;

  //// A
  fill(getColor(_value, 6));
  drawSegment(x2, y1, segL, segW, false);
  //// B
  fill(getColor(_value, 5));
  drawSegment(x3, y2, segL, segW, true);
  //// C
  fill(getColor(_value, 4));
  drawSegment(x3, y4, segL, segW,  true);
  //// D
  fill(getColor(_value, 3));
  drawSegment(x2, y5, segL, segW, false);
  //// E
  fill(getColor(_value, 2));
  drawSegment(x1, y4, segL, segW, true);
  //// F
  fill(getColor(_value, 1));
  drawSegment(x1, y2, segL, segW, true);
  //// G
  fill(getColor(_value, 0));
  drawSegment(x2, y3, segL, segW, false);
}

void drawSegment(int _x, int _y, int _l, int _w, boolean _vertical){
  int w = _w;
  int l = _l;
  if (_vertical){
    w = _l;
    l = _w;
  }
    
  pushMatrix();
    rectMode(CENTER);    
    stroke(0);
    //noStroke();
    rect(_x, _y, l, w, _w);
  popMatrix();
}