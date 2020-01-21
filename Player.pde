public class Player {
  
  // Defining attributes of the player
  float x, y, Width, Height;
  float playerSpeed = 15;
  String playerDirection;
  String playerLocation;
  
  boolean isSwinging, finishedSwinging, earlySwing;
  
  // The player's animation arrays
  PImage[] playerLeft = new PImage[2];
  PImage[] playerRight = new PImage[2];
  PImage[] playerDown = new PImage[2];
  PImage[] playerUp = new PImage[2];
  PImage[] playerSwingDownTest = new PImage[3];
  
  // Test default player image
  PImage player;
  
  // Defining the player hitbox
  Hitbox playerHitbox;
  
  // The player constructor
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
    playerSwingDownTest[0] = loadImage("/images/playerSwingDown.png");
    playerSwingDownTest[1] = loadImage("/images/playerSwingDown2.png");
    playerSwingDownTest[2] = loadImage("/images/playerSwingDown.png");
    playerHitbox = new Hitbox();
    x = width/2;
    y = height/2;
    Width = 15;
    Height = 16;
    playerDirection = "down";
    playerLocation = "H8";
    isSwinging = false;
    playerHitbox.createHitbox(x, y, Width, Height, "player");
  }
  
  
  void updatePlayer(){ // Updating the player every frame
    checkHitbox();
    movePlayer();    
  }
  
  void movePlayer(){ // Updating the player's position and playing the player animations
  
    if (keyPressed && map.isTransitioning == false) {
      
      // When you press left //
      if (keyCode == LEFT) {
        image(playerLeft[frameCount%2], x, y, Width*4, Height*4);
        x -= playerSpeed;
        playerHitbox.topLeft.x -= playerSpeed;
        playerHitbox.bottomRight.x -= playerSpeed;
        playerDirection = "left";
      }
      //////////////////////////
      
      
      // When you press right //
      if (keyCode == RIGHT) {
        image(playerRight[frameCount%2], x, y, Width*4, Height*4);
        x += playerSpeed;
        playerHitbox.topLeft.x += playerSpeed;
        playerHitbox.bottomRight.x += playerSpeed;
        playerDirection = "right";
      }
      //////////////////////////
      
      
      // When you press down //
      if (keyCode == DOWN) {
        image(playerDown[frameCount%2], x, y, Width*4, Height*4);
        y += playerSpeed;
        playerHitbox.topLeft.y += playerSpeed;
        playerHitbox.bottomRight.y += playerSpeed;
        playerDirection = "down";
      }
      ////////////////////////
      
      
      // When you press up //
      if (keyCode == UP) {
        image(playerUp[frameCount%2], x, y, Width*4, Height*4);
        y -= playerSpeed;
        playerHitbox.topLeft.y -= playerSpeed;
        playerHitbox.bottomRight.y -= playerSpeed;
        playerDirection = "up";
      }
      ///////////////////////
      
      
      // When you press A //
      if (key == 'a') {
        image(playerLeft[frameCount%2], x, y, Width*4, Height*4);
        x -= playerSpeed;
        playerHitbox.topLeft.x -= playerSpeed;
        playerHitbox.bottomRight.x -= playerSpeed;
        playerDirection = "left";
      }
      //////////////////////
      
      
      // When you press D //
      if (key == 'd') {
        image(playerRight[frameCount%2], x, y, Width*4, Height*4);
        x += playerSpeed;
        playerHitbox.topLeft.x += playerSpeed;
        playerHitbox.bottomRight.x += playerSpeed;
        playerDirection = "right";
      }
      //////////////////////
      
      
      // When you press S //
      if (key == 's') {
        image(playerDown[frameCount%2], x, y, Width*4, Height*4);
        y += playerSpeed;
        playerHitbox.topLeft.y += playerSpeed;
        playerHitbox.bottomRight.y += playerSpeed;
        playerDirection = "down";
      }
      //////////////////////
      
      
      // When you press W //
      if (key == 'w') {
        image(playerUp[frameCount%2], x, y, Width*4, Height*4);
        y -= playerSpeed;
        playerHitbox.topLeft.y -= playerSpeed;
        playerHitbox.bottomRight.y -= playerSpeed;
        playerDirection = "up";
      }
      //////////////////////
      
      
      // When you press X (To Swing Sword) //
      if (key == 'x' && finishedSwinging == false) {
        isSwinging = true;
        //println(isSwinging);
        
      }
      ////////////////////////////////////////
        
    }
    if (!keyPressed && isSwinging == false && finishedSwinging == false) {
      if (playerDirection == "left"){
        image(playerLeft[0], x, y, Width*4, Height*4);
      } 
      if (playerDirection == "right"){
        image(playerRight[0], x, y, Width*4, Height*4);
      }
      if (playerDirection == "down"){
        image(playerDown[0], x, y, Width*4, Height*4);
      }
      if (playerDirection == "up"){
        image(playerUp[0], x, y, Width*4, Height*4);
      }
    }
    
    
    
    if (isSwinging == true && finishedSwinging == false){
      if (playerDirection == "up"){
        playerSwingUp.display(x, y - 48, 64, 27*4);
        finishedSwinging = playerSwingUp.end;
      }
      if (playerDirection == "down"){
        playerSwingDown.display(x, y, 64, 27*4);
        finishedSwinging = playerSwingDown.end;
      }
      if (playerDirection == "left"){
        playerSwingLeft.display(x - 48, y, 27*4, 64);
        finishedSwinging = playerSwingLeft.end;
      }
      if (playerDirection == "right"){
        playerSwingRight.display(x, y, 27*4, 64);
        finishedSwinging = playerSwingRight.end;
      }
      
    }
    
    if (isSwinging == true && finishedSwinging == true){
      if (playerDirection == "left"){
        image(playerLeft[0], x, y, Width*4, Height*4);
      } 
      if (playerDirection == "right"){
        image(playerRight[0], x, y, Width*4, Height*4);
      }
      if (playerDirection == "down"){
        image(playerDown[0], x, y, Width*4, Height*4);
      }
      if (playerDirection == "up"){
        image(playerUp[0], x, y, Width*4, Height*4);
      }
    }
    
    if (finishedSwinging == true && earlySwing == true){
      if (playerDirection == "down"){
        playerSwingDown.end = false;
      }
      if (playerDirection == "up"){
        playerSwingUp.end = false;
      }
      if (playerDirection == "left"){
        playerSwingLeft.end = false;
      }
      if (playerDirection == "right"){
        playerSwingRight.end = false;
      }
      finishedSwinging = false;
      
      isSwinging = false;
      earlySwing = false;
    }
    
    
    
    
    
  
    

  
  
  }
  
  // Checking if the player collides with anything
  void checkHitbox(){
    //rect(x, y, 15*4, 16*4);
    if(playerHitbox.isCollision(rock.rockHitbox)){
      
      if (playerDirection == "up"){
        //yes
        map.transitionUp();
      }
    }
    else {
      //println("no collision");
    }
    
    if (playerHitbox.isCollision(test1)){
      //yes
    }
    if (playerHitbox.isCollision(test2)){
      //yes
    }
    if (playerHitbox.isCollision(cave)){
      playerLocation = "cave";
    }
    if (playerHitbox.isCollision(screenUp) && map.isTransitioning == false){
      map.transitionUp();
    }
  }

}
