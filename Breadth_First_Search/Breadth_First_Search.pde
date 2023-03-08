// Coding Train
// Coding Challenge 68.2 - Breadth-First Search Part 2
// https://www.youtube.com/watch?v=-he67EEM6z0&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=94

// JavaScript conversion

// he has a toy dataset for "degrees of Bacon" - need to mock that up or grab from his repo
//  https://github.com/CodingTrain/Coding-Challenges/tree/main/068_BFS_kevin_bacon/P5

// at the end of the second video he adds a dropdown for user-selected starting actor
// not bothering with that for the Java version

import java.util.Map;

String file = "kevinbacon.json";
JSONObject json;
Graph graph;
ArrayList<Node> queue;

String start = "Rachel McAdams";
//String start = "Jessica James";
//String start = "Kevin Bacon";
String end = "Kevin Bacon";

void setup(){
  size(100, 100);   // console only sketch, but no way to suppress canvas window in Processing unlike P5.js
  
  graph = new Graph();
  queue = new ArrayList<Node>();
  
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

  graph.setStart(start);
  if (graph.start == null){
    println("\"" + start + "\" is not in the movie dataset.");
    exit();   // doesn't work as I expected - looks like the rest of setup will be run
  } else {
    graph.start.searched = true;
    queue.add(graph.start);
  }
  
  graph.setEnd(end);
  if (graph.end == null){
    println("\"" + end + "\" is not in the movie dataset.");
    exit();
  }

  while (queue.size() > 0){
    Node candidate = queue.remove(0);
    //if (candidate.parent != null){
    //  println("Evaluating " + candidate.value + " (parent = " + candidate.parent.value + ")");
    //} else {
    //  println("Evaluating " + candidate.value + "(START)");
    //}
    
    if (candidate.equals(graph.end)){
      //println("Found " + candidate.value);
      break;
    } else {
      for (Node n : candidate.edges){
        if (!n.searched){ 
          n.searched = true;
          n.parent = candidate;
          queue.add(n); 
        }
      }
    }
  }

  ArrayList<Node> path = new ArrayList<Node>();
  path.add(graph.end);
  Node next = graph.end.parent;
  while (next != null){
    path.add(next);
    next = next.parent;
  }

  int score = (path.size() - 1) / 2;
  println(start + " has a Bacon score of " + score);
  for (int i = path.size() - 1; i >= 0; i--){
    Node n = path.get(i);
    print(n.value);
    if (i > 0){ print(" --> "); }
  }

  // debug output, verifying graph structure is correct
  //println(graph.nodes.size());
  //println(graph.lookup.keySet().size());
  //for (String value : graph.lookup.keySet()){
  //  Node n = graph.lookup.get(value);
  //  int edgeCount = n.edges.size();
  //  if (edgeCount > 0){
  //    println("------------------------");
  //    println(value + " : " + edgeCount);
  //    for (Node actor : n.edges){
  //      println(actor.value + " : " + actor);
  //    }
  //  }
  //}
}