public class Player {
  
  // Defining attributes of the player
  float x, y, Width, Height;
  float playerSpeed = 20; // 15 on school pc, 20 on home pc
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
    //if(playerHitbox.isCollision(rock.rockHitbox)){
      //oh
    //}
    //else {
      //println("no collision");
    //}
    
    //if (playerHitbox.isCollision(test1)){
      //yes
    //}
    //if (playerHitbox.isCollision(test2)){
      //yes
    //}
    //if (playerHitbox.isCollision(cave)){
      //playerLocation = "cave";
    //}
    if (playerHitbox.isCollision(screenUp) && map.isTransitioning == false){
      map.transitionUp();
    }
    if (playerHitbox.isCollision(screenDown) && map.isTransitioning == false){
      map.transitionDown();
    }
    if (playerHitbox.isCollision(screenLeft) && map.isTransitioning == false){
      map.transitionLeft();
    }
    if (playerHitbox.isCollision(screenRight) && map.isTransitioning == false){
      map.transitionRight();
    }
    
    
    // Check hitboxes for every region
    
    switch(map.i) {
      case 0: // A column 
        switch(map.j) {
          case 0:
            // first room
          case 1:
            // next one
          case 2:
            // yeah
          case 3:
            // nice
          case 4:
            // even nicer
          case 5:
            // cool
          case 6:
            // oh
          case 7:
            // last one
        }
      case 1: // B column
        switch(map.j) {
          case 0:
            // first room
          case 1:
            // next one
          case 2:
            // yeah
          case 3:
            // nice
          case 4:
            // even nicer
          case 5:
            // cool
          case 6:
            // oh
          case 7:
            // last one
        }
      case 2: // C column
        switch(map.j) {
          case 0:
            // first room
          case 1:
            // next one
          case 2:
            // yeah
          case 3:
            // nice
          case 4:
            // even nicer
          case 5:
            // cool
          case 6:
            // oh
          case 7:
            // last one
        }
      case 3: // D column
        switch(map.j) {
          case 0:
            // first room
          case 1:
            // next one
          case 2:
            // yeah
          case 3:
            // nice
          case 4:
            // even nicer
          case 5:
            // cool
          case 6:
            // oh
          case 7:
            // last one
        }
      case 4: // E column
        switch(map.j) {
          case 0:
            // first room
          case 1:
            // next one
          case 2:
            // yeah
          case 3:
            // nice
          case 4:
            // even nicer
          case 5:
            // cool
          case 6:
            // oh
          case 7:
            // last one
        }
      case 5: // F column
        switch(map.j) {
          case 0:
            // first room
          case 1:
            // next one
          case 2:
            // yeah
          case 3:
            // nice
          case 4:
            // even nicer
          case 5:
            // cool
          case 6:
            // oh
          case 7:
            // last one
        }
      case 6: // G column
        switch(map.j) {
          case 0:
            // first room
          case 1:
            // next one
          case 2:
            // yeah
          case 3:
            // nice
          case 4:
            // even nicer
          case 5:
            // cool
          case 6:
            // oh
          case 7:
            // last one
        }
      case 7: // H column
        switch(map.j) {
          case 0:
            // first room
          case 1:
            // next one
          case 2:
            // yeah
          case 3:
            // nice
          case 4:
            // even nicer
          case 5:
            // cool
          case 6:
            if (map.j == 6){
              playerHitbox.isCollision(wall1);
              wall1.createHitbox(0, 576, 112, 32, "solidObject");
            }
          case 7: // Starting zone
            if (map.j == 7){
              playerHitbox.isCollision(rock.rockHitbox); 
              playerHitbox.isCollision(wall1);
              wall1.createHitbox(0, 0, 32, 80, "solidObject");
              playerHitbox.isCollision(wall2);
              wall2.createHitbox(128, 0, 16, 64, "solidObject");
              playerHitbox.isCollision(wall3);
              wall3.createHitbox(192, 0, 16, 48, "solidObject");
              playerHitbox.isCollision(wall4);
              wall4.createHitbox(256, 0, 16, 16, "solidObject");
              playerHitbox.isCollision(wall5);
              wall5.createHitbox(320, 0, 32, 32, "solidObject");
              playerHitbox.isCollision(wall6);
              wall6.createHitbox(9*64, 0, 112, 80, "solidObject");
              playerHitbox.isCollision(wall7);
              wall7.createHitbox(0, 6*64, 32, 5*16, "solidObject");
              playerHitbox.isCollision(wall8);
              wall8.createHitbox(2*64, 9*64, 12*16, 32, "solidObject");
              playerHitbox.isCollision(wall9);
              wall9.createHitbox(14*64, 6*64, 32, 5*16, "solidObject");
            }
            
          }
        case 8:
          switch(map.j) {
            case 0:
              // first room
            case 1:
              // next one
            case 2:
              // yeah
            case 3:
              // nice
            case 4:
              // even nicer
            case 5:
              // cool
            case 6:
              // oh
            case 7:
              // last one
          }
        case 9:
          switch(map.j) {
            case 0:
              // first room
            case 1:
              // next one
            case 2:
              // yeah
            case 3:
              // nice
            case 4:
              // even nicer
            case 5:
              // cool
            case 6:
              // oh
            case 7:
              // last one
          }
        case 10:
          switch(map.j) {
            case 0:
              // first room
            case 1:
              // next one
            case 2:
              // yeah
            case 3:
              // nice
            case 4:
              // even nicer
            case 5:
              // cool
            case 6:
              // oh
            case 7:
              // last one
          }
        case 11:
          switch(map.j) {
            case 0:
              // first room
            case 1:
              // next one
            case 2:
              // yeah
            case 3:
              // nice
            case 4:
              // even nicer
            case 5:
              // cool
            case 6:
              // oh
            case 7:
              // last one
          }
        case 12:
          switch(map.j) {
            case 0:
              // first room
            case 1:
              // next one
            case 2:
              // yeah
            case 3:
              // nice
            case 4:
              // even nicer
            case 5:
              // cool
            case 6:
              // oh
            case 7:
              // last one
          }
        case 13:
          switch(map.j) {
            case 0:
              // first room
            case 1:
              // next one
            case 2:
              // yeah
            case 3:
              // nice
            case 4:
              // even nicer
            case 5:
              // cool
            case 6:
              // oh
            case 7:
              // last one
          }
        case 14:
          switch(map.j) {
            case 0:
              // first room
            case 1:
              // next one
            case 2:
              // yeah
            case 3:
              // nice
            case 4:
              // even nicer
            case 5:
              // cool
            case 6:
              // oh
            case 7:
              // last one
          }
        case 15:
          switch(map.j) {
            case 0:
              // first room
            case 1:
              // next one
            case 2:
              // yeah
            case 3:
              // nice
            case 4:
              // even nicer
            case 5:
              // cool
            case 6:
              // oh
            case 7:
              // last one
          }
       
    }
    
    
    
    
    
  }

}
