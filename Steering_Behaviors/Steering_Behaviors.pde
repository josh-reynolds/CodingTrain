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

String s = "Spud";
int size = 192;

PFont font;
TextShape text;

void setup(){
  size(600, 300);

  font = createFont("BAUHS93.TTF", size, true);
  text = new TextShape(s, font, size, 100, 200);
}

void draw(){
  background(51);  
  
  fill(255, 125, 0);
  stroke(255);
  shape(text.shape, text.xOffset, text.yOffset);

  fill(255, 0, 0);
  noStroke();
  for (PVector p : text.points){
    ellipse(p.x, p.y, 10, 10);
  }
}