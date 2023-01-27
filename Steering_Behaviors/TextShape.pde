class TextShape {
  String text;
  PFont font;
  int size;
  
  int xOffset;
  int yOffset;
  
  PShape shape;
  ArrayList<PVector> points;
  float[] offsets;
  
  TextShape(String s, PFont f, int sz, int xOff, int yOff){
    text = s;
    font = f;
    size = sz;
    xOffset = xOff;
    yOffset = yOff;
    
    shape = createTextShape(text, font);
    points = getPoints(shape, xOffset, yOffset);
  }
  
  ArrayList<PVector> getPoints(PShape _s, float _x, float _y){    // top-left corner
    ArrayList<PVector> a = new ArrayList<PVector>();
    float offset;
    for (int i = 0; i < _s.getChildCount(); i++){
      PShape c = _s.getChild(i);
      offset = offsets[i];
      for (int j = 0; j < c.getVertexCount(); j++){
        float x = c.getVertex(j).x + _x + offset;
        float y = c.getVertex(j).y + _y;
        a.add(new PVector(x, y));
      }
    }
    return a;
  }
  
  PShape createTextShape(String s, PFont f){
    PShape group = createShape(GROUP);
    offsets = new float[s.length()];
    float offset = 0;
    for (int i = 0; i < s.length(); i++){
      char c = s.charAt(i);
      PShape glyph = f.getShape(c);
      glyph.translate(offset, 0);
      offsets[i] = offset;
      offset += glyph.width;
      group.addChild(glyph);
    }
    group.disableStyle();
    return group;
  }
}