class Graph {
  ArrayList<Node> nodes;
  HashMap<String, Node> lookup;
  
  Graph(){
    nodes = new ArrayList<Node>();
    lookup = new HashMap<String, Node>();
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