class Population {
  Rocket[] rockets;
  int size;
  ArrayList<Rocket> matingPool;
  
  Population(){
    size = 25;
    rockets = new Rocket[size];
    for (int i = 0; i < size; i++){
       rockets[i] = new Rocket();
    }
  }
  
  void run(){
    for (Rocket r : rockets){
      r.update();
      r.show();
    }
  }
  
  void evaluate(){
    float maxfit = 0;
    float minfit = 1000;
    for (Rocket r : rockets){
      r.calcFitness();
      if (r.fitness > maxfit){
        maxfit = r.fitness;
      }
      if (r.fitness < minfit){
        minfit = r.fitness; 
      }
    }
    for (Rocket r : rockets){
      r.fitness /= maxfit; 
    }

    matingPool = new ArrayList<Rocket>();
    for (Rocket r : rockets){
      float n = r.fitness * 100;
      for (int j = 0; j < n; j++){
         matingPool.add(r);
      }
    }
    
    println("Max fitness: " + maxfit);
    println("Min fitness: " + minfit);
  }
  
  void selection(){
    Rocket[] newRockets = new Rocket[size];
    
    for (int i = 0; i < rockets.length; i++){
      int pick = int(random(0,matingPool.size()));
      DNA parentA = matingPool.get(pick).dna;
      
      pick = int(random(0,matingPool.size()));
      DNA parentB = matingPool.get(pick).dna;
      
      DNA child = parentA.crossover(parentB);
      child.mutation();
      newRockets[i] = new Rocket(child);
    }
    rockets = newRockets;
  }
}