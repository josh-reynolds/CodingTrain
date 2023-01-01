// Coding Train
// Coding Challenge 35.1 - Traveling Salesperson
// https://www.youtube.com/watch?v=BAejnwN4Ccw&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=39

// Another JavaScript video, needs conversion on the fly

ArrayList<PVector> cities;
ArrayList<PVector> recordPath;
int totalCities = 5;
float recordDistance = 1000000;
int iterations = 0;

void setup(){
  size(400, 300);
  
  cities = new ArrayList<PVector>();
  for (int i = 0; i < totalCities; i++){
    cities.add(new PVector(random(width), random(height)));
  }
  
  recordPath = new ArrayList<PVector>();
  checkRecord();
  
  //frameRate(3);
}

void checkRecord(){
  float d = calcDistance(cities);
  if (d < recordDistance){ 
    recordDistance = d; 
    recordPath.clear();
    recordPath.addAll(0, cities);
    
    println();
    println("Iterations = " + iterations);
    println("Record distance = " + recordDistance);
    println("Record path: " + recordPath);
  }
}

void draw(){
  background(0);
  
  checkRecord();
  iterations++;
  
  stroke(255, 0, 255);
  strokeWeight(4);
  noFill();
  beginShape();
    for (PVector c : recordPath){
      vertex(c.x, c.y);
    }
  endShape();

  stroke(255);
  strokeWeight(1);
  noFill();
  beginShape();
    for (PVector c : cities){
      vertex(c.x, c.y);
    }
  endShape();

  noStroke();
  fill(255, 0, 255);
  for (PVector c : cities){
    ellipse(c.x, c.y, 12, 12);
  }
  
  int first = floor(random(cities.size()));
  int second = floor(random(cities.size()));
  while (second == first){
    second = floor(random(cities.size()));
  }
  swap(cities, first, second);
}

void swap(ArrayList<PVector> a, int i, int j){
  PVector temp = a.get(i);
  a.set(i, a.get(j));
  a.set(j, temp);
}

float calcDistance(ArrayList<PVector> points){
  float total = 0;
  for (int i = 0; i < points.size()-1; i++){
    total += points.get(i).dist(points.get(i+1));
  }
  return total;
}