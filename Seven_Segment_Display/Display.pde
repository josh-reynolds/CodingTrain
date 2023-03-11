class Display {
  int segL;
  int segW;
  
  int top;
  int left;
  
  int x1, x2, x3;
  int y1, y2, y3, y4, y5;

  // encodings for digits 0 to 9
  private int nums[] = {0x7E, 0x30, 0x6D, 0x79, 0x33, 0x5B, 0x5F, 0x70, 0x7F, 0x7B};
  
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
    int digit = nums[_value];
    
    //// A
    fill(getColor(digit, 6));
    drawSegment(x2, y1, false);
    //// B
    fill(getColor(digit, 5));
    drawSegment(x3, y2, true);
    //// C
    fill(getColor(digit, 4));
    drawSegment(x3, y4, true);
    //// D
    fill(getColor(digit, 3));
    drawSegment(x2, y5, false);
    //// E
    fill(getColor(digit, 2));
    drawSegment(x1, y4, true);
    //// F
    fill(getColor(digit, 1));
    drawSegment(x1, y2, true);
    //// G
    fill(getColor(digit, 0));
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