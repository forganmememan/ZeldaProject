public class Hitbox {
  Point topLeft;
  Point bottomRight;
  String hitboxType;
  
  boolean isCollision(Hitbox other){
    
    // If the hitbox is a solid object
    //if (hitboxType == "solidObject"){
      //if ()
    
    //}
    
    
    // If the hitbox is an entrance
    if (hitboxType == "entrance"){
      if (this.bottomRight.x < other.topLeft.x || this.topLeft.x > other.bottomRight.x) {
        return false;
      }
      if (this.bottomRight.y < other.topLeft.y || this.topLeft.y > other.bottomRight.y) {
        return false;
      }
      return true;
    }
    return false;
    
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
