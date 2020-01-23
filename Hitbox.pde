public class Hitbox {
  Point topLeft;
  Point bottomRight;
  String hitboxType;
  float Width, Height;
  
  void createHitbox(float x, float y, float hitboxWidth, float hitboxHeight, String type){
    topLeft.x = x;
    topLeft.y = y;
    bottomRight.x = x + hitboxWidth*4;
    bottomRight.y = y + hitboxHeight*4;
    Width = hitboxWidth*4;
    Height = hitboxHeight*4;
    hitboxType = type;
  }
  
  boolean isCollision(Hitbox other){
    
    // If the hitbox is a solid object
    if (other.hitboxType == "solidObject"){
      if (this.topLeft.x < other.bottomRight.x && this.topLeft.x > other.topLeft.x){ // When approaching from the right side
          
          if(this.topLeft.y < other.bottomRight.y && this.topLeft.y > other.topLeft.y){ // Approaching from the bottom right corner
            if (player.playerDirection == "up"){
              player.y = other.bottomRight.y;
              this.topLeft.y = other.bottomRight.y;
              this.bottomRight.y = other.bottomRight.y + Height;
            }
            if (player.playerDirection == "left"){
              player.x = other.bottomRight.x;
              this.topLeft.x = other.bottomRight.x;
              this.bottomRight.x = other.bottomRight.x + Width;
            }
            
            return true;
         }    
          if(this.bottomRight.y > other.topLeft.y && this.bottomRight.y < other.bottomRight.y){ // Approaching from the top right corner
            //println("top right");
            if (player.playerDirection == "down"){
              //println("going down");
              player.y = other.topLeft.y - Height;
              this.topLeft.y = other.topLeft.y - Height;
              this.bottomRight.y = other.topLeft.y;
            }
            if (player.playerDirection == "left"){
              player.x = other.bottomRight.x;
              this.topLeft.x = other.bottomRight.x;
              this.bottomRight.x = other.bottomRight.x + Width;
            }
            return true;
          }
          else {
            return false;
          }
            
      }
      if(this.bottomRight.x > other.topLeft.x && this.bottomRight.x < other.bottomRight.x){ // When approaching from the left side
        
        if(this.bottomRight.y > other.topLeft.y && this.bottomRight.y < other.bottomRight.y){ // Approaching from the top left corner
          if (player.playerDirection == "down"){
            player.y = other.topLeft.y - Height;
            this.topLeft.y = other.topLeft.y - Height;
            this.bottomRight.y = other.topLeft.y;
          }
          if (player.playerDirection == "right"){
            player.x = other.topLeft.x - Width;
            this.topLeft.x = other.topLeft.x - Width;
            this.bottomRight.x = other.topLeft.x;
          }
          return true;    
        }
        if(this.topLeft.y > other.topLeft.y && this.topLeft.y < other.bottomRight.y){ // Approaching from the bottom left corner
          if (player.playerDirection == "up"){
            player.y = other.bottomRight.y;
            this.topLeft.y = other.bottomRight.y;
            this.bottomRight.y = other.bottomRight.y + Height;
          }
          if (player.playerDirection == "right"){
            player.x = other.topLeft.x - Width;
            this.topLeft.x = other.topLeft.x - Width;
            this.bottomRight.x = other.topLeft.x;
          }
          return true;
        }
        else {
          return false;
        }
      }
      else {
        return false;
      }
  
    }
    
    
    // If the hitbox is an entrance
    if (other.hitboxType == "entrance"){
      if(this.topLeft.x  >=  other.topLeft.x && this.bottomRight.x <= other.bottomRight.x){
        if(this.topLeft.y >= other.topLeft.y && this.bottomRight.y <= other.bottomRight.y){
          return true;
        }
        else{
          return false;
        }
      }
      else {
        return false;
      }
    }
    
    if (other.hitboxType == "item"){
      if (this.topLeft.x < other.bottomRight.x && this.topLeft.x > other.topLeft.x){ // When approaching from the right side
          
          if(this.topLeft.y < other.bottomRight.y && this.topLeft.y > other.topLeft.y){ // Approaching from the bottom right corner   
            return true;
         }    
          if(this.bottomRight.y > other.topLeft.y && this.bottomRight.y < other.bottomRight.y){ // Approaching from the top right corner
            return true;
          }
          else {
            return false;
          }
            
      }
      if(this.bottomRight.x > other.topLeft.x && this.bottomRight.x < other.bottomRight.x){ // When approaching from the left side
        
        if(this.bottomRight.y > other.topLeft.y && this.bottomRight.y < other.bottomRight.y){ // Approaching from the top left corner
          return true;    
        }
        if(this.topLeft.y > other.topLeft.y && this.topLeft.y < other.bottomRight.y){ // Approaching from the bottom left corner
          return true;
        }
        else {
          return false;
        }
      }
      else {
        return false;
      }
    }
    else {
      return false; 
    }
  }
  
  // Hitbox constructor
  public Hitbox(){
    topLeft = new Point();
    bottomRight = new Point();
  }

}

public class Point {
  float x;
  float y;
}
