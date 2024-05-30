import java.util.*;

public class Queen extends Piece{
  public Queen(Square position, color c){
    super(position, c);
  }
  
  public boolean isValidMove(int newX, int newY){
    int currX = position.getX();
    int currY = position.getY();
    
    if (newX == currX || newY == currY || Math.abs(newX - currentX) == Math.abs(newY - currentY)){
      return true;
    }
    return false;
  }
}
