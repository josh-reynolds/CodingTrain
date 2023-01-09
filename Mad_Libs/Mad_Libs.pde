// Coding Train
// Coding Challenge 39 - Mad Libs
// https://www.youtube.com/watch?v=ziBO-U2_t3k&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=47

// Another JavaScript video, needs conversion on the fly
// HTML and Google forms interactivity in this one
// will do this via local csv instead
// awkward text handling here - should come back a do a more robust regex solution
// layout and wrapping from Word_Interactor would also be good to add
// he randomizes across multiple rows too, should add

String heading = "Mad Libs";
int upperBound;

Table input;
int textSize = 14;
int lineNumber = 0;

String template = "$$EXCLAMATION$$! they said $$ADVERB$$ as they jumped into their $$ADJECTIVE$$ $$NOUN$$ and flew off with their $$PLURALNOUN$$.";  

void setup(){
  size(900,400);
  upperBound = drawHeading();
  input  = loadTable("input.csv", "header");
}

void draw(){
  background(235,225,200);  
  drawHeading();
  for (TableRow tr : input.rows()){
    drawText(generate(tr));
  }
  lineNumber = 0;
}

String generate(TableRow tr){
  String exclamation = tr.getString("Exclamation") + "!";
  String adverb      = tr.getString("Adverb");
  String noun        = tr.getString("Noun");
  String adjective   = tr.getString("Adjective");
  String pluralnoun  = tr.getString("PluralNoun");
  
  String[] t = splitTokens(template, " !.");
  for (int i = 0; i < t.length; i++){
    String s = t[i];
    if (s.equals("$$EXCLAMATION$$")){ t[i] = exclamation; }
    if (s.equals("$$ADVERB$$"     )){ t[i] = adverb; }
    if (s.equals("$$NOUN$$"       )){ t[i] = noun; }
    if (s.equals("$$ADJECTIVE$$"  )){ t[i] = adjective; }
    if (s.equals("$$PLURALNOUN$$" )){ t[i] = pluralnoun; }
  }
  return join(t, " ");
}

void drawText(String s){
  int tPadding = 10;
  int line = upperBound + tPadding + textSize * lineNumber;
  
  fill(0);
  textSize(textSize);
  textAlign(LEFT,TOP);
  text(s, tPadding, line);
  lineNumber++;
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