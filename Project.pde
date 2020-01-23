PImage bg;
PImage black = new PImage();

boolean isCovering;

Player player;
Rock rock;
Rock boundary1, boundary2, boundary3, boundary4, boundary5, boundary6;
Map map;

Animation playerSwingDown, playerSwingUp, playerSwingLeft, playerSwingRight, playerEnter, playerLeave;
Animation playerSword;

Hitbox test1, test2, cave, screenLeft, screenRight, screenUp, screenDown, caveLeave;

Hitbox wall1, wall2, wall3, wall4, wall5, wall6, wall7, wall8, wall9;

Item sword = new Item();


void setup(){
  size(1024, 704); // 16 x 11 grid of 16x16 sprites
  frameRate(10); // 60 on school pc, 10 on home pc
  bg = loadImage("/images/overworld/H8.png");
  black = loadImage("/images/black.png");
  player = new Player();
  //rock = new Rock();
  
  boundary1 = new Rock(4*64, 5*64, 16, 17);
  
  map = new Map();
  test1 = new Hitbox();
  test2 = new Hitbox();
  cave = new Hitbox();
  screenLeft = new Hitbox();
  screenRight = new Hitbox();
  screenUp = new Hitbox();
  screenDown = new Hitbox();
  caveLeave = new Hitbox();
  wall1 = new Hitbox();
  wall2 = new Hitbox();
  wall3 = new Hitbox();
  wall4 = new Hitbox();
  wall5 = new Hitbox();
  wall6 = new Hitbox();
  wall7 = new Hitbox();
  wall8 = new Hitbox();
  wall9 = new Hitbox();
  
  //test1.createHitbox(192, 128, 16, 16, "solidObject");
  //test2.createHitbox(256, 0, 16, 16, "solidObject");
  cave.createHitbox(256, 64, 16, 16, "entrance");
  
  
  // creating wall hitboxes for H8
  //wall1.createHitbox(0, 0, 32, 80, "solidObject");
  
  
  
  
  screenUp.createHitbox(0, -64 - 16, 256, 16, "solidObject");
  screenDown.createHitbox(0, height + 16, 256, 16, "solidObject");
  screenLeft.createHitbox(-64 - 16, 0, 16, 176, "solidObject");
  screenRight.createHitbox(width, 0, 16, 176, "solidObject");
  
  caveLeave.createHitbox(0, height + 16, 256, 16, "solidObject");
  
  
  playerSwingDown = new Animation("/images/animations/playerSwingDown/playerSwingDown", 4, 0);
  playerSwingUp = new Animation("/images/animations/playerSwingUp/playerSwingUp", 4, 0);
  playerSwingLeft = new Animation("/images/animations/playerSwingLeft/playerSwingLeft", 4, 0);
  playerSwingRight = new Animation("/images/animations/playerSwingRight/playerSwingRight", 4, 0);
  playerEnter = new Animation("/images/animations/playerEnter/playerEnter", 15, 0);
  playerLeave = new Animation("/images/animations/playerLeave/playerLeave", 15, 0);
  playerSword = new Animation("/images/playerSword", 1, 30);
   
  
}


void draw(){
  map.updateMap();
  map.coverItem();
  player.updatePlayer();
  //rock.updateRock();
  
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
