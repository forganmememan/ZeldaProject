public class Rock {
  float xRock, yRock, rockWidth, rockHeight;
  PImage rock;
  
  Hitbox rockHitbox;
  
  
  public Rock(float x, float y, float Width, float Height){
    rock = loadImage("/images/rock.png");
    rockHitbox = new Hitbox();
    xRock = x;
    yRock = y;
    rockWidth = Width;
    rockHeight = Height;
    rockHitbox.createHitbox(x, y, rockWidth, rockHeight, "solidObject");
  }
  
  
  void updateRock(){
    image(rock, xRock, yRock, 16*4, 16*4);
    
  }

}
