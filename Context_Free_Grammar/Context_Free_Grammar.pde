// Coding Train
// Coding Challenge 43 - Context-Free Grammar
// https://www.youtube.com/watch?v=8Z9FRiW2Jlc&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=54

// JavaScript conversion

Grammar g;

void setup(){
  size(400, 400);
  
  g = new Grammar();  
  run();
  println("Click the mouse to generate another sentence");
}

void run(){
    String start = randomString(g.rules.get("S"));
    ArrayList<String> expansion = new ArrayList<String>();
    
    expand(start, expansion);
    writeText(expansion);
}

void expand(String s, ArrayList<String> a){
  String[] tokens = splitTokens(s, " ");

  for (String t : tokens){
    if ( g.rules.containsKey(t) ){
      String pick = randomString( g.rules.get(t) );
      expand(pick, a);
    } else {
      a.add(t);
    } 
  }
}

void writeText(ArrayList<String> e){
  String text = joinArrayList(e);
  textSize(20);
  fill(255);
  background(0);
  text(text, 10, 10, width - 10, height - 10);
}

void mouseClicked(){ run(); }
void draw(){} // need draw() to respond to mouse events

String randomString(String[] choices){
  return choices[ floor(random(choices.length)) ];
}

String joinArrayList(ArrayList<String> e){
  String result = "";
  for (String s : e){
    result += s + " ";
  }
  return result;
}