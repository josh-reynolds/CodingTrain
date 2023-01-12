// Coding Train
// Coding Challenge 40.3 - TF-IDF
// (Term Frequency - Inverse Document Frequency)
// https://www.youtube.com/watch?v=RPMYV-eb6lI&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=50

// He reverted back to JavaScript for the third part - going to continue on from
// the classic Java version. But the simple IntDict approach won't work now, so my solution 40.1
// is what we will need...

// Formula
// score = frequency in one document * log(total # of documents/# documents word appears in)

import java.util.Map;
import java.util.Collections;
import java.util.Comparator;

String[] files = {"pynchon.txt",
                  "turtle.txt",
                  "molybdenum.txt",
                  "somme.txt",
                  "library.txt",
                  "oscar.txt"};
int sz = files.length;

String[][] tokens;

HashMap<String,WordCount> wordcount;
ArrayList<String> keys;

void setup(){
  size(400,2000);
  background(0);

  tokens = getTokens(joinWords(loadFiles()));
 
  wordcount = new HashMap<String,WordCount>();  
  keys = new ArrayList<String>();  

  countWords(tokens[0]);
  checkDocuments();
  
  displayCount();
}

void checkDocuments(){
  for (String s : keys){
    for (int i = 1; i < tokens.length; i++){
      for (int j = 0; j < tokens[i].length; j++){
        if ( s.equals(tokens[i][j]) ){
          //println("Found " + s + " in " + files[i]);
          wordcount.get(s).incrementIDF();
          break;
        }
      }  
    }
    wordcount.get(s).calculateScore(sz);
  }
}

void countWords(String[] tokens){
  for (String s : tokens){
    String word = s.toLowerCase();
    if (wordcount.get(word) == null){
      wordcount.put(word, new WordCount(1));
      keys.add(word);
    } else {
      wordcount.get(word).incrementTF();
    }
  }
}

String[][] getTokens(String[] allwords){
  String[][] tokens = new String[sz][];
  for (int i = 0; i < sz; i++){
    tokens[i] = splitTokens(allwords[i]," .,;:-–!?/()[]\"\n");
  }
  return tokens;
}

String[] joinWords(String[][] lines){
  String[] allwords = new String[sz];
  for (int i = 0; i < sz; i++){
    allwords[i] = join(lines[i], "\n");
  } 
  return allwords;
}

String[][] loadFiles(){
  String[][] lines = new String[sz][];
  for (int i = 0; i < sz; i++){
    lines[i] = loadStrings(files[i]);
  }
  return lines;
}

void displayCount(){
  Collections.sort(keys, new WCComparator());
  float y = 10;
  textAlign(LEFT,TOP);
  for (String s : keys){
    String display = s + " : " + wordcount.get(s);
    float tSize = 16;
    textSize(tSize);
    float x = 10;
    text(display, x, y);
    y += tSize + 2;
  }
}

class WCComparator implements Comparator<String>{
  public int compare(String a, String b){
    if (wordcount.get(a).score == wordcount.get(b).score){
      return 0;
    } else if (wordcount.get(a).score > wordcount.get(b).score){
      return -1;
    } else {
      return 1;
    }
  }
}