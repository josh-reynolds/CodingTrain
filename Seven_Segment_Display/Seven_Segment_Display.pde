// Coding Train
// Coding Challenge 117 - Seven-Segment Display
// https://www.youtube.com/watch?v=MlRlgbrAVOs&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=168

// JavaScript conversion

// https://en.wikipedia.org/wiki/Seven-segment_display
//   page has changed since he recorded this - no longer has the explicit encoding table
//   copying values below from the video version

int nums[] = {0x7E, 0x30, 0x6D, 0x79, 0x33, 0x5B, 0x5F, 0x70, 0x7F, 0x7B};

int displayCount = 6;
Display[] displays;

int disWidth = 100;
int top = 40;
int left = 40;
int padding = 20;

void setup(){
  size(800, 400);
  background(25);
  frameRate(2);
  
  displays = new Display[displayCount];
  
  for (int i = 0; i < displayCount; i++){
    displays[i] = new Display(top,  left + (padding * i) + (disWidth * i), disWidth);
  }
  
  println(nf(hour(), 2));
  println(nf(minute(), 2));
  println(nf(second(), 2));
}

void draw(){
  background(25);
  
  String hour   = nf(hour(), 2);
  String minute = nf(minute(), 2);
  String second = nf(second(), 2);
  
  String s = (hour + minute + second);
  
  for (int i = 0; i < displayCount; i++){
    int digit = nums[int(s.substring(i, i+1))];
    displays[i].show(digit);
  }
}