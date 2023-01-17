// Coding Train
// Coding Challenge 44.2 - AFINN-111 Sentiment Analysis, Part 2
// https://www.youtube.com/watch?v=VV1JmMYceJw&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=56

// JavaScript conversion
// Part 1 was just the JSON handling, though I completed the analysis
// Watching Part 2 to see if there are any tweaks to make here

String JSONfile = "AFINN-111.json";
String text = "input.txt";

void setup(){
  size(200, 200);  
  //convertOriginalToJSON();  // only needed to do this once, but leaving in 

  String[] lines = loadStrings(text);
  ArrayList<String> words = new ArrayList<String>();

  for (int i = 0; i < lines.length; i++){
    String[] tokens = splitTokens(lines[i], " ,.;:/()[]\"\n");
    for (int j = 0; j < tokens.length; j++){
      words.add(tokens[j].toLowerCase());
    }
  }

  JSONObject afinn = loadJSONObject(JSONfile);
  int score = 0;
  float comparative = 0.0;
  
  for (String w : words){
    if (!afinn.isNull(w)){
      println("Adding " + w + " = " + afinn.getInt(w));
      score += afinn.getInt(w);
    }
  }
  comparative = (float)score / words.size();
  write(score, comparative);
}

void convertOriginalToJSON(){
  // tab delimited file from 
  // https://github.com/fnielsen/afinn/blob/master/afinn/data/AFINN-111.txt
  String originalFile = "AFINN-111.txt";

  JSONObject json = new JSONObject();
  String[] lines = loadStrings(originalFile);

  for (int i = 0; i < lines.length; i++){
    String[] tokens = splitTokens(lines[i],"\t");
    json.setInt(tokens[0], int(tokens[1]));  
  }

  saveJSONObject(json, JSONfile);
}

void write(Integer i, Float f){
  String txt = str(i) + "\n" + nfp(f,0,2);
  
  textSize(36);
  textAlign(CENTER, CENTER);
  fill(255);
  background(0);
  text(txt, width/2, height/2);
}