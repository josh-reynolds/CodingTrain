// Coding Train
// Coding Challenge 59 - Steering Behaviors
// https://www.youtube.com/watch?v=4hA7G3gup-4&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=76

// JavaScript conversion

// The video's approach is to use Processing VLW font and PFont.textToPoints, but that 
//  appears to be JavaScript only. Equivalent for classic Processing is PFont.getShape but
//  though it claims to produce a PShape (and code reflection agrees), it does not render.

//  Stack Overflow discussion with a possible solution:
//    https://stackoverflow.com/questions/52691716/what-is-processing-equivalent-of-p5-js-texttopoints-functions-for-fonts

//  But experimentation reveals some limitations:
//    * Takes just one character
//    * Seems very low-resolution conversion - my test sample is very blocky
//    * It flickers and wiggles about when doing this in draw()

//  Ah! There's apparently some hidden styles added with getShape - adding a call
//  to PShape.disableStyle() renders the shape itself, and it clears up many of the above issues
//  though I still need to work around the single character issue. Whipped together a function
//  to build up the desired shape.

// All the above is a distraction from the main focus of course - this isn't a challenge about rendering fonts 
//  (tangent - might want to respond to the Stack Overflow post with this code...)

PFont font;
PShape text;

String s = "Spud";
int size = 192;

float[] offsets;
ArrayList<PVector> points;

void setup(){
  size(600, 300);
  font = createFont("BAUHS93.TTF", size, true);
  offsets = new float[s.length()];
  text = createTextShape(s);
  points = getPoints(text, 100, 200);
}

void draw(){
  background(51);  
  
  fill(255, 125, 0);
  stroke(255);
  shape(text, 100, 200);

  fill(255, 0, 0);
  noStroke();
  for (PVector p : points){
    ellipse(p.x, p.y, 10, 10);
  }
}

ArrayList<PVector> getPoints(PShape _s, float _x, float _y){    // top-left corner
  ArrayList<PVector> a = new ArrayList<PVector>();
  float offset;
  for (int i = 0; i < _s.getChildCount(); i++){
    PShape c = _s.getChild(i);
    offset = offsets[i];
    for (int j = 0; j < c.getVertexCount(); j++){
      float x = c.getVertex(j).x + _x + offset;
      float y = c.getVertex(j).y + _y;
      a.add(new PVector(x, y));
    }
  }
  return a;
}

PShape createTextShape(String s){
  PShape group = createShape(GROUP);
  float offset = 0;
  for (int i = 0; i < s.length(); i++){
    char c = s.charAt(i);
    PShape glyph = font.getShape(c);
    glyph.translate(offset, 0);
    offsets[i] = offset;
    offset += glyph.width;
    group.addChild(glyph);
  }
  group.disableStyle();
  return group;
}