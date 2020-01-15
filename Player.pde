public class Player {
  
  float x, y;
  float playerSpeed = 6;
  String playerDirection;
  boolean isSwinging;
  
  PImage[] playerLeft = new PImage[2];
  PImage[] playerRight = new PImage[2];
  PImage[] playerDown = new PImage[2];
  PImage[] playerUp = new PImage[2];
  PImage player;
  PImage[] playerSwingDown = new PImage[3];
  
  Hitbox playerHitbox;
  
  public Player(){
    player = loadImage("/images/playerFront.png");
    playerRight[0] = loadImage("/images/playerRight.png");
    playerRight[1] = loadImage("/images/playerRight2.png");
    playerUp[0] = loadImage("/images/playerUp.png");
    playerUp[1] = loadImage("/images/playerUp2.png");
    playerLeft[0] = loadImage("/images/playerLeft.png");
    playerLeft[1] = loadImage("/images/playerLeft2.png");
    playerDown[0] = loadImage("/images/playerDown.png");
    playerDown[1] = loadImage("/images/playerDown2.png");
    playerSwingDown[0] = loadImage("/images/playerSwingDown.png");
    playerSwingDown[1] = loadImage("/images/playerSwingDown2.png");
    playerSwingDown[2] = loadImage("/images/playerSwingDown.png");
    playerHitbox = new Hitbox();
    x = width/2;
    y = height/2;
    playerDirection = "down";
    isSwinging = false;
  }
  
  
  void updatePlayer(){
    checkHitbox();
    movePlayer();
    
  }
  
  void movePlayer(){
    if (keyPressed) {
      if (keyCode == LEFT) {
        image(playerLeft[frameCount%2], x, y, 15*4, 16*4);
        x -= playerSpeed;
        playerDirection = "left";
      }
      if (keyCode == RIGHT) {
        image(playerRight[frameCount%2], x, y, 15*4, 16*4);
        x += playerSpeed;
        playerDirection = "right";
      }
      if (keyCode == DOWN) {
        image(playerDown[frameCount%2], x, y, 15*4, 16*4);
        y += playerSpeed;
        playerDirection = "down";
      }
      if (keyCode == UP) {
        image(playerUp[frameCount%2], x, y, 15*4, 16*4);
        y -= playerSpeed;
        playerDirection = "up";
      }
      if (key == 'x') {
        isSwinging = true;
        println(isSwinging);
        if (isSwinging){
          swing();
          //isSwinging = false;
        }
      }
        
    }
    else {
      if (playerDirection == "left"){
        image(playerLeft[0], x, y, 15*4, 16*4);
      } 
      if (playerDirection == "right"){
        image(playerRight[0], x, y, 15*4, 16*4);
      }
      if (playerDirection == "down"){
        image(playerDown[0], x, y, 15*4, 16*4);
      }
      if (playerDirection == "up"){
        image(playerUp[0], x, y, 15*4, 16*4);
      }
    }
  
  
  }
  
  void checkHitbox(){
    rect(x, y, 15*4, 16*4);
    //playerHitbox.isOverlapping();
  }
  
  void swing(){
    if (playerDirection == "down"){
      if (frameCount%3 == 0 || frameCount%3 == 2){
        image(playerSwingDown[frameCount%3], x, y, 15*4, 16*4);
      }
      if (frameCount%3 == 1){
        image(playerSwingDown[frameCount%3], x, y, 15*4, 29*4);
      }
      
    }
  
  }


}
