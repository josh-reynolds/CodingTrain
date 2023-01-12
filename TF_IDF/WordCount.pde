class WordCount {
  int termFrequency;
  int inverseDocumentFrequency;
  float score;
  
  WordCount(int tf){
    termFrequency = tf;
    inverseDocumentFrequency = 1;
    score = 0;
  }
  
  void incrementTF(){
    termFrequency++;
  }
  
  void incrementIDF(){
    inverseDocumentFrequency++;
  }
  
  void calculateScore(int totalTexts){
    score = termFrequency * log(totalTexts/inverseDocumentFrequency);
  }
  
  String toString(){
    return termFrequency + ", " + inverseDocumentFrequency + " : " + nf(score,0,2);
  }
}