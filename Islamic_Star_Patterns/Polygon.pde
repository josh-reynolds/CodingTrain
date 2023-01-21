class Polygon {
  ArrayList<PVector> vertices;
  ArrayList<Edge> edges;
  
  Polygon(){
    vertices = new ArrayList<PVector>();
    edges = new ArrayList<Edge>();
  }
  
  void hankin(){
    for (Edge e : edges){
      e.hankin();
    }
    for (int i = 0; i < edges.size(); i++){
      for (int j = 0; j < edges.size(); j++){
        if (i != j){
          edges.get(i).findEnds(edges.get(j));
        }
      }
    }
  }
  
  void addVertex(float x, float y){
    PVector a = new PVector(x, y);
    int total = vertices.size();
    
    if (total > 0){
      PVector previous = vertices.get(total-1);
      edges.add(new Edge(previous, a));
    }
    
    vertices.add(a);   
  }
  
  void close(){
    int total = vertices.size();
    
    if (total > 3){
      PVector start = vertices.get(0);
      PVector end = vertices.get(total-1);
      edges.add(new Edge(end, start));
    }
  }
  
  void show(){
    for (Edge e : edges){
      e.show();
    }
  }
}