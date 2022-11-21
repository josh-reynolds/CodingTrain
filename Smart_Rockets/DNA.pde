class DNA {
  PVector[] genes;
  
  DNA(){
    genes = new PVector[lifespan];
    for (int i = 0; i < lifespan; i++){
      genes[i] = PVector.random2D();
      genes[i].setMag(maxforce);
    }
  }
  
  DNA(PVector[] _genes){
    genes = _genes; 
  }
  
  DNA crossover(DNA partner){
    PVector[] newGenes = new PVector[genes.length];
    float mid = floor(random(genes.length));
    
    for (int i = 0; i < genes.length; i++){
      if (i > mid){
        newGenes[i] = genes[i]; 
      } else {
        newGenes[i] = partner.genes[i]; 
      }
    }
    
    return new DNA(newGenes); 
  }
  
  void mutation(){
     for (int i = 0; i < genes.length; i++){
       if (random(1) < 0.01){
         genes[i] = PVector.random2D();
         genes[i].setMag(maxforce);
       }
     }
  }
}