public class Player {
  
  float x, y;
  float playerSpeed = 6;
  
  PImage player;
  
  public Player(){
    player = loadImage("/images/playerFront.png");
    x = width/2;
    y = height/2;
  }
  
  
  void updatePlayer(){
    image(player, x, y, 15*4, 16*4);
    movePlayer();
  }
  
  void movePlayer(){
    if (keyPressed && !isTouchingObj) {
      if (keyCode == LEFT) {
        x -= playerSpeed;
      }
      if (keyCode == RIGHT) {
        x += playerSpeed;
      }
      if (keyCode == DOWN) {
        y += playerSpeed;
      }
      if (keyCode == UP) {
        y -= playerSpeed;

      }
        
    }
  
  
  }


}
