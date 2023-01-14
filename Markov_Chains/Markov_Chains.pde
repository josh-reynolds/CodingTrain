// Coding Train
// Coding Challenge 42 - Markov Chains - Part 1
// https://www.youtube.com/watch?v=eGFJ8vugIWA&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=52

// JavaScript conversion

import java.util.Map;

String inputFile = "input.txt";
String txt;

int order = 3;
HashMap<String, ArrayList> ngrams;

String output;
int chainLength;

void setup(){
  size(600,1400);

  String[] lines = loadStrings(inputFile);
  txt = join(lines, " ");
  output = txt;
  chainLength = txt.length();
  
  ngrams = new HashMap<String, ArrayList>();
  
  for (int i = 0; i <= txt.length() - order; i++){
    String gram = txt.substring(i, i + order);
    
    char c;
    if (i < txt.length() - order){
      c = txt.charAt(i + order);
    } else {
      c = ' ';
    }
    
    if (ngrams.get(gram) == null){
      ArrayList successors = new ArrayList();
      successors.add(c);
      ngrams.put(gram, successors);
    } else {
      ngrams.get(gram).add(c);
    }
  }
}

void markov(){
  output = "";
  
  // get a random start gram and add to output
  String[] keys = ngrams.keySet().toArray(new String[0]);
  int index = floor(random(0, keys.length));
  output += keys[index];
  
  // find a successor and add to output, then repeat from next gram
  for (int i = 0; i  < chainLength; i++){
    ArrayList successors = ngrams.get(output.substring(i, i + order));
    index = floor(random(0, successors.size() - 1));
    output += successors.get(index);  
  }
}

void draw(){
  background(0);
  textSize(14);
  textAlign(LEFT,TOP);
  fill(255);
  text(output, 10, 10, width-10, height-10);
}

void mouseClicked(){
  markov();
}