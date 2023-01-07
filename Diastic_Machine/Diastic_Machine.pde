// Coding Train
// Coding Challenge 37 - Diastic Machine
// https://www.youtube.com/watch?v=u-HUtrpyi1c&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=45

// Another JavaScript video, needs conversion on the fly
// There's a lot of jscript/html interaction in this one
// Just going to focus on the core text manipulation for now,
// can work out input methods later 

String heading = "Jackson Mac Low Diastic Machine";

//String seed = "rainbow";
String seed = "antidisestablishmentarianism";
String inputFile = "input.txt";

String text = "";
String[] words;

void setup(){
  size(600,1200);
  background(235,225,200);
  // he uses noCanvas in P5.js and outputs to html body
  // we'll draw on the canvas in this Java version
  
  int upperBound = drawHeading();

  loadText();
  drawText(upperBound);
   
  String output = diastic(seed, words);
  println(output);
}

String diastic(String s, String[] w){
  String out = "";
  
  for (int i = 0; i < s.length(); i++){
    char c = s.charAt(i);
    //println("looking for " + c + " at " + i); 
    out += findWord(c, i, out.length());
  }
  
  return out;
}

String findWord(char c, int position, int start){
  for (int j = start; j < words.length; j++){
    if (words[j].length() > position){ 
      if (words[j].charAt(position) == c){
        return words[j] + " ";
      }
    } 
  }
  return "";
}

void drawText(int upperBound){
  int textSize = 12;
  int textPadding = 10;
  
  fill(0);
  textSize(textSize);
  textAlign(LEFT,TOP);
  text(text, textPadding, textPadding + upperBound);  
}

int drawHeading(){
  int hSize = 24;
  int hPadding = 10;
  int hBaseline = hSize + hPadding;
  
  fill(0);
  textSize(hSize);
  textAlign(LEFT,TOP);
  text(heading, hPadding, hPadding);
   
  stroke(0);
  line(0,hBaseline,width,hBaseline);
  line(0,hBaseline+2,width,hBaseline+2);
  
  return hBaseline;
}

void loadText(){
  String[] lines = loadStrings(inputFile);
  for (int i = 0; i < lines.length; i++){
    text += lines[i] + "\n";
  }
  words = splitTokens(text.toLowerCase()," ,.;:!?-/\"\n()[]");
}