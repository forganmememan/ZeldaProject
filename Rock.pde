public class Rock {
  float x, y;
  PImage rock;
  
  Hitbox rockHitbox;
  
  
  public Rock(){
    rock = loadImage("/images/rock.png");
    rockHitbox = new Hitbox();
    x = width/2 + 100;
    y = height/2 + 100;
  }
  
  
  void updateRock(){
    image(rock, x, y, 16*4, 16*4);
    
  }

}
