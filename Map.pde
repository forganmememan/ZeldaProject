public class Map {
  
  String[][] overworld = new String[16][8];
  String[] unicode = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P"};
  
  PImage[][] backgroundOverworld = new PImage[16][8];
  PImage cave = new PImage();
  PImage bg2 = new PImage();
  
  int i, j;
  float mapX, mapY;
  float previousX, previousY;
  boolean isTransitioning;
  
  public Map(){
    
    mapX = 0;
    mapY = 0;
    
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
    
    if (isTransitioning){
      transition();
    }
    else {
      if (player.playerLocation == "H8"){
        image(bg, 0, 0, width, height);

      }
      if (player.playerLocation == "H7"){
        image(bg, 0, 0, width, height);

      }

    }
    
    //if (player.playerLocation != "cave"){
      //image(backgroundOverworld[i][j], 0, 0, width, height);
    //}
    //else {
      //image(cave, 0, 0, width, height);
    //}
    
    //mapHitboxes();
  }
  
  void mapHitboxes(){
    if (player.playerLocation == "H8"){
      
      
    }
  }
  
  void transitionUp(){
    isTransitioning = true;
    bg2 = loadImage("/images/overworld/" + overworld[i][j-1] + ".png");
    previousX = player.x;
    previousY = player.y;
  }
  
  void transition(){
    if (player.playerDirection == "up"){
      image(bg, mapX, mapY, width, height);
      image(bg2, mapX, mapY - height, width, height);
      
      if (player.y < height-player.Height*4){
        player.y += 15;
        player.playerHitbox.topLeft.y += 15;
        player.playerHitbox.bottomRight.y += 15;
      }
      if (mapY < height){
        mapY += 15;
      }
      else {
        isTransitioning = false;
        j -= 1;
        player.playerLocation = overworld[i][j];
        player.x = previousX;
        player.y = height - 64;
        player.playerHitbox.topLeft.y = player.y;
        player.playerHitbox.bottomRight.y = player.y + 64;
      }
    }
  }

}
