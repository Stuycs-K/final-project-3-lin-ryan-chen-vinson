import java.util.*;

class Bishop extends Piece{
  public Bishop(Square position, color c){
    super(position, c);
    if (c == color(255)){
      PImage p = loadImage("bishopW.png");
    }
    else{
      PImage p = loadImage("bishopB.png");
    }
  }
  
  public boolean isValidMove(int newX, int newY){
    int x = this.position.getX();
    int y = this.position.getY();
    int i = Math.abs(newX - x);
    int j = Math.abs(newY - y);
    
    return i == j;
  }
}
