public class Player {
  
  float x, y;
  float playerSpeed = 20;
  String playerDirection;
  String playerLocation;
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
    playerLocation = "H8";
    isSwinging = false;
    playerHitbox.topLeft.x = (int)x;
    playerHitbox.topLeft.y = (int)y;
    playerHitbox.bottomRight.x = (int)x + 15*4;
    playerHitbox.bottomRight.y = (int)y + 16*4;
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
        playerHitbox.topLeft.x -= playerSpeed;
        playerHitbox.bottomRight.x -= playerSpeed;
        playerDirection = "left";
      }
      if (keyCode == RIGHT) {
        image(playerRight[frameCount%2], x, y, 15*4, 16*4);
        x += playerSpeed;
        playerHitbox.topLeft.x += playerSpeed;
        playerHitbox.bottomRight.x += playerSpeed;
        playerDirection = "right";
      }
      if (keyCode == DOWN) {
        image(playerDown[frameCount%2], x, y, 15*4, 16*4);
        y += playerSpeed;
        playerHitbox.topLeft.y += playerSpeed;
        playerHitbox.bottomRight.y += playerSpeed;
        playerDirection = "down";
      }
      if (keyCode == UP) {
        image(playerUp[frameCount%2], x, y, 15*4, 16*4);
        y -= playerSpeed;
        playerHitbox.topLeft.y -= playerSpeed;
        playerHitbox.bottomRight.y -= playerSpeed;
        playerDirection = "up";
      }
      if (key == 'a') {
        image(playerLeft[frameCount%2], x, y, 15*4, 16*4);
        x -= playerSpeed;
        playerHitbox.topLeft.x -= playerSpeed;
        playerHitbox.bottomRight.x -= playerSpeed;
        playerDirection = "left";
      }
      if (key == 'd') {
        image(playerRight[frameCount%2], x, y, 15*4, 16*4);
        x += playerSpeed;
        playerHitbox.topLeft.x += playerSpeed;
        playerHitbox.bottomRight.x += playerSpeed;
        playerDirection = "right";
      }
      if (key == 's') {
        image(playerDown[frameCount%2], x, y, 15*4, 16*4);
        y += playerSpeed;
        playerHitbox.topLeft.y += playerSpeed;
        playerHitbox.bottomRight.y += playerSpeed;
        playerDirection = "down";
      }
      if (key == 'w') {
        image(playerUp[frameCount%2], x, y, 15*4, 16*4);
        y -= playerSpeed;
        playerHitbox.topLeft.y -= playerSpeed;
        playerHitbox.bottomRight.y -= playerSpeed;
        playerDirection = "up";
      }
      if (key == 'x') {
        swing();
        //println(isSwinging);
        
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
    //println(x);
    //println(rock.x);
    //println(rock.rockHitbox.bottomRight.x);
    if(playerHitbox.isCollision(rock.rockHitbox)){
      println("collision");
    }
    else {
      println("no collision");
    }
  }
  
  void swing(){
    
    println("swing");
    if (playerDirection == "down"){
      if (isSwinging == false){
       image(playerSwingDown[1], x, y, 15*4, 27*4);
      }
      else {
        image(playerSwingDown[1], x, y, 15*4, 27*4);
      }
      
    }
  
  }
  
  


}
