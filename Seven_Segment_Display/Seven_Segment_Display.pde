// Coding Train
// Coding Challenge 117 - Seven-Segment Display
// https://www.youtube.com/watch?v=MlRlgbrAVOs&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=168

// JavaScript conversion

// https://en.wikipedia.org/wiki/Seven-segment_display
//   page has changed since he recorded this - no longer has the explicit encoding table
//   copying values below from the video version

int number = 47396;

String num;
int nums[] = {0x7E, 0x30, 0x6D, 0x79, 0x33, 0x5B, 0x5F, 0x70, 0x7F, 0x7B};

Display[] displays;

int disWidth = 120;
int top = 40;
int left = 40;
int padding = 20;

void setup(){
  size(800, 400);
  background(25);
  frameRate(2);
  
  num = ((Integer)number).toString();
  displays = new Display[num.length()];
  
  for (int i = 0; i < num.length(); i++){
    displays[i] = new Display(top,  left + (padding * i) + (disWidth * i), disWidth);
  }
}

void draw(){
  background(25);
  
  for (int i = 0; i < num.length(); i++){
    int digit = nums[int(num.substring(i,i+1))];
    displays[i].show(digit);
  }
}