// Coding Train
// Coding Challenge 40.1 - Word Counter in JavaScript
// https://www.youtube.com/watch?v=unm0BLor8aE&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=48

// Another JavaScript video, needs conversion on the fly
// The following video appears to be the same thing in classic Java Processing
// But I'm going to try conversion first and see how it goes... not too bad...

import java.util.Map;
import java.util.Collections;
import java.util.Comparator;

String inputFile = "input.txt";
HashMap<String,Integer> wordcount;
ArrayList<String> keys;

void setup(){
  size(100,100);
  noLoop();
  
  String[] tokens = splitTokens(loadText().toLowerCase()," .,;:-–!?/()[]\"\n"); 
  wordcount = new HashMap<String,Integer>();
  keys = new ArrayList<String>();
  
  for (String s : tokens){
    if (wordcount.get(s) == null){
      wordcount.put(s, 1);
      keys.add(s);
    } else {
      wordcount.put(s, wordcount.get(s) + 1);
    }
  }

  Collections.sort(keys, new CountComparator());
  
  for (String s : keys){
    println(s + " : " + wordcount.get(s));
  }
}

String loadText(){
  String[] lines = loadStrings(inputFile);
  return join(lines, "\n");
}

class CountComparator implements Comparator<String>{
  public int compare(String a, String b){
    if (wordcount.get(a) == wordcount.get(b)){
      return 0;
    } else if (wordcount.get(a) > wordcount.get(b)){
      return -1;
    } else {
      return 1;
    }
  }
}