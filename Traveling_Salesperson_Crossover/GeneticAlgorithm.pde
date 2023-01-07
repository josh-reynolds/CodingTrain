import java.util.Arrays;

class GeneticAlgorithm {
  float[] fitness;
  float record;
  int[] bestEver;
  int[] currentBest;
  int[][] population;
  int populationCount = 10;
  int generation = 0;

  GeneticAlgorithm(int[] order){
    fitness = new float[populationCount];
    record = 1000000;
    bestEver    = new int[totalCities];
    currentBest = new int[totalCities];
    
    population = new int[populationCount][];
    for (int i = 0; i < populationCount; i++){
      population[i] = Arrays.copyOf(order, order.length);
      shuffle(population[i]);
    }
  }
  
  void calculateFitness(){
    float currentRecord = 1000000;
    for (int i = 0; i < populationCount; i++){
      float d = calcDistance(population[i], cities);
      
      if (d < currentRecord){ 
        currentRecord = d; 
        currentBest = population[i];
      }
      
      if (d < record){ 
        record = d; 
        bestEver = population[i];
      }
      
      fitness[i] = 1 / (d+1);
    }
  }
 
  void normalizeFitness(){
    float sum = 0;
    for (int i = 0; i < fitness.length; i++){
      sum += fitness[i];
    }
    for (int i = 0; i < fitness.length; i++){
      fitness[i] = fitness[i] / sum;
    }     
  }
 
  void nextGeneration(){
    int[][] newPopulation = new int[populationCount][];
    for (int i = 0; i < populationCount; i++){
      int[] orderA = pickOne(population);
      int[] orderB = pickOne(population);

      int[] order = crossOver(orderA, orderB);
      mutate(order, 0.01);
      
      newPopulation[i] = order;
    }
        
    population = newPopulation;
    generation++;
    println(generation + " " + formatArray(bestEver) + " " + record);
  }
  
  int[] crossOver(int[] a, int[] b){
    int start = floor(random(a.length - 1));
    int end = floor(random(start + 1, a.length));
    
    int[] newOrder = new int[a.length];
    
    HashMap<Integer,Boolean> lookup = new HashMap<Integer,Boolean>();  
    int pointer = start;
    
    for (int i = 0; i < newOrder.length; i++){
      if (pointer <= end){
        newOrder[i] = a[pointer];
        pointer++;
        lookup.put(newOrder[i],true);
      }
    }
    
    pointer = end - start + 1;
    for (int i = 0; i < b.length; i++){
      if (lookup.get(b[i]) == null){
        newOrder[pointer] = b[i];
        pointer++;
      }
      if (pointer == newOrder.length){ break; }
    }
    
    return newOrder;
  }
  
  void mutate(int[] a, float rate){
    if (random(1) < rate){
      int indexA = floor(random(a.length - 1));
      //int indexB = floor(random(a.length));
      int indexB = indexA + 1;
      swap(a, indexA, indexB);    
    }
  }
  
  int[] pickOne(int[][] a){
    int index = 0;
    float r = random(1);
    
    while (r > 0){
      r = r - fitness[index];
      index++;
    }
    index--;
    
    return Arrays.copyOf(a[index], a[index].length);
  }
  
  float calcDistance(int[] o, ArrayList<PVector> points){
    float total = 0;
    for (int i = 0; i < o.length-1; i++){
      total += points.get(o[i]).dist(points.get(o[i+1]));
    }
    return total;
  }
}