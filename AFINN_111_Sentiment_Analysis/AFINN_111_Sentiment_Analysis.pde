// Coding Train
// Coding Challenge 44.1 - AFINN-111 Sentiment Analysis, Part 1
// https://www.youtube.com/watch?v=uw3GbsY_Pbc&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=55

// JavaScript conversion
// He converts data to JSON, following suit here, though this could
// also be handled via loadTable + Table objects


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
      words.add(tokens[j]);
    }
  }

  JSONObject afinn = loadJSONObject(JSONfile);
  int score = 0;
  
  for (String w : words){
    if (!afinn.isNull(w)){
      println("Adding " + w + " = " + afinn.getInt(w));
      score += afinn.getInt(w);
    }
  }
  write(score);
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

void write(Integer i){
  textSize(64);
  textAlign(CENTER, CENTER);
  fill(255);
  background(0);
  text(str(i), width/2, height/2);
}