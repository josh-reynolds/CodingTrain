class Tree {
  Rectangle boundary;
  int capacity;
  ArrayList<Point> points;
  Tree northwest, northeast, southwest, southeast;
  boolean divided;
  
  Tree(Rectangle _boundary, int _capacity){
    boundary = _boundary;
    capacity = _capacity;
    points = new ArrayList<Point>();
    
    northwest = null;
    northeast = null;
    southwest = null;
    southeast = null;
    divided = false;
  }
  
  boolean insert(Point _p){
    if (!boundary.contains(_p)){ return false; }
    
    if (points.size() < capacity){
      points.add(_p);
      return true;
    } else {
      if (!divided){
        subdivide();
      }
      if (northwest.insert(_p)){ return true; }
      if (northeast.insert(_p)){ return true; }
      if (southwest.insert(_p)){ return true; }
      if (southeast.insert(_p)){ return true; }
    }
    return false;
  }
  
  void subdivide(){
    float x = boundary.x;
    float y = boundary.y;
    float w = boundary.w / 2;
    float h = boundary.h / 2;
    
    northwest = new Tree(new Rectangle(x - w, y - h, w, h), capacity);
    northeast = new Tree(new Rectangle(x + w, y - h, w, h), capacity);
    southwest = new Tree(new Rectangle(x - w, y + h, w, h), capacity);
    southeast = new Tree(new Rectangle(x + w, y + h, w, h), capacity);
    
    divided = true;
  }
  
  String toString(){
    return("Tree boundary = " + boundary + 
           " capacity = " + capacity + 
           " divided = " + divided + 
           " point count = " + points.size());
  }
  
  void show(){
    boundary.show();

    if (divided){  
      northwest.show();
      northeast.show();
      southwest.show();
      southeast.show();
    }

    for (Point p : points){ p.show(); }
  }
}