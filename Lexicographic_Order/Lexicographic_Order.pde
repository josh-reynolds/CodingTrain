// Coding Train
// Coding Challenge 35.2 - Lexicographic Order
// https://www.youtube.com/watch?v=goUlyp4rwiU&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=40

// Another JavaScript video, needs conversion on the fly

import java.util.Arrays;

int[] vals = { 0, 1, 2, 3 };
//int[] vals = { 5, 1, 7, 6, 3, 9, 8, 4, 2 };
int iteration = 0;

void setup(){
  size(400, 300);
  //frameRate(1);
}


void draw(){
  background(0);
  println("Iteration " + iteration);
  iteration++;
  println(vals);
  println();
  
  println("Step 1 -------------");
  // STEP 1
  int largestI = -1;
  for (int i = 0; i < vals.length - 1; i++){
    if (vals[i] < vals[i+1]){
      largestI = i;
      println("LargestI: " + largestI + " : " + vals[largestI]);
    }
  }

  if (largestI == -1){
    println("Finished");
    noLoop();
    return;
  }
  
  println("Step 2 -------------");
  // STEP 2
  int largestJ = -1;
  for (int j = 0; j < vals.length; j++){
    if (vals[j] > vals[largestI]){
      largestJ = j;
      println("LargestJ: " + largestJ + " : " + vals[largestJ]);
    }
  }
  
  // problem if lowest value is in the second-to-last slot
  if (largestJ == -1){
    println("What?!");
    noLoop();
    return;
  }
  
  println("Step 3 -------------");
  // STEP 3
  swap(vals, largestI, largestJ);
  println(vals);
    
  println("Step 4 -------------");
  // STEP 4
  int[] endArray = Arrays.copyOfRange(vals, largestI+1, vals.length); 
  endArray = reverse(endArray);
  arrayCopy(endArray, 0, vals, largestI+1, endArray.length);
  println(vals);
  println(" --------------- ");
}

void swap(int[] a, int i, int j){
  int temp = a[i];
  a[i] = a[j];
  a[j] = temp;
}