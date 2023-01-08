class Word{
  String text;
  PVector pos;
  float sz;
  float w;
  
  boolean focus;
  color c;
  
  Word(String _s, float _x, float _y, float _size, float _width){
    text = _s;
    pos = new PVector(_x, _y);
    sz = _size;
    //w = _width;
    focus = false;
    c = color(0);
  }
  
  void update(){
    if (mouseX > pos.x && mouseX < pos.x + textWidth(text) && mouseY > pos.y && mouseY < pos.y + sz){
      focus = true;
      this.text = "foo!";
    } else {
      focus = false;
    }    
  }
  
  void display(){
    fill(c);
    textSize(sz);
    textAlign(LEFT,TOP);
    text(text, pos.x, pos.y);
    
    if (focus){
      stroke(c);
      strokeWeight(1);
      noFill();
      rect(pos.x, pos.y, textWidth(text), sz);
    }
  }
}