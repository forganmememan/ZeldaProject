public class Rock {
  float x, y;
  PImage rock;
  
  Hitbox rockHitbox;
  
  
  public Rock(){
    rock = loadImage("/images/rock.png");
    rockHitbox = new Hitbox();
    x = width/2 + 100;
    y = height/2 + 100;
    rockHitbox.topLeft.x = (int)x;
    rockHitbox.topLeft.y = (int)y;
    rockHitbox.bottomRight.x = (int)x + 16*4;
    rockHitbox.bottomRight.y = (int)y + 16*4;
    rockHitbox.hitboxType = "solidObject";
  }
  
  
  void updateRock(){
    image(rock, x, y, 16*4, 16*4);
  }

}
