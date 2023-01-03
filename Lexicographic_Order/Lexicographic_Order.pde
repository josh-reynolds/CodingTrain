// Coding Train
// Coding Challenge 35.2 - Lexicographic Order
// https://www.youtube.com/watch?v=goUlyp4rwiU&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=40

// Another JavaScript video, needs conversion on the fly

import java.util.Arrays;

//int[] vals = { 0, 1, 2 };
//int[] vals = { 5, 1, 7, 6, 3, 9, 8, 4, 2 };  // used in example (Michal Forišek on quora.com)
int[] vals = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };

void setup(){
  size(500, 300);
  //frameRate(1);
}

void draw(){
  background(0);
  
  // STEP 1
  int largestI = -1;
  for (int i = 0; i < vals.length - 1; i++){
    if (vals[i] < vals[i+1]){
      largestI = i;
    }
  }

  if (largestI == -1){
    println("Finished");
    noLoop();
    display(vals);
    return;
  }
  
  // STEP 2
  int largestJ = -1;
  for (int j = 0; j < vals.length; j++){
    if (vals[j] > vals[largestI]){
      largestJ = j;
    }
  }
  
  // STEP 3
  swap(vals, largestI, largestJ);
    
  // STEP 4
  int[] endArray = Arrays.copyOfRange(vals, largestI+1, vals.length); 
  endArray = reverse(endArray);
  arrayCopy(endArray, 0, vals, largestI+1, endArray.length);

  display(vals);
}

void swap(int[] a, int i, int j){
  int temp = a[i];
  a[i] = a[j];
  a[j] = temp;
}

void display(int[] a){
  String s = "";
  for (int i = 0; i < a.length; i++){
    s += a[i];
  }
  fill(255);
  textSize(64);
  textAlign(CENTER, CENTER);
  text(s, width/2, height/2);
}