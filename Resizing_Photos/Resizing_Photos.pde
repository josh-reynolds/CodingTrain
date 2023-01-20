// Utility project spinning off from White_House_Photo_Mosaic

// Need a set of source images - recommended download is too large to bother
// Obvious candidate is iCloud Photos, but they're very big,
// so let's batch resize and save smaller versions

import java.io.FilenameFilter;

String baseDirName = "C:\\Users\\Josh\\Pictures\\iCloud Photos\\Downloads";
File srcDir = new File(baseDirName);
File destDir = new File(baseDirName + "\\smaller");

int scl = 24;
// resizing from ~3024 x 4032 to ~168 x 126
//  which reduces file size from 1.63MB to 8.57KB

void setup(){
  File[] allFiles = getJPGFiles();
  for (File f : allFiles){
    String name = f.getName();
    
    PImage img = loadImage(f.getPath());
    img.resize(img.width/scl, img.height/scl);
    img.save(destDir + "\\" + name);
  }
}

File[] getJPGFiles(){
  FilenameFilter filter = new FilenameFilter(){
    public boolean accept(File f, String name){
      if (name.endsWith("jpg") || name.endsWith("JPG")){
        return true;
      } else {
        return false;
      }
    }
  };
  return srcDir.listFiles(filter);
}