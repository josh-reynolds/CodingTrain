class Display {
  int segL;
  int segW;
  
  int top;
  int left;
  
  int x1, x2, x3;
  int y1, y2, y3, y4, y5;
  
  Display(int _top, int _left, int _width){
    top = _top;
    left = _left;  
    
    segL = _width * 5 / 7;
    segW = segL / 5;

    x1 = left + segW / 2;
    x2 = left + segW + segL / 2;
    x3 = left + segW + segL + segW / 2;
    
    y1 = top + segW / 2;
    y2 = top + segW + segL / 2;
    y3 = top + segW + segL + segW / 2;
    y4 = top + segW + segL + segW + segL / 2;
    y5 = top + segW + segL + segW + segL + segW / 2;
  }
  
  void show(int _value){      
    //// A
    fill(getColor(_value, 6));
    drawSegment(x2, y1, false);
    //// B
    fill(getColor(_value, 5));
    drawSegment(x3, y2, true);
    //// C
    fill(getColor(_value, 4));
    drawSegment(x3, y4, true);
    //// D
    fill(getColor(_value, 3));
    drawSegment(x2, y5, false);
    //// E
    fill(getColor(_value, 2));
    drawSegment(x1, y4, true);
    //// F
    fill(getColor(_value, 1));
    drawSegment(x1, y2, true);
    //// G
    fill(getColor(_value, 0));
    drawSegment(x2, y3, false);
  }
  
  void drawSegment(int _x, int _y, boolean _vertical){
    int w = segW;
    int l = segL;
    if (_vertical){
      w = segL;
      l = segW;
    }
      
    pushMatrix();
      rectMode(CENTER);    
      stroke(0);
      rect(_x, _y, l, w, segW);
    popMatrix();
  }
  
  color getColor(int _value, int _shift){
    float alpha = 255 * ((_value >> _shift) & 1);
    return color(255, 0, 0, alpha);
  }
}