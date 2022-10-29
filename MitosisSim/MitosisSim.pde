// The Coding Train
// Coding Challenge 6 - Mitosis Simulation
// https://www.youtube.com/watch?v=jxGS3fKPKJA&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=6

ArrayList<Cell> cells;

void setup(){
  size(700, 700);
  cells = new ArrayList<Cell>();
  
  for (int i = 0; i < 6; i++){
    cells.add(new Cell(new PVector(random(width), random(height)), 
                       40, 
                       color(random(100,255), 0, random(100,255), 100)));
  }
}

void draw(){
  background(200);
  for (Cell c : cells){
    c.move();
    c.show();
    c.grow();
  }
}

void mousePressed(){
  // Shiffman's approach using jscript arrays runs into
  // problems with Java arrays or arraylists
  // can't modify list safely during the loop, so try another strategy
  ArrayList<Cell> additions = new ArrayList<Cell>();
  for (Cell c : cells){
    if (c.clicked(mouseX, mouseY)){
      additions.add(c.mitosis());
      additions.add(c.mitosis());
      c.remove = true;
    }
  }
  cells.addAll(additions);
  
  for (int i = cells.size()-1; i >= 0; i--){
    Cell c = cells.get(i);
    if (c.remove){
      cells.remove(c); 
    }
  }
}