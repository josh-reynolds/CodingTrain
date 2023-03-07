// Coding Train
// Coding Challenge 68.1 - Breadth-First Search Part 1
// https://www.youtube.com/watch?v=piBq7VD0ZSo&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=93

// JavaScript conversion

// he has a toy dataset for "degrees of Bacon" - need to mock that up or grab from his repo
//  https://github.com/CodingTrain/Coding-Challenges/tree/main/068_BFS_kevin_bacon/P5

import java.util.Map;

String file = "kevinbacon.json";
JSONObject json;
Graph graph;

void setup(){
  size(100, 100);   // console only sketch, but no way to suppress canvas window in Processing unlike P5.js
  
  graph = new Graph();
  
  json = loadJSONObject(file);
  JSONArray movies = json.getJSONArray("movies"); 

  for (int i = 0; i < movies.size(); i++){
    String title = movies.getJSONObject(i).getString("title"); 
    JSONArray cast = movies.getJSONObject(i).getJSONArray("cast"); 
    
    Node movieNode = new Node(title);
    graph.addNode(movieNode);
    
    for (int j = 0; j < cast.size(); j++){
      String actor = cast.getString(j);

      Node actorNode = graph.getNode(actor);
      if (actorNode == null){
        actorNode = new Node(actor);
        graph.addNode(actorNode);
      }
      
      movieNode.addEdge(actorNode);
    }
  }

  // debug output, verifying graph structure is correct
  println(graph.nodes.size());
  println(graph.lookup.keySet().size());
  for (String value : graph.lookup.keySet()){
    Node n = graph.lookup.get(value);
    int edgeCount = n.edges.size();
    if (edgeCount > 0){
      println("------------------------");
      println(value + " : " + edgeCount);
      for (Node actor : n.edges){
        println(actor.value + " : " + actor);
      }
    }
  }
}