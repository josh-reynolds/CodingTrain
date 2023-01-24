// Coding Train
// Coding Challenge 57 - Mapping Earthquake Data
// https://www.youtube.com/watch?v=ZiYdOwOrGyc&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=74

// JavaScript conversion

// https://www.mapbox.com/
// Need to create a (free) account and download map

// Not sure about checking in an access token, even a public one...
// Convert this to use a local copy instead

// Image parameters are:
//   https://api.mapbox.com/styles/v1/mapbox/dark-v9/static/0,0,1,0,0/1024x512?access_token=TOKEN

// Projection formulae here: https://en.wikipedia.org/wiki/Web_Mercator_projection
// Earthquake data from here: https://earthquake.usgs.gov/earthquakes/feed/v1.0/csv.php

String mapFile = "world.png";
PImage mapimg;

//String dataURL = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.csv";
String dataURL = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.csv";
Table data;   // he does loadStrings, but we'll use Table instead

float clat = 0;
float clon = 0;
float cx;
float cy;
float zoom = 1;

// Test data
// Shanghai 31.2304 N 121.4737 E
// Vancouver 49.2827 N 123.1207 W

void setup(){
  size(1024, 512);
  translate(width/2, height/2);
  imageMode(CENTER);
  
  mapimg = loadImage(mapFile);
  image(mapimg, 0, 0);

  cx = mercX(clon);
  cy = mercY(clat);
  
  data = loadTable(dataURL, "header, csv");

  float magmax = sqrt(pow(10, 10));
  for (int i = 0; i < data.getRowCount(); i++){
    float lt = float(data.getRow(i).getString("latitude"));
    float ln = float(data.getRow(i).getString("longitude"));
    float mag = float(data.getRow(i).getString("mag"));
    if (!Float.isNaN(mag)){      // dataset had at least one bogus value when I put this together
      mag = pow(10, mag);
      mag = sqrt(mag);      
      drawCoord(lt, ln, map(mag, 0 , magmax, 0, 180));
    }
  }
}

void drawCoord(float _lat, float _lon, float _sz){
  fill(255, 0, 255, 125);
  stroke(255, 0, 255);
  
  float x = mercX(_lon) - cx;
  float y = mercY(_lat) - cy;
  ellipse(x, y, _sz, _sz);  
}

float mercX(float _lon){
  float a = (256 / PI) * pow(2, zoom);
  float b = radians(_lon) + PI;
  return a * b;
}

float mercY(float _lat){
  float a = (256 / PI) * pow(2, zoom);
  float b = tan(PI / 4 + radians(_lat) / 2);
  float c = PI - log(b);
  return a * c;
}