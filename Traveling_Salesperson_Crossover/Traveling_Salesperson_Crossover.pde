// Coding Train
// Coding Challenge 35.5 - TSP with Genetic Algorithm and Crossover
// https://www.youtube.com/watch?v=hnxn6DtLYcY&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=43

// Another JavaScript video, needs conversion on the fly

import java.util.Arrays;

int totalCities = 10;
ArrayList<PVector> cities;
GeneticAlgorithm ga;

void setup(){
  size(1000, 600);

  int[] order = new int[totalCities];  
  
  cities = new ArrayList<PVector>();
  for (int i = 0; i < totalCities; i++){
    cities.add(new PVector(random(width), random(height)));
    order[i] = i;
  }

  ga = new GeneticAlgorithm(order);
  
  //frameRate(1);
}

void draw(){
  background(0);

  ga.calculateFitness();
  ga.normalizeFitness();
  ga.nextGeneration();

  stroke(255);
  strokeWeight(1);
  noFill();
  beginShape();
    for (int i = 0; i < ga.currentBest.length; i++){
      PVector c = cities.get(ga.currentBest[i]);
      vertex(c.x, c.y);
      ellipse(c.x, c.y, 12, 12);
    }
  endShape();
  
  stroke(255, 0, 255);
  strokeWeight(2);
  noFill();
  beginShape();
    for (int i = 0; i < ga.bestEver.length; i++){
      PVector c = cities.get(ga.bestEver[i]);
      vertex(c.x, c.y);
      ellipse(c.x, c.y, 12, 12);
    }
  endShape();
}

void swap(int[] a, int i, int j){
  int temp = a[i];
  a[i] = a[j];
  a[j] = temp;
}

// Processing does have IntList.shuffle()...
void shuffle(int[] a){
  for (int i = 0; i < a.length; i++){
    int randIndex = floor(random(a.length));
    swap(a, i, randIndex);
  }
}

String formatArray(int[] a){
  String s = "";
  for (int i = 0; i < a.length; i++){
    s += a[i];
  }
  return s;
}

String formatArray(int[][] a){
  String s = "";
  for (int i = 0; i < a.length; i++){
    s += formatArray(a[i]) + "\n";
  }
  return s;  
}