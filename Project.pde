PImage bg;
String[][] map = new String[16][8];
String[] unicode = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P"};
Player player;
Rock rock;

int j;


void setup(){
  size(1024, 704); // 16 x 11 grid of 16x16 sprites
  frameRate(10);
  bg = loadImage("/images/overworld/H8.png");
  player = new Player();
  rock = new Rock();
  
   // Create and fill map array
  for (int i = 0; i < 16; i++){
    for (j = 0; j < 8; j++){
      map[i][j] = unicode[i] + ((int)j + 1);
    }
    j = 0;
  }
  
}


void draw(){
  bg();
  player.updatePlayer();
  rock.updateRock();
}


  //void keyReleased() {
    
    //if (key == 'x') {
      //println("key released");
        //player.isSwinging = false;
    //}
  //}

void bg(){
  image(bg, 0, 0, width, height);
  checkTransition();
}


boolean checkTransition(){
  if (player.x < 10){
    return true;
  }
  return false;
}
