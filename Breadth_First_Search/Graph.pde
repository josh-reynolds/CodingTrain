class Graph {
  ArrayList<Node> nodes;
  HashMap<String, Node> lookup;
  Node start;
  Node end;
  
  
  Graph(){
    nodes = new ArrayList<Node>();
    lookup = new HashMap<String, Node>();
    start = null;
    end = null;
  }
  
  void setEnd(String _s){
    end = getNode(_s);
  }
  
  void setStart(String _s){
    start = getNode(_s);
  }
  
  void addNode(Node _n){
    nodes.add(_n);
    lookup.put(_n.value, _n);
  }
  
  Node getNode(String _s){
    if (lookup.containsKey(_s)){
      return lookup.get(_s);
    } else {
      return null;
    }
  }
}