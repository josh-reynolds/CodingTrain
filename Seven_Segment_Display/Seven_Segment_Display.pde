// Coding Train
// Coding Challenge 117 - Seven-Segment Display
// https://www.youtube.com/watch?v=MlRlgbrAVOs&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=168

// JavaScript conversion

// https://en.wikipedia.org/wiki/Seven-segment_display
//   page has changed since he recorded this - no longer has the explicit encoding table
//   copying values below from the video version

Display display1, display2;

int nums[] = {0x7E, 0x30, 0x6D, 0x79, 0x33, 0x5B, 0x5F, 0x70, 0x7F, 0x7B};
 
void setup(){
  size(400, 400);
  background(50);
  frameRate(2);
  
  display1 = new Display(40,  80, 120);
  display2 = new Display(40, 220, 120);
}

void draw(){
  background(50);
  
  int counter = frameCount % nums.length;
  display1.show(nums[counter]);
  display2.show(nums[counter]);
}