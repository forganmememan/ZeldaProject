PImage bg;

Player player;
Rock rock;
Map map;

Animation playerSwingDown, playerSwingUp, playerSwingLeft, playerSwingRight;

Hitbox test1, test2, cave, screenLeft, screenRight, screenUp, screenDown;


void setup(){
  size(1024, 704); // 16 x 11 grid of 16x16 sprites
  frameRate(60);
  bg = loadImage("/images/overworld/H8.png");
  player = new Player();
  rock = new Rock();
  map = new Map();
  test1 = new Hitbox();
  test2 = new Hitbox();
  cave = new Hitbox();
  screenLeft = new Hitbox();
  screenRight = new Hitbox();
  screenUp = new Hitbox();
  screenDown = new Hitbox();
  
  test1.createHitbox(192, 128, 16, 16, "solidObject");
  test2.createHitbox(256, 0, 16, 16, "solidObject");
  cave.createHitbox(256, 64, 16, 16, "entrance");
  
  screenUp.createHitbox(0, -16, 256, 16, "solidObject");
  screenDown.createHitbox(0, height, 256, 16, "solidObject");
  screenLeft.createHitbox(-16, 0, 16, 176, "solidObject");
  screenRight.createHitbox(width, 0, 16, 176, "solidObject");
  
  
  playerSwingDown = new Animation("/images/animations/playerSwingDown/playerSwingDown", 4);
  playerSwingUp = new Animation("/images/animations/playerSwingUp/playerSwingUp", 4);
  playerSwingLeft = new Animation("/images/animations/playerSwingLeft/playerSwingLeft", 4);
  playerSwingRight = new Animation("/images/animations/playerSwingRight/playerSwingRight", 4);
   
  
}


void draw(){
  map.updateMap();
  player.updatePlayer();
  rock.updateRock();
  
}

void keyReleased(){
  if (key == 'x'){
    if (player.playerDirection == "down"){
      if (playerSwingDown.frame == 3){
        player.finishedSwinging = false;
        playerSwingDown.end = false;
        player.isSwinging = false;
      }
      if (playerSwingDown.frame != 3){
        player.earlySwing = true;
      }
    }
    if (player.playerDirection == "up"){
      if (playerSwingUp.frame == 3){
        player.finishedSwinging = false;
        playerSwingUp.end = false;
        player.isSwinging = false;
      }
      if (playerSwingUp.frame != 3){
        player.earlySwing = true;
      }
    }
    if (player.playerDirection == "left"){
      if (playerSwingLeft.frame == 3){
        player.finishedSwinging = false;
        playerSwingLeft.end = false;
        player.isSwinging = false;
      }
      if (playerSwingLeft.frame != 3){
        player.earlySwing = true;
      }
    }
    if (player.playerDirection == "right"){
      if (playerSwingRight.frame == 3){
        player.finishedSwinging = false;
        playerSwingRight.end = false;
        player.isSwinging = false;
      }
      if (playerSwingRight.frame != 3){
        player.earlySwing = true;
      }
    }
    
    
  }
}


  //void keyReleased() {
    
    //if (key == 'x') {
      //println("key released");
        //player.isSwinging = false;
    //}
  //}
