PImage bg;
String[][] map = new String[16][8];
String[] unicode = new String[16];
unicode[] = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P"}; 
Player player;
Rock rock;

boolean isTouchingObj;
int j;


void setup(){
  size(1024, 704); // 16 x 11 grid of 16x16 sprites
  frameRate(60);
  bg = loadImage("/images/testbg.png");
  player = new Player();
  rock = new Rock();
  isTouchingObj = false;
  for (int i = 0; i < 16; i++){
    for (j = 0; j < 8; j++){
      map[i][j] = "\u0041" + "48";
    
    }
    map[i][0] = "\u0041";
    println(map[i][0]);
  }
}


void draw(){
  bg();
  player.updatePlayer();
  rock.updateRock();
}


void bg(){
  image(bg, 0, 0, width, height);
  checkTransition();
}


void checkTransition(){
  if (player.x < 10){
    
  }

}
