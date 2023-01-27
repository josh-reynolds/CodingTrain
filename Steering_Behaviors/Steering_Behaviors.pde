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

// I think the discrepancy with Stack Overflow is that it reduces all the points to simple vertices
//   and connects with straight lines. Some of these are actually BEZIER_VERTEX or CURVE_VERTEX.

// Also, FWIW, the P5.js textToPoints() seems to return many more points than my implementation here,
//   which affects the visuals in this demo.

// At very end of the video he mentions a library (Geomerative) that can do all this =/


String s = "Spud";
int size = 192;

PFont font;
TextShape text;

ArrayList<Vehicle> vehicles;

void setup(){
  size(600, 300);

  font = createFont("BAUHS93.TTF", size, true);
  text = new TextShape(s, font, size, 100, 200);

  vehicles = new ArrayList<Vehicle>();
  for (PVector p : text.points){
    vehicles.add(new Vehicle(p.x, p.y));
  }
}

void draw(){
  background(51);
  
  for (Vehicle v : vehicles){
    v.behaviors();
    v.update();
    v.show();
  }
}