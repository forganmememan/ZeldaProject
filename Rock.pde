public class Rock {
  float x, y, Width, Height;
  PImage rock;
  
  Hitbox rockHitbox;
  
  
  public Rock(){
    rock = loadImage("/images/rock.png");
    rockHitbox = new Hitbox();
    x = width/2 + 100;
    y = height/2 + 100;
    Width = 16;
    Height = 16;
    rockHitbox.createHitbox(x, y, Width, Height, "solidObject");
  }
  
  
  void updateRock(){
    image(rock, x, y, 16*4, 16*4);
    
  }

}
