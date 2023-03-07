class Node {
  String value;
  ArrayList<Node> edges;
  Boolean searched;
  Node parent;
  
  Node(String _v){
    value = _v;
    edges = new ArrayList<Node>();
    searched = false;
    parent = null;
  }
  
  void addEdge(Node _n){
    edges.add(_n);
    _n.edges.add(this);
  }
}