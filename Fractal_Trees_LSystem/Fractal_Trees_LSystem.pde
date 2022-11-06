// Coding Train
// Coding Challenge 16 - L-System Fractal Trees
// https://www.youtube.com/watch?v=E1B4UoSQMFw&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=19
// https://en.wikipedia.org/wiki/L-system

// Again javascript, recoding in Java
// Need to deviate pretty far on this one, lots of P5J features used in the video
// that aren't available in Java

// TUTORIAL RULESET
// variables: A B
// axiom: A
// rules (A -> AB), (B -> A)

// TURTLE GRAPHICS RULESET
// variables: F + - [ ]
// axiom: F
// rules F -> FF+[+F-F-F]-[-F+F+F]

int len = 100;
float angle;

String generate(String input, Rule[] rules){
  len *= 0.5;
  String nextSentence = "";
  for (int i = 0; i < input.length(); i++){
    char current = input.charAt(i);
    
    Boolean match = false;
    for (int j = 0; j < rules.length; j++){
      if (current == rules[j].in){
        nextSentence += rules[j].out;
        match = true;
        break;
      }
    }
    if (!match){ nextSentence += current; }    
  }
  return nextSentence;
}

void turtle(String input){
  background(51);  
  resetMatrix();
  translate(width/2,height);
  stroke(255,100);

  for (int i = 0; i < input.length(); i++){
    char current = input.charAt(i);
    
    if (current == 'F'){
      line(0, 0, 0, -len);
      translate(0, -len);
    } else if (current == '+'){
      rotate(angle);
    } else if (current == '-'){
      rotate(-angle);
    } else if (current == '['){
      pushMatrix();
    } else if (current == ']'){
      popMatrix();
    }
  }
}

void setup(){
  size(400, 400);
  background(51);  
  
  angle = radians(25);
  
  String axiom = "F"; 
  String sentence = axiom;

  Rule[] rules = new Rule[1];                           // more flexible with ArrayList, but whatever...  
  rules[0] = new Rule('F',"FF+[+F-F-F]-[-F+F+F]");
  //rules[1] = new Rule('B',"A");                       // Leftover from first ruleset - 
                                                        // leaving in to illustrate a multiple-rule
                                                        // system. The turtle graphics solution only needs one.
  
  println("START -----------------");
  
  // huge perf hit from 5 - 6 generations
  for (int i = 0; i < 5; i++){
    //println(sentence);
    turtle(sentence);
    sentence = generate(sentence, rules);
  }
  
  println("END ---------------");
}