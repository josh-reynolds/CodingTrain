class Point {
  float x, y;
  
  Point(float _x, float _y){
    x = _x;
    y = _y;
  }
  
  void show(){
    stroke(0);
    strokeWeight(4);
    point(x, y);
  }
}