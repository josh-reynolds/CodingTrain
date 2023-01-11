// Coding Train
// Coding Challenge 40.2 - Word Counter in Processing
// https://www.youtube.com/watch?v=fxQ0B6BkfKo&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=49

// Already did this from the previous video - seeing how his 'official' version compares
// He uses IntDict, which is simpler than my HashMap solution
// Going to check this in to the same folder/project as a later commit for comparison

String inputFile = "input.txt";
IntDict counts;

void setup(){
  size(1200,1200);
  background(0);
  counts = new IntDict();
  String[] lines = loadStrings(inputFile);
  String allwords = join(lines, "\n");
  String[] tokens = splitTokens(allwords," .,;:-–!?/()[]\"\n");
  
  for (int i = 0; i < tokens.length; i++){
    String word = tokens[i].toLowerCase();
    if (counts.hasKey(word)){
      counts.increment(word);
    } else {
      counts.set(word,1);
    }
  }

  counts.sortValuesReverse();
  
  int[] values = counts.valueArray();
  int max = values[0];
  int min = values[values.length-1];
  
  String[] keys = counts.keyArray();
  for (String s : keys){
    int count = counts.get(s);
    textSize(map(count,min,max,16,48));
    float x = random(width);
    float y = random(height);
    text(s, x, y);
  }
}