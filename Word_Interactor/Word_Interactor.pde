// Coding Train
// Coding Challenge 38 - Word Interactor
// https://www.youtube.com/watch?v=AKuW48WeNMA&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=46

// Another JavaScript video, needs conversion on the fly
// Like Diastic Machine, this takes advantage of HTML/JavaScript UI capabilities
// Will need to work something out from scratch in classic Java Processing

// Basic functionality is working - a few basic interactions are in place, many more possible
// Should add recalculation of word coordinates when any size parameters change
//   Currently, if text changes (or textSize), everything stays in place


String heading = "Word Interactor";
int upperBound;
String inputFile = "input.txt";
Word[] words;
int textSize = 14;

void setup(){
  size(600,1200);
  upperBound = drawHeading();
  newText(loadText());
}

void draw(){
  background(235,225,200);  
  drawHeading();
  for (Word w : words){
    w.update();
    w.display();
  }
}

void newText(String s){
  String[] a = splitString(s);
  words = new Word[a.length];
  getWords(a);
}

void getWords(String[] a){
  int textPadding = textSize * 5 / 6;

  PVector cursor = new PVector(textPadding, textPadding + upperBound); 
  for (int i = 0; i < a.length; i++){
    int w = floor(textWidth(a[i]));
    
    if (cursor.x + w > width){
      cursor.y += textSize;
      cursor.x = textPadding;
    }

    words[i] = new Word(a[i], cursor.x, cursor.y, textSize, w);
    cursor.x += w;
  }  
}

void mousePressed(){
  for (Word w : words){
    if (w.focus){ 
      w.c = color(255, 0, 255);
      println(w.text);
    }
  }
}

void mouseReleased(){
  for (Word w : words){
      w.c = color(0);
  }
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

String loadText(){
  String[] lines = loadStrings(inputFile);
  String text = "";
  for (int i = 0; i < lines.length; i++){
    text += lines[i] + "\n";
  } 
  return text;
}

String[] splitString(String s){
  //return splitTokens(s.toLowerCase(), " ,.;:!?-/\"\n()[]");
  return splitTokens(s, " ./\"\n()[]");
}