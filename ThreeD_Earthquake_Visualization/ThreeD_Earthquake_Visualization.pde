// Coding Train
// Coding Challenge 58 - 3D Earthquake Data Visualization
// https://www.youtube.com/watch?v=dbs4IYGfAXc&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=75

// Known issue: texture not aligned with data coordinates

// Earthquake data from here: https://earthquake.usgs.gov/earthquakes/feed/v1.0/csv.php

// Spherical coordinate conversion from https://en.wikipedia.org/wiki/Spherical_coordinate_system
// x = r * sin(theta) * cos(phi)
// y = r * sin(theta) * sin(phi)
// z = r * cos(theta)

// Earth textures from http://visibleearth.nasa.gov/view_cat.php?categoryID=1484
//   https://visibleearth.nasa.gov/images/74218/december-blue-marble-next-generation/74220l
String texture = "earth.jpg";
PImage earth;
PShape globe;

//String dataURL = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.csv";
String dataURL = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.csv";
Table data;

float angle;
float radius = 200;

PVector xaxis = new PVector(1, 0, 0);

float boxSize = 5;
float magmax = sqrt(pow(10, 7));  // tweaking Richter max (10) to show dataset better
  
void setup(){
  size(600, 600, P3D);
  data = loadTable(dataURL, "header, csv");
  earth = loadImage(texture);
  
  noStroke();
  globe = createShape(SPHERE, radius);
  globe.setTexture(earth);
}

void draw(){
  background(51);
  
  translate(width/2, height/2);
  rotateY(angle);
  angle += 0.01;
  
  lights();
  shape(globe);

  for (TableRow row : data.rows()){
    float lt = row.getFloat("latitude");
    float ln = row.getFloat("longitude");
    float mag = row.getFloat("mag");
    if (!Float.isNaN(mag)){      // dataset had at least one bogus value when I put this together
      mag = pow(10, mag);
      mag = sqrt(mag);      
      drawCoord(lt, ln, map(mag, 0 , magmax, 10, 100));
    }
  }
}

void drawCoord(float _lat, float _lon, float _sz){
  float theta = radians(_lat) + PI/2;
  float phi = radians(_lon) + PI;
  
  float x = radius * sin(theta) * cos(phi);
  float y = -radius * sin(theta) * sin(phi);
  float z = radius * cos(theta);
  PVector pos = new PVector(x, y, z);
  PVector raxis = xaxis.cross(pos);
  float xangle = PVector.angleBetween(xaxis, pos);
  
  pushMatrix();
    translate(x, y, z);
    rotate(xangle, raxis.x, raxis.y, raxis.z);   // feature in "advanced" documentation
    fill(255, 125, 0);
    box(_sz, boxSize, boxSize);
  popMatrix();
}