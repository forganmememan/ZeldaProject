public class Map {
  
  String[][] overworld = new String[16][8];
  String[] unicode = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P"};
  
  String[] secretRooms = new String[1];
  String[][] dungeon1 = new String[6][6];
  
  PImage[][] backgroundOverworld = new PImage[16][8];
  PImage cave = new PImage();
  PImage bg2 = new PImage();
  
  int i, j, iDungeon1, jDungeon1;
  float mapX, mapY;
  float previousX, previousY;
  float mapSpeed;
  boolean isTransitioning;
  
  public Map(){
    
    mapX = 0;
    mapY = 0;
    mapSpeed = 15; // 15 on school pc, 25 on home pc
    
    // Create and fill map array
    for (int i = 0; i < 16; i++){
      for (j = 0; j < 8; j++){
        overworld[i][j] = unicode[i] + ((int)j + 1);
        
      }
      j = 0;
    }
    
    for (int iDungeon1 = 0; i < 6; iDungeon1++){
      for(int jDungeon1 = 0; i<6; jDungeon1++){
        dungeon1[iDungeon1][jDungeon1]=unicode[iDungeon1]+(jDungeon1+1);
      }
      jDungeon1 = 0;
    }
    
    i = 7;
    j = 7;
    iDungeon1 = 2;
    jDungeon1 = 5;
    backgroundOverworld[i][j] = loadImage("/images/overworld/" + overworld[i][j] + ".png");
    cave = loadImage("images/secretrooms/secretRoom1.png");
  }
  
  void updateMap(){
    
    if (isTransitioning){
      transition();
    }
    else {
      if (player.playerLocation!="cave"){
        image(bg, 0, 0, width, height);
      }
      else {
        image(cave, 0, 0, width, height);
      }
    }
 
  }
  
  void transitionUp(){
    isTransitioning = true;
    bg2 = loadImage("/images/overworld/" + overworld[i][j-1] + ".png");
    previousX = player.x;
    previousY = player.y;
  }
  
  void transitionDown(){
    isTransitioning = true;
    bg2 = loadImage("/images/overworld/" + overworld[i][j+1] + ".png");
    previousX = player.x;
    previousY = player.y;
  }
  
  void transitionLeft(){
    isTransitioning = true;
    bg2 = loadImage("/images/overworld/" + overworld[i-1][j] + ".png");
    previousX = player.x;
    previousY = player.y;
  }
  
  void transitionRight(){
    isTransitioning = true;
    bg2 = loadImage("/images/overworld/" + overworld[i+1][j] + ".png");
    previousX = player.x;
    previousY = player.y;
  }
  
  void transition(){
    
    
    // Screen transition from the top //
    if (player.playerDirection == "up"){
      image(bg, mapX, mapY, width, height);

      
      if (player.y < height-player.Height*4){
        player.y += mapSpeed;
        player.playerHitbox.topLeft.y += mapSpeed;
        player.playerHitbox.bottomRight.y += mapSpeed;
      }
      if (mapY < height){
        mapY += mapSpeed;
      }
      else {
        isTransitioning = false;
        j -= 1;
        player.playerLocation = (String)overworld[i][j];
        player.x = previousX;
        player.y = height - 64;
        player.playerHitbox.topLeft.y = player.y;
        player.playerHitbox.bottomRight.y = player.y + 64;
        bg = bg2;
        mapX = 0;
        mapY = 0;
      }
    }
    ////////////////////////////////////////
    
    
    
    // Screen transition from the bottom //
    if (player.playerDirection == "down"){
      image(bg, mapX, mapY, width, height);
      image(bg2, mapX, mapY + height, width, height);
      
      if (player.y > 0){
        player.y -= mapSpeed;
        player.playerHitbox.topLeft.y -= mapSpeed;
        player.playerHitbox.bottomRight.y -= mapSpeed;
      }
      if (mapY > -height){
        mapY -= mapSpeed;
      }
      else {
        isTransitioning = false;
        j += 1;
        player.playerLocation = (String)overworld[i][j];
        player.x = previousX;
        player.y = 0;
        player.playerHitbox.topLeft.y = player.y;
        player.playerHitbox.bottomRight.y = player.y + 64;
        bg = bg2;
        mapX = 0;
        mapY = 0;
      }
    }
    //////////////////////////////////////////
    
    
    
    // Screen transition from the left //
    if (player.playerDirection == "left"){
      image(bg, mapX, mapY, width, height);
      image(bg2, mapX - width, mapY, width, height);
      
      if (player.x < width - 64){
        player.x += mapSpeed;
        player.playerHitbox.topLeft.x += mapSpeed;
        player.playerHitbox.bottomRight.x += mapSpeed;
      }
      if (mapX < width){
        mapX += mapSpeed;
      }
      else {
        isTransitioning = false;
        i -= 1;
        player.playerLocation = (String)overworld[i][j];
        player.x = width - 64;
        player.y = previousY;
        player.playerHitbox.topLeft.x = player.x;
        player.playerHitbox.bottomRight.x = player.x + 64;
        bg = bg2;
        mapX = 0;
        mapY = 0;
      }
    }
    //////////////////////////////////////
    
    
    
    // Screen transition from the right //
    if (player.playerDirection == "right"){
      image(bg, mapX, mapY, width, height);
      image(bg2, mapX + width, mapY, width, height);
      
      if (player.x > 0){
        player.x -= mapSpeed;
        player.playerHitbox.topLeft.x -= mapSpeed;
        player.playerHitbox.bottomRight.x -= mapSpeed;
      }
      if (mapX > -width){
        mapX -= mapSpeed;
      }
      else {
        isTransitioning = false;
        i += 1;
        player.playerLocation = (String)overworld[i][j];
        player.x = 0;
        player.y = previousY;
        player.playerHitbox.topLeft.x = player.x;
        player.playerHitbox.bottomRight.x = player.x + 64;
        bg = bg2;
        mapX = 0;
        mapY = 0;
      }
    }
    ////////////////////////////////////////
  }

}
