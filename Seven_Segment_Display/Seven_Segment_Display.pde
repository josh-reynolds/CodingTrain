// Coding Train
// Coding Challenge 117 - Seven-Segment Display
// https://www.youtube.com/watch?v=MlRlgbrAVOs&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=168

// JavaScript conversion

// https://en.wikipedia.org/wiki/Seven-segment_display
//   page has changed since he recorded this - no longer has the explicit encoding table
//   copying values below from the video version

int displayCount = 6;
Display[] displays;

int disWidth = 100;   // unfortunately 'displayWidth' is a keyword
int padding = 20;

//   |- p -|- D -|- p -|- D -|- p -|- p -|- p -|- D -|- p -|- D -|- p -|- p -|- p -|- D -|- p -|- D -|- p -|
//           HOUR        HOUR        SEP         MIN         MIN         SEP         SEC         SEC
// 6  x DisplayWidth = 600
// 11 x Padding      = 220
// TOTAL WIDTH       = 820

// SegmentLength  = DisplayWidth * 5 / 7;
// SegmentWidth   = SegmentLength / 5 = DisplayWidth / 7;
// Display Height = 2 x SegmentLength + 3 x SegmentWidth 
//                = 2 x (DisplayWidth x 5/7) + 3 x (DisplayWidth/7)
//                = (13 x DisplayWidth)/7
//                = 185.71
// TOTAL HEIGHT   = 185.71 + 2 x Padding = 225.71

// Why did I choose sevenths as the proportion? :)

void setup(){
  size(820, 226);
  background(25);
  frameRate(2);
  
  displays = new Display[displayCount];
  
  displays[0] = new Display(padding, (padding * 1), disWidth);                   // HOUR first digit
  displays[1] = new Display(padding, (padding * 2) + disWidth, disWidth);        // HOUR second digit
  
  displays[2] = new Display(padding, (padding * 5) + (disWidth * 2), disWidth);  // MINUTE first digit
  displays[3] = new Display(padding, (padding * 6) + (disWidth * 3), disWidth);  // MINUTE second digit
  
  displays[4] = new Display(padding, (padding * 9) + (disWidth * 4), disWidth);  // SECOND first digit
  displays[5] = new Display(padding, (padding * 10) + (disWidth * 5), disWidth); // SECOND second digit
}

void draw(){
  background(25);
  
  String hour   = nf(hour(), 2);
  String minute = nf(minute(), 2);
  String second = nf(second(), 2);
  
  String s = (hour + minute + second);
  
  for (int i = 0; i < displayCount; i++){
    displays[i].show(int(s.substring(i, i+1)));
  }
  
  ellipseMode(CORNER);
  fill(255, 0, 0);
  ellipse(disWidth * 2 + padding * 3, padding * 3, padding, padding);
  ellipse(disWidth * 2 + padding * 3, padding * 7, padding, padding);
  ellipse(disWidth * 4 + padding * 7, padding * 3, padding, padding);
  ellipse(disWidth * 4 + padding * 7, padding * 7, padding, padding);
}