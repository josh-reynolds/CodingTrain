class Rectangle {
  float x, y;  // x,y is the center
  float w, h;  // w,h are distance to edge from center ('radius' like)
  
  Rectangle(float _x, float _y, float _w, float _h){
    x = _x;
    y = _y;
    w = _w;
    h = _h;
  }
  
  boolean contains(Point _p){
    return (_p.x >= (x - w) && _p.x <= (x + w) && 
            _p.y >= (y - h) && _p.y <= (y + h));
  }
  
  String toString(){
    return("(" + x + ", " + y + ", " + w + ", " + h + ")");
  }
  
  void show(){
    fill(255);
    stroke(0);
    strokeWeight(1);
    rectMode(CENTER);
    rect(x, y, w * 2, h * 2);
  }
}