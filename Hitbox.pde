public class Hitbox {
  Point topLeft;
  Point bottomRight;
  String hitboxType;
  
  boolean isCollision(Hitbox other){
    
    // If the hitbox is a solid object
    if (other.hitboxType == "solidObject"){
      if (this.topLeft.x <= other.bottomRight.x && this.topLeft.x >= other.topLeft.x){
          
          if(this.topLeft.y <=other.bottomRight.y && this.topLeft.y >= other.topLeft.y){
            return true;
         }    
          if(this.bottomRight.y >= other.topLeft.y && this.bottomRight.y <= other.bottomRight.y){
            return true;
          }
          else {
            return false;
          }
            
      }
      if(this.bottomRight.x >= other.topLeft.x && this.bottomRight.x <= other.bottomRight.x){
        
        if(this.bottomRight.y >= other.topLeft.y && this.bottomRight.y <= other.bottomRight.y){
          return true;    
        }
        if(this.topLeft.y >= other.topLeft.y && this.topLeft.y <= other.bottomRight.y){
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
    else {
      return false; 
    }
  }
  
  public Hitbox(){
    topLeft = new Point();
    bottomRight = new Point();
  }

}

public class Point {
  int x;
  int y;
}
