// Coding Train
// Coding Challenge 42 - Markov Chains - Part 2
// https://www.youtube.com/watch?v=9r8CmofnbAQ&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=53

// JavaScript conversion

String inputFile = "input.txt";
int order = 3;

HashMap<String, ArrayList> ngrams;
IntDict startGrams;

String output;
int outputLineCount;

void setup(){
  size(600,1400);

  String[] titles = loadStrings(inputFile);
  outputLineCount = titles.length;  

  getNgrams(titles);
  getStartGrams(titles);
  
  output = join(titles, "\n");
}

void getStartGrams(String[] titles){
  startGrams = new IntDict();
  for (int i = 0; i < titles.length; i++){
    String gram = titles[i].substring(0, order);
    
    if (startGrams.hasKey(gram)){
      startGrams.increment(gram);
    } else {
      startGrams.set(gram,1);
    }
  }
}

void getNgrams(String[] titles){
  ngrams = new HashMap<String, ArrayList>();
  String txt;
  for (int j = 0; j < titles.length; j++){
    txt = titles[j];
  
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
}

void markov(){
  output = "";
  
  for (int i = 0; i < outputLineCount; i++){
    String line = "";
    
    // get a random start gram from established set and add to line
    String[] keys = startGrams.keyArray();
    int index = floor(random(0, keys.length));
    line += keys[index];
  
    // find a successor and add to line, then repeat from next gram
    boolean hasSuccessor = true;
    int j = 0;
    while (hasSuccessor){
      String k = line.substring(j, j + order);
      ArrayList successors = ngrams.get(k);
      
      if (successors == null){
        hasSuccessor = false;
      } else {
        index = floor(random(0, successors.size() - 1));
        line += successors.get(index);
      }
      
      j++;
    }
    
    line += "\n";
    output += line;
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