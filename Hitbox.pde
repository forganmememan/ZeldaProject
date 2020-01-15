public class Hitbox {
  private Point topLeft;
  private Point bottomRight;
  
  boolean isOverlapping(Hitbox other){
    if (this.topLeft.y < other.bottomRight.x || this.bottomRight.x > other.topLeft.y) {
      return false;
    }
    if (this.topLeft.x < other.bottomRight.x || this.bottomRight.x > other.topLeft.x) {
      return false;
    }
    return true;
  }

}

public class Point {
  private int x;
  private int y;
}
