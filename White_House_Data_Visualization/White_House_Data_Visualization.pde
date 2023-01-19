// Coding Train
// Coding Challenge 48 - White House Social Media Data Visualization
// https://www.youtube.com/watch?v=UrznYJltZrU&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=61

// JavaScript conversion

// Need to grab and convert twitter data first - just did this in the AFINN-111 project...
// Old video, so he is apparently using: 
//   https://obamawhitehouse.archives.gov/sites/default/files/POTUS111716.zip
//   https://obamawhitehouse.archives.gov/sites/default/files/FLOTUS111716.zip
// Try that for consistency, but can also see if there is a more recent equivalent

import java.time.LocalDateTime;
import java.time.Month;
import java.time.format.DateTimeFormatter;

import java.util.Collections;
import java.util.Set;
import java.util.Comparator;

HashMap<String,ArrayList> tweetCounts;

String filePrefix = "POTUS";
//String filePrefix = "FLOTUS";
String CSVfile = filePrefix + ".csv";
String JSONfile = filePrefix + ".json";

void setup(){
  size(600, 400);
  //convertCSVToJSON();

  JSONArray potusTweets = loadJSONArray(JSONfile);
  tweetCounts = new HashMap<String,ArrayList>();
  
  for (int i = 0; i < potusTweets.size(); i++){
    JSONObject json = potusTweets.getJSONObject(i);
    String t = json.getString("timestamp"); 
    
    // sample from dataset: 2016-11-11 17:28:48 +0000
    // all have +0000 offset, so we can use LocalDateTime instead of ZonedDateTime
    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss XXXX");
    LocalDateTime timestamp =  LocalDateTime.parse(t, dtf);
    
    String key = timestamp.getMonth() + " " + timestamp.getYear();     
    if (tweetCounts.containsKey(key)){
      tweetCounts.get(key).add(json.getString("txt"));
    } else {
      ArrayList text = new ArrayList();
      text.add(json.getString("txt"));
      tweetCounts.put(key, text);
    }    
  }
  
  ArrayList<String> months = new ArrayList<String>();
  for (String s : tweetCounts.keySet().toArray(new String[0])){
    months.add(s);
  }
  Collections.sort(months, new monthComparator());

  int maxtweets = 0;
  for (String m : months){
    int count = tweetCounts.get(m).size();
    if (count > maxtweets){ maxtweets = count; }
  }

  float barWidth = width / float(months.size());
  for (int i = 0; i < months.size(); i++){
    float barHeight = map(tweetCounts.get(months.get(i)).size(), 0, maxtweets, 0, height - 20);
    rect(i * barWidth, height - barHeight, barWidth - 2, barHeight);
  }
}

class monthComparator implements Comparator<String>{  
  public int compare(String _a, String _b){
    String[] a = split(_a, ' ');
    String[] b = split(_b, ' ');
    
    int monthA = Month.valueOf(a[0]).getValue();
    int monthB = Month.valueOf(b[0]).getValue();
    
    int yearA = int(a[1]);
    int yearB = int(b[1]);
    
    if (monthA == monthB && yearA == yearB){
      return 0;
    } else if ((monthA < monthB && yearA == yearB) ||
                (yearA < yearB)){
      return -1;
    } else {
      return 1;
    }
  }
}

void convertCSVToJSON(){
  // original file is csv with 10 fields
  JSONArray json = new JSONArray();
  String[] lines = loadStrings(CSVfile);

  for (int i = 1; i < lines.length; i++){
    String[] tokens = split(lines[i],"\",\"");                // need to handle commas in quoted text
    tokens[0] = tokens[0].substring(1);                       // and trim the extra " characters
    tokens[9] = tokens[9].substring(0,tokens[9].length()-1);
    JSONObject tweet = new JSONObject();
    
    tweet.setString("tweet_id",                   tokens[0]);  // tweet IDs overflow Int
                                                               // and Processing JSON Objects
                                                               // don't have a "setLong" method,
                                                               // would need to roll my own
    tweet.setString("in_reply_to_status_id",      tokens[1]);    
    tweet.setString("in_reply_to_user_id",        tokens[2]);
    tweet.setString("timestamp",                  tokens[3]);
    tweet.setString("source",                     tokens[4]);
    tweet.setString("text",                       tokens[5]);
    tweet.setString("retweeted_status_id",        tokens[6]);   
    tweet.setString("retweeted_status_user_id",   tokens[7]);
    tweet.setString("retweeted_status_timestamp", tokens[8]);
    tweet.setString("expanded_urls",              tokens[9]);

    json.setJSONObject(i-1, tweet);
  }

  saveJSONArray(json, JSONfile);
}