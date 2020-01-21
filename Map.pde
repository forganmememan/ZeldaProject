public class Map {
  
  String[][] overworld = new String[16][8];
  String[] unicode = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P"};
  
  PImage[][] backgroundOverworld = new PImage[16][8];
  PImage cave = new PImage();
  
  int i, j;
  
  public Map(){
    
    // Create and fill map array
    for (int i = 0; i < 16; i++){
      for (j = 0; j < 8; j++){
        overworld[i][j] = unicode[i] + ((int)j + 1);
        
      }
      j = 0;
    }
    
    i = 7;
    j = 7;
    backgroundOverworld[i][j] = loadImage("/images/overworld/" + overworld[i][j] + ".png");
    cave = loadImage("images/secretrooms/secretRoom1.png");
  }
  
  void updateMap(){
    //println(overworld[i][j]);
    if (player.playerLocation != "cave"){
      image(backgroundOverworld[i][j], 0, 0, width, height);
    }
    else {
      image(cave, 0, 0, width, height);
    }
    
    mapHitboxes();
  }
  
  void transitionUp(){
    //j -= 1;
    //player.playerLocation = overworld[i][j];
  }
  
  void mapHitboxes(){
    if (player.playerLocation == "H8"){
      
      
    }
  }

}
